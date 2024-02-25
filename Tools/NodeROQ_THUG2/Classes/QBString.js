// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	Q B   S T R I N G
// 		Dynamic QB string
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TQBString extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip initial $ or 0x16
		scriptHandler.offset ++;
		
		this.allowRandoms = false;
		
		// Has this been completed?
		this.completed = false;
		
		// Is this a RAW hash? Has brackets
		this.raw = false;
		
		// Is it a QB string hash?
		this.qbString = opt.qbString || false;
		
		// Raw bytes
		this.rawBytes = [];
		
		// Start parsing source code
		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// FINALIZE THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	Finalize()
	{
		if (NodeROQ.decompile)
		{
			this.namesake = '';
			for (var byte of this.rawBytes)
			{
				// Reverse 'em! Little Endian
				this.namesake = byte.toString(16).padStart(2, '0') + this.namesake;
			}
		}
		
		if (this.namesake.indexOf("[") !== -1 || this.namesake.indexOf("0x") == 0)
			this.raw = true;
			
		// HACK: Determine if namesake is raw by analyzing
		if (this.namesake.length == 8)
		{
			var isHex = true;
			var tlc = this.namesake.toLowerCase();
			
			for (var l=0; l<tlc.length; l++)
			{
				var cc = tlc.charCodeAt(l);
				if ((cc >= 48 && cc <= 57) || (cc >= 97 && cc <= 102))
					continue;
					
				isHex = false;
			}
			
			if (isHex)
				this.raw = true;
		}
			
		super.Finalize();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// NEVER A BAD CHARACTER UNLESS IT'S A $
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{			
		// Dollar sign, or ^
		if (cc == 36 || (this.qbString && cc == 94))
		{
			this.completed = true;
			return true;
		}
		
		// There are some things which can erroneously break a hash
		// Newlines and =
		if (cc == 10 || cc == 61)
			return true;
				
		return false;
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
	// PARSE AN IDENTIFIER
	// Return true if we'd like to push it
	//
	// This can be used for parsing certain things like mod, etc.
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseIdentifier(id)
	{
		this.namesake = id;
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		var TLC = this.namesake.toLowerCase();
		
		// pParams is a special hash
		if (TLC == 'pparams')
		{
			NodeROQ.bytes.push(NodeROQ.ByteCode.ALL_ARGS);
			return;
		}
		
		NodeROQ.bytes.push(this.qbString ? NodeROQ.ByteCode.QB_STRING : NodeROQ.ByteCode.SYMBOL_HASH);
		
		// This is a RAW hash! Meaning we don't want the QBkey, we just want what it is!
		if (this.raw)
		{
			var hasBrack = (this.namesake.indexOf("[") == 0);
			
			var NS = hasBrack ? this.namesake.slice(1, this.namesake.length-1) : this.namesake;
			var buf = Buffer.from(NS, 'hex');
			
			// Reverse it
			for (var b=buf.length-1; b>=0; b--)
				NodeROQ.bytes.push(buf[b]);
			
			return;
		}
		
		// Convert our namesake to qb - This exports it into reversed little endian byte format
		var qb = NodeROQ.QBKey(this.namesake);
		
		// Store checksum for debug symbols
		// Even if it's a different case, we only store it once
		if (!NodeROQ.scratchpad.lowsums[TLC])
		{
			NodeROQ.scratchpad.checksums[this.namesake] = qb;
			NodeROQ.scratchpad.lowsums[TLC] = true;
		}
		
		for (var b=0; b<qb.length; b++)
			NodeROQ.bytes.push(qb[b]);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// RETRIEVE ANY ERRORS / WARNINGS FROM THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CheckValidity()
	{
		if (!this.completed)
			NodeROQ.AddError("QBKey checksum was unclosed: " + this.namesake, this.startLine, true);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// IS THIS A GOOD BYTE?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	GoodByte(byte)
	{
		// Cut it off!
		if (this.rawBytes.length >= 4)
		{
			this.completed = true;
			this.canRead = false;
			this.Finalize();
			return true;
		}
		
		// Good!
		this.rawBytes.push(byte);
		scriptHandler.offset ++;
		return true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT IT TO TEXT!
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		var NS = this.namesake.padStart(8, '0');
		NodeROQ.text += "^" + NS + "^";
	}
};

module.exports = TQBString;
