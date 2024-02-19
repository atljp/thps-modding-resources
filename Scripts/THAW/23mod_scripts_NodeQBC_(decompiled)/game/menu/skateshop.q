skater_select_light0_heading = 60
skater_select_light1_heading = -190
skater_rot_angle = 0
main_menu_return_to_createamodes = 0

script wait_and_pause_skater \{ time = 10 }
    begin 
    if ObjectExists \{ id = skater }
        wait <time> gameframes
        if NOT GotParam \{ dont_pause_music }
            PauseMusic \{ 1 }
        endif
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script SkateshopAI stopskateshopstreams = 1
    SkaterInit NoEndRun ReturnControl NoAnims
    TurnOffSpecialItem
    PausePhysics
    ClearExceptions
    SetQueueTricks NoTricks
    disableplayerinput
    setrollingfriction 10000
    GetCurrentSkaterProfileIndex
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> name
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> is_male
    skater ::unhide
    skater ::obj_movetonode name = z_mainmenu_trg_select_restart01 NoReset orient
    if GotParam BlendOk
    else
        BlendperiodOut 0
    endif
    if GotParam CAS_Screen
        if (<is_male> = 1)
            <name> = editskater_male
            TurnOffSpecialItem
        else
            switch <name>
                case steamer
                printf 'THIS IS ELISSA'
                <name> = editskater_male
                default 
                <name> = editskater_female
                printf 'THIS IS A CHICK'
            endswitch
        endif
    else
    endif
    if GotParam credits
        <name> = neversoft
    endif
    if ((<name> = custom_story)|| (<name> = custom_classic))
        if (<is_male> = 0)
            <name> = editskater_female
        endif
    endif
    printf '------------- THIS SKATER IS: %n' n = <name>
    <stream_freq> = randomrange (0.0, 7.0)
    getsingletag stopskateshopstreams
    if (<stopskateshopstreams> = 0)
        if (<stream_freq> = 1)
            StopStream
            PlaySkaterStream type = 'SSIntro'
        endif
    endif
    if NOT InFrontend
        Skater_Playanim anim = Ped_M_Idle1
    else
        if ObjectExists id = ss_play_level
            Skater_WaitAnimFinished
            Skater_Playanim anim = Ped_M_Idle1
        else
            getrandomvalue name = behavior_num a = 1 b = 5 integer
            switch <behavior_num>
                case 1
                SkateshopBehavior1
                case 2
                SkateshopBehavior2
                case 3
                SkateshopBehavior3
                case 4
                SkateshopBehavior4
                case 5
                SkateshopBehavior5
            endswitch
        endif
    endif
endscript

script SkateshopBehavior1 
    begin 
    Random (
        @*2 
        Skater_Playanim \{ anim = Pro_Idle04a }
        Skater_WaitAnimFinished
        Skater_Playanim \{ anim = Pro_Idle04a }
        Skater_WaitAnimFinished
        Skater_Playanim \{ anim = Pro_Idle04a }
        @ Skater_Playanim \{ anim = Pro_Idle04a }
        Skater_WaitAnimFinished
        Skater_Playanim \{ anim = Pro_Idle04b }
        Skater_WaitAnimFinished
        Skater_Playanim \{ anim = Pro_Idle04a }
    )
    Skater_WaitAnimFinished
    repeat 
endscript

script SkateshopBehavior2 
    begin 
    Random (
        @ ) Skater_Playanim \{ anim = Pro_Idle02 }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Pro_Idle02 }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Pro_Idle02 }
    
    Skater_WaitAnimFinished
    repeat 
endscript

script SkateshopBehavior3 
    begin 
    Random (
        @ ) Skater_Playanim \{ anim = Pro_Idle01 }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Pro_Idle01 }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Pro_Idle01 }
    
    Skater_WaitAnimFinished
    repeat 
endscript

script SkateshopBehavior4 
    begin 
    Random (
        @*3 
        Skater_Playanim anim = Pro_Idle05c
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle05c
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle05c
        @ Skater_Playanim anim = Pro_Idle05d
        Skater_WaitAnimFinished
        begin 
        Random (
            @ ) Skater_Playanim anim = Pro_Idle05a
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle05a
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle05a
        
        Skater_WaitAnimFinished
        repeat 2
        Skater_Playanim anim = Pro_Idle05b
        Skater_WaitAnimFinished
    )
    Skater_WaitAnimFinished
    repeat 
endscript

script SkateshopBehavior5 
    begin 
    Random (
        @*3 
        Skater_Playanim anim = Pro_Idle03a
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle03a
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle03a
        @ Skater_Playanim anim = Pro_Idle03a
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle03b
        Skater_WaitAnimFinished
        Skater_Playanim anim = Pro_Idle03a
        @ Skater_Playanim anim = Pro_Idle03to06
        Skater_WaitAnimFinished
        begin 
        Random (
            @ Skater_Playanim anim = Pro_Idle06a
            Skater_WaitAnimFinished
            Skater_Playanim anim = Pro_Idle06a
            Skater_WaitAnimFinished
            Skater_Playanim anim = Pro_Idle06a
            @ Skater_Playanim anim = Pro_Idle06a
            Skater_WaitAnimFinished
            Skater_Playanim anim = Pro_Idle06b
            Skater_WaitAnimFinished
            Skater_Playanim anim = Pro_Idle06a
        )
        Skater_WaitAnimFinished
        repeat 2
        Skater_Playanim anim = Pro_Idle06to03
        Skater_WaitAnimFinished
    )
    Skater_WaitAnimFinished
    repeat 
endscript

script make_new_skateshop_menu 
    SetScreenElementProps \{id = root_window replace_handlers event_handlers = [{ pad_start main_menu_start_pressed }]}
    make_new_menu <...> 
endscript

script main_menu_start_pressed 
endscript

script skateshop_transition \{ menu_anim = animate_out }
    RunScriptOnScreenElement id = current_menu_anchor <menu_anim> callback = skateshop_transition2 callback_params = <...> 
endscript

script skateshop_transition2 
    if GotParam \{ cam_anim }
        printf \{ 'got a cam_anim' }
        PlaySkaterCamAnim skater = 0 name = <cam_anim>
    endif
    if GotParam \{ came_from_main_menu }
        <new_menu_script> came_from_main_menu
    else
        <new_menu_script>
    endif
endscript

