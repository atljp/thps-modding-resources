default_user_difficulty = 1
default_user_axis_inversion = 1

script create_options_menu 
    hide_current_goal
    make_label_menu {
        Title = 'OPCJE GRY'
        title_pos = (100.0, 40.0) Pos = (130.0, 120.0) title_rotation = 10
        spacing = 1
        pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_pause_menu }
    }
    if NOT InSplitScreenGame
        pause_menu_gradient
    endif
    pad_back_script = create_pause_menu
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    unhide_root_window
    white_poly_bg_effect
    if NOT (DEMO_BUILD)
        if NOT InMultiPlayerGame
            if IsNGC
                switch camera_angle
                    case 0
                    camera_text = 'CAMERA ANGLE: 1'
                    case 1
                    camera_text = 'CAMERA ANGLE: 2'
                    case 2
                    camera_text = 'CAMERA ANGLE: 3'
                    case 3
                    camera_text = 'CAMERA ANGLE: 4'
                endswitch
                add_label_menu_item {
                    text = <camera_text>
                    rot = -2
                    Length = 450
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_camera pad_choose_script = toggle_camera_angle pad_choose_params = {}
                }
            endif
        else
            if InNetGame
                if NOT ((IsTrue bootstrap_build)|| (IsTrue DEMO_BUILD))
                    if NOT cd
                        add_label_menu_item {
                            text = 'CHEATY: NIE TESTUJ'
                            rot = 0
                            Length = 300
                            Scale = 0.9000
                            label_offset = (-20.0, 0.0)
                            id = menu_end_high_score_run
                            pad_choose_script = menu_select
                            pad_choose_params = { menu_select_script = end_high_score_run }
                        }
                    endif
                endif
            endif
        endif
    endif
    add_label_menu_item {
        text = 'OPCJE DWIÊKU'
        rot = 1
        Length = 220
        Scale = 0.9000
        label_offset = (-20.0, 0.0)
        id = menu_sound_options pad_choose_script = launch_sound_options_menu pad_choose_params = { from_options }
    }
    if NOT InSplitScreenGame
        if NOT InNetGame
            add_label_menu_item {
                text = 'USTAWIENIA STEROWANIA'
                rot = 0.5000
                Length = 210
                Scale = 0.9000
                label_offset = (-10.0, 0.0)
                id = options_controller
                pad_choose_script = create_controller_config_menu
                pad_choose_params = { controller_number = 1 from_options }
            }
        endif
    endif
    if ((IsXbox)|| (isPC))
        add_label_menu_item {
            text = 'DOPASOWANIE GAMMA'
            rot = 3
            Length = 180
            Scale = 0.9000
            label_offset = (-10.0, 0.0)
            id = menu_gamma pad_choose_script = create_gamma_menu
        }
    else
        add_label_menu_item {
            text = 'TRYB EKRANU'
            rot = 3
            Length = 180
            Scale = 0.9000
            label_offset = (-30.0, 0.0)
            id = menu_screen pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_screen_menu }
        }
    endif
    add_label_menu_item {
        text = 'OPCJE WYWIETLANIA'
        rot = 3
        Length = 240
        Scale = 0.9000
        label_offset = (-17.0, 0.0)
        id = menu_display_options pad_choose_script = launch_display_options_menu pad_choose_params = { from_options }
    }
    if NOT (DEMO_BUILD)
        if InNetGame
            if InTeamGame
                GetPreferenceString pref_type = network score_display
                add_label_menu_item {
                    text = 'TRYB WYWIETLANIA WYNIKU'
                    rot = 0
                    Length = 300
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_score_display pad_choose_script = create_options_score_display_menu
                }
                add_label_menu_item {
                    text = <ui_string>
                    rot = 1
                    Length = 300
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_score_display_str rgba = [ 80 80 80 128 ] not_focusable
                }
            endif
            GetPreferenceString pref_type = network auto_brake
            FormatText textname = AutoBrake_toggle_text 'AUTO-HAMOWANIE: %s' s = <ui_string>
            add_label_menu_item {
                text = <AutoBrake_toggle_text>
                rot = 0
                Length = 300
                Scale = 0.9000
                label_offset = (-35.0, 0.0)
                id = menu_auto_brake pad_choose_script = toggle_auto_brake_option toggle_pos = (163.0, 12.0)
            }
            GetPreferenceString pref_type = network auto_brake
            if (<ui_string> = 'Wy³.')
                set_restart_not_focusable = not_focusable
            endif
            if GameModeEquals is_lobby
                if NOT IsObserving
                    if skater ::obj_flagset FLAG_SKATER_KILLING
                        set_restart_not_focusable = not_focusable
                    endif
                    if skater ::skating
                        if skater ::onlip
                            set_restart_not_focusable = not_focusable
                        else
                            if skater ::onrail
                                set_restart_not_focusable = not_focusable
                            endif
                        endif
                    endif
                    if skater ::InAir
                        set_restart_not_focusable = not_focusable
                    endif
                    if skater ::Walk_Air
                        set_restart_not_focusable = not_focusable
                    endif
                    if skater ::walking
                        skater ::Walk_GetState
                        if (<state> = walking_hang || <state> = WALKING_LADDER || <state> = WALKING_ANIMWAIT)
                            set_restart_not_focusable = not_focusable
                        endif
                    endif
                    add_label_menu_item {
                        text = 'USTAW PUNKT RESTARTU'
                        rot = 0
                        Length = 160
                        Scale = 0.9000
                        label_offset = (-20.0, 0.0)
                        id = menu_set_custom
                        pad_choose_script = menu_select
                        pad_choose_params = { menu_select_script = set_custom_restart }
                        not_focusable = <set_restart_not_focusable>
                    }
                    if skater ::SetCustomRestart
                        add_label_menu_item {
                            text = 'WYKONAJ RESTART'
                            rot = -1
                            Length = 160
                            Scale = 0.9000
                            label_offset = (-20.0, 0.0)
                            id = menu_skip_to_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = skip_to_custom_restart }
                        }
                    else
                        add_label_menu_item {
                            text = 'WYKONAJ RESTART'
                            rot = -1
                            Length = 160
                            Scale = 0.9000
                            label_offset = (-5.0, 0.0)
                            id = menu_skip_to_custom not_focusable
                        }
                    endif
                else
                    add_label_menu_item {
                        text = 'USTAW PUNKT RESTARTU'
                        rot = 0
                        Length = 160
                        Scale = 0.9000
                        label_offset = (-20.0, 0.0)
                        id = menu_set_custom not_focusable
                    }
                    add_label_menu_item {
                        text = 'WYKONAJ RESTART'
                        rot = 0
                        Length = 160
                        Scale = 0.9000
                        label_offset = (-20.0, 0.0)
                        id = menu_set_custom not_focusable
                    }
                endif
            endif
        endif
    endif
    if NOT (DEMO_BUILD)
        if NOT InMultiPlayerGame
            add_label_menu_item {
                text = 'KODY'
                rot = 1
                Length = 110
                Scale = 0.9000
                label_offset = (-20.0, 0.0)
                id = menu_real_cheats pad_choose_script = create_real_cheats_menu
            }
        endif
    endif
    printstruct <...> 
    if InNetGame
        if GameModeEquals is_lobby
            if IsObserving
                NoCustomRestarts = 1
            else
                if NOT ObjectExists id = skater
                    NoCustomRestarts = 1
                else
                    if skater ::skating
                        if skater ::onlip
                            NoCustomRestarts = 1
                        else
                            if skater ::onrail
                                NoCustomRestarts = 1
                            endif
                        endif
                    else
                        if skater ::walking
                            skater ::Walk_GetState
                            if (<state> = walking_hang || <state> = WALKING_LADDER || <state> = WALKING_ANIMWAIT)
                                NoCustomRestarts = 1
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        if GoalManager_HasActiveGoals count_all
            NoCustomRestarts = 1
        else
            if skater ::playerinputisdisabled
                NoCustomRestarts = 1
            else
                if skater ::skating
                    if skater ::onlip
                        NoCustomRestarts = 1
                    else
                        if skater ::onrail
                            NoCustomRestarts = 1
                        endif
                    endif
                else
                    if skater ::walking
                        skater ::Walk_GetState
                        if (<state> = walking_hang || <state> = WALKING_LADDER || <state> = WALKING_ANIMWAIT)
                            NoCustomRestarts = 1
                        endif
                    endif
                endif
            endif
        endif
    endif
    label_menu_finish
