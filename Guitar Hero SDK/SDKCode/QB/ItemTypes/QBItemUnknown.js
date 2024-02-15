// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Unknown! What is this? No idea
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

// Typical
const GHWTHeader = '1c0802041004080c0c0802041402040c10100c00';
const GHWTText = 'GHWT_HEADER';

class QBItemUnknown extends QBItemBase
{
	//-----------------------------------
	// Initialize the unknown
	//-----------------------------------
	
	Initialize(opt)
	{
		this.extraBytes = new GHSDK.Constants.Writer();
		
		// Match endian-ness with that of the reader
		this.extraBytes.LE = (CurrentQBReader && CurrentQBReader.reader && CurrentQBReader.reader.LE) || false;

		// No bytes provided, read from reader
		if (!opt.bytes && this.reader)
			this.extraBytes.UInt32(opt.type || 0);
			
		// We have bytes!
		else
		{
			this.startRead = false;
			this.extraBytes = new GHSDK.Constants.Writer();
			
			if (opt.bytes)
			{
				for (var byte of opt.bytes)
					this.extraBytes.UInt8(byte);
			}
		}
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
		var bf = this.extraBytes.buffer.toString("hex");
		
		if (bf == GHWTHeader)
			bf = GHWTText;
		
		var txt = "Unknown [" + bf + "]";
		return txt;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// SQUARE BRACKETS ARE ALLOWED!
		// They surround our bytes, you know
		
		if (ccd == 91 || ccd == 93)
			return false;
			
		return super.IsBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		// Starts and ends with brackets
		// This **SHOULD** be our bytes, let's see...
		
		if (word[0] == "[" && word[word.length-1] == "]")
		{
			var slice = word.slice(1, word.length-1);
			
			// Is it GHWT?
			if (slice == GHWTText)
				slice = GHWTHeader;
			
			var theBytes = Buffer.from(slice, 'hex');
			this.extraBytes.Combine(theBytes);
			this.Finalize();
			return;
		}
		
		super.WordRead(r, word);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w)
	{
		w.Combine(this.extraBytes.buffer);
	}
}

module.exports = QBItemUnknown;
