# test for compiler release

https://web.archive.org/web/20190428042357/http://www.thps-mods.com/forum/viewtopic.php?f=20&t=5656 <br>
Qb file decompiler/compiler for neversoft games. <br>
Works with PreQb format (THPS3, THPS4, THUG1, THUG2, etc.) and PakQb format (THAW, THP8, THDJ, THPG, etc.).<br>
Decompiles to a less tokenized syntax than blubs compiler.<br>
If you're already familiar with blubs compiler the transition to this syntax should be relatively simple.<br>

# Usage

This compiler tool is a console application.<br>
To open a command prompt either press Win+R from the keyboard to bring up the run dialog and type cmd and press enter or do a search for command prompt from the windows start menu and select the first item in the list of found programs.

```
qconsole -d "c:\user\me\scripts\game\menu\gamemenu.qb" -dbl
```
<br>
```
QConsole Usage - v#
 [-?,-help]             Displays this usage.
 [-c]                   Followed by a filename or directory of script(s) to compile.
 [-d]                   Followed by a filename or directory of script(s) to decompile.
 [-def]                 Followed by a filename of a define file.
 [-r]                   If filename is a directory allow recursive parsing of all subdirectories.
 [-o]                   Followed by a space and a full path to output the file(s).
 [-bigendian,-be]       Sets Endianness of the script to BigEndain.
						If decompiling the tool will attempt to correct endianness.
 [-excludetable,-et]    Exclude checksum names from compiled scripts.
 [-ngc]                 Turns Unicode off when compiling BigEndian scripts.
 
 [-thps3,-thps4,-thug1,-thug2,-thaw,-thp8,-thpg]
						Set output game format when compiling.
 
 [-dbl]                 If decompiling or dumping a table allow unknown checksums database lookup.
						*WARNING* this can be very slow!
						
						Dump checksum table
 [-dtc]                 Followed by a space and a filename. Rebuild from a .q script.
 [-dtd]                 Followed by a space and a filename. Rebuild from a compiled .qb script.
 [-odbg]                Output the table dump in dbg format.
 [-oqb]                 Output the table dump in qb format.
 [-oc]                  Output the table dump to the console, default.
```

## Define files
Define files are text files that include #define Keywords.<br>
Each #define must be on a new line. Keywords are case sensitive.<br>
You can #define in scripts too and/or use a define file so you can compile a group of scripts for different purposes, e.g. private builds or public builds. These defines are not preprocessed and build inline. Also, if you #define a keyword in a single script it is exclusive to that script and doesn't become globally known to the compiler if building multiple scripts.
<br><br>Within Qb files use these syntax keywords for conditional builds.

```
 #ifdef Keyword      If the keyword is defined build the code within this block up to the #else or #endif.
 #ifndef Keyword     If the keyword isn't defined build the code within this block up to the #else or #endif.
 #else               If #ifdef or #ifndef isn't true build the code within this block up to the #endif.
 #endif              Closes the #if #else block.
```

## -ngc flag
Some PakQb format files for specific platforms don't use unicode strings for string types that would otherwise be UTF16. Use this flag to specify unicode shouldn't be expected for these string types.
## -dbl flag
If this flag is set on decompile any unknown checksums will be looked up in a database of known checksums.<br>
This can be very slow depending on the size of the file and/or the number of files being decompiled.<br>
This tool doesn't need the checksum strings to be known in order to recompile scripts.<br>
## Dump Checksum Table
The dump checksum table feature will rebuild a checksum table from a provided file and output the contents based on the flags specified. -dtc Requires a valid .q file in order to compile and build the table. -dtd requires a valid .qb file in order to decompile and build a table. You can use the -dbl flag to search the database for unknown checksums to build a more complete checksum table. You can use any or all of the three flags -odbg, -oqb, -oc for output. If no flag is supplied the default is -oc.
- `-odbg` Output the table in the format of .dbg files like the ones found in dbg.pak.
- `-oqb` Outputs the table in binary format as you would find them at the end of a .qb file.
- `-oc` Output the table string names to the console.
Dump checksum table flags can be used with -c or -d during a compile or decompile instead of -dtc or -dtd and the tool will output the compiled or decompiled script and the table dump(s), Only dbg or qb table dumps will be output if -c compiling or -d decompiling.

