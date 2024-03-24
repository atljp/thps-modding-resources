

script create_pause_menu 
    skater ::obj_setflag ANTEARA_FAILSAFE_FLAG
    anteara_failsafe
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
    hide_all_hud_items
    unhide_current_goal
    if InNetGame
        if NOT IsObserving
            skater ::netdisableplayerinput
        endif
    else
        if CustomParkMode editing
            anteara_parked_setup_main_menu
            PauseMusicAndStreams 1
            build_pause_menu_parts
            return 
        endif
        if CustomParkMode testing
            anteara_parked_setup_test_play_menu
            PauseMusicAndStreams 1
            build_pause_menu_parts
            return 
        endif
        if InSplitScreenGame
            create_mp_pause_menu
            PauseMusicAndStreams 1
            build_pause_menu_parts
            return 
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
    if (in_cat_preview_mode = 1)
        create_CAT_pause_menu
        return 
    endif
    if NOT GotParam no_exit
        helper = generic_helper_text
    else
        helper = generic_helper_text_no_back
    endif
    if GotParam no_exit
        make_new_roundbar_menu {
            menu_id = Pause_Menu
            vmenu_id = pause_vmenu
            pad_back_script = NullScript
            Pos = (250.0, 95.0)
            dims = (250.0, 480.0)
            internal_text_just = RIGHT
            helper_text = <helper>
            add_3d_bg
        }
    else
        if skater ::driving
            make_new_roundbar_menu {
                menu_id = Pause_Menu
                vmenu_id = pause_vmenu
                pad_back_script = handle_start_pressed
                Pos = (250.0, 75.0)
                dims = (250.0, 480.0)
                internal_text_just = RIGHT
                helper_text = <helper>
                add_3d_bg
            }
        else
            make_new_roundbar_menu {
                menu_id = Pause_Menu
                vmenu_id = pause_vmenu
                pad_back_script = handle_start_pressed
                Pos = (250.0, 95.0)
                dims = (250.0, 480.0)
                internal_text_just = RIGHT
                helper_text = <helper>
                add_3d_bg
            }
        endif
    endif
    do_localized_pause_title Pos = (500.0, 95.0)
    kill_start_key_binding
    pause_menu_gradient RIGHT
    add_music_track_text Pos = (575.0, 320.0)
    if ObjectExists id = PlayerVehicle
        add_roundbar_menu_item {text = 'EXIT VEHICLE'
            id = ditch_vehicle_id
            pad_choose_script = Anteara_Easy_ExitVehicle
            pad_choose_sound = generic_pause_exit_sound
        }
    endif
    if GameModeEquals is_singlesession
        add_roundbar_menu_item {text = 'CONTINUE'
            id = menu_continue
            pad_choose_script = handle_pause_continue
            pad_choose_sound = generic_pause_exit_sound
        }
        if GoalManager_GoalIsActive name = trickattack
            add_roundbar_menu_item {
                text = 'RETRY HIGH SCORE RUN'
                id = menu_retry_high_score_run
                pad_choose_script = menu_select
                pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal }
            }
            add_roundbar_menu_item {
                text = 'END HIGH SCORE RUN'
                id = menu_end_high_score_run
                pad_choose_script = menu_select
                pad_choose_params = { menu_select_script = end_high_score_run }
            }
        else
            add_roundbar_menu_item {
                text = 'START HIGH SCORE RUN'
                id = menu_start_high_score_run
                pad_choose_script = menu_select
                pad_choose_params = { menu_select_script = TrickAttack_MenuStartRun }
            }
        endif
    else
        if NOT GotParam no_exit
            add_roundbar_menu_item {text = 'CONTINUE'
                id = menu_continue
                pad_choose_script = handle_pause_continue
                pad_choose_sound = generic_pause_exit_sound
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
                            add_roundbar_menu_item text = 'RETRY LAST GOAL' id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_vibration menu_select_script = RetryCurrentGoal }
                        endif
                    endif
                endif
            endif
        endif
        add_roundbar_menu_item text = 'VIEW GOALS' id = menu_view_goals pad_choose_script = create_view_selected_goals_menu pad_choose_params = { from_pause }
    endif
    if GameModeEquals is_career
        goal_id = (goal_utility_allow_end_goal_name)
        if NOT ChecksumEquals a = <goal_id> b = null
            if GoalManager_GoalExists name = <goal_id>
                if GoalManager_GoalIsActive name = <goal_id>
                    add_roundbar_menu_item text = 'END CURRENT RUN' id = menu_end_run pad_choose_script = arcade_machine_end_run pad_choose_params = { goal_id = <goal_id> }
                endif
            endif
        endif
        if GoalManager_CanRetryGoal
            add_roundbar_menu_item text = 'RETRY LAST GOAL' id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = {stop_vibration stop_streams menu_select_script = RetryCurrentGoal}
        endif
        if NOT LevelIs load_se
            add_roundbar_menu_item text = 'VIEW GOALS' id = menu_chapters pad_choose_script = view_goals_menu_create
        endif
        add_roundbar_menu_item text = 'TEXT MESSAGES' id = menu_pager pad_choose_script = pager_window_create
    else
        if GameModeEquals is_creategoals
            if GoalManager_HasActiveGoals
                add_roundbar_menu_item text = 'END CURRENT GOAL' id = menu_end_current_goal pad_choose_script = menu_select pad_choose_params = { menu_select_script = end_current_goal_run }
            endif
            add_roundbar_menu_item text = 'VIEW GOALS' id = menu_view_goals pad_choose_script = view_created_goals_menu_create
            if NOT LevelIs load_sk5ed_gameplay
                add_roundbar_menu_item text = 'CREATE A GOAL' id = menu_create_a_goal pad_choose_script = create_existing_goals_menu
            endif
        endif
    endif
    if GameModeEquals is_classic
        classic_mode_menu_add_pause_options
    endif
    if GameModeEquals is_creategoals
        if NOT LevelIs load_sk5ed_gameplay
            add_roundbar_menu_item text = 'LOAD GOALS' id = menu_load_goals pad_choose_script = prompt_launch_cag_pause_load
            GoalEditor ::GetNumEditedGoals ExcludeParkEditorGoals
            if (<NumGoals> = 0)
                no_edited_goals = 1
            endif
            add_roundbar_menu_item text = 'SAVE GOALS' id = menu_save_goals pad_choose_script = launch_pause_menu_save_created_goals not_focusable = <no_edited_goals>
        endif
    endif
    display_level_select = 1
    if InNetGame
        display_level_select = 0
    endif
    if GameModeEquals is_classic
        if NOT GotParam no_exit
            display_level_select = 0
        endif
    endif
    if (<display_level_select> = 1)
        add_roundbar_menu_item {text = 'CHANGE LEVEL'
            id = menu_level_select
            pad_choose_script = launch_level_select_menu
            tag_grid_x = 1
        }
    endif
    if InNetGame
        if ishost
            if GameModeEquals is_lobby
                if NOT NetworkGamePending
                    if NOT ChangeLevelPending
                        add_roundbar_menu_item text = 'START GAME' id = menu_network_start_select pad_choose_script = network_game_options_selected
                    endif
                endif
            else
                add_roundbar_menu_item text = 'END CURRENT GAME' id = menu_network_end_select pad_choose_script = network_end_game_selected
            endif
        endif
    endif
    if InNetGame
        if NOT NetworkGamePending
            if OnServer
                if OnXbox
                    add_roundbar_menu_item text = 'HOST OPTIONS' id = menu_network_server_opts_select pad_choose_script = network_options_selected
                else
                    add_roundbar_menu_item text = 'SERVER OPTIONS' id = menu_network_server_opts_select pad_choose_script = network_options_selected
                endif
            endif
            if ishost
                if GameModeEquals is_lobby
                    if NOT OnServer
                        if OnXbox
                            add_roundbar_menu_item text = 'HOST OPTIONS' id = menu_network_server_opts_select pad_choose_script = network_options_selected
                        else
                            add_roundbar_menu_item text = 'SERVER OPTIONS' id = menu_network_server_opts_select pad_choose_script = network_options_selected
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
                <trick_text> = 'EDIT TRICKS'
                <trick_helper> = view_tricks_helper_desc
            else
                if NOT GoalManager_HasActiveGoals
                    <trick_text> = 'EDIT TRICKS'
                    <trick_helper> = edit_tricks_helper_desc
                else
                    <trick_text> = 'EDIT TRICKS'
                    <trick_helper> = view_tricks_helper_desc
                endif
            endif
            add_roundbar_menu_item text = <trick_text> id = menu_cas pad_choose_script = create_edit_tricks_menu
        endif
    endif
    if InNetGame
        if ishost
            if GameModeEquals is_lobby
                if NOT NetworkGamePending
                    if NOT ChangeLevelPending
                        add_roundbar_menu_item text = 'CHANGE LEVEL' id = menu_level_select pad_choose_script = launch_level_select_menu pad_choose_params = { show_warning }
                    endif
                endif
            endif
        endif
        if OnXbox
            if IsTrue bootstrap_build
                add_roundbar_menu_item text = 'PLAYER LIST' id = menu_network_remove_select pad_choose_script = launch_remove_players_menu not_focusable = not_focusable
            else
                add_roundbar_menu_item text = 'PLAYER LIST' id = menu_network_player_list_select pad_choose_script = launch_player_list_menu
                if ProfileLoggedIn
                    add_roundbar_menu_item text = 'HOMIE LIST' id = menu_network_homie_list_select pad_choose_script = launch_homie_list
                    if AnyBuddyMessagesLeft
                        add_roundbar_menu_item text = 'VIEW MESSAGES' id = menu_network_homie_list_view pad_choose_script = view_buddy_messages
                    endif
                endif
            endif
        endif
    endif
    if NOT InNetGame
        if GameModeEquals is_career
            GetChapterSelectableProCount
            if (<selectable_pro_count> > 1)
                GetCurrentSkaterProfileIndex
                GetSkaterProfileInfo player = <currentSkaterProfileIndex>
                if ChecksumEquals a = <skater_family> b = family_pro
                    if skater ::IsInBail
                        pro_focus_param = not_focusable
                    else
                        pro_focus_param = {}
                    endif
                    add_roundbar_menu_item text = 'CHANGE PRO' id = menu_change_pro pad_choose_script = create_select_pro_menu <pro_focus_param>
                endif
            endif
        endif
    endif
    if NOT InNetGame
        add_roundbar_menu_item text = 'YOUR OPTIONS' id = menu_your_options pad_choose_script = create_your_options_menu
    endif
    add_roundbar_menu_item text = 'ANTEARA MENU' id = menu_anteara_options pad_choose_script = create_anteara_menu
    add_roundbar_menu_item text = 'GAME OPTIONS' id = menu_game_options pad_choose_script = create_options_menu
    if NOT cd
        if (main_menu_jump_to_cas = 1)
            add_roundbar_menu_item text = 'BACK TO CAS' id = debug_cas_menu pad_choose_script = create_pre_cas_menu pad_choose_params = { load_assets = 1 }
        endif
    endif
    if InNetGame
        add_roundbar_menu_item text = 'CHAT MESSAGE' id = menu_chat pad_choose_script = launch_chat_keyboard
        if NOT OnServer
            if NOT IsObserving
                if InInternetMode
                    if IsTrue bootstrap_build
                        if NOT GoalManager_HasActiveGoals
                            add_roundbar_menu_item text = 'OBSERVE' id = menu_network_observe_select pad_choose_script = chose_observe not_focusable = not_focusable
                        endif
                    else
                        if NOT GoalManager_HasActiveGoals
                            add_roundbar_menu_item text = 'OBSERVE' id = menu_network_observe_select pad_choose_script = chose_observe
                        endif
                    endif
                endif
            endif
        endif
        add_roundbar_menu_item text = 'QUIT' id = menu_quit pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_quit_game_dialog }
    else
        if CustomParkMode testing
            printf 'PARK EDITOR TEST PLAY MENU'
            add_roundbar_menu_item text = 'BACK TO EDITOR' id = menu_skateshop pad_choose_script = menu_confirm_quit pad_choose_params = { yes_script = exit_test_play }
        else
            if GameModeEquals is_classic
                classic_mode_menu_add_quit_option
            else
                add_roundbar_menu_item {text = 'QUIT'
                    id = menu_skateshop
                    pad_choose_script = generic_menu_pad_choose
                    pad_choose_params = { callback = menu_confirm_quit }
                    tip_text = 'Seeya!'
                }
            endif
        endif
    endif
    kill_blur start = 0
    if root_window ::getsingletag highlight_change_level
        focus_data = { grid_index = 1 }
        root_window ::removetags tags = [ highlight_change_level ]
    endif
    roundbar_menu_finish show_deck = show_deck Data = <focus_data>
