// - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Module for packaging mods
// - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

class ModPackager
{
	constructor() {}
	
	//--------------------------------------------
	// Determine the path for zone's files
	//--------------------------------------------
	
	FindZonePath(inDir, zonePrefix)
	{
		var conDir = path.join(inDir, 'Compiled');
		if (!fs.existsSync(conDir))
			return "";
			
		var scanned = GHSDK.ScanFolder(conDir);
		
		for (const file of scanned)
		{
			if (file.toLowerCase().indexOf(zonePrefix + ".qb.") >= 0)
				return path.dirname(file);
		}
		
		return "";
	}
	
	//--------------------------------------------
	// Start packaging a mod
	//--------------------------------------------
	
	async PackageMod(selectedMod, selectedPackage)
	{
		var theMod = GHSDK.Mods[selectedMod];
		var thePackage = theMod.Packages[selectedPackage];
		
		if (!thePackage)
		{
			cons.error("Could not find package: " + selectedPackage);
			cons.error("(Using mod " + selectedMod + ")");
			return 'error';
		}
		
		var gameConfig = GHSDK.GameConfigs[theMod.Game];
		
		// What .pak extension would we like to use?
		var pakExtension = gameConfig.DefaultPakFormat || "xen";

		// Directory we'll package up
		var packDir = path.join(thePackage.Directory, 'Compiled');
		
		// No compiled dir, don't bother
		if (!fs.existsSync(packDir))
		{
			cons.error("DIR DOES NOT EXIST: " + packDir);
			return 'error';
		}
		
		var defPakPath = gameConfig.DefaultPakPath;
		var usingPab = false;
		var usingZone = false;
		var zonePrefix = '';
		var zonePath = '';
		var assetPak = false;
		var tags = [];
		
		// If it has a pak.json, draw from it
		var pakJsonPath = path.join(thePackage.Directory, 'pak.json');
		if (fs.existsSync(pakJsonPath))
		{
			var cfg = require(pakJsonPath);
			
			defPakPath = cfg.OutPath || defPakPath;
			usingPab = cfg.PAB || usingPab;
			assetPak = cfg.AssetPak || false;
			tags = cfg.Tags || [];
			
			if (cfg.ZonePrefix)
			{
				usingZone = true;
				zonePrefix = cfg.ZonePrefix;
			}
		}
		
		if (usingZone && zonePrefix)
			zonePath = this.FindZonePath(thePackage.Directory, zonePrefix);
		
		// Grab link list from text
		var links = {};
		var linkPath = path.join(thePackage.Directory, 'links.txt');
		
		// Links.txt exists, let's use it as-is
		if (fs.existsSync(linkPath))
		{
			var lines = fs.readFileSync(linkPath).toString().split("\n");
			links = this.ParseLinks(lines);
		}
			
		// It doesn't exist! Let's try to generate one ourselves
		else
		{
			var linkTxt = this.CreateLinkTxt(thePackage.Directory, zonePath, zonePrefix, pakExtension);
			links = this.ParseLinks(linkTxt.split("\n"));
		}
		
		// Where we want the .pak file to be
		var contentPath = path.join(thePackage.Directory, 'Content');
		contentPath = path.join(contentPath, defPakPath, selectedPackage + ".pak." + pakExtension);
		
		cons.log("Packaging " + selectedPackage + " into PAK form...");
		
		// -- NOTIFY ALL PLUGINS THAT WE'VE STARTED PACKAGING
		// Give them a chance to add additional file data
		
		var notifyData = {
			outPak: contentPath,
			packDir: packDir,
			pab: usingPab,
			modName: selectedMod,
			packageName: selectedPackage,
			tags: tags
		};
		
		var extraFiles = [];
		var pluginKeys = Object.keys(GHSDK.Plugins);
		
		for (const key of pluginKeys)
		{
			var plug = GHSDK.Plugins[key];
			if (plug.PackagingStarted)
			{
				var res = plug.PackagingStarted(notifyData);
				if (res && res.extraFiles)
					extraFiles = extraFiles.concat(res.extraFiles);
					
				// Errors
				if (res && res.errors)
				{
					for (const err of res.errors)
						cons.error(err);
						
					return 'error';
				}
			}
		}
		
		// - - - - - - - - - - - - - - -

		var result = await GHSDK.PakHandler.Compile(packDir, contentPath, {
			usePAB: usingPab,
			isZone: usingZone,
			zonePrefix: zonePrefix,
			zonePath: path.relative(packDir, zonePath),
			extraFiles: extraFiles,
			assetPak: assetPak,
			tags: tags,
			extension: pakExtension,
			links: links
		});
		
		for (const error of result.errors)
			cons.error(error);
		for (const warn of result.warnings)
			cons.warn(warn);
		for (const log of result.logs)
			cons.log(log);
			
		return true;
	}
	
	//--------------------------------------------
	// Sync the mod's data to the game dir!
	//--------------------------------------------
	
