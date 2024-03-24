
lens_flare_visible_before_pause = 1

script handle_pause_continue 
    root_window ::gettags
    if GotParam pause_controller
        if NOT (<pause_controller> = <device_num>)
            return 
        endif
    endif
    exit_pause_menu
endscript

is_changing_levels = 0

script handle_start_pressed 
    root_window ::gettags
    if (is_changing_levels = 1)
        return 
    endif
    if LevelIs load_mainmenu
        return 
    endif
    if ChecksumEquals a = <menu_state> b = on
        if GotParam pause_controller
            if NOT (<pause_controller> = -1)
                if NOT (<device_num> = <pause_controller>)
                    return 
                endif
            endif
        endif
        if NOT InNetGame
            UnPauseGame
        endif
        exit_pause_menu
        change inside_pause = 0
    endif
    if ChecksumEquals a = <menu_state> b = Off
        change viewer_buttons_enabled = 0
        if NOT InMultiPlayerGame
            if NOT ControllerBoundToSkater controller = <device_num> skater = 0
                return 
            endif
        else
            if InSplitScreenGame
                if NOT ControllerBoundToSkater controller = <device_num> skater = 0
                    if NOT ControllerBoundToSkater controller = <device_num> skater = 1
                        return 
                    endif
                endif
            endif
        endif
        settags pause_controller = <device_num>
        possibly_remove_temp_special_trick
        KillSpawnedScript name = goal_accept_trigger
        if NOT InNetGame
            GetSkaterId
            if GetSkaterCamAnimParams skater = <ObjID>
                if (<allow_pause> = 0)
                    return 
                endif
            endif
            
            pausegame
            GoalManager_PauseAllGoals
            wait 1 gameframe
        endif
        set_pause_menu_allow_continue
        create_pause_menu device_num = <device_num>
    endif
endscript


script set_pause_menu_allow_continue 
    if GotParam Off
        root_window ::settags no_exit_pause_menu = 1
    else
        root_window ::removetags tags = [ no_exit_pause_menu ]
    endif
endscript


script set_custom_restart 
    if NOT skater ::InAir
        skater ::SetCustomRestart set
    endif
endscript


script skip_to_custom_restart 
    skater ::SkipToCustomRestart
endscript


script set_sub_bg {parent = current_menu_anchor
        Pos = (326.0, 115.0)
        Scale = (1.1699999570846558, 1.100000023841858)
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = options_bg
        draw_behind_parent
        Pos = <Pos>
        Scale = <Scale>
        just = <just>
        rgba = [ 128 128 128 128 ]
        z_priority = 1
    }
endscript


script hide_everything 
    DoScreenElementMorph id = root_window time = 0 Scale = 0
endscript


script unhide_everything 
    DoScreenElementMorph id = root_window time = 0 Scale = 1
endscript


script hide_all_hud_items 
    dialog_box_exit no_pad_start <...> 
    if ScreenElementExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    if ScreenElementExists id = first_time_goal_info
        DestroyScreenElement id = first_time_goal_info
    endif
    if ScreenElementExists id = cutscene_camera_hud_anchor
        change camera_hud_is_hidden = 1
        DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 0
    endif
    if ScreenElementExists id = nightvision_hud_anchor
        change nightvision_hud_is_hidden = 1
        DoScreenElementMorph id = nightvision_hud_anchor alpha = 0
    endif
    if ScreenElementExists id = the_time
        SetScreenElementProps id = the_time hide
    endif
    if NOT GotParam ignore_speech_boxes
        hide_speech_boxes
    endif
    if ScreenElementExists id = digital_timer_anchor
        SetScreenElementProps id = digital_timer_anchor hide
    endif
    if ScreenElementExists id = new_ammo_message
        DestroyScreenElement id = new_ammo_message
    endif
    if ScreenElementExists id = new_ammo_message2
        DestroyScreenElement id = new_ammo_message2
    endif
    hide_panel_messages
    menu3d_hide
    pause_balance_meter
    pause_run_timer
    hide_goal_panel_messages
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    hide_3d_goal_arrow
    hide_landing_msg
    hide_console_window
    goal_skate_hide_letters
    hide_combo_letters
    hide_net_scores
    hide_stat_message
    hide_comp_text
    maybehidelensflare
    if NOT LevelIs load_mainmenu
        if NOT InMultiPlayerGame
            change lens_flare_visible_before_pause = (doupdatelensflare)
            change doupdatelensflare = 0
        endif
    endif
    hide_tips
    pause_trick_text
    hide_death_msg
    GoalListReminderHide
    TantrumMessageHide
    if NOT GotParam dont_disable_screen_effects
        pause_bloom_off
    endif
    kill_blur
