
script RefreshCurrentZones 
    SpawnScriptLater \{ reload_zones }
endscript

script reload_zones 
    PauseSkaters
    StopMusic
    StopAudioStreams
    wait \{ 2 gameframes }
    SetSaveZoneNameToCurrent
    SetEnableMovies \{ 1 }
    SetMusicLooping \{ 0 }
    kill_blur
    BeginUnloadAllZones
    wait \{ 2 gameframe }
    EndUnloadAllZones
    GetSaveZoneName
    StartPakLoad zone = <save_zone>
    FinishPendingZoneLoads
    if NOT (view_mode = 1)
        UnpauseSkaters
    endif
endscript

script DisplayAnimCacheState 
    priority_ranges = [
        {range = (0.0, 10.0) bar = CachedRange0}
        {range = (11.0, 50.0) bar = CachedRange1}
        {range = (51.0, 100.0) bar = CachedRange2}
        {range = (101.0, 500.0) bar = CachedRange3}
        {range = (501.0, 1000.0) bar = CachedRange4}
        {range = (1001.0, 10000.0) bar = CachedRange5}
        {range = (10001.0, -1.0) bar = CachedRange6}
    ]
    GetArraySize priority_ranges
    if ObjectExists id = AnimCacheAnchor
        KillSpawnedScript name = UpdateAnimCacheState
        DestroyScreenElement id = AnimCacheAnchor
        return 
    endif
    if NOT ObjectExists id = AnimCacheAnchor
        SetScreenElementLock id = root_window Off
        <root_pos> = (<display_offset> + (25.0, 40.0))
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = AnimCacheAnchor
            Pos = <root_pos>
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = AnimCacheAnchor
            id = PriCachedText
            Pos = (0.0, -30.0)
            text = 'Animation Cache Priority Distribution:'
            font = dialog
            rgba = [ 120 120 120 255 ]
            just = [ left top ]
        }
        CreateScreenElement {
            type = TextElement
            parent = AnimCacheAnchor
            id = PriCachedLine
            Pos = (0.0, -21.0)
            text = '-----------------------------------------'
            font = dialog
            rgba = [ 120 120 120 255 ]
            just = [ left top ]
        }
        <i> = 0
        begin 
        <bar_id> = ((<priority_ranges> [ <i> ]).bar)
        <bar_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
        <bar_rgba> = [ 255 0 0 50 ]
        SetArrayElement arrayName = bar_rgba index = 0 newValue = (255 - (<i> * 30))
        SetArrayElement arrayName = bar_rgba index = 1 newValue = ((<i> * 30))
        CreateScreenElement {
            type = SpriteElement
            parent = AnimCacheAnchor
            id = <bar_id>
            Pos = <bar_pos>
            Scale = (50.0, 5.0)
            texture = white
            font = dialog
            rgba = <bar_rgba>
            just = [ left top ]
        }
        <i> = (<i> + 1)
        repeat <array_size>
        <txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
        CreateScreenElement {
            type = TextElement
            parent = AnimCacheAnchor
            id = NumCachedText
            Pos = <txt_pos>
            text = '-- Total Cached Anims:'
            font = dialog
            rgba = [ 120 0 120 255 ]
            just = [ left top ]
        }
        <i> = (<i> + 1)
        <txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
        CreateScreenElement {
            type = TextElement
            parent = AnimCacheAnchor
            id = HitsCachedText
            Pos = <txt_pos>
            text = '-- Cache Hits:'
            font = dialog
            rgba = [ 20 255 20 255 ]
            just = [ left top ]
        }
        <i> = (<i> + 1)
        <txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
        CreateScreenElement {
            type = TextElement
            parent = AnimCacheAnchor
            id = MissesCachedText
            Pos = <txt_pos>
            text = '-- Cache Misses:'
            font = dialog
            rgba = [ 255 20 20 255 ]
            just = [ left top ]
        }
        SetScreenElementLock id = root_window on
    endif
    SpawnScriptLater UpdateAnimCacheState params = { priority_ranges = <priority_ranges> }
endscript

script UpdateAnimCacheState 
    begin 
    if ObjectExists id = AnimCacheAnchor
        GetArraySize <priority_ranges>
        <i> = 0
        begin 
        GetAnimCacheState priority_range = ((<priority_ranges> [ <i> ]).range)
        <d> = (((<priority_ranges> [ <i> ]).range).(1.0, 0.0))
        <e> = (((<priority_ranges> [ <i> ]).range).(0.0, 1.0))
        <bar_id> = ((<priority_ranges> [ <i> ]).bar)
        <new_scale> = ((1.0, 5.0) + (<priority_count> * (10.0, 0.0)))
        <bar_id> ::DoMorph Scale = <new_scale> time = 0.2000
        <i> = (<i> + 1)
        repeat <array_size>
        FormatText textname = num_cached_text '-- Total cached anims: %g' g = <num_cached>
        FormatText textname = hits_cached_text '-- Cache Hits: %g' g = <cache_hits>
        FormatText textname = misses_cached_text '-- Cache Misses: %g' g = <cache_misses>
        SetScreenElementProps id = NumCachedText text = <num_cached_text>
        SetScreenElementProps id = HitsCachedText text = <hits_cached_text>
        SetScreenElementProps id = MissesCachedText text = <misses_cached_text>
    endif
    wait 1 frame
    repeat 
endscript

script launch_toggle_animcache_state \{ display_offset = (0.0, 0.0) }
    DisplayAnimCacheState <...> 
endscript
