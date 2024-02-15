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
		
		// Wide string?
		this.wide = (opt && opt.wide) || false;
		
		// BYTE HANDLER
		if (NodeROQ.decompile)
		{
			// Skip 0x1B
			scriptHandler.offset ++;
			
			this.length = NodeROQ.source.readUInt32LE(scriptHandler.offset);
			scriptHandler.offset += 4;
			
			var start = scriptHandler.offset;
			var tempstr = "";
			var ccd = 0;
			
			var byteCount = this.wide ? (Math.floor(this.length / 2) - 1) : (this.length - 1);
			
			for (var t=0; t<byteCount; t++)
			{
				if (this.wide)
					ccd = NodeROQ.source.readUInt16BE(start + (2*t));
				else
					ccd = NodeROQ.source[start+t];
					
				tempstr += String.fromCharCode(ccd);
			}
			
			this.namesake = tempstr;
			
			this.completed = true;
			scriptHandler.offset += this.length;
			this.Finalize();
			return;
		}
		
		// Is this a %s string?
		// (Strict strings are %s strings)
		this.strictString = opt.strict == undefined ? true : opt.strict;
		
		// We're parsing our string!
		// Non-strict strings begin stringing!
		// Otherwise, we wait for first quote
		this.stringing = !this.strictString || false;
		
		this.lastQuotePos = 0;
		
		// Skip first (
		if (this.strictString)
			scriptHandler.offset ++;

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
		// It's a quote, either start or stop our string!
		if (cc == 34 && !this.completed)
		{
			// GROSS HACK
			// (Why is BadCharacter for quotes checked twice?)
			
			if (scriptHandler.offset != this.lastQuotePos)
			{
				this.lastQuotePos = scriptHandler.offset;
				
				// Not in a string yet, start one!
				if (!this.stringing)
					this.stringing = true;
					
				// Otherwise, should we end one?
				else
				{
					// NON-STRICT STRINGS END AT QUOTES!
					if (!this.strictString)
						return true;
						
					this.completed = true;
					this.stringing = false;
				}
				
				return false;
			}
		}
		
		// In a string, anything goes!
		if (this.stringing)
			return false;
		
		// Right parentheses, CLOSE OUR STRING OBJECT
		if (cc == 41)
		{
			if (this.completed)
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
        {
            if (this.wide)
            {
                var ccd = this.namesake.charCodeAt(s);
                var buf = NodeROQ.UInt16Buffer(ccd);
                
                for (var b=0; b<buf.length; b++)
                    NodeROQ.bytes.push(buf[b]);
            }
            else
                NodeROQ.bytes.push(this.namesake.charCodeAt(s));
        }
			
		// Null term
		NodeROQ.bytes.push(0x00);
        
        if (this.wide)
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
