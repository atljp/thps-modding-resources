// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
// TEX HANDLER
//
// Handles dealing with Neversoft .tex files!
//		(Fun fact: These are basically a container for .img files)
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');
const DDSHeader = require('./DDSHeader.js');
const zlib = require('zlib');
const jimp = require('jimp');

const TYPE_ARGB_VH = 0x43;
const TYPE_DXT1 = 0x52;
const TYPE_DXT3 = 0x53;
const TYPE_DXT5 = 0x54;
const TYPE_ATI2 = 0x71;
const TYPE_ARGB_RGB8 = 0x86;

class TexHandler
{
	constructor() {
		this.verbose = false;
		
		this.jimp = jimp;
	}
	
	texlog(txt)
	{
		if (this.verbose)
			console.log(txt);
	}
	
	//--------------------------------------------------
	// Read an IMG header! (THAW-like)
	//--------------------------------------------------
	
	ReadImgHeader_THAW(r, options = {})
	{
		r.LE = true;
		
		var tex = {};
		
		tex.format = 'thaw';
		
		// Magic! 0xABADD00D
		r.UInt32();
		
		// Always seems to be 2
		tex.const_a = r.UInt16();
		
		// Always seems to be 20
		tex.const_b = r.UInt16();
		
		// Always null
		tex.checksum = r.Chunk(4).toString('hex').padStart(8, "0");
		this.texlog("Checksum: " + tex.checksum);
		
		// Dimensions
		// Resized width x height (power of two)
		tex.width = r.UInt16();
		tex.height = r.UInt16();
		
		// REAL width x height
		tex.width2 = r.UInt16();
		tex.height2 = r.UInt16();
		
		// Mipmap count... I guess?
		tex.mipmapCount = r.UInt8();
		
		// Always 0x20, usually
		tex.unkA = r.UInt8();
		
		// DXT compression
		tex.unkD = r.UInt8();
		
		switch (tex.unkD)
		{
			case 5:
				tex.fourCC = 'DXT5';
				break;
				
			// Why 2? This is odd
			case 2:
			case 1:
				tex.fourCC = 'DXT1';
				break;
				
			default:
				tex.fourCC = 'ARGB';
				break;
		}
		
		// 0x20 for DXT, 0x00 for RGB
		tex.bpp = r.UInt8();
		
		// Length of image data
		tex.size = Math.min(r.buf.length - 28, r.UInt32());
		
		tex.offset = 28;
		
		return tex;
	}
	
	//--------------------------------------------------
	// Read an IMG header! (THAW-like, X360)
	//--------------------------------------------------
	
	ReadImgHeader_THAW360(r, options = {})
	{
		var tex = {};
		
		tex.format = 'thaw';
		
		// Constant, 0x0820
		r.UInt16();
		
		// Always seems to be 2
		tex.const_a = r.UInt8();
		
		// Always seems to be 0
		tex.const_b = r.UInt8();
		
		// Texture checksum
		tex.checksum = r.Chunk(4).toString('hex').padStart(8, "0");
		this.texlog("Checksum: " + tex.checksum);
		
		// Dimensions
		// Resized width x height (power of two)
		tex.width = r.UInt16();
		tex.height = r.UInt16();
		
		// REAL width x height
		tex.width2 = r.UInt16();
		tex.height2 = r.UInt16();
		
		// Mipmap count... I guess?
		tex.mipmapCount = r.UInt8();
		
		// Bytes per texel?
		tex.unkA = r.UInt8();
		
		// always 0
		r.UInt8();
		
		// DXT compression
		tex.unkD = r.UInt8();
        
		switch (tex.unkD)
		{
			case 5:
				tex.fourCC = 'DXT5';
				break;
				
			// Why 2? This is odd
			case 2:
			case 1:
				tex.fourCC = 'DXT1';
				break;
				
			default:
				tex.fourCC = 'ARGB';
				break;
		}
		
		// 0x20 for DXT, 0x00 for RGB
		tex.bpp = 0x20;
		
		// xbox header offset
		tex.chunkOffset = r.UInt32();
		tex.xbox = true;
		
		tex.size = r.UInt32();
		
		// Seems to be correct offset
		tex.offset = r.UInt32();
		
		// -- READ XBOX HEADER ----------
		
		var oldoff = r.Tell();
		
		r.Seek(tex.chunkOffset);

		r.Chunk(23);
		tex.imgType = r.UInt8();
		
		switch (tex.imgType)
		{
			// Odd b5g5r6 type used in GH:VH
			// (Red is then multiplied by 2)
			
			case TYPE_ARGB_VH:
				tex.fourCC = 'ARGB';
				break;
				
			case TYPE_ARGB_RGB8:
				tex.fourCC = 'ARGB';
				break;
			
			case TYPE_DXT1:
				tex.fourCC = 'DXT1';
				break;
				
			case TYPE_DXT3:
			case TYPE_DXT5:
				tex.fourCC = 'DXT5';
				break;
				
			case TYPE_ATI2:
				tex.fourCC = 'ATI2';
				break;
		}
		
		this.texlog("X360 chunk starts at " + tex.chunkOffset + ", format: 0x" + tex.imgType.toString(16).padStart(2, "0"));
		
		r.Seek(oldoff);
		
		return tex;
	}
	
	//--------------------------------------------------
	// Read an IMG header!
	// (This is also used in .tex files)
	//--------------------------------------------------
	
