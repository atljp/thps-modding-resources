SE_Brightness = 5
ALWAYSPLAYMUSIC = 1
HIDEHUD = 0
DEVKIT_LEVELS = 1
UI_text_shadow_offset = (1.0, 1.0)
UI_text_shadow_color = [ 0 0 0 100 ]
smallfont_colors = [
    [ 128 128 128 100 ]
    [ 102 26 8 100 ]
    [ 17 64 116 100 ]
    [ 9 107 36 100 ]
    [ 123 99 3 100 ]
    [ 0 128 128 100 ]
    [ 128 0 128 100 ]
    [ 30 50 80 100 ]
    [ 88 105 112 128 ]
]
dialogfont_colors = [
    [ 88 105 112 128 ]
    [ 102 26 8 100 ]
    [ 17 64 116 100 ]
    [ 9 107 36 100 ]
    [ 123 99 3 100 ]
    [ 127 102 0 100 ]
    [ 100 100 128 100 ]
]

script no_launch_cag_pause_load 
    dialog_box_exit
    create_pause_menu
endscript

script maybe_edit_skater 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    wait 2 frames
    create_dialog_box {Title = 'Bestätigung bearbeiten'
        text = 'Aktuellen Level verlassen, um Optionen zu ändern?'
        Pos = (320.0, 240.0)
        just = [ center center ]
        text_rgba = [ 88 105 112 128 ]
        text_scale = 1
        pad_back_script = no_edit_skater
        buttons = [{font = small text = 'Ja' pad_choose_script = <yes_script> pad_choose_params = <yes_params>}
            {font = small text = 'Nein' pad_choose_script = no_edit_skater}
        ]
    }
endscript

script no_edit_skater 
    dialog_box_exit
    wait \{ 1 frame }
    create_your_options_menu
endscript
music_was_paused = 0
inside_pause = 0

script launch_restart_menu 
    generic_menu_animate_out \{ menu = current_menu force }
    create_restart_menu
endscript

script create_restart_menu 
    hide_current_goal
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_scrolling_menu Title = 'NEU STARTEN' dims = (600.0, 237.0) Pos = (229.0, 80.0) right_bracket_z = 1
    if cd
        <callback_script> = create_pause_menu
    else
        <callback_script> = create_debug_options_menu
    endif
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = <callback_script> }}
        ]
    }
    create_helper_text generic_helper_text
    kill_start_key_binding
    AddRestartsToMenu initial_scale = 1.0
    theme_menu_add_item text = 'Fertig' pad_choose_script = create_debug_options_menu no_bg last_item = last_item centered = centered
    finish_themed_scrolling_menu
endscript

script skip_to_selected_restart 
    ResetSkaters <...> 
    exit_pause_menu
endscript

script menu_confirm_quit {
        yes_script = level_select_change_level_quit
        no_script = menu_quit_no
        back_script = menu_quit_no
        Title = 'BEENDEN?'
        text = 'Bist du sicher?'
        text_dims = (200.0, 0.0)
        params = {}
    }
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    KillSpawnedScript name = pause_menu_map_pulse
    if NOT IsTrue bootstrap_build
        create_error_box {Title = <Title>
            text = <text>
            Pos = (310.0, 240.0)
            just = [ center center ]
            text_rgba = [ 88 105 112 128 ]
            text_dims = <text_dims>
            pad_back_script = <back_script>
            pad_back_params = <params>
            buttons = [{font = small text = 'Ja' pad_choose_script = <yes_script> pad_choose_params = {level = Load_Z_MainMenu <params>}}
                {font = small text = 'Nein' pad_choose_script = <no_script> pad_choose_params = <params>}
            ]
        }
    else
        create_error_box {Title = <Title>
            text = 'Demo verlassen?'
            Pos = (310.0, 240.0)
            just = [ center center ]
            text_rgba = [ 88 105 112 128 ]
            pad_back_script = <back_script>
            buttons = [{font = small text = 'Ja' pad_choose_script = bootstrap_quit}
                {font = small text = 'Nein' pad_choose_script = <back_script>}
            ]
        }
    endif
endscript

