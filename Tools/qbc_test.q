/* 
 ---------------------------------------
 NodeQBC Test Suite
 (This is in a block comment!)
 ---------------------------------------
*/

; Semicolons can be used as comments too
// As well as double slashes

// Test QBKeys
short_qbkey=test
long_qbkey=`Black Metal`            // QBC syntax
long_qbkey=#"Black Metal"         // Neversoft syntax

// Test pair / vector
qbc_pair=(1.0, 2.0)
qbc_vector=(1.0, -2.0, 3.0)

// Test simple value types
qbc_float=123.0
qbc_int=5
qbc_string='QB String! (Cool!)'
qbc_widestring = "QB WString! (Big!)"

// Test structures
qb_struct={
	struct_int=2
	struct_struct={ sub_int=2 sub_float=3.0 }
	struct_float=3.0
	struct_array=[ 1 2 3 ]
	single_key
	another_single_key
}

// Test arrays
int_array = [ 1 2 3 ]
float_array = [ 1.0 2.0 3.0 ]
string_array = [ 'A' 'B' 'C' ]
wstring_array = [ "A" "B" "C" ]
struct_array = [
	{integer=1 float=2.0}
	{integer=2 float=4.0}
]

// Test localized strings
local_string = qs(local_string_key)
long_local_string = qs(`long local string`)

// --------------------------------------------------
// TEST SCRIPTS
// --------------------------------------------------

// -- Test local values ------
script qbc_test_locals
	integer = 2
	printf "Integer: %g" g=<integer>
	
	float = 2.0
	printf "Float: %g" g=<float>
	
	string = 'QBC string'
	printf "String: %g" g=<string>
    
	wstring = "QBC string"
	printf "WString: %g" g=<wstring>
	
	pair = (1.0, 2.0)
	printf "Pair: %g" g=<pair>
	
	vector = (1.0, 2.0, 3.0)
	printf "Vector: %g" g=<vector>
endscript

// -- Test math --------------
script qbc_test_math
	printf "2 + 2 is %g" g=(2+2)
	printf "2 - 2 is %g" g=(2-2)
	printf "2 * 2 is %g" g=(2*2)
	printf "2 / 2 is %g" g=(2/2)
	
	a = 5
	b = 3
	printf "a is %g, b is %h" g=<a> h=<b>
	printf "a + b is %g" g=(<a> + <b>)
	printf "a - b is %g" g=(<a> - <b>)
	printf "a * b is %g" g=(<a> * <b>)
	printf "a / b is %g" g=(<a> / <b>)
endscript

// -- Test globalmap ---------
script qbc_test_globalmap
	printf "short_qbkey: %g" g=$short_qbkey
	printf "long_qbkey: %g" g=$long_qbkey
	printf "qbc_pair: %g" g=$qbc_pair
	printf "qbc_vector: %g" g=$qbc_vector
	printf "qbc_float: %g" g=$qbc_float
	printf "qbc_int: %g" g=$qbc_int
	printf "qbc_string: %g" g=$qbc_string
endscript

// -- Test struct . ----------
script qbc_test_structdot
	my_struct = {int=5 float=2.0}
	printf "my_struct int: %g" g=(<my_struct>.int)
	printf "my_struct float: %g" g=(<my_struct>.float)
endscript

// -- Test switch ------------
script qbc_test_switch
	int=3
	
	switch <int>
		case 1
			printf "int is 1"
		case 2
			printf "int is 2"
		case 3
			printf "int is 3, GOOD"
		default
			printf "int is default"
	endswitch
	
	switch <int>
		default
			printf "Default-only switch, GOOD"
	endswitch
	
	switch <int>
		case 2
			printf "int is 2"
		default
			printf "Third switch, default again! GOOD"
	endswitch
	
endscript

// -- Test conditionals ------
script qbc_test_conditional
	int=2
	
	if (<int> = 2)
		printf "int = 2, GOOD"
	else
		printf "int = is else"
	endif
	
	if (<int> = 3)
		printf "int = 3"
	elseif (<int> = 2)
		printf "int = 2 elseif, GOOD"
	else
		printf "int elseif is else"
	endif

endscript

// -- Test arrays ------------
script qbc_test_arrays
	array = [2 4 6 8 10]
	printf "Int array item 2: %g" g=(<array>[2])
	
	array = [2.2 4.4 6.6 8.8 10.10]
	printf "Float array item 1: %g" g=(<array>[1])
	
	array = [
		"Item 0"
		"Item 1"
		"Item 2"
	]
	
	printf "String array item 0: %g" g=(<array>[0])
	
endscript

// -- Test > < >= <= ------
script qbc_test_greaterless
	a = 5
	b = 10
	
	printf "a is %g, b is %h" g=<a> h=<b>
	
	if (<a> > <b>)
		printf "a is > b"
	else
		printf "a is NOT > b"
	endif
	
	if (<a> < <b>)
		printf "a is < b"
	else
		printf "a is NOT < b"
	endif
	
	if (<a> >= 5)
		printf "a is >= 5"
	else
		printf "a is NOT >= 5"
	endif
	
	if (<b> <= 10)
		printf "b is <= 10"
	else
		printf "b is NOT <= 10"
	endif
	
