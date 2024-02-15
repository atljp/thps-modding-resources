// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//
//            d888b  db   db .d8888. d8888b. db   dD 
//           88' Y8b 88   88 88'  YP 88  `8D 88 ,8P' 
//           88      88ooo88 `8bo.   88   88 88,8P   
//           88  ooo 88~~~88   `Y8b. 88   88 88`8b   
//           88. ~8~ 88   88 db   8D 88  .8D 88 `88. 
//            Y888P  YP   YP `8888Y' Y8888D' YP   YD 
//
//            SDK for Guitar Hero (mostly World Tour)
//               Coded by Zedek the Plague Doctor
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

const fs = require('fs');
const path = require('path');
const ModuleCheck = require('./SDKCode/ModuleChecker.js');

class GuitarHeroSDK
{
	constructor(opt = {})
	{
		this.options = opt;
		this.standalone = (opt.standalone !== undefined) ? opt.standalone : false;
        
        if (this.standalone)
        {
            var result = ModuleCheck();
            
            if (!result.success)
            {
                console.error("Required NPM modules were missing!");
                console.log("");
                
                for (const err of result.errors)
                {
                    console.error("- " + err);
                }
                
                console.log("");
                console.log("Please run install.bat, or \"npm install\" to get these modules.");
                
                // Wait 5 seconds, in case they ran from a .bat file or something.
                const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
                delay(5000);
                
                return;
            }
        }
        
        global.GHSDK = this;
			
		// Constants!
		this.Constants = require('./SDKCode/Constants.js');
        
		// Easy setup
		this.EasySetup = new (require('./SDKCode/EasySetup.js'))();
		
		// Pull in FakeConsole before anything
		require('./SDKCode/FakeConsole.js');
        	
		if (!opt.quietStartup && this.standalone)
			cons.log("GHSDK initializing...");
			
		// Initialize user warnings / errors
		// (These are intended to let the user know what's
		// wrong and what they should fix with certain things)
		this.InitUserWarnings();
		
		this.needsSetup = false;
		
		if (!opt.noMods)
		{
			// Load game configs
			this.LoadGameConfigs();
			
			// Load plugins
			this.LoadPlugins();
		}
	
		// Load SDK config!
		
		var configPath = path.join(this.Constants.DirConfig, 'config.ini');
		if (!fs.existsSync(configPath))
			this.needsSetup = true;
			
		// We are MISSING CONFIGS! Start easy-setup to help the user
		
		if (this.needsSetup && !opt.noSetup && this.standalone)
		{
			this.EasySetup.BeginSetup();
			return;
		}

		
		this.LoadConfig(configPath);
        
        // Attempt to pull-in NodeQBC as an extra module.
        this.PullNodeQBC();
		
		// Populate mod information
		
		if (!opt.noMods)
			this.LoadModInfo();
		
		// Initialize our checksums!
		// This should be done once, it takes a while
		
		if (!opt.quietStartup && this.standalone)
			cons.log("Loading checksum database...");
			
		global.Checksums = require(path.join(this.Constants.DirCode, 'Checksums.js'));
		
		if (!opt.quietStartup && this.standalone)
			cons.log("Checksums loaded.");
		
		// Initialize Mod Packager
		
		this.ModPackager = new (require(path.join(this.Constants.DirCode, 'ModPackager.js')))();
		
		// Initialize QBHandler
		// This is for THAW+ QB files
		
		this.QBHandler = new (require(path.join(this.Constants.DirCode, '/QB/QBHandler.js')))();
		
		// Initialize Pak Handler
		// This is for creating .pak files
		this.PakHandler = new (require(path.join(this.Constants.DirCode, '/Pak/PakHandler.js')))();
		
		// Initialize FSB Handler
		// This is for creating .fsb files
		this.FSBHandler = new (require(path.join(this.Constants.DirCode, '/FSBHandler.js')))();
		
		// Parse home options
		this.ParseHomeOptions();
		
		
		// Set up the main SDK
		this.state = this.Constants.STATE_HOME;
		
		if (this.standalone)
			this.DoStartup();
	}
	
