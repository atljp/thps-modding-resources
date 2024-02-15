dialup_authentication_types = [
    { name = 'Ja' checksum = yes }
    { name = 'Nein' checksum = no }
]
device_types = [
    { name = 'Nichts' checksum = device_none }
    { name = 'Netzwerkadapter (Ethernet) (für PlayStation®2)' checksum = device_broadband_pc }
    { name = 'Netzwerkadapter (Ethernet) (für PlayStation®2) (PPPoE)' checksum = device_broadband_pc_pppoe }
    { name = 'USB-Ethernet-Adapter' checksum = device_broadband_usb }
    { name = 'USB-Ethernet-Adapter (PPPoE)' checksum = device_broadband_usb_pppoe }
    { name = 'Modem (Netzwerkadapter für PS2)' checksum = device_sony_modem }
    { name = 'USB-Modem' checksum = device_usb_modem }
]
device_types_pal = [
    { name = 'Nichts' checksum = device_none }
    { name = 'Netzwerkadapter (für PlayStation®2)' checksum = device_broadband_pc }
    { name = 'Netzwerkadapter (für PlayStation®2) (PPPoE)' checksum = device_broadband_pc_pppoe }
    { name = 'USB-Ethernet-Adapter' checksum = device_broadband_usb }
    { name = 'USB-Ethernet-Adapter (PPPoE)' checksum = device_broadband_usb_pppoe }
]
broadband_types = [
    { name = 'Autoerkennung (DHCP)' checksum = ip_dhcp }
    { name = 'Feste IP-Adresse' checksum = ip_static }
]
boolean_types = [
    { name = 'Ja' checksum = boolean_true }
    { name = 'Nein' checksum = boolean_false }
]
on_off_types = [
    { name = 'Ein' checksum = boolean_true }
    { name = 'Aus' checksum = boolean_false }
]
team_types = [
    { name = 'Nichts' checksum = teams_none }
    { name = '2' checksum = teams_two }
    { name = '3' checksum = teams_three }
    { name = '4' checksum = teams_four }
]
config_types = [
    { name = 'Deine Netzwerkkonfiguration' checksum = config_sony }
    { name = 'Manuelle Einstellungen' checksum = config_manual }
]
score_players = [
    { name = 'Spieler zeigen' checksum = score_players }
    { name = 'Teams zeigen' checksum = score_teams }
]
ctf_type = [
    { name = 'Zeitlimit verwenden' checksum = timed_ctf }
    { name = 'Eroberungslimit verwenden' checksum = score_ctf }
]
gold_type = [
    { name = 'Zeitlimit verwenden' checksum = timed_gold }
    { name = 'Punktelimit verwenden' checksum = score_gold }
]
score_type = [
    { name = 'Punkte' checksum = point_scoring }
    { name = 'Tags' checksum = tag_scoring }
]
default_master_servers = [
    { name = '205.147.4.17' }
    { name = '63.241.179.8' }
    { name = '205.147.28.3' }
]
rank_limits = [
    { name = '1' checksum = num_1 num = 1 test_greater_only }
    { name = '2' checksum = num_2 num = 2 }
    { name = '3' checksum = num_3 num = 3 }
    { name = '4' checksum = num_4 num = 4 }
    { name = '5' checksum = num_5 num = 5 }
    { name = '6' checksum = num_6 num = 6 }
    { name = '7' checksum = num_7 num = 7 }
    { name = '8' checksum = num_8 num = 8 }
    { name = '9' checksum = num_9 num = 9 }
    { name = '10' checksum = num_10 num = 10 test_less_only }
]
rank_tests = [
    { name = 'Nichts' checksum = rank_test_none }
    { name = 'Weniger als' checksum = rank_test_less }
    { name = 'Besser als' checksum = rank_test_greater }
]
team_graffiti_mode = [
    { name = 'Kombiniert' checksum = graffiti_team_scoring }
    { name = 'Einzel' checksum = graffiti_individual_scoring }
]
default_taunt_preferences = {
    no_way_string = { ui_string = 'Niemals' }
    your_daddy_string = { ui_string = 'Wer ist der Meister?' }
    props_string = { ui_string = 'Fett' }
    get_some_string = { ui_string = 'Mach hin!' }
}
default_network_preferences = {
    game_type = { ui_string = 'Trick-Turnier' checksum = nettrickattack }
    num_players = { ui_string = '8 Spieler' checksum = num_8 value = 8 }
    private_slots = { ui_string = '0 Spieler' checksum = num_0 value = 0 }
    ranked = { ui_string = 'Standard' checksum = standard value = 1 }
    num_observers = { ui_string = 'Keine Zuschauer' checksum = num_0 value = 0 }
    player_collision = { ui_string = 'Aus' checksum = boolean_false }
    friendly_fire = { ui_string = 'Aus' checksum = boolean_false }
    team_mode = { ui_string = 'Nichts' checksum = teams_none }
    password = { ui_string = '' }
    level = { ui_string = 'Hollywood' checksum = Load_Z_HO }
    goals = { ui_string = 'Klassik-Ziele' checksum = goals_classic }
    server_name = { ui_string = 'Neversoft' }
    network_id = { ui_string = 'ProSkater' }
    ip_address = { ui_string = '192.168.0.10' }
    gateway = { ui_string = '192.168.0.1' }
    subnet_mask = { ui_string = '255.255.0.0' }
    auto_dns = { ui_string = 'Ja' checksum = boolean_true }
    dns_server = { ui_string = '192.168.0.1' }
    dns_server2 = { ui_string = '192.168.0.2' }
    device_type = { ui_string = 'Nichts' checksum = device_none }
    broadband_type = { ui_string = 'Autoerkennung (DHCP)' checksum = ip_dhcp }
    dialup_number = { ui_string = '' }
    dialup_username = { ui_string = '' }
    dialup_password = { ui_string = '' }
    time_limit = { ui_string = '2 Minuten' checksum = time_120 time = 120 }
    target_score = { ui_string = '1.000.000 Punkte' checksum = score_1000000 Score = 1000000 }
    target_tags = { ui_string = '50 Tags' checksum = tags_50 Score = 50 }
    host_name = { ui_string = '' }
    domain_name = { ui_string = '' }
    dialup_authentication = { ui_string = 'Ja' checksum = boolean_true }
    skill_level = { ui_string = '3: Ich kann das' checksum = num_3 }
    use_default_master_servers = { ui_string = 'Ja' checksum = boolean_true }
    master_server1 = { ui_string = '0.0.0.0' }
    master_server2 = { ui_string = '0.0.0.0' }
    dialup_number2 = { ui_string = '' }
    dialup_number3 = { ui_string = '' }
    signed_disclaimer = { ui_string = 'Nein' checksum = boolean_false }
    profile_email = { ui_string = '' }
    profile_password = { ui_string = '' }
    profile_password_confirm = { ui_string = '' }
    profile_success = { ui_string = 'Nein' checksum = boolean_false }
    profile_warning_shown = { ui_string = 'Nein' checksum = boolean_false }
    profile_cdkey = { ui_string = 'dnaletsawnacirema' }
    config_type = { ui_string = 'Nichts' checksum = config_sony }
    unique_id = { ui_string = '123456789' }
    auto_brake = { ui_string = 'Ein' checksum = boolean_true }
    show_names = { ui_string = 'Ein' checksum = boolean_true }
    score_display = { ui_string = 'Spieler zeigen' checksum = score_players }
    gold_game_type = { ui_string = 'Zeitlimit verwenden' checksum = timed_gold }
    ctf_game_type = { ui_string = 'Zeitlimit verwenden' checksum = timed_ctf }
    score_mode = { ui_string = 'Punkte' checksum = point_scoring }
    stop_at_zero = { ui_string = 'Nein' checksum = boolean_false }
    score_reset = { ui_string = 'Nein' checksum = boolean_false }
    face_dl_key = { ui_string = '' }
    fireball_difficulty = { ui_string = '3' checksum = num_3 fireball_level = 3 }
    rank_limit = { ui_string = '9' checksum = num_9 num = 9 }
    rank_test = { ui_string = 'Nichts' checksum = rank_test_none }
    team_graffiti_mode = { ui_string = 'Kombiniert' checksum = graffiti_team_scoring }
    game_type_optimatch = { ui_string = 'Keine Präferenz' checksum = dont_care }
    num_players_optimatch = { ui_string = 'Keine Präferenz' checksum = dont_care }
    level_optimatch = { ui_string = 'Keine Präferenz' checksum = dont_care }
    skill_level_optimatch = { ui_string = 'Keine Präferenz' checksum = dont_care }
    buddy_array = [
    ]
}

