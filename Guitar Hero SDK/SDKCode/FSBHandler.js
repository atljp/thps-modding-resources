// - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	F S B   H A N D L E R
//		Handles fsb.xen files
//
// - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

var stockFSBHash = Buffer.from([0xA0, 0xFF, 0xB1, 0x77, 0x4B, 0x52, 0x76, 0xCA, 0x5C, 0x23, 0x35, 0x07, 0x3C, 0x6E, 0x6B, 0x87]);

//-----------------------------------

class FSBHeader
{
	constructor()
	{
		this.unkThing = 0;
		this.flags = 0;
		this.hash = stockFSBHash;
		this.sounds = [];
		this.dirSize = 0;
		this.dataSize = 0;
		this.version = 4;
	}
	
	AddSound(snd) { this.sounds.push(snd); }
	
	Deserialize(r)
	{
		this.fileCount = r.UInt32();
		
		this.dirSize = r.UInt32();				// Directory length
		this.dataSize = r.UInt32();				// Data length
		
		this.unkThing = r.UInt16();
		r.UInt16();								// Version but we got it from magic
		
		this.flags = r.UInt32();
		
		if (this.version == 4)
		{
			r.UInt32();
			r.UInt32();
		
			this.hash = r.Chunk(16);
		}
	}
	
	Serialize(w)
	{
		// Serialize the magic as well
		
		w.UInt8(0x46);
		w.UInt8(0x53);
		w.UInt8(0x42);
		
		// FSB4
		if (this.version == 4)
			w.UInt8(0x34);
			
		// FSB3
		else
			w.UInt8(0x33);
		
		w.UInt32(this.sounds.length);			// File count
		w.UInt32(80 * this.sounds.length);		// Directory size
		
		var datSize = 0;
		for (const snd of this.sounds) { datSize += snd.data.length; }
		w.UInt32(datSize);						// Data size
		
		w.UInt16((this.version == 4) ? 0 : 1);
		w.UInt16(this.version);
		
		w.UInt32(this.flags);					// Flags
		
		// FSB4 has padding and hash
		if (this.version == 4)
		{
			w.Pad(8);
			w.Combine(this.hash);					// Hash buffer
		}
		
		// Serialize our files!
		var datas = [];
		for (const snd of this.sounds) 
		{ 
			snd.Serialize(w); 
			datas.push(snd.data);
		}
		
		// Slap all data onto the end of it
		w.Combine(Buffer.concat(datas));
	}
}

//-----------------------------------

class FSBSound
{
	constructor()
	{
		this.name = "";
		this.data = null;
		this.dataSize = 0;
		this.samples = 0;
		this.loopStart = 0;
		this.loopEnd = 0;
		this.mode = 544;
		this.sampleRate = 48000;
		this.volume = 255;
		this.pan = 128;
		this.priority = 128;
		this.channels = 2;
		this.minDistance = 1;
		this.maxDistance = 10000;
		this.varFrequency = 0;
		this.varVolume = 0;
		this.varPan = 0;
	}
	
	Deserialize(r, header)
	{
		r.UInt16();				// Entry length, always the same
		this.name = r.Chunk(30).toString();
		this.samples = r.UInt32();
		this.dataSize = r.UInt32();
		this.loopStart = r.UInt32();
		this.loopEnd = r.UInt32();
		this.mode = r.UInt32();
		this.sampleRate = r.UInt32();
		this.volume = r.UInt16();
		this.pan = r.UInt16();
		this.priority = r.UInt16();
		this.channels = r.UInt16();
		this.minDistance = r.Float();
		this.maxDistance = r.Float();
		this.varFrequency = r.UInt32();
		this.varVolume = r.UInt16();
		this.varPan = r.UInt16();
        
        // Used in GH5, surround sound? Not sure
        if (header.flags & 0x20)
        {
            this.unkA = r.UInt32();
            this.unkB = r.UInt32();
            this.unkC = r.UInt32();
            this.unkD = r.UInt32();
        }
	}
	
