xboxlive_shown_esrb_logo = 0
xboxlive_pulled_the_old_switcheroo = 0
xboxlive_num_results = 0
xbox_live_menu_with_options_button = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
        { text = '\b0 = Xbox Live-Optionen' }
    ]
    additional_event_handlers = [
        { pad_space xboxlive_menu_options_push }
    ]
}
xbox360_live_menu_with_options_button = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
xbox_live_menu_with_feedback = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = Feedback' }
    ]
}

script xbox_live_start_quickmatch 
    NetSessionFunc obj = match func = stop_server_list
    NetSessionFunc obj = match func = free_server_list
    if GotParam ranked
        SetPreferencesFromUI {prefs = network field = 'ranked' string = 'Ranked' checksum = ranked num = 0}
    else
        SetPreferencesFromUI {prefs = network field = 'ranked' string = 'Standard' checksum = standard num = 1}
    endif
    NetSessionFunc obj = match func = set_server_list_mode params = { quickmatch }
    NetSessionFunc obj = match func = start_server_list
    menu_stack_push menu_script = xbox_live_launch_session_find_dialog
endscript

script xbox_live_launch_session_find_dialog 
    xboxlive_dialog_box \{Title = "Xbox Live" text = "Suche Sitzung ..." buttons = [{ text = 'Zurück' pad_choose_script = xboxlive_menu_search_cancel }] no_bg}
endscript

script xbox_live_start_optimatch 
    printf \{ 'xbox_live_start --- %d' d = UseSessionAPI }
    NetSessionFunc \{ obj = match func = stop_server_list }
    NetSessionFunc \{ obj = match func = free_server_list }
    NetSessionFunc \{obj = match func = set_server_list_mode params = { optimatch }}
    NetSessionFunc \{ obj = match func = start_server_list }
endscript

script xboxlive_host_game 
    menu_stack_clear
    chosen_host_game
endscript

script xboxlive_dialog_box 
    create_snazzy_dialog_box {
        Pos = (322.0, 240.0)
        destroy_on_event = 0
        <...> 
    }
endscript

script xboxlive_dialog_box_exit 
    dialog_box_exit \{ no_pad_start }
endscript

script xboxlive_menus_active 
    if menu_stack_can_pop_menu
        return \{ true }
    endif
    if InFrontend
        if GameModeEquals \{ is_net }
            <special_case_net_flow_dialogs> = [
                select_skater_anchor
                select_skater_ready_anchor
                edit_tricks_sub_menu_anchor
                edit_tricks_pre_menu
            ]
            GetArraySize \{ special_case_net_flow_dialogs }
            <i> = 0
            begin 
            if ScreenElementExists id = (<special_case_net_flow_dialogs> [ <i> ])
                return \{ true }
            endif
            <i> = (<i> + 1)
            repeat <array_size>
        endif
    endif
    return \{ false }
endscript

script xboxlive_lost_connection_ui_cleanup 
    rv = false
    if xboxlive_menus_active
        rv = true
    endif
    menu_stack_clear
    xboxlive_logon_status_kill
    xboxlive_menu_notify_kill
    xboxlive_menu_friends_close
    KillSpawnedScript name = async_update_friends_list
    KillSpawnedScript name = xboxlive_menu_async_retrieve_message
    KillSpawnedScript name = async_check_for_any_accounts
    KillSpawnedScript name = async_check_for_changed_accounts
    change xboxlive_shown_esrb_logo = 0
    if ChecksumEquals a = <rv> b = true
        xboxlive_voice_attachment_finished
        xboxlive_menu_friends_close
        xboxlive_dialog_box_exit
        menus = [
            create_menu
            optimatch_menu
            current_menu_anchor
        ]
        GetArraySize menus
        i = 0
        begin 
        kill_panel_message_if_it_exists id = (<menus> [ <i> ])
        i = (<i> + 1)
        repeat <array_size>
        if InFrontend
            xboxlive_restore_cagr_info
            create_main_menu
        else
            if GameModeEquals is_cat
                create_pre_cat_menu
            else
                create_pause_menu
            endif
        endif
    endif
    return <rv>
endscript

script launch_xbox_live 
    printf '*** script: launch_xbox_live ***'
    SetNetworkMode INTERNET_MODE
    NetSessionFunc func = voice_uninit
    NetSessionFunc func = voice_init
    NetSessionFunc obj = voice func = enable
    if NOT IsTrue xboxlive_shown_esrb_logo
        GetTerritory
        if ChecksumEquals a = <territory> b = territory_us
            change xboxlive_shown_esrb_logo = 1
            xboxlive_dialog_box {
                Title = 'NOTIZ'
                text = ''
                sub_logo = ESRB
                text_dims = (500.0, 0.0)
                buttons = [{text = 'Ich will spielen!' pad_choose_script = xboxlive_menu_create}]
                destroy_on_event = 1
            }
            return 
        endif
    endif
    xboxlive_menu_create <...> 
endscript

script xboxlive_restore_cagr_info 
    if (1 = xboxlive_pulled_the_old_switcheroo)
        GetCurrentSkaterProfileIndex
        GetSkaterProfileInfo player = <currentSkaterProfileIndex>
        get_player_profile_caginfo \{ LoadBackDefault }
        change \{ xboxlive_pulled_the_old_switcheroo = 0 }
    endif
endscript

script xboxlive_exit_internet_menu 
    xboxlive_restore_cagr_info
    back_from_internet_menu
endscript

script xboxlive_menu_create 
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    menu_stack_push menu_script = AP_TEST menu_params = { prompt = 'xboxlive_menu_create' }
    if IsTrue <has_custom_tag>
        GetCurrentSkaterProfileIndex
        GetSkaterId skater = <currentSkaterProfileIndex>
        if (<name> = custom_classic)
            if <ObjID> ::HasCustomTagTexture
                if NOT IsTrue xboxlive_pulled_the_old_switcheroo
                    get_player_profile_caginfo LoadDefault
                    change xboxlive_pulled_the_old_switcheroo = 1
                endif
            endif
        endif
    endif
    SetNetworkMode INTERNET_MODE
    menu_stack_push {
        menu_script = xboxlive_exit_internet_menu
        no_create
    }
    NetSessionFunc func = match_uninit
    NetSessionFunc func = match_init
    if IsXenon
        NetSessionFunc obj = match func = get_gamertag
        SetPreferencesFromUI prefs = network field = 'network_id' string = <name>
        SetPreferencesFromUI prefs = network field = 'server_name' string = <name>
    endif
    if AcceptedGameInvite
        JoinInviteServer
    else
        xboxlive_menu_lobby_push
    endif
endscript

script xboxlive_menu_back 
    menu_stack_pop
    menu_stack_clear
    NetSessionFunc \{ func = match_uninit }
    NetSessionFunc \{ func = voice_uninit }
endscript

script xboxlive_menu_sign_off 
    xboxlive_dialog_box_exit
    back_from_internet_options \{ sign_out }
    change \{ signedin = 0 }
    change \{ xboxlive_shown_esrb_logo = 0 }
    xboxlive_logon_status_update \{ text = '' }
    xboxlive_logon_status_kill
    menu_stack_clear
endscript

script xboxlive_menu_back_from_dialog 
    xboxlive_dialog_box_exit
    if ScreenElementExists \{ id = current_menu_anchor }
        SetScreenElementLock \{ id = current_menu_anchor Off }
        if IsXbox
            create_helper_text \{ xbox_live_menu_with_options_button }
        else
            create_helper_text \{ xbox360_live_menu_with_options_button }
        endif
    endif
    FireEvent \{ type = focus target = current_menu }
endscript

script xboxlive_menu_sign_off_confirm \{ back_script = xboxlive_menu_back_from_dialog }
    FireEvent \{ type = unfocus target = current_menu }
    xboxlive_dialog_box {
        Title = 'Abmelden'
        text = 'Möchtest du dich wirklich abmelden?'
        text_dims = (400.0, 0.0)
        pad_back_script = <back_script>
        no_bg
        buttons = [
            {text = 'Ja' pad_choose_script = xboxlive_menu_sign_off}
            {text = 'Nein' pad_choose_script = <back_script>}
        ]
    }
endscript

script xboxlive_menu_ignore_invited_session 
    NetSessionFunc \{ func = ignore_invited_session }
    xboxlive_dialog_box_exit
    menu_stack_pop
endscript

script xboxlive_menu_find_invited_session 
    NetSessionFunc \{ obj = match func = join_invited_session }
    NetSessionFunc \{ func = clear_invited_session }
    xboxlive_dialog_box_exit
    xbox_live_launch_session_find_dialog
endscript