script launch_network_options_menu 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_network_options_menu }
endscript

script back_from_net_options_menu 
    go_to_sub_menu = 0
    PauseMusicAndStreams
    if IsTrue InNetOptionsFromNetPlay
        printf '********************* InNetOptionsFromNetPlay *******************'
        go_to_sub_menu = 1
    else
        if IsTrue InNetOptionsFromFaceDownload
            printf '********************* InNetOptionsFromFaceDownload *******************'
            go_to_sub_menu = 1
        endif
    endif
    if (<go_to_sub_menu> = 1)
        GetPreferenceChecksum pref_type = network device_type
        switch <checksum>
            case device_sony_modem
            case device_usb_modem
            GetPreferenceString pref_type = network dialup_number
            if (<ui_string> = '')
                if IsTrue InNetOptionsFromNetPlay
                    create_ss_menu
                else
                    face_back_from_net_setup
                endif
            else
                FormatText textname = msg_text '***** NOT EMPTY, WAS %s *****' s = <ui_string>
                printf <msg_text>
                if ObjectExists id = current_menu_anchor
                    DestroyScreenElement id = current_menu_anchor
                endif
                if IsTrue InNetOptionsFromNetPlay
                    do_network_setup error_script = back_from_startup_error_dialog success_script = net_setup_from_net_play_successful need_setup_script = create_net_startup_need_setup_dialog
                else
                    do_network_setup error_script = face_back_from_net_setup success_script = create_face_download_menu_from_net_setup need_setup_script = face_create_net_startup_need_setup_dialog
                endif
            endif
            case device_none
            if IsTrue InNetOptionsFromNetPlay
                create_ss_menu
            else
                face_back_from_net_setup
            endif
            default 
            if ObjectExists id = current_menu_anchor
                DestroyScreenElement id = current_menu_anchor
            endif
            if IsTrue InNetOptionsFromNetPlay
                do_network_setup error_script = back_from_startup_error_dialog success_script = net_setup_from_net_play_successful need_setup_script = create_net_startup_need_setup_dialog
            else
                do_network_setup error_script = face_back_from_net_setup success_script = create_face_download_menu_from_net_setup need_setup_script = face_create_net_startup_need_setup_dialog
            endif
        endswitch
        change InNetOptionsFromNetPlay = 0
        change InNetOptionsFromFaceDownload = 0
        UnpauseMusicAndStreams
    else
        launch_ss_menu
        UnpauseMusicAndStreams
    endif
