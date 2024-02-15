const TYPE_NORMAL = 0;
const TYPE_ARRAY = 1;
const TYPE_STRUCT = 2;

const DEBUG_ITEM_TYPES = false;

// Sort of "type" object for QB items
class QBItemTypes
{
	constructor()
	{
		// QB types
		this.QBTypes = {
			NORMAL: TYPE_NORMAL,
			ARRAY: TYPE_ARRAY,
			STRUCT: TYPE_STRUCT
		}
		
		// Read certain files and store them as classes
		this.classes = {
			SectionArray: require('./QBItemSection.js'),
			SectionInteger: require('./QBItemSection.js'),
			SectionFloat: require('./QBItemSection.js'),
			SectionFloatsX2: require('./QBItemSection.js'),
			SectionFloatsX3: require('./QBItemSection.js'),
			SectionStruct: require('./QBItemSection.js'),
			SectionString: require('./QBItemSection.js'),
			SectionStringW: require('./QBItemSection.js'),
			SectionQBKey: require('./QBItemSection.js'),
			SectionQBKeyString: require('./QBItemSection.js'),
			SectionQBKeyStringQs: require('./QBItemSection.js'),
			SectionScript: require('./QBItemScript.js'),
			ArrayArray: require('./QBItemArray.js'),
			ArrayStruct: require('./QBItemArray.js'),
			ArrayQBKey: require('./QBItemArray.js'),
			ArrayString: require('./QBItemArray.js'),
			ArrayStringW: require('./QBItemArray.js'),
			ArrayInteger: require('./QBItemArray.js'),
			ArrayFloat: require('./QBItemArray.js'),
			ArrayFloatsX2: require('./QBItemArray.js'),
			ArrayFloatsX3: require('./QBItemArray.js'),
			ArrayQBKeyStringQs: require('./QBItemArray.js'),
			ArrayQBKeyString: require('./QBItemArray.js'),
			Floats: require('./QBItemFloats.js'),
			
			StructHeader: require('./QBItemStructHeader.js'),
			StructItemInteger: require('./QBItemStructSimple.js'),
			StructItemFloat: require('./QBItemStructSimple.js'),
			StructItemQBKey: require('./QBItemStructSimple.js'),
			StructItemQBKeyString: require('./QBItemStructSimple.js'),
			StructItemQBKeyStringQs: require('./QBItemStructSimple.js'),
			
			StructItemArray: require('./QBItemStructArray.js'),
			StructItemFloatsX2: require('./QBItemStructArray.js'),
			StructItemFloatsX3: require('./QBItemStructArray.js'),
			StructItemStruct: require('./QBItemStructArray.js'),
			
			StructItemString: require('./QBItemStructString.js'),
			StructItemStringW: require('./QBItemStructString.js'),
			StructItemTString: require('./QBItemStructString.js'),
			StructItemScript: require('./QBItemScript.js'),
			
			Unknown: require('./QBItemUnknown.js'),
			
			Comment: require('./Comment.js'),
			Injector: require('./Injector.js')
		};
		
		// Special item types, that are dependent on kind
		/*
			EXAMPLE:
			
			Struct is type 2
			On xen, we run into 0x00010D00 which is
			ordinarily ArrayQBKey
			
			But, since we are in a struct, it becomes StructQBKey
		*/
		
		this.specialItemTypes = {
			
			// Array
			"1": {
				"xen": {
					0x00010D00: 'ArrayQBKey',
					0x00010A00: 'ArrayStruct',
					0x00010100: 'ArrayInteger',
					0x00010200: 'ArrayFloat',
					0x00010300: 'ArrayString',
					0x00010400: 'ArrayStringW',
					0x00010500: 'ArrayFloatsX2',
					0x00010600: 'ArrayFloatsX3',
					0x00010C00: 'ArrayArray',
					0x00011A00: 'ArrayQBKeyString',
					0x00011C00: 'ArrayQBKeyStringQs'
				},
				
				"wpc": {
					0x000D0100: 'ArrayQBKey',
					0x000A0100: 'ArrayStruct',
					0x00010100: 'ArrayInteger',
					0x00020100: 'ArrayFloat',
					0x00030100: 'ArrayString',
					0x00040100: 'ArrayStringW',
					0x000C0100: 'ArrayArray',
					0x001A0100: 'ArrayQBString',
					0x001C0100: 'ArrayQBStringQs'
				}
			},
			
			// Structure
			"2": {
				"xen": {
					0x00010D00: 'StructItemQBKey',
					0x00010C00: 'StructItemArray',
					0x00010A00: 'StructItemStruct'
				},
				
				//~ "wpc": {
					//~ 0x000D0100: 'StructItemQBKey',
					//~ 0x000C0100: 'StructItemArray',
					//~ 0x000A0100: 'StructItemStruct'
				//~ }
			}
		};
		
		// QB item types, indexed by number
		this.itemTypes = {
			
			//------------------------------------------
			// PC - .xen
			//------------------------------------------
			
			"xen": {
				0x00200100: 'SectionInteger',
				0x00200200: 'SectionFloat',
				0x00200300: 'SectionString',
				0x00200400: 'SectionStringW',
				0x00200500: 'SectionFloatsX2',
				0x00200600: 'SectionFloatsX3',
				0x00200700: 'SectionScript',
				0x00200A00: 'SectionStruct',
				0x00200C00: 'SectionArray',
				0x00200D00: 'SectionQBKey',
				0x00201A00: 'SectionQBKeyString',
				0x00201C00: 'SectionQBKeyStringQs',
				
				// Default to struct, especially for 0x4A unknowns
				0x00010D00: 'StructItemQBKey',
				0x00010A00: 'StructItemStruct',
				
				0x00000100: 'StructHeader',
				
				0x00010000: 'Floats',
				
				0x00010300: 'StructItemString',
				0x00010400: 'StructItemStringW',
				0x00010C00: 'StructItemArray',
				0x00010500: 'StructItemFloatsX2',
				0x00010600: 'StructItemFloatsX3',
				0x00010100: 'StructItemInteger',
				0x00010200: 'StructItemFloat',
				0x00011A00: 'StructItemQBKeyString',
				0x00011C00: 'StructItemQBKeyStringQs',
				
				// GH3 types, for decompiling
				0x00810000: 'StructItemInteger',
				0x00820000: 'StructItemFloat',
				0x00830000: 'StructItemString',
				0x00840000: 'StructItemStringW',
				0x00850000: 'StructItemFloatsX2',
				0x00860000: 'StructItemFloatsX3',
				0x008A0000: 'StructItemStruct',
				0x008C0000: 'StructItemArray',
				0x008D0000: 'StructItemQBKey',
				0x009A0000: 'StructItemQBKeyString',
			},
			
			//------------------------------------------
			// PC - .wpc
			//------------------------------------------
			
			"wpc": {
				0x00010400: 'SectionInteger',
				0x00020400: 'SectionFloat',
				0x00030400: 'SectionString',
				0x00040400: 'SectionStringW',
				0x00050400: 'SectionFloatsX2',
				0x00060400: 'SectionFloatsX3',
				0x00070400: 'SectionScript',
				0x000A0400: 'SectionStruct',
				0x000C0400: 'SectionArray',
				0x000D0400: 'SectionQBKey',
				0x00041A00: 'SectionQBKeyString',
				0x001C0400: 'SectionQBKeyStringQs',
				
				// Default to struct, especially for 0x4A unknowns
				0x00001B00: 'StructItemQBKey',
				0x00001500: 'StructItemStruct',
				
				0x00010000: 'StructHeader',
				
				0x00000100: 'Floats',
				
				0x00000700: 'StructItemString',
				0x00000900: 'StructItemTString',		// Wide string?
				0x00001900: 'StructItemArray',
				0x00000B00: 'StructItemFloatsX2',
				0x00000D00: 'StructItemFloatsX3',
				0x00000300: 'StructItemInteger',
				0x00000500: 'StructItemFloat',
				0x00003500: 'StructItemQBKeyString',
				
				0x00050100: 'ArrayFloatsX2',
				0x00060100: 'ArrayFloatsX3',
					
				//~ 0x002C0F00: 'StructItemScript'		// THAW script
			}
		};
		
		// Text item types, indexed by string
		// If any of these match, the appropriate type is created
		// (These are lowercase indexed, for case insensitivity)
		
		this.textItemTypes = {
			'unknown': 'Unknown',
			'floats': 'Floats',
			'inject': 'Injector',
			'sectionarray': 'SectionArray',
			'sectioninteger': 'SectionInteger',
			'sectionfloat': 'SectionFloat',
			'sectionfloatsx2': 'SectionFloatsX2',
			'sectionfloatsx3': 'SectionFloatsX3',
			'sectionstruct': 'SectionStruct',
			'sectionstring': 'SectionString',
			'sectionstringw': 'SectionStringW',
			'sectionqbkey': 'SectionQBKey',
			'sectionqbkeystring': 'SectionQBKeyString',
			'sectionqbkeystringqs': 'SectionQBKeyStringQs',
			'script': 'SectionScript',
			'arrayarray': 'ArrayArray',
			'arraystruct': 'ArrayStruct',
			'arrayqbkey': 'ArrayQBKey',
			'arrayinteger': 'ArrayInteger',
			'arraystring': 'ArrayString',
			'arraystringw': 'ArrayStringW',
			'arrayfloat': 'ArrayFloat',
			'arrayfloatsx2': 'ArrayFloatsX2',
			'arrayfloatsx3': 'ArrayFloatsX3',
			'arrayqbkeystringqs': 'ArrayQBKeyStringQs',
			'arrayqbkeystring': 'ArrayQBKeyString',
			'structheader': 'StructHeader',
			'structqbkey': 'StructItemQBKey',
			'structstring': 'StructItemString',
			'structstringw': 'StructItemStringW',
			'structtstring': 'StructItemTString',
			'structstruct': 'StructItemStruct',
			'structscript': 'StructItemScript',
			'structqbstring': 'StructItemQBKeyString',
			'structqbstringqs': 'StructItemQBKeyStringQs',
			'structint': 'StructItemInteger',
			'structfloat': 'StructItemFloat',
			'structarray': 'StructItemArray',
			'structfloatx2': 'StructItemFloatsX2',
			'structfloatx3': 'StructItemFloatsX3',
		};
	}
	
