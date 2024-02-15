const TrackClass = require('./Track.js');
const NoteClass = require('./Note.js');
const ConversionClass = require('./Conversion.js');
const TextEventConverterClass = require('./TextEventConverter.js');
const AudioHandlerClass = require('./AudioHandler.js');
const CamHandlerClass = require('./CamHandler.js');
const MP3AnalyzerClass = require('./MP3Analyzer.js');
const SetlistHandlerClass = require('./SetlistHandler.js');

const ParseDiffs = [
	{id: 'easy'},
	{id: 'medium'},
	{id: 'hard'},
	{id: 'expert'}
];

const ParseTracks = [
	{id: 'guitar', trackname: 'PART GUITAR'},
	{id: 'drums', trackname: 'PART DRUMS'},
	{id: 'bass', trackname: 'PART BASS'},
	{id: 'vocals', trackname: 'PART VOCALS'}
];

const NoteMappings = {
	
	guitar: {
		60: 'GTR_EASY_GREEN',
		61: 'GTR_EASY_RED',
		62: 'GTR_EASY_YELLOW',
		63: 'GTR_EASY_BLUE',
		64: 'GTR_EASY_ORANGE',
		
		72: 'GTR_MEDIUM_GREEN',
		73: 'GTR_MEDIUM_RED',
		74: 'GTR_MEDIUM_YELLOW',
		75: 'GTR_MEDIUM_BLUE',
		76: 'GTR_MEDIUM_ORANGE',
		
		84: 'GTR_HARD_GREEN',
		85: 'GTR_HARD_RED',
		86: 'GTR_HARD_YELLOW',
		87: 'GTR_HARD_BLUE',
		88: 'GTR_HARD_ORANGE',
		
		96: 'GTR_EXPERT_GREEN',
		97: 'GTR_EXPERT_RED',
		98: 'GTR_EXPERT_YELLOW',
		99: 'GTR_EXPERT_BLUE',
		100: 'GTR_EXPERT_ORANGE',
	},
	
	drums: {
		60: 'DRM_EASY_PURPLE',
		61: 'DRM_EASY_RED',
		62: 'DRM_EASY_YELLOW',
		63: 'DRM_EASY_BLUE',
		64: 'DRM_EASY_GREEN',
		65: 'DRM_EASY_ORANGE',
        69: 'EOFDRM_EASY_ORANGE',
		
		72: 'DRM_MEDIUM_PURPLE',
		73: 'DRM_MEDIUM_RED',
		74: 'DRM_MEDIUM_YELLOW',
		75: 'DRM_MEDIUM_BLUE',
		76: 'DRM_MEDIUM_GREEN',
		77: 'DRM_MEDIUM_ORANGE',
        81: 'EOFDRM_MEDIUM_ORANGE',
		
		84: 'DRM_HARD_PURPLE',
		85: 'DRM_HARD_RED',
		86: 'DRM_HARD_YELLOW',
		87: 'DRM_HARD_BLUE',
		88: 'DRM_HARD_GREEN',
		89: 'DRM_HARD_ORANGE',
        93: 'EOFDRM_HARD_ORANGE',
		
		96: 'DRM_EXPERT_PURPLE',
		97: 'DRM_EXPERT_RED',
		98: 'DRM_EXPERT_YELLOW',
		99: 'DRM_EXPERT_BLUE',
		100: 'DRM_EXPERT_GREEN',
		101: 'DRM_EXPERT_ORANGE',
        105: 'EOFDRM_EXPERT_ORANGE'
	}
	
};

const NOTEVAL_HOPO_OFF_EOF = 105;
const NOTEVAL_HOPO_ON = 101;
const NOTEVAL_HOPO_OFF = 102;
const NOTEVAL_SOLO = 103;
const NOTEVAL_TAPMARKER = 104;
const NOTEVAL_STAR_POWER = 116;
const NOTEVAL_STAR_POWER_EOF = 106;     // For drums.
const NOTEVAL_UNPITCHED = 26;

const NOTEVAL_LANE_SINGLE = 126;
const NOTEVAL_LANE_DOUBLE = 127;

const NOTEVAL_LEFTHAND_LOWEST = 40;
const NOTEVAL_LEFTHAND_HIGHEST = 59;

const GeneralMappings = {
	NOTEVAL_HOPO_OFF: 'HOPO_OFF',
	NOTEVAL_HOPO_ON: 'HOPO_ON',
	NOTEVAL_STAR_POWER: 'STAR_POWER'
};

const HOPO_THRESHOLD = 170;
const NOTE_SNAP_TIME = 0.01;
const NOTE_APPEND_CHECK = 10;
const LANE_START_SNAP_TIME = 0.02;

// If text event time and note time vary less than this,
// the note will be made an accent.
const NOTE_ACCENT_SNAP = 0.01;

const FretBits = {
	'green': 1,
	'red': 1 << 1,
	'yellow': 1 << 2,
	'blue': 1 << 3,
	'orange': 1 << 4,
	'purple': 1 << 5,
	
	'hopo': 1 << 6,
	
	'normal_green': 1 << 7,
	'normal_red': 1 << 8,
	'normal_yellow': 1 << 9,
	'normal_blue': 1 << 10,
	'normal_orange': 1 << 11,
	
	'accent_green': 1 << 7,
	'accent_red': 1 << 8,
	'accent_yellow': 1 << 9,
	'accent_blue': 1 << 10,
	'accent_orange': 1 << 11,
	'accent_purple': 1 << 12,
};

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');
const { Midi } = require('@tonejs/midi')

