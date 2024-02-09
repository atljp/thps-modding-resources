min_career_combo_record = 10000

script create_pause_menu 
    if ObjectExists id = skater
        if NOT IsObserving
            if skater ::IsSkaterOnBike
                SetAnalogStickActiveForMenus 1
            endif
        endif
    endif
    if (in_telescope_cam = 1)
        pause_telescope_cam
    else
        if NOT IsObserving
            AndrewRTripy_exit
        endif
    endif
    if GotParam no_exit
        set_pause_menu_allow_continue Off
    else
        if root_window ::getsingletag no_exit_pause_menu
            no_exit = no_exit
        endif
    endif
    if CustomParkMode editing
        SetParkEditorPauseMode Pause
    endif
    if NOT GotParam no_sound
    endif
    unhide_root_window
    if (inside_pause = 1)
    endif
    if NOT GotParam no_actual_menu
        if (inside_pause = 0)
            hide_all_hud_items
            hide_current_goal
        endif
    endif
    if InNetGame
        if NOT IsObserving
            if ObjectExists id = skater
                skater ::netdisableplayerinput
            endif
        endif
    else
        if NOT GotParam no_actual_menu
            if CustomParkMode editing
                parked_setup_main_menu
                PauseMusicAndStreams 1
                build_pause_menu_parts
                return 
            endif
            if CustomParkMode testing
                parked_setup_test_play_menu
                PauseMusicAndStreams 1
                build_pause_menu_parts
                return 
            endif
            if InSplitScreenGame
                if NOT GameModeEquals is_coop
                    create_mp_pause_menu
                    PauseMusicAndStreams 1
                    build_pause_menu_parts
                    return 
                endif
            endif
        endif
    endif
    if (inside_pause = 0)
        if MusicIsPaused
            change music_was_paused = 1
        else
            change music_was_paused = 0
        endif
    endif
    PauseMusicAndStreams 1
    pause_rain
    if GotParam no_actual_menu
        return 
    endif
    if (in_cat_preview_mode = 1)
        create_CAT_pause_menu
        return 
    endif
    <show_legend> = 0
    if GameModeEquals is_career
        GetLevelStructureName
        if NOT StructureContains structure = <level_structure_name> level_map
            <show_legend> = 0
        else
            <show_legend> = 1
        endif
    endif
    if NOT GotParam no_exit
        if (<show_legend> = 1)
            helper = {
                helper_text_elements = [
                    { text = '\b6 = Kartenlegende' }
                    { text = '\b7/\b4 = Wählen' }
                    { text = '\m1 = Zurück' }
                    { text = '\m0 = OK' }
                ]
            }
        else
            helper = generic_helper_text
        endif
    else
        if (<show_legend> = 1)
            helper = {
                helper_text_elements = [
                    { text = '\b6 = Kartenlegende' }
                    { text = '\b7/\b4 = Wählen' }
                    { text = '\m0 = OK' }
                ]
            }
        else
            helper = generic_helper_text_no_back
        endif
    endif
    if InNetGame
        menu_pos = (410.0, 35.0)
    else
        if GameModeEquals is_freeskate is_singlesession
            menu_pos = (410.0, 120.0)
        else
            menu_pos = (410.0, 75.0)
        endif
    endif
    if GotParam no_exit
        make_label_menu {
            Pos = <menu_pos>
            pad_back_script = NullScript
            menu_id = Pause_Menu
            vmenu_id = pause_vmenu
            spacing = 0
        }
    else
        make_label_menu {
            Pos = <menu_pos>
            pad_back_script = handle_start_pressed
            menu_id = Pause_Menu
            vmenu_id = pause_vmenu
            spacing = 0
        }
    endif
    if GotParam no_exit
        <start_handler> = NullScript
    else
        <start_handler> = handle_start_pressed
    endif
    if (<show_legend> = 1)
        SetScreenElementProps {
            id = pause_vmenu
            event_handlers = [
                { pad_left pause_menu_legend }
                { pad_start <start_handler> }
            ]
        }
    else
        SetScreenElementProps {
            id = pause_vmenu
            event_handlers = [
                { pad_start <start_handler> }
            ]
        }
    endif
    kill_start_key_binding
    add_music_track_text Pos = (575.0, 320.0)
    white_poly_bg_effect
    if InNetGame
        if NOT IsXenon
            paused_title_text
        endif
    else
        paused_title_text
    endif
    if InNetGame
        clock_pos = (-50.0, 0.0)
    else
        clock_pos = (-50.0, 58.0)
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = clock_anchor
        just = [ left center ]
        Pos = <clock_pos>
    }
    if GameModeEquals is_career
        pause_add_time_and_cash
        GetLevelStructureName
        if StructureContains structure = <level_structure_name> level_map
            current_menu_anchor ::obj_spawnscriptnow pause_menu_map
        endif
    endif
    SetScreenElementLock id = clock_anchor Off
    if NOT IsObserving
        pause_add_combo_records
    endif
    if GameModeEquals is_singlesession
        if GoalManager_GoalIsActive name = trickattack
            add_label_menu_item {
                text = 'LAUF NEU VERSUCHEN'
                rot = -6
                Scale = 0.8500
                label_offset = (-80.0, 0.0)
                id = menu_retry_high_score_run
                pad_choose_script = menu_select
                pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal }
            }
            add_label_menu_item {
                text = 'LAUF BEENDEN'
                rot = 0
                Scale = 0.8500
                label_offset = (-80.0, 0.0)
                id = menu_end_high_score_run
                pad_choose_script = menu_select
                pad_choose_params = { menu_select_script = end_high_score_run }
            }
        else
            add_label_menu_item {
                text = 'HIGHSCORE-LAUF START.'
                rot = -6
                Scale = 0.8500
                label_offset = (-80.0, 0.0)
                id = menu_start_high_score_run
                pad_choose_script = menu_select
                pad_choose_params = { menu_select_script = TrickAttack_MenuStartRun }
            }
        endif
    else
        if NOT GotParam no_exit
            add_label_menu_item {
                text = 'WEITER'
                rot = 0
                Scale = 0.8500
                label_offset = (-20.0, 0.0)
                id = menu_continue pad_choose_script = handle_pause_continue pad_choose_sound = generic_pause_exit_sound
            }
        endif
    endif
    if GameModeEquals is_goal_attack
        if NOT IsObserving
            GetGoalsMode
            if (<goals> = goals_created)
                if GoalManager_CanRetryGoal
                    if GoalManager_GetLastGoalId
                        if NOT GoalManager_HasWonGoal name = <goal_id>
                            add_label_menu_item {
                                text = 'ZIEL NEU VERSUCHEN'
                                rot = -2
                                Scale = 0.8500
                                label_offset = (-20.0, 0.0)
                                id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_vibration menu_select_script = RetryCurrentGoal }
                            }
                        endif
                    endif
                endif
            endif
        endif
        add_label_menu_item {
            text = 'ZIELE'
            rot = 4
            Scale = 0.8500
            label_offset = (-10.0, 0.0)
            id = menu_view_goals pad_choose_script = create_view_selected_goals_menu pad_choose_params = { from_pause }
        }
    endif
    if GameModeEquals is_career
        if GoalManager_CanRetryGoal
            add_label_menu_item {
                text = 'MISSION NEU STARTEN'
                rot = -2
                Scale = 0.8500
                label_offset = (-40.0, 0.0)
                id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = {stop_vibration stop_streams menu_select_script = RetryCurrentGoal}
            }
        else
            <check_can_retry_last> = 1
            if GoalManager_GoalExists name = (goal_utility_last_goal_activated)
                if GoalManager_GoalIsActive name = (goal_utility_last_goal_activated)
                    <check_can_retry_last> = 0
                endif
            endif
            if ((in_telescope_cam)= 1)
                <check_can_retry_last> = 0
            endif
            if (<check_can_retry_last> = 1)
                if skater ::IsSkaterOnBike
                    <is_on_bike> = 1
                else
                    <is_on_bike> = 0
                endif
                if GoalManager_CanRetryLastGoal is_on_bike = <is_on_bike>
                    add_label_menu_item {
                        text = 'LETZTE MISSION NEU'
                        rot = -2
                        Scale = 0.8500
                        label_offset = (-40.0, 0.0)
                        id = menu_retry_last_goal pad_choose_script = menu_select pad_choose_params = {stop_vibration stop_streams menu_select_script = GoalManager_RestartLastGoal}
                    }
                endif
            endif
        endif
        if NOT game_progress_disallow_save
            if GoalManager_GoalIsActive name = (goal_utility_last_goal_activated)
                add_label_menu_item {
                    text = 'MISSION BEENDEN'
                    rot = 0
                    Scale = 0.8500
                    label_offset = (-20.0, 0.0)
                    id = menu_quit_goal pad_choose_script = menu_select pad_choose_params = {stop_vibration stop_streams menu_select_script = goal_quit_current_goal}
                }
            endif
        endif
        if NodeArrayBusy
            add_label_menu_item {
                text = 'MISSION ANSEHEN'
                rot = -5
                Scale = 0.8500
                label_offset = (-20.0, 0.0)
                id = menu_chapters pad_choose_script = view_goals_menu_create
                not_focusable
            }
        else
            add_label_menu_item {
                text = 'MISSION ANSEHEN'
                rot = -5
                Scale = 0.8500
                label_offset = (-20.0, 0.0)
                id = menu_chapters pad_choose_script = view_goals_menu_create
            }
        endif
        add_label_menu_item {
            text = 'TEXTNACHRICHTEN'
            rot = -2
            Scale = 0.8500
            label_offset = (-30.0, 0.0)
            id = menu_pager pad_choose_script = pager_window_create
        }
    endif
    if GameModeEquals is_classic
        classic_mode_menu_add_pause_options
    endif
    display_level_select = 1
    if InNetGame
        display_level_select = 0
    endif
    if GameModeEquals is_career
        if NOT IsTrue All_Levels_Unlocked
            display_level_select = 0
        endif
    endif
    if GameModeEquals is_classic
        if NOT GotParam no_exit
            display_level_select = 0
        endif
    endif
    if GetGlobalFlag flag = CHEAT_DEBUG_MENU_UNLOCKED
        if NOT InNetGame
            display_level_select = 1
        endif
    endif
    if (<display_level_select> = 1)
        add_label_menu_item {
            text = 'ORT WECHSELN'
            rot = -2
            Scale = 0.8500
            label_offset = (-10.0, 0.0)
            id = menu_level_select
            pad_choose_script = launch_level_select_menu
        }
    endif
    if InNetGame
        if ishost
            if GameModeEquals is_lobby
                if NOT NetworkGamePending
                    if NOT ChangeLevelPending
                        add_label_menu_item {
                            text = 'SPIEL STARTEN'
                            rot = -4
                            Scale = 0.8500
                            label_offset = (-10.0, 0.0)
                            id = menu_network_start_select pad_choose_script = network_game_options_selected
                        }
                    endif
                endif
            else
                add_label_menu_item {
                    text = 'SPIEL BEENDEN'
                    rot = -2
                    Scale = 0.8500
                    label_offset = (-20.0, 0.0)
                    id = menu_network_end_select pad_choose_script = network_end_game_selected
                }
            endif
        endif
    endif
    if InNetGame
        if NOT NetworkGamePending
            if OnServer
                if ((IsXbox)|| (IsXenon))
                    add_label_menu_item {
                        text = 'HOST-OPTIONEN'
                        rot = -2
                        Scale = 0.8500
                        label_offset = (-20.0, 0.0)
                        id = menu_network_server_opts_select pad_choose_script = network_options_selected
                    }
                else
                    add_label_menu_item {
                        text = 'SERVEROPTIONEN'
                        rot = -2
                        Scale = 0.8500
                        label_offset = (-30.0, 0.0)
                        id = menu_network_server_opts_select pad_choose_script = network_options_selected
                    }
                endif
            endif
            if ishost
                if GameModeEquals is_lobby
                    if NOT OnServer
                        if OnXbox
                            add_roundbar_menu_item text = 'HOST-OPTIONEN' id = menu_network_server_opts_select pad_choose_script = network_options_selected
                            add_label_menu_item {
                                text = 'HOST-OPTIONEN'
                                rot = -2
                                Scale = 0.8500
                                label_offset = (-20.0, 0.0)
                                id = menu_network_server_opts_select pad_choose_script = network_options_selected
                            }
                        else
                            add_label_menu_item {
                                text = 'SERVEROPTIONEN'
                                rot = -2
                                Scale = 0.8500
                                label_offset = (-20.0, 0.0)
                                id = menu_network_server_opts_select pad_choose_script = network_options_selected
                            }
                        endif
                    endif
                endif
            endif
        endif
    endif
    if InNetGame
        if NOT IsObserving
            <game_active> = 0
            if GoalManager_HasActiveGoals count_all
                <game_active> = 1
            endif
            if (<game_active> = 1)
                <trick_text> = 'TRICKS ANSEHEN'
                <trick_helper> = view_tricks_helper_desc
            else
                if NOT GoalManager_HasActiveGoals
                    <trick_text> = 'TRICKS BEARBEITEN'
                    <trick_helper> = edit_tricks_helper_desc
                else
                    <trick_text> = 'TRICKS ANSEHEN'
                    <trick_helper> = view_tricks_helper_desc
                endif
            endif
            add_label_menu_item {
                text = <trick_text>
                rot = -4
                Scale = 0.8500
                label_offset = (-10.0, 0.0)
                id = menu_cas pad_choose_script = create_edit_tricks_menu
            }
        endif
    endif
    if InNetGame
        if ishost
            if GameModeEquals is_lobby
                if NOT NetworkGamePending
                    if NOT ChangeLevelPending
                        add_label_menu_item {
                            text = 'ORT WECHSELN'
                            rot = -4
                            Scale = 0.8500
                            label_offset = (-10.0, 0.0)
                            id = menu_level_select pad_choose_script = launch_level_select_menu pad_choose_params = { show_warning }
                        }
                    endif
                endif
            endif
        endif
        if ((IsPs2)|| (isPC))
            if IsTrue bootstrap_build
                add_label_menu_item {
                    text = 'ORT WECHSELN'
                    rot = -4
                    Scale = 0.8500
                    label_offset = (-10.0, 0.0)
                    id = menu_network_remove_select pad_choose_script = launch_remove_players_menu not_focusable = not_focusable
                }
            else
                add_label_menu_item {
                    text = 'SPIELERLISTE'
                    rot = -4
                    Scale = 0.8500
                    label_offset = (-10.0, 0.0)
                    id = menu_network_player_list_select pad_choose_script = launch_player_list_menu
                }
                if NetSessionFunc obj = presence func = profile_logged_in
                    add_label_menu_item {
                        text = 'FREUNDESLISTE'
                        rot = -4
                        Scale = 0.8500
                        label_offset = (-10.0, 0.0)
                        id = menu_network_homie_list_select pad_choose_script = launch_homie_list
                    }
                    NetSessionFunc obj = presence func = get_num_notifications
                    if (<num_notifications> > 0)
                        add_label_menu_item {
                            text = 'NACHRICHTEN'
                            rot = -2
                            Scale = 0.8500
                            label_offset = (-20.0, 0.0)
                            id = menu_pager pad_choose_script = pager_window_create
                        }
                    endif
                endif
            endif
        endif
    endif
    show_live_options = 0
    if IsXbox
        if NetSessionFunc func = presence_started
            <show_live_options> = 1
        endif
    endif
    if IsTrue in_telescope_cam
        <show_live_options> = 0
    endif
    if (<show_live_options> = 1)
        add_label_menu_item {
            text = 'XBOX LIVE-OPTIONEN'
            rot = -2
            Scale = 0.8500
            label_offset = (-10.0, 0.0)
            id = menu_network_live_options_select pad_choose_script = xboxlive_menu_options_push pad_choose_params = { from_pause_menu }
        }
        xboxlive_menu_notify_clone_sprite {
            id = xbox_notification
            parent = menu_network_live_options_select
            clone_pos = (-4.0, 5.0)
            z_priority = 5
        }
    endif
    if NOT InNetGame
        save_shown = 1
        save_focusable = {}
        if IsXenon
            if NOT CheckForSignin local
                save_focusable = { not_focusable }
            endif
        endif
        if GameModeEquals is_career
            if game_progress_disallow_save
                save_focusable = { not_focusable }
            endif
        endif
        if GameModeEquals is_classic is_coop
            if NOT root_window ::getsingletag no_exit_pause_menu
                save_shown = 0
            endif
        endif
        if LevelIs load_sk5ed
            save_shown = 0
        endif
        if (<save_shown> = 1)
            add_label_menu_item {
                text = 'SPIEL SPEICHERN'
                rot = -1
                Length = 150
                Scale = 0.8500
                id = menu_save_game
                pad_choose_script = launch_pause_menu_save_game_sequence
                <save_focusable>
            }
        endif
        add_label_menu_item {
            text = 'DEIN STATUS'
            rot = -2
            Scale = 0.8500
            label_offset = (-24.0, 0.0)
            id = menu_your_options pad_choose_script = create_your_options_menu
        }
    endif
    add_label_menu_item {
        text = 'SPIELOPTIONEN'
        rot = -3
        Scale = 0.8500
        label_offset = (-33.0, 0.0)
        id = menu_game_options pad_choose_script = create_options_menu
    }
    <show_debug_menu> = 0
    if NOT cd
        <show_debug_menu> = 1
    else
        if GetGlobalFlag flag = CHEAT_DEBUG_MENU_UNLOCKED
            <show_debug_menu> = 1
        endif
    endif
    if NOT isPC
        if (<show_debug_menu> = 1)
            add_label_menu_item {
                text = 'DEBUG OPTIONS'
                rot = -4
                Scale = 0.8500
                label_offset = (-17.0, 0.0)
                id = DEBUG_MENU pad_choose_script = create_debug_options_menu
            }
        endif
    endif
    if NOT cd
        if (main_menu_jump_to_cas = 1)
            add_label_menu_item {
                text = 'ZURÜCK ZU M-D-D-S'
                rot = -4
                Scale = 0.8500
                label_offset = (-10.0, 0.0)
                id = debug_cas_menu pad_choose_script = create_pre_cas_menu pad_choose_params = { load_assets = 1 }
            }
        endif
    endif
    if InNetGame
        if NOT ((IsXbox)|| (IsXenon))
            add_label_menu_item {
                text = 'CHAT-NACHRICHT'
                rot = -2
                Scale = 0.8500
                label_offset = (-10.0, 0.0)
                id = menu_chat pad_choose_script = launch_chat_keyboard
            }
        endif
        if NOT OnServer
            if NOT IsObserving
                if InInternetMode
                    if GameModeEquals is_lobby
                        if NOT NetSessionFunc obj = match func = isranked
                            if IsTrue bootstrap_build
                                if NOT GoalManager_HasActiveGoals
                                    add_label_menu_item {
                                        text = 'ZUSCHAUEN'
                                        rot = -4
                                        Scale = 0.8500
                                        label_offset = (-20.0, 0.0)
                                        id = menu_network_observe_select pad_choose_script = chose_observe not_focusable = not_focusable
                                    }
                                endif
                            else
                                if NOT GoalManager_HasActiveGoals
                                    add_label_menu_item {
                                        text = 'ZUSCHAUEN'
                                        rot = -4
                                        Scale = 0.8500
                                        label_offset = (-20.0, 0.0)
                                        id = menu_network_observe_select pad_choose_script = chose_observe
                                    }
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        if IsXenon
            add_label_menu_item {
                text = 'AKTUELLE SPIELER'
                rot = -2
                Scale = 0.8500
                label_offset = (-10.0, 0.0)
                id = menu_network_live_options_select pad_choose_script = xbox360live_menu_options_push pad_choose_params = { from_pause_menu }
            }
        endif
        add_label_menu_item {
            text = 'BEENDEN'
            rot = 2
            Scale = 0.8500
            label_offset = (-10.0, 0.0)
            id = menu_quit pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_quit_game_dialog }
        }
    else
        if CustomParkMode testing
            printf 'PARK EDITOR TEST PLAY MENU'
            add_label_menu_item {
                text = 'NACHRICHTEN'
                rot = -2
                Scale = 0.8500
                label_offset = (-10.0, 0.0)
                id = menu_skateshop pad_choose_script = menu_confirm_quit pad_choose_params = { yes_script = exit_test_play }
            }
        else
            if GameModeEquals is_classic
                classic_mode_menu_add_quit_option
            else
                if GameModeEquals is_career
                    if ((in_telescope_cam)= 0)
                        add_label_menu_item {
                            text = 'BEENDEN'
                            rot = -5
                            Scale = 0.8500
                            label_offset = (30.0, 0.0)
                            id = menu_skateshop
                            pad_choose_script = generic_menu_pad_choose
                            pad_choose_params = { callback = career_mode_quit_dialog }
                        }
                    endif
                else
                    add_label_menu_item {
                        text = 'BEENDEN'
                        rot = -5
                        Scale = 0.8500
                        label_offset = (30.0, 0.0)
                        id = menu_skateshop
                        pad_choose_script = generic_menu_pad_choose
                        pad_choose_params = { callback = menu_confirm_quit }
                    }
                endif
            endif
        endif
    endif
    kill_blur start = 0
    if root_window ::getsingletag highlight_change_level
        focus_data = { grid_index = 1 }
        root_window ::removetags tags = [ highlight_change_level ]
    endif
    label_menu_finish show_deck = show_deck Data = <focus_data> helper_text = <helper>
