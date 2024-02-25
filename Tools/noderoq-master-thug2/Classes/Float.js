// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	F L O A T
// 		It's a number
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TFloat extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip first (
		scriptHandler.offset ++;
		
		// Value
		this.value = 0;
		
		if (NodeROQ.decompile)
		{
			this.value = scriptHandler.source.readFloatLE(scriptHandler.offset);
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
			return true;
				
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
		// We only care about the first number
		this.value = parseFloat(id);
		this.namesake = this.value.toString();
		
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// String
		NodeROQ.bytes.push(NodeROQ.ByteCode.FLOAT);
		
		var buf = Buffer.alloc(4);
		buf.writeFloatLE(this.value, 0);
		for (var b=0; b<buf.length; b++)
			NodeROQ.bytes.push(buf[b]);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO TEXT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		var txt = this.namesake.toString();
		if (txt.indexOf(".") == -1)
			txt += ".0";
			
		NodeROQ.text += "%f(" + txt.substring(0, 9) + ")";
	}
};

module.exports = TFloat;
