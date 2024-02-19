classic_mode_skip_intro = 0
classic_ghost_timed_run_goal = None
classic_total_goals_standard = 60
classic_total_goals_collector = 80
classic_game_complete_goals_standard = 51
classic_game_complete_goals_collector = 55
classic_mode_achievements = [
    { goals = 10 achievement = classic_10goals }
    { goals = 20 achievement = classic_20goals }
    { goals = 30 achievement = classic_30goals }
    { goals = 40 achievement = classic_40goals }
    { goals = 50 achievement = classic_50goals }
    { goals = 60 achievement = classic_60goals }
]

script classic_mode_menu_add_pause_options 
    add_label_menu_item {
        text = 'SPRÓBUJ PONOWNIE'
        rot = 2
        Scale = 0.8500
        label_offset = (-10.0, 0.0)
        id = menu_classic_retry pad_choose_script = classic_mode_retry
    }
    if root_window ::getsingletag no_exit_pause_menu
        add_label_menu_item {
            text = 'OBEJRZYJ KAMERY CELÓW'
            rot = -2
            Scale = 0.8500
            label_offset = (-80.0, 0.0)
            id = menu_classic_goals pad_choose_script = classic_mode_view_goal_cameras
        }
    endif
    add_label_menu_item {
        text = 'LISTA ZADAÑ'
        rot = 0
        Scale = 0.8500
        label_offset = (-10.0, 0.0)
        id = menu_classic_goals_list pad_choose_script = classic_mode_view_goals
    }
    if GameModeEquals is_coop
        add_label_menu_item {
            text = 'TRYB DZIELONY'
            rot = 0
            Scale = 0.8500
            label_offset = (-10.0, 0.0)
            id = menu_classic_split_mode pad_choose_script = create_split_menu pad_choose_params = { callback_script = create_pause_menu }
        }
    endif
endscript

script classic_mode_menu_add_quit_option 
    if NOT root_window ::getsingletag no_exit_pause_menu
        add_label_menu_item {
            text = 'ZAKOÑCZ PRZEJAZD'
            rot = 2
            Scale = 0.8500
            label_offset = (-20.0, 0.0)
            id = menu_classic_endrun pad_choose_script = classic_mode_choose_end_run
        }
    else
        add_label_menu_item {
            text = 'WYJD'
            rot = 2
            Scale = 0.8500
            label_offset = (-20.0, 0.0)
            id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = career_mode_quit_dialog }
        }
    endif
endscript

script classic_mode_view_goal_cameras 
    classic_mode_process_intro_cameras
    SpawnScriptLater PlayClassicIntroCameras params = {callback = classic_mode_view_goal_cameras_back_to_pause
        GoalList = <GoalList>
        end_run
    }
endscript

script classic_mode_view_goal_cameras_back_to_pause 
    pausegame
    create_pause_menu
endscript

script classic_mode_retry 
    DisplayLoadingScreen \{ freeze }
    ResetSkaters
    GoalManager_DeactivateAllGoals \{ force_all }
    exit_pause_menu \{ dont_restore_start_key_binding }
    change \{ dont_restore_start_key_binding = 0 }
    destroy_goal_panel_messages \{ all }
    kill_speech_boxes
    TantrumMessageKill
    console_clear
    if ObjectExists \{ id = first_time_goal_info }
        DestroyScreenElement \{ id = first_time_goal_info }
    endif
    change \{ classic_mode_skip_intro = 1 }
    GlobalEffects_ClearState \{ id = pulse_bloom }
    retry
endscript

script classic_mode_choose_end_run 
    skater ::BailSkaterTricks
    if InSplitScreenGame
        skater2 ::BailSkaterTricks
    endif
    GoalManager_ExpireGoal name = (classic_ghost_timed_run_goal)
    GlobalEffects_ClearState \{ id = pulse_bloom }
endscript
classic_mode_in_end_run_sequence = 0

