// - - - - - - - - - - - - - - - - - - - - - 
//	MOD MENU HANDLER
//		Handles the mod menu system
// - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

class ModMenuHandler
{
	constructor()
	{
		this.ResetAll();
	}
	
	ResetAll()
	{
		this.currentMod = null;
		this.ResetHeader();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//----------------------------------
	// Reset header
	//----------------------------------
	
	ResetHeader()
	{
		this.headerFunction = this.PrintStockHeader;
	}
	
	//----------------------------------
	// Set header
	//----------------------------------
	
	SetHeader(func)
	{
		this.headerFunction = func;
	}
	
	//----------------------------------
	// Dynamically show header
	//----------------------------------
	
	PrintHeader()
	{
		this.headerFunction();
	}
	
	//----------------------------------
	// Print stock header
	//----------------------------------
	
	PrintStockHeader()
	{
		var emt = GHSDK.IsLinux() ? '🎸🎵 ' : '';
		
		cons.log("]=========-------->", 'cyan');
		cons.log(emt + "Guitar Hero SDK", 'white');
		cons.log("]=========-------->", 'cyan');
		console.log("");
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//----------------------------------
	// Locate skeleton packages
	//----------------------------------
	
	LocateSkeletonPackages(packDir)
	{
		var paks = [];
		
		var folders = fs.readdirSync(packDir);
		for (const fold of folders)
		{
			var fPath = path.join(packDir, fold);
			if (!fs.statSync(fPath).isDirectory())
				continue;
				
			var jsPath = path.join(fPath, 'pak.json');
			if (!fs.existsSync(jsPath))
				continue;
				
			var jsData = JSON.parse(fs.readFileSync(jsPath).toString());
			var tags = jsData['Tags'] || [];
			
			var skelIdx = tags.indexOf('skeletons');
			var skelIdx_O = tags.indexOf('skeletons_original');
			
			if (skelIdx >= 0 || skelIdx_O >= 0)
				paks.push(fold);
		}
		
		return paks;
	}
	
	//----------------------------------
	// Locate photo packages
	//----------------------------------
	
	LocatePhotoPackages(packDir)
	{
		var dirs = [];
		
		var folders = fs.readdirSync(packDir);
		for (const fold of folders)
		{
			var fPath = path.join(packDir, fold);
			if (!fs.statSync(fPath).isDirectory())
				continue;
				
			var compDir = path.join(fPath, 'Compiled');
			if (!fs.existsSync(compDir))
				continue;
				
			// Search all immediate files in compiled dir
			var imFiles = fs.readdirSync(compDir);
			var photoDir = false;
			
			for (const file of imFiles)
			{
				if (file.toLowerCase().indexOf("photo_") >= 0)
				{
					photoDir = true;
					break;
				}
			}
			
			if (photoDir)
				dirs.push(fold);
		}
		
		return dirs;
	}
	
	//----------------------------------
	// Locate script directory in a folder
	//----------------------------------
	
	LocateScriptDir(packDir)
	{	
		var folders = fs.readdirSync(packDir);
		for (const fold of folders)
		{
			var fPath = path.join(packDir, fold);
			if (!fs.statSync(fPath).isDirectory())
				continue;
				
			// If QB, use it as-is
			if (fold.toLowerCase() == 'qb')
				return fold;
			
			// Otherwise, search
			var scanned = GHSDK.ScanFolder(fPath);
			var qbCount = 0;
			
			for (const fil of scanned)
			{
				if (fil.toLowerCase().indexOf(".qb") >= 0)
					qbCount ++;
					
				if (qbCount >= 100)
					break;
			}
			
			if (qbCount >= 100)
				return fold;
		}
		
		return null;
	}
	
	//----------------------------------
	// Update user content!
	// Can be called from a mod, etc.
	//----------------------------------
	
	async UpdateUserContent(thisDir)
	{
		var modPackage = path.basename(thisDir);
		
		cons.log("Updating user content...", 'lime');
		
		cons.log("");
		cons.log("Compiling main script package...", 'grey');
		cons.log("");
		
		var packDir = path.join(thisDir, 'Packages');
		
		if (!fs.existsSync(packDir))
		{
			cons.error("Packages dir did not exist.");
			return null;
		}
		
		
		var scriptDir = this.LocateScriptDir(packDir);
		if (!scriptDir)
		{
			cons.error("Could not find main scripting package.");
			return null;
		}
		
		var compileOptions = {
			FORCE_UC_COMPILE: true
		};
		
		await GHSDK.QBHandler.PerformCompleteCompile(modPackage, scriptDir, compileOptions);
		await GHSDK.ModPackager.PackageMod(modPackage, scriptDir);
		await GHSDK.ModPackager.SyncMod(modPackage, scriptDir);
		
		cons.log("");
		cons.log("Compiling proper UI packages...", 'grey');
		cons.log("");
		
		var photoPackages = this.LocatePhotoPackages(packDir);
		
		if (photoPackages.length <= 0)
		{
			cons.error("Could not find photo packages.");
			return null;
		}
		
		for (const pp of photoPackages)
		{
			await GHSDK.ModPackager.PackageMod(modPackage, pp);
			await GHSDK.ModPackager.SyncMod(modPackage, pp);
		}
		
		cons.log("");
		cons.log("Compiling skeleton packages...", 'grey');
		cons.log("");
		
		var skelPackages = this.LocateSkeletonPackages(packDir);
		
		if (skelPackages.length <= 0)
		{
			cons.error("Could not find skeleton packages.");
			return null;
		}
		
		for (const pp of skelPackages)
		{
			await GHSDK.ModPackager.PackageMod(modPackage, pp);
			await GHSDK.ModPackager.SyncMod(modPackage, pp);
		}
		
		cons.log("");
		cons.log("User content should be sync'd.", 'lime');
		
		GHSDK.Pause();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//----------------------------------
	// Enter the stock mod menu
	//----------------------------------
	
	EnterModMenu()
	{
		this.ResetAll();
		this.SetHeader(this.PrintModdedHeader);
	}
	
	//----------------------------------
	// Print modded header
	//----------------------------------
	
	PrintModdedHeader()
	{
		var modText = "Unknown Mod";
		
		if (this.currentMod)
		{
			var theMod = GHSDK.Mods[this.currentMod];
			if (theMod)
				modText = theMod.ID;
		}
		
		cons.log("]=========-------->", 'grey');
		cons.log(modText, 'white');
		cons.log("]=========-------->", 'grey');
		console.log("");
	}
	
	//----------------------------------
	// Show main stock mod menu
	//----------------------------------
	
	async ShowMain()
	{
		GHSDK.ShowHeader();
		
		var modChoices = [];
		
		var theMod = GHSDK.Mods[this.currentMod];
		
		// GHWT only
		if (theMod.Game == 'GHWT')
		{
			modChoices.push({
				title: 'Update User Content',
				description: "Updates user-installed content.",
				value: 'main+usercontent'
			});
		}
		
		modChoices.push(GHSDK.HomeOption());
		
		var mode = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Operation",
			hint: ' ',
			choices: modChoices,
			initial: 0
		});
		
		this.Selected(mode.value);
	}
	
	//--------------------------------------------
	// Selected an option
	//--------------------------------------------
	
	Selected(val)
	{
		if (!val)
			return;
			
		// GO HOME
		if (val == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Separate it
		if (val.indexOf("+") >= 0)
		{
			var args = val.split("+");
			var argMode = args.shift();
			
			switch (argMode)
			{
				// Selecting a main option
				case 'main':
					var opt = args.shift();
					
					if (opt == 'usercontent')
					{
						var mod = GHSDK.Mods[this.currentMod];
						var modDir = mod.Directory;
						GHSDK.Constants.ModMenuHandler.UpdateUserContent(modDir);
					}
					break;
			}
			
			return;
		}
			
		this.ShowMain();
	}
}

module.exports = ModMenuHandler;