script xboxlive_menu_lobby_push 
    change xboxlive_num_results = 0
    if NOT IsXenon
        tmpText = 'OptiMatch'
    else
        tmpText = 'Eigenes Spiel'
    endif
    if IsXbox
        menu_stack_push {
            menu_script = menu_template_create
            menu_params = {
                menu_template_style_ticker
                parent = root_window
                menu_id = lobby_menu
                pad_back_script = xboxlive_menu_back
                Title = 'Xbox Live-Lobby'
                title_pos = (50.0, 50.0)
                items = [
                    {text = 'Schnell ins Spiel' pad_choose_script = xbox_live_start_quickmatch rot = 1 label_offset = (0.0, 0.0) Length = 220}
                    {text = <tmpText> pad_choose_script = xboxlive_menu_optimatch_push rot = 4 label_offset = (20.0, 5.0) Length = 200 pad_choose_params = { set_default_focus }}
                    {text = 'Spiel anlegen' pad_choose_script = xboxlive_menu_host_push rot = -1 label_offset = (10.0, 20.0) Length = 180 pad_choose_params = { set_default_focus }}
                    {text = 'Xbox Live-Optionen' pad_choose_script = xboxlive_menu_options_push rot = -1 label_offset = (0.0, 40.0) Length = 230}
                    {text = 'Abmelden' pad_choose_script = xboxlive_menu_sign_off_confirm rot = 2 label_offset = (0.0, 30.0) Length = 200}
                ]
                xbox_live_menu_with_options_button
            }
        }
        if NetSessionFunc func = invited_session_pending
            FireEvent type = unfocus target = current_menu_anchor
            menu_stack_push menu_script = xbox_live_launch_invitamatch_dialog menu_params = { inviter = <inviter> }
        endif
    else
        menu_stack_push {
            menu_script = menu_template_create
            menu_params = {
                menu_template_style_ticker
                parent = root_window
                menu_id = lobby_menu
                pad_back_script = xboxlive_menu_back
                Title = 'Xbox Live-Lobby'
                title_pos = (50.0, 50.0)
                items = [
                    {text = 'Schnelles Spiel Standard' pad_choose_script = xbox_live_start_quickmatch pad_choose_params = { standard }rot = 1 label_offset = (0.0, 0.0) Length = 220}
                    {text = 'Schnelles Spiel Rangliste' pad_choose_script = xbox_live_start_quickmatch pad_choose_params = { ranked }rot = 1 label_offset = (0.0, 0.0) Length = 220}
                    {text = <tmpText> pad_choose_script = xboxlive_menu_optimatch_push rot = 4 label_offset = (20.0, 5.0) Length = 200 pad_choose_params = { set_default_focus }}
                    {text = 'Spiel anlegen' pad_choose_script = xboxlive_menu_host_push rot = -1 label_offset = (10.0, 20.0) Length = 180 pad_choose_params = { set_default_focus }}
                ]
                xbox360_live_menu_with_options_button
            }
        }
    endif
endscript

script xbox_live_launch_invitamatch_dialog 
    NetSessionFunc \{ obj = auth func = get_user_device_index }
    menu_text = ('Möchtest du beitreten?' + <inviter> + '-Spiel?')
    xboxlive_dialog_box {
        Title = 'Spiel beitreten'
        text = <menu_text>
        exclusive_device = <user_index>
        buttons = [
            {text = 'Ja' pad_choose_script = xboxlive_menu_find_invited_session}
            {text = 'Nein' pad_choose_script = xboxlive_menu_ignore_invited_session}
        ]
        no_bg
    }
endscript

script xboxlive_menu_optimatch_results_push 
    menu_stack_push \{ menu_script = xboxlive_menu_optimatch_results_create }
endscript

script xboxlive_menu_optimatch_results_create 
    if ScreenElementExists id = optimatch_results_menu
        DestroyScreenElement id = optimatch_results_menu
    endif
    if NOT IsXenon
        tmp_title = 'OptiMatch-Ergebnisse'
    else
        tmp_title = 'Eigene Spielergebnisse'
    endif
    change xboxlive_num_results = 0
    menu_template_create {
        menu_template_style_ticker
        scrolling
        parent = root_window
        menu_id = optimatch_results_menu
        vmenu_id = optimatch_results_vmenu
        Pos = (-87.0, 135.0)
        dims = (314.0, 200.0)
        arrow_pos = (47.0, 170.0)
        pad_back_script = menu_stack_pop
        title_pos = (50.0, 50.0)
        Title = <tmp_title>
        no_focus
        generic_helper_text
        spacing = 25
    }
    if ScreenElementExists id = current_menu
        SetScreenElementProps id = current_menu internal_just = [ center top ]
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = optimatch_results_menu
        id = optimatch_results_details
        Pos = (400.0, 150.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = optimatch_results_details
        local_id = game_type
        Pos = (10.0, 30.0)
        text = ''
        font = dialog
        rgba = [ 128 128 128 128 ]
        Scale = 0.9000
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = optimatch_results_details
        local_id = level
        Pos = (10.0, 70.0)
        text = ''
        font = dialog
        rgba = [ 128 128 128 128 ]
        Scale = 0.9000
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = optimatch_results_details
        local_id = players
        Pos = (10.0, 110.0)
        text = ''
        font = dialog
        rgba = [ 128 128 128 128 ]
        Scale = 1
        just = [ left top ]
        z_priority = 2
    }
    xboxlive_dialog_box {
        Title = 'Xbox Live'
        text = 'Sucht Sitzungen ...'
        buttons = [
            {text = 'Anhalten' pad_choose_script = xboxlive_menu_optimatch_results_stop}
            {text = 'Zurück' pad_choose_script = xboxlive_menu_search_cancel}
        ]
        no_bg
    }
    GetPreferenceChecksum pref_type = network game_type_optimatch
    gamemode = <checksum>
    GetPreferenceChecksum pref_type = network level_optimatch
    level = <checksum>
    GetPreferenceChecksum pref_type = network num_players_optimatch
    maxplayers = <checksum>
    GetPreferenceValue pref_type = network num_players
    num_players_value = <value>
    GetPreferenceChecksum pref_type = network skill_level_optimatch
    skilllevel = <checksum>
    GetPreferenceChecksum pref_type = network ranked
    ranked = <checksum>
    GetPreferenceValue pref_type = network ranked
    ranked_value = <value>
    NetSessionFunc obj = match func = set_search_params params = <...> 
    xbox_live_start_optimatch
endscript

script xboxlive_menu_host_push 
    menu_stack_push menu_script = xboxlive_menu_host_create <...> 
endscript

