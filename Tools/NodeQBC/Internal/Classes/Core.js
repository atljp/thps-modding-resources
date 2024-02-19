// ---------------------------------------------------
//
//	CORE
//	Core class that all QB object types inherit from
//
// ---------------------------------------------------

const MAX_SINGLE_LINE_ELEMENTS = 5;

class QBCItemCore
{
	constructor(opt = {})
	{
		this.children = [];
		this.parent = null;
		
		// For QBC to identify us
		this.IS_QBC_ITEM = true;
		
		this.stopRead = false;
		this.stopUnlex = false;
		
		// This item is allowed to have a shared properties header
		this.sharedAllowed = true;
		
		if (opt && opt.dataOnly)
			this.sharedAllowed = false;
		
		// Internal item type
		this.itemType = (opt && opt.item_type) || -1;
        this.byteType = (opt && opt.byte_type) || 0;
		
		// For reference
		this.className = (opt && opt.className) || this.constructor.name;
		
		// Checksum ID for the object
		this.id = '0x00000000';
		
		// Filename of the QB this exists within
		this.filename = '0x00000000';
		
		// Flags
		this.flags = (opt && opt.flags) || 0;
		
		// Used in QBScripts
		this.isLocal = false;
        
		// Pointer to next item
		this.ptr_nextItem = 0;
		
		// Initialize properties unique to child classes
		this.Initialize();
		
		// All objects MUST have a job
		this.job = QBC.LastJob();
		if (!this.job) { return; }
        
        this.Debug("Create " + this.constructor.name);
		
		// Binary reader to use
		this.reader = (opt && opt.reader) || this.job.reader;
		
		// Binary writer to use
		this.writer = (opt && opt.writer) || this.job.writer;
		
		// Lexer to use
		this.lexer = this.job.lexer;
		
		// Binary position that we spawned this object from
		if (this.reader)
			this.ptr_spawnOffset = this.reader.Tell();
		else
			this.ptr_spawnOffset = -1;
			
		// Used for checking unlex integrity
		// If this is > 0 when we finish, SOMETHING WENT WRONG
		this.unlex_parentheses = [];
	}
	
	//-----------------------
	// Set our serialize writer, 
	// as well as our childrens' writer
	//-----------------------
	
	SetWriter(newWriter)
	{
		this.writer = newWriter;
		
		for (const child of this.children)
			child.SetWriter(newWriter);
	}
	
	//-----------------------
	// Set our deserialize reader, 
	// as well as our childrens' reader
	//-----------------------
	
	SetReader(newReader)
	{
		this.reader = newReader;
		
		for (const child of this.children)
			child.SetReader(newReader);
	}
	
	//-----------------------
	// Set our job, as well as our
	// childrens' job (DANGEROUS)
	//-----------------------
	
	SetJob(newJob)
	{
		this.job = newJob;
		
		for (const child of this.children)
			child.SetJob(newJob);
	}
	
	//-----------------------
	// Object is something?
	// Override these!
	//-----------------------
	
	IsPackedStruct() { return false; }
	IsArray() { return false; }
	IsStruct() { return false; }
	IsScript() { return false; }
	IsPakQB() { return false; }
	IsConditional() { return false; }
	IsSwitch() { return false; }
	
	//-----------------------
	// Is this the last child of our parent?
	//-----------------------
	
	IsLastChild()
	{
		if (!this.parent)
			return false;
			
		if (this.parent.children.length <= 0)
			return false;
			
		var lastObject = this.parent.children[this.parent.children.length-1];
		if (lastObject == this)
			return true;
			
		return false;
	}
    
    //-----------------------
	// Gets the next object in the hierarchy
	//-----------------------
	
	GetNextChild()
	{
		if (!this.parent)
			return null;
			
		if (this.parent.children.length <= 0)
			return null;
			
        for (var c=0; c<this.parent.children.length; c++)
        {
            var child = this.parent.children[c];
            
            if (child == this && c < this.parent.children.length-1)
                return this.parent.children[c+1];
        }
            
		return null;
	}
	
	//-----------------------
	// Get index of ourselves in the parent child stack
	//-----------------------
	
	ChildIndex()
	{
		if (!this.parent)
			return -1;
			
		for (var c=0; c<this.parent.children.length; c++)
		{
			if (this.parent.children[c] == this)
				return c;
		}
		
		return -1;
	}
	
	//-----------------------
	// Get previous child in the parent
	//-----------------------
	
	PreviousChild()
	{
		// Only child in the parent stack, no previous
		if (this.parent && this.parent.children.length == 1)
			return null;
			
		var thisIndex = this.ChildIndex();
		if (thisIndex == -1 || thisIndex == 0)
			return null;
			
		// Get the actual previous child
		return this.parent.children[thisIndex-1];
	}
	
	//-----------------------
	// Top-level object, has no parents!
	//-----------------------
	
	IsTopLevel()
	{	
		// Parent is a PakQB, of course it is!
		if (this.parent && this.parent.IsPakQB())
			return true;
			
		return false;
	}
	
	//-----------------------
	// We have a non-null ID
	//-----------------------
	
	HasID() { return (this.id != '0x00000000'); }
	
	//-----------------------
	// Get ID string
	//-----------------------
	
	GetID() 
	{
		 return QBC.KeyToString(this.id || '0x00000000'); 
	}
	
	//-----------------------
	// Get value string
	//-----------------------
	
	GetValueText(val = this.value)
	{
		if (!val)
			return "";
			
		var valstr = val.toString();
		if (valstr.indexOf(" ") >= 0 || valstr.startsWith("0x"))
        {
            // Try to look it up just in case.
            var lookup = QBC.KeyToString(valstr);
            
            if (lookup == valstr)
                return '#\"' + valstr + '"';
                
            return lookup;
        }
			
		return valstr;
	}
	
