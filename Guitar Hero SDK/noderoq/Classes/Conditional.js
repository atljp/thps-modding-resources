// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	C O N D I T I O N A L
// 		Basically an if statement
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TConditional extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Jam an 'if' in here
		new NodeROQ.CompilerTypes.ConditionalMark({
			parent: this,
			namesake: 'if'
		});
		
		this.ParseSourceCode();
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE AN IDENTIFIER
	// Return true if we'd like to push it
	//
	// This can be used for parsing certain things like mod, etc.
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseIdentifier(id)
	{
		// Else!
		if (id.toLowerCase() == 'else')
		{
			new NodeROQ.CompilerTypes.ConditionalMark({
				parent: this,
				namesake: 'else'
			});
			
			return false;
		}
		
		// Else if
		if (id.toLowerCase() == 'elseif')
		{
			new NodeROQ.CompilerTypes.ConditionalMark({
				parent: this,
				namesake: 'elseif'
			});
			
			return false;
		}
		
		// Endif
		if (id.toLowerCase() == 'endif')
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: 'endif'
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
		// We basically want to store the byte positions of our marks
		var marks = [];
		var elseIfs = [];
		
		// Loop through our identifiers, we want to intercept our marks
		for (const i in this.identifiers)
		{
			var ID = this.identifiers[i];
			
			// Mark?
			if (ID.constructor.name == 'TConditionalMark')
			{
				marks.push(NodeROQ.bytes.length);
				elseIfs.push(ID.isElseif);
			}
				
			ID.ToBytes();
		}
		
		// Now that we have our marks, we need to handle our offsets
		for (var m=0; m<marks.length; m++)
		{
			var gap;
			
			var shortPos = marks[m]+1;
			
			// Is this our last mark?
			// If so, it's going to skip past our conditional entirely
			if (m == marks.length-1)
				gap = NodeROQ.bytes.length - shortPos;
				
			// Otherwise, use the pos AFTER our next mark
			else
			{
				var skipper = elseIfs[m+1] ? 0 : 3;
				gap = (marks[m+1] + skipper) - shortPos;
			}
				
			// Inject the gap
			var buf = NodeROQ.UInt16Buffer(gap);
			for (var b=0; b<buf.length; b++)
				NodeROQ.bytes[shortPos+b] = buf[b];
		}
		
		// - - - - - - - - - - - - - - - - - - - - - - - - - - 
		
		// Post-conditional offset for elseIfs
		var postCondOffset = NodeROQ.bytes.length;
		
		for (var m=0; m<marks.length; m++)
		{
			if (!elseIfs[m])
				continue;
				
			var shortPos = marks[m] + 3;
			
			var gap = postCondOffset - shortPos;
			
			// Inject the gap
			var buf = NodeROQ.UInt16Buffer(gap);
			for (var b=0; b<buf.length; b++)
				NodeROQ.bytes[shortPos+b] = buf[b];
		}
	}
};

module.exports = TConditional;