script main_menu_add_item {parent = current_menu
        font = small
        highlight_bar_scale = (2.0, 0.699999988079071)
        highlight_bar_pos = (97.0, -7.0)
        text_just = [ center center ]
        focus_script = main_menu_focus
        unfocus_script = main_menu_unfocus
        text_pos = (95.0, -5.0)
        dims = (200.0, 20.0)
        pad_choose_script = NullScript
    }
    if GotParam not_focusable
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            event_handlers = [{focus <focus_script> params = <focus_params>}
                {unfocus <unfocus_script> params = <unfocus_params>}
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            replace_handlers
            not_focusable
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            event_handlers = [{focus <focus_script> params = <focus_params>}
                {unfocus <unfocus_script> params = <unfocus_params>}
            ]
            replace_handlers
        }
    endif
    <anchor_id> = <id>
    if NOT GotParam no_sound
        SetScreenElementProps id = <anchor_id> event_handlers = [{ pad_choose generic_menu_pad_choose_sound }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            { pad_start generic_menu_pad_choose_sound }
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
    else
        SetScreenElementProps id = <anchor_id> event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
    endif
    if GotParam mark_first_input
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{ pad_choose mark_first_input_received }
                { pad_choose generic_menu_pad_choose_sound }
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                { pad_start mark_first_input_received }
                { pad_start generic_menu_pad_choose_sound }
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            replace_handlers
        }
    endif
    if GotParam not_focusable
        text_rgba = [ 60 60 60 75 ]
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            font = <font>
            text = <text>
            Scale = <Scale>
            Pos = <text_pos>
            just = <text_just>
            rgba = <text_rgba>
            not_focusable
        }
    else
        Theme_GetUnhighlightedTextColor return_value = text_rgba
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            id = <text_id>
            font = <font>
            text = <text>
            Scale = <Scale>
            Pos = <text_pos>
            just = <text_just>
            rgba = <text_rgba>
        }
    endif
    if GotParam max_width
        truncate_string id = <id> max_width = <max_width>
    endif
    Theme_GetHighlightBarColor return_value = bar_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Pos = <highlight_bar_pos>
        Scale = <highlight_bar_scale>
        just = [ center center ]
        rgba = <bar_rgba>
        alpha = 0
        z_priority = 3
    }
endscript

script main_menu_item_focus 
    gettags
    if GotParam \{ attract_timer }
    endif
    theme_item_focus <...> 
endscript

script main_menu_focus \{rgba = [ 0 0 0 128 ]}
    gettags
    DoScreenElementMorph id = {<id> child = 0}rgba = <rgba>
    if ObjectExists \{ id = park_menu_up_arrow }
        generic_menu_update_arrows \{ up_arrow_id = park_menu_up_arrow down_arrow_id = park_menu_down_arrow }
    endif
    if GotParam \{ attract_timer }
    endif
    DoScreenElementMorph {
        id = {<id> child = 1}
        alpha = 1
    }
endscript

script main_menu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor \{ return_value = text_rgba }
    DoScreenElementMorph id = {<id> child = 0}rgba = <text_rgba>
    DoScreenElementMorph {
        id = {<id> child = 1}
        alpha = 0
    }
endscript

script play_no_skater_cam 
    KillSkaterCamAnim \{ all }
    SetActiveCamera \{ id = skatercam0 }
    PlayIGCCam \{skater = 0 LockTo = world Pos = (42.599998474121094, 12.100000381469727, -983.7999877929688) Quat = (0.00013800000306218863, 0.999862015247345, 0.011831999756395817) FOV = 72.0 Play_hold frames = 1}
endscript

script make_mainmenu_3d_plane \{id = bg_plane parent = current_menu_anchor z_priority = -500 Model = 'UI_bg\UI_bg.mdl' Scale = (2.0999999046325684, 2.200000047683716, 2.0999999046325684) Pos = (320.0, 225.0)}
    printf \{ 'make_mainmenu_3d_plane is deprecated' }
endscript
current_attract_movie = 0
movies_disabled = 0

script attract_mode_timer 
    <anim_wait_time> = 10
    <attract_wait_time> = 20
    begin 
    wait <anim_wait_time> seconds
    if NOT (spin_menu_skater_idling)
        change spin_menu_skater_idling = 1
        change spin_menu_skater_transitioning = 1
    endif
    wait <attract_wait_time> seconds
    if NOT IsTrue paused_for_hardware
        movie_file = (attract_mode_movies [ current_attract_movie ])
        GetArraySize attract_mode_movies
        if NOT (<array_size> > (current_attract_movie + 1))
            change current_attract_movie = 0
        else
            change current_attract_movie = (current_attract_movie + 1)
        endif
        if ((IsXbox)|| (isPC))
            if NOT (movies_disabled)
                StopSecondControllerCheck
                spawnscriptnow noqbid ingame_play_movie params = { <movie_file> }
            endif
        else
            if cd
                StopSecondControllerCheck
                spawnscriptnow noqbid ingame_play_movie params = { <movie_file> }
            endif
        endif
    endif
    repeat 
endscript

script reset_attract_mode_timer 
    KillSpawnedScript \{ name = attract_mode_timer }
    SpawnScriptLater \{ attract_mode_timer }
endscript
in_options_menu = 0

script check_cheat_from_keyboard 
    GetTextElementString \{ id = keyboard_current_string }
    if NOT GotParam \{ cancel }
        TryCheatString string = <string>
    endif
    destroy_onscreen_keyboard
    create_setup_options_menu
endscript

script story_options_change_level 
    dialog_box_exit
    restore_start_key_binding
    if NOT GotParam \{ continue_story }
        SetGlobalFlag \{ flag = CAREER_STARTED }
        SetGlobalFlag \{ flag = CAREER_ONETIMEINTRO }
        CareerFunc \{func = SetLastLevelPlayed params = { last_level = Load_Z_HO }}
    endif
    StopKeyboardHandler
    Zone_LoadLastPlayed
endscript

script launch_ss_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_ss_menu <...> 
endscript

script ss_initialization 
    skater ::add_skater_to_world
    UnpauseSkaters
    MakeSkaterGoto \{SkateshopAI params = { BlendOk }}
    change \{ cas_cam_angle = 154 }
endscript

