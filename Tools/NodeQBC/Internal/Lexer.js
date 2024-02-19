// ---------------------------------------------------
//
//	LEXER TOKEN
//	Used for the lexer
//
// ---------------------------------------------------

class LexerToken
{
	constructor(lexer)
	{
		this.lexer = lexer;
		this.type = "";
		this.value = 0;
	}
}

// ---------------------------------------------------
//
//	LEXER
//	Used in compiling, this converts
//	text things into usable tokens and bytecode
//
// ---------------------------------------------------

// Maximum amount of numbers that can be in a single vector
// (GHWT does not have 4D vectors, only 2D and 3D)

const MAX_VECTOR_NUMBERS = 3;

// Maximum number of keywords to forward-check for vector ('s

const MAX_VECTOR_CHECK = 20;

// Internal

const COMMENT_NONE = 0;
const COMMENT_LINE = 1;
const COMMENT_BLOCK = 2;

class QBCLexer
{
	constructor(job)
	{
		this.job = job;
		if (!this.job) { return; }

		// Offset that we're currently reading at
		this.offset = 0;

		// Tokens that we've parsed
		this.tokens = [];

		// Text data
		this.text = null;

		// Stop reading, regardless of where we are
		this.stopRead = false;

		// Should we skip spaces?
		// Spaces will be part of the keyword we're parsing
		this.inString = false;
		this.ignoreSpaces = false;
        
        // Are we in a long keyword?
        // This is similar to a string, except
        // it winds up being a QBKey.
        this.inLongKey = false;

		// The string we're in should be handled as a wide string.
		this.inWideString = false;

		// The type of character that our string or ignore started with.
		// This is used to allow things like apostrophes between quotes,
		// and quotes between apostrophes. Otherwise, the string would
		// prematurely end.
		this.stringCap = null;

		// In a comment?
		this.commentType = COMMENT_NONE;

		// Current script depth
		this.scriptDepth = 0;

		// Prepare current token
		this.ResetToken();

		// For post-lexing, which token are we looking at?
		this.tokenIndex = 0;

		this.Debug("Prepared lexer");
	}

	//-----------------------
	// Debug
	//-----------------------

	Debug(txt)
	{
		if (this.job)
			this.job.Debug(txt);
	}

	//-----------------------
	// Reset current token
	//-----------------------

	ResetToken() { this.currentToken = ""; }

	//-----------------------
	// We are in the top-level of our QB!
	// For THPG+ games, this is PakQB
	//-----------------------

	TopLevel() { return (this.scriptDepth == 0); }

	//-----------------------
    // Is this string a float string?
    // Make sure it actually is a float.
	//-----------------------
    
    IsFloatString(str)
    {
        for (var i=0; i<str.length; i++)
        {
            var ccd = str.charCodeAt(i);
            if (ccd == 46 || ccd == 45 || (ccd >= 48 && ccd <= 57))
                continue;
                
            return false;
        }
        
        return true;
    }
    
    //-----------------------
    // Is this string an int string?
    // Make sure it actually is an int.
	//-----------------------
    
    IsIntString(str)
    {
        for (var i=0; i<str.length; i++)
        {
            var ccd = str.charCodeAt(i);
            if (ccd == 45 || (ccd >= 48 && ccd <= 57))
                continue;
                
            return false;
        }
        
        return true;
    }
    
	//-----------------------
	// Finalize whatever token we started
	//-----------------------

