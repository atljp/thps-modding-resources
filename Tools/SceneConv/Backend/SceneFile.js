// ----------------------------------------------
//
//  SCENE FILE
//      Covers an entire file.
//
// ----------------------------------------------

const Disqualifiers = require('./Disqualifiers.js');
const CScene = require('./CScene.js');
const Material = require('./Material.js');
const Reader = require('./Reader.js');
const Writer = require('./Writer.js');
const fs = require('fs');

class SceneFile
{
    constructor(copy_from)
    {
        this.format = "pc";
        this.platform = (copy_from && copy_from.platform) || "pc";
        
        this.off_scene = (copy_from && copy_from.off_scene) || 0;
        this.off_core = (copy_from && copy_from.off_core) || 0;
        this.off_disquals = (copy_from && copy_from.off_disquals) || 0;
        this.off_materials = (copy_from && copy_from.off_materials) || 0;
        this.off_materials_end = (copy_from && copy_from.off_materials_end) || 0;
        
        this.scene = (copy_from && copy_from.scene) || null;
        
        this.material_version = (copy_from && copy_from.material_version) || 0
        this.materials = (copy_from && copy_from.materials) || [];
        
        this.disquals = (copy_from && copy_from.disquals) || null;
    }
    
    // -----------------------------
    // Has a material?
    // -----------------------------
    
    GetMaterialIndex(id)
    {
        for (var i=0; i<this.materials.length; i++)
        {
            if (this.materials[i].checksum == id)
                return i;
        }
        
        return -1;
    }
    
    // -----------------------------
    // Remove a material by its ID.
    // -----------------------------
    