	ReadImgHeader(r, options = {})
	{
		var headerStart = r.Tell();
		var tex = {};
		
		tex.format = 'gh';
		
		// By default, the reader starts in BE
		// Check for THAW-like magic
		
		var test = r.UInt32();
		r.Seek(r.Tell() - 4);
		
		if (test == 0x0DD0ADAB)
			return this.ReadImgHeader_THAW(r, options);
			
		// Check for THAW 360 .tex indicator
		var thawTest = r.UInt16();
		r.Seek(r.Tell() - 2);
		
		if (thawTest == 0x0820)
			return this.ReadImgHeader_THAW360(r, options);

		r.UInt16();
		
		tex.unk = r.UInt8();
		this.texlog("Unk (Version?): " + tex.unk);
		
		tex.imageClass = r.UInt8();
		this.texlog("Image Class: " + tex.imageClass);
		
		// Checksum!
		tex.checksum = r.Chunk(4).toString('hex').padStart(8, "0");
		this.texlog("Checksum: " + tex.checksum);
		
		// Width and height
		tex.width = r.UInt16();
		tex.height = r.UInt16();
		
		// ???
		tex.passthing = r.UInt16();
		
		// Width and height
		tex.width2 = r.UInt16();
		tex.height2 = r.UInt16();
		
		// ???
		tex.unkA = r.UInt16();
		
		tex.mipmapCount = r.UInt8();	// How many mipmaps?
		tex.bpp = r.UInt8();			// BPP
		tex.unkD = r.UInt16();			// DXT / compression type
		
		// Guess four-character code
		// TODO: For PC textures, we can get this directly!
		
		tex.fourCC = (tex.bpp == 8) ? 'DXT5' : 'DXT1';
		
		this.texlog(tex.unkA, "[" + tex.mipmapCount + " mips]", "[" + tex.bpp + " BPP]", tex.unkD);
		
		this.texlog(tex.width + "x" + tex.height);
		
		// Null
		r.UInt32();
		
		// Offset and size
		tex.offset = r.UInt32();
		tex.size = r.UInt32();
		
		// Terminator
		var term = r.UInt32();
		
		// X360-style .tex files just have an offset to an odd file block
		// (This block contains DXT image type)
		//
		//		(PC textures have a term value of 0)
		//
		// Xbox .img files also have a term of 0
		
		var oldoff = r.Tell();
		
		var isXbox = (options.xbox || term !== 0);
		r.Seek(headerStart + tex.offset);
		var tester = r.UInt32();
		r.Seek(oldoff);
		
		if (tester == 0x00200003)
			isXbox = true;
			
		tex.xbox = isXbox;
		
		if (isXbox)
		{
			tex.chunkOffset = tex.offset;
			tex.offset = term;
			
			// Get image format
			
			r.Seek(tex.chunkOffset);
			r.Chunk(35);
			
			tex.imgType = r.UInt8();
			
			switch (tex.imgType)
			{
				// Odd b5g5r6 type used in GH:VH
				// (Red is then multiplied by 2)
				
				case TYPE_ARGB_VH:
					tex.fourCC = 'ARGB';
					break;
					
				case TYPE_ARGB_RGB8:
					tex.fourCC = 'ARGB';
					break;
				
				case TYPE_DXT1:
					tex.fourCC = 'DXT1';
					break;
					
				case TYPE_DXT3:
				case TYPE_DXT5:
					tex.fourCC = 'DXT5';
					break;
					
				case TYPE_ATI2:
					tex.fourCC = 'ATI2';
					break;
			}
			
			this.texlog("X360 chunk starts at " + tex.chunkOffset + ", format: 0x" + tex.imgType.toString(16).padStart(2, "0"));
			
			r.Seek(oldoff);
		}
		
		return tex;
	}
	
	//--------------------------------------------------
	// Parse data from a .tex file!
	//--------------------------------------------------
	
