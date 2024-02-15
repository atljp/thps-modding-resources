// ----------------------------------------------
//
//  THAW SECTOR
//      Tony Hawk's American Wasteland sector.
//
// ----------------------------------------------

const CSector = require('./CSector.js');

class THAW_CSector extends CSector
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
        console.log("  -- CSECTOR @[" + r.Tell() + "] -------");
        
        r.UInt32();
        
        this.checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("  Checksum: " + this.checksum)
        
        this.flags = r.UInt32();
        console.log("  Flags: 0x" + this.flags.toString(16).padStart(8, "0"));
        
        r.Chunk(36);
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
        w.UInt32(0);
        w.UInt32( parseInt(this.checksum, 16) );
        
        var flags_to_write = this.flags;
        
        // Make sure we have vertex normals if coming from THUG2 billboard.
        if (this.geom.has_geom_billboard)
        {
            if (!(flags_to_write & SceneConverter.constants.SECFLAGS_HAS_VERTEX_NORMALS))
                flags_to_write |= SceneConverter.constants.SECFLAGS_HAS_VERTEX_NORMALS;
              
            if (!(flags_to_write & SceneConverter.constants.SECFLAGS_UNK))
                flags_to_write |= SceneConverter.constants.SECFLAGS_UNK;
        }
        
        w.UInt32(flags_to_write >>> 0);
        
        w.Pad(36);
    }
}

module.exports = THAW_CSector;
