// ----------------------------------------------
//
//  CSECTOR
//      A sector.
//
// ----------------------------------------------

class CSector
{
    constructor(scene)
    {
        this.scene = scene;
        this.From(null, "");
    }
    
    // -----------------------------
    // Clone from another sector.
    // -----------------------------
    
    From(sect, fmt = "")
    {
        this.checksum = (sect && sect.checksum) || "0x00000000";
        this.lightgroup = (sect && sect.lightgroup) || "0x00000000";
        this.flags = (sect && sect.flags) || 0;
        
        this.sphere_pos = (sect && sect.sphere_pos) || [0.0, 0.0, 0.0];
        this.sphere_radius = (sect && sect.sphere_radius) || 0.0;
        
        if (sect && fmt)
        {
            var geomClass = SceneConverter.CreateClass("CGeom", fmt);
            this.geom = new geomClass(this);
            this.geom.From(sect.geom, fmt);
        }
        else
            this.geom = (sect && sect.geom) || null;
    }
    
    // -----------------------------
    // Does this sector have a CGeom?
    // -----------------------------
    
    HasCGeom() { return true; }
    
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
        
        this.lightgroup = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("  Lightgroup: " + this.lightgroup);
        
        r.Chunk(48);
        
        this.sphere_pos = [ r.Float(), r.Float(), r.Float() ];
        console.log("  Sphere Pos: (" + this.sphere_pos.join(", ") + ")");
        this.sphere_radius = r.Float();
        console.log("  Sphere Radius: " + this.sphere_radius);
        
        r.Chunk(16);
        console.log("");
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
        //~ w.UInt32(this.flags);
        w.UInt32(0);
        w.UInt32( parseInt(this.lightgroup, 16) );
        
        w.Int32(-1);
        w.Int32(-1);
        
        w.Pad(40);
        
        w.Float(this.sphere_pos[0]);
        w.Float(this.sphere_pos[1]);
        w.Float(this.sphere_pos[2]);
        w.Float(this.sphere_radius);
        
        w.Pad(16);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    GetGeom() { return this.geom; }
}

module.exports = CSector;
