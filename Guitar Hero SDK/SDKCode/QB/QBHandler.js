// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Q B   H A N D L E R
// For handling anything related to QB compiling / decompiling, use this!
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const path = require('path');
const fs = require('fs');

class QBHandler
{
	constructor()
	{
		if (GHSDK.standalone)
			cons.log("QB Handler initialized!");
		
		global.ItemTypes = require('./ItemTypes/QBItemTypes.js');
		this.ItemTypes = ItemTypes;
		
		// Load NodeROQ
		
		var NodeROQPath = (GHSDK.Config && GHSDK.Config.NodeROQPath);
		
		if (NodeROQPath)
		{
			if (GHSDK.standalone)
				cons.log("Loading NodeROQ...");
				
			this.NodeROQ = new (require(path.join(NodeROQPath, 'Main.js')))({direct: !GHSDK.standalone});
		}
		
		this.ReaderCore = require('./QBReader.js');
		
		// Format of currently operating file
		this.format = "xen";
	}
	
	//--------------------------------------------
	// Decompile raw QB byte data!
	//--------------------------------------------
	
	Decompile(qbData, opt = {})
	{
		var rdr = new this.ReaderCore();
		
		this.format = opt.format || "xen";
		
		var res = rdr.Decompile(qbData, opt);
		
		// Show errors here, move them somewhere else in the future
		for (const err of res.errors)
			cons.error(err);
			
		for (const wrn of res.warnings)
			cons.warn(wrn);
			
		if (opt.reader)
			return rdr;
			
		return res;
	}
	
	//--------------------------------------------
    // Compile a file!
    // .txt -> .qb
    //
    // NodeQBC: .q -> .qb
	//--------------------------------------------
    
    CompileFile(fileIn, fileOut, filePak = "")
    {
        var use_dbg = GHSDK.Config.ExportDBGFiles || false;
        var compiler = this.DetermineCompilerFor(fileIn);
        
        if (use_dbg)
        {
            Checksums.ClearKeyCache();
            Checksums.EnableKeyCache(true);
        }
        
        var res = null;
        
        // Compile with NodeROQ
        if (compiler == 'roq')
        {
            var qbReader = new this.ReaderCore();
            
            if (filePak)
                res = qbReader.CompileFile(fileIn, fileOut, filePak);
            else
                res = qbReader.CompileFile(fileIn, fileOut);
                
            res.compiler = "NodeROQ";
        }
        
        // Compile with NodeQBC
        else if (compiler == 'qbc')
        {
            var qbOptions = {game: (this.format == 'wpc') ? 'thaw' : 'ghwt'};
            
            if (filePak)
                qbOptions.qbName = filePak;
                
            res = QBC.Compile(fileIn, fileOut, qbOptions);
            
            res.compiler = "NodeQBC";
        }
        
        if (use_dbg)
        {
            var cache = Checksums.GetKeyCache();
            var keyLines = [
                "[LineNumbers]",
                "",
                "[Checksums]"
            ];
            
            for (const key of Object.keys(cache))
            {
                var crc = key.toString();
                var val = cache[key];
                
                if (crc != val)
                    keyLines.push(crc + " " + val);
            }
            
            var outDir = path.dirname(fileOut);
            var outBase = path.basename(fileOut);
            
            var spl = outBase.split(".");
            
            // Get the extension if it's a valid extension.
            var plat = "xen";
            var outPlat = spl[spl.length-1].toLowerCase();
            
            if (outPlat == "xen" || outPlat == "wpc" || outPlat == "ps3")
                plat = spl.pop();
                
            // Remove last part of it. Probably qb.
            if (spl.length > 1)
                spl.pop();
                
            var dbgPath = path.join(outDir, spl.join(".") + ".dbg." + plat);
            fs.writeFileSync(dbgPath, keyLines.join("\n"));
            
            Checksums.EnableKeyCache(false);
        }
        
        return res;
    }
    