script menu_confirm_quit_park_editor {
        yes_script = launch_park_editor_save_park_sequence
        no_script = parked_quit
        back_script = menu_quit_no
        Title = 'Park speichern?'
    }
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if IsXenon
        if NOT CheckForSignin local
            <no_script> level = Load_Z_MainMenu
            return 
        endif
    endif
    if IsParkUnsaved
        if ((IsXbox)|| (IsXenon)|| (isPC))
            error_text = 'Möchtest du deinen Park vor dem Verlassen speichern?'
        else
            if IsNGC
                error_text = 'Möchtest du deinen Park vor dem Verlassen speichern?'
            else
                error_text = 'Durch das Online-Spiel oder das Herunterladen eines neuen Parks gehen ungespeicherte Änderungen an diesem Park verloren. Jetzt speichern?'
            endif
        endif
        create_error_box {Title = <Title>
            text = <error_text>
            Pos = (310.0, 240.0)
            just = [ center center ]
            text_rgba = [ 88 105 112 128 ]
            pad_back_script = <back_script>
            buttons = [{font = small text = 'Ja' pad_choose_script = <yes_script> pad_choose_params = { level = Load_Z_MainMenu }}
                {font = small text = 'Nein' pad_choose_script = <no_script> pad_choose_params = { level = Load_Z_MainMenu }}
            ]
        }
    else
        <no_script> level = Load_Z_MainMenu
    endif
endscript

script level_select_change_level_quit 
    printscriptinfo 'level_select_change_level_quit'
    if ((IsXbox)|| (isPC))
        DisplayLoadingScreen freeze
    else
        DisplayLoadingScreen blank
    endif
    change is_changing_levels = 1
    GoalManager_DeactivateAllGoals force_all
    GoalManager_LevelUnload
    if GameModeEquals is_career
        ResetSkaters
    else
        ResetSkaters
    endif
    SetButtonEventMappings block_menu_input
    if IsXenon
        if NOT InNetGame
            xenon_singleplayer_session_complete_uninit
        endif
    endif
    RailEditor ::DestroyEditedRailSectors
    printf 'leaving and destroying server'
    chosen_leave_server
    if NOT GameModeEquals is_career
        dont_end_chapter = 1
    endif
    SetGameType career
    SetCurrentGameType
    SetStatOverride
    SetServerMode on
    StartServer
    SetJoinMode JOIN_MODE_PLAY
    printf 'attempting to join server'
    JoinServer
    printf 'waiting'
    begin 
    printf 'waiting 1 frame'
    if JoinServerComplete
        break 
    else
        wait 1
    endif
    printf 'still waiting'
    repeat 
    printf 'attempting to change level'
    level_select_change_level <...> 
    SetButtonEventMappings unblock_menu_input
endscript

script create_watch_cutscenes_menu \{ back_script = create_options_menu }
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    make_new_themed_sub_menu \{ Title = 'ZWISCHENSEQUENZEN' }
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = <back_script> }}
        ]
    }
    add_viewed_cutscenes_to_menu
    theme_menu_add_item text = 'Fertig' pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = <back_script> }centered last_menu_item = last_menu_item
    finish_themed_sub_menu
endscript

script has_cutscenes 
    GetCurrentLevel
    switch <level>
        case load_nj
        case load_ny
        case load_fl
        case load_sd
        case load_hi
        case load_vc
        case load_sj
        case load_ru
        return \{ does_have_cutscenes = 1 }
        default 
        return \{ does_have_cutscenes = 0 }
    endswitch
endscript

