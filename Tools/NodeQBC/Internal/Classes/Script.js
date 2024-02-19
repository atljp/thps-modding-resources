// ---------------------------------------------------
//
//	Script
//	A script, contains data
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCScript extends ItemCore
{
	Initialize()
	{
		this.data_crc = 0;
		this.size_uncompressed = 0;
		this.size_compressed = 0;
		this.script_data = null;
		
		// Index of our current conditional, for serializing
		
		this.conditionalIndex = 0;
		
		// Labels / jumps for serializing,
		// fill these in during post-serialize
		
		this.label_starts = {};
		this.label_dests = {};
	}
	
	IsSingleLine() { return false; }
	IsScript() { return true; }
	GetItemInfoType() { return QBC.constants.TypeBindings['Script']; }
	
	GetDebugText() 
	{ 
		return ": " + this.size_compressed + " compr, " + this.size_uncompressed + " uncompr";
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	Read() 
	{
        // THUG script? This is different from PAK items.
        if (this.job.IsTHUG())
        {        
            // This SHOULD be 0x16.
            var magicToken = this.reader.UInt8();
            
            if (magicToken != QBC.constants.ESCRIPTTOKEN_NAME)
            {
                this.Fail("Script token was not followed by 0x" + QBC.constants.ESCRIPTTOKEN_NAME.toString(16).padStart(2, "0") + ".");
                return;
            }
            
            this.id = QBC.constants.Keys.FromKey("0x" + this.reader.UInt32().toString(16).padStart(8, "0"));
            
            while (this.ReadAllowed())
				this.ReadScriptToken();
            
            this.Finalize();
            return;
        }
        
		this.ReadSharedProperties(); 
		this.reader.Seek(this.ptr_scriptStart);
        
        // Literal top-line script.
        if (!(this.flags & QBC.constants.FLAG_HASPARENT))
        {
            this.data_crc = this.reader.UInt32();
            this.size_uncompressed = this.reader.UInt32();
            this.size_compressed = this.reader.UInt32();
        }
        
        // StructScript. Size isn't explicitly defined.
        else
        {
            this.data_crc = 0;
            this.size_uncompressed = this.ptr_nextItem - this.ptr_scriptStart;
            this.size_compressed = this.ptr_nextItem - this.ptr_scriptStart;
        }
		
		var isCompressed = true;
		var size_to_use = this.size_compressed;
		
		if (this.size_uncompressed <= this.size_compressed)
		{
			isCompressed = false;
			size_to_use = this.size_uncompressed;
		}
			
		this.script_data = this.reader.Chunk(size_to_use);
        
        // Skip to nearest 4 bytes.
        this.reader.SkipToNearest(4);
		
		if (isCompressed)
		{
            if (QBC.constants.LZSS)
            {
                var res = QBC.constants.LZSS.DecompressBytes(this.script_data);
                
                if (res.result)
                    this.script_data = res.result;
                else
                {
                    this.Fail("LZSS Decompress Error: " + res.error);
                    return;
                }
            }
		}
		
		// Create a reader for our script data and use it!
		var scriptReader = new QBC.constants.Reader(this.script_data);
		scriptReader.LE = true;
		
		var oldReader = this.reader;
		this.SetReader(scriptReader);
		
		// Read our script data until we can't anymore
		while (this.ReadAllowed())
			this.ReadScriptToken();
		
		// Restore old reader
		this.SetReader(oldReader);
		
		// Align to nearest 4 bytes
		this.reader.SkipToNearest(4);
	}
	
	ReadSharedValue() { this.ptr_scriptStart = this.reader.UInt32(); }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T   O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		var idText = this.GetValueText(this.GetID());
		
        // Do not beautify in structs.
        if (!this.InStruct())
            this.job.AddLine();
        
		this.job.AddText("script " + idText + " ");
		this.job.AddIndent();
	}
	
	//-----------------------
	// Done writing text
	//-----------------------
	
	PostWriteText()
	{
		super.PostWriteText();
		
		if (this.job.Failed())
			return;
            
        if (this.job.IsTHUG())
        {
            this.job.SubIndent();
            this.job.AddText("endscript");
        }
			
		this.job.AddLine();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// For serializing conditionals
	//-----------------------
	
	NextConditionalIndex() { this.conditionalIndex ++; }
	GetConditionalIndex() { return this.conditionalIndex; }
	
	//-----------------------
	// Begin a short break
	//-----------------------
	
	BeginBreak(breakName, spot=-1) 
	{ 
		this.label_starts[breakName] = (spot >= 0) ? spot : this.writer.Tell(); 
	}
	
	//-----------------------
	// End a short break
	//-----------------------
	
	EndBreak(breakName, spot=-1) 
	{ 
		this.label_dests[breakName] = (spot >= 0) ? spot : this.writer.Tell(); 
	}
	
	//-----------------------
	// Writes the object's data
	//-----------------------
	
	SerializeSharedData()
	{
		this.writer.UInt32(this.writer.Tell() + 8);
	}
	
	//-----------------------
	// Serialize this particular object
	// (Override this!)
	//-----------------------
	
	Serialize()
	{
		// Handles item information and data
		super.Serialize();
		
		// Script begins with inline struct?
		this.usesDefaultArgs = false;
		this.handledDefaultArgs = false;
		
		// Reset labels
		this.label_starts = {};
		this.label_dests = {};
		
		// Reset conditional index
		this.conditionalIndex = 0;
		
		// Create a temporary script writer!
		// This is specific to our data, we want to isolate
		// the bytecode so we can handle it later
		
		var scriptWriter = new QBC.constants.Writer();
		scriptWriter.LE = true;
		
		this.SetWriter(scriptWriter);
		
		// Is our first child a newline?
		// If NOT, then that means we have struct args on the same line!
		if (this.children.length > 0)
		{
			var firstChild = this.children[0];
            
            // Ignore first-childs that are structs, these are bracketed default args
            if (!firstChild.IsStruct())
            {
                if (firstChild.GetValueText() != "newline")
                {
                    this.usesDefaultArgs = true;
                    this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_STARTSTRUCT);
                }
            }
		}
	}
	
	//-----------------------
	// Serialize a single child
	//-----------------------
	
	SerializeChild(child)
	{
		// Do we use inline default args?
		// This means that after our script, we have values
		// that are on a single line
		
		if (this.usesDefaultArgs)
		{
			var val = child.GetValueText();
			
			// If we've run into our first newline and
			// haven't yet closed off our default args, then
			// we need to close them off with a } and continue
			
			if (val == "newline" && !this.handledDefaultArgs)
			{
				this.handledDefaultArgs = true;
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ENDSTRUCT);
			}
		}
		
		super.SerializeChild(child);
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{
		// Store QBScript writer, we'll need this in a minute
		var dataWriter = this.writer;
		
		// If last byte is not newline, ensure that it is!
		if (this.writer.buffer[this.writer.buffer.length-1] != QBC.constants.ESCRIPTTOKEN_ENDOFLINE)
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ENDOFLINE);
		
		// Script end bytecode
		this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDSCRIPT);
		
		// Reset writer back to what it was before!
		this.SetWriter(this.job.writer);
        
		// -------------------
		
		this.Debug(this.id + " is " + dataWriter.buffer.length + " bytes long");
		
        if (!this.InStruct())
            this.writer.UInt32(0xBABEFACE);						// Script CRC, fix later(?)
        
        // -------------------
        
        // Before we finish writing our script, let's try compressing it with LZSS.
        // If our compressed size is less than our uncompressed size, then
        // we'll use our compressed version to save on space.
        //
        // BUT: We only do this if our Job supports it.
        
        var uncomBuffer = dataWriter.buffer;
        var uncomSize = uncomBuffer.length;
        var comBuffer = dataWriter.buffer;
        var comSize = uncomBuffer.length;
        
        if (QBC.constants.LZSS)
        {
            var canCompress = true;
            
            var noComFlag = this.job.GetTaskOption("noScriptCompression", false);
            
            if (!noComFlag)
            {
                var res = QBC.constants.LZSS.CompressBytes(uncomBuffer);
                
                if (res.result && res.result.length < uncomSize)
                {
                    comBuffer = res.result;
                    comSize = res.result.length;
                }
            }
        }
        
        // -------------------
        
        // In a struct? We do not write size.
        if (!this.InStruct())
        {
            this.writer.UInt32(uncomSize);		// Uncompressed size
            this.writer.UInt32(comSize);		// Compressed size
        }
        
        // If we ARE in a struct, we write our size
        // as the "item type" in our object.
        else
        {
            // Uncompressed size should always be a multiple of 4.
            // We'll start and end on a 4-byte boundary.
            
            var sizeGap = uncomSize % 4;
            if (sizeGap)
                uncomSize += (4 - sizeGap);
            
            var old_off = this.writer.Tell();
            this.writer.Seek(this.ptr_spawnOffset + 2);
            this.writer.UInt16(uncomSize);
            this.writer.Seek(old_off);
        }
		
		// Now append data bytes onto main script
		this.writer.Combine(comBuffer);
		
		// Align to 4byte boundary
		this.writer.PadToNearest(4);
        
        // Handles writing next item offset, etc.
		super.PostSerialize();
	}
}

module.exports = QBCScript;
