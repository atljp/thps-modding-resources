// ----------------------------------------------
//
//  CSCENE
//      A scene.
//
// ----------------------------------------------

const Writer = require('./Writer.js');
const CSector = require('./CSector.js');
const CGeom = require('./CGeom.js');

class CScene
{
    constructor(sceneFile)
    {
        this.sceneFile = sceneFile;
        this.From(null, "");
    }
    
    // -----------------------------
    // Clone from another scene.
    // -----------------------------
    
    From(scn, fmt = "")
    {
        this.scene_start = (scn && scn.scene_start) || 0;
        
        if (scn && fmt)
        {
            this.sectors = [];
            var sectClass = SceneConverter.CreateClass("CSector", fmt);
            for (const sect of scn.sectors)
            {
                var newSector = new sectClass(this);
                newSector.From(sect, fmt);
                
                this.sectors.push(newSector);
            }
        }
        else
            this.sectors = (scn && scn.sectors) || [];
        
        this.bounding_min = (scn && scn.bounding_min) || [0.0, 0.0, 0.0, 0.0];
        this.bounding_max = (scn && scn.bounding_max) || [0.0, 0.0, 0.0, 0.0];
        
        this.sphere_pos = (scn && scn.sphere_pos) || [0.0, 0.0, 0.0];
        this.sphere_radius = (scn && scn.sphere_radius) || 0.0;
        
        this.unk_a = (scn && scn.unk_a) || 0;
        this.unk_b = (scn && scn.unk_b) || 0;
        this.flags = (scn && scn.flags) || 0;
        this.unk_after_flags = (scn && scn.unk_after_flags) || 0;
        
        this.off_footer = (scn && scn.off_footer) || 0;
        this.off_unkthing =  (scn && scn.off_unkthing) || 0;
        this.off_meshIndices =  (scn && scn.off_meshIndices) || 0;
        this.off_billboards =  (scn && scn.off_billboards) || 0;
        this.off_bigPadding =  (scn && scn.off_bigPadding) || 0;
        this.off_ffPadding =  (scn && scn.off_ffPadding) || 0;
        this.off_eaPadding =  (scn && scn.off_eaPadding) || 0;
        this.off_cSector =  (scn && scn.off_cSector) || 0;
        this.off_cGeom =  (scn && scn.off_cGeom) || 0;
        this.off_sMesh =  (scn && scn.off_sMesh) || 0;
        
        this.unk_footer_val =  (scn && scn.unk_footer_val) || 0;
        
        this.sMesh_count =  (scn && scn.sMesh_count) || 0;
        this.sector_count =  (scn && scn.sector_count) || 0;
    }
    
    // -----------------------------
    // How big is a CGeom? In bytes
    // -----------------------------
    
    GetCGeomSize()
    {
        return 96;
    }
    
    // -----------------------------
    // How big is an sMesh? In bytes
    // -----------------------------
    
    GetSMeshSize()
    {
        if (this.sceneFile.format == "gh3pc")
            return 128;
            
        if (this.sceneFile.format == "ghm")
            return 144;
            
        if (this.sceneFile.format == "ghwtpc" || this.sceneFile.format == "ghwt")
            return 112;
            
        return 144;
    }
    
    // -----------------------------
    // Get a sector by index
    // -----------------------------
    
    GetSectorIndex(id)
    {
        for (var i=0; i<this.sectors.length; i++)
        {
            if (this.sectors[i].checksum == id)
                return i;
        }
        
        return -1;
    }
    
    // -----------------------------
    // Remove a sector by index
    // -----------------------------
    
    RemoveSector(id)
    {
        var sidx = this.GetSectorIndex(id);
        
        if (sidx)
        {
            this.sectors.splice(sidx, 1);
            console.log("Removed sector " + id);
        }
    }
    
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
        
        this.bounding_min = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("Bounding Min: (" + this.bounding_min.join(", ") + ")");
        this.bounding_max = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("Bounding Max: (" + this.bounding_max.join(", ") + ")");
        
        this.sphere_pos = [ r.Float(), r.Float(), r.Float() ];
        console.log("Sphere Pos: (" + this.sphere_pos.join(", ") + ")");
        this.sphere_radius = r.Float();
        console.log("Sphere Radius: " + this.sphere_radius);
        
