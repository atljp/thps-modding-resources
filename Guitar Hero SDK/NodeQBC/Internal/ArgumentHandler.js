// ---------------------------------------------------
//
//	ARGUMENT HANDLER
//	Handles command-line arguments.
//
// ---------------------------------------------------

const fs = require('fs');
const path = require('path');

class ArgumentHandler
{
    constructor(qbcFilename)
    {
        this.qbcFile = qbcFilename;
        this.qbcDir = path.dirname(qbcFilename);
        
        // Operations we can perform
        this.commands = [];
        
        // Last command we executed
        this.lastCommand = null;
        
        this.AddCommand("compile", "c", "CMD_Compile", "Compiles a .q file.");
        this.AddCommand("decompile", "d", "CMD_Decompile", "Decompiles a .qb file.");
        this.AddCommand("help", "h", "CMD_Help", "Shows help.");
    }
    
    //-----------------------
    // Finds a command by long name or short name
    //-----------------------
    
    FindCommand(longText = "", shortText = "")
    {
        var ltc = longText.toLowerCase();
        var stc = shortText.toLowerCase();
        
        for (const cmd of this.commands)
        {
            if (ltc && cmd.longText.toLowerCase() == ltc)
                return cmd;
                
            if (stc && cmd.shortText == stc)
                return cmd;
        }
        
        return null;
    }
    
    //-----------------------
    // Adds a command that we can use.
    //-----------------------
    
    AddCommand(longText, shortText, funcName, description = "")
    {
        if (this.FindCommand(longText, shortText))
        {
            this.Fail("Failed to add command: " + longText);
            return;
        }
        
        var cmd = {longText: longText, shortText: shortText, funcName: funcName, description: description};
        this.commands.push(cmd);
    }
    
    //-----------------------
    // Fail parsing commands.
    // Generally shows help.
    //-----------------------
    
    Fail(message)
    {
        console.error(message);
        console.log("")
        this.ShowCommandHelp(this.lastCommand);
    }
    
    //-----------------------
    // Attempt to handle command-line arguments.
    //-----------------------
    
