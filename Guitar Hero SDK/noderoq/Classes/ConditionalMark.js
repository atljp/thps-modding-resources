// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	C O N D I T I O N A L   M A R K
// 		if, else, etc.
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

const codes = {
	'if': NodeROQ.ByteCode.IF,
	'else': NodeROQ.ByteCode.ELSE,
	'elseif': NodeROQ.ByteCode.ELSEIF,
	'case': NodeROQ.ByteCode.CASE,
	'default': NodeROQ.ByteCode.CASE_DEFAULT
};

// Elseif's offset is to the start of the else block, if it exists
// Elseif also has an offset to the END of the entire conditional!

class TConditionalMark extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);

		// Is it a case mark?
		this.caseMark = opt.caseMark || false;
		
		this.isElseif = (opt.namesake.toLowerCase() == 'elseif');

		if (this.parent)
			this.parent.identifiers.push(this);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		NodeROQ.bytes.push(codes[this.namesake]);
		
		// Case marks use an ACTUAL short offset
		if (this.caseMark)
			NodeROQ.bytes.push(NodeROQ.ByteCode.SHORT_BREAK);
		
		// Push some temp-bytes for our short offset
		NodeROQ.bytes.push(0x88);
		NodeROQ.bytes.push(0x88);
		
		// Push some temp-bytes for our post-conditional offset if we're elseif
		if (this.isElseif)
		{
			NodeROQ.bytes.push(0x88);
			NodeROQ.bytes.push(0x88);
		}
	}
};

module.exports = TConditionalMark;
