const fs = require('fs');
const path = require('path');
const Writer = require('../Writer.js');

var storedKeys = {};

const files = fs.readdirSync(__dirname);
for (var file of files)
{
	if (file.toLowerCase().indexOf(".txt") == -1)
		continue;
		
	var fPath = path.join(__dirname, file);
	var lines = fs.readFileSync(fPath).toString().split("\n");
	
	console.log("Reading " + file + "...");
	
	for (var line of lines)
	{
		line = line.trim();
		if (line.length <= 0)
			continue;
			
		if (line.toLowerCase().indexOf("0x") !== 0)
			continue;
			
		var spl = line.split(" ");
		if (spl.length < 2)
			continue;
			
		var sum = parseInt(spl.shift(), 16);
		
		if (!sum)
		{
			console.log("BAD KEY: " + line);
			continue;
		}
		
		var val = spl.join(" ");
		
		var canStore = false;
		
		var sk = storedKeys[sum];
		if (!sk)
		{
			storedKeys[sum] = val;
		}
		
		// Key was already stored
		else
		{
			// Stored key was a path, this is not
			// let's overwrite it
			
			var thisPath = val.toLowerCase().indexOf("c:") == 0;
			var storedPath = sk.toLowerCase().indexOf("c:") == 0;
			
			// Always prefer non-path keys as opposed to path keys
			if (storedPath && !thisPath)
				storedKeys[sum] = val;
		}
	}
}

// Now store all keys!
var keys = Object.keys(storedKeys);
console.log("Storing " + keys.length + " keys in database...");

var w = new Writer();
w.UInt32(keys.length);

var bufs = [];

for (const key of keys)
{
	var val = storedKeys[key];	
	var buf = Buffer.alloc(val.length + 8);
	buf.writeUInt32BE(key, 0);
	buf.writeUInt32BE(val.length, 4);

	for (var v=0; v<val.length; v++)
		buf[8+v] = val.charCodeAt(v);
		
	bufs.push(buf);
}

w.Combine(Buffer.concat(bufs));

var outPath = path.join(__dirname, 'KeyDatabase.dat');
fs.writeFileSync(outPath, w.buffer);
