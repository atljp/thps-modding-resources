// ----------------------------------------------
//
//  THUG2 SCENE
//      Tony Hawk's Underground 2 scene.
//
// ----------------------------------------------

const CScene = require('./CScene.js');

class THUG2_CScene extends CScene
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // CScene header is always the same,
    // regardless of console.
    // -----------------------------
    
    ReadHeader()
    {
        var r = this.reader;
        
        this.sector_count = r.UInt32();
        console.log("Sector Count: " + this.sector_count);
    }
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    Deserialize(r)
    {
        this.reader = r;
        
        console.log("-- CSCENE @[" + r.Tell() + "] -------------");
        
        this.ReadHeader();
        this.ReadCSectors();
        
        // Let's try to calculate our bounding box based on our sectors.
        var max_x = -9999999.0;
        var max_y = -9999999.0;
        var max_z = -9999999.0;
        var min_x = 9999999.0;
        var min_y = 9999999.0;
        var min_z = 9999999.0;
        
        for (const sect of this.sectors)
        {
            if (!sect.geom)
                continue;
                
            max_x = Math.max(max_x, sect.geom.bounds_max[0]);
            max_y = Math.max(max_y, sect.geom.bounds_max[1]);
            max_z = Math.max(max_z, sect.geom.bounds_max[2]);
            
            min_x = Math.min(min_x, sect.geom.bounds_min[0]);
            min_y = Math.min(min_y, sect.geom.bounds_min[1]);
            min_z = Math.min(min_z, sect.geom.bounds_min[2]);
        }
        
        this.bounding_min = [min_x, min_y, min_z, 1.0];
        this.bounding_max = [max_x, max_y, max_z, 1.0];
        
        console.log("Calculated Bounds:");
        console.log("  Min: (" + this.bounding_min.join(", ") + ")");
        console.log("  Max: (" + this.bounding_max.join(", ") + ")");
        
        // Sphere position will be the center of our bounding box.
        this.sphere_pos[0] = (max_x + min_x) * 0.5;
        this.sphere_pos[1] = (max_y + min_y) * 0.5;
        this.sphere_pos[2] = (max_z + min_z) * 0.5;
        
        // Calculate largest sphere that can contain our bounding box.
        var x_corner_dist = Math.pow(max_x - this.sphere_pos[0], 2);
        var y_corner_dist = Math.pow(max_y - this.sphere_pos[1], 2);
        var z_corner_dist = Math.pow(max_z - this.sphere_pos[2], 2);
        
        this.sphere_radius = Math.sqrt(x_corner_dist + y_corner_dist + z_corner_dist);
        
        // Attempt to calculate sphere radius based on our bounds.
        
        console.log("Calculated scene sphere:");
        console.log("  Center: (" + this.sphere_pos[0] + ", " + this.sphere_pos[1] + ", " + this.sphere_pos[2] + ")");
        console.log("  Radius: " + this.sphere_radius);
        
        console.log("Finished @[" + r.Tell() + "]");
    }
}

module.exports = THUG2_CScene;
