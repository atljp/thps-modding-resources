// ----------------------------------------------
//
//  THUG2 CGEOM
//      Tony Hawk's Underground 2 geom.
//
// ----------------------------------------------

const CGeom = require('./CGeom.js');

class THUG2_CGeom extends CGeom
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
        
        this.sMesh_count = r.UInt32();
        console.log("    sMesh Count: " + this.sMesh_count);
        
        this.bounds_min = [ r.Float(), r.Float(), r.Float(), 0.0 ];
        console.log("    Bounds Min: (" + this.bounds_min.join(", ") + ")");
        this.bounds_max = [ r.Float(), r.Float(), r.Float(), 0.0 ];
        console.log("    Bounds Max: (" + this.bounds_max.join(", ") + ")");
        this.bounds_sphere = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("    Bounds Sphere: (" + this.bounds_sphere.join(", ") + ")");
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_BILLBOARD_PRESENT)
        {
            this.has_geom_billboard = true;
            this.billboard_type = r.UInt32();
            
            this.billboard_pivot_origin = [ r.Float(), r.Float(), r.Float() ];
            this.billboard_pivot_pos = [ r.Float(), r.Float(), r.Float() ];
            this.billboard_pivot_axis = [ r.Float(), r.Float(), r.Float() ];
            
            console.log("    Billboard Origin: (" + this.billboard_pivot_origin.join(", ") + ")");
            console.log("    Billboard Pos: (" + this.billboard_pivot_pos.join(", ") + ")");
            console.log("    Billboard Axis: (" + this.billboard_pivot_axis.join(", ") + ")");
        }
        
        var sMeshClass = SceneConverter.CreateClass("sMesh", SceneConverter.inFormat);
        
        for (var s=0; s<this.sMesh_count; s++)
        {
            var mesh = new sMeshClass(this);
            
            mesh.Deserialize(r);
            
            this.meshes.push(mesh);
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
        console.log("THUG2 geom serializing not allowed.");
    }
}

module.exports = THUG2_CGeom;
