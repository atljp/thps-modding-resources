// ---------------------------------------------------
//
//	JOB
//	Responsible for compiling / decompiling
//
// ---------------------------------------------------

const fs = require('fs');
const path = require('path');
const Lexer = require('./Lexer.js');

class QBCJobResult
{
    constructor()
    {
        this.logs = [];
        this.warnings = [];
        this.errors = [];
        this.data = null;
    }
    
    //-----------------------
    // Has this job failed?
    //-----------------------
    
    Failed() { return (this.errors && this.errors.length > 0); }
    
    //-----------------------
    // Get final data from result
    //-----------------------
    
    GetData() 
    { 
        if (this.Failed())
            return null;
            
        return this.data || null; 
    }
};

class QBCJob
{
	constructor(options = {})
	{
        this.options = options;
		this.Debug("Created job.");
	}
	
	//-----------------------
    // Attempts to pull keys from
    // a .dbg file, if the input file
    // is a .qb file.
    //
    // inFile is a path.
	//-----------------------
    
    AttemptDbgPull(inFile)
    {
        var spl = inFile.split(".");
        for (var s=0; s<spl.length; s++)
        {
            if (spl[s].toLowerCase() == "qb")
                spl[s] = "dbg";
        }
        
        var dbgPath = spl.join(".");

        if (!fs.existsSync(dbgPath))
            return;
        
        QBC.constants.Keys.PullDBGKeys(dbgPath);
    }
    
	//-----------------------
	// Handle necessary file operations
	//-----------------------
	
	PrepareFiles(inFile = null, outFile = null, opt = {})
	{
        var rawInput = (opt && opt.rawInput);
        var rawOutput = (opt && opt.rawOutput);
        
		// Determine if the arguments are paths or not
        var inIsPath = false;
        if (typeof(inFile) == 'string')
        {
            inIsPath = true;
            
            // If the "path" contains newlines, it's likely string data
            if (inFile.indexOf("\n") >= 0 || inFile.indexOf("\r") >= 0)
                inIsPath = false;
        }
        
		var outIsPath = (typeof(outFile) == 'string');
        
        if (rawInput)
            inIsPath = false;
        if (rawOutput)
            outIsPath = false;
		
		// Does the initial file exist?
		if (inFile && inIsPath && !fs.existsSync(inFile) && !rawInput)
		{
			this.Fail("'" + path.basename(inFile) + "' did not exist, cannot compile!");
			return;
		}
		
		// Let's ensure that the FOLDER for the output file exists
		if (outFile && outIsPath)
		{
			var outDir = path.dirname(outFile);
			
			if (!fs.existsSync(outDir))
			{
				var job = this;
				try { fs.mkdirSync(outDir, {recursive: true}); } catch(e) {
					job.Fail("'" + outDir + "' could not be created.");
				};
			}
			
			// We failed to create it!
			if (!fs.existsSync(outDir))
				return;
                
            // Let's delete the file if it exists.
            if (fs.existsSync(outFile))
            {
                var job = this;
				try { fs.unlinkSync(outFile); } catch(e) {
					job.Fail("'" + outDir + "' could not be deleted beforehand.");
				};
            }
		}
		
		if (inFile && inIsPath)
        {
            this.fileName = path.basename(inFile);
            this.AttemptDbgPull(inFile);
			this.data = fs.readFileSync(inFile);
        }
		else
			this.data = inFile;
			
		// No data!
		if (!this.data)
		{
			this.Fail("No data to read.", true);
			return;
		}
	}
	
	//-----------------------
	// Prepare to execute a task
	// (Setup necessary variables)
	//-----------------------
	
	PrepareTask()
	{
		this.taskInput = null;
		this.taskOutput = null;
		this.taskOptions = {};
		
        this.data = null;
		this.lexer = null;
		this.SetIndent(0);
		this.abort = false;
		this.warnings = [];
		this.errors = [];
		this.output = "";
		this.writer = null;
		this.qbName = "0x00000000";
        this.fileName = "";
        
        // The game we're operating for.
        this.gameType = QBC.constants.GAME_GHWT;
        
        // Can we use our Debug function?
        this.canDebug = false;
	}
	
	//-----------------------
	// Get current QB name
	//-----------------------
	
	GetQBName() { return this.qbName; }
	
	//-----------------------
	// Push a warning / error
	//-----------------------
	
	Warn(txt, critical = false)
	{
		if (critical)
			this.errors.push(txt);
		else
			this.warnings.push(txt);
	}
	
	//-----------------------
	// Abort
	//-----------------------
	
	Fail(reason = "")
	{
        if (this.fileName)
            reason = "[" + this.fileName + "] " + reason;
            
		if (reason)
			this.Warn(reason, true);
			
		this.abort = true;
	}
	
	Failed() { return this.abort; }
	
