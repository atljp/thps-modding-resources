// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Floats, just vec3d (I think)
// Float, Float, Float
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBItemFloats extends QBItemBase
{
	//-----------------------------------
	// Initialize the unknown
	//-----------------------------------
	
	Initialize(opt)
	{
		this.values = opt.values || [];
		
		this.startRead = false;

		// No bytes provided, read from reader
		if (this.reader)
		{
			for (var f=0; f<this.DesiredFloats(); f++)
				this.values.push( this.reader.Float() );
				
			this.Finalize();
		}
	}
	
	//-----------------------------------
	// How many float values SHOULD we have?
	// This assumes we're reading from binary data
	//
	// Unless we're in StructItemFloatsX3, assume it's 2
	//-----------------------------------
	
	DesiredFloats()
	{
		if (this.parent && (this.parent.typeName == 'StructItemFloatsX3' 
			|| this.parent.typeName == 'ArrayFloatsX3'
			|| this.parent.typeName == 'SectionFloatsX3'))
			return 3;
			
		return 2;
	}
	
	//-----------------------------------
	// Convert this item to text-readable format!
	//-----------------------------------
	
	// Override this ToText function, please
	ToText()
	{
		var vals = [];
		
		for (var val of this.values)
			vals.push(val.toPrecision(6));
		
		var txt = "Floats [" + vals.join(", ") + "]";
		return txt;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// Square brackets are NOT allowed
		if (ccd == 91 || ccd == 93)
			return true;
			
		// No bads in section
		if (this.inSection)
			return false;
			
		return super.IsBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd)
	{
		//~ console.log(ccd);
		
		// Start bracket
		if (ccd == 91)
		{
			this.inSection = true;
			return true;
		}
			
		// End bracket
		if (ccd == 93 && this.inSection)
		{
			this.inSection = false;
			this.Finalize();
			return false;
		}
		
		return super.HandleBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		this.values = this.values || [];
		var spl = word.split(",");
		
		for (const blurb of spl)
		{
			var tr = blurb.trim();
			
			if (tr.length > 0)
				this.values.push( parseFloat(blurb.trim()) );
		}
		
		super.WordRead(r, word);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w)
	{
		w.UInt32(this.ByteType());
		
		for (var value of this.values)
			w.Float(value);
	}
}

module.exports = QBItemFloats;
