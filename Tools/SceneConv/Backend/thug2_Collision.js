// ----------------------------------------------
//
//  THUG2 COLLISION
//      Tony Hawk's Underground 2 collision.
//
// ----------------------------------------------

const Collision = require('./Collision.js');

class THUG2_Collision extends Collision
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Reads the file.
    // -----------------------------
    
    ReadCore(r)
    {
        r.LE = true;
        console.log("Version: " + r.UInt32());
        
        var object_count = r.UInt32();
        console.log("Objects: " + object_count);
        
        this.total_verts = r.UInt32();
        console.log("Total Verts: " + this.total_verts);
        
        this.total_large_faces = r.UInt32();
        console.log("Total Large Faces: " + this.total_large_faces);
        
        this.total_small_faces = r.UInt32();
        console.log("Total Small Faces: " + this.total_small_faces);
        
        this.total_large_verts = r.UInt32();
        console.log("Total Large Verts: " + this.total_large_verts);
        
        this.total_small_verts = r.UInt32();
        console.log("Total Small Verts: " + this.total_small_verts);
        
        // Padding
        r.UInt32();
        
        // ------------------------
        
        this.off_objects = r.Tell();
        console.log("Objects at " + r.Tell());
        
        // READ OUR OBJECTS!
        var objClass = SceneConverter.CreateClass("CollisionObject", SceneConverter.inFormat);
        
        for (var o=0; o<object_count; o++)
        {
            var obj = new objClass(this);
            obj.Deserialize(r);
            
            this.objects.push(obj);
        }
        
        r.SkipToNearest(4);
        
        this.off_vertices = r.Tell(); 
        console.log("Vertices at " + r.Tell());
        
        for (var o=0; o<object_count; o++)
            this.objects[o].ReadVertices(r);
            
        // Skip past all vertices.
        r.Seek(this.off_vertices + (this.total_large_verts * 12) + (this.total_small_verts * 6));
            
        this.off_intensities = r.Tell();
        console.log("Intensities at " + r.Tell());
        
        for (var o=0; o<object_count; o++)
        {
            for (var v=0; v<this.objects[o].num_verts; v++)
                this.objects[o].vertices[v].intensity = r.UInt8();
        }
        
        r.SkipToNearest(4);
        this.off_faces = r.Tell();
        console.log("Faces at " + r.Tell());
        
        for (var o=0; o<object_count; o++)
            this.objects[o].ReadFaces(r);
            
        // Skip past all faces.
        r.Seek(this.off_faces + (this.total_large_faces * 10) + (this.total_small_faces * 8));
            
        this.off_optimizations = r.Tell();
        console.log("Optimizations at " + r.Tell());
        
        for (var o=0; o<object_count; o++)
        {
            if (this.objects[o].use_small_faces)
                continue;
                
            for (var f=0; f<this.objects[o].num_faces; f++)
                this.objects[o].faces[f].optimization = r.UInt8();
        }
        
        r.SkipToNearest(4);
        this.off_bsp_tree = r.Tell();
        console.log("BSP Tree at " + r.Tell());
        
        var nodeTreeSize = r.UInt32();
        console.log("  " + nodeTreeSize + " bytes large");
        
        this.off_bsp_faces = r.Tell() + nodeTreeSize;
        console.log("  BSP faces will be at " + this.off_bsp_faces);
        
        // Read all of the trees. These will have the same size.
        var nodeCount = Math.floor(nodeTreeSize / 8);
        console.log("  Reading " + nodeCount + " nodes");
        
        for (var n=0; n<nodeCount; n++)
        {
            var node = {
                leaf: false,
                axis: 0,
                unk: 0,
                faces: [],
                face_index_offset: 0,
                left_node_start_offset: 0,
                split_axis_and_point: 0
            };
            
            // See if it's a leaf.
            var testByte = r.UInt8();
            r.Seek(r.Tell() - 1);
            
            //~ console.log("Node " + n + " @[" + r.Tell() + "]");
            
            if (testByte == 3)
            {
                node.leaf = true;
                
                node.axis = r.UInt8();
                node.unk = r.UInt8();
                var face_count = r.UInt16();
                node.face_index_offset = r.UInt32();
                
                // Read faces.
                var old_off = r.Tell();
                r.Seek(this.off_bsp_faces + (node.face_index_offset * 2));
                
                for (var f=0; f<face_count; f++)
                    node.faces.push(r.UInt16());

                r.Seek(old_off);
            }
            else
            {
                node.leaf = false;
                
                node.split_axis_and_point = r.Int32();
                node.left_node_start_offset = r.UInt32();
            }
            
            this.nodes.push(node);
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
        console.log("Writing THUG2 .col is not supported.");
    }
}

module.exports = THUG2_Collision;
