// ---------------------------------------------------
//
//	TOKEN
//	Used in scripts
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCScriptToken extends ItemCore
{
	// Specific to @ tokens, nothing else!
	Initialize() { this.weight = 1; }
	
	IsSingleLine() { return true; }
	
	GetDebugText() 
	{ 
		var val = this.GetValueText();
		var txt = ": " + val;
		
		if (val == "@")
			txt += " [" + this.weight + "]";
		
		return txt;
	}
	
	// This is a script-only object so yes, it's in a script
	InScript() { return true; }
	
	//-----------------------
	// Set our value from a specific keyword token
	//-----------------------
	
	ValueFromToken(tokenByte)
	{
		switch (tokenByte)
		{
			case QBC.constants.ESCRIPTTOKEN_ENDOFLINE:
				this.value = "newline";
				break;
                
            // Special case for THAW structscript. These
            // are used internally for debug things, but we
            // don't care. They function as newlines.
            
			case QBC.constants.ESCRIPTTOKEN_ENDOFLINENUMBER:
				this.value = "newline";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_EQUALS:
				this.value = "=";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDSCRIPT:
				this.value = "endscript";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_OPENPARENTH:
				this.value = "(";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_CLOSEPARENTH:
				this.value = ")";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_ADD:
				this.value = "+";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_DOT:
				this.value = ".";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_COLON:
				this.value = ":";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_MINUS:
				this.value = "-";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_MULTIPLY:
				this.value = "*";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_DIVIDE:
				this.value = "/";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_ARG:
				this.value = "argument";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_RETURN:
				this.value = "return";
				break;
                
            case QBC.constants.ESCRIPTTOKEN_COMMA:
                this.value = ",";
                break;
				
			case QBC.constants.ESCRIPTTOKEN_ARGUMENTPACK:
				this.value = "$";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_BEGIN:
				this.value = "begin";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_REPEAT:
				this.value = "repeat";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_BREAK:
				this.value = "break";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_NOT:
				this.value = "NOT";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_AND:
				this.value = "&";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_NOTEQUAL:
				this.value = "!=";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_OR:
				this.value = "||";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_GREATERTHAN:
				this.value = ">";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_GREATERTHANEQUAL:
				this.value = ">=";
				break;
                
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE:
                this.value = "randomrange";
                break;
                
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE2:
                this.value = "randomrange2";
                break;
				
			case QBC.constants.ESCRIPTTOKEN_LESSTHAN:
				this.value = "<";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_LESSTHANEQUAL:
				this.value = "<=";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_FASTELSE:
				this.value = "else";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ELSEIF:
				this.value = "elseif";
				break;
				
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ALLARGS:
				this.value = "<...>";
				break;
                
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOMINTEGER:
                this.value = "RandomInteger";
                break;
                
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOMFLOAT:
                this.value = "RandomFloat";
                break;
				
			default:
				this.Fail("Unknown byte for ValueFromToken: 0x" + tokenByte.toString(16).padStart(2, "0"));
				break;
		}
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T   O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		var val = this.GetValueText();
		
		switch (val)
		{
			case "newline":
				this.job.AddLine();
				break;
                
            case "else":
            case "elseif":
                this.job.SubIndent();
                this.job.AddText(val);
                this.job.AddIndent();
                return;
				
			case "endscript":
				this.job.SubIndent();
				this.job.AddText(val);
				break;
				
			case ":":
				this.job.AddText("::");
				break;
                
            case "@":
                this.job.AddText("@");
                
                if (this.weight != 1)
                    this.job.AddText("*" + this.weight.toString() + " ");
                else
                    this.job.AddText(" ");
                    
                break;
				
			case "(":
			case ")":
			case ".":
			case "$":
				this.job.AddText(val);
				break;
				
			// This is used only by the next qbkey
			case "argument":
				break;
				
			default:
				this.job.AddText(val + " ");
				break;
		}
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Writes the object's data
	//-----------------------
	
	SerializeSharedData()
	{
		switch (this.value)
		{
			case "=":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_EQUALS);
				break;
				
			case "==":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_SAMEAS);
				break;
			
			case "newline":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ENDOFLINE);
				break;
				
			case "argument":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ARG);
				break;
				
			case "begin":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_BEGIN);
				break;
				
			case "repeat":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_REPEAT);
				break;
				
			case "break":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_BREAK);
				break;
				
			case "+":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ADD);
				break;
				
			case "-":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_MINUS);
				break;
				
			case "/":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_DIVIDE);
				break;
				
			case "*":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_MULTIPLY);
				break;
				
			case "<":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_LESSTHAN);
				break;
				
			case ">":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_GREATERTHAN);
				break;
				
			case "<=":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_LESSTHANEQUAL);
				break;
				
			case ">=":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_GREATERTHANEQUAL);
				break;
				
			case "(":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_OPENPARENTH);
				break;
				
			case ")":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_CLOSEPARENTH);
				break;
				
			case "return":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RETURN);
				break;
				
			case "randomfloat":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOMFLOAT);
				break;
				
			case "randominteger":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOMINTEGER);
				break;
				
			case "randomrange":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE);
				break;
				
			case "randomrange2":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE2);
				break;
				
			case "not":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_NOT);
				break;
				
			case "||":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_OR);
				break;
                
            case ",":
                this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_COMMA);
                break;
				
			case "$":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ARGUMENTPACK);
				break;
				
			case "&":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_AND);
				break;
				
			case ":":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_COLON);
				break;
			
			case ".":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_DOT);
				break;
				
			case "!=":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_NOTEQUAL);
				break;
				
			case "<...>":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_ALLARGS);
				break;
				
			// Internal use by randoms only
			case "@":
                if (this.parent)
                {
                    var cn = this.parent.GetClassName();
                    if (cn != 'ScriptRandom')
                    {
                        this.Fail("@ token found outside of a random.");
                        return;
                    }
                }
				break;
				
			case "elseif":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_ELSEIF);
				this.writer.UInt16(0);		// Next comparison
				this.writer.UInt16(0);		// Endif
				break;
				
			case "else":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_FASTELSE);
				this.writer.UInt16(0);		// Endif
				break;
				
			case "case":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_CASE);
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_SHORTJUMP);
				this.writer.UInt16(0);		// Next case
				break;
				
			case "default":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_DEFAULT);
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_SHORTJUMP);
				this.writer.UInt16(0);		// End of switch
				break;
				
			default:
				this.Fail("Unknown keyword type in serialize: " + this.value);
				break;
		}
	}
	
	
}

module.exports = QBCScriptToken;