endscript

script net_options_menu_back_from_keyboard 
    destroy_onscreen_keyboard
    create_network_options_menu
endscript

script net_options_set_connection_preference 
    GetTextElementString \{ id = keyboard_current_string }
    SetPreferencesFromUI prefs = network <...> 
    destroy_onscreen_keyboard
    create_network_options_menu
endscript

script launch_onscreen_keyboard_from_net_options_menu 
    pulse_blur
    create_onscreen_keyboard {in_ss allow_cancel keyboard_cancel_script = net_options_menu_back_from_keyboard keyboard_done_script = net_options_set_connection_preference keyboard_title = <Title> <...> }
endscript

script create_network_options_menu 
    skater ::unhide
    make_label_menu Pos = (120.0, 100.0) Title = 'ONLINE-EINSTELLUNGEN' title_pos = (90.0, 25.0) title_rotation = 2 pad_back_script = generic_menu_pad_back pad_back_params = { callback = back_from_net_options_menu }
    UnpauseMusicAndStreams
    if InFrontend
        build_top_and_bottom_blocks
    endif
    create_helper_text = generic_helper_text Pos = (225.0, 109.0)
    GetPreferenceString pref_type = network network_id
    if isPC
        add_label_menu_item {text = 'Spielername'
            rot = 2
            id = menu_player_name
            pad_choose_script = ss_menu_exit
            pad_choose_params = {new_menu_script = launch_onscreen_keyboard_from_net_options_menu
                field = 'network_id'
                text = <ui_string>
                Title = 'SPIELERNAME'
                min_length = 3
                max_length = 20
                highlight_bar_scale = (1.399999976158142, 1.2999999523162842)
            }
        }
    else
        add_label_menu_item {text = 'Spielername'
            rot = 2
            id = menu_player_name
            pad_choose_script = ss_menu_exit
            pad_choose_params = {new_menu_script = launch_onscreen_keyboard_from_net_options_menu
                field = 'network_id'
                text = <ui_string>
                Title = 'SPIELERNAME'
                min_length = 1
                max_length = 14
                highlight_bar_scale = (1.399999976158142, 1.2999999523162842)
            }
        }
    endif
    theme_menu_add_item text = <ui_string> id = menu_player_name_str centered not_focusable
    if NOT isPC
        add_label_menu_item {text = 'Netzwerkkonfiguration'
            rot = -2
            id = menu_network_configuration
            pad_choose_script = ss_menu_exit
            pad_choose_params = { new_menu_script = _CreationOptionsLoadNetConfig }
        }
        GetPreferenceString pref_type = network config_type
        ShortenUIString ui_string = <ui_string> max_len = 23
        theme_menu_add_item text = <short_ui_string> id = menu_network_configuration_str centered not_focusable middle_scale = (4.25, 1.0)
    endif
    add_label_menu_item text = 'Einstellungen speichern' id = network_option_save pad_choose_script = launch_save_network_settings rot = 3
    add_label_menu_item text = 'Einstellungen laden' id = network_option_load pad_choose_script = maybe_load_net_settings rot = 4
    add_label_menu_item text = 'Fertig' id = network_option_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = back_from_net_options_menu }rot = -4
    label_menu_finish
endscript

script maybe_load_net_settings 
    skater ::hide
    launch_load_network_settings
endscript

script launch_configuration_choices_menu 
    DestroyScreenElement id = current_menu_anchor
    make_new_themed_sub_menu Title = 'NETZWERKKONFIGURATION' title_scale = 1.700 skateshop_pos = (240.0, 72.0)
    build_top_and_bottom_blocks
    create_helper_text = generic_helper_text
    SetScreenElementProps id = sub_vmenu event_handlers = [{ pad_back launch_network_options_menu }]
    theme_menu_add_item text = 'Deine Netzwerkkonfigurationsdateien' id = network_config_load_config pad_choose_script = choose_sony_combination centered
    theme_menu_add_item text = 'Manuelle Einstellungen' id = network_option_manual_setup pad_choose_script = choose_manual_setup last_menu_item = last_menu_item centered
    finish_themed_sub_menu
endscript

script choose_sony_combination 
    launch_load_net_config
endscript