	//-----------------------
	// Get class name, mostly for debugging
	//-----------------------
	
	GetClassName() { return this.className || "Unknown"; }
	
	//-----------------------
	// Debug all children
	//-----------------------
	
	TreeDebugChildren()
	{
		for (const child of this.children)
		{
			this.job.AddIndent();
			child._TreeDebug();
			this.job.SubIndent();
		}
	}
	
	//-----------------------
	// Internal debug, DO NOT CALL
	//-----------------------
	_TreeDebug() { this.TreeDebug(); this.TreeDebugChildren(); }
	
	//-----------------------
	// Debug
	//-----------------------
	
	TreeDebug()
	{	
		var txt = "[" + this.GetID() + "] " + this.GetClassName();
		
		if (this.GetDebugText)
			txt += this.GetDebugText();
			
		this.job.HierDebug(txt);
	}
	
	//-----------------------
	// Initialize props specific to this class
	//-----------------------
	
	Initialize() {}
	
	//-----------------------
	// Add a child
	//-----------------------
	
	AddChild(elem)
	{
		if (!elem)
			return null;
			
		// Pass reader and writer when adding, just in case
		elem.reader = this.reader;
		elem.writer = this.writer;
			
		this.children.push(elem);
		elem.parent = this;
		
		return elem;
	}
	
	//-----------------------
    // Debug with a message
	//-----------------------
    
    Debug(txt)
    {
        if (this.job)
            this.job.Debug(txt);
    }
    
	//-----------------------
    // Attempt to find the name
    // of the script we're
    // currently in.
	//-----------------------
    
    FindScriptName()
    {
        var item = this;
        
        while (item)
        {
            if (item.IsScript())
                return item.id;
                
            item = item.parent;
        }
        
        return null;
    }
    
	//-----------------------
	// Fail
	//-----------------------
	
	Fail(reason = "")
	{
        var finalReason = "";
        
		if (this.reader)
			finalReason = "(@" + this.ptr_spawnOffset + ", @" + this.reader.Tell() + ") " + this.GetClassName() + ": " + reason;
		else
			finalReason = this.GetClassName() + ": " + reason;
            
        // Attempt to find the name of the script we're in.
        var scriptName = this.FindScriptName();
        
        if (scriptName)
            finalReason = "[" + scriptName + "] " + finalReason;
            
        this.job.Fail(finalReason);
		
		this.stopRead = true;
		this.stopUnlex = true;
	}
    
    //-----------------------
    // Add a trailing inline space.
    // Helps to separate inline
    // objects like ints, floats, etc.
    //-----------------------
    
    AddInlineSpace()
    {
        if (this.IsLastChild())
            return;
            
        // Do we have a next object? What is it?
        var nextChild = this.GetNextChild();
        if (nextChild)
        {
            var vt = nextChild.GetValueText();
            
            // Do not add trailing space before dot
            if (vt == '.')
                return;
                
            // Do not add trailing space before newline
            if (vt == 'newline')
                return;
                
            // Do not add trailing space before ) or ]
            if (vt == ']' || vt == ')')
                return;
        }
        
        this.job.AddText(" ");
    }
	
	//-----------------------
	// Object is a script, or is parented to a script somehow
	//-----------------------
	
	InScript()
	{
        if (this.job && this.job.IsTHUG())
            return true;
            
		if (this.IsPackedStruct())
			return false;
            
        if (this.IsScript())
            return true;
	
		// Loop through our parent stack until we find a script, if we do
		var checker = this.parent;
		while (checker)
		{
			// PackedStructs should instantly BREAK all script checks!
			// Anything from there on down is not considered a script
			if (checker.IsPackedStruct())
				return false;
			
			if (checker.IsScript())
				return true;
				
			checker = checker.parent;
		}
		
		return false;
	}
	
	//-----------------------
	// Object exists within the body of a script
	//-----------------------
	
	InScriptBody()
	{
		// Obviously the script itself is not in the body
		if (this.IsScript())
			return false;
			
		// Are we parented to a script?
		return (this.InScript());
	}
	
	//-----------------------
	// Object exists within a type of something
	//-----------------------
	
	InPackedStruct()
	{
		if (this.IsPackedStruct())
			return true;
			
		var parent = this.parent;
		while (parent)
		{
			if (parent.IsPackedStruct())
				return true;
				
			parent = parent.parent;
		}
        
        if (this.job && this.job.options && this.job.options.packedStruct)
            return true;
		
		return false;
	}
	
	InStruct() { return (this.parent && this.parent.IsStruct()) || false; }
	InArray() { return (this.parent && this.parent.IsArray()) || false; }
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Start processing, either data or text
	//-----------------------
	
	ProcessData()
	{
		this.Read();
		this.PostRead();
	}
	
	//-----------------------
	// Read 4-byte item info block
	//-----------------------
	
	ReadItemInfo()
	{   
		this.reader.UInt8();						// Zero
		var itemFlags = this.reader.UInt8();		// Flags
		var itemType = this.reader.UInt8();			// Item type
		this.reader.UInt8();						// Zero
        
		var info = {
			byte_flags: itemFlags,
			byte_type: itemType,
			item_type: 0,
            wor_array: false
		};
		
        // THAW-like.
        if (this.job.IsTHAW())
        {
            if (itemFlags & QBC.constants.FLAG_GLOBALITEM_WPC)
                info.global_item = true;
                
            if (itemFlags & QBC.constants.FLAG_HASPARENT)
            {
                info.child_item = true;
                info.item_type = (itemFlags >> 1) || itemType;
            }
            else
                info.item_type = itemType;
        }
        
        // GH-like.
        else
        {
            if (itemFlags & QBC.constants.FLAG_GLOBALITEM)
                info.global_item = true;
                
            if (itemFlags & QBC.constants.FLAG_HASPARENT)
                info.child_item = true;
                
            if (itemType & QBC.constants.FLAG_WOR_ARRAY)
                info.wor_array = true;
                
            // If this is a special GH3 struct type, then
            // we derive the item type from its flags.
            
            if (itemFlags & QBC.constants.FLAG_STRUCT_GH3)
                info.item_type = itemFlags & 0x7F;
            else
                info.item_type = itemType;
        }
		
		return info;
	}
	
