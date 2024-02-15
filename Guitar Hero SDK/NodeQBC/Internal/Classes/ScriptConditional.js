// ---------------------------------------------------
//
//	CONDITIONAL
//	Used in scripts
//
//	This is essentially an entire "if" block,
//	it is a wrapper that contains keywords for our markers
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBScriptConditional extends ItemCore
{
	Initialize() {}
	IsConditional() { return true; }
	IsSingleLine() { return false; }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	Read() 
	{
		var jumpAmount = this.reader.UInt16();
		
		while (this.ReadAllowed())
			this.ReadScriptToken();
			
		return;
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
	
	SerializeSharedData()
	{
		this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_FASTIF);
		
		// We will fill this in later, don't worry
		// (Short jump to our next comparison)
		this.writer.UInt16(0);
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{
		super.PostSerialize();
		
		var oldOff = this.writer.Tell();
		
		// -----------
		
		// Create a list of our comparisons, and their types
		var comparisons = [
			[this.ptr_spawnOffset, "if"]
		];
		
		// We should only have ONE else max in our conditional
		var elseCount = 0;
		
		for (const child of this.children)
		{
			var val = child.GetValueText();
			
			if (val == "else")
			{
				elseCount ++;
				if (elseCount > 1)
				{
					this.Fail("Conditional had more than one 'else'.");
					return;
				}
			}
			
			if (val == "elseif" || val == "else")
				comparisons.push([child.ptr_spawnOffset, val]);
		}
		
		// We had an else, but it was not the last comparison!
		if (elseCount > 0 && comparisons.length > 0 && comparisons[comparisons.length-1][1] != "else")
		{
			this.Fail("Conditional had an 'else' but it was not the last comparison.");
			return;
		}
		
		comparisons.push([this.writer.Tell(), "endif"]);
		
		// -----------
		
		// Now that we have the start locations of
		// each comparison, let's fix up their jump offsets
		
		for (var c=0; c<comparisons.length; c++)
		{
			var comSpot = comparisons[c][0];
			var comType = comparisons[c][1];
			
			// Get offset to next comparison's code
			// (This is after the token and jump)
			
			var nextOff = 0;
			
			if (c < comparisons.length-1)
			{
				var nextCom = comparisons[c+1];
				
				// STRAIGHT TO THE ELSEIF
                // After this return false, we want to do ANOTHER check.
				if (nextCom[1] == "elseif")
					nextOff = nextCom[0];
					
				// token
				else if (nextCom[1] == "endif")
					nextOff = nextCom[0] + 1;
					
				// token, jump
				else
					nextOff = nextCom[0] + 3;
			}
			
			// Prepare to write the offset after the token
			var offSpot = comSpot+1;
			this.writer.Seek(offSpot);
			
			switch (comType)
			{
				// Contains jump to next comparison
				case "if":
					this.writer.UInt16(nextOff - this.writer.Tell());
					break;
					
				// Contains jump to next comparison, and jump to endif
				case "elseif":
				
					// Next comparison
					this.writer.UInt16(nextOff - this.writer.Tell());
					
					// Last offset
					var lastOff = comparisons[comparisons.length-1][0] + 1;
					this.writer.UInt16(lastOff - this.writer.Tell());
					
					break;
					
				// Contains jump to endif
				case "else":
				
					// Last offset
					var lastOff = comparisons[comparisons.length-1][0] + 1;
					this.writer.UInt16(lastOff - this.writer.Tell());
					
					break;
			}
		}
		
		// -----------
		
		this.writer.Seek(oldOff);
		this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDIF);
	}
	
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
		this.job.AddText("if ");
        this.job.AddIndent();
	}
	
	//-----------------------
	// Done writing text
	//-----------------------
	
	PostWriteText()
	{
		if (this.job.Failed())
			return;
			
		super.PostWriteText();
		
        this.job.SubIndent()
		this.job.AddText("endif");
	}
}

module.exports = QBScriptConditional;