script add_viewed_cutscenes_to_menu 
    GetCurrentLevel
    switch <level>
        case load_ny
        <cutscene_list> = cutscene_unlock_list_ny
        case load_fl
        <cutscene_list> = cutscene_unlock_list_fl
        case load_vc
        <cutscene_list> = cutscene_unlock_list_vc
        default 
        return 
    endswitch
    GetArraySize <cutscene_list>
    <index> = 0
    begin 
    if NOT IsNGC
        <skip_me> = 0
    else
        if StructureContains structure = (((<cutscene_list>)[ <index> ]))not_with_ngc
            <skip_me> = 1
        else
            <skip_me> = 0
        endif
    endif
    if GetGlobalFlag flag = (((<cutscene_list>)[ <index> ]).flag)
        if StructureContains structure = (((<cutscene_list>)[ <index> ]))name2
            if (<skip_me> = 0)
                theme_menu_add_item {
                    text = (((<cutscene_list>)[ <index> ]).text)
                    pad_choose_script = watch_cutscene
                    pad_choose_params = {name = (((<cutscene_list>)[ <index> ]).name)name2 = (((<cutscene_list>)[ <index> ]).name2)Tod_Action = (((<cutscene_list>)[ <index> ]).Tod_Action)tod_action2 = (((<cutscene_list>)[ <index> ]).tod_action2)tod_action3 = (((<cutscene_list>)[ <index> ]).tod_action3)}
                    centered
                }
            endif
        else
            if (<skip_me> = 0)
                theme_menu_add_item {
                    text = (((<cutscene_list>)[ <index> ]).text)
                    pad_choose_script = watch_cutscene
                    pad_choose_params = {name = (((<cutscene_list>)[ <index> ]).name)Tod_Action = (((<cutscene_list>)[ <index> ]).Tod_Action)tod_action2 = (((<cutscene_list>)[ <index> ]).tod_action2)}
                    centered
                }
            endif
        endif
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script watch_cutscene 
    Debounce x 2.500
    pause_menu_gradient Off
    if GotParam Tod_Action
    endif
    if GotParam tod_action2
    endif
    UnPauseGame
    Debounce x 2.500
    PauseMusic 0
    if NOT GotParam name2
        PlayCutscene <...> from_cutscene_menu dont_send_skater_to_hand_brake exitscript = watch_cutscene_done
    else
        PlayCutscene {
            name = <name>
            from_cutscene_menu
            dont_send_skater_to_hand_brake
            unload_anims = 1
            reload_anims = 0
            unload_goals = 1
            reload_goals = 0
            exitscript = spawn_next_cutscene
            exitparams = {name = <name2> from_cutscene_menu dont_send_skater_to_hand_brake Tod_Action = <tod_action3> unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitscript = watch_cutscene_done}
        }
    endif
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen
endscript

script watch_cutscene_done 
    pausegame
    PauseMusic \{ 1 }
    Debounce \{ x 0.5000 }
    pause_menu_gradient \{ on }
    create_watch_cutscenes_menu
endscript

script choose_boolean_option 
    SetPreferencesFromUI prefs = network <...> 
    create_options_menu
endscript

script back_from_boolean_menus 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_options_menu
endscript

script create_options_score_display_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_sub_menu Title = 'PUNKTEANZEIGE' right_bracket_alpha = 0.0
    SetScreenElementProps {
        id = current_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_boolean_menus }}]
        replace_handlers
    }
    theme_menu_add_item text = 'Spieler zeigen' centered id = menu_players pad_choose_script = choose_boolean_option pad_choose_params = {field = 'score_display' checksum = score_players string = 'Spieler zeigen'}
    theme_menu_add_item text = 'Teams zeigen' centered id = menu_teams pad_choose_script = choose_boolean_option pad_choose_params = {field = 'score_display' checksum = score_teams string = 'Teams zeigen'}
    theme_menu_add_item text = 'Fertig' pad_choose_script = back_from_boolean_menus last_menu_item = last_menu_item
    finish_themed_sub_menu
endscript

script menu_start_autotest 
    SetTesterScript \{ test_advance }
    exit_pause_menu
endscript

script menu_stop_autotest 
    KillTesterScript
    exit_pause_menu
endscript

script fake_button 
    FireEvent type = <type> source = system target = system Data = {controller = 0 device_num = 0}
endscript

