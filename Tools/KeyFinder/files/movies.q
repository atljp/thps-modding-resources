

script playmovie_script_temp 
endscript

play_mainmenu_attract_movie = 1

script playmovie_script 
    <anims_unloaded> = 0
    <parts_pre_unloaded> = 0
    <temp_pre_unloaded> = 0
    if LevelIs load_mainmenu
        if (play_mainmenu_attract_movie = 0)
            return 
        endif
        PauseObjects
        <anims_unloaded> = 1
        
        if IsNGC
            if InPreFile 'skaterparts_temp.pre'
                UnloadPreFile 'skaterparts_temp.pre'
                <temp_pre_unloaded> = 1
            endif
        else
            if InPreFile 'skaterparts.pre'
                UnloadPreFile 'skaterparts.pre'
                <parts_pre_unloaded> = 1
            endif
            if InPreFile 'skaterparts_temp.pre'
                UnloadPreFile 'skaterparts_temp.pre'
                <temp_pre_unloaded> = 1
            endif
        endif
    endif
    MemPushContext 0
    PlayMovie <...> 
    if IsXbox
        <time> = 6.0
    else
        <time> = 4.500
    endif
    if NOT IsNGC
        if LevelIs load_mainmenu
            DisplayLoadingScreen 'loadscrn_generic' <time>
        endif
    endif
    MemPopContext
    if (<anims_unloaded> = 1)
        
        UnpauseObjects
    endif
    if (<parts_pre_unloaded> = 1)
        if NOT LevelIs load_mainmenu
            script_assert 'Can only unload skaterparts/play movies from skateshop (mainmenu) level'
        endif
        if NOT IsNGC
            LoadPreFile 'skaterparts.pre'
        endif
    endif
    if (<temp_pre_unloaded> = 1)
        if NOT IsNGC
            LoadPreFile 'skaterparts_temp.pre'
        endif
    endif
    if (<temp_pre_unloaded> = 1)
        if IsNGC
            LoadPreFile 'skaterparts_temp.pre' use_bottom_up_heap
        endif
    endif
    if LevelIs load_mainmenu
        hideloadingscreen
    endif
endscript


script ingame_play_movie 
    ingame_pre_movie_cleanup
    MemPushContext 0
    if GotParam movies
        GetArraySize <movies>
        index = 0
        begin 
        PlayMovie (<movies> [ <index> ])
        index = (<index> + 1)
        repeat <array_size>
    else
        PlayMovie <...> 
    endif
    MemPopContext
    ingame_post_movie_cleanup <...> 
endscript


script ingame_pre_movie_cleanup 
    DisplayLoadingScreen blank
    GoalManager_LevelUnload
    cleanup preserve_skaters
    KillMessages
endscript


script ingame_post_movie_cleanup loading_screen = blank
    MemPushContext 0
    DisplayLoadingScreen <loading_screen>
    MemPopContext
    if NOT GotParam level
        GetCurrentLevel
    endif
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    change_level level = <level>
    restore_start_key_binding
endscript