# Syntax

A good way to learn about scripting is to read the scripts. The information below tries to explain the scripting language in a bit more detail.<br><br>
The string column below is the syntax of this compiler and blubs string column is the syntax of blubs compiler.<br>
This can be used to help those who are already familiar with blubs syntax or for new scripters to see this tool's syntax.<br>
Compiler keywords are not case sensitive.<br>
Floating point precision is 10 places after the decimal and to retain some of the values precision are cast to double internally.<br>
Multiline comments can contain nested multiline comments.<br>
Line-breaks can be performed using backslash \ at the end of a line. Line-break allows a single line to span multiple lines so your bytecode can be a bit smaller when coding structures or arrays while leaving the text representation of the script easier to read.

```
//  Token,                // int,byte,          string,             blubs string,
	Comment = -2,         //Multi-line comment  // or /**/          #/
	Null = -1,            // -1
	EndOfFile = 0,        // 0   0x00                               :end
	EndOfLine,            // 1   0x01                               :i
	EndOfLineNumbers,     // 2   0x02                               :u(????????)
	StartStruct,          // 3   0x03           {                   :s{
	EndStruct,            // 4   0x04           }                   :s}
	StartArray,           // 5   0x05           [                   :a{
	EndArray,             // 6   0x06           ]                   :a}
	Equals,               // 7   0x07           =                   =
	Dot,                  // 8   0x08           .                   ->
	Comma,                // 9   0x09           ,                   ;
	Minus,                // 10  0x0A           -                   -
	Add,                  // 11  0x0B           +                   +
	Divide,               // 12  0x0C           /                   /
	Multiply,             // 13  0x0D           *                   *
	OpenParenthesis,      // 14  0x0E           (                   (
	CloseParenthesis,     // 15  0x0F           )                   )
	SameAs,               // 17  0x11           ==                  N/A   ;the compiler translates to Equals
	LessThan,             // 18  0x12           <                   <
	LessThanEqual,        // 19  0x13           <=                  N/A   ;doesn't work in THUG1+; works in THPG
	GreaterThan,          // 20  0x14           >                   >
	GreaterThanEqual,     // 21  0x15           >=                  N/A   ;doesn't work in THUG1+; works in THPG
	Name,                 // 22  0x16           name or #"na me"    $name$
	Integer,              // 23  0x17           ?                   %i(?,????????)
	HexInteger,           // 24  0x18           0x????????          N/A
	Float,                // 26  0x1A           ?.?                 %f(?.??????)
	String,               // 27  0x1B           ""                  %s(?,"")
	LocalString,          // 28  0x1C           ''                  %sc(?,"")
	Vector,               // 30  0x1E           (?.?,?.?,?.?)       %vec3(?.??????,?.??????,?.??????)
	Pair,                 // 31  0x1F           (?.?,?.?)           %vec2(?.??????,?.??????)
	While,                // 32  0x20           while               while
	Repeat,               // 33  0x21           repeat              loop_to
	Break,                // 34  0x22           break               continue
	Script,               // 35  0x23           script              function
	EndScript,            // 36  0x24           endscript           endfunction
	If,                   // 37  0x25           if                  doIf
	Else,                 // 38  0x26           else                doElse
	ElseIf,               // 39  0x27           elseif              N/A   ;doesn't work in THUG1+; works in THPG
	EndIf,                // 40  0x28           endif               endif
	Return,               // 41  0x29           return              return
	ChecksumName,         // 43  0x2B           Table entries never make it into the .q
	AllArguments,         // 44  0x2C           <...>               isNull
	Argument,             // 45  0x2D           <?>                 %GLOBAL%
	LongJump,             // 46  0x2E           !See 0x58 below     break_to
	Random,               // 47  0x2F           Random              select
	RandomRange,          // 48  0x30           RandomRange         N/A
	// Only used internally by the compiler, never appears in a .qb, used as the random item identifier.
	KeywordAt,            // 49  0x31           @                   POS(?)
	Or,                   // 50  0x32           || or OR            OR
	And,                  // 51  0x33           && or AND           AND
	Xor,                  // 52  0x34           ^| or XOR           N/A   ;untested
	ShiftLeft,            // 53  0x35           <<                  N/A   ;doesn't work in THUG1+;
	ShiftRight,           // 54  0x36           >>                  N/A   ;doesn't work in THUG1+;
	Random2,              // 55  0x37           Random2             select
	RandomRange2,         // 56  0x38           RandomRange2        N/A
	KeywordNot,           // 57  0x39           NOT                 NOT
	Switch,               // 60  0x3C           switch              switch
	EndSwitch,            // 61  0x3D           endswitch           end_switch
	Case,                 // 62  0x3E           case                case
	Default,              // 63  0x3F           default             default
	RandomNoRepeat,       // 64  0x40           RandomNoRepeat      select
	RandomPermute,        // 65  0x41           RandomPermute       select
	Colon,                // 66  0x42           ::                  .
	If2,                  // 71  0x47           if                  if
	Else2,                // 72  0x48           else                else
	ShortJump,            // 73  0x49           N/A                 endcase
	
	// THAW+ additional tokens
	PakStruct,            // 74  0x4A           :{                  N/A
	// these 2 were found in THPG along with elseif
	PakArgument,          // 75  0x4B           :<>                 N/A
	PakStringW,           // 76  0x4C           :''                 N/A
	
	// Only used internally by the compiler, never appears in a .qb
	Define           = 82,// 82  0x52           #define
	IfDef            = 83,// 83  0x53           #ifdef
	ElseDef          = 84,// 84  0x54           #else
	EndIfDef         = 85,// 85  0x55           #endif
	IfNotDef         = 86,// 86  0x56           #ifndef
	
	// These output as Jump tokens 0x2E but are used outside of randoms so we need to handle them differently in code.
	LoneJumpLocation = 87,// 87  0x57           keyword:            N/A
	LoneJump         = 88,// 88  0x58           #goto keyword       N/A
	
	// Added to trigger when to rebuild the PakQbStruct when compiling
	PakStructClose   = 89,// 89  0x59           }:                  N/A
	
	// Added to store the PakQb FileId on decompile so the file keeps the same FileId
	// If compiling for THAW+ and this doesn't exist a FileId will be created based on the file name
	// PakMagic is actually the first 4 bytes of a PakQb file and while usually 0 can be a checksum
	// PakFileId is the checksum associated with this file
	// typically a checksum of the full path and file name as it appears in qdir.txt
	PakMagic         = 90,// 90  0x5A           #magic #"0x"
	PakFileId        = 91,// 91  0x5B           #fileid #"0x"
	//PakQb scripts have more than 1 QbKey type and more than one QbInteger type
	PakQBKey2        = 92,// 92  0x5C           QbKey2(?) uint2(?)  N/A
	PakQBKey3        = 93,// 93  0x5D           QbKey3(?) uint3(?)  N/A
	PakInteger2      = 94,// 94  0x5E           QbInt2(?) int2(?)   N/A
```