script classic_mode_end_run 
    change \{ classic_mode_in_end_run_sequence = 1 }
    CheckClassicAdvancementStatus
    classic_mode_process_intro_cameras show_beaten = 1 <...> 
    SpawnScriptLater PlayClassicIntroCameras params = {callback = classic_mode_view_goals
        GoalList = <GoalList>
        end_run
    }
endscript

script classic_mode_done_with_intro 
    GoalManager_UnPauseAllGoals
endscript

script classic_mode_play_intro_cams 
    GlobalEffects_ClearState \{ id = pulse_bloom }
    classic_mode_setup_ghost_score_run
    GoalManager_ActivateAllGoals
    change \{ classic_all_goals_complete_message_shown = 0 }
    if (classic_mode_skip_intro = 1)
        change \{ classic_mode_skip_intro = 0 }
        restore_start_key_binding
        return 
    endif
    change \{ classic_mode_skip_intro = 0 }
    GoalManager_PauseAllGoals
    classic_mode_process_intro_cameras
    SpawnScriptLater {
        PlayClassicIntroCameras
        params = {
            kill_restore_start_key = 1
            callback = classic_mode_done_with_intro
            GoalList = <GoalList>
        }
    }
endscript

script classic_mode_setup_ghost_score_run 
    GoalManager_GetGoalList
    GetArraySize <GoalList>
    <index> = 0
    begin 
    goal = (<GoalList> [ <index> ].goalId)
    RemoveParameter TimedScoreRun
    classic_mode_is_goal_timed goal = <goal>
    if GotParam TimedScoreRun
        change classic_ghost_timed_run_goal = <goal>
        GoalManager_EditGoal name = <goal> params = { classic_goal_list = <GoalList> }
        return 
    endif
    index = (<index> + 1)
    repeat <array_size>
    script_assert 'Nie znaleziono wyniku przejazdu o rekord. Czy to tryb klasyczny?'
endscript

script classic_mode_get_previous_goal_data 
    GoalManager_GetGoalParams name = (classic_ghost_timed_run_goal)
    return previous_goal_data = <classic_goal_list>
endscript

script classic_mode_process_intro_cameras show_beaten = 0
    GoalManager_GetGoalList
    classic_mode_get_previous_goal_data
    GetArraySize <GoalList>
    index = 0
    begin 
    RemoveParameter TimedScoreRun
    RemoveParameter view_goals_text
    old_cameras = <classic_intro_camera>
    RemoveParameter classic_intro_camera
    GoalManager_GetGoalParams name = ((<GoalList> [ <index> ]).goalId)
    if NOT GotParam classic_intro_camera
        classic_intro_camera = <old_cameras>
        unique_cam = 0
    else
        unique_cam = 1
        if NOT GotParam default_level_message_cameras
            default_level_message_cameras = <classic_intro_camera>
        endif
    endif
    beaten_this_time = ((<GoalList> [ <index> ]).hasBeaten)
    beaten_last_time = ((<previous_goal_data> [ <index> ]).hasBeaten)
    show = 0
    timer = 180
    if (<beaten_last_time> = 0)
        if (<beaten_this_time> = <show_beaten>)
            show = 1
        endif
    endif
    style = classic_goal_intro_style
    if GotParam TimedScoreRun
        if GotParam just_unlocked
            root_window ::settags highlight_change_level
            view_goals_text = 'Odblokowa³e nowy poziom!'
            style = classic_goal_intro_style_bracketmessage
            classic_intro_camera = <default_level_message_cameras>
            show = 1
            timer = 360
            unique_cam = 1
        else
            show = 0
        endif
    endif
    SetArrayElement arrayName = GoalList index = <index> newValue = {(<GoalList> [ <index> ])
        show = <show>
        view_goals_text = <view_goals_text>
        classic_intro_camera = <classic_intro_camera>
        unique_cam = <unique_cam>
        timer = <timer>
        style = <style>
    }
    index = (<index> + 1)
    repeat <array_size>
    return GoalList = <GoalList>
endscript

