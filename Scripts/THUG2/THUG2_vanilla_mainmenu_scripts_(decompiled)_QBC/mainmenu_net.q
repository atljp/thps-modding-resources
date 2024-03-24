

script join_chosen 
    if FoundServers
        StopServerList
        SetJoinMode JOIN_MODE_PLAY
        actions_menu_anchor ::DoMorph scale = 0
        DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 1
        DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 1
        build_theme_sub_title title = 'GAME INFO' parent = server_list_anchor
        hide_internet_only_menus keep_chat
        server_desc_menu_anchor ::DoMorph scale = 1
        FireEvent type = unfocus target = actions_menu
        FireEvent type = focus target = server_list_menu
        change current_lobby_focus = 1
        AssignAlias id = server_list_menu alias = current_menu
    endif
endscript


script observe_chosen 
    if FoundServers
        StopServerList
        SetJoinMode JOIN_MODE_OBSERVE
        actions_menu_anchor ::DoMorph scale = 0
        build_theme_sub_title title = 'GAME INFO' parent = server_list_anchor
        hide_internet_only_menus keep_chat
        server_desc_menu_anchor ::DoMorph scale = 1
        FireEvent type = unfocus target = actions_menu
        FireEvent type = focus target = server_list_menu
        change current_lobby_focus = 1
        AssignAlias id = server_list_menu alias = current_menu
    endif
endscript


script user_list_chosen 
    StopServerList
    DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 1
    DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 1
    FireEvent type = unfocus target = actions_menu
    FireEvent type = focus target = lobby_player_list_menu
    change current_lobby_focus = 2
    AssignAlias id = lobby_player_list_menu alias = current_menu
endscript


script refresh_chosen 
    RefreshServerList
    if InInternetMode
        FillPlayerList
    endif
endscript


script refocus_actions_menu 
    FireEvent type = unfocus target = server_list_menu
    FireEvent type = focus target = actions_menu
    change current_lobby_focus = 0
    AssignAlias id = actions_menu alias = current_menu
    build_theme_sub_title title = 'ACTIONS' parent = server_list_anchor
    if InInternetMode
        FireEvent type = unfocus target = lobby_player_list_menu
        DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 0
        DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 0
        DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 0
        DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 0
        DoScreenElementMorph id = player_list_anchor time = 0 scale = 1
        DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1
        if ObjectExists id = console_message_vmenu
            DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
        endif
        DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0
    endif
endscript


script refocus_gamelist_menu 
    SetScreenElementProps id = game_list_up_arrow alpha = 1
    SetScreenElementProps id = game_list_down_arrow alpha = 1
    FireEvent type = unfocus target = server_desc_menu
    FireEvent type = focus target = server_list_menu
endscript


script back_from_internet_options 
    CleanUpTopStats
    StatsLogOff
    ProfileLogOff
    SetNetworkMode
    DestroyScreenElement id = current_menu_anchor
    select_skater_relight_skater
    create_ss_menu
endscript


script create_profile_warning_dialog 
    create_dialog_box {title = 'GameSpy Profile'
        text = 'Would you like to create a GameSpy profile? When logged in with a profile, you can find friends more easily and track high scores.'
        buttons = [{text = 'Yes' pad_choose_script = launch_profile_menu}
            {text = ' No ' pad_choose_script = create_internet_options}
        ]
    }
endscript


script hide_internet_only_menus 
    if InInternetMode
        if NOT GotParam keep_chat
            if ObjectExists id = console_message_vmenu
                DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
            endif
            DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
        endif
        DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
    endif
endscript


script create_internet_options 
    ClearMemcardDataForUpload
    dialog_box_exit
    Skater ::remove_skater_from_world
    KillSkaterCamAnim all
    PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold
    GetPreferenceChecksum pref_type = network profile_warning_shown
    if (<checksum> = boolean_false)
        SetPreferencesFromUI prefs = network field = 'profile_warning_shown' checksum = boolean_true string = 'Yes'
        create_profile_warning_dialog
        return 
    endif
    change in_net_lobby = 0
    change has_accepted_dnas = 1
    make_new_themed_sub_menu title = 'INTERNET OPTIONS' skateshop_pos = (355.0, 78.0)
    SetScreenElementProps {id = sub_menu event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = back_from_internet_options }}
        ]
    }
    theme_menu_add_item {
        text = 'Play Online'
        id = menu_play_online
        pad_choose_script = play_online_chosen
        centered
        focus_script = internet_options_focus
        focus_params = { texture = io_play }
        unfocus_script = internet_options_unfocus
    }
    SetScreenElementProps {
        id = menu_play_online
        event_handlers = [
            {focus PlayHelperDesc params = { play_online_helper_desc }}
            { unfocus StopHelperDesc }
        ]
    }
    if NOT ProfileLoggedIn
        if IsTrue DEMO_BUILD
            theme_menu_add_item {
                text = 'Login/Create Profile'
                id = menu_create_profile
                not_focusable = not_focusable
                centered
            }
        else
            theme_menu_add_item {
                text = 'Login/Create Profile'
                id = menu_create_profile
                pad_choose_script = launch_profile_menu
                centered
                focus_script = internet_options_focus
                focus_params = { texture = io_login }
                unfocus_script = internet_options_unfocus
            }
            SetScreenElementProps {
                id = menu_create_profile
                event_handlers = [
                    {focus PlayHelperDesc params = { login_profile_helper_desc }}
                    { unfocus StopHelperDesc }
                ]
            }
        endif
    else
        theme_menu_add_item {
            text = 'Change GameSpy Login'
            id = menu_create_profile
            pad_choose_script = launch_profile_menu
            centered
            focus_script = internet_options_focus
            focus_params = { texture = io_login }
            unfocus_script = internet_options_unfocus
        }
        SetScreenElementProps {
            id = menu_create_profile
            event_handlers = [
                {focus PlayHelperDesc params = { login_profile_helper_desc }}
                { unfocus StopHelperDesc }
            ]
        }
    endif
    if IsTrue DEMO_BUILD
        theme_menu_add_item {
            text = 'Upload'
            id = menu_upload
            not_focusable = not_focusable
            centered
        }
        theme_menu_add_item {
            text = 'Download'
            id = menu_download
            not_focusable = not_focusable
            centered
            last_menu_item = last_menu_item
        }
    else
        theme_menu_add_item {
            text = 'Save Settings'
            id = menu_save
            pad_choose_script = launch_save_internet_settings
            centered
            focus_script = internet_options_focus
            focus_params = { texture = io_settings }
            unfocus_script = internet_options_unfocus
        }
        SetScreenElementProps {
            id = menu_save
            event_handlers = [
                {focus PlayHelperDesc params = { save_settings_helper_desc }}
                { unfocus StopHelperDesc }
            ]
        }
        theme_menu_add_item {
            text = 'Online Stats'
            id = menu_stats
            pad_choose_script = download_stats
            centered
            focus_script = internet_options_focus
            focus_params = { texture = io_stats }
            unfocus_script = internet_options_unfocus
            last_menu_item = last_menu_item
        }
        SetScreenElementProps {
            id = menu_stats
            event_handlers = [
                {focus PlayHelperDesc params = { online_stats_helper_desc }}
                { unfocus StopHelperDesc }
            ]
        }
    endif
    CreateScreenElement {
        type = spriteElement
        parent = current_menu_anchor
        texture = satellite
        scale = 1
        pos = (55.0, 210.0)
        just = [ center center ]
        rot_angle = -50
        alpha = 0.3000
        rgba = <rgba>
        z_priority = 1
    }
    CreateScreenElement {
        type = spriteElement
        parent = current_menu_anchor
        id = internet_options_icon
        texture = io_play
        scale = 1.500
        pos = (210.0, 275.0)
        just = [ center center ]
        alpha = 0
        rgba = <rgba>
        z_priority = 2
    }
    CreateScreenElement {
        type = spriteElement
        parent = current_menu_anchor
        id = satellite_beam
        texture = satellite_beam
        scale = 3
        pos = (130.0, 130.0)
        just = [ left top ]
        rot_angle = 10
        alpha = 0.1000
        rgba = <rgba>
        z_priority = 1
    }
    CreateScreenElement {
        type = spriteElement
        parent = current_menu_anchor
        id = globe
        texture = globe
        scale = 1.300
        pos = (300.0, 480.0)
        just = [ center center ]
        alpha = 0.4000
        z_priority = 0
    }
    RunScriptOnScreenElement id = globe rotate_internet_options_globe
    finish_themed_sub_menu
