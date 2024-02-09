
script launch_level_select_menu 
    hide_current_goal
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if ScreenElementExists id = main_menu_bg_anchor
        DestroyScreenElement id = main_menu_bg_anchor
    endif
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            hide
        }
    endif
    if NOT InFrontend
        printf 'launch_level_select_menu: not in front end'
    else
        printf 'launch_level_select_menu: in front end'
        main_menu_camera_control next_state = level
    endif
    if IsNGC
        LoadPak 'pak/levelselect/levelselect.pak' localized
    else
        if NOT InNetGame
            if NOT InFrontend
                do_unload_unloadable
            endif
            LoadPak 'pak/levelselect/levelselect.pak' localized heap = unloadableanim
        else
            LoadPak 'pak/levelselect/levelselect.pak' localized heap = frontendheap
        endif
    endif
    pause_menu_gradient Off
    SetMenuPadMappings [ active
    use_as_first
     ]
    create_level_select_menu <...> 
endscript

script build_big_level_select_arrows Pos = (0.0, 0.0) Scale = 1 z_priority = 0 arrow_position_shift = (0.0, 0.0)
    if NOT GotParam arrow_color
        Theme_GetMenuTitleColor return_value = arrow_color
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        id = left_arrow
        texture = left_arrow
        rgba = <arrow_color>
        Scale = ((2.200000047683716, 1.399999976158142) * <Scale>)
        Pos = ((-305.0, -5.0) + <arrow_position_shift> + <Pos>)
        rot_angle = 10
        just = [ left center ]
        z_priority = <z_priority>
    }
    RunScriptOnScreenElement id = left_arrow level_select_arrow_twitch_effect params = {rot_angle = 10 rot_angle_dir = -1}
    CreateScreenElement {
        type = SpriteElement
        parent = left_arrow
        texture = left_arrow
        rgba = [ 0 0 0 70 ]
        Scale = 1
        Pos = (-5.0, 17.0)
        just = [ left center ]
        z_priority = -0.5000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        id = right_arrow
        texture = right_arrow
        rgba = <arrow_color>
        Scale = ((2.200000047683716, 1.399999976158142) * <Scale>)
        Pos = ((305.0, 5.0) - <arrow_position_shift> + <Pos>)
        rot_angle = 10
        just = [ RIGHT center ]
        z_priority = <z_priority>
    }
    RunScriptOnScreenElement id = right_arrow level_select_arrow_twitch_effect params = {rot_angle = 10 rot_angle_dir = 1}
    CreateScreenElement {
        type = SpriteElement
        parent = right_arrow
        texture = right_arrow
        rgba = [ 0 0 0 70 ]
        Scale = 1
        Pos = (22.0, 11.0)
        just = [ RIGHT center ]
        z_priority = -0.5000
    }
endscript

script level_select_arrow_blink_left 
    if NOT ScreenElementExists \{ id = left_arrow }
        return 
    endif
    if GotParam \{ wait_first }
        wait \{ 1 gameframes }
    endif
    left_arrow ::settags \{ animating }
    DoScreenElementMorph \{id = left_arrow alpha = 0.1500 time = 0 Scale = 0.5000 relative_scale}
    DoScreenElementMorph \{id = left_arrow alpha = 1 time = 0.1500 Scale = 1 relative_scale}
endscript

script level_select_arrow_blink_right 
    if NOT ScreenElementExists \{ id = right_arrow }
        return 
    endif
    if GotParam \{ wait_first }
        wait \{ 1 gameframes }
    endif
    right_arrow ::settags \{ animating }
    DoScreenElementMorph \{id = right_arrow alpha = 0.1500 time = 0 Scale = 0.5000 relative_scale}
    DoScreenElementMorph \{id = right_arrow alpha = 1 time = 0.1500 Scale = 1 relative_scale}
endscript

script level_select_arrow_twitch_effect 
    begin 
    if getsingletag \{ animating }
        wait \{ 0.1500 seconds }
        removetags \{tags = [ animating ]}
    else
        DoMorph rot_angle = (<rot_angle> + 10 * <rot_angle_dir>)
        wait \{ 1 gameframe }
        DoMorph rot_angle = <rot_angle>
    endif
    wait_time = Random (@ 0.2500 @ 0.5000 @ 2.250)
    wait <wait_time> seconds
    repeat 