script choose_manual_setup 
    GetPreferenceChecksum \{ pref_type = network config_type }
    switch <checksum>
        case config_sony
        clear_net_options
    endswitch
    SetPreferencesFromUI \{ prefs = network field = 'config_type' string = 'Manuelle Einstellungen' checksum = config_manual }
    launch_manual_net_setup
endscript

script clear_config_type 
    SetPreferencesFromUI \{ prefs = network field = 'config_type' string = 'Nichts' checksum = config_sony }
endscript

script clear_device_type 
    SetPreferencesFromUI \{ prefs = network field = 'device_type' string = 'Nichts' checksum = device_none }
endscript

script clear_net_options 
    SetPreferencesFromUI prefs = network field = 'dialup_number' string = ''
    SetPreferencesFromUI prefs = network field = 'dialup_username' string = ''
    SetPreferencesFromUI prefs = network field = 'dialup_password' string = ''
    SetPreferencesFromUI prefs = network field = 'broadband_type' string = 'Autoerkennung (DHCP)' checksum = ip_dhcp
    SetPreferencesFromUI prefs = network field = 'ip_address' string = '192.168.0.10'
    SetPreferencesFromUI prefs = network field = 'gateway' string = '192.168.0.1'
    SetPreferencesFromUI prefs = network field = 'subnet_mask' string = '255.255.0.0'
    SetPreferencesFromUI prefs = network field = 'dns_server' string = '0.0.0.0'
    SetPreferencesFromUI prefs = network field = 'dns_server2' string = '0.0.0.0'
    SetPreferencesFromUI prefs = network field = 'auto_dns' string = 'Ja' checksum = boolean_true
    SetPreferencesFromUI prefs = network field = 'host_name' string = ''
    SetPreferencesFromUI prefs = network field = 'domain_name' string = ''
    SetPreferencesFromUI prefs = network field = 'dialup_authentication' string = 'Ja' checksum = boolean_true
endscript

script launch_load_net_config 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = _CreationOptionsLoadNetConfig }
endscript

script _CreationOptionsLoadNetConfig 
    SpawnScriptLater \{ CreationOptionsLoadNetConfig }
endscript

script back_from_load_net_config 
    memcard_menus_cleanup
    dialog_box_exit
    create_network_options_menu
endscript

script CreationOptionsLoadNetConfig 
    printf '----'
    printf 'CreationOptionsLoadNetConfig'
    printf '----'
    printstruct <...> 
    change RetryScript = CreationOptionsLoadNetConfig
    change AbortScript = back_from_load_net_config
    change SavingOrLoading = loading
    check_card
    if LoadNetConfigs
        dialog_box_exit
        if GotParam invalid_configs
            create_error_box {Title = net_status_msg
                title_scale = 0.9600
                Scale = 1.0
                text = net_error_no_useful_configs
                buttons = [{text = 'OK' pad_choose_script = back_from_load_net_config}
                ]
            }
        else
            if NoNetConfigFiles
                create_error_box {Title = 'Nichts gefunden'
                    text = net_error_no_net_configs
                    buttons = [{text = 'OK' pad_choose_script = back_from_load_net_config}
                    ]
                }
            else
                create_load_net_config_menu
            endif
        endif
    else
        dialog_box_exit
        if GotParam corrupt
            create_error_box {Title = net_error_msg
                text = 'Ihre Netzwerkkonfigurationsdatei ist beschädigt und kann nicht verwendet werden.'
                buttons = [{text = 'OK' pad_choose_script = back_from_load_net_config}
                ]
            }
        else
            create_error_box {Title = net_error_msg
                text = 'Diese Netzwerkkonfigurationsdatei wurde auf einer anderen Konsole erstellt und kann nicht benutzt werden.'
                buttons = [{text = 'OK' pad_choose_script = back_from_load_net_config}
                ]
            }
        endif
    endif
endscript

script choose_net_config 
    change \{ needstotestdnas = 1 }
    ChooseNetConfig <...> 
    launch_network_options_menu
endscript

script create_load_net_config_menu 
    printf * * * create_load_net_config_menu * * * 
    make_new_themed_sub_menu Title = 'NETZWERKKONFIGURATION LADEN' title_scale = 1.400 skateshop_pos = (230.0, 72.0)
    build_top_and_bottom_blocks
    create_helper_text = generic_helper_text
    SetScreenElementProps {id = sub_vmenu event_handlers = [
            { pad_back launch_network_options_menu }
        ]
    }
    if NOT isPC
        FillNetConfigList
    endif
    theme_menu_add_item text = 'Zurück' Scale = 0.8000 focus_script = main_theme_focus_noscale unfocus_script = main_theme_unfocus_noscale id = network_option_connection_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_network_options_menu }last_menu_item = last_menu_item centered
    finish_themed_sub_menu
endscript

script launch_manual_net_setup 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_manual_net_setup }
endscript

