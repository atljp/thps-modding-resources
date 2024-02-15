// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// P A C K A G I N G
// Good for packaging packages.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const MenuCore = require('../Menu_Core.js');

const path = require('path');
const fs = require('fs');

// Which mode are we operating in?
const MODE_PACK = 0;
const MODE_UNPACK = 1;
const MODE_SYNC = 2;
const MODE_PACKSYNC = 3;

class PackagingMenu extends MenuCore
{
	constructor()
	{
		super();
		
		this.title = 'Packaging';
		this.description = 'Bundle individual mod packages.';
		this.value = 'packaging';
		
		// Operation to use
		this.mode = MODE_PACK;
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
		
		// Separate if it has underscores
		if (val.indexOf("+") >= 0)
		{
			var args = val.split("+");
			var argMode = args.shift();
			
			switch (argMode)
			{
				// Selecting a mod
				case 'modselect':
					var modName = args[0];
					var modPackage = args[1];
					
					this.selectedMod = modName;
					this.selectedPackage = modPackage;

					// Refresh!
					//~ if (mod.value == 'refresh')
					//~ {
						//~ this.ShowMain('Scripting mods refreshed.');
						//~ return;
					//~ }
					
					// What do we want to do with it?
					this.ShowModeMenu();
					break;
					
				// Selecting what to do with package
				case 'mode':
				
					if (args[0] == 'pack')
					{
						this.mode = MODE_PACK;
						
						this.PackageTheMod(true);
					}
					else if (args[0] == 'pack_sync')
					{
						this.mode = MODE_PACKSYNC;
						this.PackageAndSync();
						return;
					}
					else if (args[0] == 'unpack')
					{
						GHSDK.ShowHeader();
						cons.warn("Unpacking is not supported yet.");
						cons.log("Try again in the future.");
						GHSDK.Pause();
						return;
					}
					else if (args[0] == 'sync')
					{
						this.mode = MODE_SYNC;
						
						this.SyncTheMod(true);
						return;
					}
				
					break;
			}
			
			return;
		}
			
		this.ShowMain();
	}
	
	//--------------------------------------------
	// Show the main menu for this type
	//--------------------------------------------
	
	async ShowMain(msg)
	{
		GHSDK.ShowHeader();
		
		// Show the last message, if we had one
		if (msg)
		{
			cons.log(msg)
			cons.log("");
		}
		
		// First, we've got to pick a package to work on!
		
		var opt = [];
		
		var keys = Object.keys(GHSDK.Mods);
		
		for (const key of keys)
		{
			var theMod = GHSDK.Mods[key];
			
			// Loop through its packages
			var pkeys = Object.keys(theMod.Packages);
			
			for (const pkey of pkeys)
			{
				var thePack = theMod.Packages[pkey];
				
				var ttl = pkey.padEnd(20, " ") + GHSDK.Constants.Chalk.keyword('orange')("[" + key + "]");
				
				opt.push({
					title: ttl,
					description: '',
					value: "modselect+" + key + "+" + pkey
				});
			}
		}
		
		// Refresh option
		//~ opt.push({
			//~ title: sdk.chalk.green('Refresh Scripting Mods'),
			//~ description: 'Refreshes list of script directories.',
			//~ value: 'refresh'
		//~ });
		
		opt.push(GHSDK.HomeOption());
		
		// By default, we ALWAYS want the option with thugpro_qb
		// This will make it so we can just smash enter
		//~ var def = sdk.QBHandler.FindDefaultMod(opt);
		
		var def = 0;
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Package",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: opt,
			initial: def
		});
		
		this.Selected(mod.value);
	}
	
	//--------------------------------------------
	// Show the mode menu!
	//--------------------------------------------
	
	async ShowModeMenu()
	{
		GHSDK.ShowHeader();
		
		cons.log('Selected Package: ' + this.selectedPackage, 'yellow');
		console.log("");
		
		var mode = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Package Operations",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: [
				{
					title: 'Pack + Sync',
					description: "Packages the mod and moves it to the game dir.",
					value: 'mode+pack_sync'
				},
				{
					title: 'Pack',
					description: "Packages the mod's contents without moving.",
					value: 'mode+pack'
				},
				//~ {
					//~ title: 'Unpack',
					//~ description: "Extracts the mod.",
					//~ value: 'mode+unpack'
				//~ },
				{
					title: 'Sync',
					description: "Moves the mod's data to the game dir.",
					value: 'mode+sync'
				},
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		this.Selected(mode.value);
	}
	
	//--------------------------------------------
	// Package AND SYNC a mod
	//--------------------------------------------
	
	async PackageAndSync()
	{
		GHSDK.ShowHeader(true);
		
		var res = await this.PackageTheMod(false);
		
		if (res)
			await GHSDK.ModPackager.SyncMod(this.selectedMod, this.selectedPackage);
		
		GHSDK.Pause();
	}
	
	//--------------------------------------------
	// Package the mod we want
	//--------------------------------------------
	
	async PackageTheMod(lengthy = false)
	{
		if (lengthy)
			GHSDK.ShowHeader();
			
		var packageAttempt = await GHSDK.ModPackager.PackageMod(this.selectedMod, this.selectedPackage);
		
		if (packageAttempt == 'error')
			return false;

		if (lengthy)
			GHSDK.Pause();
			
		return true;
	}
	
	//--------------------------------------------
	// Sync the mod we want
	//--------------------------------------------
	
	async SyncTheMod(lengthy = false)
	{
		if (lengthy)
			GHSDK.ShowHeader();
			
		var res = await GHSDK.ModPackager.SyncMod(this.selectedMod, this.selectedPackage);
		
		if (res == 'nocontent')
		{
			cons.warn("This package has no Content directory.");
			cons.warn("There is nothing to sync!");
			
			GHSDK.Pause();
			return;
		}
		
		if (lengthy)
			GHSDK.Pause();
	}
}

module.exports = new PackagingMenu();
