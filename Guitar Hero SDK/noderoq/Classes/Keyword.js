// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	K E Y   W O R D
// 		Keyword, incredibly simple
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

const wordChars = {

	'=': NodeROQ.ByteCode.EQUALS,
	'+': NodeROQ.ByteCode.PLUS,
	'-': NodeROQ.ByteCode.MINUS,
	'(': NodeROQ.ByteCode.NESTING_INCREASE,
	')': NodeROQ.ByteCode.NESTING_DECREASE,
	'/': NodeROQ.ByteCode.DIVIDE,
	'*': NodeROQ.ByteCode.MULTIPLY,
	'.': NodeROQ.ByteCode.COLON,
	',': NodeROQ.ByteCode.COMMA,
	'->': NodeROQ.ByteCode.DOT,
	'<': NodeROQ.ByteCode.LESS_THAN,
	'>': NodeROQ.ByteCode.GREATER_THAN,
	
	// ALTHOUGH THESE ARE VALID TOKENS IN THE SOURCE,
	// THEY WILL HANG THE GAME WHEN THEY ARE USED
	'<=': NodeROQ.ByteCode.LESS_THAN_EQUALS,
	'>=': NodeROQ.ByteCode.GREATER_THAN_EQUALS,
	
	//~ '<=': NodeROQ.ByteCode.LESS_THAN,
	//~ '>=': NodeROQ.ByteCode.GREATER_THAN,
	
	'thaw_25': NodeROQ.ByteCode.IF_THUG,
	'thaw_4f': NodeROQ.ByteCode.THAW_FOURF,
	'thaw_50': NodeROQ.ByteCode.THAW_FIFTY,
	
	'!==': NodeROQ.ByteCode.EQUALS_DIFFERENT,
	'enum': NodeROQ.ByteCode.ENUM,
	
	'==': NodeROQ.ByteCode.EQUALS_COMPARE,
	'<<': NodeROQ.ByteCode.SHIFT_LEFT,
	'>>': NodeROQ.ByteCode.SHIFT_RIGHT,
	'endif': NodeROQ.ByteCode.ENDIF,
	'end_switch': NodeROQ.ByteCode.SWITCH_END,
	'%global%': NodeROQ.ByteCode.ARGSTACK,
	'~': NodeROQ.ByteCode.THAW_UNKNOWN,
    
	'random': NodeROQ.ByteCode.RANDOM_RANGE,
	'range': NodeROQ.ByteCode.RANDOM_RANGE,
    
	'and': NodeROQ.ByteCode.AND,
	'or': NodeROQ.ByteCode.OR,
	'not': NodeROQ.ByteCode.NOT,
	'while': NodeROQ.ByteCode.BEGIN,
	'loop_to': NodeROQ.ByteCode.REPEAT,
	'continue': NodeROQ.ByteCode.BREAK,
	'return': NodeROQ.ByteCode.RETURN,
	'isnull': NodeROQ.ByteCode.ALL_ARGS,
	
	'struct_start': NodeROQ.ByteCode.STRUCT_START,
	'struct_end': NodeROQ.ByteCode.STRUCT_END,
	
	'array_start': NodeROQ.ByteCode.ARRAY_START,
	'array_end': NodeROQ.ByteCode.ARRAY_END,
	
	'endfunction': NodeROQ.ByteCode.FUNCTION_END,
};

const byteChars = {};

byteChars[NodeROQ.ByteCode.EQUALS] = '=';
byteChars[NodeROQ.ByteCode.STRUCT_START] = ':s{';
byteChars[NodeROQ.ByteCode.STRUCT_END] = ':s}';
byteChars[NodeROQ.ByteCode.ARRAY_START] = ':a{';
byteChars[NodeROQ.ByteCode.ARRAY_END] = ':a}';
byteChars[NodeROQ.ByteCode.FUNCTION_START] = 'function ';
byteChars[NodeROQ.ByteCode.FUNCTION_END] = 'endfunction ';
byteChars[NodeROQ.ByteCode.SCRIPT_END] = 'end';
byteChars[NodeROQ.ByteCode.IF] = 'if ';
byteChars[NodeROQ.ByteCode.ELSE] = 'else ';

// Elseif does seem to be used in GHWT... apparently?
byteChars[NodeROQ.ByteCode.ELSEIF] = 'elseif ';

byteChars[NodeROQ.ByteCode.ENDIF] = 'endif';
byteChars[NodeROQ.ByteCode.SHIFT_LEFT] = '<<';
byteChars[NodeROQ.ByteCode.SHIFT_RIGHT] = '>>';
byteChars[NodeROQ.ByteCode.ARGSTACK] = '%GLOBAL%';
byteChars[NodeROQ.ByteCode.ALL_ARGS] = 'isNull';
byteChars[NodeROQ.ByteCode.NOT] = 'NOT';
byteChars[NodeROQ.ByteCode.OR] = 'OR';
byteChars[NodeROQ.ByteCode.AND] = 'AND';
byteChars[NodeROQ.ByteCode.LESS_THAN] = ' < ';
byteChars[NodeROQ.ByteCode.LESS_THAN_EQUALS] = ' <= ';
byteChars[NodeROQ.ByteCode.GREATER_THAN] = ' > ';
byteChars[NodeROQ.ByteCode.GREATER_THAN_EQUALS] = ' >= ';
byteChars[NodeROQ.ByteCode.PLUS] = ' + ';
byteChars[NodeROQ.ByteCode.MINUS] = ' - ';
byteChars[NodeROQ.ByteCode.MULTIPLY] = ' * ';
byteChars[NodeROQ.ByteCode.DIVIDE] = ' / ';
byteChars[NodeROQ.ByteCode.REPEAT] = 'loop_to ';
byteChars[NodeROQ.ByteCode.COLON] = '.';
byteChars[NodeROQ.ByteCode.DOT] = '->';
byteChars[NodeROQ.ByteCode.BEGIN] = 'while ';
byteChars[NodeROQ.ByteCode.BREAK] = 'continue';
byteChars[NodeROQ.ByteCode.NESTING_INCREASE] = '(';
byteChars[NodeROQ.ByteCode.NESTING_DECREASE] = ')';
byteChars[NodeROQ.ByteCode.RETURN] = 'return ';
byteChars[NodeROQ.ByteCode.COMMA] = ',';

