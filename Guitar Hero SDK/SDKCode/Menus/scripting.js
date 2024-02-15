// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// S C R I P T I N G
// Controls all scripting-related menus.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const MenuCore = require('../Menu_Core.js');

const path = require('path');
const fs = require('fs');

// Which mode are we operating in?
const MODE_COMPILE = 0;
const MODE_DECOMPILE = 1;
const MODE_SEARCH = 2;

class ScriptingMenu extends MenuCore
{
	constructor()
	{
		super();
		
		this.title = 'Scripting';
		this.description = 'Wrangle some code.';
		this.value = 'scripting';
		
		// Operation to use
		this.mode = MODE_COMPILE;
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
				
					if (args[0] == 'compile')
					{
						this.mode = MODE_COMPILE;
						this.StartCompile();
					}
					else if (args[0] == 'decompile')
					{
						GHSDK.ShowHeader();
						cons.warn("Decompiling is not supported yet.");
						cons.log("Try again in the future.");
						GHSDK.Pause();
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
					title: 'Compile',
					description: "Compiles the package's QB source code.",
					value: 'mode+compile'
				},
				//~ {
					//~ title: 'Decompile',
					//~ description: "Decompiles the package's QB source code.",
					//~ value: 'mode+decompile'
				//~ },
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		this.Selected(mode.value);
	}
	
	// Start decompiling a mod
	//~ StartDecompile()
	//~ {
		//~ sdk.PrintLogo(true);
		
		//~ sdk.QBHandler.Decompile(this.selectedMod, result => {
			//~ if (result.error)
				//~ cons.error(result.error);
			//~ else if (result.message)
				//~ cons.log(result.message, 'lime');
				
			//~ this.SimPause();
		//~ });
	//~ }
	
	//--------------------------------------------
	// Start compiling a mod
	//--------------------------------------------
	
	async StartCompile()
	{
		GHSDK.ShowHeader();
		await GHSDK.QBHandler.PerformCompleteCompile(this.selectedMod, this.selectedPackage);
		GHSDK.Pause();
	}
}

module.exports = new ScriptingMenu();
