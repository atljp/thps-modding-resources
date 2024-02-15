// ---------------------------------------------------
//
//	FLOAT
//	Decimal number
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCFloat extends ItemCore
{
	Initialize() { this.value = 0.0; }
	
	Read() 
	{ 
		if (this.InScript())
			this.ReadSharedValue();
		else
			this.ReadSharedProperties(); 
	}
	
	IsSingleLine() { return true; }
	ReadSharedValue() { this.value = this.reader.Float(); }
	GetDebugText() { return ": " + this.value.toString(); }
	GetItemInfoType() { return QBC.constants.TypeBindings['Float']; }
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		this.WriteIDString();
		
		var basis = Math.floor(this.value);
		var extra = this.value - basis;
		var finalString = "";
		
		if (!extra)
			finalString = basis.toString();
		else
			finalString = this.value.toPrecision(4).toString();
			
		// Ensure it's a decimal
		if (finalString.indexOf(".") == -1)
			finalString += ".0";
			
		this.job.AddText(finalString);
			
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
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_FLOAT);
			
		this.writer.Float(this.value);		// Value
	}
}

module.exports = QBCFloat;