endscript

script confirm_end_mp_game 
    create_snazzy_dialog_box {
        Title = 'SPIEL BEENDEN?'
        text = 'Wenn du das aktuelle Spiel beendest, kannst du es nicht mehr fortsetzen.\n\nWirklich beenden?'
        text_dims = (400.0, 0.0)
        pad_back_script = create_mp_pause_menu
        pad_back_params = no_animate
        no_bg
        buttons = [
            {text = 'Ja' pad_choose_script = network_end_game_selected}
            {text = 'Nein' pad_choose_script = create_mp_pause_menu pad_choose_params = no_animate}
        ]
    }
endscript

script create_mp_pause_menu 
    dialog_box_exit
    SetButtonEventMappings unblock_menu_input
    make_label_menu {
        menu_id = Pause_Menu
        vmenu_id = pause_vmenu
        pad_back_script = handle_start_pressed
        Title = 'PAUSE'
        title_pos = (30.0, 40.0)
        Pos = (130.0, 130.0)
        additional_create_script = pause_create_tipbox
        additional_focus_script = pause_focus_tipbox
        additional_unfocus_script = pause_unfocus_tipbox
        helper_text = <helper>
    }
    create_helper_text generic_helper_text
    add_label_menu_item {
        text = 'WEITER'
        rot = 1
        Scale = 0.8500
        label_offset = (-20.0, 0.0)
        id = menu_continue pad_choose_script = handle_start_pressed
    }
    add_label_menu_item {
        text = 'SPIEL BEENDEN'
        rot = -2
        Scale = 0.8500
        label_offset = (-20.0, 0.0)
        id = menu_network_end_select pad_choose_script = confirm_end_mp_game
    }
    add_label_menu_item {
        text = 'OPTIONEN'
        rot = 4
        Scale = 0.8500
        label_offset = (-10.0, 0.0)
        id = menu_mp_options pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_options_menu }
    }
    label_menu_finish
