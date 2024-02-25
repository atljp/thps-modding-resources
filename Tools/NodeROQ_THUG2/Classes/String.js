// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S T R I N G
// 		It's a string, not that difficult
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TString extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// 0x1C string
		this.alt = opt.alt;
		
		this.completed = false;
		
		this.allowRandoms = false;
		
		// Skip first ( or 0x1B
		scriptHandler.offset ++;
		
		// BYTE HANDLER
		if (NodeROQ.decompile)
		{
			this.length = NodeROQ.source.readUInt32LE(scriptHandler.offset);
			scriptHandler.offset += 4;
			
			this.namesake = NodeROQ.source.slice(scriptHandler.offset, scriptHandler.offset+(this.length-1)).toString('ascii');
			
			this.completed = true;
			scriptHandler.offset += this.length;
			this.Finalize();
			return;
		}
		
		// Is this a %s string?
		this.strictString = opt.strict == undefined ? true : opt.strict;
		
		// We're parsing our string
		this.stringing = !this.strictString || false;
		
		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE A BAD CHARACTER
	// The only bad character hashes can have is a $
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseBadCharacter(char)
	{
		this.stringing = false;
		this.Finalize();
		return true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// IS THIS A BAD CHARACTER?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{
		// It's a quote, either start or stop our string
		if (cc == 34)
		{
			// We have a full string
			if (this.stringing)
				this.completed = true;
				
			// NON-STRICT STRINGS END AT QUOTES
			if (!this.strictString)
				return true;
			
			this.stringing = !this.stringing;
			return false;
		}
		
		// In a string, anything goes
		if (this.stringing && !this.completed)
			return false;
		
		// Right parentheses, CLOSE OUR STRING
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
		// Non-strict strings use the whole identifier
		if (!this.strictString)
		{
			if (!this.completed)
				NodeROQ.AddError("String was unclosed: " + id.replace(/\n/g, ''), this.startLine, true);
			
			this.namesake = id;
			return false;
		}
		
		// First, let's try to find our string in quotes
		var stringy = id.match(/\".+\"/g);
		
		// Wait a minute, is it an empty string?
		if (id.indexOf('""') !== -1)
			stringy = ['""'];
		
		if (!stringy)
		{
			NodeROQ.AddError("String was malformed: " + id, this.startLine, true);
			return false;
		}
		
		var theString = stringy[0].replace(/\"/g, '');
		id = id.replace(stringy[0], '');
		
		// We could parse the length but honestly, it's not important
		// We'll get it from the string anyway, so it's sort of optional
		
		this.namesake = theString;
		
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// String
		NodeROQ.bytes.push(this.alt ? NodeROQ.ByteCode.STRING_UNKNOWN : NodeROQ.ByteCode.STRING);
		
		// Length
		// +1 for null character
		var buf = NodeROQ.UInt32Buffer(this.namesake.length+1);
		for (var b=0; b<buf.length; b++)
			NodeROQ.bytes.push(buf[b]);
			
		// The actual string
		for (var s=0; s<this.namesake.length; s++)
			NodeROQ.bytes.push(this.namesake.charCodeAt(s));
			
		// Null term
		NodeROQ.bytes.push(0x00);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// RETRIEVE ANY ERRORS / WARNINGS FROM THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CheckValidity()
	{
		if (!this.completed || this.stringing)
			NodeROQ.AddError("String was unclosed: " + this.namesake, this.startLine, true);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT TO TEXT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		if (NodeROQ.tidy)
			NodeROQ.text += "%s(\"" + this.namesake + "\")";
		else
			NodeROQ.text += "%s(" + this.namesake.length + ",\"" + this.namesake + "\")";
	}
};

module.exports = TString;
