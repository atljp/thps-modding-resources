// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	L A B E L
// 		An actual label marker, mostly for post-compile things
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TLabel extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		if (NodeROQ.decompile)
		{
			this.Finalize();
			return;
		}
		
		// Skip initial (
		scriptHandler.offset ++;
		
		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// IS THIS A BAD CHARACTER?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{
		// Closing parentheses
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
		this.namesake = id;
		
		// Skip )
		scriptHandler.offset ++;
		
		this.Finalize();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// Labels are only used for storing offsets
		NodeROQ.scratchpad.labels[this.namesake] = NodeROQ.bytes.length;
	}
	
	ToText()
	{
		NodeROQ.TextNewLine();
		NodeROQ.text += ":POS(" + this.namesake + ") ";
		NodeROQ.TextNewLine();
	}
};

module.exports = TLabel;