        this.unk_a = r.UInt16();
        this.unk_b = r.UInt16();
        console.log("Unk A: " + this.unk_a);
        console.log("Unk B: " + this.unk_b);
        
        this.flags = r.UInt32();
        console.log("Flags: 0x" + this.flags.toString(16).padStart(8, "0"));
        this.unk_after_flags = r.UInt32();
        console.log("UnkAfterFlags: " + this.unk_after_flags);
        
        var ptFooter = r.Int32();
        if (ptFooter >= 0)
        {
            this.off_footer = this.sceneFile.off_core + ptFooter;
            console.log("Footer @ " + this.off_footer);
        }
        
        this.unk_footer_val = r.UInt32();
        console.log("UnkFooterVal: " + this.unk_footer_val);
        
        var ptUnkThing = r.Int32();
        if (ptUnkThing >= 0)
        {
            this.off_unkthing = this.sceneFile.off_core + ptUnkThing;
            console.log("Unkthing @ " + this.off_unkthing);
        }
        
        var ptMeshIndices = r.Int32();
        if (ptMeshIndices >= 0)
        {
            this.off_meshIndices = this.sceneFile.off_scene + ptMeshIndices;
            console.log("Mesh Indices @ " + this.off_meshIndices);
        }
        
        this.sMesh_count = r.UInt32();
        console.log("Total sMesh Count: " + this.sMesh_count);
        
        var ptFFPadding = r.Int32();
        if (ptFFPadding >= 0)
        {
            this.off_ffPadding = this.sceneFile.off_scene + ptFFPadding;
            console.log("0xFF Padding @ " + this.off_ffPadding);
        }
        
        r.Chunk(24);
        
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
        
        r.UInt32();
        
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
        
        r.UInt32();
        r.UInt32();
        
