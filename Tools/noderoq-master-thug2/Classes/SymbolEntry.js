// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S Y M B O L   E N T R Y
// 		Used in decompiling ONLY
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TSymbolEntry extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip 0x2B
		scriptHandler.offset ++;
		
		// Get the checksum
		this.checksum = '';
		for (var l=0; l<4; l++)
		{
			this.checksum = scriptHandler.source[scriptHandler.offset].toString(16) + this.checksum;
			scriptHandler.offset ++;
		}
		
		this.checksum = this.checksum.padStart(8, '0');
		
		// Keep going until we hit a zero
		while (scriptHandler.source[scriptHandler.offset] !== 0x00)
		{
			this.namesake += String.fromCharCode(scriptHandler.source[scriptHandler.offset]);
			scriptHandler.offset ++;
		}
		
		// Skip 0x00
		scriptHandler.offset ++;
		
		this.Finalize();
	}
	
	ToText()
	{
		var theSum = this.checksum;
		var theName = this.namesake;
		
		// Add a post-function to replace our checksum
		NodeROQ.postFunctions.push( function() {
			
			var replaceFrom = "[" + theSum + "]";
			NodeROQ.text = NodeROQ.text.split(replaceFrom).join(theName);
			
		}.bind(NodeROQ) );
	}
};

module.exports = TSymbolEntry;
