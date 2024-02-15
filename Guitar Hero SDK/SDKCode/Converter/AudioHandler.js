// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	A U D I O   H A N D L E R
//		Handles audio preparation
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Static path to ffMpeg
const ffmpegPath = '"' + require('ffmpeg-static') + '"';
const {execSync} = require('child_process');
const path = require('path');
const fs = require('fs');

const PREVIEW_FADETIME = 1;

class AudioHandler
{
	constructor(converter) { this.converter = converter; }
	
	//-----------------------
	// Prepare a folder with necessary audio tracks
	//	(Requires file list of track names)
	//-----------------------
	
	PrepareFolder(inFolder, songInfo)
	{
		this.info = songInfo;
		this.cleanupTracks = [];
		
		var trackmap = this.DetectAudioTracks(inFolder);
		
		if (!trackmap)
			return {errors: ["Track detection errored. Does this folder have any music tracks?"]};
		
		var fallback = trackmap['fallback'];
		cons.log("Using " + fallback + " to create silent track...");
		
		var success = true;
		
		// Create the silent track before we do anything
		var silentIn = path.join(inFolder, fallback);
		var silentOut = path.join(inFolder, 'silent_out.mp3');

		if (!this.ConvertFile(silentIn, silentOut, '-af "volume=0.0"'))
			return {errors: ["Failed to generate silent_out.mp3."]};
			
		this.cleanupTracks.push(silentOut);
		
		// Now convert the rest of them
		for (const key of Object.keys(trackmap))
		{	
			var val = trackmap[key];
			if (val == 'silent' || key == 'fallback' || key == 'keys')
				continue;
			
			var trackIn = path.join(inFolder, val);
			var trackOut = path.join(inFolder, key + '_out.mp3');
			if (!this.ConvertFile(trackIn, trackOut))
				return {errors: ["Failed to generate " + path.basename(trackOut) + "."]};
				
			this.cleanupTracks.push(trackOut);
		}
		
		// TO MERGE TWO TRACKS:
		// ffmpeg -i keys.ogg -i song.ogg -filter_complex amix=inputs=2:duration=longest:normalize=0 out.mp3
		
		return {result: trackmap};
	}
	
	//-----------------------
	// Cleanup leftover tracks
	//-----------------------
	
	CleanupMusic()
	{
		if (!this.cleanupTracks)
			return;
			
		for (const trk of this.cleanupTracks)
		{
			if (fs.existsSync(trk))
				fs.unlinkSync(trk);
		}
	}
	
	//-----------------------
	// Convert OGG to MP3
	//-----------------------
	
