// ----------------------------------------------
//
//  CONVERTER
//      The main converter.
//
// ----------------------------------------------

const path = require('path');
const fs = require('fs');
const Writer = require('./Writer.js');

class Converter
{
    constructor()
    {
        this.constants = require('./Constants.js');
        this.texHandler = new (require('./Tex/TexHandler.js'))();
        
        global.SceneConverter = this;
        this.currentFile = null;
        
        this.RegisterHacks();
    }
    
    // -----------------------------
    // Register hacks.
    // -----------------------------
    
    RegisterHacks()
    {
        this.hacks = [];
        
        console.log("Registering hacks...");
        
        var hackDir = path.join(__dirname, 'Hacks');
        if (!fs.existsSync(hackDir))
            return;
        
        var files = fs.readdirSync(hackDir);
        
        for (const file of files)
        {
            var fPath = path.join(hackDir, file);
            
            if (file.indexOf(".js") == -1)
                continue;
                
            // Do not pull in hack.
            if (file == 'Base.js')
                continue;
                
            var hackClass = require(fPath);
            this.hacks.push(new hackClass());
        }
    }
    
    // -----------------------------
    // Call a function on all hacks.
    // -----------------------------
    
    TriggerHacks(funcName)
    {
        console.log("Calling hack func: " + funcName);
        
        for (const hack of this.hacks)
        {
            var func = hack[funcName];
            
            if (func)
            {
                func = func.bind(hack);
                func();
            }
        }
    }
    
    // -----------------------------
    // Create a game-specific class file.
    // Uses game file if it exists.
    // -----------------------------
    
    CreateClass(className, classFormat = "ghwtpc")
    {
        var obj;
        
        // See if game-specific class exists.
        var gameClass = path.join(__dirname, classFormat.toLowerCase() + "_" + className + ".js");
        
        if (fs.existsSync(gameClass))
            obj = require(gameClass);
        else
            obj = require( path.join(__dirname, className + ".js") );
            
        return obj;
    }
    
    // -----------------------------
    // Convert a scene file.
    // -----------------------------
    
    async Convert(inPath, outPath, inFormat, outFormat, options = {})
    {
        this.inFormat = inFormat;
        this.outFormat = outFormat;
        
        this.options = options;
        
        if (options && options.donorTex)
        {
            console.log("Reading donor .tex...");
            
            this.donorTex = new TexDictionary(this);
            await this.donorTex.Deserialize(options.donorTex, "ghwtpc");
        }
        else
            this.donorTex = null;
        
        console.log("[" + inFormat + "] In: " + inPath);
        console.log("[" + outFormat + "] Out: " + outPath);
        
        console.log("---------------------");
        console.log("Deserializing...");
        console.log("---------------------");
        console.log("");
        
        var sceneFileClass = this.CreateClass("SceneFile", inFormat);
        var sf = new sceneFileClass();
        this.currentFile = sf;
        
        sf.Deserialize(inPath, inFormat);
        
        this.TriggerHacks("PostDeserialize");
        
        // Do our options have pull-in files? If so, we will
        // merge these with our main file. This is useful for
        // combining different scene files for fixed geometry, etc.
        
        if (options.extraFiles && options.extraFiles.length)
        {
            console.log("---------------------");
            console.log("Pulling in extra files...");
            console.log("---------------------");
            console.log("");
            
            for (const eFile of options.extraFiles)
            {
                var sceneFileClass = this.CreateClass("SceneFile", "ghwtpc");
                var sfB = new sceneFileClass();
                
                sfB.Deserialize(eFile, "ghwtpc");
                
                sf.Merge(sfB);
            }
        }
        
        console.log("---------------------");
        console.log("Serializing...");
        console.log("---------------------");
        console.log("");
        
        var outFileClass = this.CreateClass("SceneFile", outFormat);
        var of = new outFileClass(sf);
        of.Serialize(outPath, outFormat);
        
        this.currentFile = null;
        
        // ----------------------------
        // Convert textures if necessary.
        // ----------------------------
        
        var inDir = path.dirname(inPath);
        var outDir = path.dirname(outPath);
        
        var inFile = path.basename(inPath);
        var outFile = path.basename(outPath);
        
        var iSpl = inFile.split(".");
        var oSpl = outFile.split(".");
        
        iSpl[1] = "tex";
        oSpl[1] = "tex";
        
        var inTex = path.join(inDir, iSpl.join("."));
        var outTex = path.join(outDir, oSpl.join("."));
        
        if (fs.existsSync(inTex))
        {
            var passthrough = false;
            
            if (inFormat == "gh3pc")
            {
                if (options.extraFiles && options.extraFiles.length)
                    passthrough = false;
                else
                    passthrough = true;
            }
            
            // Just straight-up copy the .tex file.
            if (passthrough)
            {
                console.log("Passing through .tex file...");
                fs.copyFileSync(inTex, outTex);
            }
            
            // Otherwise, convert
            else
            {
                var texclass = this.CreateClass("TexDictionary", inFormat);
                var td = new texclass(this);
                await td.Deserialize(inTex, inFormat);
                
                // If we pulled in files, let's merge them
                if (options.extraFiles && options.extraFiles.length)
                {
                    for (const eFile of options.extraFiles)
                    {
                        var eDir = path.dirname(eFile);
                        var eSpl = path.basename(eFile).split(".");
                        
                        eSpl[1] = "tex";
                        
                        var eTex = path.join(eDir, eSpl.join("."));
                        
                        if (fs.existsSync(eTex))
                        {
                            console.log("Pulling in " + eSpl.join(".") + "...");
                            
                            var td_pull = new TexDictionary(this);
                            await td_pull.Deserialize(eTex, "ghwtpc");
                            
                            td.Merge(td_pull);
                        }
                    }
                }
                
                var newDictClass = this.CreateClass("TexDictionary", outFormat);
                var newDict = new newDictClass(this);
                newDict.From(td);
                
                newDict.Serialize(outTex, outFormat);
            }
        }
        
        // ----------------------------
        // Convert collision if necessary.
        // ----------------------------
        
        iSpl[1] = "col";
        oSpl[1] = "col";
        
        var inCol = path.join(inDir, iSpl.join("."));
        var outCol = path.join(outDir, oSpl.join("."));
        
        if (fs.existsSync(inCol))
        {
            console.log("Converting collision...");
            
            var colClass = this.CreateClass("Collision", inFormat);
            var col = new colClass(this);
            col.Deserialize(inCol, inFormat);
            
            var newColClass = this.CreateClass("Collision", outFormat);
            var newCol = new newColClass(this);
            newCol.From(col);
            
            var w = new Writer();
            newCol.Serialize(w);
            
            fs.writeFileSync(outCol, w.buffer);
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // ----------------------------
    // Get current time.
    // For profiling.
    // ----------------------------
    
    TimeStart()
    {
        return Date.now();
    }
    
    TimeEnd(start_time)
    {
        var msDiff = Date.now() - start_time;
        
        return (msDiff / 1000.0);
    }
    
    // ----------------------------
    // Get the scene file.
    // ----------------------------
    
    GetSceneFile()
    {
        return this.currentFile;
    }
    
    // ----------------------------
    // Get the scene.
    // ----------------------------
    
    GetScene()
    {
        return this.GetSceneFile().GetScene();
    }
}

module.exports = Converter;
