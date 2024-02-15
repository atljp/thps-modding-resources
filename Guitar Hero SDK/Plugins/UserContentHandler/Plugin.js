// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	USER CONTENT HANDLER
//		Handles dynamically allocating user content
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const path = require('path');
const fs = require('fs');

// Allows for additional full bodies
const MeshLevels = [
	'', '_Secondary', '_Tertiary', '_Quaternary'
];

const MAX_MESHES = 4;

// Raw metadata assets we can load
const RawAssetTypes = [
	"fullbody",
	"profile"
];

// Valid types of user content we can use
const AssetTypes = [
	'character',
	'song',
	'songcategory',
	'instrument'
];

// Appropriate directories for said content
const AssetInfo = {
	'character': {dir: 'Characters', friendly: 'Character'},
	'song': {dir: 'Songs', friendly: 'Song'},
	'songcategory': {dir: 'SongCategories', friendly: 'Song Category'},
	'instrument': {dir: 'Instruments', friendly: 'Instrument'}
};

const DefaultValues = {
	'intro_anim': "Intro_robot",
	'win_anim': "Win_Robot",
	'lose_anim': "Lose_Fearful",
	'mesh': 'models/talent/billy.skin',
	'highway': 'SkeletonHighway',
	'blurb': 'No info has been provided.',
	'preset_icon': 'photo_billy',
	
	'skeleton_male': 'GH_Rocker_Male',
	'skeleton_path_male': 'skeletons/GH_Rocker_Male.ske',
	'ragdoll_male': 'ragdoll_Rocker_male',
	'ragdoll_path_male': 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag',
	
	'skeleton_female': 'GH_Rocker_Female',
	'skeleton_path_female': 'skeletons/GH_Rocker_Female.ske',
	'ragdoll_female': 'ragdoll_Rocker_male',
	'ragdoll_path_female': 'Ragdolls/CAR/Male/GH_Rocker_Male_Ragdoll.rag'
};

const PhotoCheck = 'photo_rockbot.img.xen';
const SetlistCheck = 'setlist_b_bg_runnerl.img.xen';
		
//---------------------------------------------------------

class UserContentHandlerPlugin
{
	constructor()
	{
		// Hash watchers for our mods
		this.watchers = {};
	}
	
	//---------------------------
	// Get watcher / hash names
	//---------------------------
	
	GetWatcherName(mod, pkg, assetid)
	{
		return 'watcher_' + mod + '_' + pkg + '_' + assetid;
	}
	
	GetHashName(pkg, assetid)
	{
		return 'hashes_' + pkg + '_' + assetid + '.json';
	}
	
	GetMetaName(pkg, assetid)
	{
		return 'meta_' + pkg + '_' + assetid;
	}
	
	//---------------------------
	// Started a compile process!
	// Get ready...
	//---------------------------
	
