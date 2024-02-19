// ---------------------------------------------------
//
//	FLOATS
//	Multiple float values
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCFloats extends ItemCore
{
	Initialize() { this.values = [0.0, 0.0]; }
	GetItemInfoType() { return QBC.constants.TypeBindings['Floats']; }
	
	Read() 
	{ 
		this.ReadSharedProperties_Start();
		this.ReadSharedValue();
		this.ReadSharedProperties_End(); 
	}
	
	ReadSharedValue() 
	{ 
		this.values[0] = this.reader.Float(); 
		this.values[1] = this.reader.Float(); 
	}
	
	GetDebugText() { return ": [" + this.values.join(", ") + "]"; }
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		// TODO: Write these in the future when we do vectors, etc.
		return;
		
		this.job.AddText("(" + this.values.join(", ") + ")");
		
		if (!this.InScript())
			this.job.AddLine();
		else
			this.job.AddText(" ");
	}
}

module.exports = QBCFloats;
