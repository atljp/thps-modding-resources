// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	J U M P
// 		Actually JUMPS to a specific label
//		What's different from a shortbreak? No idea
//
//		( This can also be used for OFFSET in selectors )
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TOffset extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip initial ( or 0x2E
		scriptHandler.offset ++;
		
		this.offsetter = opt.offsetter || false;
		
		if (NodeROQ.decompile)
		{
			this.value = NodeROQ.source.readUInt32LE(scriptHandler.offset);
			scriptHandler.offset += 4;
			
			// Let's assume the offset is after the uint32
			var labelName = (scriptHandler.offset+this.value).toString();
			
			var realLabelName;
			
			// Only if it doesn't exist
			if (!NodeROQ.scratchpad.labels[labelName])
			{
				// ADD A BREAK TO THE LABELS
				realLabelName = NodeROQ.scratchpad.labelCount;
				NodeROQ.scratchpad.labels[labelName] = realLabelName.toString();
				NodeROQ.scratchpad.labelCount ++;
			}
			else
				realLabelName = NodeROQ.scratchpad.labels[labelName];
			
			this.namesake = realLabelName.toString();
			
			this.Finalize();
			return;
		}
		
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
		
		// skip )
		scriptHandler.offset ++;
		
		this.Finalize();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// Jumps use an actual byte, offsetters do not
		if (!this.offsetter)
			NodeROQ.bytes.push(NodeROQ.ByteCode.JUMP);
			
		// Add a post function for our jump
		var startPos = NodeROQ.bytes.length;
		var dest = this.namesake;
		
		NodeROQ.postFunctions.push(function(){
			
			// Do we have a label?
			var labelPos = NodeROQ.scratchpad.labels[dest];
			if (!labelPos)
				return console.log("MISSING JUMP / OFFSET LABEL: " + dest);
				
			var gap = labelPos - (startPos+4);
			
			var bf = NodeROQ.UInt32Buffer(gap);
			for (var b=0; b<bf.length; b++)
				NodeROQ.bytes[startPos+b] = bf[b];
		});
			
		// 4x junk bytes for long
		NodeROQ.bytes.push(0x88);
		NodeROQ.bytes.push(0x88);
		NodeROQ.bytes.push(0x88);
		NodeROQ.bytes.push(0x88);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// OFFSETS ARE BREAKTO!
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		NodeROQ.TextNewLine(false);
		NodeROQ.text += ":BREAKTO(" + this.namesake + ") ";
	}
};

module.exports = TOffset;