endscript


script show_all_hud_items 
    show_panel_messages
    GoalManager_ShowGoalPoints
    GoalManager_ShowPoints
    unhide_3d_goal_arrow
    unhide_landing_msg
    unhide_stat_message
    unhide_tips
    goal_skate_unhide_letters
    unhide_combo_letters
    unhide_death_msg
    unhide_comp_text
    GoalListReminderShow
    TantrumMessageShow
    unpause_trick_text
    if NOT InNetGame
        unpause_trick_text
    endif
    Unpause_Balance_Meter
    unpause_run_timer
    pause_bloom_on
    unhide_speech_boxes
    if ScreenElementExists id = cutscene_camera_hud_anchor
        if (camera_hud_is_hidden = 1)
            change camera_hud_is_hidden = 0
            DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 1
        endif
    endif
    if ScreenElementExists id = nightvision_hud_anchor
        if (nightvision_hud_is_hidden = 1)
            change nightvision_hud_is_hidden = 0
            DoScreenElementMorph id = nightvision_hud_anchor alpha = 1
        endif
    endif
    if ScreenElementExists id = the_time
        SetScreenElementProps id = the_time unhide
    endif
    if ScreenElementExists id = digital_timer_anchor
        SetScreenElementProps id = digital_timer_anchor unhide
    endif
    show_goal_panel_messages
    if NOT LevelIs load_mainmenu
        if NOT InMultiPlayerGame
            change doupdatelensflare = 1
            UnHideLensFlare
        endif
    endif
    if NOT InMultiPlayerGame
        GoalManager_ShowPoints
        if NOT GoalManager_HasActiveGoals
            GoalManager_ShowGoalPoints
        else
            GoalManager_HideGoalPoints
        endif
    endif
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 1
    endif
    if (HIDEHUD = 1)
        
        hide_root_window
    endif
    if GetGlobalFlag flag = NO_DISPLAY_HUD
        GoalManager_HideGoalPoints
        GoalManager_HidePoints
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
        unhide_console_window
    else
        hide_console_window
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_NET_SCORES
        unhide_net_scores
    else
        hide_net_scores
    endif
endscript


script hide_speech_boxes 
    if ScreenElementExists id = speech_box_anchor
        SetScreenElementProps id = speech_box_anchor block_events
        DoScreenElementMorph id = speech_box_anchor Scale = 0 relative_scale
    endif
    if ScreenElementExists id = goal_start_dialog
        SetScreenElementProps id = goal_start_dialog block_events
        DoScreenElementMorph id = goal_start_dialog Scale = 0 relative_scale
    endif
    if ScreenElementExists id = ped_speech_dialog
        SetScreenElementProps id = ped_speech_dialog block_events
        DoScreenElementMorph id = ped_speech_dialog Scale = 0 relative_scale
    endif
    if ScreenElementExists id = goal_retry_anchor
        SetScreenElementProps id = goal_retry_anchor block_events
        DoScreenElementMorph id = goal_retry_anchor Scale = 0 relative_scale
    endif
    if ScreenElementExists id = ped_hint_dialog
        SetScreenElementProps id = ped_hint_dialog block_events
        DoScreenElementMorph id = ped_hint_dialog Scale = 0 relative_scale
    endif
endscript


script unhide_speech_boxes 
    if ScreenElementExists id = speech_box_anchor
        SetScreenElementProps id = speech_box_anchor unblock_events
        DoScreenElementMorph id = speech_box_anchor Scale = 1 relative_scale
    endif
    if ScreenElementExists id = goal_start_dialog
        SetScreenElementProps id = goal_start_dialog unblock_events
        DoScreenElementMorph id = goal_start_dialog Scale = 1 relative_scale
    endif
    if ScreenElementExists id = ped_speech_dialog
        SetScreenElementProps id = ped_speech_dialog unblock_events
        DoScreenElementMorph id = ped_speech_dialog Scale = 1 relative_scale
    endif
    if ScreenElementExists id = goal_retry_anchor
        SetScreenElementProps id = goal_retry_anchor unblock_events
        DoScreenElementMorph id = goal_retry_anchor Scale = 1 relative_scale
    endif
    if ScreenElementExists id = ped_hint_dialog
        SetScreenElementProps id = ped_hint_dialog block_events
        DoScreenElementMorph id = ped_hint_dialog Scale = 1 relative_scale
    endif
