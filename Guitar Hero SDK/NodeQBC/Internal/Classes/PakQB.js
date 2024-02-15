// ---------------------------------------------------
//
//	PAKQB
//	Internal class that encompasses the entire code
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCPakQB extends ItemCore
{
	// Do not write text for this class
	WriteText() {}
	
	IsPakQB() { return true; }
    
    //-----------------------
    // Every child in this element
    // is a single-line object.
    //-----------------------
    
    HasOnlySingleLineChildren() { return false; }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{
		// Seek to beginning and patch filesize
		this.writer.Seek(4);
		this.writer.UInt32(this.writer.buffer.length);
	}
	
	//-----------------------
	// Serialize this particular object
	//-----------------------
	
	Serialize()
	{
		this.writer.UInt32(0);							// Always 0
		this.writer.UInt32(0);							// Filesize, will fill in later!
		
		// I don't THINK this is important at all, but
		// all QB files seem to have this in their header
		
		this.writer.Combine( Buffer.from([
			0x1C, 0x08, 0x02, 0x04,
			0x10, 0x04, 0x08, 0x0C,
			0x0C, 0x08, 0x02, 0x04,
			0x14, 0x02, 0x04, 0x0C,
			0x10, 0x10, 0x0C, 0x00]) );
	}
}

module.exports = QBCPakQB;
