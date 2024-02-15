// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S E T L I S T   H A N D L E R
//	Deals with setlist functions
//
//	Passed-in options:
//		checksum
//		artist
//		title
//		year
//		genre
//		[category]
//		[game_icon]
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

const UNK_SETUP = 0x5713F4FF;
const UNK_HACKED = 0xBABABABA;

const HACKPATH = path.join(__dirname, 'Hack', 'ui_setlist_buldy.qb.xen');
const HACKPATH_SONGLIST = path.join(__dirname, 'Hack', 'is_song_downloaded.qb');

class SetlistHandler
{
	constructor(converter) { this.converter = converter; }
	
	//-----------------------
	// Add song to pak setlist
	//-----------------------
	
	AddToSetlist(pakLocation, opt = {})
	{
		this.dlcIndex = -1;
		this.songlistIndex = -1;
		this.setlistIndex = -1;
		this.options = opt;
		
		// Create a backup file, just in case
		var backup = pakLocation + '.baksdk';
		if (fs.existsSync(backup))
			fs.unlinkSync(backup);
		fs.copyFileSync(pakLocation, backup);
		
		// Create a backup .pab file too
		var pabLocation = pakLocation.replace('.pak', '.pab');
		if (fs.existsSync(pabLocation))
		{
			var backup = pabLocation + '.baksdk';
			if (fs.existsSync(backup))
				fs.unlinkSync(backup);
			fs.copyFileSync(pabLocation, backup);
		}
		
		this.ParsePak(pakLocation);
		
		if (!this.dlcIndex && !this.songlistIndex && !this.setlistIndex)
		{
			cons.error("DLC, Songlist, or Setlist QB files not found.");
			return false;
		}
		
		// Have we done Buldy hacks?
		this.buldyHack = false;
		
		var patchA = this.PatchDLC();
		var patchB = this.PatchSonglist();
		var patchC = this.PatchSetlist();
		
		if (!patchA || !patchB || !patchC)
		{
			cons.error("DLC / Songlist patching went wrong.");
			return false;
		}
		
		// Buldy hacks? Make convenient backups just in case
		if (this.buldyHack)
		{
			var pakDir = path.dirname(pakLocation);
			var backupDir = path.join(pakDir, 'PREPATCH');
			
			if (!fs.existsSync(backupDir))
				fs.mkdirSync(backupDir, {recursive: true});
				
			var outPak = path.join(backupDir, path.basename(pakLocation) + '.prepatch');
			var outPab = outPak.replace(".pak.xen", ".pab.xen");
			
			fs.copyFileSync(pakLocation, outPak);
			if (fs.existsSync(pabLocation))
				fs.copyFileSync(pabLocation, outPab);
				
			cons.log("");
			cons.log("Your QB file was unpatched. GHSDK has", 'orange');
			cons.log("performed necessary patches to ensure", 'orange');
			cons.log("that your custom songs can be used.", 'orange');
			cons.log("");
			cons.log("Backups have been placed in:", 'orange');
			cons.log("");
			cons.log(backupDir, 'yellow');
			cons.log("");
		}
		
		// Now, re-compile the pak
		GHSDK.PakHandler.Compile(this.headers, pakLocation, {usePAB: true});
	}
	
	//-----------------------
	// Extract the qb .pak
	//-----------------------
	
	ParsePak(pakLocation)
	{
		this.headers = GHSDK.PakHandler.Extract(pakLocation, "", {dataOnly: true});
		
		var KEY_DLC = Checksums.Make('scripts/guitar/guitar_download.qb');
		var KEY_SONGLIST = Checksums.Make('scripts/guitar/songlist.qb');
		var KEY_SETLIST = Checksums.Make('scripts/guitar/menu/states/layouts/ui_setlist.qb');
		
		for (var p=0; p<this.headers.length; p++)
		{
			if (this.headers[p].fullName == KEY_DLC)
				this.dlcIndex = p;
				
			if (this.headers[p].fullName == KEY_SONGLIST)
				this.songlistIndex = p;	
				
			if (this.headers[p].fullName == KEY_SETLIST)
				this.setlistIndex = p;	
		}
	}
	
	//-----------------------
	// Patch DLC file
	//-----------------------
	
