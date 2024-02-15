// ---------------------------------------------------
//
//	QBKEY
//	CRC32 checksum
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCQBKey extends ItemCore
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
	ReadSharedValue() { 
        this.value = QBC.constants.Keys.FromKey("0x" + this.reader.UInt32().toString(16).padStart(8, "0"));
    }
    
	GetDebugText() { return ": " + this.value; }
	GetItemInfoType() { return QBC.constants.TypeBindings['QBKey']; }
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		this.WriteIDString();
		
		// Is this preceded by a local argument?
		var isArg = false;
		
		var preceding = this.PreviousChild();
		if (preceding && preceding.GetValueText() == "argument")
			isArg = true;
		
		var valstr = this.GetValueText( QBC.KeyToString(this.value.toString()) );
        
        if (isArg)
            this.job.AddText("<" + valstr + ">");
            
        else
        {
            // Write a decently sanitized QBKey.
            // Some scenarios should PROBABLY have the key written
            // as a long QBKey for safety. Ex: Paths
            
            var as_longkey = false;
            
            if (valstr.indexOf(".") >= 0)
                as_longkey = true;
            if (valstr.indexOf('\\') >= 0)
                as_longkey = true;
                
            if (as_longkey)
                this.job.AddText("`" + valstr + "`");
            else
                this.job.AddText(valstr);
        }
        
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
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_NAME);
			
		var valKey = QBC.constants.Keys.ToKey(this.value);
		
		this.writer.UInt32(valKey);		// QBKey value
	}
}

module.exports = QBCQBKey;