	//--------------------------------------------
	// Decompile a file!
	// .qb -> .txt
    //
    // NodeQBC: .qb -> .q
	//--------------------------------------------
	
	DecompileFile(fileIn, fileOut, useQBC = false)
	{
        if (useQBC)
        {
            var opt = {};
            
            // See if this is a .wpc file.
            // This will trigger THAW mode.
            
            var spl = fileIn.split(".").pop();
            if (spl.toLowerCase() == "wpc")
                opt.game = "thaw";
            else if (spl.toLowerCase() == "xbx")
                opt.game = "thug2";
            
            var result = QBC.Decompile(fileIn, fileOut, opt);
            
            if (!result.errors.length && !result.warnings.length)
                cons.log(path.basename(fileOut) + " written!", "lime");
            
            return;
        }
        
		var rdr = new this.ReaderCore();
		
		this.activeFile = fileIn;
		
		var res = rdr.DecompileFile(fileIn, fileOut);
		
		// Show errors here, move them somewhere else in the future
		for (const err of res.errors)
			cons.error(err);
			
		for (const wrn of res.warnings)
			cons.warn(wrn);
	}
	
	//--------------------------------------------
	// Figure out which code files in a
	// folder are in need of compiling
	//--------------------------------------------
	
	GetCompilingFiles(mod, modPackage, dirtyScripts)
	{
		var compFiles = [];
		
		var sourceFolder = path.join(modPackage.Directory, 'Source');
		var compiledFolder = path.join(modPackage.Directory, 'Compiled');
		
		// Recursively scan for ANY files that need compiling
		var scan = GHSDK.ScanFolder(sourceFolder);
		for (const scanned of scan)
		{
			// Ask logic if it needs compiling
			if (mod.Logic && mod.Logic.NeedsCompiling(scanned))
				dirtyScripts.push(scanned);
		}
		
		var gotten = {};
		
        var hasQBC = GHSDK.HasNodeQBC();
		for (const ds of dirtyScripts)
		{
            var goodFile = false;
            
            var ext = ds.toLowerCase().split(".").pop();
            
            if (ext == "txt")
                goodFile = true;
            if (hasQBC && ext == "q")
                goodFile = true;
                
			if (!goodFile)
				continue;
				
			var sourceFile = ds;
			
			if (gotten[sourceFile])
				continue;
			
			this.AttemptModuleRequire(sourceFile);
			
			var rel = path.relative(sourceFolder, ds);
			
			var spl = rel.split(".");
			spl.pop();
			spl.push("qb");
			spl.push(this.format);
			
			var compiledFile = path.join(compiledFolder, spl.join("."));
			var pakName = Checksums.ToString( this.GeneratePakName(path.relative(compiledFolder, compiledFile)) );
			
			compFiles.push([sourceFile, compiledFile, pakName]);
			gotten[sourceFile] = true;
		}

		return compFiles;
	}
	
	//--------------------------------------------
	// Generate a pak name for a file
	//--------------------------------------------
	
	GeneratePakName(filePath)
	{
		// Remove platform-specific extension on end if necessary
		
		var spl = filePath.split(".");
		if (spl[spl.length-1].toLowerCase() == this.format)
			spl.pop();

		return Checksums.Make(spl.join("."));
	}
	
	//--------------------------------------------
	// Attempt to require a module file if it exists
	//--------------------------------------------
	
	AttemptModuleRequire(sourcePath)
	{
		var spl = sourcePath.split(".");
		spl.pop();
		spl.push("js");
		
		var jsPath = spl.join(".");
		
		// DE-INITIALIZE MODULE IF ALREADY LOADED
		if (this.loadedModules[spl[0]])
		{
			var res = require.resolve(jsPath);
			if (require.cache[res])
				delete require.cache[res];
			
			this.loadedModules[spl[0]] = false;
		}
		
		
		if (fs.existsSync(jsPath))
		{
			require(jsPath);
			this.loadedModules[spl[0]] = true;
		}
	}
	