	//-----------------------------------
	// Get fallback platform
	//-----------------------------------
	
	GetPlatform()
	{
		return GHSDK.QBHandler.format || "xen";
	}
	
	//-----------------------------------
	// Find item's class by a number
	// QB type changes what we decide on
	//-----------------------------------
	
	FindItemClass(num, qbType = this.QBTypes.NORMAL, platform = "")
	{
		var itemType = 'Unknown';
		var spec = this.specialItemTypes[qbType];
		
		platform = platform || this.GetPlatform();
		
		// SPECIAL: StructScript type
		// Last 2 bytes of num must be 0x0F00
		// First 2 bytes are script length
		
		if (platform == "wpc")
		{
			var scriptTest = (num & 0x0F00);
			if (scriptTest == 0x0F00)
				itemType = 'StructItemScript';
		}

		// Existed in special types?
		var hadSpec = false;

		if (spec)
		{	
			spec = spec[platform] || spec["xen"];
			
			if (spec[num])
			{
				itemType = spec[num];
				hadSpec = true;
			}
		}
			
		// Otherwise, search item types
		if (!hadSpec)
		{
			var iTypes = this.itemTypes[platform];
			if (iTypes[num])
				itemType = iTypes[num];
		}
		
		if (DEBUG_ITEM_TYPES)
		{
			this.logged = this.logged || 0;
			if (this.logged < 20)
			{
				console.log(num.toString(16).padStart(8, "0"), itemType);
				this.logged ++;
			}
		}
		
		return {
			itemClass: this.classes[itemType], 
			itemName: itemType,
			itemNumber: num
		};
	}
	