	//-----------------------
	// Get job results
	//-----------------------
	
	GetResults()
	{
        var res = new QBCJobResult();
        
        res.warnings = this.warnings;
        res.errors = this.errors;
        
        if (!res.Failed())
            res.data = this.output;
        
        return res;
	}
	
	//-----------------------
	// Start decompiling
	//-----------------------
	
	Decompile(inFile = null, outFile = null, opt = {})
	{
		this.PrepareTask();
        
        this.taskInput = inFile || null;
		this.taskOutput = outFile || null;
		this.taskOptions = opt || {};
        
        this.canDebug = this.GetTaskOption("debug", false);
        
        if (!this.SetGameTypeFromOptions())
            return;
        
        this.Debug("Job decompiling for game " + this.gameType + "...");
        
		this.PrepareFiles(inFile, outFile, opt);
		
		if (this.Failed())
            return;
			
		this.reader = new QBC.constants.Reader(this.data);
        this.reader.LE = (this.IsTHAW() || this.IsTHUG());
        
		this.PerformDecompile(opt);
		
		// Write to the output file
		if (outFile && this.output)
            fs.writeFileSync(outFile, this.output);
	}
	
	//-----------------------
	// Actually decompile!
	//-----------------------
	
	PerformDecompile(opt = {})
	{
		var isHeaderless = false;
		
		if ((opt && opt.headerless) || (opt && opt.packedStruct))
			isHeaderless = true;
			
		if (!this.IsTHUG() && !isHeaderless)
		{
			this.reader.UInt32();						// Zero
			
			var filesize = this.reader.UInt32();
			this.Debug("QB Defined Filesize: " + filesize);
			
			// Read QB header, whatever it contains...
			var qbHeader = this.reader.Chunk(20);
		}
		
		// Main class which contains the entire code
        if (this.IsTHUG())
            this.qbCore = QBC.CreateClass("THUGQB");
		else if (opt && opt.packedStruct)
			this.qbCore = QBC.CreateClass("Struct", {dataOnly: true});
		else
			this.qbCore = QBC.CreateClass("PakQB");
		
		if (!this.qbCore)
		{
			this.Fail("Couldn't create PakQB class.");
			return;
		}
		
		this.qbCore.ProcessData();
		
		// Debug all of our elements
		this.DebugHierarchy();
		
		if (!this.Failed())
			this.PerformTextOutput();
	}
	
    //-----------------------
    // Debug a message
    //-----------------------
    
    Debug(txt)
    {
        if (this.canDebug && QBC.CanLog())
            QBC.Debug(txt);
    }
    
	//-----------------------
	// Debug hierarchy
	//-----------------------
	
	DebugHierarchy()
	{
		if (!this.qbCore)
			return;
            
        if (!this.canDebug || !QBC.CanLog())
            return;
			
		this.Debug("");
		this.Debug("-- HIERARCHY: ---------");
	
		this.hierDebugText = "";
		this.SetIndent(0);
		this.qbCore._TreeDebug();
		
		this.Debug("");
	}
	
	//-----------------------
	// Debug based on indents
	//-----------------------
	
	TabbedDebug(txt)
	{
		var idt = "".padStart(this.GetIndent() * 2, " ");
		this.Debug(idt + txt);
		
		return (idt + txt);
	}
	
	//-----------------------
	// Function used in debugging hierarchy
	//-----------------------
	
	HierDebug(txt)
	{
		this.hierDebugText += this.TabbedDebug(txt) + "\n";
	}
	
    //-----------------------
    // Helper functions
    //-----------------------
    
    IsGHWT() { return (this.gameType == QBC.constants.GAME_GHWT); }
    IsGH3() { return (this.gameType == QBC.constants.GAME_GH3); }
    IsTHAW() { return (this.gameType == QBC.constants.GAME_THAW); }
    IsTHUG() { return (this.gameType == QBC.constants.GAME_THUG2); }
    
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	GetIndent(val) { return this.indent; }
	SetIndent(val) { this.indent = val; }
	AddIndent() { this.indent ++; }
	SubIndent() { this.indent --; }
	
	//-----------------------
	// Add text to output
	//-----------------------
	
	AddText(txt) 
	{ 
		// We need to start writing our line!
		// Let's add our indents first
		if (!this.writingLine)
		{
			this.writingLine = true;
			this.StartLine();
		}
		
		this.output += txt; 
	}
	
	//-----------------------
	// Indent
	//-----------------------
	
	StartLine()
	{
		this.AddText("".padStart(this.GetIndent() * 4, " "));
	}
	
	//-----------------------
	// Start a new line
	//-----------------------
	
	AddLine()
	{
		this.AddText("\n");
		this.writingLine = false;
	}
	
	//-----------------------
	// Create text output from our objects
	//-----------------------
	