endscript


script create_mp_pause_menu 
    SetButtonEventMappings unblock_menu_input
    kill_start_key_binding
    make_new_roundbar_menu {
        menu_id = Pause_Menu
        vmenu_id = pause_vmenu
        pad_back_script = handle_start_pressed
        Title = 'Paused'
        additional_create_script = pause_create_tipbox
        additional_focus_script = pause_focus_tipbox
        additional_unfocus_script = pause_unfocus_tipbox
        helper_text = <helper>
    }
    create_helper_text generic_helper_text
    add_roundbar_menu_item text = 'Continue' id = menu_continue pad_choose_script = handle_start_pressed
    add_roundbar_menu_item text = 'End Current Game' id = menu_network_end_select pad_choose_script = network_end_game_selected
    add_roundbar_menu_item text = 'Options' id = menu_mp_options pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_options_menu }
    add_roundbar_menu_item text = 'Quit' id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit }
    roundbar_menu_finish
endscript


script exit_pause_menu menu_id = current_menu_anchor
    change check_for_unplugged_controllers = 0
    if ScreenElementExists id = current_menu_anchor
        FireEvent type = unfocus target = current_menu_anchor
    endif
    ClearViewerObject
    Debounce x time = 0.3000
    Debounce triangle time = 0.3000
    pause_menu_gradient Off
    change inside_pause = 0
    change no_focus_sound = 1
    if NOT cd
        change viewer_buttons_enabled = 1
    endif
    show_all_hud_items
    if InNetGame
        if NOT IsObserving
            if ObjectExists id = skater
                skater ::netenableplayerinput
            endif
        endif
    endif
    UnPauseGame
    possibly_add_temp_special_trick
    PauseStream 0
    if (music_was_paused = 0)
        PauseMusic 0
    endif
    if root_window ::getsingletag need_music_zone_refresh
        root_window ::removetags tags = [ need_music_zone_refresh ]
        SpawnScript SFX_refresh_music_box_triggers params = { wait }
    endif
    unpause_rain
    GoalManager_UnPauseAllGoals
    if ObjectExists id = <menu_id>
        DestroyScreenElement id = <menu_id>
    endif
    SetScreenElementProps id = root_window tags = { menu_state = Off }
    if CustomParkMode editing
        if NOT GotParam DoNotSwitchEditorState
            SetParkEditorState state = edit
            SetParkEditorPauseMode UnPause
            SwitchToParkEditorCamera
        endif
    endif
    if NOT GotParam dont_restore_start_key_binding
        restore_start_key_binding
    endif
    menu3d_hide
    if NOT InNetGame
        if NOT GameModeEquals is_horse
            UnpauseSkaters
        endif
    endif
    change check_for_unplugged_controllers = 1
    KillSpawnedScript name = do_localized_pause_title
    if NOT InNetGame
        if ObjectExists id = PlayerVehicleCamera
            if NOT ((((case_anteara_veh = 4)|| (case_anteara_veh = 7)|| (case_anteara_veh = 8)|| (case_anteara_veh = 13))))
                skater ::hide
            endif
            SetActiveCamera id = PlayerVehicleCamera
        endif
    endif
