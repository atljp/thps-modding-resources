// ---------------------------------------------------
//
//	RANDOM
//	Used in scripts
//
//	Probably the most complicated and confusing
//	type of token there is, this jumps to many
//	random spots in the script
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBScriptRandom extends ItemCore
{
	Initialize() {this.randomType = "random";}
    
    GetDebugText() { return ": " + this.randomType; } 
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	U N L E X
	//		Populates data from the lexer
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Unlex this particular object (backend)
	//-----------------------
	
	UnLex()
	{
		// Store our parentheses level
		// Remember this is Random() so we need to know when to end it!
		
		this.un_parLevel = 0;
        
        // What token are we at?
        
        var tok = this.lexer.CurrentToken();
        
        if (!tok)
        {
            this.Fail("Random was not followed by a token. Should be a (.");
            return;
        }
        
        if (tok.type != "(")
        {
            this.Fail("Random was not followed by a ( token.");
            return;
        }
		
		super.UnLex();
	}
    
    UnLexObject()
    {
        var qbItem = null;
		var token = this.lexer.CurrentToken();
        
        var lastLevel = this.un_parLevel;
        
		// Ideally this should never happen
		if (!token)
		{
			this.Fail("Ran out of tokens?");
			return;
		}
        
        if (token.type == "(")
        {
            // Likely our first (
            if (this.un_parLevel == 0)
            {
                this.un_parLevel ++;
                this.lexer.AdvanceToken();
                return;
            }
        }
        
        else if (token.type == ")")
        {
            this.un_parLevel --;
			
			// Back to () level 0, we probably closed off the random
			if (lastLevel != this.un_parLevel && this.un_parLevel == 0)
			{
				this.stopUnlex = true;
				
				// Never unlex last )
				return;
			}
        }
        
        super.UnLexObject();
    }
	
	//-----------------------
	// Finished unlexing!
	// (Is this object okay?)
	//-----------------------
	
	PostUnLex()
	{
		if (this.un_parLevel > 0)
		{
			this.Fail(this.randomType + " was not properly closed off.");
			return;
		}
		
		// Our first non-whitespace child should be a @!
		// If not, then the user has an unmarked marker
		
		for (const child of this.children)
		{
			var val = child.GetValueText();
			
			if (val == "newline")
				continue;
			else if (val == "@")
				break;
			else
			{
				this.Fail(this.randomType + " did not start with a @ marker!");
				return;
			}
		}
		
		super.PostUnLex();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Get number of marker tokens
	//-----------------------
	
	GetMarkerCount()
	{
		var count = 0;
		
		for (const child of this.children)
		{
			var valstr = child.GetValueText();
			if (valstr == "@")
				count ++;
		}
		
		return count;
	}
	
	//-----------------------
	
	SerializeSharedData()
	{
		var numMarkers = this.GetMarkerCount();
        
		// The token to use
		switch (this.randomType)
		{
			case "random":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM);
				break;
				
			case "random2":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM2);
				break;
				
			case "randompermute":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_PERMUTE);
				break;
				
			case "randomnorepeat":
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_NO_REPEAT);
				break;
				
			default:
				this.Fail("Unknown serialize byte for random type '" + this.randomType + "'.");
				return;
				break;
		}
		
		this.writer.UInt32(numMarkers);			// Number of markers
		
		// Weights, TODO: FIX ME
		for (var w=0; w<numMarkers; w++)
			this.writer.UInt16(1);
			
		// Offsets to the markers, FIX LATER
		for (var w=0; w<numMarkers; w++)
			this.writer.UInt32(0);
	}
	
	//-----------------------
	// Serialize this particular object
	// (Override this!)
	//-----------------------
	
	// When we start serializing, let's set up some 
	// important values that we'll patch later
	
	Serialize()
	{
		// Stores offsets for each of our @ markers
		this.ser_markers = [];
		
		// Stores end offsets, these should always
		// jump out of our random statement
		this.ser_ends = [];
		
		super.Serialize();
	}
	
	//-----------------------
	// Serialize a single child
	//-----------------------
	
	SerializeChild(child)
	{
		var val = child.GetValueText();
		
		// Are we ABOUT to serialize a marker?
		// If so, we should do some special handling before!
		
		if (val == "@")
		{
			// If have at least 1 ser_markers, then we've ENTERED a marker!
			// This is important to push the shortbreak for our PREVIOUS markerIf t
			
			if (this.ser_markers.length > 0)
			{
				this.ser_ends.push(this.writer.Tell());
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_JUMP);
				this.writer.UInt32(0);
			}
			
			// Store the starting position of this marker for later
			
			this.ser_markers.push([this.writer.Tell(), child.weight]);
		}
		
		super.SerializeChild(child);
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{
		super.PostSerialize();
		
		// Store the position past our random
		// this will be used for long jumps
		
		var endOff = this.writer.Tell();
		
		// Whoa there, we had no markers at all! Obviously a random needs some
		
		if (this.ser_markers.length <= 0)
		{
			this.Fail(this.randomType + " had no @ markers at all!");
			return false;
		}
		
		// -----------
		
		// Now that we have the start locations of
		// each marker, let's fix up their jump offsets
		
		this.writer.Seek(this.ptr_spawnOffset + 1);
		
		var mC = this.GetMarkerCount();
		if (this.ser_markers.length != mC)
		{
			this.Fail("Marker length mismatch in " + this.randomType + ": read " + this.ser_markers.length + ", unlexed " + mC);
			return;
		}
		
		// Last "marker" will be our end offset
		// (We want the offset of the next spot to jump, lazy hack)
		
		this.ser_markers.push([endOff, 0]);
		
		// -----------
		
		this.writer.UInt32(mC);		// Marker count
		
		// Marker weights
		for (var m=0; m<mC; m++) 
			this.writer.UInt16(this.ser_markers[m][1]); 

		// Offsets to the marker locations
		for (var m=0; m<mC; m++)
		{
			var markSpot = this.ser_markers[m][0];
			this.writer.UInt32(markSpot - (this.writer.Tell() + 4));
		}
		
		// -----------
		
		// Let's fix up our long jumps to the end!
		for (var m=0; m<this.ser_ends.length; m++)
		{
			var jumpSpot = this.ser_ends[m];
			this.writer.Seek(jumpSpot+1);
			
			this.writer.UInt32(endOff - (this.writer.Tell() + 4));
		}
		
		// -----------
		
		this.writer.Seek(endOff);
	}
	
	IsSingleLine() { return false; }
    
    //--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
    
    Read() 
	{
        var numMarkers = this.reader.UInt32();
        var pendingWeights = [];
        var pendingMarkers = [];
        
        for (var m=0; m<numMarkers; m++)
            pendingWeights.push( this.reader.UInt16() );
            
        for (var m=0; m<numMarkers; m++)
        {
            var markerPos = this.reader.Tell();
            var markerVal = this.reader.UInt32();
            
            pendingMarkers.push(markerPos + 4 + markerVal);
        }
         
        // Used to end our random with a ).
        var randomEndPosition = 0;
        
        while (this.ReadAllowed())
        {
            var tokenPos = this.reader.Tell();

            for (const mark of pendingMarkers)
            {
                if (mark == tokenPos)
                {
                    pendingMarkers.shift();
                    var weightValue = pendingWeights.shift();
                    
                    var qbItem = QBC.CreateClass("ScriptToken");
                    qbItem.value = "@"
                    qbItem.weight = weightValue;
                    this.AddChild(qbItem);
                    
                    // This is a gross hack and should basically never happen
                    // if you are a sensible human being. Why would you
                    // make a Random and only have one item? Neversoft does this
                    // in GHWT, in drum_training_int_tutorial. In the entirety
                    // of GHWT code, this is the only time that this happens.
                    
                    if (numMarkers == 1)
                        return;
                }
            }
            
            // Gross hack: If we encounter a Jump, then that should be the end of our Random.
            // We need this so we know where the random ends, and therefore, when to add a ).
            
            var realTokenPos = this.reader.Tell();
            var peekByte = this.reader.UInt8();
            
            if (peekByte == QBC.constants.ESCRIPTTOKEN_JUMP)
            {
                var jumpSpot = this.reader.UInt32();
                randomEndPosition = (this.reader.Tell() + jumpSpot);
            }
            
            this.reader.Seek(realTokenPos);
            
            if (randomEndPosition && (realTokenPos == randomEndPosition))
            {
                // Jumps are (destination - 1)? This needs looked into...
                this.reader.Seek(realTokenPos);
                return;
            }
                
            this.ReadScriptToken();
        }
    }
    
    //--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T   O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Is this object type a
	// single-line object?
	//-----------------------
	
	IsSingleLine() 
	{ 
		if (this.children.length <= 0)
			return true;
			
		// If we have one multi-line child, return false
		for (const child of this.children)
		{
			if (!child.IsSingleLine())
				return false;
		}
		
		return true; 
	}
	
	//-----------------------
	// Internal write, DO NOT CALL
	//-----------------------
	_WriteText()
	{
        switch (this.randomType)
        {
            case "random":
                this.AddText("Random");
                break;
                
            case "random2":
                this.AddText("Random2");
                break;
                
            case "randompermute":
                this.AddText("RandomPermute");
                break;
                
            case "randomnorepeat":
                this.AddText("RandomNoRepeat");
                break;
                
            default:
				this.Fail("Unknown deserialize random type '" + this.randomType + "'.");
				return;
				break;
        }
        
		this.AddText(" (");
			this.AddIndent();

			for (const child of this.children)
				child._WriteText();
			
			this.SubIndent();
			
		this.AddText(")");
        this.AddInlineSpace();

		this.PostWriteText();
	}
}

module.exports = QBScriptRandom;