script PlayClassicIntroCameras kill_restore_start_key = 0
    StartDelaySystemUI
    if (<kill_restore_start_key> = 1)
        kill_start_key_binding
    endif
    ReplaceTrickText all
    if InSplitScreenGame
        SetScreenMode one_camera
        PauseSkaters
    endif
    GetArraySize <GoalList>
    if (<array_size> > 0)
        if ScreenElementExists id = current_menu_anchor
            exit_pause_menu dont_restore_start_key_binding
        endif
        if GotParam end_run
            inside_run = inside_run
        endif
        SetUpChapterMenu
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = classic_intro_root
            event_handlers = [{ pad_choose classic_intro_advance_cam }]
        }
        FireEvent type = focus target = classic_intro_root
        GetCurrentLevelName
        create_panel_block {parent = classic_intro_root
            id = intro_title
            font_face = testtitle
            text = <level_name>
            rgba = [ 16 67 113 90 ]
            Pos = (320.0, 50.0)
            time = 200000
            dims = (616.0, 0.0)
            Scale = 1.800
            just = [ center top ]
            internal_just = [ center top ]
        }
        index = 0
        begin 
        if (((<GoalList> [ <index> ]).show)= 1)
            skip_me = 0
        else
            skip_me = 1
        endif
        if classic_intro_root ::getsingletag pressed_x
            if (((<GoalList> [ <index> ]).unique_cam)= 0)
                skip_me = 1
            else
                classic_intro_root ::removetags tags = [ pressed_x ]
            endif
        endif
        if (<skip_me> = 0)
            Debounce x time = 0.3000
            KillSpawnedScript name = TemporarilyDisableInput
            SpawnScriptLater TemporarilyDisableInput params = { time = 200 }
            GetCurrentSkaterCamAnimName
            GetIntroSkaterCamName index = <index> cam = ((<GoalList> [ <index> ]).classic_intro_camera)
            if NOT (<name> = <currentskatercamanimname>)
                KillSkaterCamAnim current
                PlayIntroSkaterCam index = <index> cam = ((<GoalList> [ <index> ]).classic_intro_camera)
            endif
            SpawnScriptLater display_classic_goal_intro_panel params = {goal_name = ((<GoalList> [ <index> ]).view_goals_text)
                beaten = ((<GoalList> [ <index> ]).hasBeaten)
                style = ((<GoalList> [ <index> ]).style)
            }
            PauseStream 0
            StopStream UnlockOldTHPSLevel
            KillSpawnedScript name = PlayTHPSSoundAfterWait
            SpawnScriptLater PlayTHPSSoundAfterWait
            timer = 0
            begin 
            if (<timer> > ((<GoalList> [ <index> ]).timer))
                break 
            endif
            if classic_intro_root ::getsingletag pressed_x
                break 
            endif
            if SkaterCamAnimFinished
                break 
            endif
            timer = (<timer> + 1)
            wait 1 gameframes
            repeat 
        endif
        <index> = (<index> + 1)
        repeat <array_size>
        KillSkaterCamAnim all
        StopStream UnlockOldTHPSLevel
        if ScreenElementExists id = classic_intro_root
            DestroyScreenElement id = classic_intro_root
        endif
        KillSpawnedScript name = display_classic_goal_intro_panel
        KillChapterMenu inside_run = <inside_run>
    endif
    RemoveParameter goals
    if InSplitScreenGame
        SetScreenModeFromGameMode
        UnpauseSkaters
    endif
    if (<kill_restore_start_key> = 1)
        restore_start_key_binding
    endif
    StopDelaySystemUI
    SafeCallback <...> 
endscript

script PlayTHPSSoundAfterWait 
    wait \{ 1 gameframe }
    PlayStream \{ UnlockOldTHPSLevel vol = 100 }
endscript

script classic_intro_advance_cam 
    classic_intro_root ::settags \{ pressed_x }
endscript

script classic_mode_view_goals_exit 
    DestroyScreenElement \{ id = view_goals_root }
    if (classic_mode_in_end_run_sequence = 0)
        if GotParam \{ back }
            generic_menu_pad_back_sound
        else
            generic_menu_pad_choose_sound
        endif
        create_pause_menu
    else
        generic_menu_pad_choose_sound
        classic_mode_do_high_scores
    endif
