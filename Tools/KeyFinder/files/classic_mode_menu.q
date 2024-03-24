
classic_mode_skip_intro = 0

script classic_mode_menu_add_pause_options 
    add_roundbar_menu_item text = 'RETRY LEVEL' id = menu_classic_retry pad_choose_script = classic_mode_retry
    if root_window ::getsingletag no_exit_pause_menu
        add_roundbar_menu_item text = 'VIEW GOAL CAMERAS' id = menu_classic_goals pad_choose_script = classic_mode_view_goal_cameras
    endif
    add_roundbar_menu_item text = 'VIEW GOALS' id = menu_classic_goals_list pad_choose_script = classic_mode_view_goals
endscript


script classic_mode_menu_add_quit_option 
    if NOT root_window ::getsingletag no_exit_pause_menu
        add_roundbar_menu_item text = 'END RUN' id = menu_classic_endrun pad_choose_script = classic_mode_choose_end_run
    else
        add_roundbar_menu_item text = 'QUIT' id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit }
    endif
endscript


script classic_mode_view_goal_cameras 
    classic_mode_process_intro_cameras
    SpawnScript PlayClassicIntroCameras params = {callback = classic_mode_view_goal_cameras_back_to_pause
        GoalList = <GoalList>
        end_run
    }
endscript


script classic_mode_view_goal_cameras_back_to_pause 
    pausegame
    create_pause_menu
endscript


script classic_mode_retry 
    DisplayLoadingScreen freeze
    ResetSkaters
    GoalManager_DeactivateAllGoals
    exit_pause_menu dont_restore_start_key_binding
    change dont_restore_start_key_binding = 0
    destroy_goal_panel_messages all
    kill_speech_boxes
    TantrumMessageKill
    console_clear
    if ObjectExists id = first_time_goal_info
        DestroyScreenElement id = first_time_goal_info
    endif
    change classic_mode_skip_intro = 1
    TODManager_SetTempBloomParams on = 0
    change ParseNodeArrayIgnoreGaps = 1
    retry
endscript


script classic_mode_choose_end_run 
    root_window ::getsingletag classic_ghost_timed_run_goal
    skater ::BailSkaterTricks
    GoalManager_ExpireGoal name = <classic_ghost_timed_run_goal>
    TODManager_SetTempBloomParams on = 0
endscript

classic_mode_in_end_run_sequence = 0

script classic_mode_end_run 
    change classic_mode_in_end_run_sequence = 1
    CheckClassicAdvancementStatus
    classic_mode_process_intro_cameras show_beaten = 1 <...> 
    SpawnScript PlayClassicIntroCameras params = {callback = classic_mode_view_goals
        GoalList = <GoalList>
        end_run
    }
endscript


script classic_mode_done_with_intro 
    GoalManager_UnPauseAllGoals
endscript


script classic_mode_play_intro_cams 
    classic_mode_setup_ghost_score_run
    GoalManager_ActivateAllGoals
    change classic_all_goals_complete_message_shown = 0
    change ParseNodeArrayIgnoreGaps = 0
    if (classic_mode_skip_intro = 1)
        change classic_mode_skip_intro = 0
        return 
    endif
    change classic_mode_skip_intro = 0
    GoalManager_PauseAllGoals
    classic_mode_process_intro_cameras
    SpawnScript PlayClassicIntroCameras params = {callback = classic_mode_done_with_intro
        GoalList = <GoalList>
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
        root_window ::settags classic_ghost_timed_run_goal = <goal>
        GoalManager_EditGoal name = <goal> params = { classic_goal_list = <GoalList> }
        return 
    endif
    index = (<index> + 1)
    repeat <array_size>
    script_assert 'Couldn\'t find a timed score run. Is this classic mode?'
endscript


script classic_mode_get_previous_goal_data 
    root_window ::getsingletag classic_ghost_timed_run_goal
    GoalManager_GetGoalParams name = <classic_ghost_timed_run_goal>
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
    old_cameras = <view_goals_cameras>
    RemoveParameter view_goals_cameras
    GoalManager_GetGoalParams name = ((<GoalList> [ <index> ]).goalId)
    if NOT GotParam view_goals_cameras
        view_goals_cameras = <old_cameras>
        unique_cam = 0
    else
        unique_cam = 1
        if NOT GotParam default_level_message_cameras
            default_level_message_cameras = <view_goals_cameras>
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
            if (<just_unlocked> = just_unlocked_bracket)
                view_goals_text = 'You\'ve Unlocked the Next Level Bracket!'
                style = classic_goal_intro_style_bracketmessage
            else
                view_goals_text = 'You\'ve Unlocked the Secret Triangle Level!'
                style = classic_goal_intro_style_bracketmessage_icon
            endif
            view_goals_cameras = <default_level_message_cameras>
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
        view_goals_cameras = <view_goals_cameras>
        unique_cam = <unique_cam>
        timer = <timer>
        style = <style>
    }
    index = (<index> + 1)
    repeat <array_size>
    return GoalList = <GoalList>
