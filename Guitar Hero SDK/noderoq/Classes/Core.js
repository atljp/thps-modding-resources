// - - - - - - - - - - - - - - - - - - - - - - - - - 
//
// CORE OBJECT THAT ALL TYPES INHERIT FROM
// CONTAINS SOME USEFUL FUNCTIONS
//
// - - - - - - - - - - - - - - - - - - - - - - - - - 

class ScriptingCore
{
	constructor(opt)
	{
		// List of identifiers
		this.identifiers = [];
		
		this.labelText = "";
		
		this.offset = opt.offset || (scriptHandler && scriptHandler.offset) || 0;
		
		this.parent = opt.parent;
		
		// Stop reading?
		this.stopRead = false;
		
		// Name for this object
		this.namesake = opt.namesake || "";
		
		// Allow the 'random keyword?
		this.allowRandoms = true;
		
		// Line this was initialized on
		if (this.constructor.name !== 'TScriptHandler')
			this.startLine = scriptHandler.line;
		else
			this.startLine = 0;
			
		// Hold up, check label offsets
		// We do this here so EVERYTHING checks for it
		if (!NodeROQ.decompile)
			return;
			
		if (this.constructor.name !== 'TScriptHandler' && this.constructor.name !== 'TLabel')
		{
			var lab = NodeROQ.scratchpad.labels[ scriptHandler.offset.toString() ];
			if (lab)
				this.labelText = lab;
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// FINALIZE THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	Finalize()
	{
		this.stopRead = true;
		if (this.parent)
			this.parent.identifiers.push(this);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// SHOULD WE PRE-EMPTIVELY CUT THIS IDENTIFIER?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CutIdentifier(str)
	{
		if (str.toLowerCase() == 'random' && this.allowRandoms)
			return true;
			
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PEEK AND SEE IF AN OFFSET MATCHES A STRING
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	PeekMatch(offset, str, reverse = false)
	{
		var temps = "";
		
		if (reverse)
			offset -= str.length;
		
		for (var s=0; s<str.length; s++)
		{
			// End of file
			if (offset >= scriptHandler.source.length)
				break;
				
			temps += scriptHandler.source[offset];
			offset ++;
		}
		
		// Matches?
		return (temps.toLowerCase() == str.toLowerCase())
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// THIS IS A BAD CHARACTER
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	BadCharacter(cc, isString)
	{
		// Anything is valid in a string
		if (isString)
			return false;
			
		// Percent signs are valid, they're used in %s and other things
		if (cc == 37)
			return false;
			
		// Colons are also valid, but only for certain things
		if (cc == 58)
		{
			// Next character 
			if (scriptHandler.offset+1 < scriptHandler.source.length-1)
			{
				var peek = scriptHandler.source.charCodeAt(scriptHandler.offset+1);
				
				// :i :s :a :BREAKTO :OFFSET :w
				// These will become identifiers!
				if (peek == 105 || peek == 115 || peek == 97 || peek == 119
					|| this.PeekMatch(scriptHandler.offset, ':BREAKTO') 
					|| this.PeekMatch(scriptHandler.offset, ':OFFSET')
					|| this.PeekMatch(scriptHandler.offset, ':POS'))
					return false;
					
				return true;
			}
			
			return true;
		}
		
		// Quotes are ordinarily handled in strings
		// Anything outside of %s is considered a non-strict string
		if (cc == 34)
			return true;
			
		// Underscore
		// Generally speaking, this shouldn't be a bad character
		if (cc == 95)
			return false;
			
		// Anything else
		if (cc < 48 || (cc >= 58 && cc <= 64) || (cc >= 91 && cc <= 96) || (cc > 122))
			return true;
			
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// START PARSING SOURCE CODE
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseSourceCode()
	{
		if (NodeROQ.decompile)
		{
			this.ParseByteCode();
			return;
		}
		
		// Stop reading code!
		this.stopRead = false;
		
		// Parse!
		while (scriptHandler.CanRead() && !this.stopRead)
		{
			var char = scriptHandler.source[scriptHandler.offset];
			var charCode = char.charCodeAt(0);
			
			var newOff = -1;
			
			// Check for a newline regardless
			if (charCode == 10)
			{
				scriptHandler.line ++;
				newOff = scriptHandler.offset;
			}

			// If this character is a valid character, then begin a loop for it
			if (!this.BadCharacter(charCode))
			{
				// Is it a string?
				var createString = false;
				var isString = false;
				var idStart = scriptHandler.offset;
				
				// Find the end of the identifier / start
				while (scriptHandler.CanRead() && !this.stopRead)
				{
					var char = scriptHandler.source[scriptHandler.offset];
					var charCode = char.charCodeAt(0);
					
					// Fix for newlines?
					if (charCode == 10 && scriptHandler.offset !== newOff)
						scriptHandler.line ++;
					
					// What have we read so far?
					var soFar = scriptHandler.source.slice(idStart, scriptHandler.offset);
					
					// If not a bad character
					if (!this.BadCharacter(charCode, isString) && !this.CutIdentifier(soFar))
					{
						// Was it a quote?
						if (charCode == 34)
						{
							// Start a string
							if (!isString)
							{
								isString = true;
								createString = true;
							}
								
							// End a string
							else
							{
								scriptHandler.offset ++;
								break;
							}
						}
							
						scriptHandler.offset ++;
					}
					
					// If it IS a character, stop at it!
					else
						break;
				}

				var idString = scriptHandler.source.slice(idStart, scriptHandler.offset);
				
				// Should we push it to our identifier stack?
				if (this.ParseIdentifier(idString))
				{
					var newID = new NodeROQ.CompilerTypes.variable({
						namesake: idString,
						parent: this,
						offset: idStart
					});
				
					this.identifiers.push(newID);
				}
			}
			
			else
			{
				// What character is it?
				if (this.ParseBadCharacter(char))
					scriptHandler.offset ++;
			}
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Parse QB bytecode
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseByteCode()
	{
		// Stop reading code!
		this.stopRead = false;
		
		// Parse!
		while (scriptHandler.CanRead() && !this.stopRead)
		{
			var byte = scriptHandler.source[scriptHandler.offset];

			// Bad byte! Unrecognized!
			if (!this.GoodByte(byte))
			{
				scriptHandler.canRead = false;
				NodeROQ.AddError(this.constructor.name + " - UNRECOGNIZED BYTE AT " + scriptHandler.offset + ": " + byte.toString(16).padStart(2, '0'), this.startLine, true);
				
				var st = NodeROQ.source.slice(scriptHandler.offset-4, scriptHandler.offset+4).toString('hex');
				NodeROQ.AddError(st, this.startLine, true);
				this.stopRead = true;
				return;
			}
		}
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE A BAD CHARACTER
	// Return true if we want to increase our offset
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseBadCharacter(char)
	{
		var cc = char.charCodeAt(0);
		var peek = -1;
		
		if (scriptHandler.offset+1 < scriptHandler.source.length-1)	
			peek = scriptHandler.source.charCodeAt(scriptHandler.offset+1);
			
		// >, check for >> and >=
		if (cc == 62)
		{
			// >=
			if (peek == 61)
			{
				new NodeROQ.CompilerTypes.Keyword({
					parent: this,
					namesake: '>='
				});
				
				scriptHandler.offset ++;
				return true;
			}
			
			// >>
			else if (peek == 62)
			{
				new NodeROQ.CompilerTypes.Keyword({
					parent: this,
					namesake: '>>'
				});
				
				scriptHandler.offset ++;
				return true;
			}
		}
		
		// <, check for << and <=
		if (cc == 60)
		{
			// <=
			if (peek == 61)
			{
				new NodeROQ.CompilerTypes.Keyword({
					parent: this,
					namesake: '<='
				});
				
				scriptHandler.offset ++;
				return true;
			}
			
			// <<
			else if (peek == 60)
			{
				new NodeROQ.CompilerTypes.Keyword({
					parent: this,
					namesake: '<<'
				});
				
				scriptHandler.offset ++;
				return true;
			}
		}
		
		// Exclamation point
		// See if it's !==
		if (cc == 33 && peek == 61)
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: '!=='
			});
			
			scriptHandler.offset += 2;
			return true;
		}
			
		// Equals sign
		// Is it ==? Otherwise, keyword will pick it up
		if (cc == 61 && peek == 61)
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: '=='
			});
			
			scriptHandler.offset ++;
			return true;
		}
		
		// Pound sign
		// This is either a Python comment or an old-school comment
		if (cc == 35)
		{
			new NodeROQ.CompilerTypes.Comment();
			return false;
		}
		
		// Minus sign, it MIGHT be a dot
		if (cc == 45)
		{
			// This is a ->
			if (peek == 62)
			{
				new NodeROQ.CompilerTypes.Keyword({
					parent: this,
					namesake: '->'
				});
				
				// Skip >
				scriptHandler.offset ++;
				
				return true;
			}
		}
		
		// Slash sign, MAY be a comment
		if (cc == 47)
		{
			// Single comment
			if (peek == 47)
			{
				new NodeROQ.CompilerTypes.Comment();
				return false;
			}
			
			// Block comment
			if (peek == 42)
			{
				new NodeROQ.CompilerTypes.Comment({block: true});
				return false;
			}
		}
		
		// Uppercase sign, it's a QBString (GHWT)
		if (cc == 94)
		{
			new NodeROQ.CompilerTypes.SymbolHash({
				parent: this,
				qbString: true
			});
			
			return false;
		}
		
		// Tilde sign, it's a THAW_UNK global
		if (cc == 126)
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: "~"
			});
			
			scriptHandler.offset ++;
			
			return false;
		}
		
		// Dollar sign, it's a hash
		if (cc == 36)
		{
			// Left curly bracket? It's a THAW object!
			if (peek == 123)
			{
				new NodeROQ.CompilerTypes.THAWObject({
					parent: this
				});
			}
			
			// Normal hash
			else
			{
				new NodeROQ.CompilerTypes.SymbolHash({
					parent: this
				});
			}
			
			return false;
		}
		
		// Quote, it's a non-strict string
		if (cc == 34)
		{
			new NodeROQ.CompilerTypes.String({
				parent: this,
				strict: false
			});
			
			return false;
		}
		
		// Single keyword
		if (NodeROQ.CompilerTypes.Keyword.IsKeyword(cc))
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: String.fromCharCode(cc)
			});
			
			return true;
		}
		
		return true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// PARSE AN IDENTIFIER
	// Return true if we'd like to push it
	//
	// This can be used for parsing certain things like mod, etc.
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ParseIdentifier(id)
	{
		// 'call' and 'arguments' are old-school ROQ remnants, don't parse
		if (id.toLowerCase() == 'call' || id.toLowerCase() == 'arguments')
			return false;
			
		// Script injector, handle it!
		if (id.toLowerCase() == 'inject')
		{
			new NodeROQ.CompilerTypes.Injector();
			return false;
		}
		
		// It's %include, likely used for blender plugin or old qb
		if (id.toLowerCase() == '%include')
		{
			new NodeROQ.CompilerTypes.Comment();
			return false;
		}
		
		// :i is a newline instruction
		if (id == ':i')
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: 'newline'
			});
			return false;
		}
		
		// :w is a wrap instruction
		// Avoid this whenever possible, please
		
		if (id == ':w' || id == 'w')
		{
			new NodeROQ.CompilerTypes.LineWrap({
				parent: this,
				namesake: 'wrap'
			});
			return false;
		}
		
		// Jumper / Offset
		if (id.toLowerCase() == ':breakto' || id.toLowerCase() == ':offset')
		{
			new NodeROQ.CompilerTypes.Offset({
				parent: this,
				offsetter: (id.toLowerCase() == ':offset')
			});
			return false;
		}
		
		// Selector
		if (id == 'select')
		{
			new NodeROQ.CompilerTypes.Selector({
				parent: this,
			});
			return false;
		}
		
		// Label
		if (id.toLowerCase() == ':pos')
		{
			new NodeROQ.CompilerTypes.Label({
				parent: this,
			});
			return false;
		}
		
		// Struct
		if (id == ':s' || id == ':a')
		{
			// Get the bracket
			var brackChar = scriptHandler.source.charCodeAt(scriptHandler.offset);
			var brackString;
			
			if (id == ':a')
				brackString = (brackChar == 123) ? 'array_start' : 'array_end';
			else
				brackString = (brackChar == 123) ? 'struct_start' : 'struct_end';
			
			scriptHandler.offset ++;
			
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: brackString
			});
			return false;
		}
		
		// Script function
		if (id.toLowerCase() == 'function')
		{
			new NodeROQ.CompilerTypes.ScriptFunction({
				parent: this
			});
			return false;
		}
		
		// %i is an integer
		if (id == '%i')
		{
			new NodeROQ.CompilerTypes.Integer({
				parent: this
			});
			return false;
		}
		
		// %lb is line wrap
		if (id == '%lw')
		{
			new NodeROQ.CompilerTypes.LineWrap({
				parent: this
			});
			return false;
		}
		
		// %f is a float
		if (id == '%f')
		{
			new NodeROQ.CompilerTypes.Float({
				parent: this
			});
			return false;
		}
		
		// %vec3 is vector
		if (id == '%vec3' || id == '%vec2')
		{
			var type = (id == '%vec3') ? NodeROQ.CompilerTypes.Vector : NodeROQ.CompilerTypes.Pair;
			
			new type({
				parent: this
			});
			return false;
		}
		
		// %s is a string
		if (id == '%s')
		{
			new NodeROQ.CompilerTypes.String({
				parent: this
			});
			return false;
		}
		
		// %sc is a string, but 0x1C
		// What does this even do? Not sure why it's different
		if (id == '%sc')
		{
			new NodeROQ.CompilerTypes.String({
				parent: this,
				alt: true
			});
			return false;
		}
		
		// If statement
		if (id.toLowerCase() == 'if')
		{
			new NodeROQ.CompilerTypes.Conditional({ parent: this });
			return false;
		}
		
		// Switch statement
		if (id.toLowerCase() == 'switch')
		{
			new NodeROQ.CompilerTypes.Switch({ parent: this });
			return false;
		}
		
		// endfunction
		// This should ONLY be a valid identifier in sectionScripts!
		// Otherwise, IT IS MALFORMED AND WOULD BE TAKEN CARE OF
		
		if (id.toLowerCase() == 'endfunction' && NodeROQ.isSectionScript)
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: 'endfunction'
			});
			
			// IMMEDIATELY STOP COMPILING AFTER THIS
			// This **SHOULD** signal the end of the file!
			
			// But... THAW can sometimes have linewraps after...
			
			var slice = NodeROQ.source.slice(scriptHandler.offset, scriptHandler.source.length);
			if (slice.indexOf(":w") == -1)
				scriptHandler.Finalize();
			
			return false;
		}
		
		// Simple keywords
		var words = ['%global%', 'endif', 'endcase', 'random', 'and', 
		'while', 'continue', 'return', 'loop_to', 'or', 'not', 'isnull', 'thaw_4f', 'thaw_50'];
		
		for (const w in words)
		{
			if (id.toLowerCase() == words[w])
			{
				new NodeROQ.CompilerTypes.Keyword({
					parent: this,
					namesake: words[w]
				});
				return false;
			}
		}
		
		// Ignore 'end' for now, lame warning
		if (id.toLowerCase() == 'end')
			return false;
		
		NodeROQ.AddError("UNKNOWN IDENTIFIER: " + id, this.startLine, true);
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// DO NOT CALL THIS
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	DoValidityTest()
	{
		this.CheckValidity();
		for (const i in this.identifiers)
			this.identifiers[i].CheckValidity();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// RETRIEVE ANY ERRORS / WARNINGS FROM THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CheckValidity() {}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// We want to actually push our bytes to the list
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		this.ChildrenBytes();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// GET THE BYTECODE FOR THIS OBJECT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	GetByteCode() {}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// GET THE BYTES OF OUR INDICATORS
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ChildrenBytes()
	{
		for (const i in this.identifiers)
			this.identifiers[i].ToBytes();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// DEBUG
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	Debug()
	{
		// How many indents should we use?
		var p = this;
		var ind = 0;
		while (p.parent)
		{
			p = p.parent;
			ind ++;
		}
		
		var str = this.constructor.name + ": " + this.namesake;
		
		for (var i=0; i<ind; i++)
			str = String.fromCharCode(9) + str;
		
		console.log(str);
		for (const i in this.identifiers)
			this.identifiers[i].Debug();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// GOODBYTE - IS THIS BYTE VALID?
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	GoodByte(byte)
	{	
		// Keyword
		if (NodeROQ.CompilerTypes.Keyword.IsKeyword(byte))
		{
			new NodeROQ.CompilerTypes.Keyword({
				namesake: byte.toString(16),
				parent: this
			});
			
			scriptHandler.offset ++;
			return true;
		}
		
		// 0x01: NEWLINE
		if (byte == NodeROQ.ByteCode.NEW_INSTRUCTION)
		{
			new NodeROQ.CompilerTypes.Keyword({
				parent: this,
				namesake: 'newline'
			});
			
			// Skip past it
			scriptHandler.offset ++;
			return true;
		}
		
		// 0x16: SYMBOL HASH
		if (byte == NodeROQ.ByteCode.SYMBOL_HASH)
		{
			new NodeROQ.CompilerTypes.SymbolHash({parent: this});
			return true;
		}
		
		// 0x02: LINE WRAP
		if (byte == NodeROQ.ByteCode.END_OF_LINE_NUMBER)
		{
			new NodeROQ.CompilerTypes.LineWrap({parent: this});
			return true;
		}
		
		// 0x17: LONG INTEGER
		if (byte == NodeROQ.ByteCode.INTEGER)
		{
			new NodeROQ.CompilerTypes.Integer({parent: this});
			return true;
		}
		
		// 0x1A: SINGLE FLOAT
		if (byte == NodeROQ.ByteCode.FLOAT)
		{
			new NodeROQ.CompilerTypes.Float({parent: this});
			return true;
		}
		
		// 0x1B: SINGLE STRING
		// 0x1C: LOCAL STRING
		if (byte == NodeROQ.ByteCode.STRING || byte == NodeROQ.ByteCode.STRING_UNKNOWN)
		{
			new NodeROQ.CompilerTypes.String({parent: this});
			return true;
		}
		
		// 0x4C: WIDE STRING
		if (byte == NodeROQ.ByteCode.STRING_F)
		{
			new NodeROQ.CompilerTypes.String({parent: this, wide: true});
			return true;
		}
		
		// 0x1E: VECTOR
		if (byte == NodeROQ.ByteCode.VEC3)
		{
			new NodeROQ.CompilerTypes.Vector({parent: this});
			return true;
		}
		
		// 0x1F: PAIR
		if (byte == NodeROQ.ByteCode.VEC2)
		{
			new NodeROQ.CompilerTypes.Pair({parent: this});
			return true;
		}
		
		// 0x2B: SYMBOL ENTRY
		if (byte == NodeROQ.ByteCode.SYMBOL_ENTRY)
		{
			new NodeROQ.CompilerTypes.SymbolEntry({parent: this});
			return true;
		}
		
		// 0x2E: JUMP
		if (byte == NodeROQ.ByteCode.JUMP)
		{
			new NodeROQ.CompilerTypes.Offset({parent: this});
			return true;
		}
		
		// 0x2F: RANDOM
		if (byte == NodeROQ.ByteCode.RANDOM || byte == NodeROQ.ByteCode.RANDOM_2 || byte == NodeROQ.ByteCode.RANDOM_3 || byte == NodeROQ.ByteCode.RANDOM_4)
		{
			new NodeROQ.CompilerTypes.Selector({parent: this, byte: byte});
			return true;
		}
		
		// 0x3C: SWITCH
		if (byte == NodeROQ.ByteCode.SWITCH_START)
		{
			new NodeROQ.CompilerTypes.Switch({parent: this});
			return true;
		}
		
		// 0x49: SHORT BREAK
		if (byte == NodeROQ.ByteCode.SHORT_BREAK)
		{
			new NodeROQ.CompilerTypes.ShortBreak({parent: this});
			return true;
		}
		
		// 0x4A: THAW OBJECT
		if (byte == NodeROQ.ByteCode.THAW_STRUCTURE)
		{
			new NodeROQ.CompilerTypes.THAWObject({parent: this});
			return true;
		}
		
		// 0x4E: QB STRING
		if (byte == NodeROQ.ByteCode.QB_STRING)
		{
			new NodeROQ.CompilerTypes.SymbolHash({parent: this, qbString: true});
			return true;
		}
		
		return false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	PrepareText()
	{
		if (this.labelText)
		{
			NodeROQ.TextNewLine(false);
			NodeROQ.text += ":POS(" + this.labelText + ") ";
			// NodeROQ.TextNewLine();
		}
		this.ToText();
		this.ChildrenText();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO TEXT DATA
	// We want to actually push our text to the list
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText() {}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// GET THE TEXT OF OUR INDICATORS
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ChildrenText()
	{
		for (const i in this.identifiers)
			this.identifiers[i].PrepareText();
	}
}

module.exports = ScriptingCore;