script create_manual_net_setup 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if InFrontend
        make_new_themed_sub_menu Title = 'NETZWERK-SETUP'
    else
        make_new_themed_sub_menu Title = 'NETZWERK-SETUP' skateshop_pos = (135.0, 55.0)
    endif
    if InFrontend
        build_top_and_bottom_blocks
    endif
    create_helper_text = generic_helper_text
    SetScreenElementProps {id = sub_vmenu event_handlers = [
            { pad_back launch_network_options_menu }
        ]
    }
    GetPreferenceString pref_type = network network_id
    theme_menu_add_item text = 'Online-Spielername' id = network_option_player_name pad_choose_script = launch_onscreen_keyboard_from_setup_menu pad_choose_params = {field = 'network_id' text = <ui_string> Title = 'NETZWERK-SPIELERNAME' min_length = 1 max_length = 14}centered
    theme_menu_add_item text = <ui_string> font = dialog id = network_option_player_name_string rgba = [ 80 80 80 128 ] Scale = 0.8000 not_focusable = not_focusable centered
    GetPreferenceChecksum pref_type = network device_type
    if (<checksum> = device_none)
        GetPreferenceString pref_type = network device_type
        theme_menu_add_item text = 'Hardware-Setup' id = network_option_hardware_setup pad_choose_script = launch_hardware_setup centered
        theme_menu_add_item text = <ui_string> font = dialog id = network_option_hardware_setup_string rgba = [ 80 80 80 128 ] Scale = 0.7000 not_focusable = not_focusable centered
    else
        GetPreferenceString pref_type = network device_type
        theme_menu_add_item text = 'Hardware-Setup' id = network_option_hardware_setup pad_choose_script = launch_hardware_setup centered
        theme_menu_add_item text = <ui_string> font = dialog id = network_option_hardware_setup_string rgba = [ 80 80 80 128 ] Scale = 0.7000 not_focusable = not_focusable centered
        GetPreferenceChecksum pref_type = network device_type
        theme_menu_add_item text = 'Verbindungseinstellungen' id = network_option_connection_settings pad_choose_script = launch_connection_settings centered
    endif
    theme_menu_add_item text = 'Fertig' id = network_option_connection_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_network_options_menu }last_menu_item = last_menu_item centered
    finish_themed_sub_menu
endscript

script launch_onscreen_keyboard_from_setup_menu 
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_setup_onscreen_keyboard callback_params = {allow_cancel keyboard_cancel_script = net_setup_back_from_keyboard keyboard_done_script = set_connection_preference keyboard_title = <Title> <...> }
endscript

script pre_create_setup_onscreen_keyboard 
    create_onscreen_keyboard <...> 
endscript

script launch_phone_entry 
    launch_onscreen_keyboard <...> allowed_characters = ['1' '2' '3' '4' '5' '6' '7' '8' '9' '0' '-' ',' '*' '#']
endscript

script launch_email_keyboard 
    launch_onscreen_keyboard_from_profile_menu <...> allowed_characters = ['1' '2' '3' '4' '5' '6' '7' '8' '9' '0'
        'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j'
        'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't'
        'u' 'v' 'w' 'x' 'y' 'z'
        'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J'
        'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T'
        'U' 'V' 'W' 'X' 'Y' 'Z'
        '.' '-' '_' '@']
endscript

script launch_ip_entry 
    launch_onscreen_keyboard <...> allowed_characters = ['1' '2' '3' '4' '5' '6' '7' '8' '9' '0''.']
endscript

script launch_onscreen_keyboard 
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_setup_onscreen_keyboard callback_params = {allow_cancel keyboard_cancel_script = net_options_back_from_keyboard keyboard_done_script = set_manual_connection_preference keyboard_title = <Title> <...> }
endscript

script back_from_hardware_setup_refused_dialog 
    dialog_box_exit
    create_manual_net_setup
endscript

script back_from_load_refused_dialog 
    dialog_box_exit
    create_network_options_menu
endscript

script launch_hardware_setup_refused_dialog 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_hardware_setup_refused_dialog }
endscript

script create_hardware_setup_refused_dialog 
    create_dialog_box \{Title = net_notice_msg text = net_error_cant_change_device buttons = [{ text = 'OK' pad_choose_script = back_from_hardware_setup_refused_dialog }]}
endscript

script create_net_load_refused_dialog 
    create_dialog_box \{Title = net_notice_msg text = net_error_cant_load_settings buttons = [{ text = 'Zurück' pad_choose_script = back_from_load_refused_dialog }{ text = 'Neu starten' pad_choose_script = restart_ps2 }]}
endscript

script restart_ps2 
    if IsPAL
        if IsFrench
            LoadExecPS2 \{ elf = 'cdrom0:\SLES_522.90' }
        else
            LoadExecPS2 \{ elf = 'cdrom0:\SLES_512.97' }
        endif
    else
        LoadExecPS2 \{ elf = 'cdrom0:\SLUS_203.99' }
    endif
endscript

script launch_hardware_setup 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_hardware_setup_menu }
endscript

script launch_connection_settings 
    if ObjectExists \{ id = current_menu_anchor }
        RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_connection_settings }
    else
        dialog_box_exit
        create_connection_settings
    endif
endscript

script create_connection_settings 
    GetPreferenceChecksum \{ pref_type = network device_type }
    switch <checksum>
        case device_broadband_pc
        case device_broadband_usb
        create_ethernet_connection_settings_menu
        case device_broadband_pc_pppoe
        case device_broadband_usb_pppoe
        create_pppoe_connection_settings_menu
        default 
        create_modem_connection_settings_menu
    endswitch