endscript


script internet_options_focus 
    SetScreenElementProps id = internet_options_icon texture = <texture>
    main_theme_focus <...> 
    DoScreenElementMorph id = internet_options_icon relative_scale scale = 0 alpha = 0 pos = (130.0, 130.0)
    DoScreenElementMorph id = satellite_beam relative_scale scale = 0 alpha = 0.1000
    DoScreenElementMorph id = internet_options_icon relative_scale scale = 1.100 time = 0.2000 alpha = 1 pos = (210.0, 265.0)
    DoScreenElementMorph id = satellite_beam relative_scale scale = 1 time = 0.2000
    RunScriptOnScreenElement id = satellite_beam satellite_beam_flicker
endscript


script internet_options_unfocus 
    KillSpawnedScript name = satellite_beam_flicker
    DoScreenElementMorph id = internet_options_icon alpha = 0
    DoScreenElementMorph id = satellite_beam alpha = 0
    main_theme_unfocus <...> 
endscript


script satellite_beam_flicker time = 0.05000
    begin 
    DoScreenElementMorph id = satellite_beam alpha = 0.3000 time = <time>
    DoScreenElementMorph id = internet_options_icon alpha = 0.8000 time = <time>
    wait <time> seconds
    DoScreenElementMorph id = satellite_beam alpha = 0.08000 time = <time>
    DoScreenElementMorph id = internet_options_icon alpha = 0.5000 time = <time>
    wait <time> seconds
    repeat 
endscript


script rotate_internet_options_globe time = 60.0 num_rots = 10
    begin 
    DoScreenElementMorph id = globe rot_angle = (360 * <num_rots>)time = (<time> * <num_rots>)
    wait (<time> * <num_rots>)seconds
    DoScreenElementMorph id = globe rot_angle = 0
    wait 1 gameframe
    repeat 
endscript


script get_upload_description 
    
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    create_onscreen_keyboard {allow_cancel
        keyboard_cancel_script = create_internet_options
        keyboard_done_script = upload_content
        type = <type>
        filename = <filename>
        keyboard_title = 'ENTER DESCRIPTION'
        text = ''
        max_length = 50
        text_block
    }
endscript


script upload_content 
    
    if ObjectExists id = keyboard_anchor
        GetTextElementString id = keyboard_current_string
        destroy_onscreen_keyboard
    endif
    GetSummaryInfo <type> VaultData = 1
    if GotParam type
        switch <type>
            case OptionsAndPros
            typename = skaters
            case cat
            typename = tricks
            calculate_cat_score get_values return_it
            case createdgoals
            typename = goals
            case park
            typename = parks
            case CreatedGraphic
            typename = tags
            default 
            
            
            return 
        endswitch
    else
        
        
        return 
    endif
    create_dialog_box {title = 'Uploading file'
        text = 'Starting transfer...'
        buttons = [{text = 'cancel' pad_choose_script = cancel_upload_file}
        ]
    }
    GetMemcardDataForUpload
    UploadFile {description = <string> type = <typename> filename = <filename> score = <score> is_male = <is_male>
        num_goals = <num_edited_goals> num_gaps = <num_gaps> num_pieces = <num_pieces> theme = <theme> tod_script = <tod_script>
        width = <width> length = <length>
    }
endscript


script cancel_upload_file 
    CancelFileTransfer
    net_vault_menu_exit
    dialog_box_exit
    back_from_transfer_dialog
endscript


script LaunchUploadCompleteDialog 
    ClearMemcardDataForUpload
    net_vault_menu_exit
    dialog_box_exit
    create_dialog_box {title = 'Upload Complete'
        text = ''
        buttons = [{text = 'ok' pad_choose_script = back_from_transfer_dialog}
        ]
    }
endscript


script back_from_directory_listing 
    DestroyScreenElement id = current_menu_anchor
    create_internet_options
endscript


script play_online_chosen 
    CleanUpTopStats
    spawn_lobby_list
endscript


script spawn_lobby_list 
    dialog_box_exit
    FireEvent type = unfocus target = sub_menu
    create_dialog_box {title = net_status_msg
        text = 'Connecting to GameSpy...'
        no_bg
        pos = (237.0, 250.0)
    }
    LobbyConnect
endscript


script cancel_lobby_list 
    CancelLobbyConnect
    LobbyDisconnect
    create_internet_options
endscript


script back_from_internet_menu 
    kill_buddy_message_icon
    console_destroy
    LeaveLobby
    StopServerList
    FreeServerList
    LobbyDisconnect
    create_internet_options
endscript


script back_from_network_select_menu 
    SetNetworkMode
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 frame
    endif
    if NOT GotParam no_menu
        launch_ss_menu
    endif
endscript


script disconnect_from_internet 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    DisconnectFromInternet callback = failed_internet_connection
endscript


script maybe_show_disclaimer 
    if IsTrue SignedDisclaimer
        signed_disclaimer
    else
        show_disclaimer
    endif
endscript


