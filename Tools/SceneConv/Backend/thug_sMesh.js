// ----------------------------------------------
//
//  THUG MESH
//      Tony Hawk's Underground mesh.
//
// ----------------------------------------------

const THUG2_sMesh = require('./thug2_sMesh.js');
const Vertex = require('./Vertex.js');

class THUG_sMesh extends THUG2_sMesh
{
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
        
        this.lods.push(lod);
        
        var indicesCount = r.UInt32();
        console.log("      Num Indices: " + indicesCount);
        
        var thugData = this.geom.thuginfo;
        var vertIndices = [];
        var buf = [];
        
        for (var i=0; i<indicesCount; i++)
        {
            var ind = r.UInt16();
            var vert = thugData.vertices[ind];
            
            // Has weights? Pack the normals.
            if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_WEIGHTS)
            {
                var nX = Math.floor(vert.no[0] * 1023.0) & 0x7FF;
                var nY = (Math.floor(vert.no[1] * 1023.0) & 0x7FF) << 11;
                var nZ = (Math.floor(vert.no[2] * 511.0) & 0x3FF) << 22;

                vert.packed_normals = (nX | nY | nZ);
            }
            
            vertIndices.push(i);
            buf.push(vert);
        }
        
        lod.vertex_buffers.push(buf);
        lod.vertex_count = indicesCount;
        
        // Calculate stride.
        lod.vertex_stride = 12;             // Always has position.
        
        // -- COMPRESSED VERTEX --
        if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_WEIGHTS)
        {
            this.weighted = true;
            
            lod.vertex_stride += 4;     // Packed weights
            lod.vertex_stride += 8;     // Weight indices
            
            if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_NORMALS)
            {
                lod.vertex_stride += 4;     // Packed normals
                lod.flags |= SceneConverter.constants.MESHFLAG_THAW_VERTEXNORMALS;
            }
        }
        else if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_NORMALS)
        {
            lod.vertex_stride += 12;
            lod.flags |= SceneConverter.constants.MESHFLAG_THAW_VERTEXNORMALS;
        }
        
        if (this.geom.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLORS)
        {
            lod.vertex_stride += 4;
            lod.flags |= SceneConverter.constants.MESHFLAG_THAW_VERTEXCOLOR;
        }
            
        var uvCount = lod.vertex_buffers[0][0].uvs.length;
        lod.vertex_stride += 8 * uvCount;
        
        lod.flags |= (uvCount << 8);
        
        console.log("      New Stride: " + lod.vertex_stride);
        
        // --------------------------------------
        // Auto-generate faces from vertices.
        
        for (var f=2; f<vertIndices.length; f++)
        {
            var a, b, c;
            
            if (f % 2 == 0)
            {
                a = vertIndices[f-2];
                b = vertIndices[f-1];
                c = vertIndices[f];
            }
            else
            {
                a = vertIndices[f-2];
                b = vertIndices[f];
                c = vertIndices[f-1];
            }
            
            var bad = false;
            
            if (a < 0 || a >= vertIndices.length)
            {
                console.log("BAD VERTEX INDEX FOR FACE: " + a + ", had " + vertIndices.length + " vertex indices");
                bad = true;
            }
            
            if (b < 0 || b >= vertIndices.length)
            {
                console.log("BAD VERTEX INDEX FOR FACE: " + b + ", had " + vertIndices.length + " vertex indices");
                bad = true;
            }
            
            if (c < 0 || c >= vertIndices.length)
            {
                console.log("BAD VERTEX INDEX FOR FACE: " + c + ", had " + vertIndices.length + " vertex indices");
                bad = true;
            }
            
            if (!bad)
            {
                lod.indices_b.push(a);
                lod.indices_b.push(b);
                lod.indices_b.push(c);
            }
        }
    }
}

module.exports = THUG_sMesh;