endscript


script Veh_Camera_fix 
    PlayerVehicleCamera ::VehicleCamera_Reset
    SetActiveCamera id = PlayerVehicleCamera
endscript


script pause_launch_level 
    skater ::StatsManager_Reset
    if ((<level> = load_boardshop)|| (<level> = load_cas))
        temp = <level>
        GetCurrentLevel
        array = return_to_level
        SetArrayElement arrayName = array index = 0 newValue = <level>
        level = <temp>
    endif
    if GameModeEquals is_career
        GoalManager_DeactivateAllGoals
        skater ::ResetSkaterToCustom
    endif
    change_level <...> 
endscript


script proj_menu_update_amount 
    skater ::GetAmmo
    skater ::SetAmmo <value>
endscript


script proj_menu_remove_amount 
    skater ::GetAmmo
    skater ::SetAmmo 0
endscript


script Remove_my_board 
    wait 1 gameframe
    skater ::SwitchOffBoard
    wait 1 gameframe
    skater ::SetBoardMissing
endscript


script fall_underground 
    exit_pause_menu
    skater ::move y = -99.0
endscript


script fall_underground1 
    exit_pause_menu
    skater ::move y = -29.0
endscript


script fall_sideways 
    exit_pause_menu
    skater ::move x = 99.0
endscript


