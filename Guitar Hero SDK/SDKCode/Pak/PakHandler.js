// PAB file seems to be data...
// PAK is header information
// No PAB = same file!

// NOTHING after 2CB3EF3B (.last) seems to matter
// However, we do need this to know when to read the last file

// QueenBee said file should be padded to nearest 0x800, does it matter? YES

// Between-files are padded to nearest 32 bytes? Or is it the START of each file?

// -- FOR THINGS WITH PAB: --
// Subtract the .pak filesize from start!
// If start in .pak is 1000 but .pak is 500 bytes large, then REAL start is at 500
//
// Junk at the end of the pab isn't even needed, it doesn't crash!
// Still not sure what controls end AB... Apparently padded to nearest 2048 bytes

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const dbgFile = 0x559566CC;			// .dbg
const PLATFORM_EXT = "xen";

const platformExtensions = ["wpc", "ps3", "xen"];
const languages = ["br", "de", "en", "fr", "it", "de", "es", "fr", "it"];

const FLAG_COMPRESSED = 0x0100;
const FLAG_HASFILENAME = 0x0020;

const FLAG_THAW_SFX = 0x02;

const FTYPE_LAST = 0x2CB3EF3B;
const FTYPE_LAST_TH = 0xB524565F;

const extensionList = [
	"qb", "sqb", "dbg", "img", "mqb", "tex", "skin", "cam", "col", "fam", "fnc", "fnt", "fnv", "gap",
	"hkc", "imv", "last", "mcol", "mdl", "mdv", "nav", "nqb", "oba", "pfx", "pimg", "png", "rag", "rnb",
	"rnb_lvl", "rnb_mdl", "scn", "scv", "shd", "ska", "ske", "skiv", "stex", "table", "tvx", "wav",
	"empty", "clt", "jam", "note", "nqb", "perf", "pimv", "qs", "qs.br", "qs.de", "qs.en", "qs.es",
	"qs.fr", "qs.it", "raw", "rgn", "trkobj", "xml"
];