	//--------------------------------------------
    // Which compiler should we use for
    // a source code file?
	//--------------------------------------------
    
    DetermineCompilerFor(filePath)
    {
        // QBC not even installed, use ROQ.
        if (!GHSDK.HasNodeQBC())
            return 'roq';
            
        var useQBC = false;
            
        // Does it end in .q? Then yes, use QBC.
        var spl = filePath.split(".").pop();
        if (spl.toLowerCase() == "q")
            return 'qbc';
            
        // At this point, we're not sure. How will we tell?
        // ROQ syntax has some very noticeable features to it.
        // Let's read the file as a string.
        //
        // We would use streams, but since we're doing
        // this synchronously, we should read the whole file.
        
        var stringBuf = fs.readFileSync(filePath).toString();
        
        // We can pretty quickly check to see if a file is
        // ROQ or not. Quickly ish, all things considered.
        
        if (stringBuf.indexOf("@nodeqbc") >= 0)
            return 'qbc';
            
        var sectionMatch = stringBuf.match(/Section(?:Integer|Float|Struct|Array|String|QBString) /g);
        if (sectionMatch && sectionMatch.length)
            return 'roq';
            
        // At this point, it doesn't have any Section lines. Which is highly unlikely.
        // But, just in case, see if we have some script-based keywords.
        
        if (stringBuf.indexOf(":i endfunction") >= 0)
            return 'roq';
        
        // Let's just say it's ROQ.
        // Realistically, you should not be
        // compiling txt files with QBC anyway.
        
        return 'roq';
    }
    
	//--------------------------------------------
	// Compile a package's code!
	//--------------------------------------------
	
