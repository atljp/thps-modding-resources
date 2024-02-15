// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	hkClassNameSection
//
//	Section that contains class names
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const hkClass = Havok.classes['hkClass'];

class hkClassNameSection extends hkClass
{
	//----------------------------
	// Core properties for object
	// (Children should override this)
	//----------------------------
	
	Initialize()
	{
		super.Initialize();
		this.classNames = [];
	}
	
	//----------------------------
	// Deserialize into data
	//----------------------------
	
	Deserialize()
	{
		// Test byte, is it 0xFFFF?
		var testNum = Havok.reader.UInt16();
		Havok.reader.Seek(Havok.reader.Tell() - 2);
		
		while (testNum !== 0xFFFF)
		{
			var nm = {};
			
			nm.id = Havok.reader.UInt32();
			
			// Always 0x09
			nm.number = Havok.reader.UInt8();
			
			nm.name = Havok.reader.TermString();
			
			this.classNames.push(nm);
			
			testNum = Havok.reader.UInt16();
			Havok.reader.Seek(Havok.reader.Tell() - 2);
		}
		
		cons.log("Havok file had " + this.classNames.length + " class names!");
		
		// Skip to 16 byte boundary
		Havok.reader.SkipToNearest(16);
	}
}

module.exports = hkClassNameSection;
