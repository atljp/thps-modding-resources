// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	V E C T O R
// 		It's a number
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TVector extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip first ( or 0x1E
		scriptHandler.offset ++;
		
		// Value
		this.values = [];
		
		if (NodeROQ.decompile)
		{
			for (var v=0; v<3; v++)
			{
				this.values.push(NodeROQ.source.readFloatLE(scriptHandler.offset));
				scriptHandler.offset += 4;
			}
			
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
		this.values = [];
		
		var vals = id.split(",");
		
		for (const v in vals)
			this.values.push(parseFloat(vals[v]));
			
		this.namesake = this.values.join(",");
		
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		NodeROQ.bytes.push(NodeROQ.ByteCode.VEC3);
		
		for (const v in this.values)
		{
			var buf = Buffer.alloc(4);
			buf.writeFloatLE(this.values[v], 0);
			for (var b=0; b<buf.length; b++)
				NodeROQ.bytes.push(buf[b]);
		}
	}
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO TEXT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		var vals = [];
		
		for (var v=0; v<this.values.length; v++)
		{
			var txt = this.values[v].toString();
			if (txt.indexOf(".") == -1)
				txt += ".0";
				
			vals.push(txt.substring(0.9));
		}
			
		NodeROQ.text += "%vec3(" + vals.join(",") + ")";
		super.ToText();
	}
};

module.exports = TVector;