endscript

// -- Test begins ------------
script qbc_test_begin

	repeat_count = 6
	printf "repeat_count is %g" g=<repeat_count>
	
	index = 0
	begin
		printf "index: %g" g=<index>
		<index> = (<index> + 1)
	repeat <repeat_count>
	
	printf "Trying again, stopping at 3..."
	<index> = 0
	
	begin
		if (<index> = 3)
			break
		endif
		
		printf "index: %g" g=<index>
		<index> = (<index> + 1)
	repeat <repeat_count>

endscript

// -- Test return ------------
// (Used in below script)
script qbc_test_return_getvalue
	printf "qbc_test_return_getvalue called, returning 5..."
	return value=5
endscript

// -- Test return ------------
script qbc_test_return
	printf "Getting value from other script..."
	qbc_test_return_getvalue
	printf "value: %g" g=<value>
	
	return
	
	printf "If you see this, return FAILED"
endscript

// -- Test randoms -----------
script qbc_test_randoms
	Random (
		@*4 printf "Random A"
		@*2 printf "Random B"
		@ printf "Random C"
	)
	
	Random2 (
		@*4 printf "Random2 A"
		@*2 printf "Random2 B"
		@ printf "Random2 C"
	)
	
	RandomNoRepeat (
		@*4 printf "RandomNoRepeat A"
		@*2 printf "RandomNoRepeat B"
		@ printf "RandomNoRepeat C"
	)
	
	RandomPermute (
		@*4 printf "RandomPermute A"
		@*2 printf "RandomPermute B"
		@ printf "RandomPermute C"
	)
endscript

// -- Test logical words -----
script qbc_test_logicals
	a = 2
	b = 4
	
	printf "a is %g, b is %h" g=<a> h=<b>
	
	if ( (<a>=2) & (<b>=4) )
		printf "a = 2 AND b = 4, GOOD"
	else
		printf "and check FAIL"
	endif
	
	if NOT (<a> = 4)
		printf "NOT a = 4, GOOD"
	else
		printf "not check FAIL"
	endif
	
	if ( (<a>=2) || (<b>=4) )
		printf "a = 2 OR b = 4, GOOD"
	else
		printf "or check FAIL"
	endif
	
	if ( <a> != <b> )
		printf "a != b, GOOD"
	else
		printf "!= FAIL"
	endif
	
endscript

// -- Test allargs -----------
// (Used in below script)
script qbc_test_allargs_print
	printf "Allargs print - Int: %g, Float: %h" g=<int> h=<float>
endscript

// -- Test allargs -----------
script qbc_test_allargs
	int=5
	float=3.0
	
	printf "Calling print with allargs (int: %g, float: %h)" g=<int> h=<float>
	qbc_test_allargs_print <...>
endscript

// -- Test random ranges -----
script qbc_test_randomranges
	printf "RandomFloat (0.0, 4.0): %g" g=RandomFloat (0.0, 4.0)
	printf "RandomInteger (0.0, 3.0): %g" g=RandomInteger (0.0, 3.0)
endscript

// -- Test odd strings -----
script qbc_test_oddstrings
	printf "switch"
	printf "else"
	printf "elseif"
	printf "case"
	printf "String (cool!) with ** a lot: of@ 'symbols!'"
    printf 'small string with \' escaped apostrophe!'
    printf "WIDESTRING: D:\\MyDrive\\Path\\CoolPath\\"
    printf 'SMALLSTRING: D:\\MyDrive\\Path\\CoolPath\\'
endscript

// -- Test 0x4A structs ------
script qbc_test_pakstructs
    my_struct = \{integer=2 float=5.0}
    printstruct <my_struct>
endscript

// -- Main script ------------
script sandbox_execute
	printf "--------------------"
	printf "Running NodeQBC tests..."
	printf "--------------------"
	printf ""
	
	printf "- Testing local values..."
	qbc_test_locals
	
	printf "- Testing math..."
	qbc_test_math
	
	printf "- Testing globalmap..."
	qbc_test_globalmap
	
	printf "- Testing . for struct..."
	qbc_test_structdot
	
	printf "- Testing switch statements..."
	qbc_test_switch
	
	printf "- Testing conditionals..."
	qbc_test_conditional
	
	printf "- Testing array access..."
	qbc_test_arrays
	
	printf "- Testing greater than less than..."
	qbc_test_greaterless
	
	printf "- Testing begin / repeat..."
	qbc_test_begin
	
	printf "- Testing return..."
	qbc_test_return
	
	printf "- Testing randoms..."
	qbc_test_randoms
	
	printf "- Testing logical keywords..."
	qbc_test_logicals
	
	printf "- Testing allargs..."
	qbc_test_allargs
	
	printf "- Testing random ranges..."
	qbc_test_randomranges
	
	printf "- Testing odd strings..."
	qbc_test_oddstrings
    
    printf "- Testing 0x4A structs..."
    qbc_test_pakstructs
	
	printf "--------------------"
	printf "If you see this, tests SUCCEEDED"
endscript
