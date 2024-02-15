// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	G H S D K   E A S Y   S E T U P
//		Assists users in setting up the SDK instead of manually
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const path = require('path');
const fs = require('fs');

const baseModName = 'GHWTBaseMod';

class EasySetup
{
	constructor() {}
	
	//----------------------------
	// Begin setup process
	//----------------------------
	
	async BeginSetup()
	{
		this.cache = {};
		
		GHSDK.ShowHeader();
		
		cons.log('Whoa there!', 'orange');
		cons.log('Something went terribly wrong!', 'orange');
		cons.log('');
		cons.log('GHSDK could not detect the proper configuration files.', 'white');
		cons.log('(or they were broken!)', 'white');
		cons.log('');
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Would you like interactive help?",
			hint: ' ',
			choices: [
				{
					title: 'Yes, I need help',
					value: 'yes'
				},
				{
					title: 'I can do it manually',
					value: 'no'
				}
			],
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// User will do it manually
		if (val.value == 'no')
		{
			GHSDK.ShowHeader();
			
			cons.log('You have chosen manual setup.', 'lime');
			cons.log('');
			cons.log('Follow the instructions on the repository or', 'white');
			cons.log('look at README.MD for config setup instructions.', 'white');
			
			GHSDK.Pause(false);
			return;
		}
		
		// Begin by setting up our game
		this.SetupGameConfig();
	}
	
	//----------------------------
	// Let's setup the game config!
	//----------------------------
	
	async SetupGameConfig()
	{
		GHSDK.ShowHeader();
		
		cons.log('No problem!', 'lime');
		cons.log('');
		cons.log('GHSDK needs to know where your game is located.', 'white');
		cons.log('Please grab the absolute path of your ' + GHSDK.Constants.DefaultGame + ' directory.', 'white');
		cons.log('');
		cons.log('A path should look like so:', 'white');
		cons.log('');
		cons.log('C:/Program Files/Aspyr/Guitar Hero World Tour', 'yellow');
		cons.log('');
		
		var val = await GHSDK.Constants.Prompts({
			type: 'text',
			name: 'gamedir',
			message: 'Where is your game directory?'
		});
		
		if (!val)
			return;
		
		var gameDir = val.gamedir;
		
		// Bad folder
		if (!fs.existsSync(gameDir))
		{
			GHSDK.ShowHeader();
			
			var y = GHSDK.Constants.Chalk.keyword('yellow');
			var o = GHSDK.Constants.Chalk.keyword('orange');
			
			cons.log(y(gameDir) + o(" is not a valid path."));
			cons.log('');
			cons.log('Please enter a directory that exists.', 'orange');
			await GHSDK.Pause(false);
			this.SetupGameConfig();
			return;
		}
		
		// Folder DOES exist!
		this.cache.gameFolder = gameDir;
		
		this.SetupNodeROQ();
	}
	
	//----------------------------
	// Setup NodeROQ
	//----------------------------
	
