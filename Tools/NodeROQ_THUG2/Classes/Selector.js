// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S E L E C T O R
// 		Top line of a selector block
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TSelector extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip initial ( or 0x2F
		scriptHandler.offset ++;
		
		// Which type of byte do we want to use?
		this.selectorType = opt.byte || NodeROQ.ByteCode.RANDOM_3;
		
		// How many options do we have?
		this.count = 0;
		
		this.weights = [];
		
		// Auto-determine from decompile
		if (NodeROQ.decompile)
		{
			// Options count
			this.count = NodeROQ.source.readUInt32LE(scriptHandler.offset);
			scriptHandler.offset += 4;
			
			// Weights!
			for (var w=0; w<this.count; w++)
			{
				this.weights.push( NodeROQ.source.readUInt16LE(scriptHandler.offset) );
				scriptHandler.offset += 2;
			}
			
			// ALL OF OUR JUMPS
			// Selector jumps are BASED ON THE END OF THE NUMBER!
			
			this.jumps = [];
			this.jumpNames = [];
			
			for (var w=0; w<this.count; w++)
			{
				var num = NodeROQ.source.readUInt32LE(scriptHandler.offset);
				this.jumps.push(num);
				scriptHandler.offset += 4;
				
				var labelName = NodeROQ.scratchpad.labelCount;
				
				// From here, let's create a DESIRED LABEL at this position
				// Label 0 does not apply, because it comes DIRECTLY AFTER
				
				if (w > 0)
					NodeROQ.scratchpad.labels[(scriptHandler.offset+num).toString()] = labelName;
				
				NodeROQ.scratchpad.labelCount ++;
				this.jumpNames.push(labelName);
			}
			
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
		// Split by commas!
		var spl = id.split(",");
		
		// The type of selector we want to use
		this.selectorType = parseInt(spl[0].trim(), 16);
		
		// Number of options
		this.count = parseInt(spl[1].trim());
		
		// console.log("Type: " + this.selectorType.toString(16));
		// console.log("Count: " + this.count);
		
		// Weights
		var wgt = spl[2].split(" ");
		var weightBlocks = [];
		var ws = "";
		var cnt = 0;
		
		for (var l=0; l<wgt.length; l++)
		{
			if (wgt[l].length <= 0)
				continue;
				
			ws += wgt[l];
			
			cnt ++;
			
			if (cnt > 1)
			{
				cnt = 0;
				weightBlocks.push(ws);
				ws = "";
			}
		}
		
		this.weights = [];
		
		for (const w in weightBlocks)
		{
			var BF = Buffer.from(weightBlocks[w], 'hex');
			this.weights.push( BF.readUInt16LE(0) );
		}
		
		// Skip )
		scriptHandler.offset ++;
		
		this.Finalize();
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// Our select type
		NodeROQ.bytes.push(this.selectorType);
		
		// Option count
		var buf = NodeROQ.UInt32Buffer(this.count);
		for (var b=0; b<buf.length; b++)
			NodeROQ.bytes.push(buf[b]);
			
		// Weights
		for (const w in this.weights)
		{
			var buf = NodeROQ.UInt16Buffer(this.weights[w]);
			for (var b=0; b<buf.length; b++)
				NodeROQ.bytes.push(buf[b]);
		}
	}
	
	ToText()
	{
		// select(2f,6, 01 00 01 00 01 00 01 00 01 00 01 00) :OFFSET(0):OFFSET(1):OFFSET(2):OFFSET(3):OFFSET(4):OFFSET(5)
		
		NodeROQ.text += "select(" + this.selectorType.toString(16) + "," + this.count + ",";
		
		var weightz = [];
		
		for (var w=0; w<this.weights.length; w++)
		{
			var b = Buffer.alloc(2);
			b.writeUInt16LE(this.weights[w], 0);
			
			weightz.push( b[0].toString(16).padStart(2,'0') + " " + b[1].toString(16).padStart(2,'0'));
		}
		
		NodeROQ.text += weightz.join(" ") + ") ";
		
		// Label time!
		for (var l=0; l<this.jumps.length; l++)
		{
			NodeROQ.text += ":OFFSET(" + this.jumpNames[l] + ")";
		}
		
		// Add our FIRST label
		if (this.jumpNames.length > 0)
		{
			NodeROQ.TextNewLine(false);
			NodeROQ.text += ":POS(" + this.jumpNames[0] + ") ";
		}
	}
};

module.exports = TSelector;
