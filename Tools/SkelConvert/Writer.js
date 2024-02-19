// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Writer class
// Are these a good idea? Do these get cleaned up? Hmm...
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class Writer
{
	constructor()
	{
		this.LE = false;
		this.Reset();
	}
	
	Float(val)
	{
		this.EnsureBytes(4);
		this.offset = this.LE ? this.buffer.writeFloatLE(val, this.Tell()) : this.buffer.writeFloatBE(val, this.Tell());
	}
	
	UInt8(val)
	{
		this.EnsureBytes(1);
		this.offset = this.buffer.writeUInt8(val, this.Tell());
	}
	
	UInt16(val)
	{
		this.EnsureBytes(2);
		this.offset = this.LE ? this.buffer.writeUInt16LE(val, this.Tell()) : this.buffer.writeUInt16BE(val, this.Tell());
	}
	
	Int16(val)
	{
		this.EnsureBytes(2);
		this.offset = this.LE ? this.buffer.writeInt16LE(val, this.Tell()) : this.buffer.writeInt16BE(val, this.Tell());
	}
	
	UInt32(val)
	{
		this.EnsureBytes(4);
		this.offset = this.LE ? this.buffer.writeUInt32LE(val, this.Tell()) : this.buffer.writeUInt32BE(val, this.Tell());
	}
	
	Int32(val)
	{
		this.EnsureBytes(4);
		this.offset = this.LE ? this.buffer.writeInt32LE(val, this.Tell()) : this.buffer.writeInt32BE(val, this.Tell());
	}
	
	Pad(len, padder = 0x00)
	{
		var buf = Buffer.alloc(len);
		for (var p=0; p<len; p++)
			buf[p] = padder;
			
		this.Combine(buf);
	}
	
	PadToNearest(snap, padder = 0x00)
	{
		var extra = this.Tell() % snap;
		
		if (extra)
			this.Pad(snap - extra, padder);
	}
	
	ASCIIString(str, term = false)
	{
		for (var s=0; s<str.length; s++)
			this.UInt8(str.charCodeAt(s));
			
		if (term)
			this.UInt8(0x00);
	}
    
    ASCIIWString(str, term = false)
	{
		for (var s=0; s<str.length; s++)
			this.UInt16(str.charCodeAt(s));
			
		if (term)
			this.UInt16(0x00);
	}
	
	NumStr(str)
	{
		this.UInt32(str.length);
		this.ASCIIString(str);
	}
	
	Combine(buf)
	{
		this.buffer = Buffer.concat([this.buffer, buf]);
		this.offset += buf.length;
		
		// This is SLOW
		//~ for (var b=0; b<buf.length; b++)
			//~ this.UInt8(buf[b]);
	}
	
	Seek(pos)
	{
		this.offset = pos;
	}
	
	Tell()
	{
		return this.offset;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - 
	
	Reset()
	{
		this.offset = 0;
		this.buffer = Buffer.alloc(0);
	}
	
	EnsureBytes(len)
	{
		var newLen = this.Tell() + len;		
		if (newLen > this.buffer.length)
		{
			var toAlloc = newLen - this.buffer.length;
			this.buffer = Buffer.concat([this.buffer, Buffer.alloc(toAlloc)]);
		}
	}
	
	GetLength() { return this.buffer.length; }
}

module.exports = Writer;