class SongConverter
{
	constructor()
	{
		var fsbCore = require('./SongFSBHandler.js');
		this.FSBHandler = new fsbCore(this);
		this.AudioHandler = new AudioHandlerClass(this);
		this.CamHandler = new CamHandlerClass(this);
		this.MP3Analyzer = new MP3AnalyzerClass(this);
		this.SetlistHandler = new SetlistHandlerClass(this);
	}
	
	//-----------------------
	// Convert five-lane drums
	// Swap orange and green
    //
    // Why?
	//-----------------------
	
	ConvertFiveLane(note)
	{  
		if (GHSDK.Config.SC_RawNotes)
			return;
            
		for (var f=0; f<note.frets.length; f++)
		{
			var col = note.frets[f];
            
			if (col == 'orange')
				col = 'green';
			else if (col == 'green')
				col = 'orange';

			note.frets[f] = col;
		}
	}
	
	//-----------------------
	// Convert pro drums
	//
	// pro green = green tom
	// pro blue = blue tom
	// pro yellow = yellow tom
	//-----------------------
	
	ConvertProDrums(note, pro_colors, had_green_cymbal, had_green_tom)
	{
		if (GHSDK.Config.SC_RawNotes)
			return;
	
		var replacers = {};
		
		if (note.HasFret('blue'))
		{
			// Blue RB cymbal becomes orange GH note, or yellow
			// if there's already an orange
			if (!pro_colors['blue'])
			{
				var newColor = had_green_cymbal ? 'yellow' : 'orange';
				replacers['blue'] = newColor;
			}
			
			// Blue tom becomes green if we had no green
			else if (!had_green_tom)
				replacers['blue'] = 'green';
		}

		// Yellow tom always becomes blue
		if (note.HasFret('yellow') && pro_colors['yellow'])
			replacers['yellow'] = 'blue';
		
		// Green cymbal gets converted to orange
		if (note.HasFret('green'))
		{
			// Green cymbal becomes orange, ALWAYS
			if (!pro_colors['green'])
				replacers['green'] = 'orange';
		}
		
		// Re-compile frets
		var pushedFrets = {};
		var newFrets = [];
		
		for (const fret of note.frets)
		{
			var newColor = replacers[fret] || fret;
			
			// Prevent pushing duplicate colors
			if (pushedFrets[newColor])
				continue;
				
			pushedFrets[newColor] = true;
			newFrets.push(newColor);
		}
        
		note.frets = newFrets;
	}
	
	//-----------------------
    // Exported from EOF?
	//-----------------------
    
    IsEOFSong()
    {
        return (this.songInfo.eof_song && this.songInfo.eof_song[0].toLowerCase() == "true") || false;
    }
    
	//-----------------------
	// Convert .mid to GHWT format
	//-----------------------
	