endscript

script launch_connection_type_sub_menu 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_connection_type_sub_menu }
endscript

script launch_connection_auto_dns_sub_menu 
    if GotParam \{ always_allow }
        RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_connection_auto_dns_sub_menu }
    else
        RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_connection_auto_dns_sub_menu }
    endif
endscript

script launch_connection_use_auth_sub_menu 
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen callback = create_connection_use_auth_sub_menu }
endscript

script create_hardware_setup_menu 
    make_new_themed_sub_menu Title = 'HARDWARE-SETUP' skateshop_pos = (180.0, 55.0)
    if InFrontend
        build_top_and_bottom_blocks
    endif
    SetScreenElementProps {id = sub_vmenu event_handlers = [
            { pad_back launch_manual_net_setup }
        ]
    }
    create_hardware_setup_device_sub_menu
    create_helper_text generic_helper_text
    if InFrontend
        CreateScreenElement {type = TextElement parent = sub_menu font = dialog rgba = [ 60 60 60 100 ] text = '* Die meisten DSL-Benutzer sollten PPPoE-Geräte wählen.' Scale = 0.7000 Pos = (250.0, 250.0)}
    else
        CreateScreenElement {type = TextElement parent = sub_menu font = dialog rgba = [ 60 60 60 100 ] text = '* Die meisten DSL-Benutzer sollten PPPoE-Geräte wählen.' Scale = 0.7000 Pos = (250.0, 275.0)}
    endif
    finish_themed_sub_menu
endscript

script create_ethernet_connection_settings_menu 
    make_new_themed_sub_menu Title = 'NETZWERK-SETUP' skateshop_pos = (110.0, 55.0)
    if InFrontend
        build_top_and_bottom_blocks
    endif
    SetScreenElementProps {id = sub_vmenu event_handlers = [
            { pad_back launch_manual_net_setup }
        ]
    }
    create_helper_text generic_helper_text
    GetPreferenceString pref_type = network broadband_type
    theme_menu_add_centered_item text = 'Typ' id = network_connection_type pad_choose_script = launch_connection_type_sub_menu
    theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_type_string rgba = [ 80 80 80 128 ] Scale = 0.8000 not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceChecksum pref_type = network broadband_type
    if (<checksum> = ip_static)
        GetPreferenceString pref_type = network ip_address
        theme_menu_add_centered_item text = 'IP-Adresse' id = network_connection_ip pad_choose_script = launch_ip_entry pad_choose_params = {field = 'ip_address' text = <ui_string> Title = 'IP-ADRESSE' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_ip_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
        GetPreferenceString pref_type = network gateway
        theme_menu_add_centered_item text = 'Gateway' id = network_connection_gateway pad_choose_script = launch_ip_entry pad_choose_params = {field = 'gateway' text = <ui_string> Title = 'GATEWAY' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_gateway_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
        GetPreferenceString pref_type = network subnet_mask
        theme_menu_add_centered_item text = 'Subnet Mask' id = network_connection_subnet pad_choose_script = launch_ip_entry pad_choose_params = {field = 'subnet_mask' text = <ui_string> Title = 'SUBNET MASK' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_subnet_mask_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    else
        GetPreferenceString pref_type = network host_name
        theme_menu_add_centered_item text = '* Hostname' id = network_connection_hostname pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'host_name' text = <ui_string> Title = 'HOSTNAME' min_length = 0 max_length = 31}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_hostname_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
        GetPreferenceString pref_type = network auto_dns
        theme_menu_add_centered_item text = 'DNS-Server automatisch beziehen?' id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu pad_choose_params = { always_allow }
        theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    endif
    GetPreferenceChecksum pref_type = network auto_dns
    if (<checksum> = boolean_false)
        GetPreferenceString pref_type = network dns_server
        theme_menu_add_centered_item text = 'DNS-Server 1' id = network_connection_dns_1 pad_choose_script = launch_ip_entry pad_choose_params = {field = 'dns_server' text = <ui_string> Title = 'DNS-SERVER 1' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
        GetPreferenceString pref_type = network dns_server2
        theme_menu_add_centered_item text = 'DNS-Server 2' id = network_connection_dns_2 pad_choose_script = launch_ip_entry pad_choose_params = {field = 'dns_server2' text = <ui_string> Title = 'DNS-SERVER 2' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    endif
    GetPreferenceChecksum pref_type = network broadband_type
    if (<checksum> = ip_dhcp)
        theme_menu_add_centered_item text = '* von einigen ISPs benötigt' id = hostname_footnote not_focusable = not_focusable rgba = [ 80 80 80 128 ] Scale = 0.7000
    endif
    theme_menu_add_centered_item text = 'Fertig' pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_manual_net_setup }last_menu_item = last_menu_item
    finish_themed_sub_menu
endscript

script create_pppoe_connection_settings_menu 
    make_new_themed_sub_menu Title = 'EINSTELLUNGEN' skateshop_pos = (110.0, 55.0)
    build_top_and_bottom_blocks
    SetScreenElementProps {id = sub_vmenu event_handlers = [
            { pad_back launch_manual_net_setup }
        ]
    }
    create_helper_text generic_helper_text
    GetPreferenceString pref_type = network dialup_username
    theme_menu_add_centered_item text = 'Username' id = network_connection_username pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'dialup_username' text = <ui_string> Title = 'USERNAME' min_length = 1 max_length = 47}
    theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_username_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceString pref_type = network dialup_password
    GetPreferencePassword pref_type = network dialup_password
    theme_menu_add_centered_item text = 'Passwort' id = network_connection_password pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'dialup_password' text = <ui_string> Title = 'PASSWORT' min_length = 1 max_length = 47 password}
    theme_menu_add_centered_item text = <password_string> id = network_connection_password_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceChecksum pref_type = network auto_dns
    GetPreferenceString pref_type = network auto_dns
    theme_menu_add_centered_item text = 'DNS-Server automatisch beziehen?' id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu pad_choose_params = { always_allow }
    theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    if (<checksum> = boolean_false)
        GetPreferenceString pref_type = network dns_server
        theme_menu_add_centered_item text = 'DNS-Server 1' id = network_connection_dns_1 pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'dns_server' text = <ui_string> Title = 'DNS-SERVER 1' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
        GetPreferenceString pref_type = network dns_server2
        theme_menu_add_centered_item text = 'DNS-Server 2' id = network_connection_dns_2 pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'dns_server2' text = <ui_string> Title = 'DNS-SERVER 2' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] Scale = 0.8000 font = dialog not_focusable = not_focusable box_it_up = box_it_up
    endif
    theme_menu_add_centered_item text = '' not_focusable = not_focusable last_menu_item = last_menu_item
    finish_themed_sub_menu
