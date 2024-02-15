// ----------------------------------------------
//
//  THUG2 SCENE FILE
//      Tony Hawk's Underground 2 scene file.
//
// ----------------------------------------------

const SceneFile = require('./SceneFile.js');

class THUG2_SceneFile extends SceneFile
{
    // -----------------------------
    // Reads the actual file.
    // -----------------------------
    
    ReadFileCore()
    {
        var r = this.reader;
        r.LE = true;
        
        var ones = [r.UInt32(), r.UInt32(), r.UInt32()];
        
        if (ones[0] != 1 && ones[1] != 1 && ones[2] != 1)
        {
            console.log("Not a valid THUG / THUG2 scene.");
            return;
        }
        
        var r = this.reader;
        
        this.off_core = r.Tell();
        
        this.ReadMaterialList();
        console.log("")
    }
    
    // -----------------------------
    // Read material list.
    // -----------------------------
    
    ReadMaterialList()
    {
        var r = this.reader;
        console.log("-- Materials ------------");
        
        var material_count = r.UInt32();
        console.log("Material count: " + material_count);
        
        var matClass = SceneConverter.CreateClass("Material", this.format);
        
        for (var m=0; m<material_count; m++)
        {
            var mat = new matClass(this);
            mat.Deserialize(r);
            
            this.materials.push(mat);
        }
        
        this.ReadCScene();
    }
    
    // -----------------------------
    // Write the whole file.
    // -----------------------------
    
    WriteCore()
    {
        console.log("THUG2 writing not supported.");
    }
}

module.exports = THUG2_SceneFile;
