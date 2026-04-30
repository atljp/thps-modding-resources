// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// TONY HAWK LZSS COMPRESSION ALGORITHM
// Javascript-converted version of QueenBee's code
//
// https://github.com/Nanook/Queen-Bee/blob/master/QueenBeeParser/Qb/Lzss.cs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

const N = 4096;					/* Size of the ring buffer */
const F = 18;					/* Upper limit for match_length (4 bits = 15 + threshold = 2) */
const THRESHOLD = 2;			/* Minimum to use buffer references instead of directly copying a character */
const NIL = N;					/* A "NULL" value, it can be N since the ring buffer can't reach that value */

class LZSSHandler
{
	constructor() 
	{
		this._text_buf = new Uint8Array(N + F - 1);
		this._lson = new Uint16Array(N + 1);
		this._rson = new Uint16Array(N + 257);
		this._dad = new Uint16Array(N + 1);
		this._match_position = 0;
		this._match_length = 0;
	}
	
	//-------------------------
	// Read a byte from data
	//-------------------------
	ReadByte()
	{
		var byte = this.data[this.off] & 0xFF;
		this.off ++;
		
		return byte;
	}
	
	//-------------------------
	// DECOMPRESS A FILE
	//-------------------------
	
	Decompress(filename)
	{
		this.file = filename;
		
		var spl = filename.split(".");
		spl.push('decompressed');
		this.fileOut = spl.join(".");
		
		fs.readFile(filename, (err, data) => {
			if (err)
				return console.log(err);
				
			this.data = data;
			var result = this.DecompressData();
			
			fs.writeFile(this.fileOut, result.buf, err => {
				console.log("Written!");
			});
		});
	}
	
	//-------------------------
	// Decompress bytes
	//-------------------------
	
	DecompressBytes(data, detectHeader = false)
	{
		this.data = data;
		
		if (detectHeader)
		{
			var magic = this.data.slice(0, 4).toString();
			if (magic == 'LZSS')
				this.data = this.data.slice(8, this.data.length);
		}
		
		var res = this.DecompressData();
		
		if (!res.buf)
			return {error: "Something went wrong."}
			
		return {result: res.buf};
	}
	
	
	//-------------------------
	// ACTUALLY DECOMPRESS THE DATA
	//-------------------------
	
	DecompressData()
	{
		var output = [];
		
		var i, j, k, r, c;
		var flags;

		var text_buf = new Uint8Array(N + F - 1);

		/* Fill buffer */
		for (i = 0; i < N - F; i++)
			text_buf[i] = 0x20;

		r = N - F;
		flags = 0;
		
		this.off = 0;

		var decompressedSize = 0;
		
		while (this.off < this.data.length)
		{
			/* Get the "flags" for the next 8 bytes */
			if (((flags >>= 1) & 256) == 0)
			{
				flags = (this.ReadByte() | 0xFF00);
			}

			if ((flags & 1) == 1) /* Copy character directly */
			{
				/* Get character */
				c = this.ReadByte();

				/* Add character */
				output.push(c);
				decompressedSize++;

				/* Update buffer */
				text_buf[r++] = c; /* Set buffer character */
				r &= (N - 1); /* Ensure it's inside the limits */
			}
			else /* Copy a text from the buffer */
			{
				/* Get buffer variables */
				i = this.ReadByte();
				j = this.ReadByte();

				/* Decode variables */
				i |= ((j & 0xF0) << 4); /* Position in the buffer (12 bits) */
				j = (j & 0x0F) + THRESHOLD; /* Number of bytes (4 bits + threshold) */

				/* Copy bytes */
				for (k = 0; k <= j; k++)
				{
					/* Get character */
					c = text_buf[(i + k) & (N - 1)];

					/* Add character */
					output.push(c);
					decompressedSize ++;

					/* Update buffer */
					text_buf[r++] = c; /* Set buffer character */
					r &= (N - 1); /* Ensure it's inside the limits */
				}
			}
		}
		
		var outputBuffer = Buffer.from(output);
		
		return {size: decompressedSize, buf: outputBuffer};
	}
	
	//-------------------------
	// COMPRESS A FILE
	//-------------------------
	
	Compress(filename)
	{
		this.file = filename;
		
		var spl = filename.split(".");
		spl.push('compressed');
		this.fileOut = spl.join(".");
		
		fs.readFile(filename, (err, data) => {
			if (err)
				return console.log(err);
				
			this.data = data;
			var result = this.CompressData();
			
			fs.writeFile(this.fileOut, result.buf, err => {
				console.log("Written!");
			});
		});
	}
	
