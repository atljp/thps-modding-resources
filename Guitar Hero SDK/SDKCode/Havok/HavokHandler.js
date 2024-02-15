// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	H A V O K   H A N D L E R
//		Handles Havok-based files
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

class HavokHandler
{
	constructor()
	{
		global.Havok = this;
		
		// Read in Havok classes
		
		this.classes = {};
		
		// Pull in stock hkClass first
		// All other classes require its existence!
		
		this.classes['hkClass'] = require(path.join(__dirname, 'hkClass.js'));
		
		var files = fs.readdirSync(__dirname);
		for (const file of files)
		{
			var fn = file.split(".")[0];
			if (fn.indexOf("hk") == 0 && !this.classes[fn])
			{
				var fPath = path.join(__dirname, file);
				this.classes[fn] = require(fPath);
			}
		}
		
		this.Reset();
	}
	
	//----------------------------------
	// Reset properties
	//----------------------------------
	
	Reset()
	{
		// List of hashes we've used
		// (This prevents duplicates)
		
		this.hashedKeys = {};
		
		// Warning / error messages
		
		this.warnings = [];
		this.errors = [];
	}
	
	//----------------------------------
	// Warn / Error
	//----------------------------------
	
	Warn(txt, critical = false)
	{
		if (critical)
			this.errors.push(txt);
		else
			this.warnings.push(txt);
	}
	
	//----------------------------------
	// Errored out
	//----------------------------------
	
	Errored() { return (this.warnings.length > 0 || this.errors.length > 0); }
	
	//----------------------------------
	// Generate a fake hash
	// (Ensures each hash is unique)
	//----------------------------------
	
	GenerateHash()
	{
		var vals = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
		function MakeHash()
		{
			var str = "";
			var hashLength = 10 + Math.floor(Math.random() * 8);
			for (var h=0; h<hashLength; h++)
				str += vals[Math.floor(Math.random() * vals.length)];
				
			return str;
		}
		
		var hash = MakeHash();
		
		if (this.hashedKeys[hash])
		{
			while (this.hashedKeys[hash]) { hash = MakeHash(); }
		}
		
		this.hashedKeys[hash] = true;
		return hash;
	}
	
	//----------------------------------
	// Create an object
	//----------------------------------
	
	CreateObject(id, opt = {})
	{
		if (!this.classes[id])
		{
			this.Warn("Havok class " + id + " does not exist!", true);
			return;
		}
			
		var obj = new this.classes[id](opt);
		return obj;
	}
	
	//----------------------------------
	// Deserialize a .rag file
	//----------------------------------
	
	DeserializeRagdoll(fPath, opt = {})
	{
		this.Reset();
		
		// Create a reader for the file
		this.reader = new GHSDK.Constants.Reader( fs.readFileSync(fPath) );
		this.currentFile = this.CreateObject('hkRagdollFile');
		
		this.currentFile.Deserialize();
	}
}

module.exports = HavokHandler;
