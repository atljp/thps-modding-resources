// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Struct header
// This is basically the start of a struct
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBItemStructHeader extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.qbType = ItemTypes.QBTypes.STRUCT;
		
		this.pointer = opt.pointer || 0;
		
		// If reading from a file...
		if (this.reader)
		{
			// Pointer to first struct item
			this.pointer = this.reader.UInt32()
			
			// This is an empty struct, hmm
			if (this.pointer == 0)
				this.Finalize();
				
			// Finalizes parent if pointer is 0
			this.FinalizeIf(this.pointer);
		}
	}
	
	//-----------------------------------
	// Don't touch
	//-----------------------------------
	
 	ToTextCore() 
	{ 
		// No items
		if (this.items.length <= 0)
			return this.Indent() + "StructHeader {}" + this.NewLine();
		
		return this.Indent() + "StructHeader" + this.NewLine() + this.Indent() + "{" + this.NewLine() + this.ChildText() + this.Indent() + "}" + this.NewLine();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
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
	
	ToBytes(w) 
	{ 
		w.UInt32(this.ByteType()); 
		
		// Next item!
		//~ this.WriteNext(w, w.Tell() + 4);
		
		// SCRATCH THAT, IT'S THE POINTER TO THE FIRST ITEM
		// But why?
		w.UInt32(this.items.length > 0 ? (w.Tell() + 4) : 0);
	}
}

module.exports = QBItemStructHeader;
