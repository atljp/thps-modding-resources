const fs = require('fs');
const path = require('path');

var scriptDir = path.join(__dirname, "files");
var files = fs.readdirSync(scriptDir);

const tokens = {
    ESCRIPTTOKEN_ENDOFFILE: 0x00,
	ESCRIPTTOKEN_ENDOFLINE: 0x01,
	ESCRIPTTOKEN_ENDOFLINENUMBER: 0x02,
	ESCRIPTTOKEN_STARTSTRUCT: 0x03,
	ESCRIPTTOKEN_ENDSTRUCT: 0x04,
	ESCRIPTTOKEN_STARTARRAY: 0x05,
	ESCRIPTTOKEN_ENDARRAY: 0x06,
	ESCRIPTTOKEN_EQUALS: 0x07,
	ESCRIPTTOKEN_DOT: 0x08,
	ESCRIPTTOKEN_COMMA: 0x09,
	ESCRIPTTOKEN_MINUS: 0x0A,
	ESCRIPTTOKEN_ADD: 0x0B,
	ESCRIPTTOKEN_DIVIDE: 0x0C,
	ESCRIPTTOKEN_MULTIPLY: 0x0D,
	ESCRIPTTOKEN_OPENPARENTH: 0x0E,
	ESCRIPTTOKEN_CLOSEPARENTH: 0x0F,
	ESCRIPTTOKEN_DEBUGINFO: 0x10,
	ESCRIPTTOKEN_SAMEAS: 0x11,
	ESCRIPTTOKEN_LESSTHAN: 0x12,
	ESCRIPTTOKEN_LESSTHANEQUAL: 0x13,
	ESCRIPTTOKEN_GREATERTHAN: 0x14,
	ESCRIPTTOKEN_GREATERTHANEQUAL: 0x15,
	ESCRIPTTOKEN_NAME: 0x16,
	ESCRIPTTOKEN_INTEGER: 0x17,
	ESCRIPTTOKEN_HEXINTEGER: 0x18,
	ESCRIPTTOKEN_ENUM: 0x19,
	ESCRIPTTOKEN_FLOAT: 0x1A,
	ESCRIPTTOKEN_STRING: 0x1B,
	ESCRIPTTOKEN_LOCALSTRING: 0x1C,
	ESCRIPTTOKEN_ARRAY: 0x1D,
	ESCRIPTTOKEN_VECTOR: 0x1E,
	ESCRIPTTOKEN_PAIR: 0x1F,
	ESCRIPTTOKEN_KEYWORD_BEGIN: 0x20,
	ESCRIPTTOKEN_KEYWORD_REPEAT: 0x21,
	ESCRIPTTOKEN_KEYWORD_BREAK: 0x22,
	ESCRIPTTOKEN_KEYWORD_SCRIPT: 0x23,
	ESCRIPTTOKEN_KEYWORD_ENDSCRIPT: 0x24,
	ESCRIPTTOKEN_KEYWORD_IF: 0x25,
	ESCRIPTTOKEN_KEYWORD_ELSE: 0x26,
	ESCRIPTTOKEN_KEYWORD_ELSEIF: 0x27,
	ESCRIPTTOKEN_KEYWORD_ENDIF: 0x28,
	ESCRIPTTOKEN_KEYWORD_RETURN: 0x29,
	ESCRIPTTOKEN_UNDEFINED: 0x2A,
	ESCRIPTTOKEN_CHECKSUM_NAME: 0x2B,
	ESCRIPTTOKEN_KEYWORD_ALLARGS: 0x2C,
	ESCRIPTTOKEN_ARG: 0x2D,
	ESCRIPTTOKEN_JUMP: 0x2E,
	ESCRIPTTOKEN_KEYWORD_RANDOM: 0x2F,
	ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE: 0x30,
	ESCRIPTTOKEN_AT: 0x31,
	ESCRIPTTOKEN_OR: 0x32,
	ESCRIPTTOKEN_AND: 0x33,
	ESCRIPTTOKEN_XOR: 0x34,
	ESCRIPTTOKEN_SHIFT_LEFT: 0x35,
	ESCRIPTTOKEN_SHIFT_RIGHT: 0x36,
	ESCRIPTTOKEN_KEYWORD_RANDOM2: 0x37,
	ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE2: 0x38,
	ESCRIPTTOKEN_KEYWORD_NOT: 0x39,
	ESCRIPTTOKEN_KEYWORD_AND: 0x3A,
	ESCRIPTTOKEN_KEYWORD_OR: 0x3B,
	ESCRIPTTOKEN_KEYWORD_SWITCH: 0x3C,
	ESCRIPTTOKEN_KEYWORD_ENDSWITCH: 0x3D,
	ESCRIPTTOKEN_KEYWORD_CASE: 0x3E,
	ESCRIPTTOKEN_KEYWORD_DEFAULT: 0x3F,
	ESCRIPTTOKEN_KEYWORD_RANDOM_NO_REPEAT: 0x40,
	ESCRIPTTOKEN_KEYWORD_RANDOM_PERMUTE: 0x41,
	ESCRIPTTOKEN_COLON: 0x42,
	ESCRIPTTOKEN_RUNTIME_CFUNCTION: 0x43,
	ESCRIPTTOKEN_RUNTIME_MEMBERFUNCTION: 0x44,
	ESCRIPTTOKEN_KEYWORD_USEHEAP: 0x45,
	ESCRIPTTOKEN_KEYWORD_UNKNOWN: 0x46,
	ESCRIPTTOKEN_KEYWORD_FASTIF: 0x47,
	ESCRIPTTOKEN_KEYWORD_FASTELSE: 0x48,
	ESCRIPTTOKEN_SHORTJUMP: 0x49,
	ESCRIPTTOKEN_INLINEPACKSTRUCT: 0x4A,
	ESCRIPTTOKEN_ARGUMENTPACK: 0x4B,
	ESCRIPTTOKEN_WIDESTRING: 0x4C,
	ESCRIPTTOKEN_NOTEQUAL: 0x4D,
	ESCRIPTTOKEN_STRINGQS: 0x4E,
	ESCRIPTTOKEN_KEYWORD_RANDOMFLOAT: 0x4F,
	ESCRIPTTOKEN_KEYWORD_RANDOMINTEGER: 0x50
};