endscript

script do_localized_pause_title Pos = (500.0, 40.0)
    if IsPAL
        if NOT English
            CreateScreenElement {
                type = TextElement
                parent = current_menu_anchor
                id = localized_pause_title
                font = small
                text = 'PAUSE'
                Pos = <Pos>
                just = [ RIGHT bottom ]
                Scale = 2
                rgba = [ 128 40 10 128 ]
                shadow
                shadow_rgba = [0 , 0 , 0 , 128]
                shadow_offs = (3.0, 3.0)
                z_priority = 50
            }
        endif
    endif
endscript

script exit_pause_menu menu_id = current_menu_anchor
    change check_for_unplugged_controllers = 0
    KillSpawnedScript name = pause_menu_map_pulse
    if ScreenElementExists id = current_menu_anchor
        FireEvent type = unfocus target = current_menu_anchor
    endif
    ClearViewerObject
    Debounce x time = 0.3000
    Debounce triangle time = 0.3000
    Debounce Circle time = 0.3000
    Debounce square time = 0.3000
    pause_menu_gradient Off
    change inside_pause = 0
    change no_focus_sound = 1
    unhide_current_goal
    if NOT cd
        change viewer_buttons_enabled = 1
    endif
    if NOT GetGlobalFlag flag = CAREER_ONETIMEINTRO
        if (in_telescope_cam = 0)
            show_all_hud_items
        endif
    endif
    if InNetGame
        if NOT IsObserving
            if ObjectExists id = skater
                skater ::netenableplayerinput
            endif
        endif
    endif
    if ObjectExists id = skater
        if NOT IsObserving
            if skater ::IsSkaterOnBike
                SetAnalogStickActiveForMenus 0
            endif
        endif
    endif
    UnPauseGame
    possibly_add_temp_special_trick
    PauseStream 0
    if NOT GotParam dont_unpause_music
        if (music_was_paused = 0)
            PauseMusic 0
        endif
    endif
    if root_window ::getsingletag need_music_zone_refresh
        root_window ::removetags tags = [ need_music_zone_refresh ]
        SpawnScriptLater SFX_refresh_music_box_triggers params = { wait }
    endif
    unpause_rain
    GoalManager_UnPauseAllGoals
    if ObjectExists id = <menu_id>
        DestroyScreenElement id = <menu_id>
    endif
    SetScreenElementProps id = root_window tags = { menu_state = Off }
    if NOT GotParam dont_restore_start_key_binding
        restore_start_key_binding
        KillSpawnedScript name = TemporarilyDisableInput
        SpawnScriptLater TemporarilyDisableInput params = { time = 500 }
    endif
    if NOT InNetGame
        if NOT GameModeEquals is_horse
            UnpauseSkaters
        endif
    endif
    if (in_telescope_cam = 1)
        restore_telescope_camera
    endif
    if IsXbox
        xboxlive_voice_attachment_finished
        xboxlive_menu_friends_close
    endif
    if NOT InFrontend
        menu_stack_clear
    endif
    change check_for_unplugged_controllers = 1
