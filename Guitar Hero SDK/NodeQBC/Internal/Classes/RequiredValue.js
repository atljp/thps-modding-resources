// ---------------------------------------------------
//
//	REQUIREDVALUE
//	Very odd type used in WoR. This seems to be
//  a required value of some sort, but its type
//  varies. This is a core class.
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

// 0x24: Integer
// 0x26: QBKey
// 0x28: String
// 0x2C: Array

class QBCRequiredValue extends ItemCore
{
	Initialize()
    {
        this.value_type = this.itemType;
    }
	
	Read() 
	{ 
		if (this.InScript())
			this.ReadSharedValue();
		else
			this.ReadSharedProperties(); 
	}
	
	IsSingleLine() { return true; }
	ReadSharedValue() { 
        // Should be 0x69696969
        this.reader.UInt32(); 
    }
    
	GetDebugText() { return ": " + this.value; }
	GetItemInfoType() { return this.value_type; }
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		this.WriteIDString();
        
        this.job.AddText("0x" + this.value_type.toString(16).padStart(2, "0"));
		
		if (this.CanAutoCreateNewlines())
			this.job.AddLine();
		else
			this.AddInlineSpace();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Writes the object's data
	//-----------------------
	
	SerializeSharedData()
	{
		this.writer.UInt32(0x69696969);		// QBKey value
	}
}

module.exports = QBCRequiredValue;
