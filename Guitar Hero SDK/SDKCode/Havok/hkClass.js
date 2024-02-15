// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
// hkClass
//
// Base class for all Havok objects
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class hkClass
{
	//----------------------------
	// Initialize core class
	// DO NOT TOUCH
	//----------------------------
	
	constructor(opt = {})
	{
		this.options = opt;
		
		// Generate unique hash for this object
		// (This will come in handy for linking)
		this.hash = opt.hash || Havok.GenerateHash();
		
		// Object we're parented to
		this.parent = opt.parent || null;
		
		// List of children the object has
		this.children = opt.children || [];
		
		this.Initialize();
		
		if (opt.deserialize)
			this.Deserialize();
			
		if (opt.serialize)
			this.Serialize();
	}
	
	//----------------------------
	// Core properties for object
	// (Children should override this)
	//----------------------------
	
	Initialize() {}
	
	//----------------------------
	// Serialize into bytes
	//----------------------------
	
	Serialize() {}
	
	//----------------------------
	// Deserialize into data
	//----------------------------
	
	Deserialize() {}
	
	//----------------------------
	// Add a child by type
	//----------------------------
	
	AddChild(classType, opt = {})
	{
		opt.parent = opt.parent || this;
		
		var obj = Havok.CreateObject(classType, opt);
		if (obj)
			this.children.push(obj);
			
		return obj;
	}
}

module.exports = hkClass;