endscript

script level_select_unload 
    printf \{ '**** UNLOADING LEVEL SELECT PAK ****' }
    BeginUnloadPak \{ 'pak/levelselect/levelselect.pak' localized }
    EndUnloadPak \{ 'pak/levelselect/levelselect.pak' localized }
    if NOT IsNGC
        if NOT InFrontend
            if NOT InNetGame
                do_load_unloadable
            endif
        endif
    endif
endscript

script level_select_get_info_panel_script 
    if InSplitScreenGame
        if NOT GameModeEquals is_coop
            info_panel_script = level_select_build_highscore_info_panel
        else
            info_panel_script = level_select_build_classic_info_panel
        endif
    else
        GetGameMode
        switch <gamemode>
            case classic
            info_panel_script = level_select_build_classic_info_panel
            case career
            info_panel_script = level_select_build_info_panel
            case freeskate
            case singlesession
            info_panel_script = level_select_build_highscore_info_panel
            case net
            info_panel_script = level_select_build_online_info_panel
            default 
            info_panel_script = level_select_build_online_info_panel
        endswitch
    endif
    return <...> 
endscript

script network_level_select_pad_back 
    <net_pad_back> = 1
    level_select_menu_exit <...> 
endscript

script kill_level_select_scripts 
    level_select_get_info_panel_script
    KillSpawnedScript \{ name = level_select_build_info_panel_common_bits }
    KillSpawnedScript name = <info_panel_script>
    KillSpawnedScript \{ name = level_select_build_title }
    KillSpawnedScript \{ name = level_select_spin_globe }
    KillSpawnedScript \{ name = show_active_globe_dot }
    KillSpawnedScript \{ name = globe_dot_highlight_pulse }
endscript

script level_select_menu_exit 
    kill_level_select_scripts
    kill_level_select_cams
    if ObjectExists id = level_menu
        DestroyScreenElement id = level_menu
        level_select_unload
    endif
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            unhide
        }
    endif
    if GotParam no_new_menu
        return 
    endif
    if InFrontend
        GoalManager_HideGoalPoints
        if (in_server_options = 1)
            if NOT GotParam net_pad_back
                net_pad_back = 0
            endif
            if (<net_pad_back> = 0)
                prefs = network
                field = 'level'
                string = <text>
                checksum = <level>
                select_host_option <...> 
            endif
            if ObjectExists id = host_options_menu
                DestroyScreenElement id = host_options_menu
            endif
            KillSkaterCamAnim all
            create_network_host_options_menu
        else
            GetGameMode
            switch <gamemode>
                case career
                create_gamemode_options_menu
                case freeskate
                case singlesession
                case classic
                launch_ss_menu <...> no_animate
            endswitch
        endif
    else
        if GotParam end_run
            create_end_run_menu
        else
            create_pause_menu
        endif
    endif
endscript
created_park_warning = 0

