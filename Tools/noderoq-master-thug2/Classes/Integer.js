// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	I N T E G E R
// 		It's a number
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TInteger extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip first ( or 0x17
		scriptHandler.offset ++;
		
		this.badNumber = false;
		this.completed = false;
		
		// Value
		this.value = 0;
		
		if (NodeROQ.decompile)
		{
			this.value = scriptHandler.source.readUInt32LE(scriptHandler.offset);
			this.namesake = this.value.toString();
		
			scriptHandler.offset += 4;
			this.completed = true;
			this.Finalize();
			return;
		}

		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE A BAD CHARACTER
	// The only bad character hashes can have is a $
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseBadCharacter(char)
	{
		this.Finalize();
		return true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// IS THIS A BAD CHARACTER?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{		
		// Right parentheses, CLOSE OUR INTEGER
		if (cc == 41)
		{
			this.completed = true;
			return true;
		}
		
		// Hyphens and whitespace are totally valid
		if (cc < 10 || cc == 45)
			return false;
			
		// Hex numbers are fine
		if ((cc >= 48 && cc <= 57) || (cc >= 97 && cc <= 102) || (cc >= 65 && cc <= 70))
			return false;
			
		// Commas are also fine
		if (cc == 44)
			return false;
			
		// If it's anything besides a number or hex number, it's erroneous
		if (cc < 48 || cc > 57)
		{
			this.completed = false;
			return true;
		}
				
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE AN IDENTIFIER
	// Return true if we'd like to push it
	//
	// This can be used for parsing certain things like mod, etc.
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseIdentifier(id)
	{
		var spl = id.split(",");
		
		// We only care about the first number
		this.value = parseInt(spl[0]);
		
		if (this.value == NaN)
			this.badNumber = true;
		
		// Negative? If so, wrap around
		if (this.value < 0)
			this.value = 4294967295 + this.value;
		
		this.namesake = this.value.toString();
		
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// String
		NodeROQ.bytes.push(NodeROQ.ByteCode.INTEGER);
		
		var buf = NodeROQ.UInt32Buffer(this.value);
		for (var b=0; b<buf.length; b++)
			NodeROQ.bytes.push(buf[b]);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// RETRIEVE ANY ERRORS / WARNINGS FROM THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CheckValidity()
	{
		if (this.badNumber)
			NodeROQ.AddError("Invalid integer: " + this.namesake, this.startLine, true);
			
		if (!this.completed)
			NodeROQ.AddError("Malformed / unclosed integer: " + this.namesake, this.startLine, true);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT IT TO TEXT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		var b = Buffer.alloc(4);
		b.writeUInt32BE(parseInt(this.namesake), 0);
		
		if (NodeROQ.tidy)
			NodeROQ.text += "%i(" + this.namesake + ")";
		else
			NodeROQ.text += "%i(" + this.namesake + "," + b.toString('hex') + ")";
	}
};

module.exports = TInteger;
