// - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S O N G   F S B   H A N D L E R
//		Handles fsb.xen files for songs
//
//		TODO: Move this to main FSB handler, maybe
//
// - - - - - - - - - - - - - - - - - - - - - - - - - 

const path = require('path');
const fs = require('fs');
const os = require('os');

const {fork} = require('child_process');

// FSB files we should write
const FSBClasses = [

	// song_1.fsb
	{
		name: 'SONGNAME_1',
		trackname: 'SONGNAME_drumcymbal',
		tracks: ['drums_1', 'drums_2', 'drums_3', 'drums_4']
	},
	
	// song_2.fsb
	{
		name: 'SONGNAME_2',
		trackname: 'SONGNAME_rhythm',
		tracks: ['guitar', 'rhythm', 'vocals']
	},
	
	// song_3.fsb
	{
		name: 'SONGNAME_3',
		trackname: 'SONGNAME_crowd',
		tracks: ['song', 'crowd']
	},
	
	// song_preview.fsb
	{
		name: 'SONGNAME_preview',
		trackname: 'SONGNAME_preview',
		tracks: ['preview']
	}
	
];

const TempDir = path.join(__dirname, 'tmp');

const FSB_NAMESTART = 50;
const FSB_NAMELENGTH = 30;
const FSB_DEBUG = false;

const CMD_DEBUG = false;

const DM_SINGLE = 0;
const DM_GH = 1;
const DM_RB = 2;

class FSBHandler
{
	constructor(converter) { this.converter = converter; }
	
	//-----------------------
	// Cleanup temp dir
	//-----------------------
	
	CleanupTemp(make = false)
	{
		if (fs.existsSync(TempDir))
			fs.rmdirSync(TempDir, {recursive: true});
			
		if (make)
			fs.mkdirSync(TempDir, {recursive: true});
	}
	
	//-----------------------
	// Create FSB files from a directory
	//-----------------------
	
	CreateFSBs(inDir, outDir, checksum, trackmap, callback)
	{
		this.callback = callback;
		this.inDir = inDir;
		this.outDir = outDir;
		this.outFiles = [];
		this.fsbBase = checksum;
		
		this.trackmap = trackmap;
		
		this.currentClass = 0;
		
		this.CleanupTemp(true);
		
		// This can probably be cleaned up to not use callbacks
		this.ConvertFSB();
	}
	
	//-----------------------
	// Convert the current FSB class
	// NEW
	//-----------------------
	