script level_select_created_park_menu 
    level_menu ::getsingletag from_server_options
    DoScreenElementMorph id = level_select_info_panel time = 0 alpha = 0
    make_new_skateshop_menu {
        parent = level_menu
        Pos = (370.0, 120.0)
        internal_just = [ left center ]
        menu_id = created_park_menu
        vmenu_id = created_park_vmenu
        menu_title = ''
    }
    theme_background parent = created_park_menu id = created_park_bg width = 1.500 Pos = (450.0, 106.0) num_parts = 3 z_priority = 1 dark_menu = dark_menu static = static
    kill_start_key_binding
    if GotParam show_warning
        change created_park_warning = 1
    endif
    GetCustomParkName
    if (<name> = '')
        <name> = 'Mein Park'
    endif
    CreateScreenElement {
        type = TextElement
        parent = created_park_menu
        Pos = (450.0, 110.0)
        font = dialog
        text = <name>
        just = [ center top ]
        Scale = 1
        rgba = [ 128 128 128 80 ]
        not_focusable
        z_priority = 2
    }
    truncate_string id = <id> max_width = 200
    CreateScreenElement {
        type = SpriteElement
        parent = created_park_menu
        texture = black
        Pos = (450.0, 109.0)
        rgba = [ 0 0 0 60 ]
        Scale = (52.0, 7.0)
        just = [ center top ]
        z_priority = 2
    }
    SetScreenElementProps {
        id = created_park_vmenu
        event_handlers = [
            { pad_back generic_menu_pad_back_sound }
            {pad_back level_select_created_park_menu_exit params = { from_server_options = <from_server_options> }}
        ]
        replace_handlers
    }
    if GotParam from_server_options
        created_park_menu_add_item {text = 'Park spielen'
            id = created_park_play_park
            pad_choose_script = created_park_launch
            pad_choose_params = { from_server_options }
        }
    else
        created_park_menu_add_item {text = 'Park spielen'
            id = created_park_play_park
            pad_choose_script = created_park_launch
            pad_choose_params = {}
        }
    endif
    if GotParam from_server_options
        created_park_menu_add_item {text = 'Park laden'
            id = created_park_load_park
            pad_choose_script = confirm_load_park
            pad_choose_params = { load_park from_server_options }
        }
    else
        created_park_menu_add_item {text = 'Park laden'
            id = created_park_load_park
            pad_choose_script = confirm_load_park
            pad_choose_params = { load_park }
        }
    endif
    if GotParam from_server_options
        created_park_menu_add_item {text = 'Fertige Parks'
            id = created_park_premade
            pad_choose_script = level_select_created_park_menu_exit
            pad_choose_params = { park_list from_server_options }
        }
    else
        created_park_menu_add_item {text = 'Fertige Parks'
            id = created_park_premade
            pad_choose_script = level_select_created_park_menu_exit
            pad_choose_params = { park_list }
        }
    endif
    created_park_menu_add_item {text = 'Zurück'
        id = created_park_back
        pad_choose_script = level_select_created_park_menu_exit
        pad_choose_params = {}
    }
    FireEvent type = unfocus target = level_menu
    FireEvent type = focus target = created_park_vmenu
    SetButtonEventMappings block_menu_input
    wait 0.1000 seconds
    SetButtonEventMappings unblock_menu_input
endscript

script created_park_menu_add_item 
    highlight_bar_scale = (1.600000023841858, 0.699999988079071)
    centered = centered
    no_bg = no_bg
    theme_menu_add_item <...> 
endscript

script created_park_launch 
    change AbortScript = DefaultAbortScript
    if (in_server_options = 1)
        GetParkEditorMaxPlayers
        GetNetworkNumPlayers
        if InNetGame
            if (<num_players> > <maxplayers>)
                level_select_created_park_menu_exit from_server_options
                kill_level_select_scripts
                if ObjectExists id = level_menu
                    DestroyScreenElement id = level_menu
                endif
                spawnscriptnow level_select_unload
                goto mcmess_ErrorbadParkMaxPlayers params = {num_players = <num_players> maxplayers = <maxplayers> back_script = return_to_created_park_menu back_params = { from_server_options }}
            endif
        endif
    endif
    GetParkEditorMaxPlayers
    GetNetworkNumPlayers
    if InNetGame
        if (<num_players> > <maxplayers>)
            level_select_created_park_menu_exit from_server_options
            kill_level_select_scripts
            if ObjectExists id = level_menu
                DestroyScreenElement id = level_menu
            endif
            spawnscriptnow level_select_unload
            goto mcmess_ErrorbadParkMaxPlayers params = {num_players = <num_players> maxplayers = <maxplayers> back_script = return_to_created_park_menu back_params = { from_server_options }}
        endif
    endif
    if (in_server_options = 1)
        level_select_created_park_menu_exit from_server_options
        level = load_sk5ed_gameplay
        string = 'Erstellter Park'
        level_select_menu_exit from_server_options net_pad_back = 0 <...> 
    else
        if InNetGame
            change created_park_warning = 0
            level_select_change_level level = load_sk5ed_gameplay <...> show_warning
        else
            level_select_change_level level = load_sk5ed_gameplay <...> 
        endif
    endif
endscript