endscript

script create_modem_connection_settings_menu 
    make_new_themed_sub_menu Title = 'EINSTELLUNGEN' skateshop_pos = (110.0, 55.0)
    build_top_and_bottom_blocks
    SetScreenElementProps {id = sub_vmenu event_handlers = [
            { pad_back launch_manual_net_setup }
        ]
    }
    create_helper_text generic_helper_text
    GetPreferenceChecksum pref_type = network auto_dns
    if (<checksum> = boolean_false)
        Scale = 1.0
    else
        Scale = 0.8000
    endif
    GetPreferenceString pref_type = network dialup_number
    theme_menu_add_centered_item text = 'ISP-Rufnummer' id = network_connection_isp_phone pad_choose_script = launch_phone_entry pad_choose_params = {field = 'dialup_number' text = <ui_string> Title = 'ISP-RUFNUMMER' min_length = 7 max_length = 20}
    theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_isp_phone_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceString pref_type = network dialup_username
    theme_menu_add_centered_item text = 'Username' id = network_connection_username pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'dialup_username' text = <ui_string> Title = 'USERNAME' min_length = 1 max_length = 36}
    theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_username_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceString pref_type = network dialup_password
    GetPreferencePassword pref_type = network dialup_password
    theme_menu_add_centered_item text = 'Passwort' id = network_connection_password pad_choose_script = launch_onscreen_keyboard pad_choose_params = {field = 'dialup_password' text = <ui_string> Title = 'PASSWORT' min_length = 1 max_length = 36 password}
    theme_menu_add_centered_item text = <password_string> id = network_connection_password_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceChecksum pref_type = network dialup_authentication
    GetPreferenceString pref_type = network dialup_authentication
    theme_menu_add_centered_item text = 'Authentifikation verwenden?' id = network_connection_use_auth pad_choose_script = launch_connection_use_auth_sub_menu
    theme_menu_add_centered_item text = <ui_string> id = network_connection_use_auth_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceString pref_type = network auto_dns
    theme_menu_add_centered_item text = 'DNS-Server automatisch beziehen?' id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu
    theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
    GetPreferenceChecksum pref_type = network auto_dns
    if (<checksum> = boolean_false)
        GetPreferenceString pref_type = network dns_server
        theme_menu_add_centered_item text = 'DNS-Server 1' id = network_connection_dns_1 pad_choose_script = launch_ip_entry pad_choose_params = {field = 'dns_server' text = <ui_string> Title = 'DNS-SERVER 1' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
        GetPreferenceString pref_type = network dns_server2
        theme_menu_add_centered_item text = 'DNS-Server 2' id = network_connection_dns_2 pad_choose_script = launch_ip_entry pad_choose_params = {field = 'dns_server2' text = <ui_string> Title = 'DNS-SERVER 2' min_length = 7 max_length = 15}
        theme_menu_add_centered_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] Scale = <Scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up
        DoScreenElementMorph id = sub_vmenu Scale = 0.8500 Pos = (100.0, 60.0)
    endif
    theme_menu_add_centered_item text = '' not_focusable = not_focusable last_menu_item = last_menu_item
    finish_themed_sub_menu
endscript

script select_connection_option 
    SetPreferencesFromUI <...> 
    if (<checksum> = ip_static)
        SetPreferencesFromUI prefs = <prefs> field = 'auto_dns' checksum = boolean_false string = 'Nein'
    else
        if (<checksum> = ip_dhcp)
            SetPreferencesFromUI prefs = <prefs> field = 'auto_dns' checksum = boolean_true string = 'Ja'
        endif
    endif
    launch_connection_settings
