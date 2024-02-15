// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Struct string
// ItemId, Pointer, NextItemPointer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBItemStructString extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.qbType = ItemTypes.QBTypes.STRUCT;
		
		this.startRead = false;
		
		this.id = opt.id;
		this.pointer = opt.pointer;
		this.nextPointer = opt.nextPointer;
		this.value = opt.value;
		this.setValue = false;
		
		// If reading from a file...
		if (this.reader)
		{
			// Read the ID
			this.id = this.reader.UInt32().toString(16).padStart(8, "0");
			
			// Pointer to the start of the string
			this.pointer = this.reader.UInt32();
			
			// Next item pointer
			this.nextPointer = this.reader.UInt32();
			
			// Read the string value
			var bytes = [];
			var nextByte = 0;
			
			// Wide string
			if (this.typeName == "StructItemStringW")
			{
				nextByte = this.reader.UInt16();

				while (nextByte !== 0)
				{
					bytes.push(String.fromCharCode(nextByte));
					nextByte = this.reader.UInt16();
				}
			}
			
			// Single string
			else
			{
				nextByte = this.reader.UInt8();

				while (nextByte !== 0)
				{
					bytes.push(String.fromCharCode(nextByte));
					nextByte = this.reader.UInt8();
				}
			}
			
			// Pad to nearest 4 bytes
			var off = this.reader.Tell() % 4;
			if (off)
				this.reader.Seek(this.reader.Tell() + (4 - off));
			
			this.value = bytes.join("");
			this.setValue = true;
			
			this.FinalizeIf(this.nextPointer);
		}
	}
	
	//-----------------------------------
	// What debug text?
	//-----------------------------------
	
	GetDebugText()
	{
		return super.GetDebugText() + " - " + this.GetID() + " - " + this.value;
	}
	
	//-----------------------------------
	// Convert this item to text-readable format!
	//-----------------------------------
	
	ToText()
	{
		var prefix = "";
		
		switch (this.typeName)
		{
			case 'StructItemTString':
				prefix = "StructTString";
				break;
				
			case "StructItemStringW":
				prefix = "StructStringW";
				break;
				
			default:
				prefix = "StructString";
				break;
		}
		
		return prefix + " " + this.GetID() + " = \"" + this.value + "\"";
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		if (ccd == 34)
			return true;
			
		// Anything goes in a string!
		if (this.inString)
			return false;
		
		return super.IsBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd)
	{
		if (ccd == 34)
		{
			if (!this.inString)
				this.inString = true;
			else
			{
				this.inString = false;
				this.Finalize();
			}
		}
		
		return super.HandleBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		this.wordsRead = this.wordsRead || 0;
		
		// No ID yet, use the word!
		if (this.wordsRead == 0)
		{
			this.id = word;
			this.wordsRead ++;
			return;
		}
		
		// Second word, this is the value
		else if (this.wordsRead > 0)
		{
			// Skip equal sign value
			if (word == '=')
				return;
				
			if (!this.setValue)
			{
				this.value = word;
				this.setValue = true;
			}
			return;
		}

		// Not ID, do whatever
		super.WordRead(r, word);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w)
	{
		// Section identifier
		w.UInt32(this.ByteType());
		
		// QBkey ID
		w.UInt32(this.ByteID());
		
		// Pointer to string
		w.UInt32(w.Tell() + 8);
		
		// Pointer to next item!
		var nPoint = w.Tell();
		w.UInt32(0);
		
		// Write our string
		if (this.value)
		{
			for (var s=0; s<this.value.length; s++)
			{
				var cc = this.value.charCodeAt(s);
				if (cc < 0 || cc > 255)
					cc = 45;
					
                if (this.typeName == "StructItemStringW")
                    w.UInt16(cc);
                else
                    w.UInt8(cc);
			}
		}
			
		// Null term
        if (this.typeName == "StructItemStringW")
            w.UInt16(0x00);
        else
            w.UInt8(0x00);
		
		// Pad to nearest 4 bytes
		var exPad = w.Tell() % 4;
		if (exPad)
			w.Pad(4 - exPad);
		
		// Fix next pointer
		var nTell = w.Tell();
		w.Seek(nPoint);
		this.WriteNext(w, nTell);
		w.Seek(nTell);
	}
}

module.exports = QBItemStructString;
