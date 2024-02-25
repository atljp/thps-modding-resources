// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
// S C R I P T   M A I N   H A N D L E R
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class TScriptHandler extends NodeROQ.CompilerTypes.Core
{
	constructor(opt = {}) {

		super(opt); 
		
		this.InitCompilerVars();
		this.source = opt.source;
		this.canRead = true;
		
		this.ParseSourceCode();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// INITIALIZE BASELINE COMPILER VARIABLES
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	InitCompilerVars()
	{
		global.scriptHandler = this;
		
		// How far along we are in our source buffer
		this.offset = 0;
		
		// Store the index of the switch statement we're on
		// We can increment this as time goes on and refer
		// to switch statements uniquely by their ID
		this.switchIndex = 0;
		
		// Do the same with switches, but for conditionals
		this.conditionalIndex = 0;
		
		// Which line are we on?
		this.line = 1;
		
		// Indents
		this.indent = 0;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CAN WE KEEP READING? BASICALLY NOT EOF
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CanRead()
	{
		return (this.offset < this.source.length && this.canRead);
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		super.ToBytes();
		
		// sectionScripts want the raw bytes and nothing else!
		if (NodeROQ.isSectionScript)
			return;
		
		// Slap an END on there
		// This will end the whole file altogether
		
		NodeROQ.TryNewLine();
		NodeROQ.bytes.push(NodeROQ.ByteCode.SCRIPT_END);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Replace text section with something
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ReplaceSection(spotA, spotB, replacer)
	{
		var sliceA = this.source.slice(1, spotA);
		var sliceB = this.source.slice(spotB);
		
		this.source = sliceA + replacer + sliceB;

		this.offset = sliceA.length;
	}
}

module.exports = TScriptHandler;