script fall_up 
    exit_pause_menu
    skater ::move y = 99.0
endscript


script fall_up1 
    exit_pause_menu
    skater ::move y = 999.0
endscript


script noclipon 
    MakeSkaterFly
    skater ::PausePhysics
    exit_pause_menu
endscript


script MakeSkaterFly 
    MakeSkaterGoto FlyAi
endscript


script FlyAi move = 8
    ClearExceptions
    SetQueueTricks NoTricks
    setspeed 0
    setstate Air
    setrollingfriction 1000
    norailtricks
    begin 
    if Held r2
        move y = -6
    endif
    if Held l1
        move y = 6
    endif
    if Held l2
        if Held square
            move x = 18
        endif
        if Held Circle
            move x = -18
        endif
        if Held triangle
            move z = 18
        endif
        if Held x
            move z = -18
        endif
    else
        if Held square
            move x = 6
        endif
        if Held Circle
            move x = -6
        endif
        if Held triangle
            move z = 8
        endif
        if Held x
            move z = -8
        endif
    endif
    WaitOneGameFrame
    repeat 
    allowrailtricks
    MakeSkaterGoto ongroundai
endscript

obs_is_on = 0

script anteara_observe_obs 
    if ObjectExists id = PlayerVehicle
        MakeSkaterGoto Switch_OnGroundAI params = { NewScript = Walking_onGroundAi }
        anteara_board
        skater ::UnPausePhysics
        skater ::AddSkaterToWorld
    endif
    switch obs_is_on
        case 0
        skater ::remove_skater_from_world
        EnterSurveyorMode
        skater ::remove_skater_from_world
        fake_button type = pad_x
        change obs_is_on = 1
        case 1
        ExitSurveyorMode
        skater ::add_skater_to_world
        change obs_is_on = 0
    endswitch
