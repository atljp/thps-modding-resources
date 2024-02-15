// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Comment!
// This is actually left out of compile
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBComment extends QBItemBase
{
	AddToParent(obj) {}
	
	//-----------------------------------
	// Initialize the unknown
	//-----------------------------------
	
	Initialize(opt)
	{
		this.block = opt.block || false;
	}
	
	//-----------------------------------
	// Can we create a new item?
	//-----------------------------------
	
	CanCreateItem(r, foundItem)
	{
		// Is it a valid type? If so, dial it back and end our unknown
		if (foundItem.itemName !== 'Unknown')
		{
			r.Seek( r.Tell() - 4 );
			this.Finalize();
			
			return false;
		}
		
		this.extraBytes.UInt32(foundItem.itemNumber);
		
		// Don't create any more unknowns, stick with this one
		return false;
	}
	
	//-----------------------------------
	// Convert this item to text-readable format!
	//-----------------------------------
	
	// Override this ToText function, please
	ToText()
	{
		var txt = "Unknown [" + this.extraBytes.buffer.toString("hex") + "]";
		return txt;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// Newline will end our comment!
		
		if (!this.block && (ccd == 13 || ccd == 10))
			return true;
			
		// It's a slash, parse uniquely if we're in block
		if (this.block && ccd == 47)
		{
			// Back to letter before previous, was it an asterisk?
			
			var off = r.Tell();
			r.Seek(off-2);
			var ltr = r.Letter(false);
			r.Seek(off);
			
			var ccdB = ltr.charCodeAt(0);
			
			if (ccdB == 42)
				return true;
		}
			
		return false;
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd) 
	{ 
		this.Finalize();
		return true;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

	ToBytes(w) {}
}

module.exports = QBComment;
