dont_unhide_loading_screen = 0
in_cinematic_sequence = 0

script Game_Update 
    GoalManager_UpdateAllGoals
endscript


script load_requested_level 
    GetCurrentLevel
    LoadLevel level = <level>
endscript


script InitializeGameFlow 
    load_requested_level
    StandardGameFlow
endscript


script ChangeLevelGameFlow 
    change FirstTimeInSplitscreen = 1
    if NOT IsObserving
        skater ::SetCustomRestart Clear
    endif
    load_requested_level
    if NOT InSplitScreenGame
        ResetSkaters
    endif
    if InNetGame
        if NOT GameModeEquals is_lobby
            SetGameType netlobby
            SetCurrentGameType
        endif
        if OnServer
            GetPreferenceChecksum pref_type = network team_mode
            switch <checksum>
                case teams_none
                SetNumTeams 0
                
                case teams_two
                SetNumTeams 2
                
                case teams_three
                SetNumTeams 3
                
                case teams_four
                SetNumTeams 4
                
            endswitch
        endif
    endif
    begin 
    if SkatersAreReady
        break 
    endif
    wait 1 gameframe
    repeat 
    SetScreenModeFromGameMode
    StandardGameFlow
endscript


script GameFlow_Startup 
    if NOT InNetGame
        kill_panel_messages
    endif
    goal_panel_reset_queue
    if InSplitScreenGame
        if VibrationIsOn 0
            VibrationOff 0
            turn_vibration_back_on = 1
        endif
        if VibrationIsOn 1
            VibrationOff 1
            turn_player2_vibration_back_on = 1
        endif
    endif
    if InNetGame
        begin 
        wait 1 gameframe
        if SkatersAreReady
            break 
        endif
        repeat 120
        begin 
        if SkatersAreReady
            dialog_box_exit
            break 
        endif
        if NOT SkatersAreReady
            if NOT ScreenElementExists id = dialog_box_anchor
                if NOT ScreenElementExists id = quit_dialog_anchor
                    hideloadingscreen
                    exit_pause_menu
                    create_dialog_box {Title = net_status_msg
                        text = net_message_waiting
                        buttons = [{text = 'Quit' pad_choose_script = quit_network_game}
                        ]
                        no_animate
                    }
                endif
            endif
        endif
        wait 1 gameframe
        repeat 
    else
        begin 
        wait 1 gameframe
        if SkatersAreReady
            break 
        endif
        repeat 
    endif
    if GotParam turn_vibration_back_on
        wait 2 gameframes
        VibrationOn 0
    endif
    if GotParam turn_player2_vibration_back_on
        if NOT GotParam turn_vibration_back_on
            wait 2 gameframes
        endif
        VibrationOn 1
    endif
    RestartLevel
    InitializeSkaters
    KillMessages
    PauseStream 0
    if InNetGame
        if GameModeEquals is_lobby
            if OnServer
                server_enter_free_skate
            else
                if ishost
                    server_enter_free_skate
                endif
                client_enter_free_skate
            endif
            if InInternetMode
                if OnServer
                    PostGame
                endif
            endif
        endif
    endif
    if NOT InNetGame
        ReinsertSkaters
    endif
    SetScreenModeFromGameMode
    if InMultiPlayerGame
        destroy_panel_stuff
        create_panel_stuff
    endif
    if GameModeEquals is_horse
        StartHorse
    endif
    if CustomParkMode editing
        SetActiveCamera id = parked_cam
    endif
    create_menu_camera
endscript

dont_restore_start_key_binding = 0

script GameFlow_StartRun 
    
    if NOT LevelIs load_mainmenu
        if GameModeEquals is_singlesession
            GoalManager_SetEndRunType name = trickattack EndOfRun
            GoalManager_EditGoal name = trickattack params = { time = 120 }
        endif
    endif
    if IsXbox
        if InNetGame
            if ProfileLoggedIn
                if AnyBuddyMessagesLeft
                    
                    flash_buddy_message_icon
                endif
            endif
        endif
    endif
    if InSplitScreenGame
        GetSkaterId skater = 0
        <ObjID> ::obj_spawnscript CleanUp_Scuffs
        GetSkaterId skater = 1
        <ObjID> ::obj_spawnscript CleanUp_Scuffs
    else
        if NOT IsObserving
            skater ::obj_spawnscript CleanUp_Scuffs
        endif
    endif
    if NOT LevelIs load_mainmenu
        PlaySkaterCamAnim skater = 0 stop
        ResetSkaters
    else
        SpawnScript main_menu_startup_wait_and_signal_clear
        ResetSkaters node_name = trg_playerrestart RestartWalking
    endif
    if IsCareerMode
        UnsetGlobalFlag flag = PROMPT_FOR_SAVE
    endif
    
    if GameModeEquals is_horse
    else
        SkipMusicTrack
    endif
    if IsCareerMode
        if IsTrue ALWAYSPLAYMUSIC
            PauseMusic 0
        else
            PauseMusic 1
        endif
    else
        PauseMusic 0
    endif
    if GameModeEquals default_time_limit
        ResetClock
    else
    endif
    if GameModeEquals is_horse
        horse_start_run
    endif
    if InNetGame
        if OnServer
        else
            LaunchQueuedScripts
            if IsObserving
                if GameModeEquals is_goal_attack
                    GoalManager_InitializeAllSelectedGoals
                endif
            endif
        endif
    endif
    if NOT (next_level_script = NullScript)
        if (next_level_script = select_sponsor_select_after_movies)
            DisplayLoadingScreen blank
            change dont_unhide_loading_screen = 1
            change dont_restore_start_key_binding = 1
        endif
        SpawnScript next_level_script
        change next_level_script = NullScript
    endif
    <should_check_for_controllers> = 1
    if (<should_check_for_controllers> = 1)
        SpawnScript wait_and_check_for_unplugged_controllers
    endif
    if NOT LevelIs load_mainmenu
        if GameModeEquals is_career
            startcurrentchapter
        endif
        if GameModeEquals is_classic
            classic_mode_play_intro_cams
        endif
        if NOT (dont_restore_start_key_binding = 1)
            restore_start_key_binding
        endif
    endif
    if NOT LevelIs load_mainmenu
        if NOT LevelIs load_cas
            if (launch_to_createatrick = 1)
                pausegame
                change inside_pause = 1
                if MusicIsPaused
                    change music_was_paused = 1
                else
                    change music_was_paused = 0
                endif
                PauseMusicAndStreams 1
                pause_menu_gradient on
                create_pre_cat_menu from_mainmenu
                change check_for_unplugged_controllers = 1
                return 
            endif
        endif
    endif
    if LevelIs load_sk5ed_gameplay
        parked_set_tod
    else
        if InMultiPlayerGame
        endif
    endif
