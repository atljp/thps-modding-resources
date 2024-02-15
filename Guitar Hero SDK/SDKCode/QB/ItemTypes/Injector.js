// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Code injector!
//
// This functions hand-in-hand with GHSDK if
// available, to inject scripted code at a certain spot
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const QBItemBase = require('./QBItemBase.js');

class QBCodeInjector extends QBItemBase
{
	AddToParent(obj) {}
	
	//-----------------------------------
	// Initialize the unknown
	//-----------------------------------
	
	Initialize(opt)
	{
		this.startPos = -1;
		
		// Move back to the start of "Inject "
		if (this.textReader)
			this.startPos = this.textReader.Tell() - 7;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// Parentheses are allowed
		// (They surround our word, you know)
		
		if (ccd == 40 || ccd == 41)
			return false;
			
		return super.IsBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		// Starts and ends with brackets
		// This **SHOULD** be our bytes, let's see...
		
		if (word[0] == "(" && word[word.length-1] == ")")
		{
			var slice = word.slice(1, word.length-1).trim();
			
			var endPos = this.textReader.Tell();
			
			// Determine the text we'd like to replace it with
			var replacer = "";
			
			var inj = GHSDK.QBHandler.GetInjector(slice);
			if (inj)
				replacer = inj();
			
			this.textReader.ReplaceSection(this.startPos, endPos, replacer);
			this.textReader.ResetTemp();
			
			this.Finalize();
			return;
		}
		
		super.WordRead(r, word);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	// This item should never exist as bytes
	
	ToBytes(w) {}
}

module.exports = QBCodeInjector;
