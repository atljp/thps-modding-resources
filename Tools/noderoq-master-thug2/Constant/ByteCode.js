// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Q B   B Y T E C O D E   C O N S T A N T
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const bCode = {
	
	// 0x00: End script
	SCRIPT_END: 0x00,
	
	// 0x01: New instruction
	NEW_INSTRUCTION: 0x01,
	
	// 0x02: End of line number (Followed by long value apparently)
	END_OF_LINE_NUMBER: 0x02,
	
	// 0x03: Struct start
	STRUCT_START: 0x03,
	
	// 0x04: Struct end
	STRUCT_END: 0x04,
	
	// 0x05: Array start
	ARRAY_START: 0x05,
	
	// 0x06: Array end
	ARRAY_END: 0x06,
	
	// 0x07: Equals (followed by value)
	EQUALS: 0x07,
	
	// 0x08: Dot (followed by member name)
	// This is a literal dot, ex. MyStruct.MyValue
	DOT: 0x08,
	
	// 0X09: Comma ???
	COMMA: 0x09,
	
	// 0x0A: Minus (followed by value to subtract)
	MINUS: 0x0A,
	
	// 0x0B: Plus (followed by value to add)
	PLUS: 0x0B,
	
	// 0x0C: Divide (followed by value to divide)
	DIVIDE: 0x0C,
	
	// 0x0D: Multiply (followed by value to multiply)
	MULTIPLY: 0x0D,
	
	// 0x0E: Nesting increase (parentheses)
	NESTING_INCREASE: 0x0E,
	
	// 0x0F: Nesting decrease (parentheses)
	NESTING_DECREASE: 0x0F,
	
	// 0x10: Never used
	TEN_NEVER_USED: 0x10,
	
	// 0x11: ==
	EQUALS_COMPARE: 0x11,
	
	// 0x12: <
	LESS_THAN: 0x12,
	
	// 0x13: <=
	LESS_THAN_EQUALS: 0x13,
	
	// 0x14: >
	GREATER_THAN: 0x14,
	
	// 0x15: >=
	GREATER_THAN_EQUALS: 0x15,
	
	// 0x16: Symbol hash (followed by crc32 of symbol)
	SYMBOL_HASH: 0x16,
	
	// 0x17: Long integer
	INTEGER: 0x17,
	
	// 0x18: Hex integer
	INTEGER_HEX: 0x18,
	
	// 0x19: Enum
	ENUM: 0x19,
	
	// 0x1A: Single float, followed by float)
	FLOAT: 0x1A,
	
	// 0x1B: String (followed by long length, then null terminator)
	STRING: 0x1B,
	
	// 0x1C: String ???
	STRING_UNKNOWN: 0x1C,
	
	// 0x1D: Array (What's different from this and the other one?
	ARRAY_UNKNOWN: 0x1D,
	
	// 0x1E: Vector (followed by 3 floats)
	VEC3: 0x1E,
	
	// 0x1F: Pair (followed by 2 floads)
	VEC2: 0x1F,
	
	// 0x20: Begin
	// This seems to be the equivalent of "while"
	BEGIN: 0x20,
	
	// 0x21: Repeat
	// Equivalent of (loop_to) in qb
	REPEAT: 0x21,
	
	// 0x22: Break / Continue
	BREAK: 0x22,
	
	// 0x23: Function (followed by function qb)
	FUNCTION_START: 0x23,
	
	// 0x24: End function
	FUNCTION_END: 0x24,
	
	// 0x25: If (THUG1)
	IF_THUG: 0x25,
	
	// 0x26: Else (THUG1)
	ELSE_THUG: 0x26,
	
	// 0x27: Elseif (THUG1? / GHWT)
	ELSEIF: 0x27,
	
	// 0x28: EndIf
	ENDIF: 0x28,
	
	// 0x29: Return
	RETURN: 0x29,
	
	// 0x2A: Undefined (is this actually used?)
	UNDEFINED: 0x2A,
	
	// 0x2B: Debug symbol entry (followed by crc32 and symbol text)
	SYMBOL_ENTRY: 0x2B,
	
	// 0x2C: AllArgs (refers to pParams) - Internally, NS uses <...>
	ALL_ARGS: 0x2C,
	
	// 0x2D: ArgStack variable (%GLOBAL%)
	ARGSTACK: 0x2D,
	
	// 0x2E: Jump (followed by long offset to jump to, RELATIVE TO THE END OF THE LONG)
	JUMP: 0x2E,
	
	// 0x2F: Random (Same as 0x40)
	// Followed by long for amount of options
	RANDOM: 0x2F,
	
	// 0x30: Random range (Precedes a vec2 / pair)
	RANDOM_RANGE: 0x30,
	
	// 0x31: @ character
	AT: 0x31,
	
	// 0x32: Or (followed by second if condition)
	OR: 0x32,
	
	// 0x33: And (followed by second if condition)
	AND: 0x33,
	
	// 0x34: Or ???
	OR_UNKNOWN: 0x34,
	
	// 0x35: <<
	SHIFT_LEFT: 0x35,
	
	// 0x36: >>
	SHIFT_RIGHT: 0x36,
	
	// 0x37: random2
	RANDOM_2: 0x37,
	
	// 0x38: randomrange2
	RANDOM_RANGE_2: 0x38,
	
	// 0x39: Not (After if, negates if condition)
	NOT: 0x39,
	
	// 0x3A: And ???
	AND_UNKNOWN: 0x3A,
	
	// 0x3B: Or ???
	OR_UNKNOWN_2: 0x3B,
	
	// 0x3C: Switch (followed by switch value and cases)
	SWITCH_START: 0x3C,
	
	// 0x3D: Switch end
	SWITCH_END: 0x3D,
	
	// 0x3E: Case (followed by short break and case value)
	CASE: 0x3E,
	
	// 0x3F: Default case( followed by default switch code)
	CASE_DEFAULT: 0x3F,
	
	// 0x40: randomnorepeat
	RANDOM_3: 0x40,
	
	// 0x41: randompermute / randomshuffle
	RANDOM_4: 0x41,
	
	// 0x42: Colon (Is this ever used in native QB????)
	
	// Check if the name is followed by a colon, in which case the name is the id of some object.
	// if (*mp_pc==ESCRIPTTOKEN_COLON)
	
	COLON: 0x42,
	
	// 0x43: Never used
	NEVER_USED_A: 0x43,
	
	// 0x44: Never used
	NEVER_USED_B: 0x44,
	
	// 0x45: useheap, what is it for?
	UNKNOWN_45: 0x45,
	
	// 0x46: Unknown
	UNKNOWN_46: 0x46,
	
	// 0x47: THUG2 If (followed by short offset to next comparison)
	IF: 0x47,
	
	// 0x48: THUG2 Else (followed by short offset to next comparison)
	ELSE: 0x48,
	
	// 0x49: Short break
	SHORT_BREAK: 0x49,
	
	// 0x4A: THAW script structure item
	// (These are structures!)
	THAW_STRUCTURE: 0x4A,
	
	// 0x4B: Refers to a value in the global map
	THAW_UNKNOWN: 0x4B,
	
	// 0x4C: Apparently this is \\F string or wide string
	STRING_F: 0x4C,
	
	// 0x4D: Used in GHWT, this seems to be right?
	EQUALS_DIFFERENT: 0x4D,
	
	// 0x4E: Localized string
	QB_STRING: 0x4E,
	
	// 0x4F: randomfloat, precedes vec2
	THAW_FOURF: 0x4F,
	
	// 0x50: randominteger
	THAW_FIFTY: 0x50,
	
	// 0x5E: ???
	THAW_FIVEE: 0x5E
};

module.exports = bCode;