    Handle()
    {
        var args = process.argv;
        
        // First, let's see if our QBC file
        // was even referenced in the arguments.
        //
        // If not, then QBC was probably required
        // from another module and is not standalone.
        
        var wasStandalone = false;
        
        while (args.length)
        {
            var param = args.shift();
            
            if (param == this.qbcFile)
            {
                wasStandalone = true;
                break;
            }
        }
        
        if (!wasStandalone)
            return;
            
        // Our first argument must ALWAYS be a command.
        
        if (args.length < 1)
        {
            this.Fail("Please specify a command.");
            return;
        }
        
        // So let's get our command.
        
        var cmdWord = args.shift();
        var cmd = this.FindCommand(cmdWord, cmdWord);
        
        if (!cmd)
        {
            this.Fail("Command '" + cmdWord + "' is not a valid command.");
            return;
        }
        
        // At this point, we found our command.
        // Execute our function.
        
        var func = this[cmd.funcName];
        
        if (func)
        {
            var bound = func.bind(this);
            bound(args);
        }
        else
            this.Fail("Had no command function: " + cmd.funcName);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    //-----------------------
    // Shows help for a command
    //-----------------------
    
    ShowCommandHelp(cmd)
    {
        // If our last command has a _Help function,
        // then we'll use that for help. Otherwise,
        // we'll use our generic help function.
        
        var helpFunc = this["ShowGenericHelp"];
        
        if (cmd && cmd.funcName)
        {
            var hFunc = this[cmd.funcName + "_Help"];
            if (hFunc)
                helpFunc = hFunc;
        }
        
        if (helpFunc)
        {
            var bound = helpFunc.bind(this);
            bound();
        }
    }
    
    //-----------------------
    // Shows generic help.
    //-----------------------
    
    ShowGenericHelp()
    {
        console.log("-- NodeQBC Help: ---------");
        console.log("NodeQBC is used for compiling / decompiling code files from Neversoft's Guitar Hero engine.");
        console.log("");
        console.log("Usage:");
        console.log("  node " + path.basename(this.qbcFile) + " COMMAND [OPTIONS]");
        console.log("    ( Commands can be called from their long names (compile) or their shorthand (c) )");
        console.log("");
        console.log("Available commands:");
        
        for (const cmd of this.commands)
        {
            console.log("  " + cmd.longText + " (" + cmd.shortText + ") - " + cmd.description);
        }
        
        console.log("");
        console.log("Use \"help COMMAND\" for more info about a specific command.");
    }
    
    CMD_Help(args)
    {
        if (args.length > 0)
        {
            var param = args.shift();
            var cmd = this.FindCommand(param, param);
            
            if (!cmd)
            {
                this.Fail("'" + param + "' is not a valid command.");
                return;
            }
            
            console.log("-- Command Help: " + cmd.longText + " (" + cmd.shortText + ") ------");
            console.log("");
            this.ShowCommandHelp(cmd);
            return;
        }
        
        this.ShowGenericHelp();
    }
    
    //-----------------------
    // Shared function for handling
    // compiling or decompiling.
    //-----------------------
    
    CMD_CompileDecompile_Core(args, isCompile = true)
    {
        // Let's create a set of options to initialize QBC, and
        // a set of options to use for the job.
        
        var data = {
            qbcOptions: {noKeyFiles: true},
            comOptions: {},
            sourceFiles: [],
            outputPath: ""
        };
        
        // Loop through our args and process certain options.
        
        while (args.length)
        {
            var param = args.shift();
            
            // Likely an argument.
            if (param.startsWith("-"))
            {
                switch (param)
                {
                    // verbose: Allows debug logging.
                    case "--verbose":
                    case "-v":
                        data.qbcOptions.debug = true;
                        data.comOptions.debug = true;
                        break;
                        
                    // silent: Does not output anything.
                    case "--silent":
                    case "-s":
                        data.qbcOptions.silent = true;
                        break;
                        
                    // game: Sets the target game.
                    case "--game":
                    case "-g":
                    
                        if (args.length < 1)
                        {
                            this.Fail("Please specify a game ID.");
                            return null;
                        }
                    
                        data.comOptions.game = args.shift();
                        break;
                        
                    // output: Sets desired output path.
                    case "--output":
                    case "-o":
                    
                        if (args.length < 1)
                        {
                            this.Fail("Please specify an output path.");
                            return null;
                        }
                    
                        data.outputPath = args.shift();
                        
                        if (!path.isAbsolute(data.outputPath))
                            data.outputPath = path.join(process.cwd(), data.outputPath);
                            
                        break;
                        
                    default:
                        this.Fail("Unknown compiler option '" + param + "'.");
                        return null;
                        break;
                }
            }
            
            // Probably a path.
            else
            {
                // Now, we need to see if the file even exists.
                // If it's relative then we append it to the working directory.
                
                if (!path.isAbsolute(param))
                {
                    var wd = process.cwd();
                    param = path.join(wd, param);
                }
                
                if (!fs.existsSync(param))
                {
                    this.Fail( "The " + (isCompile ? ".q source" : ".qb code") + " file '" + param + "' did not exist." );
                    return null;
                }
                
                // Guess output path from filename.
                // This uses .qb.xen as the extension.
                
                var shorthand = path.basename(param).split(".")[0];
                var outExten = isCompile ? ".qb" : ".q";
                
                var oPath = path.join( path.dirname(param), shorthand + outExten );
                
                data.sourceFiles.push([param, oPath]);
            }
        }
        
        // Ensure that platform extension exists for compiling files.
        if (isCompile)
        {
            var exten = (data.comOptions.game && data.comOptions.game == "thaw") ? "wpc" : "xen";
            
            for (var s=0; s<data.sourceFiles.length; s++)
            {
                var outPath = data.sourceFiles[s][1];
                if (!outPath.toLowerCase().endsWith(exten))
                    data.sourceFiles[s][1] = outPath + "." + exten;
            }
        }
        
        // If we haven't specified a game, attempt to use
        // THAW for .wpc files.
        
        else
        {
            if (!data.comOptions.game)
            {
                for (const sf of data.sourceFiles)
                {
                    if (sf[0].endsWith("wpc"))
                    {
                        data.comOptions.game = "thaw";
                        break;
                    }
                }
            }
        }
        
        // If we have a desired output path, we can only
        // use it if we're compiling a single file. Obviously,
        // we can't specify output for multiple files.
        
        if (data.outputPath)
        {
            if (data.sourceFiles.length > 1)
            {
                this.Fail("--output can only be used if " + (isCompile ? "compiling" : "decompiling") + " a single file.");
                return null;
            }
            
            // Set output path.
            data.sourceFiles[0][1] = data.outputPath;
        }
        
        return data;
    }
    
    //-----------------------
    // Decompile a .qb.xen file.
    //-----------------------
    
    CMD_Decompile(args)
    {
        if (args.length < 1)
        {
            this.Fail("Please specify a .qb file to compile.");
            return;
        }
        
        var cmdData = this.CMD_CompileDecompile_Core(args, false);
        
        if (!cmdData)
            return;
            
        // We have a list of .qb files we want to decompile.
        // Let's initialize QBC.
        
        require(this.qbcFile)(cmdData.qbcOptions);
        
        // Finally, let's decompile all of our source files.
        
        for (const sf of cmdData.sourceFiles)
        {
            var inPath = sf[0];
            var outPath = sf[1];
            
            var res = QBC.Decompile(inPath, outPath, cmdData.comOptions);
            
            if (res.Failed())
            {
                QBC.PrintWarnings(res);
                return;
            }
        }
        
        if (!cmdData.qbcOptions.silent)
            console.log(cmdData.sourceFiles.length + " " + (cmdData.sourceFiles.length != 1 ? "files" : "file") + " decompiled successfully.")
    }
    
    //-----------------------
    // Compile a .q file.
    //-----------------------
    
    CMD_Compile_Help()
    {
        var sh = path.basename(this.qbcFile);
        
        console.log("The 'compile' command is used to compile QScript code from a source (.q) format to a binary (.qb) format.");
        console.log("");
        
        console.log("Usage:");
        console.log("  node " + sh + " compile [OPTIONS] INPUT");
        console.log("")
        
        console.log("The INPUT parameter can be several things:");
        console.log("  - A single file (file.q)");
        console.log("  - A list of files (filea.q fileb.q filec.q)");
        //~ console.log("  - A folder path");
        console.log("");
        
        console.log("Compiler Options:");
        console.log("  --verbose    -v")
        console.log("     Enables verbose debugging.")
        console.log("  --silent     -s")
        console.log("     Prevents all logging, compiles silently.")
        console.log("  --output     -o")
        console.log("     Specifies an output file to use for the compiled result.")
        console.log("     This command ONLY works when compiling a single file.")
        console.log("  --game       -g")
        console.log("     Sets the game to compile for. Specify the game after.")
        console.log("     By default, 'ghwt' is used for the game type.")
        console.log("     The following game ID's are supported:")
        console.log("         ghwt");
        console.log("         gh3");
        console.log("         thaw");
        console.log("         thug2");
        console.log("");
        console.log("  A compiler option can come before or after the INPUT.");
        console.log("");
        
        console.log("Examples:");
        console.log("  node " + sh + " compile --silent my_file.q");
        console.log("  node " + sh + " compile -v file_a.q file_b.q file_c.q");
        console.log("  node " + sh + " compile -v -s file_a.q -o file_a_output.qb.xen");
        //~ console.log("  node " + sh + " compile -v -s C:\\my_source_folder");
    }
    
    CMD_Compile(args)
    {
        if (args.length < 1)
        {
            this.Fail("Please specify a .q file to compile.");
            return;
        }
        
        var cmdData = this.CMD_CompileDecompile_Core(args, true);
        
        if (!cmdData)
            return;
        
        // We have a list of .q files we want to compile.
        // Let's initialize QBC.
        
        require(this.qbcFile)(cmdData.qbcOptions);
        
        // Finally, let's compile all of our source files.
        
        for (const sf of cmdData.sourceFiles)
        {
            var inPath = sf[0];
            var outPath = sf[1];
            
            var res = QBC.Compile(inPath, outPath, cmdData.comOptions);
            
            if (res.Failed())
            {
                QBC.PrintWarnings(res);
                return;
            }
        }
        
        if (!cmdData.qbcOptions.silent)
            console.log(cmdData.sourceFiles.length + " " + (cmdData.sourceFiles.length != 1 ? "files" : "file") + " compiled successfully.")
    }
}

module.exports = ArgumentHandler;