	async SetupNodeROQ()
	{
		GHSDK.ShowHeader();
		
		// Do we have noderoq installed as a module?
		// If so, detect that it's installed
		
		var hasStock = false;
		var stockDir = path.join(GHSDK.Constants.DirSDK, 'noderoq');
		
		if (fs.existsSync(stockDir))
		{
			// Check for Main.js
			if (fs.existsSync(path.join(stockDir, 'Main.js')))
				hasStock = true;
		}
		
		if (hasStock)
		{
			if (GHSDK.IsLinux())
				cons.log('🎉 Congratulations! NodeROQ is detected! 🎉', 'lime');
			else
				cons.log('Congratulations! NodeROQ is detected!', 'lime');
			
			cons.log('GHSDK will not bother trying to find it elsewhere.', 'lime');
			cons.log('');
			cons.log('(Good job following the instructions!)', 'yellow');
			cons.log('');
			cons.log("Sit tight, we're almost done!", 'white');
			
			await GHSDK.Pause(false);
			this.FinalizeSettings();
			return;
		}
		
		// They don't have NodeROQ, oh dear
		cons.log('Oh no, NodeROQ was missing!', 'orange');
		cons.log('Following repository instructions should have pulled it!', 'orange');
		cons.log('');
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Do you have a NodeROQ folder elsewhere?",
			hint: ' ',
			choices: [
				{
					title: 'Yes, this is intentional',
					value: 'yes'
				},
				{
					title: 'No, what is NodeROQ?',
					value: 'no'
				}
			],
			initial: 0
		});
		
		if (!val.value)
			return;
			
		// They don't have one and aren't interested in locating it
		if (val.value == 'no')
		{
			GHSDK.ShowHeader();
			
			cons.log('Please follow the instructions on the repository thoroughly.', 'orange');
			cons.log('NodeROQ is a script compiler required for operation.', 'orange');
			cons.log('');
			cons.log('If you have an install of NodeROQ elsewhere, please specify.', 'orange');
			
			await GHSDK.Pause(false);
			return;
		}
		
		// So they DO have one elsewhere, let's find it...
		GHSDK.ShowHeader();
		
		cons.log('GHSDK supports a custom path to your NodeROQ directory.', 'white');
		cons.log('');
		cons.log('You have decided to specify an external path.', 'yellow');
		cons.log('');
		
		var val = await GHSDK.Constants.Prompts({
			type: 'text',
			name: 'nodedir',
			message: 'Where is your NodeROQ directory?'
		});
		
		if (!val)
			return;
		
		var nodeDir = val.nodedir;
		
		if (!fs.existsSync(nodeDir))
		{
			GHSDK.ShowHeader();
			
			var y = GHSDK.Constants.Chalk.keyword('yellow');
			var o = GHSDK.Constants.Chalk.keyword('orange');
			
			cons.log(y(nodeDir) + o(" is not a valid path."));
			cons.log('');
			cons.log('Please enter a directory that exists.', 'orange');
			await GHSDK.Pause(false);
			this.SetupNodeROQ();
			return;
		}
		
		// Check for Main.js to make sure it's a valid NodeROQ dir
		
		if (!fs.existsSync( path.join(nodeDir, 'Main.js') ))
		{
			GHSDK.ShowHeader();
			
			cons.log('This is not a valid NodeROQ directory.', 'yellow');
			cons.log('');
			cons.log('Please pull a working NodeROQ install from the repository.', 'orange');
			await GHSDK.Pause(false);
			this.SetupNodeROQ();
			return;
		}
		
		this.cache.nodeDir = nodeDir;
		this.FinalizeSettings();
	}
	
	//----------------------------
	// Setup mod folders
	//----------------------------
	
	async FinalizeSettings()
	{
		GHSDK.ShowHeader();
		
		cons.log('Game Directory:', 'white');
		cons.log(this.cache.gameFolder, 'lime');
		
		// Show node dir if we set it manually
		// Otherwise, don't confuse the user
		
		if (this.cache.nodeDir)
		{
			cons.log('');
			cons.log('NodeROQ Directory:', 'white');
			cons.log(this.cache.nodeDir, 'lime');
		}
			
		cons.log('');
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Is this okay?",
			hint: ' ',
			choices: [
				{
					title: 'Yes, these settings are okay',
					value: 'yes'
				},
				{
					title: "No, let me restart",
					value: 'no'
				}
			],
			initial: 0
		});
		
		if (!val.value)
			return;
			
		// Reset our settings!
		if (val.value == 'no')
		{
			this.BeginSetup();
			return;
		}
		
		// Our settings are good, let's save them!
		this.SaveSettings();
		
		// Offer to make a base mod if they'd like
		this.SetupBaseMod();
	}
	
	//----------------------------
	// Save our cached settings
	//----------------------------
	
	SaveSettings()
	{
		var cfgDir = GHSDK.Constants.DirConfig;
		GHSDK.EnsureDirectory(cfgDir);
		
		var iniPath = path.join(cfgDir, 'config.ini');
		var iniLines = [
			'[SDKConfig]',
			'DefaultMod=qb'
		];
		
		if (this.cache.nodeDir)
			iniLines.push('NodeROQPath=' + this.cache.nodeDir);
			
		if (this.cache.modFolders)
		{
			for (const mf of this.cache.modFolders)
				iniLines.push('ModFolders=' + mf);
		}
			
		var iniDir = path.dirname(iniPath);
		if (!fs.existsSync(iniDir))
			fs.mkdirSync(iniDir, {recursive: true});
			
		fs.writeFileSync(iniPath, iniLines.join("\n"));
		
		// - - - - - - - - - - -
		
		var gameINIPath = path.join(cfgDir, 'Games', GHSDK.Constants.DefaultGame + '.ini');
		GHSDK.EnsureDirectory(gameINIPath);
		
		var iniLines = [
			'[GameConfig]',
			'GameDir=' + this.cache.gameFolder,
			'DefaultPakPath=DATA/PAK'
		];
		
		fs.writeFileSync(gameINIPath, iniLines.join("\n"));
	}
	
	//----------------------------
	// Setup the template GHWT mod
	//----------------------------
	
	async SetupBaseMod()
	{
		GHSDK.ShowHeader();
		
		var o = GHSDK.Constants.Chalk.keyword('orange');
		var w = GHSDK.Constants.Chalk.keyword('white');
		
		cons.log('GHSDK allows the option to start from a base mod.', 'white');
		cons.log(w("The template mod is for ") + o("Guitar Hero: World Tour") + w("."));
		cons.log('');
		cons.log('If you are installing user content, you need a mod!', 'yellow')
		cons.log('')
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Would you like to utilize the template mod?",
			hint: ' ',
			choices: [
				{
					title: 'Yes, I would like a base',
					value: 'yes'
				},
				{
					title: "No thanks, let's continue",
					value: 'no'
				}
			],
			initial: 0
		});
		
		if (!val.value)
			return;
			
		// No base mod, we're done
		if (val.value == 'no')
		{
			this.EndSetup();
			return;
		}
		
		// They do want to setup a base mod
		GHSDK.ShowHeader();
		
		var o = GHSDK.Constants.Chalk.keyword('orange');
		var w = GHSDK.Constants.Chalk.keyword('white');
		
		cons.log(w('GHSDK is going to copy ') + o(baseModName) + w(' to your game directory.'));
		cons.log('It will also be added automatically as a ModFolder in the SDK.', 'grey');
		
		await GHSDK.Pause(false);
		
		// Copy the base mod!
		// FS has no method to copy folders, it seems
		
		var baseModDir = path.join(GHSDK.Constants.DirSDK, baseModName);
		var outDir = path.join(this.cache.gameFolder, baseModName);
		
		var tempFiles = GHSDK.ScanFolder(baseModDir);
		
		for (const file of tempFiles)
		{
			var rel = path.relative(baseModDir, file);
			var outFile = path.join(outDir, rel);
			
			GHSDK.EnsureDirectory(outFile);
			fs.copyFileSync(file, outFile);
		}
		
		// Add it as a mod folder
		this.cache.modFolders = [outDir];
		
		// Re-save config
		this.SaveSettings();
		
		// WE ARE FINISHED
		this.EndSetup();
	}
	
	//----------------------------
	// End the setup
	//----------------------------
	
	async EndSetup()
	{
		GHSDK.ShowHeader();
		
		cons.log('GHSDK is ready to rock and roll!', 'lime');
		cons.log('');
		cons.log('Check future documentation for any issues.', 'grey');
		cons.log('Remember that you can edit config files at any time.', 'grey');
		cons.log('');
		cons.log('Restart the SDK to apply your new settings.', 'yellow');
		cons.log('');
		cons.log('Enjoy your modding experience!', 'lime');
		
		await GHSDK.Pause(false);
	}
}

module.exports = EasySetup;