endscript

script select_hardware_option 
    SetPreferencesFromUI <...> 
    launch_manual_net_setup
endscript

script create_hardware_setup_sub_menu 
    generic_array_menu_setup <...> 
endscript

script create_hardware_setup_device_sub_menu 
    if IsPAL
        create_hardware_setup_sub_menu pref_type = network pref_field = 'device_type' array = device_types_pal call_script = select_hardware_option highlight_bar_scale = <highlight_bar_scale> Scale = <Scale>
    else
        create_hardware_setup_sub_menu pref_type = network pref_field = 'device_type' array = device_types call_script = select_hardware_option highlight_bar_scale = <highlight_bar_scale> Scale = <Scale>
    endif
endscript

script create_connection_type_sub_menu 
    menu_title = 'Verbindungsart'
    pref_type = network
    pref_field = 'broadband_type'
    array = broadband_types
    call_script = select_connection_option
    create_dialog_box {Title = <menu_title>
        text = 'Welche Art von Verbindung verwendest du?'
        buttons = [{text = 'Autoerkennung (DHCP)' pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = 'Autoerkennung (DHCP)' checksum = ip_dhcp <...> }}
            {text = 'Feste IP-Adresse' pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = 'Feste IP-Adresse' checksum = ip_static <...> }}
        ]
    }
endscript

script create_connection_auto_dns_sub_menu 
    menu_title = 'DNS-Server'
    pref_type = network
    pref_field = 'auto_dns'
    array = boolean_types
    call_script = select_connection_option
    create_dialog_box {Title = <menu_title>
        text = 'Möchtest du automatisch DNS-Server beziehen?'
        buttons = [{text = 'Ja' pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = 'Ja' checksum = boolean_true <...> }}
            {text = 'Nein' pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = 'Nein' checksum = boolean_false <...> }}
        ]
    }
endscript

script create_connection_use_auth_sub_menu 
    menu_title = 'Authentifikation'
    pref_type = network
    pref_field = 'dialup_authentication'
    array = boolean_types
    call_script = select_connection_option
    create_dialog_box {Title = <menu_title>
        text = 'Authentifikation verwenden?'
        buttons = [{text = 'Ja' pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = 'Ja' checksum = boolean_true <...> }}
            {text = 'Nein' pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = 'Nein' checksum = boolean_false <...> }}
        ]
    }
endscript

script set_connection_preference 
    GetTextElementString \{ id = keyboard_current_string }
    SetPreferencesFromUI prefs = network <...> 
    destroy_onscreen_keyboard
    create_manual_net_setup
endscript

script ss_set_connection_preference 
    GetTextElementString \{ id = keyboard_current_string }
    SetPreferencesFromUI prefs = network <...> 
    destroy_onscreen_keyboard
    launch_ss_menu
endscript

script set_manual_connection_preference 
    GetTextElementString \{ id = keyboard_current_string }
    SetPreferencesFromUI prefs = network <...> 
    destroy_onscreen_keyboard
    create_connection_settings
endscript

script net_options_back_from_keyboard 
    destroy_onscreen_keyboard
    create_connection_settings
endscript

script net_setup_back_from_keyboard 
    destroy_onscreen_keyboard
    create_manual_net_setup
endscript

script ss_menu_back_from_keyboard 
    destroy_onscreen_keyboard
    launch_ss_menu \{ no_animate }
endscript

script back_from_startup_error_dialog 
    printf '**** in back_from_startup_error_dialog'
    NetSessionFunc func = match_uninit
    NetSessionFunc func = content_uninit
    NetSessionFunc func = presence_uninit
    NetSessionFunc func = stats_uninit
    if NOT isPC
        change NeedsToDownloadStats = 1
    endif
    UnpauseMusicAndStreams
    dialog_box_exit
    if ObjectExists id = select_skater_anchor
        DestroyScreenElement id = select_skater_anchor
        restore_start_key_binding
    endif
    skater ::obj_movetonode name = Z_mainmenu_TRG_Playerrestart orient NoReset
    skater ::cancelrotatedisplay
    create_main_menu
endscript

script create_net_startup_error_dialog 
    create_dialog_box {Title = net_error_msg
        text = <text>
        buttons = [{text = 'OK' pad_choose_script = <error_script>}
        ]
    }
endscript

script go_to_connection_setup_from_dialog 
    dialog_box_exit
    change \{ InNetOptionsFromNetPlay = 1 }
    change \{ InNetOptionsFromFaceDownload = 0 }
    create_network_options_menu
endscript

script create_net_startup_need_setup_dialog 
    printf \{ '**** in create_net_startup_need_setup_dialog' }
    create_dialog_box {Title = net_status_msg
        text = <text>
        buttons = [{text = ' Ja ' pad_choose_script = go_to_connection_setup_from_dialog}
            {text = ' Nein ' pad_choose_script = <error_script>}
        ]
    }
endscript

script create_testing_network_settings_dialog 
    create_dialog_box \{ Title = net_status_msg text = net_status_testing_settings }
endscript
