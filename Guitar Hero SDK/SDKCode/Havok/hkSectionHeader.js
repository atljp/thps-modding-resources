// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	hkSectionHeader
//
//	Section header for havok sections
//		__classnames__ etc.
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const hkClass = Havok.classes['hkClass'];

class hkSectionHeader extends hkClass
{
	//----------------------------
	// Core properties for object
	// (Children should override this)
	//----------------------------
	
	Initialize()
	{
		super.Initialize();
		
		this.pt_dataBegin = -1;
		this.pt_dataPointer = -1;
		this.pt_linkedEntries = -1;
		this.pt_classMapping = -1;
		this.pt_EOFA = -1;
		this.pt_EOFB = -1;
		this.pt_EOFC = -1;
	}
	
	//----------------------------
	// Deserialize into data
	//----------------------------
	
	Deserialize()
	{
		// Names are 20 bytes long, last byte is 0xFF
		this.sectionName = Havok.reader.Chunk(19).toString().trim();
		Havok.reader.UInt8();
		
		cons.log("Section start: " + this.sectionName);
		
		this.pt_dataBegin = Havok.reader.UInt32();
		this.pt_dataPointer = this.pt_dataBegin + Havok.reader.UInt32();
		this.pt_linkedEntries = this.pt_dataBegin + Havok.reader.UInt32();
		this.pt_classMapping = this.pt_dataBegin + Havok.reader.UInt32();
		this.pt_EOFA = this.pt_dataBegin + Havok.reader.UInt32();
		this.pt_EOFB = this.pt_dataBegin + Havok.reader.UInt32();
		this.pt_EOFC = this.pt_dataBegin + Havok.reader.UInt32();
	}
}

module.exports = hkSectionHeader;
