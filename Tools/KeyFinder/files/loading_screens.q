

script startup_loading_screen 
    intro_movie = 'movies\intro'
    if IsForeignLanguage
        intro_movie = 'movies\introf'
    endif
    if NOT Bootstrap
        if IsPs2
            if cd
                DisplayLoadingScreen blank
                PlayMovie 'movies\atvi'
                PlayMovie 'movies\nslogo'
                PlayMovie 'movies\Beenox_Shift'
                PlayMovie <intro_movie>
            endif
        endif
    endif
    if IsXbox
        if cd
            if NOT IsInternetGameHost
                if NOT IsJoiningInternetGame
                    PlayMovie 'movies\Intel_intro'
                    PlayMovie 'movies\Dolby_Digital'
                    PlayMovie 'movies\atvi'
                    PlayMovie 'movies\nslogo'
                    PlayMovie 'movies\Beenox_Shift'
                    PlayMovie <intro_movie>
                endif
            endif
        endif
    endif
    if IsNGC
        if cd
            PlayMovie 'movies\atvi'
            PlayMovie 'movies\nslogo'
            PlayMovie 'movies\Beenox_Shift'
            PlayMovie <intro_movie>
        endif
    endif
    if Bootstrap
        DisplayLoadingScreen 'loadscrn_demo'
    else
        if IsXbox
            DisplayLoadingScreen 'loadscrn'
        endif
        if IsNGC
            DisplayLoadingScreen 'loadscrn_ngc'
        endif
        if IsPs2
        endif
    endif
endscript

ANY_LEVEL_LOADED_YET = 0
loadscreen_last_game_mode = career
parked_loading_screen_in_use = 0

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
        case load_tr
        level_struct = Level_TR
        case load_bo
        level_struct = Level_BO
        case load_ba
        level_struct = Level_BA
        case load_be
        level_struct = Level_BE
        case load_au
        level_struct = Level_AU
        case load_NO
        level_struct = Level_NO
        case load_st
        level_struct = Level_ST
        case load_se
        level_struct = Level_SE
        case load_se2
        level_struct = Level_SE2
        case load_dj
        level_struct = Level_DJ
        case load_ap
        level_struct = Level_AP
        case load_ca
        level_struct = Level_CA
        case load_ph
        level_struct = Level_PH
        case load_la
        level_struct = Level_LA
        case load_sc
        level_struct = Level_SC
        case load_mainmenu
        level_struct = level_Mainmenu
        case load_sk5ed
        case load_sk5ed_gameplay
        GetEditorTheme
        GenerateLevelStructureNameFromTheme theme = <theme>
        level_struct = <structure_name>
        if ChecksumEquals a = <level> b = load_sk5ed
            Screen = 'loadscrn_editor_x'
        else
            Screen = 'loadscrn_created'
        endif
        default 
        
        script_assert 'UPDATE THE SWITCH IN parked_loading_screen_show!'
        Screen = 'loadscrn_generic'
    endswitch
    if NOT GotParam Screen
        Screen = (<level_struct>.loading_screen)
        if NOT GotParam Screen
            Screen = 'loadscrn_editor_x'
        endif
    endif
    time = (<level_struct>.loading_time_xbox)
    if NOT GotParam time
        time = ((<level_struct>.loading_time)* 0.6000)
    endif
    Sk6Ed_GetParkEdExtraLoadtime
    
    DisplayLoadingScreen <Screen> (<time> + <ExtraTime>)
    change parked_loading_screen_in_use = 1
endscript


script parked_loading_screen_clear 
    change parked_loading_screen_in_use = 0
endscript


script load_level_handle_loading_screen 
    if IsTrue parked_loading_screen_in_use
        parked_loading_screen_clear
        return 
    endif
    if IsXbox
        if GotParam loading_time_xbox
            <loading_time> = <loading_time_xbox>
        else
            <loading_time> = (<loading_time> * 0.6000)
        endif
    else
        if (ANY_LEVEL_LOADED_YET = 0)
            <loading_time> = (<loading_time> + 0)
        endif
    endif
    GetGameMode
    if IsTrue bootstrap_build
        <loading_screen> = 'loadscrn_demo_controls'
        <loading_time> = 27
    else
        if GotParam loading_screen
            if EnteringNetGame
                <gamemode> = net
                if OnServer
                    if IsXbox
                        <loading_screen> = 'loadscrn_system_link_x'
                    else
                        <loading_screen> = 'loadscrn_Online'
                    endif
                else
                    if IsXbox
                        <loading_screen> = 'loadscrn_system_x'
                    else
                        <loading_screen> = 'loadscrn_Online2'
                    endif
                endif
            else
                if InSplitScreenGame
                    <loading_screen> = 'loadscrn_2player'
                else
                    switch <load_script>
                        case load_mainmenu
                        if (ANY_LEVEL_LOADED_YET = 1)
                            if IsPs2
                                switch (loadscreen_last_game_mode)
                                    case career
                                    <random_screen_num> = Random (@ 1 @ 3 @ 4 @ 5 @ 6 @ 7)
                                    case classic
                                    <random_screen_num> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6)
                                    case singlesession
                                    <random_screen_num> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7)
                                    case net
                                    <random_screen_num> = Random (@ 1 @ 2 @ 3 @ 5 @ 6 @ 7)
                                    case creategoals
                                    <random_screen_num> = Random (@ 2 @ 3 @ 4 @ 7)
                                endswitch
                            else
                                switch (loadscreen_last_game_mode)
                                    case career
                                    <random_screen_num> = Random (@ 1 @ 3 @ 5 @ 6 @ 7)
                                    case classic
                                    <random_screen_num> = Random (@ 1 @ 2 @ 3 @ 5 @ 6)
                                    case singlesession
                                    <random_screen_num> = Random (@ 1 @ 2 @ 3 @ 5 @ 6 @ 7)
                                    case net
                                    <random_screen_num> = Random (@ 1 @ 2 @ 3 @ 5 @ 6 @ 7)
                                    case creategoals
                                    <random_screen_num> = Random (@ 2 @ 3 @ 7)
                                endswitch
                            endif
                            if GotParam random_screen_num
                                FormatText textname = loading_screen 'loadscrn_generic_%i' i = <random_screen_num>
                            endif
                        endif
                        case load_default
                        case Load_EmptyDefault
                        case Load_TestLevel
                        
                        default 
                        if NOT StringEquals a = <loading_screen> b = 'loadscrn_generic'
                            switch <gamemode>
                                case career
                                GetCurrentChapterInfo
                                if (<load_script> = load_se)
                                    level = load_se
                                endif
                                if (<load_script> = <level>)
                                    <loading_screen> = (<loading_screen> + '_story')
                                endif
                                case classic
                                <loading_screen> = (<loading_screen> + '_classic')
                                default 
                            endswitch
                        endif
                    endswitch
                    if (launch_to_createatrick = 1)
                        if IsXbox
                            <loading_screen> = 'loadscrn_trick_x'
                        else
                            if IsNGC
                                <loading_screen> = 'loadscrn_trick_ngc'
                            else
                                <loading_screen> = 'loadscrn_trick'
                            endif
                        endif
                    endif
                endif
            endif
        else
            <loading_screen> = 'loadscrn_generic'
            RemoveParameter loading_time
        endif
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

