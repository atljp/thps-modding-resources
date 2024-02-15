// ---------------------------------------------------
//
//	SWITCH
//	Used in scripts
//
//	This is your typical switch with cases, easy
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBScriptSwitch extends ItemCore
{
	Initialize() {}
	IsSwitch() { return true; }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	SerializeSharedData()
	{
		this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_SWITCH);
	}
	
	//-----------------------
	// Serialize this particular object
	// (Override this!)
	//-----------------------
	
	// When we start serializing, let's set up some 
	// important values that we'll patch later
	
	Serialize()
	{
		// Stores case offsets, we'll patch these after
		// and fix the appropriate short breaks in them
		this.ser_cases = [];
		
		// Stores endswitch offsets, these should always
		// jump to our endswitch statement
		this.ser_ends = [];
		
		super.Serialize();
	}
	
	//-----------------------
	// Serialize a single child
	//-----------------------
	
	SerializeChild(child)
	{
		var val = child.GetValueText();
		
		// Are we ABOUT to serialize a case or default?
		// If so, we should do some special handling before!
		
		if (val == "case" || val == "default")
		{
			// If have at least 1 ser_cases, then we've ENTERED a case!
			// This is important to push the shortbreak for our PREVIOUS case
			
			if (this.ser_cases.length > 0)
			{
				this.ser_ends.push(this.writer.Tell());
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_SHORTJUMP);
				this.writer.UInt16(0);
			}
			
			// Store the starting position of this case for later
			
			this.ser_cases.push(this.writer.Tell());
		}
		
		super.SerializeChild(child);
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{
		super.PostSerialize();
		
		// Store the position of our endswitch token,
		// this will be used as the jump to our last "case"
		
		var endOff = this.writer.Tell();
		
		// Whoa there, we had no cases at all! Obviously a switch needs some
		
		if (this.ser_cases.length <= 0)
		{
			this.Fail("Switch statement had no cases or defaults at all!");
			return false;
		}

		// Last "case" will be our endswitch
		// (We want the offset of the next spot to jump, lazy hack)
		
		this.ser_cases.push(endOff);
		
		// -----------
		
		// Now that we have the start locations of
		// each case, let's fix up their jump offsets
		
		for (var c=0; c<this.ser_cases.length-1; c++)
		{
			var thisOff = this.ser_cases[c];
			var nextOff = this.ser_cases[c+1];
			
			// CASE, SHORTJUMP
			this.writer.Seek(thisOff + 2);
			this.writer.UInt16(nextOff - this.writer.Tell());
		}
		
		// -----------
		
		// Loop through our endswitch jumps and patch them up!
		
		for (var e=0; e<this.ser_ends.length; e++)
		{
			var thisEnd = this.ser_ends[e];
			
			// SHORTJUMP
			this.writer.Seek(thisEnd+1);
			this.writer.UInt16((endOff+1) - this.writer.Tell());
            
            // ^ We do +1 because we want to skip PAST the endswitch ^
		}
		
		// -----------
		
		// Finally, write our endswitch token
		
		this.writer.Seek(endOff);
		this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDSWITCH);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Begin reading from data
	//-----------------------
	
	Read() 
	{
		while (this.ReadAllowed())
			this.ReadScriptToken();
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
		this.job.AddText("switch ");
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
		
        this.job.SubIndent();
		this.job.AddText("endswitch");
	}
	
	IsSingleLine() { return false; }
}

module.exports = QBScriptSwitch;