script show_disclaimer 
    PauseMusicAndStreams
    Skater ::remove_skater_from_world
    KillSkaterCamAnim all
    PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold
    dialog_box_exit
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    if ScreenElementExists id = disclaimer_anchor
        DestroyScreenElement id = disclaimer_anchor
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        dims = (640.0, 480.0)
        pos = (320.0, 240.0)
        parent = root_window
        id = disclaimer_anchor
        event_handlers = [
            { pad_down disclaimer_scroll_down }
            { pad_up disclaimer_scroll_up }
        ]
    }
    AssignAlias alias = current_menu_anchor id = disclaimer_anchor
    build_top_and_bottom_blocks parent = disclaimer_anchor
    make_mainmenu_3d_plane parent = disclaimer_anchor
    CreateScreenElement {
        type = TextElement
        parent = disclaimer_anchor
        font = small
        text = 'Terms of Use'
        pos = (320.0, 40.0)
        scale = 2.0
        rgba = <on_rgba>
    }
    CreateScreenElement {
        type = spriteElement
        parent = disclaimer_anchor
        id = down_arrow
        texture = down_arrow
        pos = (320.0, 350.0)
        scale = 1.0
        rgba = <off_rgba>
    }
    CreateScreenElement {
        type = hmenu
        parent = disclaimer_anchor
        dims = (300.0, 20.0)
        id = disclaimer_hmenu
        pos = (360.0, 350.0)
        z_priority = 20
        event_handlers = [
            { pad_back back_from_disclaimer }
        ]
    }
    CreateScreenElement {
        type = TextElement
        parent = disclaimer_hmenu
        font = dialog
        text = 'Decline'
        dims = (150.0, 20.0)
        rgba = <off_rgba>
        event_handlers = [
            { focus disclaimer_focus }
            { unfocus disclaimer_unfocus }
            { pad_choose back_from_disclaimer }
        ]
    }
    CreateScreenElement {
        type = TextElement
        parent = disclaimer_hmenu
        font = dialog
        text = 'Accept'
        dims = (150.0, 20.0)
        rgba = [ 50 50 50 50 ]
        event_handlers = [
            { focus disclaimer_focus }
            { unfocus disclaimer_unfocus }
            { pad_choose signed_disclaimer }
        ]
    }
    CreateScreenElement {
        type = spriteElement
        parent = disclaimer_anchor
        id = black_mask
        texture = white2
        scale = (90.0, 5.0)
        pos = (0.0, 335.0)
        rgba = [ 0 0 0 255 ]
        just = [ left top ]
        z_priority = -3
    }
    CreateScreenElement {
        type = Vmenu
        parent = disclaimer_anchor
        id = disclaimer_vmenu
        pos = (150.0, 80.0)
        just = [ left top ]
        internal_just = [ center top ]
        z_priority = -4
        dont_allow_wrap
        padding_scale = 0.7000
    }
    if ((IsPal)& (English))
        <disclaimer_text> = online_disclaimer_english
    else
        <disclaimer_text> = online_disclaimer
    endif
    CreateMultipleTextElements {
        parent = disclaimer_vmenu
        text = <disclaimer_text>
        font = small
        rgba = <off_rgba>
        scale = 1
        width = 500
    }
    create_helper_text helper_text_elements = [{ text = '\b6/\b5 = Select' }
        { text = '\b4 = Scroll' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
    FireEvent type = focus target = disclaimer_hmenu
    FireEvent type = focus target = disclaimer_anchor
    wait 2 gameframes
endscript


script disclaimer_scroll_down 
    GetTags
    GetScreenElementPosition id = disclaimer_vmenu
    if NOT (<ScreenElementPos>.(0.0, 1.0) < -300)
        SetScreenElementProps {
            id = disclaimer_vmenu
            pos = (<ScreenElementPos> + (0.0, -20.0))
        }
    endif
endscript


script disclaimer_scroll_up 
    GetTags
    GetScreenElementPosition id = disclaimer_vmenu
    if NOT (<ScreenElementPos>.(0.0, 1.0) > 60)
        SetScreenElementProps {
            id = disclaimer_vmenu
            pos = (<ScreenElementPos> + (0.0, 20.0))
        }
    endif
endscript


script disclaimer_focus 
    GetTags
    Theme_GetHighlightedTextColor return_value = rgba
    DoScreenElementMorph id = <id> rgba = <rgba> scale = 1.200
endscript


script disclaimer_unfocus 
    GetTags
    DoScreenElementMorph id = <id> rgba = [ 50 50 50 50 ] scale = 1
endscript


script signed_disclaimer 
    if ScreenElementExists id = disclaimer_anchor
        DestroyScreenElement id = disclaimer_anchor
    endif
    change SignedDisclaimer = 1
    chose_internet
endscript


script back_from_disclaimer 
    dialog_box_exit
    if ScreenElementExists id = disclaimer_anchor
        DestroyScreenElement id = disclaimer_anchor
    endif
    create_ss_menu no_animate
endscript

online_disclaimer = [
    'THUG 2 Terms of Use for Online Play:  I have read the Terms of Use for THUG 2 Online Play at www.thug2online.com and I agree to abide by these Terms of Use.'
    ' '
    'This Software uses \'DNAS\' (Dynamic Network Authentication System), a proprietary authentication system created by Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' retrieves information about a user\'s hardware and software for authentication, copy protection, account blocking, system, rules, or game management and other purposes. The information collected does not identify the user personally and will not be shared with any non-SCE company.'
    'A PUBLISHER CAN COMBINE THIS INFORMATION WITH PERSONALLY IDENTIFYING INFORMATION FROM THE PUBLISHER\'S RECORDS IF THE USER PROVIDES THE PERSONALLY IDENTIFYING INFORMATION.  BEFORE PROVIDING ANY PERSONAL INFORMATION TO A PUBLISHER, PLEASE BE SURE TO REVIEW THE PUBLISHER\'S PRIVACY POLICY AND TERMS AND CONDITIONS OF USE.  DO NOT PROVIDE PERSONALLY IDENTIFYING INFORMATION TO A PUBLISHER UNLESS YOU ACCEPT THE CONDITIONS OF USE AND TERMS OF THEIR PRIVACY POLICY.'
    'SCEI, Sony Computer Entertainment America (\'SCEA\') and their affiliates cannot guarantee the continuous operation of the \'DNAS\' servers. SCEA shall not be liable for any delay or failure of the \'DNAS\' servers to perform.  If you receive a message during login identifying a \'DNAS\' authentication error, please contact SCEA Consumer Services at 1-866-466-5333.  For additional information concerning \'DNAS\', visit www.us.playstation.com/DNAS.'
    'In the event of a systems incompatibility or inoperability with DNAS, the sole liability of SCEI, SCEA and their affiliates shall be limited to the repair or replacement of the user\'s affected game software, console or peripherals at the option of SCEA.  SCEA, its parents, affiliates, or licensed Publishers shall not be liable for any delays, system failures, authentication failures, or system outages, which may, from time to time, affect online game play or access thereto.'
]
online_disclaimer_english = [
    'THUG 2 Terms of Use for Online Play:  I have read the Terms of Use for THUG 2 Online Play at www.thug2online.com and I agree to abide by these Terms of Use.'
    ' '
    'This Software uses \'DNAS\' (Dynamic Network Authentication System), a proprietary authentication system created by Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' retrieves information about a user\'s hardware and software for authentication, copy protection, account blocking, system, rules, or game management and other purposes. SCEI, Sony Computer Entertainment Europe (\'SCEE\') and their affiliates cannot guarantee the continuous operation of the \'DNAS\' servers.'
    'SCEE shall not be liable for any delay or failure of the \'DNAS\' servers to perform. If you receive a message during login identifying a \'DNAS\' authentication error, please contact your local PlayStation Customer Care line on the number provided in the software manual. For additional information concerning \'DNAS\', visit PlayStation.com.'
    'In the event of a systems incompatibility or inoperability with DNAS, the sole liability of SCEI, SCEE and their affiliates shall be limited to the repair or replacement of the user\'s affected game software, console or peripherals at the option of SCEE. SCEE, its parents, affiliates, or licensed Publishers shall not be liable for any delays, system failures, authentication failures, or system outages, which may, from time to time, affect online game play or access thereto.'
]

script create_network_select_menu 
    
    make_new_menu menu_id = network_select_menu pos = (227.0, 109.0) vmenu_id = network_select_vmenu menu_title = 'NETWORK' helper_text = generic_helper_text
    kill_start_key_binding
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = SS_MenuCam play_hold
    SetScreenElementProps {id = network_select_vmenu event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = back_from_network_select_menu }}
        ]
    }
    main_menu_add_item {
        text = 'Internet'
        id = menu_network_select_internet
        pad_choose_script = network_select_menu_exit
        pad_choose_params = { callback = show_disclaimer }
    }
    GetPreferenceChecksum pref_type = network device_type
    switch <checksum>
        case device_sony_modem
        case device_usb_modem
        do_nothing
        default 
        main_menu_add_item {
            text = 'LAN'
            id = menu_network_select_lan
            pad_choose_script = network_select_menu_exit
            pad_choose_params = { callback = launch_network_select_lan_games_menu }
        }
    endswitch
    if IsOnline
        GetPreferenceChecksum pref_type = network device_type
        switch <checksum>
            case device_sony_modem
            case device_usb_modem
            main_menu_add_item text = 'Hang Up Modem' id = menu_network_select_hang_up pad_choose_script = disconnect_from_internet
        endswitch
    endif
    RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
    RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript


script network_select_menu_exit 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 frame
    endif
    <callback>
endscript


script make_server_list_menu 
    create_console
    console_unhide
    Skater ::remove_skater_from_world
    KillSkaterCamAnim all
    PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold
    SetScreenElementLock id = root_window Off
    change in_net_lobby = 1
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = server_list_anchor
        pos = (320.0, 240.0)
        dims = (640.0, 480.0)
        just = [ center center ]
        scale = 0
        focusable_child = actions_menu
    }
    build_theme_sub_title title = 'ACTIONS' parent = server_list_anchor
    build_top_and_bottom_blocks parent = server_list_anchor
    make_mainmenu_3d_plane parent = server_list_anchor
    CreateScreenElement {
        type = spriteElement
        parent = server_list_anchor
        id = globe
        texture = globe
        scale = 1.300
        pos = (300.0, 480.0)
        just = [ center center ]
        alpha = 0.4000
        z_priority = 0
    }
    CreateScreenElement {
        type = ContainerElement
        parent = server_list_anchor
        id = actions_menu_anchor
        pos = (320.0, 280.0)
        dims = (640.0, 480.0)
        just = [ center center ]
        internal_just = [ left top ]
    }
    theme_background width = 1 pos = (320.0, 60.0) num_parts = 5 parent = actions_menu_anchor
    CreateScreenElement {
        type = Vmenu
        parent = actions_menu_anchor
        id = actions_menu
        font = small
        just = [ left top ]
        pos = (330.0, 85.0)
        dims = (222.0, 170.0)
        just = [ center top ]
        internal_just = [ center top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_back generic_menu_pad_back_sound }
        ]
    }
    CreateScreenElement {
        type = ContainerElement
        parent = server_list_anchor
        id = game_list_menu_anchor
        dims = (300.0, 300.0)
        pos = (450.0, 100.0)
        just = [ left top ]
    }
    theme_background width = 1.300 pos = (70.0, 0.0) num_parts = 5 parent = game_list_menu_anchor id = bg_box_vmenu2 bg_rgba = [ 80 80 100 100 ]
    CreateScreenElement {
        type = VScrollingMenu
        parent = game_list_menu_anchor
        id = server_list_scrolling_menu
        just = [ left top ]
        pos = (-15.0, 56.0)
        dims = (440.0, 130.0)
    }
    CreateScreenElement {
        type = Vmenu
        parent = server_list_scrolling_menu
        id = server_list_menu
        scale = 0.9000
        pos = (0.0, 0.0)
        dims = (440.0, 300.0)
        just = [ left top ]
        internal_just = [ left top ]
        event_handlers = [
            { pad_up server_blink_up_arrow }
            { pad_down server_blink_down_arrow }
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_back generic_menu_pad_back_sound }
        ]
        dont_allow_wrap
    }
    CreateScreenElement {
        type = TextElement
        parent = game_list_menu_anchor
        font = testtitle
        text = 'GAMES'
        scale = 1.300
        pos = (0.0, 10.0)
        just = [ left top ]
        not_focusable
        z_priority = 4
    }
    CreateScreenElement {
        type = spriteElement
        parent = game_list_menu_anchor
        texture = white2
        rgba = [ 0 0 0 128 ]
        scale = (25.100000381469727, 4.0)
        pos = (-30.0, 10.0)
        just = [ left top ]
        not_focusable
        z_priority = 3
    }
    CreateScreenElement {
        type = TextElement
        parent = game_list_menu_anchor
        id = lobby_game_list_title
        font = dialog
        text = ': 0'
        scale = 1.0
        pos = (100.0, 14.0)
        just = [ left top ]
        not_focusable
        z_priority = 4
    }
    CreateScreenElement {
        type = spriteElement
        parent = game_list_menu_anchor
        id = game_list_up_arrow
        texture = up_arrow
        just = [ left top ]
        pos = (140.0, 15.0)
        not_focusable
        scale = 0
        z_priority = 4
    }
    CreateScreenElement {
        type = spriteElement
        parent = game_list_menu_anchor
        id = game_list_down_arrow
        texture = down_arrow
        just = [ left top ]
        pos = (140.0, 155.0)
        not_focusable
        scale = 0
    }
    CreateScreenElement {
        type = ContainerElement
        parent = server_list_anchor
        id = server_desc_menu_anchor
        scale = 0
        pos = (320.0, 280.0)
        dims = (640.0, 480.0)
        just = [ center center ]
        internal_just = [ left top ]
    }
    theme_background width = 1 pos = (320.0, 60.0) num_parts = 5 parent = server_desc_menu_anchor id = bg_box_vmenu4
    theme_background width = 1 pos = (130.0, 60.0) num_parts = 5 parent = server_desc_menu_anchor id = bg_box_vmenu5
    CreateScreenElement {
        type = TextElement
        parent = server_desc_menu_anchor
        font = testtitle
        text = 'PLAYERS'
        scale = 1.200
        pos = (45.0, 68.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = server_desc_menu_anchor
        id = server_desc_player_number
        font = dialog
        text = ': 0/0'
        scale = 1.0
        pos = (170.0, 65.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = Vmenu
        parent = server_desc_menu_anchor
        id = server_desc_menu
        pos = (320.0, 70.0)
        dims = (200.0, 170.0)
        scale = 0.9000
        just = [ left top ]
        internal_just = [ left top ]
        not_focusable
    }
    CreateScreenElement {
        type = Vmenu
        parent = server_desc_menu_anchor
        id = server_player_menu
        pos = (50.0, 110.0)
        dims = (200.0, 100.0)
        scale = 0.8000
        just = [ left top ]
        internal_just = [ left top ]
        not_focusable
    }
    if InInternetMode
        CreateScreenElement {
            type = spriteElement
            parent = game_list_menu_anchor
            z_priority = 100
            pos = (-320.0, -20.0)
            texture = gslogo scale = 1.100
            alpha = 1
        }
        CreateScreenElement {
            type = ContainerElement
            parent = server_list_anchor
            id = player_list_anchor
            dims = (300.0, 300.0)
            pos = (50.0, 100.0)
            just = [ left top ]
            internal_just = [ left top ]
        }
        theme_background width = 1 pos = (80.0, 0.0) num_parts = 5 parent = player_list_anchor id = bg_box_vmenu3 bg_rgba = [ 80 80 100 100 ]
        CreateScreenElement {
            type = VScrollingMenu
            parent = player_list_anchor
            id = player_list_scrolling_menu
            pos = (0.0, 55.0)
            dims = (200.0, 110.0)
            just = [ left top ]
        }
        CreateScreenElement {
            type = Vmenu
            parent = player_list_scrolling_menu
            id = lobby_player_list_menu
            pos = (0.0, 0.0)
            dims = (200.0, 0.0)
            just = [ left top ]
            internal_just = [ left top ]
            scale = 0.8000
            event_handlers = [
                { pad_up user_blink_up_arrow }
                { pad_down user_blink_down_arrow }
                {pad_up generic_menu_up_or_down_sound params = { up }}
                {pad_down generic_menu_up_or_down_sound params = { down }}
                { pad_back generic_menu_pad_back_sound }
            ]
            dont_allow_wrap
        }
        CreateScreenElement {
            type = TextElement
            parent = player_list_anchor
            font = testtitle
            text = 'USERS'
            scale = 1.300
            pos = (20.0, 10.0)
            just = [ left top ]
            z_priority = 5
            not_focusable
        }
        CreateScreenElement {
            type = spriteElement
            parent = player_list_anchor
            texture = white2
            rgba = [ 0 0 0 128 ]
            scale = (22.799999237060547, 4.0)
            pos = (-11.0, 10.0)
            just = [ left top ]
            z_priority = 4
            not_focusable
        }
        CreateScreenElement {
            type = TextElement
            parent = player_list_anchor
            id = lobby_player_list_title
            font = dialog
            text = ': 0'
            scale = 1.0
            pos = (115.0, 14.0)
            just = [ left top ]
            z_priority = 5
            not_focusable
        }
        CreateScreenElement {
            type = spriteElement
            parent = player_list_anchor
            id = user_list_up_arrow
            texture = up_arrow
            just = [ left top ]
            pos = (-5.0, 17.0)
            not_focusable
            scale = 0
            z_priority = 5
        }
        CreateScreenElement {
            type = spriteElement
            parent = player_list_anchor
            id = user_list_down_arrow
            texture = down_arrow
            just = [ left top ]
            pos = (-5.0, 155.0)
            not_focusable
            scale = 0
        }
        GetStackedScreenElementPos X id = <id> offset = (-114.0, 90.0)
        CreateScreenElement {
            type = ContainerElement
            parent = server_list_anchor
            id = buddy_list_anchor
            dims = (640.0, 480.0)
            pos = <pos>
            scale = 0
        }
        CreateScreenElement {
            type = ContainerElement
            parent = server_list_anchor
            id = chat_box_anchor
            dims = (640.0, 480.0)
            pos = (320.0, 240.0)
            just = [ center center ]
        }
        CreateScreenElement {
            type = spriteElement
            parent = chat_box_anchor
            texture = chat_bracket
            just = [ left top ]
            pos = (30.0, 220.0)
            scale = (1.399999976158142, 2.4000000953674316)
        }
    endif
    RunScriptOnScreenElement id = globe rotate_internet_options_globe
    if InInternetMode
        DoScreenElementMorph id = player_list_anchor time = 0 scale = 1
        FillPlayerList
        FireEvent type = unfocus target = lobby_player_list_menu
        DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1
        DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0
    endif
    AssignAlias id = server_list_anchor alias = current_menu_anchor
    AssignAlias id = actions_menu alias = current_menu
endscript


script server_list_menu_add_item 
    
    if ObjectExists id = server_list_menu
        highlight_bar_scale = (1.7999999523162842, 0.6000000238418579)
        highlight_bar_pos = (96.0, -6.0)
        focus_script = server_list_focus
        <server_id> = <id>
        SetScreenElementLock id = server_list_menu Off
        FormatText ChecksumName = mode_name <mode>
        FormatText ChecksumName = mode_attack 'Trick Attack'
        FormatText ChecksumName = mode_score 'Score Challenge'
        FormatText ChecksumName = mode_mambo 'Combo Mambo'
        FormatText ChecksumName = mode_slap 'Slap!'
        FormatText ChecksumName = mode_koth 'King of the Hill'
        FormatText ChecksumName = mode_graffiti 'Graffiti'
        FormatText ChecksumName = mode_goal 'Goal Attack'
        FormatText ChecksumName = mode_ctf 'Capture the Flag'
        FormatText ChecksumName = mode_fire 'FireFight'
        FormatText ChecksumName = mode_elim 'Elimiskate'
        FormatText ChecksumName = mode_hunt 'Scavenger Hunt'
        CreateScreenElement {
            type = ContainerElement
            parent = server_list_menu
            id = <server_id>
            dims = (200.0, 20.0)
            event_handlers = [{focus server_list_focus params = { id = <server_id> }}
                { unfocus server_list_unfocus }
                {pad_choose choose_selected_server params = { id = <server_id> }}
            ]
            replace_handlers
        }
        <anchor_id> = <id>
        Theme_GetUnhighlightedTextColor return_value = text_rgba
        Theme_GetIconOnColor return_value = icon_rgba
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            font = small
            text = <text>
            scale = 1.0
            pos = (10.0, -5.0)
            just = [ left center ]
            rgba = <text_rgba>
        }
        <text_id> = <id>
        truncate_string id = <text_id> max_width = 200
        switch <mode_name>
            case <mode_attack>
            FormatText ChecksumName = gametype_icon '2p_attack'
            case <mode_score>
            FormatText ChecksumName = gametype_icon '2p_score'
            case <mode_mambo>
            FormatText ChecksumName = gametype_icon '2p_mambo'
            case <mode_slap>
            FormatText ChecksumName = gametype_icon '2p_slap'
            case <mode_koth>
            FormatText ChecksumName = gametype_icon '2p_koth'
            case <mode_graffiti>
            FormatText ChecksumName = gametype_icon '2p_graffiti'
            case <mode_goal>
            FormatText ChecksumName = gametype_icon '2p_goal'
            case <mode_ctf>
            FormatText ChecksumName = gametype_icon '2p_flag'
            case <mode_fire>
            FormatText ChecksumName = gametype_icon '2p_fire'
            case <mode_elim>
            FormatText ChecksumName = gametype_icon '2p_elim'
            case <mode_hunt>
            FormatText ChecksumName = gametype_icon '2p_hunt'
            default 
            FormatText ChecksumName = gametype_icon '2p_free'
        endswitch
        Theme_GetHighlightBarColor return_value = bar_rgba
        CreateScreenElement {
            type = spriteElement
            parent = <anchor_id>
            texture = de_highlight_bar
            pos = <highlight_bar_pos>
            scale = <highlight_bar_scale>
            just = [ center center ]
            rgba = <bar_rgba>
            alpha = 0
            z_priority = 3
        }
        CreateScreenElement {
            type = spriteElement
            parent = <text_id>
            rgba = <icon_rgba>
            texture = <gametype_icon>
            scale = 0.7000
            pos = (-14.0, 10.0)
            just = [ center center ]
        }
        SetScreenElementLock id = server_list_menu on
        update_lobby_server_list
    endif
endscript


script player_list_add_item rank = 1
    if ObjectExists id = <id>
        return 
    endif
    if ObjectExists id = lobby_player_list_menu
        SetScreenElementLock id = lobby_player_list_menu Off
        main_menu_add_item {
            parent = lobby_player_list_menu
            highlight_bar_scale = (1.7999999523162842, 0.6000000238418579)
            highlight_bar_pos = (97.0, -6.0)
            text_just = [ left center ]
            text_pos = (35.0, -5.0)
            pad_choose_script = <pad_choose_script>
            pad_choose_params = <pad_choose_params>
            focus_script = player_list_focus
            unfocus_script = player_list_unfocus
            text = <text>
            id = <id>
        }
        FormatText ChecksumName = rank_texture 'rank_%i' i = <rank>
        CreateScreenElement {
            type = spriteElement
            parent = <id>
            texture = <rank_texture>
            scale = 0.7000
            alpha = 0.8000
            pos = (10.0, -3.0)
        }
        SetScreenElementLock id = lobby_player_list_menu on
        update_lobby_player_list
    endif
endscript


script player_list_focus 
    GetTags
    main_menu_focus
    RunScriptOnScreenElement id = <id> theme_highlight_sweep
endscript


script player_list_unfocus 
    GetTags
    main_menu_unfocus
    kill_theme_highlight_sweep id = <id>
endscript


script player_list_update_rank 
    if ScreenElementExists id = <id>
        if GotParam rank
            FormatText ChecksumName = rank_icon 'rank_%i' i = <rank>
            SetScreenElementProps id = {<id> child = 2}texture = <rank_icon>
        endif
    endif
endscript


script net_game_info_add_item parent = server_desc_menu dims = (300.0, 16.0)
    if ObjectExists id = <parent>
        Theme_GetUnhighlightedTextColor return_value = rgba
        SetScreenElementLock id = <parent> Off
        if GotParam value
            dims = (300.0, 32.0)
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            dims = <dims>
        }
        anchor_id = <id>
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            text = <name>
            font = small
            just = [ center top ]
            pos = (0.0, 0.0)
            rgba = <rgba>
        }
        if GotParam value
            CreateScreenElement {
                type = spriteElement
                parent = <anchor_id>
                texture = white2
                just = [ center top ]
                pos = (0.0, 18.0)
                scale = (26.0, 2.25)
                rgba = [ 0 0 0 80 ]
            }
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id>
                text = <value>
                font = dialog
                just = [ center top ]
                pos = (0.0, 15.0)
            }
        endif
    endif