	//-------------------------
	// COMPRESS BYTES
	//-------------------------
	
	CompressBytes(bytes)
	{
		this.data = bytes;
		return {result: this.CompressData().buf};
	}
	
	//-------------------------
	// ACTUALLY COMPRESS THE DATA
	//-------------------------
	
	CompressData()
	{
		this.off = 0;
		var output = [];
		
		var compressedSize = 0;

		/* Compression managers, buffers and trees */
		var i, len, r, s, last_match_length, code_buf_ptr;
		var c;
		var code_buf = new Uint8Array(17);
		var mask;
		
		mask = 1;
		
		/* Initialize trees */
		this.InitTree();

		/* code_buf[1..16] saves eight units of code, and
		 * code_buf[0] works as eight flags, "1" representing that the unit
		 * is an unencoded letter (1 byte), "0" a position-and-length pair
		 * (2 bytes).  Thus, eight units require at most 16 bytes of code. */
		 
		code_buf[0] = 0;

		/* mask contains the LZSS flag for the "unencoded" bytes.
		 * It's set to 1 initialy, and shifted one position to the right
		 * in every iteratorion of the compression algorithm. Since it's a
		 * 8-bit value, it will be 0 after 8 shiftings, in that case, the code
		 * buffer will be written, and the mask set to 1 again */
		 
		code_buf_ptr = mask;
		s = 0;
		r = N - F;
		
		/* Clear the buffer with any
		 * character that will appear often */
		
		for (i = s; i < r; i++)
			this._text_buf[i] = 0x20;

		/* Read initial bytes! */
		
		for (len = 0; len < F; len++)
		{
			/* Check if it's EOF */
			if (this.off == this.data.length)
				break;

			/* Get byte */
			c = this.ReadByte();
			
			/* Read F bytes into the last F bytes of the buffer */
			this._text_buf[r + len] = c;
		}

		/* Text of size 0? */
		if (len == 0)
			return 0;
			
		/* Insert the F strings, each of which begins with
		 * one or more 'space' characters. Note the order in which these
		 * strings are inserted. This way, degenerate trees will be less
		 * likely to occur. */
		 
		for (i = 1; i <= F; i++)
			this.InsertNode(r - i);

		/* Finally, insert the whole string just read. The
		 * global variables match_length and match_position are set. */
		 
		this.InsertNode(r);

		/* Compress the remaining part of the file */
		do
		{
			/* match_length may be spuriously long
			 * near the end of text. */
			if (this._match_length > len)
				this._match_length = len;

			if (this._match_length <= THRESHOLD) /* Not long enough match. Send one byte. */
			{
				this._match_length = 1;
				code_buf[0] |= mask & 0xFF;  /* 'Send one byte' flag */

				code_buf[code_buf_ptr++] = this._text_buf[r];  /* Send uncoded. */
			}
			else /* Compression can be used */
			{
				code_buf[code_buf_ptr++] = this._match_position & 0xFF;
				code_buf[code_buf_ptr++] = ( ((this._match_position >> 4) & 0xF0) | (this._match_length - (THRESHOLD + 1)) ) & 0xFF; /* Send position and length pair. Note match_length > THRESHOLD. */
			}

			mask = (mask << 1) & 0xFF;
			
			if (mask == 0) /* Shift mask left one bit. */
			{
				/* Time to send the bytes in the buffer to the file! */
				for (i = 0; i < code_buf_ptr; i++)
				{
					/* Add byte */
					output.push(code_buf[i]);
					compressedSize++;
				}

				/* Reset values */
				code_buf[0] = 0;
				code_buf_ptr = mask = 1;
			}

			last_match_length = this._match_length;

			for (i = 0; i < last_match_length; i++)
			{
				/* Check if it's EOF */
				if (this.off == this.data.length)
					break;
					
				/* Get byte */
				c = this.ReadByte();

				/* Delete old strings */
				this.DeleteNode(s);

				/* Read new bytes */
				this._text_buf[s] = c;

				/* If the position is near the end of buffer,
				 * extend the buffer to make string comparison easier.*/
				if (s < F - 1)
					this._text_buf[s + N] = c;

				/* Since this is a ring buffer, increment the position modulo N. */
				s = (s + 1) & (N - 1);
				r = (r + 1) & (N - 1);

				/* Register the string in text_buf[r..r+F-1] */
				this.InsertNode(r);
			}

			/* After the end of text, no need to read, but buffer may not be empty */
			while (i++ < last_match_length)
			{
				/* Delete old strings */
				this.DeleteNode(s);

				/* Since this is a ring buffer, increment the position modulo N. */
				s = (s + 1) & (N - 1);
				r = (r + 1) & (N - 1);

				/* Register the string in text_buf[r..r+F-1] */
				if (--len != 0)
					this.InsertNode(r);
			}
		}
		
		while (len > 0);

		/* Write remaining bytes */
		if (code_buf_ptr > 1)
		{
			for (i = 0; i < code_buf_ptr; i++)
			{
				/* Add byte */
				output.push(code_buf[i]);
				compressedSize ++;
			}
		}

		return {size: compressedSize, buf: Buffer.from(output)};
	}
	
