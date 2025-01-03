// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Reader class
// Are these a good idea? Do these get cleaned up? Hmm...
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class Reader
{
	constructor(buf)
	{
		this.buf = buf;
		this.LE = false;
		this.offset = 0;
	}
	
	ExceededBounds() { return (this.offset > this.buf.length); }
	
	Letter()
	{
		var ltr = this.UInt8();
		return this.ExceededBounds() ? 0 : String.fromCharCode(ltr);
	}
	
	Float()
	{
		this.offset += 4;
		
		if (this.ExceededBounds())
			return 0;
			
		return this.LE ? this.buf.readFloatLE(this.offset-4) : this.buf.readFloatBE(this.offset-4);
	}
    
    HalfFloat()
    {
        this.offset += 2;
        
        var h = this.LE ? this.buf.readUInt16LE(this.offset-2) : this.buf.readUInt16BE(this.offset-2);
        
        // https://stackoverflow.com/questions/5678432/decompressing-half-precision-floats-in-javascript
        
        var s = (h & 0x8000) >> 15;
        var e = (h & 0x7C00) >> 10;
        var f = h & 0x03FF;

        if(e == 0) {
            return (s?-1:1) * Math.pow(2,-14) * (f/Math.pow(2, 10));
        } else if (e == 0x1F) {
            return f?NaN:((s?-1:1)*Infinity);
        }

        return (s?-1:1) * Math.pow(2, e-15) * (1+(f/Math.pow(2, 10)));
    }
	
	UInt8()
	{
		this.offset ++;
		return this.ExceededBounds() ? 0 : this.buf[this.offset-1];
	}
	
	UInt16()
	{
		this.offset += 2;
		
		if (this.ExceededBounds())
			return 0;
		
		return this.LE ? this.buf.readUInt16LE(this.offset-2) : this.buf.readUInt16BE(this.offset-2);
	}
	
	Int16()
	{
		this.offset += 2;
		
		if (this.ExceededBounds())
			return 0;
		
		return this.LE ? this.buf.readInt16LE(this.offset-2) : this.buf.readInt16BE(this.offset-2);
	}
	
	UInt32()
	{
		this.offset += 4;
		
		if (this.ExceededBounds())
			return 0;
		
		return this.LE ? this.buf.readUInt32LE(this.offset-4) : this.buf.readUInt32BE(this.offset-4);
	}
	
	Int32()
	{
		this.offset += 4;
		
		if (this.ExceededBounds())
			return 0;
		
		return this.LE ? this.buf.readInt32LE(this.offset-4) : this.buf.readInt32BE(this.offset-4);
	}
	
	Chunk(len)
	{
		this.offset += len;
		return this.ExceededBounds() ? Buffer.alloc(len) : this.buf.slice(this.offset-len, this.offset);
	}
	
	Seek(pos)
	{
		this.offset = pos;
	}
	
	Tell()
	{
		return this.offset;
	}
	
	// Read ASCII string of specific length
	Str(len)
	{
		return this.Chunk(len).toString();
	}
	
	// ASCII num string
	NumStr()
	{
		var len = this.UInt32();
		return this.Str(len);
	}
	
	// Read null-padded string
	TermString()
	{
		var tempstr = "";

		var char = this.UInt8();
		
		while (char !== 0x00 && !this.ExceededBounds())
		{
			tempstr += String.fromCharCode(char);
			char = this.UInt8();
		}
		
		return tempstr;
	}
	
	// Skip to nearest X bytes
	SkipToNearest(snap)
	{
		var extra = this.Tell() % snap;
		if (extra)
			this.Seek(this.Tell() + (snap - extra));
	}
	
	CanRead()
	{
		return (this.offset < this.buf.length);
	}
}

module.exports = Reader;