script test_advance 
    begin 
    <loops> = 5
    begin 
    wait 10 gameframes
    if IsMovieQueued
        printf 'AUTOTEST: In Cutscene/Movie/Camanim'
        printf 'AUTOTEST: Fake X'
        fake_button type = pad_x
        <loops> = 5
    else
        if NOT ScreenElementExists id = current_menu_anchor
            printf 'AUTOTEST: Menu Gone'
            printf 'AUTOTEST: Fake X and start'
            fake_button type = pad_x
            fake_button type = pad_down
            <loops> = (<loops> -1)
        else
            printf 'AUTOTEST: Fake Start'
            fake_button type = pad_start
            fake_button type = pad_down
            <loops> = 5
        endif
    endif
    if (<loops> = 0)
        break 
    endif
    repeat 
    printf 'AUTOTEST: Advancing in 3 seconds'
    wait 150 gameframes
    printf 'AUTOTEST: Advance'
    cheats_menu_advance_stage
    repeat 
endscript
boardshop_deck_price = 50
unlock_sponsor_boards = 0
in_boardshop = 0
entered_skateshop_through_door = 0

script create_end_run_menu 
    dialog_box_exit
    SetGameType freeskate2p
    SetCurrentGameType
    PauseMusicAndStreams
    pausegame
    kill_start_key_binding
    make_label_menu {
        Title = '2 SPIELER'
        title_pos = (30.0, 40.0) Pos = (130.0, 120.0)
        spacing = 20
    }
    create_helper_text generic_helper_text_no_back
    add_label_menu_item {
        text = 'SPIEL STARTEN'
        rot = 3
        Length = 150
        text_offset = (0.0, 0.0)
        label_offset = (-10.0, 0.0)
        id = menu_end_run_start_game pad_choose_script = create_network_game_options_menu pad_choose_params = { end_run }
    }
    add_label_menu_item {
        text = 'ORT WECHSELN'
        rot = -4
        Length = 150
        text_offset = (0.0, 0.0)
        label_offset = (-10.0, 0.0)
        id = menu_end_run_change_levels pad_choose_script = launch_level_select_menu pad_choose_params = { end_run }
    }
    add_label_menu_item {
        text = 'GETEILTER MODUS'
        rot = 0
        Length = 100
        text_offset = (0.0, 0.0)
        label_offset = (-10.0, 0.0)
        id = menu_end_run_split_mode pad_choose_script = create_split_menu pad_choose_params = { callback_script = create_end_run_menu end_run }
    }
    add_label_menu_item {
        text = 'BEENDEN'
        rot = 5
        Length = 60
        text_offset = (0.0, 0.0)
        label_offset = (-10.0, 0.0)
        id = menu_end_run_quit pad_choose_script = menu_confirm_quit pad_choose_params = {no_script = create_end_run_menu back_script = create_end_run_menu}
    }
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    roundbar_menu_finish
endscript

