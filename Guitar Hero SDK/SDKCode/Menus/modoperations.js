// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// M O D   O P E R A T I O N S
// Control things about modding
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const MenuCore = require('../Menu_Core.js');

const path = require('path');
const fs = require('fs');

class ModOperationMenu extends MenuCore
{
	constructor()
	{
		super();
		
		this.title = 'Mods';
		this.description = 'Handle mods in unique ways.';
		this.value = 'modoperations';
		
		this.selectedMod = "";
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
					var modName = args.shift();
					
					this.selectedMod = modName;

					// Assign it to GHSDK as current logic
					GHSDK.Constants.ModMenuHandler.currentMod = modName;

					var menuLogic = GHSDK.Mods[modName].Menus;
					
					// Use custom logic
					if (menuLogic)
					{
						GHSDK.ModMenuLogic = menuLogic;
						
						if (GHSDK.ModMenuLogic.EnterModMenu)
							GHSDK.ModMenuLogic.EnterModMenu();
							
						GHSDK.ModMenuLogic.ShowMain();
					}
					
					// Use stock logic
					else
					{
						GHSDK.ModMenuLogic = null;
						
						GHSDK.Constants.ModMenuHandler.EnterModMenu();
						GHSDK.Constants.ModMenuHandler.currentMod = modName;
						GHSDK.Constants.ModMenuHandler.ShowMain();
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
		
		// First, we've got to pick a mod we're interested in
		
		var opt = [];
		
		var keys = Object.keys(GHSDK.Mods);
		
		for (const key of keys)
		{
			var theMod = GHSDK.Mods[key];

			opt.push({
				title: theMod.ID,
				description: theMod.Description || '',
				value: "modselect+" + key
			});
		}

		opt.push(GHSDK.HomeOption());

		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Mod",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: opt,
			initial: 0
		});
		
		this.Selected(mod.value);
	}
}

module.exports = new ModOperationMenu();