	async CompilePackage(modName, packageName, options = {})
	{
        var resultData = {errors: [], warnings: [], logs: []};
        
		this.injectors = {};
		this.loadedModules = {};
		
		var pluginKeys = Object.keys(GHSDK.Plugins);
		
		var theMod = GHSDK.Mods[modName];
		if (!theMod)
			return {errors: ["ERROR: Could not find mod " + modName + "!"], warnings: []};

		var thePackage = theMod.Packages[packageName];
		if (!thePackage)
			return {errors: ["ERROR: Could not find package " + packageName + " in " + modName + "!"], warnings: []};
            
        // ----------------
        
        var old_dbg_preference = GHSDK.Config.ExportDBGFiles;
        if (theMod.ExportDBGFiles)
            GHSDK.Config.ExportDBGFiles = true;
            
        // ----------------
            
        resultData.path_package = thePackage.Directory;
        resultData.path_mod = theMod.Directory;
		
		var format = "xen";
		var gameConfig = GHSDK.GameConfigs[theMod.Game];
		if (gameConfig)
			format = gameConfig.DefaultPakFormat || "xen";
			
		this.format = format;
		
		// Get a list of files we want to compile
		var tempFolder = path.join(theMod.Directory, 'Temp');
		if (!fs.existsSync(tempFolder)) { fs.mkdirSync(tempFolder); }
		
		var sourceFolder = path.join(thePackage.Directory, 'Source');
		var compiledFolder = path.join(thePackage.Directory, 'Compiled');
		
		// -- NOTIFY ALL PLUGINS THAT WE STARTED COMPILING -- 
		
		// Extensions allowed?
		var useExtensions = true;
		if (options.allowExtensions !== undefined && !options.allowExtensions)
			useExtensions = false;
		
		if (useExtensions)
		{
			var notifyData = {
				modName: modName,
				modDir: theMod.Directory,
				packageName: packageName,
				packageDir: thePackage.Directory,
				sourceFolder: sourceFolder,
				compiledFolder: compiledFolder
			}
			
			for (const key of pluginKeys)
			{
				var plug = GHSDK.Plugins[key];
				if (plug.CompileStarted)
					plug.CompileStarted(notifyData);
			}
		}
		
		var hashPath = path.join(tempFolder, 'hashes_qb_' + packageName + '.json');
		var hasher = new GHSDK.Constants.ChecksumWatcher(hashPath, sourceFolder);
		var dirtyScripts = hasher.GetDirtyFiles({skipMissing: true});
		
		var compFiles = this.GetCompilingFiles(theMod, thePackage, dirtyScripts);
		
		// We have all of the files that have been MODIFIED,
		// now let's query plugins to see files that need force-compiling
		
		// Should we force compile ALL SCRIPTS?
		var forceCompileAll = options.compileAll || false;
		
        var hasQBC = GHSDK.HasNodeQBC();
		var sourceScripts = GHSDK.ScanFolder(sourceFolder);
		for (const sourcePath of sourceScripts)
		{
            var validSourceFile = false;
            
            var ext = sourcePath.toLowerCase().split(".").pop();
            
            if (hasQBC && ext == "q")
                validSourceFile = true;
            if (ext == "txt")
                validSourceFile = true;
                
			if (!validSourceFile)
				continue;
                
			// Load .js file if it exists
			this.AttemptModuleRequire(sourcePath);
				
			var forced = false;
			var rel = path.relative(sourceFolder, sourcePath);
			
			var spl = rel.split(".");
			spl.pop();
			spl.push("qb");
			spl.push(this.format);
			
			var compiledFile = path.join(compiledFolder, spl.join("."));
			
			var compInfo = {
				sourceFile: sourcePath,
				compiledFile: compiledFile,
				modName: modName,
				modDir: theMod.Directory,
				packageName: packageName,
				packageDir: thePackage.Directory,
				sourceFolder: sourceFolder,
				compiledFolder: compiledFolder
			}
			
			// Throw compiler options in there too, just in case
			Object.assign(compInfo, options);
			
			if (useExtensions)
			{
				for (const key of pluginKeys)
				{
					var plug = GHSDK.Plugins[key];
					if (plug.ScriptNeedsCompiling && plug.ScriptNeedsCompiling(compInfo))
						forced = true;
				}
			}
			
			// Script was forcefully compiled!
			if (forced || forceCompileAll)
			{
				var pakName = Checksums.ToString( this.GeneratePakName(path.relative(compiledFolder, compiledFile)) );
				compFiles.push([sourcePath, compiledFile, pakName]);
			}
		}
		
		// Filter through and make sure we don't have any double-compiles
		var visited = {};
		var newCF = [];
		for (const cf of compFiles)
		{
			if (visited[cf[0]])
				continue;
				
			visited[cf[0]] = true;
			newCF.push(cf);
		}
		
		compFiles = newCF;

		// Do we even need to compile files?
		if (compFiles.length <= 0)
		{
			resultData.logs.push("'" + packageName + "' has no files that need compiling.");
			
			if (useExtensions)
			{
				notifyData.success = true;
				notifyData.errors = [];
				notifyData.warnings = [];
				notifyData.logs = [];
				
				for (const key of pluginKeys)
				{
					var plug = GHSDK.Plugins[key];
					if (plug.CompileEnded)
						plug.CompileEnded(notifyData);
				}
			}
			
			return resultData;
		}
		
		var erroredCompile = false;
		var successLogs = [];
		
		for (const file of compFiles)
		{
			var fileIn = file[0];
			var fileOut = file[1];
			var filePak = file[2];
			
			var oldCompiledDate = undefined;
			
			if (fs.existsSync(fileOut))
				oldCompiledDate = fs.statSync(fileOut).mtime;
			
			// Create directory for out file if necessary
			var outDir = path.dirname(fileOut);
			if (!fs.existsSync(outDir))
				fs.mkdirSync(outDir, {recursive: true});
				
			this.activeFile = fileIn;
			
            // ------------------------------

			var result = this.CompileFile(fileIn, fileOut, filePak);
			
			var compErrors = result.errors || [];
			var compWarnings = result.warnings || [];
			var compLogs = result.logs || [];
			
			resultData.errors = resultData.errors.concat(compErrors);
			resultData.warnings = resultData.warnings.concat(compWarnings);
			resultData.logs = resultData.logs.concat(compLogs);
            
            // ------------------------------
			
			// No errors or warnings, it compiled!
			if (compErrors.length <= 0 && compWarnings.length <= 0)
			{
				// Get the date of the compiled file
				var newCompiledDate = fs.statSync(fileOut).mtime;
				
				// It successfully compiled FOR SURE
				if (oldCompiledDate == undefined || (oldCompiledDate && (newCompiledDate > oldCompiledDate)))
					successLogs.push(GHSDK.Constants.Chalk.keyword('lime')(path.basename(fileOut) + " compiled successfully."));
			}
			else
				erroredCompile = true;
		}
		
		resultData.success = !erroredCompile;
		
		// -- NOTIFY ALL PLUGINS WE ENDED COMPILING --
		
		if (useExtensions)
		{
			notifyData.success = !erroredCompile;
			notifyData.errors = resultData.errors;
			notifyData.warnings = resultData.warnings;
			notifyData.logs = resultData.logs;
			
			for (const key of pluginKeys)
			{
				var plug = GHSDK.Plugins[key];
				if (plug.CompileEnded)
				{
					var res = plug.CompileEnded(notifyData);
					if (!res)
					{
						resultData.success = false;
						resultData.errors.push(key + " has errored the compile process.");
					}
				}
			}
		}
		
		// If we had a squeaky clean compile, let's apply the hash list
		// 		(All files compiled that we needed, let's store their current state)
		
		if (resultData.success)
		{
			hasher.Save();
			
			for (const sl of successLogs)
				resultData.logs.push(sl);
		}
		
        // ----------------
        
        if (theMod.mod_export_dbg)
            GHSDK.Config.ExportDBGFiles = old_dbg_preference;
        
		return resultData;
	}
	