endscript


script kill_speech_boxes 
    if ScreenElementExists id = speech_box_anchor
        DestroyScreenElement id = speech_box_anchor
    endif
    if ScreenElementExists id = goal_start_dialog
        DestroyScreenElement id = goal_start_dialog
    endif
    if ScreenElementExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    if ScreenElementExists id = goal_retry_anchor
        DestroyScreenElement id = goal_retry_anchor
    endif
    if ScreenElementExists id = ped_hint_dialog
        DestroyScreenElement id = ped_hint_dialog
    endif
endscript


script hide_landing_msg 
    if ObjectExists id = perfect
        DoScreenElementMorph id = perfect time = 0 alpha = 0
    endif
    if ObjectExists id = perfect2
        DoScreenElementMorph id = perfect2 time = 0 alpha = 0
    endif
endscript


script unhide_landing_msg 
    if ObjectExists id = perfect
        DoScreenElementMorph id = perfect time = 0 alpha = 0.5000
    endif
    if ObjectExists id = perfect2
        DoScreenElementMorph id = perfect2 time = 0 alpha = 0.5000
    endif
endscript


script hide_3d_goal_arrow 
    if ScreenElementExists id = DesignerCreated_3DArrowPointer
        DoScreenElementMorph id = DesignerCreated_3DArrowPointer Pos = (320.0, -300.0)
    endif
    if ScreenElementExists id = race_arrow
        DoScreenElementMorph id = race_arrow Pos = (320.0, -300.0)
    endif
    if ScreenElementExists id = ctf_arrow
        DoScreenElementMorph id = ctf_arrow Pos = (320.0, -300.0)
    endif
endscript


script unhide_3d_goal_arrow 
    if ScreenElementExists id = DesignerCreated_3DArrowPointer
        DoScreenElementMorph id = DesignerCreated_3DArrowPointer Pos = (320.0, 70.0)
    endif
    if ScreenElementExists id = race_arrow
        DoScreenElementMorph id = race_arrow Pos = (320.0, 70.0)
    endif
    if ScreenElementExists id = ctf_arrow
        DoScreenElementMorph id = ctf_arrow Pos = (320.0, 70.0)
    endif
endscript


script hide_net_scores 
    if ObjectExists id = net_score_1
        DoScreenElementMorph id = net_score_1 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_2
        DoScreenElementMorph id = net_score_2 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_3
        DoScreenElementMorph id = net_score_3 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_4
        DoScreenElementMorph id = net_score_4 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_5
        DoScreenElementMorph id = net_score_5 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_6
        DoScreenElementMorph id = net_score_6 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_7
        DoScreenElementMorph id = net_score_7 time = 0 Scale = 0
    endif
    if ObjectExists id = net_score_8
        DoScreenElementMorph id = net_score_8 time = 0 Scale = 0
    endif
endscript


script unhide_net_scores 
    if ObjectExists id = net_score_1
        DoScreenElementMorph id = net_score_1 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_2
        DoScreenElementMorph id = net_score_2 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_3
        DoScreenElementMorph id = net_score_3 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_4
        DoScreenElementMorph id = net_score_4 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_5
        DoScreenElementMorph id = net_score_5 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_6
        DoScreenElementMorph id = net_score_6 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_7
        DoScreenElementMorph id = net_score_7 time = 0 Scale = 0.9000
    endif
    if ObjectExists id = net_score_8
        DoScreenElementMorph id = net_score_8 time = 0 Scale = 0.9000
    endif
endscript


script hide_current_goal 
    if ObjectExists id = current_goal
        DoScreenElementMorph id = current_goal time = 0 Scale = 0
    endif
    if ObjectExists id = mp_goal_text
        DoScreenElementMorph id = mp_goal_text time = 0 Scale = 0
    endif
    if ObjectExists id = sc_goal_text
        DoScreenElementMorph id = sc_goal_text time = 0 Scale = 0
    endif
    if ObjectExists id = Eric_score
        DoScreenElementMorph id = Eric_score time = 0 Scale = 0
    endif
    hide_key_combo_text