endscript


script PlayClassicIntroCameras 
    GoalManager_ReplaceTrickText all
    LoadTexture no_vram_alloc 'LevelSelectSprites/sign_secret2'
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
            SpawnScript TemporarilyDisableInput params = { time = 200 }
            GetCurrentSkaterCamAnimName
            GetIntroSkaterCamName index = <index> cam = ((<GoalList> [ <index> ]).view_goals_cameras [ 0 ])
            if NOT (<name> = <currentskatercamanimname>)
                KillSkaterCamAnim current
                PlayIntroSkaterCam index = <index> cam = ((<GoalList> [ <index> ]).view_goals_cameras [ 0 ])
            endif
            SpawnScript display_classic_goal_intro_panel params = {goal_name = ((<GoalList> [ <index> ]).view_goals_text)
                beaten = ((<GoalList> [ <index> ]).hasBeaten)
                style = ((<GoalList> [ <index> ]).style)
            }
            PauseStream 0
            StopStream UnlockOldTHPSLevel
            KillSpawnedScript name = PlayTHPSSoundAfterWait
            SpawnScript PlayTHPSSoundAfterWait
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
        KillChapterMenu inside_run = <inside_run>
    endif
    UnloadTexture 'LevelSelectSprites/sign_secret2'
    RemoveParameter goals
    SafeCallback <...> 
endscript


script PlayTHPSSoundAfterWait 
    wait 1 gameframe
    PlayStream UnlockOldTHPSLevel vol = 150
endscript


script classic_intro_advance_cam 
    classic_intro_root ::settags pressed_x
endscript


script classic_mode_view_goals_exit 
    DestroyScreenElement id = view_goals_root
    if (classic_mode_in_end_run_sequence = 0)
        if GotParam back
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
    UpdateInitials
    ResetComboRecords
    if NewRecord
        high_scores_menu_create
    else
        classic_mode_do_end_run_stats
    endif
endscript


script classic_mode_do_end_run_stats 
    GetStatValue points_available
    if (<stat_value> > 0)
        if NOT GotParam overridden
            create_classic_stats_menu end_run
            return 
        endif
    endif
    gamemode_end_run_maybe_save
endscript


script gamemode_end_run_maybe_save 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    change classic_mode_in_end_run_sequence = 0
    if root_window ::getsingletag highlight_change_level
        ingame_confirm_save
        return 
    endif
    create_pause_menu
endscript


script classic_mode_view_goals 
    CheckNeedCompletionMessages
    if GotParam need_completion_messages
        SpawnScript DoCompletionMessagesNow
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
    GoalManager_ReplaceTrickText all
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
        helper_text_elements = [{ text = '\bn/\bm = Done' }]
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
    SpawnScript SK6_SFX_ShowClassicGoals
    CreateScreenElement {
        type = ContainerElement
        parent = <container_id>
        font = small
        Pos = (0.0, -150.0)
        alpha = 1
    }
    container_id = <id>
    GetCurrentLevelName
    FormatText textname = Title '%a Goals' a = <level_name>
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
    wait 0.4500 seconds
    DoMorph alpha = 1 time = 0.1500 Pos = (0.0, -40.0)
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


script classic_goal_intro_style color = [ 128 128 128 128 ]
    setprops rgba = <color>
    DoMorph time = 0 Scale = 0 relative_scale
    DoMorph time = 0.2000 Scale = 1.600 relative_scale
    DoMorph time = 0.1000 Scale = 0.8000 relative_scale
    DoMorph time = 0.05000 Scale = 1.200 relative_scale
    DoMorph time = 0.1000 Scale = 1 relative_scale
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


script classic_goal_intro_style_bracketmessage_icon color = [ 121 80 6 128 ]
    setprops rgba = <color>
    SetScreenElementLock id = classic_intro_root Off
    Theme_GetPauseBarColor return_value = bar_color
    CreateScreenElement {
        type = SpriteElement
        parent = classic_intro_root
        id = unlocked_sign_icon
        texture = sign_secret2
        Scale = 3
        z_priority = -10
        rgba = [ 128 109 9 80 ]
    }
    RunScriptOnScreenElement id = unlocked_sign_icon unlocked_sign_icon_animate
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


