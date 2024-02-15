// - - - - - - - - - - - - - - - - - - - - - - - - - -
//
//	CHECKSUM WATCHER
//		Used for detecting modified files in a directory
//
//		(Fun fact: This uses modified dates and not checksums)
//
// - - - - - - - - - - - - - - - - - - - - - - - - - -

const fs = require('fs');
const path = require('path');

class ChecksumWatcher
{
	constructor(hashFile, directory)
	{
		this.hashPath = hashFile;
		this.directory = directory;
		this.hashes = {};
		this.pendingHashes = {};
		this.dirtyFiles = [];
		
		// Read hashes from the JSON if they exist
		if (fs.existsSync(hashFile))
			this.ReadFromFile();
	}
	
	//--------------------------------------
	// READ OUR HASHES FROM OUR JSON FILE
	//--------------------------------------
	
	ReadFromFile()
	{
		if (!fs.existsSync(this.hashPath))
			return;

		// Fresh require every time
		delete require.cache[require.resolve(this.hashPath)];
		this.hashes = require(this.hashPath);
	}
	
	//--------------------------------------
	// UPDATE HASHES FROM OUR DIRECTORY
	// This will set whether we're dirty or not
	//--------------------------------------
	
	GetDirtyFiles(options = {})
	{
		var dirtied = {};
		this.dirtyFiles = [];
		
		var files = GHSDK.ScanFolder(this.directory);
		
		var newHashes = {};
		
		for (const file of files)
		{
			var wasDirty = false;
			var rel = path.relative(this.directory, file);
			
			// Only search for files that include specific things
			if (options.included)
			{
				var excluded = false;
				
				for (const includer of options.included)
				{
					if (file.toLowerCase().indexOf(includer.toLowerCase()) < 0)
						excluded = true;
				}
				
				if (excluded)
					continue;
			}
			
			// Avoid filter terms if they exist
			if (options.excluded)
			{
				var excluded = false;
				
				for (const excluder of options.excluded)
				{
					if (file.toLowerCase().indexOf(excluder.toLowerCase()) >= 0)
						excluded = true;
				}
				
				if (excluded)
					continue;
			}
			
			// This file doesn't exist AT ALL in our old hashes
			// (It's new!)
			
			if (!this.hashes[rel])
				wasDirty = true;
				
			var modDate = new Date(fs.statSync(file).mtime);
			
			// It exists, but it was modified more recently!
			if (this.hashes[rel])
			{
				var oldDate = new Date(this.hashes[rel]);
				if (modDate > oldDate)
					wasDirty = true;
			}
			
			newHashes[rel] = modDate;
			
			if (wasDirty)
			{
				this.dirtyFiles.push(file);
				dirtied[rel] = true;
			}
		}
		
		// Loop through old hashes and find files that NO LONGER EXIST
		if (!options.skipMissing)
		{
			var keys = Object.keys(this.hashes)
			for (const key of keys)
			{
				if (!newHashes[key] && !dirtied[key])
				{
					this.dirtyFiles.push(path.join(this.directory, key));
					break;
				}
			}
		}
		
		// No hashes at all? Queue a deletion of all hashes
		// (Normally, empty hash table is skipped)
		
		if (Object.keys(newHashes).length <= 0)
			newHashes = {'DELETE_ALL': true};
		
		this.pendingHashes = newHashes;
		
		if (options && options.saveAfter)
			this.Save();
		
		return this.dirtyFiles;
	}
	
	//--------------------------------------
	// Save our hashes locally!
	//--------------------------------------
	
	Save()
	{
		// Has pending hashes, use those instead
		if (Object.keys(this.pendingHashes).length > 0)
		{
			if (this.pendingHashes['DELETE_ALL'])
				this.hashes = {};
			else
				this.hashes = this.pendingHashes;
			this.pendingHashes = {};
		}
			
		var fold = path.dirname(this.hashPath);
		if (!fs.existsSync(fold))
			fs.mkdirSync(fold, {recursive: true});
			
		fs.writeFileSync(this.hashPath, JSON.stringify(this.hashes));
	}
}

module.exports = ChecksumWatcher;
