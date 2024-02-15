// ----------------------------------------------
//
//  SMESH
//      A sMesh.
//
// ----------------------------------------------

const Vertex = require('./Vertex.js');
const VertexGroup = require('./VertexGroup.js');
const sMesh = require('./sMesh.js');

class GH5_sMesh extends sMesh
{
    // -----------------------------
    // Does this type use high-resolution values?
    // -----------------------------
    
    IsHires() { return false; }
    
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
        
        var ptUV = r.Int32();
        if (ptUV >= 0)
        {
            this.off_uvs = this.geom.sector.scene.sceneFile.off_scene + ptUV;
            console.log("    UV's @ " + this.off_uvs);
        }
        
        r.Chunk(8);
        
        this.uv_block_length = r.UInt32();
        console.log("    UV Block Length: " + this.uv_block_length);
        
        r.UInt32();         // zero
        
        this.mesh_flags = r.UInt32();
        console.log("    Mesh Flags: 0x" + this.mesh_flags.toString(16).padStart(8, "0"));
        
        r.UInt32();         // unkValueA;
        
        r.UInt8();          // unkValueA
        r.UInt8();          // unkValueA
        this.uv_bool = r.UInt8();
        console.log("    UV Bool: " + this.uv_bool);
        
        this.uv_stride = r.UInt8();
        console.log("    UV Stride: " + this.uv_stride);
        
        var ptFaces = r.Int32();
        if (ptFaces >= 0)
        {
            this.off_faces = this.geom.sector.scene.sceneFile.off_scene + ptFaces;
            console.log("    Faces @ " + this.off_faces);
        }
        
        r.Chunk(8);
        
        this.face_block_length = r.UInt32();
        console.log("    Face Block Length: " + this.face_block_length);
        
        r.UInt32();         // zero_c
        
        var always_const = r.UInt32();
        console.log("    Always 258: " + always_const);
        
        r.UInt32();         // unkValueB
        r.UInt32();         // zero_d
        
        console.log("    Unk A: " + this.unk_a);
        console.log("    Unk B: " + this.unk_b);
        
        this.material = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("    Material: " + this.material);
        
        r.Chunk(12);        // skip_me_c
        
        this.face_count = r.UInt16();
        console.log("    Face Count: " + this.face_count);
        this.vertex_count = r.UInt16();
        console.log("    Vertex Count: " + this.vertex_count);
        
        r.UInt32();                         // zero_e
        this.single_bone = r.UInt8();       // Entire mesh weighted to this bone?
        r.UInt8();                          // unkValueC
        r.UInt8();                          // unkValueC
        r.UInt8();                          // unkValueC
        
        this.unkFlags = r.UInt32();
        r.UInt32();                         // zero_f
        
        var ptVertices = r.Int32();
        if (ptVertices >= 0)
        {
            this.off_verts = this.geom.sector.scene.sceneFile.off_scene + ptVertices;
            console.log("    Weighted Verts @ " + this.off_verts);
        }
        
        r.UInt32();                         // zero_g
        
        this.face_type = r.UInt32();
        console.log("    Face Type: " + this.face_type);
        
        r.UInt32();                         // zero_h
        r.UInt32();                         // zero_i
        r.UInt32();                         // ff_c
        r.UInt32();                         // zero_j
        
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
        
        this.ValidateVertices();
        
        // ------------------------------------
        
        r.Seek(mesh_end);
    }
}

module.exports = GH5_sMesh;
