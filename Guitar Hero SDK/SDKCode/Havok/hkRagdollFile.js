// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	hkRagdollFile
//
//	.rag file, hopefully not used in Havok officially
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const hkClass = Havok.classes['hkClass'];

class hkRagdollFile extends hkClass
{
	//----------------------------
	// Deserialize into data
	//----------------------------
	
	Deserialize()
	{
		cons.log("hkRagdollFile Hash: " + this.hash);
		
		// Header
		this.AddChild('hkRagdollFileHeader', {deserialize: true});
		
		// __classnames__
		this.sec_classnames = this.AddChild('hkSectionHeader', {deserialize: true});
		
		// __types__
		this.sec_types = this.AddChild('hkSectionHeader', {deserialize: true});
		
		// __data__
		this.sec_data = this.AddChild('hkSectionHeader', {deserialize: true});
		
		// - - - - - - - - - - - - - - - - - - - - 
		
		this.AddChild('hkClassNameSection', {deserialize: true});
	}
}

module.exports = hkRagdollFile;
