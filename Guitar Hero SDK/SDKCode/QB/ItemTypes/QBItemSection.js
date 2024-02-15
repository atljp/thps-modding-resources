// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Section item
// It's a section indicator
/*
	case QbItemType.SectionArray:
	case QbItemType.SectionFloatsX2:
	case QbItemType.SectionFloatsX3:
	case QbItemType.SectionString:
	case QbItemType.SectionStringW:
	case QbItemType.SectionStruct:
	case QbItemType.SectionScript:
*/
//
// ItemId, FileId, Pointer, Reserved
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const QBItemBase = require('./QBItemBase.js');

class QBItemSection extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.finalizeOnChild = true;
		
		// Set type based on what section we are
		switch (this.typeName)
		{
			case 'SectionArray':
				this.qbType = ItemTypes.QBTypes.ARRAY;
				break;
				
			case 'SectionStruct':
				this.qbType = ItemTypes.QBTypes.STRUCT;
				break;
		}
		
		this.id = opt.id || this.id || "00000000";
		this.fileId = opt.fileId || "00000000";
		this.pointer = opt.pointer;
		this.reserved = opt.reserved;
		
		// If reading from a file...
		if (this.reader)
		{
			// Read the ID
			this.id = this.reader.UInt32().toString(16).padStart(8, "0");
			
			// Full filename... why?
			this.fileId = this.reader.UInt32().toString(16).padStart(8, "0");
			
			// Pointer to start of our section
			// For integers, this is our value!
			
			switch (this.typeName)
			{
				case 'SectionFloat':
					this.pointer = this.reader.Float();
					break;
					
				case 'SectionInteger':
					this.pointer = this.reader.Int32();
					break;
					
				default:
					this.pointer = this.reader.UInt32();
					break;
			}
			
			// Reserved
			this.reserved = this.reader.UInt32()

			// If string, we read the actual string!
			if (this.typeName == 'SectionString' || this.typeName == 'SectionStringW')
			{
                var isWide = (this.typeName == 'SectionStringW');
                
				var tempstr = "";
				var ltr = isWide ? this.reader.UInt16() : this.reader.UInt8();
				
				while (ltr !== 0x00)
				{
					tempstr += String.fromCharCode(ltr);
					ltr = isWide ? this.reader.UInt16() : this.reader.UInt8();
				}
				
				// Jump to nearest 4 bytes
				this.reader.SkipToNearest(4);
				
				this.value = tempstr;
				this.Finalize();
			}
			
			// INTEGER / FLOAT / QBKEY / QBKEYSTRING
			if (this.typeName == 'SectionInteger' || this.typeName == 'SectionFloat' || this.typeName == 'SectionQBKey' || this.typeName == 'SectionQBKeyString' || this.typeName == 'SectionQBKeyStringQs')
			{
				this.value = this.pointer;
				this.Finalize();
			}
		}
	}
    
    //-----------------------------------
	// Finalize the object
	//-----------------------------------
	
	Finalize() 
	{ 
        if (this.typeName == "SectionArray" && this.items.length)
        {
            var arr = this.items[0];
            
            var hasChildren = (arr.items.length > 0 || (arr.values && arr.values.length > 0));
            if (!hasChildren)
                cons.error("[" + this.id + "] " + this.constructor.name + " had an empty array child. Please use a Floats item.");
        }
        
		super.Finalize();
	}
	
	//-----------------------------------
	// What debug text?
	//-----------------------------------
	
	GetDebugText()
	{
		return super.GetDebugText() + " - " + this.typeName + " - " + Checksums.Lookup(this.id);
	}
	
	//-----------------------------------
	// Don't touch
	//-----------------------------------
	
	ToTextCore() 
	{ 
		// Is it a QB key? If so, our value will be looked up
		var isQBK = (this.typeName == 'SectionQBKey' 
			|| this.typeName == 'SectionQBKeyString' 
			|| this.typeName == 'SectionQBKeyStringW' 
			|| this.typeName == 'SectionQBKeyStringQs');
			
		var isStringType = (this.typeName == 'SectionString' || this.typeName == 'SectionStringW');
		
		// These are specific, just values
		if (this.typeName == 'SectionInteger' || this.typeName == 'SectionFloat' || isQBK || isStringType)
		{
			// Float has precision
			var valString = ((this.typeName == 'SectionFloat') ? this.value.toPrecision(6) : this.value).toString()
			
			// QBkey actually needs to be looked up
			if (isQBK)
				valString = Checksums.Lookup(this.value);
				
			// String value is surrounded in quotes
			if (isStringType)
				valString = "\"" + valString + "\"";
			
			return this.Indent() + this.typeName + " " + this.GetID() + " " + valString + this.NewLine();
		}
		
		return this.Indent() + this.typeName + " " + this.GetID() + this.NewLine() + this.Indent() + "{" + this.NewLine() + this.ChildText() + this.Indent() + "}" + this.NewLine();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Attempt to read a word
	//-----------------------------------
	
	WordRead(r, word)
	{
		// No ID yet, use the word!
		if (this.id == "00000000")
		{
			this.id = word;
			return;
		}
		
		// Integer uses the first word
		if (this.typeName == 'SectionInteger')
		{
			this.value = parseInt(word);
			this.Finalize();
			return;
		}
		
		// Float uses the first word
		if (this.typeName == 'SectionFloat')
		{
			this.value = parseFloat(word);
			this.Finalize();
			return;
		}
		
		// QBKey / string uses the first word
		if (this.typeName == 'SectionQBKey' 
			|| this.typeName == 'SectionQBKeyString' 
			|| this.typeName == 'SectionQBKeyStringQs' 
			|| this.typeName == 'SectionString'
			|| this.typeName == 'SectionStringW')
		{
			this.value = word;
			this.Finalize();
			return;
		}

		// Not ID, do whatever
		super.WordRead(r, word);
	}
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// Quotations!
		if (ccd == 34)
			return true;
			
		// Never bad in string
		if (this.inString)
			return false;
			
		// Allow slashes
		if (ccd == 92 || ccd == 47)
			return false;
			
		return super.IsBadCharacter(r, ccd);
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd)
	{
		// Quotations!
		if (ccd == 34)
		{
			if (!this.inString)
			{
				this.inString = true;
				return true;
			}
			
			// End our string
			else
			{
				this.inString = false;
				this.Finalize();
				return false;
			}
		}
		
		// Start bracket
		if (ccd == 123)
		{
			this.inSection = true;
			return true;
		}
			
		// End bracket
		if (ccd == 125 && this.inSection)
		{
			this.inSection = false;
			this.Finalize();
			return true;
		}
		
		return super.HandleBadCharacter(r, ccd);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w)
	{
        if (this.typeName == 'SectionStruct')
        {
            var hadHeader = false;
            
            if (this.items && this.items.length)
            {
                var item = this.items[0];
                
                if (item.typeName.toLowerCase() == "structheader")
                    hadHeader = true;
            }
            
            if (!hadHeader)
            {
                cons.error("SectionStruct " + this.id + " was missing a StructHeader.");
                return;
            }
        }
        
        if (this.typeName == 'SectionArray')
        {
            var hadArray = false;
            
            if (this.items && this.items.length)
            {
                var item = this.items[0];
                
                var tn = item.typeName.toLowerCase();
                
                if (tn == "floats" || tn.startsWith("array"))
                    hadArray = true;
            }
            
            if (!hadArray)
            {
                cons.error("SectionArray " + this.id + " was missing an array child. Must have ArrayFloat, etc.");
                return;
            }
        }
        
		// Section identifier
		w.UInt32(this.ByteType());
		
		// QBkey ID
		w.UInt32(this.ByteID());
		
		// Full filename - TODO
		var ffn = Checksums.Make(this.FullFilename());
		w.UInt32(ffn);
		
		// For integers, we use value
		if (this.typeName == 'SectionInteger')
			w.Int32(this.value);
		// For floats, we also use value
		else if (this.typeName == 'SectionFloat')
			w.Float(this.value);
		// For qbkeys, use value as checksum
		else if (this.typeName == 'SectionQBKey' || this.typeName == 'SectionQBKeyString' || this.typeName == 'SectionQBKeyStringQs')
			w.UInt32(Checksums.Make(this.value));
		else
		{
			// Pointer to the first item
			w.UInt32( w.Tell() + 8 );
		}

		// Reserved
		w.UInt32(0);
		
		// For strings, we write our string data!
		if (this.typeName == 'SectionString' || this.typeName == 'SectionStringW')
		{
            var isWide = (this.typeName == 'SectionStringW');
            
			if (this.value)
			{
				for (var letter of this.value)
                {
                    if (isWide)
                        w.UInt16(letter.charCodeAt(0));
                    else
                        w.UInt8(letter.charCodeAt(0));
                }
			}
				
            if (isWide)
                w.UInt16(0x00);
            else
                w.UInt8(0x00);
			
			w.PadToNearest(4);
		}
	}
}

module.exports = QBItemSection;
