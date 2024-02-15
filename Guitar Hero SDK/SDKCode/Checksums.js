// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// GHWT checksums
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

const QBKey = require('./QBKey.js');

class ChecksumDatabase
{
	constructor(files)
	{
		this.keys = {};
		
		for (const file of files)
		{
			// Ends in .dat?
			if (file.toLowerCase().indexOf(".dat") >= 0)
				this.ReadDatFile(file);
				
			// Ends in .txt, legacy
			else
				this.ReadKeyFile(file);
		}
        
        // Key cache. Every key that we generate will be stored here.
        // This is mostly for storing keys in compiled files.
        
        this.allowKeyCaching = false;
        this.ClearKeyCache();
	}
    
    //---------------------------
    // Adds a key.
    //---------------------------
    
    AddKey(key, text)
    {
        this.keys[key] = text;
    }
    
    //---------------------------
    // Get key cache.
    //---------------------------
    
    GetKeyCache() { return this.keyCache; }
    
    //---------------------------
    // Enable or disable key cache.
    //---------------------------
    
    EnableKeyCache(allowed) { this.allowKeyCaching = allowed; }
    
    //---------------------------
    // Clear key cache.
    //---------------------------
    
    ClearKeyCache() { this.keyCache = {}; }
	
    //---------------------------
    // Cache a QBKey to key cache.
    //---------------------------
    
    CacheKey(crc, str)
    {
        this.keyCache[this.ToString(crc)] = str;
    }
    
    //---------------------------
	// Number to hex
    //---------------------------
    
	HexString(num)
	{
		return "0x" + num.toString(16).padStart(8, "0");
	}
	
    //---------------------------
    // Read a binary .dat file.
    //---------------------------
    
	ReadDatFile(inFile)
	{
		var r = new GHSDK.Constants.Reader( fs.readFileSync(inFile) );
		
		var numKeys = r.UInt32();
		for (var k=0; k<numKeys; k++)
		{
			var keyID = r.UInt32();
			var strLen = r.UInt32();

			keyID = "0x" + keyID.toString(16).padStart(8, "0");
			this.keys[keyID] = r.Chunk(strLen).toString();
		}
		
		//~ var dat = fs.readFileSync(inFile).toString().split("\n");

		//~ for (var line of dat)
		//~ {
			//~ var spl = line.trim().split(" ");
			//~ var keyID = spl.shift();
			//~ this.keys[keyID] = spl.join(" ");
		//~ }
	}
	
    //---------------------------
    // Read a .txt file.
    //---------------------------
    
	ReadKeyFile(inFile)
	{
		var dat = fs.readFileSync(inFile).toString().split("\n");

		for (var line of dat)
		{
			var spl = line.trim().split(" ");
			var keyID = spl.shift();
			this.keys[keyID] = spl.join(" ");
		}
	}
	
    //---------------------------
    // QBKey -> String
    //---------------------------
    
	Lookup(qbkey)
	{
		//~ // It's not even hex!
		//~ if (typeof(qbkey) == 'string' && qbkey.indexOf("0x") == -1)
		//~ {
			//~ qbkey = qbkey.trim();
			
			//~ // Is it a valid hex?
			//~ var nonHex = qbkey.match(/[^a-fA-F0-9]/g);
			//~ if (!nonHex)
				//~ return qbkey;
		//~ }
		
		// It's a number
		if (typeof(qbkey) == 'number')
			qbkey = qbkey.toString(16).padStart(8, "0");
			
		// Add 0x at the beginning
		var hexKey = qbkey;
		
		if (hexKey.indexOf("0x") !== 0)
			hexKey = "0x" + hexKey;
              
		var lookedUp = this.keys[hexKey];
        
		if (lookedUp)
		{
			var fixed = this.FixFullPath(lookedUp);
			return fixed;
		}
			
		// If it fails to parse as hex, it's probably a string!
		var asHex = parseInt(qbkey);
		if (isNaN(asHex))
			return qbkey;
			
		// Otherwise, it's a hex value!
		if (qbkey.indexOf("0x") == 0)
			return qbkey;
			
		return "0x" + qbkey;
	}
	
    //---------------------------
    // Shorthand path? Shorthand only
    //---------------------------
    