	async SyncMod(selectedMod, selectedPackage)
	{
		var theMod = GHSDK.Mods[selectedMod];
		var thePackage = theMod.Packages[selectedPackage];
		
		if (!thePackage)
			return 'nocontent';
		
		var gameConfig = GHSDK.GameConfigs[theMod.Game];
		
		var contentDir = path.join(thePackage.Directory, 'Content');
		
		// No content dir!
		if (!fs.existsSync(contentDir))
			return 'nocontent';
		
		var contentFiles = GHSDK.ScanFolder(contentDir);
		
		for (var f=0; f<contentFiles.length; f++)
		{
			var file = contentFiles[f];

			var rel = path.relative(contentDir, file);
			var outPath = path.join(gameConfig.GameDir, rel);
			
			// Fancy log!
			var pct = f / contentFiles.length;
			var pctString = Math.floor(pct * 100.0) + "%";
			
			cons.logPercent("[" + (f+1) + " / " + contentFiles.length + " - " + pctString + "] Copying " + rel + "...", pct);
			
			var outDir = path.dirname(outPath);
			if (!fs.existsSync(outDir))
				fs.mkdirSync(outDir, {recursive: true});
			
			fs.copyFileSync(file, outPath);
		}
		
		cons.log("All files have been copied!", 'lime');
		
		return 'success';
	}
	
	//--------------------------------------------
	// Get sub-set of links
	//--------------------------------------------
	
	GetLinkSubset(mainFolder, zoneFolder, prefix, plat = "xen", suffix = "")
	{
		var lines = [];
		var fileLinks = [
			['scn', 'tex'],
			['hkc', 'scn'],
			['qb', 'scn'],
			['col', 'scn']
		];
		
		var comDir = path.join(mainFolder, 'Compiled');
		if (!fs.existsSync(comDir))
			comDir = mainFolder;
		
		// scn -> tex
		// hkc -> scn
		// qb -> scn
		
		for (const fl of fileLinks)
		{
			var fileA = path.join(zoneFolder, prefix + suffix + '.' + fl[0]);
			var fileB = path.join(zoneFolder, prefix + suffix + '.' + fl[1]);
			
			var pathA = fileA + "." + plat;
			var pathB = fileB + "." + plat;
			
			if (fs.existsSync(pathA) && fs.existsSync(pathB))
			{
				var relA = path.relative(comDir, fileA);
				var relB = path.relative(comDir, fileB);
				
				if (relA[0] !== '.' && relB[0] !== '.')
					lines.push(relA + " -> " + relB);
			}
		}
		
		// Create links for .skin to .tex files
		// (This is good for things like crowd models)
		
		var fileMap = {};
		var texMap = {};
		
		var scanned = GHSDK.ScanFolder(comDir);
		
		for (const fPath of scanned)
		{
			var rel = path.relative(comDir, fPath);
			if (rel[0] == '.')
				continue;
				
			fileMap[rel] = true;
			
			if (rel.toLowerCase().indexOf(".tex") >= 0)
				texMap[rel] = true;
		}
		
		// For each tex, try to find a matching .skin
		for (const key of Object.keys(texMap))
		{
			var relPath = key;
			
			var validExtens = [".skin", ".scn", ".mdl"];
			
			// Loop through all valid extensions the file can have
			for (const exten of validExtens)
			{
				var modelPath = relPath.replace(".tex", exten);
				
				var realPath = path.join(comDir, modelPath);
				
				if (!fs.existsSync(realPath))
					continue;
					
				// Remove plat indicator
				modelPath = modelPath.replace("." + plat, "");
				relPath = relPath.replace("." + plat, "");
						
				lines.push(modelPath + " -> " + relPath);
			}
		}
		
		return lines;
	}
	
	//--------------------------------------------
	// Create a fake link.txt for a zone
	// (Checks which files exist and automatically
	// compiles a txt file for them)
	//--------------------------------------------
	
	CreateLinkTxt(inFolder, zoneFolder, zonePrefix, exten)
	{
		var txt = [];
		
		// Get non-suffixed links, this handles files like .skin etc.
		var subsets = [ this.GetLinkSubset(inFolder, zoneFolder, zonePrefix, exten, "") ];
			
		// The actual zone folder exists, check zone suffixes
		if (fs.existsSync(zoneFolder))
		{
			subsets.push( this.GetLinkSubset(inFolder, zoneFolder, zonePrefix, exten, "_gfx") );
			subsets.push( this.GetLinkSubset(inFolder, zoneFolder, zonePrefix, exten, "_lfx") );
			subsets.push( this.GetLinkSubset(inFolder, zoneFolder, zonePrefix, exten, "_sfx") );
		}
		
		for (const ss of subsets)
		{
			for (const line of ss)
				txt.push(line);
		}
		
		if (txt.length <= 0)
			return "";
				
		return txt.join("\n");
	}
	
	//--------------------------------------------
	// Parse file links
	//--------------------------------------------
	
	ParseLinks(lines)
	{
		var links = {};
		var parsed = {};
		
		for (var line of lines)
		{
			var spl = line.split("->");
			if (spl.length < 2)
				continue;

			var linkFrom = spl[0].trim().replace(/[/\\]/g, path.sep);
			var linkTo = spl[1].trim().replace(/[/\\]/g, path.sep);
				
			linkFrom = path.normalize(linkFrom);
			linkTo = path.normalize(linkTo);
			
			linkFrom = linkFrom.replace(/[/\\]/g, "\\");
			linkTo = linkTo.replace(/[/\\]/g, "\\");
			
			parsed[linkFrom] = true;
			parsed[linkTo] = true;
			
			links[linkFrom] = links[linkFrom] || {children: []};
			links[linkFrom].parent = linkTo;
			
			links[linkTo] = links[linkTo] || {children: []};
			links[linkTo].children.push(linkFrom);
		}
		
		return links;
	}
}

module.exports = ModPackager;