	ParseMIDIData(midFile, songInfo)
	{
		this.songInfo = songInfo;
		
		var results = {};
		var buf = fs.readFileSync(midFile);
		
		this.songEndTime = -1;
		this.hasSinger = false;
		
		this.buffer = buf;
		this.midi = new Midi(buf);
		results.midi = this.midi;
		
		// Calculate beats, bars, etc.
		this.CalculateTiming();
		
		// Calculate text-related things and other events
		new TextEventConverterClass(this);
			
		// Create our tracks
		results.tracks = {};
		results.arrays = {};
		results.lyrics = [];
        results.lightshow = this.HandleGenericTrack('LIGHTSHOW');
        
        // EOF does some things differently.
        var eof_song = this.IsEOFSong();
        
		for (const pt of ParseTracks)
		{
			var instrument = pt.id;
			var isGuitar = (instrument == 'guitar' || instrument == 'bass');
			
			var miditrack;
			
			// Gets from MIDI
			//~ var miditrack = this.FindTrack(pt.trackname);
			
			// Gets what we parsed
			miditrack = this.parsedTracks[pt.trackname];
			
			if (!miditrack)
			{
				cons.warn("COULD NOT FIND MIDI TRACK: " + pt.trackname);
				continue;
			}

            var lanes = [];
			var forcers = [];
			var solos = [];
            var tapMarkers = [];
			var stars = [];
			var phrases = [];
			var pro_drums = [];
			
			this.pitchMin = 999999;
			this.pitchMax = -999999;
			
			var had_green_cymbal = false;			// Drums: Our green note was a cymbal
			var had_green_tom = false;				// Drums: Did we have a green tom?
			
			// Create a track for each difficulty
			var trk = new TrackClass();
			results.tracks[instrument] = trk;
			
			// For determining if we had cymbals
			var green_notes = [];
			
			// -- DETERMINE FORCERS, PRO DRUMS, ETC. --
			for (var n=0; n<miditrack.notes.length; n++)
			{
				var note = miditrack.notes[n];
				
				// Solo marker
				if (isGuitar || instrument == 'drums')
				{
					if (note.midi == NOTEVAL_SOLO)
						solos.push([note.time, note.duration])
				}
                
                // Tap note marker
                if (isGuitar && note.midi == NOTEVAL_TAPMARKER)
                    tapMarkers.push([note.time, note.duration]);
				
				// Left hand positions! For fretboard
				if (isGuitar && (note.midi >= NOTEVAL_LEFTHAND_LOWEST && note.midi <= NOTEVAL_LEFTHAND_HIGHEST))
				{
					// Alright, so we know our note is between these two values,
					// let's get a percentage value based on how far down
					// the fretboard it is
					
					var fretRange = (NOTEVAL_LEFTHAND_HIGHEST - NOTEVAL_LEFTHAND_LOWEST);
					var pct = (note.midi - NOTEVAL_LEFTHAND_LOWEST) / fretRange;
					
					// Invert it, RB / GH seems to handle this in the opposite order
					pct = 1.0 - pct;
					
					trk.lefthand_notes.push([note.time, pct, note.duration]);
				}
				
				// HOPO for guitar and bass only
				if (isGuitar)
				{
					// Force HOPO on!
					if (note.midi == NOTEVAL_HOPO_OFF || (eof_song && note.midi == NOTEVAL_HOPO_OFF_EOF))
						forcers.push([note.time, note.duration, false])
						
					// Force HOPO off! (Let's assume these don't overlap)
					if (note.midi == NOTEVAL_HOPO_ON)
						forcers.push([note.time, note.duration, true])
				}
				
				// Pro notes on drums only
				else if (instrument == 'drums')
				{
					if (note.midi == 112)
					{
						had_green_tom = true;
						pro_drums.push([note.time, note.duration, 'green']);
					}
						
					if (note.midi == 111)
						pro_drums.push([note.time, note.duration, 'blue']);
						
					if (note.midi == 110)
						pro_drums.push([note.time, note.duration, 'yellow']);
                        
                    // Lanes - EOF uses these for sustains.
                    // Is it really bad if these are legitimate RB lanes
                    // and we parse them? Probably not.
                    
                    if (eof_song && (note.midi == NOTEVAL_LANE_SINGLE || note.midi == NOTEVAL_LANE_DOUBLE))
                        lanes.push([note.time, note.duration]);
				}
				
				if (instrument == 'vocals')
				{
					// Phrase marker
					if (note.midi == 105 || note.midi == 106)
					{
						if (this.CanAddPhrase(phrases, note.time))
							phrases.push([note.time, note.duration, []]);
							
						continue;
					}
					
					if (note.lyric)
						results.lyrics.push([note.time, note.lyric]);
				}
				
				// Star power / overdrive, same on all instruments
				if (note.midi == NOTEVAL_STAR_POWER || (eof_song && note.midi == NOTEVAL_STAR_POWER_EOF))
				{
					stars.push([note.time, note.duration, {}]);
					continue;
				}
				
				// Which difficulty do we want to put it into?
				if (instrument == 'vocals')
					this.CreateVocalNote(trk, note);
				else
				{
                    // Instrument-specific note
                    var mappings = NoteMappings[instrument];
                    if (!mappings)
                        mappings = GeneralMappings;
                        
                    var mp = mappings[note.midi] || "";
                        
                    var valid_note = true;
                    if (mp.startsWith("EOFDRM") && !eof_song)
                        valid_note = false;
                        
                    if (valid_note)
                    {
                        var col = this.CreateNote(trk, note, instrument);

                        // Tell converter we found a green note
                        if (col && instrument == 'drums' && col == 'green')
                            green_notes.push(note.time);
                    }
				}
			}
            
			// Sort pro notes by time
			if (pro_drums.length > 0)
				pro_drums.sort((a, b) => {return a[0] - b[0];});
				
			// Determine if we had green cymbals
			for (const gn of green_notes)
			{
				var wasPro = false;
				
				for (const pd of pro_drums)
				{
					if (gn >= pd[0] && gn <= pd[0] + pd[1] && pd[2] == 'green')
					{
						wasPro = true;
						break;
					}
				}
				
				if (!wasPro)
				{
					had_green_cymbal = true;
					break;
				}
			}
			
			results.arrays[instrument + "_solos"] = solos;
			results.arrays[instrument + "_taps"] = tapMarkers;
			
			var diffsToUse = (instrument == 'vocals') ? [{id: 'expert'}] : ParseDiffs;
			
			for (const diff of diffsToUse)
			{
				var noteTrack = trk.diffs[diff.id].notes;
				
				// Before we do ANYTHING, let's set open notes
				// This will affect our auto-HOPO
				
				// Attempt to set open notes
				var sys = this.sysEx[instrument] || [];
				
				for (var n=0; n<noteTrack.length; n++)
				{
					var note = noteTrack[n];
					for (const ex of sys)
					{
						var isGreen = (note.FretString() == 'green');
						
						if (ex.phrase == 'OPEN_STRUM_BASS' && isGreen && note.time >= ex.time && note.time <= ex.time + ex.length)
						{
							note.open = true;
							note.frets = ['purple'];
							break;
						}
					}
				}
				
				// -- Set auto-HOPO and a few other things -------------
				
				// First, sort the note track in order of time
				// 	(This shouldn't mess things up, hopefully)
				
				noteTrack.sort(function(a, b) {
					return a.time - b.time;
				});
				
				for (var n=0; n<noteTrack.length; n++)
				{
					var note = noteTrack[n];
						
					// Don't allow forcing on chords, OR DRUMS
					if (instrument !== 'drums')
					{
						var forced = false;
						for (const frc of forcers)
						{
							// Hold up, we can't HOPO two notes in sequence
							if (n > 0 && frc[2])
							{
								var this_FS = note.FretString();
								var last_FS = noteTrack[n-1].FretString();
								
                                // If notes are the same and it's a HOPO note, ignore.
								if (this_FS == last_FS && noteTrack[n-1].hopo)
									continue;
							}
							
							if (note.time >= frc[0] && note.time <= frc[0] + frc[1])
							{
								forced = true;
								note.hopo = frc[2];
								break;
							}
						}
					}
                    
                    // Check EOF "sustains"
                    else
                    {  
                        if (lanes.length)
                        {
                            for (const lane of lanes)
                            {
                                if (note.time >= lane[0] && note.time <= (lane[0] + lane[1]))
                                {
                                    var gap = Math.abs(note.time - lane[0]);
                                    
                                    if (gap <= LANE_START_SNAP_TIME)
                                        note.length = lane[1];
                                }
                            }
                        }
                    }
                    
                    // For bass, set open notes. EOF does this. Will we ever
                    // have 5-note chords on bass? Just don't do this. This is bad.
                    
                    if (instrument == 'bass')
                    {
                        if (note.frets.includes("green") && note.frets.includes("red") && note.frets.includes("yellow")
                            && note.frets.includes("blue") && note.frets.includes("orange"))
                        {
                            note.open = true;
                            note.frets = ['purple'];
                        }
                    }
					
					// Jam notes into our phrases
					if (instrument == 'vocals')
					{
						for (var p=0; p<phrases.length; p++)
						{
							var phrase = phrases[p];
							if (note.time >= phrase[0] && note.time <= phrase[0] + phrase[1])
								phrases[p][2].push(note);
						}
					}
						
					// Can we make the next note a HOPO? Only if it wasn't forced
					if (instrument !== 'drums' && this.AutoHOPONext(noteTrack, n))
						noteTrack[n+1].hopo = true;
						
					// Try to set star power
					for (const star of stars)
					{
						var mapping = star[2];
						
						if (note.time >= star[0] && note.time <= star[0] + star[1])
						{
							note.star = true;
							
							// Create star mapping if not existed
							mapping[diff.id] = mapping[diff.id] || 0;
							mapping[diff.id] ++;
							
							break;
						}
					}
					
					// Attempt to handle extended sustain mumbo jumbo
					if (isGuitar)
						this.HandleExtSustain(noteTrack, n);
						
					else if (instrument == 'drums')
					{
						var pro_colors = {};
						
						// Handle pro drum conversion
						if (pro_drums.length > 0)
						{
							for (const pd of pro_drums)
							{
								var col = pd[2];
								
								if (note.time >= pd[0] && note.time <= pd[0] + pd[1])
									pro_colors[col] = true;
							}
						}
						
						// Handle five-lane conversion
						// Orange is specially assigned to five-lane charts
						
						var FLD = (this.songInfo.five_lane_drums && this.songInfo.five_lane_drums[0].toLowerCase() == "true");
                        
						if (FLD || note.HasFret('orange'))
							this.ConvertFiveLane(note);
							
						// Rock band conversion
						else
							this.ConvertProDrums(note, pro_colors, had_green_cymbal, had_green_tom);
					}
				}

				// Create final note array for the instrument and difficulty
				
				// -- NORMAL INSTRUMENTS --
				if (instrument !== 'vocals')
				{
					var arr = this.CreateArrays(trk, instrument, diff.id);
					results.arrays[instrument + "_" + diff.id] = arr;
					
					// Push the star power array!
					var starName = instrument + "_" + diff.id + "_star";
					results.arrays[starName] = this.CreateStarArrays(diff.id, stars);
				}
				
				// -- VOCALS --
				else
					results.vocalData = this.CreateVocalArrays(trk, phrases);
			}
		}
		
		// Write beats / fretbars to separate array
		var bts = [];
		for (const beat of this.beats)
		{
			var msBeat = Math.floor(beat * 1000) + this.songDelay;
			bts.push(msBeat);
		}
		
		if (bts[0] != 0)
			bts.unshift(0);
			
		results.fretbars = bts;
		
		// Write timesigs to array
		var ts = [];
		for (const timesig of this.timesigs)
		{
			var msTime = Math.floor(timesig[0] * 1000) + this.songDelay;
			timesig[0] = msTime;
			
			ts.push(timesig);
		}
		
		results.timesigs = ts;
        
		// Calculate end time if it's still bad
		if (this.songEndTime < 0)
			this.GuessEndTime(results);
			
		// Now that we have our end time, generate cameras
		this.cameras = this.CamHandler.RandomCamArray(this.songEndTime, 0.0);
		
		return results;
	}
	