endscript

script pause_launch_level 
    skater ::StatsManager_Reset
    if (<level> = load_cas)
        temp = <level>
        GetCurrentLevel
        array = return_to_level
        SetArrayElement arrayName = array index = 0 newValue = <level>
        level = <temp>
    endif
    if GameModeEquals \{ is_career }
        GoalManager_DeactivateAllGoals \{ force_all }
    endif
    change_level <...> 
endscript

script white_poly_bg_effect 
    pause_menu_gradient Off
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = white_bg
        texture = white2
        rgba = [ 128 128 128 30 ]
        just = [ center , center ]
        Pos = (320.0, 224.0)
        Scale = (80.0, 80.0)
        z_priority = -10
        rot_angle = 0
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_white_bar
        texture = white2
        rgba = [ 128 128 128 58 ]
        just = [ center , center ]
        Pos = (315.0, 66.0)
        Scale = (80.0, 6.0)
        z_priority = -1
        rot_angle = 11
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_purple_bar
        texture = goal_grad
        rgba = [ 62 1 108 45 ]
        just = [ center , center ]
        Pos = (120.0, 150.0)
        Scale = (6.0, 100.0)
        z_priority = -10
        rot_angle = 100
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_purple_bar2
        texture = goal_grad
        rgba = [ 62 1 108 45 ]
        just = [ center , center ]
        Pos = (514.0, 220.0)
        Scale = (6.0, 100.0)
        z_priority = -10
        rot_angle = 100
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_purple_bar3
        texture = goal_grad
        rgba = [ 62 1 108 50 ]
        just = [ center , left ]
        Pos = (30.0, -12.0)
        Scale = (0.30000001192092896, 190.0)
        z_priority = 0
        rot_angle = -80
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_purple_bar4
        texture = goal_grad
        rgba = [ 0 0 0 128 ]
        just = [ center , left ]
        Pos = (0.0, 30.0)
        Scale = (0.4000000059604645, 190.0)
        z_priority = -10
        rot_angle = -80
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_black_bar1
        texture = goal_grad
        rgba = [ 0 0 0 20 ]
        just = [ center , top ]
        Pos = (580.0, 125.0)
        Scale = (1.0, 150.0)
        z_priority = 0
        rot_angle = 99.50
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_black_bar2
        texture = goal_grad
        rgba = [ 0 0 0 50 ]
        just = [ center , top ]
        Pos = (650.0, 53.0)
        Scale = (3.5, 160.0)
        z_priority = 1
        rot_angle = 100
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = paused_black_bar3
        texture = white2
        rgba = [ 0 0 0 120 ]
        just = [ center , top ]
        Pos = (550.0, 80.0)
        Scale = (0.5, 150.0)
        z_priority = -10
        rot_angle = 99
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = extra_star_1
        texture = hud_comp_goal
        rgba = [ 128 128 128 30 ]
        just = [ center , top ]
        Pos = (130.0, 0.0)
        Scale = (1.7000000476837158, 1.7000000476837158)
        z_priority = 1
        rot_angle = -5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = extra_star_2
        texture = hud_comp_goal
        rgba = [ 128 128 128 20 ]
        just = [ center , top ]
        Pos = (80.0, -10.0)
        Scale = (1.7000000476837158, 1.7000000476837158)
        z_priority = 1
        rot_angle = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = extra_star_3
        texture = hud_comp_goal
        rgba = [ 128 128 128 10 ]
        just = [ center , top ]
        Pos = (15.0, -25.0)
        Scale = (1.600000023841858, 1.600000023841858)
        z_priority = 1
        rot_angle = -5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = pause_dirt
        texture = strip_2
        rgba = [ 128 128 128 20 ]
        just = [ center , top ]
        Pos = (15.0, -5.0)
        Scale = (20.0, 0.6000000238418579)
        z_priority = 1
        rot_angle = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = menu_side_dark1
        texture = roundbar_highlight
        rgba = [ 0 0 40 128 ]
        just = [ center , center ]
        Pos = (530.0, 210.0)
        Scale = (26.200000762939453, 21.0)
        z_priority = 1
        rot_angle = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = menu_side_dark2
        texture = roundbar_highlight
        rgba = [ 0 0 40 108 ]
        just = [ center , center ]
        Pos = (530.0, 210.0)
        Scale = (26.200000762939453, 21.0)
        z_priority = 1
        rot_angle = -10
    }
