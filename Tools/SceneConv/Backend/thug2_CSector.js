// ----------------------------------------------
//
//  THUG2 SECTOR
//      Tony Hawk's Underground 2 sector.
//
// ----------------------------------------------

const CSector = require('./CSector.js');

class THUG2_CSector extends CSector
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
        
        this.checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("  Checksum: " + this.checksum)
        
        console.log("  Bone Index: " + r.Int32());
        
        this.flags = r.UInt32();
        console.log("  Flags: 0x" + this.flags.toString(16).padStart(8, "0"));
        
        // -- Now read our CGeom. --
        var geomClass = SceneConverter.CreateClass("CGeom", SceneConverter.inFormat);
        this.geom = new geomClass(this);
        this.geom.Deserialize(r);
    }
}

module.exports = THUG2_CSector;
