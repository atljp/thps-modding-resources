// ---------------------------------------------------
//
//	THUGQB
//	Internal class that encompasses the entire code
//
//  Used for THUG-like games.
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCTHUGQB extends ItemCore
{
	// Do not write text for this class
	WriteText() {}
	
	IsPakQB() { return false; }
    IsScript() { return true; }
    
    //-----------------------
    // Every child in this element
    // is a single-line object.
    //-----------------------
    
    HasOnlySingleLineChildren() { return false; }
	
    Read() 
	{
		if (this.InScript())
		{
			while (this.ReadAllowed())
				this.ReadScriptToken();
				
			return;
		}
    }
    
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize() {}
	
	//-----------------------
	// Serialize this particular object
	//-----------------------
	
	Serialize() {}
}

module.exports = QBCTHUGQB;