endscript


script GameFlow_PlayRun 
    if IsTrue AlwaysDump
        DumpHeaps
        change AlwaysDump = 0
    endif
    if NOT LevelIs load_mainmenu
        if ScreenElementExists id = controller_unplugged_dialog_anchor
            kill_start_key_binding
        else
            if NOT (dont_restore_start_key_binding = 1)
                restore_start_key_binding
            endif
        endif
    endif
    if GameModeEquals is_creategoals
        restore_start_key_binding
    endif
    if IsTrue bootstrap_build
        if IsTrue STARTGAME_FIRST_TIME
            create_startup_menu
        endif
    endif
    if InSplitScreenGame
        if IsTrue FirstTimeInSplitscreen
            pausegame
        endif
    endif
    wait 1 gameframe
    if IsMovieQueued
        begin 
        if HasMovieStarted
            break 
        endif
        wait 1 gameframe
        repeat 
    endif
    wait 2 gameframe
    change is_changing_levels = 0
    if NOT (dont_unhide_loading_screen = 1)
        if IsNGC
            VMCacheFlush
        endif
        hideloadingscreen
    endif
    if InSplitScreenGame
        SetActiveCamera id = skatercam0 viewport = 0
        SetActiveCamera id = skatercam1 viewport = 1
        if IsTrue FirstTimeInSplitscreen
            ScreenElementSystemCleanup
            change FirstTimeInSplitscreen = 0
            pausegame
            create_end_run_menu
        endif
    endif
    if InMultiPlayerGame
    else
        UseOnePadInFrontEnd
    endif
    EnableActuators
    refresh_poly_count
    if (toggled_fps_on = 1)
        ToggleFPS
        ToggleFPS
    endif
    if (toggled_geom_stats_on = 1)
        ToggleGeomStats
        ToggleGeomStats
    endif
    begin 
    if ShouldEndRun
        
        break 
    endif
    if GameModeEquals is_horse
        if FirstTrickStarted
            HideClock
            GoalManager_ZeroGoalTimer name = horse_mp
            
            break 
        endif
    endif
    wait 1 gameframe
    repeat 
endscript


script GameFlow_WaitEnd 
    
    begin 
    if EndRunSelected
        break 
    endif
    if IsCareerMode
    else
        if GameModeEquals is_singlesession
            break 
        else
            if NOT LevelIs load_mainmenu
                if AllSkatersAreIdle
                    break 
                endif
            endif
        endif
    endif
    wait 1 gameframe
    repeat 
    EnableActuators 0
    wait 2 Game frames
    if NOT GameModeEquals is_singlesession
        if NOT InSplitScreenGame
            UnPauseGame
        endif
    endif
    wait 2 Game frames
    KillMessages
    KillSpawnedScript name = SK3_Killskater_Finish
endscript


script GameFlow_End 
    
    begin 
    if CalculateFinalScores
        break 
    endif
    wait 1 gameframe
    repeat 
    if IsCareerMode
        if GetGlobalFlag flag = SHOW_CREDITS
            UnsetGlobalFlag flag = SHOW_CREDITS
            if cd
                wait 1 gameframe
                cleanup_play_movie 'movies\pccredits'
                ingame_play_movie 'movies\credits'
            endif
        endif
    else
        if IsCustomPark
        else
            if GameModeEquals is_singlesession
            endif
        endif
    endif
    if GameModeEquals show_ranking_screen
    endif
    if InNetGame
        if OnServer
            wait 5 gameframes
            loadpendingplayers
        endif
    endif
endscript


script StandardGameFlow 
    
    GameFlow_Startup
    StandardGameFlowBody
endscript


script StandardGameFlowToggleView 
    
    GameFlow_Startup
    ToggleViewMode
    StandardGameFlowBody
endscript


script StandardGameFlowBody 
    begin 
    GameFlow_StartRun
    GameFlow_PlayRun
    GameFlow_WaitEnd
    if GameModeEquals is_horse
        if EndRunSelected
            break 
        endif
        horse_end_run
        if HorseEnded
            break 
        else
            InitializeSkaters
        endif
    else
        break 
    endif
    repeat 
    if GameModeEquals is_horse
        horse_uninit
    endif
    GameFlow_End
    begin 
    wait 1 gameframe
    repeat 
endscript