endscript

script classic_mode_do_high_scores 
    UpdateRecords
    ResetComboRecords
    if NewRecord
        high_scores_menu_create
    else
        classic_mode_do_end_run_stats
    endif
endscript

script classic_mode_do_end_run_stats 
    GetStatValue \{ points_available }
    if (<stat_value> > 0)
        if NOT GotParam \{ overridden }
            create_classic_stats_menu \{ end_run }
            return 
        endif
    endif
    gamemode_end_run_maybe_save
endscript

script gamemode_end_run_maybe_save 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    change \{ classic_mode_in_end_run_sequence = 0 }
    <prompt_save> = 0
    if root_window ::getsingletag \{ highlight_change_level }
        <prompt_save> = 1
    endif
    if IsXenon
        if NOT CheckForSignin \{ local }
            <prompt_save> = 0
        endif
    endif
    if (<prompt_save> = 1)
        ingame_confirm_save
        return 
    endif
    create_pause_menu
endscript

script classic_mode_view_goals 
    CheckNeedCompletionMessages
    if GotParam need_completion_messages
        SpawnScriptLater DoCompletionMessagesNow notsessionspecific = 1
        return 
    endif
    if GotParam end_run
        pausegame
        kill_start_key_binding
        set_pause_menu_allow_continue Off
    endif
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    kill_speech_boxes
    TantrumMessageKill
    console_clear
    hide_all_hud_items
    kill_start_key_binding
    ReplaceTrickText all
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = view_goals_root
        not_focusable
    }
    SetScreenElementProps {
        id = view_goals_root
        event_handlers = [
            {pad_back classic_mode_view_goals_exit params = { back }}
            { pad_choose classic_mode_view_goals_exit }
        ]
        replace_handlers
    }
    create_helper_text {
        parent = view_goals_root
        helper_pos = (330.0, 426.0)
        helper_text_elements = [{ text = '\m1/\m0 = Gotowe' }]
    }
    GoalManager_GetGoalList
    classic_mode_get_previous_goal_data
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        Pos = (320.0, 105.0)
        just = [ center center ]
        not_focusable
    }
    container_id = <id>
    position = (0.0, 0.0)
    Scale = 0.9000
    left_right_pos = -1
    any_goals_beaten = 0
    GetArraySize <GoalList>
    <index> = 0
    begin 
    goal = (<GoalList> [ <index> ])
    RemoveParameter TimedScoreRun
    classic_mode_is_goal_timed goal = (<goal>.goalId)
    if NOT GotParam TimedScoreRun
        CreateScreenElement {
            type = ContainerElement
            parent = <container_id>
            Pos = <position>
        }
        if (<left_right_pos> < 0)
            left_right_pos = 1
        else
            left_right_pos = -1
        endif
        local_container_id = <id>
        RunScriptOnScreenElement id = <local_container_id> classic_view_goals_animate_in params = {left_right_pos = <left_right_pos>
            position = <position>
            index = <index>
        }
        GoalManager_GetGoalParams name = (<goal>.goalId)
        CreateScreenElement {
            type = TextElement
            parent = <local_container_id>
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = small
            text = <view_goals_text>
            Scale = <Scale>
            Pos = (0.0, 0.0)
            just = [ center center ]
        }
        if ((<previous_goal_data> [ <index> ].hasBeaten)= 1)
            <id> ::setprops rgba = [ 50 50 50 128 ]
        else
            if ((<goal>.hasBeaten)= 1)
                RunScriptOnScreenElement id = <id> classic_view_goals_style params = {color = [ 128 40 40 128 ] wait_first}
            endif
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = <local_container_id>
            Pos = (0.0, 0.0)
            just = [ center center ]
            Scale = (50.0, 3.0)
            texture = white2
            z_priority = 2
            rgba = [ 0 0 0 50 ]
        }
        position = (<position> + (0.0, 28.0))
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    SpawnScriptLater SK6_SFX_ShowClassicGoals
    CreateScreenElement {
        type = ContainerElement
        parent = <container_id>
        font = small
        Pos = (0.0, -150.0)
        alpha = 1
    }
    container_id = <id>
    GetCurrentLevelName
    FormatText textname = Title '%a zadania' a = <level_name>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        font = small
        text = <Title>
        Scale = 1.800
        Pos = (0.0, 2.0)
        rgba = [ 30 60 128 128 ]
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        Pos = (0.0, 0.0)
        just = [ center center ]
        Scale = (50.0, 6.0)
        texture = white2
        z_priority = -2
        rgba = [ 0 0 0 100 ]
    }
    RunScriptOnScreenElement id = <container_id> classic_view_goals_title
    FireEvent type = focus target = view_goals_root