endscript


script net_game_info_add_player rank = 1
    if ObjectExists id = server_player_menu
        FormatText ChecksumName = id '%a%b' a = <name> b = <value>
        SetScreenElementLock id = server_player_menu Off
        if ScreenElementExists id = <id>
            DestroyScreenElement id = <id>
        endif
        main_menu_add_item {
            parent = server_player_menu
            text = <value>
            highlight_bar_scale = (1.7999999523162842, 0.6000000238418579)
            highlight_bar_pos = (97.0, -6.0)
            <...> 
        }
        if ((<rank> < 0)|| (<rank> > 10))
            <rank> = 0
        endif
        FormatText ChecksumName = rank_texture 'rank_%i' i = <rank>
        CreateScreenElement {
            type = spriteElement
            parent = <id>
            texture = <rank_texture>
            scale = 0.7000
            alpha = 0.8000
            pos = (10.0, -3.0)
        }
    endif
endscript


script net_game_info_update_player_title 
    SetScreenElementProps id = server_desc_player_number text = <text>
endscript


script update_lobby_player_list 
    if ScreenElementExists id = lobby_player_list_menu
        if NOT (current_lobby_focus = 2)
            if ScreenElementExists id = lobby_player_list_title
                NumPlayersInLobby
                FormatText textname = title_text ': %n' n = <num_players>
                SetScreenElementProps id = lobby_player_list_title text = <title_text>
            endif
            SetScreenElementProps id = player_list_scrolling_menu reset_window_top
        endif
    endif
