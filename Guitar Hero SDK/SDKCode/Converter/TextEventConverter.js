// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	T E X T   E V E N T   C O N V E R T E R
//		Used for the moment, since main parser doesn't handle these
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const Parser = require('midi-parser-js');

const sectionAliases = require('./SectionAliases.js');

const MessageIDs = ["PHRASE"];

const PhraseIDs = [
	"NULL",
	"OPEN_STRUM_BASS",
	"PRO_GUITAR_SLIDEUP",
	"PRO_GUITAR_SLIDEDOWN",
	"TAPNOTES",
	"HI_HAT_OPEN",
	"HI_HAT_PEDAL",
	"SNARE_RIMSHOT",
	"HI_HAT_SIZZLE",
	"PALM_MUTED",
	"VIBRATO",
	"PRO_GUITAR_HARMONIC",
	"PRO_GUITAR_PINCH_HARMONIC",
	"PRO_GUITAR_BEND",
	"PRO_GUITAR_ACCENT",
	"PRO_GUITAR_POP",
	"PRO_GUITAR_SLAP",
	"YTOM_CYMBAL",
	"BTOM_CYMBAL",
	"GTOM_CYMBAL"
];

const accentColorList = [
    'null',
    'green',
    'red',
    'yellow',
    'blue',
    'orange'
];

const validMiscTracks = [
    'LIGHTSHOW'
];

const ACCENT_TIME_SNAP = 0.03;

//-----------------------
// When detecting unknown SysEx 
// messages, format data correctly
//-----------------------