script create_ss_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    main_menu_camera_control next_state = pss
    if GotParam change_gamemode
        <change_gamemode>
    endif
    GetCurrentSkaterProfileIndex
    GetGameMode
    switch <gamemode>
        case career
        <menu_title> = 'STORY MODE'
        case freeskate
        if InSplitScreenGame
            if (<currentSkaterProfileIndex> = 1)
                <menu_title> = 'PLAYER TWO'
            else
                <menu_title> = 'PLAYER ONE'
            endif
        else
            <menu_title> = 'FREE SKATE'
        endif
        case net
        if IsXbox
            <menu_title> = 'THAW XBOX LIVE'
        else
            <menu_title> = 'THAW ONLINE'
        endif
        case singlesession
        <menu_title> = 'SINGLE SESSION'
        case classic
        <menu_title> = 'CLASSIC MODE'
        default 
        <menu_title> = 'SKATESHOP'
    endswitch
    if GameModeEquals is_net
        if IsXbox
            <menu_title> = 'THAW XBOX LIVE'
        else
            <menu_title> = 'THAW ONLINE'
        endif
    endif
    if GameModeEquals is_cat
        <menu_title> = 'CREATE TRICKS'
    endif
    make_label_menu {
        menu_id = select_skater_ready_anchor
        Title = <menu_title>
        title_pos = (30.0, 40.0) Pos = (130.0, 120.0)
        spacing = 20
        pad_back_script = generic_menu_pad_back
        pad_back_params = {callback = ss_menu_exit new_menu_script = launch_select_skater_menu reset_skater = 0}
    }
    create_helper_text = generic_helper_text
    kill_start_key_binding
    GetCurrentSkaterProfileIndex
    if InSplitScreenGame
        if (<currentSkaterProfileIndex> = 1)
            add_label_menu_item {
                text = 'READY'
                rot = -2
                Length = 100
                text_offset = (0.0, 0.0)
                label_offset = (20.0, 0.0)
                pad_choose_script = ss_menu_exit
                pad_choose_params = { new_menu_script = launch_level_select_menu player_two }
                focus_params = { attract_timer }
                mark_first_input
                id = ss_play_level
            }
        else
            add_label_menu_item {
                text = 'READY'
                rot = -2
                Length = 100
                text_offset = (0.0, 0.0)
                label_offset = (20.0, 0.0)
                pad_choose_script = ss_menu_exit
                pad_choose_params = { new_menu_script = player_1_ready }
                focus_params = { attract_timer }
                mark_first_input
                id = ss_play_level
            }
        endif
    else
        if GameModeEquals is_net
            if IsXbox
                add_label_menu_item {
                    text = 'READY'
                    rot = -2
                    Length = 150
                    text_offset = (0.0, 0.0)
                    label_offset = (20.0, 0.0)
                    pad_choose_script = ss_menu_exit
                    pad_choose_params = { new_menu_script = launch_xbox_live play_cam }
                    focus_params = { attract_timer }
                    mark_first_input
                    id = ss_play_level
                }
            else
                if IsXenon
                    add_label_menu_item {
                        text = 'READY'
                        rot = -2
                        Length = 150
                        text_offset = (0.0, 0.0)
                        label_offset = (20.0, 0.0)
                        pad_choose_script = ss_menu_exit
                        pad_choose_params = { new_menu_script = launch_xbox_live play_cam }
                        focus_params = { attract_timer }
                        mark_first_input
                        id = ss_play_level
                    }
                else
                    if isPC
                        add_label_menu_item {
                            text = 'READY'
                            rot = -2
                            Length = 150
                            text_offset = (0.0, 0.0)
                            label_offset = (20.0, 0.0)
                            pad_choose_script = ss_menu_exit
                            pad_choose_params = { new_menu_script = authenticate_client }
                            focus_params = { attract_timer }
                            mark_first_input
                            id = ss_play_level
                        }
                    else
                        if (network_connection_type = internet)
                            add_label_menu_item {
                                text = 'READY'
                                rot = -2
                                Length = 150
                                text_offset = (0.0, 0.0)
                                label_offset = (20.0, 0.0)
                                pad_choose_script = ss_menu_exit
                                pad_choose_params = { new_menu_script = select_internet_play }
                                focus_params = { attract_timer }
                                mark_first_input
                                id = ss_play_level
                            }
                        else
                            add_label_menu_item {
                                text = 'READY'
                                rot = -2
                                Length = 150
                                text_offset = (0.0, 0.0)
                                label_offset = (20.0, 0.0)
                                pad_choose_script = ss_menu_exit
                                pad_choose_params = { new_menu_script = select_lan_play }
                                focus_params = { attract_timer }
                                mark_first_input
                                id = ss_play_level
                            }
                        endif
                    endif
                endif
            endif
        else
            RemoveParameter callback
            add_label_menu_item {
                text = 'PLAY LEVEL'
                rot = 0
                Length = 200
                text_offset = (0.0, 0.0)
                label_offset = (20.0, 0.0)
                pad_choose_script = ss_menu_exit
                pad_choose_params = { new_menu_script = launch_level_select_menu <...>  }
                focus_params = { attract_timer }
                mark_first_input
                id = ss_play_level
            }
        endif
    endif
    if InSplitScreenGame
        add_label_menu_item {
            text = 'VIEW TRICKS'
            rot = -4
            Length = 200
            text_offset = (0.0, 0.0)
            label_offset = (20.0, 0.0)
            pad_choose_script = ss_menu_exit
            pad_choose_params = { new_menu_script = create_edit_tricks_menu from_ss_menu }
            focus_params = { attract_timer }
            mark_first_input
        }
    else
        add_label_menu_item {
            text = 'EDIT TRICKS'
            rot = -4
            Length = 200
            text_offset = (0.0, 0.0)
            label_offset = (20.0, 0.0)
            pad_choose_script = ss_menu_exit
            pad_choose_params = { new_menu_script = create_edit_tricks_menu from_ss_menu }
            focus_params = { attract_timer }
            mark_first_input
        }
    endif
    if NOT GameModeEquals is_classic
        if InSplitScreenGame
            if (<currentSkaterProfileIndex> = 0)
                add_label_menu_item {
                    text = 'DIFFICULTY'
                    rot = -4
                    Length = 200
                    text_offset = (0.0, 0.0)
                    label_offset = (20.0, 0.0)
                    pad_choose_script = ss_menu_exit
                    pad_choose_params = {new_menu_script = create_gamemode_difficulty_menu from_ss_menu = 1}
                    focus_params = { attract_timer }
                    mark_first_input
                }
            endif
        endif
    endif
    if GameModeEquals is_classic
        if (<currentSkaterProfileIndex> = 0)
            GetInitialsString
            FormatText textname = initials_string 'UPDATE INITIALS: %i' i = <string>
            add_label_menu_item {
                text = <initials_string>
                rot = -4
                Length = 360
                text_offset = (0.0, 0.0)
                label_offset = (20.0, 0.0)
                pad_choose_script = ss_menu_exit
                pad_choose_params = {new_menu_script = high_scores_menu_enter_initials from_ss_menu = 1}
                focus_params = { attract_timer }
                mark_first_input
            }
        endif
    endif
    if GameModeEquals is_net
        if ((IsPs2)|| (isPC))
            if IsTrue AllowLanPlay
                if (network_connection_type = internet)
                    ui_string = 'INTERNET'
                else
                    ui_string = 'LAN'
                endif
                add_label_menu_item {
                    text = ('CONNECTION: ' + <ui_string>)
                    rot = 2
                    text_offset = (0.0, 0.0)
                    label_offset = (20.0, 0.0)
                    mark_first_input
                    id = menu_connection
                    pad_choose_script = toggle_net_connection_type
                    pad_choose_params = { new_menu_script = <new_menu_script> }
                }
            endif
            if IsOnline
                GetPreferenceChecksum pref_type = network device_type
                switch <checksum>
                    case device_sony_modem
                    case device_usb_modem
                    add_label_menu_item {
                        text = 'HANG UP MODEM'
                        rot = 2
                        Length = 320
                        text_offset = (0.0, 0.0)
                        label_offset = (20.0, 0.0)
                        mark_first_input
                        id = menu_network_select_hang_up
                        pad_choose_script = disconnect_from_internet
                    }
                endswitch
            endif
        endif
        if ((IsPs2)|| (isPC))
            add_label_menu_item {
                text = 'ONLINE PREFERENCES'
                rot = 2
                padding = 30
                text_offset = (0.0, 0.0)
                label_offset = (20.0, 0.0)
                mark_first_input
                id = menu_network_options
                pad_choose_script = ss_menu_exit
                pad_choose_params = { new_menu_script = create_network_options_menu }
            }
        endif
    endif
    label_menu_finish
