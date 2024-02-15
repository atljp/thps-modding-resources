// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Text reader class
// Are these a good idea? Do these get cleaned up? Hmm...
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class TextReader
{
	constructor(text)
	{
		this.text = text;
		this.offset = 0;
		
		// Temprary string
		this.tempstr = "";
	}
	
	//------------------------------------------------------------------
	
	Between(spotA, spotB) { return this.text.slice(spotA, spotB); }
	
	Letter(toTemp = true)
	{
		var ltr = this.text[this.offset]
		
		this.tempstr += toTemp ? ltr : "";
		this.offset ++;
		
		return ltr;
	}
	
	// Replaces a section between point A and point B
	// Offset gets set to point A
	
	ReplaceSection(spotA, spotB, replacer)
	{
		var sliceA = this.text.slice(1, spotA);
		var sliceB = this.text.slice(spotB);
		
		this.text = sliceA + replacer + sliceB;

		this.Seek(sliceA.length);
	}
	
	//------------------------------------------------------------------
	
	ResetTemp() { this.tempstr = ""; }
	
	AddText(str) { this.tempstr += str; }
	
	IsWhitespace(ccd)
	{
		return (ccd <= 32);
	}
	
	Seek(pos)
	{
		this.offset = pos;
	}
	
	Tell()
	{
		return this.offset;
	}
	
	CanRead()
	{
		return (this.offset < this.text.length);
	}
}

module.exports = TextReader;