endscript
camera_angle = 0

script toggle_camera_angle 
    switch camera_angle
        case 0
        change camera_angle = 1
        SetScreenElementProps id = { menu_camera child = 0 }text = 'K¥T KAMERA: 2'
        ToggleSkaterCamMode skater = 0
        case 1
        change camera_angle = 2
        SetScreenElementProps id = { menu_camera child = 0 }text = 'K¥T KAMERA: 3'
        ToggleSkaterCamMode skater = 0
        case 2
        change camera_angle = 3
        SetScreenElementProps id = { menu_camera child = 0 }text = 'K¥T KAMERA: 4'
        ToggleSkaterCamMode skater = 0
        case 3
        change camera_angle = 0
        SetScreenElementProps id = { menu_camera child = 0 }text = 'K¥T KAMERA: 1'
        ToggleSkaterCamMode skater = 0
    endswitch
endscript

script create_real_cheats_menu back_script = create_options_menu
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if InSplitScreenGame
        GoalManager_HidePoints
    endif
    if InNetGame
        make_new_themed_scrolling_menu Title = '>ADVANCED OPTIONS<' dims = (600.0, 237.0) Pos = (229.0, 80.0) right_bracket_z = 1
    else
        make_new_themed_scrolling_menu Title = 'KODY' dims = (600.0, 237.0) Pos = (229.0, 80.0) right_bracket_z = 1
    endif
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = <back_script> }}
        ]
    }
    create_helper_text generic_helper_text_toggle
    kill_start_key_binding
    if NOT InNetGame
        if GetGlobalFlag flag = CHEAT_UNLOCKED_1
            make_cheats_menu_item text = 'Fajne triki specjalne' cheat_flag = CHEAT_COOL_SPECIAL_TRICKS pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
        endif
    endif
    if NOT InNetGame
        if GetGlobalFlag flag = CHEAT_UNLOCKED_3
            make_cheats_menu_item {
                text = 'Tryb dzieciêcy'
                cheat_flag = CHEAT_KID
                pad_choose_script = toggle_cheat
                pad_choose_params = {
                    on_callback = refresh_skater_model_for_cheats
                    off_callback = refresh_skater_model_for_cheats
                }
            }
        endif
    endif
    if InNetGame
        make_cheats_menu_item {
            text = 'Extreme Blood'
            cheat_flag = CHEAT_SUPER_BLOOD
            pad_choose_script = toggle_cheat
            pad_choose_params = {
                on_callback = refresh_skater_model_for_cheats
                off_callback = refresh_skater_model_for_cheats
            }
        }
    endif
    make_cheats_menu_item text = 'Flame' cheat_flag = CHEAT_FLAME pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
    if NOT InNetGame
        if GetGlobalFlag flag = CHEAT_UNLOCKED_12
            make_cheats_menu_item text = 'Special zaw. pe³ny' cheat_flag = cheat_always_special pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
        endif
    endif
    if NOT InNetGame
        if GetGlobalFlag flag = CHEAT_UNLOCKED_13
            make_cheats_menu_item text = 'Ideal. równ. na rail.' cheat_flag = cheat_perfect_rail pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
        endif
    endif
    if NOT InNetGame
        if GetGlobalFlag flag = CHEAT_UNLOCKED_14
            make_cheats_menu_item text = 'Doskona³y skitch' cheat_flag = cheat_perfect_skitch pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
        endif
    endif
    if NOT InNetGame
        if GetGlobalFlag flag = CHEAT_UNLOCKED_16
            make_cheats_menu_item text = 'Doskona³y Manual' cheat_flag = cheat_perfect_manual pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
        endif
    endif
    make_cheats_menu_item text = 'Moon Gravity' cheat_flag = CHEAT_MOON pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript}
    if InNetGame
        if ishost
            make_cheats_menu_item text = 'No Reverts' cheat_flag = flag_g_expert_mode_no_reverts pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
            make_cheats_menu_item text = 'No Caveman' cheat_flag = flag_g_expert_mode_no_walking pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
            make_cheats_menu_item text = 'No Manuals' cheat_flag = flag_g_expert_mode_no_manuals pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
            make_cheats_menu_item text = 'No Bal. Meter' cheat_flag = no_g_display_balance pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
            make_cheats_menu_item text = 'Perfect Rail' cheat_flag = cheat_perfect_rail pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
            make_cheats_menu_item text = 'Perfect Manual' cheat_flag = cheat_perfect_manual pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
            make_cheats_menu_item text = 'No Chat Window' cheat_flag = NO_DISPLAY_CHATWINDOW pad_choose_script = toggle_cheat pad_choose_params = {on_callback = NullScript off_callback = NullScript reverse}
        endif
    endif
    theme_menu_add_item text = 'Zrobione' id = menu_done Scale = 1.0 pad_choose_script = <back_script> no_bg highlight_bar_scale = (2.799999952316284, 0.800000011920929)
    finish_themed_scrolling_menu bg_width = 4.0 time = 0.2000