	CompileStarted(info = {})
	{
		//~ console.log("User content started compile: " + info.packageName);
		
		// Register an injector for this specific package
		// (These names will be overwritten for each compile, no worry)
		
		var inj_UCH = this;
		var inj_pkg = info.packageName;
		
		// -- Character injectors
		
		GHSDK.QBHandler.RegisterInjector('CUSTOMCHAR_PROFILE', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'character', '');
		});
		
		MeshLevels.forEach(suffix => {
			var injName = 'CUSTOMCHAR_FULLBODY' + suffix.toUpperCase();
			
			GHSDK.QBHandler.RegisterInjector(injName, function() {
				return inj_UCH.InjectorCode(inj_pkg, 'character', 'fullbody' + suffix);
			});
		});
		
		GHSDK.QBHandler.RegisterInjector('CUSTOMCHAR_SKELETONLOADERS', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'character', 'skeletons');
		});
		
		// -- Instrument injectors (WTDE)
		
		GHSDK.QBHandler.RegisterInjector('CUSTOM_GUITAR', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'instrument', 'guitar');
		});
		
		GHSDK.QBHandler.RegisterInjector('CUSTOM_BASS', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'instrument', 'bass');
		});
		
		// -- Song injectors
		
		GHSDK.QBHandler.RegisterInjector('CUSTOMSONG_METADATA', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'song', '');
		});
		
		GHSDK.QBHandler.RegisterInjector('CUSTOMSONG_LIST', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'song', 'list');
		});
		
		// -- Song category injectors
		
		GHSDK.QBHandler.RegisterInjector('CUSTOMSONG_CATEGORIES', function() {
			return inj_UCH.InjectorCode(inj_pkg, 'songcategory', '');
			return "";
		});
		
		this.CacheMetaWatchers({
			modDir: info.modDir,
			modName: info.modName,
			packageName: info.packageName,
			excluded: [".img"]
		});
		
		// Assemble outfit groups for characters
		this.AssembleOutfitGroups();
	}
	
	//---------------------------
	// Assemble outfit groups
	//
	// This groups characters together into
	// subskins and main characters by
	// their OutfitGroup properties
	//---------------------------
	
	AssembleOutfitGroups()
	{
		var metas = this.MetasByType('character');
		var outfitGroups = {};
		
		for (const meta of metas)
		{
			var og = meta['outfit_group'];
			if (!og)
				continue;
			
			// No outfit group exists yet!
			// Let's create one, tell it that the
			// first character is this meta
				
			if (!outfitGroups[og])
			{
				outfitGroups[og] = {
					first: meta,
					skins: []
				};
			}
			else
				outfitGroups[og].skins.push(meta);
		}
		
		// Now properly apply subskin data to metas
		for (const key of Object.keys(outfitGroups))
		{
			var grp = outfitGroups[key];
			var first_meta = grp.first;
			
			first_meta.subskins = [];
			
			// The first skin is not pushed to subskins
			// These are all ACTUAL subskins
			
			for (const ss of grp.skins)
			{
				first_meta.subskins.push(ss.id);
				ss.is_subskin = true;
			}
		}
	}
	
	//---------------------------
	// Compile watchers / meta
	//
	// modDir
	// modName
	// packageName
	// asset_filter
	//---------------------------
	
	CacheMetaWatchers(opt = {})
	{
		// Clear out our content metadata
		this.contentMetadata = {};
		
		// Pending content types that need installing
		// (This will depend on the scripts that need compiling)
		
		this.contentInstallTypes = {};
		
		// Check if folder exists, abort if not
		var userDir = path.join(opt.modDir, 'UserContent');
		if (!fs.existsSync(userDir))
			return;
			
		var tempDir = path.join(opt.modDir, 'Temp');
		GHSDK.EnsureDirectory(tempDir, true);
			
		// Which asset types would we like to look through?
		var filter = opt.asset_filter || AssetTypes;

		// Get dirty files for the mod's user content
		// If the mod successfully compiles, we'll save this!
		for (const assetID of filter)
		{
			var hashFile = path.join(tempDir, this.GetHashName(opt.packageName, assetID));
			var wName = this.GetWatcherName(opt.modName, opt.packageName, assetID);
			var assetDir = path.join(userDir, AssetInfo[assetID].dir);
			
			if (!fs.existsSync(assetDir))
				continue;

			if (!this.watchers[wName])
			{
				this.watchers[wName] = new GHSDK.Constants.ChecksumWatcher(hashFile, assetDir);
				this.watchers[wName].AssetDir = assetDir;
				this.watchers[wName].AssetType = assetID;
				this.watchers[wName].WatcherMod = opt.modName;
				this.watchers[wName].WatcherPackage = opt.packageName;
			}
			
			// Detect dirty asset bundles
			// (If none of these exist, compiling is skipped)
			// 		(Obviously .img files do not trigger script compile)
			
			var watcher = this.watchers[wName];
			watcher.GetDirtyFiles({
				excluded: opt.excluded,
				included: opt.included
			});
			
			// Now loop through ALL asset folders and get their metadata
			var bundles = fs.readdirSync(assetDir);
			for (const bundle of bundles)
			{
				var bundleDir = path.join(assetDir, bundle);
				this.ParseMetadata(bundleDir, watcher);
			}
		}
	}
	
	//---------------------------
	// Ended a compile process!
	// Wrap it up...
	//
	// Returns true on success
	//---------------------------
	
	CompileEnded(info = {})
	{
		var success = true;
		
		// Abort if we ran into any errors whatsoever
		if (!info.success || info.errors.length > 0)
			return;
				
		// Loop through all of our asset bundle metadata
		var keys = Object.keys(this.contentMetadata);
		for (const key of keys)
		{
			var meta = this.contentMetadata[key];
			var assetType = meta.watcher.AssetType;
			
			if (this.contentInstallTypes[assetType])
			{
				var attempt = this.InstallContent(meta);

				if (attempt.success)
					meta.watcher.Save();
				else
				{
					cons.error('Content installation failed.');
					success = false;
				}
			}
		}
		
		return success;
	}
	
	//---------------------------
	// Does a file need compiling?
	// Returns TRUE if it does
	// Returns FALSE for normal logic
	//---------------------------
	
	ScriptNeedsCompiling(info = {})
	{
		// First, check if we even have a user dir
		// If not, don't bother using plugin assets
		
		var userDir = path.join(info.modDir, 'UserContent');
		if (!fs.existsSync(userDir))
			return false;
		
		var scriptName = path.basename(info.sourceFile).split(".")[0];
		var resourcePrefix = '';
		
		var tlc = scriptName.toLowerCase();
		switch (tlc)
		{
			// Band preset profiles, CHARACTERS
			case 'guitar_band_preset_profiles':
			case 'guitar_custom_skeletons':
			case 'imported_characters':
			case 'imported_full_body':
			case 'car_rocker_full_body':
				resourcePrefix = 'character';
				break;
				
			case 'car_rocker_full_instrument':
				resourcePrefix = 'instrument';
				break;
				
			case 'songlist':
			case 'guitar_download':
				resourcePrefix = 'song';
				break;
				
			case 'guitar_song_categories':
				resourcePrefix = 'songcategory';
				break;
				
			default:
				return false;
				break;
		}
		
		var forceful = false;
		if (info.FORCE_UC_COMPILE && resourcePrefix)
			forceful = true;

		var tempDir = path.join(info.modDir, 'Temp');
		var hashFile = path.join(tempDir, this.GetHashName(info.packageName, resourcePrefix));
		var watcherID = this.GetWatcherName(info.modName, info.packageName, resourcePrefix);
		var watcher = this.watchers[watcherID];
		
		// This asset type watcher must at least have some dirty files
		if (!forceful)
		{
			if (!watcher || (watcher && watcher.dirtyFiles.length <= 0))
				return false;
		}
			
		// When compile finishes, install this particular asset type
		this.contentInstallTypes[resourcePrefix] = true;

		return true;
	}
	
	//---------------------------
	// Attempt to install a specific type of content!
	// Returns 'success' as true or false if it fails
	//---------------------------
	
	InstallContent(meta)
	{
		// Was deleted, don't install
		if (meta.deleted)
			return {success: true};
			
		var successful = true;
		var needsInstall = false;
		
		var gr = GHSDK.Constants.Chalk.keyword('grey');
		var wt = GHSDK.Constants.Chalk.keyword('white');
		
		var bundleDir = path.join(meta.watcher.AssetDir, meta.id);
		
		// Only install metadata if it was dirty!
		// Categories don't have actual content
		
		if (meta.watcher.AssetType !== 'songcategory')
		{
			for (const df of meta.watcher.dirtyFiles)
			{
				var rel = path.relative(meta.dir, df);
				if (rel.indexOf("..") == -1)
				{
					needsInstall = true;
					break;
				}
			}
		}
			
		// Does this mod need to be installed?
		if (needsInstall && !meta.bad && !meta.deleted)
		{
			var fr = AssetInfo[meta.watcher.AssetType].friendly;
			
			cons.log(gr("Installing " + fr + " ") + wt(meta.id) + gr(" from ") + wt(meta.watcher.WatcherMod) + gr("..."));
			switch (meta.watcher.AssetType)
			{
				// Character installation
				case 'character':
				case 'song':
				case 'instrument':
					var res = this.InstallContent_Standard(meta, bundleDir);
					if (!res.success)
						successful = false;
					break;
			}
		}
		
		return {success: successful};
	}
	
	//---------------------------
	// Install a standard package
	// (This syncs everything in the Content dir)
	//---------------------------
	
	InstallContent_Standard(meta, bundleDir)
	{
		var ind = "   ";
		
		// Before we do anything, let's sync its content
		var contentDir = path.join(bundleDir, 'Content');
		if (!fs.existsSync(contentDir))
		{
			cons.warn(ind + "Content dir was missing!");
			return {success: false};
		}
		
		var theMod = GHSDK.Mods[meta.watcher.WatcherMod];
		var gameCfg = GHSDK.GameConfigs[theMod.Game];
		var dataDir = path.join(gameCfg.GameDir, gameCfg.DefaultDataPath);
		
		var contentFiles = GHSDK.ScanFolder(contentDir);
		
		for (const contentFile of contentFiles)
		{
			var rel = path.relative(contentDir, contentFile);
			var outPath = path.join(dataDir, rel);
			var outDir = path.dirname(outPath);
			
			if (!fs.existsSync(outDir))
				fs.mkdirSync(outDir, {recursive: true});
			
			fs.copyFileSync(contentFile, outPath);
			if (!fs.existsSync(outPath))
			{
				cons.warn("Something went wrong in copying: " + rel);
				return {success: false};
			}
		}
		
		return {success: true};
	}
	
	//---------------------------
	// Read in metadata from a bundle directory
	// Single character, etc.
	//---------------------------
	
	ParseMetadata(bundleDir, watcher)
	{
		var bundle = path.basename(bundleDir);
		var vName = watcher.AssetType + '_' + bundle;
		
		var metaName = this.GetMetaName(watcher.WatcherPackage, bundle);
		var meta = {bad: false, watcher: watcher, id: bundle, dir: bundleDir};
		
		switch (watcher.AssetType)
		{
			// -- CHARACTER -----------------
			case 'character':	
			
				// Get the INI!
				var iniPath = path.join(bundleDir, 'character.ini');
				if (!fs.existsSync(iniPath))
				{
					meta.bad = true;
					meta.error = 'Missing INI path.';
				}
				else
				{
					var INI = new GHSDK.Constants.INIHandler();
					INI.Read(iniPath);

					meta['name'] = INI.GetValue("CharacterInfo", "Name", bundle);
					
					var gen = INI.GetValue("CharacterInfo", "Gender", 'male').toLowerCase();
					if (gen !== 'male' && gen !== 'female')
						gen = 'male';
						
					meta['gender'] = gen;
					meta['outfit_group'] = INI.GetValue("CharacterInfo", "OutfitGroup", "");
					meta['intro_anim'] = INI.GetValue("CharacterInfo", "IntroAnim", DefaultValues['intro_anim']);
					meta['win_anim'] = INI.GetValue("CharacterInfo", "WinAnim", DefaultValues['win_anim']);
					meta['lose_anim'] = INI.GetValue("CharacterInfo", "LoseAnim", DefaultValues['lose_anim']);
					meta['highway'] = INI.GetValue("CharacterInfo", "Highway", DefaultValues['highway']);
					meta['description'] = INI.GetValue("CharacterInfo", "Description", DefaultValues['blurb']);
					meta['icon'] = INI.GetValue("CharacterInfo", "Icon", DefaultValues['preset_icon']);
					
					var cs = INI.GetValue("CharacterInfo", "CustomSkeleton", "false").toLowerCase();
					meta['custom_skeleton'] = (cs == 'true') ? true : false;
					
					meta['skeleton'] = INI.GetValue("CharacterInfo", "Skeleton", DefaultValues['skeleton_' + gen]);
					meta['skeleton_path'] = INI.GetValue("CharacterInfo", "SkeletonPath", DefaultValues['skeleton_path_' + gen]);

					meta['ragdoll'] = INI.GetValue("CharacterInfo", "Ragdoll", DefaultValues['ragdoll_' + gen]);
					meta['ragdoll_path'] = INI.GetValue("CharacterInfo", "RagdollPath", DefaultValues['ragdoll_path_' + gen]);
					
					// Handle full-body meshes
					var meshList = INI.GetValue("CharacterInfo", "Mesh", [DefaultValues['mesh']], true);
					
					for (var m=0; m<Math.min(meshList.length, MAX_MESHES); m++)
					{
						var suffix = MeshLevels[m];
						meta['mesh' + suffix] = meshList[m];
					}
				}
				
				// Check for raw assets
				for (const ra of RawAssetTypes)
				{
					var raPath = path.join(bundleDir, 'code_' + ra + '.txt');
					if (fs.existsSync(raPath))
					{
						var rawID = 'raw_' + ra;
						meta[rawID] = fs.readFileSync(raPath).toString();
						
						// Extract photo from profile
						if (ra == 'profile')
							this.ExtractRawPhoto(meta);
					}
				}
				
				break;
				
			// -- INSTRUMENT -----------------------
			case 'instrument':
				// Get the INI!
				var iniPath = path.join(bundleDir, 'instrument.ini');
				if (!fs.existsSync(iniPath))
				{
					meta.bad = true;
					meta.error = 'Missing INI path.';
				}
				else
				{
					var INI = new GHSDK.Constants.INIHandler();
					INI.Read(iniPath);
					
					meta['name'] = INI.GetValue("InstrumentInfo", "Name", bundle);
					meta['finishname'] = INI.GetValue("InstrumentInfo", "FinishName", "Standard");
					meta['mesh'] = INI.GetValue("InstrumentInfo", "Mesh", "");
					
					var fg = INI.GetValue("InstrumentInfo", "FinishGroup", "");
					if (fg)
						meta['finishgroup'] = fg;
						
					meta['instrument'] = INI.GetValue("InstrumentInfo", "Instrument", "guitar");
					
					var blurb = INI.GetValue("InstrumentInfo", "Description", "");
					if (blurb)
						meta['description'] = blurb;
						
					var gl = INI.GetValue("InstrumentInfo", "GameLogo", "");
					if (gl)
						meta['gamelogo'] = gl;
				}
				
				break;
			
			// -- SONG -----------------------
			case 'song':
			
				// Get the INI!
				var iniPath = path.join(bundleDir, 'song.ini');
				if (!fs.existsSync(iniPath))
				{
					meta.bad = true;
					meta.error = 'Missing INI path.';
				}
				else
				{
					var INI = new GHSDK.Constants.INIHandler();
					INI.Read(iniPath);

					meta['title'] = INI.GetValue("SongInfo", "Title", bundle);
					meta['artist'] = INI.GetValue("SongInfo", "Artist", "The Unknowns");
					meta['year'] = INI.GetValue("SongInfo", "Year", "1234");
					meta['artist_text'] = INI.GetValue("SongInfo", "ArtistText", "artist_text_by");
					meta['original_artist'] = parseInt(INI.GetValue("SongInfo", "OriginalArtist", "1"));
					meta['leaderboard'] = parseInt(INI.GetValue("SongInfo", "Leaderboard", "1"));
					meta['singer'] = INI.GetValue("SongInfo", "Singer", "none");
					meta['genre'] = INI.GetValue("SongInfo", "Genre", "Rock");
					meta['countoff'] = INI.GetValue("SongInfo", "Countoff", "sticks_normal");
					meta['drum_kit'] = INI.GetValue("SongInfo", "Drumkit", "heavyrock");
					
					var osv = INI.GetValue("SongInfo", "Volume", "");
					if (osv)
						meta['overall_song_volume'] = parseFloat(osv);
					
					var gic = INI.GetValue("SongInfo", "GameIcon", "");
					if (gic)
						meta['game_icon'] = gic;
						
					var cat = INI.GetValue("SongInfo", "GameCategory", "");
					if (cat)
						meta['category'] = cat;
						
					var band = INI.GetValue("SongInfo", "Band", "");
					if (band)
						meta['band'] = band;
						
					meta['checksum'] = INI.GetValue("SongInfo", "Checksum", bundle);
				}
				
				break;
				
			// -- SONG CATEGORY -----------------------
			case 'songcategory':
			
				// Get the INI!
				var iniPath = path.join(bundleDir, 'category.ini');
				if (!fs.existsSync(iniPath))
				{
					meta.bad = true;
					meta.error = 'Missing INI path.';
				}
				else
				{
					var INI = new GHSDK.Constants.INIHandler();
					INI.Read(iniPath);

					meta['name'] = INI.GetValue("CategoryInfo", "Name", bundle);
					meta['songlist'] = INI.GetValue("CategoryInfo", "Songlist", 'gh_songlist');
					meta['title'] = INI.GetValue("CategoryInfo", "Title", bundle).toUpperCase();
					meta['logo'] = INI.GetValue("CategoryInfo", "Logo", 'gamelogo_ghwt');
					
					var fil = INI.GetValue("CategoryInfo", "Filter", '');
					if (fil)
						meta['filter'] = fil;
				}
			
				break;
		}
		
		this.contentMetadata[metaName] = meta;
	}
	
	//---------------------------
	// Get all metadata by asset type
	//---------------------------
	
	MetasByType(assetType)
	{
		var ret = [];
		var keys = Object.keys(this.contentMetadata);
		
		for (const key of keys)
		{
			var met = this.contentMetadata[key];
			if (met.watcher.AssetType == assetType)
				ret.push(met);
		}
		
		return ret;
	}
	
	// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//---------------------------
	// Generate injector code
	//---------------------------
	
	InjectorCode(packageName, assetType, subType = '')
	{
		var met = this.MetasByType(assetType);
		if (met.length <= 0)
			return "";

		switch (assetType)
		{
			// Characters
			case 'character':
				if (subType.indexOf('fullbody') >= 0)
					return this.InjectorCode_Character_FB(met, subType);
				else if (subType == 'skeletons')
					return this.InjectorCode_Character_Skel(met);
				else
					return this.InjectorCode_Character(met);
				break;
				
			// Songs
			case 'song':
				if (subType == 'list')
					return this.InjectorCode_Song_List(met);
				else
					return this.InjectorCode_Song(met);
				break;
				
			// Instrument
			case 'instrument':
				return this.InjectorCode_Instrument(met, subType);
				break;
				
			// Song category
			case 'songcategory':
				return this.InjectorCode_SongCategories(met);
				break;
		}
		
		return "";
	}
	
	//---------------------------
	// Skeleton loaders
	// Responsible for loading each character skeleton
	//---------------------------
	
	InjectorCode_Character_Skel(metaList)
	{
		var texts = [];
		
		for (const meta of metaList)
		{
			if (meta.bad || meta.deleted || !meta['custom_skeleton'])
				continue;
				
			// Load the skeleton!
			var skelDesc = meta.skeleton;
			var skelPath = meta.skeleton_path;
			
			var mainSkelDesc = skelDesc;
			
			// Doesn't have _original
			if (mainSkelDesc.indexOf("_original") == -1)
				mainSkelDesc += "_original";
			
			texts.push(":i $LoadAsset$%s(\"" + skelPath + "\")$desc$=$" + skelDesc + "$");
			
			// Drummer, if available
			var drmDesc = skelDesc + "_Drummer";
			var drmPath = path.join(meta.watcher.AssetDir, meta.id, drmDesc + ".ske.xen");
			if (!fs.existsSync(drmPath))
				drmPath = path.join(meta.watcher.AssetDir, meta.id, 'Assets', drmDesc + ".ske.xen");
				
			// Try lowercase as well
			if (!fs.existsSync(drmPath))
			{
				drmDesc = "_drummer";
				drmPath = path.join(meta.watcher.AssetDir, meta.id, drmDesc + ".ske.xen");
				if (!fs.existsSync(drmPath))
					drmPath = path.join(meta.watcher.AssetDir, meta.id, 'Assets', drmDesc + ".ske.xen");
			}
				
			if (fs.existsSync(drmPath))
			{
				var loadPath = skelPath.replace(/rocker/gi, 'Drummer');
				texts.push(":i $LoadAsset$%s(\"" + loadPath + "\")$desc$=$" + drmDesc + "$");
			}
		}
		
		return texts.join("\n");
	}
	
	//---------------------------
	// Full-body character codes
	// metaList is list of 'character' metas
	//---------------------------
	
	InjectorCode_Character_FB(metaList, subType)
	{
		var cls = GHSDK.QBHandler.ItemTypes.classes;
		var texts = [];
		
		var spl = subType.split("_");
		var meshSuffix = (spl.length > 1) ? "_" + spl.pop() : "";
		
		for (const meta of metaList)
		{
			if (meta.bad || meta.deleted)
				continue;
				
			// Has raw code?
			if (meta['raw_fullbody'])
			{
				texts.push(meta['raw_fullbody']);
				continue;
			}
			
			// Desired mesh suffix not in list
			var mesh_key = 'mesh' + meshSuffix;
			if (!meta[mesh_key])
				continue;
				
			// Main body struct
			var body = new cls.StructHeader({itemName: 'StructHeader'});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'desc_id', value: meta.id});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'frontend_desc', value: meta.name});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'mesh', value: meta[mesh_key]});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'mesh1', value: meta[mesh_key]});
			new cls.StructItemInteger({itemName: 'StructItemInteger', parent: body, id: 'mesh_lod', value: 0});
			
			if (meta.gender == 'female')
				new cls.StructItemInteger({itemName: 'StructItemInteger', parent: body, id: 'is_female', value: 1});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'Skeleton', value: meta.skeleton});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'skeleton_path', value: meta.skeleton_path});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'ragdoll', value: meta.ragdoll});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'ragdoll_path', value: meta.ragdoll_path});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'accessory_bones', value: 'Rocker_accessory_bones'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'ragdoll_collision_group', value: 'RagdollCollisionGroups_Rocker_Female'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'ik_params_guitar', value: 'Hero_Ik_params'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'ik_params_drum', value: 'Drummer_IK_Params'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'ik_params_vocals', value: 'singer_IK_Params'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'ik_params_frontend', value: 'CAR_IK_Params'});
			new cls.StructItemInteger({itemName: 'StructItemInteger', parent: body, id: 'is_female', value: 0});
			
			var gen = (meta.gender == 'female') ? 'Female' : 'Male';
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'anim_struct', value: 'car_' + gen.toLowerCase() + '_anim_struct'});
				
			var bsp = new cls.StructItemStruct({itemName: 'StructItemStruct', id: 'body_specific_parts', parent: body});
			var bsh = new cls.StructHeader({itemName: 'StructHeader', parent: bsp});

			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: bsh, id: 'CAS_Intro_Anim', value: 'CAS_' + gen + '_Intro_Anim'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: bsh, id: 'CAS_Win_Anim', value: 'CAS_' + gen + '_Win_Anim'});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: bsh, id: 'CAS_Lose_Anim', value: 'CAS_' + gen + '_Lose_Anim'});
				
			texts.push(body.ToTextCore().replace(/\r/g, "\n"));
		}

		return texts.join("\n\n");
	}
	
	//---------------------------
	// Character profile codes
	// metaList is list of 'character' metas
	//---------------------------
	
	InjectorCode_Character(metaList)
	{
		var cls = GHSDK.QBHandler.ItemTypes.classes;
		var texts = [];
		
		function SimpleCAS(parentStruct, id, val)
		{
			var struH = new cls.StructItemStruct({itemName: 'StructItemStruct', id: id, parent: parentStruct});
				var stru = new cls.StructHeader({itemName: 'StructHeader', parent: struH});
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: stru, id: 'desc_id', value: val});
		}
		
		for (const meta of metaList)
		{
			if (meta.bad || meta.deleted)
				continue;
				
			// Has raw code?
			if (meta['raw_profile'])
			{
				texts.push(meta['raw_profile']);
				continue;
			}
				
			// Main body struct
			var body = new cls.StructHeader({itemName: 'StructHeader'});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'name', value: meta.id});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'fullname', value: meta.name});
			
			var arrP = new cls.StructItemArray({itemName: 'StructItemArray', parent: body, id: 'allowed_parts'});
			var arr = new cls.ArrayQBKey({itemName: 'ArrayQBKey', parent: arrP});
				arr.values = ['Drum', 'vocals', 'guitar', 'bass'];
				
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'preset_icon', value: meta.icon});
			
			// Is it a subskin?
			if (meta.is_subskin)
			{
				//~ cons.log("Registering subskin " + meta.id + "...");
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, value: 'is_subskin'});
			}
			
			// Does it have subskins?
			if (meta.subskins && meta.subskins.length > 0)
			{
				//~ cons.log("Registering " + meta.id + " with multiple subskins...");
				
				var arr_p = new cls.StructItemArray({itemName: 'StructItemArray', parent: body, id: 'subskin_list'});
				var arr = new cls.ArrayQBKey({itemName: 'ArrayQBKey', parent: arr_p});
				
				arr.values = [meta.id].concat(meta.subskins);
			}
			
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'blurb', value: meta.description});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'polaroid', value: 'm_fun_rockbot'});
			
			// APPEARANCE
			
			var aprS = new cls.StructItemStruct({itemName: 'StructItemStruct', id: 'appearance', parent: body});
			var apr = new cls.StructHeader({itemName: 'StructHeader', parent: aprS});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: apr, id: 'genre', value: 'Rock'});
			
			// Full body!
			// How many meshes do they have?
			
			for (const suffix of MeshLevels)
			{
				var key = 'mesh' + suffix;
				if (!meta[key])
					continue;
					
				var fullBodyName = 'cas_full_body' + suffix;
					
				var struH = new cls.StructItemStruct({itemName: 'StructItemStruct', id: fullBodyName, parent: apr});
					var stru = new cls.StructHeader({itemName: 'StructHeader', parent: struH});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: stru, id: 'desc_id', value: meta.id});
			}
					
			// Physique
			var struH = new cls.StructItemStruct({itemName: 'StructItemStruct', id: 'CAS_Physique', parent: apr});
			var stru = new cls.StructHeader({itemName: 'StructHeader', parent: struH});
			
			var phys = (meta.gender == 'female') ? 'FemalePhysique' : 'MalePhysique';
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: stru, id: 'desc_id', value: phys});
			
			// Physique -> bones
			var bnH = new cls.StructItemStruct({itemName: 'StructItemStruct', id: 'bones', parent: stru});
			var bn = new cls.StructHeader({itemName: 'StructHeader', parent: bnH});
			new cls.StructItemFloat({itemName: 'StructItemFloat', parent: bn, id: 'height', value: 1.0});
			
			// Physique -> additional_bone_transforms
			var abtP = new cls.StructItemArray({itemName: 'StructItemArray', parent: stru, id: 'additional_bone_transforms'});
			var abt = new cls.ArrayStruct({itemName: 'ArrayStruct', parent: abtP});
				var cr = new cls.StructHeader({itemName: 'StructHeader', parent: abt});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: cr, id: 'bone', value: 'Control_Root'});
					var scS = new cls.StructItemStruct({itemName: 'StructItemStruct', id: 'scaling', parent: cr});
						var sc = new cls.StructHeader({itemName: 'StructHeader', parent: scS});
							var flt = new cls.StructItemFloatsX3({itemName: 'StructItemFloatsX3', parent: sc, id: 'value'});
							var fltV = new cls.Floats({itemName: 'Floats', parent: flt});
							fltV.values = [0.05, 0.05, 0.05];
							
			// Guitar body
			SimpleCAS(apr, 'CAS_Guitar_Body', 'Guitar_Body01');
				
			// Guitar neck
			var neckH = new cls.StructItemStruct({itemName: 'StructItemStruct', id: 'CAS_Guitar_Neck', parent: apr});
			var neck = new cls.StructHeader({itemName: 'StructHeader', parent: neckH});
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: neck, id: 'desc_id', value: 'Guitar_Neck01'});
				
			var arrP = new cls.StructItemArray({itemName: 'StructItemArray', parent: neck, id: 'CAP'});
			var arr = new cls.ArrayStruct({itemName: 'ArrayStruct', parent: arrP});
				var cap = new cls.StructHeader({itemName: 'StructHeader', parent: arr});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: cap, id: 'base_tex', value: 'tex\\models\\Car_Instruments\\Guitars\\neck_maple_tb_01.dds'});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: cap, id: 'material', value: 'Guitar_Neck1_Primary'});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: cap, id: '0x00000000', value: 'diffuse'});
					
			var plP = new cls.StructItemArray({itemName: 'StructItemArray', parent: cap, id: 'pre_layer'});
			var pl = new cls.ArrayStruct({itemName: 'ArrayStruct', parent: plP});
				var layer = new cls.StructHeader({itemName: 'StructHeader', parent: pl});
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: layer, id: 'texture', value: 'tex\\models\\characters\\layers\\cag\\neck1_inlay_dots1_d_01.img'});
				
			SimpleCAS(apr, 'CAS_Guitar_Head', 'Guitar_Head01');
			SimpleCAS(apr, 'CAS_Guitar_Pickguards', 'Guitar_PickG01');
			SimpleCAS(apr, 'CAS_Guitar_Bridges', 'GTR_Hardware01a');
			SimpleCAS(apr, 'CAS_Guitar_Knobs', 'GTR_Knobs_Style_01a');
			SimpleCAS(apr, 'CAS_Guitar_Pickups', 'GTR_Pickups_Style_01a');
			SimpleCAS(apr, 'CAS_Bass_Body', 'CAB_Body_B2A');
			SimpleCAS(apr, 'CAS_Bass_Neck', 'CAB_Neck_BN1A');
			SimpleCAS(apr, 'CAS_Bass_Head', 'CAB_Head_BH6A');
			SimpleCAS(apr, 'CAS_Bass_Pickguards', 'CAB_PickG_E1');
			SimpleCAS(apr, 'CAS_Bass_Pickups', 'CAB_pickup_Hack02');
			SimpleCAS(apr, 'CAS_bass_Bridges', 'CAB_Bridge_BB3A');
			SimpleCAS(apr, 'CAS_Bass_Knobs', 'CAB_Knob_Unos05');
			SimpleCAS(apr, 'CAS_Drums_Sticks', 'Drumsticks1');
			SimpleCAS(apr, 'CAS_Drums', 'basic');
			SimpleCAS(apr, 'CAS_Mic', 'Rock');
			SimpleCAS(apr, 'CAS_Mic_Stand', 'Rock');
			SimpleCAS(apr, 'CAS_Bass_Highway', meta.highway);
			SimpleCAS(apr, 'CAS_Guitar_Highway', meta.highway);
			SimpleCAS(apr, 'CAS_Drums_Highway', meta.highway);
			
			var gen = (meta.gender == 'female') ? 'Female' : 'Male';
			
			SimpleCAS(apr, 'CAS_' + gen  + '_Intro_Anim', meta.intro_anim);
			SimpleCAS(apr, 'CAS_' + gen  + '_Win_Anim', meta.win_anim);
			SimpleCAS(apr, 'CAS_' + gen  + '_Lose_Anim', meta.lose_anim);
			
			texts.push(body.ToTextCore().replace(/\r/g, "\n"));
		}
		
		return texts.join("\n\n");
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//---------------------------
	// Instrument code
	//---------------------------
	
	InjectorCode_Instrument(metaList, subType)
	{
		var texts = [];
		var cls = GHSDK.QBHandler.ItemTypes.classes;
		
		// Let's group metas by their finish groups
		// (Instruments with no finish groups are just pushed)
		
		var groups = [];
		var groupMap = {};
		
		for (const meta of metaList)
		{
			if (meta.bad || meta.deleted)
				continue;
				
			if (meta.instrument.toLowerCase() !== subType)
				continue;
				
			var fg = meta.finishgroup;
			
			// Push normal instrument with no group
			if (!fg)
			{
				groups.push(meta);
				continue;
			}
			
			// Instrument has a finish group, let's apply
			fg = fg.toLowerCase();
			
			// Group does not exist yet
			if (!groupMap[fg])
			{
				// Push map reference to list
				groups.push({groupref: fg});
				
				// Init in group map
				groupMap[fg] = [];
			}
			
			// Push instrument to group
			groupMap[fg].push(meta);
		}
		
		// Now loop through all of our groups
		for (const entry of groups)
		{
			// Plain ol' instrument, use normal descriptions
			if (!entry.groupref)
			{
				var body = new cls.StructHeader({itemName: 'StructHeader'});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'mesh', value: entry.mesh});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'blurb', value: entry.description});
				if (entry.gamelogo)
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'game_logo', value: entry.gamelogo});
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'desc_id', value: entry.id});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'frontend_desc', value: entry.name});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'frontend_desc_finish', value: entry.finishname});
				
				texts.push(body.ToTextCore().replace(/\r/g, "\n"));
			}
			
			// References a finish group
			else
			{
				// -- Add main instrument ---------------------------------
				var grp = groupMap[entry.groupref];
				if (!grp)
					continue;
					
				var first = grp[0];
					
				var body = new cls.StructHeader({itemName: 'StructHeader'});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'mesh', value: first.mesh});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'blurb', value: first.description});
				if (first.gamelogo)
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'game_logo', value: first.gamelogo});
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'desc_id', value: first.id});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'frontend_desc', value: first.name});
				new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'frontend_desc_finish', value: first.finishname});
				
				// Finish list!
				var arrP = new cls.StructItemArray({itemName: 'StructItemArray', parent: body, id: 'finish_list'});
				var arr = new cls.ArrayQBKey({itemName: 'ArrayQBKey', parent: arrP});
				arr.values = [];
				
				for (const ins of grp)
					arr.values.push(ins.id);
					
				texts.push(body.ToTextCore().replace(/\r/g, "\n"));
				
				// -- Add all children ---------------------------------
				for (var g=1; g<grp.length; g++)
				{
					var ins = grp[g];
					
					var body = new cls.StructHeader({itemName: 'StructHeader'});
					new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'mesh', value: ins.mesh});
					new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'blurb', value: ins.description});
					if (ins.gamelogo)
						new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'game_logo', value: ins.gamelogo});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'desc_id', value: ins.id});
					new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'frontend_desc', value: ins.finishname});
					new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'parent_skin', value: first.id});
					texts.push(body.ToTextCore().replace(/\r/g, "\n"));
				}
			}
		}
		
		return texts.join("\n\n");
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//---------------------------
	// Song list code
	//---------------------------
	
	InjectorCode_Song_List(metaList)
	{
		var songNames = [];
		
		for (const song of metaList)
		{
			if (song.bad || song.deleted)
				continue;
				
			if (song.checksum)
				songNames.push(song.checksum);
		}
		
		return songNames.join("\n");
	}
	
	//---------------------------
	// Song metadata code
	//---------------------------
	
	InjectorCode_Song(metaList)
	{
		var cls = GHSDK.QBHandler.ItemTypes.classes;
		var texts = [];
		
		for (const song of metaList)
		{
			if (song.bad || song.deleted)
				continue;
				
			// Main body struct
			var ss = new cls.StructItemStruct({itemName: 'StructItemStruct', id: song.checksum});
			var body = new cls.StructHeader({itemName: 'StructHeader', parent: ss});

			var cs = new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'checksum', value: song.checksum});
			
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'name', value: song.checksum});
			
			var songTitle = "\\L" + song.title.toUpperCase();
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'Title', value: songTitle});
			
			var songArtist = "\\L" + song.artist.toUpperCase();
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'artist', value: songArtist});
			
			var songYear = "\\L, " + song.year;
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'year', value: songYear});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'singer', value: song.singer});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'genre', value: song.genre});
			
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'countoff', value: song.countoff});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'drum_kit', value: song.drum_kit});
			
			if (song.overall_song_volume)
				new cls.StructItemFloat({itemName: 'StructItemFloat', parent: body, id: 'overall_song_volume', value: song.overall_song_volume});
				
			if (song.game_icon)
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'game_icon', value: song.game_icon});
				
			if (song.category)
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'category', value: song.category});
				
			if (song.band)
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'band', value: song.band});
			
			texts.push(ss.ToTextCore().replace(/\r/g, "\n"));
		}
		
		return texts.join("\n\n");
	}
	
	//---------------------------
	// Song category structs
	//---------------------------
	
	InjectorCode_SongCategories(metaList)
	{
		var cls = GHSDK.QBHandler.ItemTypes.classes;
		var texts = [];
		
		for (const category of metaList)
		{
			if (category.bad || category.deleted)
				continue;
				
			var body = new cls.StructHeader({itemName: 'StructHeader'});
			
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'Name', value: category.name});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'songlist', value: category.songlist});
			new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'logo', value: category.logo});
			new cls.StructItemString({itemName: 'StructItemString', parent: body, id: 'title', value: category.title});
			
			if (category.filter)
				new cls.StructItemQBKey({itemName: 'StructItemQBKey', parent: body, id: 'filter', value: category.filter});
			
			texts.push(body.ToTextCore().replace(/\r/g, "\n"));
		}

		return texts.join("\n\n");
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//---------------------------
	// Started packaging a mod
	// Intercept and add extra files to the mix!
	//---------------------------
	
	PackagingStarted(info)
	{
		var pakMode = '';
		
		// HACK: Check for stock assets in the content dir
		// This is more flexible than checking pak name
		
		if (fs.existsSync( path.join(info.packDir, PhotoCheck) ))
			pakMode = 'photo';
			
		if (fs.existsSync( path.join(info.packDir, SetlistCheck) ))
			pakMode = 'setlist';
		
		// Has photo or setlist tags?
		if (info.tags && info.tags.indexOf('photos') >= 0)
			pakMode = 'photo';
			
		if (info.tags && info.tags.indexOf('setlist') >= 0)
			pakMode = 'setlist';
			
		// Skeleton pak?
		if (info.tags.indexOf('skeletons') >= 0)
			pakMode = 'skeleton_lzss';
		else if (info.tags.indexOf('skeletons_original') >= 0)
			pakMode = 'skeleton';
		
		// Nothing fancy to do here, don't bother with logic
		if (pakMode == '')
			return;
			
		switch (pakMode)
		{
			case 'photo':
			case 'setlist':
				return this.Packaging_Photo(pakMode, info);
				break;
				
			case 'skeleton':
			case 'skeleton_lzss':
				var ps = this.Packaging_Skeleton(pakMode, info);
				
				if (ps && ps.errors)
					return {errors: ps.errors};
					
				return ps;
				break;
		}
		
		return;
	}
	
	//---------------------------
	// Package a photo pak!
	// For photos, or setlists
	//---------------------------
	
	Packaging_Photo(pakMode, info)
	{
		var modDir = GHSDK.GetModPathFrom(info.packDir);
		
		// Cache all of our asset metadata
		// (We'll need this to know which photos to add)
		
		var aType = (pakMode == 'setlist') ? 'songcategory' : 'character';
		
		this.CacheMetaWatchers({
			modDir: modDir,
			modName: info.modName,
			packageName: info.packageName,
			included: [".img"],
			asset_filter: [aType]
		});
		
		// Loop through all of our character metadata
		
		var extraFiles = [];
		
		var gr = GHSDK.Constants.Chalk.keyword('grey');
		var wh = GHSDK.Constants.Chalk.keyword('white');
		
		var metas = this.MetasByType(aType);
		for (const meta of metas)
		{
			var bundleDir = path.join(meta.watcher.AssetDir, meta.id);
			var photoPath;
			
			// Character icons!
			if (aType == 'character')
				photoPath = path.join(bundleDir, meta.icon + '.img.xen');
				
			// Category icons!
			else if (aType == 'songcategory')
				photoPath = path.join(bundleDir, meta.logo + '.img.xen');
	
			// Bad file, don't bother
			if (!fs.existsSync(photoPath))
			{
				// Could exist in asset path!
				var pd = path.dirname(photoPath);
				var pn = path.basename(photoPath);
				
				photoPath = path.join(pd, 'Assets', pn);
				
				if (!fs.existsSync(photoPath))
					continue;
			}
				
			var photoData = {
				extension: "img",
				data: fs.readFileSync(photoPath)
			};
			
			photoData.nameOnly = path.basename(photoPath).split(".").shift();
			photoData.fullName = GHSDK.PakHandler.GetPakFilename(bundleDir, photoPath);
			
			var pName = (aType == 'character') ? 'photo' : 'setlist logo';
			cons.log(gr("Adding custom " + pName + " for ") + wh(meta.id) + gr("..."));
				
			extraFiles.push(photoData);
		}
		
		return {extraFiles: extraFiles};
	}
	
	//---------------------------
	// Package a skeleton pak!
	//---------------------------
	
	Packaging_Skeleton(pakMode, info)
	{
		var compressed = (pakMode == 'skeleton_lzss');
		var modDir = GHSDK.GetModPathFrom(info.packDir);
		
		this.CacheMetaWatchers({
			modDir: modDir,
			modName: info.modName,
			packageName: info.packageName,
			included: [".ske"],
			asset_filter: ['character']
		});
		
		// Loop through all of our character metadata
		
		var extraFiles = [];
		
		var gr = GHSDK.Constants.Chalk.keyword('grey');
		var wh = GHSDK.Constants.Chalk.keyword('white');
		
		var metas = this.MetasByType('character');
		
		for (const meta of metas)
		{
			// Doesn't have a custom skeleton, skip it!
			if (!meta['custom_skeleton'])
				continue;
				
			var bundleDir = path.join(meta.watcher.AssetDir, meta.id);
			var checks = [];
			
			// LZSS, only want main skeleton
			if (compressed)
				checks.push([meta.skeleton + ".ske.xen", false])
				
			// Not LZSS, want original and drummer
			else
			{
				checks.push([meta.skeleton + ".ske.xen", true])
				checks.push([meta.skeleton + "_Drummer.ske.xen", false]);
			}
			
			// Make sure files exist
			var badFiles = [];
			for (const checker of checks)
			{
				var cPath = checker[0];
				var cIsOriginal = checker[1];
				
				var filePath = path.join(bundleDir, cPath);
				if (!fs.existsSync(filePath))
					filePath = path.join(bundleDir, 'Assets', cPath);
				
				if (!fs.existsSync(filePath))
				{
					badFiles.push(path.basename(filePath));
					break;
				}
				else
				{
					var skelData = {
						extension: "ske",
						data: fs.readFileSync(filePath)
					};
					
					// If compressed, compress it ourselves
					if (compressed)
						skelData.data = this.AttemptLZSS(skelData.data);
					
					// Which filepath do we want to use?
					// If it's the _original file, spoof _original on the end
					
					var finalName = filePath;
					if (cIsOriginal)
					{
						var dn = path.dirname(filePath);
						var fn = path.basename(filePath);
						
						fn = fn.split(".")[0] + "_original.ske.xen";
						finalName = path.join(dn, fn);
					}
					
					// Remember skeleton hacks
					skelData.nameOnly = GHSDK.PakHandler.GetPakNameOnly(finalName);
					
					var fullName = (compressed ? 'skeletons/' : '') + path.basename(finalName);
					skelData.fullName = GHSDK.PakHandler.GetPakFilename(bundleDir, path.join(bundleDir, fullName));
					
					cons.log(gr("Adding skeleton: ") + wh(path.basename(finalName)));
					cons.log("   " + wh("PAK Names: ") + gr(skelData.fullName + ", " + skelData.nameOnly));
					
					extraFiles.push(skelData);
				}
			}
			
			if (badFiles.length > 0)
			{
				cons.warn(meta.id + " had missing skeleton files:");
				
				for (const bf of badFiles)
					cons.warn("- " + bf);
					
				if (GHSDK.IsLinux())
					cons.warn("(Linux files are case sensitive!)");
					
				return {errors: ["Missing skeleton files, bad packaging."]};
			}
		}
		
		return {extraFiles: extraFiles};
	}
	
	//---------------------------
	// Attempt to LZSS compress a file
	//---------------------------
	
	AttemptLZSS(data)
	{
		var dat = data.slice(0, 4).toString();
		
		// Already compressed!
		if (dat == 'LZSS')
			return dat;
		
		var res = GHSDK.Constants.LZSS.CompressBytes(data).result;
			
		var buf = Buffer.alloc(8);
		buf.writeUInt32BE(0x4C5A5353, 0);		// LZSS
		buf.writeUInt32BE(data.length, 4);
		
		return Buffer.concat([buf, res])
	}
	
	//---------------------------
	// Attempt to extract raw photo from code
	// 	(Photo ref is important for packing pics)
	//---------------------------
	
	ExtractRawPhoto(meta)
	{
		var code = meta['raw_profile'];
		if (!code)
			return;
			
		var matched = code.match(/StructQBKey preset_icon = [A-Za-z0-9_]+[\r\n]/g);
		if (matched)
		{
			var spl = matched[0].split(" ");
			var photo = spl[spl.length-1];
			meta['icon'] = photo;
		}
	}
}

module.exports = UserContentHandlerPlugin;
