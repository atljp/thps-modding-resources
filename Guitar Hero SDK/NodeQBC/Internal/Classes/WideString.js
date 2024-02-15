// ---------------------------------------------------
//
//	WIDE STRING
//	Double-character string value
//
// ---------------------------------------------------

const QBCString = require('./String.js');

class QBCWideString extends QBCString
{
	Initialize() { super.Initialize(); this.wide = true; }
	GetItemInfoType() { return QBC.constants.TypeBindings['WideString']; }
}

module.exports = QBCWideString;