script confirm_load_park 
    level_select_created_park_menu_exit
    if ObjectExists id = level_menu
        DestroyScreenElement id = level_menu
    endif
    spawnscriptnow level_select_unload
    if GotParam from_server_options
        change still_in_net_area = 1
        if IsParkUnsaved
            menu_confirm_quit {yes_script = launch_level_select_load_park_sequence
                Title = 'Park ersetzen?'
                text_dims = (330.0, 0.0)
                back_script = return_to_created_park_menu
                no_script = return_to_created_park_menu
                params = { from_server_options }
            }
        else
            launch_level_select_load_park_sequence
        endif
    else
        if IsParkUnsaved
            if InFrontend
                no_animate = no_animate
            endif
            menu_confirm_quit {yes_script = launch_level_select_load_park_sequence
                Title = 'Park ersetzen?'
                text_dims = (330.0, 0.0)
                no_animate = <no_animate>
                back_script = return_to_created_park_menu
                no_script = return_to_created_park_menu
            }
        else
            launch_level_select_load_park_sequence
        endif
    endif
endscript
still_in_net_area = 0

script return_to_created_park_menu 
    dialog_box_exit
    kill_start_key_binding
    launch_level_select_menu {<...> created_park_focus = ((level_select_item_current_index)- 1)}
    wait \{ 1 gameframe }
    level_select_valid_choice level_callback_script = level_select_created_park_menu <...> 
endscript

script level_select_created_park_menu_exit 
    if GotParam park_list
        level_select_created_park_list <...> 
    else
        SetButtonEventMappings block_menu_input
        SetButtonEventMappings unblock_menu_input
        if ObjectExists id = created_park_menu
            DestroyScreenElement id = created_park_menu
        endif
        if ObjectExists id = premade_park_menu
            DestroyScreenElement id = premade_park_menu
        endif
    endif
    if GotParam launch_level
        printf 'launching created level'
    endif
    if GotParam load_park
        printf 'launching created level'
    endif
    if NOT GotParam park_list
        AssignAlias id = level_menu alias = current_menu
        if ScreenElementExists id = level_menu
            level_menu ::setprops unblock_events
        endif
        FireEvent type = focus target = level_menu Data = {grid_index = ((level_select_item_current_index)- 1)}
    endif
endscript

script level_select_created_park_list 
    printf 'level_select_created_park_list'
    dialog_box_exit
    if ScreenElementExists id = level_menu
        dark_menu = dark_menu
        delta_pos = (0.0, 0.0)
        parent = level_menu
    else
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
        delta_pos = (-400.0, 0.0)
        parent = root_window
    endif
    if GotParam in_park_editor
        make_new_themed_scrolling_menu Title = 'FERTIGE PARKS'
    else
        make_new_skateshop_menu {
            parent = <parent>
            Pos = ((620.0, 100.0) + <delta_pos>)
            dims = (200.0, 191.0)
            internal_just = [ left center ]
            menu_id = premade_park_menu
            scrolling_menu_id = premade_park_scrolling_menu
            vmenu_id = premade_park_vmenu
            menu_title = 'FERTIG'
            type = vscrollingmenu
            scrolling_menu_title_id = ''
            dont_allow_wrap = dont_allow_wrap
            padding_scale = 0.9000
        }
        if ScreenElementExists id = level_menu
            DoScreenElementMorph id = premade_park_menu Pos = (320.0, 640.0)
        endif
    endif
    kill_start_key_binding
    if NOT GotParam in_park_editor
        theme_background parent = premade_park_menu id = premade_park_bg width = 1.500 Pos = ((710.0, 106.0) + <delta_pos>)num_parts = 7.500 z_priority = 1 dark_menu = <dark_menu> static = static
    endif
    if GotParam in_park_editor
        create_helper_text generic_helper_text
    endif
    if GotParam from_server_options
        pad_back_params = { from_server_options }
    else
        pad_back_params = {}
    endif
    if NOT GotParam in_park_editor
        SetScreenElementProps {
            id = premade_park_vmenu
            event_handlers = [{pad_back generic_menu_pad_back params = {callback = level_select_created_park_list_exit <pad_back_params>}}]
            replace_handlers
        }
    else
        SetScreenElementProps {
            id = sub_menu
            event_handlers = [{pad_back generic_menu_pad_back params = { callback = level_select_created_park_list_exit <...>  }}]
            replace_handlers
        }
    endif
    GetArraySize premade_parks_info
    index = 0
    begin 
    <premade_selectable> = 1
    if IsNGC
        if StructureContains structure = (premade_parks_info [ <index> ])exclude_ngc
            <premade_selectable> = 0
        endif
    endif
    if (<premade_selectable> = 1)
        created_park_menu_add_item {
            text = (premade_parks_info [ <index> ].name)
            pad_choose_script = maybe_load_premade_park
            pad_choose_params = {<pad_back_params> slot = (premade_parks_info [ <index> ].slot)max = (premade_parks_info [ <index> ].max)}
        }
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    if ScreenElementExists id = level_menu
        FireEvent type = unfocus target = level_menu
    endif
    if ScreenElementExists id = level_menu
        SetButtonEventMappings block_menu_input
        DoScreenElementMorph id = premade_park_menu Pos = (720.0, 220.0) time = 0
        DoScreenElementMorph id = created_park_menu Pos = (720.0, 240.0) time = 0.1500
        wait 0.2500 seconds
        DoScreenElementMorph id = premade_park_menu Pos = (60.0, 220.0) time = 0.3000
        wait 0.2500 seconds
        FireEvent type = unfocus target = created_park_vmenu
        FireEvent type = focus target = premade_park_vmenu
        SetButtonEventMappings unblock_menu_input
    endif
    if GotParam in_park_editor
        theme_menu_add_item text = 'Fertig' id = menu_done Scale = 1.0 pad_choose_script = create_pause_menu no_bg highlight_bar_scale = (1.7000000476837158, 0.800000011920929)
        finish_themed_scrolling_menu bg_width = 1.500 time = 0.2000
    endif
