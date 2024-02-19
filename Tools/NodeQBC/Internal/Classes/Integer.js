// ---------------------------------------------------
//
//	INTEGER
//	Plain number
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCInteger extends ItemCore
{
	Initialize() { this.value = 0; }
	
	Read() 
	{ 
		if (this.InScript())
			this.ReadSharedValue();
		else
			this.ReadSharedProperties(); 
	}
	
	IsSingleLine() { return true; }
	ReadSharedValue() { this.value = this.reader.Int32(); }
	GetDebugText() { return ": " + this.value.toString(); }
	GetItemInfoType() { return QBC.constants.TypeBindings['Integer']; }
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		this.WriteIDString();
		
		this.AddText(this.value.toString());
		
		if (this.CanAutoCreateNewlines())
			this.AddLine();
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
		if (this.InScriptBody())
		{
			// Local token?
			if (this.isLocal)
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ARG);
			
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_INTEGER);
		}
			
        if (this.value > 2147483647 || this.value < -2147483648)
        {
            this.Fail("Integer value was out of range: " + this.value.toString() + " (0x" + this.value.toString(16).padStart(8, "0").toUpperCase() + ")");
            return;
        }
        
		this.writer.Int32(this.value);
	}
}

module.exports = QBCInteger;
