// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// QB reader - dissects a QB file into its parts!
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

const QBItemBase = require('./ItemTypes/QBItemBase.js');

const DEF_FILENAME = "0x40CA2103";

class QBReader extends QBItemBase
{
	//-----------------------------------
	// Initialize the object
	//-----------------------------------
	
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.indentable = false;
		this.fullFilename = DEF_FILENAME;
		
		global.CurrentQBReader = this;
		
		// Indentation level (for debug)
		this.indent = 0;
	}
	
	//-----------------------------------
	// Do not convert the reader to text!
	//-----------------------------------
	
	ToTextCore() { return this.ChildText(); }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
		
	//-----------------------------------
	// Read a binary .qb file (specific to this)
	//-----------------------------------
	
	DecompileFile(filename, outputname)
	{
		var dat;
		
		if (typeof(filename) == 'string' && fs.existsSync(filename))
			dat = fs.readFileSync(filename);
		
		// Is it little-endian?
		var fmt = "xen";
		
		var exten = filename.split(".").pop().toLowerCase();
		if (exten == "wpc")
			fmt = "wpc";
    
		var res = this.Decompile(dat, {
			filename: filename,
			format: fmt,
            flip_endian: (exten == "ps2")
		});
		
		fs.writeFileSync(outputname, res.result);
		cons.log(path.basename(outputname) + " written!", 'lime');
		
		return res;
	}
	
	//-----------------------------------
	// Decompile an actual buffer of QB data
	//-----------------------------------
	
	Decompile(data, options = {})
	{
		this.errors = [];
		this.warnings = [];
		
		this.RemoveChildren();
		
		this.reader = new GHSDK.Constants.Reader(data);
		
		var fmt = (options.format || "xen");
		if (fmt == 'wpc' || (options && options.flip_endian))
			this.reader.LE = true;
			
		GHSDK.QBHandler.format = fmt;
		
		// If raw, then do not read ANYTHING from the beginning!
		// We'll read our code as defined
		
		if (!options.raw)
		{
			// First is 0 or something?
			this.reader.UInt32();
			
			// Total filesize
			var totalSize = this.reader.UInt32();
		}

		this.Read(this.reader);
		
		//~ this.CoreDebug();
		
		// Output to text
		var textData = this.ToTextCore();
		
		// Preprend errors
		var pre = options.filename ? (path.basename(options.filename) + ": ") : "";
		var errorList = [];
		var warningList = [];
		
		for (const error of this.errors)
			errorList.push(pre + error);
		for (const warning of this.warnings)
			warningList.push(pre + warning);

		return {result: textData, errors: errorList, warnings: warningList};
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Assume filename from one of our children
	//-----------------------------------
	
	SearchForFilename()
	{
		for (const item of this.items)
		{
			if (item.fileId)
			{
				this.fullFilename = item.fileId;
				break;
			}
		}
	}
	
	//-----------------------------------
	// Read a decompiled .qb file (specific to this)
	//-----------------------------------
	
	CompileFile(filename, outputname, fullFilename = DEF_FILENAME, options = {})
	{
		this.errors = [];
		this.warnings = [];
		
		this.fullFilename = fullFilename;
        this.compileOptions = options;

		this.RemoveChildren();
		
		var inSource = fs.readFileSync(filename).toString();
		
		var res = this.CompileText(inSource, fullFilename, options);
		
		// Export it to a file
		fs.writeFileSync(outputname, res);
		
		// Preprend errors
		var pre = path.basename(filename) + ": ";
		var errorList = [];
		var warningList = [];
		
		for (const error of this.errors)
			errorList.push(pre + error);
		for (const warning of this.warnings)
			warningList.push(pre + warning);
		
		return {errors: errorList, warnings: warningList};
	}
		
	CompileText(inSource, fullFilename, options = {})
	{
		this.raw = (options && options.raw);
		
		this.textReader = new GHSDK.Constants.TextReader(inSource);
		this.ReadText(this.textReader);

		//~ this.CoreDebug();
		
		// Awesome, our file has been parsed and proper classes have been created
		// Now let's convert them to byte format
		
		this.textWriter = new GHSDK.Constants.Writer();
		
		if (GHSDK.QBHandler.format == "wpc")
			this.textWriter.LE = true;
		
		this.ToBytesCore(this.textWriter);
		
		// QB filesize
		if (!this.raw)
		{
			this.textWriter.Seek(4);
			this.textWriter.UInt32(this.textWriter.buffer.length);
		}
		
		return this.textWriter.buffer;
	}
	
	//-----------------------------------
    // Should we compress our scripts?
	//-----------------------------------
    
    ShouldCompressScripts()
    {
        if (this.compileOptions && this.compileOptions.noScriptCompression)
            return false;
            
        return true;
    }
    
	//-----------------------------------
	// Compile non-raw bytes
	// (This means it's a qb in a pak)
	//-----------------------------------
	
	ToBytesCore_Whole(w)
	{
		this.ToBytesCore(w);
		w.Seek(4);
		w.UInt32(w.buffer.length);
	}
	
	//-----------------------------------
	// Read a decompiled .qb stream (specific to this)
	//-----------------------------------
	
	CompileBytes(bytes, fullFilename = "0x40CA2103")
	{
		this.fullFilename = fullFilename;

		this.RemoveChildren();
		
		this.textReader = new GHSDK.Constants.TextReader( fs.readFileSync(filename).toString() );
		
		this.ReadText(this.textReader);

		//~ this.CoreDebug();
		
		// Awesome, our file has been parsed and proper classes have been created
		// Now let's convert them to byte format
		
		this.textWriter = new GHSDK.Constants.Writer();
		
		this.ToBytesCore(this.textWriter);
		
		// QB filesize
		this.textWriter.Seek(4);
		this.textWriter.UInt32(this.textWriter.buffer.length);
		
		// Export it to a file
		fs.writeFileSync(outputname, this.textWriter.buffer);
		
		return {errors: [], warnings: []};
	}
	
	//-----------------------------------
	// Get the current "full filename" as a string
	//-----------------------------------
	
	FullFilename()
	{
		return this.fullFilename;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w) 
	{ 
		if (this.raw)
			return;
			
		// Null
		w.UInt32(0); 
		
		// Total filesize, fill in later
		w.UInt32(0);
	}
}

module.exports = QBReader;