	//--------------------------------------------
	// Register an injector!
	// When Inject (INAME) is called, text is replaced
	//--------------------------------------------
	
	RegisterInjector(iName, func)
	{
		this.injectors = this.injectors || {};
		
		// Remove old injector, refresh it
		if (this.injectors[iName])
			delete this.injectors[iName];
		
		this.injectors[iName] = func;
	}
	
	//--------------------------------------------
	// Find injector by name
	//--------------------------------------------
	
	GetInjector(iName) 
	{ 
		var inj = (this.injectors && this.injectors[iName]);
		
		return inj || "";
	}
	
	//--------------------------------------------
	// Get the path for the file we're compiling
	//--------------------------------------------
	
	GetActiveFile() { return this.activeFile || ""; }
	
	//--------------------------------------------
	// Go through an entire complete compile
	//--------------------------------------------
	
	async PerformCompleteCompile(modName, packageName, options = {})
	{
        Checksums.EnableKeyCache(true);
        
		var result = await this.CompilePackage(modName, packageName, options);
        
        Checksums.EnableKeyCache(false);
        var cache = Checksums.GetKeyCache();
        
        if (result.path_mod)
        {
            var tempDir = path.join(result.path_mod, 'Temp');
            GHSDK.EnsureDirectory(tempDir);
            
            var keysPath = path.join(tempDir, 'keys.txt');
            var keyLines = [];
            
            for (const key of Object.keys(cache))
            {
                var crc = Checksums.ToString(key);
                var val = cache[key];
                
                keyLines.push(crc + " " + val);
            }
            
            fs.writeFileSync(keysPath, keyLines.join("\n"));
        }
		
		// Print errors first!
		for (const error of result.errors)
			cons.error(error);
			
		// Warnings next
		for (const warning of result.warnings)
			cons.warn(warning);
			
		// Normal logs
		for (const log of result.logs)
			cons.log(log);
	}
}

module.exports = QBHandler;