	//-----------------------
    // Handle a generic track.
    // Lightshow, cams, etc.
	//-----------------------
    
    HandleGenericTrack(trackName)
    {
        var track = this.parsedTracks[trackName];
        
        if (!track)
            return [];
            
        var result = [];
        
        cons.log("Handling " + trackName + " track...", "grey");
        
        for (const note of track.notes)
        {
            // Each note has ticks, duration, and time.
            result.push({note: note.midi, time: note.time, duration: note.duration});
        }
        
        return result;
    }
    
	//-----------------------
	// Convert a song from a CH folder!
	//-----------------------
	
	ConvertSong(inDirectory, outDirectory, options, callback = null)
	{
		options = options || {};
		
		var convOpt = {
			inDir: inDirectory,
			outDir: outDirectory,
			converter: this
		};
		
		Object.assign(convOpt, options);
		
		this.callback = callback;
		this.conversion = new ConversionClass(convOpt);
	}
	
	//-----------------------
	// Can we add a phrase?
	// This mostly checks for 105 and 106 overlaps
	//-----------------------
	
	CanAddPhrase(phrases, newPhraseTime)
	{
		if (phrases.length <= 0)
			return true;
			
		// Check up to last 5 phrases
		var phraseList = (phrases.length > 5) ? phrases.slice(-5) : phrases;
		
		for (const phrase of phraseList)
		{
			var diff = Math.abs(phrase[0] - newPhraseTime);
			if (diff <= 0.05)
				return false;
		}
		
		return true;
	}
	