endscript

script maybe_load_premade_park 
    GetNetworkNumPlayers
    if InNetGame
        if (<num_players> > <max>)
            level_select_created_park_menu_exit \{ from_server_options }
            kill_level_select_scripts
            if ObjectExists \{ id = current_menu_anchor }
                DestroyScreenElement \{ id = current_menu_anchor }
            endif
            spawnscriptnow \{ level_select_unload }
            goto mcmess_ErrorbadParkMaxPlayers params = {num_players = <num_players> maxplayers = <max> back_script = return_to_created_park_menu back_params = { from_server_options }}
        endif
    endif
    level_select_created_park_list_exit <...> 
endscript

script level_select_created_park_list_exit 
    if ObjectExists id = level_menu
        if NOT GotParam slot
            SetButtonEventMappings block_menu_input
            DoScreenElementMorph id = premade_park_menu Pos = (720.0, 240.0) time = 0.3000
            wait 0.2500 seconds
            DoScreenElementMorph id = created_park_menu Pos = (320.0, 240.0) time = 0.1500
            wait 0.2500 seconds
            FireEvent type = focus target = created_park_vmenu
            SetButtonEventMappings unblock_menu_input
            AssignAlias id = level_menu alias = current_menu_anchor
        endif
    else
        in_park_ed = 1
    endif
    if ObjectExists id = premade_park_menu
        DestroyScreenElement id = premade_park_menu
    endif
    if GotParam slot
        printf 'loading from disk'
        if GotParam in_park_ed
            printf 'in the park editor'
            LoadParkFromDisk slot = <slot>
        else
            if GotParam from_server_options
                LoadParkFromDisk slot = <slot> block_rebuild
                created_park_launch from_server_options
            else
                LoadParkFromDisk slot = <slot> block_rebuild
                created_park_launch
            endif
        endif
    else
        if GotParam in_park_editor
            create_pause_menu
        endif
    endif
endscript

script kill_level_select_cams 
    if InFrontend
        KillSkaterCamAnim \{ name = level_select_cam }
    endif
endscript

script really_change_level 
    if OnServer
        change_level <...> 
    else
        if ishost
            FCFSRequestChangeLevel <...> 
        endif
    endif
endscript
return_to_level = [ null ]

