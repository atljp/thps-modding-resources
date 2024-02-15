// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Struct array
//
// Basically the same as SectionArray, but in a struct...?
// ItemId, Pointer, NextPointer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBItemStructArray extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.qbType = ItemTypes.QBTypes.ARRAY;
		
		// Struct!
		if (this.typeName == 'StructItemStruct')
			this.qbType = ItemTypes.QBTypes.STRUCT;
		
		this.finalizeOnChild = true;
		
		this.setID = false;
		this.id = opt.id || this.id || "00000000";
		this.pointer = opt.pointer || 0;
		this.nextPointer = opt.nextPointer || 0;
		
		// If reading from a file...
		if (this.reader)
		{
			// Read the ID
			this.id = this.reader.UInt32().toString(16).padStart(8, "0");
			
			this.setID = true;
			
			// Pointer to start of our section
			this.pointer = this.reader.UInt32()
			
			// Next item
			this.nextPointer = this.reader.UInt32()
		}
	}
	
	//-----------------------------------
	// What debug text?
	//-----------------------------------
	
	GetDebugText()
	{
		return super.GetDebugText() + " - " + this.id;
	}
	
	//-----------------------------------
	// Finalize the object
	//-----------------------------------
	
	Finalize() 
	{ 
        if (this.items.length)
        {
            var arr = this.items[0];
            
            if (arr.items.length <= 0 && (arr.values && arr.values.length <= 0))
                cons.error("[" + this.id + "] " + this.constructor.name + " had an empty array child. Please use a Floats item.");
        }
        
		super.Finalize();
		
		// Only close parent if we're reading binary
		if (this.reader)
			this.FinalizeIf(this.nextPointer);
	}

	//-----------------------------------
	// Don't touch
	//-----------------------------------
	
	ToTextCore() 
	{ 
		var tp = this.typeName;
		
		// Decide name
		switch (this.typeName)
		{
			case 'StructItemArray':
				tp = 'StructArray';
				break;
				
			case 'StructItemFloatsX3':
				tp = 'StructFloatX3';
				break;
				
			case 'StructItemFloatsX2':
				tp = 'StructFloatX2';
				break;	
			
			case 'StructItemStruct':
				tp = 'StructStruct';
				break;
		}
		
		return this.Indent() + tp + " " + this.GetID() + this.NewLine() + this.Indent() + "{" + this.NewLine() + this.ChildText() + this.Indent() + "}" + this.NewLine();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		// No ID yet, use the word!
		if (this.id == "00000000" && !this.setID)
		{
			this.setID = true;
			this.id = word;
			return;
		}

		// Not ID, do whatever
		super.WordRead(r, word);
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd)
	{
		// Start bracket
		if (ccd == 123)
		{
			this.inSection = true;
			return true;
		}
			
		// End bracket
		if (ccd == 125 && this.inSection)
		{
			this.inSection = false;
			this.Finalize();
			return true;
		}
		
		return super.HandleBadCharacter(r, ccd);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytesCore(w)
	{
		// Section identifier
		w.UInt32(this.ByteType());
		
		// QBkey ID
		w.UInt32(this.ByteID());
		
		// Pointer to array
		w.UInt32(w.Tell() + 8);
		
		// NextItem pointer
		// Technically this is first item, I think?
		var niP = w.Tell();
		w.UInt32(0);
		
		// Children!
		this.ChildBytes(w);
		
		// finish our nextitem pointer
		var afterPointer = w.Tell();
		w.Seek(niP);
		
		this.WriteNext(w, afterPointer);
		w.Seek(afterPointer);
	}
}

module.exports = QBItemStructArray;