	FinalizeToken()
	{
		if (!this.currentToken && !this.inString)
			return;

		// Remove trailing or following whitespace, just in case!
		this.currentToken = this.currentToken.replace(/[\n\r]/g, '');

		var tokenType = "";
		var tokenValue = this.currentToken;

		// If we were reading a string, current token will be a string
		if (this.inString)
			tokenType = this.inWideString ? "wstring" : "string";
		else if (!this.ignoreSpaces)
		{
			var wasFloat = false;

			// Has a period!
			if (this.currentToken.indexOf(".") >= 0 && this.IsFloatString(this.currentToken))
			{
				var floatVal = parseFloat(this.currentToken);

				if (!isNaN(floatVal))
				{
					tokenType = "float";
					tokenValue = floatVal;
					wasFloat = true;
				}
			}

			if (!wasFloat && this.IsIntString(this.currentToken))
			{
				var intVal = parseInt(this.currentToken);
				if (!isNaN(intVal))
				{
					tokenType = "int";
					tokenValue = intVal;
				}
			}
		}

		tokenType = tokenType || "keyword";

		if (tokenType == "keyword")
		{
			if (this.currentToken.length > 2)
			{
				// Do local arg check for <>
				var localStart = (this.currentToken[0] == "<");
				var localEnd = (this.currentToken[this.currentToken.length-1] == ">");

				// Has < but no >
				if (localStart && !localEnd)
				{
					this.Fail("Argument had < but no >: " + this.currentToken);
					return;
				}

				// Has > but no <
				else if (localEnd && !localStart)
				{
					this.Fail("Argument had > but no <: " + this.currentToken);
					return;
				}
			}

			// --------

			// If we're in a string, obviously don't check for keywords
			if (tokenType != "string" && tokenType != "wstring")
			{
				switch (this.currentToken.toLowerCase())
				{
					// Start script!
					case "script":
						this.scriptDepth ++;
						tokenType = "scriptstart";
						this.currentToken = "";
						break;

					// End script
					case "endscript":
						this.scriptDepth --;
						tokenType = "scriptend";
						this.currentToken = "";
						break;

					// Token types that should be just the word
					case "default":
					case "if":
					case "else":
					case "elseif":
					case "endif":
					case "begin":
					case "repeat":
					case "break":
					case "switch":
					case "case":
					case "endswitch":
					case "qs":
					case "random":
					case "random2":
					case "randomrange":
					case "randomrange2":
					case "randomnorepeat":
					case "randompermute":
					case "randomfloat":
					case "randominteger":
					case "return":
					case "not":
					case "<...>":
						tokenType = this.currentToken.toLowerCase();
						this.currentToken = "";
						break;
				}
			}
		}
        
        // Sanitary check for quotation marks.
        if (tokenType == "wstring" || tokenType == "string")
        {
            if (tokenValue.indexOf("\"") >= 0)
            {
                this.Fail("A string should NEVER have quotation marks inside of it. Please use double apostrophes. (" + tokenValue + ")");
                return;
            }
        }

		var token = this.AddToken(tokenType, tokenValue);

		this.ResetToken();
	}

	//-----------------------
	// Add a token!
	//-----------------------

	AddToken(type, value, finalize = false)
	{
		if (finalize)
			this.FinalizeToken();
            
		var token = new LexerToken(this);
        
		token.type = type;
		token.value = value;

		this.tokens.push(token);

		return token;
	}

	//-----------------------
	// We can read!
	//-----------------------

	CanRead()
	{
		if (this.stopRead)
			return false;

		if (!this.text)
			return false;

		if (this.offset >= this.text.length)
			return false;

		return true;
	}

	//-----------------------
	// Fail
	//-----------------------

	Fail(reason = "")
	{
		this.job.Fail("[@" + this.offset + "] LEXER FAIL: " + reason);
		this.stopRead = true;
	}

	//-----------------------
	// Begin reading text!
	//-----------------------

	Read()
	{
		// Can't read without a job!
		if (!this.job)
			return;

		this.text = this.job.data;
		this.offset = 0;

		this.Debug("Lexer is lexing...");

		while (this.CanRead())
		{
			this.ReadText();
		}

		this.Debug("Lexer finished lexing. Post-lex.");

		this.PostRead();
	}

	//-----------------------
	// Read text, this is done in a loop
	//-----------------------