	//-----------------------
	// Get instrument ID from part
	//-----------------------
	
	InstrumentFromPart(partname)
	{
		for (const parser of ParseTracks)
		{
			if (parser.trackname.toLowerCase() == partname.toLowerCase())
				return parser.id;
		}
		
		return 'null';
	}
	
	//-----------------------
	// Create a vocals note based on parsed MIDI data
	//-----------------------
	
	CreateVocalNote(track, midinote)
	{
		var con = track.diffs['expert'];
		
		if (midinote.midi > 84 || midinote.midi < 34)
			return 'NO_COLOR';
            
        // Adjust time if necessary. This offsets
        // our vocal notes, and vocal notes only.
        //
        // NOTE: This does not affect our ticks value, but
        // we don't care. Ticks, for now, are only used
        // for calculating auto-HOPO values.
        
        var time_to_use = midinote.time;
        var vocal_offset = 0.0;
        
        if (this.songInfo.vocal_offset && (this.songInfo.vocal_offset[0] !== undefined))
        {
            // This will be the vocal offset, in milliseconds.
            vocal_offset = parseInt(this.songInfo.vocal_offset[0]) / 1000.0;
        }

		var newNote = new NoteClass();
		newNote.vocal = true;
		newNote.pitch = midinote.midi;
		newNote.ticks = midinote.ticks;
		newNote.time = Math.max(0.0, time_to_use + vocal_offset);
		newNote.length = midinote.duration;
		newNote.lyric = midinote.lyric;
		newNote.lyric_extended = midinote.lyric_extended || false;
		
		if (midinote.lyric)
		{
			var lastChar = midinote.lyric[midinote.lyric.length-1];
			if (lastChar == '#' || lastChar == '^')
				newNote.pitch = 0;
		}
		
		if (newNote.pitch > 0)
		{
			this.pitchMin = Math.min(this.pitchMin, newNote.pitch);
			this.pitchMax = Math.max(this.pitchMax, newNote.pitch);
		}
		
		con.notes.push(newNote);
		
		return 'NO_COLOR';
	}
	
	//-----------------------
	// Create a note based on parsed MIDI data
	//-----------------------
	
	CreateNote(track, midinote, instrument)
	{
		// Bass re-uses guitar's notes
		var lookupID = (instrument == 'bass') ? 'guitar' : instrument;
		
		// Instrument-specific note
		var mappings = NoteMappings[lookupID];
		if (!mappings)
			mappings = GeneralMappings;
			
		var mp = mappings[midinote.midi];

		// Didn't exist, bad note index!
		if (!mp)
			return '';
			
		var spl = mp.split("_");
		var fret = spl[spl.length-1].toLowerCase();
		var diff = spl[1].toLowerCase();
		
		var con = track.diffs[diff];
		var notes = con.notes;
		
		// Search last 10 notes of track and find notes within this time range
		// If we find them, pop frets to them
		
		var checkStart = Math.max(notes.length-NOTE_APPEND_CHECK, 0);
		var checkMax = Math.max(notes.length, 0);
		
        var newNote = null;
        
		for (var idx=checkStart; idx<checkMax; idx++)
		{
			var nt = notes[idx];
			if (Math.abs(midinote.time - nt.time) <= NOTE_SNAP_TIME)
			{
				var lenA = notes[idx].length;
				var lenB = midinote.duration;
				
				// Note positions match up but lengths were different, odd
				if (Math.abs(lenA - lenB) >= 0.05)
					console.log("Note Length Mismatch: " + notes[idx].length + " vs " + midinote.duration);
				
				notes[idx].frets.push(fret);
				newNote = notes[idx];
				break;
			}
		}
		
		// No notes were close enough, let's add a new note
		if (!newNote)
		{
			newNote = new NoteClass();
			newNote.frets.push(fret);
			newNote.ticks = midinote.ticks;
			newNote.time = midinote.time;
			newNote.length = midinote.duration;
            
			con.notes.push(newNote);
		}
        
        // Check accented frets for drums.
        if (instrument == 'drums' && this.accents)
        {
            for (const acc of this.accents)
            {
                var gap = Math.abs(acc.time - midinote.time);
                if (gap <= NOTE_ACCENT_SNAP)
                {
                    for (const fret of acc.frets)
                    {
                        if (!newNote.accents.includes(fret))
                            newNote.accents.push(fret);
                    }
                }
            }
            
            // Ignore EOF-exported green notes
            if (spl[0] == 'EOFDRM')
                newNote.has_literal_green = true;
        }
		
		// Return fret color
		return fret;
	}
	
