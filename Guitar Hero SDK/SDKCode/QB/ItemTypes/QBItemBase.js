// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// BASE CLASS FOR ALL QB ITEMS
// Extend from this, it has helpful junk
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class QBItemBase
{
	constructor(opt = {})
	{
		// Add to option's parent list
		if (opt.parent)
			this.AddToParent(opt.parent);
			
		// The object "type" for this class
		// Struct, array, etc.
		this.qbType = ItemTypes.QBTypes.NORMAL;
		
		this.indentable = true;
		
		// Immediately finalize when ANY child is finalized
		// (Good for sections)
		this.finalizeOnChild = false;
			
		// Type of this object, as a number
		this.typeNumber = opt.type || 0;
		
		// Type of this object, as a name
		this.typeName = opt.itemName || this.constructor.name;
		
		// Child items that we have
		this.items = [];
		
		// Unique identifier for the item
		// 	(Mostly for reference, in case we need to look it up)
		this.id = "00000000";
		this.friendlyID = false;
		
		// Are we finished reading?
		// If so, this will abort our read process
		this.finished = false;
		
		// We should IMMEDIATELY start reading BINARY
		this.startRead = (opt.startRead == undefined) ? true : opt.startRead;
		// We should IMMEDIATELY start reading TEXT
		this.startTextRead = (opt.startTextRead == undefined) ? false : opt.startTextRead;
	
		// Binary reader
		this.reader = opt.r;
		this.startOffset = (this.reader && (this.reader.Tell() - 4)) || 0;
		
		// Text reader
		this.textReader = opt.textReader;
		
		// Initialize core object properties
		this.Initialize(opt);
		
		// Start reading binary code if available
		if (this.startRead && this.reader)
			this.Read(this.reader);
			
		// Start reading text code if available
		if (this.startTextRead && this.textReader)
			this.ReadText(this.textReader);
	}
	
	//-----------------------------------
	// Add to parent's children list
	//-----------------------------------
	
	AddToParent(obj)
	{
		obj.AddChild(this);
		this.parent = obj;
	}
	
	//-----------------------------------
	// Get the current "full filename" as a string
	//-----------------------------------
	
	FullFilename()
	{
		// Get the topmost parent, this should go up to QB reader level
		var parent = this.parent;
		while (parent.parent) { parent = parent.parent; }
		
		// QB reader's filename function
		return parent.FullFilename();
	}
	
	//-----------------------------------
	// Remove all of our children!
	//-----------------------------------
	
	RemoveChildren() { this.items = []; }
	
	//-----------------------------------
	// Read our bytes from the file
	// Don't touch this!
	//-----------------------------------
	
	Read(r)
	{
		while (r.CanRead() && !this.finished) { this.ReadFunction(r); }
	}
	
	//-----------------------------------
	// Actually try reading stuff
	//-----------------------------------
	
	ReadFunction(r)
	{			
		if (r.buf.length - r.Tell() < 4)
		{
			this.Finalize();
			return;
		}
		var itemType = r.UInt32();
		
		// Find the item class for this number
		var fic = ItemTypes.FindItemClass(itemType, this.qbType);
		
		if (!fic.itemClass)
		{
			cons.error("CANNOT FIND ITEM CLASS FOR TYPE: " + itemType.toString(16));
			return;
		}
		
		// We found an item!
		if (this.CanCreateItem(r, fic))
		{
			// Create a new one!
			new fic.itemClass({
				parent: this,
				type: itemType,
				itemName: fic.itemName,
				r: r
			});
		}
		
		if (r.Tell() >= r.buf.length)
			this.Finalize();
	}
	
	//-----------------------------------
	// Initialize the object
	//-----------------------------------
	
	Initialize(opt) {}
	
	//-----------------------------------
	// Finalize the object
	//-----------------------------------
	
	Finalize() 
	{ 
		// Don't allow multiple finalizes
		if (this.finished)
			return;
			
		this.finished = true; 
		
		// Tell our parent a child was finalized
		if (this.parent)
			this.parent.ChildFinalized(this);
	}
	
	//-----------------------------------
	// One of our children was finalized
	//-----------------------------------
	
	ChildFinalized(theChild)
	{
		// Only finalizeOnChild if in binary!
		// If in textmode, brackets, etc. finalize us
		
		if (this.finalizeOnChild && this.reader)
			this.Finalize();
	}
	
	//-----------------------------------
	// Add a child object
	//-----------------------------------
	
	AddChild(obj) { this.items.push(obj); }
	
	//-----------------------------------
	// Can we create a new item?
	//-----------------------------------
	
	CanCreateItem(r, foundItem) { return true; }
	
	//-----------------------------------
	// Easy debugging of OUR CHILDREN
	//-----------------------------------

	EasyChildDebug(item)
	{
		this.indent = this.indent || 0;
		var txt = "";
		
		for (var i=0; i<this.indent; i++)
			txt += String.fromCharCode(9);
			
		txt += item.typeName;
		
		if (item.id)
			txt += " - " + Checksums.Lookup(item.id);
			
		if (item.value)
			txt += " - " + Checksums.Lookup(item.value);
		
		console.log(txt);
		
		this.indent ++;
		
		for (var child of item.items)
			this.EasyChildDebug(child);
			
		this.indent --;
	}
	
	//-----------------------------------
	// Debug (DO NOT TOUCH)
	//-----------------------------------
	
	CoreDebug()
	{
		this.Debug();
		
		CurrentQBReader.indent ++;
		
		for (var item of this.items)
			item.CoreDebug();
			
		CurrentQBReader.indent --;
	}
	
	//-----------------------------------
	// Debug text, override this
	//-----------------------------------
	
	Debug()
	{
		var str = this.GetDebugText();
		for (var i=0; i<CurrentQBReader.indent; i++)
			str = "   " + str;
			
		console.log(str);
	}
	
	//-----------------------------------
	// What debug text?
	//-----------------------------------
	
	GetDebugText() { return "[" + this.startOffset + "] " + this.constructor.name; }
	
	//-----------------------------------
	// Finalize if a number is 0
	// Use this for NextPointers
	//-----------------------------------
	
	FinalizeIf(num = this.nextPointer)
	{
		if (num == 0 && this.parent)
			this.parent.Finalize();
	}
	
	//-----------------------------------
	// New line
	//-----------------------------------
	
	NewLine() { return String.fromCharCode(13); }
	
	//-----------------------------------
	// Get text from children
	//-----------------------------------
	
	ChildText()
	{
		var txt = "";
		for (var child of this.items)
			txt += child.ToTextCore();
			
		return txt;
	}
	
	//-----------------------------------
	// Indent based on how many parents we have
	//-----------------------------------
	
	Indent()
	{
		var ind = "";
		
		var parent = this.parent;
		while (parent) { ind += parent.indentable ? String.fromCharCode(9) : ""; parent = parent.parent; }
		
		return ind;
	}
	
	//-----------------------------------
	// Convert this object's ID to a string
	//-----------------------------------
	
	GetID()
	{
		return this.ValToString(this.id);
	}
	
	//-----------------------------------
	// Don't touch
	//-----------------------------------
	
	ToTextCore()
	{
		return this.Indent() + this.ToText() + this.NewLine() + this.ChildText();
	}
	
	//-----------------------------------
	// Convert this item to text-readable format!
	//-----------------------------------
	
	// Override this ToText function, please
	ToText() { return this.GetDebugText(); }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Read our text from the file
	// Don't touch this!
	//-----------------------------------
	
	ReadText(r)
	{
		while (r.CanRead() && !this.finished) { this.ReadTextFunction(r); }
	}
	
	//-----------------------------------
	// Is this character bad? (By char code)
	//-----------------------------------
	
	IsBadCharacter(r, ccd)
	{
		// Whitespace
		if (r.IsWhitespace(ccd))
			return true;
			
		// Slash, this is most likely a comment
		if (ccd == 47)
			return true;
			
		// Bracket! {}
		if (ccd == 123 || ccd == 125)
			return true;
			
		// Bracket! []
		if (ccd == 91 || ccd == 93)
			return true;
			
		return false;
	}
	
	//-----------------------------------
	// Actually try reading stuff
	//-----------------------------------
	
	ReadTextFunction(r)
	{
		var ltr = r.Letter(false);
		var ccd = ltr.charCodeAt(0);
		
		// It's whitespace, end our word!
		if (this.IsBadCharacter(r, ccd))
		{
			var word = r.tempstr;
			r.ResetTemp();
			
			// Intercept the bad character!
			if (!this.HandleBadCharacter(r, ccd))
			{
				if (word.length > 0)
					this.WordRead(r, word);
			}
		}
		
		// Otherwise, add it
		else
			r.AddText(ltr);
	}
	
	//-----------------------------------
	// Intercept a bad character
	// Return false if we want to parse the word in the word cache
	//-----------------------------------
	
	HandleBadCharacter(r, ccd) 
	{ 
		// Is it a comment?
		
		if (ccd == 47)
		{
			// Next letter!
			if (r.Tell()+1 < r.text.length)
			{
				// By this point we are AT the next letter
				var off = r.Tell();
				var ltr = r.Letter(false);
				r.Seek(off);
				
				var ccdB = ltr.charCodeAt(0);
				
				// The next letter is a slash, or an asterisk
				
				if (ccdB == 47 || ccdB == 42)
				{
					var isBlock = (ccdB == 42);

					var cls = ItemTypes.classes['Comment'];
					
					new cls({
						textReader: r,
						parent: this,
						type: 0xDEADBEEF,
						itemName: 'Comment',
						startTextRead: true,
						block: isBlock
					});
					
					return true;
				}
			}
		}
		
		return false; 
	}
	
	//-----------------------------------
	// A word was read from the text file
	//-----------------------------------
	
	WordRead(r, word)
	{
		// Is it a valid item type?
		// If so, let's create the object!
		
		var ftc = ItemTypes.FindTextClass(word.trim());
		
		if (ftc.itemClass)
		{
			//~ console.log(this.constructor.name + " - MAKE CLASS " + ftc.itemName + "!");
			new ftc.itemClass({
				textReader: r,
				parent: this,
				type: word,
				itemName: ftc.itemName,
				startTextRead: true
			});
			
			return true;
		}
		
		return false;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------------------
	// Get our topmost parent
	//-----------------------------------
	
	HighestParent()
	{
		var parent = this.parent;
		while (parent) 
		{ 
			if (!parent.parent)
				break;
				
			parent = parent.parent; 
		}
		
		return parent;
	}
	
	//-----------------------------------
	// Get our index in the parent's list stack
	//-----------------------------------
	
	GetChildIndex()
	{
		if (this.parent && this.parent.items.length > 0)
		{
			for (var i=0; i<this.parent.items.length; i++)
			{
				if (this == this.parent.items[i])
					return i;
			}
		}
		
		return -1;
	}

	//-----------------------------------
	// Do we have a NEXT item in our parent?
	//-----------------------------------
	
	HasNextItem()
	{
		var CI = this.GetChildIndex();
		
		if (this.parent && this.parent.items.length > 0 && CI < this.parent.items.length-1)
			return true;
			
		return false;
	}
	
	//-----------------------------------
	// Write our nextPointer byte
	// If we're the last child of our parent, write 0!
	//-----------------------------------
	
	WriteNext(w, val)
	{
		if (this.parent && this.parent.items.length > 0)
		{
            var cidx = this.GetChildIndex();
                
			if (cidx == this.parent.items.length-1)
			{
				w.UInt32(0);
				return;
			}
		}
		
		w.UInt32(val);
	}
	
	//-----------------------------------
	// Input bytes from our children
	//-----------------------------------
	
	ChildBytes(w)
	{
		for (var child of this.items)
			child.ToBytesCore(w);
	}
	
	//-----------------------------------
	// Don't touch
	//-----------------------------------
	
	ToBytesCore(w)
	{
		//~ console.log(this.constructor.name + " - " + w.Tell());
		this.ToBytes(w);
		this.ChildBytes(w);
	}
	
	//-----------------------------------
	// Convert this item to byte format!
	//-----------------------------------
	
	ToBytes(w) {}
	
	//-----------------------------------
	// Get byte type for this object
	//-----------------------------------
	
	ByteType() 
	{ 
		var fin = ItemTypes.FindItemNumber(this.typeName, this.qbType); 
		
		if (fin == 0)
			console.log("WARNING, BAD BYTE TYPE: " + this.typeName + " - " + this.qbType);
			
		return fin;
	}
	
	//-----------------------------------
	// Get byte id for this object, or a value
	//-----------------------------------
	
	ByteID(val = this.id)
	{		
		return Checksums.Make(val);
	}
	
	//-----------------------------------
	// Convert value to visual string
	//-----------------------------------
	
	ValToString(val)
	{	
		return Checksums.Lookup(val);
	}
	
	//-----------------------------------
	// Find child by its ID
	//-----------------------------------
	
	ChildByID(id, index = false)
	{
		if (!this.items || (this.items && this.items.length <= 0))
			return null;
			
		var child = null;
		var childIndex = -1;
		
		var qbKey = Checksums.Make(id);
		
		for (var i=0; i<this.items.length; i++)
		{
			var iid = this.items[i].id || "";
			
			// Perform QBKey check
			if (typeof(id) == 'number' && iid.toString() == id.toString(16).padStart(8, "0"))
			{
				childIndex = i;
				child = this.items[i];
				break;
			}
			
			// Perform string check
			if (typeof(id) == 'string' && iid.toString().toLowerCase() == id.toLowerCase())
			{
				childIndex = i;
				child = this.items[i];
				break;
			}
			
			// Key match, slow
			var mk = Checksums.Make((this.friendlyID ? "" : "0x") + iid);
			if (mk == qbKey)
			{
				childIndex = i;
				child = this.items[i];
				break;
			}
		}
		
		return index ? childIndex : child;
	}
	
	//-----------------------------------
	// Find a child, or create one
	//-----------------------------------
	
	Child_FindOrCreate(checkFor, checkType, createClass, args = {})
	{
		var child;
		
		switch (checkType)
		{
			case 'id':
				child = this.ChildByID(checkFor);
				break;
		}
		
		if (child)
			return child;
			
		// Didn't have a child, let's create one!
		var useClass = ItemTypes.classes[createClass];
		if (!useClass)
		{
			console.log(createClass + " IS NOT A VALID CLASS");
			return null;
		}
		
		// Use ID
		if (checkType == 'id')
			args.id = checkFor;
			
		args.itemName = createClass;
		args.parent = this;
		
		child = new useClass(args);
		
		return child;
	}
	
	//-----------------------------------
	// Remove a child
	//-----------------------------------
	
	RemoveChild(child)
	{
		this.items = this.items.filter((itm) => itm !== child);
	}
}

module.exports = QBItemBase;
