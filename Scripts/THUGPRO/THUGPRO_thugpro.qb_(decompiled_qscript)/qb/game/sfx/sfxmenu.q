SCRIPT SkipTrack 
	SkipMusicTrack 
ENDSCRIPT

SCRIPT SetCDToMusic 
	SetMusicMode 1 
	printf "SetMusicMode 1 (Soundtrack)" 
ENDSCRIPT

SCRIPT SetCDToAmbient 
	SetMusicMode 0 
	printf "SetMusicMode 0 (Ambient)" 
ENDSCRIPT

SCRIPT PlaySongsRandomly 
	SetRandomMode 1 
ENDSCRIPT

SCRIPT PlaySongsInOrder 
	SetRandomMode 0 
ENDSCRIPT