	//-----------------------
	// Find track by name
	//-----------------------
	
	FindTrack(tName)
	{
		for (const track of this.midi.tracks)
		{
			if (track.name.toLowerCase() == tName.toLowerCase())
				return track;
		}
		
		return undefined;
	}
	
	//-----------------------
	// Create note binary number from a note
	//	 (GHWT)
	//
	//	GUITAR:
	//
	//            MAKE HOPO
	//	          |
	//	  SUSTAIN |
	//      OBYRG |        NOTE LENGTH
	//       _|_  |        |
	//		|	| |	POBYRG |______________
	//      |   | | |||||| |              |
	//	000011111 0 000110 0000001000100110		RY
	//
	//	000011111 0 000110 0000000000111111		RY
	//	000011111 0 000110 0000000000111111		RY
	//
	//	000011111 1 000001 0000000000111111		G
	//
	//	000011111 0 001001 0000000000111111		GB
	//	000011111 0 001001 0000000000111111		GB
	//
	// ONE:
	//
	// 	000010111 1 000010 0000001001100101		R: 613ms
	//	000011101 0 001000 0000000000110010		B: 60ms
	//	000011011 1 000010 0000011100011010		R: 1818ms
	//	000011101 0 000100 0000010111101011		Y: 1515ms
	//-----------------------
	//
	//	DRUM:
	//	
	//     ACCENT             NOTE LENGTH
	//     |||||| MAKE HOPO     |
	//     POBYRG |             |
	//     |||||| | POBYRG  ____|_________
	//	   |||||| | |||||| |              |
	//	000111111 0 000100 0000000000100010		Y
	//	000001000 0 001000 0000000000110100		B accented
	//	000000000 0 000100 0000000000100010		Y
	//	000000000 0 000010 0000000000111010		R
	//	000000000 0 100000 0000000000111000		P
	//	000000000 0 000010 0000000000111000		R
	//	000000000 0 100000 0000000000111011		P
	//	000000000 0 100100 0000000000110000
	//
	//-----------------------
	
	CreateNoteBinary(note, instrument)
	{
		var numB = 0;
		var msLength = Math.floor(note.length * 1000);
		
		// Minimum length of 63ms or so
		//		(This constitutes a single note)
		
		msLength = Math.max(msLength, 63);
		
		numB = msLength;
		
		var numA = 0;
		var fretnum = 0;

		var outFrets = note.frets;
		if (note.open)
			outFrets = ['purple'];
			
		for (const col of outFrets)
			fretnum |= (FretBits[col] || 0);
			
		numA |= fretnum;
        
		// Forces HOPO on
		// In GHWT, all notes are strum by default
		if (note.hopo)
			numA |= FretBits['hopo'];
		
		// Special sustain bits
		if (instrument !== 'drums')
		{
			var mainColors = ['green', 'red', 'yellow', 'blue', 'orange'];
			
			for (const col of mainColors)
            {
                if (!note.exclude_frets.includes(col))
                    numA |= FretBits['normal_' + col];
            }
		}
        
        // Accents
        else
        {
            //~ if (note.time > 10.75 && note.time < 10.8)
                //~ console.log(note.time, note.frets);
                
            if (!note.open)
            {
                for (const acc_color of note.accents)
                    numA |= (FretBits['accent_' + acc_color] || 0);
            }
        }

		var finalNum = (numA << 16) + numB;
		
		return finalNum;
	}
	
	//-----------------------
	// Compress a note value
	//-----------------------
	
	CompressNote(note, velocity = 100, length = 68)
	{
		var noteChunk = note << 16;
		var velocityChunk = velocity << 24;
		
		return (length | noteChunk | velocityChunk);
	}
	
	//-----------------------
	// Create star power arrays
	//-----------------------
	
	CreateStarArrays(diff, stars)
	{
		var starArrays = [];
		
		for (const star of stars)
		{
			var arr = [];
			var noteCount = star[2][diff];
			
			if (!noteCount)
				continue;
				
			var msTime = Math.floor(star[0] * 1000) + this.songDelay;
			var msLength = Math.floor(star[1] * 1000);
			
			arr.push(msTime);
			arr.push(msLength);
			arr.push(noteCount);
			
			starArrays.push(arr);
		}
		
		return starArrays;
	}
	
	//-----------------------
	// Create proper time and note 
	// array for an instrument track
	//-----------------------
	
	CreateArrays(track, instrument, diff)
	{
		// Text lines
		var arr = [];
		
		for (const note of track.diffs[diff].notes)
		{
			// Adjust by 204
			var msTime = Math.floor(note.time * 1000) + this.songDelay;
			arr.push(msTime);
			
			var bin = this.CreateNoteBinary(note, instrument);
			arr.push(bin);
		}
		
		return arr;
	}
	
