// ----------------------------------------------
// THUG2 -> THAW: BATCH CONVERTER
// Converts models from THUG2 to THAW, weighted!
// ----------------------------------------------

const fs = require('fs');
const path = require('path');
const Converter = require( path.join(__dirname, '..', 'Backend', 'Converter.js') );

function Convert()
{
    console.log("** THUG2 -> THAW **");
    
    var inDir = path.join(__dirname, 'in');
    var outDir = path.join(__dirname, 'out');
    
    if (fs.existsSync(outDir))
        fs.rmSync(outDir, {recursive: true, force: true});
        
    fs.mkdirSync(outDir);
    
    // Read files.
    
    var files = fs.readdirSync(inDir);
    var toConvert = [];
    
    for (const file of files)
    {
        if (file.toLowerCase().indexOf(".skin.xbx") == -1)
            continue;
            
        toConvert.push(path.join(inDir, file));
    }
    
    console.log("Converting " + toConvert.length + " meshes...");
    
    for (const tc of toConvert)
    {
        var outFile = path.join(outDir, path.basename(tc));
        var spl = outFile.split(".");
        spl[spl.length-1] = "wpc";
        outFile = spl.join(".");
        
        var conv = new Converter();
        conv.Convert(tc, outFile, "thug2", "thaw", {});
    }
    
    console.log("");
    console.log("--------------------------");
    console.log("!! DONE !!");
    console.log("Converted " + toConvert.length + " meshes.");
    console.log("--------------------------");
}

Convert();