## Qb File Structure
The Qb file has main data types supported as global items. Anything at the root of a Qb file is seen globally by the game as long as the file is loaded into memory. All Qb file types must be in the form of something = someValue. Meaning they must have an identifier name for the variable and a value for the variable. Scripts don't need the equals sign but must have the variable name. Names should not be repeated throughout all Qb files because the first loaded variable with that name takes precedence and can lead to painfully complicated debugging.

## Data Types

- **Integer**: Number value without a decimal point +/-. *someInteger = 1 or someInteger = -1*

- **HexInteger**: Hex number value. 0x1A2B3C4D

- **Float**: Number value with a decimal point +/-. *someFloat = 0.1 or someFloat = -0.1*

- **Pair**: Two floating point numbers wrapped in parenthesis +/-. *somePair = (0.1,32.67)*

- **Vector**: Three floating point numbers wrapped in parenthesis +/-. *someVector = (0.1,0.2,-0.3)*

- **String**: Text wrapped in double quotes. *someString = "Hello world"*

- **LocalString**: Text wrapped in single quotes. *someLocalString = 'Hello World'*

- **Name (QbKey)**: Name checksums; If the checksum is a keyword of the compiler or contains special characters like a space these will appear as #"some checksum" or #"switch" else they're just the text. If the checksum name is unknown they'll appear with the same syntax as unique checksums but will contain the hex checksum value #"0x0C1523F0". The compiler doesn't need to know the valid text in order to compile a Qb file.
- - *someChecksum = MyChecksum or someChecksum = #"My Checksum"*