	Serialize(w)
	{
		w.UInt16(80);							// Entry length, always the same
		
		var nameStr = this.name.slice(0, 30);
		w.ASCIIString(nameStr);					// Filename
		w.Pad(30 - nameStr.length);
		
		w.UInt32(this.samples);					// Sample count
		w.UInt32(this.data.length);				// Data length
		w.UInt32(this.loopStart);				// Loop start
		w.UInt32(this.loopEnd);					// Loop end
		w.UInt32(this.mode);					// Mods
		w.UInt32(this.sampleRate);				// Sample rate
		w.UInt16(this.volume);					// Volume
		w.UInt16(this.pan);						// Pan
		w.UInt16(this.priority);				// Priority
		w.UInt16(this.channels);				// Channels
		w.Float(this.minDistance);				// Min distance
		w.Float(this.maxDistance);				// Max distance
		w.UInt32(this.varFrequency);			// Var. frequency
		w.UInt16(this.varVolume);				// Var. volume
		w.UInt16(this.varPan);					// Var. pan
	}
	
	ReadData(r, offset = -1)
	{
		var oldOff = r.Tell();
		var destPos = (offset == -1) ? r.Tell() : offset;
		r.Seek(destPos);
		this.data = r.Chunk(this.dataSize);
		
		r.Seek(oldOff);
	}
}

//-----------------------------------

class FSBHandler
{
	constructor()
	{
		const MP3AnalyzerClass = require('./Converter/MP3Analyzer.js');
		this.MP3Analyzer = new MP3AnalyzerClass();
	}
	
	//--------------------------------------------
	// Parse FSB headers from an FSB file
	//--------------------------------------------
	
	Parse(r)
	{
		var headers = [];
		
		return headers;
	}
	
	//--------------------------------------------
	// Extract a .fsb file
	//--------------------------------------------
	
	Extract(inFile, outFolder)
	{
		var data = fs.readFileSync(inFile);
		var r = new GHSDK.Constants.Reader(data);
		r.LE = true;
		
		var magic = r.Chunk(4).toString();
		if (magic !== 'FSB4' && magic !== 'FSB3')
		{
			cons.error("FSB4 magic not found, is it encrypted?");
			return false;
		}
		
		// Main file header
		var fileHeader = new FSBHeader();
		
		if (magic == 'FSB3')
			fileHeader.version = 3;
		
		fileHeader.Deserialize(r);
		
		// The files
		var dataOffset = r.Tell() + fileHeader.dirSize;
		
		for (var f=0; f<fileHeader.fileCount; f++)
		{
			var snd = new FSBSound();
			snd.Deserialize(r, fileHeader);
			snd.ReadData(r, dataOffset);

			fileHeader.AddSound(snd);
			
			dataOffset += snd.dataSize;
		}
		
		var toExport = [];
		
		// Is it an interleaved file?
		// Generally this is the case if the FSB has > 2 channels
		
		if (fileHeader.sounds[0].channels > 2 && ((fileHeader.flags & 0x20) == 0))
		{
			var snd = fileHeader.sounds[0];
			var stemCount = Math.floor(snd.channels / 2);
			cons.log("  Audio is interleaved, has " + stemCount + " " + ((stemCount == 1) ? "stem" : "stems") + "!", "grey");
			
			if (stemCount > 32)
			{
				cons.error("    That's probably not right.");
				console.log(fileHeader.sounds[0]);
				return false;
			}
			
			var res = this.MP3Analyzer.SplitMP3File(snd.data, true);
			var frameList = res[0];
			
			// Parse interleaved frames in sequential order
			// Ex. 4 stems would be ABCD, ABCD, ABCD, ABCD
			
			var idx = 0;
			var stems = [];
			
			for (var s=0; s<stemCount; s++) { stems.push([]); }
			
			// Now parse the frames
			var sIdx = 0;
			
			for (const frame of frameList)
			{
				stems[sIdx].push(frame);
				
				sIdx ++;
				if (sIdx >= stemCount)
					sIdx = 0;
			}
			
			// Create proper files
			var baseName = snd.name.split(".")[0];
			
			for (var s=0; s<stems.length; s++)
			{
				var finalStem = Buffer.concat(stems[s]);
				toExport.push([baseName + "_" + s.toString() + ".mp3", finalStem]);
			}
		}
		
		// Single stem files
		else
		{
			for (const snd of fileHeader.sounds) { toExport.push([snd.name, snd.data]); }
		}
		
		// Now let's extract the files to the directory
		for (const exp of toExport)
		{
			var shorthand = exp[0].split(".")[0];
			var outFile = path.join(outFolder, shorthand + ".mp3");
			
			cons.log("  Exporting " + exp[0] + "...", 'grey');
			fs.writeFileSync(outFile, exp[1]);
		}
		
		return true;
	}
	