	Parse(texFile, options = {})
	{
		var data = options.rawData || fs.readFileSync(texFile);
		var r = new GHSDK.Constants.Reader(data);
		
		// -- PARSE IT! ----------------------
		
		var magic = r.UInt32().toString(16).toUpperCase();
		
		// Does not start with .tex magic, possibly compressed?
		if (magic !== 'FACECAA7')
		{
			if (!options.attempt)
			{
				cons.log("");
				cons.warn("Did not match magic header!");
				cons.warn("Trying ZLib just in case...");
				
				// Starts with GZ? Slice first 32 bytes off
				var toSlice = data;
				
				var magic = data.slice(0, 2);
				if (magic == "GZ")
					toSlice = data.slice(16, data.length);
					
				options.attempt = true;
				options.rawData = zlib.inflateRawSync(toSlice);
				return this.Parse("", options);
			}
			else
			{
				cons.error("BAD TEX FILE, COULD NOT PARSE");
				return [];
			}
		}
		
		r.Seek(6);

		// How many textures?
		var texCount = r.UInt16();
		this.texlog("This file has " + texCount + " textures.");
		
		// Where does the metadata start?
		var texMetaStart = r.UInt32();
		this.texlog("Meta starts at " + texMetaStart);
		
		// Did we encounter a zero-length texture?
		// If so, this will trigger forceful parsing of sizes
		var foundZeroLength = false;
		
		r.Seek(texMetaStart);
		
		// Read metadata for all of the textures!
		this.textures = [];
		
		for (var l=0; l<texCount; l++)
		{
			var tex = this.ReadImgHeader(r, options);
			this.texlog("Starts at " + tex.offset + " - [" + tex.size + " bytes]")
			
			// Zero-length? Trigger fixing
			if (tex.size <= 0)
				foundZeroLength = true;
			
			this.texlog("Approximated Type: " + tex.fourCC);
			this.textures.push(tex);
		}
		
		// Fix zero-length textures
		if (foundZeroLength)
		{
			this.texlog("   Found a texture with length of 0! Fixing...");
			
			var sumToIndex = {};
			var sorter = [];
			for (var t=0; t<this.textures.length; t++)
			{
				var texture = this.textures[t];
				sumToIndex[texture.checksum] = t;
				sorter.push([texture.checksum, texture.offset, texture.size]);
			}
				
			sorter.sort((a, b) => {return a[1] - b[1];});
			
			// Loop through sorted entries
			for (var s=0; s<sorter.length; s++)
			{
				var srt = sorter[s];
				
				// Zero-length texture, guess size by using next start
				if (srt[2] == 0)
				{
					var nextOffset;

					// If last file, use file end
					if (s == sorter.length-1)
						nextOffset = data.length;
					else
						nextOffset = sorter[s+1][1];
						
					var guessedSize = nextOffset - srt[1];
					var texIndex = sumToIndex[srt[0]];
					
					this.textures[texIndex].size = guessedSize;
					this.texlog("     Guessed size for " + srt[0] + ": " + guessedSize);
				}
			}
		}
		
		// Slice data off using newfound proper offsets
		for (const tex of this.textures)
			tex.data = data.slice(tex.offset, tex.offset+tex.size);

		return this.textures;
	}
	
	//--------------------------------------------------
	// Extract a .tex file!
	//--------------------------------------------------
	
	Extract(texFile, outDir, options = {})
	{
		if (!fs.existsSync(outDir))
			fs.mkdirSync(outDir);
			
		var textures = this.Parse(texFile, options);
		for (const tex of textures)
		{
			// Write it!
			var friendlyName = Checksums.Lookup("0x" + tex.checksum);
			
			// No DDS, add extension!
			var desiredExten = "dds";
			
			if (options.noesis)
				desiredExten = "ghm";
			else
			{
				// PNG?
				if (tex.data.length >= 4)
				{
					var magic = tex.data.slice(1, 4).toString().toUpperCase();
					if (magic == 'PNG')
						desiredExten = "png";
				}
			}
			
			if (friendlyName.toLowerCase().indexOf(".dds") == -1)
				friendlyName += ".dds";
				
			// Replace with new path
			var spl = friendlyName.split(".");
			spl[spl.length-1] = desiredExten;
			friendlyName = spl.join(".");
				
			// Replace slashes, for path purposes
			friendlyName = friendlyName.replace(/[\\/]/g, path.sep);
			
			var friendlyDir = (path.dirname(friendlyName) || "").toLowerCase();
			var friendlyFile = path.basename(friendlyName);
			
			var oPath = path.join(outDir, friendlyDir, friendlyFile);
			
			// Make dir if necessary
			var dir = path.dirname(oPath);
			var fil = path.basename(oPath);
			if (!fs.existsSync(dir))
				fs.mkdirSync(dir, {recursive: true});
			
			var writeData = tex.data;
			
			// Noesis-directed export
			if (options.noesis)
			{
				var w = new GHSDK.Constants.Writer();
				w.UInt32(tex.data.length);
				w.UInt8(tex.imgType);
				w.UInt32(tex.width);
				w.UInt32(tex.height);
				w.Combine(tex.data);
				
				writeData = w.buffer;
			}
			
			// XBox texture, non-Noesis
			// (We need DDS header and such!)
			
			else if (tex.xbox)
			{
				this.DecodeXBoxTexture(tex);
				writeData = tex.data;
			}
			
			fs.writeFileSync(oPath, writeData);
		}
	}
	
	//--------------------------------------------------
	// Compile a .tex file!
	//--------------------------------------------------
	