endscript

script paused_title_text 
    CreateScreenElement \{type = TextElement parent = current_menu_anchor id = paused_text text = 'P A U S E' font = small just = [ RIGHT top ] Scale = (2.299999952316284, 2.5999999046325684) Pos = (390.0, 26.0) rgba = [ 0 0 0 128 ] z_priority = 2 rot_angle = 11}
endscript

script pause_menu_map_pulse \{ time = 0.3000 }
    wait (Random (@ 0.1000 @ 0.2000 @ 0.3000 @ 0.4000))seconds
    begin 
    DoMorph alpha = 0.0 time = <time>
    wait <time> seconds
    DoMorph alpha = 1.0 time = <time>
    wait (<time> + 0.1000)seconds
    repeat 
endscript

script pause_menu_map 
    GetLevelStructureName
    map_texture = (<level_structure_name>.level_map)
    map_offset = (<level_structure_name>.map_offset)
    map_conversion = (<level_structure_name>.map_conversion)
    map_scale = (<level_structure_name>.map_scale)
    if NOT GotParam map_texture
        return 
    endif
    if IsXenon
        AppendSuffixToChecksum base = <map_texture> suffixstring = '_x'
        <map_texture> = <appended_id>
        <scale_adj> = ((128.0 / 256.0)* (0.7500))
        <conv_adj> = (256.0 / 128.0)
        <map_scale> = (<map_scale> * <scale_adj>)
        <map_conversion> = (<map_conversion> * <conv_adj>)
    endif
    wait 5 gameframes
    begin 
    if IsTextureLoaded id = <map_texture>
        break 
    endif
    wait 15 gameframes
    repeat 
    SetScreenElementLock id = Pause_Menu Off
    SetScreenElementLock id = pause_vmenu Off
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = map_piece_container
        dims = (400.0, 400.0)
        Pos = (180.0, 240.0)
        just = [ center , center ]
        internal_just = [ center center ]
        Scale = <map_scale>
        alpha = 0
    }
    DoScreenElementMorph id = <id> alpha = 1 time = 0.3000
    map_pos = (200.0, 200.0)
    CreateScreenElement {
        type = SpriteElement
        parent = map_piece_container
        id = level_map
        texture = <map_texture>
        rgba = [ 128 128 128 128 ]
        just = [ center , center ]
        Pos = <map_pos>
        z_priority = 5
    }
    skater ::obj_getposition
    skater ::GetHeading
    arrow_pos = ((<Pos>.(1.0, 0.0, 0.0))* (1.0, 0.0) + (<Pos>.(0.0, 0.0, 1.0))* (0.0, 1.0))
    arrow_pos = (<arrow_pos> - <map_offset>)
    arrow_pos = ((<arrow_pos>.(1.0, 0.0) * <map_conversion>.(1.0, 0.0))* (1.0, 0.0) + (<arrow_pos>.(0.0, 1.0) * <map_conversion>.(0.0, 1.0))* (0.0, 1.0))
    CreateScreenElement {
        type = SpriteElement
        parent = map_piece_container
        id = skater_arrow
        texture = bike_arrow
        rgba = [ 123 63 6 108 ]
        just = [ center , top ]
        Pos = (<map_pos> + <arrow_pos>)
        Scale = (1.100 / <map_scale>)
        z_priority = 40
        rot_angle = (<heading> + 90)
    }
    RunScriptOnScreenElement id = skater_arrow pause_menu_map_pulse
    CompassManager_DumpPositions
    if GotParam blip_array
        GetArraySize blip_array
        if (<array_size> > 0)
            index = 0
            begin 
            type = ((<blip_array> [ <index> ]).type)
            Pos = ((<blip_array> [ <index> ]).Pos)
            Pos = (<Pos> - <map_offset>)
            scaled_pos = ((<Pos>.(1.0, 0.0) * <map_conversion>.(1.0, 0.0))* (1.0, 0.0) + (<Pos>.(0.0, 1.0) * <map_conversion>.(0.0, 1.0))* (0.0, 1.0))
            rgba = (compass_bliptypes.<type>.rgba)
            texture = (compass_bliptypes.<type>.texture)
            pulse = (compass_bliptypes.<type>.pulse)
            z_priority = ((compass_bliptypes.<type>.z_priority)+ 6)
            CreateScreenElement {
                type = SpriteElement
                parent = map_piece_container
                texture = <texture>
                rgba = <rgba>
                just = [ center , center ]
                Pos = (<map_pos> + <scaled_pos>)
                Scale = (1.0 / <map_scale>)
                z_priority = <z_priority>
            }
            if (<pulse> = 1)
                RunScriptOnScreenElement id = <id> pause_menu_map_pulse
            endif
            index = (<index> + 1)
            repeat <array_size>
        endif
    endif
endscript

script GetClockText 
    GetCurrentLevelName
    TODManager_GetCurrentTime
    ampm = 'am'
    if (<hours> > 12)
        ampm = 'pm'
        hours = (<hours> - 12)
    endif
    if (<hours> < 10)
        zero_text = '0'
    else
        zero_text = ''
    endif
    FormatText textname = hour_text '%z%h' z = <zero_text> h = <hours>
    if (<minutes> < 10)
        zero_text = '0'
    else
        zero_text = ''
    endif
    FormatText textname = min_text '%z%m' z = <zero_text> m = <minutes>
    FormatText textname = clock_text '%l - %h:%m%p' l = <level_name> h = <hour_text> m = <min_text> p = <ampm>
    return clock_text = <clock_text>
endscript