	ConvertFile(inFile, outFile = "", params = "")
	{
		// ffmpeg -i in.ogg -ar 48000 -ac 2 out.mp3
		
		if (!outFile)
		{
			outFile = inFile.split(".");
			outFile.pop();
			outFile = outFile.join(".") + ".mp3";
		}
		
		if (fs.existsSync(outFile))
			fs.unlinkSync(outFile);
			
		cons.log("Converting " + path.basename(outFile) + "...");
		
		var psp = params ? " " : "";
		
		// No need to use -ss 0.048; without it, audio seems to be in sync (tried and tested!)
		// We can add it back in if it turns out to be necessary.
		var cmd = '-i "' + inFile + '" -ar 48000 -ab 128k -ac 2 ' + psp + params + psp + '"' + outFile + '"';
		
		try { execSync(ffmpegPath + " " + cmd, {stdio: ['pipe', 'pipe', 'pipe']}); } catch(err) { cons.warn(err); }
				
		if (!fs.existsSync(outFile))
		{
			cons.error("FAILED to convert " + path.basename(outFile) + "! See above errors!");
			return false;
		}
		
		return true;
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//-----------------------
	// Find appropriate audio tracks
	// in a directory
	//-----------------------
	
	DetectAudioTracks(inDir)
	{
		var trackMap = {
			guitar: this.FindTrack(inDir, 'guitar'),
			rhythm: this.FindTrack(inDir, 'rhythm', ['bass']),
			song: this.FindTrack(inDir, 'song'),
			crowd: this.FindTrack(inDir, 'crowd'),
			vocals: this.FindTrack(inDir, 'vocals'),
			keys: this.FindTrack(inDir, 'keys'),
		}
		
		// -- DETECT DRUMS ---------------
		
		trackMap['drums_1'] = null;
		trackMap['drums_2'] = null;
		trackMap['drums_3'] = null;
		trackMap['drums_4'] = null;
		
		// If single drum, apply whole track to cymbal
		var singleDrum = this.FindTrack(inDir, 'drums');
		if (singleDrum)
			trackMap['drums_4'] = singleDrum;
			
		// Detect actual drum tracks
		else
		{
			var dtA = this.FindTrack(inDir, 'drums_1');
			var dtB = this.FindTrack(inDir, 'drums_2');
			var dtC = this.FindTrack(inDir, 'drums_3');
			var dtD = this.FindTrack(inDir, 'drums_4');
			
			// Assign whatever tracks we have
			trackMap['drums_1'] = dtA;
			trackMap['drums_2'] = dtB;
			trackMap['drums_3'] = dtC;
			trackMap['drums_4'] = dtD;
		}
		
		// Find fallback track to use for silence generation
		var needSilence = false;
		for (const key of Object.keys(trackMap))
		{
			var val = trackMap[key];
			if (val)
				trackMap['fallback'] = trackMap['fallback'] || val;
			else
			{
				needSilence = true;
				trackMap[key] = 'silent';
			}
		}
		
		// Needs silence, but didn't have a fallback track
		if (!trackMap['fallback'] && needSilence)
		{
			cons.error("Could not find fallback track for silence!");
			return null;
		}
		
		// Detect our preview track
		// (Let's generate one!)
		
		var prvTrack = this.FindTrack(inDir, 'preview');
		if (!prvTrack)
		{
			var gp = this.GeneratePreview(inDir, trackMap);
			if (!gp)
				return null;
				
			trackMap['preview'] = gp;
			this.cleanupTracks.push(path.join(inDir, gp));
		}
		else
			trackMap['preview'] = prvTrack;
		
		return trackMap;
	}
	
	//-----------------------
	// Audio track exists?
	//-----------------------
	
	FindTrack(inDir, trackName, alts = [])
	{
		// Loop through filetypes
		var extens = ["ogg", "mp3", "opus", "flac", "wav"];
		
		for (const ext of extens)
		{
			var checker = path.join(inDir, trackName + "." + ext);
			
			if (fs.existsSync(checker))
				return path.basename(checker);
				
			// Check alts
			for (const alt of alts)
			{
				var checker = path.join(inDir, alt + "." +ext);
				if (fs.existsSync(checker))
					return path.basename(checker);
			}
		}
		
		return null;
	}
	
	//-----------------------
	// Generate a preview track!
	//-----------------------
	
	GeneratePreview(inDir, trackMap)
	{
		cons.warn("Preview not found, generating...");

		// Set the volume and duration of the preview (in the event it's too loud!)
		// INI options: preview_volume = number,
		// 				where number is a value in a percentage of audio volume. 1 is for normal volume, larger will be louder, smaller will be quieter.
		//				
		//				preview_length = sec OR preview_duration = sec
		//				where sec is time in seconds. Default is 30 seconds if not specified.
		var previewVolume = (this.info.preview_volume && this.info.preview_volume > 0) ? this.info.preview_volume : 0.75;
		var previewDuration = ((this.info.preview_duration && this.info.preview_duration > 0) || (this.info.preview_length && this.info.preview_length > 0))
							  ? (this.info.preview_duration || this.info.preview_length) : 30;

		var endTime = this.converter.songEndTime || 0;
		var previewTime = 0;
		
		if (this.info)
		{
			if (this.info.song_length && this.info.song_length[0])
				endTime = parseFloat(this.info.song_length[0]) / 1000.0;
				
			if (this.info.preview_start_time && this.info.preview_start_time[0])
			{
				var pT = parseFloat(this.info.preview_start_time[0]) / 1000.0;
				previewTime = (pT >= 0) ? pT : previewTime;
			}
				
			// Try to use album_track instead
			if (!previewTime && (this.info.album_track && this.info.album_track[0]))
			{
				var pT = parseFloat(this.info.album_track[0]) / 1000.0;
				previewTime = (pT >= 0) ? pT : previewTime;
			}
				
			// Generate
			if (!previewTime)
			{
				cons.log("  No preview time in INI, using halfway point...");
				previewTime = endTime * 0.5;
			}
		}

		// First, combine all tracks
		cons.log("  Combining all tracks using preview start time of " + previewTime + "...", 'grey');
		cons.log(`  Setting the volume of the preview to ${previewVolume * 100.0}%...`, 'grey')
		cons.log(`  Setting length of preview to ${previewDuration} seconds...`, 'grey')

		var combiner = path.join(inDir, 'combined_out.mp3');
		var tracks = [];
		
		for (const key of Object.keys(trackMap))
		{
			var trk = trackMap[key];
			if (!trk || (trk && trk == 'silent'))
				continue;
				
			tracks.push('-i "' + path.join(inDir, trk) + '"');
		}
		
		var cmd = tracks.join(" ") + ' -filter_complex amix=inputs=' + tracks.length + ':duration=longest:normalize=0 "' + combiner + '"';

		if (fs.existsSync(combiner))
			fs.unlinkSync(combiner);
		
		try { execSync(ffmpegPath + " " + cmd, {stdio: ['pipe', 'pipe', 'pipe']}); } catch(err) { cons.warn(err); }
		
		if (!fs.existsSync(combiner))
		{
			cons.error("Combiner track could not be generated.");
			return null;
		}
		
		// We have the combiner track, now let's generate a preview from it
		cons.log("  Generating clipped preview...", 'grey');
		
		var previewStart = Math.floor(previewTime);
		var previewEnd = previewStart + previewDuration;
		
		previewEnd = Math.min(previewEnd, endTime);
		previewStart = Math.max(previewStart, 0);
		
		var previewFade = previewEnd - PREVIEW_FADETIME;
		
		var af = 'afade=in:st=' + previewStart + ':d=' + PREVIEW_FADETIME + ',afade=out:st=' + previewFade + ':d=' + PREVIEW_FADETIME;
		
		var previewOut = path.join(inDir, "preview_combined.mp3");
		
		// Command to pass into ffmpeg.
		// Now included with volume lowering (or raising) in "-filter:a "volume=x""!
		var cmd = "-i \"" + combiner + "\" -ss " + previewStart + " -t " + previewDuration + " -af \"" + af + "\" " + "-filter:a \"volume=" + previewVolume + "\" " + "\"" + previewOut + "\"";
		
		if (fs.existsSync(previewOut))
			fs.unlinkSync(previewOut);
			
		try { execSync(ffmpegPath + " " + cmd, {stdio: ['pipe', 'pipe', 'pipe']}); } catch(err) { cons.warn(err); }
		
		if (!fs.existsSync(previewOut))
		{
			cons.error("Preview track could not be generated.");
			return null;
		}
		
		fs.unlinkSync(combiner);
			
		return path.basename(previewOut);
	}

}

module.exports = AudioHandler;
