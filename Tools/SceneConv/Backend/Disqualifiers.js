// ----------------------------------------------
//
//  DISQUALIFIERS
//      Disqualifies certain faces.
//
// ----------------------------------------------

class Disqualifiers
{
    constructor(sceneFile)
    {
        this.sceneFile = sceneFile;
        
        this.disqualifiers = [];
        
        this.version = 2;
        this.unk_b = 0;
        
        this.off_disquals = 0;
        
        this.acc_flags = 0;
        this.char_flags = 0;
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
        var dq_start = r.Tell();
        
        console.log("  Disquals @[" + r.Tell() + "]");
        
        this.version = r.UInt8();
        console.log("  Version: " + this.version);
        
        var header_length = r.UInt8();
        console.log("  Header Length: " + header_length);
        
        this.unk_b = r.UInt16();
        console.log("  UnkB: " + this.unk_b);
        
        var dq_count = r.UInt32();
        console.log("  Disqualifier Count: " + dq_count);
        
        var ptDisqs = r.Int32();
        if (ptDisqs > 0)
        {
            this.off_disquals = dq_start + ptDisqs;
            console.log("  Disqual list @ " + this.off_disquals);
            
            r.Seek(this.off_disquals);
            
            this.acc_flags = r.UInt32();
            this.char_flags = r.UInt32();
            
            console.log("  Acc Flags: 0x" + this.acc_flags.toString(16).padStart(8, "0"));
            console.log("  Char Flags: 0x" + this.char_flags.toString(16).padStart(8, "0"));
        }
    }
}

module.exports = Disqualifiers;