script xboxlive_menu_optimatch_push 
    if NOT IsXenon
        menu_stack_push {
            menu_script = menu_template_create
            menu_params = {
                menu_template_style_ticker
                parent = root_window
                menu_id = optimatch_menu
                vmenu_id = optimatch_vmenu
                pad_back_script = menu_stack_pop
                title_pos = (50.0, 50.0)
                Title = 'OptiMatch'
                items = [
                    {text = 'Spieltyp' field = 'game_type_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (0.0, 0.0) Length = 150}
                    {text = 'Level' field = 'level_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (20.0, 5.0) Length = 150}
                    {text = 'Spieler' field = 'num_players_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (10.0, 20.0) Length = 150}
                    {text = 'Schwierigkeit' field = 'skill_level_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (0.0, 30.0) Length = 150}
                    {text = 'Sitzung finden' id = optimatch_find_session pad_choose_script = xboxlive_menu_optimatch_results_push rot = 2 label_offset = (0.0, 30.0) Length = 150}
                ]
                xbox_live_menu_with_options_button
                additional_create_script = xboxlive_menu_prefs_field_create
            }
        }
        if GotParam set_default_focus
            FireEvent type = unfocus target = optimatch_vmenu
            FireEvent type = focus target = optimatch_vmenu Data = { child_id = optimatch_find_session }
        endif
    else
        menu_stack_push {
            menu_script = menu_template_create
            menu_params = {
                menu_template_style_ticker
                parent = root_window
                menu_id = optimatch_menu
                vmenu_id = optimatch_vmenu
                pad_back_script = menu_stack_pop
                title_pos = (50.0, 50.0)
                Title = 'Eigenes Spiel'
                items = [
                    {text = 'Standard, Ranked' field = 'ranked' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 label_offset = (0.0, 0.0) Length = 150}
                    {text = 'Spieltyp' field = 'game_type_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (0.0, 0.0) Length = 150}
                    {text = 'Level' field = 'level_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (20.0, 5.0) Length = 150}
                    {text = 'Spieler' field = 'num_players_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (10.0, 20.0) Length = 150}
                    {text = 'Schwierigkeit' field = 'skill_level_optimatch' pad_choose_script = xboxlive_menu_pref_menu_create add_dont_care_option = 1 rot = 0 label_offset = (0.0, 30.0) Length = 150}
                    {text = 'Sitzung finden' pad_choose_script = xboxlive_menu_optimatch_results_push rot = 2 label_offset = (0.0, 30.0) Length = 150}
                ]
                xbox360_live_menu_with_options_button
                additional_create_script = xboxlive_menu_prefs_field_create
            }
        }
    endif
endscript

script xboxlive_menu_host_create 
    if NOT IsXenon
        menu_template_create {
            menu_template_style_ticker
            parent = root_window
            menu_id = create_menu
            vmenu_id = create_vmenu
            pad_back_script = menu_stack_pop
            Title = 'Spiel anlegen'
            title_pos = (50.0, 50.0)
            items = [
                {text = 'Level' field = 'level' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Spieler' field = 'num_players' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Private Plätze' field = 'private_slots' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Schwierigkeit' field = 'skill_level' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Sitzung starten' id = start_session_button pad_choose_script = xboxlive_host_game rot = 2 Length = 150}
            ]
            xbox_live_menu_with_options_button
            additional_create_script = xboxlive_menu_prefs_field_create
        }
        FireEvent type = unfocus target = create_vmenu
        FireEvent type = focus target = create_vmenu Data = { child_id = start_session_button }
    else
        menu_template_create {
            menu_template_style_ticker
            parent = root_window
            menu_id = create_menu
            vmenu_id = create_vmenu
            pad_back_script = menu_stack_pop
            Title = 'Spiel anlegen'
            title_pos = (50.0, 50.0)
            items = [
                {text = 'Standard/Ranked' field = 'ranked' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Level' field = 'level' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Spieler' field = 'num_players' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Private Plätze' field = 'private_slots' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Schwierigkeit' field = 'skill_level' pad_choose_script = xboxlive_menu_pref_menu_create rot = 0 Length = 150}
                {text = 'Sitzung starten' pad_choose_script = xboxlive_host_game rot = 2 Length = 150}
            ]
            xbox360_live_menu_with_options_button
            additional_create_script = xboxlive_menu_prefs_field_create
        }
    endif
endscript

script xboxlive_menu_scoreboard_push 
    if IsXbox
        menu_stack_push \{menu_script = menu_template_create menu_params = {menu_template_style_ticker parent = root_window menu_id = scoreboard_menu vmenu_id = scoreboard_vmenu pad_back_script = menu_stack_pop Title = 'Rangliste' title_pos = (50.0, 50.0) generic_helper_text}}
    else
        create_online_stats_menu
    endif
endscript

script xboxlive_menu_back_to_pause 
    menu_stack_clear
    create_pause_menu
endscript

script xboxlive_menu_back_to_cat 
    menu_stack_clear
    create_pre_cat_menu
endscript

script xboxlive_menu_options_push \{ back_script = menu_stack_pop }
    if GotParam \{ from_pause_menu }
        xboxlive_menu_notify_kill
        <back_script> = xboxlive_menu_back_to_pause
    else
        if GotParam \{ from_cat_menu }
            xboxlive_menu_notify_kill
            <back_script> = xboxlive_menu_back_to_cat
        endif
    endif
    menu_stack_push {
        menu_script = xboxlive_menu_options_create
        menu_params = {
            back_script = <back_script>
        }
    }
endscript

script xbox360live_menu_options_push \{ back_script = menu_stack_pop }
    xboxlive_menu_notify_kill
    <back_script> = xboxlive_menu_back_to_pause
    menu_stack_push {
        menu_script = xbox360live_menu_players_create
        menu_params = {
            back_script = <back_script>
        }
    }
endscript

script xboxlive_menu_voice_options_get_text 
    if NetSessionFunc \{ obj = voice func = hasvoicethroughspeakers }
        return \{ voice_option_text = 'Lautsprecher' }
    else
        return \{ voice_option_text = 'Headset' }
    endif
endscript

script xboxlive_menu_voice_options_toggle 
    if NetSessionFunc \{ obj = voice func = hasvoicethroughspeakers }
        NetSessionFunc \{ obj = voice func = VoiceThroughHeadset }
    else
        NetSessionFunc \{ obj = voice func = VoiceThroughSpeakers }
    endif
    xboxlive_menu_voice_options_get_text
    obj_getid
    SetScreenElementProps id = {<ObjID> child = extra_text}text = <voice_option_text>
endscript

script xboxlive_update_options_menu 
    if ScreenElementExists \{ id = live_options_menu }
        xboxlive_menu_options_create
    endif
endscript

script xboxlive_menu_appear_online_get_text 
    if NetSessionFunc \{ obj = presence func = is_appearing_online }
        return \{ online_text = 'Ja' }
    else
        return \{ online_text = 'Nein' }
    endif
endscript

script xboxlive_menu_appear_online_toggle 
    if NetSessionFunc \{ obj = presence func = is_appearing_online }
        NetSessionFunc \{obj = presence func = set_appear_online params = { on = 0 }}
    else
        NetSessionFunc \{obj = presence func = set_appear_online params = { on = 1 }}
    endif
    xboxlive_menu_appear_online_get_text
    obj_getid
    SetScreenElementProps id = {<ObjID> child = extra_text}text = <online_text>
endscript
xboxlive_last_options_pad_back = NullScript

script xboxlive_menu_options_create 
    NetSessionFunc func = voice_init
    NetSessionFunc obj = voice func = enable
    xboxlive_menu_voice_options_get_text
    xboxlive_menu_appear_online_get_text
    NetSessionFunc obj = auth func = get_user_device_index
    if NetSessionFunc obj = voice func = haslocalheadset
        voice_focus_params = {}
    else
        voice_focus_params = { not_focusable }
    endif
    if NOT GotParam back_script
        <back_script> = (xboxlive_last_options_pad_back)
    else
        change xboxlive_last_options_pad_back = <back_script>
    endif
    if IsXbox
        menu_template_create {
            menu_template_style_ticker
            parent = root_window
            menu_id = live_options_menu
            pad_back_script = <back_script>
            exclusive_device = <user_index>
            Title = 'Xbox Live-Optionen'
            title_pos = (50.0, 50.0)
            items = [
                {text = 'Freundesliste' tag_grid_x = 0 pad_choose_script = xboxlive_menu_friends_push rot = -1 label_offset = (10.0, 20.0) Length = 180}
                {text = 'Spielerliste' tag_grid_x = 1 pad_choose_script = xboxlive_menu_players_push rot = 4 label_offset = (20.0, 5.0) Length = 200}
                {text = 'Sprachausgabe über:' tag_grid_x = 2 <voice_focus_params> extra_text = <voice_option_text> option_arrows option_arrows_callback = xboxlive_menu_voice_options_toggle rot = 1 label_offset = (10.0, 10.0)}
                {text = 'Online erscheinen:' tag_grid_x = 3 extra_text = <online_text> option_arrows option_arrows_callback = xboxlive_menu_appear_online_toggle rot = -1 label_offset = (5.0, 15.0)}
            ]
            generic_helper_text
        }
        printstruct <...> 
        live_options_menu ::GetProps
        printstruct <...> 
    endif
endscript

script xbox360live_launch_friends 
    NetSessionFunc \{ func = launch_friends }
endscript

script xbox360live_launch_players 
    NetSessionFunc \{ func = launch_players }
endscript

script xboxlive_menu_friends_push 
    menu_stack_push \{ menu_script = xboxlive_menu_friends_create }
endscript

script async_update_friends_list 
    begin 
    if NOT ScreenElementExists \{ id = dialog_box_anchor }
        if NOT ScreenElementExists \{ id = voice_attachment_anchor }
            NetSessionFunc \{ obj = presence func = pump_friends_list }
        endif
    endif
    wait \{ 1 frame }
    repeat 
endscript

script xboxlive_menu_friends_create 
    NetSessionFunc obj = presence func = retrieve_friends_list params = { friends }
    SpawnScriptLater async_update_friends_list
    xboxlive_menu_friends_refresh {
        item_props = {
            font = dialog
            Scale = (0.7200000286102295, 0.800000011920929)
            highlight_rgba = [ 123 4 93 128 ]
            unhighlight_rgba = [ 123 128 128 128 ]
            bg_dims = (600.0, 25.0)
            container_dims = (640.0, 23.0)
            status_pos = (595.0, 3.0)
            pad_choose_script = xboxlive_menu_friends_item_choose
        }
        player_set = friends
        dialog_callback = xboxlive_dialog_box
    }
    create_helper_text generic_helper_text helper_pos = (320.0, 426.0)
    current_menu ::setprops {
        event_handlers = [
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
    }
endscript

script xboxlive_menu_players_push 
    menu_stack_push \{ menu_script = xboxlive_menu_players_create }
endscript

script xboxlive_menu_players_create 
    NetSessionFunc obj = presence func = retrieve_friends_list params = { players }
    SpawnScriptLater async_update_friends_list
    xboxlive_menu_friends_refresh {
        item_props = {
            font = dialog
            Scale = (0.7200000286102295, 0.800000011920929)
            highlight_rgba = [ 123 4 93 128 ]
            unhighlight_rgba = [ 123 128 128 128 ]
            bg_dims = (565.0, 25.0)
            container_dims = (640.0, 23.0)
            status_pos = (560.0, 3.0)
            pad_choose_script = xboxlive_menu_players_item_choose
        }
        title_props = {
            text = 'Spielerliste'
            Pos = (50.0, 50.0)
            rgba = [ 9 120 25 128 ]
            Scale = 2
            font = testtitle
        }
        tags = {
            start_index = 0
            items_on_page = 9
        }
        player_set = players
        Pos = (35.0, 100.0)
    }
    create_helper_text xbox_live_menu_with_feedback
    current_menu ::setprops {
        event_handlers = [
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
    }
endscript

script xbox360live_menu_players_create 
    if NOT GotParam back_script
        <back_script> = (xboxlive_last_options_pad_back)
    else
        change xboxlive_last_options_pad_back = <back_script>
    endif
    xboxlive_menu_friends_refresh {
        item_props = {
            font = dialog
            Scale = (0.7200000286102295, 0.800000011920929)
            highlight_rgba = [ 123 4 93 128 ]
            unhighlight_rgba = [ 123 128 128 128 ]
            bg_dims = (565.0, 25.0)
            container_dims = (640.0, 23.0)
            status_pos = (560.0, 3.0)
            pad_choose_script = xboxlive_menu_players_item_choose
        }
        title_props = {
            text = 'Aktuelle Spieler'
            Pos = (50.0, 50.0)
            rgba = [ 9 120 25 128 ]
            Scale = 2
            font = testtitle
        }
        tags = {
            start_index = 0
            items_on_page = 9
        }
        pad_back_script = xboxlive_menu_back_to_pause
        player_set = players
        Pos = (35.0, 100.0)
    }
    create_helper_text xbox_live_menu_with_feedback
    current_menu ::setprops {
        event_handlers = [
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
    }
endscript

script xboxlive_menu_voice_options_push 
    NetSessionFunc obj = auth func = get_user_device_index
    menu_stack_push {
        menu_script = menu_template_create
        menu_params = {
            menu_template_style_ticker
            parent = root_window
            menu_id = voice_options_menu
            exclusive_device = <user_index>
            pad_back_script = menu_stack_pop
            Title = 'Sprachoptionen'
            title_pos = (50.0, 50.0)
            items = [
                {text = 'Option 1' pad_choose_script = NullScript rot = -1 label_offset = (10.0, 20.0) Length = 180}
                {text = 'Option 2' pad_choose_script = NullScript rot = 4 label_offset = (20.0, 5.0) Length = 200}
            ]
            generic_helper_text
        }
    }
endscript

script xboxlive_menu_optimatch_results_item_choose 
    printf \{ 'xboxlive_menu_optimatch_results_item_choose' }
    choose_selected_server <...> 
endscript

script xboxlive_menu_optimatch_results_item_focus 
    if NOT ScreenElementExists id = optimatch_server_details_bg
        SetScreenElementLock id = optimatch_results_details Off
        SetScreenElementLock id = optimatch_results_menu Off
        Theme_GetHighlightedTextColorNew return_value = title_color
        CreateScreenElement {
            type = SpriteElement
            parent = optimatch_results_details
            Pos = (0.0, -30.0)
            dims = (200.0, 25.0)
            rgba = [ 0 0 0 128 ]
            alpha = 1
            just = [ left top ]
            z_priority = -2
        }
        CreateScreenElement {
            type = TextElement
            parent = optimatch_results_details
            Pos = (6.0, -28.0)
            text = 'Spiel-Informationen'
            font = dialog
            rgba = <title_color>
            Scale = 0.9000
            just = [ left top ]
            z_priority = 2
        }
        CreateScreenElement {
            type = SpriteElement
            parent = optimatch_results_details
            id = optimatch_server_details_bg
            Pos = (0.0, 0.0)
            dims = (200.0, 150.0)
            rgba = [ 0 0 0 128 ]
            alpha = 1
            just = [ left top ]
            z_priority = -2
        }
        Theme_GetHighlightedTextColorNew return_value = title_color
        CreateScreenElement {
            type = TextElement
            parent = optimatch_results_details
            local_id = game_type_title
            Pos = (10.0, 10.0)
            text = 'Spieltyp'
            font = dialog
            rgba = <title_color>
            Scale = 0.9000
            just = [ left top ]
            z_priority = 2
        }
        CreateScreenElement {
            type = TextElement
            parent = optimatch_results_details
            local_id = level_title
            Pos = (10.0, 50.0)
            text = 'Level'
            font = dialog
            rgba = <title_color>
            Scale = 0.9000
            just = [ left top ]
            z_priority = 2
        }
        CreateScreenElement {
            type = TextElement
            parent = optimatch_results_details
            local_id = players_title
            Pos = (10.0, 90.0)
            text = 'Spieler'
            font = dialog
            rgba = <title_color>
            Scale = 0.9000
            just = [ left top ]
            z_priority = 2
        }
    endif
    obj_getid
    Theme_GetHighlightedTextColorNew return_value = on_color
    SetScreenElementProps id = {<ObjID> child = name}rgba = <on_color>
    settags has_focus
    gettags
    xboxlive_menu_optimatch_results_details_refresh <...> 
endscript

script xboxlive_menu_optimatch_results_item_unfocus 
    obj_getid
    Theme_GetUnhighlightedTextColorNew \{ return_value = off_color }
    SetScreenElementProps id = {<ObjID> child = name}rgba = <off_color>
    removetags \{[ has_focus ]}
endscript

script xboxlive_menu_optimatch_results_details_refresh 
    SetScreenElementProps {
        id = { optimatch_results_details child = game_type }
        text = <game_type>
    }
    SetScreenElementProps {
        id = { optimatch_results_details child = level }
        text = <level>
    }
    if NOT GotParam \{ players }
        FormatText textname = players '%a / %b' a = <num_players> b = <max_players>
    endif
    SetScreenElementProps {
        id = { optimatch_results_details child = players }
        text = <players>
    }
endscript

script xboxlive_menu_optimatch_results_item_add { 
     }
    change xboxlive_num_results = ((xboxlive_num_results)+ 1)
    if NOT ScreenElementExists id = optimatch_results_vmenu
        printf 'Warning! tried to add a server when results menu not up'
        return 
    endif
    num_qos_bars = 5
    if NOT ScreenElementExists id = optimatch_results_menu_title
        SetScreenElementLock id = optimatch_results_menu Off
        Theme_GetHighlightedTextColorNew return_value = title_color
        CreateScreenElement {
            type = SpriteElement
            parent = optimatch_results_menu
            Pos = (65.0, 120.0)
            dims = (314.0, 25.0)
            rgba = [ 0 0 0 128 ]
            alpha = 1
            just = [ left top ]
            z_priority = -2
        }
        CreateScreenElement {
            type = TextElement
            parent = optimatch_results_menu
            id = optimatch_results_menu_title
            Pos = (70.0, 123.0)
            text = 'Host-Name'
            font = dialog
            rgba = <title_color>
            Scale = 0.9000
            just = [ left top ]
            z_priority = 2
        }
    endif
    if NOT ScreenElementExists id = {current_menu child = <server_id>}
        SetScreenElementLock id = current_menu Off
        CreateScreenElement {
            type = ContainerElement
            parent = current_menu
            local_id = <server_id>
            event_handlers = [
                {pad_choose xboxlive_menu_optimatch_results_item_choose params = { id = <server_id> }}
                { focus xboxlive_menu_optimatch_results_item_focus }
                { unfocus xboxlive_menu_optimatch_results_item_unfocus }
            ]
        }
        parent_id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <parent_id>
            Pos = (-5.0, -3.0)
            dims = (314.0, 25.0)
            rgba = [ 0 0 0 128 ]
            alpha = 1
            just = [ left top ]
            z_priority = -2
        }
        CreateScreenElement {
            type = TextElement
            parent = <parent_id>
            local_id = name
            Pos = (0.0, 0.0)
            text = ''
            font = dialog
            rgba = [ 128 128 128 128 ]
            Scale = 0.8000
            just = [ left top ]
            z_priority = 2
        }
        CreateScreenElement {
            type = hmenu
            parent = <parent_id>
            local_id = qos
            Pos = (257.0, 0.0)
            dims = (640.0, 20.0)
            just = [ left top ]
            internal_just = [ left center ]
            spacing_between = 5
            z_priority = 2
        }
        qos_id = <id>
        begin 
        CreateScreenElement {
            type = SpriteElement
            parent = <qos_id>
            dims = (5.0, 20.0)
            rgba = [ 128 128 128 128 ]
            alpha = 1
        }
        repeat <num_qos_bars>
    endif
    SetScreenElementProps {
        id = {current_menu child = {<server_id> child = name}}
        text = <server_name>
    }
    GetScreenElementChildren id = {current_menu child = {<server_id> child = qos}}
    GetArraySize children
    i = 0
    begin 
    if (<i> < <qos>)
        Theme_GetHighlightedTextColorNew return_value = qos_rgba
    else
        Theme_GetUnhighlightedTextColorNew return_value = qos_rgba
    endif
    SetScreenElementProps id = (<children> [ <i> ])rgba = <qos_rgba>
    i = (<i> + 1)
    repeat <array_size>
    ResolveScreenElementID id = {current_menu child = <server_id>}
    SetScreenElementProps {
        id = <resolved_id>
        tags = {
            game_type = <game_type>
            level = <level>
            num_players = <num_players>
            private_slots = <private_slots>
            ranked = <ranked>
            max_players = <max_players>
        }
    }
    if ScreenElementExists id = optimatch_results_vmenu
        SetScreenElementLock id = optimatch_results_vmenu on
        SetScreenElementLock id = optimatch_results_vmenu Off
    endif
    if <resolved_id> ::getsingletag has_focus
        xboxlive_menu_optimatch_results_details_refresh <...> 
    endif
endscript

script xboxlive_menu_players_kick_confirm 
    xboxlive_dialog_box {Title = 'Spieler rauswerfen'
        text = ('Möchtest du folgenden Spieler wirklich rauswerfen: ' + <player_name> + '?')
        buttons = [
            {text = 'Ja' pad_choose_script = xboxlive_menu_players_kick pad_choose_params = <...> }
            {text = 'Nein' pad_choose_script = xboxlive_menu_players_item_choose_back}
        ]
    }
endscript

script xboxlive_menu_players_kick 
    if IsXbox
        NetSessionFunc obj = presence func = kick_player params = <...> 
    else
        NetSessionFunc func = kick_player params = <...> 
    endif
    xbox360live_menu_players_create
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_ban_confirm 
    xboxlive_dialog_box {Title = 'Spieler sperren'
        text = ('Möchtest du folgenden Spieler wirklich sperren: ' + <player_name> + '?')
        buttons = [
            {text = 'Ja' pad_choose_script = xboxlive_menu_players_ban pad_choose_params = <...> }
            {text = 'Nein' pad_choose_script = xboxlive_menu_players_item_choose_back}
        ]
    }
endscript

script xboxlive_menu_players_ban 
    if IsXbox
        NetSessionFunc obj = presence func = ban_player params = <...> 
    else
        NetSessionFunc func = ban_player params = <...> 
    endif
    xbox360live_menu_players_create
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_item_choose 
    player_structure = <...> 
    FireEvent type = unfocus target = current_menu
    if IsXbox
        if NetSessionFunc obj = presence func = is_player_friend params = <player_structure>
            if NetSessionFunc obj = presence func = is_friend_pending params = <player_structure>
                buttons = {
                    text = 'Freundesanfrage abbrechen'
                    pad_choose_script = xboxlive_menu_players_cancel_friend_request
                    pad_choose_params = <player_structure>
                }
                push buttons
            endif
        else
            buttons = {
                text = 'Freund hinzufügen'
                pad_choose_script = xboxlive_menu_players_add_friend_prompt
                pad_choose_params = <player_structure>
            }
            push buttons
        endif
        if NetSessionFunc obj = presence func = is_player_muted params = <player_structure>
            buttons = {
                text = 'Stummschalten aus'
                pad_choose_script = xboxlive_menu_players_unmute
                pad_choose_params = <player_structure>
            }
        else
            buttons = {
                text = 'Sprachausgabe stumm'
                pad_choose_script = xboxlive_menu_players_mute
                pad_choose_params = <player_structure>
            }
        endif
        push buttons
        buttons = {
            text = 'Feedback senden'
            pad_choose_script = xboxlive_menu_players_feedback
            pad_choose_params = <player_structure>
        }
        if NetSessionFunc obj = presence func = is_player_playing params = <player_structure>
            if OnServer
                push buttons
                buttons = {
                    text = 'Rauswerfen'
                    pad_choose_script = xboxlive_menu_players_kick_confirm
                    pad_choose_params = <player_structure>
                }
                push buttons
                buttons = {
                    text = 'Ausschließen'
                    pad_choose_script = xboxlive_menu_players_ban_confirm
                    pad_choose_params = <player_structure>
                }
            endif
        endif
    else
        if OnServer
            buttons = {
                text = 'Rauswerfen'
                pad_choose_script = xboxlive_menu_players_kick_confirm
                pad_choose_params = <player_structure>
            }
            push buttons
            buttons = {
                text = 'Ausschließen'
                pad_choose_script = xboxlive_menu_players_ban_confirm
                pad_choose_params = <player_structure>
            }
            push buttons
        endif
        buttons = {
            text = 'Spielerbewertung senden'
            pad_choose_script = submit_player_review
            pad_choose_params = { player_xuid = <player_id> }
        }
    endif
    push buttons
    xboxlive_dialog_box {
        Title = 'Spieleraktion'
        text = ('Bitte wähle eine Aktion für\n\'' + <player_name> + '\'')
        text_dims = (400.0, 0.0)
        pad_back_script = xboxlive_menu_players_item_choose_back
        no_bg
        buttons = (<param_stacks>.buttons)
    }
endscript

script xboxlive_menu_players_is_player_muted 
    return \{ false }
endscript

script xboxlive_menu_players_mute 
    NetSessionFunc obj = presence func = mute_player params = <...> 
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_record_voice_message 
    xboxlive_menu_record_voice_menu_process_state \{ state = recording }
    NetSessionFunc \{ obj = voice func = start_recording_msg }
endscript

script xboxlive_menu_play_voice_message 
    xboxlive_menu_record_voice_menu_process_state \{ state = playing }
    NetSessionFunc \{ obj = voice func = playback_msg }
endscript

script xboxlive_voice_attachment_stop_notify 
    xboxlive_menu_record_voice_menu_process_state \{ state = stopped }
endscript

script xboxlive_menu_stop_playing_voice_message 
    xboxlive_menu_stop_recording_voice_message
endscript

script xboxlive_menu_stop_recording_voice_message 
    xboxlive_voice_attachment_stop_notify
    NetSessionFunc \{ obj = voice func = stop_recording_msg }
endscript

script xboxlive_menu_send_voice_message 
    voice_attachment_popup ::getsetoftags \{[ accept_script accept_params ]}
    disassociatefromobject
    xboxlive_voice_attachment_finished
    if ScreenElementExists \{ id = current_menu_anchor }
        FireEvent \{ type = focus target = current_menu_anchor }
    endif
    <accept_script> <accept_params>
endscript

script xboxlive_menu_cancel_voice_message 
    voice_attachment_popup ::getsingletag \{ state }
    if NOT (<state> = stopped)
        return 
    endif
    voice_attachment_popup ::getsetoftags \{[ cancel_script cancel_params ]}
    disassociatefromobject
    xboxlive_voice_attachment_finished
    if ScreenElementExists \{ id = current_menu_anchor }
        FireEvent \{ type = focus target = current_menu_anchor }
    endif
    <cancel_script> <cancel_params>
endscript

script xboxlive_menu_players_add_friend_prompt 
    allow_message = 0
    if NetSessionFunc obj = voice func = voice_allowed
        if NetSessionFunc obj = voice func = voice_enabled
            if NetSessionFunc obj = voice func = haslocalheadset
                <allow_message> = 1
            endif
        endif
    endif
    NetSessionFunc obj = auth func = get_user_device_index
    if (<allow_message> = 1)
        xboxlive_dialog_box {Title = 'Sprachnachricht einfügen'
            text = 'Möchtest du mit dieser Anfrage eine Sprachnachricht mitschicken?'
            exclusive_device = <user_index>
            buttons = [
                {text = 'Ja' pad_choose_script = xboxlive_menu_record_voice_menu_create pad_choose_params = {accept_script = xboxlive_menu_players_add_friend accept_params = { <...> voice_msg }cancel_script = xboxlive_menu_players_item_choose_back}}
                {text = 'Nein' pad_choose_script = xboxlive_menu_players_add_friend pad_choose_params = <...> }
                {text = 'Zurück' pad_choose_script = xboxlive_menu_players_item_choose_back}
            ]
        }
    else
        xboxlive_menu_players_add_friend <...> 
    endif
endscript

script xboxlive_menu_players_add_friend 
    NetSessionFunc obj = presence func = add_friend params = <...> 
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_cancel_friend_request 
    NetSessionFunc obj = presence func = cancel_friend_request params = <...> 
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_unmute 
    NetSessionFunc obj = presence func = unmute_player params = <...> 
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_feedback 
    player_structure = <...> 
    xboxlive_dialog_box {
        Title = 'Feedback'
        text = ('Bitte wähle dein Feedback für\n\'' + <player_name> + '\'')
        text_dims = (400.0, 0.0)
        pad_back_script = xboxlive_menu_players_item_choose
        pad_back_params = <player_structure>
        no_bg
        buttons = [
            {
                text = '-----Feedback-----'
                not_focusable = not_focusable
            }
            {
                text = 'Spitzenspiel'
                pad_choose_script = xboxlive_menu_players_send_feedback
                pad_choose_params = {
                    FEEDBACK = pos_session
                    <player_structure>
                }
            }
            {
                text = 'Gute Einstellung'
                pad_choose_script = xboxlive_menu_players_send_feedback
                pad_choose_params = {
                    FEEDBACK = pos_attitude
                    <player_structure>
                }
            }
            {
                text = '-----Beschwerden-----'
                not_focusable = not_focusable
            }
            {
                text = 'Ungültiger Name'
                pad_choose_script = xboxlive_menu_players_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_name
                    <player_structure>
                }
            }
            {
                text = 'Fluchen oder Anzüglichkeiten'
                pad_choose_script = xboxlive_menu_players_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_lewdness
                    <player_structure>
                }
            }
            {
                text = 'Schreien'
                pad_choose_script = xboxlive_menu_players_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_screaming
                    <player_structure>
                }
            }
            {
                text = 'Schummeln'
                pad_choose_script = xboxlive_menu_players_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_gameplay
                    <player_structure>
                }
            }
            {
                text = 'Drohung oder Belästigung'
                pad_choose_script = xboxlive_menu_players_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_harassment
                    <player_structure>
                }
            }
        ]
    }
endscript

script xboxlive_menu_players_item_choose_back 
    disassociatefromobject
    xboxlive_dialog_box_exit
    SetScreenElementLock \{ id = current_menu_anchor Off }
    create_helper_text \{ xbox_live_menu_with_feedback }
    FireEvent \{ type = focus target = current_menu }
endscript

script xboxlive_menu_players_send_feedback_confirm 
    NetSessionFunc \{ obj = auth func = get_user_device_index }
    xboxlive_dialog_box {Title = 'Beschwerde senden'
        text = ('Willst du diese Beschwerde über folgenden Spieler wirklich senden ' + <player_name> + '?')
        exclusive_device = <user_index>
        buttons = [
            {text = 'Ja' pad_choose_script = xboxlive_menu_players_send_feedback pad_choose_params = <...> }
            {text = 'Nein' pad_choose_script = xboxlive_menu_players_item_choose_back}
        ]
    }
endscript

script xboxlive_menu_players_send_feedback 
    NetSessionFunc obj = presence func = send_feedback params = {FEEDBACK = <FEEDBACK> <...> }
    xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_prefs_field_create add_dont_care_option = 0
    if GotParam field
        pad_choose_params = {
            field = <field>
            menu_id = <parent>
            add_dont_care_option = <add_dont_care_option>
        }
        SetScreenElementProps {
            id = <container_id>
            event_handlers = [
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            replace_handlers
        }
        FormatText checksumname = pref_field_checksum <field>
        GetPreferenceString pref_type = network <pref_field_checksum>
        <y_val> = (<text_pos>.(0.0, 1.0))
        <y_val> = (<y_val> * (0.0, 1.0))
        CreateScreenElement {
            type = TextElement
            parent = <container_id>
            local_id = pref_text
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = small
            text = <ui_string>
            rgba = <rgba>
            Scale = <Scale>
            Pos = (<y_val> + (280.0, 0.0))
            just = [ left center ]
            z_priority = 10
        }
        GetScreenElementDims id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            local_id = pref_text_bg
            Pos = (<y_val> + (270.0, -15.0))
            dims = ((<width> * (1.0, 0.0))+ (20.0, 30.0))
            rgba = [ 0 0 0 128 ]
            alpha = 1
            just = [ left top ]
            z_priority = -2
        }
    endif
endscript

script xboxlive_menu_pref_menu_create 
    FireEvent type = unfocus target = <menu_id>
    FireEvent type = unfocus target = current_menu_anchor
    xboxlive_menu_morph_all_but_selected_child {
        menu_id = <menu_id>
        morph_params = {
            alpha = 0
        }
    }
    obj_getid
    DoScreenElementMorph id = {<ObjID> child = pref_text}alpha = 0
    DoScreenElementMorph id = {<ObjID> child = pref_text_bg}alpha = 0
    SetScreenElementLock id = root_window Off
    make_label_menu {
        menu_id = pref_menu
        vmenu_id = pref_vmenu
        parent = root_window
        keep_current
        pad_back_script = xboxlive_menu_pref_menu_back
        pad_back_params = { menu_id = <menu_id> }
        dims = (150.0, 250.0)
        Pos = (360.0, 120.0)
        scrolling
        just = [ center center ]
    }
    FormatText checksumname = pref_field_checksum <field>
    switch <pref_field_checksum>
        case game_type
        case game_type_optimatch
        src_array = net_game_type_info
        action_script = xboxlive_menu_pref_item_add_generic
        case level
        case level_optimatch
        src_array = level_select_menu_level_info
        action_script = xboxlive_menu_pref_item_add_level
        case num_players
        case num_players_optimatch
        src_array = num_players_info
        action_script = xboxlive_menu_pref_item_add_generic
        case private_slots
        GetPreferenceValue pref_type = network num_players
        constrain = (<value> + 1)
        src_array = num_private_slots
        action_script = xboxlive_menu_pref_item_add_generic
        case ranked
        src_array = ranked_info
        action_script = xboxlive_menu_pref_item_add_generic
        case skill_level
        case skill_level_optimatch
        src_array = skill_level_info
        action_script = xboxlive_menu_pref_item_add_generic
        default 
        scriptassert 'Unhandled pref field'
    endswitch
    item_params = {
        menu_id = <menu_id>
        parent = pref_vmenu
        field = <field>
    }
    if (<add_dont_care_option> = 1)
        <action_script> {
            <item_params>
            name = 'Keine Präferenz'
            checksum = dont_care
        }
    endif
    if NOT GotParam constrain
        ForEachIn {
            (<src_array>)
            do = <action_script>
            params = <item_params>
        }
    else
        i = 0
        begin 
        tmpStructure = (<src_array> [ <i> ])
        <action_script> {
            <tmpStructure>
            <item_params>
        }
        i = (<i> + 1)
        repeat <constrain>
    endif
    label_menu_finish
    FireEvent type = focus target = pref_vmenu
endscript

script xboxlive_menu_pref_item_add_generic \{ parent = pref_vmenu }
    add_label_menu_item {
        parent = <parent>
        text = <name>
        pad_choose_script = xboxlive_menu_pref_menu_back
        pad_choose_params = {
            <...> 
            apply
        }
        rot = Random (@ -3 @ -2 @ -1 @ 0 @ 1 @ 2 @ 3)
    }
endscript

script xboxlive_menu_pref_item_add_level 
    if GotParam career_only
        return 
    endif
    if cd
        if GotParam DEVKIT_ONLY
            return 
        endif
    endif
    if GotParam park_ed
        return 
    endif
    if GotParam collectors_edition_only
        return 
    endif
    if NOT IsTrue All_Levels_Unlocked
        IsLevelUnlocked level = <level>
        if (<unlocked> = 0)
            return 
        endif
    endif
    if GotParam special_case_flag
        if NOT GetGlobalFlag flag = <special_case_flag>
            return 
        endif
    endif
    xboxlive_menu_pref_item_add_generic {
        <...> 
        name = <text>
        checksum = <level>
    }
endscript

script xboxlive_menu_pref_menu_back 
    if GotParam \{ apply }
        if NOT GotParam \{ prefs }
            prefs = network
        endif
        SetPreferencesFromUI {
            <...> 
            prefs = <pref_type>
            field = <pref_field>
            string = <name>
        }
    endif
    disassociatefromobject
    DestroyScreenElement \{ id = pref_menu }
    menu_stack_create_latest
endscript

script xboxlive_menu_morph_all_but_selected_child \{morph_params = { alpha = 0 }}
    <menu_id> ::getsingletag tag_selected_index
    if GotParam \{ tag_selected_index }
        if GetScreenElementChildren id = <menu_id>
            GetArraySize \{ children }
            i = 0
            begin 
            if NOT (<i> = <tag_selected_index>)
                DoScreenElementMorph id = (<children> [ <i> ])<morph_params>
            endif
            i = (<i> + 1)
            repeat <array_size>
        endif
    endif
endscript

script xboxlive_menu_optimatch_results_stop 
    NetSessionFunc \{ obj = match func = stop_server_list }
    xboxlive_menu_optimatch_results_end
endscript

script xboxlive_menu_create_match_after_failed_search 
    xboxlive_dialog_box_exit
    xboxlive_menu_search_cancel
    xboxlive_menu_host_push \{ set_default_focus }
endscript

script xboxlive_menu_optimatch_results_end 
    xboxlive_dialog_box_exit
    if ScreenElementExists id = optimatch_results_menu
        FireEvent type = focus target = optimatch_results_menu
        SetScreenElementLock id = optimatch_results_menu Off
        create_helper_text generic_helper_text
    endif
    printf 'xboxlive_menu_optimatch_results_end : %d' d = xboxlive_num_results
    if (xboxlive_num_results = 0)
        if IsXbox
            xboxlive_dialog_box {
                Title = 'Xbox Live'
                text = 'Keine Sitzungen verfügbar. Möchtest du ein Spiel anlegen?'
                pad_back_script = xboxlive_menu_search_cancel
                buttons = [
                    {text = 'Ja' pad_choose_script = xboxlive_menu_create_match_after_failed_search}
                    {text = 'Zurück' pad_choose_script = xboxlive_menu_search_cancel}
                ]
                no_bg
            }
        else
            if CheckForSignin
                xboxlive_dialog_box {
                    Title = 'Xbox Live'
                    text = 'Keine Sitzungen verfügbar. Möchtest du ein Spiel anlegen?'
                    pad_back_script = xboxlive_menu_search_cancel
                    buttons = [
                        {text = 'Ja' pad_choose_script = xboxlive_menu_create_match_after_failed_search}
                        {text = 'Zurück' pad_choose_script = xboxlive_menu_search_cancel}
                    ]
                    no_bg
                }
            endif
        endif
    endif
endscript

script xboxlive_menu_quickmatch_results_none 
    xboxlive_dialog_box_exit
    xboxlive_dialog_box \{Title = "Xbox Live" text = "Keine Sitzungen verfügbar. Möchtest du ein Spiel anlegen?" pad_back_script = xboxlive_menu_search_cancel buttons = [{ text = 'Ja' pad_choose_script = xboxlive_menu_create_match_after_failed_search }{ text = 'Zurück' pad_choose_script = xboxlive_menu_search_cancel }] no_bg}
endscript

script xboxlive_menu_invitamatch_results_none 
    xboxlive_dialog_box_exit
    xboxlive_dialog_box \{Title = "Xbox Live" text = "Konnte Sitzung nicht finden. Möchtest du ein Spiel anlegen?" pad_back_script = xboxlive_menu_search_cancel buttons = [{ text = 'Ja' pad_choose_script = xboxlive_menu_create_match_after_failed_search }{ text = 'Zurück' pad_choose_script = xboxlive_menu_search_cancel }] no_bg}
endscript

script xboxlive_menu_search_cancel 
    NetSessionFunc \{ obj = match func = stop_server_list }
    NetSessionFunc \{ obj = match func = free_server_list }
    xboxlive_dialog_box_exit
    menu_stack_pop
endscript

script xboxlive_menu_optimatch_results_clear 
    if IsScreenElementInFocus \{ id = optimatch_results_menu }
        need_focus = 1
        FireEvent \{ type = unfocus target = optimatch_results_menu }
    endif
    DestroyScreenElement \{ id = optimatch_results_vmenu preserve_parent }
    xboxlive_menu_optimatch_results_details_refresh \{ game_type = '' level = '' players = '' }
    if GotParam \{ need_focus }
        FireEvent \{ type = focus target = optimatch_results_menu }
    endif
endscript

script xboxlive_menu_message_container_create_if_needed 
    if NOT ScreenElementExists \{ id = live_message_container }
        SetScreenElementLock \{ id = root_window Off }
        CreateScreenElement \{ type = ContainerElement parent = root_window id = live_message_container z_priority = 100 }
    else
        SetScreenElementLock \{ id = live_message_container Off }
    endif
endscript

script xboxlive_message_container_show 
    if ScreenElementExists \{ id = live_message_container }
        DoScreenElementMorph \{ id = live_message_container alpha = 1 }
    endif
endscript

script xboxlive_message_container_hide 
    if ScreenElementExists \{ id = live_message_container }
        DoScreenElementMorph \{ id = live_message_container alpha = 0 }
    endif
endscript

script xboxlive_menu_notify id = xbox_notification invite = 5
    if menu_stack_can_pop_menu
        return 
    endif
    xboxlive_menu_notify_kill <...> 
    xboxlive_menu_message_container_create_if_needed
    texture = white2
    xboxlive_menu_friends_get_invite_sprites
    GetArraySize sprites
    i = 0
    begin 
    if ((<sprites> [ <i> ].val)= <invite>)
        texture = (<sprites> [ <i> ].texture)
        break 
    endif
    i = (<i> + 1)
    repeat <array_size>
    CreateScreenElement {
        type = SpriteElement
        parent = live_message_container
        id = <id>
        texture = <texture>
        Pos = (50.0, 400.0)
        just = [ center center ]
        Scale = 0
        rgba = [ 128 128 128 128 ]
    }
    RunScriptOnScreenElement id = <id> xboxlive_menu_notify_flash
endscript

script xboxlive_menu_notify_clone_sprite clone_pos = (0.0, 0.0)
    if NOT ScreenElementExists id = <id>
        return 
    endif
    if NOT ScreenElementExists id = <parent>
        return 
    endif
    GetScreenElementProps id = <id>
    if NOT GotParam texture
        return 
    endif
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = <texture>
        Pos = <clone_pos>
        just = [ center center ]
        Scale = 1
        rgba = [ 128 128 128 128 ]
        z_priority = <z_priority>
    }
endscript

script xboxlive_menu_notify_kill \{ id = xbox_notification }
    if ScreenElementExists id = <id>
        DestroyScreenElement id = <id>
    endif
endscript

script xboxlive_menu_notify_flash 
    begin 
    DoMorph \{ Scale = 1.0 }
    wait \{ 0.7000 seconds }
    DoMorph \{ Scale = 0 }
    wait \{ 0.4000 seconds }
    repeat 4
endscript

script xboxlive_logon_status_create 
    if ScreenElementExists id = xboxlive_status
        xboxlive_logon_status_kill
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = xboxlive_status
        Pos = (315.0, 385.0)
        just = [ left top ]
        z_priority = 2000
    }
    DoScreenElementMorph id = xboxlive_status alpha = 0
    DoScreenElementMorph id = xboxlive_status alpha = 1 time = 0.5000
    CreateScreenElement {
        type = SpriteElement
        parent = xboxlive_status
        Pos = (0.0, 0.0)
        Scale = (10.5, 0.20000000298023224)
        texture = white3
        rgba = [ 0 0 0 100 ]
        alpha = 1
        just = [ left center ]
        z_priority = 2001
    }
    CreateScreenElement {
        type = TextElement
        parent = xboxlive_status
        id = xboxlive_status_text
        Pos = (300.0, 0.0)
        text = 'Anmeldung ...'
        font = dialog
        rgba = [ 128 128 128 128 ]
        alpha = 1
        Scale = 0.8000
        just = [ RIGHT center ]
        z_priority = 2002
    }
endscript

script xboxlive_logon_status_kill 
    if ScreenElementExists \{ id = xboxlive_status }
        DestroyScreenElement \{ id = xboxlive_status }
    endif
endscript

script xboxlive_logon_status_update 
    if NOT GotParam \{ text }
        scriptassert \{ 'no text?' }
    endif
    NetSessionFunc func = save_logon_status params = <...> 
    if NOT ScreenElementExists \{ id = xboxlive_status }
        return 
    endif
    xboxlive_status_text ::obj_killspawnedscript \{ name = xboxlive_logon_status_update_spawned }
    xboxlive_status_text ::obj_spawnscriptlater {
        xboxlive_logon_status_update_spawned
        params = {
            text = <text>
        }
    }
endscript

script xboxlive_logon_status_update_spawned 
    DoMorph \{ alpha = 0 time = 0.2000 }
    obj_getid
    SetScreenElementProps {
        id = <ObjID>
        text = <text>
    }
    DoMorph \{ alpha = 1 time = 0.2000 }
    begin 
    DoMorph \{ alpha = 0.8000 time = 1 }
    DoMorph \{ alpha = 1 time = 1 }
    repeat 
endscript

script xboxlive_voice_attachment_finished 
    if ScreenElementExists \{ id = voice_attachment_anchor }
        xboxlive_menu_stop_recording_voice_message
        DestroyScreenElement \{ id = voice_attachment_anchor }
    endif
endscript

script xboxlive_menu_record_voice_menu_set_button_state 
    if GotParam \{ Off }
        focusable = { not_focusable }
        alpha = 0.3000
    else
        focusable = { focusable }
        alpha = 1.0
    endif
    SetScreenElementProps id = {voice_attachment_buttons child = <button>}<focusable>
    DoScreenElementMorph id = {voice_attachment_buttons child = {<button> child = sprite}}alpha = <alpha>
    DoScreenElementMorph id = {voice_attachment_buttons child = {<button> child = text}}alpha = <alpha>
endscript

script xboxlive_menu_record_voice_menu_process_state 
    if NOT ScreenElementExists id = voice_attachment_anchor
        return 
    endif
    FireEvent type = unfocus target = voice_attachment_anchor
    if GotParam state
        voice_attachment_popup ::settags state = <state>
    else
        voice_attachment_popup ::getsingletag state
    endif
    switch <state>
        case stopped
        SetScreenElementProps id = { voice_attachment_popup child = text }text = 'Angehalten'
        voice_attachment_popup ::getsingletag mode
        if (<mode> = playback)
            xboxlive_menu_record_voice_menu_set_button_state { button = record Off }
            xboxlive_menu_record_voice_menu_set_button_state { button = play on }
            xboxlive_menu_record_voice_menu_set_button_state { button = send on }
        else
            xboxlive_menu_record_voice_menu_set_button_state { button = record on }
            if voice_attachment_popup ::getsingletag has_recorded
                xboxlive_menu_record_voice_menu_set_button_state { button = play on }
                xboxlive_menu_record_voice_menu_set_button_state { button = send on }
            else
                xboxlive_menu_record_voice_menu_set_button_state { button = play Off }
                xboxlive_menu_record_voice_menu_set_button_state { button = send Off }
            endif
        endif
        case playing
        SetScreenElementProps id = { voice_attachment_popup child = text }text = 'Wiedergabe ...'
        xboxlive_menu_record_voice_menu_set_button_state { button = record Off }
        xboxlive_menu_record_voice_menu_set_button_state { button = play Off }
        xboxlive_menu_record_voice_menu_set_button_state { button = send Off }
        case recording
        SetScreenElementProps id = { voice_attachment_popup child = text }text = 'Aufzeichnung ...'
        xboxlive_menu_record_voice_menu_set_button_state { button = record Off }
        xboxlive_menu_record_voice_menu_set_button_state { button = play Off }
        xboxlive_menu_record_voice_menu_set_button_state { button = send Off }
        voice_attachment_popup ::settags has_recorded
    endswitch
    FireEvent type = focus target = voice_attachment_anchor
endscript

script xboxlive_menu_record_voice_menu_create {
        parent = root_window
        cancel_script = xboxlive_voice_attachment_finished
        accept_script = NullScript
        mode = record
    }
    if ScreenElementExists id = voice_attachment_anchor
        DestroyScreenElement id = voice_attachment_anchor
    endif
    xboxlive_dialog_box_exit
    SetScreenElementLock id = <parent> Off
    NetSessionFunc obj = auth func = get_user_device_index
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = voice_attachment_anchor
        focusable_child = voice_attachment_popup
    }
    CreateScreenElement {
        type = ContainerElement
        parent = voice_attachment_anchor
        id = voice_attachment_popup
        Pos = (320.0, 200.0)
        tags = {
            cancel_script = <cancel_script>
            cancel_params = <cancel_params>
            accept_script = <accept_script>
            accept_params = <accept_params>
            mode = <mode>
        }
        event_handlers = [
            {
                pad_back
                generic_menu_pad_back_sound
            }
            {
                pad_back
                xboxlive_menu_cancel_voice_message
            }
        ]
        exclusive_device = <exclusive_device>
        focusable_child = voice_attachment_buttons
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = voice_attachment_popup
        local_id = bg2
        texture = DE_highlight_bar
        Pos = (-4.0, -1.0)
        Scale = (2.700000047683716, 2.9000000953674316)
        rgba = [ 0 0 0 96 ]
        just = [ center center ]
        z_priority = 901.1
    }
    Theme_GetUnhighlightedTextColor return_value = color
    CreateScreenElement {
        type = SpriteElement
        parent = voice_attachment_popup
        local_id = box
        texture = white2
        Pos = (0.0, 29.0)
        Scale = (36.0, 3.0)
        rgba = <color>
        just = [ center center ]
        z_priority = 1002.0
        alpha = 0.2000
    }
    CreateScreenElement {
        type = hmenu
        parent = voice_attachment_popup
        id = voice_attachment_buttons
        Pos = (25.0, 4.0)
        dims = (640.0, 20.0)
        just = [ center center ]
        internal_just = [ center center ]
        z_priority = 1002
        event_handlers = [
            {
                pad_left
                generic_menu_scroll_sideways_sound
            }
            {
                pad_right
                generic_menu_scroll_sideways_sound
            }
        ]
        regular_space_amount = 80
    }
    CreateScreenElement {
        type = TextElement
        parent = voice_attachment_popup
        local_id = text
        text = ''
        font = dialog
        Pos = (0.0, 29.0)
        Scale = (0.8999999761581421, 1.0)
        rgba = [ 128 128 128 128 ]
        just = [ center center ]
        z_priority = 1020
    }
    RunScriptOnScreenElement id = <id> xboxlive_voice_attachment_status_style
    buttons = [
        {
            icon_build = record
            pad_choose_script = xboxlive_menu_record_voice_message
            notify_text = 'Rekord'
        }
        {
            icon_build = stop
            pad_choose_script = xboxlive_menu_stop_recording_voice_message
            notify_text = 'Anhalten'
        }
        {
            icon_build = play
            pad_choose_script = xboxlive_menu_play_voice_message
            notify_text = 'Spielen'
        }
        {
            icon_build = send
            pad_choose_script = xboxlive_menu_send_voice_message
            notify_text = 'Senden'
            notify_text_play = 'Feedback'
        }
    ]
    ForEachIn <buttons> do = xboxlive_voice_attachment_button_add
    create_helper_text {
        parent = voice_attachment_anchor
        helper_text_elements = [
            { text = '\b6/\b5 = Wählen' }
            { text = '\m1 = Abbrechen' }
            { text = '\m0 = OK' }
        ]
    }
    if ScreenElementExists id = current_menu_anchor
        FireEvent type = unfocus target = current_menu_anchor
    endif
    xboxlive_menu_record_voice_menu_process_state state = stopped
endscript

script xboxlive_voice_attachment_button_add 
    voice_attachment_popup ::getsingletag mode
    if (<mode> = playback)
        if GotParam notify_text_play
            <notify_text> = <notify_text_play>
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = voice_attachment_buttons
        local_id = <icon_build>
        dims = (50.0, 50.0)
        event_handlers = [
            {
                pad_choose
                generic_menu_pad_choose_sound
            }
            {
                pad_choose
                <pad_choose_script>
            }
            {
                focus
                xboxlive_voice_attachment_button_focus
            }
            {
                unfocus
                xboxlive_voice_attachment_button_unfocus
            }
        ]
        tags = {
            notify_text = <notify_text>
        }
        just = [ center center ]
    }
    <parent> = <id>
    Theme_GetHighlightedTextColorNew return_value = color
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        local_id = box
        texture = white2
        rgba = <color>
        Scale = 5.200
        just = [ center center ]
        z_priority = 1004.0
        alpha = 0.0
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        local_id = box_mask
        texture = white2
        Scale = 4.500
        rgba = [ 0 0 0 128 ]
        just = [ center center ]
        z_priority = 1005.0
        alpha = 0.0
    }
    CreateScreenElement {
        type = TextElement
        parent = <parent>
        local_id = text
        text = <notify_text>
        font = dialog
        Pos = (0.0, 27.0)
        Scale = 0.7000
        rgba = [ 128 128 128 128 ]
        just = [ center center ]
        z_priority = 1020
        alpha = <icon_alpha>
    }
    switch <icon_build>
        case record
        CreateScreenElement {
            type = SpriteElement
            parent = <parent>
            local_id = sprite
            texture = Circle
            Scale = 1.900
            rgba = [ 90 0 0 128 ]
            just = [ center center ]
            z_priority = 1030
            alpha = 1.0
        }
        case stop
        CreateScreenElement {
            type = SpriteElement
            parent = <parent>
            local_id = sprite
            texture = white2
            Scale = 2.700
            rgba = [ 80 80 80 128 ]
            just = [ center center ]
            z_priority = 1030
            alpha = 1.0
        }
        case play
        CreateScreenElement {
            type = SpriteElement
            parent = <parent>
            local_id = sprite
            texture = right_arrow
            Scale = (1.2000000476837158, 0.8999999761581421)
            rgba = [ 0 105 20 128 ]
            just = [ center center ]
            z_priority = 1030
            alpha = 1.0
        }
        case send
        if (<mode> = playback)
            <texture> = friend
            <Scale> = 1.300
        else
            <texture> = friendsent
            <Scale> = 1.0
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = <parent>
            local_id = sprite
            texture = <texture>
            Scale = <Scale>
            rgba = [ 128 128 128 128 ]
            just = [ center center ]
            z_priority = 1030
            alpha = 1.0
        }
        case default
    endswitch
