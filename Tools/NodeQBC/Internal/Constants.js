// ---------------------------------------------------
//
//	CONSTANTS
//	Constants, of course
//
// ---------------------------------------------------

module.exports = {
	Reader: require('./Reader.js'),
	Writer: require('./Writer.js'),
	Keys: new (require('./Keys.js'))(),
    LZSS: new (require('./LZSS.js'))(),
	
	FLAG_HASPARENT: 0x01,
	FLAG_GLOBALITEM: 0x20,
	FLAG_GLOBALITEM_WPC: 0x04,
	FLAG_STRUCT_GH3: 0x80,
	FLAG_STRUCT_WPC: 0x10,
    FLAG_WOR_ARRAY: 0x20,
    
    GAME_GHWT: 0,
    GAME_GH3: 1,
    GAME_THAW: 2,
    GAME_THUG2: 3,
	
	ClassBindings: {
		0x00: 'Floats',
		0x01: 'Integer',
		0x02: 'Float',
		0x03: 'String',
		0x04: 'WideString',
		0x05: 'Pair',
		0x06: 'Vector',
		0x07: 'Script',
		0x0A: 'Struct',
		0x0C: 'Array',
		0x0D: 'QBKey',
		0x1A: 'Pointer',
		0x1C: 'LocalString',
        0x24: 'RequiredValue',
        0x25: 'RequiredValue',
        0x26: 'RequiredValue',
        0x27: 'RequiredValue',
        0x28: 'RequiredValue',
        0x29: 'RequiredValue',
        0x2A: 'RequiredValue',
        0x2B: 'RequiredValue',
        0x2C: 'RequiredValue',
	},
	
	TypeBindings: {
		'Floats': 0x00,
		'Integer': 0x01,
		'Float': 0x02,
		'String': 0x03,
		'WideString': 0x04,
		'Pair': 0x05,
		'Vector': 0x06,
		'Script': 0x07,
		'Struct': 0x0A,
		'Array': 0x0C,
		'QBKey': 0x0D,
		'Pointer': 0x1A,
		'LocalString': 0x1C,
	},
	
	//----------------------------------
	
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
