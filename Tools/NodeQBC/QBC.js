// ---------------------------------------------------
//
//        NODE
//       ██████  ██████   ██████ 
//      ██    ██ ██   ██ ██      
//      ██    ██ ██████  ██      
//      ██ ▄▄ ██ ██   ██ ██      
//       ██████  ██████   ██████ 
//          ▀▀      
//                Q B   C O M P I L E R
//					 (And decompiler!)
//
// ---------------------------------------------------

const fs = require('fs');
const path = require('path');
const ArgumentHandler = require('./Internal/ArgumentHandler.js');
const Constants = require('./Internal/Constants.js');
const JobCore = require('./Internal/Job.js');

class QBC
{
	constructor(options = {})
	{
        this.options = options;
        
        // Using global values is frowned upon.
        // But we're playing it safe, I promise!
        
        if (global.QBC)
            this.Warn("QBC was already registered. Please do not register it again.");
        
        global.QBC = this;
        
		this.Debug("QBC initialized.");
		this.currentJob = null;
		this.lastResults = null;
		
		this.constants = Constants;
        
        // Pull in our core key database.
        // Regardless, we'll use the keys in our Keys folder first.
        
        if (!options.noKeyFiles)
            this.constants.Keys.PullKeys( path.join(__dirname, 'Keys') );
        
		// List of currently active job
		this.jobs = [];
		
		// Register available QB types
		this.RegisterClasses();
	}
	
	//-----------------------
    // Was this run as a file
    // on its own, or required
    // from another module?
	//-----------------------
    
    IsStandalone()
    {
        return this.GetOption("standalone", false);
    }
    
	//-----------------------
	// Get most recently created job
	//-----------------------

	LastJob()
	{
		return this.jobs[this.jobs.length-1];
	}
	
	//-----------------------
	// Lookup a checksum
	//-----------------------
	
	KeyToString(key)
	{
		if (global.Checksums)
			return Checksums.Lookup(key);
		
        return this.constants.Keys.FromKey(key);
	}
    
    //-----------------------
    // Add a checksum to symbol table.
    //-----------------------
    
    AddKey(key, text)
    {
        if (global.Checksums)
        {
            Checksums.AddKey(key, text);
            return;
        }
        
        this.constants.Keys.AddKey(key, text);
    }
	
	//-----------------------
    // Is logging allowed?
	//-----------------------
    
    CanLog()
    {
        if (this.GetOption("silent", false))
            return false;
            
        return true;
    }
    
	//-----------------------
	// Logging methods
	//-----------------------
	
	Log(txt) 
    { 
        if (this.CanLog())
            console.log(txt); 
    }
    
	Debug(txt) 
    {
        if (this.GetOption("debug", false) && this.CanLog())
            console.log(txt); 
    }
	
	Warn(txt, critical = false) 
	{ 
        if (this.CanLog())
            console.warn((critical ? "ERROR: " : "") + txt); 
	}
	
	//-----------------------
	// Spawn a new job
	//-----------------------
	
	SpawnJob(options = {})
	{
		var job = new JobCore(options);
		this.jobs.push(job);
		return job;
	}
	
	//-----------------------
	// Kill the last job
	//-----------------------
	
	KillJob()
	{
		this.jobs.pop();
	}
	
	//-----------------------
	// Register available QB classes
	//-----------------------
	
	RegisterClasses()
	{
		var classDir = path.join(__dirname, 'Internal', 'Classes');
		
		this.qbClasses = {};
		
		if (!fs.existsSync(classDir))
		{
			this.Warn("Class dir did not exist.", true);
			return;
		}
		
		var files = fs.readdirSync(classDir);
		for (const file of files)
		{
			var fPath = path.join(classDir, file);
			
			if (!fPath.toLowerCase().endsWith(".js"))
				continue;
				
			var shorthand = path.basename(fPath).split(".")[0];
			this.qbClasses[shorthand] = require(fPath);
		}
		
		this.Debug("Loaded QBC object classes.");
	}
	
	//-----------------------
	// Create a class
	//-----------------------
	
	CreateClass(classType, opt = {})
	{
		if (!this.qbClasses[classType])
		{
			console.error("Failed to create nonexistent QBC class of type " + classType + ".");
			return null;
		}
			
		opt.className = classType;
		
		var theClass = new this.qbClasses[classType](opt);
		return theClass;
	}
	
	//-----------------------
	// Print last com / decom warnings to console
	//-----------------------
	
	PrintWarnings(res = this.lastResults)
	{
		if (!res)
			return;
            
        if (!res.Failed())
            return;
			
		if (res.warnings)
		{
			for (const wrn of res.warnings)
				this.Warn(wrn);
		}
		
		if (res.errors)
		{
			for (const err of res.errors)
				this.Warn(err, true);
		}
	}
    
    //-----------------------
	// Is a variable a QBC object?
	//-----------------------
	
	IsQBCObject(obj)
	{	
		return (obj.IS_QBC_ITEM);
	}
    
    //-----------------------
    // Gets an option that was
    // passed in when initializing
    // the QBC system.
    //-----------------------
    
    GetOption(optionName, defaultValue = "")
    {
        if (this.options && this.options.hasOwnProperty(optionName))
        {
            return this.options[optionName];
        }
        
        return defaultValue;
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//-----------------------
	// Decompile a QB!
	//
	//	opt values:
	//
	//	headerless: Reads without header
	//	packedStruct: Reads as packed struct
	//-----------------------
	
	Decompile(inFile, outFile, opt = {})
	{
		var job = this.SpawnJob();
		job.Decompile(inFile, outFile, opt);
		
		var jobResult = job.GetResults();
		this.KillJob();
		
		// Allow this for real when we output actual data
		// if (opt.debug)
			// job.DebugHierarchy();
		
		this.lastResults = jobResult;
		
		this.PrintWarnings();
		
		return jobResult;
	}
	
	//-----------------------
	// Compile a QB!
	//-----------------------
	
	Compile(inFile, outFile, opt = {})
	{
		var job = this.SpawnJob();
		job.Compile(inFile, outFile, opt);
		
		var jobResult = job.GetResults();
		
		this.KillJob();
		
		this.lastResults = jobResult;
		
		this.PrintWarnings();
		
		return jobResult;
	}
}

// If we require QBC from another module, then we'll pass
// arguments into it. Requiring this file will create
// a new QBC instance and return a reference to it.

module.exports = function(options = {}) {
	return new QBC(global.QBC_OPTIONS || options);
};

// Let's (try to) process command-line arguments.

var ah = new ArgumentHandler(__filename);
ah.Handle();
