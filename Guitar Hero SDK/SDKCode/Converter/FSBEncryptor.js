// - - - - - - - - - - - - - - - - - - - - - - - - - 
// Worker for FSB encryption
// - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');
const TempDir = path.join(__dirname, 'tmp');

class FSBEncryptor
{
	//-----------------------
	// Encrypt FSB data
	//-----------------------
	
	Encrypt(fsb, key, outFile, offset = 0, opt = {})
	{
		// Remove encrypted file
		if (fs.existsSync(outFile))
			fs.unlinkSync(outFile);
			
		// Temporary
		var source = new Uint8Array(1);
		var dest = new Uint8Array(1);
		
		var xen = Buffer.alloc(fsb.length);
		
		for (var ff=0; ff<fsb.length; ff++)
		{
			var i = ff + offset;
			
			source[0] = (fsb[ff] ^ key[i % key.length]);
			dest[0] = 0;
			
			for (var j=0; j < 8; j++)
			{
				if ((source[0] & (1 << j)) != 0)
					dest[0] |= (1 << 7 - j);
			}
			
			xen[ff] = dest;
		}
		
		fs.writeFileSync(outFile, xen);

		process.exit(200 + this.id);
	}
}

var enc = new FSBEncryptor();

// Received a message from the parent process
// TODO: ADD ACTUAL BYTE KEY HERE

process.on('message', m => {
	
	if (m.id == undefined)
	{
		console.log("Did not have ID.");
		process.exit(1);
	}
		
	var chunkFile = path.join(TempDir, "chunk_" + m.id);
	var chunkData = fs.readFileSync(chunkFile);
	
	enc.id = m.id;
	
	enc.Encrypt(chunkData, m.key, chunkFile + "_encrypted", m.offset);
});
