// ----------------------------------------------
//
//  THAW COLLISION
//      Tony Hawk's American Wasteland collision.
//
// ----------------------------------------------

const Collision = require('./Collision.js');

class THAW_Collision extends Collision
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
        console.log("THAW col not supported for read.");
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
        w.LE = true;
        
        w.UInt32(10);                       // Version;
        w.UInt32(this.objects.length);
        w.UInt32(this.total_verts);
        w.UInt32(this.total_large_faces);
        w.UInt32(this.total_small_faces);
        w.UInt32(this.total_large_verts);
        w.UInt32(this.total_small_verts);
        
        w.Pad(12);
        
        // Decide how many supersector rows and columns we need.
        // THAW PC uses 1000.0 for a maximum partition size.
        
        // First, we need to calculate our total bounds based on objects in the scene.
        
        var max_x = -999999.0;
        var max_y = -999999.0;
        var max_z = -999999.0;
        
        var min_x = 999999.0;
        var min_y = 999999.0;
        var min_z = 999999.0;
        
        for (const ob of this.objects)
        {
            max_x = Math.max(max_x, ob.bounding_max[0]);
            max_y = Math.max(max_y, ob.bounding_max[1]);
            max_z = Math.max(max_z, ob.bounding_max[2]);
            
            min_x = Math.min(min_x, ob.bounding_min[0]);
            min_y = Math.min(min_y, ob.bounding_min[1]);
            min_z = Math.min(min_z, ob.bounding_min[2]);
        }
        
        this.total_bounds_min = [min_x, min_y, min_z, 1.0];
        this.total_bounds_max = [max_x, max_y, max_z, 1.0];
        
        console.log("Total Bounds Min: [" + this.total_bounds_min.join(", ") + "]");
        console.log("Total Bounds Max: [" + this.total_bounds_max.join(", ") + "]");
        
        var world_width = this.total_bounds_max[0] - this.total_bounds_min[0];
        var world_depth = this.total_bounds_max[2] - this.total_bounds_min[2];
        
        console.log("  World Width: " + world_width);
        console.log("  World Depth: " + world_depth);
        
        this.supersector_rows = Math.round(world_width / 1000.0);
        this.supersector_columns = Math.round(world_depth / 1000.0);
        
        console.log("  Rows: " + this.supersector_rows + ", Columns: " + this.supersector_columns);
        
        w.UInt32(this.supersector_rows);
        w.UInt32(this.supersector_columns);
        
        w.Float(this.total_bounds_min[0]);
        w.Float(this.total_bounds_min[1]);
        w.Float(this.total_bounds_min[2]);
        w.Float(this.total_bounds_min[3]);
        
        w.Float(this.total_bounds_max[0]);
        w.Float(this.total_bounds_max[1]);
        w.Float(this.total_bounds_max[2]);
        w.Float(this.total_bounds_max[3]);
        
        // -----------------------------------
        
        // Alright, let's guesstimate where some positions
        // are going to be. We can do this based on what we know.
        
        this.off_objects = w.Tell();
        console.log("Objects are at @[" + this.off_objects + "]...");
        
        // Vertices come directly after objects.
        this.off_vertices = this.off_objects + (64 * this.objects.length); 
        console.log("Vertices are at @[" + this.off_vertices + "]...");
        
        // Intensities after vertices.
        this.off_intensities = this.off_vertices + (6 * this.total_small_verts) + (12 * this.total_large_verts);
        console.log("Intensities are at @[" + this.off_intensities + "]...");
        
        // Faces after intensities. Intensities might not
        // be padded to the nearest 4 bytes, let's make sure!
        this.off_faces = (this.off_intensities + this.total_verts + 3) & 0xFFFFFFFC;
        console.log("Faces are at @[" + this.off_faces + "]...");
        
        // Optimizations go here.
        this.off_optimizations = this.off_faces + (8 * this.total_small_faces) + (10 * this.total_large_faces);
        console.log("Optimizations are at @[" + this.off_optimizations + "]...");
        
        // BSP tree after optimizations. Optimizations might not
        // be padded to the nearest 4 bytes, let's make sure!
        this.off_bsp_tree = (this.off_optimizations + this.total_large_faces + 3) & 0xFFFFFFFC;
        console.log("BSP Tree is at @[" + this.off_bsp_tree + "]...");
        
        // BSP faces stored after nodes.
        this.off_bsp_faces = this.off_bsp_tree + 4 + (this.nodes.length * 8);
        console.log("BSP Faces are at @[" + this.off_bsp_faces + "]...");
        
        // -----------------------------------
        
        var faceBlockOffset = 0;
        var vertBlockOffset = 0;
        var intensityOffset = 0;
        
        // Alright, let's write the objects.
        for (var o=0; o<this.objects.length; o++)
        {
            var obj = this.objects[o];
            w.UInt32( parseInt(obj.checksum, 16) );
            w.UInt16(obj.flags);
            w.UInt16(obj.num_verts);
            w.UInt16(obj.num_faces);
            w.UInt8(obj.use_small_faces);
            w.UInt8(obj.use_fixed);
            w.UInt32(faceBlockOffset);
            
            w.Float(obj.bounding_min[0]);
            w.Float(obj.bounding_min[1]);
            w.Float(obj.bounding_min[2]);
            w.Float(obj.bounding_min[3]);
            
            w.Float(obj.bounding_max[0]);
            w.Float(obj.bounding_max[1]);
            w.Float(obj.bounding_max[2]);
            w.Float(obj.bounding_max[3]);
            
            w.UInt32(vertBlockOffset);
            w.Int32(obj.bsp_tree_offset);
            w.Int32(intensityOffset);
            
            // WHAT IS THIS? FIGURE THIS OUT PLEASE
            w.Float(0.0);
            
            intensityOffset += obj.num_verts;
            
            if (obj.use_small_faces)
                faceBlockOffset += (8 * obj.faces.length);
            else
                faceBlockOffset += (10 * obj.faces.length);
                
            if (obj.use_fixed)
                vertBlockOffset += (6 * obj.vertices.length);
            else
                vertBlockOffset += (12 * obj.vertices.length);
        }
        
        console.log("Objects ended at " + w.Tell() + ", should be " + this.off_vertices);
        
        // -----------------------------------
        // Now write vertices.
        
        console.log("Writing vertices at " + w.Tell() + "...");
        
        for (const obj of this.objects)
        {
            for (var v=0; v<obj.vertices.length; v++)
            {
                if (obj.use_fixed)
                {
                    w.UInt16(Math.floor(obj.vertices[v].pos[0] / 0.0625));
                    w.UInt16(Math.floor(obj.vertices[v].pos[1] / 0.0625));
                    w.UInt16(Math.floor(obj.vertices[v].pos[2] / 0.0625));
                }
                else
                {
                    w.Float(obj.vertices[v].pos[0]);
                    w.Float(obj.vertices[v].pos[1]);
                    w.Float(obj.vertices[v].pos[2]);
                }
            }
        }
        
        console.log("  Vertices ended at " + w.Tell() + ", should be " + this.off_intensities);
        
        // -----------------------------------
        // Now write vertex intensities.
        
        console.log("Writing intensities at " + w.Tell() + "...");
        
        for (const obj of this.objects)
        {
            for (const vert of obj.vertices)
                w.UInt8(vert.intensity);
        }
        
        w.PadToNearest(4);
        console.log("  Intensities ended at " + w.Tell() + ", should be " + this.off_faces);
        
        // -----------------------------------
        // Now write faces.
        
        console.log("Writing faces at " + w.Tell() + "...");
        
        var faceBuf = new SceneConverter.constants.Writer();
        faceBuf.LE = w.LE;
        
        for (const obj of this.objects)
        {
            for (const face of obj.faces)
            {
                faceBuf.UInt16(face.flags);
                faceBuf.UInt16(face.terrain_type);
                
                if (obj.use_small_faces)
                {
                    faceBuf.UInt8(face.indices[0]);
                    faceBuf.UInt8(face.indices[1]);
                    faceBuf.UInt8(face.indices[2]);
                    faceBuf.UInt8(0);
                }
                else
                {
                    faceBuf.UInt16(face.indices[0]);
                    faceBuf.UInt16(face.indices[1]);
                    faceBuf.UInt16(face.indices[2]);
                }
            }
        }
        
        w.Combine(faceBuf.buffer);
        
        console.log("  Faces ended at " + w.Tell() + ", should be " + this.off_optimizations);
        
        // -----------------------------------
        // Now write face optimizations.
        
        for (const obj of this.objects)
        {
            if (obj.use_small_faces)
                continue;
                
            for (const face of obj.faces)
            {
                w.UInt8(face.optimization);
            }
        }
        
        w.PadToNearest(4);
        
        console.log("Optimizations ended at " + w.Tell() + ", should be " + this.off_bsp_tree);
        
        // -----------------------------------
        // Now write BSP tree.
        
        // Write tree size in just a moment.
        // First, let's write the BSP tree.
        
        var temp = new SceneConverter.constants.Writer();
        temp.LE = w.LE;
        
        console.log("Writing " + this.nodes.length + " nodes...");

        for (const node of this.nodes)
        {
            var writeStart = SceneConverter.TimeStart();
            
            if (node.leaf)
            {
                temp.UInt8(node.axis);
                temp.UInt8(0);
                temp.UInt16(node.faces.length);
                
                temp.UInt32(node.face_index_offset);
            }
            else
            {
                temp.Int32(node.split_axis_and_point)
                temp.UInt32(node.left_node_start_offset)
            }
        }
        
        w.UInt32(temp.buffer.length);
        w.Combine(temp.buffer);
        
        console.log("BSP nodes ended at " + w.Tell() + ", should be " + this.off_bsp_faces);
        
        // -----------------------------------
        // Now write BSP faces.
        
        var faceBuffer = new SceneConverter.constants.Writer();
        faceBuffer.LE = w.LE;
        
        for (const node of this.nodes)
        {
            if (node.leaf)
            {
                for (const ind of node.faces)
                    faceBuffer.UInt16(ind);
            }
        }
        
        w.Combine(faceBuffer.buffer);
        w.PadToNearest(4);
    }
}

module.exports = THAW_Collision;