endscript

comp_texts = [Eric_Text Ron_Text Johnny_Text Chicken_Text Raven_Text final_scores goal_comp_out_of_bounds_warning]

script hide_comp_text 
    GetArraySize comp_texts
    <index> = 0
    begin 
    <id> = (comp_texts [ <index> ])
    if ObjectExists id = <id>
        DoScreenElementMorph id = <id> time = 0 Scale = 0
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script unhide_comp_text 
    GetArraySize comp_texts
    <index> = 0
    begin 
    <id> = (comp_texts [ <index> ])
    if ObjectExists id = <id>
        DoScreenElementMorph id = <id> time = 0 Scale = 1
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script unhide_current_goal 
    if ObjectExists id = current_goal
        DoScreenElementMorph id = current_goal time = 0 Scale = 0.8300
    endif
    if ObjectExists id = mp_goal_text
        DoScreenElementMorph id = mp_goal_text time = 0 Scale = 0.8300
    endif
    if ObjectExists id = sc_goal_text
        DoScreenElementMorph id = sc_goal_text time = 0 Scale = 0.8300
    endif
    if ObjectExists id = Eric_score
        DoScreenElementMorph id = Eric_score time = 0 Scale = 0.8300
    endif
    unhide_key_combo_text
endscript


script hide_death_msg 
    if ObjectExists id = death_message
        DoScreenElementMorph id = death_message time = 0 Scale = 0
    endif
endscript


script unhide_death_msg 
    if ObjectExists id = death_message
        DoScreenElementMorph id = death_message time = 0 Scale = 1
    endif
endscript


script hide_tips 
    if ObjectExists id = skater_hint
        DoScreenElementMorph id = skater_hint time = 0 Pos = (320.0, 11050.0)
    endif
endscript


script unhide_tips 
    if ObjectExists id = skater_hint
        DoScreenElementMorph id = skater_hint time = 0 Pos = (320.0, 150.0)
    endif
endscript


script pause_rain 
    if issoundplaying TestLight01
        change Paused_Light_Rain = 1
    endif
    if issoundplaying TestMedium02
        change Paused_Heavy_Rain = 1
    endif
endscript


script unpause_rain 
    if NOT LevelIs load_mainmenu
        if (Paused_Light_Rain = 1)
            if issoundplaying TestLight01
                if NOT GotParam dont_unpause_rain_sounds
                    if (Inside_Light_Rain = 1)
                        setsoundparams TestLight01 vol = (LightRainVolume * 0.1000)
                    else
                        setsoundparams TestLight01 vol = LightRainVolume
                    endif
                endif
            endif
            change Paused_Light_Rain = 0
        endif
        if (Paused_Heavy_Rain = 1)
            if issoundplaying TestLight02
                if NOT GotParam dont_unpause_rain_sounds
                    if (Inside_Heavy_Rain = 1)
                        setsoundparams TestLight02 vol = (LightRainVolume * 0.1000)
                    else
                        setsoundparams TestLight02 vol = LightRainVolume
                    endif
                endif
            endif
            if issoundplaying TestMedium02
                if NOT GotParam dont_unpause_rain_sounds
                    if (Inside_Heavy_Rain = 1)
                        setsoundparams TestMedium02 vol = (MediumRainVolume * 0.1000)
                    else
                        setsoundparams TestMedium02 vol = MediumRainVolume
                    endif
                endif
            endif
            change Paused_Heavy_Rain = 0
        endif
    endif
endscript


script menu_quit_no 
    generic_menu_pad_back_sound
    dialog_box_exit
    create_pause_menu
endscript


script bootstrap_quit 
    dialog_box_exit
    SetButtonEventMappings block_menu_input
    skater ::disableplayerinput
    pausegame
    cleanup
    DisplayLoadingScreen 'loadscrn_marketing'
    wait 5 seconds
    exitdemo
endscript


script change_gamemode_career 
    
    EnableSun
    SetGameType career
    SetCurrentGameType
endscript


script change_gamemode_classic 
    
    EnableSun
    SetGameType classic
    SetCurrentGameType
endscript


script change_gamemode_net 
    
    DisableSun
    SetGameType net
    SetCurrentGameType