endscript


script update_lobby_server_list 
    
    if ScreenElementExists id = server_list_menu
        if NOT (current_lobby_focus = 1)
            if ScreenElementExists id = lobby_game_list_title
                NumServersInLobby
                FormatText textname = title_text ': %n' n = <num_servers>
                SetScreenElementProps id = lobby_game_list_title text = <title_text>
            endif
            SetScreenElementProps id = server_list_scrolling_menu reset_window_top
        endif
    endif
endscript


script server_list_focus 
    generic_menu_update_arrows menu_id = server_list_menu up_arrow_id = game_list_up_arrow down_arrow_id = game_list_down_arrow
    main_menu_focus
    RunScriptOnScreenElement id = <id> theme_highlight_sweep
    if RetrieveServerInfo <...> 
        describe_selected_server <...> 
    endif
endscript


script server_list_unfocus 
    GetTags
    kill_theme_highlight_sweep id = <id>
    main_menu_unfocus
endscript


script user_blink_up_arrow 
    RunScriptOnScreenElement id = user_list_up_arrow menu_blink_arrow
endscript


script user_blink_down_arrow 
    RunScriptOnScreenElement id = user_list_down_arrow menu_blink_arrow
endscript


script server_blink_up_arrow 
    RunScriptOnScreenElement id = game_list_up_arrow menu_blink_arrow
endscript


script server_blink_down_arrow 
    RunScriptOnScreenElement id = game_list_down_arrow menu_blink_arrow
endscript


script back_from_game_list 
    actions_menu_anchor ::DoMorph scale = 1
    server_desc_menu_anchor ::DoMorph scale = 0
    destroy_server_desc_children
    refocus_actions_menu
endscript


script back_from_user_list 
    actions_menu_anchor ::DoMorph scale = 1
    refocus_actions_menu
endscript


script back_from_buddy_list 
    actions_menu_anchor ::DoMorph scale = 1
    refocus_actions_menu
endscript

already_tried = 0