endscript

script make_cheats_menu_item {focus_script = do_scale_up
        unfocus_script = do_scale_down
        pad_choose_script = NullScript
        font_face = small
        parent_menu_id = current_menu
        Scale = 0.8000
        dims = (350.0, 14.0)
        rgba = [ 88 105 112 128 ]
    }
    pad_choose_params = {cheat_flag = <cheat_flag> <pad_choose_params>}
    if GotParam not_focusable
        CreateScreenElement {
            type = TextElement
            parent = <parent_menu_id>
            id = <id>
            text = <text>
            font = <font_face>
            rgba = [ 30 30 30 128 ]
            Scale = <Scale>
            dims = <dims>
            not_focusable
        }
    else
        if (GetGlobalFlag flag = <cheat_flag>)
            on_off_text = 'W³.'
        else
            on_off_text = 'Wy³.'
        endif
        theme_menu_add_item text = <text> id = <checksum> highlight_bar_scale = (2.799999952316284, 0.800000011920929) extra_text = <on_off_text> no_bg pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>
    endif
endscript

script create_controller_config_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if GotParam controller_number
        if (<controller_number> = -1)
            FormatText textname = menu_title 'POWSZECHNY' n = <controller_number>
        else
            FormatText textname = menu_title 'GRACZ %n' n = <controller_number>
        endif
        helper_text = {helper_text_elements = [{ text = '\b7/\b4 = Zaznacz' }
                { text = '\b6/\b5 = Dostosuj' }
                { text = '\m1 = Wstecz' }
                { text = '\m0 = Akceptuj' }
            ]
        }
    else
        menu_title = 'USTAWIENIA STEROWANIA'
        helper_text = {helper_text_elements = [{ text = '\b7/\b4 = Zaznacz' }
                { text = '\m1 = Wstecz' }
                { text = '\m0 = Akceptuj' }
            ]
        }
    endif
    make_label_menu {
        menu_id = menu_control
        vmenu_id = vmenu_control
        Title = <menu_title>
        title_pos = (30.0, 40.0)
        title_rotation = -6
        Pos = (105.0, 120.0)
        spacing = 6
    }
    if InFrontend
        change joystick_pushed = 0
        control_options_graphic
        SetScreenElementProps {
            id = vmenu_control
            event_handlers = [
                {pad_up animate_joystick params = { dir = up }}
                {pad_down animate_joystick params = { dir = down }}
            ]
        }
    endif
    kill_start_key_binding
    if IsNGC
        vibration_text = 'DUDNIENIE:'
    else
        vibration_text = 'WIBRACJE:'
    endif
    if GotParam from_options
        <from_options> = from_options
    endif
    if GotParam controller_number
        if GotParam from_options
            SetScreenElementProps {
                id = vmenu_control
                event_handlers = [
                    {pad_back generic_menu_pad_back params = {callback = controller_config_exit from_options = <from_options>}}
                ]
            }
        else
            SetScreenElementProps {
                id = vmenu_control
                event_handlers = [
                    {pad_back generic_menu_pad_back params = {callback = create_controller_config_menu from_options = <from_options>}}
                ]
            }
        endif
        if NOT (<controller_number> = -1)
            if InFrontend
                pad_left_2 = animate_joystick
                pad_right_2 = animate_joystick
            else
                pad_left_2 = null_script
                pad_right_2 = null_script
            endif
            if VibrationIsOn <player>
                vibration_value = 'W£.'
            else
                vibration_value = 'WY£.'
            endif
            if AutokickIsOn <player>
                autokick_value = 'W£.'
            else
                autokick_value = 'WY£.'
            endif
            if SpinTapsAreOn <player>
                spintaps_value = 'W£.'
            else
                spintaps_value = 'WY£.'
            endif
            add_label_menu_item {
                id = menu_vibration
                text = <vibration_text>
                extra_text = <vibration_value>
                rot = 2
                Length = 288
                label_offset = (-5.0, 0.0)
                pad_choose_script = NullScript
                option_arrows
            }
            SetScreenElementProps {
                id = menu_vibration
                event_handlers = [
                    {pad_left control_change_values params = {vibration controller_number = <controller_number> left}}
                    {pad_right control_change_values params = {vibration controller_number = <controller_number>}}
                    {pad_left <pad_left_2> params = { dir = left }}
                    {pad_right <pad_right_2> params = { dir = RIGHT }}
                ]
            }
            add_label_menu_item {
                id = menu_autokick
                text = 'AUTO-WYKOP:'
                extra_text = <autokick_value>
                label_offset = (5.0, 0.0)
                rot = -1
                Length = 256
                pad_choose_script = NullScript
                option_arrows
            }
            SetScreenElementProps {
                id = menu_autokick
                event_handlers = [
                    {pad_left control_change_values params = {autokick controller_number = <controller_number> left}}
                    {pad_right control_change_values params = {autokick controller_number = <controller_number>}}
                    {pad_left <pad_left_2> params = { dir = left }}
                    {pad_right <pad_right_2> params = { dir = RIGHT }}
                ]
            }
            if NOT IsNGC
                add_label_menu_item {
                    id = menu_spintaps
                    text = '180 SPIN TAPS:'
                    extra_text = <spintaps_value>
                    rot = 1
                    Length = 320
                    pad_choose_script = NullScript
                    option_arrows
                }
                SetScreenElementProps {
                    id = menu_spintaps
                    event_handlers = [
                        {pad_left control_change_values params = {spintaps controller_number = <controller_number> left}}
                        {pad_right control_change_values params = {spintaps controller_number = <controller_number>}}
                        {pad_left <pad_left_2> params = { dir = left }}
                        {pad_right <pad_right_2> params = { dir = RIGHT }}
                    ]
                }
            endif
        endif
        draw_expertoptions = 0
        if NOT GameModeEquals is_career
            if (<controller_number> = 1)
                if NOT InFrontend
                    draw_expertoptions = 1
                endif
            else
                if (<controller_number> = -1)
                    draw_expertoptions = 1
                endif
            endif
        endif
        if (<draw_expertoptions> = 1)
            if ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_reverts))
                flag = not_focusable
            else
                flag = ''
            endif
            add_label_menu_flag_item {
                id = menu_reverts
                flag = FLAG_EXPERT_MODE_NO_REVERTS
                text = 'BEZ REVERTÓW:'
                rot = -2
                Length = 288
                label_offset = (-10.0, 0.0)
                text_offset = (0.0, -2.0)
                pad_choose_script = NullScript
                <flag>
                option_arrows
            }
            if ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
                flag = not_focusable
            else
                flag = ''
            endif
            add_label_menu_flag_item {
                id = menu_manuals
                flag = FLAG_EXPERT_MODE_NO_MANUALS
                text = 'BEZ MANUALI:'
                rot = 1
                Length = 288
                text_offset = (-5.0, 1.0)
                pad_choose_script = NullScript
                <flag>
                option_arrows
            }
            if ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_walking))
                flag = not_focusable
            else
                flag = ''
            endif
            add_label_menu_flag_item {
                id = menu_walking
                flag = FLAG_EXPERT_MODE_NO_WALKING
                text = 'BEZ CHODZENIA:'
                rot = -1
                Length = 288
                text_offset = (-10.0, 0.0)
                pad_choose_script = NullScript
                <flag>
                option_arrows
            }
        endif
        if GotParam from_options
            add_label_menu_item {
                text = 'GOTOWE'
                id = menu_done
                rot = -3
                Length = 64
                text_offset = (0.0, -2.0)
                label_offset = (10.0, 0.0)
                pad_choose_script = generic_menu_pad_choose
                pad_choose_params = {
                    callback = controller_config_exit
                    from_options = <from_options>
                }
            }
        else
            add_label_menu_item {
                text = 'GOTOWE'
                id = menu_done
                rot = -3
                Length = 64
                text_offset = (0.0, -2.0)
                label_offset = (10.0, 0.0)
                pad_choose_script = generic_menu_pad_choose
                pad_choose_params = {
                    callback = create_controller_config_menu
                    from_options = <from_options>
                }
            }
        endif
    else
        SetScreenElementProps {
            id = vmenu_control
            event_handlers = [
                {pad_back generic_menu_pad_back params = {callback = controller_config_exit from_options = <from_options>}}
            ]
        }
        add_label_menu_item {
            text = 'GRACZ !'
            id = menu_controller_1
            rot = -1
            Length = 128
            label_offset = (-5.0, 0.0)
            text_offset = (-5.0, -2.0)
            pad_choose_script = create_controller_config_menu
            pad_choose_params = {
                callback = create_controller_config_menu
                controller_number = 1
                from_options = <from_options>
            }
        }
        add_label_menu_item {
            text = 'GRACZ 2'
            id = menu_controller_2
            rot = 2
            Length = 128
            label_offset = (-15.0, 0.0)
            text_offset = (-10.0, 2.0)
            pad_choose_script = create_controller_config_menu
            pad_choose_params = {
                callback = create_controller_config_menu
                controller_number = 2
                from_options = <from_options>
            }
        }
        add_label_menu_item {
            text = 'POWSZECHNY'
            id = menu_controller_x
            rot = 1
            Length = 128
            label_offset = (-5.0, 0.0)
            text_offset = (-15.0, -3.0)
            pad_choose_script = generic_menu_pad_choose
            pad_choose_params = {
                callback = create_controller_config_menu
                controller_number = -1
                from_options = <from_options>
            }
        }
        add_label_menu_item {
            text = 'GOTOWE'
            id = menu_done
            rot = -3
            Length = 64
            label_offset = (15.0, 0.0)
            text_offset = (-10.0, -2.0)
            pad_choose_script = generic_menu_pad_choose
            pad_choose_params = {
                callback = controller_config_exit
                from_options = <from_options>
            }
        }
    endif
    label_menu_finish
    create_helper_text <helper_text>