	IsShorthandPath(filePath, opt = {})
	{
		var tlc = filePath.toLowerCase();
        
        // Replace slashes with proper slash, we can check against folders.
        tlc = tlc.replace(/\//g, '\\');
		
		var typePairs = [
			[".img", ["tex\\"]],
			[".pimg", ["tex\\"]],
			[".ska"],
			[".rag"],
			[".fnt"],
			[".ske"],
			[".wav"],
			[".mp3"],
			[".fsb"]
		];
		
		var isShorthand = false;
		
		for (const pair of typePairs)
		{
            // These are full paths regardless. What?
			if (opt.skeletonPath && (pair[0] == ".ske" || pair[0] == ".rag"))
				continue;
				
			var dirIgnore = false;
			
			if (pair.length > 1)
			{
				for (const dir of pair[1])
				{
					if (tlc.indexOf(dir) >= 0)
						dirIgnore = true;
				}
			}
			
			if (tlc.indexOf(pair[0]) >= 0 && !dirIgnore)
				return true;
		}
		
		return false;
	}
	
    //---------------------------
    // Fixes full path, uh
    //---------------------------
    
	FixFullPath(fullName, opt = {})
	{
		var oldFullname = fullName;
		
		// Replace slashes
		fullName = fullName.replace(/\//g, path.sep);

		// Remove XEN from it!
		// TODO: Fix proper extension if multi platform
		fullName = fullName.replace(".xen", "");

		// Attempt to get a "reasonable" path from it
		// All items should be in the data directory!
		if (fullName.indexOf(":" + path.sep) >= 0)
		{
			var norm = path.normalize(fullName);
			var spl = norm.split(path.sep);
			
			while (spl.length > 0 && spl[0] !== 'data') { spl.shift(); }
			
			// Pop final data
			spl.shift();
			
			fullName = spl.join("\\");
		}
		
		// Img files are apparently indexed by their name ONLY!
		// This seems pretty greasy, but let's try it until something comes up
		
		// Shorthand, we want JUST THE FILE
		// No extension, no directory!
		
		if (this.IsShorthandPath(fullName, opt))
		{
			var spl = path.basename(fullName.replace(/\\/g, path.sep)).split(".");
			return spl[0];
		}
		
		return fullName;
	}
	
    //---------------------------
	// Returns QBkey as a number!
    //---------------------------
    
	Make(txt, reversed = false)
	{
		if (!txt)
		{
			if (global.GHSDK)
				cons.error("Could not make QBKey, undefined value!");
			else
				console.log("Could not make QBKey, undefined value!");
				
			console.trace("Called from:");
				
			return null;
		}
			
		// Number
		if (typeof(txt) == 'number')
			return txt;
			
		// Fix up slashes, make them proper
		if (typeof(txt) == 'string')
		{
			txt = txt.replace(/\//g, "\\");
			
			// Match for letters that are not hex characters
			var nonHex = txt.match(/[^a-fA-F0-9]/g);
			if (txt.length == 8 && !nonHex)
				txt = "0x" + txt;
		}

		var result = QBKey(txt, reversed);
        
        if (this.allowKeyCaching)
        {
            var toCache = result;
            
            if (reversed)
            {
                var buf = Buffer.alloc(4);
                buf.writeUInt32LE(result, 0);
                toCache = buf.readUInt32BE(0);
            }
            
            this.CacheKey(toCache, txt);
        }
        
        return result;
	}
	
    //---------------------------
	// Returns numerical key as string
    //---------------------------
    
	ToString(key, useZero = true)
	{
		// If string, return the string itself
		if (typeof(key) == 'string')
			return key;
			
		// If number, return raw key
		return (useZero ? "0x" : "") + key.toString(16).padStart(8, "0");
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
    //---------------------------
	// Make a proper .pak fullName from a path
    //---------------------------
    
	MakePakFullname(pth)
	{
		return this.FixFullPath(pth, {skeletonPath: true});
	}
}

var sumList = [
	path.join(__dirname, 'Checksums', 'KeyDatabase.dat'),
]

if (GHSDK.options.noChecksums)
	sumList = [];

module.exports = new ChecksumDatabase(GHSDK.options.checksumFiles || sumList);