endscript


script set_custom_restart1 
    if ObjectExists id = PlayerVehicle
        NullScript
    else
        skater ::SetCustomRestart set
    endif
endscript


script skip_to_custom_restart1 
    if ObjectExists id = PlayerVehicle
        NullScript
    else
        skater ::SkipToCustomRestart
    endif
endscript


script kirillgta_clean 
    exit_pause_menu
    SendChatMessage string = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
endscript


script test_widescreen 
    SetPreferencesFromUI prefs = network field = 'Anteara_Resolution' checksum = widescreen
    change_screen_mode wide callback = screen_setup_widescreen set_screen_flags
    create_anteara_menu
endscript


script test_standard 
    SetPreferencesFromUI prefs = network field = 'Anteara_Resolution' checksum = standard
    change_screen_mode standard callback = screen_setup_standard set_screen_flags
    create_anteara_menu
endscript

case_hair = 1

script toggle_TakeAwayHair 
    printf 'un/Hide Hair'
    switch case_hair
        case 0
        change case_hair = 1
        SetScreenElementProps id = { menu_TakeAwayHair child = 0 }text = 'Hair: Visible'
        skater ::TurnOnHair
        case 1
        change case_hair = 0
        SetScreenElementProps id = { menu_TakeAwayHair child = 0 }text = 'Hair: Invisible'
        skater ::TakeAwayHair
    endswitch
endscript

case_head = 1

script toggle_TakeAwayHead 
    printf 'un/Hide Head'
    switch case_head
        case 0
        change case_head = 1
        SetScreenElementProps id = { menu_TakeAwayHead child = 0 }text = 'Head: Visible'
        skater ::TurnOnHead
        case 1
        change case_head = 0
        SetScreenElementProps id = { menu_TakeAwayHead child = 0 }text = 'Head: Invisible'
        skater ::TakeAwayHead
    endswitch
endscript

case_torso = 1

script toggle_TakeAwayTorso 
    printf 'un/Hide Torso'
    switch case_torso
        case 0
        change case_torso = 1
        SetScreenElementProps id = { menu_TakeAwayTorso child = 0 }text = 'Torso: Visible'
        skater ::TurnOnTorso
        case 1
        change case_torso = 0
        SetScreenElementProps id = { menu_TakeAwayTorso child = 0 }text = 'Torso: Invisible'
        skater ::TakeAwayTorso
    endswitch
endscript

case_legs = 1

script toggle_TakeAwayLegs 
    printf 'un/Hide Legs'
    switch case_legs
        case 0
        change case_legs = 1
        SetScreenElementProps id = { menu_TakeAwayLegs child = 0 }text = 'Legs: Visible'
        skater ::TurnOnLegs
        case 1
        change case_legs = 0
        SetScreenElementProps id = { menu_TakeAwayLegs child = 0 }text = 'Legs: Invisible'
        skater ::TakeAwayLegs
    endswitch
endscript

case_hands = 1