script pause_add_time_and_cash 
    GetClockText
    CreateScreenElement {
        type = TextElement
        parent = clock_anchor
        id = game_clock
        text = <clock_text>
        font = dialog
        just = [ left , center ]
        Scale = (0.800000011920929, 0.949999988079071)
        Pos = (80.0, 12.0)
        rgba = [ 128 128 128 78 ]
        z_priority = 20
        rot_angle = 8
    }
    CreateScreenElement {
        type = SpriteElement
        parent = clock_anchor
        id = time_bar
        texture = goal_grad
        rgba = [ 0 0 0 100 ]
        just = [ RIGHT , top ]
        Pos = (285.0, 18.0)
        Scale = (25.0, 4.0)
        z_priority = 19
        rot_angle = 8
    }
    CareerFunc func = GetCash
    FormatText textname = cash_text 'Geld - $%c' c = <cash>
    CreateScreenElement {
        type = TextElement
        parent = clock_anchor
        id = cash_counter
        text = <cash_text>
        font = dialog
        just = [ RIGHT , top ]
        Scale = (0.800000011920929, 0.949999988079071)
        Pos = (210.0, 26.0)
        rgba = [ 128 128 128 78 ]
        z_priority = 20
        rot_angle = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = clock_anchor
        id = cash_bar
        texture = goal_grad
        rgba = [ 0 0 0 100 ]
        just = [ RIGHT , top ]
        Pos = (285.0, 35.0)
        Scale = (14.0, 4.0)
        z_priority = 19
        rot_angle = 4
    }
endscript

script pause_add_combo_records 
    CareerFunc func = GetBoardComboRecord
    if (<board_combo_record> > min_career_combo_record)
        FormatText textname = combo_text 'Fette Kombo - %c' c = <board_combo_record> usecommas
        CreateScreenElement {
            type = TextElement
            parent = clock_anchor
            id = high_combo
            text = <combo_text>
            font = dialog
            just = [ left , top ]
            Scale = (0.800000011920929, 0.949999988079071)
            Pos = (80.0, 52.0)
            rgba = [ 128 128 128 78 ]
            z_priority = 20
            rot_angle = 0
        }
        CreateScreenElement {
            type = SpriteElement
            parent = clock_anchor
            id = high_combo_bar
            texture = goal_grad
            rgba = [ 0 0 0 100 ]
            just = [ RIGHT , top ]
            Pos = (400.0, 52.0)
            Scale = (30.0, 4.0)
            z_priority = 19
            rot_angle = 0
        }
    endif
    if skater ::IsSkaterOnBike
        CareerFunc func = GetBikeComboRecord
        if (<bike_combo_record> > min_career_combo_record)
            FormatText textname = combo_text 'Fette Bike-Kombo - %c' c = <bike_combo_record> usecommas
            CreateScreenElement {
                type = TextElement
                parent = clock_anchor
                id = high_bike__combo
                text = <combo_text>
                font = dialog
                just = [ left , top ]
                Scale = (0.800000011920929, 0.949999988079071)
                Pos = (80.0, 78.0)
                rgba = [ 128 128 128 78 ]
                z_priority = 20
                rot_angle = -4
            }
            CreateScreenElement {
                type = SpriteElement
                parent = clock_anchor
                id = high_bike_combo_bar
                texture = goal_grad
                rgba = [ 0 0 0 100 ]
                just = [ RIGHT , top ]
                Pos = (400.0, 64.0)
                Scale = (30.0, 4.0)
                z_priority = 19
                rot_angle = -4
            }
        endif
    endif
endscript

script launch_overview_map_menu 
    SetScreenElementLock id = root_window Off
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = city_map_anchor
        Pos = (0.0, 0.0)
        dims = (640.0, 480.0)
        just = [ left top ]
    }
    AssignAlias id = city_map_anchor alias = current_menu_anchor
    create_helper_text helper_text_elements = [{ text = '\m1 = Zurück' }]
    SetScreenElementProps {
        id = current_menu_anchor
        event_handlers = [
            { pad_back city_map_exit }
        ]
    }
    white_poly_bg_effect
    CreateScreenElement {
        type = ContainerElement
        parent = city_map_anchor
        id = city_map_parts_anchor
        Pos = (0.0, 0.0)
        dims = (640.0, 480.0)
        just = [ left top ]
        alpha = 0.0
    }
    CreateScreenElement {
        type = ContainerElement
        parent = city_map_parts_anchor
        id = map_bg_anchor
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
        just = [ center center ]
        Scale = (0.8000)
    }
    GetArraySize map_bg_params
    index = 0
    begin 
    map_add_bg_piece (map_bg_params [ <index> ])
    index = (<index> + 1)
    repeat <array_size>
    CreateScreenElement {
        type = SpriteElement
        parent = map_bg_anchor
        Pos = (0.0, 384.0)
        just = [ left bottom ]
        texture = level_ocean
        Scale = (8.0, 3.0)
        rgba = [ 90 90 90 118 ]
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = map_bg_anchor
        Pos = (310.0, 250.0)
        just = [ center center ]
        texture = level_stain
        Scale = (5.0, 4.0)
        rgba = [ 60 60 60 70 ]
        z_priority = 200
    }
    CreateScreenElement {
        type = TextElement
        parent = map_bg_anchor
        Pos = (390.0, 170.0)
        just = [ center center ]
        font = small
        text = 'LOS ANGELES'
        Scale = 2.800
        rgba = [ 0 0 0 118 ]
        rot_angle = -45
        z_priority = 6
    }
    CreateScreenElement {
        type = TextElement
        parent = map_bg_anchor
        Pos = (90.0, 260.0)
        just = [ center center ]
        font = small
        text = 'PAZIFIK'
        Scale = 1.600
        rgba = [ 128 128 128 60 ]
        rot_angle = 60
        z_priority = 6
    }
    GetArraySize map_photo_params
    index = 0
    begin 
    map_add_level_photo (map_photo_params [ <index> ])
    index = (<index> + 1)
    repeat <array_size>
    GetArraySize map_connector_params
    index = 0
    begin 
    map_add_connector (map_connector_params [ <index> ])
    index = (<index> + 1)
    repeat <array_size>
    DoScreenElementMorph id = city_map_parts_anchor alpha = 1.0 time = 0.5000
    if ObjectExists id = current_menu_anchor
        FireEvent type = focus target = current_menu_anchor
    endif
endscript

script city_map_exit \{ time = 0.3000 }
    DoScreenElementMorph id = city_map_parts_anchor alpha = 0.0 time = <time>
    wait <time> seconds
    create_your_options_menu
endscript
map_bg_params = [
    { Pos = (0.0, 0.0) texture = level_quad_2 rot = -90 }
    { Pos = (0.0, 1.0) texture = level_quad_2 rot = -90 }
    { Pos = (1.0, 0.0) texture = level_quad_1 rot = -90 }
    { Pos = (2.0, 0.0) texture = level_quad_2 rot = -90 }
    { Pos = (3.0, 0.0) texture = level_quad_1 rot = 90 }
    { Pos = (4.0, 0.0) texture = level_quad_1 rot = 0 }
    { Pos = (1.0, 1.0) texture = level_quad_1 rot = 90 }
    { Pos = (2.0, 1.0) texture = level_quad_1 rot = 90 flip_h = flip_h }
    { Pos = (3.0, 1.0) texture = level_quad_1 rot = 0 flip_h = flip_h }
    { Pos = (4.0, 1.0) texture = level_quad_2 rot = 0 }
    { Pos = (1.0, 2.0) texture = level_quad_2 rot = 180 }
    { Pos = (2.0, 2.0) texture = level_quad_1 rot = 90 }
    { Pos = (3.0, 2.0) texture = level_quad_1 rot = -90 }
    { Pos = (4.0, 2.0) texture = level_quad_2 rot = 0 }
    {
        Pos = (2.0, -0.6000000238418579)
        texture = HUD_comp_north
        rot = 0
        z_priority = 7
        Scale = 2
        rgba = [ 128 128 128 128 ]
        alpha = 1.0
    }
    {
        Pos = (2.0, 2.5)
        texture = HUD_comp_south
        rot = 0
        z_priority = 7
        Scale = 2
        rgba = [ 128 128 128 128 ]
        alpha = 1.0
    }
    {
        Pos = (4.599999904632568, 1.0)
        texture = HUD_comp_east
        rot = 0
        z_priority = 7
        Scale = 2
        rgba = [ 128 128 128 128 ]
        alpha = 1.0
    }
    {
        Pos = (-0.550000011920929, 1.0)
        texture = HUD_comp_west
        rot = 0
        z_priority = 7
        Scale = 2
        rgba = [ 128 128 128 128 ]
        alpha = 1.0
    }
]

