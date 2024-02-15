// ----------------------------------------------
//
//  THUG2 COLLISION OBJECT
//      Tony Hawk's Underground 2 collision object.
//
// ----------------------------------------------

const CollisionObject = require('./CollisionObject.js');

const odbg = function(txt) {}

class THUG2_CollisionObject extends CollisionObject
{
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
        this.checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        
        odbg("  Object " + this.collision.objects.length + " (" + this.checksum + ") @[" + r.Tell() + "]:");
        
        this.flags = r.UInt16();
        odbg("    Flags: 0x" + this.flags.toString(16).padStart(4, "0"));
        
        this.num_verts = r.UInt16();
        odbg("    Verts: " + this.num_verts);
        
        this.num_faces = r.UInt16();
        odbg("    Faces: " + this.num_faces);
        
        this.use_small_faces = (r.UInt8()) ? true : false;
        odbg("    Small Faces: " + this.use_small_faces);
        
        this.use_fixed = (r.UInt8()) ? true : false;
        odbg("    Use Fixed: " + this.use_fixed);
        
        this.first_face_offset = r.UInt32();
        odbg("    First face offset: " + this.first_face_offset);
        
        this.bounding_min = [r.Float(), r.Float(), r.Float(), r.Float()];
        this.bounding_max = [r.Float(), r.Float(), r.Float(), r.Float()];
        
        odbg("    Bounds Min: (" + this.bounding_min.join(", ") + ")");
        odbg("    Bounds Max: (" + this.bounding_max.join(", ") + ")");
        
        this.first_vert_offset = r.UInt32();
        odbg("    Vertices offset: " + this.first_vert_offset);
        this.bsp_tree_offset = r.UInt32();
        odbg("    BSP tree offset: " + this.bsp_tree_offset);
        this.intensity_offset = r.UInt32();
        odbg("    Intensity offset: " + this.intensity_offset);
        
        // Padding
        r.UInt32();
    }
    
    // -----------------------------
    // Read vertices.
    // -----------------------------
    
    ReadVertices(r)
    {
        var vert_start = this.collision.off_vertices;
        var vert_stride = this.use_fixed ? 6 : 12;
        
        var old_off = r.Tell();
        r.Seek(vert_start + this.first_vert_offset);
        
        for (var v=0; v<this.num_verts; v++)
        {
            var vertex = {pos: [0.0, 0.0, 0.0], intensity: 255};
            
            vertex.pos[0] = this.use_fixed ? (r.UInt16() * 0.0625) : r.Float();
            vertex.pos[1] = this.use_fixed ? (r.UInt16() * 0.0625) : r.Float();
            vertex.pos[2] = this.use_fixed ? (r.UInt16() * 0.0625) : r.Float();

            this.vertices.push(vertex);
        }
        
        r.Seek(old_off);
    }
    
    // -----------------------------
    // Read faces.
    // -----------------------------
    
    ReadFaces(r)
    {
        var face_start = this.collision.off_faces + this.first_face_offset;
        
        for (var f=0; f<this.num_faces; f++)
        {
            var face = {
                flags: 0,
                terrain_type: 0,
                indices: [0, 0, 0],
                optimization: 0
            };
            
            face.flags = r.UInt16();
            face.terrain_type = r.UInt16();
            
            if (this.use_small_faces)
            {
                face.indices = [r.UInt8(), r.UInt8(), r.UInt8()];
                r.UInt8();
            }
            else
                face.indices = [r.UInt16(), r.UInt16(), r.UInt16()];

            this.faces.push(face);
        }
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
        console.log("hi");
    }
}

module.exports = THUG2_CollisionObject;