- **Array**: Arrays are collections of items with the same value type. Arrays support all data types except scripts.
- - *someArray = [1 2 3]*
			
- **Struct**: Collection of variables to be used as a single data block. Structs support all data types including scripts and variables can be nameless.
- - *someStruct = { value1 = 4 value2 = 5.973 value3 } or wait { 3 seconds }.* Contains a nameless integer and a nameless checksum.

- **Script**: Scripts are functions and can be written to give a great deal of new functionality to the game. All data types except scripts are supported in scripts, as well as many other data types only supported inside scripts. For THAW+ you get a few extra supported data types. For brevity scripts won't be explained in full detail here.
```
script someScript
//script content
endscript
```

// THAW+
- **PakQBKey2**: Other name checksum types used in PakQb format. Typically only seen in structs.
- - *someChecksum = QbKey2(MyChecksum) or someChecksum = QbKey2(#"My Checksum")*
		
- **PakQBKey3**: Other name checksum types used in PakQb format. Typically only seen in structs.
- - *someChecksum = QbKey3(MyChecksum) or someChecksum = QbKey3(#"My Checksum")*
		
- **PakInteger2**: Another integer type used in PakQb format. Typically only seen in structs.
- - *someInteger = QbInteger2(1) or someInteger = QbInteger2(-1)*


## Script Data Types
Scripts support all the data types above with the exception of scripts, but they also support many more types. This section will go over mostly the more complex/less known types to give a better understanding of how they should be coded with this tool. Scripts must have the script keyword and a variable name and the endscript keyword. The script and endscript keywords must be on their own line and the endscript must be the only item on the line. Q scripts don't support a signature, but you can still pass data to scripts. You can also add default values to the script much like a signature in the event the caller function doesn't supply them. For the values to be considered part of the scripts arguments they must be on the same line as the script keyword and its variable name.

```
// global integer value to demonstrate how to change global values
someInteger = 60

script scriptNoArguments
   scriptWithArguments height = 270
endscript

script scriptWithArguments scale = 4
   // Since I didn't pass the argument of scale the script assumes the default value of 4.
   // Below is another way to check if your script contains the arguments you're expecting.
   // If they don't exist give them default values.
   if NOT GotParam height
	  height = 360
   endif
   // To access the script arguments you use the Arguments <> syntax
   <height> = (<height> * <scale>)
   // Any local variable created within the script becomes a part of its arguments
   width = ((((<height> / 3) * <scale>) / 3) * <scale>)
   // The change function sets a global variable to the value being passed
   change someInteger = (<height> * <width>) // someInteger now has a value of 2073600
endscript
```

### While
These are simple loops that allow code to be executed repeatedly. Unlike other languages these loops don't support a condition. The while keyword must be the only item on its line and must be closed with a repeat keyword. The repeat keyword must be on its own line and the first item on the line. The repeat keyword can be followed by a variable clause for the number of iterations to perform or left empty. The game will perform infinite loop checks. In order for your loop to not be seen as an infinite loop there must be a break somewhere within the body of the while loop.
```
someArray = [
   { Enabled = 1 ID = _element0 value = 45 }
   { Enabled = 1 ID = _element1 value = 83 }
   { Enabled = 0 ID = _element2 value = 57 }
   { Enabled = 1 ID = _element3 value = 29 }
]

script whileLoopScript
   index = 0
   // Make a copy of our array
   temp_array = someArray
   // GetArraySize adds an argument to the script named array_size.
   GetArraySize someArray
   while
	  if (((someArray[<index>]).Enabled) = 1)
		 temp_value = (((someArray[<index>]).value) * 2)
		 // Create a new structure based on the structure item at <index> and our new value
		 temp_struct = { enabled = 1 ID = ((someArray[<index>]).ID) value = <temp_value> }
		 // Change the array item
		 SetArrayElement { arrayname = temp_array index = <index> newvalue = <temp_struct> }
		 // format a string of the index and value of the array at index
		 FormatText textname = temp "%i, %x, %y" i = <index> x = ((someArray[<index>]).value) y = ((<tempt_array>[<index>]).value)
		 printf <temp>
	  endif
	  // keep track of index to use in your code
	  <index> = (<index> + 1)
   repeat <array_size>
   // Change some array to be our new edited array
   someArray = <temp_array>
endscript

script whileLoopScript2
   index = 0
   number = 100
   while
	  if (<number> > 33)
		 // adjust our number variable
		 <number> = (<number> - 1)
	  else
		 // break out of the loop
		 break
	  endif
   repeat
endscript
```
To make an infinite loop have a break somewhere in the loop.
```
script whileLoopInfinite
   number = -1
   while
	  // We never increment our number argument.
	  if (<number> > -1)
		 // Add a break to satisfy the games infinite loop check.
		 break
	  endif
	  // do loop code here
   repeat
endscript
```

### Return
Scripts can return all the data types above with the exception of scripts. You can return multiple items as long as each item is on the same line as the return keyword. If returning a struct or an array make sure at least the open struct or open array token is on the same line as the return keyword.

```		
script returnScript1
   return value = 400
endscript

script returnScript2
   // returns a structure of items
   return value = 400 size = 4286
endscript

script returnScript3
   // returns a structure of items
   return {
	  value = 400
	  size = 4286
   }
endscript
```
You can return all the arguments of a script by using the AllArguments token <...>.
```
script returnScriptAllArguments
   width = 1920
   height = 1080
   area = (<width> * <height>)
   return <...>
endscript

script receiveScriptAllArguments
   returnScriptAllArguments
   FormatText textname = temp "width = %w, height = %h, area = %a" w = <width> h = <height> a = <area>
   printf <temp>
endscript
```

### Random, Random2, RandomPermute, RandomNoRepeat
You can use the random keywords either as an item returning a value or to randomly execute blocks of code. The random keyword must be followed by open parenthesis and close parenthesis after the randoms code. At @ tokens determine the next random item. You can apply weight values for each random item by appending an asterisk and a number to the @ token. Weights determine how many times this item repeats in the list of random items. THPS3 and THPS4 don't support weight values.

```
script randomScript
   text = Random(
	  // Fire will appear 5 times in the list
	  @*5 "Fire"
	  // Wind will appear twice in the list
	  @*2 "Wind"
	  @ "Water"
   )
   temp_value = Random(@1 @2 @3 @4 @5)
   if (<text> = "Fire")
	  new_value = (<temp_value> * 6)
   else
	  if (<text> = "Wind")
		 new_value = (<temp_value> * 8)
	  else
		 if (<text> = "Water")
			new_value = (<temp_value> * 4)
		 endif
	  endif
   endif
   FormatText textname = temp "%s, scale = %n, intensity = %v" s = <text> n = <temp_value> v = <new_value>
   printf <temp>
endscript

script randomScript2
   index = 0
   while
	  if (<index> < 100)
		 Random(
			@ printf "One"
			@ printf "Two"
			@ printf "Three"
			@ printf "Four"
			@ printf "Five"
		 )
	  else
		 break
	  endif
	  <index> = (<index> + 1)
   repeat
endscript
```

### RandomRange, RandomRange2
RandomeRange keyword must be followed by a pair value type.

```
script randomRangeScript
   temp_index = 2
   temp_value = RandomRange(0.0, 5.0)
   <temp_value> = (<temp_value> * ((someArray[<temp_index>]).value))
   temp_struct = {
	  enabled = ((someArray[<temp_index>]).Enabled)
	  ID = ((someArray[<temp_index>]).ID)
	  value = <temp_value>
   }
   temp_array = someArray
   SetArrayElement { arrayname = temp_array index = <temp_index> newvalue = <temp_struct> }
   someArray = <temp_array>
endscript
```

### Goto
The #goto keyword allows you to jump to keyword: locations within a script. You can jump forward or backward within a script. Keywords are case sensitive. Location keywords should be the only thing on their line. In the majority of cases, if not all cases, you will never need this. Use with extreme caution and never inside of a Random, Random2, RandomPermute, or RandomNoRepeat.
```
script gotoScript
   temp_value = 0
   //keyword to jump to. Append a colon to the end of goto location keywords.
   jump_location1:
   if (<temp_value> < 3)
	  <temp_value> = 5
	  // jumps backwards
	  printf "jumping backwards"
	  #goto jump_location1
   else
	  // jumps forwards
	  printf "jumping forwards"
	  #goto Jump_Location2
   endif
   //keyword to jump to. Append a colon to the end of goto location keywords.
   Jump_Location2:
endscript
```		
		
###	#Define, #ifdef, #ifndef, #else, #endif
These allow the inclusion or exclusion of code during compile. Define files were explained in the usage section above. Below I'll explain how they should be coded with keywords being defined within the script. The same rules apply whether you're defining your keywords in a define file or within the script. Defined keywords are case sensitive.
```
// These compiler keywords can appear anywhere in a Qb file
#define release_build
#define test_something

script someScript
#ifdef release_build
   // place code specific to release builds here
#else
   // place code not specific to release builds here
   // perhaps with more error checking or printf statements
#endif
endscript

#ifdef developer_build
script someDevScript
endscript
#endif

script testScript
   // some code here
   #ifndef test_something
	  // some non specific test code here
   #endif
   // some more code here
   #ifdef test_something
	  // some specific test code here
   #endif
endscript

// You can also define keywords based on another keyword.
// Can be useful when compiling with define files to allow specific based on build.
#ifdef developer_build
#define allow_something_special
#endif

script testScript2
   #ifdef allow_something_special
	  // specific code associated to the defined keyword goes here
   #else
	  // else normal code
   #endif
endscript
```		
		
### PakStruct
THAW and newer games struct type. The syntax for open and close tokens are :{ }: and should be otherwise the same as struct types. When compiling for older games the compiler will output as PreQb struct type.
```
script pakStructScript :{
	  value = 5
	  text = "Hello"
   }:
   temp_struct = :{
	  value = <value>
	  text = <text>
   }:
   FormatText textname = temp "%v, %t World" v = ((<temp_struct>.value) * 5) t = <temp_struct>.text
   printf :{ <temp> }:
endscript
```

### PakArgument
THAW and newer games checksum type which references a global item. Syntax :<>.

```
someArray = [ 0 1 2 3 ]

script pakArgumentScript
   temp_array = :<someArray>
   // do something with temp_array
endscript
```
		
### PakStringW
UTF16 string withing scripts. So Far only seen in THP8 and THPG big endian games. Syntax is a colon followed by a single quote wrapped string :''.
```
script pakStringWScript
   printf :'Hello World'
endscript
```

### PakMagic
Added this type to cater for older PakQb format files. This value is the first 4 bytes of the PakQb file. For THAW and newer games this value has only ever been seems as 0x00000000. However, THUG2 PS2 PakQb format files have their magic value as a checksum. The decompiler will only output this type if its value isn't 0.
```
#magic #"0xA1B2C3D4"
```

### PakFileId
The File ID is the checksum associated to the QB file. All root items of a PakQb file store an ID checksum. This value is typically a checksum of the full path and file name for this qb as seen in qdir.txt.
```
#fileid #"0xA1B2C3D4"
```