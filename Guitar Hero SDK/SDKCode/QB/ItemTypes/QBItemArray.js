// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Array item
// It's an array of different things
/*
	case QbItemType.ArrayArray:
	case QbItemType.ArrayString:
	case QbItemType.ArrayStringW:
	case QbItemType.ArrayStruct:
	case QbItemType.ArrayFloatsX2:
	case QbItemType.ArrayFloatsX3:
*/
//
// ItemCount, Pointer, Pointers -  (if length is 1 then pointer points to first item and Pointers are abscent)
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ARRAY_DEBUG = false

const QBItemBase = require('./QBItemBase.js');

class QBItemArray extends QBItemBase
{
	Initialize(opt)
	{
		super.Initialize(opt);
		
		this.qbType = ItemTypes.QBTypes.ARRAY;
		
		this.parsedChildren = 0;
		
		this.itemCount = opt.itemCount;
		this.pointer = opt.pointer;
		this.pointers = opt.pointers || [];
		
		// Array of strings
		this.stringArray = (this.typeName == 'ArrayString' || this.typeName == 'ArrayStringW');
		
		if (this.reader)
		{
			// How many items?
			this.itemCount = this.reader.UInt32()
			
			// If the item count is massive, then this probably has only one item
			// (In the case of single-entry QBKey arrays, etc.)
			// We want to un-read item count and treat it as another value
			
			if (this.itemCount > 50000)
			{
				this.reader.Seek(this.reader.Tell() - 4);
				this.itemCount = 1;
			}
			
			// Pointer to... pointers?
			
			// HACK: ArrayQBkey of length 1 doesn't have pointer
			// Is this only for QB keys???
			
			if (this.itemCount == 1 && this.IsQBLike())
				this.pointer = 0;
			else
				this.pointer = this.reader.UInt32()

			// IF QB-LIKE, READ OUR VALUES IN SEQUENCE!
			
			if (this.IsQBLike())
			{
				this.values = [];
				for (var i=0; i<this.itemCount; i++)
				{
					var val = (this.typeName == 'ArrayFloat') ? this.reader.Float() : this.reader.UInt32();
					this.values.push( val );
				}

				this.Finalize();
				return;
			}

			// Pointer list
			if (this.itemCount > 1)
			{
				for (var i=0; i<this.itemCount; i++)
					this.pointers.push( this.reader.UInt32() );
			}
			
			// String values!
			if (this.stringArray)
			{
                var isWideString = (this.typeName == 'ArrayStringW');
                
				this.values = [];
				for (var i=0; i<this.itemCount; i++)
				{
					var ts = isWideString ? this.reader.TermWString() : this.reader.TermString();
					this.values.push(ts);
				}
				
				// Skip to 4 bytes after strings...?
				this.reader.SkipToNearest(4);
				
				this.Finalize();
			}
		}
	}
	
	//-----------------------------------
	// This is a QB-like array
	// Similar to array of QBkeys
	//-----------------------------------
	
	IsQBLike()
	{
		var tn = this.typeName;
		return (tn == 'ArrayQBKey' || tn == 'ArrayInteger' || tn == 'ArrayFloat' || tn == 'ArrayQBKeyString' || tn == 'ArrayQBKeyStringW' || tn == 'ArrayQBKeyStringQs');
	}
	
	//-----------------------------------
	// One of our children was finalized
	//-----------------------------------
	
	ChildFinalized(theChild)
	{
		super.ChildFinalized(theChild);
		
		this.parsedChildren ++;

		if (this.parsedChildren >= this.itemCount)
			this.Finalize();
	}
	
	//-----------------------------------
	// What debug text?
	//-----------------------------------
	
	GetDebugText()
	{
		return super.GetDebugText() + " - " + ((this.values && this.values.length) || this.itemCount || this.items.length) + " items";
	}
	
	//-----------------------------------
	// Don't touch
	//-----------------------------------
	