	ReadText()
	{
		if (typeof(this.text) != "string")
		{
			this.Fail("The lexer can only read string input, not " + typeof(this.text) + ".");
			return;
		}

		var chr = this.text[this.offset];
		var ccd = chr.charCodeAt(0);

		// Read differently if we're in a comment of course!
		if (this.commentType != COMMENT_NONE)
		{
			// -- SINGLE LINE COMMENT --
			if (this.commentType == COMMENT_LINE)
			{
				if (chr == '\n' || chr == '\r')
                {
					this.commentType = COMMENT_NONE;
                    
                    // If our previous token was a newline, then this
                    // means that this line BEGINS with the comment. If not,
                    // then it began with something else, and we should treat
                    // it as the end of line for our previous code.
                    
                    var last = this.LastToken();
                    
                    if (last)
                    {
                        if (last.type !== "newline" && !this.TopLevel())
                            this.AddToken('newline', "");
                    }
                }
			}

			// -- BLOCK COMMENT --
			else if (this.commentType == COMMENT_BLOCK)
			{
				if (chr == '*')
				{
					var nextChr = this.text[this.offset+1] || "";
					if (nextChr == '/')
					{
						// Skip it
						this.offset ++;
						this.commentType = COMMENT_NONE;
					}
				}
			}

			this.offset ++;
			return;
		}

		// Newline character
		if (chr == '\n' || chr == '\r')
		{
			this.FinalizeToken();

			if (!this.TopLevel())
				this.AddToken('newline', "");
		}
        
        // Parse grave mark (important for long key checks)
        else if (chr == '`')
        {
            if (this.inLongKey)
            {
                this.FinalizeToken();
                this.inLongKey = false;
            }
            else
                this.inLongKey = true;
        }

		// Parse quotes (important for string checks)
		else if (chr == '"' || chr == '\'')
		{
			// Currently ignoring spaces?
			// If we're ignoring spaces and we run
			// into a quote, that means it hasn't
			// been escaped yet!

			if (this.ignoreSpaces)
			{
				// If our token starts with < then we'll keep going.
				// This could potentially be a local argument.
				//		Example: <#"black metal">

				if (this.currentToken[0] != '<')
					this.FinalizeToken();

				this.ignoreSpaces = false;
			}

			// Must be string-related, if not

			else
			{
				if (!this.inString)
				{
					this.stringCap = chr;
					this.inString = true;
					this.inWideString = (chr == '"');
				}
				else
				{
					// Does this character match our stringCap character?
					// If so, then it should end our string.

					if (chr == this.stringCap)
					{
                        this.FinalizeToken();
                        this.inWideString = false;
                        this.inString = false;
                        this.stringCap = null;
					}

					// Otherwise, treat it as a normal character.
					else
						this.currentToken += chr;
				}
			}
		}
        
        // Parse backslash (Important!)
        else if (chr == '\\')
        {
            var nextChar = (this.text[this.offset+1] || "");
               
            // Struct, this is an inline packed struct
            if (nextChar == "{")
            {
                this.AddToken("\\{", "", true);
                this.offset ++;
            }
            
            else if (nextChar == "\"")
            {
                this.Fail("Please do not use quotation marks in strings. Our font does not support this.");
                return;
            }
            
            else if (nextChar == "'")
            {
                // Would have ended our string, but it's escaped.
                if (this.inString && nextChar == this.stringCap)
                {
                    this.currentToken += nextChar;
                    this.offset ++;
                }
                else
                {
                    this.Fail("There is no need to escape an apostrophe. Please use single ' without slash.");
                    return;
                }
            }
            
            // If next character is also backslash, then let's
            // add it to our string.
            
            else if (nextChar == '\\')
            {
                this.currentToken += chr;
                this.offset ++;
            }
            
            else
                this.currentToken += chr;
        }

		// If we're in a string, or long key, just add the character
		else if (this.inString || this.inLongKey || this.ignoreSpaces)
			this.currentToken += chr;

		// Otherwise, actually parse the token!
		else
		{
			// Check various characters!
			switch (chr)
			{
				// Equals sign
				case '=':
					var nextCode = (this.text[this.offset+1] || "-").charCodeAt(0);
					this.FinalizeToken();

					// Is ==
					if (nextCode == 61)
					{
						this.AddToken('==', '', true);
						this.offset ++;
					}

					// Single =
					else
						this.AddToken('=', "", true);

					break;

				// Exclamation, for != only
				case '!':
					var nextCode = (this.text[this.offset+1] || "-").charCodeAt(0);
					this.FinalizeToken();

					// Is !=
					if (nextCode == 61)
					{
						this.AddToken('!=', '', true);
						this.offset ++;
					}

					// Single =
					else
					{
						this.Fail("Unknown ! character.");
						return;
					}

					break;

				// The symbols below are supported on their own and as doubles
				case '&':
				case ':':
					var nextChar = (this.text[this.offset+1] || "-");
					this.FinalizeToken();

					// Is same character!
					if (nextChar == chr)
					{
						this.AddToken(chr, '', true);
						this.offset ++;
					}

					// Single &
					else
						this.AddToken(chr, '', true);

					break;

				// Pipe character, check for ||
				case '|':
					var nextCode = (this.text[this.offset+1] || "-").charCodeAt(0);
					this.FinalizeToken();

					// Double ||
					if (nextCode == 124)
					{
						this.AddToken('||', '', true);
						this.offset ++;
					}

					// Single |, no bitwise OR yet
					else
						this.AddToken('||', '', true);

					break;

				// Single-character keywords!
				// These are their own token, but they also
				// tell the lexer to end its current token
				case ',':
				case '(':
				case ')':
				case '{':
				case '}':
				case '[':
				case ']':
				case '+':
				case '*':
				case '$':
				case '@':
					this.FinalizeToken();
					this.AddToken(chr, "", true);
					break;

				// Period!
				// This is PROBABLY for numbers, but we need to
				// check if it's going to be a . struct access
				case '.':
					var prevCode = 0;
					var nextCode = 0;

					if (this.offset > 0)
						prevCode = (this.text[this.offset-1] || "-").charCodeAt(0);

					if (this.offset < this.text.length-1)
						nextCode = (this.text[this.offset+1] || "-").charCodeAt(0);

					var isStructDot = false;

					// If the previous code is a number, it will NEVER be a struct dot!
					// THIS WILL ALWAYS BE A FLOAT
					if (prevCode >= 48 && prevCode <= 57)
						isStructDot = false;

					// Our token is probably <...>
					else if (this.currentToken.length > 0 && this.currentToken[0] == "<")
					{
						// If it contains a < and a >, then we've already completed our argument.
						// This will skip the ... in-between them.

						if (this.currentToken[0] == "<" && this.currentToken.indexOf(">") >= 0)
							isStructDot = true;
						else
							isStructDot = false;
					}

					// Must be something else
					else
						isStructDot = true;

					if (isStructDot)
					{
						this.FinalizeToken();
						this.AddToken(".", "", true);
					}
					else
						this.currentToken += chr;

					break;

				// Subtraction symbol!
				// If next char is a digit, our number will be negative
				case '-':
					var nextCode = (this.text[this.offset+1] || "-").charCodeAt(0);
					var prevCode = 0;

					if (this.offset > 0)
						prevCode = (this.text[this.offset-1] || "-").charCodeAt(0);

					var digitAfter = (nextCode >= 48 && nextCode <= 57);
					var digitBefore = (prevCode >= 48 && prevCode <= 57);
					var periodAfter = (nextCode == 46);

					var isNegative = false;

					// If our previous token is an equals sign, it is CERTAINLY a negative!
					var prevToken = (this.tokens.length > 0) ? this.tokens[this.tokens.length-1] : null;

					if (prevToken && prevToken.type == '=')
						isNegative = true;

					// my_number-5.0
					// (-.75,.5) <-- NS types floats like these sometimes
					// (-4.5, 10.0)
					// 5 - 3.0
					// 5-4.0

					// Otherwise if a digit (or .) follows but is not BEFORE, then it's a negative!
					// For cases like 5-3.0, we are obviously doing arithmetic

					else if ((digitAfter || periodAfter) && !digitBefore)
						isNegative = true;

					// -- IS IT A NEGATIVE NUMBER? --
					if (isNegative)
						this.currentToken += chr;

					// Must not be, arithmetic symbol?

					else
					{
						this.FinalizeToken();
						this.AddToken(chr, "", true);
					}
					break;

				// Special whitespace that breaks our identifier
				case '\t':
					if (!this.inString && !this.ignoreSpaces)
						this.FinalizeToken();
					break;

				// Space, this should break whatever identifier we're in!
				case ' ':

					if (!this.inString && !this.ignoreSpaces)
						this.FinalizeToken();
					else
						this.currentToken += chr;

					break;

				// Semicolon, this is a comment! (For now)
				case ';':
					this.commentType = COMMENT_LINE;
					break;

				// COMMENT SLASH
				case '/':
					var nextChr = this.text[this.offset+1] || "";

					// Single line?
					if (nextChr == '/')
					{
						// Skip the next char
						this.offset ++;
						this.commentType = COMMENT_LINE;
					}

					// Block comment?
					else if (nextChr == '*')
					{
						// Skip the next char
						this.offset ++;
						this.commentType = COMMENT_BLOCK;
					}

					// Division
					else
					{
						this.FinalizeToken();
						this.AddToken(chr, "", true);
					}

					break;

				// # character, indicates a long QBKey if used before quotations.
				case '#':
					var nextChr = this.text[this.offset+1] || "";

					if (nextChr == '"')
					{
						this.ignoreSpaces = !this.ignoreSpaces;
						this.offset ++;
					}
					else
					{
						this.Fail("A # must be followed by quotes to create a long QBKey, not '" + nextChr + "'.");
						return;
					}

					break;

				// LESS THAN OR GREATER THAN
				// (Check if the next character is the same! If
				// so, it is a shift, otherwise if it is a space,
				// then it should be an argument on its own)

				case '<':
				case '>':
					var nextChr = this.text[this.offset+1] || "";
					var lastChr = (this.offset > 0) ? this.text[this.offset-1] : "";

					// -------

					var isSingleChar = false;

					// Has space before and after

					if (nextChr == ' ' && lastChr == ' ')
						isSingleChar = true;

					// If a number before and after, it's probably a comparison
					// (5>5) etc.

					var ccd = (nextChr && nextChr.charCodeAt(0)) || 0;
					var lcd = (lastChr && lastChr.charCodeAt(0)) || 0;

					if ((ccd >= '0'.charCodeAt(0) && ccd <= '9'.charCodeAt(0)) && (ccd >= '0'.charCodeAt(0) && ccd <= '9'.charCodeAt(0)))
						isSingleChar = true;

					// -------

					// If it's a > and our keyword starts with <, add it to the end
					if (chr == '>' && this.currentToken.length > 0 && this.currentToken[0] == '<')
						this.currentToken += chr;

					// Same character, or equals sign
					else if (nextChr == chr || nextChr == '=')
					{
						// >= or <=, check this FIRST
						if (nextChr == '=')
						{
							this.FinalizeToken();
							this.AddToken(chr + "=", "", true);
						}

						// Must be same character, bitshift!
						else
						{
							this.FinalizeToken();
							this.AddToken(chr + chr, "", true);
						}

						// Skip the next one, whatever it might be!
						this.offset ++;
					}

					// Has a . after it, this is PROBABLY <...>
					else if (chr == '<' && nextChr == '.')
						this.currentToken += chr;

					else
					{
						// Does it have a space after it?
						// Then it HAS to be a single character.
						//
						// By this point we have already handled <...> and
						// there is nothing else that would fit this criteria.

						if (nextChr == ' ')
							isSingleChar = true;

						// Singular > or <
						if (isSingleChar)
						{
							this.FinalizeToken();
							this.AddToken(chr, "", true);
						}

						// Part of a keyword, probably <> if we're lucky
						else
							this.currentToken += chr;
					}

					break;

				// Something else
				default:
					this.currentToken += chr;
					break;
			}
		}

		this.offset ++;
	}