	//--------------------------------------------
	// Initial home startup
	//--------------------------------------------
	
	async DoStartup()
	{
		await this.TestPermissions();
		
		var PUW = await this.PrintUserWarnings();
		if (!PUW)
			return;
			
		this.ShowHomeMenu();
	}
	
	//--------------------------------------------
	// Initialize user warnings
	//--------------------------------------------
	
	InitUserWarnings()
	{
		this.ResetUserWarnings();
	}
	
	//--------------------------------------------
	// Reset user warnings
	//--------------------------------------------
	
	ResetUserWarnings()
	{
		this.userWarnings = [];
	}
	
	//--------------------------------------------
	// Print user warnings
	//--------------------------------------------
	
	async PrintUserWarnings(reset = true)
	{
		// Nothing to print!
		if (this.userWarnings.length <= 0)
			return true;
			
		if (reset)
		{
			this.ShowHeader();
			var r = this.Constants.Chalk.keyword('red');
			var y = this.Constants.Chalk.keyword('yellow');
			var o = this.Constants.Chalk.keyword('orange');
			
			var YFI = r("<") + y("!") + r(">");
			
			console.log(YFI + " " + o("Warnings Detected") + " " + YFI);
			cons.log("");
		}
			
		for (const w of this.userWarnings)
		{
			if (w[1])
				cons.error(w[0]);
			else
				cons.warn(w[0]);
		}
		
		if (reset)
			return await this.Pause(false);
			
		return true;
	}
	
	//--------------------------------------------
	// Show user warning
	//--------------------------------------------
	
	UserWarn(msg, critical = false)
	{
		this.userWarnings.push([msg, critical]);
	}
	
	//--------------------------------------------
	// Load the main config
	//--------------------------------------------
	
	LoadConfig(cfgPath)
	{
		this.Config = {};
		
		if (!fs.existsSync(cfgPath))
		{
			this.UserWarn("Could not find config: " + cfgPath, true);
			return;
		}
		
		var INI = new this.Constants.INIHandler();
		INI.Read(cfgPath);
		
		this.Config.ModFolders = INI.GetValue("SDKConfig", "ModFolders", [], true);
		this.Config.DefaultMod = INI.GetValue("SDKConfig", "DefaultMod", "qb");
		
        var edf = INI.GetValue("SDKConfig", "ExportDBGFiles", "false");
		this.Config.ExportDBGFiles = (edf.toLowerCase() == 'true') ? true : false;
        
        var pdf = INI.GetValue("SDKConfig", "PackageDBGFiles", "true");
		this.Config.PackageDBGFiles = (pdf.toLowerCase() == 'true') ? true : false;
        
		this.Config.SC_OutPath = INI.GetValue("SongConverter", "OutputPak", "qb.pak.xen");
		
		var ats = INI.GetValue("SongConverter", "AddToSetlist", "true");
		this.Config.SC_AddToSetlist = (ats.toLowerCase() == 'true') ? true : false;
		
		var adf = INI.GetValue("SongConverter", "AllowDrumFills", "true");
		this.Config.SC_AllowDrumFills = (adf.toLowerCase() == 'true') ? true : false;
		
		var enc = INI.GetValue("SongConverter", "EncryptFSB", "false");
		this.Config.SC_EncryptFSB = (enc.toLowerCase() == 'true') ? true : false;
		
		var vo = INI.GetValue("SongConverter", "VocalsOffset", "0");
		this.Config.SC_VocalsOffset = parseInt(vo);
		
		var raw = INI.GetValue("SongConverter", "RawNotes", "false");
		this.Config.SC_RawNotes = (raw.toLowerCase() == 'true') ? true : false;
		
		this.Config.SC_ChecksumPrefix = INI.GetValue("SongConverter", "ChecksumPrefix", "");
		this.Config.SC_ChecksumSuffix = INI.GetValue("SongConverter", "ChecksumSuffix", "");
		
		var roqPath = INI.GetValue("SDKConfig", "NodeROQPath", "");
		if (roqPath)
			this.Config.NodeROQPath = roqPath;
            	
		// Use submodule if it exists
		else
		{
			var nodeGitPath = path.join(this.Constants.DirSDK, 'noderoq');
			if (fs.existsSync(nodeGitPath))
				this.Config.NodeROQPath = nodeGitPath;
		}
        
        var nodeQBCPath = INI.GetValue("SDKConfig", "NodeQBCPath", "");
		if (nodeQBCPath)
			this.Config.NodeQBCPath = nodeQBCPath;
            
        // Use submodule if it exists
		else
		{
			var nodeGitPath = path.join(this.Constants.DirSDK, 'nodeqbc');
			if (fs.existsSync(nodeGitPath))
				this.Config.NodeQBCPath = nodeGitPath;
		}
	}
	
