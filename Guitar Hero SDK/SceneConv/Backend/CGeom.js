// ----------------------------------------------
//
//  CGEOM FILE
//      A cGeom.
//
// ----------------------------------------------

class CGeom
{
    constructor(sector)
    {
        this.sector = sector;
        this.From(null, "");
    }
    
    // -----------------------------
    // Clone from a CGeom.
    // -----------------------------
    
    From(geom, fmt = "")
    {
        if (geom && fmt)
        {
            var meshClass = SceneConverter.CreateClass("sMesh", fmt);
            this.meshes = [];
            
            for (const mesh of geom.meshes)
            {
                var newMesh = new meshClass(this);
                newMesh.From(mesh, fmt);
                
                this.meshes.push(newMesh);
            }
        }
        else
            this.meshes = (geom && geom.meshes) || [];
        
        this.sector_block_length = (geom && geom.sector_block_length) || 0;
        this.always_twofiftysix = (geom && geom.always_twofiftysix) || 256;
        
        this.bounds_min = (geom && geom.bounds_min) || [0.0, 0.0, 0.0, 0.0];
        this.bounds_max = (geom && geom.bounds_max) || [0.0, 0.0, 0.0, 0.0];
        this.bounds_sphere = (geom && geom.bounds_sphere) || [0.0, 0.0, 0.0, 0.0];
        
        this.sMesh_first = (geom && geom.sMesh_first) || 0;
        this.sMesh_count = (geom && geom.sMesh_count) || 0;
        
        this.dead = (geom && geom.dead) || 0;
        
        this.has_geom_billboard = (geom && geom.has_geom_billboard) || false;
        this.billboard_type = (geom && geom.billboard_type) || 0;
        this.billboard_pivot_origin = (geom && geom.billboard_pivot_origin) || (0.0, 0.0, 0.0);
        this.billboard_pivot_pos = (geom && geom.billboard_pivot_pos) || (0.0, 0.0, 0.0);
        this.billboard_pivot_axis = (geom && geom.billboard_pivot_axis) || (0.0, 0.0, 0.0);
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
        console.log("    -- CGEOM @[" + r.Tell() + "] ------");
        
        this.sector_block_length = r.UInt32();
        console.log("    Sector Block Length: " + this.sector_block_length);
        
        r.Chunk(8);
        
        this.always_twofiftysix = r.UInt32();
        console.log("    Always 256: " + this.always_twofiftysix);
        
        this.bounds_min = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("    Bounds Min: (" + this.bounds_min.join(", ") + ")");
        this.bounds_max = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("    Bounds Max: (" + this.bounds_max.join(", ") + ")");
        
        r.Chunk(24);
        
        this.sMesh_first = r.UInt32();
        console.log("    First sMesh: " + this.sMesh_first);
        this.sMesh_count = r.UInt32();
        console.log("    sMesh Count: " + this.sMesh_count);
        
        r.Chunk(12);
        
        this.dead = r.UInt32();
        console.log("    DEADDEAD: 0x" + this.dead.toString(16).padStart(8, "0"));
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
        // Sector block length.
        // This will be sector size * num sectors.
        
        w.UInt32(96 * this.sector.scene.sectors.length);
        
        w.Pad(8);
        
        // ALWAYS 256
        w.UInt32(256);
        
        w.Float(this.bounds_min[0]);
        w.Float(this.bounds_min[1]);
        w.Float(this.bounds_min[2]);
        w.Float(this.bounds_min[3]);
        
        w.Float(this.bounds_max[0]);
        w.Float(this.bounds_max[1]);
        w.Float(this.bounds_max[2]);
        w.Float(this.bounds_max[3]);
        
        w.Pad(24);
        
        w.UInt32(this.sMesh_first);
        w.UInt32(this.sMesh_count);
        
        w.Pad(12);
        
        w.UInt32(this.dead);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    GetMeshByMaterial(matName)
    {
        for (const mesh of this.meshes)
        {
            if (mesh.material.toLowerCase() == matName.toLowerCase())
                return mesh;
        }
    }
}

module.exports = CGeom;