endscript

script controller_config_exit 
    KillSpawnedScript \{ name = shake_projector }
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if GotParam \{ from_options }
        create_options_menu
    else
        if GotParam \{ from_movies }
            create_gamemovies_menu
        else
            create_gamesettings_menu
        endif
    endif
endscript

script control_change_values 
    player = (<controller_number> - 1)
    if GotParam vibration
        KillSpawnedScript name = control_menu_vibrate_controller
        if ((IsXbox)|| (isPC))
            Vibrate_Controller_Safe_Explicit actuator = 1 percent = 0 skaternumber = <player>
        else
            VibrateController port = <player> actuator = 1 percent = 0
        endif
        if VibrationIsOn <player>
            VibrationOff <player>
            SetScreenElementProps {
                id = { menu_vibration child = extra_text }text = 'WY£.'
            }
        else
            VibrationOn <player>
            SetScreenElementProps {
                id = { menu_vibration child = extra_text }text = 'W£.'
            }
            SpawnScriptLater control_menu_vibrate_controller params = <...> 
        endif
    endif
    if GotParam autokick
        if AutokickIsOn <player>
            AutokickOff <player>
            SetScreenElementProps {
                id = { menu_autokick child = extra_text }text = 'WY£.'
            }
        else
            AutokickOn <player>
            SetScreenElementProps {
                id = { menu_autokick child = extra_text }text = 'W£.'
            }
        endif
    endif
    if NOT IsNGC
        if GotParam spintaps
            if SpinTapsAreOn <player>
                SpinTapsOff <player>
                SetScreenElementProps {
                    id = { menu_spintaps child = extra_text }text = 'WY£.'
                }
            else
                SpinTapsOn <player>
                SetScreenElementProps {
                    id = { menu_spintaps child = extra_text }text = 'W£.'
                }
            endif
        endif
    endif
    generic_menu_pad_choose_sound
    TemporarilyDisableInput time = 100
