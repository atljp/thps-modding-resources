// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	M P 3   A N A L Y Z E R
//		Analyzes an MP3 file and splits into frames
//
// http://www.mpgedit.org/mpgedit/mpeg_format/mpeghdr.htm
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');
const mp3Parser = require('mp3-parser');

class MP3Analyzer
{
	constructor(converter = null) { this.converter = converter; }
	
	//-----------------------
	// Split MP3 file into audio-only frames
	// For GHWT, we don't care about ID3 header etc.
	//-----------------------

	SplitMP3File(inFile, raw = false)
	{
		var fileData = raw ? inFile : fs.readFileSync(inFile);
		var r = new GHSDK.Constants.Reader( fileData );
		
		var dvb = new Uint8Array(r.buf.length);
		r.buf.copy(dvb, 0, 0, r.buf.length);
		var dv = new DataView(dvb.buffer);
		var parsed = mp3Parser.readTags(dv);
		
		var frames = [];
		var sampleCount = 0;
		var sampleRate = 48000;
		var stereo = true;
		
		var readFrame = undefined;
		
		for (const frm of parsed)
		{
			// Not a frame
			var sec = frm["_section"];
			
			var frame = {type: sec.type};
			
			if (sec.type !== 'frame')
				continue;
				
			if (frm.header.channelMode.toLowerCase().indexOf("mono") >= 0)
				stereo = false;
				
			sampleRate = frm.header["samplingRate"] || sampleRate;
			sampleCount += sec.sampleLength || 0;
				
			frame.data = r.buf.slice(sec.offset, sec.offset + sec.byteLength);
			frames.push(frame.data);
			
			if (sec.nextFrameIndex)
				readFrame = mp3Parser.readFrame(dv, sec.nextFrameIndex);
		}
		
		while (readFrame)
		{
			var sec = readFrame["_section"];
			
			var frame = {type: sec.type};
			frame.data = r.buf.slice(sec.offset, sec.offset + sec.byteLength);
			
			if (sec.type == 'frame')
			{
				frames.push(frame.data);
				sampleCount += sec.sampleLength || 0;
			}
			
			if (sec.nextFrameIndex)
				readFrame = mp3Parser.readFrame(dv, sec.nextFrameIndex);
			else
				readFrame = null;
		}
		
		return [frames, sampleCount, sampleRate, stereo];
	}
}

module.exports = MP3Analyzer;
