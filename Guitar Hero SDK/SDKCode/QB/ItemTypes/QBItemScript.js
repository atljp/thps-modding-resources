// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// A script!
// This is an actual functional QB script, what a doozy
//
// ItemId, FileId, PointerToUnknown, Reserved, Unknown, UncompressedSize, CompressedSize
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBScript extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.id = opt.id || this.id || "00000000";
		this.fileId = opt.fileId || "00000000";
		this.pointer = opt.pointer || 0;
		this.reserved = opt.reserved || 0;
		
		// This doesn't seem to have any sort of effect at all!
		// But... what is it?
		
		this.unknown = opt.unknown || "0xbabeface";
		
		this.data = opt.data || Buffer.from('0124', 'hex');
		
		if (this.typeName == 'StructItemScript')
			this.qbType = ItemTypes.QBTypes.STRUCT;
		
		// Compressed / Uncompressed sizes
		this.compressedSize = 0;
		this.uncompressedSize = 0;
			
		// If reading from a file...
		if (this.reader)
		{
			if (this.typeName == 'StructItemScript')
				this.ReadHeader_Struct();
			else
				this.ReadHeader();
		}
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Read script header: Normal
	//-----------------------------------
	
	ReadHeader()
	{
		// Read the ID
		this.id = this.reader.UInt32().toString(16).padStart(8, "0");
		
		// Full filename
		this.fileId = this.reader.UInt32().toString(16).padStart(8, "0");
		
		// Pointer to our Unknown value
		this.pointer = this.reader.UInt32()
		
		// Reserved (pointer to next item in struct)
		this.reserved = this.reader.UInt32()
		
		// Unknown
		this.unknown = this.reader.UInt32();
		
		this.from_bytes = true;
		
		// Uncompressed size
		this.uncompressedSize = this.reader.UInt32();
		this.compressedSize = this.reader.UInt32();
		
		// The actual script!
		var sizeToUse = (this.compressedSize < this.uncompressedSize) ? this.compressedSize : this.uncompressedSize;
		
		this.data = this.reader.Chunk(sizeToUse);
		
		// Pad to nearest 4 bytes... I think?
		var extra = this.reader.Tell() % 4;
		if (extra)
			this.reader.Seek( this.reader.Tell() + (4 - extra) );
		
		this.Finalize();
	}
	
	//-----------------------------------
	// Read script header: Script
	//-----------------------------------
	
	ReadHeader_Struct()
	{
		// Skip back 2 bytes and read script size
		this.reader.Seek(this.reader.Tell() - 2);
		
		var scriptSize = this.reader.UInt16();
		
		// Read the ID
		this.id = this.reader.UInt32().toString(16).padStart(8, "0");
		
		// Pointer to script data
		this.pointer = this.reader.UInt32()
		
		// Reserved (pointer to next item in struct)
		this.reserved = this.reader.UInt32()
		
		// StructScript scripts are always uncompressed
		this.compressedSize = scriptSize;
		this.uncompressedSize = scriptSize;
		
		// The actual script!
		var sizeToUse = this.uncompressedSize;
		
		this.data = this.reader.Chunk(sizeToUse);
		
		// Pad to nearest 4 bytes... I think?
		var extra = this.reader.Tell() % 4;
		if (extra)
			this.reader.Seek( this.reader.Tell() + (4 - extra) );
		
		this.Finalize();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Overwrite data
	// Must be uncompressed!
	//-----------------------------------
	
	SetData(newData, compressed = false)
	{
		// Compress it if not already
		if (!compressed)
		{
			var com = GHSDK.Constants.LZSS.CompressBytes(newData).result;
			this.data = com;
			
			this.uncompressedSize = newData.length;
			this.compressedSize = com.length;
		}
		
		// It is compressed!
		else
		{
			var decom = GHSDK.Constants.LZSS.DecompressBytes(newData).result;
			this.data = newData;
			
			this.uncompressedSize = decom.length;
			this.compressedSize = newData.length;
		}
	}
	
	//-----------------------------------
	// Convert this item to text-readable format!
	//-----------------------------------
	
	// Override this ToText function, please
	ToText()
	{
		// Uncompress the script!
		var lzss_compressed = this.data;
		var lzss_decompressed = GHSDK.Constants.LZSS.DecompressBytes(this.data).result;
		
		// Use smallest file
		var uncom;
		
		// Starts with FF, DEFINITELY COMPRESSED
		if (lzss_compressed[0] == 0xFF)
			uncom = lzss_decompressed;
		// Same size, use data as-is
		else if (this.compressedSize == this.uncompressedSize)
			uncom = lzss_compressed;
		// Decompressed is longer
		else if (this.uncompressedSize > this.compressedSize)
			uncom = lzss_decompressed;
		else
			uncom = lzss_compressed;

		// Decompile it with NodeROQ
		var scriptString = uncom.toString("hex");
		var decompiled = false;
		
		if (global.NodeROQ && GHSDK.Constants.DECOMPILE_SECTIONSCRIPT)
		{
			var com = global.NodeROQ.Compile(uncom, {strip: true, decompile: true, header: false, tidy: true});

			if (com.result)
			{
				decompiled = true;
				var spl = com.result.trim().split("\n");
				
				scriptString = "";
				scriptString += this.Indent() + this.NewLine();
				
				var linez = [];
				for (const line of spl)
					linez.push(String.fromCharCode(9) + line);
					
				for (const line of linez)
				{
					scriptString += this.Indent() + line + this.NewLine();
				}
				
				scriptString += this.Indent();
			}
			else if (com.errors)
			{
				for (const error of com.errors)
					cons.error(error);
			}
		}
		
		var nl = decompiled ? String.fromCharCode(13) : "";
		
		if (this.typeName == 'StructItemScript')
			nl = "";
		
		var prefix = (this.typeName == 'StructItemScript') ? 'StructScript' : 'Script';
		var unkText = (this.typeName == 'StructItemScript') ? '' : (' ' + Checksums.Lookup(this.unknown));
		
		var txt = nl + prefix + " " + this.GetID() + unkText + " [" + scriptString + "]" + nl;
		return txt;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// The first [ we run into signals our code
		// When we hit it, our HandleBadCharater will search for the next
		
		if (ccd == 91)
			return true;
			
		return super.IsBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd) 
	{ 
		// Left square bracket, find the rest of our code!
		if (ccd == 91)
		{
			var brack = 1;
			var reading = true;
			var tempstr = "";
			
			while (this.textReader.CanRead() && reading)
			{
				var ltr = this.textReader.Letter();
				var ccd = ltr.charCodeAt(0);
				
				// Left bracket
				if (ccd == 91)
				{
					if (brack > 0)
						tempstr += ltr;
						
					brack ++;
					continue;
				}
					
				// Right bracket
				if (ccd == 93)
				{
					brack --;
					if (brack <= 0)
					{
						reading = false;
						break;
					}
					else
					{
						tempstr += ltr;
						continue;
					}
				}
				
				tempstr += ltr;
			}
			
			var scriptInfo = tempstr.trim();
			
			// Is it all one word? If so, it's raw byte data
			
			if (scriptInfo.indexOf(" ") == -1)
				this.data = Buffer.from(scriptInfo, 'hex');
			
			// It's an actual script otherwise! Decompile with NodeROQ if we can
			
			else
			{
				// Compile it with NodeROQ
				var outBytes = Buffer.alloc(4);
				var nROQ = global.NodeROQ;
				
				if (nROQ)
				{
					var res = nROQ.Compile(scriptInfo, {strip: true, sectionScript: true});
					
					if (res.errors || res.warnings)
					{
						var rdr = this.HighestParent();
						
						var pre = "[" + this.id + "] ";
						
						for (const error of res.errors)
							rdr.errors.push(pre + error);
						for (const warning of res.warnings)
							rdr.errors.push(pre + warning);
					}
					
					if (res.result)
						outBytes = res.result;
				}
				
				// Fallback
				else
					outBytes.writeUInt32LE(0xDEADBEEF, 0);
					
				this.data = outBytes;
			}

			this.Finalize();
			
			return true;
		}
		
		return super.HandleBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		if (!this.currentWord)
			this.currentWord = 0;
		
		switch (this.currentWord)
		{
			// The script ID
			case 0:
				this.id = word;
				break;
				
			// The unknown
			case 1:
				this.unknown = word;
				break;
		}
		
		this.currentWord ++;
		
		super.WordRead(r, word);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w)
	{
		if (this.typeName == 'StructItemScript')
		{
			this.ToBytes_Struct(w);
			return;
		}
		
		// Section identifier
		w.UInt32(this.ByteType());
		
		// QBkey ID
		w.UInt32(this.ByteID());
		
		// Full filename
		w.UInt32(Checksums.Make(this.FullFilename()));
		
		// Pointer to unknown
		w.UInt32(w.Tell() + 8);
		
		// Reserved
		w.UInt32(0);
		
		// The unknown
		w.UInt32(Checksums.Make(this.unknown));
		
		if (!this.data)
		{
			cons.error("SCRIPT " + this.id + " HAD NO DATA");
			return;
		}
		
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
        
        var uncomBuffer = this.data;
        var uncomLength = this.data.length;
        var comBuffer = this.data;
        var comLength = this.data.length;
        
		// Compress it beforehand and see what we get...
        var shouldCompress = true;
        
        var par = this.HighestParent();
        if (par)
        {
            if (!par.ShouldCompressScripts())
                shouldCompress = false;
        }
        
        if (shouldCompress)
        {
            var compressTest = GHSDK.Constants.LZSS.CompressBytes(this.data).result;
            
            if (compressTest && compressTest.length < uncomLength)
            {
                comBuffer = compressTest;
                comLength = comBuffer.length;
            }
        }

		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		
		// Uncompressed length
		w.UInt32(this.uncompressedSize || uncomLength);
		
		// Compressed length
		w.UInt32(this.compressedSize || comLength);
		
		w.Combine(this.from_bytes ? this.data : comBuffer);
		
		// Pad to nearest 4 bytes
		w.PadToNearest(4);
	}
	
	//-----------------------------------
	// Convert this item to byte format!
	//	(Inline struct scripts)
	//-----------------------------------
	
	ToBytes_Struct(w)
	{
		w.UInt16(0x0F00);
		w.UInt16(this.data.length);

		// QBkey ID
		w.UInt32(this.ByteID());
		
		// Pointer to script data
		w.UInt32(w.Tell() + 8);
		
		// Pointer to next item (after script data)
		var padOff = w.Tell() + 4 + this.data.length;
		var extra = padOff % 4;
		if (extra)
			padOff += (4 - extra);
			
		w.UInt32(padOff);
		
		if (!this.data)
		{
			cons.error("SCRIPT " + this.id + " HAD NO DATA");
			return;
		}

		w.Combine(this.data);
		
		// Pad to nearest 4 bytes
		w.PadToNearest(4);
	}
}

module.exports = QBScript;