byteChars[NodeROQ.ByteCode.ENUM] = 'enum';

byteChars[NodeROQ.ByteCode.IF_THUG] = ' thaw_25 ';

byteChars[NodeROQ.ByteCode.THAW_FOURF] = ' thaw_4f ';
byteChars[NodeROQ.ByteCode.THAW_FIFTY] = ' thaw_50 ';
byteChars[NodeROQ.ByteCode.EQUALS_DIFFERENT] = ' !== ';

// Something similar to global...
byteChars[NodeROQ.ByteCode.THAW_UNKNOWN] = '~';

// This can be 'random' or 'range', same thing
byteChars[NodeROQ.ByteCode.RANDOM_RANGE] = ' random ';

const skips = {};

skips[NodeROQ.ByteCode.IF] = 2;
skips[NodeROQ.ByteCode.ELSE] = 2;
skips[NodeROQ.ByteCode.ELSEIF] = 4;

class TKeyword extends ScriptingCore
{
	// Is it a valid keyword?
	static IsKeyword(cc)
	{
		if (NodeROQ.decompile)
			return byteChars[cc] ? true : false;
			
		return (wordChars[String.fromCharCode(cc)]) ? true : false;
	}
	
	constructor(opt = {})
	{
		super(opt);
		
		var ind = parseInt(this.namesake, 16);
		if (skips[ind])
			scriptHandler.offset += skips[ind];
			
		if (this.parent)
			this.parent.identifiers.push(this);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// >= and <= are technically supported
		if ((this.namesake == '<=' || this.namesake == '>=') && !NodeROQ.isSectionScript)
			NodeROQ.AddError(this.namesake + " is not supported, falling back to " + this.namesake[0] + ".", this.startLine);
			
		if (wordChars[this.namesake])
		{
			NodeROQ.bytes.push(wordChars[this.namesake]);
			return;
		}
		
		switch (this.namesake)
		{
			// New line
			case 'newline':
				NodeROQ.TryNewLine();
			break;
			
			default:
				console.log("UNKNOWN KEYWORD BYTE: -" + this.namesake + "-");
			break;
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO TEXT DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToText()
	{
		var BC = parseInt(this.namesake, 16);
		
		if (byteChars[BC])
		{
			// Raise the indent!
			if (BC == NodeROQ.ByteCode.FUNCTION_START
				|| BC == NodeROQ.ByteCode.STRUCT_START
				|| BC == NodeROQ.ByteCode.IF
				|| BC == NodeROQ.ByteCode.CASE
				|| BC == NodeROQ.ByteCode.CASE_DEFAULT
				|| BC == NodeROQ.ByteCode.ARRAY_START)
				NodeROQ.RaiseIndent();
				
			// Subtract the indent!
			else if (BC == NodeROQ.ByteCode.FUNCTION_END
				|| BC == NodeROQ.ByteCode.STRUCT_END
				|| BC == NodeROQ.ByteCode.SCRIPT_END
				|| BC == NodeROQ.ByteCode.ENDIF
				|| BC == NodeROQ.ByteCode.ELSE
				|| BC == NodeROQ.ByteCode.ELSEIF
				|| BC == NodeROQ.ByteCode.ARRAY_END)
			{
				NodeROQ.PopIndent();
				NodeROQ.indent --;
			}
			
			// EQUALS
			var isEquals = (BC == NodeROQ.ByteCode.EQUALS
				|| BC == NodeROQ.ByteCode.NOT
				|| BC == NodeROQ.ByteCode.OR
				|| BC == NodeROQ.ByteCode.AND
				|| BC == NodeROQ.ByteCode.ALL_ARGS);
			
			if (isEquals && NodeROQ.text[NodeROQ.text.length-1] !== ' ')
				NodeROQ.text += " ";
			
			// END - Only one
			if (BC == NodeROQ.ByteCode.SCRIPT_END && NodeROQ.text.slice(-3) == 'end')
				return;
				
			NodeROQ.text += byteChars[BC];
			
			if (BC == NodeROQ.ByteCode.ELSE)
				NodeROQ.indent ++;
				
			if (BC == NodeROQ.ByteCode.ELSEIF)
				NodeROQ.indent ++;
			
			// For convenience, let's separate our functions a tad
			if (BC == NodeROQ.ByteCode.FUNCTION_END)
				NodeROQ.TextNewLine(false);
			
			if (isEquals)
				NodeROQ.text += " ";
			
			return;
		}
			
		// A byteChar for the namesake didn't exist, what now?
		switch (this.namesake)
		{
			// New line
			case 'newline':
				NodeROQ.TextNewLine();
			break;
			
			default:
				console.log("UNKNOWN KEYWORD BYTE: -" + this.namesake + "-");
			break;
		}
	}
};

module.exports = TKeyword;