endscript

script control_menu_vibrate_controller 
    if ScreenElementExists id = joystick_anchor
        SpawnScriptLater shake_projector params = {id = joystick_anchor amplitude = 5 time = 0.05000}
    endif
    if InFrontend
        if ((IsXbox)|| (isPC))
            Vibrate_Controller_Safe_Explicit actuator = 1 percent = 70 skaternumber = <player>
        else
            if IsNGC
                VibrateController port = 0 actuator = 1 percent = 70 duration = 0.2500 device_num = <device_num>
            else
                VibrateController port = <player> actuator = 1 percent = 70
            endif
        endif
        wait 250
        if ((IsXbox)|| (isPC))
            Vibrate_Controller_Safe_Explicit actuator = 1 percent = 0 skaternumber = <player>
        else
            if IsNGC
                VibrateController port = 0 actuator = 1 percent = 0 device_num = <device_num>
            else
                VibrateController port = <player> actuator = 1 percent = 0
            endif
        endif
        KillSpawnedScript name = shake_projector
    else
        index = 0
        begin 
        if ControllerBoundToSkater controller = <index> skater = <player>
            VibrateController port = <index> actuator = 1 percent = 70 duration = 0.2500 IgnorePause
            wait 250
            VibrateController port = <index> actuator = 1 percent = 0
            KillSpawnedScript name = shake_projector
            break 
        endif
        index = (<index> + 1)
        repeat 4
    endif
    if ScreenElementExists id = joystick_anchor
        DoScreenElementMorph id = joystick_anchor Pos = (340.0, 30.0) time = 0.1000
    endif
endscript
joystick_pushed = 0

script controller_config_focus 
    gettags
    Theme_GetHighlightedTextColorNew \{ return_value = text_color }
    Theme_GetUnhighlightedTextColor \{ return_value = arrow_color }
    main_theme_focus <...> 
    SetScreenElementProps {id = {<id> child = 4}rgba = <text_color>}
    SetScreenElementProps {id = {<id> child = 5}rgba = <arrow_color>}
    SetScreenElementProps {id = {<id> child = 6}rgba = <arrow_color>}
endscript

script controller_config_unfocus 
    gettags
    Theme_GetUnhighlightedTextColorNew \{ return_value = text_color }
    main_theme_unfocus <...> 
    SetScreenElementProps {id = {<id> child = 4}rgba = <text_color>}
    SetScreenElementProps {id = {<id> child = 5}rgba = [ 128 128 128 0 ]}
    SetScreenElementProps {id = {<id> child = 6}rgba = [ 128 128 128 0 ]}