	//-----------------------
	// Finalize
	//-----------------------
	
	Finalize() { this.stopRead = true; }
	
	//-----------------------
	// Read shared properties all at once
	//-----------------------
	
	ReadSharedProperties()
	{
		this.ReadSharedProperties_Start();
		this.ReadSharedValue();
		this.ReadSharedProperties_End();
	}
	
	//-----------------------
	// Read shared properties
	// (Most common QB classes have these)
	//-----------------------
	
	ReadSharedProperties_Start()
	{
		// Item does not have shared properties
		if (!this.sharedAllowed)
			return;

		// Hex string
		this.id = QBC.constants.Keys.FromKey("0x" + this.reader.UInt32().toString(16).padStart(8, "0"));
		
		// Top-most QB items have the filename of the QB
        var isTHAW = this.job.IsTHAW();
         
        // In a structure? We will never have PAK ID.
        if (isTHAW && this.flags & QBC.constants.FLAG_HASPARENT)
            return;
        if (this.job.IsGH3() && (this.flags & QBC.constants.FLAG_STRUCT_GH3))
            return;

		if ( ((this.flags & QBC.constants.FLAG_GLOBALITEM_WPC) && isTHAW) || ((this.flags & QBC.constants.FLAG_GLOBALITEM) && !isTHAW) )
			this.filename = QBC.constants.Keys.FromKey("0x" + this.reader.UInt32().toString(16).padStart(8, "0"));
	}
	
	//-----------------------
	// Read end of shared properties
	//-----------------------
	
	ReadSharedProperties_End()
	{
		// Item does not have shared properties
		if (!this.sharedAllowed)
			return;
			
		this.ptr_nextItem = this.reader.UInt32();
	}
	
	//-----------------------
	// Allowed to read continuously?
	//-----------------------
	
	ReadAllowed()
	{
		return (this.reader.CanRead() && !this.job.Failed() && !this.stopRead);
	}
	
	//-----------------------
	// Create a child from parsed info
	//-----------------------
	
	CreateObjectFromInfo(itemInfo, opt = {})
	{
		var itemClass = QBC.constants.ClassBindings[itemInfo.item_type];
		var itemObj = null;
		
		if (itemClass)
		{
			var createOpt = {
				flags: itemInfo.byte_flags,
				item_type: itemInfo.item_type,
                byte_type: itemInfo.byte_type,
                wor_array: itemInfo.wor_array
			};
			
			if (opt)
				Object.assign(createOpt, opt);
				
			itemObj = QBC.CreateClass(itemClass, createOpt);
			
			if (!itemObj)
			{
				this.Fail("QB class of type '" + itemClass + "' could not be created by QBC.");
				return null;
			}
		}
		
		if (!itemObj)
		{
			this.Fail("Could not create item class of type 0x" + itemInfo.item_type.toString(16) + ".");
			return null;
		}
		
		if (itemObj)
        {
            if (opt.parent)
                opt.parent.AddChild(itemObj);
                
			itemObj.ProcessData();
        }
			
		return itemObj;
	}
	
	//-----------------------
	// Read a singular QB object from the data
	//-----------------------
	
	ReadObject()
	{
		var itemInfo = this.ReadItemInfo();
		var child = this.CreateObjectFromInfo(itemInfo);
		this.AddChild(child);
		
		return child;
	}
	
	//-----------------------
	// Begin reading from data
	//-----------------------
	
	Read()
	{	
		while (this.ReadAllowed())
			this.ReadObject();
	}
	
	//-----------------------
	// Finished reading
	//-----------------------
	
	PostRead()
	{
		if (this.job.Failed())
			return;
			
		this.Debug("  Post-read " + this.GetClassName());
	}
	
	//-----------------------
	// Read a script token from our script data
	// (All objects should have this, not just script)
	//-----------------------
	