script create_your_options_menu 
    hide_current_goal
    make_label_menu {
        Title = 'DEIN STATUS'
        title_pos = (160.0, 40.0) Pos = (130.0, 120.0) title_rotation = 10
        spacing = 4
        pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_pause_menu }
    }
    pause_menu_gradient
    white_poly_bg_effect
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    unhide_root_window
    if GameModeEquals is_career
        add_label_menu_item {
            text = 'STADTKARTE'
            rot = -1
            Scale = 0.9000
            label_offset = (-10.0, 0.0)
            id = menu_map
            pad_choose_script = launch_overview_map_menu
        }
    endif
    if ((GameModeEquals is_career)|| (GameModeEquals is_classic))
        add_label_menu_item {
            text = 'SPIELFORTSCHRITT'
            rot = 2
            Scale = 0.9000
            label_offset = (-20.0, 0.0)
            id = menu_game_progress pad_choose_script = game_progress_menu_create
        }
    endif
    if GameModeEquals is_career
        add_label_menu_item {
            text = 'FÄHIGKEITEN ANSEHEN'
            rot = 1
            Scale = 0.9000
            pad_choose_script = create_view_abilities_menu
        }
        add_label_menu_item {
            text = 'SKATE-RANCH-TEILE ANSEHEN'
            rot = 1
            Scale = 0.9000
            pad_choose_script = create_view_skateranch_menu
        }
    endif
    edit_tricks_menu_can_edit
    if (<tricks_editable> = 0)
        if (<tricks_viewable> = 1)
            add_label_menu_item {
                text = 'TRICKS ANSEHEN'
                rot = 2
                Length = 150
                Scale = 0.9000
                text_offset = (0.0, 0.0)
                label_offset = (-10.0, 0.0)
                id = menu_edit_tricks
                pad_choose_script = create_edit_tricks_menu
            }
        else
            add_label_menu_item {
                text = 'TRICKS ANSEHEN'
                rot = 2
                Length = 150
                Scale = 0.9000
                text_offset = (0.0, 0.0)
                label_offset = (-10.0, 0.0)
                id = menu_edit_tricks
                not_focusable
            }
        endif
    else
        add_label_menu_item {
            text = 'TRICKS BEARBEITEN'
            rot = -2
            Length = 150
            Scale = 0.9000
            text_offset = (0.0, 0.0)
            label_offset = (-10.0, 0.0)
            id = menu_edit_tricks
            pad_choose_script = create_edit_tricks_menu
        }
    endif
    if GameModeEquals is_cat
        if (<cat_shown> = 1)
            if (<cat_active> = 0)
                add_label_menu_item {
                    text = 'MACH-DIR-DEN-TRICK'
                    rot = 0
                    Length = 200
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_cat
                    not_focusable
                }
            else
                add_label_menu_item {
                    text = 'MACH-DIR-DEN-TRICK'
                    rot = -2
                    Length = 200
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_cat
                    pad_choose_script = create_pre_cat_menu
                }
            endif
        endif
    endif
    if GameModeEquals is_career
        GetLevelStructureName
        FormatText checksumname = actual_level '%a' a = (<level_structure_name>.level)
        if ZoneLoadedAndParsed <actual_level>
            add_label_menu_item {
                text = 'GAPS ANSEHEN'
                rot = 0
                Scale = 0.9000
                text_offset = (0.0, 0.0)
                id = menu_skip_to_gap pad_choose_script = launch_gap_menu
            }
        else
            add_label_menu_item {
                text = 'GAPS ANSEHEN'
                rot = 0
                Scale = 0.9000
                text_offset = (0.0, 0.0)
                id = menu_skip_to_gap
                not_focusable
            }
        endif
    else
        if GameModeEquals is_singlesession
            if NOT InSplitScreenGame
                if NOT InNetGame
                    add_label_menu_item {
                        text = 'HIGHSCORES'
                        rot = -4
                        Length = 150
                        Scale = 0.9000
                        label_offset = (-10.0, 0.0)
                        id = menu_high_scores pad_choose_script = high_scores_menu_create pad_choose_params = { from_pause = from_pause }
                    }
                endif
            endif
        endif
        add_label_menu_item {
            text = 'GAPS ANSEHEN'
            rot = 0
            Scale = 0.9000
            text_offset = (0.0, 0.0)
            id = menu_skip_to_gap pad_choose_script = launch_gap_menu
        }
    endif
    if ((GameModeEquals is_career)|| (GameModeEquals is_classic)|| (GameModeEquals is_singlesession))
        if skater ::IsSkaterOnVehicle
            add_label_menu_item {
                text = 'STATS ANSEHEN'
                rot = -2
                Scale = 0.9000
                text_offset = (0.0, 0.0)
                id = menu_edit_stats pad_choose_script = create_stats_menu not_focusable
            }
        else
            add_label_menu_item {
                text = 'STATS ANSEHEN'
                rot = -2
                Length = 160
                Scale = 0.9000
                text_offset = (0.0, 0.0)
                id = menu_edit_stats pad_choose_script = create_stats_menu
            }
        endif
    endif
    if root_window ::getsingletag no_exit_pause_menu
        NoCustomRestarts = NoCustomRestarts
    endif
    if NOT GotParam NoCustomRestarts
        if InNetGame
            GetPreferenceString pref_type = network auto_brake
            if (<ui_string> = 'Aus')
                set_restart_not_focusable = not_focusable
            endif
        endif
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
        endif
        if NOT GameModeEquals is_career
            if NOT IsObserving
                add_label_menu_item {
                    text = 'NEUSTART BESTIMMEN'
                    rot = -4
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
                        text = 'ZUM NEUSTART'
                        rot = 0
                        Length = 160
                        Scale = 0.9000
                        label_offset = (-20.0, 0.0)
                        id = menu_skip_to_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = skip_to_custom_restart }
                    }
                else
                    add_label_menu_item {
                        text = 'ZUM NEUSTART'
                        rot = 0
                        Length = 160
                        Scale = 0.9000
                        label_offset = (-20.0, 0.0)
                        id = menu_skip_to_custom not_focusable
                    }
                endif
            else
                add_label_menu_item {
                    text = 'NEUSTART BESTIMMEN'
                    rot = 0
                    Length = 160
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_set_custom not_focusable
                }
                add_label_menu_item {
                    text = 'ZUM NEUSTART'
                    rot = 0
                    Length = 160
                    Scale = 0.9000
                    label_offset = (-20.0, 0.0)
                    id = menu_skip_to_custom not_focusable
                }
            endif
        endif
    endif
    label_menu_finish