	//-------------------------
	// INITIALIZE TREES
	//-------------------------
	
	InitTree()  
	{
		var i;

		/* For i = 0 to N - 1, rson[i] and lson[i] will be the right and
		left children of node i.  These nodes need not be initialized.
		Also, dad[i] is the parent of node i.  These are initialized to
		NIL (= N), which stands for 'not used.'
		For i = 0 to 255, rson[N + i + 1] is the root of the tree
		for strings that begin with character i.  These are initialized
		to NIL.  Note there are 256 trees. */

		for (i = N + 1; i <= N + 256; i++)
			this._rson[i] = NIL;

		for (i = 0; i < N; i++)
			this._dad[i] = NIL;
	}
	
	//-------------------------
	// INSERT A NODE
	//-------------------------
	
	InsertNode(r)
	{
		var i, p, cmp;
		var key;

		/* Inserts string of length F, text_buf[r..r+F-1], into one of the
		trees (text_buf[r]'th tree) and returns the longest-match position
		and length via the global variables match_position and match_length.
		If match_length = F, then removes the old node in favor of the new
		one, because the old one will be deleted sooner.
		Note r plays double role, as tree node and position in buffer. */

		cmp = 1;
		key = r;
		p = N + 1 + this._text_buf[key];

		this._rson[r] = this._lson[r] = NIL;
		this._match_length = 0;

		for (; ; )
		{
			if (cmp >= 0)
			{
				if (this._rson[p] != NIL)
					p = this._rson[p];
				else
				{
					this._rson[p] = r;
					this._dad[r] = p;
					return;
				}
			}
			else
			{
				if (this._lson[p] != NIL)
					p = this._lson[p];
				else
				{
					this._lson[p] = r;
					this._dad[r] = p;
					return;
				}
			}
			
			for (i = 1; i < F; i++)
			{
				if ((cmp = this._text_buf[key + i] - this._text_buf[p + i]) != 0)
					break;
			}

			if (i > this._match_length)
			{
				this._match_position = p;
				if ((this._match_length = i) >= F)
					break;
			}
		}

		this._dad[r] = this._dad[p];
		this._lson[r] = this._lson[p];
		this._rson[r] = this._rson[p];
		this._dad[this._lson[p]] = r;
		this._dad[this._rson[p]] = r;

		if (this._rson[this._dad[p]] == p)
			this._rson[this._dad[p]] = r;
		else
			this._lson[this._dad[p]] = r;

		/* Remove p */
		this._dad[p] = NIL;
	}
	
	//-------------------------
	// DELETE A NODE
	//-------------------------
	
	DeleteNode(p)
	{
		var q;

		/* Not in tree */
		if (this._dad[p] == NIL)
			return;

		if (this._rson[p] == NIL)
			q = this._lson[p];
		else if (this._lson[p] == NIL)
			q = this._rson[p];
		else
		{
			q = this._lson[p];
			if (this._rson[q] != NIL)
			{
				do
				{
					q = this._rson[q];
				} while (this._rson[q] != NIL);

				this._rson[this._dad[q]] = this._lson[q];
				this._dad[this._lson[q]] = this._dad[q];
				this._lson[q] = this._lson[p];
				this._dad[this._lson[p]] = q;
			}

			this._rson[q] = this._rson[p];
			this._dad[this._rson[p]] = q;
		}

		this._dad[q] = this._dad[p];

		if (this._rson[this._dad[p]] == p)
			this._rson[this._dad[p]] = q;
		else
			this._lson[this._dad[p]] = q;

		this._dad[p] = NIL;
	}
}

module.exports = LZSSHandler;
