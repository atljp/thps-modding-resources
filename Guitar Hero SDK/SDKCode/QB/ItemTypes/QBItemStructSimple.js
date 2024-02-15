// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Simple struct item type
/*
	case QbItemType.StructItemQbKeyString:
	case QbItemType.StructItemStringPointer:
	case QbItemType.StructItemQbKeyStringQs:
	case QbItemType.StructItemQbKey:
	case QbItemType.StructItemInteger:
	case QbItemType.StructItemFloat:
*/
//
// ItemId, Value (4 byte), NextItemPointer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBItemStructSimple extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		// Don't read child items
		this.startRead = false;
		
		this.qbType = ItemTypes.QBTypes.STRUCT;
		
		this.id = opt.id || this.id || "0x00000000";
		this.value = opt.value;
		this.nextPointer = opt.nextPointer;
		
		// If reading from a file...
		if (this.reader)
		{
			// Read the ID
			this.id = this.reader.UInt32().toString(16).padStart(8, "0");
			
			// Value
			switch (this.typeName)
			{
				case 'StructItemFloat':
					this.value = this.reader.Float();
					break;
					
				case 'StructItemInteger':
					this.value = this.reader.Int32();
					break;
					
				default:
					this.value = this.reader.UInt32();
					break;
			}
			
			// Pointer to next item
			this.nextPointer = this.reader.UInt32()
			
			this.FinalizeIf(this.nextPointer);
		}
	}
	
	//-----------------------------------
	// What debug text?
	//-----------------------------------
	
	GetDebugText()
	{
		return super.GetDebugText() + " - " + this.GetID() + " - " + this.typeName;
	}
	
	//-----------------------------------
	// Specific to this, use equals if first is not 00000000
	//-----------------------------------
	
	EqualsIf(id, val)
	{
		if (id == "0x00000000" || id == "00000000")
			return val;
			
		return id + " = " + val;
	}
	
	//-----------------------------------
	// Convert this item to text-readable format!
	//-----------------------------------
	
	ToText()
	{
		switch (this.typeName)
		{
			// QBKey
			case "StructItemQBKey":
				return "StructQBKey " + this.EqualsIf(this.GetID(), this.ValToString(this.value));
				break;
				
			// QBKeyString
			case "StructItemQBKeyString":
				return "StructQBString " + this.EqualsIf(this.GetID(), this.ValToString(this.value));
				break;
				
			// QBKeyStringQs
			case "StructItemQBKeyStringQs":
				return "StructQBStringQs " + this.EqualsIf(this.GetID(), this.ValToString(this.value));
				break;
				
			// Integer
			case "StructItemInteger":
				return "StructInt " + this.EqualsIf(this.GetID(), this.value);
				break;
				
			// Float
			case "StructItemFloat":
			
				var fStr = this.value.toString();
				if (fStr.indexOf(".") == -1)
					fStr = fStr + ".00";
			
				return "StructFloat " + this.EqualsIf(this.GetID(), fStr);
				break;
				
			// Other
			default:
				return this.GetDebugText();
				break;
		}
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	// We only handle bad characters on newlines etc.
	// This is a bit of a gross hack, but it's required
	// since Neversoft likes to have QB keys like "Font A"
	
	IsBadCharacter(r, ccd)
	{
		return (ccd < 32 && ccd > 9);
	}
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		var spl = word.split("=");
		
		// If it has two elements, assume ID then VALUE
		if (spl.length > 1)
		{ 
            this.id = spl.shift().trim();
            
            while (spl.length)
            {
                var words = [];
                var word = spl.shift().trim();
                if (word.length > 0)
                    words.push(word);
                    
                this.value = words.join(" ");
            }
		}
		
		// Otherwise, assume ID of 00000000 then value
		else
		{
			this.id = "0x00000000";
			this.value = word.trim();
		}
			
		this.Finalize();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w) 
	{ 
		w.UInt32(this.ByteType());
		w.UInt32(this.ByteID());
		
		switch (this.typeName)
		{
			// QBKey
			case "StructItemQBKey":
			case "StructItemQBKeyString":
			case "StructItemQBKeyStringQs":
            
                if (!this.value)
                    cons.error("[" + this.id + "] " + this.constructor.name + " had no value.");
            
				w.UInt32(this.ByteID(this.value));
				break;
				
			case "StructItemInteger":
				w.Int32(this.value);
				break;
				
			case "StructItemFloat":
				w.Float(this.value);
				break;
				
			default:
				w.UInt32(this.value);
				break;
		}
		
		// Next item!
		this.WriteNext(w, w.Tell() + 4);
	}
}

module.exports = QBItemStructSimple;
