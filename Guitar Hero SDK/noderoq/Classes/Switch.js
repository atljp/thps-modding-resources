// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	S W I T C H
// 		It's a switch, obviously
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TSwitch extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Unique label ID
		this.labelID = 'switch_' + scriptHandler.switchIndex;
		scriptHandler.switchIndex ++;
		
		// Skip first part
		if (NodeROQ.decompile)
			scriptHandler.offset ++;
		
		this.ParseSourceCode();
	}
	
	BadCharacter(cc, isString)
	{
		// Underscore
		if (cc == 95)
			return false;
			
		return super.BadCharacter(cc, isString);
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE AN IDENTIFIER
	// Return true if we'd like to push it
	//
	// This can be used for parsing certain things like mod, etc.
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseIdentifier(id)
	{
		var TLC = id.toLowerCase();
		
		// Endcase is ACTUALLY a post-case break to the end of it
		if (TLC == 'endcase')
		{
			new NodeROQ.CompilerTypes.ShortBreak({
				parent: this,
				namesake: 'post_' + this.labelID
			});
			
			return false;
		}
		
		// Cases
		if (TLC == 'case' || TLC == 'default')
		{
			new NodeROQ.CompilerTypes.ConditionalMark({
				parent: this,
				namesake: id.toLowerCase(),
				caseMark: true
			});
			
			return false;
		}
		
		// Endswitch
		if (TLC == 'end_switch')
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: 'end_switch'
			});
			
			this.Finalize();
			return false;
		}
		
		return super.ParseIdentifier(id);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// Switch
		NodeROQ.bytes.push(NodeROQ.ByteCode.SWITCH_START);
		
		// We basically want to store the byte positions of our marks
		var marks = [];
		
		// Post-case breaks
		var postMarks = [];
		
		// Loop through our identifiers, we want to intercept our marks
		for (const i in this.identifiers)
		{
			var ID = this.identifiers[i];
			
			// Mark?
			if (ID.constructor.name == 'TConditionalMark')
			{
				marks.push(NodeROQ.bytes.length);
			}
				
			ID.ToBytes();
		}
		
		// Now that we have our marks, we need to handle our offsets
		for (var m=0; m<marks.length; m++)
		{
			var gap;
			
			var shortPos = marks[m]+2;
			
			// Is this our last mark?
			// If so, it's going to skip past our conditional entirely
			if (m == marks.length-1)
				gap = (NodeROQ.bytes.length-1) - shortPos;
				
			// Otherwise, use the pos AFTER our next mark
			else
				gap = marks[m+1] - shortPos;
				
			// Inject the gap
			var buf = NodeROQ.UInt16Buffer(gap);
			for (var b=0; b<buf.length; b++)
				NodeROQ.bytes[shortPos+b] = buf[b];
		}
		
		// Fix post-marks
		for (var p=0; p<postMarks.length; p++)
		{
			var shortPos = marks[p] + 2;
			var gap = NodeROQ.bytes.length - shortPos;
			
			// Inject the gap
			var buf = NodeROQ.UInt16Buffer(gap);
			for (var b=0; b<buf.length; b++)
				NodeROQ.bytes[shortPos+b] = buf[b];
		}
		
		// Add our post-switch label
		NodeROQ.scratchpad.labels['post_' + this.labelID] = NodeROQ.bytes.length;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - 
	// GOOD BYTE?
	// - - - - - - - - - - - - - - - - - - - - - - - - 
	
	GoodByte(byte)
	{
		// We use conditional marks as case markers
		if (byte == NodeROQ.ByteCode.CASE )
		{
			new NodeROQ.CompilerTypes.ConditionalMark({
				parent: this,
				namesake: 'case',
				caseMark: true
			});
			
			// Skip past the breaks
			scriptHandler.offset += 4;
			
			return true;
		}
		
		// DEFAULT
		
		else if (byte == NodeROQ.ByteCode.CASE_DEFAULT )
		{
			new NodeROQ.CompilerTypes.ConditionalMark({
				parent: this,
				namesake: 'default',
				caseMark: true
			});
			
			// Skip past the breaks
			scriptHandler.offset += 4;
			
			return true;
		}
		
		// END
		else if (byte == NodeROQ.ByteCode.SWITCH_END)
		{
			scriptHandler.offset ++;
			this.Finalize();
			return true;
		}
		
		// Something else
		else
		{
			return super.GoodByte(byte);
		}
	}
	
	ToText()
	{
		var curIndent = NodeROQ.indent;
		
		NodeROQ.text += "switch ";
		NodeROQ.indent ++;
		
		// Parse the identifiers!
		for (var i=0; i<this.identifiers.length; i++)
		{
			var child = this.identifiers[i];
			
			//~ console.log(child.constructor.name + " - " + child.namesake);
			
			if (child.constructor.name == 'TConditionalMark')
			{
				NodeROQ.text += child.namesake + " ";
				NodeROQ.indent ++;
			}
			else
			{
				child.PrepareText();
			}
		}
		
		// Reset our indent to our initial indent
		var gap = NodeROQ.indent - curIndent;
		for (var g=0; g<gap; g++)
		{
			NodeROQ.indent --;
			NodeROQ.PopIndent();
		}
		
		// Only newline if last is not a newline
		if (this.identifiers[this.identifiers.length-1].namesake !== 'newline')
			NodeROQ.TextNewLine();
				
		NodeROQ.text += "end_switch";
	}
	
	ChildrenText() {}
};

module.exports = TSwitch;