script level_select_change_level 
    GoalManager_ShowPoints
    if NOT GoalManager_HasActiveGoals
        GoalManager_ShowGoalPoints
    endif
    if ScreenElementExists id = level_menu
        DestroyScreenElement id = level_menu
        spawnscriptnow level_select_unload
    endif
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if InFrontend
        SetColorBufferClear Clear = 0
        StopKeyboardHandler
    endif
    if LevelIs load_sk5ed_gameplay
        RailEditor ::DestroyEditedRailSectors DoNotUpdateSuperSectors
    endif
    kill_level_select_cams
    if InNetGame
        show_warning = 1
        level_select_menu_exit no_new_menu
        exit_pause_menu dont_unpause_music
    endif
    if cd
        if IsCustomPark
            really_change_level <...> 
        else
            if NOT LevelIs <level>
                really_change_level <...> 
            else
                if GotParam chose_same_level_script
                    <chose_same_level_script>
                else
                    if root_window ::getsingletag no_exit_pause_menu
                        level_select_menu_exit
                        return 
                    endif
                    if GotParam end_run
                        level_select_menu_exit end_run
                        return 
                    endif
                    if InSplitScreenGame
                        level_select_menu_exit end_run
                        return 
                    endif
                endif
            endif
        endif
    else
        really_change_level <...> 
    endif
    if NOT InNetGame
        level_select_menu_exit no_new_menu
        exit_pause_menu dont_unpause_music
    endif
endscript

script level_select_invalid_choice 
    printf \{ 'locked!' }
endscript

script level_select_valid_choice 
    theme_menu_pad_choose_sound
    kill_level_select_scripts
    if GotParam \{ level_callback_script }
        <level_callback_script> <...> 
    endif
endscript

script SetStartingLevelFlags 
    SetGlobalFlag \{ flag = GLOBALFLAG_PLACEHOLDER }
    SetGlobalFlag \{ flag = MOVIE_UNLOCKED_DEFAULT }
    SetFlag \{ level = Load_Z_HO flag = LEVEL_VISITED }
    SetFlag \{ level = Load_Z_DN flag = LEVEL_VISITED }
    SetFlag \{ level = Load_Z_HO flag = LEVEL_UNLOCKED_STORY }
    SetFlag \{ level = Load_Z_DN flag = LEVEL_UNLOCKED_CLASSIC }
    SetFlag \{ level = sk5ed flag = LEVEL_VISITED }
    SetFlag \{ level = sk5ed flag = LEVEL_UNLOCKED_CLASSIC }