endscript

script create_gamma_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_sub_menu Title = 'GAMMA'
    SetScreenElementProps {
        id = sub_menu
        event_handlers = [{ pad_back create_options_menu }]
        replace_handlers
    }
    GetGammaValues
    FormatText textname = red_text '%i' i = <red>
    FormatText textname = green_text '%i' i = <green>
    FormatText textname = blue_text '%i' i = <blue>
    theme_menu_add_item text = 'Czerwony:' extra_text = <red_text> id = gamma_menu_red
    theme_menu_add_item text = 'Zielony:' extra_text = <green_text> id = gamma_menu_green
    theme_menu_add_item text = 'Niebieski:' extra_text = <blue_text> id = gamma_menu_blue
    theme_menu_add_item text = 'Zrobione' id = gamma_menu_done pad_choose_script = create_options_menu last_menu_item = last_menu_item
    SetScreenElementProps {
        id = gamma_menu_red
        event_handlers = [{pad_left gamma_menu_turn_down params = { color = red }}
            {pad_right gamma_menu_turn_up params = { color = red }}
        ]
        replace_handlers
    }
    SetScreenElementProps {
        id = gamma_menu_green
        event_handlers = [{pad_left gamma_menu_turn_down params = { color = green }}
            {pad_right gamma_menu_turn_up params = { color = green }}
        ]
        replace_handlers
    }
    SetScreenElementProps {
        id = gamma_menu_blue
        event_handlers = [{pad_left gamma_menu_turn_down params = { color = blue }}
            {pad_right gamma_menu_turn_up params = { color = blue }}
        ]
        replace_handlers
    }
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4=Wybierz' }
            { text = '\b6/\b5=Dostosuj' }
            { text = '\m0=Akceptuj' }
            { text = '\m1=Wstecz' }
        ]
    }
    finish_themed_sub_menu
endscript

script gamma_menu_check_levels 
    GetGammaValues
    FormatText textname = red_text '%i' i = <red>
    FormatText textname = green_text '%i' i = <green>
    FormatText textname = blue_text '%i' i = <blue>
    SetScreenElementLock id = gamma_menu_red Off
    SetScreenElementLock id = gamma_menu_green Off
    SetScreenElementLock id = gamma_menu_blue Off
    SetScreenElementProps {
        id = { gamma_menu_red child = 3 }
        text = <red_text>
    }
    SetScreenElementProps {
        id = { gamma_menu_green child = 3 }
        text = <green_text>
    }
    SetScreenElementProps {
        id = { gamma_menu_blue child = 3 }
        text = <blue_text>
    }
endscript

script gamma_menu_turn_up 
    GetGammaValues
    switch <color>
        case red
        if NOT (<red> > 99)
            playsound \{ MenuUp }
        endif
        case blue
        if NOT (<blue> > 99)
            playsound \{ MenuUp }
        endif
        case green
        if NOT (<green> > 99)
            playsound \{ MenuUp }
        endif
    endswitch
    ApplyChangeGamma <...> change = 0.01000
    wait \{ 1 frame }
    gamma_menu_check_levels
endscript

script gamma_menu_turn_down 
    GetGammaValues
    switch <color>
        case red
        if NOT (1 > <red>)
            playsound \{ MenuUp }
        endif
        case blue
        if NOT (1 > <blue>)
            playsound \{ MenuUp }
        endif
        case green
        if NOT (1 > <green>)
            playsound \{ MenuUp }
        endif
    endswitch
    ApplyChangeGamma <...> change = -0.01000
    wait \{ 1 frame }
    gamma_menu_check_levels
endscript

script create_split_menu callback_script = create_options_menu
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_sub_menu Title = 'USTAWIENIA EKRANU' right_bracket_alpha = 0.0
    SetScreenElementProps {
        id = sub_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = <callback_script> }}]
        replace_handlers
    }
    theme_menu_add_item text = 'Poziomo' pad_choose_script = generic_menu_pad_choose centered = centered pad_choose_params = { <...> callback = split_setup_horizontal }
    theme_menu_add_item text = 'Pionowo' last_menu_item = 1 centered = centered pad_choose_script = generic_menu_pad_choose pad_choose_params = { <...> callback = split_setup_vertical }
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    finish_themed_sub_menu
endscript