script toggle_TakeAwayHands 
    printf 'un/Hide Hands'
    switch case_hands
        case 0
        change case_hands = 1
        SetScreenElementProps id = { menu_TakeAwayHand child = 0 }text = 'Hands: Visible'
        skater ::TurnOnHands
        case 1
        change case_hands = 0
        SetScreenElementProps id = { menu_TakeAwayHand child = 0 }text = 'Hands: Invisible'
        skater ::TakeAwayHands
    endswitch
endscript

case_shoes = 1

script toggle_TakeAwayShoes 
    printf 'un/Hide Shoes'
    switch case_shoes
        case 0
        change case_shoes = 1
        SetScreenElementProps id = { menu_TakeAwayShoes child = 0 }text = 'Shoes: Visible'
        skater ::TurnOnShoes
        case 1
        change case_shoes = 0
        SetScreenElementProps id = { menu_TakeAwayShoes child = 0 }text = 'Shoes: Invisible'
        skater ::TakeAwayShoes
    endswitch
endscript


script TakeAwayHair 
    switchoffatomic skater_m_hair
    switchoffatomic skater_f_hair
    switchoffatomic skater_f_hat_hair
endscript


script TakeAwayHead 
    switchoffatomic skater_m_head
    switchoffatomic skater_f_head
endscript


script TakeAwayTorso 
    switchoffatomic skater_m_torso
    switchoffatomic skater_f_torso
endscript


script TakeAwayLegs 
    switchoffatomic skater_m_legs
    switchoffatomic skater_f_legs
endscript


script TakeAwayHands 
    switchoffatomic skater_m_hands
    switchoffatomic skater_f_hands
endscript


script TakeAwayShoes 
    switchoffatomic shoes
endscript


script TurnOnHair 
    switchonatomic skater_m_hair
    switchonatomic skater_f_hair
    switchonatomic skater_f_hat_hair
endscript


script TurnOnHead 
    switchonatomic skater_m_head
    switchonatomic skater_f_head
endscript


script TurnOnTorso 
    switchonatomic skater_m_torso
    switchonatomic skater_f_torso
endscript


script TurnOnLegs 
    switchonatomic skater_m_legs
    switchonatomic skater_f_legs
endscript


script TurnOnShoes 
    switchonatomic shoes
endscript


script TurnOnHands 
    switchonatomic skater_m_hands
    switchonatomic skater_f_hands
endscript


script anteara_bounds 
    change TODManager_SetActive 1
    change tod_manager_active = 1
    change TOD_off = 0
endscript

case_RunOutTimer = 1

script toggle_SwitchOffTimer 
    printf 'On/Off Timer'
    switch case_RunOutTimer
        case 0
        change case_RunOutTimer = 1
        SetScreenElementProps id = { menu_SwitchOffRunOutTimer child = 0 }text = 'Infinite Run Out Timer: Off'
        anteara_timeroff
        case 1
        change case_RunOutTimer = 0
        SetScreenElementProps id = { menu_SwitchOffRunOutTimer child = 0 }text = 'Infinite Run Out Timer: On'
        anteara_timeron
    endswitch
endscript

case_WallJump = 1

script toggle_SwitchOffWallJump 
    printf 'On/Off Walljump'
    switch case_WallJump
        case 0
        change case_WallJump = 1
        SetScreenElementProps id = { menu_SwitchOffWallJump child = 0 }text = 'Infinite Wall Jumps: Off'
        walljumpoff
        case 1
        change case_WallJump = 0
        SetScreenElementProps id = { menu_SwitchOffWallJump child = 0 }text = 'Infinite Wall Jumps: On'
        walljumpon
    endswitch
endscript

case_WallSkate = 1

script toggle_SwitchOffWallSkate 
    printf 'On/Off Wallskate'
    switch case_WallSkate
        case 0
        change case_WallSkate = 1
        SetScreenElementProps id = { menu_SwitchOffWallSkate child = 0 }text = 'Skate on Walls: Off'
        wallskateoff
        case 1
        change case_WallSkate = 0
        SetScreenElementProps id = { menu_SwitchOffWallSkate child = 0 }text = 'Skate on Walls: On'
        skater ::wallskateon
    endswitch
endscript

case_NoClip = 1

