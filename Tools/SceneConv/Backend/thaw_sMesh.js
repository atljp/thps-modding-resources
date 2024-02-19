// ----------------------------------------------
//
//  THAW MESH
//      Tony Hawk's American Wasteland mesh.
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

class THAW_sMesh extends sMesh
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Read our faces
    // -----------------------------
    
    ReadFaces()
    {
        var r = this.reader;
        
        console.log("    Faces @[" + r.Tell() + "]");
        
        if (this.geom.sector.scene.sceneFile.platform == "xbox")
        {
            for (var f=0; f<this.face_count; f++)
                this.lods[0].indices_b.push(r.UInt16());
        }
    }
    
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
    // Read our vertices
    // -----------------------------
    
    ReadVertices()
    {
        var r = this.reader;
        
        console.log("    Vertices @[" + r.Tell() + "]");
        
        if (this.geom.sector.scene.sceneFile.platform == "xbox")
            r.Chunk(12);
            
        var buf = [];
            
        // What kind of vertex would we like to read?
        if (this.geom.sector.flags & SECFLAGS_HAS_VERTEX_WEIGHTS)
            buf = this.ReadCompressedVertices(r, this.lods[0]);
        else
            buf = this.ReadUncompressedVertices(r, this.lods[0]);
        
        this.lods[0].vertex_buffers.push(buf);
    }
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    Deserialize(r)
    {
        this.reader = r;
        
        console.log("    -- SMESH " + this.geom.meshes.length + " @[" + r.Tell() + "] ----");
        
        this.unk_flags = r.UInt32();
        
        this.sphere_pos = [ r.Float(), r.Float(), r.Float() ];
        console.log("    Sphere Pos: (" + this.sphere_pos.join(", ") + ")");
        this.sphere_radius = r.Float();
        console.log("    Sphere Radius: " + this.sphere_radius);
        
        this.material = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("    Material: " + this.material);
        
        var vertex_stride = r.UInt8();
        console.log("    Vertex Stride: " + vertex_stride);
        
        r.UInt8();
        r.UInt8();          // Const
        r.UInt8();          // Always FF
        
        r.UInt16();         // unk_b
        r.UInt8();          // oddbyte_a
        r.UInt8();          // oddbyte_b
        
        r.UInt8();          // odd_constant_a
        
        var lod_count = r.UInt8();
        console.log("    LOD Count: " + lod_count);
        
        this.face_type = r.UInt8();
        console.log("    Face Type: " + this.face_type);
        
        r.UInt8();
        
        r.UInt16();         // Mesh index, used internally
        
        this.vertex_count = r.UInt16();
        console.log("    Vertex Count: " + this.vertex_count);
        
        this.face_count = r.UInt16();
        console.log("    Face Count: " + this.face_count);
        r.Chunk(14);
        
        var face_count_modified = r.UInt32();
        console.log("    Face Count Modified: " + face_count_modified);
        
        r.UInt16();
        r.UInt16();
        
        this.mesh_flags = r.UInt32();
        console.log("    Mesh Flags: 0x" + this.mesh_flags.toString(16).padStart(8, "0"));
        
        r.UInt32();
        
        // ----------------------------------------
        // -- XBox files vary beyond this point. --
        
        var alt_vert_offset = 0;
        
        if (this.geom.sector.scene.sceneFile.platform == "xbox")
        {
            r.Chunk(8);
            
            this.off_billboards = this.geom.sector.scene.off_billboards + r.Int32();
            console.log("    Billboards at " + this.off_billboards);
            
            r.UInt32();
            
            this.off_faces = this.geom.sector.scene.sceneFile.off_scene + r.UInt32();
            console.log("    Faces at " + this.off_faces);
            r.Chunk(28);
                
            this.off_verts = this.geom.sector.scene.sceneFile.off_scene + r.UInt32();
            console.log("    Verts at " + this.off_verts);
            
            alt_vert_offset = this.geom.sector.scene.sceneFile.off_scene + r.Int32();
            console.log("    Alt verts at " + alt_vert_offset);
            
            r.UInt32();
            
            var altVertSizeA = r.UInt32();
            var altVertSizeB = r.UInt32();
            
            console.log("Alt Vert Sizes: " + [altVertSizeA, altVertSizeB].join(", "));
            
            r.Chunk(24);
            
            this.off_vertwibbles = this.geom.sector.scene.sceneFile.off_scene + r.Int32();
            console.log("    Wibble bytes at " + this.off_vertwibbles);
            
            r.Chunk(4);
        }
        else
        {
            console.log("TODO: THAW PC READ");
        }
        
        console.log("");
        var mesh_end = r.Tell();
        
        // ------------------------------------
        
        if (this.off_billboards >= 0 && (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_BILLBOARD_PRESENT))
        {
            r.Seek(this.off_billboards);
            
            this.billboard_type = r.UInt32();
            this.billboard_pivot = [r.Float(), r.Float(), r.Float(), r.Float()];
            this.billboard_axis = [r.Float(), r.Float(), r.Float(), r.Float()];
        }
        
        // ------------------------------------
        
        // Create a list of LOD's.
        this.lods = [];
        
        if (this.off_faces > 0 && this.off_verts > 0)
        {
            var lod = {
                flags: this.mesh_flags,
                flags_unk: 0,
                has_vc_wibble: false,
                indices: [],
                indices_b: [],
                vertex_stride: vertex_stride,
                vertex_count: this.vertex_count,
                vertex_buffers: [],
                num_index_sets: 1,
                pixel_shader: 1
            };
            
            this.lods.push(lod);
        
            r.Seek(this.off_faces);
            this.ReadFaces();
            
            r.Seek(this.off_verts);
            this.ReadVertices();
            
            if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLOR_WIBBLES)
            {
                r.Seek(alt_vert_offset);
                this.ReadVertices();
                
                r.Seek(this.off_vertwibbles);
                
                for (const vert of lod.vertex_buffers[0])
                    vert.vc_wibble_value = r.UInt8();
            }
        }

        // ------------------------------------
        
        r.Seek(mesh_end);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  S E R I A L I Z E
    //      SERIALIZES TO A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Serialize to a file.
    // -----------------------------
    
    Serialize(w)
    {
        var tempPos = w.Tell();
        
        var temp = new SceneConverter.constants.Writer();
        temp.LE = w.LE;
        
        // Only write the first LOD.
        if (this.lods.length > 1)
            this.lods = [this.lods[0]];
        
        temp.UInt32(this.unk_flags);
        
        temp.Float(this.sphere_pos[0]);
        temp.Float(this.sphere_pos[1]);
        temp.Float(this.sphere_pos[2]);
        temp.Float(this.sphere_radius);
        
        temp.UInt32( parseInt(this.material, 16) );
        
        // --------------------------------------
        // -- CALCULATE VERTEX STRIDE --
        
        var stride = 12;                        // Position, ALWAYS!!!
        
        var hasNormalValue = ((this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_NORMALS) || (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_BILLBOARD_PRESENT));
        
        // Compressed vertex
        if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_WEIGHTS)
        {
            if (hasNormalValue)
                stride += 4;                        // Packed normals
            
            stride += 4;                        // Packed weights
            stride += 8;                        // Weight index * 4
        }
        
        // Uncompressed vretex
        else
        {
            if (hasNormalValue)
                stride += 12;                       // Unpacked normals
        }
        
        if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLORS)
            stride += 4;                        // RGBA
            
        if (this.lods.length && (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_TEXCOORDS))
        {
            var uvCount = this.lods[0].vertex_buffers[0][0].uvs.length;
            stride += 8 * uvCount;
        }
        
        temp.UInt8(stride);
        
        // --------------------------------------
        
        temp.UInt8(0);
        temp.UInt8(1);                         // Constant?
        temp.UInt8(0xFF);                      // Constant?
        
        temp.UInt16(0x0C18);                   // No idea
        temp.UInt16(0x1C00);                   // No idea
        
        temp.UInt8(0xFF);                      // Constant?
        //~ temp.UInt8(this.lods.length);      // LOD count
        temp.UInt8(1);                         // LOD count
        temp.UInt8(6);                         // Face type, always tristrips (for now)
        temp.UInt8(0);
        
        temp.UInt16(0);                        // Internal mesh index, always 0
        
        var vc = 0;
        for (const lod of this.lods) { vc += lod.vertex_count; }
        temp.UInt16(vc);
        
        // Face counts for LOD's.
        for (var f=0; f<8; f++)
        {
            temp.UInt16((this.lods[f] && this.lods[f].indices_b.length) || 0);
        }
        
        // Modified face count.
        var face_count_modified = (this.lods[0] && this.lods[0].indices_b.length) || 0;
        
        if (this.weighted)
            face_count_modified += 64;
            
        temp.UInt32(face_count_modified);
        
        temp.UInt16(0xDBF0);                   // ???
        temp.UInt16(0x10D6);                   // ???
        
        var final_mesh_flags = (this.lods[0] && this.lods[0].flags) || 0;
        
        // billboard hack
        if (this.geom.has_geom_billboard)
            final_mesh_flags |= SceneConverter.constants.MESHFLAG_THAW_VERTEXNORMALS;
        
        temp.UInt32(this.weighted ? 0 : final_mesh_flags);
        temp.UInt32(0);
        
        temp.UInt32(0x003E02F8);               // weird_thing
        temp.UInt32((this.lods[0] && this.lods[0].pixel_shader) || 2);
        
        temp.Pad(4, 0xFF);
        
        if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_BILLBOARD_PRESENT)
            temp.Int32(this.off_billboards - this.geom.sector.scene.off_billboards);
        else
            temp.Int32(-1);
        
        temp.UInt32(5);                        // Constant?
        
        // Fill this in later
        this.pt_faces = tempPos + temp.Tell();
        temp.Int32(-1);
        temp.Pad(4 * 7, 0xFF);
        
        // Fill this in later
        this.pt_verts = tempPos + temp.Tell();
        temp.Int32(-1);
        
        temp.Int32(-1);                        // vertex_unk_offset
        temp.Int32(-1);
        
        temp.UInt32(0);                        // Some internal flags
        temp.UInt32(0);
        
        temp.UInt32(0x003E02B0);               // ??
        
        temp.Pad(12);
        
        // Fill this in later
        this.pt_vertwibbles = tempPos + temp.Tell();
        temp.Int32(-1);
        
        temp.Pad(8);

        temp.Pad(4, 0xFF);
        temp.Pad(8);
        temp.UInt32(0);                        // Material pass count, set internally
        temp.UInt32((this.lods[0] && this.lods[0].num_index_sets) || 0);
        
        temp.Pad(32);
        
        w.Combine(temp.buffer);
    }
    
    // -----------------------------
    // Write compressed vertices.
    // -----------------------------
    
    SerializedCompressedVertices(buf, count, w)
    {
        var secflags = this.geom.sector.flags;
        
        var bb_center = [0.0, 0.0, 0.0];
        var bb_center_used = false;
        
        // Does our geom contain THUG2-styled billboards?
        // If so, our vertices are relative to our billboard center.
        
        if (this.geom.has_geom_billboard)
        {
            bb_center = this.geom.billboard_pivot_origin;
            bb_center_used = true;
        }
        
        for (const vert of buf)
        {
            var vert_pos = [vert.pos[0], vert.pos[1], vert.pos[2]];
            var vert_nrm = [vert.no[0], vert.no[1], vert.no[2]];
            
            if (bb_center_used)
            {
                vert_pos = [
                    bb_center[0],
                    bb_center[1],
                    bb_center[2],
                ];
                
                vert_nrm = [
                    vert.pos[0] - bb_center[0],
                    vert.pos[1] - bb_center[1],
                    vert.pos[2] - bb_center[2],
                ];
                
                console.log("NORM: " + vert_nrm.join(", "));
            }
            
            w.Float(vert_pos[0]);
            w.Float(vert_pos[1]);
            w.Float(vert_pos[2]);
            
            if (secflags & SECFLAGS_HAS_VERTEX_WEIGHTS)
            {
                w.Int32(vert.packed_weights);
                
                for (var wg=0; wg<4; wg++)
                {
                    if (wg < vert.weights.length)
                        w.UInt16(vert.weights[wg][0] * 3);
                    else
                        w.UInt16(0);
                }
            }
            
            if (secflags & SECFLAGS_HAS_VERTEX_NORMALS || bb_center_used)
                w.Int32(vert.packed_normals);
            
            if (secflags & SECFLAGS_HAS_VERTEX_COLORS)
            {
                w.UInt8(vert.color.b);
                w.UInt8(vert.color.g);
                w.UInt8(vert.color.r);
                w.UInt8(vert.color.a);
            }
            
            if (secflags & SECFLAGS_HAS_TEXCOORDS)
            {
                for (const uv of vert.uvs)
                {
                    w.Float(uv[0]);
                    w.Float(uv[1]);
                }
            }
        }
    }
    
    // -----------------------------
    // Write uncompressed vertices
    // -----------------------------
    
    SerializedUncompressedVertices(buf, count, w)
    {
        var secflags = this.geom.sector.flags;
        
        var bb_center = [0.0, 0.0, 0.0];
        var bb_center_used = false;
        
        // Does our geom contain THUG2-styled billboards?
        // If so, our vertices are relative to our billboard center.
        
        if (this.geom.has_geom_billboard)
        {
            bb_center = this.geom.billboard_pivot_origin;
            bb_center_used = true;
        }
        
        for (const vert of buf)
        {
            var vert_pos = [vert.pos[0], vert.pos[1], vert.pos[2]];
            var vert_nrm = [vert.no[0], vert.no[1], vert.no[2]];
            
            if (bb_center_used)
            {
                vert_pos = [
                    bb_center[0],
                    bb_center[1],
                    bb_center[2],
                ];
                
                vert_nrm = [
                    vert.pos[0] - bb_center[0],
                    vert.pos[1] - bb_center[1],
                    vert.pos[2] - bb_center[2],
                ];
            }
            
            w.Float(vert_pos[0]);
            w.Float(vert_pos[1]);
            w.Float(vert_pos[2]);
            
            if (secflags & SECFLAGS_HAS_VERTEX_NORMALS || bb_center_used)
            {
                w.Float(vert_nrm[0]);
                w.Float(vert_nrm[1]);
                w.Float(vert_nrm[2]);
            }
            
            if (secflags & SECFLAGS_HAS_VERTEX_COLORS)
            {
                w.UInt8(vert.color.b);
                w.UInt8(vert.color.g);
                w.UInt8(vert.color.r);
                w.UInt8(vert.color.a);
            }
            
            if (secflags & SECFLAGS_HAS_TEXCOORDS)
            {
                for (const uv of vert.uvs)
                {
                    w.Float(uv[0]);
                    w.Float(uv[1]);
                }
            }
        }
    }
    
    // -----------------------------
    // Serialize our faces.
    // -----------------------------
    
    SerializeVertices(w)
    {
        if (!this.lods.length)
            return;
            
        //~ var start_time = SceneConverter.TimeStart();
            
        var numVertBuffers = (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLOR_WIBBLES) ? 2 : 1;
        
        for (var vb=0; vb<numVertBuffers; vb++)
        {
            var off_verts = w.Tell();
            
            w.Seek(this.pt_verts + (4 * vb));
            w.UInt32((off_verts - this.geom.sector.scene.sceneFile.off_scene) + 4);
            w.Seek(off_verts);
            
            var tempWriter = new SceneConverter.constants.Writer();
            tempWriter.LE = w.LE;
            
            // Ideally we should only have 1 LOD.
            //~ for (const lod of this.lods)
            const lod = this.lods[0];
            
            // Vertex block size.
            var size_off = w.Tell();
            tempWriter.UInt32(lod.vertex_stride * lod.vertex_count);
            
            // What kind of vertices should we serialize?
            if (this.weighted)
                this.SerializedCompressedVertices(lod.vertex_buffers[vb] || lod.vertex_buffers[0], lod.vertex_count, tempWriter);
            else
                this.SerializedUncompressedVertices(lod.vertex_buffers[vb] || lod.vertex_buffers[0], lod.vertex_count, tempWriter);
            
            w.Combine(tempWriter.buffer);
        }
        
        //~ console.log("Verts serialized in " + SceneConverter.TimeEnd(start_time) + " seconds");
    }
    
    // -----------------------------
    // Serialize our Faces.
    // -----------------------------
    
    SerializeFaces(w)
    {
        if (!this.lods.length)
            return;
            
        var off_faces = w.Tell();
        
        w.Seek(this.pt_faces);
        w.UInt32(off_faces - this.geom.sector.scene.sceneFile.off_scene);
        w.Seek(off_faces);
        
        const lod = this.lods[0];
        
        var tempBuffer = Buffer.alloc(4 + (lod.indices_b.length * 2));
        tempBuffer.writeUInt32LE(tempBuffer.length-4, 0);
        
        //~ for (const lod of this.lods)
        //~ {
         
        var off = 4;
        
        for (const ind of lod.indices_b)
        {
            tempBuffer.writeUInt16LE(ind, off);
            off += 2;
        }
            
        //~ }
        
        w.Combine(tempBuffer);
        w.PadToNearest(4, 0);
        
        // Write vertex wibble indices if we have them.
        if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLOR_WIBBLES)
        {
            var wibindex_off = w.Tell();
            
            w.Seek(this.pt_vertwibbles);
            w.UInt32(wibindex_off - this.geom.sector.scene.sceneFile.off_scene);
            w.Seek(wibindex_off);
            
            for (const vert of this.lods[0].vertex_buffers[0])
                w.UInt8(vert.vc_wibble_value);
                
            w.PadToNearest(4);
        }
    }
}

module.exports = THAW_sMesh;