	//-----------------------
	// Create vocal data containing arrays
	//-----------------------
	
	CreateVocalArrays(track, phrases)
	{
		var newPhrases = [];
		
		var data = {
			notes: [],
			pitchMin: this.pitchMin,
			pitchMax: this.pitchMax,
			phrases: phrases
		};
		
		// Vocal notes are expert only
		var diff = track.diffs['expert'];
		
		for (var n=0; n<diff.notes.length; n++)
		{
			var note = diff.notes[n];
			
			// This was adjusted by 204 at one point, forward or back?
			var msTime = Math.floor(note.time * 1000) + this.songDelay;
			msTime = Math.max(0, msTime + GHSDK.Config.SC_VocalsOffset);
			
			data.notes.push(msTime);
			
			var msLength = Math.floor(note.length * 1000);
			data.notes.push(msLength);
			
			if (note.pitch == 0)
				data.notes.push(NOTEVAL_UNPITCHED);
			else
				data.notes.push(note.pitch);
				
			// Note is extended!
			// Connect it to the next note
			if (note.lyric_extended && n < diff.notes.length-1)
			{
				var nextNote = diff.notes[n+1];
				
				var endTime = msTime + msLength;
				var nextTime = Math.floor(nextNote.time * 1000) + this.songDelay;
				nextTime = Math.max(0, nextTime + GHSDK.Config.SC_VocalsOffset);
				
				// Add a note at the end, with gap time as length
				// Pitch is 2, this is a connector note
				
				data.notes.push(endTime);
				data.notes.push(nextTime - endTime);
				
				data.notes.push(2);
			}
		}
		
		if (data.pitchMax < 0)
		{
			data.pitchMax = 26;
			data.pitchMin = 26;
			
			if (data.notes.length <= 0)
				cons.log("No vocal notes had pitch, because there were no notes!", 'red');
			else
				cons.log("No vocal notes had any pitch!", 'orange');
		}
		
		return data;
	}
	
	//-----------------------
	// Calculate MIDI bars, beats, etc.
	//
	// We probably don't "need" this if we have a BEAT track,
	// but it's good to have and reference regardless
	//-----------------------
	
	CalculateTiming()
	{
		// Is our song delayed?
		this.songDelay = 0;
		
		if (this.songInfo.delay)
		{
			this.songDelay = parseInt(this.songInfo.delay[0]);
			
			if (this.songDelay > 0)
				cons.log("Using song delay of " + this.songDelay + "ms...", "grey");
		}
		
		// First, create list of BPM changes
		this.bpms = [];
		for (const tempo of this.midi.header.tempos)
			this.bpms.push([tempo.time, tempo.bpm]);

		// Estimate where our MIDI track ends
		var timeEnd = 0;
		for (const track of this.midi.tracks)
		{
			if (track.name == 'BEAT' || track.notes.length <= 0)
				continue;
				
			var ln = track.notes[track.notes.length-1];
			if (ln)
				timeEnd = Math.max(timeEnd, ln.time + ln.duration);
		}

		// Override timeEnd with our song_length INI value if that's present.
		if (this.songInfo.song_length) {
			timeEnd = this.songInfo.song_length / 1000;
		}

		// DEBUG: Log timeEnd... WIP fix to early cutoff (might not be possible)
		// console.log(`timeEnd is currently ${timeEnd}`)

		// Next, calculate our beats
		var bpmIdx = 0;
		var curTick = 0;					// In ticks!
		var curBPM = (this.bpms.length > 0) ? this.bpms[0][1] : 120;
		
		this.realBeats = [];
		this.beats = [0];
		
		// TPB (Ticks Per Beat) = PPQ
		var TPB = this.midi.header.PPQ || 480;
		
		// Calculate timesignatures, super easy
		this.timesigs = [];
		var timesigSteps = [];
		
		for (const ts of this.midi.header.timeSignatures)
		{
			var absTime = this.midi.header.ticksToSeconds(ts.ticks);
			this.timesigs.push([absTime, ts.timeSignature]);
			
			timesigSteps.push([absTime, ts.timeSignature]);
		}
		
		if (this.timesigs.length <= 0)
		{
			cons.warn("MIDI has no timesigs! Assuming 4/4...");
			
			timesigSteps.push([0, [4, 4]]);
			this.timesigs.push([0, [4, 4]]);
		}
		
		// Create a stepper list for BPM's with timesigs attached
		var bpmSteps = [];
		var curTS = this.timesigs[0][1];
		curBPM = 120;
		
		if (this.bpms.length > 0)
		{
			for (var b=0; b<this.bpms.length; b++)
			{
				var bpm = {time: this.bpms[b][0], bpm: this.bpms[b][1], timesig: timesigSteps[0][1]};
					
				// Find first timesig that exceeds the time
				for (const ts of timesigSteps)
				{
					if (bpm.time >= ts[0])
						bpm.timesig = ts[1]
					else
						break;
				}
				
				bpm.time = this.midi.header.secondsToTicks(bpm.time);
				bpmSteps.push(bpm);
			}
			
			curBPM = bpmSteps[0].bpm;
			curTS = bpmSteps[0].timesig;
		}
		else
		{
			cons.warn("Song has no tempo changes! Assuming 120BPM...");
			cons.log("(Something probably went wrong!)");
		}
		
		var endTicks = this.midi.header.secondsToTicks(timeEnd);
		
		while (curTick < endTicks)
		{
			var beatTime = this.midi.header.ticksToSeconds(curTick);
			
			if (beatTime > 0)
				this.beats.push(beatTime);
			
			// Exceeded the time of the next BPM marker, START THERE
			if (bpmSteps.length > 0 && bpmIdx+1 < bpmSteps.length)
			{
				var nextBPMTime = bpmSteps[bpmIdx+1].time;
				if (curTick >= nextBPMTime)
				{
					bpmIdx ++;
					curBPM = bpmSteps[bpmIdx].bpm;
					curTS = bpmSteps[bpmIdx].timesig;
				}
			}

			// How many ticks are between the current beats?
			// We don't care about the total measure, just beats
			
			var perTPB = TPB * (4 / curTS[1]);
			curTick += perTPB;

			// DEBUG: Log curTick and last beat line... WIP fix to early cutoff (might not be possible)
			// console.log(`curTick is currently ${curTick}`)
			// console.log(`Last beat line time: ${this.beats[this.beats.length - 1]}`)
		}
		
		// Add final beat onto the end!
		// This prevents song cutting off
		this.beats.push(this.midi.header.ticksToSeconds(curTick));
	}
	
