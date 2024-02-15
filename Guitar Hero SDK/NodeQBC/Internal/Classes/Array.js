// ---------------------------------------------------
//
//	ARRAY
//	An array, a list of items!
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCArray extends ItemCore
{
	Initialize() { this.ptr_pointerList = 0; }
	IsArray() { return true; }
	GetItemInfoType() { return QBC.constants.TypeBindings['Array']; }
	
	//-----------------------
	// Is this item type allowed to have multiple items?
	//-----------------------
	
	MultiItemsAllowed(item_type)
	{
		// FLOATS
		return (item_type !== 0x00);
	}
	
	//-----------------------
	// Is this a linear array? All objects are the same length
	//-----------------------
	
	IsLinearArray(item_type = -1)
	{
		// No item type defined, check our children
		if (item_type == -1 && this.children.length > 0)
			item_type = this.children[0].GetItemInfoType();
			
		return (item_type == 0x02 || item_type == 0x1C || item_type == 0x0D || item_type == 0x01 || item_type == 0x1A);
	}
	
	//-----------------------
	// Read!
	//-----------------------
	
	Read() 
	{
		if (this.InScript())
		{
			while (this.ReadAllowed())
				this.ReadScriptToken();
				
			return;
		}
		
		// ------------
		
		var item_count = 1;
        
        // If we are in an array, then we don't
        // want to read our top-level .pak item info.

        if (!this.InArray())
        {
            this.ReadSharedProperties(); 
            
            // Skip to start of array list
            this.reader.Seek(this.ptr_listStart);
        }
        
        // -- At this point, we're in a QBArrayNode item. See 010 templates in SDK. --
		
		// Read information about the item(s) in our list
		// By array design, all items will share this item type!
		
		var first_item_info = this.ReadItemInfo();
        
		if (this.MultiItemsAllowed(first_item_info.item_type))
		{
			item_count = this.reader.UInt32();
			
			// If the array has more than 1 item, or is non-linear, skip to it!
			if (item_count > 1 || !this.IsLinearArray(first_item_info.item_type))
			{
				var ptr_items_start = this.reader.UInt32();
				this.reader.Seek(ptr_items_start);
			}
		}

		// -- WE ARE NOW AT OUR LIST -----------------------------
		
		// Sequential arrays don't have pointers, since they're all the same size!
		// That means we can read them in sequence evenly
		
		if (this.IsLinearArray(first_item_info.item_type))
		{
			for (var i=0; i<item_count; i++)
			{
				var child = this.CreateObjectFromInfo(first_item_info, {dataOnly: true, parent: this});
			}
		}
		
		// Otherwise, it means the sizes of the array items can differ
		// Therefore, we have pointers to each item
		
		else
		{
			// Where does the first item start?
			var pointer_list = [];
			
			// Multi-item arrays use a pointer list
			if (item_count > 1)
			{
				for (var p=0; p<item_count; p++)
					pointer_list.push(this.reader.UInt32());
			}
			else
				pointer_list.push(this.reader.Tell());
				
			for (var i=0; i<item_count; i++)
			{
				var ptr = pointer_list[i];
				this.reader.Seek(ptr);
				
				var child = this.CreateObjectFromInfo(first_item_info, {dataOnly: true, parent: this});
			}
		}
		
		// Align to nearest 4 bytes, in case
		// the values in our array didn't themselves
		
		this.reader.SkipToNearest(4);
	}
	
	ReadSharedValue() { this.ptr_listStart = this.reader.UInt32(); }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T   O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Is this object type a
	// single-line object?
	//-----------------------
	
	IsSingleLine() { return false; }
	
	//-----------------------
	// Internal write, DO NOT CALL
	//-----------------------
	_WriteText()
	{
        var singleLine = this.HasOnlySingleLineChildren();
        
		this.WriteIDString();
		
        // Empty array.
        if (this.children.length <= 0)
            this.AddText("[]");
            
        // Plain multi-line struct.
        else if (!singleLine)
        {
            this.AddText("[");
            
                if (this.children.length > 0)
                {
                    this.job.AddIndent();
                    
                    if (this.CanAutoCreateNewlines())
                        this.AddLine();
                    
                    for (const child of this.children)
                        child._WriteText();
                    
                    this.job.SubIndent();
                }
                
            this.job.AddText("]");
        }
        
        // Beautiful single line array.
        else
        {
            this.AddText("[ ");
            
            if (this.children.length > 0)
            {
                for (const child of this.children)
                    child._WriteText();
            }
                
            this.AddText(" ]");
        }
        
        if (this.CanAutoCreateNewlines())
            this.AddLine();
        else
            this.AddInlineSpace();
		
		this.PostWriteText();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	U N L E X
	//		Populates data from the lexer
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Finished unlexing!
	// (Is this object okay?)
	//-----------------------
	
	PostUnLex()
	{
		// Let's validate if our children are all the same type!
		// If not, use a struct, this is NOT what arrays are for!
		
		if (this.children.length > 0 && !this.InScript())
		{
			var desiredType = this.children[0].GetClassName();
			
			for (var c=0; c<this.children.length; c++)
			{
				var child = this.children[c];
				var childType = child.GetClassName();
				
				if (childType == desiredType)
					continue;
					
				this.Fail("ARRAY ERROR: First item was " + desiredType + " but ran into " + childType + " at index " + c + "!");
				return;
			}
		}
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
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_STARTARRAY);
			return;
		}
		
		super.Serialize();
	}
	
	//-----------------------
	// Writes the object's data
	//-----------------------
	
	SerializeSharedData()
	{
        // Pointer to our item list. This will contain our objects.
        this.writer.UInt32(this.writer.Tell() + 8);
	}

	//-----------------------
	// Serialize the main object's data
	// (Override this!)
	//-----------------------
	
	SerializeData()
	{
        // If this is a top-level object, we will do a super.
        // This writes our item info, shared item value, etc.
        //
        // (If this array is in another array, we don't want any part of it.)
        
        if (!this.InArray())
            super.SerializeData();
		
		// --------------
		
		// All of our items are the same type, but
		// we want to write the ItemInfo of the first!
		
		this.writer.UInt8(0);
		
		var finalFlags = QBC.constants.FLAG_HASPARENT;
		this.writer.UInt8(finalFlags);
		
		// Type 0 if no children
		if (this.children.length <= 0)
			this.writer.UInt8(0);
		else
			this.writer.UInt8( this.children[0].GetItemInfoType() );
			
		this.writer.UInt8(0);
		
		// --------------
        
		this.writer.UInt32(this.children.length);			// Item count
        
        // No children? Just write a null object.
        // I think this is a pointer to the object internally, who knows?
        
        if (this.children.length <= 0)
        {
            this.writer.UInt32(0);
            return;
        }
        
        var isLinear = this.IsLinearArray();
        
        // Write our list start if:
        //  - We have more than 1 child
        //  - We have an item that may have a varying length
        
        if (this.children.length > 1 || !isLinear)
            this.writer.UInt32(this.writer.Tell() + 4);			// List start
        
        if (this.children.length > 1)
        {
            // If our children items vary in size, we need pointers to them!
            // Otherwise, don't worry about it
            
            if (!isLinear)
            {
                this.ptr_pointerList = this.writer.Tell();
                
                // FIX THESE LATER
                for (var c=0; c<this.children.length; c++)
                    this.writer.UInt32(0);
            }
        }
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{	
        // If we are a top-level item, ALWAYS pad to nearest 4 bytes!
		// (This is just in case we had string children)
        if (!this.InScriptBody())
            this.writer.PadToNearest(4);
        
		// Important for next-item in structs
		super.PostSerialize();
		
		if (this.InScript())
		{
			this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_ENDARRAY);
			return;
		}
		
		// Fix up our pointer list!
        if (this.children.length > 1)
        {
            if (!this.IsLinearArray() && this.ptr_pointerList > 0)
            {
                var old_off = this.writer.Tell();
                this.writer.Seek(this.ptr_pointerList);
                
                for (const child of this.children)
                {
                    var objPointer = child.ptr_spawnOffset;
                    this.writer.UInt32(objPointer);
                }
                
                this.writer.Seek(old_off);
            }
        }
	}
}

module.exports = QBCArray;
