// ----------------------------------------------
//
//  THAW SCENE
//      Tony Hawk's American Wasteland scene.
//
// ----------------------------------------------

const CScene = require('./CScene.js');

class THAW_CScene extends CScene
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // How big is an sMesh? In bytes
    // -----------------------------
    
    GetSMeshSize()
    {
        if (this.sceneFile.platform == "xbox")
        {
            return 172;
        }

        return 224;
    }
    
    // -----------------------------
    // How big is a CGeom? In bytes
    // -----------------------------
    
    GetCGeomSize()
    {
        if (this.sceneFile.platform == "xbox")
        {
            return 104;
        }

        return 104;
    }
    
    // -----------------------------
    // CScene header is always the same,
    // regardless of console.
    // -----------------------------
    
    ReadHeader()
    {
        var r = this.reader;
        var scene_start = r.Tell();
        
        var version = r.UInt16();
        console.log("Version: " + version);
        var scene_length = r.UInt16();
        console.log("Scene Length: " + scene_length);
        
        // XBox file.
        if (version == 2)
        {
            this.sceneFile.platform = "xbox";
            r.Chunk(60);
            
            this.bounding_min = [ r.Float(), r.Float(), r.Float(), r.Float() ];
            console.log("Bounding Min: (" + this.bounding_min.join(", ") + ")");
            this.bounding_max = [ r.Float(), r.Float(), r.Float(), r.Float() ];
            console.log("Bounding Max: (" + this.bounding_max.join(", ") + ")");
            
            r.Chunk(28);
            
            this.sector_count = r.UInt32();
            console.log("Sector Count: " + this.sector_count);
            
            var ptSector = r.Int32();
            if (ptSector >= 0)
            {
                this.off_cSector = this.sceneFile.off_scene + ptSector;
                console.log("CSectors @ " + this.off_cSector);
            }
            
            var ptGeom = r.Int32();
            if (ptGeom >= 0)
            {
                this.off_cGeom = this.sceneFile.off_scene + ptGeom;
                console.log("CGeoms @ " + this.off_cGeom);
            }
            
            var ptBillboards = r.Int32();
            if (ptBillboards >= 0)
            {
                this.off_billboards = this.sceneFile.off_scene + ptBillboards;
                console.log("Billboards @ " + this.off_billboards);
            }
        
            var ptBigPadding = r.Int32();
            if (ptBigPadding >= 0)
            {
                this.off_bigPadding = this.sceneFile.off_scene + ptBigPadding;
                console.log("BigPadding @ " + this.off_bigPadding);
            }
            
            var ptSMesh = r.Int32();
            if (ptSMesh >= 0)
            {
                this.off_sMesh = this.sceneFile.off_scene + ptSMesh;
                console.log("sMeshes @ " + this.off_sMesh);
            }
            
            r.Chunk(8);
            r.Chunk(4);
        }
        else
        {
            console.log("PC deserialize not supported yet.");
            this.sceneFile.platform = "pc";
        }
        
        r.Seek(scene_start + scene_length);
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
        this.ReadCGeoms();
        this.ReadSMeshes();
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
        this.writer = w;
        this.WriteCore();
    }
    
    // -----------------------------
    // Write the file data.
    // -----------------------------
    
    WriteCore()
    {
        var w = this.writer;
        
        //~ this.sectors = this.sectors.slice(12);
        
        // Regardless, all scenes share the same header.
        this.WriteHeader();
        
        // Now we can write our sectors.
        this.off_cSector = w.Tell();
        w.Seek(this.pt_cSector);
        w.UInt32(this.off_cSector - this.sceneFile.off_scene);
        w.Seek(this.off_cSector);
        
        console.log("Writing sectors...");
        var sectorTime = SceneConverter.TimeStart();
        
        // Write sector information.
        for (const sect of this.sectors)
            sect.Serialize(w);
            
        console.log("  Took " + SceneConverter.TimeEnd(sectorTime) + " seconds.");
        
        console.log("Writing CGeoms / misc...");
        var geomTime = SceneConverter.TimeStart();
            
        // Write CGeoms.
        this.off_cGeom = w.Tell();
        w.Seek(this.pt_cGeom);
        w.UInt32(this.off_cGeom - this.sceneFile.off_scene);
        w.Seek(this.off_cGeom);
        
        // We'll write our sMeshes in order, because we are smart.
        var sMesh_index = 0;
        for (const sect of this.sectors)
        {
            if (sect.geom)
            {
                sect.geom.sMesh_first = sMesh_index;
                sect.geom.sMesh_count = sect.geom.meshes.length;
                
                sect.geom.Serialize(w);
                
                sMesh_index += sect.geom.meshes.length;
            }
        }
        
        // Write billboard info for objects.
        this.off_billboards = w.Tell();
        var had_billboards = false;
        
        for (const sect of this.sectors)
        {
            if (sect.geom && (sect.flags & SceneConverter.constants.SECFLAGS_BILLBOARD_PRESENT))
            {
                had_billboards = true;
                
                for (const mesh of sect.geom.meshes)
                {
                    mesh.off_billboards = w.Tell();
                    
                    // Possibly? Are these the same between THAW / THUG2?
                    //~ w.UInt32(sect.geom.billboard_type);
                    w.UInt32(0);
                    
                    // THUG2 billboard.
                    if (sect.geom.has_geom_billboard)
                    {
                        w.Float(sect.geom.billboard_pivot_origin[0]);
                        w.Float(sect.geom.billboard_pivot_origin[1]);
                        w.Float(sect.geom.billboard_pivot_origin[2]);
                        w.Float(1.0);
                        
                        w.Float(sect.geom.billboard_pivot_axis[0]);
                        w.Float(sect.geom.billboard_pivot_axis[1]);
                        w.Float(sect.geom.billboard_pivot_axis[2]);
                        w.Float(1.0);
                    }
                    else
                    {
                        w.Float(mesh.billboard_pivot[0]);
                        w.Float(mesh.billboard_pivot[1]);
                        w.Float(mesh.billboard_pivot[2]);
                        w.Float(mesh.billboard_pivot[3]);
                        
                        w.Float(mesh.billboard_axis[0]);
                        w.Float(mesh.billboard_axis[1]);
                        w.Float(mesh.billboard_axis[2]);
                        w.Float(1.0);
                    }
                }
            }
        }
        
        if (had_billboards)
        {
            var old_off = w.Tell();
            w.Seek(this.pt_billboards);
            w.UInt32(this.off_billboards - this.sceneFile.off_scene);
            w.Seek(old_off);
        }
        
        // Big padding time!
        this.off_bigPadding = w.Tell();
        w.Seek(this.pt_bigPadding);
        w.UInt32(this.off_bigPadding - this.sceneFile.off_scene);
        w.Seek(this.off_bigPadding);
        
        // Each sector stores a 20-byte-long object here.
        w.Pad(20 * this.sectors.length);
        
        // Cool, now write the actual meshes. Remember, these will be in order.
        this.off_sMesh = w.Tell();
        w.Seek(this.pt_sMesh);
        w.UInt32(this.off_sMesh - this.sceneFile.off_scene);
        w.Seek(this.off_sMesh);
        
        console.log("  Took " + SceneConverter.TimeEnd(geomTime) + " seconds.");
        
        console.log("Writing meshes...");
        var meshTime = SceneConverter.TimeStart();
        
        for (const sect of this.sectors)
        {
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                    mesh.Serialize(w);
            }
        }
        
        // 0xAA padding to nearest 32 bytes
        w.PadToNearest(32, 0xAA);
        
        console.log("  Took " + SceneConverter.TimeEnd(meshTime) + " seconds.");
        
        // ---------------------
        
        console.log("Writing vertices...");
        
        // Write vertices.
        
        var vert_start_time = SceneConverter.TimeStart();
        var lastPercent = -1;
        
        for (var s=0; s<this.sectors.length; s++)
        {
            var sect = this.sectors[s];
            
            var pct = Math.floor((s / this.sectors.length) * 100.0);
            
            if (Math.floor(pct) % 20 == 0 && pct != lastPercent)
            {
                console.log(pct.toString() + "%: Serializing vertices: " + sect.checksum + "...");
                lastPercent = pct;
            }
            
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                    mesh.SerializeVertices(w);
            }
        }
        console.log("  All vertices serialized in " + SceneConverter.TimeEnd(vert_start_time) + " seconds.");
        
        // Write faces.
        
        lastPercent = -1;
        var face_start_time = SceneConverter.TimeStart();
        
        for (var s=0; s<this.sectors.length; s++)
        {
            var sect = this.sectors[s];
            
            var pct = Math.floor((s / this.sectors.length) * 100.0);
            
            if (Math.floor(pct) % 20 == 0 && pct != lastPercent)
            {
                console.log(pct.toString() + "%: Serializing faces: " + sect.checksum + "...");
                lastPercent = pct;
            }
            
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                    mesh.SerializeFaces(w);
            }
        }
        
        console.log("  All faces serialized in " + SceneConverter.TimeEnd(face_start_time) + " seconds.");
    }
    
    // -----------------------------
    // Write our scene header.
    // -----------------------------
    
    WriteHeader()
    {
        var w = this.writer;
        
        w.UInt16(1);                // version
        w.UInt16(172);              // Scene length, constant
        
        w.Pad(20);
        w.Pad(8, 0xFF);
        w.UInt32(0);
        
        w.Float(this.bounding_min[0]);
        w.Float(this.bounding_min[1]);
        w.Float(this.bounding_min[2]);
        w.Float(this.bounding_min[3]);
        
        w.Float(this.bounding_max[0]);
        w.Float(this.bounding_max[1]);
        w.Float(this.bounding_max[2]);
        w.Float(this.bounding_max[3]);
        
        w.Float(this.sphere_pos[0]);
        w.Float(this.sphere_pos[1]);
        w.Float(this.sphere_pos[2]);
        w.Float(this.sphere_radius);
        
        w.UInt32(0);            // Num links? For transition zones?
        w.Pad(16);
        w.Pad(8, 0xFF);
        w.Pad(8);
        w.Pad(4, 0xFF);
        w.Pad(4);
        
        w.UInt32(this.sectors.length);
        
        // Pointer to CSector list, we'll fix this later
        this.pt_cSector = w.Tell();
        w.Int32(-1);
        
        // Pointer to CGeom list, we'll fix this later
        this.pt_cGeom = w.Tell();
        w.Int32(-1);
        
        // Pointer to billboard list, we'll fix this later.
        this.pt_billboards = w.Tell();
        w.Int32(-1);
        
        // Pointer to bigPadding, we'll fix this later
        this.pt_bigPadding = w.Tell();
        w.Int32(-1);
        
        // Pointer to sMesh list, we'll fix this later
        this.pt_sMesh = w.Tell();
        w.Int32(-1);
        
        w.Pad(16);
        
        // ???
        w.UInt32(161);
    }
}

module.exports = THAW_CScene;