	//-----------------------
	// Peek for a token in our list
	//-----------------------

	PeekForToken(fromIndex, jumpAmount = 1, tokenList = this.tokens)
	{
		// Would exceed bounds, ignore
		if (fromIndex + jumpAmount >= tokenList.length)
			return null;

		return tokenList[fromIndex + jumpAmount];
	}

	//-----------------------
	// Check for right parentheses
	//-----------------------

	RightParenthesesIndex(fromIndex, tokenList = this.tokens)
	{
		var c = fromIndex;
		while (c < tokenList.length)
		{
			var token = tokenList[c];
			if (token.type == ")")
				return c;

			c ++;
		}

		return -1;
	}

	//-----------------------
	// When we're done reading, validate it went well!
	//-----------------------

	PostReadValidate()
	{
		if (this.scriptDepth != 0)
		{
			this.Fail("A script failed or was missing its endscript keyword.");
			return;
		}

		if (this.ignoreSpaces)
		{
			this.Fail("A long ` QBKey was unclosed.");
			return;
		}
	}

	//-----------------------
	// Finished reading, let's do
	// a post-read passover and
	// tweak our tokens as necessary
	//-----------------------

	PostRead()
	{
		this.PostReadValidate();

		if (this.job.Failed())
			return;

		// Prepare new list, this our PROCESSED list!
		var newTokens = [];

		// Loop through the tokens we have
		var t = 0;
		var scrDepth = 0;

		while (t < this.tokens.length)
		{
			var token = this.tokens[t];

			if (token.type == "scriptstart")
				scrDepth ++;
			else if (token.type == "scriptend")
				scrDepth --;

			var nextToken = (t < this.tokens.length-1) ? this.tokens[t+1] : null;

			// QS keyword, this is a single value between parentheses

			if (token.type == "qs")
			{
				// Must be followed by a right parentheses
				if (nextToken && nextToken.type == "(")
				{
					// Check for right parentheses
					var RPI = this.RightParenthesesIndex(t+1);

					// Found it!
					if (RPI >= 0)
					{
						var itemsBetween = (RPI-1) - (t+1);

						if (itemsBetween != 1)
						{
							this.Fail("qbs keyword had " + itemsBetween + " items in (), should be 1.");
							return;
						}

						var keywordItem = this.tokens[t+2];

						if (keywordItem.type != "keyword")
						{
							this.Fail("qbs keyword expected a keyword token between ().");
							return;
						}

						var localToken = new LexerToken(this);
						localToken.type = "localstring";
						localToken.value = keywordItem.value;

						newTokens.push(localToken);

						t = RPI+1;
						continue;
					}

					else
					{
						newTokens.push(token);
						t ++;
						continue;
					}
				}
				else
				{
					this.Fail("'qs' keyword was not followed by (.");
					return;
				}
			}

			// Left parentheses?
			// Forward-check if we have a right parentheses!

			else if (token.type == "(")
			{
				var leftIndex = t;
				var rightIndex = -1;

				var vectorValues = [];
				var commaCount = 0;
				var wasNegative = false;

				for (var p=0; p<MAX_VECTOR_CHECK; p++)
				{
					var peekToken = this.PeekForToken(t, p+1);

					if (peekToken)
					{
						if (peekToken.type == ")")
						{
							rightIndex = t + p + 1;
							break;
						}

						else if (peekToken.type == ",")
							commaCount ++;

						else if (peekToken.type == "int" || peekToken.type == "float")
							vectorValues.push(peekToken.value);

						else
						{
							// Outside of scripts, the ONLY () things inside of () we
							// should have are ints, floats, and ,

							if (scrDepth == 0)
							{
								this.Fail("Top-level () found encasing element of type '" + peekToken.type + "': " + peekToken.value);
								return;
							}

							// Inside scripts are probably fine, we can have lots of things

							break;
						}
					}
				}

				// We found a right-most parentheses in range! Great!
				// We also check to see if we had MULTIPLE numeric vector values

				if (rightIndex >= 0 && vectorValues.length > 1)
				{
					if (commaCount != vectorValues.length-1)
					{
						this.Fail("Vector or pair existed but did not have proper comma count.");
						return;
					}

					if (vectorValues.length > MAX_VECTOR_NUMBERS)
					{
						this.Fail("Vector with " + vectorValues.length + " values found. Max of " + MAX_VECTOR_NUMBERS + ".");
						return;
					}

					// By this point, we know our values are all numeric,
					// so we can create a fresh token with their values

					var newToken = new LexerToken(this);
					newToken.type = (vectorValues.length == 2) ? "pair" : "vector";
					newToken.value = vectorValues;

					newTokens.push(newToken);

					t = rightIndex+1;
					continue;
				}
			}
            
            // Default / switch token? If preceded or followed by a = then make it a keyword
            
            else if (token.type == "default" || token.type == "switch")
            {
                var lastToken = this.tokens[t-1] || null;
                var nextToken = this.tokens[t+1] || null;
                
                if ((lastToken && lastToken.type == "=") || (nextToken && nextToken.type == "="))
                {
                    var oldType = token.type;
                    
                    token.type = "keyword";
                    token.value = oldType;
                }
            }            

			newTokens.push(token);
			t ++;
		}

		this.tokens = newTokens;
	}

	//-----------------------
	// Debug all of our tokens!
	//-----------------------

	DebugTokens()
	{
		this.Debug("");

		for (const tok of this.tokens)
		{
			if (tok.value)
				this.Debug("(" + tok.type + ", " + tok.value + ")");
			else
				this.Debug("(" + tok.type + ")");
		}

		this.Debug("");
	}

	//-----------------------
	// Unlex: Current token
	// Unlex: Next token
	//-----------------------

	GetTokenIndex() { return this.tokenIndex; }
	CurrentToken() { return this.tokens[this.tokenIndex]; }
	NextToken(gap = 1) 
    { 
        var tokIndex = this.tokenIndex+gap;
        return (tokIndex >= 0 && tokIndex < this.tokens.length) ? this.tokens[tokIndex] : null; 
    }
	LastToken() { return this.tokens[this.tokens.length-1]; }

	//-----------------------
	// Unlex: Go to next token
	//-----------------------

	AdvanceToken() { this.tokenIndex ++; }
}

module.exports = QBCLexer;
