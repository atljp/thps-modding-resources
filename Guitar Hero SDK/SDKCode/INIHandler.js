// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Module for handling INI data, simple
// Use this PER INI FILE
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const path = require('path');
const fs = require('fs');

class INIHandler
{
	constructor()
	{
		this.sections = {};
	}
	
	//---------------------------
	// Read an INI file!
	//---------------------------
	
	Read(inFile)
	{
		var sections = {};
		var thisSection = "";
		
		var lines = fs.readFileSync(inFile).toString().split("\n");
		
		for (var line of lines)
		{
			line = line.trim();
			
			// Starts with comment
			if (line[0] == ";")
				continue;
			
			// Whitespace
			if (line.length <= 0)
				continue;
			
			// It's a section!
			if (line[0] == "[" && line[line.length-1] == "]")
			{
				var sectionName = line.slice(1, line.length-1);
				thisSection = sectionName
				
				if (!sections[sectionName])
					sections[sectionName] = {}
			}
			
			// Normal line, it's a value!
			else if (line.indexOf("=") >= 0)
			{
				var spl = line.split("=");
				var key = spl.shift().trim();
				var val = spl.join("=").trim();
				
				var sec = sections[thisSection];
				if (sec)
				{
					// Create key if it doesn't exist
					sec[key] = sec[key] || [];
					sec[key].push(val);
				}
			}
		}
		
		this.sections = sections;
		return sections;
	}
	
	//---------------------------
	// Get a section
	//---------------------------
	
	FindSection(nm)
	{
		var keys = Object.keys(this.sections);
		for (const key of keys)
		{
			var sec = this.sections[key];
			if (key.toLowerCase() == nm.toLowerCase())
				return sec;
		}
		
		return null;
	}
	
	//---------------------------
	// Get a value
	//---------------------------
	
	GetValue(section, key, defaultValue = "", asList = false)
	{
		var sec = this.sections[section];
		if (!sec)
			return defaultValue;
			
		if (sec[key] == undefined)
			return defaultValue;
			
		// Return section's values as a list
		var k = sec[key];
		
		if (asList)
			return k;
			
		// Return most recent value in the INI
		else
			return k[k.length-1];
	}
	
	//---------------------------
	// Get a BOOLEAN value
	//---------------------------
	
	GetBooleanValue(section, key, defaultValue = false)
	{
		var val = this.GetValue(section, key, "");
		
		// NO VALUE AT ALL
		if (val == "")
			return defaultValue;
		
		return (val.toLowerCase() == "true") ? true : false;
	}
}

module.exports = INIHandler;
