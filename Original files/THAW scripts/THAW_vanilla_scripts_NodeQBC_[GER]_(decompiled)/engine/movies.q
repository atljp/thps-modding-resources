
script ingame_play_movie 
    ingame_pre_movie_cleanup
    MemPushContext \{ 0 }
    StartDelaySystemUI
    if GotParam \{ movies }
        GetArraySize <movies>
        index = 0
        begin 
        PlayMovie (<movies> [ <index> ])
        index = (<index> + 1)
        repeat <array_size>
    else
        PlayMovie <...> 
    endif
    StopDelaySystemUI
    MemPopContext
    ingame_post_movie_cleanup <...> 
endscript

script ingame_pre_movie_cleanup 
    DisplayLoadingScreen \{ blank }
    if InFrontend
        KillSkaterCamAnim \{ all }
    endif
    pausegame
    PauseSpawnedScripts
    cleanup_before_changing_level <...> 
    cleanup \{ preserve_skaters }
    KillMessages
endscript

script ingame_post_movie_cleanup \{ loading_screen = blank }
    MemPushContext \{ 0 }
    DisplayLoadingScreen <loading_screen>
    MemPopContext
    if NOT GotParam \{ level }
        GetCurrentLevel
    endif
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    change_level level = <level> from_movie
    restore_start_key_binding
endscript