script map_add_bg_piece \{rgba = [ 100 100 100 80 ]}
    CreateScreenElement {
        type = SpriteElement
        parent = map_bg_anchor
        Pos = ((<Pos> * 128)+ (64.0, 64.0))
        just = [ center center ]
        texture = <texture>
        rgba = <rgba>
        rot_angle = <rot>
        <flip_h>
        <flip_v>
        alpha = <alpha>
        z_priority = <z_priority>
        Scale = <Scale>
    }
endscript
map_photo_params = [
    {
        level = Load_Z_SR
        Pos = (220.0, 180.0)
        photo = polaroid_skateranch
        z_priority = 10
        rot_angle = -10
        text_off = (0.0, -14.0)
        text = 'SKATE-RANCH'
        tape = top_right
    }
    {
        level = Load_Z_SM
        Pos = (260.0, 310.0)
        photo = polaroid_santa_monica
        z_priority = 10
        rot_angle = -2
        text_off = (0.0, -3.0)
        text = 'SANTA MONICA'
    }
    {
        level = Load_Z_OI
        Pos = (190.0, 420.0)
        photo = polaroid_oil_rig
        z_priority = 5
        rot_angle = 10
        text_off = (0.0, 6.0)
        text = 'BOHRINSEL'
        tape = top_right
    }
    {
        level = Load_Z_BH
        Pos = (330.0, 230.0)
        photo = polaroid_beverly_hills
        z_priority = 20
        rot_angle = 20
        text_off = (0.0, 29.0)
        text = 'BEVERLY HILLS'
    }
    {
        level = Load_Z_HO
        Pos = (440.0, 200.0)
        photo = polaroid_hollywood
        z_priority = 30
        rot_angle = 2
        text_off = (0.0, 1.0)
        text = 'HOLLYWOOD'
    }
    {
        level = Load_Z_EL
        Pos = (600.0, 250.0)
        photo = polaroid_east_la
        z_priority = 20
        rot_angle = 5
        text_off = (0.0, 4.0)
        text = 'OST-L.A.'
        tape = bottom_left
        tape2 = top_left
    }
    {
        level = Load_Z_LV
        Pos = (625.0, 380.0)
        photo = polaroid_casino
        z_priority = 30
        rot_angle = -10
        text_off = (0.0, -8.0)
        text = 'KASINO'
        tape = bottom_right
    }
    {
        level = Load_Z_DT
        Pos = (470.0, 300.0)
        photo = polaroid_downtown
        z_priority = 10
        rot_angle = -5
        text_off = (0.0, -5.0)
        text = 'DOWNTOWN'
    }
    {
        level = Load_Z_SV
        Pos = (470.0, 425.0)
        photo = polaroid_vans
        z_priority = 30
        rot_angle = -2
        text_off = (0.0, -2.0)
        text = 'VANS'
        tape = top_right
    }
]

script map_add_level_photo 
    CreateScreenElement {
        type = ContainerElement
        parent = city_map_parts_anchor
        Pos = <Pos>
        dims = (200.0, 200.0)
        just = [ center center ]
        z_priority = <z_priority>
        rot_angle = <rot_angle>
        Scale = 0.9000
    }
    container_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        Pos = (0.0, 0.0)
        just = [ center center ]
        texture = <photo>
        Scale = 1
        rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        Pos = (2.0, 4.0)
        just = [ center center ]
        texture = white2
        Scale = (17.0, 17.0)
        rgba = [ 0 0 0 108 ]
        z_priority = (<z_priority> -1)
        alpha = 0.4000
    }
    IsLevelUnlocked level = <level>
    if (<unlocked> = 0)
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            Pos = (0.0, -5.0)
            just = [ center center ]
            texture = white2
            Scale = (15.0, 14.0)
            rgba = [ 0 0 0 128 ]
            z_priority = (<z_priority> + 2)
        }
        <text> = '?????????'
    endif
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        Pos = ((0.0, 52.0) + <text_off>)
        just = [ center center ]
        font = small
        text = <text>
        Scale = 1
        rgba = [ 128 128 128 128 ]
        z_priority = (<z_priority> + 23)
    }
    black_bar_x_scale = 15
    GetScreenElementDims id = <id>
    if (<width> > 120)
        black_bar_x_scale = (15 + ((<width> -120)/ 8))
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        Pos = (0.0, 52.0)
        just = [ center center ]
        texture = white2
        Scale = (<black_bar_x_scale> * (1.100000023841858, 0.0) + (0.0, 2.0))
        rgba = [ 0 0 0 128 ]
        z_priority = (<z_priority> + 20)
    }
    temp = <level>
    GetLevelStructureName
    RemoveParameter level
    level = <temp>
    if ((<level_structure_name>.load_script)= <level>)
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            Pos = (0.0, 0.0)
            just = [ center center ]
            texture = level_x
            Scale = 1.500
            rgba = [ 128 128 128 128 ]
            z_priority = (<z_priority> + 2)
        }
        RunScriptOnScreenElement id = <id> city_map_x_pulse_effect
    endif
    if GotParam tape
        switch <tape>
            case top_left
            tape_pos = (-60.0, -60.0)
            tape_rot_angle = 45
            case top_right
            tape_pos = (60.0, -60.0)
            tape_rot_angle = -45
            case bottom_left
            tape_pos = (-60.0, 60.0)
            tape_rot_angle = -45
            case bottom_right
            tape_pos = (60.0, 60.0)
            tape_rot_angle = 45
        endswitch
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            Pos = <tape_pos>
            just = [ center center ]
            texture = level_duct
            Scale = 1.500
            rgba = [ 128 128 128 128 ]
            z_priority = (<z_priority> + 2)
            rot_angle = <tape_rot_angle>
        }
    endif
    if GotParam tape2
        switch <tape2>
            case top_left
            tape_pos = (-60.0, -60.0)
            tape_rot_angle = 45
            case top_right
            tape_pos = (60.0, -60.0)
            tape_rot_angle = -45
            case bottom_left
            tape_pos = (-60.0, 60.0)
            tape_rot_angle = -45
            case bottom_right
            tape_pos = (60.0, 60.0)
            tape_rot_angle = 45
        endswitch
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            Pos = <tape_pos>
            just = [ center center ]
            texture = level_duct
            Scale = 1.500
            rgba = [ 128 128 128 128 ]
            z_priority = (<z_priority> + 3)
            rot_angle = <tape_rot_angle>
        }
    endif
endscript

