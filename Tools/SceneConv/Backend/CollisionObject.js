// ----------------------------------------------
//
//  COLLISIONOBJECT
//      Object in a .col file.
//
// ----------------------------------------------

class CollisionObject
{
    constructor(col)
    {
        this.collision = col;
        
        this.checksum = "0x00000000";
        this.flags = 0;
        
        this.num_verts = 0;
        this.num_faces = 0;
        
        this.use_small_faces = false;
        this.use_fixed = false;
        
        this.first_face_offset = 0;
        this.first_vert_offset = 0;
        this.bsp_tree_offset = 0;
        this.intensity_offset = 0;
        
        this.bounding_min = [0.0, 0.0, 0.0, 1.0];
        this.bounding_max = [0.0, 0.0, 0.0, 1.0];
        
        this.vertices = [];
        this.faces = [];
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    Deserialize(r)
    {
        console.log("Override me.");
    }
    
    // -----------------------------
    // Read vertices.
    // -----------------------------
    
    ReadVertices(r)
    {
    }
    
    // -----------------------------
    // Read faces.
    // -----------------------------
    
    ReadFaces(r)
    {
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  S E R I A L I Z E
    //      SERIALIZES TO A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Serialize our data data.
    // -----------------------------
    
    Serialize(w)
    {
    }
}

module.exports = CollisionObject;
