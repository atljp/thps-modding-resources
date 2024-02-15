//
//  GZip Decompressor by Zedek and transferred to GHSDK by Oktoberfest
//

const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

class GZipHandler
{
    //-------------------------
    // Decompress a buffer
    //-------------------------
    
    DecompressData(data)
    {
        // Starts with GZ
        if (data[0] == 0x47 && data[1] == 0x5A)
            data = data.slice(16, data.length);

        return zlib.inflateRawSync(data);
    }

    //-------------------------
	// DECOMPRESS A FILE
	//-------------------------

    Decompress(filename, outPath)
    {
        this.file = filename;

        var spl = filename.split(".");
		spl.push('decompressed');
		this.fileOut = spl.join(".");

        var compr = fs.readFileSync(filename);
        var decommed = this.DecompressData(compr);
        fs.writeFileSync(outPath, decommed);
    }
}

module.exports = GZipHandler;