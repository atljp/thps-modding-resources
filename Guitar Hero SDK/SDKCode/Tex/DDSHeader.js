//----------------------------------------------------------
// Slaps a DDS header onto a file
//----------------------------------------------------------

module.exports = function(imgData, dxt, width, height, mipmapCount = 1)
{
	var writerCore;
	
	// Using with GHSDK loaded
	if (global.GHSDK)
		writerCore = GHSDK.Constants.Writer;
		
	// Using locally from SDK folder
	else
		writerCore = require('../Writer.js');
		
	var w = new writerCore();
	w.LE = true;
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	var pitch = 8;
	var fourCC = 'DXT1';
	
	// Passed in number, this is either 1 or 5 compression
	if (typeof(dxt) == 'number')
	{
		pitch = (dxt == 5) ? 16 : 8;
		fourCC = 'DXT' + ((dxt == 5) ? "5" : "1")
		
		if (dxt == 0)
		{
			pitch = 4;
			fourCC = 'ARGB';
		}
	}
	else
	{
		fourCC = dxt.toUpperCase();
		
		if (fourCC == 'DXT5' || fourCC == 'ATI2')
			pitch = 16;
		else if (fourCC == 'ARGB')
			pitch = 4;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	w.UInt32(0x20534444);					// Magic
	w.UInt32(124);							// dwSize
	
	if (fourCC == 'ARGB')
		w.UInt32(0x0000100F);				// dwFlags
	else
		w.UInt32(0x00081007);				// dwFlags
	
	//~ console.log(width + " " + height);
	
	w.UInt32(height);						// dwHeight
	w.UInt32(width);						// dwWidth
	
	if (fourCC == 'ARGB')
		w.UInt32(width * pitch);
	else
		w.UInt32((width * height) * pitch);	// dwPitchOrLinearSize
	
	w.UInt32(0);							// dwDepth
	w.UInt32(mipmapCount);					// dwMipMapCount
	w.Pad(44);								// dwReserved1[11];
	
	// - - PIXEL FORMAT - - - - - - - -
	
	w.UInt32(32);							// dwSize
	
	if (fourCC == 'ARGB')
	{
		w.UInt32(0x41);						// dwFlags
		w.UInt32(0);						// dwFourCC
		w.UInt32(0x20);						// dwRGBBitCount
	}
	else
	{
		w.UInt32(4);						// dwFlags
		w.ASCIIString(fourCC);				// dwFourCC
		w.UInt32(0);						// dwRGBBitCount
	}

	if (fourCC == 'ARGB')
	{
		w.UInt32(0x00FF0000);				// dwRBitMask
		w.UInt32(0x0000FF00);				// dwGBitMask
		w.UInt32(0x000000FF);				// dwBBitMask
		w.UInt32(0xFF000000);				// dwABitMask
	}
	
	else
	{
		w.UInt32(0);						// dwRBitMask
		w.UInt32(0);						// dwGBitMask
		w.UInt32(0);						// dwBBitMask
		w.UInt32(0);						// dwABitMask
	}
	
	// - - - - - - - - - - - - - - - -
	
	w.UInt32(4096);							// dwCaps
	w.UInt32(0);							// dwCaps2
	w.UInt32(0);							// dwCaps3
	w.UInt32(0);							// dwCaps4
	w.UInt32(0);							// dwReserved2
	
	w.Combine(imgData);
	
	return w.buffer;
}