	//-----------------------
	// Detect Auto-HOPO for the next note in sequence
	//-----------------------
	
	AutoHOPONext(noteTrack, idx)
	{
		// This is our last note, we don't have a next!
		if (idx+1 >= noteTrack.length)
			return false;
			
		// We're within 170 ticks of our last note
		var curNote = noteTrack[idx];
		var nextNote = noteTrack[idx+1];
        
        // Do not use HOPO if current note is forced strum.
        if (curNote.force_strum)
            return false;
		
		var curNote_FS = curNote.FretString();
		var nextNote_FS = nextNote.FretString();
		
		// Next note is a chord, no-no
		if (nextNote.frets.length > 1)
			return false;
		
		// Two of the same notes in sequence cannot HOPO
		if (curNote_FS == nextNote_FS)
			return false;
		
		// Within HOPO threshold, all good
		if (Math.abs(nextNote.ticks - curNote.ticks) <= HOPO_THRESHOLD)
			return true;
			
		return false;
	}
	
	//-----------------------
	// Handle extended sustain
	//-----------------------
	
	HandleExtSustain(noteTrack, idx)
	{
		var leftNote = noteTrack[idx];
		var startTime = leftNote.time;
		var curTime = leftNote.time;
		var endTime = leftNote.time + leftNote.length;
		var checkIdx = idx+1;
		
		// This note is probably not a sustain... don't bother with it
		var msLength = leftNote.length * 1000.0;
		if (msLength < 90.0)
			return;
			
		const colorIdx = {'green': 0, 'red': 1, 'yellow': 2, 'blue': 3, 'orange': 4, 'null': 999};
		
		var leftStart = colorIdx[leftNote.LeftMostFret()];
		
		// Travel along the note's length and inspect other notes
		while (curTime < endTime && checkIdx < noteTrack.length)
		{
			var rightNote = noteTrack[checkIdx];

			
			// It's in our sustain!
			if (rightNote.time > startTime && rightNote.time < endTime)
			{
				var rightStart = colorIdx[rightNote.LeftMostFret()];
				
				// At least 1 fret over to the RIGHT from our current note
				if (rightStart > leftStart)
				{
					// Exclude the right fret from the left
					for (const fr of rightNote.frets)
						leftNote.ExcludeFret(fr);
					
					// Exclude the left fret from the right
					for (const fr of leftNote.frets)
					{
						rightNote.ExcludeFret(fr);
					}
				}
			}
			
			checkIdx ++;
			curTime = rightNote.time;
		}
	}
	
	//-----------------------
	// Guess end time based on song data
	//-----------------------
	
	GuessEndTime(res)
	{
		// Does our song INI have a song_length parameter? If so, let's use it
		if (this.songInfo.song_length)
		{
			this.songEndTime = parseInt(this.songInfo.song_length[0]);
			cons.warn("No end event, using time " + this.songEndTime + " from song.ini...");
			return;
		}
		
		cons.warn("No end event, guessing end time from data...");
		
		var longestTime = 0;
		
		// Use last beat
		if (this.beats.length)
			longestTime = Math.max(longestTime, this.beats[this.beats.length-1]);
			
		// Use last note
		for (const key of Object.keys(res.tracks))
		{
			var trk = res.tracks[key];
			for (const dkey of Object.keys(trk.diffs))
			{
				var diff = trk.diffs[dkey].notes;
				
				if (!diff.length)
					continue;
					
				var lastNote = diff[diff.length-1];
				longestTime = Math.max(longestTime, lastNote.time + lastNote.length);
			}
		}
		
		cons.log("  Guessed to be " + longestTime + " seconds...", 'grey');
		
		this.songEndTime = longestTime;
	}
}

module.exports = SongConverter;