endscript


script change_gamemode_singlesession 
    EnableSun
    SetGameType singlesession
    SetCurrentGameType
endscript


script change_gamemode_freeskate_2p 
    DisableSun
    SetGameType freeskate2p
    SetCurrentGameType
endscript


script change_gamemode_creategoals 
    EnableSun
    SetGameType creategoals
    SetCurrentGameType
endscript


script menu_select menu_select_script = item_chosen
    if GotParam stop_streams
        StopStream
    endif
    if GotParam stop_vibration
    endif
    exit_pause_menu
    <menu_select_script>
endscript


script item_chosen menu_id = current_menu_anchor
    
    RunScriptOnScreenElement id = <menu_id> animate_out callback = create_pause_menu
endscript


script make_text_menu_item {focus_script = do_scale_up
        unfocus_script = do_scale_down
        pad_choose_script = item_chosen
        pad_back_script = exit_pause_menu
        font_face = small}
    CreateScreenElement {
        type = TextElement parent = current_menu
        id = <id>
        text = <text>
        font = <font_face>
        rgba = [ 128 128 128 75 ]
        event_handlers = [
            { focus <focus_script> }
            { unfocus <unfocus_script> }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            { pad_back <pad_back_script> }
        ]
    }
endscript


script make_sprite_menu_item 
    make_theme_menu_item <...> dims = (300.0, 18.0) no_angle
endscript