	//--------------------------------------------
	// Load game configurations
	//--------------------------------------------
	
	LoadGameConfigs()
	{
		this.GameConfigs = {};
		var added = 0;
		
		if (!fs.existsSync(this.Constants.DirGameConfig))
		{
			this.UserWarn("Could not find game config dir: " + this.Constants.DirGameConfig, true);
			return;
		}
		
		var files = fs.readdirSync(this.Constants.DirGameConfig);
		
		for (const file of files)
		{
			var fPath = path.join(this.Constants.DirGameConfig, file);
			
			var spl = file.split(".");
			
			if (spl[spl.length-1].toLowerCase() !== 'ini')
				continue;
				
			var shorthand = file.split(".")[0];
			
			var INI = new this.Constants.INIHandler(fPath);
			INI.Read(fPath);
			
			var cfg = {};
			cfg.GameDir = INI.GetValue("GameConfig", "GameDir", "");
			cfg.DefaultDataPath = INI.GetValue("GameConfig", "DefaultDataPath", "DATA");
			cfg.DefaultPakPath = INI.GetValue("GameConfig", "DefaultPakPath", "DATA/PAK");
			cfg.DefaultPakFormat = INI.GetValue("GameConfig", "DefaultPakFormat", "xen");
				
			this.GameConfigs[shorthand] = cfg;
			added ++;
		}
		
		if (added > 0)
		{
			if (this.standalone)
				cons.log("Game configs loaded.");
		}
		else
			this.needsSetup = true;
	}
	
	//--------------------------------------------
	// Load plugins!
	//--------------------------------------------
	
	LoadPlugins()
	{
		this.Plugins = {};
		
		var pluginDir = this.Constants.DirPlugins;
		if (!fs.existsSync(pluginDir))
			return;
			
		var dirs = fs.readdirSync(pluginDir);
		for (const dir of dirs)
		{
			var dPath = path.join(pluginDir, dir);
			if (fs.lstatSync(dPath).isDirectory())
				this.LoadSingularPlugin(dPath);
		}
	}
	
	//--------------------------------------------
	// Load an individual plugin!
	//--------------------------------------------
	
	LoadSingularPlugin(pluginDir)
	{
		var iniPath = path.join(pluginDir, 'PluginInfo.ini');
		if (!fs.existsSync(iniPath))
		{
			this.UserWarn("Missing PluginInfo.ini: " + iniPath, true);
			return;
		}
			
		var jsPath = path.join(pluginDir, 'Plugin.js');
		if (!fs.existsSync(jsPath))
		{
			this.UserWarn("Missing Plugin.js: " + jsPath, true);
			return;
		}
			
		var id = path.basename(pluginDir);
		var ye = this.Constants.Chalk.keyword('white');
		var gr = this.Constants.Chalk.keyword('grey')
		
		if (this.standalone)
			cons.log(gr("Loading plugin ") + ye(id) + gr("..."));
		
		var plugCore = require(jsPath);
		var plugin = new plugCore();
		
		plugin.ID = id;
		plugin.Directory = pluginDir;
		
		// Metadata
		var INI = new this.Constants.INIHandler();
		INI.Read(iniPath);
		
		plugin.FriendlyName = INI.GetValue("PluginInfo", "Name", id);
		plugin.Description = INI.GetValue("PluginInfo", "Description", "A plugin.");
		plugin.Author = INI.GetValue("PluginInfo", "Author", "Anonymous");
		
		this.Plugins[id] = plugin;
	}
	