	PerformTextOutput()
	{
		this.output = "";
		
		if (!this.qbCore)
			return;
			
		this.SetIndent(0);
		this.writingLine = false;
		
		this.qbCore._WriteText();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//-----------------------
	// Start compiling
	//-----------------------
	
	Compile(input = null, output = null, opt = {})
	{	
		this.PrepareTask();
		
		this.taskInput = input || null;
		this.taskOutput = output || null;
		this.taskOptions = opt || {};
        
        this.canDebug = this.GetTaskOption("debug", false);
        
        if (!this.SetGameTypeFromOptions())
            return;
        
        this.Debug("Job compiling...");
		
		this.PrepareCompile();
		this.PerformCompile();
		this.FinishCompile();
	}
	
	//-----------------------
	// Prepare necessary routines for a compile
	//-----------------------
	
	PrepareCompile()
	{
        // What is the name of the QB file we're compiling?
		// We'll need this for most of our objects, for debugging?
        
		this.qbName = this.GetTaskOption("qbName", "");
		
		// If not specified, use the filename!
		if (typeof(this.taskInput) == "string" && !this.qbName)
		{
			var shorthand = path.basename(this.taskInput).split(".")[0];
			this.qbName = shorthand;
		}
		
		// Prepare our lexer for compiling, we'll need it!
		this.lexer = new Lexer(this);
		
		// Prepare our writer, this is for our bytecode
		this.writer = new QBC.constants.Writer();
        this.writer.LE = (this.IsTHAW() || this.IsTHUG());
		
		// Prepare input and output arguments appropriately
		this.PrepareFiles(this.taskInput, this.taskOutput, this.taskOptions);
		
		// Something failed in preparing files
		if (this.Failed())
			return;
			
		// If our input was a buffer, we want it as string data instead!
		if (Buffer.isBuffer(this.data))
			this.data = this.data.toString();
	}
	
	//-----------------------
	// Actually compile!
	//-----------------------
	
	PerformCompile()
	{
		// We passed in a QBC object as our input,
		// so we just want to serialize it as byte data
		
		if (this.taskInput && QBC.IsQBCObject(this.taskInput))
		{
			var oldReader = this.taskInput.reader;
			var oldWriter = this.taskInput.writer;
			
			this.taskInput.SetReader(this.reader);
			this.taskInput.SetWriter(this.writer);
			
			this.taskInput._Serialize();
			
			this.taskInput.SetReader(oldReader);
			this.taskInput.SetWriter(oldWriter);
			
			return;
		}
		
		if (!this.lexer)
		{
			this.Fail("Had no lexer.");
			return;
		}
		
		// -------
		
		this.lexer.Read();
		
		// Debug tokens!
		// Useful even if we fail, helps us diag
		this.lexer.DebugTokens();
		
		// Failed to lex?
		if (this.Failed())
			return;
			
		// -------
		
		// Create a fresh PakQB class, 
		// this will contain our objects
		this.qbCore = QBC.CreateClass("PakQB");
		
		// Populate it with objects from the lexer
		this.qbCore.UnLex();
		
		// Debug our PakQB and all of its 
		// children, as QBC object nodes!
		this.DebugHierarchy();
		
		// Failed to unlex?
		if (this.Failed())
			return;
		
		// -------
		
		// Let's convert our QBC objects to bytecode!
		this.qbCore._Serialize();
	}
	
	//-----------------------
	// Finish a compile task
	//-----------------------
	
	FinishCompile()
	{
		if (this.Failed())
			return;
		
		this.output = (this.writer && this.writer.buffer) || null;
		
		// Write to the output file
		if (this.taskOutput && this.output)
            fs.writeFileSync(this.taskOutput, this.output);
			
		return this.writer.buffer;
	}
    
    //-----------------------
    // Set our gametype from our task options.
    //-----------------------
    
    SetGameTypeFromOptions()
    {
        var gt = this.GetTaskOption("game", "ghwt");
        
        switch (gt.toLowerCase())
        {
            case "ghwt":
                this.gameType = QBC.constants.GAME_GHWT;
                break;
                
            case "gh3":
                this.gameType = QBC.constants.GAME_GH3;
                break;
                
            case "thaw":
                this.gameType = QBC.constants.GAME_THAW;
                break;
                
            case "thug2":
                this.gameType = QBC.constants.GAME_THUG2;
                break;
                
            default:
                this.Fail("'" + gt + "' is not a valid game type.");
                return false;
                break;
        }
        
        this.Debug("  Job is for " + gt);
        return true;
    }
    
    //-----------------------
    // Get an option from our current task.
    //-----------------------
    
    GetTaskOption(optionName, defValue = null)
    {
        if (this.taskOptions)
        {
            if (this.taskOptions.hasOwnProperty(optionName))
                return this.taskOptions[optionName];
        }
        
        return defValue;
    }
}

module.exports = QBCJob;