	ReadScriptToken()
	{
		var token = this.reader.UInt8();
		var qbItem = null;
        
		switch (token)
		{
            // 0x00: End the script!
            case QBC.constants.ESCRIPTTOKEN_ENDOFFILE:
                this.stopRead = true;
                break;
                
			// 0x03: Start struct
			case QBC.constants.ESCRIPTTOKEN_STARTSTRUCT:
				qbItem = QBC.CreateClass("Struct");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x04: End struct
			case QBC.constants.ESCRIPTTOKEN_ENDSTRUCT:
				if (!this.IsStruct())
				{
					this.Fail("Reached EndStruct token in non-struct object.");
					return;
				}
			
				this.stopRead = true;
				break;
				
			// 0x05: Start array
			case QBC.constants.ESCRIPTTOKEN_STARTARRAY:
				qbItem = QBC.CreateClass("Array");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x06: End array
			case QBC.constants.ESCRIPTTOKEN_ENDARRAY:
				if (!this.IsArray())
				{
					this.Fail("Reached EndArray token in non-array object.");
					return;
				}
			
				this.stopRead = true;
				break;
			
            // Special case for ESCRIPTTOKEN_ENDOFLINENUMBER.
            // These are used in THAW StructScripts.
            case QBC.constants.ESCRIPTTOKEN_ENDOFLINENUMBER:
                qbItem = QBC.CreateClass("ScriptToken");
				this.AddChild(qbItem);
				qbItem.ValueFromToken(token);
                this.reader.UInt32();
				break;
            
			// The tokens below are single-token keywords and
			// are handled solely by the ScriptToken class
			case QBC.constants.ESCRIPTTOKEN_ENDOFLINE:
			case QBC.constants.ESCRIPTTOKEN_EQUALS:
			case QBC.constants.ESCRIPTTOKEN_OPENPARENTH:
			case QBC.constants.ESCRIPTTOKEN_CLOSEPARENTH:
			case QBC.constants.ESCRIPTTOKEN_ADD:
			case QBC.constants.ESCRIPTTOKEN_MULTIPLY:
			case QBC.constants.ESCRIPTTOKEN_MINUS:
			case QBC.constants.ESCRIPTTOKEN_DIVIDE:
			case QBC.constants.ESCRIPTTOKEN_DOT:
			case QBC.constants.ESCRIPTTOKEN_COLON:
			case QBC.constants.ESCRIPTTOKEN_COMMA:
			case QBC.constants.ESCRIPTTOKEN_GREATERTHAN:
			case QBC.constants.ESCRIPTTOKEN_GREATERTHANEQUAL:
			case QBC.constants.ESCRIPTTOKEN_LESSTHAN:
			case QBC.constants.ESCRIPTTOKEN_LESSTHANEQUAL:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_NOT:
			case QBC.constants.ESCRIPTTOKEN_AND:
			case QBC.constants.ESCRIPTTOKEN_OR:
			case QBC.constants.ESCRIPTTOKEN_NOTEQUAL:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ALLARGS:
			case QBC.constants.ESCRIPTTOKEN_ARG:
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE:
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_RANGE2:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_BEGIN:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_REPEAT:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_BREAK:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_RETURN:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOMFLOAT:
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOMINTEGER:
            case QBC.constants.ESCRIPTTOKEN_ARGUMENTPACK:
				qbItem = QBC.CreateClass("ScriptToken");
				this.AddChild(qbItem);
				qbItem.ValueFromToken(token);
				break;
                
            // 0x24: End function
            // For THUG files, this will end the current script.
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDSCRIPT:
                if (this.job.IsTHUG() && this.InScript())
                    this.stopRead = true;
                else
                {
                    qbItem = QBC.CreateClass("ScriptToken");
                    this.AddChild(qbItem);
                    qbItem.ValueFromToken(token);
                }
                break;
				
			// 0x16: QBKey
			case QBC.constants.ESCRIPTTOKEN_NAME:
				qbItem = QBC.CreateClass("QBKey");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
			
			// 0x17: Integer
			case QBC.constants.ESCRIPTTOKEN_INTEGER:
				qbItem = QBC.CreateClass("Integer");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x1A: Float
			case QBC.constants.ESCRIPTTOKEN_FLOAT:
				qbItem = QBC.CreateClass("Float");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x1B: String
			// 0x1C: Local String
			case QBC.constants.ESCRIPTTOKEN_STRING:
			case QBC.constants.ESCRIPTTOKEN_LOCALSTRING:
				qbItem = QBC.CreateClass("String");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x1E: Vector
			case QBC.constants.ESCRIPTTOKEN_VECTOR:
				qbItem = QBC.CreateClass("Vector");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x1F: Pair
			case QBC.constants.ESCRIPTTOKEN_PAIR:
				qbItem = QBC.CreateClass("Pair");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x27: Elseif
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ELSEIF:
				qbItem = QBC.CreateClass("ScriptToken");
				this.AddChild(qbItem);
				qbItem.ValueFromToken(token);
				
				var nextComparison = this.reader.UInt16();
				var toEndOfComparison = this.reader.UInt16();
				break;
				
			// 0x28: Endif
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDIF:
				if (!this.IsConditional())
				{
					this.Fail("Reached EndIf token in non-conditional object.");
					return;
				}
			
				this.stopRead = true;
				break;
                
            // 0x23: Script
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_SCRIPT:
				qbItem = QBC.CreateClass("Script");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
                
            // 0x2B: Symbol entry
            // Mostly used in THUG files. Debug for a QBKey.
            case QBC.constants.ESCRIPTTOKEN_CHECKSUM_NAME:
                var symbolKey = QBC.constants.Keys.FromKey("0x" + this.reader.UInt32().toString(16).padStart(8, "0"));
                var symbolText = this.reader.TermString();
                
                QBC.AddKey(symbolKey, symbolText);
                break;
                
            // 0x2E: Jump
            // TODO: Add labels for this token!
            case QBC.constants.ESCRIPTTOKEN_JUMP:
                this.reader.UInt32();
                break;
                
            // 0x2F: Random
            // 0x37: Random2
            // 0x40: RandomNoRepeat
            // 0x41: RandomPermute
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM:
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM2:
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_NO_REPEAT:
            case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_PERMUTE:
                qbItem = QBC.CreateClass("ScriptRandom");
                 
                switch (token)
                {
                    // random2
                    case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM2:
                        qbItem.randomType = "random2";
                        break;
                        
                    // randomnorepeat
                    case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_NO_REPEAT:
                        qbItem.randomType = "randomnorepeat";
                        break;
                        
                    // randompermute
                    case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM_PERMUTE:
                        qbItem.randomType = "randompermute";
                        break;

                    // random
                    case QBC.constants.ESCRIPTTOKEN_KEYWORD_RANDOM:
                    default:
                        qbItem.randomType = "random";
                        break;
                }
                
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x3C: Switch
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_SWITCH:
				qbItem = QBC.CreateClass("ScriptSwitch");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x3D: End switch
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_ENDSWITCH:
				if (!this.IsSwitch())
				{
					this.Fail("Reached EndSwitch token in non-switch object.");
					return;
				}
			
				this.stopRead = true;
				break;
				
			// 0x3E: Case
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_CASE:
				qbItem = QBC.CreateClass("ScriptToken");
				qbItem.value = "case"
				this.AddChild(qbItem);
				
				this.reader.UInt8();		// Shortjump token
				this.reader.UInt16();		// Shortjump amount
				
				break;
				
			// 0x3F: Default
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_DEFAULT:
				qbItem = QBC.CreateClass("ScriptToken");
				qbItem.value = "default"
				this.AddChild(qbItem);
				
				this.reader.UInt8();		// Shortjump token
				this.reader.UInt16();		// Shortjump amount
				
				break;
				
			// 0x47: Fast If
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_FASTIF:
				qbItem = QBC.CreateClass("ScriptConditional");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			// 0x48: Fast Else
			case QBC.constants.ESCRIPTTOKEN_KEYWORD_FASTELSE:
				qbItem = QBC.CreateClass("ScriptToken");
				this.AddChild(qbItem);
				qbItem.ValueFromToken(token);
				
				var nextComparison = this.reader.UInt16();
				break;
				
			// 0x49: Short jump
			// TODO: Ignore until we add goto etc.
			case QBC.constants.ESCRIPTTOKEN_SHORTJUMP:
				this.reader.UInt16();		// Shortjump amount
				break;
				
			// 0x4A: Inline Packed Struct (How confusing!)
			case QBC.constants.ESCRIPTTOKEN_INLINEPACKSTRUCT:
				qbItem = QBC.CreateClass("ScriptPackedStruct");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
                
            // 0x4C: WideString
			case QBC.constants.ESCRIPTTOKEN_WIDESTRING:
				qbItem = QBC.CreateClass("WideString");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
                
            // 0x4E: Localized string, from .qs
            case QBC.constants.ESCRIPTTOKEN_STRINGQS:
                qbItem = QBC.CreateClass("LocalString");
				this.AddChild(qbItem);
				qbItem.ProcessData();
				break;
				
			default:
				this.Fail("Unknown token found in script: 0x" + token.toString(16).padStart(2, "0"));
				break;
		}
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T   O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
    // Can we automatically create
    // newlines in this item?
	//-----------------------
    
    CanAutoCreateNewlines() 
    { 
        // Never auto-create in scripts, newlines
        // will be handled by tokens!
        
        if (this.InScript())
            return false;
            
        // In a packed struct? Then NO, we cannot!
        
        if (this.InPackedStruct())
            return false;
            
        // If our parent is a structure, then
        // we need to see if this is a fancy single-line struct.
        
        if (this.parent && this.parent.HasOnlySingleLineChildren())
            return false;
        
        return true;
    }
    
    //-----------------------
    // Every child in this element
    // is a single-line object.
    //-----------------------
    
    HasOnlySingleLineChildren()
    {
        if (this.children.length <= 0)
			return true;
            
        // We don't want a gigantic single line.
        // We'll cap it off at a certain point.
        
        var numSingles = 0;
			
		// If we have one multi-line child, return false
		for (const child of this.children)
		{
			if (!child.IsSingleLine())
				return false;
                
            numSingles ++;
            
            if (numSingles >= MAX_SINGLE_LINE_ELEMENTS)
                return false;
		}
        
        return true;
    }
    
	//-----------------------
	// Is this object type a
	// single-line object?
	//-----------------------
	
	IsSingleLine() { return false; }
	
	//-----------------------
	// Add an indent to our output!
	//-----------------------
	
	AddIndent() { this.job.AddIndent(); }
	
	//-----------------------
	// Subtract an indent from our output!
	//-----------------------
	
	SubIndent() { this.job.SubIndent(); }
	
	//-----------------------
	// Add a line of text to our output!
	//-----------------------
	
	AddLine()
	{
		this.job.AddLine();
	}
	
	//-----------------------
	// Add some text to our output
	//-----------------------
	
	AddText(txt)
	{
		this.job.AddText(txt);
	}
	
	//-----------------------
	// Internal write, DO NOT CALL
	//-----------------------
	
	_WriteText()
	{
		this.WriteText();
		
		for (const child of this.children)
			child._WriteText();
		
		this.PostWriteText();
	}
	
	//-----------------------
	// Outputs actual text
	//-----------------------
	
	WriteText()
	{
		this.Fail("FIXME: No text write method exists for " + this.GetClassName() + "!");
	}
	
	//-----------------------
	// Write our ID as text, including equals sign
	// (This is a shortcut)
	//-----------------------
	
	WriteIDString()
	{
		if (!this.InScript() && this.HasID())
			this.job.AddText(this.GetValueText(this.GetID()) + " = ");
	}
	
	//-----------------------
	// Done writing text
	//-----------------------
	
	PostWriteText()
	{
		if (this.job.Failed())
			return;
			
		this.Debug("  Post-write text " + this.GetClassName());
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	U N L E X
	//		Populates data from the lexer
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Can we continue unlexing?
	//-----------------------
	
	CanUnLex()
	{
		if (this.stopUnlex)
			return false;
			
		if (this.job.Failed())
			return false;
			
		if (!this.lexer)
			return false;
			
		if (this.lexer.tokenIndex >= this.lexer.tokens.length)
			return false;
			
		return true;
	}
	
	//-----------------------
	// Backend unlex function
	//-----------------------
	
	_UnLex() 
	{ 
		this.unlex_parentheses = []; 
		
		this.UnLex(); 
		this.PostUnLex(); 
		
		// Verify integrity of parentheses
		if (this.unlex_parentheses.length > 0)
			this.Fail("Unclosed parentheses at token " + this.unlex_parentheses[0] + "!");
	}
	
	//-----------------------
	// Finished unlexing!
	// (Is this object okay?)
	//-----------------------
	
	PostUnLex() {}
	
	//-----------------------
	// Unlex this particular object (backend)
	//-----------------------
	
	UnLex()
	{
		while (this.CanUnLex())
			this.UnLexObject();
	}
	
	//-----------------------
	// Can we add a script token?
	//-----------------------
	
	ScriptTokenAllowed(token)
	{
		// Fail for cases outside of switch statement
		if (token.type == "case" && !this.IsSwitch())
		{
			this.Fail(token.type + " token found outside of 'switch' statement.");
			return false;
		}
        
        // Possible fail for defaults outside of switch statement
		if ((token.type == "default") && !this.IsSwitch())
		{
            var defaultAllowed = false;
            var prevToken = this.lexer.NextToken(-1);
            var nextToken = this.lexer.NextToken(1);
            
            if (prevToken && (prevToken.type == '=' || prevToken.type == "keyword"))
                defaultAllowed = true;
            if (nextToken && (nextToken.type == '='))
                defaultAllowed = true;
                
            if (defaultAllowed)
                return true;
                
			this.Fail(token.type + " token found outside of 'switch' statement.");
			return false;
		}
		
		// Fail for else and elseif keywords outside of if statement
		if ((token.type == "else" || token.type == "elseif") && !this.IsConditional())
		{
			this.Fail(token.type + " token found outside of 'if' statement.");
			return false;
		}
		
		// Quick parentheses check, keep track of where we're at
		if (token.type == "(")
			this.unlex_parentheses.push(this.lexer.GetTokenIndex());
		else if (token.type == ")")
		{
			// We are removing more than we need to, too many ) !
			if (this.unlex_parentheses.length == 0)
			{
				this.Fail("Too many )'s found.");
				return false;
			}
			
			this.unlex_parentheses.pop();
		}
		
		return true;
	}
	
	//-----------------------
	// Unlex an object of a particular type!
	// Used internally
	//-----------------------
	
	HandleUnLexObject(theToken, id="0x00000000")
	{
		var qbItem = null;
		var theType = theToken.type.toLowerCase();
							
		// What kind of value is the third token?
		switch (theType)
		{
			// Integer
			case "int":
				qbItem = QBC.CreateClass("Integer");
				qbItem.value = theToken.value;
				qbItem.id = id;
				this.AddChild(qbItem);
				break;
				
			// Float
			case "float":
				qbItem = QBC.CreateClass("Float");
				qbItem.value = theToken.value;
				qbItem.id = id;
				this.AddChild(qbItem);
				break;
				
			// String
			case "string":
				qbItem = QBC.CreateClass("String");
				qbItem.value = theToken.value;
				qbItem.id = id;
				this.AddChild(qbItem);
				break;
                
            // WString
			case "wstring":
				qbItem = QBC.CreateClass("WideString");
				qbItem.value = theToken.value;
				qbItem.id = id;
				this.AddChild(qbItem);
				break;
	
			// Pair / Vector
			case "pair":
			case "vector":
				qbItem = QBC.CreateClass( (theType == "pair") ? "Pair" : "Vector");
				qbItem.id = id;
				qbItem.values = theToken.value;
				this.AddChild(qbItem);
				break;

			// Generic keyword?
			case "keyword":
				var keyValue = theToken.value;
				
				// Check if it's surrounded in <>, this is local argument
				if (keyValue[0] == "<" && keyValue[keyValue.length-1] == ">")
				{
					keyValue = keyValue.slice(1, keyValue.length-1);
					qbItem = QBC.CreateClass("ScriptToken");
					qbItem.value = "argument";
					this.AddChild(qbItem);
				}
			
				qbItem = QBC.CreateClass("QBKey");
				qbItem.value = keyValue;
				qbItem.id = id;
				this.AddChild(qbItem);
				
				break;
				
			// Localized string
			case "localstring":
				qbItem = QBC.CreateClass("LocalString");
				qbItem.value = theToken.value;
				qbItem.id = id;
				this.AddChild(qbItem);
				break;
				
			// If statement, this should start our conditional
			case "if":
				qbItem = QBC.CreateClass("ScriptConditional");
				
				// Skip the if so we're in the conditional!
				this.lexer.AdvanceToken();
				
				this.AddChild(qbItem);
				
				// Tell the conditional to unlex!
				qbItem._UnLex();
				
				return true;
				break;
				
			// Random statement, this should start our random
			case "random":
			case "random2":
			case "randomnorepeat":
			case "randompermute":
				qbItem = QBC.CreateClass("ScriptRandom");
				qbItem.randomType = theType;
                
				// Skip the random so we're at the (
				this.lexer.AdvanceToken();
				
				var par = this.lexer.CurrentToken();
				if (!par)
				{
					this.Fail(theType + " was not followed by a token. Needs a ( after!");
					return false;
				}
				
				if (par.type != "(")
				{
					this.Fail(theType + " was not followed by a (.");
					return false;
				}
				
				this.AddChild(qbItem);
				
				// Tell the random to unlex!
				qbItem._UnLex();
                
				return true;
				break;
				
			// Switch statement, this should start our switch
			case "switch":
				qbItem = QBC.CreateClass("ScriptSwitch");
				
				// Skip the if so we're in the switch!
				this.lexer.AdvanceToken();
				
				this.AddChild(qbItem);
				
				// Tell the switch to unlex!
				qbItem._UnLex();
				
				return true;
				break;
				
			// Array or structure
			case "[":
			case "{":
				qbItem = QBC.CreateClass( (theType == "{") ? "Struct" : "Array" );
				qbItem.id = id;
				
				// Skip the { or [ so we're in the data!
				this.lexer.AdvanceToken();
				
				this.AddChild(qbItem);
				
				// Tell the child struct to unlex!
				qbItem._UnLex();
				
				return true;
				break;
				
			// Inline packed structure
			// (Why does NS even use these? There must be a reason)
			case "\\{":
				qbItem = QBC.CreateClass("ScriptPackedStruct");
				qbItem.id = id;
				
				// Skip the { so we're in the data!
				this.lexer.AdvanceToken();
				
				this.AddChild(qbItem);
				
				// Tell the child struct to unlex!
				qbItem._UnLex();
				
				return true;
				break;
                
            // A $, this is a pointer!
            case "$":
                
                // If in a script, just add it as a plain pointer token
				if (this.IsScript() || this.InScriptBody())
				{
					if (!this.ScriptTokenAllowed(theToken))
						return false;

					qbItem = QBC.CreateClass("ScriptToken");
					qbItem.value = theType;
					this.AddChild(qbItem);
					return true;
				}
                
                // Skip $ so we're on the next object
                this.lexer.AdvanceToken();
                
                var ct = this.lexer.CurrentToken();
                
                // At this point, we are NOT in a script.
                // Our current token should be a keyword token.
                
                if (!ct)
				{
					this.Fail("$ found without token after.");
					return false;
				}
				
				if (ct.type != "keyword")
				{
					this.Fail("'$ not followed by keyword token.");
					return false;
				}
                
                qbItem = QBC.CreateClass("Pointer");
				qbItem.value = ct.value;
				qbItem.id = id;
				this.AddChild(qbItem);
                
                return true;
                
                break;
				
			// Begin a script!
			case "scriptstart":
			
				// Skip the scriptstart so we're on the script name!
				this.lexer.AdvanceToken();
				
				var ct = this.lexer.CurrentToken();
				if (!ct)
				{
					this.Fail("'script' found without token after.");
					return false;
				}
				
				if (ct.type != "keyword")
				{
					this.Fail("'script' not followed by keyword token.");
					return false;
				}
				
				qbItem = QBC.CreateClass("Script");
				qbItem.id = ct.value;
				
				// Skip the script name
				this.lexer.AdvanceToken();
				
				this.AddChild(qbItem);
				
				// Tell the child struct to unlex!
				qbItem._UnLex();
				
				return true;
				
				break;
				
			// Generic keyword
			default:
			
				// If in a script, assume it's a token of some sort!
				if (this.IsScript() || this.InScriptBody())
				{
					if (!this.ScriptTokenAllowed(theToken))
						return false;

					qbItem = QBC.CreateClass("ScriptToken");
					qbItem.value = theToken.type;
					this.AddChild(qbItem);
					return true;
				}
				
				// Otherwise, ???
				else
				{
					this.Fail("Keyword " + id + " had unknown value type: " + theToken.type + " (" + theToken.value + ")");
					return false;
				}
				
				break;
		}
		
		return true;
	}
	
	//-----------------------
	// Can we unlex a particular object / token?
	//-----------------------
	
	CanUnLexObject(token) { return true; }
	
	//-----------------------
	// Unlex this particular object
	//-----------------------
	
	UnLexObject()
	{
		var qbItem = null;
		var token = this.lexer.CurrentToken();
        
		// Ideally this should never happen
		if (!token)
		{
			this.Fail("Ran out of tokens?");
			return;
		}
		
		if (!this.CanUnLexObject(token))
		{
			this.lexer.AdvanceToken();
			return;
		}
			
		// What type is it?
		switch (token.type)
		{
			// End of array, ONLY IF WE ARE AN ARRAY
			case "]":
				if (!this.IsArray())
				{
					this.Fail("Ran into ] in non-array object: " + this.GetClassName());
					return;
				}
				
				// Finalize this object
				this.stopUnlex = true;
					
				break;
				
			// End of structure, ONLY IF WE ARE A STRUCTURE
			case "}":
				if (!this.IsStruct())
				{
					this.Fail("Ran into } in non-struct object: " + this.GetClassName());
					return;
				}
				
				// Finalize this object
				this.stopUnlex = true;
					
				break;
				
			// End of conditional, ONLY IF WE ARE A CONDITIONAL
			case "endif":
				if (!this.IsConditional())
				{
					this.Fail("Ran into endif in non-conditional object: " + this.GetClassName());
					return;
				}
				
				// Finalize this object
				this.stopUnlex = true;
					
				break;
				
			// End of switch, ONLY IF WE ARE A SWITCH
			case "endswitch":
				if (!this.IsSwitch())
				{
					this.Fail("Ran into endswitch in non-switch object: " + this.GetClassName());
					return;
				}
				
				// Finalize this object
				this.stopUnlex = true;
					
				break;
					
			// End of script, ONLY IF WE ARE A SCRIPT
			case "scriptend":
				if (!this.IsScript())
				{
					this.Fail("Ran into endscript in non-script object: " + this.GetClassName());
					return;
				}
				
				// Finalize this object
				this.stopUnlex = true;
				
				break;
				
			// Random tokens, these MUST be followed by a pair!
			case "randomrange":
			case "randomrange2":
			case "randomfloat":
			case "randominteger":
				var secondToken = this.lexer.NextToken();
				
				if (secondToken && secondToken.type == "pair")
				{
					qbItem = QBC.CreateClass("ScriptToken");
					qbItem.value = token.type;
					this.AddChild(qbItem);
				}
				else
				{
					this.Fail(token.type + " token MUST be followed by a pair!");
					return;
				}
				
				this.lexer.AdvanceToken();
				
				break;
				
			// @ sign (Weight marker for randoms)
			case "@":
				qbItem = QBC.CreateClass("ScriptToken");
				qbItem.value = "@";
				qbItem.weight = 1;
				this.AddChild(qbItem);
				
				// If our next token is a *, this is a weight value for it!
				var secondToken = this.lexer.NextToken();
				var thirdToken = this.lexer.NextToken(2);
				
				if (secondToken && secondToken.type == '*')
				{
					this.lexer.AdvanceToken();
					
					if (thirdToken)
					{
						if (thirdToken.type == "float" || thirdToken.type == "int")
						{
							qbItem.weight = parseInt(thirdToken.value);
							this.lexer.AdvanceToken();
						}
						else
						{
							this.Fail("@ token had a * followed by a non-numerical value.");
							return;
						}
					}
					else
					{
						this.Fail("@ token had a * but no value after.");
						return;
					}
				}
				
				this.lexer.AdvanceToken();
				
				break;
				
			// Generic keyword, this should probably turn into a value!
			case "keyword":
			
				// Only forward-check for PakQB objects
				if (!this.InScript())
				{
					var secondToken = this.lexer.NextToken();
					var thirdToken = this.lexer.NextToken(2);
					
					if (secondToken && secondToken.type == '=' && thirdToken)
					{
						// Skip the keyword and the =
						// We will be at the third token
						this.lexer.AdvanceToken();
						this.lexer.AdvanceToken();
						
						// Handle the third token using the ID of the first
						// If this returns false, we have FAILED
						if (!this.HandleUnLexObject(thirdToken, token.value))
							return;
							
						// Skip third object
						this.lexer.AdvanceToken();
					}
					else
					{
						qbItem = QBC.CreateClass("QBKey");
						qbItem.value = token.value;
						qbItem.id = "0x00000000";
						this.AddChild(qbItem);
								
						this.lexer.AdvanceToken();
					}
				}
				
				else
				{
					this.HandleUnLexObject(token);
					this.lexer.AdvanceToken();
				}
					
				break;
					
			// Unknown, wtf?
			default:
				this.HandleUnLexObject(token);
				this.lexer.AdvanceToken();
				break;
		}
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Internal serialize func, do not touch!
	//-----------------------
	
	_Serialize() 
	{ 
		if (!this.writer)
		{
			this.Fail("Cannot serialize without writer.");
			return;
		}
		
		this.ptr_spawnOffset = this.writer.Tell();
		
		this.job.TabbedDebug("Serialize: " + this.GetID() + " [" + this.GetClassName() + "]");
		
		this.Serialize(); this.SerializeChildren(); this.PostSerialize();
	}
	
	//-----------------------
	// After total serialization
	//-----------------------
	
	PostSerialize()
	{
		// Are we in a structure? If so, we need to fix up next-item offset!
		if (this.parent && this.parent.IsStruct() && this.ptr_nextItem)
		{
			var old_off = this.writer.Tell();
			this.writer.Seek(this.ptr_nextItem);
			
			if (this.IsLastChild())
				this.writer.UInt32(0);
			else
				this.writer.UInt32(old_off);
			
			this.writer.Seek(old_off);
		}
	}
	
	//-----------------------
	// Serialize this particular object
	// (Override this!)
	//-----------------------
	
	Serialize()
	{
		this.SerializeItemInfo();
		this.SerializeData();
	}
	
	//-----------------------
	// Get item info number for this object
	//-----------------------
	
	GetItemInfoType() { return 0; }
	
	//-----------------------
	// Serialize item info for the object!
	// Used for most QB objects
	//-----------------------
	
	SerializeItemInfo()
	{
		// Items in arrays or scripts should NEVER write this!
		// Arrays will handle this for us, don't worry
		
		if (this.InArray() || this.InScriptBody())
			return;
			
		this.writer.UInt8(0);								// zero_a
		
		// -----------
		
		var finalFlags = 0;
        var wasGH3Child = false;
		
		// Top-level global item, we have no parents
		if (this.IsTopLevel())
			finalFlags |= this.job.IsTHAW() ? QBC.constants.FLAG_GLOBALITEM_WPC : QBC.constants.FLAG_GLOBALITEM;
			
		// We are a child of a parent
		else if (this.parent)
        {
            // GH3 child-items pack their types into flags.
            if (this.job.IsGH3())
            {
                wasGH3Child = true;
                finalFlags |= QBC.constants.FLAG_STRUCT_GH3;
                finalFlags |= this.GetItemInfoType();
            }
            
            // THAW items use their item type as part of their flags.
            else if (this.job.IsTHAW())
            {
                wasGH3Child = true;
                finalFlags |= QBC.constants.FLAG_HASPARENT;
                finalFlags |= (this.GetItemInfoType() << 1);
            }
            
            // GHWT child-items store their flag after.
            else
                finalFlags |= QBC.constants.FLAG_HASPARENT;
        }
		
		this.writer.UInt8(finalFlags);					// Flags
		
		// -----------
		
        if (wasGH3Child)
            this.writer.UInt8(0);
        else
            this.writer.UInt8(this.GetItemInfoType());		// Object type
            
		this.writer.UInt8(0);							// zero_b
	}
	
	//-----------------------
	// Serialize the main object's data
	// (Override this!)
	//-----------------------
	
	SerializeData()
	{
		// If we're in an array, we are ONLY concerned
		// about our data! Don't worry about anything else
		if (this.InArray() || this.InScriptBody())
		{
			this.SerializeSharedData();
			return;
		}
		
		var idKey = QBC.constants.Keys.ToKey(this.GetID());
		
		this.writer.UInt32(idKey);						// ID
		
		if (this.IsTopLevel())
		{
			var qbFileName = this.job.GetQBName();
			var qbFileKey = QBC.constants.Keys.ToKey(qbFileName);
			this.writer.UInt32(qbFileKey);					// Pak QBKey
		}
		
		this.SerializeSharedData();
		
		// Next item in structure, we will return to this and fix it later.
		this.ptr_nextItem = this.writer.Tell();
		this.writer.UInt32(0);
	}
	
	SerializeSharedData() {this.writer.UInt32(0);}
	
	//-----------------------
	// Serialize our children
	//-----------------------
	
	SerializeChildren()
	{
		this.job.AddIndent();
		
		for (const child of this.children)
			this.SerializeChild(child);
			
		this.job.SubIndent();
	}
	
	//-----------------------
	// Serialize a single child
	//-----------------------
	
	SerializeChild(child) { child._Serialize(); }
};

module.exports = QBCItemCore;