	//--------------------------------------------
	// Get a plugin
	//--------------------------------------------
	
	GetPlugin(id)
	{
		return this.Plugins[id];
	}
	
	//--------------------------------------------
	// Load mod information!
	//--------------------------------------------
	
	LoadModInfo()
	{
		this.Mods = {};
		
		for (var modFolder of this.Config.ModFolders)
		{
			var badMod = false;
			var modName = path.basename(modFolder);
			
			var modData = {ID: modName, Directory: modFolder};
			
			// Read the JSON!
			var iniPath = path.join(modFolder, 'ModInfo.ini');
			
			if (!fs.existsSync(iniPath))
			{
				this.UserWarn("Missing ModInfo.ini in: " + modFolder);
				this.UserWarn("  (Mod will be skipped.)");
				badMod = true;
			}
				
			if (!badMod)
			{
				var INI = new this.Constants.INIHandler();
				INI.Read(iniPath);
				
				modData.Game = INI.GetValue("ModInfo", "Game", "NULL");
				modData.Pak = INI.GetBooleanValue("ModInfo", "Pak", false);
				modData.ExportDBGFiles = INI.GetBooleanValue("ModInfo", "ExportDBGFiles", false);
				modData.Description = INI.GetValue("ModInfo", "Description", "");
				modData.DataDir = INI.GetValue("ModInfo", "DataDir", "");
				modData.ContentDir = INI.GetValue("ModInfo", "ContentDir", "");
				modData.Macros = {};
				
				modData.Packages = {};
			}
			
			// Load packages, if we have any for this mod
			
			var packDir = path.join(modFolder, 'Packages');
			var foundPackages = 0;
			
			if (fs.existsSync(packDir))
			{
				if (!badMod)
				{
					var packs = fs.readdirSync(packDir);
					
					for (const pkg of packs)
					{
						var pkDir = path.join(packDir, pkg);
						modData.Packages[pkg] = {Directory: pkDir, ID: pkg};
						foundPackages++;
					}
				}
			}
			else
			{
				this.UserWarn("Missing Packages folder in: " + modFolder);
				this.UserWarn("  (Packages in this mod will not show.)");
			}
			
			if (!badMod && foundPackages <= 0)
			{
				this.UserWarn("No packages found in: " + modFolder);
				this.UserWarn("  (Mods must go in Packages folder!)");
			}
			
			if (badMod)
				return;
			
			// Read the mod's logic file, if available!
			var logicPath = path.join(modFolder, 'ModLogic.js');
			
			if (fs.existsSync(logicPath))
			{
				var logicCore = require(logicPath);
				modData.Logic = new logicCore();
			}
			
			// Read the mod's menu file, if available!
			var menuPath = path.join(modFolder, 'ModMenus.js');
			
			if (fs.existsSync(menuPath))
			{
				var menuCore = require(menuPath);
				modData.Menus = new menuCore();
			}
			
			this.Mods[modName] = modData;
		}
	}
	
	//--------------------------------------------
	// Clear the terminal
	//--------------------------------------------
	
	ClearScreen()
	{
		console.clear();
	}
	
	//--------------------------------------------
	// Print header to the console
	// If clear, then clear all output
	//--------------------------------------------
	