script create_screen_menu callback_script = create_options_menu
    make_label_menu {
        menu_id = menu_screen
        vmenu_id = vmenu_screen
        Title = 'OPCJE EKRANU'
        title_pos = (30.0, 40.0)
        title_rotation = -6
        Pos = (40.0, 120.0)
        spacing = 6
    }
    if InFrontend
        callback_script = create_gamesettings_menu
    else
        callback_script = create_options_menu
    endif
    SetScreenElementProps {
        id = vmenu_screen
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = <callback_script> }}
        ]
    }
    switch (current_screen_mode)
        case standard_screen_mode
        mode = 'Standard'
        case widescreen_screen_mode
        mode = 'Widescreen'
        case letterbox_screen_mode
        mode = 'Letterbox'
    endswitch
    if ((IsPs2)|| (IsNGC))
        add_label_menu_item {
            id = menu_screen_display
            text = 'OPCJE WYWIETLANIA:'
            extra_text = <mode>
            rot = 1
            padding = 40
            label_offset = (6.0, 0.0)
            option_arrows
            option_arrows_callback = menu_screen_alter_display
        }
        menu_screen_alter_display
    endif
    if IsPs2
        if NOT IsPAL
            add_label_menu_flag_item {
                id = progressive_text
                flag = SCREEN_MODE_PROGRESSIVE
                text = 'SKAN PROGRESYWNY:'
                rot = 1
                padding = 40
                label_offset = (-7.0, 0.0)
                toggle_callback = toggle_progressive_confirm
            }
        endif
    endif
    if ((IsPs2)|| (IsXenon))
        FormatText textname = brightness '%i' i = SE_Brightness
        add_label_menu_item {
            id = menu_screen_brightness
            text = 'JASNOÆ:'
            extra_text = <brightness>
            rot = -1
            padding = 40
            label_offset = (-5.0, 0.0)
            text_offset = (-5.0, 0.0)
            option_arrows
            option_arrows_callback = menu_adjust_brightness
        }
        menu_adjust_brightness
    endif
    if NOT IsTrue bootstrap_build
        add_label_menu_item {
            text = 'GOTOWE'
            rot = -1
            Length = 120
            label_offset = (10.0, 0.0)
            text_offset = (-15.0, 0.0)
            pad_choose_script = <callback_script>
        }
    endif
    label_menu_finish
endscript

script menu_screen_alter_display 
    left_rgba = [ 128 128 128 128 ]
    right_rgba = [ 128 128 128 128 ]
    if IsPs2
        modes = [ standard_screen_mode widescreen_screen_mode ]
    else
        if IsNGC
            modes = [ standard_screen_mode widescreen_screen_mode ]
        else
            modes = []
        endif
    endif
    GetArraySize <modes>
    i = 0
    cur_mode = <i>
    begin 
    if (current_screen_mode = <modes> [ <i> ])
        cur_mode = <i>
        break 
    endif
    i = (<i> + 1)
    repeat <array_size>
    changed = 0
    if GotParam left
        if (<cur_mode> > 0)
            cur_mode = (<cur_mode> -1)
        endif
        changed = 1
    else
        if GotParam RIGHT
            if (<cur_mode> < (<array_size> -1))
                cur_mode = (<cur_mode> + 1)
            endif
            changed = 1
        endif
    endif
    if (<changed> = 1)
        change_screen_mode mode = (<modes> [ <cur_mode> ])
        switch (<modes> [ <cur_mode> ])
            case standard_screen_mode
            SetScreenElementProps {
                id = { menu_screen_display child = extra_text }
                text = 'Standardowy komunikat konsoli'
            }
            case widescreen_screen_mode
            SetScreenElementProps {
                id = { menu_screen_display child = extra_text }
                text = 'Szeroki ekran'
            }
            case letterbox_screen_mode
            SetScreenElementProps {
                id = { menu_screen_display child = extra_text }
                text = 'Skrzynka na listy'
            }
        endswitch
    endif
    if (<cur_mode> = 0)
        left_rgba = [ 128 128 128 0 ]
    else
        if (<cur_mode> = (<array_size> -1))
            right_rgba = [ 128 128 128 0 ]
        endif
    endif
    SetScreenElementProps {
        id = { menu_screen_display child = arrow_left }
        rgba = <left_rgba>
    }
    SetScreenElementProps {
        id = { menu_screen_display child = arrow_right }
        rgba = <right_rgba>
    }
endscript

script change_screen_mode 
    switch <mode>
        case standard_screen_mode
        screen_setup_standard
        case widescreen_screen_mode
        screen_setup_widescreen
        case letterbox_screen_mode
        screen_setup_letterbox
        default 
        printf 'bad screen mode requested: %d' d = <mode>
    endswitch
endscript

script toggle_progressive_confirm 
    if NOT GetGlobalFlag flag = <flag>
        create_dialog_box {
            Title = 'Skan progresywny'
            text = 'Prze³¹czenie w tryb progresywny mo¿e sprawiæ, ¿e obraz na twoim telewizorze bêdzie wywietlany nieprawid³owo. W takim przypadku, proszê poczekaæ 15 sekund, a¿ domylny tryb wywietlania zostanie przywrócony. Kontynuowaæ?'
            Pos = (320.0, 240.0)
            text_dims = (400.0, 0.0)
            just = [ center center ]
            text_rgba = [ 88 105 112 128 ]
            box_animate
            text_scale = 1
            buttons = [
                {font = small text = 'Tak' pad_choose_script = yes_progressive_scan pad_choose_params = { callback_script = create_screen_menu }}
                {font = small text = 'Nie' pad_choose_script = no_progressive_scan pad_choose_params = { callback_script = create_screen_menu }}
            ]
        }
    else
        label_menu_toggle_flag id = <id> flag = <flag> reverse = <reverse>
        SetProgressive on = 0
    endif
endscript

script yes_progressive_scan 
    dialog_box_exit
    SetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE
    SetProgressive on = 1
    create_snazzy_dialog_box {
        Title = 'Skan progresywny'
        text = 'Wybrano tryb skanu progresywnego (480p). Kliknij TAK jeli chcesz nadal graæ w trybie skanu progresywnego, lub NIE, jeli chcesz powróciæ do standardowego trybu wywietlania przeplatanego.'
        no_animate
        buttons = [
            {font = small text = 'Tak' pad_choose_script = progressive_done pad_choose_params = { callback_script = <callback_script> }}
            {font = small text = 'Nie' pad_choose_script = confirm_no_progressive pad_choose_params = { callback_script = <callback_script> }}
        ]
    }
    RunScriptOnScreenElement id = dialog_box_anchor progressive_timeout params = { callback_script = <callback_script> }
endscript