    RemoveMaterial(id)
    {
        var matIdx = this.GetMaterialIndex(id);
        
        if (matIdx >= 0)
        {
            console.log("Removed material " + id);
            this.materials.splice(matIdx, 1);
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  M E R G E
    //      MERGES WITH ANOTHER SCENE FILE
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    Merge(copyFile)
    {
        console.log("Merging file...");
        
        if (!copyFile.scene || !copyFile.materials)
            return;
            
        var newMats = [];
        
        for (const mat of copyFile.materials)
        {
            var ourMat = this.GetMaterialIndex(mat.checksum);
            
            if (ourMat >= 0)
                this.RemoveMaterial(mat.checksum);

            this.materials.push(mat);
        }
        
        // ----------
        
        for (const sector of copyFile.scene.sectors)
        {
            var sectIdx = this.scene.GetSectorIndex(sector.checksum);
            
            if (sectIdx >= 0)
                this.scene.RemoveSector(sector.checksum);

            this.scene.sectors.push(sector);
        }
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
    
    Deserialize(filePath, format)
    {
        this.format = format;
        this.reader = new Reader( fs.readFileSync(filePath) );
                
        // -------
        
        this.ReadFileCore();
            
        console.log("");
        console.log("FINISHED DESERIALIZING");
        console.log("  Materials: " + ((this.materials && this.materials.length) || 0));
        console.log("  Sectors: " + ((this.scene && this.scene.sectors.length) || 0));
        console.log("  Core @ " + this.off_core);
        console.log("  Materials @ " + this.off_materials);
        console.log("");
    }
    
    // -----------------------------
    // Reads the actual file.
    // -----------------------------
    
    ReadFileCore()
    {
        var r = this.reader;
        
        this.off_disquals = r.UInt32();
        console.log("Disqual Offset: " + this.off_disquals);
        
        // FAAABACA x 7
        r.Chunk(28);
        
        // Peek at our next value.
        // If it's a 0, then it's probably WoR-like.
        // Each chunk in a WoR file seems to start at 128-byte boundary?
        
        var peek = r.UInt32();
        r.Seek(r.Tell() - 4);
        
        if (peek == 0)
            r.Seek(128);
        
        this.ReadCore();
        
        if (this.off_disquals)
            this.off_disquals += this.off_core;
        
        // Read disqual block if we can
        
        if (this.off_disquals > 0)
            this.ReadDisquals();
    }
    
    // -----------------------------
    // Read disqualifiers
    // -----------------------------
    
    ReadDisquals()
    {
        var r = this.reader;
        
        r.Seek(this.off_disquals);
        
        var dq = new Disqualifiers(this);
        dq.Deserialize(r);
    }
    
    // -----------------------------
    // Read material list.
    // -----------------------------
    
    ReadMaterialList()
    {
        var r = this.reader;
        console.log("-- Materials ------------");
        
        this.off_materials = r.Tell();
        this.material_version = r.UInt8();
        console.log("Material Version: " + this.material_version);
        r.UInt8();
        
        var material_count = r.UInt16();
        console.log("Material count: " + material_count);
        
        var material_list_size = r.UInt32();
        console.log("Material list size: " + material_list_size);
        
        this.off_materials_end = this.off_materials + material_list_size;
        
        r.UInt32();
        r.UInt32();
        
        var matClass = SceneConverter.CreateClass("Material", this.format);
        
        for (var m=0; m<material_count; m++)
        {
            var mat = new matClass(this);
            mat.Deserialize(r);
            
            this.materials.push(mat);
        }
        
        // ----
        
        r.Seek(this.off_materials_end);
        console.log("  List ended at " + this.off_materials_end);
    }
    
    // -----------------------------
    // Read the core CScene.
    // -----------------------------
    
    ReadCScene()
    {
        var sceneClass = SceneConverter.CreateClass("CScene", this.format);
        this.scene = new sceneClass(this);
        this.scene.Deserialize(this.reader);
    }
    
    // -----------------------------
    // Read SkinFileCore.
    // -----------------------------
    
    ReadCore()
    {
        var r = this.reader;
        
        this.off_core = r.Tell();
        
        this.ReadMaterialList();
        console.log("")
        
        // Now we should be at our BABEFACE marker.
        var babe = r.UInt32();
        r.Seek(r.Tell() - 4);
        
        // If 0xBABEFACE then this is GHWT.
        if (babe == 0xBABEFACE)
        {
            r.UInt32();
            
            var pad_count = r.UInt32();
            r.Chunk(pad_count - 4);
            r.UInt32();
        }
        
        // Otherwise, this is WoR.
        else
            r.SkipToNearest(128);
            
        this.off_scene = r.Tell();
        this.ReadCScene();
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
    
    Serialize(filePath, format)
    {
        var start_time = SceneConverter.TimeStart();
        
        this.format = format;
        this.writer = new Writer();
 
        this.WriteCore();
        
        console.log("Serializing took " + SceneConverter.TimeEnd(start_time) + " seconds.");

        fs.writeFileSync(filePath, this.writer.buffer);
    }
    
    // -----------------------------
    // Write the whole file.
    // -----------------------------
    
    WriteCore()
    {
        var w = this.writer;
        
        // Our disqualifier offset, relative to the core start.
        // We will fix this up later.
        
        w.UInt32();
        
        for (var f=0; f<7; f++)
            w.UInt32(0xFAAABACA);
            
        if (!this.scene)
        {
            console.log("Had no scene.");
            return;
        }
        
        this.off_core = w.Tell();
        this.off_materials = w.Tell();
        
        this.WriteMaterialList();
        
        w.UInt32(0xBABEFACE);
        
        // Use known number of padding for now.
        var paddingCount = 24;
        w.UInt32(paddingCount);
        w.Pad(paddingCount-4);
        w.UInt32(234);
        
        // The scene starts here.
        
        if (this.scene)
        {
            var newSceneClass = SceneConverter.CreateClass("CScene", SceneConverter.outFormat);
            var newScene = new newSceneClass(this);
            newScene.From(this.scene, SceneConverter.outFormat);
            
            this.off_scene = w.Tell();
            this.newScene.Serialize(w);
        }
    }
    
    // -----------------------------
    // Write VC wibble data if necessary.
    // -----------------------------
    
    WriteMaterialVCWibbleData() {}
    
    // -----------------------------
    // Write material list.
    // -----------------------------
    
    WriteMaterialList()
    {
        var w = this.writer;
        
        w.UInt8(this.material_version);
        w.UInt8(0x10);
        w.UInt16(this.materials.length);
        
        // Material list size, fix later
        var pt_matSize = w.Tell();
        w.UInt32(0);
        
        w.UInt32(0x10);
        w.Int32(-1);
        
        // Now serialize our materials.

        var newMats = [];

        for (const mat of this.materials)
        {
            var new_mat_class = SceneConverter.CreateClass("Material", SceneConverter.outFormat);
            var new_mat = new new_mat_class(this);
            new_mat.From(mat);
            
            new_mat.Serialize(w);
            newMats.push(new_mat)
        }
        
        // Write UV wibbles.
        for (const nm of newMats)
            nm.SerializeWibbles(w);
            
        // Write VC wibbles.
        this.WriteMaterialVCWibbleData();
        
        // Write animation data.
        for (const nm of newMats)
            nm.SerializeAnimation(w);
            
        var pt_postMats = w.Tell();
        
        // Fix up material list size
        w.Seek(pt_matSize);
        w.UInt32(pt_postMats - this.off_materials);
        w.Seek(pt_postMats);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    GetScene() { return this.scene; }
}

module.exports = SceneFile;
