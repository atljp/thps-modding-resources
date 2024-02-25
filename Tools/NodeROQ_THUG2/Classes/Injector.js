// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	I N J E C T O R
// 		Allows injecting plaintext script data
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TInjector extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		this.toInject = "";
		this.par = false;
		
		this.pos_start = scriptHandler.offset - "Inject".length;
		
		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE A BAD CHARACTER
	// The only bad character hashes can have is a $
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseBadCharacter(char)
	{
		if (char == ')')
		{
			this.pos_end = scriptHandler.offset + 1;
			
			// Determine the text we'd like to replace it with
			var replacer = "";
			
			// Allow GHSDK to inject code, if available
			if (global.GHSDK)
			{
				var inj = GHSDK.QBHandler.GetInjector(this.toInject);
				if (inj)
					replacer = inj() || "";
			}

			scriptHandler.ReplaceSection(this.pos_start, this.pos_end, replacer);
			
			this.stopRead = true;
			return false;
		}
		
		return true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// IS THIS A BAD CHARACTER?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{
		// Left parentheses, start
		if (cc == 40)
			return true;
			
		// Right parentheses, close
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
		if (!this.toInject)
			this.toInject = id.trim();
			
		return false; 
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes() {
		console.log(this.toInject);
	}
};

module.exports = TInjector;