endscript
network_connection_type = internet

script toggle_net_connection_type 
    GetCurrentSkaterProfileIndex
    GetGameMode
    switch network_connection_type
        case lan
        SetNetworkMode INTERNET_MODE
        change network_connection_type = internet
        SetScreenElementProps id = menu_connection text = 'internet'
        case internet
        SetNetworkMode LAN_MODE
        change network_connection_type = lan
        SetScreenElementProps id = menu_connection text = 'lan'
    endswitch
    if InSplitScreenGame
        if (<currentSkaterProfileIndex> = 1)
            SetScreenElementProps {
                id = ss_play_level
                event_handlers = [{pad_choose ss_menu_exit params = { new_menu_script = launch_level_select_menu player_two }}]
                replace_handlers
            }
        else
            SetScreenElementProps {
                id = ss_play_level
                event_handlers = [{pad_choose ss_menu_exit params = { new_menu_script = player_1_ready }}]
                replace_handlers
            }
        endif
    else
        if GameModeEquals is_net
            if IsXbox
                SetScreenElementProps {
                    id = ss_play_level
                    event_handlers = [{pad_choose ss_menu_exit params = { new_menu_script = create_network_select_games_menu play_cam }}]
                    replace_handlers
                }
            else
                if (network_connection_type = internet)
                    SetScreenElementProps {
                        id = ss_play_level
                        event_handlers = [{pad_choose ss_menu_exit params = { new_menu_script = show_disclaimer }}]
                        replace_handlers
                    }
                else
                    SetScreenElementProps {
                        id = ss_play_level
                        event_handlers = [{pad_choose ss_menu_exit params = { new_menu_script = launch_network_select_lan_games_menu }}]
                        replace_handlers
                    }
                endif
            endif
        else
            SetScreenElementProps {
                id = ss_play_level
                event_handlers = [{pad_choose ss_menu_exit params = { new_menu_script = launch_level_select_menu <...>  }}]
                replace_handlers
            }
        endif
    endif
endscript

script player_1_ready 
    load_second_skater_profile
    GetSingleSkaterProfileInfo \{ player = 1 name }
    launch_select_skater_menu second_player current_skater = <name>
endscript

script ss_menu_exit 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if GotParam \{ hide_bg }
        play_no_skater_cam
    endif
    if GotParam \{ new_menu_script }
        <new_menu_script> <...> animate_in = 1
    endif
    if ((IsXbox)|| (IsXenon)|| (isPC))
        if GameModeEquals \{ is_net }
            if (<new_menu_script> = launch_select_skater_menu)
                SetNetworkMode
            endif
        endif
    endif
endscript

script launch_select_skater_menu 
    pulse_blur \{ Speed = 2 start = 255 }
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if InFrontend
        if (goto_secret_shop = 2)
            wait \{ 1 gameframe }
            change \{ goto_secret_shop = 0 }
        endif
    endif
    SetMenuPadMappings \{[ active use_as_first ]}
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    create_select_skater_menu <...> 
endscript

script select_skater_allow_load 
    <allow_load> = true
    if IsXenon
        if NOT CheckForSignin \{ local }
            <allow_load> = false
        endif
    endif
    return <allow_load>
endscript

script create_select_skater_helper_elements 
    if ScreenElementExists id = select_skater_anchor
        <parent> = select_skater_anchor
    endif
    if ScreenElementExists id = current_menu_anchor
        <parent> = current_menu_anchor
    endif
    if NOT GotParam parent
        return 
    endif
    if select_skater_allow_load
        create_helper_text {
            helper_text_elements = [
                { text = '\b6/\b5=Select' }
                { text = '\m0=Accept' }
                { text = '\m1=Back' }
                { text = '\me=Load Skater' }
            ]
            parent = <parent>
        }
    else
        create_helper_text {
            helper_text_elements = [
                { text = '\b6/\b5=Select' }
                { text = '\m0=Accept' }
                { text = '\m1=Back' }
            ]
            parent = <parent>
        }
    endif
endscript