endscript

script classic_view_goals_title 
    wait \{ 0.4500 seconds }
    DoMorph \{ alpha = 1 time = 0.1500 Pos = (0.0, -40.0) }
endscript

script classic_view_goals_animate_in 
    DoMorph Pos = (<position> + <left_right_pos> * (600.0, 0.0))
    wait (<index> * 2)gameframes
    DoMorph Pos = (<position> - <left_right_pos> * (100.0, 0.0))time = 0.2000
    DoMorph Pos = <position> time = 0.1000
endscript

script classic_view_goals_style color = [ 128 128 128 128 ]
    if GotParam wait_first
        wait 0.6000 seconds
    endif
    setprops rgba = <color>
    DoMorph time = 0 Scale = 0 relative_scale
    DoMorph time = 0.2000 Scale = 1.200 relative_scale
    DoMorph time = 0.1000 Scale = 0.8000 relative_scale
    DoMorph time = 0.05000 Scale = 1.200 relative_scale
    DoMorph time = 0.1000 Scale = 1 relative_scale
    begin 
    DoMorph time = 0.5000 Scale = 1.050
    DoMorph time = 0.5000 Scale = 0.9500
    repeat 
endscript

script classic_goal_intro_style \{color = [ 128 128 128 128 ]}
    setprops rgba = <color>
    DoMorph \{ time = 0 Scale = 0 relative_scale }
    DoMorph \{ time = 0.2000 Scale = 1.600 relative_scale }
    DoMorph \{ time = 0.1000 Scale = 0.8000 relative_scale }
    DoMorph \{ time = 0.05000 Scale = 1.200 relative_scale }
    DoMorph \{ time = 0.1000 Scale = 1 relative_scale }
endscript

script classic_goal_intro_style_bracketmessage color = [ 121 80 6 128 ]
    setprops rgba = <color>
    DoMorph time = 0 Scale = 10.80 relative_scale rot_angle = 0 alpha = 0
    DoMorph time = 0.1000 Scale = 0.8000 relative_scale alpha = 1
    DoMorph time = 0.05000 Scale = 1.200 relative_scale
    DoMorph time = 0.1000 Scale = 1 relative_scale rot_angle = 5
    DoMorph time = 0.1000 alpha = 1 rot_angle = 3
    DoMorph time = 0.1000 alpha = 0.6000 rot_angle = 6
    DoMorph time = 0.1000 alpha = 1 rot_angle = 4
    DoMorph time = 0.1000 alpha = 0.7000 rot_angle = 5
    DoMorph time = 0.1000 alpha = 1 rot_angle = 4
    DoMorph time = 0.1000 alpha = 0.5000 rot_angle = 6
    DoMorph time = 0.1000 alpha = 1 rot_angle = 3
    DoMorph time = 0.1000 alpha = 0.8000 rot_angle = 5
    DoMorph time = 0.1000 alpha = 1 rot_angle = 4
    DoMorph time = 0.1000 alpha = 0.6000 rot_angle = 3
    DoMorph time = 0.1000 alpha = 1 rot_angle = 5
    DoMorph time = 0.1000 alpha = 0.8000 rot_angle = 3
    DoMorph time = 0.1000 alpha = 1 rot_angle = 6
    DoMorph time = 0.1000 alpha = 0.6000 rot_angle = 4
    DoMorph time = 0.1000 alpha = 1 rot_angle = 5
    DoMorph time = 0.1000 alpha = 0.8000 rot_angle = 4
    DoMorph time = 0.1000 alpha = 1 rot_angle = 6
    DoMorph time = 0.1000 alpha = 0.6000 rot_angle = 5
    DoMorph time = 0.03000 Scale = 1.500 relative_scale rot_angle = 5 alpha = 1
    DoMorph time = 0.1500 Scale = 1.750 relative_scale rot_angle = 5 alpha = 1
    DoMorph time = 0.1000 Scale = 1.800 relative_scale rot_angle = 5 alpha = 1
    DoMorph time = 0.3000 Scale = 0.3000 relative_scale alpha = 0
