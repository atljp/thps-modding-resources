// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// S O N G S
// Good for packaging songs!
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const MenuCore = require('../Menu_Core.js');

const path = require('path');
const fs = require('fs');

const CONVERT_ALL = 'CONVERT_ALL';

const MODE_NULL = 0;
const MODE_SONGMENU = 1;
const MODE_SELECTSONG = 2;
const MODE_SELECTDEST = 3;
const MODE_SELECTOPER = 4;
const MODE_CONVERTING = 5;

class SongsMenu extends MenuCore
{
	constructor()
	{
		super();
		
		this.title = 'Songs';
		this.description = 'Work with music!';
		this.value = 'songs';
		
		this.currentSongPath = "";
		this.currentDestPath = "";
		this.mode = MODE_NULL;
	}
	
	//--------------------------------------------
	// Selected an option
	// (Also called when opening the menu initially)
	//--------------------------------------------
	
	Selected(val)
	{
		if (!val)
			return;
			
		// Initial open
		if (val == this.value)
			this.mode = MODE_NULL;
			
		// GO HOME
		if (val == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		if (val == 'mode_convert')
		{
			this.dynamod = false;
			this.ShowSongSelect();
			return;
		}
		
		if (val == 'mode_timeliner')
		{
			GHSDK.Constants.Timeliner.FromMenu();
			return;
		}
		
		switch (this.mode)
		{
			// Select a song!
			case MODE_SELECTSONG:
				this.ShowDestinationSelect();
				return;
				break;
				
			// Where does it go?
			case MODE_SELECTDEST:
				var spl = val.split("+");
				
				this.outPath = {
					type: spl.shift(),
					value: spl.shift(),
					subtype: ''
				};

				if (spl.length)
					this.outPath.subtype = spl.shift();

				this.ShowOperationSelect();
				return;
				break;
				
			// What to do?
			case MODE_SELECTOPER:
				this.useAudio = (val == 'audio');
				this.StartConversion();
				return;
				break;
		}
			
		this.ShowMain();
	}
	
	//--------------------------------------------
	// Show main song menu
	//--------------------------------------------
	
	async ShowMain(msg)
	{
		this.mode = MODE_NULL;
		
		GHSDK.ShowHeader();
		
		var opt = [
			{
				title: 'Convert Song',
				description: '',
				value: 'mode_convert'
			},
			
			{
				title: 'Timeliner',
				description: '',
				value: 'mode_timeliner'
			}
		];
		
		opt.push(GHSDK.HomeOption());
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: opt
		});
		