        var ptEAPadding = r.Int32();
        if (ptEAPadding >= 0)
        {
            this.off_eaPadding = this.sceneFile.off_scene + ptEAPadding;
            console.log("Internal sMesh Pointers @ " + this.off_eaPadding);
        }
    }
    
    // -----------------------------
    // Read our CSectors.
    // -----------------------------
    
    ReadCSectors()
    {
        var r = this.reader;

        for (var s=0; s<this.sector_count; s++)
        {
            var sectClass = SceneConverter.CreateClass("CSector", this.sceneFile.format);
            var sect = new sectClass(this);
            sect.Deserialize(this.reader);

            this.sectors.push(sect);
        }
    }
    
    // -----------------------------
    // Read our CGeoms.
    // -----------------------------
    
    ReadCGeoms()
    {
        var r = this.reader;

        var geomSize = this.GetCGeomSize();
        console.log("  cGeoms are " + geomSize + " bytes long");
        
        r.Seek(this.off_cGeom);
        
        var meshCount = 0;
        
        for (var s=0; s<this.sectors.length; s++)
        {
            var sector = this.sectors[s];
            
            if (sector.HasCGeom())
            {
                var nextGeom = r.Tell() + geomSize;
                
                var geomClass = SceneConverter.CreateClass("CGeom", SceneConverter.inFormat);
                var geom = new geomClass(this.sectors[s]);
                this.sectors[s].geom = geom;
                geom.Deserialize(r);
                
                // Put it at a position even if it doesn't have an index.
                geom.sMesh_first = geom.sMesh_first || meshCount;
                
                meshCount += geom.sMesh_count;
                
                r.Seek(nextGeom);
            }
        }
    }
    
    // -----------------------------
    // Read our sMeshes.
    // -----------------------------
    
    ReadSMeshes()
    {
        var r = this.reader;

        var smeshSize = this.GetSMeshSize();
        
        console.log("  sMeshes are " + smeshSize + " bytes long");
         
        var sMeshClass = SceneConverter.CreateClass("sMesh", SceneConverter.inFormat);
        
        var meshes = 0;
        
        for (var s=0; s<this.sectors.length; s++)
        {
            if (!this.sectors[s].geom)
                continue;
                
            var geom = this.sectors[s].geom;
                
            // Figure out where we should seek to, based
            // on the cGeom's first sMesh index. We know
            // where the sMeshes start, and therefore can
            // calculate the position based on the size
            // of our sMesh objects.
            
            console.log("Reading mesh " + geom.sMesh_first + ", " + this.off_sMesh);
            
            var meshPos = this.off_sMesh + (smeshSize * geom.sMesh_first);
            r.Seek(meshPos);
            
            for (var m=0; m<geom.sMesh_count; m++)
            {
                var sm = new sMeshClass(this.sectors[s].geom);
                this.sectors[s].geom.meshes.push(sm);
                
                sm.Deserialize(r);
                
                meshes ++;
            }
        }
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
    // Write our scene header.
    // -----------------------------
    
    WriteHeader()
    {
        var w = this.writer;
        
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
        
        w.UInt16(this.unk_a);
        w.UInt16(this.unk_b);
        
        w.UInt32(this.flags);
        w.UInt32(this.unk_after_flags);
        
        // Pointer to footer? We'll write this later.
        this.pt_footer = w.Tell();
        w.Int32(-1);
        
        w.UInt32(this.unk_footer_val);
        
        // Pointer to unkthing, we'll fix this later
        this.pt_unkthing = w.Tell();
        w.Int32(-1);
        
        // Pointer to mesh indices, we'll fix this later
        this.pt_meshIndices = w.Tell();
        w.Int32(-1);
        
        // Total number of sMeshes
        var sMeshCount = 0;
        for (const sect of this.sectors)
        {
            if (sect.geom)
                sMeshCount += sect.geom.meshes.length;
        }
        
        console.log("Total sMeshes: " + sMeshCount);
        w.UInt32(sMeshCount);
        
        // Pointer to FF padding, we'll fix this later
        this.pt_ffPadding = w.Tell();
        w.Int32(-1);
        
        w.Pad(16);
        w.Int32(-1);
        w.UInt32(0);
        
        // Number of sectors
        w.UInt32(this.sectors.length);
        
        // Pointer to CSector list, we'll fix this later
        this.pt_cSector = w.Tell();
        w.Int32(-1);
        
        // Pointer to CGeom list, we'll fix this later
        this.pt_cGeom = w.Tell();
        w.Int32(-1);
        
        w.UInt32(0);
        
        // Pointer to bigPadding, we'll fix this later
        this.pt_bigPadding = w.Tell();
        w.Int32(-1);
        
        // Pointer to sMesh list, we'll fix this later
        this.pt_sMesh = w.Tell();
        w.Int32(-1);
        
        w.Pad(8);
        
        // Pointer to eaPadding, we'll fix this later
        this.pt_eaPadding = w.Tell();
        w.Int32(-1);
    }
    
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
        
        // Regardless, all scenes share the same header.
        this.WriteHeader();
        
        // Now we can write our sectors.
        this.off_cSector = w.Tell();
        w.Seek(this.pt_cSector);
        w.UInt32(this.off_cSector - this.sceneFile.off_scene);
        w.Seek(this.off_cSector);
        
        // Write sector information.
        for (const sect of this.sectors)
            sect.Serialize(w);
            
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
        
        // Big padding time!
        this.off_bigPadding = w.Tell();
        w.Seek(this.pt_bigPadding);
        w.UInt32(this.off_bigPadding - this.sceneFile.off_scene);
        w.Seek(this.off_bigPadding);
        
        // bigPadding, what exactly is this based on?
        // Haven't reached this in IDA yet, most single-sector
        // meshes seem to use a constant value of 32 bytes
        //
        // Object count * 8 is too small, let's use 32 just in case
        // (I would like to know what determines the length of this)
        
        w.Pad(sMesh_index * 32);
        
        // Cool, now write the actual meshes. Remember, these will be in order.
        this.off_sMesh = w.Tell();
        w.Seek(this.pt_sMesh);
        w.UInt32(this.off_sMesh - this.sceneFile.off_scene);
        w.Seek(this.off_sMesh);
        
        for (const sect of this.sectors)
        {
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                    mesh.Serialize(w);
            }
        }
        
        // 0xEA padding time, these are internal sMesh pointers
        this.off_eaPadding = w.Tell();
        w.Seek(this.pt_eaPadding);
        w.UInt32(this.off_eaPadding - this.sceneFile.off_scene);
        w.Seek(this.off_eaPadding);
        
        // Padding amount is sMesh count * 4
        w.Pad(sMesh_index * 4, 0xEA);
        
        // Mesh indices, super simple. In order.
        this.off_meshIndices = w.Tell();
        w.Seek(this.pt_meshIndices);
        w.UInt32(this.off_meshIndices - this.sceneFile.off_scene);
        w.Seek(this.off_meshIndices);
        
        for (var m=0; m<sMesh_index; m++)
            w.UInt32(m);
            
        // FF padding goes here. same as mesh indices, but ff.
        this.off_ffPadding = w.Tell();
        w.Seek(this.pt_ffPadding);
        w.UInt32(this.off_ffPadding - this.sceneFile.off_scene);
        w.Seek(this.off_ffPadding);
        
        for (var m=0; m<sMesh_index; m++)
            w.UInt32(0xFFFFFFFF);
            
        // 0xAA padding to nearest 32 bytes
        w.PadToNearest(32, 0xAA);
        
        // ---------------------
        
        console.log("UV...");
        
        var uv_posses = [];
        var uv_buffers = [];
        var uv_pos = 0;
        
        // Cool, now we can serialize our UV's.
        for (var s=0; s<this.sectors.length; s++)
        {
            var sect = this.sectors[s];
            
            var pct = Math.floor((s / this.sectors.length) * 100.0);
            console.log(pct.toString() + "%: Serializing UV's: " + sect.checksum + "...");
            
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                {
                    if (!uv_pos)
                        uv_pos = w.Tell();
                          
                    var nw = new Writer();
                    var uv_result = mesh.SerializeUVs(nw) || {};
                    uv_buffers.push(nw.buffer);
                    
                    uv_posses.push({
                        uv_pos: uv_pos - this.sceneFile.off_scene,
                        uv_stride: uv_result.uv_stride,
                        uv_length: uv_result.uv_length,
                        mesh: mesh
                    });
                    
                    uv_pos += nw.buffer.length;
                }
            }
        }
        
        var post_pos = w.Tell();
        
        for (const ps of uv_posses)
        {
            w.Seek(ps.mesh.pt_uvs);
            w.UInt32(ps.uv_pos);
            
            w.Seek(ps.mesh.pt_uvStride);
            w.UInt8(ps.uv_stride);
            
            w.Seek(ps.mesh.pt_uvLength);
            w.UInt32(ps.uv_length);
        }
        
        w.Seek(post_pos);
        
        w.Combine(Buffer.concat(uv_buffers));
        
        // Now time for faces!
        console.log("Faces...");
        
        w.PadToNearest(32, 0xEE);
        
        var face_posses = [];
        var face_buffers = [];
        var face_pos = 0;
        
        for (var s=0; s<this.sectors.length; s++)
        {
            var sect = this.sectors[s];
            
            var pct = Math.floor((s / this.sectors.length) * 100.0);
            console.log(pct.toString() + "%: Serializing Faces: " + sect.checksum + "...");
            
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                {
                    if (!face_pos)
                        face_pos = w.Tell();
                        
                    var nw = new Writer();
                    mesh.SerializeFaces(nw);
                    
                    face_posses.push({
                        mesh: mesh,
                        face_pos: face_pos - this.sceneFile.off_scene
                    });
                    
                    face_buffers.push(nw.buffer);
                    face_pos += nw.buffer.length;
                }
            }
        }
        
        var post_pos = w.Tell();
        
        for (const pos of face_posses)
        {
            w.Seek(pos.mesh.pt_faces);
            w.UInt32(pos.face_pos);
        }
        
        w.Seek(post_pos);
        
        w.Combine(Buffer.concat(face_buffers));
        
        console.log("Weighted verts...");
        
        // Vertex time, oh boy
        for (const sect of this.sectors)
        {
            if (sect.geom)
            {
                for (const mesh of sect.geom.meshes)
                {
                    if (mesh.HasWeights())
                        mesh.SerializeVertices(w);
                }
            }
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    GetSector(sectorName)
    {
        for (const sector of this.sectors)
        {
            if (sector.checksum.toLowerCase() == sectorName.toLowerCase())
                return sector;
        }
        
        return null;
    }
    
    GetMaterial(matName)
    {
        if (!this.sceneFile)
            return;
            
        for (const mat of this.sceneFile.materials)
        {
            if (mat.checksum.toLowerCase() == matName.toLowerCase())
                return mat;
        }
        
        return null;
    }
}

module.exports = CScene;