endscript

script classic_goal_intro_complete_style \{color = [ 128 128 128 128 ]}
    setprops rgba = <color>
    DoMorph \{ time = 0 Scale = 0 relative_scale }
    DoMorph \{ time = 0.2000 Scale = 1.600 relative_scale }
    begin 
    DoMorph \{ time = 0.3000 Scale = 0.8500 relative_scale }
    DoMorph \{ time = 0.3000 Scale = 1.150 relative_scale }
    repeat 
endscript
classic_all_goals_complete_message_shown = 0

script classic_mode_check_for_all_complete_message 
    if IsTrue \{ classic_all_goals_complete_message_shown }
        return 
    endif
    GetClassicLevelGoalCount
    if (<classic_level_goals> = 10)
        change \{ classic_all_goals_complete_message_shown = 1 }
        wait \{ 0.5000 seconds }
        goal_panel_wait_for_my_turn
        SpawnScriptLater \{ Goal_Success_Message_Sound }
        create_panel_message \{ id = all_goals_completed_message text = 'Wszystkie cele osi¹gniête!' style = classic_goals_all_complete_message }
    endif
endscript

script classic_goals_all_complete_message 
    setprops rgba = [ 128 128 0 128 ]
    DoMorph time = 0 Pos = (320.0, 125.0) Scale = 0 alpha = 0
    DoMorph time = 0.2000 alpha = 1
    DoMorph time = 0.2000 Scale = 2.500
    DoMorph time = 0.2000 Scale = 1.500
    DoMorph time = 0.2000 Scale = 2.0
    DoMorph time = 0.2000 Scale = 1.400
    DoMorph Pos = (321.0, 126.0) time = 0.1000
    DoMorph Pos = (319.0, 124.0) time = 0.1000
    DoMorph time = 0.2000 Scale = 1.400
    DoMorph time = 0.3000 Scale = 0 alpha = 0
    Die
endscript

script classic_mode_is_goal_timed 
    GoalManager_GetGoalParams name = <goal>
    if GotParam \{ TimedScoreRun }
        return \{ TimedScoreRun }
    endif
endscript

script display_classic_goal_intro_panel style = classic_goal_intro_style
    if ScreenElementExists id = intro_panel
        DestroyScreenElement id = intro_panel
    endif
    if ScreenElementExists id = intro_panel_complete
        DestroyScreenElement id = intro_panel_complete
    endif
    create_panel_block {parent = classic_intro_root
        id = intro_panel
        font_face = small
        text = <goal_name>
        rgba = [ 128 128 128 128 ]
        Pos = (320.0, 200.0)
        time = 3000
        dims = (300.0, 200.0)
        Scale = 1.600
        just = [ center center ]
        internal_just = [ center top ]
        time = 10000
    }
    if (<beaten> = 1)
        color = [ 128 0 0 128 ]
        create_panel_block {parent = classic_intro_root
            id = intro_panel_complete
            font_face = small
            text = 'Sukces!'
            rgba = <color>
            Pos = (320.0, 240.0)
            time = 3000
            dims = (300.0, 200.0)
            Scale = 2
            just = [ center center ]
            internal_just = [ center top ]
            time = 10000
        }
        RunScriptOnScreenElement id = intro_panel_complete classic_goal_intro_complete_style params = { color = <color> }
    else
        RunScriptOnScreenElement id = intro_panel <style>
    endif
