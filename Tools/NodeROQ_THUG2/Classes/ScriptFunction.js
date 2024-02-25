// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S C R I P T   F U N C T I O N
// 		Function, ended by endfunction
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TFunction extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		this.completed = false;
		this.ParseSourceCode();
	}
	
	ParseIdentifier(id)
	{
		if (id.toLowerCase() == 'endfunction')
		{
			this.completed = true;
			this.Finalize();
			return false;
		}
		
		if (scriptHandler.offset >= scriptHandler.source.length-1)
		{
			if (!this.completed)
				NodeROQ.AddError("Function exists without endfunction!", this.startLine, true);
		}
		
		return super.ParseIdentifier(id);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		NodeROQ.bytes.push(NodeROQ.ByteCode.FUNCTION_START)
		
		super.ToBytes();
		
		NodeROQ.bytes.push(NodeROQ.ByteCode.FUNCTION_END)
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// RETRIEVE ANY ERRORS / WARNINGS FROM THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CheckValidity()
	{
		if (!this.completed)
			NodeROQ.AddError("Function exists without endfunction!", this.startLine, true);
			
		// Our first identifier is not a checksum!
		if (this.identifiers.length > 0)
		{
			if (this.identifiers[0].constructor.name !== 'TSymbolHash')
				NodeROQ.AddError("Function might be missing checksum name!", this.startLine);
		}
	}
};

module.exports = TFunction;
