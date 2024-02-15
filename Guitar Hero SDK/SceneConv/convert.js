// ----------------------------------------------
//
//  NEVERSOFT SCENE CONVERTER
//      Converts CScene files between consoles.
//
// ----------------------------------------------

const fs = require('fs');
const path = require('path');
const Converter = require('./Backend/Converter.js')

const validFormats = ["ghm", "ghwtpc", "ghwt", "gh3pc", "gh5", "thug", "thug2", "thaw"];
const extensions = ["xbx", "wpc", "xen"];

function ProcessArgs()
{
    var args = process.argv;
    args.shift();
    args.shift();
    
    if (args.length < 1)
    {
        console.log("Please specify a file to convert.");
        return;
    }
    
    var inFile = args.shift();
    if (!path.isAbsolute(inFile))
        inFile = path.join(__dirname, inFile);
        
    if (!fs.existsSync(inFile))
    {
        console.log(inFile + " does not exist.");
        return;
    }
    
    // We need to specify an input and output format
    if (args.length < 2)
    {
        console.log("Please specify an INPUT and OUTPUT format.");
        console.log("  Valid formats: [" + validFormats.join(", ") + "]");
    }
    
    var inFormat = args.shift().toLowerCase();
    var outFormat = args.shift().toLowerCase();
    
    var validIn = false;
    var validOut = false;
    
    for (const form of validFormats)
    {
        if (inFormat == form)
            validIn = true;
            
        if (outFormat == form)
            validOut = true;
    }
    
    if (!validIn)
    {
        console.log("'" + inFormat + "' was not a valid input format.");
        console.log("  Valid formats: [" + validFormats.join(", ") + "]");
        return;
    }
    
    if (!validOut)
    {
        console.log("'" + outFormat + "' was not a valid output format.");
        console.log("  Valid formats: [" + validFormats.join(", ") + "]");
        return;
    }
    
    // Do not allow conversion between engines.
    var legacyIn = (inFormat == "thug2" || inFormat == "thaw" || inFormat == "thug");
    var legacyOut = (outFormat == "thug2" || outFormat == "thaw" || inFormat == "thug");
    
    if (legacyIn != legacyOut)
    {
        console.log("Conversion between THUG2/THAW and GH engines is not supported.");
        return;
    }
    
    // ------------------------------------
    
    var extraFiles = [];
    var donorTex = null;
    
    if (args.length)
    {
        while (args.length)
        {
            var param = args.shift();
            var tlc = param.toLowerCase();
            
            if (tlc == '-pull')
            {
                if (args.length <= 0)
                {
                    console.log("Please specify a scene file after using -pull.");
                    return;
                }
                
                var pullPath = args.shift();
                
                if (!path.isAbsolute(pullPath))
                    pullPath = path.join(__dirname, pullPath);
                    
                if (!fs.existsSync(pullPath))
                {
                    console.log(pullPath + " does not exist.");
                    return;
                }
                
                extraFiles.push(pullPath);
            }
            
            else if (tlc == '-donortex')
            {
                if (args.length <= 0)
                {
                    console.log("Please specify a donor .tex file after using -pull.");
                    return;
                }
                
                donorTex = args.shift();
                
                if (!path.isAbsolute(donorTex))
                    pullPath = path.join(__dirname, donorTex);
                    
                if (!fs.existsSync(donorTex))
                {
                    console.log(donorTex + " does not exist.");
                    return;
                }
            }
        }
    }
    
    // ------------------------------------
    
    // Decide our out path
    var dir = path.dirname(inFile);
    var file = path.basename(inFile);
    var spl = file.split(".");
    spl[0] += "_" + outFormat;
    
    // Add extension if it doesn't have it!
    var exten = spl.pop();
    var hadExtension = false;
    var desiredExtension;
    
    switch (outFormat)
    {
        case "thaw":
            desiredExtension = "wpc";
            break;
        case "thug2":
            desiredExtension = "xbx";
            break;
        default:
            desiredExtension = "xen";
            break;
    }
    
    // Wasn't a valid extension. Put it back!
    if (!extensions.includes(exten.toLowerCase()))
        spl.push(desiredExtension);

    spl.push(desiredExtension);
    
    var outPath = path.join(dir, spl.join("."));
    
    var conv = new Converter();
    conv.Convert(inFile, outPath, inFormat, outFormat, {extraFiles: extraFiles, donorTex: donorTex});
}

ProcessArgs();