	ShowHeader(clear = true)
	{
		if (clear)
			this.ClearScreen();
			
		this.Constants.ModMenuHandler.PrintHeader();
	}
	
	//--------------------------------------------
	// Is the OS currently running on linux?
	//--------------------------------------------
	
	IsLinux()
	{
		return (process.platform !== 'win32');
	}
	
	//--------------------------------------------
	// Recursively scan a folder for all of its files.
	//--------------------------------------------
	
	ScanFolder(dir, fl)
	{
		var files = fs.readdirSync(dir);
		var filelist = fl || [];
		
		files.forEach(file => {
			
			var finPath = path.join(dir, file);
			
			if (fs.statSync(finPath).isDirectory())
				filelist = this.ScanFolder(finPath, filelist);
			else
				filelist.push(finPath);
				
		});
		
		return filelist;
	}
	
    //--------------------------------------------
    // Attempt to pull in NodeQBC.
    //--------------------------------------------
    
    PullNodeQBC()
    {
        this.hasQBC = false;
        
        var QBCDir = this.Config.NodeQBCPath || path.join(__dirname, 'nodeqbc');
        
        if (!fs.existsSync(QBCDir))
            return;
            
        // QBC folder should contain QBC.js.
        // Make sure it actually exists.
        
        var QBCFile = path.join(QBCDir, 'QBC.js');
        
        if (!fs.existsSync(QBCFile))
            return;
          
        // Since we're using GHSDK, we won't bother
        // pulling in any key files. We will handle
        // the key files ourselves.
        
        if (!this.options.quietStartup && this.standalone)
			cons.log("Pulling in NodeQBC...");
        
        require(QBCFile)({noKeyFiles: true});
        
        if (global.QBC)
            this.hasQBC = true;
    }
    
    //--------------------------------------------
    // Do we have NodeQBC installed?
    //
    // This is a submodule in a separate project
    // and can be used as an optional replacement
    // for the included NodeROQ.
    //--------------------------------------------
    
    HasNodeQBC() { return this.hasQBC; }
    
	//--------------------------------------------
	// Read modular options from our menu folder
	//--------------------------------------------
	
	ParseHomeOptions()
	{
		var opDir = path.join(this.Constants.DirCode, 'Menus');
		var files = fs.readdirSync(opDir);
		
		this.homeOptions = [];
		
		for (const f in files)
		{
			var file = files[f];
			if (file.toLowerCase().indexOf(".js") == -1)
				continue;
				
			this.homeOptions.push( require(path.join(opDir, file)) );
		}
	}
	
	//--------------------------------------------
	// Make options for the home menu
	//--------------------------------------------
	
	MakeHomeOptions()
	{
		var opt = [];
		
		for (const option of this.homeOptions)
			opt.push( option.Display() );
			
		return opt;
	}
	
	//--------------------------------------------
	// Show the home menu!
	//--------------------------------------------
	
