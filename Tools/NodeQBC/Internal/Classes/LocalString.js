// ---------------------------------------------------
//
//	LOCALSTRING
//	Localized string
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCLocalString extends ItemCore
{
	Initialize() { this.value = 0; }

	IsSingleLine() { return true; }

	Read()
	{
		if (this.InScript())
			this.ReadSharedValue();
		else
			this.ReadSharedProperties();
	}

	ReadSharedValue() { this.value = "0x" + this.reader.UInt32().toString(16).padStart(8, "0"); }
	GetDebugText() { return ": " + this.value }
	GetItemInfoType() { return QBC.constants.TypeBindings['LocalString']; }

	//-----------------------
	// Outputs actual text
	//-----------------------

	WriteText()
	{
		this.WriteIDString();

		var valstr = this.GetValueText( QBC.KeyToString(this.value.toString()) );
		this.job.AddText("qs(" + valstr + ")");

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
		var valKey = QBC.constants.Keys.ToKey(this.value);

		if (this.InScriptBody())
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_STRINGQS);

		this.writer.UInt32(valKey);		// QBKey string value
	}
}

module.exports = QBCLocalString;
