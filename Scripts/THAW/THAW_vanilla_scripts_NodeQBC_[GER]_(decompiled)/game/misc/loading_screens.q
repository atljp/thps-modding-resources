
script startup_loading_screen 
    intro_movie = 'movies\intro'
    StartDelaySystemUI
    if NOT Bootstrap
        if IsPs2
            if cd
                DisplayLoadingScreen blank
                PlayMovie 'movies\atvi'
                PlayMovie <intro_movie>
            endif
        endif
    endif
    if IsXenon
        if cd
            PlayMovie 'movies\atvi'
            PlayMovie <intro_movie>
        endif
    endif
    if IsXbox
        if cd
            PlayMovie 'movies\atvi'
            PlayMovie <intro_movie>
        endif
    endif
    if isPC
        PlayMovie 'movies\New_Aspyr_firelogo'
        PlayMovie 'movies\atvi'
        PlayMovie <intro_movie>
    endif
    if IsNGC
        if cd
            PlayMovie 'movies\atvi'
            PlayMovie <intro_movie>
        endif
    endif
    if Bootstrap
        DisplayLoadingScreen 'loadscrn_demo'
    else
        if IsXenon
            DisplayLoadingScreen 'loadscrn_x'
        endif
        if ((IsXbox)|| (isPC))
            DisplayLoadingScreen 'loadscrn_x'
        endif
        if IsNGC
            DisplayLoadingScreen 'loadscrn'
        endif
        if IsPs2
        endif
    endif
    StopDelaySystemUI
endscript
ANY_LEVEL_LOADED_YET = 0
loadscreen_last_game_mode = career
alt_loading_screen_in_use = 0

script get_level_load_time 
    GetLevelStructureName level = <level>
    level_struct = <level_structure_name>
    if IsXbox
        if StructureContains structure = <level_struct> loading_time_xbox
            time = (<level_struct>.loading_time_xbox)
        else
            time = ((<level_struct>.loading_time)* 0.6000)
        endif
    else
        time = (<level_struct>.loading_time)
    endif
    return level_load_time = <time>
endscript

script parked_loading_screen_show 
    if NOT IsXbox
        return 
    endif
    if NOT LevelIs load_sk5ed
        if NOT LevelIs load_sk5ed_gameplay
            return 
        endif
    endif
    switch <level>
        case load_sk5ed
        case load_sk5ed_gameplay
        GetEditorTheme
        CAP_Generate_LevelStructureName theme = <theme>
        level_struct = <structure_name>
        if ChecksumEquals a = <level> b = load_sk5ed
            Screen = 'loadscrn_editor_x'
        else
            Screen = 'loadscrn_created'
        endif
        default 
        GetLevelStructureName level = <level>
        level_struct = <level_structure_name>
        Screen = 'loadscrn_generic'
    endswitch
    if NOT GotParam Screen
        Screen = (<level_struct>.loading_screen)
        if NOT GotParam Screen
            Screen = 'loadscrn_editor_x'
        endif
    endif
    get_level_load_time level = <level>
    Sk6Ed_GetParkEdExtraLoadtime
    printstruct <...> 
    DisplayLoadingScreen <Screen> (<level_load_time> + <ExtraTime>)
    change alt_loading_screen_in_use = 1
endscript

script load_level_handle_loading_screen 
    if IsTrue alt_loading_screen_in_use
        change alt_loading_screen_in_use = 0
        return 
    endif
    if IsXbox
        if GotParam loading_time_xbox
            <loading_time> = <loading_time_xbox>
        else
            <loading_time> = (<loading_time> * 0.6000)
        endif
    endif
    GetGameMode
    <loading_screen> = 'loadscrn_generic'
    if IsTrue bootstrap_build
        <loading_screen> = 'loadscrn_demo_controls'
        <loading_time> = 27
    else
        switch <load_script>
            case Load_Z_MainMenu
            if (ANY_LEVEL_LOADED_YET = 1)
                if IsPs2
                    switch (loadscreen_last_game_mode)
                        case career
                        <random_screen_num> = Random (@ 1 @ 3 @ 4 @ 5 @ 7)
                        case classic
                        <random_screen_num> = Random (@ 1 @ 3 @ 4 @ 5)
                        case singlesession
                        <random_screen_num> = Random (@ 1 @ 3 @ 4 @ 5 @ 7)
                        case net
                        <random_screen_num> = Random (@ 1 @ 3 @ 5 @ 7)
                    endswitch
                else
                    switch (loadscreen_last_game_mode)
                        case career
                        <random_screen_num> = Random (@ 1 @ 3 @ 5 @ 7)
                        case classic
                        <random_screen_num> = Random (@ 1 @ 3 @ 5)
                        case singlesession
                        <random_screen_num> = Random (@ 1 @ 3 @ 5 @ 7)
                        case net
                        <random_screen_num> = Random (@ 1 @ 3 @ 5 @ 7)
                    endswitch
                endif
                if GotParam random_screen_num
                    FormatText textname = loading_screen 'loadscrn_generic_%i' i = <random_screen_num>
                endif
            endif
            case load_default
            case Load_EmptyDefault
            case Load_TestLevel
            printf 'Generic loading screen'
            default 
            switch <gamemode>
                case classic
                if GotParam loading_screen_classic
                    <loading_screen> = <loading_screen_classic>
                else
                    <loading_screen> = <loading_screen_default>
                endif
                default 
                if GameModeEquals is_cat
                    if IsXbox
                        <loading_screen> = 'loadscrn_trick_x'
                    else
                        if IsXenon
                            <loading_screen> = 'loadscrn_trick_x'
                        else
                            if IsNGC
                                <loading_screen> = 'loadscrn_trick_ngc'
                            else
                                <loading_screen> = 'loadscrn_trick'
                            endif
                        endif
                    endif
                else
                    <loading_screen> = <loading_screen_default>
                    if EnteringNetGame
                        <gamemode> = net
                        if GotParam loading_screen_multi
                            <loading_screen> = <loading_screen_multi>
                        else
                            <loading_screen> = <loading_screen_default>
                        endif
                    endif
                    if InSplitScreenGame
                        if GotParam loading_screen_multi
                            <loading_screen> = <loading_screen_multi>
                        else
                            <loading_screen> = <loading_screen_default>
                        endif
                    endif
                endif
            endswitch
        endswitch
    endif
    DisplayLoadingScreen <loading_screen> <loading_time>
    change ANY_LEVEL_LOADED_YET = 1
    change loadscreen_last_game_mode = <gamemode>
endscript

script bootstrap_displayscreen Screen = 'loadscrn_demo_controls'
    if ObjectExists id = startup_menu
        DestroyScreenElement id = startup_menu
    endif
    if ObjectExists id = ns_rules
        DestroyScreenElement id = ns_rules
    endif
    make_new_menu menu_id = screen_menu
    SetScreenElementProps {
        id = root_window
        event_handlers = [{ pad_start exit_screen_menu }]
        replace_handlers
    }
    SetScreenElementProps {
        id = screen_menu
        event_handlers = [{ pad_start exit_screen_menu }
            { pad_choose exit_screen_menu }
            { pad_back exit_screen_menu }
            { pad_circle exit_screen_menu }
            { pad_square exit_screen_menu }
        ]
        replace_handlers
    }
    FireEvent type = focus target = screen_menu
    DisplayLoadingScreen <Screen>
endscript
