// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	T H A W   O B J E C T
// 		Frontend hook for adding various THAW objects
//
//	(This entry hook is used for decompiling only)
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const ScriptingCore = require('./Core.js');

class TTHAWObject extends ScriptingCore
{
	constructor(opt = {})
	{
		super(opt);
		
		// Parse THAW bytes if we're decompiling them
		if (NodeROQ.decompile)
			this.ParseTHAWBytes();
			
		// Parse source code if we're compiling from text
		else
		{
			this.compiledBytes = Buffer.alloc(4);
			this.compiledBytes.writeUInt32LE(0xDEADBEEF, 0);
			
			this.SliceCode();
		}
	}
	
	ParseTHAWBytes()
	{
		// Skip initial 0x4A
		scriptHandler.offset ++;
		
		// Get length
		this.length = NodeROQ.source.readUInt16LE(scriptHandler.offset);
		scriptHandler.offset += 2;
		
		// From here, we need to be at a 4-byte interval
		// How many bytes will this be?
		
		this.padding = 0;
		var extra = scriptHandler.offset % 4;
		if (extra)
		{
			this.padding = 4 - extra;
			scriptHandler.offset += this.padding;
		}
		
		// Now we're at the ACTUAL DATA
		// Slice it up
		this.objectData = NodeROQ.source.slice(scriptHandler.offset, scriptHandler.offset + this.length);
		scriptHandler.offset += this.length;
		
		this.Finalize();
	}
	
	ToText()
	{
		// Decompile it as THAW code
		var decStr = this.objectData.toString('hex');
		
		// If GHSDK is available, use its QB decompiler
		var theSDK = global.GHSDK;
		if (theSDK)
		{
			var con = theSDK.Constants;
			
			if (con && con.DECOMPILE_4A)
			{
				var fmt = (theSDK.QBHandler && theSDK.QBHandler.format) || "xen";
				var qbr = new GHSDK.QBHandler.ReaderCore();
				
				var res = qbr.Decompile(this.objectData, {format: fmt});
				
				if (res.result)
				{
					var lines = res.result.trim();
					
					// Replace newlines
					lines = lines.replace(/[\r\n]/g, "\n");
					
					lines = lines.split("\n");
					
					// No newlines, just add it as-is
					if (lines.length == 1)
					{
						NodeROQ.text += "${" + lines[0] + "}$";
						return;
					}
						
					// Newlines, format properly!
					else
					{
						NodeROQ.text += "${";
						NodeROQ.indent ++;
						NodeROQ.TextNewLine(false);
						
						for (var l=0; l<lines.length; l++)
						{
							if (lines[l].trim().length <= 0)
								continue;
								
							NodeROQ.text += lines[l];
							
							if (l < lines.length-1)
								NodeROQ.TextNewLine(false);
						}
						
						NodeROQ.indent --;
						NodeROQ.TextNewLine(false);
						NodeROQ.text += "}$";
						NodeROQ.TextNewLine(false);
						return;
					}
				}
			}
		}
		
		NodeROQ.text += "${" + decStr + "}$";
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	// Slice THAW code
	SliceCode()
	{
		var starter = scriptHandler.offset;
		var off = scriptHandler.offset;
		var ender = -1;
		var str = "";
		var par = 0;
		
		while (ender == -1 && ender < scriptHandler.source.length)
		{
			var char = scriptHandler.source[off];
			
			if (char == "{")
				par ++;
			else if (char == "}")
			{
				par --;
				
				// Back to normal parentheses
				if (par <= 0)
				{
					ender = off+1;
					scriptHandler.offset = ender;
				}
			}
			
			off ++;
		}
		
		// Skip last $
		scriptHandler.offset ++;
		
		// Slice off the parentheses!
		var sliced = scriptHandler.source.slice(starter+1, ender-1);
		
		// Got our sliced code, now let's compile it
		// Only if we have GHSDK loaded!
		
		var gh = global.GHSDK;
		
		if (gh)
		{
			var nl = String.fromCharCode(13);
			sliced = "StructHeader" + nl + "{" + nl + sliced + nl + "}";
			
			var rdr = new gh.QBHandler.ReaderCore();
			var result = rdr.CompileText(sliced, "0x00000000", {raw: true});
			
			this.compiledBytes = result;
		}
		
		this.Finalize();
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// CONVERT THIS OBJECT TO QB BYTE DATA
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ToBytes()
	{
		// 0x4a
		NodeROQ.bytes.push(NodeROQ.ByteCode.THAW_STRUCTURE);
		
		// Length
		var buf = NodeROQ.UInt16Buffer(this.compiledBytes.length);
		for (var b=0; b<buf.length; b++)
			NodeROQ.bytes.push(buf[b]);
			
		// Pad to the nearest 4 bytes
		var extra = NodeROQ.bytes.length % 4;
		if (extra)
		{
			var pad = 4 - extra;
			for (var p=0; p<pad; p++)
				NodeROQ.bytes.push(0x00);
		}
			
		// The actual bytes
		for (var s=0; s<this.compiledBytes.length; s++)
			NodeROQ.bytes.push(this.compiledBytes[s]);
	}
};

module.exports = TTHAWObject;