script create_select_skater_menu reset_skater = 1 cam_anim = selectSkater
    ss_initialization
    main_menu_camera_control next_state = skater
    ResetComboRecords
    if GotParam change_gamemode
        <change_gamemode>
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = select_skater_anchor
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    AssignAlias id = select_skater_anchor alias = current_menu_anchor
    create_select_skater_helper_elements
    Theme_GetHighlightBarColor return_value = bg_color
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = menu_bar
        texture = DE_highlight_bar
        Pos = (0.0, 28.0)
        rgba = [ 20 20 20 100 ]
        just = [ left top ]
        Scale = (5.0, 2.799999952316284)
        alpha = 0.9000
        z_priority = -20
    }
    create_select_skater_hmenu
    kill_start_key_binding
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = star
        Pos = (5.0, 52.0)
        Scale = 0.5000
        alpha = 0.2000
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = star
        Pos = (590.0, 52.0)
        Scale = 0.5000
        alpha = 0.2000
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_1
        Pos = (0.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_2
        Pos = (80.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_3
        Pos = (164.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_4
        Pos = (248.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_5
        Pos = (330.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_6
        Pos = (414.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_7
        Pos = (498.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = strip_8
        Pos = (580.0, 30.0)
        Scale = 1.300
        rgba = [ 60 60 60 90 ]
        just = [ left top ]
    }
    Theme_GetSupportPieceColor return_value = tab_color
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = tab_anchor
        Pos = (310.0, 88.0)
        just = [ left top ]
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        id = select_skater_name
        text = ''
        font = testtitle
        Pos = (30.0, 130.0)
        Scale = 1.900
        just = [ left top ]
        rgba = [ 125 2 77 118 ]
        rot_angle = -3
    }
    if ObjectExists id = stats_block_anchor_parent
        DestroyScreenElement id = stats_block_anchor_parent
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = stats_block_anchor_parent
        Pos = (25.0, 190.0)
        just = [ left top ]
        Scale = 1.0
    }
    stats_menu_create_stats_block parent = stats_block_anchor_parent not_focusable on = on Pos = (0.0, 0.0) Scale = 0.8500
    build_big_level_select_arrows Pos = (490.0, 250.0) Scale = 1 z_priority = 0 arrow_position_shift = (185.0, 0.0) parent = select_skater_anchor
    if GotParam second_player
        if NOT GotParam current_skater
            <current_skater> = Hawk
        endif
    else
        load_pro_skater_get_current_skater_name
        if ChecksumEquals a = <current_skater> b = custom_story
            change select_skater_needs_refresh = 0
        endif
        if ChecksumEquals a = <current_skater> b = custom_classic
            change select_skater_needs_refresh = 0
        endif
    endif
    FireEvent type = focus target = select_skater_hmenu Data = { child_id = <current_skater> }
    skater ::settags stopskateshopstreams = 0
endscript

script reset_model_lights 
endscript

script create_select_skater_hmenu Scale = (1.1399999856948853, 1.0) text = ''
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = select_skater_hmenu_anchor
        Pos = (40.0, 34.0)
    }
    CreateScreenElement {
        type = hmenu
        parent = select_skater_hmenu_anchor
        id = select_skater_hmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        padding_scale = 1
    }
    AssignAlias id = select_skater_hmenu alias = current_menu
    ForEachSkaterProfile do = select_skater_menu_add_hmenu_items
    GetCurrentSkaterProfileIndex
    if InFrontend
        if (<currentSkaterProfileIndex> = 1)
            SetScreenElementProps {
                id = select_skater_hmenu
                event_handlers = [
                    { pad_back generic_menu_pad_back_sound }
                    {pad_back select_skater_menu_back params = { callback = back_from_player_two_select }}
                    {pad_option ss_overwrite_warning params = {}}
                    { pad_option generic_menu_pad_choose_sound }
                ]
                replace_handlers
            }
        else
            GetGameMode
            switch <gamemode>
                case classic
                SetScreenElementProps {
                    id = select_skater_hmenu
                    event_handlers = [{ pad_back generic_menu_pad_back_sound }
                        {pad_back select_skater_menu_back params = { callback = create_single_or_coop_menu }}
                        {pad_option ss_overwrite_warning params = {}}
                        { pad_option generic_menu_pad_choose_sound }
                    ]
                    replace_handlers
                }
                case career
                SetScreenElementProps {
                    id = select_skater_hmenu
                    event_handlers = [{ pad_back generic_menu_pad_back_sound }
                        {pad_back select_skater_menu_back params = { callback = create_gamemode_options_menu }}
                        {pad_option ss_overwrite_warning params = {}}
                        { pad_option generic_menu_pad_choose_sound }
                    ]
                    replace_handlers
                }
                case creategoals
                SetScreenElementProps {
                    id = select_skater_hmenu
                    event_handlers = [{ pad_back generic_menu_pad_back_sound }
                        {pad_back select_skater_menu_back params = { callback = create_select_goals_menu }}
                        {pad_option ss_overwrite_warning params = {}}
                        { pad_option generic_menu_pad_choose_sound }
                    ]
                    replace_handlers
                }
                default 
                SetScreenElementProps {
                    id = select_skater_hmenu
                    event_handlers = [{ pad_back generic_menu_pad_back_sound }
                        {pad_back select_skater_menu_back params = { callback = create_main_menu }}
                        {pad_option ss_overwrite_warning params = {}}
                        { pad_option generic_menu_pad_choose_sound }
                    ]
                    replace_handlers
                }
            endswitch
            if (InSplitScreenGame)
                SetScreenElementProps {
                    id = select_skater_hmenu
                    event_handlers = [{ pad_back change_gamemode_career }]
                }
            endif
        endif
    else
        SetScreenElementProps {
            id = select_skater_hmenu
            event_handlers = [{pad_back select_skater_menu_back params = { callback = create_options_menu }}]
            replace_handlers
        }
    endif
    SetScreenElementProps {
        id = select_skater_hmenu
        event_handlers = [
            {pad_left TemporarilyDisableInput params = { time = 250 }}
            {pad_right TemporarilyDisableInput params = { time = 250 }}
            {pad_left level_select_arrow_blink_left params = { wait_first }}
            { pad_left generic_menu_scroll_sideways_sound }
            {pad_right level_select_arrow_blink_right params = { wait_first }}
            { pad_right generic_menu_scroll_sideways_sound }
        ]
    }
endscript

script ss_overwrite_warning Title = 'Load Skater' callback = cas_reset_skater_and_goto_menu
    if NOT select_skater_allow_load
        return 
    endif
    FireEvent type = unfocus target = select_skater_hmenu
    create_snazzy_dialog_box {
        Title = <Title>
        text = 'Warning !\nAny unsaved changes to your current Game Progress will be lost.\nContinue ?'
        text_dims = (400.0, 0.0)
        no_bg
        pad_back_script = generic_menu_pad_back
        pad_back_params = { callback = ss_cancel_load_skater }
        buttons = [
            {font = small text = 'No' pad_choose_script = ss_cancel_load_skater}
            {
                font = small text = 'Yes'
                pad_choose_script = ss_yes_load_skater
                { 
                 }
            }
        ]
    }
endscript

script ss_yes_load_skater 
    launch_load_cas_from_select_sequence
endscript

script ss_cancel_load_skater 
    dialog_box_exit
    SetScreenElementLock \{ id = current_menu_anchor Off }
    create_select_skater_helper_elements
    FireEvent \{ type = focus target = select_skater_hmenu }
endscript

script menu_horiz_blink_arrow 
    TerminateObjectsScripts id = <arrow_id>
    RunScriptOnScreenElement id = <arrow_id> menu_blink_arrow
endscript

script back_from_player_two_select 
    SetCurrentSkaterProfile \{ 0 }
    RefreshSkaterModel \{ profile = 0 skater = 0 }
    launch_select_skater_menu \{ from2p }
endscript

script select_skater_menu_add_hmenu_items 
    rgba = [ 80 80 80 98 ]
    if GotParam not_in_frontend
        return 
    endif
    if GameModeEquals is_career
        if (<name> = custom_classic)
            return 
        endif
    else
        if (<name> = custom_story)
            return 
        endif
    endif
    if GotParam is_secret
        if NOT GetGlobalFlag flag = (<unlock_flag> + 0)
            <selectable> = not_focusable
            rgba = [ 0 0 0 60 ]
        endif
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = select_skater_hmenu
        id = <name>
        texture = <select_icon>
        Scale = (0.949999988079071, 1.149999976158142)
        rgba = <rgba>
        <selectable>
        event_handlers = [
            {focus select_skater_hmenu_focus params = {name = <name> tag_texture = <tag_texture> sticker_texture = <sticker_texture>}}
            { unfocus select_skater_hmenu_unfocus }
            { pad_choose select_skater_hmenu_choose }
            { pad_start select_skater_hmenu_choose }
            { pad_choose generic_menu_pad_choose_sound }
            { pad_start generic_menu_pad_choose_sound }
        ]
    }
endscript

script get_current_skater_display_name 
    GetCurrentSkaterProfileIndex
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> display_name
    return display_name = <display_name>
endscript

script select_skater_relight_skater 
    FakeLights percent = 100 prefix = TRG_TR_Level_Light
    SetLightAmbientColor r = (skater_ambient_color [ 0 ])g = (skater_ambient_color [ 1 ])b = (skater_ambient_color [ 2 ])
    SetLightDiffuseColor index = 0 r = (skater_diffuse_color1 [ 0 ])g = (skater_diffuse_color1 [ 1 ])b = (skater_diffuse_color1 [ 2 ])
    SetLightDiffuseColor index = 1 r = (skater_diffuse_color2 [ 0 ])g = (skater_diffuse_color2 [ 1 ])b = (skater_diffuse_color2 [ 2 ])
    SetLightAmbientColor r = (skater_ambient_color [ 0 ])g = (skater_ambient_color [ 1 ])b = (skater_ambient_color [ 2 ])
    SetLightDiffuseColor index = 0 r = (skater_diffuse_color1 [ 0 ])g = (skater_diffuse_color1 [ 1 ])b = (skater_diffuse_color1 [ 2 ])
    SetLightDiffuseColor index = 1 r = (skater_diffuse_color2 [ 0 ])g = (skater_diffuse_color2 [ 1 ])b = (skater_diffuse_color2 [ 2 ])
    SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350
    SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270
    SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350
    SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270
endscript
select_skater_needs_refresh = 1

script select_skater_hmenu_focus 
    getsingletag id
    SetScreenElementProps {
        id = <id>
        rgba = [ 118 15 71 128 ]
    }
    if InFrontend
        load_pro_skater_get_current_skater_name
        GetCurrentSkaterProfileIndex
        if (select_skater_needs_refresh = 1)
            load_pro_skater {profile = <currentSkaterProfileIndex> skater = 0 <...> }
        else
            change select_skater_needs_refresh = 1
        endif
        if (<name> = Ped_skater)
            SetLightAmbientColor r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
            SetLightAmbientColor r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
            FakeLights percent = 0 prefix = TRG_TR_Level_Light
        else
            select_skater_relight_skater
        endif
        StopStream
        MakeSkaterGoto SkateshopAI params = {}
        get_current_skater_display_name
        GetUpperCaseString <display_name>
        SetScreenElementProps {
            id = select_skater_name
            text = <uppercasestring>
        }
    endif
    if ObjectExists id = stats_block_anchor
        DestroyScreenElement id = stats_block_anchor
    endif
    if NOT (<name> = Ped_skater)
        SetScreenElementLock id = stats_block_anchor_parent Off
        stats_menu_create_stats_block {
            parent = stats_block_anchor_parent
            id = stats_block_anchor
            not_focusable
            on = on
            Scale = 0.8500
            Pos = (0.0, 0.0)
        }
    endif
    if IsXbox
        SpawnScriptLater TemporarilyDisableInput params = { time = 100 }
    endif
endscript

script highlight_box_pulse 
    begin 
    DoScreenElementMorph id = <id> time = 0.03000 Scale = (1.0700000524520874, 1.0499999523162842)
    wait \{ 0.2000 second }
    DoScreenElementMorph id = <id> time = 0.03000 Scale = (1.100000023841858, 1.0700000524520874)
    wait \{ 0.2000 second }
    repeat 
endscript

script select_skater_hmenu_unfocus 
    gettags
    generic_menu_pad_up_down_sound
    SetScreenElementProps {
        id = <id>
        rgba = [ 80 80 80 98 ]
    }
endscript

script select_skater_hmenu_choose 
    generic_menu_pad_choose_sound
    GetCurrentSkaterProfileIndex
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> name
    if ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex>
        return 
    endif
    if InFrontend
        if GotParam name
            if (<name> = Ped_skater)
                if NOT GotParam choose_ped
                    goto MakeSelectPedMenu params = { ped_info = <...>  }
                endif
            endif
        endif
    endif
    cas_setup_rotating_camera cam_anim = careerCam
    if ObjectExists id = select_skater_anchor
        DestroyScreenElement id = select_skater_anchor
        restore_start_key_binding
    endif
    if InFrontend
        GetSkaterId
        if GotParam device_num
            <controller_index> = <device_num>
        else
            <controller_index> = <controller>
        endif
        BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index>
        BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <controller_index>
        StopStream
        GetCurrentSkaterProfileIndex
        skater ::obj_spawnscriptlater SkateshopGO
        if InSplitScreenGame
            launch_ss_menu <...> 
        else
            launch_ss_menu
        endif
    else
        if NOT GoalManager_HasActiveGoals
            GoalManager_ShowGoalPoints
        endif
        load_pro_skater_set_custom
        GoalManager_ShowPoints
        ReplaceTrickText all
        exit_pause_menu
    endif
    skater ::settags stopskateshopstreams = 1
endscript

script select_skater_get_profile_info 
    GetArraySize \{ master_skater_list }
    <index> = 0
    begin 
    if ChecksumEquals a = ((master_skater_list [ <index> ]).name)b = <skater_profile>
        return profile_info = (master_skater_list [ <index> ])
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript
ss_default_ped_trick_mapping = 0
ss_default_ped_specials = 0

script MakeSelectPedMenu dims = (300.0, 150.0) Pos = (90.0, 10.0) menu_id = sub_menu vmenu_id = sub_vmenu
    FireEvent type = unfocus target = select_skater_hmenu
    SetScreenElementLock id = root_window Off
    change widest_menu_item_width = 0
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = ped_menu_parts_anchor
        dims = (640.0, 150.0)
        Pos = (320.0, 240.0)
    }
    GetCurrentSkaterProfileIndex
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> default_trick_mapping
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> specials
    change ss_default_ped_trick_mapping = (<default_trick_mapping>)
    change ss_default_ped_specials = (<specials>)
    type = vscrollingmenu
    scrolling_menu_id = sub_scrolling_menu
    make_new_menu {
        Pos = <Pos>
        parent = ped_menu_parts_anchor
        internal_just = [ left center ]
        menu_id = <menu_id>
        vmenu_id = <vmenu_id>
        scrolling_menu_id = <scrolling_menu_id>
        type = <type>
        dims = <dims>
        dont_allow_wrap = <dont_allow_wrap>
        <no_menu_title>
    }
    DoScreenElementMorph id = <menu_id> time = 0 Pos = (310.0, 620.0)
    AssignAlias id = ped_menu_parts_anchor alias = current_menu_anchor
    SetScreenElementProps {
        id = current_menu
        event_handlers = [
            { pad_back BackFromPedMenu }
            {pad_up set_which_arrow params = { arrow = scrolling_menu_up_arrow }}
            {pad_down set_which_arrow params = { arrow = scrolling_menu_down_arrow }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            {pad_up TemporarilyDisableInput params = { time = 250 }}
            {pad_down TemporarilyDisableInput params = { time = 250 }}
        ]
    }
    <num_added> = 0
    GetArraySize ped_profile_list
    <index> = 0
    begin 
    <add_item> = 0
    if StructureContains structure = (ped_profile_list [ <index> ])collectors_edition_only
        if IsCollectorsEdition
            <add_item> = 1
        endif
    else
        if GetGlobalFlag flag = ((ped_profile_list [ <index> ]).ped_group_flag)
            <add_item> = 1
        endif
    endif
    if (<add_item>)
        if StructureContains structure = (ped_profile_list [ <index> ])skater_profile
            select_skater_get_profile_info profile = ((ped_profile_list [ <index> ]).skater_profile)
            <info> = <profile_info>
        else
            <info> = <ped_info>
        endif
        if StructureContains structure = (ped_profile_list [ <index> ])default_trick_mapping
            <tricks> = {default_trick_mapping = ((ped_profile_list [ <index> ]).default_trick_mapping)}
        else
            <tricks> = {}
        endif
        if StructureContains structure = (ped_profile_list [ <index> ])specials
            <specials> = {specials = ((ped_profile_list [ <index> ]).specials)}
        else
            <specials> = {}
        endif
        theme_menu_add_item {
            text = ((ped_profile_list [ <index> ]).display_name)
            focus_script = PedFocus
            focus_params = {
                appearance = ((ped_profile_list [ <index> ]).ped_appearance_structure)
                tag_texture = ((ped_profile_list [ <index> ]).tag_texture)
                <tricks>
                <specials>
            }
            pad_choose_script = PedChoose
            pad_choose_params = {info = <info> controller = <controller> device_num = <device_num>}
            centered
            highlight_bar_scale = (1.7000000476837158, 0.699999988079071)
            no_bg
        }
        <num_added> = (<num_added> + 1)
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    if (<num_added>)
        FakeLights percent = 100 prefix = TRG_TR_Level_Light
        SetLightAmbientColor r = 73 g = 70 b = 80
        SetLightDiffuseColor index = 0 r = 110 g = 125 b = 155
        SetLightDiffuseColor index = 1 r = 10 g = 3 b = 5
        SetLightAmbientColor r = 73 g = 70 b = 80
        SetLightDiffuseColor index = 0 r = 110 g = 125 b = 155
        SetLightDiffuseColor index = 1 r = 10 g = 3 b = 5
        SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350
        SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270
        SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350
        SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270
    endif
    theme_menu_add_item {text = 'Back'
        pad_choose_script = BackFromPedMenu
        centered
        highlight_bar_scale = (1.7000000476837158, 0.699999988079071)
        no_bg
    }
    finish_themed_scrolling_menu Pos = (360.0, 8.0) bg_width = 1.400
    DoScreenElementMorph id = bg_box_vmenu Pos = (180.0, 10.0)
    Theme_GetHighlightedTextColor return_value = on_rgba
    DoScreenElementMorph id = scrolling_menu_up_arrow time = 0 rgba = <on_rgba>
    DoScreenElementMorph id = scrolling_menu_down_arrow time = 0 rgba = <on_rgba>
    SetScreenElementLock id = ped_menu_parts_anchor Off
    create_helper_text generic_helper_text parent = ped_menu_parts_anchor helper_pos = (320.0, 261.0)
    SetScreenElementLock id = ped_menu_parts_anchor on
endscript

script PedChoose 
    GetCurrentSkaterProfileIndex
    if ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex>
        return 
    endif
    if ObjectExists \{ id = ped_menu_parts_anchor }
        DestroyScreenElement \{ id = ped_menu_parts_anchor }
    endif
    select_skater_hmenu_choose <info> choose_ped controller = <controller> device_num = <device_num>
endscript

script PedFocus 
    main_theme_focus
    GetCurrentSkaterProfileIndex
    SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = <appearance>
    SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
    EditPlayerAppearance profile = <currentSkaterProfileIndex> target = setpart targetParams = {part = board desc_id = default}
    if (<currentSkaterProfileIndex> = 0)
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> tag_texture <tag_texture>
        set_correct_graffiti_textures name = ped tag_texture = <tag_texture>
    endif
    if GotParam default_trick_mapping
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { default_trick_mapping = <default_trick_mapping> }
    else
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {default_trick_mapping = (ss_default_ped_trick_mapping)}
    endif
    if GotParam specials
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { specials = <specials> }
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> specials <specials>
    else
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {specials = (ss_default_ped_specials)}
    endif
    RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <controller> no_board = 0 texDictOffset = 9
    current_menu ::gettags
    if GotParam arrow_id
        Theme_GetHighlightedTextColor return_value = on_rgba
        menu_vert_blink_arrow id = <arrow_id> rgba = <on_rgba>
    endif
endscript

script BackFromPedMenu 
    if ObjectExists \{ id = ped_menu_parts_anchor }
        DestroyScreenElement \{ id = ped_menu_parts_anchor }
    endif
    SetScreenElementLock \{ id = select_skater_anchor Off }
    create_select_skater_helper_elements
    SetScreenElementLock \{ id = select_skater_anchor on }
    Debounce \{ x time = 0.5000 }
    FireEvent \{type = focus target = select_skater_hmenu Data = { child_id = 19 }}
    AssignAlias \{ id = select_skater_anchor alias = current_menu_anchor }
endscript

script SkateshopGO 
    wait \{ 0.1800 seconds }
    PlaySkaterStream \{ type = 'SSGo' }
endscript

script load_second_skater_profile 
    printf \{ 'REFRESHING SKATER MODEL' }
    SetCurrentSkaterProfile \{ 1 }
    RefreshSkaterModel \{ profile = 1 skater = 0 }
    SyncPlayer2Profile
endscript

script select_skater_menu_back 
    KillSpawnedScript \{ name = highlight_box_pulse }
    if ObjectExists \{ id = select_skater_anchor }
        DestroyScreenElement \{ id = select_skater_anchor }
        restore_start_key_binding
    endif
    skater ::obj_movetonode \{ name = Z_mainmenu_TRG_Playerrestart orient NoReset }
    skater ::cancelrotatedisplay
    FakeLights \{ percent = 100 prefix = TRG_TR_Level_Light }
    skater ::settags \{ stopskateshopstreams = 1 }
    <callback> from_skater_select
endscript

script menu_blink_arrow 
    DoMorph \{ alpha = 0 }
    wait \{ 100 }
    DoMorph \{ time = 0.3000 alpha = 1 }
endscript

script blink_arrow 
    if NOT ScreenElementExists id = <id>
        return 
    endif
    DoScreenElementMorph id = <id> alpha = 0
    wait \{ 100 }
    DoScreenElementMorph id = <id> time = 0.3000 alpha = 1
endscript

script set_which_arrow 
    settags arrow_id = <arrow>
endscript

script menu_vert_blink_arrow menu_id = current_menu rgba = [ 128 128 128 128 ]
    if NOT ObjectExists id = <id>
        printf 'bad arrow id'
        return 
    endif
    TerminateObjectsScripts id = <id>
    DoScreenElementMorph {
        id = <id>
        alpha = 1
    }
    wait 1 gameframe
    if NOT ((MenuSelectedIndexIs id = <menu_id> first)|| (MenuSelectedIndexIs id = <menu_id> last))
        SetScreenElementProps {id = <id> rgba = <rgba>}
        RunScriptOnScreenElement id = <id> menu_blink_arrow
    endif
endscript

script launch_park_editor 
    change_gamemode_cap
    SetParkName \{ '' }
    BindParkEditorToController <device_num>
    GetCurrentSkaterProfileIndex
    BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <device_num>
    BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <device_num>
    main_menu_play_level2 \{ level = load_sk5ed }
endscript

script main_menu_play_level2 
    restore_start_key_binding
    change_level level = <level>
endscript

script leave_front_end 
    restore_start_key_binding
endscript

script spawn_two_player 
    cleanup \{ preserve_skaters }
    LeaveServer
    flushdeadobjects
    InitSkaterHeaps
    SetServerMode
    StartServer
    SetJoinMode \{ JOIN_MODE_PLAY }
    JoinServer
    begin 
    if JoinServerComplete
        break 
    else
        wait \{ 1 }
    endif
    repeat 
    ScreenElementSystemCleanup
endscript

script launch_two_player 
    SetCurrentSkaterProfile \{ 0 }
    RefreshSkaterModel \{ profile = 0 skater = 0 }
    SetMenuPadMappings \{[ active use_as_first ]}
    SpawnScriptLater \{ spawn_two_player notsessionspecific = 1 }
endscript

script enable_system_link_option 
    if ObjectExists \{ id = mm_multi_play }
        handle_enable_system_link_option \{ item = mm_multi_play }
    endif
    if ObjectExists \{ id = mm_multi_play2 }
        handle_enable_system_link_option \{ item = mm_multi_play2 }
    endif
endscript

script handle_enable_system_link_option 
    <item> ::gettags
    if (<active> = 0)
        main_vmenu ::gettags
        if GotParam tag_selected_id
            if (<tag_selected_id> = <item>)
                Theme_GetHighlightedTextColor return_value = rgba
                SetScreenElementProps {
                    id = {<item> child = 0}
                    rgba = <rgba>
                    z_priority = 4
                }
                if ScreenElementExists id = {<item> child = 1}
                    SetScreenElementProps {
                        id = {<item> child = 1}
                        rgba = <rgba>
                        z_priority = 4
                    }
                endif
            else
                SetScreenElementProps {
                    id = {<item> child = 0}
                    rgba = spin_menu_unhighlighted_text
                }
                if ScreenElementExists id = {<item> child = 1}
                    SetScreenElementProps {
                        id = {<item> child = 1}
                        rgba = spin_menu_unhighlighted_text
                        z_priority = 4
                    }
                endif
            endif
            SetScreenElementProps {
                id = <item>
                tags = { active = 1 }
            }
        endif
    endif
endscript

script disable_system_link_option 
    if ObjectExists \{ id = mm_multi_play }
        handle_disable_system_link_option \{ item = mm_multi_play }
    endif
    if ObjectExists \{ id = mm_multi_play2 }
        handle_disable_system_link_option \{ item = mm_multi_play2 }
    endif
endscript

script handle_disable_system_link_option 
    <item> ::gettags
    if (<active> = 1)
        main_vmenu ::gettags
        if GotParam tag_selected_id
            if (<tag_selected_id> = <item>)
                FireEvent type = pad_up target = current_menu
            endif
        endif
        SetScreenElementProps {
            id = {<item> child = 0}
            rgba = spin_menu_disabled_text
        }
        if ScreenElementExists id = {<item> child = 1}
            SetScreenElementProps {
                id = {<item> child = 1}
                rgba = spin_menu_disabled_text
            }
        endif
        SetScreenElementProps {
            id = <item>
            tags = { active = 0 }
        }
    endif
endscript

script make_mainmenu_clouds 
    printf \{ '!! make_mainmenu_clouds no longer in use !!' }
endscript
attract_mode_movies = [ 'movies\demo_1' ]