	//--------------------------------------------
	// Compile a .fsb file from a folder
	//--------------------------------------------
	
	Compile(inFolder, outFile, options = {})
	{
		// Read files from folder
		var files = fs.readdirSync(inFolder);
		var toAdd = [];
		
		for (const file of files)
		{
			// Lazily check for MP3 extension
			if (file.toLowerCase().indexOf(".mp3") == -1)
			{
				cons.error(file + " is not a MP3.");
				return false;
			}
			
			var fPath = path.join(inFolder, file);
			toAdd.push(fPath);
		}
		
		// Create our main FSB file
		var fileHeader = new FSBHeader();
		
		// Now that we have the files we want to add, let's get info about them!
		var pendingSounds = [];
		for (const mp3Path of toAdd)
		{
			var snd = new FSBSound();
			
			// Analyze the MP3's metadata
			// (Get sample count, etc.)
			
			var res = this.MP3Analyzer.SplitMP3File(mp3Path);
			
			var frameList = res[0];
			var sampleCount = res[1];
			var sampleRate = res[2];
			var isStereo = res[3];
			
			snd.name = path.basename(mp3Path);
			snd.samples = sampleCount;
			snd.sampleRate = sampleRate;
			snd.loopEnd = sampleCount - 4;
			snd.channels = isStereo ? 2 : 1;
			
			// Combine the frames into a single file
			var mainFile = Buffer.concat(frameList);
			snd.dataSize = mainFile.length;
			snd.data = mainFile;
			
			cons.log("  Adding " + snd.name + "...", "grey");
			cons.log("    Sample Rate: " + snd.sampleRate, "grey");
			cons.log("    Channels: " + snd.channels, "grey");
			cons.log("    Samples: " + snd.samples, "grey");

			pendingSounds.push(snd);
		}
		
		// Not interleaved, add each sound individually
		for (const ps of pendingSounds) { fileHeader.AddSound(ps); }
		
		// ----------
		// Now serialize it into a buffer
		// ----------
		
		// What version should we use?
		var versionToUse = (options && options.version) || 4;
		fileHeader.version = versionToUse;
		
		var w = new GHSDK.Constants.Writer();
		w.LE = true;
		fileHeader.Serialize(w);
		fs.writeFileSync(outFile, w.buffer);
		
		// ----------
		// Write a .dat file?
		// ----------
		
		var writeDat = (options && options.dat) || false;
		
		if (writeDat)
		{
			cons.log("  Creating .dat file...", "grey");
			
			var spl = path.basename(outFile).split(".")[0];
			var dir = path.dirname(outFile);
			var datPath = path.join(dir, spl + ".dat.xen");
			
			// Create buffer for .dat
			var w = new GHSDK.Constants.Writer();
			w.UInt32(pendingSounds.length);					// File count
			
			// Honestly not sure what this is... let's make it QBKey of file for now
			// (This could be a unique identifier, better safe than sorry)
			
			w.UInt32( Checksums.Make(spl) );
			
			for (var i=0; i<pendingSounds.length; i++)
			{
				var snd = pendingSounds[i];
				
				// Generate checksum from the filename
				var shorthand = snd.name.split(".")[0];
				cons.log("    Adding to .dat: " + shorthand, "grey");
				
				var qbk = Checksums.Make(shorthand);
				w.UInt32(qbk);								// File checksum
				w.UInt32(i);								// Index in the FSB
				w.Pad(12);
			}
			
			fs.writeFileSync(datPath, w.buffer);
		}
		
		return true;
	}
}

module.exports = FSBHandler;