const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class GHWTPakHandler
{
	constructor()
	{
		// Generate extension QBKeys
		this.extensions = {};
		
		for (const ext of extensionList)
		{
			var qbk = Checksums.Make("." + ext).toString(16).padStart(8, "0");
			this.extensions[qbk] = ext;
		}
	}
	
	//-------------------------------
    // This word is a language prefix.
	//-------------------------------
    
    IsLanguagePrefix(word)
    {
        var tlc = word.toLowerCase();
        for (const lang of languages)
        {
            if (tlc == lang)
                return true;
        }
        
        return false;
    }
    
	//-------------------------------
	// Extract a pak file!
	//-------------------------------
	
	Extract(pakPath, outPath, options = {})
	{
		this.options = options;
		this.outPath = outPath;
		this.inPak = pakPath;
		
		// Get file extension
		this.extension = pakPath.split(".").pop().toLowerCase();
		
		// PAB file if it exists
        var pakDir = path.dirname(pakPath);
        var pakFile = path.basename(pakPath);
        
        var spl = pakFile.split(".");
        
        if (spl[1][2] == 'K')
            spl[1] = spl[1].slice(0, 2) + 'B';
        else if (spl[1][2] == 'k')
            spl[1] = spl[1].slice(0, 2) + 'b';
            
        this.inPab = path.join(pakDir, spl.join("."));

		this.requiresPab = (fs.existsSync(this.inPab) && this.inPab != pakPath);
        
		console.log("Requires PAB: " + this.requiresPab);
		
		// Try to get plat extension
		this.pakExtension = "";
		var spl = pakPath.split(".");
		if (spl.length)
			this.pakExtension = spl[spl.length-1];
		
		// Read pak data
		this.data = fs.readFileSync(this.inPak);

		// Does our pak start with CHNK? If so, it's XBox compressed
		var chun = this.data.slice(0, 4).toString();		
		if (chun == "CHNK")
			this.data = this.XBoxDecompress(this.data);
		else if (options.forceZlib)
			this.data = zlib.inflateRawSync(this.data);
			
		this.pabStart = this.data.length;
		
		// Read pak headers FIRST! This always comes first!
		this.ReadPakHeaders();
		
		// Does it require a pab? Slap pab data onto the main data
		// This makes things pretty easy, we can use the REAL position in that case
		if (this.requiresPab)
		{
            if (!fs.existsSync(this.inPab))
            {
                cons.warn("File '" + this.inPab + "' did not exist.");
                return [];
            }

			var pabData = fs.readFileSync(this.inPab);
            
			// Does our data start with CHNK? If so, it's XBox compressed
			if (!this.isCasPieces)
			{
				var chun = pabData.slice(0, 4).toString();		
				if (chun == "CHNK")
					pabData = this.XBoxDecompress(pabData);
				else if (options.forceZlib)
					pabData = zlib.inflateRawSync(pabData);
			}
			
			// Before we concat to the .pab, let's get the
			// offset that our first file WOULD start at, and
			// trim the .pak file to that length
			
			var firstOff = this.fileMetas[0].start;
			
			if (firstOff > 0)
				this.data = this.data.slice(0, firstOff);
			
			this.data = Buffer.concat([this.data, pabData]);
		}
		
		// Debug keys that we found in the pak
		this.debugKeys = {};
		this.debugPath = pakPath.replace(".pak.xen", "_dbg.txt");
		
		// BAD MAGIC, we did NOT find a magic type
		// (This usually means the pak is funky somehow)
		
		if (this.badMagic)
		{
			if (!options.attempted)
			{
				this.badMagic = false;
				cons.log("");
				cons.warn("WARNING: Did not find a .last filetype!");
				cons.warn("Pak may be compressed, attempting again ZLib...");
				cons.log("");
				
				options.forceZlib = true;
				options.attempted = true;
				return this.Extract(pakPath, outPath, options);
			}
			else
				cons.error("COULD NOT PARSE PAK FILE WHATSOEVER!");
		}
		
		// Large pak, this will probably take a while to decompress
		// Let's show a pleasant percentage indicator
		this.showPakProgress = (this.totalFilesize >= 100000000)
		
		// Now extract the file data
		this.ExtractFiles(options);
		
		if (options.dataOnly)
			return this.fileMetas;
		
		// Write debug keys if we have any
		var keys = Object.keys(this.debugKeys)
		if (keys.length > 0 && !options.dataOnly)
		{
			var keyLines = [];
			for (const key of keys)
			{
				keyLines.push(key + " " + this.debugKeys[key]);
			}
			
			cons.log(path.basename(this.inPak) + " has DEBUG KEYS! Writing to " + path.basename(this.debugPath) + "...", 'yellow');
			fs.writeFileSync(this.debugPath, keyLines.join("\n"));
		}
	}
	
	//-------------------------------
	// Read GH header
	//-------------------------------
	
	ReadPakHeader_GH(r)
	{
		var file = {};
		file.headerStart = r.Tell();
		
		file.type = r.UInt32();
		
		// Magic filetype
		// This is actually .last, TH uses last

		if (file.type == FTYPE_LAST || file.type == FTYPE_LAST_TH) 
			return false;
		
		// Start
		file.start = r.UInt32();

		// File size
		file.size = r.UInt32();
		
		this.totalFilesize += file.size;
		
		// Asset context
		file.pakFullFilenameKey = "0x" + r.UInt32().toString(16).padStart(8, "0");
		
		// Full filename, including path
		file.fullName = "0x" + r.UInt32().toString(16).padStart(8, "0");
		
		// Just the name checksum, no extension
		file.nameSum = "0x" + r.UInt32().toString(16).padStart(8, "0");
		
		file.unk = r.UInt32();				// Parent object
		file.flags = r.UInt32();			// Flags
		
		if ((file.flags & FLAG_HASFILENAME) && (this.extension == "wpc" || this.extension == "ps2" || this.extension == "ngc"))
		{
			var nextFile = r.Tell() + 160;
			
			file.fullName = r.TermString();
			
			r.Seek(nextFile);
		}
		
		this.fileMetas.push(file);
		
		return file;
	}
	
	//-------------------------------
	// Read THAW header
	//-------------------------------
	
	ReadPakHeader_THAW(r)
	{
		var file = {};
		file.headerStart = r.Tell();
		
		file.type = r.UInt32();
		
		// Magic filetype
		// This is actually .last, TH uses last
		
		if (file.type == FTYPE_LAST || file.type == FTYPE_LAST_TH) 
			return false;
		
		// Start
		file.start = r.UInt32();

		// File size
		file.size = r.UInt32();
		
		this.totalFilesize += file.size;
		
		// FullFilenameQBKey
		// (For THAW, this includes .wpc extension!)
		file.fullName = "0x" + r.UInt32().toString(16).padStart(8, "0");
		
		// Just the name checksum, no extension
		// (Pretty much always 0)
		file.nameSum = "0x" + r.UInt32().toString(16).padStart(8, "0");
		
		// PakFullFilenameQBKey
		// (Not actually sure what this is, but it doesn't matter)
		file.pakFullFilenameKey = "0x" + r.UInt32().toString(16).padStart(8, "0");
		
		// Reserved / Texture reference
		// Some .pak files refer to a .tex using this!
		file.unk = r.UInt32();
		
		// Flags!
		file.flags = r.UInt32();
		
		// Has filename stored in header?
		if (file.flags & 0x20)
		{
			var toSkip = r.Tell() + 160;
			
			file.fullName = r.TermString();
			
			r.Seek(toSkip);
		}
		
		this.fileMetas.push(file);
		
		return file;
	}
	
	//-------------------------------
	// Read headers from the pak file!
	//-------------------------------
	
	ReadPakHeaders()
	{
		var r = new GHSDK.Constants.Reader(this.data);
		
		this.isCasPieces = false;
		
		// THAW files are LE
		if (this.extension == "wpc" || this.extension == "ps2")
			r.LE = true;
		
		// Read until we hit our magic filetype
		var abort = false;
		
		this.fileMetas = [];
		this.totalFilesize = 0;
		
		while (r.offset < r.buf.length && !abort)
		{
			var ph;
			
			if (this.extension == "wpc")
				ph = this.ReadPakHeader_THAW(r);
			else
				ph = this.ReadPakHeader_GH(r);
			
			if (!ph)
			{
				abort = true;
				break;
			}
			
			// Does it have cas_pieces flags?
			else
			{
				if (ph.flags & 0x0200)
					this.isCasPieces = true;
			}
		}
		
		// We DID NOT hit a magic header
		if (!abort)
		{
			this.fileMetas = [];
			this.badMagic = true;
		}
	}
	
	//-------------------------------
	// Should we bother decoding a file name?
	//-------------------------------
	
	ShouldLookupName(fInfo)
	{
		// THAW .SKA anim!
		//    These have weirdly generated checksums, leave them as-is
		
		if (this.pakExtension == 'wpc' && fInfo.type == 0x745DCD45)
			return false;
			
		return true;
	}
	
	//-------------------------------
	// Extract the files!
	//-------------------------------
	
	ExtractFiles(opt = {})
	{
        var usedNames = {};
        
		for (var f=0; f<this.fileMetas.length; f++)
		{
			var file = this.fileMetas[f];
			var realStart = file.headerStart + file.start;
			
			// CAS pieces uses offsets relative to PAB offset
			// (Do other pak files do this as well?)
			//
			// We should also check if the first file's offset is 0,
			// this obviously means that it's relative to PAB start
			
			if (this.isCasPieces || this.fileMetas[0].start == 0)
				realStart = this.pabStart + file.start;

			var fileChunk = this.data.slice(realStart, realStart + file.size);
			
			// Debug file! Extract debug keys
			if (file.type == dbgFile)
				this.ParseDbgFile(fileChunk);
				
			// Determine the full name of the sum, if possible!
			var fullName = "";
			var shortName = Checksums.Lookup(file.nameSum);
            
			// Use shortname if fullname is 0, this is for strange files
			if (file.fullName == 0)
				fullName = shortName;
			else
			{
				if (this.ShouldLookupName(file))
					fullName = Checksums.Lookup(file.fullName);
				else
					fullName = file.fullName;
			}

			// Normalize slashes to proper path separator if it has any
			var fullName = fullName.replace(/[/\\]/g, path.sep);
            
			// Attempt to get a "reasonable" path from it
			// All items should START in the data directory!
			if (fullName.indexOf(":/") >= 0 || fullName.indexOf(":\\") >= 0)
			{
				var spl = fullName.split(path.sep);
				
				while (spl.length > 0 && spl[0] !== 'data') { spl.shift(); }
				
				// Pop final data
				spl.shift();
				
				fullName = spl.join(path.sep);
			}
            
            // Has it been used?
            if (usedNames[fullName])
            {
                console.log("Filename '" + fullName + "' is duplicate, using raw name... [" + file.fullName + "]");
                fullName = file.fullName;
            }
            
            usedNames[fullName] = true;
            
			// If it doesn't have an extension, let's give it one
            var ext = file.type.toString(16).padStart(8, "0");
            var extString = this.extensions[ext];
            
			if (fullName.indexOf(".") == -1)
			{
				if (extString)
					fullName += "." + extString;
			}
            
            // If the filename ends in a localized value,
            // then we'll get the "real" extension from
            // our filetype key. This handles cases like
            // .qs.it where the fullname says .qs.en, but
            // the filetype is something different entirely.
            
            var spl = fullName.split(".");
            
            for (const lang of languages)
            {
                if (spl[spl.length-1].toLowerCase() == lang)
                {
                    spl.pop();      // Remove language word
                    spl.pop();      // Remove actual extension
                    
                    fullName = spl.join(".") + "." + extString;
                    break;
                }
            }
			
			// Slap platform extension onto the end
			if (fullName.toLowerCase().indexOf(this.extension) == -1)
				fullName += "." + this.extension;

			if (this.showPakProgress && !opt.dataOnly)
			{
				var pct = (f / this.fileMetas.length);
				var pctString = Math.floor(pct * 100.0).toString() + "%";
				cons.logPercent("Extracting [" + (f+1) + " / " + this.fileMetas.length + " - " + pctString + "] " + path.basename(fullName) + "...", pct);
				
				if (file.size <= 0)
					cons.warn("  File is 0 bytes!", "yellow");
			}

			// Where do we want to write it?
			var outFile = path.join(this.outPath, fullName);
			
			// Make dir if it doesn't exist
			var dir = path.dirname(outFile);
			if (!fs.existsSync(dir))
				fs.mkdirSync(dir, {recursive: true});
				
			// Proper handling for X360 cas_pieces files!
			if (this.isCasPieces && fileChunk[0] == 0x43 && fileChunk[1] == 0x48 && fileChunk[2] == 0x4E && fileChunk[3] == 0x4B)
				fileChunk = this.ParseCASPieceData(fileChunk);
				
			if (opt.dataOnly)
				this.fileMetas[f].data = fileChunk;
			else
				fs.writeFileSync(outFile, fileChunk);
		}
	}
	
	// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//-------------------------------
    // Returns uncompressed data from
    // data that may or may not be compressed.
	//-------------------------------
    
    DecompressData(data)
    {
        // GZ
        if (data[0] == 0x47 && data[1] == 0x5A)
        {
            data = data.slice(16, data.length);
            var decom = zlib.inflateRawSync(data);
            
            return decom;
        }
        
        // CHNK
        if (data[0] == 0x43 && data[1] == 0x48 && data[2] == 0x4E && data[3] == 0x4B)
            return this.XBoxDecompress(data);
        
        return data;
    }
    
	//-------------------------------
	// Parse a cas_pieces-like file
	// The file can be split across multiple chunks
	//-------------------------------
	
	ParseCASPieceData(fileChunk)
	{
		var chunks = [];

		var r = new GHSDK.Constants.Reader(fileChunk);
		var magic = r.Chunk(4).toString();

		while(magic == 'CHNK')
		{
			var baseOffset = r.Tell() - 4;

			var offset = baseOffset + r.Int32();
			var zSize = r.Int32();
			
			// base + nextOffset is next chunk!
			var nextChunkOffset = r.Int32();
			var nextChunkLength = r.Int32();
			var size = r.Int32();
			var outOffset = r.Int32();
			
			//~ cons.log("     Offset: " + offset);
			//~ cons.log("     Compressed Size: " + zSize);
			//~ cons.log("     nextChunkOffset: " + nextChunkOffset);
			//~ cons.log("     nextChunkLength: " + nextChunkLength);
			//~ cons.log("     Uncompressed Size: " + size);
			//~ cons.log("     outOffset: " + outOffset);
			
			var dataStart = offset;
			r.Seek(dataStart);
			
			//~ cons.log("       Decompressing " + zSize + " bytes at " + r.Tell() + "...");
			
			var buf = r.Chunk(zSize);
			var decom = zlib.inflateRawSync(buf);
			
			//~ cons.log("         Real uncompressed size: " + decom.length);
						
			chunks.push(decom);
			
			// End of this particular file
			if (nextChunkOffset < 0)
				break;
				
			// Attempt to find the next CHNK
			else
			{
				r.Seek(baseOffset + nextChunkOffset);
				magic = r.Chunk(4).toString();
			}
		}
		
		var finalData = Buffer.concat(chunks);

		//~ cons.log("  Chunks: " + chunks.length);
		//~ cons.log("  Total Size: " + finalData.length);
		//~ cons.log("");
		
		return finalData;
	}
	
	//-------------------------------
	// Scan a dir for files
	//-------------------------------
	
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
	
	//-------------------------------
	// THAW zone?
	// These are handled oddly... for now
	//-------------------------------
	
	THAWZone()
	{
		return (this.isZone && this.pakExtension && this.pakExtension.toLowerCase() == "wpc");
	}
	
	//-------------------------------
	// Get name-only for a file
	//-------------------------------
	
	GetPakNameOnly(fPath)
	{
		var ret = path.basename(fPath).split(".").shift();

		// HACK: Drummer skeleton hack
		// If so, use a bit of a unique path for it
		if (fPath.toLowerCase().indexOf("_drummer.ske") >= 0)
		{
			// GH_Rocker_Male_MyRocker_Drummer
			// GH_Drummer_Male_MyRocker
			
			var spl = ret.split("_");
			
			for (var w=0; w<spl.length; w++)
			{
				if (spl[w].toLowerCase() == 'rocker')
					spl[w] = 'Drummer';
			}
			
			if (spl[spl.length-1].toLowerCase() == 'drummer')
				spl.pop();
			
			spl = spl.join("_");
			return spl;
		}
		
		// Replace _original with nothing if that's the case
		if (ret.toLowerCase().indexOf("_original") >= 0 && (fPath.toLowerCase().indexOf(".ske") >= 0 || fPath.toLowerCase().indexOf(".rag") >= 0))
		{
			var spl = ret.split("_");
			spl.pop();
			ret = spl.join("_");
		}
		
		return ret;
	}
	
	//-------------------------------
    // Get pak file extension
	//-------------------------------
    
    GetPakExtension(file)
	{        
        // -- Get our extension to use for the file.
        var fnSpl = file.split(".");
        
        // We want to remove our platform identifier. This doesn't
        // get factored into pak files AT ALL.
        
        for (const plat of platformExtensions)
        {
            if (fnSpl[fnSpl.length-1].toLowerCase() == plat)
            {
                fnSpl.pop();
                break;
            }
        }
        
        var extSpl = fnSpl.slice();
        
        // Generally, we only focus on the LAST item in the fnSpl list.
        var ext = extSpl.pop();
        
        // However, if this is a language suffix, then we'd like to add
        // it to the item before. This handles items like .qs.en, etc.
        if (extSpl.length > 0)
        {
            for (const lang of languages)
            {
                if (ext.toLowerCase() == lang)
                {
                    ext = extSpl.pop() + "." + ext;
                    break;
                }
            }
        }
        
        return ext;
    }
    
	//-------------------------------
	// Get pak filename for a file based on its parent dir
	//-------------------------------
	
	GetPakFilename(dir, file)
	{
		var fullName = "";
		
		// Get PROPER fullname!
		// Full names have / replaced with \ and are relative to the data dir
		var fN = path.relative(dir, file).replace(/\//g, "\\");
        
        var dirName = path.dirname(fN);
        var baseName = path.basename(fN);
        
		// If our skeleton isn't in the skeletons folder, ignore the .ske
		var ignoreSke = (fN.toLowerCase().indexOf("skeletons\\") < 0);
		var ignoreRag = (fN.toLowerCase().indexOf("ragdolls\\") < 0);
        
        // -- Get our extension to use for the file.
        var fnSpl = baseName.split(".");
        
        // We want to remove our platform identifier. This doesn't
        // get factored into pak files AT ALL.
        
        for (const plat of platformExtensions)
        {
            if (fnSpl[fnSpl.length-1].toLowerCase() == plat)
            {
                fnSpl.pop();
                break;
            }
        }
        
        // Language identifier also does not get factored in AT ALL.
        // (It is only used for the extension, nothing else.)
        
        if (this.IsLanguagePrefix(fnSpl[fnSpl.length-1]))
            fnSpl.pop();
        
        var ext = this.GetPakExtension(file);
        
		// If our first word starts with a 0x then we'll use it as-is!
		if (fnSpl[0].indexOf("0x") == 0)
			fullName = fnSpl[0];
		else
		{
			// DO NOT ADD FONT NAMES
			if (ext == "fnt")
				fnSpl.pop();
				
			// Skeleton hack
			if (ext == "ske" && ignoreSke)
				fnSpl.pop();
				
			// Ragdoll hack
			if (ext == "rag" && ignoreRag)
				fnSpl.pop();

            var fullNameString = path.join(dirName, fnSpl.join("."));
			fullName = Checksums.MakePakFullname(fullNameString);
		}
		
		// _Original files do not use the .ske extension
		// GH_Rocker_Male_Original.ske.xen -> GH_Rocker_Male_Original
		//		(THESE CANNOT BE IN FOLDERS)
		
		var tlc = fN.toLowerCase();
		
		if (tlc.indexOf("_original") >= 0 && (tlc.indexOf(".ske") >= 0 || tlc.indexOf(".rag") >= 0))
			fullName = fullName.split(".")[0];
			
		return fullName;
	}
	
	//-------------------------------
	// Take a directory and recursively create
	// necessary data for packing files
	//-------------------------------
	
	CreateFileData(inDir)
	{
		var fileData = [];
        
        var dbgAllowed = true;
        
        if (global.GHSDK && !GHSDK.Config.PackageDBGFiles)
            dbgAllowed = false;
		
		if (fs.existsSync(inDir))
		{
			// Recursive file list!
			this.fileList = this.ScanFolder(inDir);
			for (var file of this.fileList)
			{
				var fDat = {
					pakFullFilenameKey: "0x00000000",
					path: file
				};
				
				fDat.fullName = this.GetPakFilename(inDir, file);
				fDat.data = fs.readFileSync(file);
				
				// - - - - - - - - - - - - - - - - - - - - - - 

                fDat.extension = this.GetPakExtension(file);
				
				// Name only, no extension
				fDat.nameOnly = this.GetPakNameOnly(fDat.path);
                
				// - - - - - - - - - - - - - - - - - - - - - - 
				
                if (fDat.extension == "dbg" && !dbgAllowed)
                    continue;
                
				fileData.push(fDat);
			}
		}
		
		// Push our last file onto the end of the stack
		var lastFile = {
			fullName: "0x897ABB4A",
			pakFullFilenameKey: "0x00000000",
			extension: "last",
			nameOnly: "0x6AF98ED1",
			data: Buffer.from("ABABABAB", 'hex')
		};
		
		fileData.push(lastFile);
		
		return fileData;
	}
	
	//-------------------------------
	// Are we allowed to write filename in the header?
	// This covers some edge cases where we SHOULD NOT
	//-------------------------------
	
	FileNameAllowed(fDat)
	{
		// File starts with 0x and is therefore not looked up
		if (path.basename(fDat.fullName).indexOf("0x") == 0)
			return false;
			
		// QB files will ALWAYS use their filename, if they can!
		if (fDat.fullName.toLowerCase().indexOf(".qb") >= 0)
			return true;
			
		return false;
	}
	
	//-------------------------------
	// Compile a directory into a pak file!
	//-------------------------------
	
	async Compile(inDirOrList, outPak, opt = {})
	{
		// Needs PAB?
		var needPAB = (opt && opt.usePAB) || false;
		
		var showProgress = (opt && opt.debug) || false;
		
		this.pakExtension = opt.extension || "xen";
		this.isZone = (opt && opt.isZone) || false;
		
		// What .pak name should we use?
		// (AssetContext)
		
		var assetContext = path.basename(outPak).split(".")[0];
		
		var resultData = {logs: [], warnings: [], errors: []};
		var fileData;
		
		if (typeof(inDirOrList) == 'string')
			fileData = this.CreateFileData(inDirOrList);
		else
			fileData = inDirOrList;
			
		// Ensure our last file is the proper "last" file
		var lastFile = fileData[fileData.length-1];
		if (Checksums.Make(lastFile.fullName) !== 0x897ABB4A)
		{
			fileData.push({
				fullName: "0x897ABB4A",
				pakFullFilenameKey: "0x00000000",
				extension: "last",
				nameOnly: "0x6AF98ED1",
				data: Buffer.from("ABABABAB", 'hex')
			});
		}
		
		// Additional files were passed in!
		if (opt.extraFiles)
		{
			// Keep last file last
			var lastFile = fileData.pop();
			
			for (const extra of opt.extraFiles)
			{
				var fDat = {};
				
				fDat.fullName = extra.fullName;
				fDat.pakFullFilenameKey = extra.pakFullFilenameKey || (fileData.length > 0 && fileData[0].pakFullFilenameKey) || "0x00000000";
				fDat.extension = extra.extension;
				fDat.nameOnly = extra.nameOnly;
				fDat.data = extra.data;
				
				fileData.push(fDat);
				
				//~ console.log("Extra file: " + extra.fullName + " - " + Checksums.Make(fDat.nameOnly).toString(16));
			}
			
			fileData.push(lastFile);
		}
        
        // Handles asset parenting.
        fileData = this.OrganizeSceneHeaders(fileData);
		
		// Writer for the pak
		var w = new GHSDK.Constants.Writer();
		if (this.pakExtension == "wpc")
			w.LE = true;
		
		// File positions to write later
		var fPositions = [];
		
		// Loop through each of the files and create header data for them
		for (var f=0; f<fileData.length; f++)
		{	
			var fDat = fileData[f];
			
			//~ console.log("Creating header for file " + f + "... " + fDat.fullName);
			
			// Extension first
			var extToUse = fDat.extension || fDat.type;
			
			if (typeof(extToUse) == 'number')
				var extenQB = extToUse;
			else
				var extenQB = Checksums.Make("." + extToUse);
				
			// Last file, TH style
			var isLast = (extenQB == FTYPE_LAST);
			
			if (isLast && this.pakExtension == "wpc")
				extenQB = FTYPE_LAST_TH;
					
			w.UInt32(extenQB);
			
			// Position - FIX LATER
			fPositions.push(w.Tell());
			w.UInt32(0);
			
			if (!fDat.data)
			{
				cons.error("NO DATA FOR FILE " + f);
				console.log(fDat);
				return;
			}
			
			// Length / Size
			w.UInt32(fDat.data.length);
			
			// Only use filename if file does not start with 0x
			var useFileName = this.FileNameAllowed(fDat);
			
			// -- WPC CAN STORE FILENAME IN HEADER --
			if (this.pakExtension == "wpc")
			{
				// FULL FILENAME, WITH EXTENSION!
				var nameToWrite = fDat.fullName + (useFileName ? "." + this.pakExtension : "");

				w.UInt32(isLast ? 0 : Checksums.Make(fDat.fullName));
				
				// Do not use, name is specified in header
				w.UInt32(0);
				
				// For entries that have filename, this is the fullName.
				if (!isLast)
					w.UInt32(useFileName ? Checksums.Make(nameToWrite) : 0);
				else
					w.UInt32(0);
			}
			else
			{
				// PakFullFilenameQBKey
				var pakKey = parseInt(fDat.pakFullFilenameKey, 16);
				w.UInt32(pakKey);
				
				// Full filename QB key
				var fullKey = Checksums.Make(fDat.fullName);
				w.UInt32(fullKey);
				
				// Filename ONLY, no extension
				var onlyKey = Checksums.Make(fDat.nameOnly || fDat.nameSum);
				w.UInt32(onlyKey);
			}
			
			// File reference / link
			// Seems to be parent or something of the sort?
			
			if (fDat.reference)
			{
				var linkKey = Checksums.Make(fDat.reference);
				w.UInt32(linkKey);
			}
			else
				w.UInt32(0);
			
			// Flags
			var finalFlags = fDat.flags;
            
			if (this.pakExtension == "wpc" && useFileName && !isLast)
				finalFlags |= FLAG_HASFILENAME;
			
			// Is it a compressed file?
			
			if (fDat.data.length >= 4)
			{
				var slice = fDat.data.slice(0, 4).toString().toUpperCase();
				
				if (slice.indexOf("GZ") == 0 || slice.indexOf("LZSS") == 0 || slice.indexOf("VRLE") == 0)
					finalFlags |= FLAG_COMPRESSED;
			}
			
			w.UInt32(finalFlags);
			
			// FILE NAME, FOR WPC FILES
			if (this.pakExtension == "wpc" && !isLast && useFileName)
			{
				w.PadToNearest(16);
				
				var buf = Buffer.alloc(160);
				for (var s=0; s<nameToWrite.length; s++)
					buf[s] = nameToWrite.charCodeAt(s);
					
				w.Combine(buf);
			}
		}
		
		// Pad to nearest 4096 bytes
		//
		// (Even when we slice pak off, it will be aligned to
		// the nearest boundary!)
		
		//~ if (this.pakExtension !== 'wpc')
			//~ w.PadToNearest(4096);
		//~ else
			//~ w.Pad(32, 0xCD);
			
		w.PadToNearest(4096);
			
		// - - - - - - - - - - - - - - - - - - 
		
		// PAB / file data
		
		var dataStart = w.buffer.length;
		
		// Create a list of buffers that we'll throw onto the main one
		var bufs = [];
		var boff = w.Tell();
		
		for (var f=0; f<fileData.length; f++)
		{
			// Fancy log
			if (showProgress)
			{
				var pct = f / fileData.length;
				var pctString = Math.floor(pct * 100.0).toString() + "%";
				cons.logPercent("[" + (f+1) + " / " + fileData.length + " - " + pctString + "] " + fileData[f].fullName + "...", pct);
			}
			
			// - - - - - - - - - - - - - - - - - - - - - 
			
			var fDat = fileData[f];
			
			// Write file start location
			var oldOff = w.Tell();
			w.Seek(fPositions[f]);
			w.UInt32(boff - (fPositions[f] - 4));
			w.Seek(oldOff);
			
			var theBuf = fDat.data;
			boff += theBuf.length;
			
			// Pad to nearest 32 bytes
			if (f < fileData.length-1)
			{
				var nextPad = boff % 32;
				if (nextPad)
				{
					var toPad = (32 - nextPad);
					theBuf = Buffer.concat([theBuf, Buffer.alloc(toPad)]);
					boff += toPad;
				}
			}
			
			bufs.push(theBuf);
		}
		
		if (showProgress)
			cons.log("");
		
		// Combine all of them
		var comBuf = Buffer.concat(bufs);
		w.Combine(comBuf);
		
		// Pad the final data to the nearest 4096 bytes
		w.PadToNearest(4096, 0xAB);
		
		// Slice header and data off separately!
		var pakData = w.buffer.slice(0, dataStart);
		var pabData = w.buffer.slice(dataStart, w.buffer.length);
		
		var totalLength = needPAB ? pabData.length : (pakData.length + pabData.length);
		
		// Make dir name if needed
		var dir = path.dirname(outPak);
		if (!fs.existsSync(dir))
			fs.mkdirSync(dir, {recursive: true});
		
		// If we don't need PAB, combine them again
		if (!needPAB)
			pakData = Buffer.concat([pakData, pabData]);
		
		fs.writeFileSync(outPak, pakData);
		resultData.logs.push(path.basename(outPak) + " compiled!");
		
		if (needPAB)
		{
			var outPab = outPak.replace(".pak", ".pab");
			fs.writeFileSync(outPab, pabData);
			resultData.logs.push(path.basename(outPab) + " compiled!");
		}
		
		return resultData;
	}
	
	//-------------------------------
	// Perform XBox decompression on pak / pab data
	// Returns the new data
	//-------------------------------
	
	XBoxDecompress(data)
	{
		var r = new GHSDK.Constants.Reader(data);
		var w = new GHSDK.Constants.Writer();
		
		var magic = r.Chunk(4).toString();
		while(magic == 'CHNK')
		{
			//~ console.log(magic);
			
			var baseOffset = r.Tell() - 4;
			
			var offset = baseOffset + r.UInt32();
			var zSize = r.UInt32();
			var nextOffset = r.Int32();
			var dummy = r.UInt32();
			var size = r.UInt32();
			var outOffset = r.UInt32();
			
			// Decompress!
			r.Seek(offset);
			
			var buf = r.Chunk(zSize);
			
			var decom = zlib.inflateRawSync(buf);
			
			w.Combine(decom);

			if (nextOffset == 0xffffffff)
				break;
				
			r.Seek(baseOffset + nextOffset);
			magic = r.Chunk(4).toString();
		}
		
		return w.buffer;
	}
	
	//-------------------------------
	// Read dbg file
	//-------------------------------
	
	ParseDbgFile(dat)
	{
		var lines = dat.toString().split("\n");
		
		for (const line of lines)
		{
			if (line.indexOf("0x") < 0)
				continue;
				
			var spl = line.split(" ");
			var sumKey = spl.shift();
			var sumValue = spl.join(" ");
			
			// Use only the first debug key
			// (Solves cases like GH_Rocker_Male_Ozzy_original being defined multiple)
			if (!this.debugKeys[sumKey])
				this.debugKeys[sumKey] = sumValue;
		}
	}
	
	//-------------------------------
	// Find header in list of headers
	//-------------------------------
	
	FindHeader(headers, nm)
	{
		for (const hed of headers)
		{
			if (hed.fullName == nm)
				return hed;
		}
		
		return null;
	}
	
	//-------------------------------
    // Organize geometry headers.
    // Reorganizes .tex and .skin files, etc.
	//-------------------------------
    
    OrganizeSceneHeaders(headers)
    {
        var useTHAW = (this.pakExtension == "wpc");
        var originalLength = headers.length;
        
        var newHeaders = [];
        var nodes = [];
        
        // Various assets that depend on this child.
        var childTypes = {
            "mdl": ["qb", "mqb", "nqb", "sqb", "hkc", "col", "mcol", "scol"],
            "skin": ["qb", "mqb", "nqb", "sqb", "hkc", "col", "mcol", "scol"],
            "scn": ["qb", "mqb", "nqb", "sqb", "hkc", "col", "mcol", "scol"],
            "geom": ["qb", "mqb", "nqb", "sqb", "hkc", "col", "mcol", "scol"],
            
            "tex": ["mdl", "skin", "scn", "geom"]
        };
        
        // -----------------------------------
        
        // Attempt to figure out the zone name from our headers.
        var zn = "";
        for (const hd of headers) 
            zn = zn || GrabZoneName(hd.fullName);
            
        // -----------------------------------
        
        // Replace extension on a path.
        function RepExt(str, ext)
        {
            var fn = str.split(".");
            fn.pop();
            fn.push(ext);
            fn = fn.join(".").toLowerCase();
            
            return fn;
        }
        
        function FindParallelNodeIndex(hdr, ext)
        {
            var rep = RepExt(hdr.fullName, ext);
            
            for (var n=0; n<nodes.length; n++)
            {
                if (nodes[n].header.fullName.toLowerCase() == rep.toLowerCase())
                    return n;
            }
            
            return -1;
        }
        
        function SetStackType(currentType, node)
        {
            var ext = node.header.extension;
            
            if (ext == "mdl" || ext == "scn" || ext == "skin")
                return ext;
                
            // Tex? See which type our geometry is.
            if (ext == "tex")
            {
                for (const ch of node.children)
                {
                    var cExt = nodes[ch].header.extension;
                    
                    if (cExt == "mdl" || cExt == "skin")
                        return "stex";
                }
            }
            
            return currentType;
        }
        
        function GrabZoneName(fn)
        {
            // Try to get the name of the zone.
            var spl = fn.replace(/\\/g, "/").split("/");
            var folders = spl.slice();
            
            if (folders.length)
                folders.pop();
            
            while (spl.length)
            {
                var fold = spl.shift();
                
                if (spl.length && (fold.toLowerCase() == "worldzones" || fold.toLowerCase() == "zones"))
                    return spl[0];
            }
            
            return "";
        }
        
        function NeedsParent(ext) { return (ext != "tex" && ext != "stex"); }
        
        function IsBareZoneFile(fn)
        {
            if (fn.toLowerCase().indexOf("zones") >= 0)
            {
                if (zn)
                {
                    var lastName = fn.replace(/\\/g, "/").split("/").pop();
                    
                    var extens = ["", "_sfx", "_gfx", "_lfx"];
                    
                    for (const ext of extens)
                    {
                        if (lastName == zn + ext + ".qb")
                            return true;
                    }
                }
            }
            
            return false;
        }
  
        // Wonderful function name
        function SeekChildren(nodeIndex)
        {
            var hdr = nodes[nodeIndex].header;
            
            for (const pref of (childTypes[hdr.extension.toLowerCase()] || []))
            {
                var hdrIdx = FindParallelNodeIndex(hdr, pref);
                
                if (hdrIdx >= 0 && nodes[hdrIdx].parent != nodeIndex)
                {
                    nodes[hdrIdx].header.reference = nodes[nodeIndex].header.fullName;
                    nodes[hdrIdx].parent = nodeIndex;
                    nodes[nodeIndex].children.push(hdrIdx);

                    SeekChildren(hdrIdx);
                }
            }
        }

        // -- So, here's what we want to do:
        //          - For each header, create a "node" in an unordered list referring to it
        // -- THEN:
        //          - If it has children, find them in the list and add to the node's child array, set child parent to node
        //          - Do the same with all child nodes
        // -- THEN:
        //          - Loop through the node list, for each node:
        //              - If it has a parent, skip. This will be handled by "head" nodes.
        //              - If it has no parent, push the node and all of its children
        
        for (const hdr of headers)
            nodes.push({header: hdr, children: [], parent: -1});
            
        // Now properly link elements in the node list.
        
        for (var n=0; n<nodes.length; n++)
            SeekChildren(n);
          
        function PushHeaders(node, stackType = "")
        {
            stackType = SetStackType(stackType, node);
            
            // Decide zone suffix flags.
            
            var suffix = node.header.fullName.replace(/\\/g, "/").split("/");
            suffix = suffix.length ? suffix.pop() : suffix;
            
            var spl = suffix.split(".");
            suffix = spl.length ? spl.shift() : suffix;
            
            suffix = (suffix.length >= 4) ? suffix.substring(suffix.length-4, suffix.length) : suffix;
                
            var flags = 0;
                
            if (suffix == '_gfx')
                node.header.flags |= 4;
            else if (suffix == '_lfx' && !useTHAW)
                node.header.flags |= 32;
            else if (suffix == '_sfx')
                node.header.flags |= 2;
            
            if (stackType)
            {
                switch (node.header.extension)
                {
                    // Script file
                    case "qb":
                    {
                        if (stackType == "mdl")
                            node.header.extension = "mqb";
                        else if (stackType == "scn")
                        {
                            if (useTHAW && node.header.fullName.toLowerCase().indexOf("_scripts") >= 0)
                                node.header.extension = "sqb";
                            else if (IsBareZoneFile(node.header.fullName))
                                node.header.extension = "nqb";
                            else
                                node.header.extension = "qb";
                        }
                        break;
                    }
                    
                    // Scene file
                    case "scn":
                    {
                        if (stackType == "scn" && useTHAW)
                            node.header.extension = "geom";
                        break;
                    }
                        
                    // Texture file
                    case "tex":
                    {
                        if ((stackType == "mdl" || stackType == "stex") && useTHAW)
                            node.header.extension = "stex";
                            
                        break;
                    }
                        
                    // Collision file
                    case "col":
                    {
                        if (stackType == "mdl" && useTHAW)
                            node.header.extension = "mcol";
                        break;
                    }
                }
            }
            
            newHeaders.push(node.header);
            
            for (const ch of node.children)
                PushHeaders(nodes[ch], stackType);
        }
        
        // Debug the nodes.
        for (const node of nodes)
        {
            if (node.parent == -1)
                PushHeaders(node, "");
        }
        
        if (newHeaders.length != originalLength)
            console.log("!! SIZE MISMATCH IN ORGANIZING SCENE HEADERS: " + newHeaders.length + " does not match " + originalLength + " !!");
        
        return newHeaders;
    }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

module.exports = GHWTPakHandler;