	Compile(texDir, outFile)
	{
		var textures = [];
		
		var w = new GHSDK.Constants.Writer();
		
		// Scan all files in it
		var fileList = GHSDK.ScanFolder(texDir);
		
		this.texlog("There are " + fileList.length + " textures");
		
		for (const file of fileList)
		{
			var rel = path.relative(texDir, file);
			var sum = Checksums.Make(rel);
			
			var tex = {
				checksum: sum,
				name: path.basename(file),
				location: file
			}
			
			tex.data = fs.readFileSync(file);
			
			// Compression
			tex.compression = parseInt(String.fromCharCode(tex.data[87]));
			tex.height = tex.data.readUInt32LE(12);
			tex.width = tex.data.readUInt32LE(16);
			
			textures.push(tex);
		}
		
		// Begin writing our .tex file
		
		// Magic
		
		w.UInt32(0xFACECAA7);
		w.UInt16(0x011C);
		
		// How many textures?
		
		w.UInt16(textures.length);
		
		// Metadata start, FIX LATER
		
		var metaStartPointer = w.Tell();
		w.UInt32(0);
		
		// OffsetA + (texCount * 44)
		// What does this MEAN though? WHERE DOES IT GO?
		
		w.UInt32(0);
		
		// Padding
		w.UInt32(0xFFFFFFFF);
		
		// Grab amount of EF padding based on texture count
		const {texLog, texPad} = this.GetTexPadding(textures.length);
		
		// Log of texture count
		w.UInt32(texLog);
		
		// Always 28
		w.UInt32(28);
		
		// 0xEF padding
		w.Pad(texPad, 0xEF);
		
		// - - - - - - - - - - - - - - - - - - - - - - - 
		
		// Metadata chunk, leave blank for now
		
		var metaStartOffset = w.Tell();
		w.Seek(metaStartPointer);
		w.UInt32(metaStartOffset);
		w.UInt32(metaStartOffset + (textures.length * 44));
		w.Seek(metaStartOffset);

		w.Pad(textures.length * 40);
		
		// Handle each texture!
		for (var t=0; t<textures.length; t++)
		{
			var tex = textures[t];
			var dataOff = w.Tell();
			
			// Write texture metadata
			w.Seek(metaStartOffset + (t * 40));
			
			var offA = w.Tell();
			
			w.UInt8(0x0A);
			w.UInt8(0x28);
			w.UInt8(0x13);
			
			// Mode thing
			
			// 4: Cube texture
			// 5: Volume texture
			// Anything else is created from a file in memory
			
			w.UInt8(0);
			
			w.UInt32(tex.checksum);			// Checksum
			
			w.UInt16(tex.width);			// Width
			w.UInt16(tex.height);			// Height
			w.UInt16(1);
			w.UInt16(tex.width);			// Width
			w.UInt16(tex.height);			// Height
			w.UInt16(1);
			
			var mipCount = tex.data.readUInt32LE(28);
			w.UInt8(mipCount || 1);			// Mipmap count
			
			this.texlog(tex.name + " - " + mipCount + " mips");
			
			w.UInt8(8);						// 8?
			w.UInt8(5);						// 4 or 5, not sure what this is
			w.Pad(5);

			w.UInt32(dataOff)				// Texture data start
			w.UInt32(tex.data.length)		// Length
			w.UInt32(0);
			
			w.Seek(dataOff);
			
			w.Combine(tex.data);			// Texture data
		}
		
		fs.writeFileSync(outFile, w.buffer);
		cons.log(path.basename(outFile) + " written.");
	}
	
	//--------------------------------------------------
	// Get amount of .tex padding for amount
	// (Thanks ExileLord!)
	//
	// https://github.com/ExileLord/Open-GHTCP/blob/296114ed963ff2dcfddbad13e8e5b6efcc1d2b8f/ns19/TexFile.cs
	//--------------------------------------------------
	
	GetTexPadding(amount)
	{
		var num3 = 2;
		
		while (amount / Math.pow(2.0, num3 - 2) > 1.0)
			num3++;
			
		num3 --;
		
		return {texLog: num3, texPad: Math.pow(2.0, num3) * 12.0 + 28.0};
	}
	
	//--------------------------------------------------
	// Get width and height from PNG data
	//--------------------------------------------------
	
	GetPNGDimensions(data)
	{
		var w = 0;
		var h = 0;
		
		var r = new GHSDK.Constants.Reader(data);
		r.Seek(8);
		
		while (true && r.CanRead())
		{
			var headerStart = r.Tell();
			var headerLength = r.UInt32();
			var headerType = r.Chunk(4).toString();
			
			var nextHeader = r.Tell() + headerLength;
			
			// IHDR header, contains useful stuff
			if (headerType.toUpperCase() == 'IHDR')
			{
				w = r.UInt32();
				h = r.UInt32();
			}
			
			r.Seek(nextHeader);
		}

		return [w, h];
	}
	
	// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------------
	// Append a DDS header to data
	//--------------------------------------------------
	AppendDDSHeader(dat, opt = {})
	{
		var fourCC = opt.fourCC || 'DXT1';
		var width = opt.width || 128;
		var height = opt.height|| 128;
		var mipCount = opt.mipmapCount || 1;
		
		return DDSHeader(dat, fourCC, width, height, mipCount);
	}
	
	//--------------------------------------------------
	// Generate an .img header from a DDS buffer
	//--------------------------------------------------
	