script toggle_SwitchOffNoClip 
    printf 'on/Off NoClip'
    switch case_NoClip
        case 0
        change case_NoClip = 1
        SetScreenElementProps id = { menu_SwitchOffNoClip child = 0 }text = 'No Clip: Off'
        MakeSkaterGoto Switch_OnGroundAI params = { NewScript = Walking_onGroundAi }
        skater ::UnPausePhysics
        case 1
        change case_NoClip = 0
        SetScreenElementProps id = { menu_SwitchOffNoClip child = 0 }text = 'No Clip: On'
        MakeSkaterGoto Switch_OnGroundAI params = { NewScript = ongroundai }
        skater ::PausePhysics
        MakeSkaterFly
        skater ::PausePhysics
    endswitch
endscript

case_NO_BOUNDS = 1

script toggle_SwitchNoBounds 
    switch case_NO_BOUNDS
        case 0
        change case_NO_BOUNDS = 1
        SetScreenElementProps id = { menu_SwitchNoBounds child = 0 }text = 'No Out Of Bounds: Off'
        UnsetGlobalFlag flag = FREEMAN_BOUND
        case 1
        change case_NO_BOUNDS = 0
        SetScreenElementProps id = { menu_SwitchNoBounds child = 0 }text = 'No Out Of Bounds: On'
        SetGlobalFlag flag = FREEMAN_BOUND
    endswitch
endscript

case_Observe = 1

script toggle_SwitchOffObserve 
    printf 'On/Off Observe'
    switch case_Observe
        case 0
        change case_Observe = 1
        SetScreenElementProps id = { menu_SwitchOffObserve child = 0 }text = 'Observing: Off'
        skater ::add_skater_to_world
        ExitSurveyorMode
        change obs_is_on = 0
        case 1
        change case_Observe = 0
        SetScreenElementProps id = { menu_SwitchOffObserve child = 0 }text = 'Observing: On'
        skater ::remove_skater_from_world
        EnterSurveyorMode
        change obs_is_on = 1
    endswitch
endscript

case_Airshuffle = 1

script toggle_SwitchOffAirshuffle 
    switch case_Airshuffle
        case 0
        change case_Airshuffle = 1
        SetScreenElementProps id = { menu_SwitchOffAirshuffle child = 0 }text = 'Airshuffle (DownLeft + Flip): Off'
        UnsetGlobalFlag flag = ANTEARA_AIRSHUFFLE
        case 1
        change case_Airshuffle = 0
        SetScreenElementProps id = { menu_SwitchOffAirshuffle child = 0 }text = 'Airshuffle (DownLeft + Flip): On'
        SetGlobalFlag flag = ANTEARA_AIRSHUFFLE
    endswitch
endscript


script anteara_noclipoff 
    skater ::UnPausePhysics
endscript


script walljumpon 
    change Physics_Disallow_Rewallplant_Duration = 0
endscript


script walljumpoff 
    change Physics_Disallow_Rewallplant_Duration = 850
endscript


script wallskateon 
    change Wall_Non_Skatable_Angle = 0
endscript


script wallskateoff 
    change Wall_Non_Skatable_Angle = 25
endscript


script anteara_timeron 
    change Physics_RunTimer_Duration = {(50000.0, 20000.0) STATS_RUN Switch = no_switch}
endscript


script anteara_timeroff 
    change Physics_RunTimer_Duration = {(2.0, 3.0) STATS_RUN Switch = no_switch}
endscript


script wallshuffleon 
    change Wall_Ride_Delay = 0.0
endscript


script wallshuffleoff 
    change Wall_Ride_Delay = 0.6660
endscript

case_anteara_text_colour = 5

script toggle_SwitchTextColour 
    printf 'Text Colour'
    switch case_anteara_text_colour
        case 5
        change case_anteara_text_colour = 6
        SetScreenElementProps id = { menu_SwitchTextColour child = 0 }text = 'Text Colour: Orange'
        SetPreferencesFromUI prefs = network field = 'TextColor' checksum = color_cb
        case 6
        change case_anteara_text_colour = 7
        SetScreenElementProps id = { menu_SwitchTextColour child = 0 }text = 'Text Colour: Green'
        SetPreferencesFromUI prefs = network field = 'TextColor' checksum = color_c4
        case 7
        change case_anteara_text_colour = 8
        SetScreenElementProps id = { menu_SwitchTextColour child = 0 }text = 'Text Colour: Pink'
        SetPreferencesFromUI prefs = network field = 'TextColor' checksum = color_cL
        case 8
        change case_anteara_text_colour = 5
        SetScreenElementProps id = { menu_SwitchTextColour child = 0 }text = 'Text Colour: White'
        SetPreferencesFromUI prefs = network field = 'TextColor' checksum = color_c0
    endswitch
