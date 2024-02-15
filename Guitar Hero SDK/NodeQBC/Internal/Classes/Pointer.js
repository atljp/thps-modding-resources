// ---------------------------------------------------
//
//	POINTER
//	Pointer to a global map value
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCPointer extends ItemCore
{
	Initialize() { this.value = 0; }
	
	Read() 
	{ 
		if (this.InScript())
        {
            // This should be 0x16, indicates a name.
            // Pointers are 0x4B then 0x16.
            
            var nameByte = this.reader.UInt8();
            
            if (nameByte != QBC.constants.ESCRIPTTOKEN_NAME)
            {
                this.Fail("Pointer token was not followed by a Name token.");
                return;
            }
            
			this.ReadSharedValue();
        }
		else
			this.ReadSharedProperties(); 
	}
	
	IsSingleLine() { return true; }
	ReadSharedValue() { 
        this.value = "0x" + this.reader.UInt32().toString(16).padStart(8, "0");
    }
    
	GetDebugText() { return ": " + this.value }
	GetItemInfoType() { return QBC.constants.TypeBindings['Pointer']; }
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		this.WriteIDString();
		
		var valstr = this.GetValueText( QBC.KeyToString(this.value.toString()) );
		this.job.AddText("$" + valstr);
		
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
		if (this.InScriptBody())
        {
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ARGUMENTPACK);
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_NAME);
        }
			
		var valKey = QBC.constants.Keys.ToKey(this.value);
		
		this.writer.UInt32(valKey);		// QBKey value
	}
}

module.exports = QBCPointer;
