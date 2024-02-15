// ----------------------------------------------
//
//  SMESH
//      A sMesh.
//
// ----------------------------------------------

const Vertex = require('./Vertex.js');
const VertexGroup = require('./VertexGroup.js');
const sMesh = require('./sMesh.js');

class GH3PC_sMesh extends sMesh
{
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    Deserialize(r)
    {
        this.reader = r;
        
        console.log("    -- SMESH " + this.geom.meshes.length + " @[" + r.Tell() + "], " + this.geom.sector.checksum + " ----");
        
        this.sphere_pos = [ r.Float(), r.Float(), r.Float() ];
        console.log("    Sphere Pos: (" + this.sphere_pos.join(", ") + ")");
        this.sphere_radius = r.Float();
        console.log("    Sphere Radius: " + this.sphere_radius);
        
        r.UInt16();         // UnkA
        r.UInt16();         // UnkB
        
        this.material = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("    Material: " + this.material);
        
        r.UInt32();         // const_not_flags
        
        this.mesh_flags = r.UInt32();
        console.log("    Mesh Flags: 0x" + this.mesh_flags.toString(16).padStart(8, "0"));
        
        r.UInt32();         // unkC
        
        this.face_count = r.UInt16();
        console.log("    Face Count: " + this.face_count);
        this.vertex_count = r.UInt16();
        console.log("    Vertex Count: " + this.vertex_count);
        
        this.face_type = r.UInt32();
        console.log("    Face Type: " + this.face_type);
        
        r.Chunk(20);

        var ptUV = r.Int32();
        if (ptUV >= 0)
        {
            this.off_uvs = this.geom.sector.scene.sceneFile.off_scene + ptUV;
            console.log("    UV's @ " + this.off_uvs);
        }
        
        r.Chunk(8);
        
        this.uv_block_length = r.UInt32();
        console.log("    UV Block Length: " + this.uv_block_length);
        
        r.UInt32();     // zero
        r.UInt32();     // zero
    
        r.UInt8();
        this.uv_bool = r.UInt8();
        console.log("    UV Bool: " + this.uv_bool);
        this.uv_stride = r.UInt8();
        console.log("    UV Stride: " + this.uv_stride);
        r.UInt8();
        
        var ptFaces = r.Int32();
        if (ptFaces >= 0)
        {
            this.off_faces = this.geom.sector.scene.sceneFile.off_scene + ptFaces;
            console.log("    Faces @ " + this.off_faces);
        }
        
        var ptVertices = r.Int32();
        if (ptVertices >= 0)
        {
            this.off_verts = this.geom.sector.scene.sceneFile.off_scene + ptVertices;
            console.log("    Weighted Verts @ " + this.off_verts);
        }
        
        r.UInt32();     // zeros_c
        r.UInt32();     // unkD
        
        r.UInt32();     // zeros_d
        r.UInt32();     // zeros_d
        r.UInt32();     // zeros_d
        
        r.UInt32();     // zeros_e
        r.UInt32();     // zeros_e
        
        console.log("");
        
        var mesh_end = r.Tell();
        
        // ------------------------------------
        
        if (this.off_uvs > 0)
        {
            r.Seek(this.off_uvs);
            this.ReadUVs();
        }
            
        if (this.off_faces > 0)
        {
            r.Seek(this.off_faces);
            this.ReadFaces();
        }
            
        if (this.off_verts > 0)
        {
            r.Seek(this.off_verts);
            this.ReadVertices();
        }
        
        // ------------------------------------
        
        r.Seek(mesh_end);
        
        // Let's force face type to triangles.
        // By now we have converted tristrip to faces.
        
        this.face_type = SceneConverter.constants.FACETYPE_TRIANGLES;
    }
}

module.exports = GH3PC_sMesh;