Parser.customInterpreter = function(msgType, arrayBuffer, metaEventLength) {
	if (msgType !== 15)
		return false;
	
	// Extract SysEx bytes from the buffer
	var buf = arrayBuffer.data.buffer;
	var hexxy = buf.slice(arrayBuffer.pointer-1, arrayBuffer.pointer + 9);
	hexxy = Buffer.from(hexxy);
	
	arrayBuffer.pointer += 9;
	return hexxy;
};

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class TextEventConverter
{
	constructor(converter) 
	{ 
		this.converter = converter; 
		this.midi = Parser.parse(this.converter.buffer);
		
		// Midi tracks
		this.tracks = {};
		
		// Real notes
		// (We parse them here instead of letting
		// the main MIDI handler treat them)
		this.converter.parsedTracks = {};
		
		// Lyrics
		this.converter.lyrics = [];
        
        // Accents
        this.converter.accents = [];
		
		// Create "notes" from our SysEx events
		this.converter.sysEx = {};
		
		this.converter.sections = [];
		this.converter.events = [];
		
		if (!this.midi)
		{
			cons.error("TextEventConverter FAILED, parser could not parse midi!");
			cons.warn("Text events (sections, etc.) will not be added!");
			return;
		}
		
		this.ParseEvents();
	}
	
	//-----------------------
	// Tick to seconds
	//-----------------------
	
	TTS(time)
	{
		return this.converter.midi.header.ticksToSeconds(time);
	}
	
	//-----------------------
	// Parse a SysEx message
	//-----------------------
	
	ParseSysEx(eventOut, event)
	{
		var msgBytes = eventOut.data.slice(2, eventOut.data.length);
		
		if (msgBytes[0] !== 0x50 && msgBytes[1] !== 0x53)
		{
			eventOut.bad = true;
			return;
		}
		
		var msgID = msgBytes[3];
		var diffID = msgBytes[4];
		var phraseID = msgBytes[5];
		var phraseStatus = msgBytes[6];

		var diffString = 'all';
		if (diffID < 255)
		{
			var diffs = ['easy', 'medium', 'hard', 'expert'];
			diffString = diffs[diffID];
		}
		
		eventOut.data = {msg: MessageIDs[msgID] || "PHRASE", diff: diffString, phrase: PhraseIDs[phraseID] || PhraseIDs[0], status: phraseStatus};
	}
	
	//-----------------------
	// Parse text events
	//-----------------------
	
	ParseEvents()
	{
		for (const track of this.midi.track)
		{
			// First event of the track SHOULD be track name
			// (Example: PART VOCALS)
			
			var ev = track.event[0];
            
			if (!ev)
				continue;
			if (ev.type !== 255 && ev.metaType && ev.metaType !== 3)
				continue;

			var trackName = ev.data;
			var trk = {id: trackName, events: []};
			this.tracks[trackName] = trk;
            
			track.event.shift();
			
			var runningTick = 0;
			for (const event of track.event)
			{
				runningTick += event.deltaTime;

				var pushEvent = {time: this.TTS(runningTick), type: event.type, data: event.data, ticks: runningTick};
				
				// SysEx message
				if (event.type == 15)
					this.ParseSysEx(pushEvent, event);
                    
				// String event
				else if (event.type == 255)
				{
					if (trackName !== 'EVENTS' && trackName !== 'PART VOCALS' && trackName !== 'PART DRUMS')
						continue;
				}
					
				if (!pushEvent.bad && pushEvent.data)
					trk.events.push(pushEvent);
			}
		}
		
		// Now that we have all of the parsed data
		// in a readable format, let's apply it to events
		
		this.CreateEvents();
        
		for (const key of Object.keys(this.tracks))
		{
            var tlc = key.toLowerCase();
            var valid = false;
            
            if (tlc.indexOf('part') == 0)
                valid = true;
                
            for (const vt of validMiscTracks)
            {
                if (tlc == vt.toLowerCase())
                {
                    valid = true;
                    break;
                }
            }
            
			if (!valid)
				continue;
				
			var trk = this.tracks[key];
			this.ParseTrackNotes(trk);
			
			if (trk.id == 'PART VOCALS')
				this.CreateLyrics(trk);
            else if (trk.id == 'PART DRUMS')
                this.CreateAccents(trk);
			else
				this.CreateSysExNotes(this.tracks[key]);
		}
	}
	
	//-----------------------
	// Handle all events for a track
	//-----------------------
	
	ParseTrackNotes(track)
	{
		var outTrack = {notes: []};
		
		var noteCache = {};
		
		var lyrics = [];
		
		for (var e=0; e<track.events.length; e++)
		{
			var ev = track.events[e];
			
			switch (ev.type)
			{
				// Text event?
				case 255:
					
					// Lyric
					if (track.id !== 'PART VOCALS')
						continue;

					// In brackets
					if (ev.data[0] == '[' && ev.data.indexOf(']') >= 0)
						continue;
						
					lyrics.push([ev.time, ev.data]);
					
					break;
					
				// Note off, Note on
				// (Note on with velocity of 0 can also end note)
				case 8:
				case 9:
				
					var endNote = false;
					if (ev.type == 8)
						endNote = true;
					else if (ev.type == 9 && ev.data[1] == 0)
						endNote = true;
				
					// Start the note
					if (!endNote)
					{
						var notePitch = ev.data[0];
						noteCache[notePitch] = {time: ev.time, data: ev.data, ticks: ev.ticks};
					}
					
					else
					{
						var notePitch = ev.data[0];

						if (noteCache[notePitch])
						{
							var oldNote = noteCache[notePitch];
							var noteLen = ev.time - oldNote.time;
							
							outTrack.notes.push({
								time: oldNote.time,
								ticks: oldNote.ticks,
								duration: noteLen,
								midi: oldNote.data[0]
							});
							
							delete noteCache[notePitch];
						}
					}
					
					break;
			}
		}
		
		// Apply lyrics to notes
		if (lyrics.length > 0)
		{
			for (var n=0; n<outTrack.notes.length; n++)
			{
				var note = outTrack.notes[n];
				
				// Not in valid note range
				if (note.midi <= 35 || note.midi >= 85)
					continue;

				// Loop through all lyrics
				for (const lyric of lyrics)
				{
					var timeDiff = Math.abs(lyric[0] - note.time);
					
					if (timeDiff <= 0.01)
					{
						var ltext = lyric[1];
						note.lyric = ltext;
						
						// If this is a plus lyric, tell the note it carries on
						if ((ltext[0] == '+' || ltext[ltext.length-1] == '+') && n > 0)
							outTrack.notes[n-1].lyric_extended = true;
						
						break;
					}
				}
			}
		}
		
		this.converter.parsedTracks[track.id] = outTrack;
	}
	
	//-----------------------
	// Translate a section name into real section
	//-----------------------
	
	TranslateSection(secName)
	{
		var key = secName.toLowerCase();
		var alias = sectionAliases[key];
		
		if (alias)
			return alias;
		
		// Try with _prc
		key = "prc_" + key;
		var alias = sectionAliases[key];
		
		if (alias)
			return alias;
		
		return secName;
	}
	
	//-----------------------
	// Create events
	//-----------------------
	
	CreateEvents()
	{
		var trk = this.tracks['EVENTS'];
		if (!trk)
			return;
				
		for (const ev of trk.events)
		{
			if (ev.type !== 255)
				continue;
				
			if (ev.data.indexOf("[") == 0)
				ev.data = ev.data.slice(1, ev.data.length-1);
					
			// Extract section from data
			if (ev.data.toLowerCase().indexOf('section') >= 0)
			{
				var spl = ev.data.split(" ");
				spl.shift();
				
				var secName = spl.join(" ");
				secName = this.TranslateSection(secName);
				this.converter.sections.push([ev.time, secName]);
			}
			
			// Starts with prc, this can also be a section!
			else if (ev.data.toLowerCase().indexOf('prc_') == 0)
			{
				var spl = ev.data.split("_");
				spl.shift();
				
				var secName = spl.join("_");
				secName = this.TranslateSection(secName);
				this.converter.sections.push([ev.time, secName]);
			}
			
			// Total end of song!
			if (ev.data.toLowerCase() == 'end')
				this.converter.songEndTime = ev.time;
		}
		
		if (this.converter.songEndTime < 0)
			cons.error("CRITICAL: No 'end' event was specified in the midi");
	}
	
	//-----------------------
	// Create lyrics
	//-----------------------
	
	CreateLyrics(track)
	{
		var lyrics = [];
		
		for (const event of track.events)
		{
			if (event.type !== 255)
				continue;
				
			// In brackets
			if (event.data[0] == '[' && event.data.indexOf(']') >= 0)
				continue;
				
			lyrics.push([event.time, event.data, event.tick]);
		}
		
		this.converter.lyrics = lyrics;
	}
    
    //-----------------------
	// Create accents
	//-----------------------
    
    CreateAccents(track)
    {
        var accents = [];
        
        for (const event of track.events)
        {
            if (event.type !== 255)
                continue;
                
            if (event.data.length == 3 && event.data[0] == '[' && event.data[2] == ']')
            {
                var num = parseInt(event.data[1]);
                
                // 1-5 only
                if (num > 0 && num < 6)
                {
                    // See if accents exist at this time.
                    var existed = false;
                    
                    for (var a=0; a<accents.length; a++)
                    {
                        var gap = Math.abs(accents[a].time - event.time);
                        if (gap <= ACCENT_TIME_SNAP)
                        {
                            accents[a].frets.push(accentColorList[num]);
                            existed = true;
                            break;
                        }
                    }
                    
                    if (!existed)
                    {
                        accents.push({
                            time: event.time,
                            frets: [accentColorList[num]]
                        });
                    }
                }
            }
        }
        
        // Sort by time
        
        accents = accents.sort((a, b) => {
            return a.time - b.time;
        });
        
        if (accents)
            cons.log(accents.length + " accents detected.", 'yellow');
        
        this.converter.accents = accents;
    }
	
	//-----------------------
	// Create SysEx notes for a track
	//-----------------------
	
	CreateSysExNotes(track)
	{
		var finalEvents = [];
		var currentEvents = {};
		
		for (const event of track.events)
		{
			if (!event.data || !event.data.phrase)
				continue;
				
			// This event already exists!
			var cur = currentEvents[event.data.phrase];
			if (cur)
			{
				cur.length = event.time - cur.time;
				delete currentEvents[event.data.phrase];
			}
			else
			{
				event.data.time = event.time;
				currentEvents[event.data.phrase] = event.data;
				
				finalEvents.push(currentEvents[event.data.phrase]);
			}
		}

		var instr = this.converter.InstrumentFromPart(track.id);
		this.converter.sysEx[instr] = finalEvents;
	}
}

module.exports = TextEventConverter;
