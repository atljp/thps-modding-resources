// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	L I N E   W R A P
// 		I'm not exactly sure what this is
//
//	It seems to indicate line number maybe? Obviously this isn't useful
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TLineWrap extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Skip initial ( or 0x02
		scriptHandler.offset += (NodeROQ.decompile) ? 1 : 0;
		
		this.offsetter = opt.offsetter || false;
		
		if (NodeROQ.decompile)
		{
			this.value = NodeROQ.source.readUInt32LE(scriptHandler.offset);
			scriptHandler.offset += 4;
			
			this.namesake = this.value.toString();
			
			this.Finalize();
			return;
		}
		
		this.Finalize();
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// String
		NodeROQ.bytes.push(NodeROQ.ByteCode.END_OF_LINE_NUMBER);
		
		// Does line length really matter?
		// As long as it's a line wrap, who cares?
		var buf = NodeROQ.UInt32Buffer(32);
		for (var b=0; b<buf.length; b++)
			NodeROQ.bytes.push(buf[b]);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT IT TO TEXT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		NodeROQ.TextNewLine(false);
		NodeROQ.text += ":w ";
		
		// We probably can't replicate the number, forget about it
		//~ NodeROQ.text += "%lw(" + this.namesake + ")";
	}
};

module.exports = TLineWrap;