	//-----------------------------------
	// Create a class by type
	//-----------------------------------
	
	Create(classType, args = {})
	{
		var cls = this.classes[classType];
		if (!cls)
		{
			console.log("BAD CLASS: " + classType);
			return null;
		}
		
		args.itemName = classType;

		return new cls(args);
	}
	
	//-----------------------------------
	// Find item's class by TEXT
	//-----------------------------------
	
	FindTextClass(text)
	{
		// This is allowed to be undefined!
		var theType = this.textItemTypes[text.toLowerCase()];
		
		return {
			itemClass: theType && this.classes[theType], 
			itemName: theType,
			itemText: text
		};
	}
	
	//-----------------------------------
	// Find item's NUMBER by its TYPE
	//-----------------------------------
	
	FindItemNumber(type, qbType = this.QBTypes.NORMAL, platform = "")
	{
		platform = platform || this.GetPlatform();

		// TODO: Add exception for StructScript

		// Special keys first!
		var spec = this.specialItemTypes[qbType];
		if (spec)
		{
			spec = spec[platform] || {};
			
			var keys = Object.keys(spec);
			for (var key of keys)
			{
				if (spec[key].toLowerCase() == type.toLowerCase())
					return key;
			}
		}
		
		var iTypes = this.itemTypes[platform];
		
		var keys = Object.keys(iTypes);
		for (var key of keys)
		{
			if (iTypes[key].toLowerCase() == type.toLowerCase())
				return key;
		}
		
		return 0x00000000;
	}
}

module.exports = new QBItemTypes();