	ConvertFSB()
	{
		var idx = this.currentClass;
		var meta = FSBClasses[idx];
		
		var fsbName = meta.name.replace("SONGNAME", this.fsbBase) + ".fsb";
		var trkName = meta.trackname.replace("SONGNAME", this.fsbBase);
		
		// Dir for our temporary files
		var mp3Dir = path.join(TempDir, (idx+1).toString());
		fs.mkdirSync(mp3Dir);
			
		// Generate data for each of the tracks
		var frames = [];
		
		// Since the FSB is technically a multi-channel
		// MP3, sample count is based on count of
		// a single channel (AKA a single track)
		
		var totalSamples = 0;
		
		cons.log("FSB Tracks: " + meta.tracks.join(", "));
		
		for (var t=0; t<meta.tracks.length; t++)
		{
			var trkFile = '';
			
			if (this.trackmap[ meta.tracks[t] ] == 'silent')
				trkFile = 'silent_out.mp3';
			else
				trkFile = meta.tracks[t] + '_out.mp3';
						
			var inPath = path.join(this.inDir, trkFile);
			
			// Split MP3 file into frames
			var mp3Data = this.converter.MP3Analyzer.SplitMP3File(inPath);
			
			totalSamples = totalSamples || mp3Data[1];

			// Create frame block
			frames.push(mp3Data[0]);
		}
		
		cons.debug("FSB frames: " + frames.length, 'fsb');
		cons.debug("FSB samples: " + totalSamples, 'fsb');
		
		// Final name we'll use in the FSB
		var finalName = trkName + ".wav";
		this.fsb_out = path.join(TempDir, fsbName) + ".xen";
		
		// --------------------------------------------
		
		// Generate the main FSB
		var w = new GHSDK.Constants.Writer();
		w.LE = true;
		
		// First, create our interleaved FSB
		var interleave = [];
		var trackCount = meta.tracks.length;
		var curFrame = 0;
		
		// All MP3 files SHOULD contain the same amount of frames
		var frameGoal = frames[0].length;
		
		cons.debug("Using " + frameGoal + " frames per track", 'fsb');
		
		while (curFrame < frameGoal)
		{
			for (var t=0; t<trackCount; t++)
				interleave.push(frames[t][curFrame] || Buffer.alloc(frames[0][0].length));

			curFrame ++;
		}
		
		interleave = Buffer.concat(interleave);
		
		cons.log("Interleaved audio track is " + interleave.length + " bytes!");
		
		// Now write FSB data

		w.ASCIIString("FSB4");
		w.UInt32(1);					// File count
		w.UInt32(80);					// Directory length (filecount * 80)
		w.UInt32(interleave.length);	// Data length
		w.UInt32(262144);				// Extended version, constant?
		w.UInt32(0);					// Flags
		w.Pad(8);						// Null
		
		// Hash, doesn't seem to affect playback
		for (var f=0; f<4; f++)
			w.UInt32(0xCEFABEBA);
		
		// We only have one file
		w.UInt16(80);					// File entry length
		
		if (finalName.length > 30)
		{
			cons.error(finalName + " is longer than 30 characters!");
			var spl = finalName.split(".");
			var begin = spl[0].slice(0, 25);
			finalName = begin + "." + spl[1];
			cons.warn("Shortened to " + finalName + ", may or may not cause issues");
		}
		
		w.ASCIIString(finalName);		// File name, constant 30 bytes
		w.Pad(30 - finalName.length);
		
		w.UInt32(totalSamples);				// Sample count
		w.UInt32(interleave.length);		// Compressed size
		w.UInt32(0);						// Loop start
		w.UInt32(totalSamples - 878);		// Loop end, check if this is always the same sub
		w.UInt32(67109376);					// Mode... what is this?
		w.UInt32(48000);					// Sample rate, don't even bother checking for now
		w.UInt16(255);						// Volume
		w.UInt16(128);						// Pan
		w.UInt16(128);						// Priority
		w.UInt16(meta.tracks.length * 2);	// Channels (2 per track, stereo)
		w.Float(1.0);						// Min Distance
		w.Float(10000.0);					// Max Distance
		w.UInt32(0);						// Variable Frequency
		w.UInt16(0);						// Variable Volume
		w.UInt16(0);						// Variable Pan
		
		// --------------------------------------------
		
		var finalFSBData = Buffer.concat([w.buffer, interleave]);
		
		if (FSB_DEBUG)
			fs.writeFileSync(path.join(__dirname, fsbName), finalFSBData);
			
		// -- SHOULD WE ENCRYPT OUR FSB FILE? --------------------------
		
		if (GHSDK.Config.SC_EncryptFSB)
		{
			cons.log("  Starting encrypting process, be patient...");
			
			// Generate encryption key for it to use
			var encryptor = path.basename(this.fsb_out).split(".")[0];
			
			cons.log("  Using encryption key: " + encryptor);
			
			var byteEncryptor = this.GenerateFSBKey(encryptor);
			
			// How many workers should we use?
			this.processors = this.DecideWorkerCount();
			
			cons.log("    Using " + this.processors + " workers based on CPU...");
			
			// Split FSB data into chunks
			var sliceAmt = Math.floor(finalFSBData.length / this.processors);
			var finished_files = [];

			var encryptionOffset = 0;

			for (var w=0; w<this.processors; w++)
			{
				// This worker has not finished yet
				finished_files.push(false);
				
				var startOffset = (sliceAmt * w);
				var endOffset = startOffset + sliceAmt;
				
				if (w == this.processors-1)
					endOffset = finalFSBData.length;
					
				// Chunk we'd like to encrypt
				var workingChunk = finalFSBData.slice(startOffset, endOffset);
					
				// Write it
				var chunkPath = path.join(TempDir, 'chunk_' + w);
				fs.writeFileSync(chunkPath, workingChunk);
				
				var worker = fork(path.join(__dirname, 'FSBEncryptor.js'));
				worker.send({id: w, offset: encryptionOffset, key: byteEncryptor});
				
				encryptionOffset += workingChunk.length;
				
				worker.on('exit', (code, signal) => {
					if (code < 200)
					{
						console.log("WORKER ERRORED");
						return;
					}
					
					var workerID = code - 200;
					finished_files[workerID] = true;
					
					// All workers completed?
					var finished = 0;
					for (const ff in finished_files)
					{
						if (finished_files[ff])
							finished ++;
					}
					
					if (finished >= finished_files.length)
						this.CombineFSBChunks();
				});
			}
		}
		
		// -- NO ENCRYPTION --------------------------
		
		else
		{
			cons.log("  Leaving FSB unencrypted, fast!");
			
			fs.writeFileSync(this.fsb_out, finalFSBData);
			this.outFiles.push(this.fsb_out);

			this.FSBConverted();
		}
	}
	
