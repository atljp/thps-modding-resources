// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S H O R T   B R E A K
// 		Breaks to a label
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TShortBreak extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Is this a post-case break?
		this.postCase = false;
		
		if (NodeROQ.decompile)
		{
			// Skip initial break
			scriptHandler.offset ++;
			
			// Where should we break to?
			this.breakTo = NodeROQ.source.readUInt16LE(scriptHandler.offset);
			scriptHandler.offset += 2;
			
			// Hold up, what's the next byte? Is it a case?
			// If so, this is likely a case break
			
			var byte = NodeROQ.source[scriptHandler.offset];
			
			if (byte == NodeROQ.ByteCode.CASE || byte == NodeROQ.ByteCode.CASE_DEFAULT)
				this.postCase = true;
		}
		
		this.Finalize();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		NodeROQ.bytes.push(NodeROQ.ByteCode.SHORT_BREAK);
		
		// Post-function to overwrite this offset with a label gap
		var startPos = NodeROQ.bytes.length;
		var dest = this.namesake;
		
		NodeROQ.postFunctions.push(function(){
			
			// Do we have a label?
			var labelPos = NodeROQ.scratchpad.labels[dest];
			if (!labelPos)
				return console.log("MISSING SHORTBREAK LABEL: " + dest);
				
			var gap = labelPos - startPos;
			
			var bf = NodeROQ.UInt16Buffer(gap);
			for (var b=0; b<bf.length; b++)
				NodeROQ.bytes[startPos+b] = bf[b];
		});
		
		// Junk bytes for offset
		NodeROQ.bytes.push(0x88);
		NodeROQ.bytes.push(0x88);
	}
	
	ToText() 
	{ 
		if (this.postCase)
		{
			NodeROQ.text += "endcase"
			NodeROQ.indent --;
			NodeROQ.TextNewLine(false);
			return;
		}
			
		NodeROQ.text += "FIXME[BREAK]" 
	}
};

module.exports = TShortBreak;