script city_map_x_pulse_effect 
    wait 0.1000 seconds
    begin 
    time = 0.1000
    Random (@ DoMorph Scale = (1.7000000476837158, 1.7000000476837158) alpha = 1.0 relative_scale rot_angle = 3 time = <time>
        @ DoMorph Scale = (1.399999976158142, 1.399999976158142) alpha = 1.0 relative_scale rot_angle = -2 time = <time>
        @ DoMorph Scale = (1.5, 1.5) alpha = 1.0 relative_scale rot_angle = -4 time = <time>
        @ DoMorph Scale = (1.2999999523162842, 1.2999999523162842) alpha = 1.0 relative_scale rot_angle = 4 time = <time>
    )
    DoMorph rot_angle = 0 Scale = 1.0 relative_scale alpha = 0.7000 time = 0.2000
    Random (@ wait 0.1000 seconds
        @ wait 0.1000 seconds
        @ wait 0.1500 seconds
    )
    repeat 
endscript
map_connector_params = [
    { Pos = (190.0, 100.0) rot_angle = 20 }
    { Pos = (185.0, 170.0) rot_angle = -45 }
    { Pos = (150.0, 270.0) rot_angle = -80 }
    { Pos = (300.0, 120.0) rot_angle = -10 }
    { Pos = (390.0, 160.0) rot_angle = 75 }
    { Pos = (400.0, 285.0) rot_angle = -100 }
    { Pos = (450.0, 190.0) rot_angle = -15 }
    { Pos = (535.0, 240.0) rot_angle = -100 }
]

script map_add_connector 
    CreateScreenElement {
        type = SpriteElement
        parent = city_map_parts_anchor
        Pos = <Pos>
        just = [ center center ]
        texture = level_join
        rgba = [ 5 125 10 90 ]
        z_priority = 60
        rot_angle = <rot_angle>
    }
endscript
legend_current_col = 0
legend_current_row = 0
legend_max_col = 1

script pause_menu_legend 
    DoScreenElementMorph id = pause_vmenu Pos = (800.0, 75.0) time = 0.3000
    if ScreenElementExists id = music_track_anchor
        DoScreenElementMorph id = music_track_anchor Pos = (975.0, 320.0) time = 0.3000
    endif
    FireEvent type = unfocus target = pause_vmenu
    if ScreenElementExists id = legend_anchor
        DestroyScreenElement id = legend_anchor
    endif
    SetScreenElementLock id = current_menu_anchor Off
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = legend_anchor
        Pos = (720.0, 110.0)
        just = [ left top ]
        event_handlers = [
            { pad_right pause_menu_legend_exit }
            { pad_back pause_menu_legend_exit }
            { pad_start pause_menu_legend_exit }
        ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = legend_anchor
        Pos = (0.0, 0.0)
        Scale = (75.0, 57.0)
        texture = black
        rgba = [ 5 5 5 60 ]
        z_priority = 100
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = legend_anchor
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        font = testtitle
        text = 'LEGENDE'
        override_encoded_alpha
        rgba = [ 9 120 25 128 ]
        Scale = (1.5, 1.5)
        just = [ left top ]
        Pos = (170.0, -20.0)
        z_priority = 110
        rot_angle = 4
    }
    change legend_current_col = 0
    change legend_current_row = 0
    ForEachIn compass_bliptypes do = legend_add_item
    DoScreenElementMorph id = legend_anchor Pos = (320.0, 110.0) time = 0.3000
    SetScreenElementLock id = current_menu_anchor Off
    create_helper_text {
        parent = current_menu_anchor
        helper_pos = (330.0, 426.0)
        helper_text_elements = [
            { text = '\b5 = Zurück zum Menü' }
        ]
    }
    FireEvent type = focus target = legend_anchor
endscript

script legend_add_item 
    if GotParam legend_desc
        if GotParam own_row
            if (legend_current_col > 0)
                change legend_current_col = 0
                change legend_current_row = (legend_current_row + 1)
            endif
        endif
        item_pos = ((legend_current_col * (140.0, 0.0))+ (legend_current_row * (0.0, 31.0))+ (20.0, 20.0))
        CreateScreenElement {
            type = SpriteElement
            parent = legend_anchor
            Pos = <item_pos>
            texture = <texture>
            rgba = <rgba>
            z_priority = 101
            Scale = 0.9200
        }
        if (<pulse> = 1)
            RunScriptOnScreenElement id = <id> pause_menu_map_pulse
        endif
        CreateScreenElement {
            type = TextElement
            parent = legend_anchor
            font = dialog
            Pos = (<item_pos> + (20.0, 0.0))
            Scale = (0.800000011920929, 0.949999988079071)
            rgba = [ 128 128 128 78 ]
            z_priority = 101
            text = <legend_desc>
            just = [ left center ]
        }
        if GotParam own_row
            change legend_current_row = (legend_current_row + 1)
        else
            change legend_current_col = (legend_current_col + 1)
            if (legend_current_col > legend_max_col)
                change legend_current_col = 0
                change legend_current_row = (legend_current_row + 1)
            endif
        endif
    endif
endscript

script pause_menu_legend_exit 
    FireEvent type = unfocus target = legend_anchor
    DoScreenElementMorph id = pause_vmenu Pos = (410.0, 75.0) time = 0.3000
    if ScreenElementExists id = music_track_anchor
        DoScreenElementMorph id = music_track_anchor Pos = (575.0, 320.0) time = 0.3000
    endif
    DoScreenElementMorph id = legend_anchor Pos = (720.0, 110.0) time = 0.3000
    wait 0.3000 seconds
    FireEvent type = focus target = pause_vmenu
    SetScreenElementLock id = current_menu_anchor Off
    create_helper_text {
        parent = current_menu_anchor
        helper_pos = (330.0, 426.0)
        helper_text_elements = [
            { text = '\b6 = Kartenlegende' }
            { text = '\b7/\b4 = Wählen' }
            { text = '\m1 = Zurück' }
            { text = '\m0 = OK' }
        ]
    }
endscript

script career_mode_quit_dialog 
    menu_confirm_quit \{ yes_script = career_mode_save_dialog }
endscript

script career_mode_save_dialog 
    <prompt_save> = 1
    if GameModeEquals is_career
        if game_progress_disallow_save
            <prompt_save> = 0
        endif
    endif
    if IsXenon
        if NOT CheckForSignin local
            <prompt_save> = 0
        endif
    endif
    if GameModeEquals is_career
        <text> = 'Warnung!\nAlle ungespeicherten Änderungen an deinem aktuellen Story-Modus gehen verloren.\n\nMöchtest du deinen Fortschritt speichern?'
    else
        <text> = 'Warnung!\nAlle ungespeicherten Änderungen an deinem aktuellen Klassik-Modus gehen verloren.\n\nMöchtest du deinen Fortschritt speichern?'
    endif
    if (<prompt_save> = 1)
        create_error_box {
            Title = 'Fortschritt sichern?'
            text = <text>
            Pos = (310.0, 240.0)
            just = [ center center ]
            text_rgba = [ 88 105 112 128 ]
            pad_back_script = career_mode_quit_dialog
            buttons = [
                {font = small text = 'Ja' pad_choose_script = launch_quit_career_save_game_sequence}
                {font = small text = 'Nein' pad_choose_script = career_quit_to_main}
            ]
        }
    else
        career_quit_to_main
    endif
endscript

script career_quit_to_main 
    level_select_change_level_quit \{ level = Load_Z_MainMenu }
endscript