	CreateImgHeader(data, opt = {})
	{
		var imgFormat = ((opt && opt.format) || 'auto').toLowerCase();
		
		var magic = data.slice(0, 3).toString();
		
		// Automatically determine image format
		if (imgFormat == 'auto')
		{
			if (magic == 'DDS')
				imgFormat = 'dds';
			else
				imgFormat = 'png';
		}
		
		// DDS to RAW?
		// Don't do this
		
		if (imgFormat == 'png' && magic == 'DDS')
		{
			cons.error("Cannot convert DDS to RAW PNG img. (yet).");
			return null;
		}
		
		// What compression is it?
		var compression = 0;
		
		if (imgFormat == 'dds')
		{
			var comChar = String.fromCharCode(data[87]);
			compression = (comChar == '1') ? 1 : 5;
		}
		
		// Writer!
		var w = new GHSDK.Constants.Writer();
		
		// Magic, always the same
		w.UInt32(0x0A281300);
		
		// Null
		w.UInt32(0);
		
		// Width and height!
		var width = 0;
		var height = 0;
		
		if (imgFormat == 'dds')
		{
			width = data.readUInt32LE(16);
			height = data.readUInt32LE(12);
		}
		else if (imgFormat == 'png')
		{
			var wh = this.GetPNGDimensions(data);
			width = wh[0];
			height = wh[1];
		}
		
		if (width < 0 || width > 65535)
		{
			cons.error("Bad width value: " + width);
			return;
		}
		
		if (height < 0 || height > 65535)
		{
			cons.error("Bad height value: " + height);
			return;
		}
		
		w.UInt16(width);
		w.UInt16(height);
		
		// unk
		w.UInt16(1);
		
		// Width and height again in true Neversoft fashion
		w.UInt16(width);
		w.UInt16(height);
		
		// unk
		w.UInt16(1);
		
		// Mipmap count
		var mipCount = 1;
		
		if (imgFormat == 'dds')
			mipCount = data.readUInt32LE(28);
		
		if (opt.forceMip)
			mipCount = 1;
            
        mipCount = (opt && opt.mipmaps) || mipCount;
		
		w.UInt8(mipCount);
		
		// BPP, probably
		// 4 if 1, 8 if 5
		var bpp = 32;
		
		if (imgFormat == 'dds')
			bpp = (compression == 1) ? 4 : 8;
			
		w.UInt8(bpp);
		
		// Compression type
		w.UInt8(compression);
		
		// Not sure
		w.UInt8(0);
		
		// Null
		w.UInt32(0);
		
		// Start position
		w.UInt32(w.Tell() + 12);
		
		// Length
		w.UInt32(data.length);
		
		// Null
		w.UInt32(0);
		
		return w.buffer;
	}
	
	//--------------------------------------------------
	// Generate a THAW .img header from a DDS buffer
	//--------------------------------------------------
	
	CreateImgHeader_THAW(data, opt = {})
	{
        var dataLength = data.length;
        
		var imgFormat = ((opt && opt.format) || 'auto').toLowerCase();
        
		// Automatically determine image format
		if (imgFormat == 'auto')
		{
			if (data[0] == 0x44 && data[1] == 0x44 && data[2] == 0x53)
				imgFormat = 'dds';
			else
				imgFormat = 'png';
		}
			
		// What compression is it?
		var compression = 0;
		
		if (imgFormat == 'dds')
		{
			var comChar = String.fromCharCode(data[87]);
			compression = (comChar == '1') ? 1 : 5;
            dataLength -= 128;
		}
        
		// Writer!
		var w = new GHSDK.Constants.Writer();
		w.LE = true;
		
		// Magic, always the same
		w.UInt32(0xABADD00D);
		
		// Constants?
		w.UInt16(2);
		w.UInt16(20);
		w.UInt32(0);
		
		// Width and height!
		var width = 0;
		var height = 0;
		
		if (imgFormat == 'dds')
		{
			width = data.readUInt32LE(16);
			height = data.readUInt32LE(12);
		}
		else if (imgFormat == 'png')
		{
			var wh = this.GetPNGDimensions(data);
			width = wh[0];
			height = wh[1];
		}

        if (width < 0 || width > 65535)
        {
            cons.error("Width out of range: " + width);
        }
        
        if (height < 0 || height > 65535)
        {
            cons.error("Height out of range: " + height);
        }

		w.UInt16(width);
		w.UInt16(height);
		w.UInt16(width);		// Again
		w.UInt16(height);		// Again
		
		// Mipmap count
		var mipCount = 1;
		
		if (imgFormat == 'dds')
			mipCount = data.readUInt32LE(28);
		
		if (opt.forceMip)
			mipCount = 1;
		
		w.UInt8(mipCount);
		
		// BPP, probably (Seems to always be 32)
		w.UInt8(32);
		
		// Compression type
		w.UInt8(compression);
		
		// Always seems to be 32.
		w.UInt8(32);

        // -- Mipmaps go HERE! --
		w.UInt32(dataLength);
		
		return w.buffer;
	}
	
	//--------------------------------------------------
	// Apply an .img header to a PNG data buffer
	//--------------------------------------------------
	
	async PNGtoIMG(data)
	{
		var hed = this.CreateImgHeader(data, {format: 'png'});
		
		if (!hed)
		{
			cons.error("Failed to convert PNG to IMG.");
			return {};
		}
		
		return {data: Buffer.concat([hed, data])};
	}
	
	//--------------------------------------------------
	// Convert PNG image to jimp
	//--------------------------------------------------
	
	async PNGtoJimp(data)
	{
		var jimpData = await jimp.read(data);
		return jimpData;
	}
	
	//--------------------------------------------------
	// Apply an .img header to a DDS data buffer
	//--------------------------------------------------
	
	async DDStoIMG(data, opt = {})
	{
		var isWPC = (opt && opt.thaw);
		
		// Hold up, is it a PNG image?
		// If so, let's convert it to DXT first!
		var sliced = data.slice(1, 4).toString();
		if (sliced.indexOf('PNG') >= 0)
		{
			this.EnsureDXT();
			
			var prom = new Promise((resolve, reject) => {
				
				var dds_result = this.PNGtoDDS(data, {}, (res) => {
					
					if (res.result)
					{
						var hed;
						
						if (isWPC)
                        {
							hed = this.CreateImgHeader_THAW(res.result);
                            res.result = res.result.slice(128, res.result.length);
                        }
						else
							hed = this.CreateImgHeader(res.result);

						resolve({data: Buffer.concat([hed, res.result])});
					}
					else
						reject({errors: res.errors});
				});
				
			});
			
			return prom;
		}
		
		var hed;
		
		if (isWPC)
		{
			hed = this.CreateImgHeader_THAW(data);
			data = data.slice(128, data.length);
		}
		else
			hed = this.CreateImgHeader(data);
			
		return {data: Buffer.concat([hed, data])};
	}
	
