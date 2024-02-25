// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	C O M M E N T
// 		It's just a comment, this is totally ignored
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TComment extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Block comment?
		this.block = opt.block || false;
		
		// Skip first // or /*
		scriptHandler.offset += 2;

		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE A BAD CHARACTER
	// The only bad character hashes can have is a $
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseBadCharacter(char)
	{
		this.stopRead = true;
		return true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// IS THIS A BAD CHARACTER?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{
		// Comments are terminated with newlines
		if ((cc == 10 || cc == 13) && !this.block)
			return true;
			
		// If it's a / and the PREVIOUS character was a * then it's bad
		if (this.block && cc == 47)
		{
			var lastChar = scriptHandler.source.charCodeAt(scriptHandler.offset-1);
			if (lastChar == 42)
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
	
	ParseIdentifier(id) { return false; }
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes() {}
};

module.exports = TComment;