	async ShowHomeMenu()
	{
		this.Constants.ModMenuHandler.ResetAll();
		
		this.state = this.Constants.STATE_HOME;
		this.ShowHeader();
		
		const randoms = [
			"Let's get started.",
			"Let's get crackin'!",
			"What's on the menu today?",
			"What's next, boss?"
		];
		
		cons.log(randoms[Math.floor(Math.random() * randoms.length)]);
		cons.log("");
		
		// Show a prompt
		// TODO: MAKE THIS MODULAR
		var category = await this.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "SDK Home",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: this.MakeHomeOptions(),
			initial: 0
		});
		
		// Which one did we pick?
		for (const option of this.homeOptions)
		{
			if (option.value == category.value)
				option.Selected(category.value);
		}
	}
	
	//--------------------------------------------
	// Returns an option to go home.
	//--------------------------------------------
	
	HomeOption()
	{
		return {
			title: this.Constants.Chalk.keyword('pink')('< Home Menu'),
			description: 'Return to the home menu.',
			value: 'gohome'
		};
	}
	
	//--------------------------------------------
	// Simulate a pause event
	//--------------------------------------------
	
	async Pause(showHome = true)
	{
		console.log("");
		
		var paused = await this.Constants.Prompts({
			type: 'invisible',
			name: 'value',
			value: 'blahblah',
			message: 'Press ENTER to continue.'
		});
		
		// Ctrl-C
		if (paused.value == undefined)
			return false;
			
		if (!showHome)
			return true;
		
		this.ShowHomeMenu();
		
		return true;
	}
	
	//--------------------------------------------
	// From a path, get the mod's base directory
	//
	// This is great for sub-files of mods!
	//--------------------------------------------
	
	GetModPathFrom(pth)
	{
		var keys = Object.keys(this.Mods);
		
		for (const key of keys)
		{
			var theMod = this.Mods[key];
			
			var rel = path.relative(theMod.Directory, pth);
			
			if (!path.isAbsolute(rel) && !rel.startsWith('..'))
				return theMod.Directory;
		}
		
		return "";
	}
	
	//--------------------------------------------
	// Get logic class for a mod
	//--------------------------------------------
	
	GetModLogic(modName)
	{
		var mod = this.Mods[modName];
		if (!mod)
			return undefined;
			
		return mod.Logic;
	}
	
	//--------------------------------------------
	// Get CRC32 hash for a file
	// (This is actually the contents as a QBKey)
	//--------------------------------------------
	
	GetFileCRC(pth)
	{
		var dat = fs.readFileSync(pth).toString('hex');
		return Checksums.Make(dat);
	}
	
	//--------------------------------------------
	// Ensure a folder exists
	//--------------------------------------------
	
	EnsureDirectory(pth, isDir = false)
	{
		var dn = isDir ? pth : path.dirname(pth);
		if (!fs.existsSync(dn))
			fs.mkdirSync(dn, {recursive: true});
	}
	
	//--------------------------------------------
	// Test game directory permissions
	// (See if there are folders we can't write to)
	//--------------------------------------------
	
	async TestPermissions()
	{
		var keys = Object.keys(this.GameConfigs);
		
		for (const key of keys)
		{
			var gc = this.GameConfigs[key];
			if (!gc.GameDir)
				continue;
				
			// Try writing a file there!
			var outPath = path.join(gc.GameDir, 'permtest.txt');
			try { 
				fs.writeFileSync(outPath, 'Permission test');
				if (fs.existsSync(outPath))
					fs.unlinkSync(outPath);
			}
			
			// BAD, folder is not writable
			catch
			{
				this.UserWarn("CRITICAL: Bad permissions for game '" + key + "'!", true);
				this.UserWarn("  Could not write to: " + gc.GameDir, false);
				this.UserWarn("    (Is the folder read only?)", false);
				this.UserWarn("    (Try enabling Full Control on the folder.)", false);
			}
		}
	}
	
	// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// MACRO: Compile QB file
	//--------------------------------------------
	
	M_CompileQB(inFile, outFile, fullName = "0x40CA2103", options = "")
	{
        var comp = this.QBHandler.DetermineCompilerFor(inFile);
        return this.QBHandler.CompileFile(inFile, outFile, fullName);
	}
	
	//--------------------------------------------
	// MACRO: Decompile QB file
	//--------------------------------------------
	
	M_DecompileQB(inFile, outFile, useQBC = false)
	{
        return this.QBHandler.DecompileFile(inFile, outFile, useQBC);
	}
}

// For things requiring the SDK externally
const defaultOptions = {
	noMods: true,
	noSetup: true,
	quietStartup: true,
	standalone: false
};

module.exports = function(options = defaultOptions) {
    var result = ModuleCheck();
    
    if (!result.success)
    {
        console.error("Modules missing, cannot load GHSDK.");
        
        for (const err of result.errors)
            console.log("- " + err);
        
        return null;
    }
    
	return new GuitarHeroSDK(global.SDK_OPTIONS || options);
};