	//--------------------------------------------------
	// Convert a .img buffer to DDS
	//--------------------------------------------------
	
	async IMGtoDDS(data)
	{
        data = GHSDK.PakHandler.DecompressData(data);
        
		var r = new GHSDK.Constants.Reader(data);
		var tex = this.ReadImgHeader(r);
		
		// THAW WPC images do not have a header!
		// They need a DDS header
		if (tex.format == 'thaw' && !tex.xbox)
		{
			r.Seek(tex.offset);
			var data = r.Chunk(tex.size);

			data = this.AppendDDSHeader(data, {
				fourCC: tex.fourCC,
				width: tex.width,
				height: tex.height,
				mipCount: tex.mipmapCount
			});
			
			return {data: data};
		}
		
		// PC texture, likely starts with DDS
		if (!tex.xbox)
		{
			r.Seek(tex.offset);
			
			var data = r.Chunk(tex.size);
			
			// Hold up, see if it's a PNG file
			if (data.length >= 4)
			{
				var magic = data.slice(1, 4).toString().toUpperCase();
				if (magic == 'PNG')
					return {data: data, format: 'png'};
			}
			
			return {data: data};
		}
		
		// XBox images SEEM to start at 4096 byte...
		r.Seek(4096);
		
		var maxSize = r.buf.length - r.Tell();
		tex.data = r.Chunk(Math.min(maxSize, tex.size));
		
		// Need to untile it!
		var imgMeta = {
			width: tex.width,
			height: tex.height,
			fourCC: tex.fourCC
		};
		
		this.DecodeXBoxTexture(tex);

		return {data: tex.data};
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	//
	//	XBOX 360 IMAGE HANDLING
	//		Fancy tiled images!
	//
	//	WORK IN PROGRESS
	//	Block linear tiling method is unstable
	//
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	Align(num, alignTo)
	{
		return ((num + alignTo - 1) & ~(alignTo - 1));
	}
	
	// Does this need to account for signed / unsigned?
	// Probably, make sure to do some debugging!
	
	appLog2(n)
	{
		var r;
		for (r = -1; n; n >>= 1, r++) {}
		return r;
	}

	GetXbox360TiledOffset(x, y, width, logBpb)
	{
		var alignedWidth = this.Align(width, 32);
		// top bits of coordinates
		var macro  = ((x >> 5) + (y >> 5) * (alignedWidth >> 5)) << (logBpb + 7);
		// lower bits of coordinates (result is 6-bit value)
		var micro  = ((x & 7) + ((y & 0xE) << 2)) << logBpb;
		// mix micro/macro + add few remaining x/y bits
		var offset = macro + ((micro & ~0xF) << 1) + (micro & 0xF) + ((y & 1) << 4);
		// mix bits again
		return (((offset & ~0x1FF) << 3) +					// upper bits (offset bits [*-9])
				((y & 16) << 7) +							// next 1 bit
				((offset & 0x1C0) << 2) +					// next 3 bits (offset bits [8-6])
				(((((y & 8) >> 2) + (x >> 3)) & 3) << 6) +	// next 2 bits
				(offset & 0x3F)								// lower 6 bits (offset bits [5-0])
				) >> logBpb;
	}

	UntileXbox360Texture(src, dst, tiledWidth, originalWidth, tiledHeight, originalHeight, blockSizeX, blockSizeY, bytesPerBlock, debug = false)
	{
		var tiledBlockWidth     = tiledWidth / blockSizeX;			// width of image in blocks
		var originalBlockWidth  = originalWidth / blockSizeX;		// width of image in blocks
		var tiledBlockHeight    = tiledHeight / blockSizeY;			// height of image in blocks
		var originalBlockHeight = originalHeight / blockSizeY;		// height of image in blocks
		var logBpp              = this.appLog2(bytesPerBlock);
		
		var sxOffset = 0;
		
		if ((tiledBlockWidth >= originalBlockWidth * 2) && (originalWidth == 16))
			sxOffset = originalBlockWidth;
				
		if (debug)
		{
			console.log("    Dims: " + originalWidth + "x" + originalHeight);
			console.log("    Tiled Dims: " + tiledWidth + "x" + tiledHeight);
			console.log("    Tiled Block Size: " + tiledBlockWidth + "x" + tiledBlockHeight);
			console.log("    Original Block Size: " + originalBlockWidth + "x" + originalBlockHeight);
			console.log("    logBPP: " + logBpp);
		}
			
		// Iterate over image blocks
		for (var dy = 0; dy < originalBlockHeight; dy++)
		{
			for (var dx = 0; dx < originalBlockWidth; dx++)
			{
				var swzAddr = this.GetXbox360TiledOffset(dx + sxOffset, dy, tiledBlockWidth, logBpp);	// do once for whole block
				
				var sy = Math.floor(swzAddr / tiledBlockWidth);
				var sx = swzAddr % tiledBlockWidth;

				var dst_add = (dy * originalBlockWidth + dx) * bytesPerBlock;
				var src_add = (sy * tiledBlockWidth + sx) * bytesPerBlock;
				
				if (dx < 8 && dy < 8 && debug)
					console.log("swzAddr, sx, sy, dst, src: " + swzAddr + ", " + sx + ", " + sy + ", " + dst_add + ", " + src_add);
				
				// Essentially memcpy
				for (var c=0; c<bytesPerBlock; c++)
					dst[dst_add+c] = src[src_add+c];
			}
		}
	}
	
	//--------------------------------------------------
	// Decodes an XBox texture
	// Unswizzles, etc.
	//--------------------------------------------------
	
	DecodeXBoxTexture(tex, options = {})
	{
		var width = tex.width || 512;
		var height = tex.height || 512;
		
		// DXT1 only for now
		if (tex.fourCC !== 'DXT1' && tex.fourCC !== 'DXT5' && tex.fourCC !== 'ATI2' && tex.fourCC !== 'ARGB')
		{
			cons.warn("Bad FourCC for " + tex.checksum + ": " + tex.fourCC);
			return;
		}
		
		// ARGB only supports VH for now
		if (tex.fourCC == 'ARGB' && (tex.imgType !== TYPE_ARGB_VH && tex.imgType !== TYPE_ARGB_RGB8))
		{
			cons.warn("Texture " + tex.checksum + " is non-VH and non-RGB8 ARGB.");
			return;
		}
			
		this.fourCC = tex.fourCC || 'DXT1';

		// Now untile it!
		var untiled = Buffer.alloc(tex.data.length);
		
		var blockSizeX;
		var blockSizeY;
		var bytesPerBlock;
		var alignX;
		var alignY;
		
		switch (tex.fourCC)
		{
			case 'DXT1':
				blockSizeX = 4;
				blockSizeY = 4;
				bytesPerBlock = 8;
				alignX = 128;
				alignY = 128;
				break;
				
			case 'ATI2':
				blockSizeX = 4;
				blockSizeY = 4;
				bytesPerBlock = 16;
				alignX = 128;
				alignY = 128;
				break;
				
			case 'ARGB':
				blockSizeX = 1;
				blockSizeY = 1;
				alignX = 32;
				alignY = 32;
				
				// This was 2 at one point
				// Does it still apply? NEEDS TESTING
				bytesPerBlock = 2;
				
				break;
				
			case 'DXT5':
				blockSizeX = 4;
				blockSizeY = 4;
				bytesPerBlock = 16;
				alignX = 128;
				alignY = 128;
				break;
		}
		
		// Align tiled width and height
		var tiledWidth = this.Align(tex.width, alignX);
		var tiledHeight = this.Align(tex.height, alignY);
        
        blockSizeX = (options && options.blockSizeX) || blockSizeX;
        blockSizeY = (options && options.blockSizeY) || blockSizeY;
        tiledWidth = (options && options.tiledWidth) || tiledWidth;
        tiledHeight = (options && options.tiledHeight) || tiledHeight;
        bytesPerBlock = (options && options.bytesPerBlock) || bytesPerBlock;
        
        width = (options && options.width) || width;
        height = (options && options.height) || height;
		
		//~ console.log("Untiling " + tex.fourCC + ": " + tex.checksum);
		
		this.UntileXbox360Texture(tex.data, untiled, tiledWidth, width, tiledHeight, height, blockSizeX, blockSizeY, bytesPerBlock);
        
		// Flip endianness!
		if (tex.imgType != TYPE_ARGB_RGB8)
		{
			for (var k=0; k<untiled.length; k += 2)
			{
				var a = untiled[k];
				var b = untiled[k+1];
				
				untiled[k] = b;
				untiled[k+1] = a;
			}
		}
		
		//-----------------
		// Special processing for ARGB
		//-----------------
		
		if (tex.imgType == TYPE_ARGB_VH || tex.imgType == TYPE_ARGB_RGB8)
		{
			var newData = Buffer.alloc((tex.width * tex.height) * 4);
			
			var pixels = 0;
			
			var pixelSize = (tex.imgType == TYPE_ARGB_RGB8) ? 4 : 2;
			
			for (var off = 0; off < untiled.length; off += pixelSize)
			{
				var col, r, g, b, a;
				
				// b5g5r6
				if (tex.imgType == TYPE_ARGB_VH)
				{
					// This type is b5g5r6, R is mult by 2
					col = untiled.readUInt16LE(off);
					
					b = (col & 0x1F) << 3;
					g = ((col >> 5) & 0x1F) << 3;
					r = ((col >> 10) & 0x1F) << 3;

					a = 255;
				}
				
				// rgb8
				else
				{
					a = untiled[off];
					r = untiled[off+1];
					g = untiled[off+2];
					b = untiled[off+3];
				}
				
				// Raw DDS is BGRA
				newData[(pixels*4)] = b;
				newData[(pixels*4)+1] = g;
				newData[(pixels*4)+2] = r;
				newData[(pixels*4)+3] = a;
				
				pixels ++;
			}
			
			untiled = newData;
		}
		
		//-----------------
		
		tex.data = untiled;
		
		// Now append a DDS header
		// Slap DDS header
		var dds_opt = {
			fourCC: tex.fourCC,
			width: width,
			height: height,
			mipCount: tex.mipmapCount || 1
		};
		
		var app = this.AppendDDSHeader(tex.data, dds_opt);
		tex.data = app;
	}
	
	// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------------
	// Converts Image buffer to DDS
	//--------------------------------------------------
	
	BufferToDDS(data, opt = {})
	{
		var w = opt.width || 0;
		var h = opt.height || 0;
		
		this.EnsureDXT();
		
		var fourCC = opt.fourCC || 'dxt5';
		var flags_to_use = this.dxt.flags[fourCC.toUpperCase()] || dxt.flags['DXT5'];
		var dxt_data = this.dxt.compress(data, w, h, flags_to_use);
		
		if (!dxt_data)
			return null;
			
		// Slap DDS header
		var dds_opt = {
			fourCC: fourCC,
			width: w,
			height: h,
			mipCount: opt.mipmap_count || 1
		};
		
		var app = this.AppendDDSHeader(dxt_data, dds_opt);
		return app;
	}
	
	//--------------------------------------------------
	// Converts PNG texture to DDS
	//--------------------------------------------------
	
	PNGtoDDS(data, opt = {}, callback = function(data = {}) {} )
	{
		this.EnsureDXT();
		
		// Must be file path
		if (typeof(data) == 'string')
		{
			if (!fs.existsSync(data))
				return callback({errors: ['PNG file missing']});
				
			data = fs.readFileSync(data);
		}
		
		// Now regardless, it's a buffer
		// Read it with jimp!
		
		jimp.read(data, (err, img) => {
			if (err)
				return callback({errors: [err]});
				
			var hasAlpha = false;
				
			var imageBuffer = [];
			
			var w = opt.width || img.bitmap.width;
			var h = opt.height || img.bitmap.height;
			
			var pixels = w * h;
			
			var x = 0;
			var y = 0;
			
			for (var p=0; p<pixels; p++)
			{
				var col = img.getPixelColor(x, y);
				var rgb = jimp.intToRGBA(col);
				
				// Non-binary alpha, trigger DXT5
				if (rgb.a != 0 && rgb.a != 255)
					hasAlpha = true;
				
				// BGRA: Little endian
				imageBuffer.push(rgb.r);
				imageBuffer.push(rgb.g);
				imageBuffer.push(rgb.b);
				imageBuffer.push(rgb.a);
				
				x ++;
				if (x >= w)
				{
					x = 0;
					y ++;
				}
			}
			
			var fourCC = opt.fourCC || (hasAlpha ? 'dxt5' : 'dxt1');
			
			var flags_to_use = this.dxt.flags[fourCC.toUpperCase()] || this.dxt.flags['DXT5'];
			
			var dxt_data = this.dxt.compress(imageBuffer, w, h, flags_to_use);
			
			if (!dxt_data)
				return callback({errors: ['Could not convert DXT.']});
				
			// Slap DDS header
			var dds_opt = {
				fourCC: fourCC,
				width: w,
				height: h,
				mipCount: 1
			};
			
			var app = this.AppendDDSHeader(dxt_data, dds_opt);
			
			return callback({result: app});
		});
	}
	
	//--------------------------------------------------
	// Converts PNG texture to DDS, asynchronously
	//--------------------------------------------------
	
	async PNGtoDDS_Async(data, opt = {}) {
		
		var prom = new Promise((resolve, reject) => {
			
			var res = this.PNGtoDDS(data, opt = {}, data => {
				if (data) { resolve({result: data.result}); }
				else { reject("Error"); }
			});
			
		});
		
		return prom;
	}
	
	//--------------------------------------------------
	// Ensure we have DXT
	//--------------------------------------------------
	
	EnsureDXT()
	{
		this.dxt = this.dxt || require('dxt-js');
	}
	
	//--------------------------------------------------
	// Get dimension info from a PNG
	//--------------------------------------------------
	
	GetPNGDimensions(data)
	{
		var off = 8;
		var width = 0;
		var height = 0;
		
		while (off < data.length)
		{
			var chunkLength = data.readUInt32BE(off);
			off += 4;

			var chunkType = data.slice(off, off+4).toString();
			off += 4;
			
			var nextPos = off + chunkLength;
			
			if (chunkType = 'IHDR')
			{
				width = data.readUInt32BE(off);
				height = data.readUInt32BE(off+4);
				break;
			}
			
			off = nextPos;
		}
		
		return [width, height];
	}
	
	//--------------------------------------------------
	// Convert DDS data to PNG
	//--------------------------------------------------
	
	async DDStoPNG(data, opt = {})
	{
		// If it's already a PNG, just return the PNG!
		if (data.length >= 4)
		{
			var magic = data.slice(1, 4).toString().toUpperCase();
			if (magic == 'PNG')
				return {data: data};
		}
		
		this.EnsureDXT();
		
		// Read DDS width
		var height = data.readUInt32LE(12);
		var width = data.readUInt32LE(16);
		
		// FourCC
		var fourCC = data.slice(84, 88).toString();
		
		// Lazily chop off DXT data
		var dxt_data = data.slice(128, data.length);
				
		var tlc = fourCC.toLowerCase();
		var flags = (tlc == 'dxt5') ? this.dxt.flags.DXT5 : this.dxt.flags.DXT1;
		var decom = this.dxt.decompress(dxt_data, width, height, flags);
		
		var prom = new Promise((resolve, reject) => {
			
			new jimp({data: decom, width: width, height: height}, async (err, image) => {
				if (err)
				{
					reject({errors: [err]});
					return;
				}
				
				if (opt.asJimp)
					resolve({data: image});
				else
				{
					var buf = await image.getBufferAsync(jimp.MIME_PNG);
					resolve({data: buf});
				}
			});
			
		});
		
		return prom;
	}
}

module.exports = TexHandler;