endscript
level_select_menu_level_info = [
    {
        text = 'BETRACHTER'
        level = viewer
        poster = levelposter_hollywood
        Length = 100
        rot = 3
        DEVKIT_ONLY
        career_only
    }
    {
        text = 'TESTLEVEL'
        level = Load_Z_TestLevel
        poster = levelposter_hollywood
        Length = 130
        rot = -1
        DEVKIT_ONLY
        career_only
    }
    {
        text = 'CHAR TEST'
        level = Load_Z_Test_NN
        poster = levelposter_hollywood
        Length = 130
        rot = -3
        DEVKIT_ONLY
        career_only
    }
    {
        text = 'HOLLYWOOD'
        level = Load_Z_HO
        poster = levelposter_hollywood
        Length = 135
        rot = -4
    }
    {
        text = 'BEVERLY HILLS'
        level = Load_Z_BH
        poster = levelposter_beverlyhills
        Length = 180
        rot = 0
    }
    {
        text = 'DOWNTOWN'
        level = Load_Z_DT
        poster = levelposter_downtown
        Length = 130
        rot = 2
    }
    {
        text = 'OST-L.A.'
        level = Load_Z_EL
        poster = levelposter_eastla
        Length = 110
        rot = 4
    }
    {
        text = 'SANTA MONICA'
        level = Load_Z_SM
        poster = levelposter_santamonica
        Length = 180
        rot = -2
    }
    {
        text = 'BOHRINSEL'
        level = Load_Z_OI
        poster = levelposter_oilrig
        Length = 90
        rot = 0
    }
    {
        text = 'VANS PARK'
        level = Load_Z_SV
        poster = levelposter_vans
        Length = 120
        rot = 4
    }
    {
        text = 'KASINO'
        level = Load_Z_LV
        poster = levelposter_casino
        Length = 100
        rot = 2
    }
    {
        text = 'SKATE-RANCH'
        level = Load_Z_SR
        poster = levelposter_ranch
        Length = 160
        rot = -2
        special_case_flag = Z_SR_UNLOCKED_WITH_STORY
    }
    {
        text = 'MINNEAPOLIS'
        level = Load_Z_DN
        poster = levelposter_minneapolis
        Length = 170
        rot = 2
    }
    {
        text = 'SANTA CRUZ'
        level = Load_Z_SZ
        poster = levelposter_santacruz
        Length = 160
        rot = 1
    }
    {
        text = 'DIE MALL'
        level = Load_Z_MA
        poster = levelposter_mall
        Length = 110
        rot = 0
    }
    {
        text = 'CHICAGO'
        level = Load_Z_CH
        poster = levelposter_chicago
        Length = 115
        rot = 4
    }
    {
        text = 'KYOTO'
        level = Load_Z_JA
        poster = levelposter_kyoto
        Length = 100
        rot = 2
    }
    {
        text = 'DIE RUINEN'
        level = Load_Z_SV2
        poster = levelposter_ruins
        Length = 130
        rot = 3
    }
    {
        text = 'ATLANTA'
        level = Load_Z_AT
        poster = levelposter_atlanta
        Length = 110
        rot = -2
        collectors_edition_only
    }
    {
        text = 'MARSEILLES'
        level = Load_Z_MS
        poster = levelposter_marseilles
        Length = 160
        rot = -4
        collectors_edition_only
    }
    {
        text = 'EIGENER PARK'
        level = load_sk5ed_gameplay
        poster = levelposter_created
        Length = 185
        rot = 2
        park_ed
    }
]
level_select_menu_classic_level_info = [
    {
        text = 'MINNEAPOLIS'
        level = Load_Z_DN
        poster = levelposter_minneapolis
        Length = 170
        rot = 2
    }
    {
        text = 'SANTA CRUZ'
        level = Load_Z_SZ
        poster = levelposter_santacruz
        Length = 160
        rot = 1
        required_goal_total = 5
    }
    {
        text = 'DIE MALL'
        level = Load_Z_MA
        poster = levelposter_mall
        Length = 110
        rot = 0
        required_goal_total = 12
    }
    {
        text = 'CHICAGO'
        level = Load_Z_CH
        poster = levelposter_chicago
        Length = 115
        rot = 4
        required_goal_total = 18
    }
    {
        text = 'KYOTO'
        level = Load_Z_JA
        poster = levelposter_kyoto
        Length = 100
        rot = 2
        required_goal_total = 25
    }
    {
        text = 'DIE RUINEN'
        level = Load_Z_SV2
        poster = levelposter_ruins
        Length = 130
        rot = 3
        required_goal_total = 31
    }
    {
        text = 'ATLANTA'
        level = Load_Z_AT
        poster = levelposter_atlanta
        Length = 110
        rot = -2
        required_goal_total = 40
        collectors_edition_only
    }
    {
        text = 'MARSEILLES'
        level = Load_Z_MS
        poster = levelposter_marseilles
        Length = 160
        rot = -4
        required_goal_total = 48
        collectors_edition_only
    }
]
premade_parks_info = [
    { name = 'Cool' slot = 1 max = 8 }
    { name = 'Ji Land 5' slot = 2 max = 8 }
    { name = 'Karriere' slot = 3 max = 8 }
    { name = 'Montana' slot = 4 max = 8 }
    { name = 'Hustle Drop' slot = 5 max = 8 exclude_ngc }
    { name = 'Which Way' slot = 6 max = 8 }
    { name = 'Icey' slot = 7 max = 8 }
    { name = 'NSIT' slot = 8 max = 8 exclude_ngc }
    { name = 'Mind The Gap' slot = 9 max = 8 }
]
level_select_last_level_played = load_mainmenu
level_select_focus_target1 = 0
level_select_focus_target2 = 0
globe_target_x = 89.0
globe_target_y = 0.0
globe_target_dot_num = 0
globe_new_target_x = 0.0
globe_state = still
globe_piece_size = 64
globe_interpolation = 0.0
globe_vel = 0
globe_pos = 0.0
globe_idle_frames = 0
level_select_last_gamemode_processed = 0
level_select_last_demoflag_processed = 0
level_select_last_dot_count = 0
level_select_item_current_index = 0
