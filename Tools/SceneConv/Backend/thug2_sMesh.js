// ----------------------------------------------
//
//  THUG2 MESH
//      Tony Hawk's Underground 2 mesh.
//
// ----------------------------------------------

const sMesh = require('./sMesh.js');
const Vertex = require('./Vertex.js');

const SECFLAGS_HAS_TEXCOORDS =                      0x01
const SECFLAGS_HAS_VERTEX_COLORS =                  0x02
const SECFLAGS_HAS_VERTEX_COLOR_WIBBLES =           0x800
const SECFLAGS_HAS_VERTEX_NORMALS =                 0x04
const SECFLAGS_HAS_VERTEX_WEIGHTS =                 0x10
const SECFLAGS_THAW_CONSTANT =                      0x08000000
const SECFLAGS_BILLBOARD_PRESENT =                  0x00800000

class THUG2_sMesh extends sMesh
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Read compressed vertices.
    // -----------------------------
    
    ReadCompressedVertices(r, lod)
    {
        var verts = [];
        
        this.weighted = true;
        
        var secflags = this.geom.sector.flags;
        
        console.log("        Reading " + lod.vertex_count + " vertices...");
        
        for (var v=0; v<lod.vertex_count; v++)
        {
            var next_vert = r.Tell() + lod.vertex_stride;
            var vert = new Vertex(this);
            
            vert.pos = [r.Float(), r.Float(), r.Float()];
            
            if (secflags & SECFLAGS_HAS_VERTEX_WEIGHTS)
            {
                vert.packed_weights = r.Int32();
                vert.weights = [
                    [ Math.floor(r.UInt16() / 3), 0.0 ],
                    [ Math.floor(r.UInt16() / 3), 0.0 ],
                    [ Math.floor(r.UInt16() / 3), 0.0 ],
                    [ Math.floor(r.UInt16() / 3), 0.0 ],
                ];
            }
            
            if (secflags & SECFLAGS_HAS_VERTEX_NORMALS)
            {
                vert.packed_normals = r.Int32();
            }
                //~ vert.no = [r.Float(), r.Float(), r.Float()];
                
            if (secflags & SECFLAGS_HAS_VERTEX_COLORS)
            {
                vert.color.b = r.UInt8();
                vert.color.g = r.UInt8();
                vert.color.r = r.UInt8();
                vert.color.a = r.UInt8();
            }
            
            // UV will be based on pass count of the material.
            // We'll guesstimate for now, we don't care.
            
            if (secflags & SECFLAGS_HAS_TEXCOORDS)
            {
                var numUV = Math.floor((next_vert - r.Tell()) / 8);
                for (var u=0; u<numUV; u++)
                    vert.uvs.push([r.Float(), r.Float()]);
            }

            r.Seek(next_vert);
            
            verts.push(vert);
        }
        
        return verts;
    }
    
    // -----------------------------
    // Read uncompressed vertices.
    // -----------------------------
    
    ReadUncompressedVertices(r, lod)
    {
        var verts = [];
        
        this.weighted = false;
        
        var secflags = this.geom.sector.flags;
        
        console.log("        Reading " + lod.vertex_count + " vertices...");
        
        for (var v=0; v<lod.vertex_count; v++)
        {
            var next_vert = r.Tell() + lod.vertex_stride;
            var vert = new Vertex(this);
            
            vert.pos = [r.Float(), r.Float(), r.Float()];
            
            if (secflags & SECFLAGS_HAS_VERTEX_NORMALS)
                vert.no = [r.Float(), r.Float(), r.Float()];
                
            if (secflags & SECFLAGS_HAS_VERTEX_COLORS)
            {
                vert.color.b = r.UInt8();
                vert.color.g = r.UInt8();
                vert.color.r = r.UInt8();
                vert.color.a = r.UInt8();
            }
            
            // UV will be based on pass count of the material.
            // We'll guesstimate for now, we don't care.
            
            if (secflags & SECFLAGS_HAS_TEXCOORDS)
            {
                var numUV = Math.floor((next_vert - r.Tell()) / 8);
                for (var u=0; u<numUV; u++)
                    vert.uvs.push([r.Float(), r.Float()]);
            }

            r.Seek(next_vert);
            
            verts.push(vert);
        }
        
        return verts;
    }
    
    // -----------------------------
    // Read a LOD.
    // -----------------------------
    
    ReadLOD(r)
    {
        var lod = {
            flags: 0,
            flags_unk: 0,
            has_vc_wibble: false,
            indices: [],
            indices_b: [],
            vertex_stride: 0,
            vertex_count: 0,
            vertex_buffers: [],
            num_index_sets: 1,
            pixel_shader: 2
        };
        
        console.log("      LOD " + this.lods.length + " @[" + r.Tell() + "]:");
        
        var num_indices_a = r.UInt32();
        console.log("      Indices Count A: " + num_indices_a);
        
        for (var l=0; l<num_indices_a; l++)
            lod.indices.push(r.UInt16());
            
        var num_indices_b = r.UInt16();
        console.log("      Indices Count B: " + num_indices_b);
        
        for (var l=0; l<num_indices_a; l++)
            lod.indices_b.push(r.UInt16());
            
        r.Chunk(14);
            
        lod.vertex_stride = r.UInt8();
        console.log("      Vertex Stride: " + lod.vertex_stride);
        
        lod.vertex_count = r.UInt16();
        console.log("      Vertex Count: " + lod.vertex_count);
        
        var vertex_buffer_count = r.UInt16();
        console.log("      Vertex Buffer Count: " + vertex_buffer_count);
        
        if (vertex_buffer_count > 16)
        {
            console.log("!! We probably don't have " + vertex_buffer_count + " buffers. !!");
            process.exit(1);
        }
        
        for (var b=0; b<vertex_buffer_count; b++)
        {
            var buf = [];
            
            // Uh... skip to nearest 2?
            if (b > 0)
                r.UInt8();
            
            var buffer_size = r.UInt32();
            console.log("        Buffer " + b + ": " + buffer_size + " bytes");
            
            // What kind of vertex would we like to read?
            if (this.geom.sector.flags & SECFLAGS_HAS_VERTEX_WEIGHTS)
                buf = this.ReadCompressedVertices(r, lod);
            else
                buf = this.ReadUncompressedVertices(r, lod);
            
            lod.vertex_buffers.push(buf);
        }
        
        lod.flags = r.UInt32();
        console.log("      Flags: 0x" + lod.flags.toString(16).padStart(8, "0"));
        lod.flags_unk = r.UInt32();
        console.log("      Flags Unk: " + lod.flags_unk);
        
        r.Chunk(3);
        lod.has_vc_wibble = (r.UInt8()) ? true : false;
        console.log("      Has VC Wibble: " + lod.has_vc_wibble);
        
        if (lod.has_vc_wibble)
        {
            // Vertex color buffer index.
            for (var v=0; v<lod.vertex_count; v++)
                lod.vertex_buffers[0][v].vc_wibble_value = r.UInt8();
        }
            
        lod.num_index_sets = r.UInt32();
        console.log("      Num Index Sets (Weights): " + lod.num_index_sets);
        
        lod.pixel_shader = r.UInt32();
        console.log("      Pixel Shader: " + lod.pixel_shader);
        
        if (lod.pixel_shader == 1)
        {
            var pixel_shader_thing = r.UInt32();
            var pixel_shader_unk_count = r.UInt32();
            
            r.Chunk(pixel_shader_unk_count);
        }
        
        this.lods.push(lod);
    }
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    Deserialize(r)
    {
        this.reader = r;
        
        console.log("    -- SMESH " + this.geom.meshes.length + " @[" + r.Tell() + "] ----");
        
        this.sphere_pos = [ r.Float(), r.Float(), r.Float() ];
        console.log("    Sphere Pos: (" + this.sphere_pos.join(", ") + ")");
        this.sphere_radius = r.Float();
        console.log("    Sphere Radius: " + this.sphere_radius);
        
        this.bounds_min = [ r.Float(), r.Float(), r.Float(), 1.0 ];
        console.log("    Bounds Min: (" + this.bounds_min.join(", ") + ")");
        this.bounds_max = [ r.Float(), r.Float(), r.Float(), 1.0 ];
        console.log("    Bounds Max: (" + this.bounds_max.join(", ") + ")");
        
        this.unk_flags = r.UInt32();
        console.log("    Some Flags: 0x" + this.unk_flags.toString(16).padStart(8, "0"));
        
        this.material = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("    Material: " + this.material);
        
        var lod_count = r.UInt32();
        console.log("    LOD Count: " + lod_count);
        
        for (var l=0; l<lod_count; l++)
            this.ReadLOD(r);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    CloneUVs(new_count)
    {
        for (const lod of this.lods)
        {
            var old_uvs = lod.vertex_buffers[0][0].uvs.length;
            
            for (const buf of lod.vertex_buffers)
            {
                for (const vert of buf)
                {
                    while (vert.uvs.length < new_count)
                        vert.uvs.push(vert.uvs[0]);
                }
            }
            
            lod.vertex_stride += (8 * (new_count - old_uvs));
        }
    }
}

module.exports = THUG2_sMesh;