var keys = {};

for (const file of files)
{
    var keysFound = 0;
    
    if (file.indexOf(".qb") == -1)
        continue;
         
    var data = fs.readFileSync( path.join(scriptDir, file) );
    
    var off = 0;
    
    while (off < data.length)
    {
        var token = data[off];
        off ++;
        
        // Token
        switch (token)
        {
            // Single tokens, just skip them.
            case tokens.ESCRIPTTOKEN_ENDOFLINE:
            case tokens.ESCRIPTTOKEN_EQUALS:
            case tokens.ESCRIPTTOKEN_KEYWORD_SCRIPT:
            case tokens.ESCRIPTTOKEN_KEYWORD_ENDSCRIPT:
            case tokens.ESCRIPTTOKEN_KEYWORD_BEGIN:
            case tokens.ESCRIPTTOKEN_KEYWORD_REPEAT:
            case tokens.ESCRIPTTOKEN_KEYWORD_SWITCH:
            case tokens.ESCRIPTTOKEN_KEYWORD_ENDSWITCH:
            case tokens.ESCRIPTTOKEN_ADD:
            case tokens.ESCRIPTTOKEN_MINUS:
            case tokens.ESCRIPTTOKEN_COLON:
            case tokens.ESCRIPTTOKEN_AT:
            case tokens.ESCRIPTTOKEN_MULTIPLY:
            case tokens.ESCRIPTTOKEN_DIVIDE:
            case tokens.ESCRIPTTOKEN_STARTARRAY:
            case tokens.ESCRIPTTOKEN_STARTSTRUCT:
            case tokens.ESCRIPTTOKEN_ENDARRAY:
            case tokens.ESCRIPTTOKEN_ENDSTRUCT:
            case tokens.ESCRIPTTOKEN_KEYWORD_NOT:
            case tokens.ESCRIPTTOKEN_KEYWORD_ALLARGS:
            case tokens.ESCRIPTTOKEN_ARG:
            case tokens.ESCRIPTTOKEN_KEYWORD_CASE:
            case tokens.ESCRIPTTOKEN_KEYWORD_DEFAULT:
            case tokens.ESCRIPTTOKEN_ENDOFFILE:
            case tokens.ESCRIPTTOKEN_COMMA:
            case tokens.ESCRIPTTOKEN_KEYWORD_ENDIF:
            case tokens.ESCRIPTTOKEN_OPENPARENTH:
            case tokens.ESCRIPTTOKEN_CLOSEPARENTH:
            case tokens.ESCRIPTTOKEN_OR:
            case tokens.ESCRIPTTOKEN_GREATERTHAN:
            case tokens.ESCRIPTTOKEN_LESSTHAN:
            case tokens.ESCRIPTTOKEN_KEYWORD_BREAK:
            case tokens.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE:
            case tokens.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE2:
            case tokens.ESCRIPTTOKEN_DOT:
            case tokens.ESCRIPTTOKEN_KEYWORD_RETURN:
            case tokens.ESCRIPTTOKEN_AND:
            case tokens.ESCRIPTTOKEN_AT:
                break;
            
            // 4-byte values
            case tokens.ESCRIPTTOKEN_NAME:
            case tokens.ESCRIPTTOKEN_INTEGER:
            case tokens.ESCRIPTTOKEN_JUMP:
            case tokens.ESCRIPTTOKEN_FLOAT:
            case tokens.ESCRIPTTOKEN_ENDOFLINENUMBER:
                off += 4;
                break;
                
            // 2-byte values
            case tokens.ESCRIPTTOKEN_SHORTJUMP:
            case tokens.ESCRIPTTOKEN_KEYWORD_FASTIF:
            case tokens.ESCRIPTTOKEN_KEYWORD_FASTELSE:
                off += 2;
                break;
            
            // 12-byte values
            case tokens.ESCRIPTTOKEN_VECTOR:
                off += 12;
                break;
                
            // 8-byte values
            case tokens.ESCRIPTTOKEN_PAIR:
                off += 8;
                break;
                
            // String
            case tokens.ESCRIPTTOKEN_LOCALSTRING:
            case tokens.ESCRIPTTOKEN_STRING:
                var len = data.readUInt32LE(off);
                off += (len + 4);
                break;
                
            // Random
            case tokens.ESCRIPTTOKEN_KEYWORD_RANDOM:
            case tokens.ESCRIPTTOKEN_KEYWORD_RANDOM_NO_REPEAT:
            case tokens.ESCRIPTTOKEN_KEYWORD_RANDOM_PERMUTE:
                var numItems = data.readUInt32LE(off);
                off += 4;
                
                off += (2 * numItems);      // Weights
                off += (4 * numItems);      // Offsets
                break;
                
            case tokens.ESCRIPTTOKEN_CHECKSUM_NAME:
                var key = "0x" + data.readUInt32LE(off).toString(16).padStart(8, "0");
                off += 4;
                
                var temp = "";
                while (data[off] != 0x00)
                {
                    temp += String.fromCharCode(data[off]);
                    off ++;
                }
                
                keysFound ++;
                keys[key] = temp;
                
                // Skip zero
                off ++;
                break;
                
            default:
                console.log(file + ": Unknown token at " + (off-1).toString() + ": 0x" + token.toString(16).padStart(2, "0") + ".");
                process.exit(1);
                break;
        }
    }
    
    if (!keysFound)
        console.log(file + " had no keys?");
}

// Write file
var keyLines = [];

for (const key of Object.keys(keys))
{
    keyLines.push(key + " " + keys[key]);
}

console.log("Writing...");
fs.writeFileSync(path.join(__dirname, 'thug2_keys.txt'), keyLines.join("\n"));