		this.Selected(mod.value);
	}
	
	//--------------------------------------------
	// Show the main menu for this type
	//--------------------------------------------
	
	async ShowSongSelect()
	{
		this.mode = MODE_SELECTSONG;
		
		GHSDK.ShowHeader();
		
		// Scan songs
		var songFolder = path.join(GHSDK.Constants.DirAssets, 'Songs');
		if (!fs.existsSync(songFolder))
			fs.mkdirSync(songFolder);
			
		var songDirs = [];
		var files = fs.readdirSync(songFolder);
		
		for (const file of files)
		{
			var fPath = path.join(songFolder, file);
			if (!fs.lstatSync(fPath).isDirectory())
				continue;
				
			songDirs.push(fPath);
		}
		
		// No songs in folder!
		if (songDirs.length <= 0)
		{
			var yl = GHSDK.Constants.Chalk.keyword('yellow');
			var gr = GHSDK.Constants.Chalk.keyword('grey');
			
			cons.warn("No songs are in the directory!");
			cons.warn(yl("Place your songs in the ") + gr("Assets/Songs") + yl(" directory!"));
			GHSDK.Pause();
			return;
		}
		
		cons.log("Select a song to operate on.");
		cons.log("");
		
		// First, we've got to pick a song to work on!
		var opt = [];

		if (songDirs.length > 0)
		{
			opt.push({
				title: 'Convert All Songs',
				description: '',
				value: CONVERT_ALL
			});
		}

		for (const sd of songDirs)
		{
			opt.push({
				title: path.basename(sd),
				description: '',
				value: sd
			});
		}

		opt.push(GHSDK.HomeOption());

		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Song",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: opt
		});
		
		if (mod.value == 'gohome')
		{
			this.Selected(mod.value);
			return;
		}
		
		if (mod.value)
		{
			
			// -- CONVERT ALL SONGS --------------
			if (mod.value == CONVERT_ALL)
				this.convertList = songDirs;
			
			// -- CONVERT ONE SONG ---------------
			else
				this.convertList = [mod.value];
			
			this.Selected('true');
		}
	}
	
	//--------------------------------------------
	// Select output destination for this song
	//--------------------------------------------
	
	async ShowDestinationSelect()
	{
		this.mode = MODE_SELECTDEST;
		
		GHSDK.ShowHeader();
		
		var len = this.convertList.length;
		cons.log(len + ((len == 1) ? " song" : " songs") + " pending...", 'yellow');
		cons.log("Where should " + ((len == 1) ? "this song" : "these songs") + " go?", 'white');
		cons.log("");
		
		// First and foremost, use our game folders
		var opt = [];
		for (const key of Object.keys(GHSDK.GameConfigs))
		{
			if (key.toLowerCase() !== 'ghwt')
				continue;
			
			// (Vanilla, for normies)
			opt.push({
				title: key + ' Directory',
				description: '',
				value: 'GAME+' + key
			});
			
			// Get proper dynamic mod folder
			// (TODO: MAKE ACCEPTABLE PATH FOR WINDOZE)
			
			opt.push({
				title: key + ' Directory (DATA/MODS)',
				description: '',
				value: 'GAME+' + key + '+DYNAMOD'
			});
		}
		
		// Then, use our mod folders as UserContent
		for (const key of Object.keys(GHSDK.Mods))
		{
			var mod = GHSDK.Mods[key];
			
			if (mod.Game.toLowerCase() !== 'ghwt')
				continue;
			
			var ucDir = path.join(mod.Directory, 'UserContent', 'Songs');
			
			// Create an appropriate song dir
			// For now, just use the verbatim directory name
			
			ucDir = path.join(ucDir, path.basename(this.currentSongPath), 'Content');
			
			opt.push({
				title: mod.ID + " UserContent",
				description: '',
				value: 'MOD+' + key + '+USERCONTENT'
			});
		}
		
		opt.push(GHSDK.HomeOption());

		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Song",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: opt
		});
		
		this.Selected(mod.value);
	}
	
	//--------------------------------------------
	// Select operation for the song
	//--------------------------------------------
	
	async ShowOperationSelect()
	{
		this.mode = MODE_SELECTOPER;
		
		GHSDK.ShowHeader();

		cons.log("How should it be converted?", 'white');
		cons.log("");
		
		// First and foremost, use our game folders
		var opt = [
		
			{
				title: 'MIDI + FSB',
				description: 'Song data + audio',
				value: 'audio'
			},
			
			{
				title: 'MIDI',
				description: 'Song data only',
				value: 'no_audio'
			}
			
		];
		
		opt.push(GHSDK.HomeOption());

		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			hint: ' ',
			warn: 'WIP, check back later.',
			choices: opt
		});
		
		this.Selected(mod.value);
	}
	
	//--------------------------------------------
	// Start song conversion!
	//--------------------------------------------
	
	StartConversion()
	{
		GHSDK.ShowHeader();
		
		this.currentSongIndex = 0;
		this.ConvertPendingSong();
	}
	
	//--------------------------------------------
	// Finish conversion
	//--------------------------------------------
	
	FinishConversion()
	{
		cons.log("");
		cons.log("Converted " + this.convertList.length + ((this.convertList.length == 1) ? " song" : " songs") + "!", 'orange');
		
		GHSDK.Pause();
	}
		
	//--------------------------------------------
	// Handle the next song in conversion queue
	//--------------------------------------------
		
	ConvertPendingSong()
	{
		var inDir = this.convertList[this.currentSongIndex];
		
		var g = GHSDK.Constants.Chalk.keyword('grey');
		var y = GHSDK.Constants.Chalk.keyword('white');
		
		var ct = g("[" + (this.currentSongIndex+1) + " / " + this.convertList.length + "]");
		
		cons.log(g("Converting ") + y(path.basename(inDir)) + g("...") + " " + ct);
		cons.log("");
		
		var destPath = "";
		
		// Game directory
		if (this.outPath.type == 'GAME')
		{
			var gc = GHSDK.GameConfigs[this.outPath.value];
			destPath = path.join(gc.GameDir, gc.DefaultDataPath);
			
			if (this.outPath.subtype == 'DYNAMOD')
				destPath = path.join(destPath, 'MODS', path.basename(inDir), 'Content');
		}
		
		// Mod directory (usercontent)
		else if (this.outPath.type == 'MOD' && this.outPath.subtype == 'USERCONTENT')
		{
			var modDir = GHSDK.Mods[this.outPath.value].Directory;
			destPath = path.join(modDir, 'UserContent', 'Songs', path.basename(inDir), 'Content');
		}
		
		if (!destPath)
		{
			cons.error("Could not find proper out path.");
			return;
		}
		
		// Ensure out dir exists
		if (!fs.existsSync(destPath))
			fs.mkdirSync(destPath, {recursive: true});
			
		// Begin conversion!
		GHSDK.Constants.SongConverter.ConvertSong(inDir, destPath, {
			skipAudio: !this.useAudio
		}, (res) => {
			
			if (res.errors)
			{
				for (const err of res.errors)
					cons.error(err);
			}
			
			// Success!
			else
			{
				// Not in Songs folder, add to game setlist!
				if (this.outPath.type == 'GAME' && this.outPath.subtype !== 'DYNAMOD')
				{
					if (GHSDK.Config.SC_AddToSetlist)
						this.AddToSetList(res);
					else
						cons.warn("Not adding to setlist. Do this yourself!");
				}
					
				// It is UserContent! Generate appropriate INI
				else
					this.GenerateUserINI(destPath, res);
			}
			
			// Next in queue!
			this.currentSongIndex ++;
			
			// Done?
			if (this.currentSongIndex >= this.convertList.length)
				this.FinishConversion();
			else
			{
				cons.log("");
				cons.log("----------------", "grey");
				cons.log("");
				
				this.ConvertPendingSong();
			}
		});
	}
	
	//--------------------------------------------
	// Add song to setlist
	// By doing this, we want qb.pak or similar
	//--------------------------------------------
	
	AddToSetList(res)
	{
		// Which .pak file do we want to add it to?
		// By calling this function, we're not doing UserContent
		//
		// TODO: For the moment, this is GHWT only, we should detect game config
		
		var songPak = GHSDK.Config.SC_OutPath;
		var pakPath = path.join(this.currentDestPath, 'PAK', songPak);
		
		if (!fs.existsSync(pakPath))
		{
			cons.warn(songPak + " did not exist in the game directory.");
			return;
		}
		
		cons.log("Adding to setlist...");
		GHSDK.Constants.SongConverter.SetlistHandler.AddToSetlist(pakPath, res.info);
	}
	
	//--------------------------------------------
	// Generate INI for Dynamod (GHWT:DE)
	//--------------------------------------------
	
	GenerateDynamodINI(res)
	{
		var contPath = path.join(this.currentDestPath, 'Mod.ini');
		var iniLines = [];
		
		iniLines.push("[ModInfo]");
		iniLines.push("Name=" + path.basename(this.currentDestPath));
		iniLines.push("Author=GHSDK");
		iniLines.push("Description=Converted with GHSDK importer.");
		iniLines.push("");
		iniLines.push("[SongInfo]");
		iniLines.push("Checksum=" + res.info.checksum[0]);
		iniLines.push("Name=" + ((res.info.name && res.info.name[0]) || "Dummy Title"));
		iniLines.push("Artist=" + ((res.info.artist && res.info.artist[0]) || "Dummy Artist"));
		iniLines.push("Year=" + ((res.info.year && res.info.year[0]) || 1969));
		iniLines.push("ArtistText=artist_text_by");
		iniLines.push("OriginalArtist=1");
		iniLines.push("Leaderboard=1");
		iniLines.push("Singer=" + ((res.info.singer && res.info.singer[0]) || "none"));
		iniLines.push("Genre=Rock");
		iniLines.push("Countoff=sticks_normal");
		iniLines.push("Drumkit=heavyrock");
		
		var band = (res.info.band && res.info.band[0])
		if (band)
			iniLines.push("Band=" + band);
		
		var vol = 0.0;
		vol = res.info.overall_song_volume == undefined ? vol : res.info.overall_song_volume[0];
		vol = res.info.volume == undefined ? vol : res.info.volume[0];
		 
		iniLines.push("Volume=" + vol.toString());
		
		if (res.info.game_icon)
			iniLines.push("Logo=" + res.info.game_icon[0]);
			
		if (res.info.category)
			iniLines.push("Category=" + res.info.category[0]);
			
		fs.writeFileSync(contPath, iniLines.join("\n"));
		
		cons.log("Mod.ini written.");
	}
	
	//--------------------------------------------
	// Generate INI for UserContent
	//--------------------------------------------
	
	GenerateUserINI(destPath, res)
	{
		var contPath = path.join(destPath, '..', 'song.ini');
			
		var iniLines = [];
		
		iniLines.push("[ModInfo]");
		iniLines.push("Name=" + path.basename(path.dirname(contPath)));
		iniLines.push("Description=Converted with GHSDK importer.");
		iniLines.push("Author=GHSDK");
		iniLines.push("Version=1.0");
		iniLines.push("");
		
		iniLines.push("[SongInfo]");
		iniLines.push("Checksum=" + res.info.checksum[0]);
		iniLines.push("Title=" + ((res.info.name && res.info.name[0]) || "Dummy Title"));
		iniLines.push("Artist=" + ((res.info.artist && res.info.artist[0]) || "Dummy Artist"));
		iniLines.push("Year=" + ((res.info.year && res.info.year[0]) || 1969));
		iniLines.push("ArtistText=artist_text_by");
		iniLines.push("OriginalArtist=1");
		iniLines.push("Leaderboard=1");
		iniLines.push("Singer=" + ((res.info.singer && res.info.singer[0]) || "none"));
		iniLines.push("Genre=Rock");
		iniLines.push("Countoff=sticks_normal");
		iniLines.push("Drumkit=heavyrock");
		
		var vol = 0.0;
		vol = res.info.overall_song_volume == undefined ? vol : res.info.overall_song_volume[0];
		vol = res.info.volume == undefined ? vol : res.info.volume[0];
		 
		iniLines.push("Volume=" + vol.toString());
		
		if (res.info.game_icon)
			iniLines.push("GameIcon=" + res.info.game_icon[0]);
			
		if (res.info.category)
			iniLines.push("GameCategory=" + res.info.category[0]);
			
		if (res.info.band)
			iniLines.push("Band=" + res.info.band[0]);
			
		fs.writeFileSync(contPath, iniLines.join("\n"));
		
		cons.log("UserContent song.ini written.");
	}
}

module.exports = new SongsMenu();