//---------------------------------------------------------

// -----------------------
// Decompile QB file
// -----------------------

function CMD_DecompileQB(fileList, useQBC = false)
{
	// Need two files
	if (fileList.length < 1)
	{
		console.error("Please provide in file(s) to decompile.");
		return {};
	}
	
	var toDecompile = fileList.slice(0);
	
	// Create new SDK
	new GuitarHeroSDK({});
	
    var outErrors = [];
    var outWarnings = [];
    
	for (const file of toDecompile)
	{
		var dName = path.dirname(file);
		var fName = path.basename(file);
		var shorthand = fName.split(".")[0];
		var outFile = path.join(dName, shorthand + (useQBC ? ".q" : ".txt"));
        
        if (!fs.existsSync(file))
        {
            outErrors.push("File '" + file + "' does not exist.");
            continue;
        }
		
		var res = GHSDK.M_DecompileQB(file, outFile, useQBC) || {};
		
		// Warnings or errors?
		var success = true;
		
		if (res.errors && res.errors.length)
		{
            for (const err of res.errors)
                outErrors.push(err);
				
			success = false;
			
			if (fs.existsSync(outFile))
				fs.unlinkSync(outFile);
		}
        
		if (res.warnings && res.warnings.length)
		{
            for (const warn of res.warnings)
                outWarnings.push(err);
		}
	}
    
    for (const error of outErrors)
        cons.error(error);
    for (const warn of outWarnings)
        cons.warn(warn);
    
    return {errors: outErrors, warnings: outWarnings};
}

// -----------------------
// Compile QB file
// -----------------------

function CMD_CompileQB(toCompile)
{
	if (toCompile.length < 1)
	{
		console.error("Please provide in file(s) to compile.");
		return;
	}
	
	// Create new SDK
	new GuitarHeroSDK({noChecksums: true});
	
    var useLZSS = true;
    
	for (var file of toCompile)
	{
        if (file.toLowerCase() == '-nolzss')
        {
            useLZSS = false;
            continue;
        }
        
		if (!path.isAbsolute(file))
			file = path.join(process.cwd(), file);
			
		var dName = path.dirname(file);
		var fName = path.basename(file);
		var shorthand = fName.split(".")[0];
		var outFile = path.join(dName, shorthand + ".qb.xen");
		
        var compileOptions = useLZSS ? {} : {noScriptCompression: true};
		var res = GHSDK.M_CompileQB(file, outFile, "0x40CA2103", compileOptions);
		
		// Warnings or errors?
		var success = true;
		
		if (res.errors.length > 0)
		{
			for (const err of res.errors)
				console.error(err);
				
			success = false;
			
			if (fs.existsSync(outFile))
				fs.unlinkSync(outFile);
		}
	}
}

// -----------------------
// Extract a pak file
// -----------------------

function CMD_ExtractPak(args)
{
	// Need two files
	if (args.length < 2)
	{
		console.error("Please provide in file and out directory.");
		return;
	}
	
	var inPak = args[0];
	var outPath = args[1];
	
	new GuitarHeroSDK({});
	
	GHSDK.PakHandler.Extract(inPak, outPath);
}

// -----------------------
// Create a pak file from a folder
// -----------------------

