// ---------------------------------------------------
//
//	STRUCT
//	A struct, contains lots of things!
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCStruct extends ItemCore
{
	GetItemInfoType() { return QBC.constants.TypeBindings['Struct']; }
	IsStruct() { return true; }
	
	Read() 
	{
		if (this.InScript())
		{
			while (this.ReadAllowed())
				this.ReadScriptToken();
				
			return;
		}
		
		// ------------
		
		this.ptr_structStart = this.reader.Tell();
		
		// If we're headerless, we're not interested in shared
		// properties AT ALL! We want to read straight from
		// the structure header
		
		if (this.sharedAllowed)
			this.ReadSharedProperties();
			
		// Skip to start of structure
		this.reader.Seek(this.ptr_structStart);
		
		// Header marker here!
        this.reader.UInt8();
        this.reader.UInt8();
        var hdr = this.reader.UInt8();
        this.reader.UInt8();
        
		if (hdr != 1)
		{
			this.Fail("Structure did not contain header bytes.");
			return;
		}
		
		var ptr_first_item = this.reader.UInt32();
		
		if (ptr_first_item > 0)
		{
			this.reader.Seek(ptr_first_item);
			
			// Keep reading children until the last child's next item ptr is 0
			while (this.ReadAllowed())
			{
				var child = this.ReadObject();
				if (child && !child.ptr_nextItem)
					break;
			}
		}
	}
	
	ReadSharedValue() { this.ptr_structStart = this.reader.UInt32(); }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T   O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Is this object type a
	// single-line object?
	//-----------------------
	
	IsSingleLine() { return false; }
	
	//-----------------------
	// Internal write, DO NOT CALL
	//-----------------------
	_WriteText()
	{
        var singleLine = this.HasOnlySingleLineChildren();
        
		this.WriteIDString();
		
        // Empty struct.
        if (this.children.length <= 0)
            this.AddText("{}");

        // Plain multi-line struct.
        else if (!singleLine)
        {
            this.AddText("{");
                this.AddIndent();
                
                if (this.CanAutoCreateNewlines())
                    this.AddLine();
                
                for (const child of this.children)
                    child._WriteText();
                
                this.SubIndent();
                
            this.AddText("}");
        }
        
        // Beautiful single line struct.
        else
        {
            this.AddText("{ ");

            for (const child of this.children)
                child._WriteText();
                
            this.AddText(" }");
        }
        
        if (this.CanAutoCreateNewlines())
            this.AddLine();
		
		this.PostWriteText();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Serialize this particular object
	// (Override this!)
	//-----------------------
	
	Serialize()
	{
		if (this.InScript())
		{
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_STARTSTRUCT);
			return;
		}
		
		super.Serialize();
	}
	
	//-----------------------
	// Writes the object's data
	//-----------------------
	
	SerializeSharedData()
	{
		// Start of the "StructHeader" object
		if (!this.InArray())
			this.writer.UInt32(this.writer.Tell() + 8);
	}
	
	//-----------------------
	// Serialize PakQB info for the struct
	//-----------------------
	
	SerializeStructPakInfo() { return true; }

	//-----------------------
	// Serialize the main object's data
	// (Override this!)
	//-----------------------
	
	SerializeData()
	{
		if (this.SerializeStructPakInfo())
			super.SerializeData();
		
		// "StructHeader" object type
        this.writer.UInt8(0);
        this.writer.UInt8(0);
        this.writer.UInt8(1);
        this.writer.UInt8(0);
		
		// Offset to our first item
        if (this.children.length > 0)
            this.writer.UInt32(this.writer.Tell() + 4);
        else
            this.writer.UInt32(0);
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{	
		// Important for next-item in structs
		super.PostSerialize();
		
		if (this.InScript())
		{
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ENDSTRUCT);
			return;
		}
	}
}

module.exports = QBCStruct;