endscript

script CheckClassicAdvancementStatus 
    if NOT GameModeEquals is_classic is_coop
        return 
    endif
    if IsTrue DEMO_BUILD
        return 
    endif
    GetClassicLevelGoalCount
    if IsXenon
        <current_achievements> = []
        GetArraySize classic_mode_achievements
        i = 0
        begin 
        if NOT (<classic_total_goals> < (classic_mode_achievements [ <i> ].goals))
            AddArrayElement array = <current_achievements> element = (classic_mode_achievements [ <i> ].achievement)
            <current_achievements> = <array>
        endif
        i = (<i> + 1)
        repeat <array_size>
        GetArraySize current_achievements
        if (<array_size> > 0)
            WriteAchievements achievements = <current_achievements>
        endif
    endif
    GetCurrentLevel
    GetArraySize level_select_menu_classic_level_info
    index = 0
    begin 
    if NOT GetFlag level = ((level_select_menu_classic_level_info [ <index> ]).level)flag = LEVEL_UNLOCKED_CLASSIC
        if NOT (<classic_total_goals> < (level_select_menu_classic_level_info [ <index> ].required_goal_total))
            skip_me = 0
            if StructureContains structure = (level_select_menu_classic_level_info [ <index> ])collectors_edition_only
                if NOT IsCollectorsEdition
                    skip_me = 1
                endif
            endif
            if (<skip_me> = 0)
                SetFlag level = (level_select_menu_classic_level_info [ <index> ].level)flag = LEVEL_VISITED
                SetFlag level = (level_select_menu_classic_level_info [ <index> ].level)flag = LEVEL_UNLOCKED_CLASSIC
                just_unlocked = just_unlocked
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    if (<classic_total_goals> = <classic_potential_goals>)
        GetClassicModeCompleteFlag
        SetGlobalFlag flag = <complete_flag>
    endif
    ProcessGameRewards
    ProcessGoalRewards
    return just_unlocked = <just_unlocked>
endscript

script classic_mode_menu_get_next_advancement_total 
    GetArraySize level_select_menu_classic_level_info
    GetClassicLevelGoalCount
    index = 0
    begin 
    if NOT GetFlag level = (level_select_menu_classic_level_info [ <index> ].level)flag = LEVEL_UNLOCKED_CLASSIC
        if (<classic_total_goals> < (level_select_menu_classic_level_info [ <index> ].required_goal_total))
            skip_me = 0
            if StructureContains structure = (level_select_menu_classic_level_info [ <index> ])collectors_edition_only
                if NOT IsCollectorsEdition
                    skip_me = 1
                endif
            endif
            if (<skip_me> = 0)
                return advancement_total = (level_select_menu_classic_level_info [ <index> ].required_goal_total)
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
endscript

script GetClassicModeCompleteFlag 
    GoalManager_GetDifficultyLevel
    if (<difficulty_level> = 0)
        flag = GAME_COMPLETED_CLASSIC_NORMAL
    else
        flag = GAME_COMPLETED_CLASSIC_SICK
    endif
    return complete_flag = <flag>
endscript
classic_mode_use_cheat_points = 0

script IsClassicModeComplete 
    GetClassicModeCompleteFlag
    if GetGlobalFlag flag = <complete_flag>
        return \{ classic_mode_completed }
    endif
endscript

script PlaySingleIntroVirtualCamera \{ frames = 180 }
    PlayIGCCam {
        <...> 
        skippable = 0
    }
endscript

script PlayIntroSkaterCam 
    if NOT GotParam \{ cam }
        return 
    endif
    if StructureContains structure = <cam> name
        PlaySkaterCamAnim name = (<cam>.name)skippable = 0
    else
        GetIntroSkaterCamName <...> 
        PlaySingleIntroVirtualCamera <cam> name = <name>
    endif
endscript

script GetIntroSkaterCamName 
    if StructureContains structure = <cam> name
        return name = (<cam>.name)
    else
        FormatText checksumname = moviename 'intro_cam_%i' i = <index>
        return name = <moviename>
    endif
endscript
