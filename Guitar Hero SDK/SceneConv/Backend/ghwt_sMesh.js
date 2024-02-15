// ----------------------------------------------
//
//  GHWT SMESH
//      A Guitar Hero: World Tour sMesh.
//
// ----------------------------------------------

const Vertex = require('./Vertex.js');
const VertexGroup = require('./VertexGroup.js');
const sMesh = require('./sMesh.js');

class GHWT_sMesh extends sMesh
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
        
        console.log("    -- SMESH " + this.geom.meshes.length + " @[" + r.Tell() + "], " + this.geom.sector.checksum + " ----");
        
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
        
        r.UInt32();         // FFFFFFFF
        r.UInt32();         // FFFFFFFF
        
        this.uv_block_length = r.UInt32();
        console.log("    UV Block Length: " + this.uv_block_length);
        
        r.UInt32();         // ???
        
        this.mesh_flags = r.UInt32();
        console.log("    Mesh Flags: 0x" + this.mesh_flags.toString(16).padStart(8, "0"));
        
        r.UInt8();
        r.UInt8();
        this.uv_bool = r.UInt8();
        console.log("    UV Bool: " + this.uv_bool);
        this.uv_stride = r.UInt8();
        console.log("    UV Stride: " + this.uv_stride);
        

        r.UInt16();         // UnkA
        r.UInt16();         // UnkB
        r.UInt32();         // ???

        this.material = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("    Material: " + this.material);
        
        r.UInt32();
        r.UInt32();         // Always 255
        r.UInt32();
        
        this.face_count = r.UInt16();
        console.log("    Face Count: " + this.face_count);
        this.vertex_count = r.UInt16();
        console.log("    Vertex Count: " + this.vertex_count);
        
        r.UInt32();         // ???
        r.UInt32();         // ???
        r.UInt32();         // unkFlags
        r.UInt32();         // ???
        
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
        
        r.UInt32();         // ???
        
        this.face_type = r.UInt32();
        console.log("    Face Type: " + this.face_type);
        
        r.UInt32();         // ???
        r.UInt32();         // ???
        
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
        
        this.ValidateVertices();
        
        // ------------------------------------
        
        r.Seek(mesh_end);
    }
}

module.exports = GHWT_sMesh;