	PatchDLC()
	{
		var dat = this.headers[this.dlcIndex].data;
		
		// Parse into QB format
		var qb = GHSDK.QBHandler.Decompile(dat, {reader: true});
		qb.SearchForFilename();
		
		// Try to find DLC list
		var dlcSection = qb.ChildByID('GH4_download_songlist');

		if (!dlcSection)
		{
			cons.error("Could not find DLC section.");
			return false;
		}
		
		// If first item is Floats type, we've never added DLC before!
		// Pop floats and replace with proper array
		
		var firstChild = dlcSection.items[0];
		if (firstChild.typeName == 'Floats')
		{
			dlcSection.items = [];
			
			var placKey = Checksums.Make('placeholdersong');
			var cls = ItemTypes.classes;
			var qbk = new cls.ArrayQBKey({itemName: 'ArrayQBKey', parent: dlcSection});
			qbk.values = [placKey];
		}
		
		// New item will be array, by default or forced
		var dlcArray = dlcSection.items[0];
		
		// Generate QBKey for the song we'd like to add
		var songKey = Checksums.Make(this.options.checksum[0]);
		
		// Value already exists?
		var hasSong = false;
		for (const val of dlcArray.values)
		{
			if (val == songKey)
			{
				hasSong = true;
				break;
			}
		}
		
		if (!hasSong)
			dlcArray.values.push(songKey);
			
		// Now recompile the file
		var w = new GHSDK.Constants.Writer();
		var newData = qb.ToBytesCore_Whole(w);
		
		this.headers[this.dlcIndex].data = w.buffer;
		
		// Debug decompile
		//~ var txt = qb.ToTextCore();
		//~ fs.writeFileSync(path.join(__dirname, 'qb_dlc.txt'), txt);
		
		return true;
	}
	
	//-----------------------
	// Patch songlist file
	//-----------------------
	