	ToTextCore() 
	{ 
		var dbg = ARRAY_DEBUG ? " (" + ((this.values && this.values.length) || this.items.length) + " values)" : "";
		var txt = this.Indent() + this.typeName + dbg + this.NewLine() + this.Indent() + "[";
		
		this.values = this.values || [];
		
		switch (this.typeName)
		{
			case 'ArrayQBKey':
			case 'ArrayQBKeyString':
			case 'ArrayQBKeyStringQs':
				for (var qbk of this.values)
					txt += this.NewLine() + this.Indent() + String.fromCharCode(9) + this.ValToString(qbk);
				break;
				
			case 'ArrayString':
			case 'ArrayStringW':
				if (this.values && this.values.length > 0)
				{
					for (var str of this.values)
						txt += this.NewLine() + this.Indent() + String.fromCharCode(9) + '"' + str + '"';
				}
				break;
				
			case 'ArrayInteger':
				for (var qbk of this.values)
					txt += this.NewLine() + this.Indent() + String.fromCharCode(9) + qbk;
				break;
				
			case 'ArrayFloat':
				for (var qbk of this.values)
					txt += this.NewLine() + this.Indent() + String.fromCharCode(9) + qbk.toPrecision(6);
				break;
				
			default:
				txt += this.NewLine() + this.ChildText() + this.Indent();
				break;
		}
		
		txt += this.NewLine() + this.Indent() + "]" + this.NewLine();
		
		return txt;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	//~ IsBadCharacter(r, ccd)
	//~ {
		//~ // FLOAT HACK: Ignore periods
		//~ // We should probably do this anyway... maybe?
		
		//~ if (ccd == 46)
			//~ return false;
			
		//~ return super.IsBadCharacter(r, ccd);
	//~ }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// A word was read from the text file
	//-----------------------------------
	
	WordRead(r, word)
	{
		// Allow for injecting, mostly
		var wr = super.WordRead(r, word);
		
		if (wr)
			return true;
		
		//~ if (this.IsQBLike())
		//~ {
			//~ this.values = this.values || [];
			//~ this.values.push(word);
			//~ return true;
		//~ }
			
		return false;
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd)
	{
		// Start bracket
		if (ccd == 91)
		{
			this.arrayStart = this.textReader.Tell();
			this.inSection = true;
			return true;
		}
			
		// End bracket
		if (ccd == 93 && this.inSection)
		{
			this.arrayEnd = this.textReader.Tell() - 1;
			
			if (this.IsQBLike() || this.stringArray)
				this.SliceValues();
			
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
	
	ToBytesCore(w)
	{
		// Array identifier
		w.UInt32(this.ByteType());
		
		// Item count
		w.UInt32((this.values && this.values.length) || this.items.length);
		
		var qbLike = this.IsQBLike();
		
        // No items at all? Just skip
        if (this.items.length > 0 || (this.values && this.values.length > 0))
        {
            // Pointer to pointers (or first item)...
            // If length is 1, this is to first item
            // (ArrayQBKey of 1 doesn't have any pointers AT ALL)
            
            if (!qbLike || (qbLike && this.values.length !== 1))
                w.UInt32(w.Tell() + 4);
            
            // Our values
            switch (this.typeName)
            {
                // If we're a QBKey array, jam our values in here
                case 'ArrayQBKey':
                case 'ArrayQBKeyString':
                case 'ArrayQBKeyStringQs':
                    for (var val of this.values)
                        w.UInt32(Checksums.Make(val));
                    return;
                    break;
                    
                // Integers!
                case 'ArrayInteger':
                    for (var val of this.values)
                        w.UInt32(val);
                    return;
                    break;
                    
                // Floats!
                case 'ArrayFloat':
                    for (var val of this.values)
                        w.Float(val);
                    return;
                    break;
            }
            
            // Pointers to all the items
            // RETURN TO THIS LATER
            
            var itemList = (this.stringArray ? this.values : this.items);
            
            var usePointers = (itemList.length > 1);
            
            if (usePointers)
            {
                var pointerSpots = [];
                
                for (var item of itemList)
                {
                    pointerSpots.push( w.Tell() );
                    w.UInt32(0);
                }
            }
            
            // Good stuff, now let's actually parse our children
            for (var i=0; i<itemList.length; i++)
            {
                var off = w.Tell();
                
                // Fill in pointer spot
                if (usePointers)
                {
                    w.Seek(pointerSpots[i]);
                    w.UInt32(off);
                    w.Seek(off);
                }
                
                // It's the string
                if (this.stringArray)
                {
                    if (this.typeName == 'ArrayStringW')
                        w.ASCIIWString(itemList[i], true);
                    else
                        w.ASCIIString(itemList[i], true);
                }
                else
                    itemList[i].ToBytesCore(w);
            }
            
            // Pad to 4 bytes if string
            if (this.stringArray)
                w.PadToNearest(4);
        }
        else
        {
        }
	}
	
	//-----------------------------------
	// Slice our values based on the text we read!
	// This can split them by newlines or commas
	//-----------------------------------
	
	SliceValues()
	{
		this.values = this.values || [];
		
		var slicer = this.textReader.Between(this.arrayStart, this.arrayEnd).trim();
		
		// Replace \r with \n
		slicer = slicer.replace(/\r/g, "\n");
		
		// If a string array, get all values between quotes
		if (this.stringArray)
		{
			var splitter = slicer.match(/"([^"]*)"/g);
			if (splitter)
			{
				for (const val of splitter)
					this.values.push(val.slice(1, val.length-1));
			}
			return;
		}
		
		// Split by newlines or commas, depending on which exists
		var splitter = slicer.indexOf(",") >= 0 ? "," : "\n";
		var split = slicer.split(splitter);
		
		for (const val of split)
		{
			var cleanVal = val.trim();
			
			if (cleanVal.length <= 0)
				continue;
	
			this.values.push(cleanVal);
		}
	}
}

module.exports = QBItemArray;