script create_network_select_games_menu 
    if IsInternetGameHost
        if (already_tried = 1)
            QuitGame
            return 
        endif
    endif
    if IsJoiningInternetGame
        if (already_tried = 1)
            if NOT TryJoinServerIPSuccess
                QuitGame
                return 
            endif
        endif
    endif
    change already_tried = 1
    KillSkaterCamAnim all
    Skater ::reset_model_lights
    Skater ::remove_skater_from_world
    KillSkaterCamAnim all
    PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold
    if GotParam play_cam
        PlaySkaterCamAnim name = SS_MenuCam play_hold
    endif
    dialog_box_exit
    make_server_list_menu
    create_helper_text generic_helper_text pos = (0.0, 0.0)
    if NOT OnXbox
        SetNetworkMode LAN_MODE
    endif
    if IsInternetGameHost
        host_net_chosen
    else
        if IsXbox
            if ProfileLoggedIn
                if AnyBuddyMessagesLeft
                    flash_buddy_message_icon
                endif
            endif
        endif
        if InInternetMode
            SetScreenElementProps {id = actions_menu event_handlers = [
                    {pad_back generic_menu_pad_back params = { callback = back_from_internet_menu }}
                ]
            }
            SetScreenElementProps {id = lobby_player_list_menu event_handlers = [
                    {pad_back generic_menu_pad_back params = { callback = back_from_user_list }}
                ]
            }
        else
            if NOT OnXbox
                SetScreenElementProps {id = actions_menu event_handlers = [
                        {pad_back generic_menu_pad_back params = { callback = back_from_multiplayer_menu }}
                    ]
                }
            else
                SetScreenElementProps {id = actions_menu event_handlers = [
                        {pad_back generic_menu_pad_back params = { callback = back_from_network_menu }}
                    ]
                }
            endif
        endif
        SetScreenElementProps {id = server_list_menu event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = back_from_game_list }}
            ]
        }
        highlight_bar_scale = (1.5, 0.6000000238418579)
        if InInternetMode
            if CanHostGame
                theme_menu_add_item text = ' Host Game' parent = actions_menu no_bg centered id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            else
                theme_menu_add_item text = ' Host Game' parent = actions_menu no_bg centered id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> not_focusable
            endif
        else
            theme_menu_add_item text = ' Host Game' parent = actions_menu no_bg centered id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale>
        endif
        if InInternetMode
            theme_menu_add_item text = ' Join Game' parent = actions_menu no_bg centered id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            theme_menu_add_item text = ' Observe Game' parent = actions_menu no_bg centered id = menu_network_select_observe pad_choose_script = observe_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            theme_menu_add_item text = ' Refresh' parent = actions_menu no_bg centered id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
        else
            theme_menu_add_item text = ' Join Game' parent = actions_menu no_bg centered id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = <highlight_bar_scale>
            theme_menu_add_item text = ' Refresh' parent = actions_menu no_bg centered id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = <highlight_bar_scale>
        endif
        if InInternetMode
            theme_menu_add_item text = ' User List' parent = actions_menu no_bg centered id = menu_network_select_user_list pad_choose_script = user_list_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            if ProfileLoggedIn
                pad_choose = launch_homie_list
            else
                pad_choose = no_profile_homie_list_prompt
            endif
            theme_menu_add_item text = ' Homie List' parent = actions_menu no_bg centered id = menu_network_select_buddy_list pad_choose_script = <pad_choose> pad_choose_params = { from_lobby }highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            theme_menu_add_item text = ' Enter Chat Message' parent = actions_menu no_bg centered id = fmenu_network_select_chat pad_choose_script = create_lobby_onscreen_kb highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            if ProfileLoggedIn
                theme_menu_add_item text = ' View Messages' parent = actions_menu no_bg centered id = menu_network_select_view pad_choose_script = view_buddy_messages highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus
            endif
        endif
        add_no_servers_found_message refocus
        RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
        SetScreenElementLock id = current_menu_anchor Off
        create_helper_text generic_helper_text
        SetScreenElementLock id = current_menu_anchor on
        FireEvent type = unfocus target = server_list_menu
        FireEvent type = unfocus target = server_desc_menu
        if InInternetMode
            FireEvent type = unfocus target = lobby_player_list_menu
        endif
        FireEvent type = focus target = actions_menu
        change current_lobby_focus = 0
        AssignAlias id = actions_menu alias = current_menu
        change check_for_unplugged_controllers = 1
        if GotParam focus_on_enter_message
            RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus
        endif
        if NOT TryJoinServerIPSuccess
            if IsJoiningInternetGame
                check_join_internet_ip
                return 
            endif
            RefreshServerList force_refresh
        endif
        change check_for_unplugged_controllers = 1
        if GotParam focus_on_enter_message
            RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus
        endif
        if TryJoinServerIPSuccess
            ForceServerListRefresh
            join_chosen
            GetScreenElementProps id = { server_list_menu child = 0 }
            FireEvent type = pad_choose target = <id>
        endif
    endif
endscript


script set_enter_message_focus 
    menu_onscreen <...> 
    FireEvent type = unfocus target = actions_menu
    FireEvent type = focus target = actions_menu data = { child_id = menu_network_select_chat }
endscript


script back_to_server_list_from_buddy_list 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    create_network_select_games_menu
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
    endif
endscript


script create_remove_players_menu 
    make_new_menu menu_id = remove_players_menu vmenu_id = remove_players_vmenu menu_title = 'REMOVE WHICH PLAYER?'
    SetScreenElementProps {id = remove_players_menu event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_pause_menu }}
        ]
    }
    FillRemovePlayersMenu
    RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript


script create_xbox_online_menu 
    make_new_menu menu_id = xbox_online_menu vmenu_id = xbox_online_vmenu menu_title = 'THUG 2 ONLINE'
    SetScreenElementProps {id = xbox_online_menu event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_pause_menu }}
        ]
    }
    make_text_sub_menu_item text = 'Play Live' id = menu_xonline_play_live pad_choose_script = do_nothing
    make_text_sub_menu_item text = 'Friends' id = menu_xonline_friends pad_choose_script = launch_buddy_list
    make_text_sub_menu_item text = 'Sign Out' id = menu_xonline_sign_out pad_choose_script = sign_out
    make_text_sub_menu_item text = 'Free More Space' id = menu_xonline_dashboard pad_choose_script = go_to_xbox_dashboard
    RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript


script create_profile_menu 
    Theme_GetHighlightedTextColor return_value = rgba
    build_top_and_bottom_blocks
    make_mainmenu_3d_plane
    SetScreenElementLock id = menu_parts_anchor Off
    CreateScreenElement {
        type = ContainerElement
        parent = menu_parts_anchor
        id = profile_options_anchor
        pos = (-5.0, 800.0)
    }
    make_new_menu {menu_id = profile_options_menu
        vmenu_id = profile_options_vmenu
        parent = profile_options_anchor
        pos = (80.0, 85.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = profile_options_anchor
        font = testtitle
        text = 'LOGIN/PROFILE'
        scale = 1.500
        pos = (65.0, 86.0)
        just = [ left top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
    }
    CreateScreenElement {
        type = spriteElement
        parent = profile_options_anchor
        texture = white2
        scale = (32.5, 5.0)
        pos = (39.0, 82.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        not_focusable
    }
    SetScreenElementProps {id = profile_options_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_profile_options }}]}
    profile_options_add_item text = '' not_focusable = not_focusable
    GetPreferenceString pref_type = network profile_email
    profile_options_add_item text = 'Email Address' id = network_profile_email pad_choose_script = launch_email_keyboard pad_choose_params = {field = 'profile_email' text = <ui_string> title = 'EMAIL ADDRESS' min_length = 1 max_length = 50}
    profile_options_add_item text = <ui_string> id = network_profile_email_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width scale = 0.7400
    GetPreferenceString pref_type = network profile_password
    GetPreferencePassword pref_type = network profile_password
    profile_options_add_item text = 'Password' id = network_profile_password pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = {field = 'profile_password' text = <ui_string> title = 'PROFILE PASSWORD' min_length = 1 max_length = 10 password}
    profile_options_add_item text = <password_string> id = network_profile_password_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width
    GetPreferenceString pref_type = network profile_password_confirm
    GetPreferencePassword pref_type = network profile_password_confirm
    profile_options_add_item text = 'Confirm Password' id = network_profile_password_confirm pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = {field = 'profile_password_confirm' text = <ui_string> title = 'CONFIRM PASSWORD' min_length = 1 max_length = 10 password}
    profile_options_add_item text = <password_string> id = network_profile_password_confirm_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width
    GetPreferenceString pref_type = network profile_email
    if (<ui_string> = '')
        profile_options_add_item text = 'Login/Create' id = network_profile_create pad_choose_script = profile_options_confirm_messagebox not_focusable last_menu_item = last_menu_item
    else
        GetPreferenceString pref_type = network profile_password
        if (<ui_string> = '')
            profile_options_add_item text = 'Login/Create' id = network_profile_create pad_choose_script = profile_options_confirm_messagebox not_focusable last_menu_item = last_menu_item
        else
            pw_string = <ui_string>
            GetPreferenceString pref_type = network profile_password_confirm
            if (<pw_string> = <ui_string>)
                profile_options_add_item text = 'Login/Create' id = network_profile_create pad_choose_script = profile_options_confirm_messagebox last_menu_item = last_menu_item
            else
                profile_options_add_item text = 'Login/Create' id = network_profile_create pad_choose_script = profile_options_confirm_messagebox not_focusable last_menu_item = last_menu_item
            endif
        endif
    endif
    CreateScreenElement {
        type = spriteElement
        parent = profile_options_anchor
        z_priority = 100
        pos = (132.0, 68.0)
        texture = gslogo scale = 1.100
        alpha = 1
    }
    RunScriptOnScreenElement lobby_list_animate_in id = profile_options_anchor params = { id = profile_options_anchor }
    FireEvent type = unfocus target = sub_menu
    FireEvent type = focus target = profile_options_menu
    AssignAlias id = menu_parts_anchor alias = current_menu_anchor
endscript


script profile_options_add_item 
    theme_menu_add_item {parent = profile_options_vmenu centered <...> menu = 2}
endscript


script launch_onscreen_keyboard_from_profile_menu 
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_onscreen_keyboard callback_params = {allow_cancel in_profile_options keyboard_cancel_script = profile_setup_back_from_keyboard keyboard_done_script = set_profile_setting keyboard_title = <title> <...> }
endscript


script profile_options_confirm_messagebox 
    FireEvent type = unfocus target = profile_options_menu
    create_snazzy_dialog_box {
        title = 'Warning!'
        text = 'You are about to send this information over the network. Are you sure?'
        text_dims = (400.0, 0.0)
        no_bg
        buttons = [{font = small text = 'No'
                pad_choose_script = profile_options_confirm_messagebox_no
            }
            {font = small text = 'Yes'
                pad_choose_script = profile_options_confirm_messagebox_yes
            }
        ]
    }
endscript


script profile_options_confirm_messagebox_yes 
    dialog_box_exit no_pad_start
    create_profile
endscript


script profile_options_confirm_messagebox_no 
    dialog_box_exit no_pad_start
    FireEvent type = focus target = profile_options_menu
endscript


script profile_setup_back_from_keyboard 
    destroy_onscreen_keyboard
    launch_profile_menu
endscript


script set_profile_setting 
    GetTextElementString id = keyboard_current_string
    SetPreferencesFromUI prefs = network <...> 
    destroy_onscreen_keyboard
    launch_profile_menu
endscript


script create_profile 
    DestroyScreenElement id = current_menu_anchor
    CreateProfile
    create_dialog_box {title = net_status_msg
        text = 'Please Wait...'
        no_animate
    }
endscript


script log_in_profile 
    dialog_box_exit
    create_dialog_box {title = net_status_msg
        text = 'Logging in...'
        no_animate
    }
endscript


script stats_log_in_profile 
    dialog_box_exit
    create_dialog_box {title = net_status_msg
        text = 'Connecting to stats server...'
        no_animate
    }
endscript


script back_to_profile_menu 
    dialog_box_exit
    launch_profile_menu
endscript


script create_wrong_profile_password_dialog 
    dialog_box_exit
    create_dialog_box {title = 'WRONG PASSWORD'
        text = 'The password you have entered is invalid for this account.'
        buttons = [{text = 'ok' pad_choose_script = back_to_profile_menu}
        ]
    }
endscript


script profile_logged_in 
    
    SetPreferencesFromUI prefs = network field = 'profile_success' string = 'Yes' checksum = boolean_true
    dialog_box_exit
    StatsLogIn
endscript


script stats_logged_in 
    dialog_box_exit
    create_dialog_box {title = net_status_msg
        text = 'Retrieving stats...'
        no_animate
    }
    RetrievePersonalStats
endscript


script stats_retrieved 
    dialog_box_exit
    create_internet_options
endscript


script no_profile_homie_list_prompt 
    FireEvent type = unfocus target = actions_menu
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
    endif
    FormatText textname = msg_text 'Cannot access homie list without logging into GameSpy first.'
    create_dialog_box {title = 'PLAYER NOT LOGGED IN'
        text = <msg_text>
        buttons = [{text = 'ok' pad_choose_script = cancel_view_homies}
        ]
        text_dims = (260.0, 0.0)
        no_bg = no_bg
    }
endscript


script cancel_view_homies 
    dialog_box_exit
    FireEvent type = focus target = actions_menu
    SetScreenElementLock id = server_list_anchor Off
    create_helper_text generic_helper_text
    SetScreenElementLock id = server_list_anchor on
endscript


script lobby_remove_buddy 
    RemoveBuddy <...> 
    FillBuddyList clear_list allow_remove
    launch_homie_list
endscript


script select_network_play_multi 
    dialog_box_exit
    if GotParam change_gamemode
        <change_gamemode>
    endif
    change cas_cam_angle = 0
    cas_setup_rotating_camera cam_anim = story_mode_menu
    make_new_roundbar_menu {pos = (130.0, 100.0) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu }vmenu_id = multiplayer_options_vmenu}
    build_theme_sub_title title = 'MULTIPLAYER'
    add_roundbar_menu_item {
        text = ('Network Play')
        id = mm_multi_play
        pad_choose_script = gamemode_options_menu_exit
        pad_choose_params = {
            new_menu_script = select_xbox_multiplayer
            change_gamemode = change_gamemode_net
        }
    }
    add_roundbar_menu_item {
        text = ('Online Play')
        id = mm_net_play
        pad_choose_script = gamemode_options_menu_exit
        pad_choose_params = {
            new_menu_script = select_network_play
            change_gamemode = change_gamemode_net
        }
    }
    roundbar_menu_finish build_pause_parts = 0
endscript


script select_network_play 
    change network_connection_type = internet
    change_gamemode_net
    GoalManager_SetDifficultyLevel 1
    UseNetworkPreferences
    net_setup_from_net_play_successful
endscript


script create_network_menu_exit 
    console_hide
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    <new_menu_script> <...> 
endscript