script unlocked_sign_icon_animate 
    DoMorph time = 0 Pos = (320.0, 600.0)
    DoMorph time = 0.2000 Pos = (320.0, 240.0)
    gettags
    settags random_effect_done = 0
    RunScriptOnScreenElement id = <id> do_random_effect2
    begin 
    gettags
    if (<random_effect_done> = 1)
        settags random_effect_done = 0
        RunScriptOnScreenElement id = unlocked_sign_icon do_random_effect2 params = {
            id = unlocked_sign_icon
            effect = Random (@ 2 @ 6 @ 5 @ 8 @ 2 @ 1 @ 5 @ 2 @ 3 @ 5 @ 2 @ 10 @ 1 @ 2 @ 3 @ 5 @ 2 @ 3 @ 8 @ 3 @ 5 @ 9 @ 2 @ 9 @ 5 @ 2 @ 3 @ 5 @ 6 @ 2 @ 1 @ 9 @ 5 @ 3 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 6 @ 1)
            <...> 
        }
    endif
    wait 4 frame
    repeat 40
    DoMorph time = 0.4000 alpha = 0 Scale = 0.5000
endscript


script classic_goal_intro_complete_style color = [ 128 128 128 128 ]
    setprops rgba = <color>
    DoMorph time = 0 Scale = 0 relative_scale
    DoMorph time = 0.2000 Scale = 1.600 relative_scale
    begin 
    DoMorph time = 0.3000 Scale = 0.8500 relative_scale
    DoMorph time = 0.3000 Scale = 1.150 relative_scale
    repeat 
endscript

classic_all_goals_complete_message_shown = 0

script classic_mode_check_for_all_complete_message 
    if IsTrue classic_all_goals_complete_message_shown
        return 
    endif
    change classic_all_goals_complete_message_shown = 1
    GetClassicLevelGoalCount
    if (<classic_goal_count> = 10)
        wait 0.5000 seconds
        goal_panel_wait_for_my_turn
        SpawnScript Goal_Success_Message_Sound
        create_panel_message {
            id = all_goals_completed_message
            text = 'All Goals Complete!'
            style = classic_goals_all_complete_message
        }
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
    if GotParam TimedScoreRun
        return TimedScoreRun
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
            text = 'Complete!'
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
    if NOT GameModeEquals is_classic
        return 
    endif
    if IsTrue DEMO_BUILD
        return 
    endif
    GetCurrentLevel
    GetArraySize level_select_menu_classic_level_info
    GetClassicModeTargetGoalsComplete
    index = 0
    begin 
    if StructureContains structure = (level_select_menu_classic_level_info [ <index> ])level
        GetClassicLevelGoalCount level = ((level_select_menu_classic_level_info [ <index> ]).level_num)
        if (((level_select_menu_classic_level_info [ <index> ]).level)= <level>)
            if NOT (<classic_goal_count> < <target_goals_complete>)
                next_index = (<index> + 1)
                bracket1 = ((level_select_menu_classic_level_info [ <index> ]).bracket)
                begin 
                if (<next_index> < <array_size>)
                    if StructureContains structure = (level_select_menu_classic_level_info [ <next_index> ])flag
                        flag = ((level_select_menu_classic_level_info [ <next_index> ]).flag)
                        bracket2 = ((level_select_menu_classic_level_info [ <next_index> ]).bracket)
                        if (<bracket2> = (<bracket1> + 1))
                            if NOT GetGlobalFlag flag = <flag>
                                just_unlocked = just_unlocked_bracket
                                if NOT (<flag> = GAME_CLASSIC_UNLOCKED_SE2)
                                    SetGlobalFlag flag = <flag>
                                endif
                            endif
                            if StructureContains structure = (level_select_menu_classic_level_info [ <next_index> ])seen_flag
                                seen_flag = (level_select_menu_classic_level_info [ <next_index> ].seen_flag)
                                if NOT (<seen_flag> = LEVEL_SEEN_SE2)
                                    SetGlobalFlag flag = <seen_flag>
                                endif
                            endif
                        endif
                    endif
                else
                    break 
                endif
                next_index = (<next_index> + 1)
                repeat <array_size>
            endif
        endif
        if (((level_select_menu_classic_level_info [ <index> ]).level)= load_la)
            if NOT (<classic_goal_count> < <target_goals_complete>)
                if NOT GetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2
                    just_unlocked = just_unlocked_se2
                    SetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2
                    SetGlobalFlag flag = LEVEL_SEEN_SE2
                    SetClassicTotalGoals 140
                endif
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    GetClassicLevelGoalCount get_total
    if (<total_goals_complete> = <total_goals_possible>)
        GetClassicModeCompleteFlag
        SetGlobalFlag flag = <complete_flag>
    endif
    ProcessGameRewards
    ProcessGoalRewards
    return just_unlocked = <just_unlocked>
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

script GetClassicModeTargetGoalsComplete 
    if IsTrue classic_mode_use_cheat_points
        return target_goals_complete = 1
    endif
    GoalManager_GetDifficultyLevel
    if (<difficulty_level> = 0)
        return target_goals_complete = 6
    else
        return target_goals_complete = 8
    endif
endscript


script IsClassicModeComplete 
    GetClassicModeCompleteFlag
    if GetGlobalFlag flag = <complete_flag>
        return classic_mode_completed
    endif
endscript

