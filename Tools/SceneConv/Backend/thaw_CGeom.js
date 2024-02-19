// ----------------------------------------------
//
//  THAW CGEOM
//      Tony Hawk's American Wasteland geom.
//
// ----------------------------------------------

const CGeom = require('./CGeom.js');

class THAW_CGeom extends CGeom
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
        console.log("    -- CGEOM @[" + r.Tell() + "] ------");
        
        this.sector_block_length = r.UInt32();
        console.log("    Sector Block Length: " + this.sector_block_length);
        
        r.Chunk(20);
        
        this.bounds_min = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("    Bounds Min: (" + this.bounds_min.join(", ") + ")");
        this.bounds_max = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("    Bounds Max: (" + this.bounds_max.join(", ") + ")");
        
        r.Chunk(12);
        
        this.sMesh_count = r.UInt32();
        console.log("    sMesh Count: " + this.sMesh_count);
        
        r.Chunk(32);
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
        // Sector block size.
        w.UInt32(48 * this.sector.scene.sectors.length);
        w.Pad(20);
        
        w.Float(this.bounds_min[0]);
        w.Float(this.bounds_min[1]);
        w.Float(this.bounds_min[2]);
        w.Float(this.bounds_min[3]);
        
        w.Float(this.bounds_max[0]);
        w.Float(this.bounds_max[1]);
        w.Float(this.bounds_max[2]);
        w.Float(this.bounds_max[3]);
        
        w.Pad(12);
        
        w.UInt32(this.meshes.length);
        
        w.Pad(32);
    }
}

module.exports = THAW_CGeom;