script no_progressive_scan 
    dialog_box_exit
    UnsetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
    SetProgressive \{ on = 0 }
    <callback_script>
endscript

script onload_progressive_scan_check callback_script = create_options_menu
    create_snazzy_dialog_box {
        Title = 'Skan progresywny'
        text = 'Wczeniej zdecydowa³e, by gra by³a wywietlana w trybie skanu progresywnego. Twój telewizor musi byæ w stanie wywietlaæ sygna³ skanu progresywnego. Czy chcia³by ponownie w³¹czyæ tryb progresywny?'
        no_animate
        buttons = [
            {font = small text = 'Tak' pad_choose_script = yes_progressive_scan pad_choose_params = { callback_script = <callback_script> }}
            {font = small text = 'Nie' pad_choose_script = no_progressive_scan pad_choose_params = { callback_script = <callback_script> }}
        ]
    }
endscript

script progressive_timeout 
    wait \{ 10 seconds }
    confirm_no_progressive callback_script = <callback_script>
endscript

script confirm_no_progressive 
    dialog_box_exit
    UnsetGlobalFlag \{ flag = SCREEN_MODE_PROGRESSIVE }
    SetProgressive \{ on = 0 }
    create_snazzy_dialog_box {
        Title = 'Skan progresywny'
        text = 'Przywrócono tryb wywietlania przeplatanego.'
        no_animate
        buttons = [
            {font = small text = 'Kontynuuj' pad_choose_script = progressive_done pad_choose_params = { callback_script = <callback_script> }}
        ]
    }
endscript

script progressive_done 
    dialog_box_exit
    <callback_script>
endscript

script split_setup_horizontal 
    SetScreenMode \{ split_horizontal }
    skatercam0 ::sc_resetmode
    skatercam1 ::sc_resetmode
    ScreenElementSystemCleanup
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    if GotParam \{ end_run }
        create_end_run_menu
    else
        create_pause_menu
    endif
    UpdateScore
    SetActiveCamera \{ id = skatercam0 viewport = 0 }
    SetActiveCamera \{ id = skatercam1 viewport = 1 }
endscript

script split_setup_vertical 
    SetScreenMode \{ split_vertical }
    skatercam0 ::sc_resetmode
    skatercam1 ::sc_resetmode
    ScreenElementSystemCleanup
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    if GotParam \{ end_run }
        create_end_run_menu
    else
        create_pause_menu
    endif
    UpdateScore
    SetActiveCamera \{ id = skatercam0 viewport = 0 }
    SetActiveCamera \{ id = skatercam1 viewport = 1 }
endscript

script toggle_auto_brake_option 
    gettags
    GetPreferenceString pref_type = network auto_brake
    if (<ui_string> = 'Wy³.')
        text = 'W³.'
        SetPreferencesFromUI prefs = network field = 'auto_brake' checksum = boolean_true string = 'W³.'
        SetScreenElementProps id = {<id> child = 0}text = 'AUTOMATYCZNY HAMULEC: W³¹czony'
    else
        text = 'Wy³.'
        SetPreferencesFromUI prefs = network field = 'auto_brake' checksum = boolean_false string = 'Wy³.'
        SetScreenElementProps id = {<id> child = 0}text = 'AUTOMATYCZNY HAMULEC: Wy³¹czony'
    endif
endscript

script menu_adjust_brightness 
    left_rgba = [ 128 128 128 128 ]
    right_rgba = [ 128 128 128 128 ]
    if GotParam left
        if (SE_Brightness > 0)
            change SE_Brightness = (SE_Brightness -1)
        endif
    else
        if GotParam RIGHT
            if (SE_Brightness < 10)
                change SE_Brightness = (SE_Brightness + 1)
            endif
        endif
    endif
    FormatText textname = brightness '%i' i = SE_Brightness
    SetScreenElementProps {
        id = { menu_screen_brightness child = extra_text }
        text = <brightness>
    }
    SetScreenEffectsBrightness brightness = (SE_Brightness / 10.0)
    if (SE_Brightness = 0)
        left_rgba = [ 128 128 128 0 ]
    else
        if (SE_Brightness = 10)
            right_rgba = [ 128 128 128 0 ]
        endif
    endif
    SetScreenElementProps {
        id = { menu_screen_brightness child = arrow_left }
        rgba = <left_rgba>
    }
    SetScreenElementProps {
        id = { menu_screen_brightness child = arrow_right }
        rgba = <right_rgba>
    }
endscript

script options_retrieve_from_user_profile 
    if NOT IsXenon
        return 
    endif
    if NOT CheckForSignin local
        return 
    endif
    InitGameProfileSettings
    printf '-- profile settings --'
    if GetGameProfileSetting gsid = 0
        if (<game_setting> = 1)
            printf '- vibration on'
            VibrationOn 0
        else
            printf '- vibration off'
            VibrationOff 0
        endif
    endif
    if GetGameProfileSetting gsid = 1
        printf '- user profile difficulty: %d' d = <game_setting>
        change default_user_difficulty = (<game_setting> -2)
    endif
    if GetGameProfileSetting gsid = 3
        change default_user_axis_inversion = <game_setting>
        printf '- user profile axis inversion: %d' d = <game_setting>
        if CompositeObjectExists skatercam0
            skatercam0 ::LookAroundSetInvert on = <game_setting>
        endif
    endif
endscript

script InitGameProfileSettings 
    StartGameProfileSettingsRead
    begin 
    if GameProfileSettingsFinished
        break 
    else
        wait \{ 1 gameframe }
    endif
    repeat 
endscript