endscript

script xboxlive_voice_attachment_button_focus 
    obj_getid
    DoScreenElementMorph id = {<ObjID> child = box}alpha = 1.0
    DoScreenElementMorph id = {<ObjID> child = box_mask}alpha = 0.8500
endscript

script xboxlive_voice_attachment_button_unfocus 
    obj_getid
    DoScreenElementMorph id = {<ObjID> child = box}alpha = 0.0
    DoScreenElementMorph id = {<ObjID> child = box_mask}alpha = 0.0
endscript

script xboxlive_voice_attachment_status_style 
    begin 
    DoMorph \{ alpha = 1.0 time = 0.7000 }
    DoMorph \{ alpha = 0.6000 time = 0.7000 }
    repeat 
endscript

script gameinvite_already_in_game 
    create_panel_message {text = ('Du bist bereits im Spiel mit ' + <inviter> + '.')
        time = 5000
    }
endscript

script gameinvite_server_unavailable 
    create_error_box {Title = 'Spieleinladung'
        text = ('Die angenommene Einladung konnte nicht abgeschlossen werden. Das Spiel existiert nicht mehr.')
        buttons = [{text = 'OK' pad_choose_script = xboxlive_menu_create}
        ]
        no_animate
    }
endscript

script failedtocreategame 
    cancel_join_server
    create_error_box {Title = 'Spiel beitreten'
        text = ('Gewähltes Spiel kann nicht betreten werden.')
        buttons = [{ text = 'OK' }
        ]
        no_animate
    }
endscript

script show_disclaimer_push 
    menu_stack_push \{ menu_script = show_disclaimer }
endscript

script show_esrb 
    change \{ xboxlive_shown_esrb_logo = 1 }
    xboxlive_dialog_box \{Title = 'NOTIZ' text = '' sub_logo = ESRB text_dims = (500.0, 0.0) buttons = [{ text = 'Ich will spielen!' pad_choose_script = xboxlive_menu_create }] destroy_on_event = 1}
endscript

script AP_TEST 
    menu_text = (<prompt>)
    xboxlive_dialog_box {
        Title = 'DEBUG'
        text = <menu_text>
        text_dims = (500.0, 0.0)
        buttons = [{text = 'Weiter' pad_choose_script = <back_script>}]
        destroy_on_event = 1
    }
endscript
