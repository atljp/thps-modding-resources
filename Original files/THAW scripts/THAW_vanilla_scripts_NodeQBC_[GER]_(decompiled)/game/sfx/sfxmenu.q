
script skiptrack 
    SkipMusicTrack
endscript

script SetCDToMusic 
    SetMusicMode \{ 1 }
    printf \{ 'SetMusicMode 1 (Soundtrack)' }
endscript

script SetCDToAmbient 
    SetMusicMode \{ 0 }
    printf \{ 'SetMusicMode 0 (Ambient)' }
endscript

script PlaySongsRandomly 
    SetRandomMode \{ 1 }
endscript

script PlaySongsInOrder 
    SetRandomMode \{ 0 }
endscript