	//-----------------------
	// Combine all encrypted FSB chunks
	//-----------------------
	
	CombineFSBChunks()
	{
		var chunks = [];
		var chunkCount = this.processors;
		
		for (var c=0; c<chunkCount; c++)
		{
			var chunkFile = path.join(TempDir, 'chunk_' + c + '_encrypted');
			if (!fs.existsSync(chunkFile))
			{
				cons.error("ENCRYPTED CHUNK " + c + " WAS MISSING!");
				this.FSBErrored();
				return;
			}
			
			chunks.push(fs.readFileSync(chunkFile));
		}
		
		var finalFSB = Buffer.concat(chunks);
		fs.writeFileSync(this.fsb_out, finalFSB);
		
		this.outFiles.push(this.fsb_out);
		
		cons.log("Encrypted FSB combined and written!");

		this.FSBConverted();
	}
	
	//-----------------------
	// File successfully converted!
	//-----------------------
	
	FSBConverted()
	{
		this.currentClass ++;
		if (this.currentClass >= FSBClasses.length)
		{
			this.FSBConversionFinished();
			return;
		}
		
		this.ConvertFSB();
	}
	
	//-----------------------
	// Something happened during conversion
	//-----------------------
	
	FSBErrored()
	{
		this.CleanupTemp();
		
		if (this.callback)
			this.callback({errors: ["FSB generation failed."]});
	}
	
	//-----------------------
	// ALL files are converted!
	//-----------------------
	
	FSBConversionFinished()
	{
		var retFiles = [];
		
		cons.log("Copying files...");
		
		if (!fs.existsSync(this.outDir))
			fs.mkdirSync(this.outDir, {recursive: true});
		
		for (const file of this.outFiles)
		{
			var oPath = path.join(this.outDir, path.basename(file));
			fs.copyFileSync(file, oPath);
			
			retFiles.push(oPath);
		}
			
		this.CleanupTemp();
		
		cons.log("");
		cons.log("At long last, all done!", 'lime');
		
		// Calculate time
		var startTime = this.converter.audioStartTime.getTime();
		var endTime = new Date().getTime();
		
		var diff = endTime - startTime;
		var seconds = Math.floor(diff / 1000 % 60);
		
		var mins = Math.floor(seconds / 60);
		var secs = seconds - (60 * mins);
		
		cons.log("Total FSB generation finished in " + mins.toString().padStart(2, "0") + ":" + secs.toString().padStart(2, "0"), 'lime');
		
		if (this.callback)
			this.callback({files: retFiles});
	}
	
	//-----------------------
	// Generate an FSB key from name
	//-----------------------
	
	GenerateFSBKey(str)
	{
		var ch;
		var crc = new Uint32Array(1);
		var xor = new Uint32Array(1);
		xor[0] = 0xFFFFFFFF;
		
		var encstr = "";
		
		const cycle = 32;
		
		for (var i = 0; i < cycle; i++)
		{
			ch = str[i % str.length];			
			crc[0] = Checksums.Make(ch);
			xor[0] = crc[0] ^ xor[0];
			
			//~ var index = (int)(xor % str.length);
			var index = xor[0] % str.length;
			encstr += str[index];
		}
		
		var key = [];
		
		for (var i = 0; i < cycle - 1; i++)
		{
			ch = encstr[i];
			crc[0] = Checksums.Make(ch);
			xor[0] = crc[0] ^ xor[0];
			
			var c = i & 0x03; // 11b
			xor[0] = xor[0] >> c;
			
			var ander = 0;
			for (var k=0; k<32-c; k++)
				ander += (1 << k);
			xor[0] = xor[0] & ander;
			
			// End of string?
			var checkByte = new Uint8Array(1);
			checkByte[0] = xor[0];
			
			if (checkByte[0] == 0)
				break;

			key.push(checkByte[0]);
		}
		
		return key;
	}
	
	//-----------------------
	// How many workers can we use?
	//-----------------------
	
	DecideWorkerCount()
	{
		return Math.max(1, os.cpus().length - 4);
	}
	
}

module.exports = FSBHandler;