script make_toggle_menu_item {font = small
        child_pos = { (210.0, 0.0) relative }
        rgba = [ 88 105 112 128 ]
        child_rgba = [ 88 105 112 128 ]
        just = [ RIGHT top ]
        child_just = [ left top ]
        child_scale = 1
        focus_script = do_scale_up
        unfocus_script = do_scale_down
        pad_choose_script = item_chosen
        toggle_text = 'off'
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu
        id = <id>
        font = <font>
        Pos = <Pos>
        rgba = <rgba>
        just = <just>
        text = <text>
        Scale = <Scale>
        event_handlers = [
            {focus <focus_script> params = <focus_params>}
            {unfocus <unfocus_script> params = <unfocus_params>}
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <id>
        font = <font>
        Pos = <child_pos>
        rgba = <child_rgba>
        just = <child_just>
        text = <toggle_text>
        Scale = <child_scale>
    }
endscript


script toggle_menu_item_on {
        toggle_text = 'on'
    }
    SetScreenElementProps {
        id = {<id> child = 0}
        text = <toggle_text>
    }
endscript


script toggle_menu_item_off {
        toggle_text = 'off'
    }
    SetScreenElementProps {
        id = {<id> child = 0}
        text = <toggle_text>
    }
endscript


script animate_in 
    SetButtonEventMappings block_menu_input
    SetScreenElementProps id = root_window tags = { menu_state = entering }
    DoMorph time = 0 Scale = 0 alpha = 0
    FireEvent type = focus target = <menu_id>
    DoMorph time = 0.07000 Scale = 1.100 alpha = 0.4000
    DoMorph time = 0.07000 Scale = 0.9500 alpha = 1
    DoMorph time = 0.07000 Scale = 1.0
    SetScreenElementProps id = root_window tags = { menu_state = on }
    if NOT GotParam dont_unblock
        SetButtonEventMappings unblock_menu_input
    endif
endscript


script menu_onscreen menu_id = current_menu_anchor
    DoMorph Scale = 1 time = 0
    if GotParam Pos
        DoMorph Pos = <Pos>
    endif
    setprops just = [ center center ]
    gettags
    if GotParam focus_child
        FireEvent type = focus target = <menu_id> Data = { child_id = <focus_child> }
    else
        FireEvent type = focus target = <id>
    endif
    if NOT GotParam preserve_menu_state
        SetScreenElementProps id = root_window tags = { menu_state = on }
    endif
endscript


script animate_out menu_id = current_menu_anchor
    SetButtonEventMappings block_menu_input
    SetScreenElementProps id = root_window tags = { menu_state = leaving }
    gettags
    setprops just = [ center center ]
    DoMorph time = 0 Scale = 1.0
    DoMorph time = 0.07000 Scale = 1.300
    DoMorph time = 0.05000 Scale = 1.400 alpha = 0.05000
    DoMorph time = 0.1500 Scale = 0.0 alpha = 0
    SetScreenElementProps id = root_window tags = { menu_state = Off }
    SetScreenElementLock id = root_window Off
    DestroyScreenElement id = <menu_id>
    SetButtonEventMappings unblock_menu_input
endscript


script menu_offscreen 
    SetScreenElementProps id = root_window tags = { menu_state = Off }
    SetScreenElementLock id = root_window Off
    gettags
    FireEvent type = unfocus target = <id>
    DestroyScreenElement id = <id> recurse
endscript


script scale_sprite_up 
    DoMorph time = 0 Scale = 0 alpha = 0
    wait 0.2000 second
    DoMorph time = 0 Scale = 4.500 alpha = 0 rot_angle = 0
    DoMorph time = 0.2000 rot_angle = 0 Scale = 0.9500 alpha = 0.5500
endscript


script scale_sprite_down 
    DoMorph time = 0 rot_angle = 0 Scale = 0
endscript


script do_scale_up rgba = [ 127 102 0 100 ]
    gettags
    setprops rgba = <rgba>
    RunScriptOnScreenElement id = <id> do_random_effect params = { id = <id> }
endscript


script do_scale_down rgba = [ 88 105 112 128 ]
    if NOT GotParam no_sound
        generic_menu_pad_up_down_sound
    endif
    KillSpawnedScript name = do_random_effect
    setprops no_blur_effect
    setprops rgba = <rgba>
endscript


script do_random_effect 
    gettags
    settags random_effect_done = 0
    RunScriptOnScreenElement id = <id> do_random_effect2
    begin 
    gettags
    if (<random_effect_done> = 1)
        settags random_effect_done = 0
        RunScriptOnScreenElement id = <id> do_random_effect2 params = {
            id = <id>
            effect = Random (@ 2 @ 6 @ 5 @ 8 @ 2 @ 1 @ 5 @ 2 @ 3 @ 5 @ 2 @ 10 @ 1 @ 2 @ 3 @ 5 @ 2 @ 3 @ 8 @ 3 @ 5 @ 9 @ 2 @ 9 @ 5 @ 2 @ 3 @ 5 @ 6 @ 2 @ 1 @ 9 @ 5 @ 3 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 6 @ 1)
            <...> 
        }
    endif
    wait 4 frame
    repeat 
endscript


script do_random_effect2 orig_rot = 0
    switch <effect>
        case 1
        DoMorph time = 0.04000 Scale = (1.2000000476837158, 0.9700000286102295) alpha = 0.1000 relative_scale rot_angle = (-8 + <orig_rot>)
        DoMorph time = 0.04000 Scale = 1 alpha = 1 relative_scale rot_angle = (0 + <orig_rot>)
        case 2
        DoMorph time = 0.05000 Pos = { (-0.75, 0.5) relative }
        DoMorph time = 0.05000 Pos = { (1.5, -1.0) relative }
        DoMorph time = 0.05000 Pos = { (-0.75, 0.5) relative }
        case 3
        DoMorph time = 0.05000 alpha = 0.6000 Scale = 1.200 relative_scale
        DoMorph time = 0.05000 alpha = 1 Scale = 1 relative_scale
        case 4
        setprops blur_effect
        do_blur_effect_highlight
        setprops no_blur_effect
        case 5
        DoMorph time = 0.05000 Pos = { (-1.5, 0.5) relative }
        DoMorph time = 0.05000 Pos = { (3.0, -1.0) relative }
        DoMorph time = 0.05000 Pos = { (-1.5, 0.5) relative }
        case 6
        DoMorph time = 0.05000 Pos = { (-0.75, 1.5) relative }
        DoMorph time = 0.05000 Pos = { (1.5, -3.0) relative }
        DoMorph time = 0.05000 Pos = { (-0.75, 1.5) relative }
        case 7
        setprops blur_effect
        do_blur_effect_accept
        setprops no_blur_effect
        case 8
        DoMorph time = 0.05000 Scale = 1.300 relative_scale
        DoMorph time = 0.05000 Scale = 1 relative_scale
        case 9
        DoMorph time = 0.04000 Scale = (0.949999988079071, 0.6499999761581421) alpha = 0.8000 relative_scale
        DoMorph time = 0.04000 Scale = 1 alpha = 1 relative_scale
        case 10
        DoMorph time = 0.05000 Pos = { (-2.0, 0.0) relative }rot_angle = (0 + <orig_rot>)
        DoMorph time = 0.05000 Pos = { (4.0, 0.0) relative }rot_angle = (2 + <orig_rot>)
        DoMorph time = 0.05000 Pos = { (-2.0, 0.0) relative }rot_angle = (0 + <orig_rot>)
        default 
        setprops blur_effect
        do_blur_effect
        setprops no_blur_effect
    endswitch
    settags random_effect_done = 1
endscript


script do_random_effect_paused 
    gettags
    settags random_effect_done = 0
    RunScriptOnScreenElement id = <id> do_random_effect_paused_2
    begin 
    gettags
    if (<random_effect_done> = 1)
        settags random_effect_done = 0
        RunScriptOnScreenElement id = <id> do_random_effect_paused_2 params = {
            id = <id>
            effect = Random (@ 2 @ 3 @ 5 @ 8 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 2 @ 10 @ 3 @ 2 @ 3 @ 5 @ 2 @ 3 @ 8 @ 3 @ 5 @ 9 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 6 @ 2 @ 3 @ 9 @ 5 @ 3 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 2 @ 3 @ 5 @ 6 @ 7 @ 1)
        }
    endif
    wait 10 frame
    repeat 
endscript


script do_random_effect_paused_2 
    switch <effect>
        case 1
        DoMorph time = 0.04000 alpha = 0.1000
        DoMorph time = 0.04000 alpha = 0.2000
        case 2
        DoMorph time = 0.05000 alpha = 0.6000
        DoMorph time = 0.05000 alpha = 1
        case 3
        DoMorph time = 0.05000 alpha = 0.6000
        DoMorph time = 0.05000 alpha = 1
        case 4
        setprops blur_effect
        do_blur_effect_highlight
        setprops no_blur_effect
        case 5
        DoMorph time = 0.05000 Pos = { (-1.5, 0.5) relative }
        DoMorph time = 0.05000 Pos = { (3.0, -1.0) relative }
        DoMorph time = 0.05000 Pos = { (-1.5, 0.5) relative }
        case 6
        DoMorph time = 0.05000 Pos = { (-0.75, 1.5) relative }
        DoMorph time = 0.05000 Pos = { (1.5, -3.0) relative }
        DoMorph time = 0.05000 Pos = { (-0.75, 1.5) relative }
        case 7
        DoMorph time = 0.4000 alpha = 0
        DoMorph time = 4 alpha = 0
        DoMorph time = 0.05000 alpha = 1
        case 8
        DoMorph time = 1 alpha = 0
        DoMorph time = 0.05000 alpha = 1
        case 9
        DoMorph time = 0.04000 alpha = 0.8000
        DoMorph time = 0.04000 alpha = 1
        case 10
        DoMorph time = 3 alpha = 0
        DoMorph time = 0.05000 alpha = 1
        default 
        setprops blur_effect
        do_blur_effect
        setprops no_blur_effect
    endswitch
    settags random_effect_done = 1
endscript


script hide_root_window 
    DoScreenElementMorph id = root_window Scale = 0
endscript


script unhide_root_window 
    DoScreenElementMorph id = root_window Scale = 1
endscript


script generic_menu_update_arrows menu_id = current_menu
    if NOT ObjectExists id = <up_arrow_id>
        return 
    endif
    if NOT ObjectExists id = <down_arrow_id>
        return 
    endif
    if MenuSelectedIndexIs id = <menu_id> first
        SetScreenElementProps {
            id = <up_arrow_id>
            rgba = [ 128 128 128 0 ]
        }
    else
        SetScreenElementProps {
            id = <up_arrow_id>
            rgba = [ 128 128 128 128 ]
        }
    endif
    if MenuSelectedIndexIs id = <menu_id> last
        SetScreenElementProps {
            id = <down_arrow_id>
            rgba = [ 128 128 128 0 ]
        }
    else
        SetScreenElementProps {
            id = <down_arrow_id>
            rgba = [ 128 128 128 128 ]
        }
    endif
endscript


script generic_menu_pad_back 
    
    generic_menu_pad_back_sound
    if GotParam callback
        <callback> <...> 
    endif
endscript


script generic_menu_pad_choose 
    if GotParam callback
        <callback> <...> 
    endif
endscript


script generic_menu_buzzer_sound 
    playsound GUI_Buzzer01 vol = 100
endscript


script generic_menu_pad_back_sound 
    StopSound SK6_Menu_Back
    playsound SK6_Menu_Back
endscript


script generic_menu_pad_up_down_sound 
endscript


script generic_menu_pad_choose_sound 
    StopSound ThisMenuSelectSound
    playsound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound
endscript

disable_menu_sounds = 0

script generic_menu_up_or_down_sound menu_id = current_menu
    if (disable_menu_sounds = 0)
        if GotParam up
            playsound SK6_Menu_Move pitch = 120 vol = 50
        endif
        if GotParam down
            playsound SK6_Menu_Move pitch = 100 vol = 50
        endif
    endif
endscript


script generic_menu_scroll_sideways_sound 
    if (disable_menu_sounds = 0)
        playsound MenuUp vol = 100
    endif
endscript


script parked_scroll_sideways_sound 
    playsound MenuUp vol = 100
endscript


script generic_keyboard_sound 
endscript


script theme_menu_pad_choose_sound 
    StopSound ThisMenuSelectSound
    playsound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound
endscript


script generic_pause_exit_sound 
    StopSound SK6_Menu_Back
    playsound SK6_Menu_Back
endscript


script pause_show_deck active_viewport = 0 node = TRG_Restart01 parent = root_window
    kill_pause_deck
    if NOT ObjectExists id = skater
        return 
    endif
    if IsObserving
        return 
    endif
    if NOT ScreenElementExists id = <parent>
        
        return 
    endif
    SetScreenElementLock id = <parent> Off
    if GotParam no_slide
        Pos = (360.0, 220.0)
    else
        Pos = (800.0, 220.0)
    endif
    GetSkaterId
    if GetPlayerAppearancePart player = <ObjID> part = board
        CreateScreenElement {
            parent = <parent>
            type = element3d
            id = pause_deck
            SkeletonName = THPS6_human
            clonemodel = <ObjID>
            CloneModelGeoms = [ board ]
            texDictOffset = 20
            Pos = <Pos>
            cameraz = -6
            Scale = 0.1200
            tilt = 0
            pivotpoint = (0.0, 4.119999885559082, 0.0)
            active_viewport = <active_viewport>
            angleorderxyz
            anglex = -1.570
            angley = 0
            anglez = 0.4000
        }
        SpawnScript rotate_pause_deck <no_slide>
    endif
endscript


script kill_pause_deck 
    if ObjectExists id = pause_deck
        KillSpawnedScript name = rotate_pause_deck
        DestroyScreenElement id = pause_deck
    endif
endscript


script rotate_pause_deck 
    if NOT ObjectExists id = pause_deck
        return 
    endif
    rot_angle = 0
    DoScreenElementMorph time = 0.2500 id = pause_deck Pos = (360.0, 220.0)
    begin 
    if NOT ObjectExists id = pause_deck
        return 
    endif
    SetScreenElementProps id = pause_deck angley = <rot_angle>
    rot_angle = (<rot_angle> + 0.06250)
    wait 1 gameframes
    repeat 
endscript


script fadetoblack time = 0.5000 alpha = 0.5000 z_priority = 9000 rgba = [ 0 0 0 128 ] Scale = (300.0, 200.0) texture = black id = screenfader Pos = (320.0, 240.0) parent = root_window
    if GotParam on
        if NOT ScreenElementExists id = <id>
            SetScreenElementLock Off id = <parent>
            if NOT GotParam create_script
                CreateScreenElement {
                    type = SpriteElement
                    parent = <parent>
                    id = <id>
                    texture = <texture>
                    Pos = <Pos>
                    rgba = <rgba>
                    just = [ center center ]
                    Scale = <Scale>
                    alpha = 0
                    z_priority = <z_priority>
                    no_zwrite
                }
            else
                <create_script>
            endif
            DoScreenElementMorph id = <id> time = <time> alpha = <alpha>
        endif
    endif
    if GotParam Off
        if ScreenElementExists id = <id>
            DoScreenElementMorph id = <id> time = <time> alpha = 0
            if NOT (<time> = 0.0)
                
                wait <time> seconds
            endif
            if ScreenElementExists id = <id>
                DestroyScreenElement id = <id>
            endif
        endif
    endif
endscript