endscript

case_give_ammo = 5

script toggle_SwitchAmmoNum 
    printf 'On/Off Ammo'
    switch case_give_ammo
        case 5
        change case_give_ammo = 6
        SetScreenElementProps id = { menu_SwitchAmmoNum child = 0 }text = 'Ammo: 500'
        skater ::GetAmmo
        skater ::SetAmmo 500
        case 6
        change case_give_ammo = 7
        SetScreenElementProps id = { menu_SwitchAmmoNum child = 0 }text = 'Ammo: 1000'
        skater ::GetAmmo
        skater ::SetAmmo 1000
        case 7
        change case_give_ammo = 5
        SetScreenElementProps id = { menu_SwitchAmmoNum child = 0 }text = 'Ammo: 0'
        skater ::GetAmmo
        skater ::SetAmmo 0
    endswitch
endscript

case_Color = 10

script toggle_SwitchColor 
    printf 'On/Off Color'
    switch case_Color
        case 5
        change case_Color = 6
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: Green'
        change DE_BALANCE_METER_COLOR = [ 0 255 18 100 ]
        case 6
        change case_Color = 7
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: Red'
        change DE_BALANCE_METER_COLOR = [ 255 0 0 100 ]
        case 7
        change case_Color = 8
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: Light Blue'
        change DE_BALANCE_METER_COLOR = [ 0 252 255 100 ]
        case 8
        change case_Color = 9
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: Yellow'
        change DE_BALANCE_METER_COLOR = [ 125 107 34 128 ]
        case 9
        change case_Color = 10
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: Default Blue'
        change DE_BALANCE_METER_COLOR = [ 15 82 117 128 ]
        case 10
        change case_Color = 11
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: White'
        change DE_BALANCE_METER_COLOR = [ 255 255 255 100 ]
        case 11
        change case_Color = 5
        SetScreenElementProps id = { menu_SwitchColor child = 0 }text = 'Balance Bar Colour: Pink'
        change DE_BALANCE_METER_COLOR = [ 225 18 213 100 ]
    endswitch
endscript

case_ColorTwo = 9

script toggle_SwitchColorTwo 
    printf 'On/Off ColorTwo'
    switch case_ColorTwo
        case 5
        change case_ColorTwo = 6
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: Green'
        change DE_BALANCE_ARROW_COLOR = [ 0 255 18 100 ]
        case 6
        change case_ColorTwo = 7
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: Red'
        change DE_BALANCE_ARROW_COLOR = [ 255 0 0 100 ]
        case 7
        change case_ColorTwo = 8
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: Light Blue'
        change DE_BALANCE_ARROW_COLOR = [ 0 252 255 100 ]
        case 8
        change case_ColorTwo = 9
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: Yellow'
        change DE_BALANCE_ARROW_COLOR = [ 125 107 34 128 ]
        case 9
        change case_ColorTwo = 10
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: Default Blue'
        change DE_BALANCE_ARROW_COLOR = [ 15 82 117 128 ]
        case 10
        change case_ColorTwo = 11
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: White'
        change DE_BALANCE_ARROW_COLOR = [ 255 255 255 100 ]
        case 11
        change case_ColorTwo = 5
        SetScreenElementProps id = { menu_SwitchColorTwo child = 0 }text = 'Balance Arrow Colour: Pink'
        change DE_BALANCE_ARROW_COLOR = [ 225 18 213 100 ]
    endswitch
endscript

case_Ammo = 5

script toggle_SwitchAmmo 
    printf 'Select Ammo type'
    switch case_Ammo
        case 5
        change case_Ammo = 6
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Apple'
        skater ::SetAmmoType apple
        case 6
        change case_Ammo = 7
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Shrimp'
        skater ::SetAmmoType shrimp
        case 7
        change case_Ammo = 8
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Smokebomb'
        skater ::SetAmmoType smokebomb
        case 8
        change case_Ammo = 9
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Paintcan'
        skater ::SetAmmoType paintcan
        case 9
        change case_Ammo = 10
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Skateboard'
        skater ::SetAmmoType skateboard
        case 10
        change case_Ammo = 11
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Crystal Ball'
        skater ::SetAmmoType Crystal_Ball
        case 11
        change case_Ammo = 5
        SetScreenElementProps id = { menu_SwitchAmmo child = 0 }text = 'Ammo Type: Tomato'
        skater ::SetAmmoType tomato
    endswitch
endscript