async function CMD_CreatePak(args)
{
	var inPath = "";
	var outPath = "";
	var zonePrefix = "";
	var usePab = false;
	
	var inArgs = args.slice(0);
	while (inArgs.length)
	{
		var firstArg = inArgs.shift();
		
		// An actual argument!
		if (firstArg[0] == "-")
		{
			var sliced = firstArg.slice(1, firstArg.length);
			switch (sliced.toLowerCase())
			{
				// -- SPECIFY THAT IT IS A ZONE PAK --
				case 'zone':
				
					if (inArgs.length <= 0)
					{
						console.error("Please provide a zone prefix for -zone.");
						return;
					}
					
					zonePrefix = inArgs.shift();
					
					break;
					
				// -- USE A PAB --
				case 'pab':
					usePab = true;
					break;
					
				// -- SPECIFY THE OUTPUT PATH
				case 'out':
					
					if (inArgs.length <= 0)
					{
						console.error("Please provide an out path for -out.");
						return;
					}
					
					outPath = inArgs.shift();
					
					if (!path.isAbsolute(outPath))
						outPath = path.join(process.cwd(), outPath);
					
					break;
			}
		}
		
		// Normal path
		else
		{
			if (!inPath)
			{
				if (!path.isAbsolute(firstArg))
					inPath = path.join(process.cwd(), firstArg);
				else
					inPath = firstArg;
			}
		}
	}
	
	if (!inPath)
	{
		console.error("Please specify a directory to compile into a .pak.");
		return;
	}
	
	if (!outPath)
	{
		var folderName = path.basename(inPath);
		outPath = path.join(inPath, '..', folderName + ".pak.xen");
	}
	
	// Directory doesn't exist
	if (!fs.existsSync(inPath))
	{
		console.error("'" + inPath + "' does not exist.");
		return;
	}
	
	// Not a directory!
	if (!fs.lstatSync(inPath).isDirectory())
	{
		console.error("'" + inPath + "' is not a directory.");
		return;
	}
	
	console.log("Zone prefix: " + zonePrefix);
	console.log("Pak dir: " + inPath);
	console.log("Out path: " + outPath);
	console.log("Split pak: " + usePab);
	
	// We probably don't need checksums when packing... PROBABLY
	new GuitarHeroSDK({noChecksums: true});
	
	var zonePath = "";
	var links = {};
	
	if (zonePrefix)
	{
		var desiredZonePath = path.join(inPath, "zones", zonePrefix);
		if (fs.existsSync(desiredZonePath))
			zonePath = desiredZonePath;
		else
		{
			console.error("Could not find the appropriate 'zones' folder.");
			return;
		}
		
		// -- CREATE THE LINKS
		var linkTxt = GHSDK.ModPackager.CreateLinkTxt(inPath, zonePath, zonePrefix, "xen");
		links = GHSDK.ModPackager.ParseLinks(linkTxt.split("\n"));
	}
	
	console.log("Compiling pak...");
	
	// Now let's actually compile the pak!
	var result = await GHSDK.PakHandler.Compile(inPath, outPath, {
		usePAB: usePab,
		
		isZone: (zonePrefix.length > 0),
		zonePrefix: zonePrefix,
		zonePath: path.relative(inPath, zonePath),
		
		extension: "xen",
		links: links
	});
}

//---------------------------------------------------------

// Parse command line options
var args = process.argv.slice(0);
if (args.length > 1)
{
	args.shift();

	var runningScript = args[0];
	if (args.length == 1 && runningScript == __filename)
		new GuitarHeroSDK({standalone: true});
		
	// Passed in some sort of arguments
	else if (args.length > 1)
	{
		args.shift();
		
		// Command?
		var cmd = args[0];

		switch (cmd.toLowerCase())
		{
			// Decompile QB
			case 'decompile':
				args.shift();
                
                // Should use NodeQBC?
                // If so, the user should specify -qbc before file list.
                
                var usingQBC = false;
                
                if (args.length)
                {
                    if (args[0].toLowerCase() == '-q')
                    {
                        args.shift();
                        usingQBC = true;
                    }
                }
                
				CMD_DecompileQB(args, usingQBC);
				break;
				
			// Compile QB
			case 'compile':
				args.shift();
				CMD_CompileQB(args);
				break;
				
			// Extract a pak file
			case 'extract':
				args.shift();
				CMD_ExtractPak(args);
				break;
				
			// Compile a folder into a .pak
			case 'createpak':
				args.shift();
				CMD_CreatePak(args);
				break;
				
			default:
				console.error("Unknown SDK command: " + cmd);
				break;
		}
	}
}
