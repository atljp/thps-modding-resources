// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	hkRagdollFileHeader
//
//	Main header of .rag file
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const hkClass = Havok.classes['hkClass'];

class hkRagdollFileHeader extends hkClass
{
	//----------------------------
	// Core properties for object
	// (Children should override this)
	//----------------------------
	
	Initialize()
	{
		super.Initialize();
		
		this.magic_a = 0x57E0E057;
		this.magic_b = 0x10C0C010;
		
		this.havokMagic = 'hknx';
		
		this.always_five = 5;
		this.pointerSize = 4;
		this.endian = 1;
		this.paddingOptions = 0;
		this.baseClass = 1;
		this.sectionCount = 0;
		
		this.contentsSectionIndex = 0;
		this.contentsSectionOffset = -1;
		
		this.classnameSectionIndex = 0;
		this.classnameSectionOffset = -1;
		
		this.havokVersion = "Havok-5.5.0-r1";
	}
	
	//----------------------------
	// Deserialize into data
	//----------------------------
	
	Deserialize()
	{
		cons.log("hkRagdollFileHeader Hash: " + this.hash);
		
		// Magic
		var magic_a = Havok.reader.UInt32();
		var magic_b = Havok.reader.UInt32();
		
		if (magic_a !== 0x57E0E057 || magic_b !== 0x10C0C010)
			return Havok.Warn(".rag magic did not match!", true);
			
		// Havok filename
		// hknx / xnkh
		
		var havokMagic = Havok.reader.Chunk(4).toString();
		
		// LE is hknx, BE is xnkh
		if (havokMagic == 'hknx')
			Havok.reader.LE = true;
			
		this.always_five = Havok.reader.UInt32();
		this.pointerSize = Havok.reader.UInt8();
		this.endian = Havok.reader.UInt8();
		this.paddingOptions = Havok.reader.UInt8();
		this.baseClass = Havok.reader.UInt8();
		this.sectionCount = Havok.reader.UInt32();
		
		this.contentsSectionIndex = Havok.reader.UInt32();
		this.contentsSectionOffset = Havok.reader.UInt32();
		
		this.classnameSectionIndex = Havok.reader.UInt32();
		this.classnameSectionOffset = Havok.reader.UInt32();
		
		this.havokVersion = Havok.reader.TermString();
		cons.log("Havok Version: " + this.havokVersion);
		
		// FF-padding to nearest 16-byte boundary
		Havok.reader.SkipToNearest(16);
	}
}

module.exports = hkRagdollFileHeader;