	PatchSonglist()
	{
		var dat = this.headers[this.songlistIndex].data;
		
		// Parse into QB format
		var qb = GHSDK.QBHandler.Decompile(dat, {reader: true});
		qb.SearchForFilename();
		
		// Try to find songlist props
		var propStruct = qb.ChildByID('download_songlist_props');

		if (!propStruct)
		{
			cons.error("Could not find download_songlist_props");
			return false;
		}
		
		var hed = propStruct.items[0];
		var cls = ItemTypes.classes;
		
		// Find info if it exists, create it otherwise
		var infoStruct = hed.ChildByID(this.options.checksum[0]);
		
		// Create fresh new struct!
		if (!infoStruct)
			infoStruct = new cls.StructItemStruct({itemName: 'StructItemStruct', parent: hed});
			
		infoStruct.id = this.options.checksum[0];
		
		// Make sure it has a header
		var infoHeader = infoStruct.items[0];
		if (!infoHeader)
			infoHeader = new cls.StructHeader({itemName: 'StructHeader', parent: infoStruct});
			
		// Checksum
		var prop_checksum = infoHeader.Child_FindOrCreate('checksum', 'id', 'StructItemQBKey');
		prop_checksum.value = this.options.checksum[0];
		
		// Name
		var prop_name = infoHeader.Child_FindOrCreate('name', 'id', 'StructItemString');
		prop_name.value = this.options.checksum[0];
		
		// Title
		var prop_title = infoHeader.Child_FindOrCreate('Title', 'id', 'StructItemString');
		prop_title.value = "\\L" + ((this.options.name && this.options.name[0]) || "Dummy Song").toUpperCase();
		
		// Artist
		var prop_artist = infoHeader.Child_FindOrCreate('Artist', 'id', 'StructItemString');
		prop_artist.value = "\\L" + ((this.options.artist && this.options.artist[0]) || "Anonymous").toUpperCase();
		
		// Year
		var prop_year = infoHeader.Child_FindOrCreate('year', 'id', 'StructItemString');
		prop_year.value = "\\L, " + ((this.options.year && this.options.year[0]) || 1969).toString();
		
		// Singer
		var prop_singer = infoHeader.Child_FindOrCreate('singer', 'id', 'StructItemQBKey');
		prop_singer.value = (this.options.singer && this.options.singer[0]) || 'none';
		
		// Genre (TODO)
		var prop_genre = infoHeader.Child_FindOrCreate('genre', 'id', 'StructItemQBKey');
		prop_genre.value = 'Rock';
		
		// Countoff
		var prop_countoff = infoHeader.Child_FindOrCreate('countoff', 'id', 'StructItemString');
		prop_countoff.value = (this.options.countoff && this.options.countoff[0]) || 'sticks_normal';
		
		// Drumkit
		var prop_drumkit = infoHeader.Child_FindOrCreate('drum_kit', 'id', 'StructItemString');
		prop_drumkit.value = (this.options.drum_kit && this.options.drum_kit[0]) || 'heavyrock';
		
		// Volume
		var songVol = 0.0;
		var optVal = (this.options.overall_song_volume && overall_song_volume[0]) || (this.options.volume && this.options.volume[0]);
		
		if (optVal)
			songVol = parseFloat(optVal);
			
		//--------------------------------
		
		// Special properties
		
		// GAME ICON: Ensure or remove if needed
		var prop_gameicon = infoHeader.ChildByID('game_icon');
		if (prop_gameicon)
		{
			if (this.options.game_icon)
				prop_gameicon.value = this.options.game_icon[0];
			else
				infoHeader.RemoveChild(prop_gameicon);
		}
		else if (this.options.game_icon)
		{
			prop_gameicon = new cls.StructItemQBKey({itemName: 'StructItemQBKey', id: 'game_icon', value: this.options.game_icon[0], parent: infoHeader});
		}
		
		// CATEGORY: Ensure or remove if needed
		var prop_category = infoHeader.ChildByID('category');
		if (prop_category)
		{
			if (this.options.category)
				prop_category.value = this.options.category[0];
			else
				infoHeader.RemoveChild(prop_category);
		}
		else if (this.options.category)
		{
			prop_category = new cls.StructItemQBKey({itemName: 'StructItemQBKey', id: 'category', value: this.options.category[0], parent: infoHeader});
		}
		
		//--------------------------------
			
		var prop_volume = infoHeader.Child_FindOrCreate('overall_song_volume', 'id', 'StructItemFloat');
		prop_volume.value = songVol;
		
		//--------------------------------
		
		// While we're here, let's perform Buldy patch on script
		
		var isd_script = qb.ChildByID('is_song_downloaded');
		if (!isd_script)
		{
			cons.error("Could not find is_song_downloaded script.");
			return false;
		}
		
		// Has it already been hacked?
		var str = isd_script.data.toString('ascii');
		if (str.indexOf("song.pak") >= 0)
		{
			var hackDat = fs.readFileSync(HACKPATH_SONGLIST);
			isd_script.SetData(hackDat, true);
			
			this.buldyHack = true;
			
			cons.log("Songlist script patched!");
		}
		
		//--------------------------------
		
		// Now recompile the file
		var w = new GHSDK.Constants.Writer();
		var newData = qb.ToBytesCore_Whole(w);
		
		// Debug decompile
		//~ var txt = qb.ToTextCore();
		//~ fs.writeFileSync(path.join(__dirname, 'qb_songlist.txt'), txt);
		
		this.headers[this.songlistIndex].data = w.buffer;
		
		return true;
	}
	
	//-----------------------
	// Patch Setlist file
	// (Mods it to allow custom songs)
	//-----------------------
	
	PatchSetlist()
	{
		var dat = this.headers[this.setlistIndex].data;
		
		// Parse into QB format
		var qb = GHSDK.QBHandler.Decompile(dat, {reader: true});
		qb.SearchForFilename();
		
		// Try to find proper scripts
		var scriptSetup = qb.ChildByID('setup_custom_setlist_helpers');

		if (!scriptSetup)
		{
			cons.error("Could not find setup_custom_setlist_helpers.");
			return false;
		}
		
		// File has already been modded, no need to patch again
		if (scriptSetup.unknown !== UNK_SETUP)
			return true;
			
		// File has NOT been modded, replace it with Buldy's
		var hackData = fs.readFileSync(HACKPATH);
		this.headers[this.setlistIndex].data = hackData;
		
		this.buldyHack = true;
		
		cons.log("Setlist QB patched!");
			
		return true;
	}
}

module.exports = SetlistHandler;
