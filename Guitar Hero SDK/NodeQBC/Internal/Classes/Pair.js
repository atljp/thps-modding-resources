// ---------------------------------------------------
//
//	PAIR
//	2D Vector
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCPair extends ItemCore
{
	IsSingleLine() { return true; }
	Initialize() { this.values = [0.0, 0.0]; }
	ReadSharedValue() { var floatsStart = this.reader.UInt32(); }
	GetItemInfoType() { return QBC.constants.TypeBindings['Pair']; }
	GetDebugText() { return ": " + this.values.toString(); }
	
	//-----------------------
	// Begin reading from data
	//-----------------------
	
	Read() 
	{ 
		if (!this.InScript())
		{
            if (!this.InArray())
                this.ReadSharedProperties(); 
			
			this.reader.UInt32();			// Floats header
		}
	
		this.values = [ this.reader.Float(), this.reader.Float(), ];
	}
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		if (!this.InScript())
			this.WriteIDString();
		
		var valStrings = [];
		for (const val of this.values)
		{
			var valstr = val.toString();
			if (valstr.indexOf(".") >= 0)
				valStrings.push(valstr);
			else
				valStrings.push(valstr + ".0");
		}
		
		this.job.AddText("(" + valStrings.join(", ") + ")");
		
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
	// Serialize this particular object
	// (Override this!)
	//-----------------------
	
	Serialize()
	{
		if (this.InScript())
		{
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_PAIR);
			this.writer.Float(this.values[0]);
			this.writer.Float(this.values[1]);
			return;
		}
		
		super.Serialize();
	}
	
	//-----------------------
	// Writes the object's data
	//-----------------------
	
	SerializeSharedData()
	{
		// Start of the "Floats" object
        if (!this.InArray())
            this.writer.UInt32(this.writer.Tell() + 8);
	}
	
	//-----------------------
	// Serialize the main object's data
	// (Override this!)
	//-----------------------
	
	SerializeData()
	{
		super.SerializeData();
		
		// "Floats" object type
		this.writer.UInt8(0);
        this.writer.UInt8(1);
        this.writer.UInt8(0);
        this.writer.UInt8(0);
        
		this.writer.Float(this.values[0]);
		this.writer.Float(this.values[1]);
	}
}

module.exports = QBCPair;