endscript

script create_debug_options_menu 
    hide_current_goal
    make_label_menu {
        Title = 'DEBUG OPTIONS'
        title_pos = (160.0, 44.0) Pos = (130.0, 120.0) title_rotation = 10
        spacing = 4
        pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_pause_menu }
    }
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    unhide_root_window
    white_poly_bg_effect
    add_label_menu_item {
        text = 'CHEATS: DEBUG'
        rot = -4
        Length = 180
        label_offset = (-20.0, 0.0)
        id = menu_cheats pad_choose_script = launch_cheats_menu
    }
    add_label_menu_item {
        text = 'ZUM NEUSTART'
        rot = -4
        Length = 180
        label_offset = (-20.0, 0.0)
        id = menu_skip_to_restart pad_choose_script = launch_restart_menu
    }
    add_label_menu_item {
        text = 'DEBUG MENU'
        rot = -4
        Length = 180
        label_offset = (-20.0, 0.0)
        id = DEBUG_MENU pad_choose_script = create_debug_menu
    }
    pause_menu_gradient
    <show_cutscene_menu> = 1
    if pal
        if IsNGC
            <show_cutscene_menu> = 0
        endif
    endif
    if (<show_cutscene_menu> = 1)
        if GameModeEquals is_career
            has_cutscenes
            if (<does_have_cutscenes> = 1)
                add_label_menu_item {
                    text = 'ZWISCHENSEQUENZEN ANSEHEN'
                    rot = 0
                    Length = 220
                    label_offset = (-20.0, 0.0)
                    id = menu_watch_cutscenes pad_choose_script = create_watch_cutscenes_menu
                }
            else
                add_label_menu_item {
                    text = 'ZWISCHENSEQUENZEN ANSEHEN'
                    rot = 0
                    Length = 220
                    label_offset = (-20.0, 0.0)
                    id = menu_watch_cutscenes not_focusable
                }
            endif
        endif
    endif
    add_music_track_text
    label_menu_finish
    FireEvent type = focus target = current_menu_anchor
endscript

script focus_stats_display 
    gettags
    SetScreenElementLock id = <id> Off
    CreateScreenElement {
        type = ContainerElement
        parent = <id>
        id = stats_block
        Pos = (150.0, 20.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = stats_block
        id = stat_bg
        texture = white2
        z_priority = -4
        Scale = (31.0, 27.0)
        Pos = (50.0, -10.0)
        just = [ left top ]
        rgba = [ 0 0 0 80 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = stats_block
        texture = white2
        Pos = (50.0, -10.0)
        rgba = [101 , 71 , 26 , 128]
        just = [ left center ]
        Scale = (31.0, 0.4000000059604645)
        z_priority = -3
    }
    stats_menu_create_stats_block {
        parent = stats_block
        id = stats_block_anchor
        not_focusable
        on = on
        Scale = 0.8500
        Pos = (0.0, 20.0)
        pro_name = <name>
    }
endscript

script unfocus_stats_display 
    if ScreenElementExists \{ id = stats_block }
        DestroyScreenElement \{ id = stats_block }
    endif
endscript
