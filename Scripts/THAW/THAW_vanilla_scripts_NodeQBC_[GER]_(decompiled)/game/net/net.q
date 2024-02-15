UseSessionAPI = 1
InNetOptionsFromNetPlay = 0
InNetOptionsFromFaceDownload = 0
has_accepted_dnas = 1
SkipDNASAuthentication = 0
needstotestdnas = 1
InFaceMapEditor = 0
NeedsToDownloadMOTD = 1
NeedsToDownloadStats = 0
SignedDisclaimer = 0
signedin = 0
SigningIn = 0
WaitingForSignInToComplete = 0
CheckedForGameInvite = 0
gamespyproductid = 10696
gamespygamename = 'thawpc'
gamespysecretkey = 'v8la4w'
gamespydefaultbuddyname = 'ProSkater'

script auto_launch_viewer 
    LoadFromMemoryCard \{ name = 'Online-Einstellungen' type = NetworkSettings }
    UseNetworkPreferences
    LaunchViewer
endscript
XenonAcceptedInvite = 0
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
HOST_MODE_SERVE = 0
HOST_MODE_AUTO_SERVE = 1
HOST_MODE_FCFS = 2
JOIN_MODE_PLAY = 0
JOIN_MODE_OBSERVE = 1
level_info = [
    { name = 'College' checksum = load_sch }
    { name = 'San Francisco' checksum = load_sf2 }
    { name = 'Alcatraz' checksum = load_alc }
    { name = 'Schiffswerft' checksum = load_jnk }
    { name = 'London' checksum = load_lon }
    { name = 'Kona' checksum = load_kon }
    { name = 'Zoo' checksum = load_zoo }
    { name = 'Jahrmarkt' checksum = load_cnv }
    { name = 'Chicago' checksum = load_hof }
    { name = 'Erstellter Park' checksum = load_sk5ed_gameplay }
]
num_players_info = [
    { name = '2 Spieler' checksum = num_2 num = 2 }
    { name = '3 Spieler' checksum = num_3 num = 3 }
    { name = '4 Spieler' checksum = num_4 num = 4 broadband_only }
    { name = '5 Spieler' checksum = num_5 num = 5 broadband_only }
    { name = '6 Spieler' checksum = num_6 num = 6 broadband_only }
    { name = '7 Spieler' checksum = num_7 num = 7 broadband_only }
    { name = '8 Spieler' checksum = num_8 num = 8 broadband_only }
]
num_private_slots = [
    { name = '0 Spieler' checksum = num_0 num = 0 }
    { name = '1 Spieler' checksum = num_1 num = 1 }
    { name = '2 Spieler' checksum = num_2 num = 2 }
    { name = '3 Spieler' checksum = num_3 num = 3 }
    { name = '4 Spieler' checksum = num_4 num = 4 }
    { name = '5 Spieler' checksum = num_5 num = 5 }
    { name = '6 Spieler' checksum = num_6 num = 6 }
    { name = '7 Spieler' checksum = num_7 num = 7 }
    { name = '8 Spieler' checksum = num_8 num = 8 }
]
ranked_info = [
    { name = 'Standard' checksum = standard num = 1 }
    { name = 'Ranked' checksum = ranked num = 0 }
]
net_game_type_info = [
    {
        name = 'Trick-Turnier'
        description = 'Sieger ist, wer am Ende der Zeit die meisten Punkte hat.'
        checksum = nettrickattack
        goal_script = StartGoal_TrickAttack
        icon = '2p_attack'
    }
    {
        name = 'Graffiti'
        description = 'Sieger ist, wer die meisten Objekte markiert.'
        checksum = netgraffiti
        goal_script = StartGoal_Graffiti
        icon = '2p_graffiti'
    }
    {
        name = 'Elimiskate'
        description = 'Der Spieler mit den wenigsten Punkten scheidet aus.'
        checksum = netelimiskate
        goal_script = StartGoal_ElimiSkate
        icon = '2p_elim'
    }
    {
        name = 'Punkte-Challenge'
        description = 'Sieger ist, wer als Erster die\nPunktvorgabe erreicht.'
        checksum = netscorechallenge
        goal_script = StartGoal_ScoreChallenge
        icon = '2p_score'
    }
    {
        name = 'Kombo-Mambo'
        description = 'Sieger ist, wer am Ende der Zeit die fetteste Kombo gemacht hat.'
        checksum = netcombomambo
        goal_script = StartGoal_combomambo
        icon = '2p_mambo'
    }
    {
        name = 'Slap!'
        description = 'Der Spieler, der seinen Gegnern die meisten Slaps verpasst, gewinnt.'
        checksum = netslap
        goal_script = StartGoal_Slap
        icon = '2p_slap'
    }
    {
        name = 'Goldkessel'
        description = 'Schnapp dir den Goldkessel und\npunkte, solange du ihn hältst.'
        checksum = netgold
        goal_script = StartGoal_Gold
        icon = '2p_koth'
    }
    {
        name = 'Capture the Flag'
        description = 'Klau die Flagge eines anderen Teams und bring sie zum Basis.'
        checksum = netctf
        goal_script = Startgoal_ctf
        icon = '2p_flag'
    }
    {
        name = 'Lord of the Board'
        description = 'Sieger ist, wer die Krone die\nvorgegebene Zeit lang halten kann.'
        checksum = netking
        goal_script = StartGoal_King
        icon = '2p_koth'
    }
    {
        name = 'Schnitzeljagd'
        description = 'Der Spieler mit den meisten Objekten nach Ablauf der Zeit gewinnt.'
        checksum = netscavengerhunt
        goal_script = StartGoal_Scavenger
        icon = '2p_hunt'
    }
    {
        name = 'Feuergefecht'
        description = 'Schieß Feuerbälle (\b1\b7 oder \b1\b4). Der letzte im Spieler gewinnt.'
        checksum = netfirefight
        goal_script = StartGoal_firefight
        icon = '2p_fire'
    }
    {
        name = 'Ziel-Turnier'
        description = 'Sieger ist, wer als Erster die\nausgewählten Ziele erfüllt.'
        checksum = netgoalattack
        goal_script = StartGoal_GoalAttack
        icon = '2p_goal'
    }
]
net_game_type_info_demo = [
    {
        name = 'Trick-Turnier'
        description = 'Sieger ist, wer am Ende der Zeit die meisten Punkte hat.'
        checksum = nettrickattack
        goal_script = StartGoal_TrickAttack
        icon = '2p_attack'
    }
    {
        name = 'Slap!'
        description = 'Der Spieler, der seinem Gegner die meisten Slaps vor Zeitablauf verpasst hat, gewinnt.'
        checksum = netslap
        goal_script = StartGoal_Slap
        icon = '2p_slap'
    }
    {
        name = 'Lord of the Board'
        description = 'Sieger ist, wer die Krone die vorgegebene Zeit lang halten kann'
        checksum = netking
        goal_script = StartGoal_King
        icon = '2p_koth'
    }
    {
        name = 'Graffiti'
        description = 'Sieger ist, wer die meisten Objekte markiert'
        checksum = netgraffiti
        goal_script = StartGoal_Graffiti
        icon = '2p_graffiti'
    }
]
mp_game_type_info = [
    {
        name = 'Trick-Turnier'
        description = 'Sieger ist, wer am Ende der Zeit die meisten Punkte hat.'
        checksum = trickattack
        goal_script = StartGoal_TrickAttack
        icon = '2p_attack'
    }
    {
        name = 'Graffiti'
        description = 'Sieger ist, wer die meisten Objekte markiert'
        checksum = graffiti
        goal_script = StartGoal_Graffiti
        icon = '2p_graffiti'
    }
    {
        name = 'Punkte-Challenge'
        description = 'Sieger ist, wer als Erster die Punktvorgabe erreicht'
        checksum = scorechallenge
        goal_script = StartGoal_ScoreChallenge
        icon = '2p_score'
    }
    {
        name = 'Kombo-Mambo'
        description = 'Sieger ist, wer am Ende der Zeit die fetteste Kombo gemacht hat.'
        checksum = combomambo
        goal_script = StartGoal_combomambo
        icon = '2p_mambo'
    }
    {
        name = 'Slap!'
        description = 'Der Spieler, der seinem Gegner die meisten Slaps vor Zeitablauf verpasst hat, gewinnt.'
        checksum = slap
        goal_script = StartGoal_Slap
        icon = '2p_slap'
    }
    {
        name = 'Goldkessel'
        description = 'Schnapp dir den Goldkessel und\npunkte, solange du ihn hältst.'
        checksum = gold
        goal_script = StartGoal_Gold
        icon = '2p_koth'
    }
    {
        name = 'Lord of the Board'
        description = 'Sieger ist, wer die Krone die vorgegebene Zeit lang halten kann'
        checksum = king
        goal_script = StartGoal_King
        icon = '2p_koth'
    }
    {
        name = 'Schnitzeljagd'
        description = 'Der Spieler mit den meisten Objekten nach Ablauf der Zeit gewinnt.'
        checksum = scavengerhunt
        goal_script = StartGoal_Scavenger
        icon = '2p_attack'
    }
    {
        name = 'Feuergefecht'
        description = 'Wirf Feuerbälle mit\n \b1\b7 oder \b1\b4.\nWer übrig bleibt, gewinnt.'
        checksum = firefight
        goal_script = StartGoal_firefight
        icon = '2p_fire'
    }
    {
        name = 'Loser'
        description = 'Legt Kombos hin, bis jemand das Wort LOSER voll hat.'
        checksum = horse
        goal_script = do_nothing
        icon = '2p_horse'
    }
    {
        name = 'Skate for Fun'
        description = 'Skatet frei im Level'
        checksum = freeskate2p
        goal_script = StartFreeSkate
        icon = '2p_free'
    }
]
num_observers_info = [
    { name = 'Keine Zuschauer' checksum = num_0 }
    { name = '1 Zuschauer' checksum = num_1 broadband_only }
]
net_goal_info = [
    { name = 'Klassik-Ziele' checksum = goals_classic }
]
skill_level_info = [
    { name = '1: Babyschritte' checksum = num_1 }
    { name = '2: Vorschule' checksum = num_2 }
    { name = '3: Ich kann das' checksum = num_3 }
    { name = '4: Gehen wir\'s an' checksum = num_4 }
    { name = '5: Lass gehen!' checksum = num_5 }
]
fireball_level_info = [
    { name = '1 (leicht)' checksum = num_1 fireball_level = 1 }
    { name = '2' checksum = num_2 fireball_level = 2 }
    { name = '3' checksum = num_3 fireball_level = 3 }
    { name = '4' checksum = num_4 fireball_level = 4 }
    { name = '5 (schwer)' checksum = num_5 fireball_level = 5 }
]

script sign_out 
    SignOut
    create_pause_menu
endscript

script go_to_xbox_dashboard 
    GotoXboxDashboard <...> 
endscript

script create_big_black_hiding_box 
    unlock_root_window
    if ScreenElementExists \{ id = big_black_box }
        DestroyScreenElement \{ id = big_black_box }
    endif
    CreateScreenElement \{type = SpriteElement parent = root_window id = big_black_box texture = black Pos = (320.0, 240.0) rgba = [ 0 0 0 128 ] Scale = (190.0, 190.0) just = [ center center ] z_priority = 5001}
endscript

script quit_network_game 
    printf 'script quit_network_game'
    should_unpost = 0
    if InFrontend
        printf '!!Can\'t quit_network_game when in the frontend!!'
        if IsXenon
            NetSessionFunc obj = match func = unpost_game
        endif
        return 
    endif
    DisplayLoadingScreen blank
    if InInternetMode
        if OnServer
            <should_unpost> = 1
        endif
        if IsXenon
            <should_unpost> = 1
        endif
    endif
    change is_changing_levels = 1
    if IsXbox
        DisplayLoadingScreen 'loadscrn_generic' 17
    else
        create_big_black_hiding_box
    endif
    console_destroy
    restore_start_key_binding
    if InInternetMode
        if OnServer
            if NOT IsXenon
                report_stats final
            endif
            if IsPs2
                NetSessionFunc obj = match func = unpost_game
            endif
            if isPC
                NetSessionFunc obj = match func = unpost_game
            endif
            if NetSessionFunc obj = presence func = profile_logged_in
                NetSessionFunc obj = presence func = set_lobby_status
            endif
            NetSessionFunc obj = match func = cancel_nat_negotiation
        endif
        NetSessionFunc obj = presence func = set_state params = { online }
        if ((IsXenon)|| (IsXbox))
            NetSessionFunc obj = voice func = reset
        endif
    endif
    if ObjectExists id = skater
        if NOT IsObserving
            skater ::netenableplayerinput
            skater ::DestroyAllSpecialItems
        endif
    endif
    if NOT IsObserving
        ExitSurveyorMode
    endif
    ProximCleanup
    chosen_leave_server
    dialog_box_exit anchor_id = quit_dialog_anchor
    dialog_box_exit
    if NOT IsPs2
        if NOT isPC
            if (<should_unpost> = 1)
                NetSessionFunc obj = match func = unpost_game
            endif
        endif
    endif
    SetGameType career
    SetCurrentGameType
    SetStatOverride
    SetServerMode on
    StartServer
    SetJoinMode JOIN_MODE_PLAY
    SetNetworkMode LAN_MODE
    JoinServer
    begin 
    if JoinServerComplete
        break 
    else
        wait 1
    endif
    repeat 
    if InInternetMode
        NetSessionFunc obj = match func = set_quiet_mode params = { Off }
    endif
    if IsXbox
        if NOT GotParam dont_reset_net_game_type
            SetGameType netlobby
            SetCurrentGameType
        endif
    endif
    level_select_change_level level = Load_Z_MainMenu no_levelUnload
    SetNetworkMode
    printf 'quit_network_game::Done'
endscript

script quit_network_game2 
    printf 'script quit_network_game2'
    should_unpost = 0
    if InFrontend
        printf '!!Can\'t quit_network_game when in the frontend!!'
        if IsXenon
            NetSessionFunc obj = match func = unpost_game
        endif
        return 
    endif
    DisplayLoadingScreen blank
    if InInternetMode
        if OnServer
            <should_unpost> = 1
        endif
        if IsXenon
            <should_unpost> = 1
        endif
    endif
    change is_changing_levels = 1
    if IsXbox
        DisplayLoadingScreen 'loadscrn_generic' 17
    else
        create_big_black_hiding_box
    endif
    console_destroy
    restore_start_key_binding
    if InInternetMode
        if OnServer
            if NOT IsXenon
                report_stats final
            endif
            if IsPs2
                NetSessionFunc obj = match func = unpost_game
            endif
            if isPC
                NetSessionFunc obj = match func = unpost_game
            endif
            if NetSessionFunc obj = presence func = profile_logged_in
                NetSessionFunc obj = presence func = set_lobby_status
            endif
            NetSessionFunc obj = match func = cancel_nat_negotiation
        endif
        NetSessionFunc obj = presence func = set_state params = { online }
        if ((IsXenon)|| (IsXbox))
            NetSessionFunc obj = voice func = reset
        endif
    endif
    if ObjectExists id = skater
        if NOT IsObserving
            skater ::netenableplayerinput
            skater ::DestroyAllSpecialItems
        endif
    endif
    if NOT IsObserving
        ExitSurveyorMode
    endif
    ProximCleanup
    chosen_leave_server
    dialog_box_exit anchor_id = quit_dialog_anchor
    dialog_box_exit
    if (<should_unpost> = 1)
        NetSessionFunc obj = match func = unpost_game
    endif
    SetGameType career
    SetCurrentGameType
    SetStatOverride
    SetServerMode on
    StartServer
    SetJoinMode JOIN_MODE_PLAY
    SetNetworkMode LAN_MODE
    JoinServer
    begin 
    if JoinServerComplete
        break 
    else
        wait 1
    endif
    repeat 
    NetSessionFunc obj = match func = set_quiet_mode params = { Off }
    SetGameType netlobby
    SetCurrentGameType
    level_select_change_level level = Load_Z_MainMenu no_levelUnload
    SetNetworkMode
    printf 'quit_network_game2::Done'
endscript

script join_level_cleanup 
    pausegame
    DisplayLoadingScreen \{ freeze }
    leave_front_end
    cleanup_before_changing_level_unload_all_paks
    if GotParam \{ preserve_skaters }
        if InSplitScreenGame
            if InFrontend
                do_not_wait = 1
            endif
        endif
        if NOT GotParam \{ do_not_wait }
            wait \{ 2 gameframe }
        endif
    endif
    cleanup_before_changing_level_unload_zones <...> 
    cleanup_before_loading_level <...> 
    NetSessionFunc \{ obj = voice func = enable }
    UnPauseGame
endscript

script spawned_chosen_host_game 
    GetPreferenceString pref_type = network level
    get_level_load_time level = <level>
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 frame
    endif
    join_level_cleanup preserve_skaters
    DisplayLoadingScreen freeze
    NetSessionFunc obj = match func = stop_server_list
    NetSessionFunc obj = match func = free_server_list
    LeaveServer
    SetGameType netlobby
    SetCurrentGameType
    InitSkaterHeaps
    InitNetMiscHeap
    SetServerMode
    StartServer
    SetJoinMode JOIN_MODE_PLAY
    JoinServer
    begin 
    if JoinServerComplete
        break 
    else
        wait 1
    endif
    repeat 
    ChangeLevel level = use_preferences
    if CompositeObjectExists name = main_menu_camera
        main_menu_camera ::Die
    endif
    restore_skater_camera
    exit_pause_menu
endscript

script chosen_host_game 
    change \{ in_server_options = 0 }
    if InNetGame
        printf \{ 'We\'re already in a netgame!' }
        network_start_selected
    else
        if InSplitScreenGame
            ApplySplitScreenOptions
            chosen_start_game
        else
            change \{ check_for_unplugged_controllers = 0 }
            change \{ is_changing_levels = 1 }
            SpawnScriptLater \{ spawned_chosen_host_game notsessionspecific = 1 }
        endif
    endif
endscript

script select_thug_online_play 
    change_gamemode_net
    GoalManager_SetDifficultyLevel \{ 1 }
    launch_select_skater_menu \{ change_gamemode = change_gamemode_net }
endscript

script prompt_for_net_config 
    printf \{ '*** prompt_for_net_config ***' }
    change \{ InNetOptionsFromNetPlay = 1 }
    _CreationOptionsLoadNetConfig
endscript

script select_internet_play 
    printf \{ '*** select_internet_play ***' }
    PauseMusicAndStreams
    do_network_setup \{ error_script = back_from_startup_error_dialog success_script = maybe_show_disclaimer need_setup_script = prompt_for_net_config }
endscript

script select_lan_play 
    PauseMusicAndStreams
    do_network_setup \{ error_script = back_from_startup_error_dialog success_script = launch_network_select_lan_games_menu need_setup_script = prompt_for_net_config }
endscript

script xbox_live_start_login 
    if isPC
        select_thug_online_play
    else
        if IsTrue \{ signedin }
            select_thug_online_play
        else
            if IsTrue \{ SigningIn }
                change \{ WaitingForSignInToComplete = 1 }
                create_dialog_box \{ Title = net_status_msg text = 'Verbindung wird hergestellt ...' }
            else
                NetSessionFunc \{ func = auth_init }
                launch_user_selection <...> 
            endif
        endif
    endif
endscript

script xenon_live_start 
    connected_to_internet
endscript

script launch_user_selection 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if NetSessionFunc \{ obj = auth func = retrieve_user_list }
        NetSessionFunc \{ obj = auth func = get_num_users }
        if (<num_users> > 0)
            display_xbox_user_list <...> 
        else
            launch_no_accounts_dialog
        endif
    else
        back_from_user_selection
    endif
endscript

script xbox_login_succeeded 
    change signedin = 1
    change SigningIn = 0
    NetSessionFunc obj = auth func = monitor_connection
    NetSessionFunc func = presence_init
    NetSessionFunc func = voice_init
    NetSessionFunc obj = voice func = enable
    NetSessionFunc obj = presence func = set_state params = { online }
    NetSessionFunc obj = presence func = get_mute_list
    printf 'checking availability'
    if NOT GotParam from_startup
        select_thug_online_play
    else
        if IsTrue WaitingForSignInToComplete
            dialog_box_exit
            change WaitingForSignInToComplete = 0
            select_thug_online_play
        endif
    endif
endscript

script xbox_title_update 
    NetSessionFunc \{ obj = auth func = update_title }
endscript

script async_xbox_login 
    xboxlive_logon_status_update text = 'Anmeldung ...'
    if NOT GotParam from_startup
        create_dialog_box {Title = net_status_msg
            text = 'Verbindung wird hergestellt ...'
        }
    endif
    if GotParam silently
        if NOT NetSessionFunc obj = auth func = silent_login params = <...> 
            if GotParam from_startup
                change SigningIn = 0
                NetSessionFunc func = auth_uninit
                switch <reason>
                    case no_connection
                    xboxlive_logon_status_update text = 'Anmeldung fehlgeschlagen'
                    case passcode_required
                    xboxlive_logon_status_update text = 'Nicht angemeldet: Passcode benötigt'
                    default 
                    xboxlive_logon_status_update text = 'Nicht angemeldet'
                endswitch
            else
                dialog_box_exit
                switch <reason>
                    case no_connection
                    create_dialog_box {Title = net_status_msg
                        text = 'Xbox kann keine Verbindung mit Xbox Live aufbauen. Möchtest du die Fehlerbehebung starten?'
                        buttons = [
                            {text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 6 }}
                            {text = 'no' pad_choose_script = back_from_user_selection}
                        ]
                    }
                    case no_silent_login
                    launch_user_selection
                    default 
                    create_dialog_box {Title = net_status_msg
                        text = 'Anmeldung fehlgeschlagen.'
                        buttons = [
                            {text = 'OK' pad_choose_script = back_from_user_selection}
                        ]
                    }
                endswitch
            endif
            return 
        endif
    else
        if NOT NetSessionFunc obj = auth func = login params = <...> 
            xboxlive_logon_status_update text = 'Anmeldung fehlgeschlagen'
            show_error = 1
            change SigningIn = 0
            NetSessionFunc func = auth_uninit
            dialog_box_exit
            switch <reason>
                case no_connection
                create_dialog_box {Title = net_status_msg
                    text = 'Xbox kann keine Verbindung mit Xbox Live aufbauen. Möchtest du die Fehlerbehebung starten?'
                    buttons = [
                        {text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 6 }}
                        {text = 'no' pad_choose_script = back_from_user_selection}
                    ]
                }
                default 
                create_dialog_box {Title = net_status_msg
                    text = 'Anmeldung fehlgeschlagen.'
                    buttons = [
                        {text = 'OK' pad_choose_script = back_from_user_selection}
                    ]
                }
            endswitch
            return 
        endif
    endif
    begin 
    NetSessionFunc obj = auth func = think
    if NetSessionFunc obj = auth func = login_complete
        break 
    endif
    wait 1 frame
    repeat 
    change SigningIn = 0
    if NOT GotParam silently
        dialog_box_exit
    endif
    if NetSessionFunc obj = auth func = login_succeeded
        NetSessionFunc obj = auth func = get_gamertag
        SetPreferencesFromUI prefs = network field = 'network_id' string = <name>
        SetPreferencesFromUI prefs = network field = 'server_name' string = <name>
        message_text = ('Angemeldet:' + <name>)
        xboxlive_logon_status_create
        xboxlive_logon_status_update text = <message_text>
        if GotParam from_startup
            xbox_login_succeeded from_startup
        else
            if GotParam message_waiting
                create_dialog_box {Title = net_status_msg
                    text = 'Du hast eine neue Xbox Live-Nachricht erhalten. Möchtest du sie jetzt lesen?'
                    buttons = [
                        {text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 8 }}
                        {text = 'no' pad_choose_script = xbox_login_succeeded}
                    ]
                }
            else
                xbox_login_succeeded
            endif
        endif
    else
        xboxlive_logon_status_update text = 'Anmeldung fehlgeschlagen'
        show_error = 1
        change SigningIn = 0
        if GotParam from_startup
            if NOT IsTrue WaitingForSignInToComplete
                <show_error> = 0
                NetSessionFunc func = auth_uninit
            endif
        endif
        if (<show_error> = 1)
            switch <reason>
                case lost_connection
                create_dialog_box {Title = net_status_msg
                    text = 'Xbox kann keine Verbindung mit Xbox Live aufbauen. Möchtest du die Fehlerbehebung starten?'
                    buttons = [
                        {text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 6 }}
                        {text = 'no' pad_choose_script = back_from_user_selection}
                    ]
                }
                case no_service
                create_dialog_box {Title = net_status_msg
                    text = 'Xbox kann keine Verbindung mit Xbox Live aufbauen. Möchtest du die Fehlerbehebung starten?'
                    buttons = [
                        {text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 6 }}
                        {text = 'no' pad_choose_script = back_from_user_selection}
                    ]
                }
                case update_required
                create_dialog_box {Title = net_status_msg
                    text = 'Eine für den Xbox Live Service erforderliche Aktualisierung ist jetzt erhältlich. Du kannst ohne die Aktualisierung keine Verbindung mit Xbox Live herstellen. Jetzt aktualisieren?'
                    buttons = [
                        {text = 'Ja' pad_choose_script = xbox_title_update}
                        {text = 'Nein' pad_choose_script = back_from_user_selection}
                    ]
                }
                case invalid_user
                create_dialog_box {Title = net_status_msg
                    text = 'Dieses Konto ist nicht aktuell. Möchten Sie das Konto in der Kontowiederherstellung aktualisieren?'
                    buttons = [
                        {text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 8 }}
                        {text = 'Nein' pad_choose_script = back_from_user_selection}
                    ]
                }
                case busy
                create_dialog_box {Title = net_status_msg
                    text = 'Der Xbox Live Service ist ausgelastet. Bitte versuche es später noch einmal.'
                    buttons = [
                        {text = 'OK' pad_choose_script = back_from_user_selection}
                    ]
                }
                case requires_management
                create_dialog_box {Title = net_status_msg
                    text = 'Xbox Live hat eine wichtige Nachricht für dich. Drück OK, um die Nachricht zu lesen.'
                    buttons = [
                        {text = 'OK' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 8 }}
                    ]
                }
                case duplicate
                create_dialog_box {Title = net_status_msg
                    text = 'Sie wurden bei Xbox Live abgemeldet, da sich jemand anderes mit diesen Kontoinformationen angemeldet hat.'
                    buttons = [
                        {text = 'OK' pad_choose_script = back_from_user_selection}
                    ]
                }
                default 
                create_dialog_box {Title = net_status_msg
                    text = 'Anmeldung fehlgeschlagen.'
                    buttons = [
                        {text = 'OK' pad_choose_script = back_from_user_selection}
                    ]
                }
            endswitch
        endif
    endif
endscript

script check_passcode 
    KillSpawnedScript name = async_check_for_any_accounts
    KillSpawnedScript name = async_check_for_changed_accounts
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if GotParam invitee
        if NOT NetSessionFunc func = same_gamertag params = {user1 = <name> user2 = <invitee>}
            NetSessionFunc func = ignore_invited_session
        endif
    endif
    if NetSessionFunc obj = auth func = requires_passcode params = <...> 
        net_login_xbox_menu_create success_script = xbox_login success_params = <...> pad_back_script = back_from_user_selection <...> 
    else
        xbox_login <...> 
    endif
endscript

script xbox_login 
    change \{ SigningIn = 1 }
    SpawnScriptLater async_xbox_login params = <...> 
endscript

script display_xbox_user_list 
    make_new_roundbar_menu {
        Title = 'AUSWAHL SPIELERKENNUNG'
        pad_back_script = generic_menu_pad_back
        pad_back_params = { callback = back_from_user_selection }
        Pos = (130.0, 80.0)
        spacing = 1
        no_animate
    }
    create_helper_text = generic_helper_text
    NetSessionFunc obj = auth func = get_num_users
    index = 0
    begin 
    NetSessionFunc obj = auth func = get_user params = { index = <index> }
    add_roundbar_menu_item {text = <name>
        pad_choose_script = check_passcode
        pad_choose_params = <...> 
        rot = 0
        Scale = 0.8500
        no_animate
    }
    <index> = (<index> + 1)
    repeat <num_users>
    add_roundbar_menu_item {text = 'Neuen erstellen'
        pad_choose_script = go_to_xbox_dashboard
        pad_choose_params = { reason = 7 }
        rot = 0
        Scale = 0.8500
        no_animate
    }
    roundbar_menu_finish
    SpawnScriptLater async_check_for_changed_accounts params = { orig_num_users = <num_users> }
endscript

script net_setup_from_net_play_successful 
    dialog_box_exit
    if (network_connection_type = internet)
        select_internet_play
    else
        select_lan_play
    endif
endscript

script do_network_setup 
    printf \{ '----' }
    printf \{ 'do' }
    printf \{ 'network' }
    printf \{ 'setup' }
    printf \{ '----' }
    printstruct <...> 
    if InFrontend
        main_menu_camera_control \{ next_state = online }
    endif
    SetMemThreadSafe
    UseNetworkPreferences
    SpawnScriptLater test_network_setup params = <...> 
endscript

script spoof_usb_adaptor_setup 
    if NOT IsTrue \{ DontSpoofAdaptor }
        SetPreferencesFromUI \{ prefs = network field = 'device_type' string = 'USB-Ethernet-Adapter' checksum = device_broadband_usb }
    endif
endscript

script spoof_pcmcia_adaptor_setup 
    if NOT IsTrue \{ DontSpoofAdaptor }
        SetPreferencesFromUI \{ prefs = network field = 'device_type' string = 'Netzwerkadapter (Ethernet) (für PlayStation®2)' checksum = device_broadband_pc }
    endif
endscript

script test_network_setup 
    printf '*** test_network_setup ***'
    if InFrontend
        skater ::hide
    endif
    PauseMusicAndStreams
    if isPC
        <success_script> <...> 
    else
        GetPreferenceChecksum pref_type = network device_type
        switch <checksum>
            case device_none
            <need_setup_script> text = net_status_need_to_setup <...> 
            return 
            case device_sony_modem
            case device_usb_modem
            GetPreferenceString pref_type = network dialup_number
            if (<ui_string> = '')
                <need_setup_script> text = net_status_need_to_setup_dialup <...> 
                return 
            endif
            default 
        endswitch
        if NeedToTestNetSetup
            change needstotestdnas = 1
            PauseMusicAndStreams
            create_testing_network_settings_dialog
            wait 1 seconds
            TestNetSetup <...> 
            PauseMusicAndStreams
        else
            <success_script> <...> 
        endif
    endif
endscript

script launch_network_host_options_sub_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    <sub_menu_script> <...> 
endscript

script back_from_user_selection 
    change \{ SigningIn = 0 }
    change \{ WaitingForSignInToComplete = 0 }
    KillSpawnedScript \{ name = async_check_for_any_accounts }
    KillSpawnedScript \{ name = async_check_for_changed_accounts }
    dialog_box_exit
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    back_from_internet_options \{ sign_out }
endscript

script back_from_wrong_pin_dialog 
    dialog_box_exit
    ConnectToInternet
endscript

script launch_no_accounts_dialog 
    create_dialog_box \{Title = 'KEINE KONTEN GEFUNDEN' text = 'Auf deinem System wurde kein Konto gefunden. Möchtest du ein neues anlegen?' buttons = [{text = 'Ja' pad_choose_script = go_to_xbox_dashboard pad_choose_params = { reason = 7 }}{ text = 'Nein' pad_choose_script = back_from_user_selection }] title_scale = 1.0}
    SpawnScriptLater \{ async_check_for_any_accounts }
endscript

script async_check_for_any_accounts 
    begin 
    if NetSessionFunc \{ obj = auth func = retrieve_user_list }
        NetSessionFunc \{ obj = auth func = get_num_users }
        if (<num_users> > 0)
            dialog_box_exit
            display_xbox_user_list
            break 
        endif
    endif
    wait \{ 10 frames }
    repeat 
endscript

script async_check_for_changed_accounts 
    begin 
    if NetSessionFunc obj = auth func = retrieve_user_list
        NetSessionFunc obj = auth func = get_num_users
        if (<num_users> = 0)
            if ObjectExists id = current_menu_anchor
                DestroyScreenElement id = current_menu_anchor
            endif
            launch_no_accounts_dialog
            break 
        else
            if NOT (<num_users> = <orig_num_users>)
                if ObjectExists id = current_menu_anchor
                    DestroyScreenElement id = current_menu_anchor
                endif
                display_xbox_user_list
                break 
            endif
        endif
    endif
    wait 10 frames
    repeat 
endscript

script launch_auto_server_notification 
    destroy_onscreen_keyboard
    create_error_box \{Title = 'Auto-Server' text = 'Dieser Server ist im Auto-Server-Modus. Wenn mindestens zwei Spieler anwesend sind, werden die Spiele automatisch nacheinander gestartet.' buttons = [{ text = 'OK' pad_choose_script = dialog_box_exit }] no_animate delay_input}
endscript

script launch_fcfs_notification 
    if (<checksum> = boolean_true)
        SetPreferencesFromUI prefs = network field = 'player_collision' string = 'Ein' <...> 
    else
        SetPreferencesFromUI prefs = network field = 'player_collision' string = 'Aus' <...> 
    endif
    destroy_onscreen_keyboard
    force_close_rankings
    exit_pause_menu
    create_error_box {Title = 'Host-Benachrichtigung'
        text = 'Dieser Server ist im \'First Come First Serve\'-Modus. Du bist als Host ausgewiesen und kannst Optionen verändern und Spiele starten.'
        buttons = [{text = 'OK' pad_choose_script = exit_async_dialog}
        ]
        no_animate
        delay_input
    }
endscript

script fcfs_confirm 
    DestroyScreenElement id = current_menu_anchor
    create_dialog_box {Title = 'First Come First Serve'
        text = 'Mit dieser Option bist du ein permanenter Zuschauer und der erste beitretende Spieler darf den Spielmodus auswählen und den Level wechseln. Bist du sicher?'
        text_dims = (350.0, 0.0)
        buttons = [{text = 'Ja' pad_choose_script = fcfs_selected}
            {text = 'Nein' pad_choose_script = create_sit_out_menu}
        ]
        no_animate
    }
endscript

script auto_serve_confirm 
    DestroyScreenElement id = current_menu_anchor
    create_dialog_box {Title = 'Auto-Server'
        text = 'Mit dieser Option bist du ein permanenter Zuschauer. Wenn mindestens zwei Spieler beigetreten sind, startet ein neues Spiel im aktuellen Spielmodus und später werden weitere Spiele folgen. Bist du sicher?'
        buttons = [{text = 'Ja' pad_choose_script = auto_serve_selected}
            {text = 'Nein' pad_choose_script = create_sit_out_menu}
        ]
        no_animate
    }
endscript

script create_kick_ban_menu 
    DestroyScreenElement \{ id = current_menu_anchor }
    create_dialog_box {Title = <name>
        text = 'Spieler entfernen?'
        buttons = [{text = 'Zurück' pad_choose_script = cancel_remove_player}
            {text = 'Rauswerfen' pad_choose_script = kick_player_confirm pad_choose_params = <...> }
            {text = 'ban' pad_choose_script = ban_player_confirm pad_choose_params = <...> }
        ]
        no_animate
    }
endscript

script create_player_options_dialog 
    if GotParam allow_remove_homie
        DestroyScreenElement id = current_menu_anchor
        if OnServer
            create_dialog_box {Title = 'Spieleroptionen'
                text = <name>
                pad_back_script = cancel_remove_player
                buttons = [{text = 'Zurück' pad_choose_script = cancel_remove_player}
                    {text = 'Rauswerfen' pad_choose_script = kick_player_confirm pad_choose_params = <...> }
                    {text = 'ban' pad_choose_script = ban_player_confirm pad_choose_params = <...> }
                    {text = 'Freund entfernen' pad_choose_script = remove_buddy pad_choose_params = <...> }
                ]
                no_animate
            }
        else
            create_dialog_box {Title = 'Spieleroptionen'
                text = <name>
                pad_back_script = cancel_remove_player
                buttons = [{text = 'Zurück' pad_choose_script = cancel_remove_player}
                    {text = 'Freund entfernen' pad_choose_script = remove_buddy pad_choose_params = <...> }
                ]
                no_animate
            }
        endif
    else
        if GotParam allow_add_homie
            DestroyScreenElement id = current_menu_anchor
            if OnServer
                create_dialog_box {Title = 'Spieleroptionen'
                    text = <name>
                    pad_back_script = cancel_remove_player
                    buttons = [{text = 'Zurück' pad_choose_script = cancel_remove_player}
                        {text = 'Rauswerfen' pad_choose_script = kick_player_confirm pad_choose_params = <...> }
                        {text = 'ban' pad_choose_script = ban_player_confirm pad_choose_params = <...> }
                        {text = 'Freund hinzufügen' pad_choose_script = add_buddy pad_choose_params = <...> }
                    ]
                    no_animate
                }
            else
                create_dialog_box {Title = 'Spieleroptionen'
                    text = <name>
                    pad_back_script = cancel_remove_player
                    buttons = [{text = 'Zurück' pad_choose_script = cancel_remove_player}
                        {text = 'Freund hinzufügen' pad_choose_script = add_buddy pad_choose_params = <...> }
                    ]
                    no_animate
                }
            endif
        else
            if OnServer
                DestroyScreenElement id = current_menu_anchor
                create_dialog_box {Title = 'Spieleroptionen'
                    text = <name>
                    pad_back_script = cancel_remove_player
                    buttons = [{text = 'Zurück' pad_choose_script = cancel_remove_player}
                        {text = 'Rauswerfen' pad_choose_script = kick_player_confirm pad_choose_params = <...> }
                        {text = 'ban' pad_choose_script = ban_player_confirm pad_choose_params = <...> }
                    ]
                    no_animate
                }
            endif
        endif
    endif
endscript

script cancel_add_buddy 
    dialog_box_exit
    printf 'cancel_add_buddy'
    actions_menu_anchor ::DoMorph Scale = 1
    game_list_menu_anchor ::DoMorph Scale = 1
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 1
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 1
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 1
    endif
    FireEvent type = unfocus target = actions_menu
    FireEvent type = focus target = lobby_player_list_menu
    change current_lobby_focus = 2
    change check_for_unplugged_controllers = 1
    AssignAlias id = lobby_player_list_menu alias = current_menu
    SetScreenElementLock id = current_menu_anchor Off
    create_helper_text generic_helper_text
    SetScreenElementLock id = current_menu_anchor on
endscript

script cant_add_buddy_prompt_not_logged_in 
    FireEvent type = unfocus target = lobby_player_list_menu
    change check_for_unplugged_controllers = 0
    actions_menu_anchor ::DoMorph Scale = 0
    game_list_menu_anchor ::DoMorph Scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 0
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 0
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    FormatText textname = msg_text 'Dieser User hat kein GameSpy Profil und kann daher nicht zur Freundesliste hinzugefügt werden.'
    create_dialog_box {Title = 'NICHT EINGELOGGT'
        title_scale = 1.150
        text = <msg_text>
        no_bg = no_bg
        text_dims = (300.0, 0.0)
        buttons = [{text = 'OK' pad_choose_script = cancel_add_buddy}
        ]
    }
endscript

script cant_add_buddy_prompt_list_full 
    FireEvent type = unfocus target = lobby_player_list_menu
    change check_for_unplugged_controllers = 0
    actions_menu_anchor ::DoMorph Scale = 0
    game_list_menu_anchor ::DoMorph Scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 0
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 0
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    FormatText textname = msg_text 'Deine Freundesliste ist voll. Du musst erst Freunde löschen, bevor du neue hinzufügst.'
    create_dialog_box {Title = 'FREUNDESLISTE IST VOLL'
        text = <msg_text>
        no_bg = no_bg
        buttons = [{text = 'OK' pad_choose_script = cancel_add_buddy}
        ]
    }
endscript

script cant_add_buddy_prompt_no_profile 
    FireEvent type = unfocus target = lobby_player_list_menu
    change check_for_unplugged_controllers = 0
    actions_menu_anchor ::DoMorph Scale = 0
    game_list_menu_anchor ::DoMorph Scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 0
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 0
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    create_dialog_box {
        Title = 'KEIN GAMESPY-PROFIL'
        title_scale = 1.100
        text = 'Du musst ein GameSpy-Profil anlegen, bevor du andere Spieler zu deiner Freundesliste hinzufügen kannst.'
        no_bg = no_bg
        buttons = [
            {text = 'OK' pad_choose_script = cancel_add_buddy}
        ]
    }
endscript

script cant_add_self_to_buddy_prompt 
    FireEvent type = unfocus target = lobby_player_list_menu
    change check_for_unplugged_controllers = 0
    actions_menu_anchor ::DoMorph Scale = 0
    game_list_menu_anchor ::DoMorph Scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 0
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 0
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    FormatText textname = msg_text 'Du kannst dich nicht zu deiner eigenen Freundesliste hinzufügen.'
    create_dialog_box {Title = 'DAS BIST DU'
        text = <msg_text>
        no_bg = no_bg
        buttons = [{text = 'OK' pad_choose_script = cancel_add_buddy}
        ]
    }
endscript

script already_buddy_prompt 
    FireEvent type = unfocus target = lobby_player_list_menu
    change check_for_unplugged_controllers = 0
    actions_menu_anchor ::DoMorph Scale = 0
    game_list_menu_anchor ::DoMorph Scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 0
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 0
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    FormatText textname = msg_text 'Dieser User ist bereits in deiner Freundesliste.'
    create_dialog_box {Title = 'BEREITS IN FREUNDESLISTE'
        text = <msg_text>
        title_scale = 1
        no_bg = no_bg
        buttons = [{text = 'OK' pad_choose_script = cancel_add_buddy}
        ]
    }
endscript

script add_buddy_prompt 
    FireEvent type = unfocus target = lobby_player_list_menu
    change check_for_unplugged_controllers = 0
    actions_menu_anchor ::DoMorph Scale = 0
    game_list_menu_anchor ::DoMorph Scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 Scale = 0
    DoScreenElementMorph id = chat_box_anchor time = 0 Scale = 0
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    FormatText textname = msg_text '%s zu deiner Freundesliste hinzufügen?' s = <net_name>
    create_dialog_box {Title = 'FREUND HINZUF.'
        text = <msg_text>
        no_bg = no_bg
        buttons = [{text = 'Ja' pad_choose_script = lobby_add_buddy pad_choose_params = <...> }
            {text = 'Nein' pad_choose_script = cancel_add_buddy}
        ]
    }
endscript

script add_buddy 
    if NetSessionFunc \{ obj = presence func = can_add_friend }
        NetSessionFunc obj = presence func = add_friend params = <...> 
        dialog_box_exit
        create_adding_buddy_dialog
    else
        dialog_box_exit
        create_buddy_list_full_dialog
    endif
endscript

script send_buddy_message 
    GetTextElementString \{ id = keyboard_current_string }
    NetSessionFunc obj = presence func = send_message params = <...> 
    if GotParam \{ from_buddy_message }
        if InNetGame
            game_back_from_buddy_messages
        else
            back_from_buddy_messages
        endif
    else
        if isPC
            destroy_onscreen_keyboard
        endif
        launch_homie_list
    endif
endscript

script message_buddy 
    pager_window_destroy \{ hide_ui }
    dialog_box_exit
    if GotParam \{ from_buddy_message }
        if InNetGame
            cancel_script = game_back_from_buddy_messages
        else
            cancel_script = back_from_buddy_messages
        endif
    else
        cancel_script = launch_homie_list
    endif
    create_onscreen_keyboard max_length = 64 allow_cancel keyboard_cancel_script = <cancel_script> keyboard_done_script = send_buddy_message keyboard_title = 'Nachricht senden' <...> 
endscript

script remove_buddy 
    NetSessionFunc obj = presence func = remove_friend params = <...> 
    dialog_box_exit
    create_removed_buddy_dialog
endscript

script show_next_buddy_message 
    dialog_box_exit
    ShowNextBuddyMessage
endscript

script lobby_add_buddy_from_message 
    back_from_buddy_messages
    lobby_add_buddy <...> 
endscript

script lobby_add_buddy 
    dialog_box_exit
    NetSessionFunc obj = presence func = add_friend params = {profile = <profile> nick = <net_name>}
    if InNetGame
        create_dialog_box {Title = net_status_msg
            text = 'Freund hinzugefügt'
            buttons = [{text = 'Schließen' pad_choose_script = cancel_add_buddy}
            ]
        }
    else
        FormatText textname = msg_text '%s wird zur Freundesliste hinzugefügt ...' s = <net_name>
        NetSessionFunc obj = match func = send_chat_message params = {text = <msg_text> system_message}
        cancel_add_buddy
        if ScreenElementExists id = actions_menu
            NetSessionFunc obj = match func = fill_player_list
            if (current_lobby_focus = 2)
                refocus_actions_menu
            endif
        endif
    endif
endscript

script create_adding_buddy_dialog 
    if InNetGame
        dialog_box_exit
        exit_pause_menu
        create_console_message \{ text = '<System>: Füge Freund hinzu ...' }
    else
        create_dialog_box \{Title = net_status_msg text = 'Freund wird hinzugefügt ...' buttons = [{ text = 'Schließen' pad_choose_script = close_add_buddy }]}
    endif
endscript

script create_buddy_list_full_dialog 
    if InNetGame
        dialog_box_exit
        exit_pause_menu
        create_console_message text = '<System>: Deine Freundesliste ist voll.'
    else
        create_dialog_box {Title = net_error_msg
            text = 'Deine Freundesliste ist voll. Du musst erst Freunde löschen, bevor du neue hinzufügst.'
            buttons = [{text = 'Schließen' pad_choose_script = close_add_buddy}
            ]
        }
    endif
endscript

script failed_add_buddy_already_buddy 
    if InNetGame
        create_failed_add_buddy_dialog
    else
        NetSessionFunc \{obj = match func = send_chat_message params = { text = 'Der User ist bereits auf deiner Freundesliste.' system_message }}
    endif
endscript

script added_buddy 
    if InFrontend
        FormatText textname = msg_text '%s wurde zur Freundesliste hinzugefügt.' s = <net_name>
        NetSessionFunc obj = match func = send_chat_message params = {text = <msg_text> system_message}
    else
        create_added_buddy_dialog
    endif
endscript

script removed_buddy 
    if ObjectExists id = <id>
        DestroyScreenElement id = <id>
    endif
endscript

script create_added_buddy_dialog 
    if InNetGame
        dialog_box_exit
        exit_pause_menu
        create_console_message \{ text = '<System>: Freund hinzugefügt.' }
    else
        if NOT ObjectExists \{ id = dialog_box_anchor }
            create_dialog_box \{Title = net_status_msg text = 'Freund hinzugefügt.' buttons = [{ text = 'OK' pad_choose_script = accept_buddy_ok }]}
        endif
    endif
endscript

script create_removed_buddy_dialog 
    if InNetGame
        dialog_box_exit
        exit_pause_menu
        create_console_message \{ text = '<System>: Freund entfernt.' }
    else
        dialog_box_exit
        create_dialog_box \{Title = net_status_msg text = 'Freund wurde gelöscht.' buttons = [{ text = 'OK' pad_choose_script = accept_buddy_ok }]}
    endif
endscript

script create_failed_add_buddy_dialog 
    destroy_onscreen_keyboard
    dialog_box_exit
    create_error_box \{Title = net_status_msg text = 'User war bereits auf deiner Freundesliste.' buttons = [{ text = 'OK' pad_choose_script = accept_buddy_ok }]}
endscript

script close_add_buddy 
    dialog_box_exit
    create_pause_menu
endscript

script accept_buddy_ok 
    dialog_box_exit
    create_pause_menu
endscript

script launch_quit_game_dialog 
    dialog_box_exit
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_quit_game_dialog
endscript

script create_quit_game_dialog 
    if OnServer
        create_error_box {Title = 'Spiel verlassen'
            text = 'Wenn du das Spiel jetzt verlässt, wird die Sitzung beendet. Wirklich verlassen?'
            anchor_id = quit_dialog_anchor
            buttons = [{text = 'Ja' pad_choose_script = quit_network_game}
                {text = 'Nein' pad_choose_script = quit_game_dialog_box_exit}
            ]
            no_animate
        }
    else
        create_error_box {Title = 'Spiel verlassen'
            text = 'Möchtest du diese Sitzung wirklich verlassen?'
            anchor_id = quit_dialog_anchor
            buttons = [{text = 'Ja' pad_choose_script = quit_network_game}
                {text = 'Nein' pad_choose_script = quit_game_dialog_box_exit}
            ]
            no_animate
        }
    endif
endscript

script quit_game_dialog_box_exit 
    generic_menu_pad_back_sound
    exit_pause_menu
    dialog_box_exit \{ anchor_id = quit_dialog_anchor }
endscript

script launch_wrong_pin_dialog_box 
    DestroyScreenElement \{ id = current_menu_anchor }
    create_dialog_box \{Title = 'FALSCHE PIN' text = 'Du hast eine falsche PIN eingegeben.' buttons = [{ text = 'OK' pad_choose_script = back_from_wrong_pin_dialog }]}
endscript

script launch_network_select_games_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_network_select_games_menu \{ play_cam }
endscript

script launch_remove_players_menu 
    hide_current_goal
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_remove_players_menu
endscript

script launch_xbox_online_menu 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_xbox_online_menu
endscript

script check_availability 
    printf '*** check available!!!'
    dialog_box_exit
    create_dialog_box {
        Title = net_status_msg
        text = net_status_checking_motd
        no_animate
    }
    wait 10 frames
    NetSessionFunc obj = match func = start_availability_check
    begin 
    NetSessionFunc obj = match func = availability_check_think
    if NetSessionFunc obj = match func = availability_check_complete
        printf '*** check complete'
        break 
    endif
    wait 20 frames
    repeat 
    if NetSessionFunc obj = match func = is_service_available
        printf '*** service is available!!!'
        track_usage
    else
        if NetSessionFunc obj = match func = is_temporarily_unavailable
            NetSessionFunc func = match_uninit
            service_not_available
        else
            NetSessionFunc func = match_uninit
            service_never_available
        endif
    endif
endscript

script xenon_singleplayer_session_init 
endscript

script xenon_singleplayer_session_begin_uninit 
endscript

script xenon_singleplayer_session_complete_uninit 
endscript

script setup_sessionfuncs 
    printf \{ 'script: setup_sessionfuncs' }
    printf \{ 'Initializing match' }
    NetSessionFunc \{ func = match_init }
    NetSessionFunc \{ func = presence_init }
    NetSessionFunc \{ func = stats_init }
    NetSessionFunc \{ func = voice_init }
endscript

script cleanup_sessionfuncs 
    printf \{ 'script: cleanup_sessionfuncs' }
    NetSessionFunc \{ func = match_uninit }
    NetSessionFunc \{ func = presence_uninit }
    NetSessionFunc \{ func = stats_uninit }
    NetSessionFunc \{ func = voice_uninit }
    NetSessionFunc \{ func = content_uninit }
    NetSessionFunc \{ func = auth_uninit }
    NetSessionFunc \{ func = clear_invited_session }
endscript

script connected_to_internet 
    printf 'script: connected_to_internet'
    change needstotestdnas = 0
    PauseMusicAndStreams
    cleanup_sessionfuncs
    setup_sessionfuncs
    NetSessionFunc obj = presence func = set_state params = { online }
    NetSessionFunc obj = presence func = get_mute_list
    printf 'checking availability'
    if NetSessionFunc obj = match func = is_service_available
        printf '*** service is available!!!'
        if IsPs2
            start_track_usage
        else
            if isPC
                if NetSessionFunc obj = presence func = profile_exists
                    NetSessionFunc obj = presence func = profile_login
                else
                    create_profile_warning_dialog
                endif
            endif
        endif
    else
        SpawnScriptLater check_availability
    endif
endscript

script invite_accepted 
    do_join_invite_stuff <...> 
endscript

script cross_game_invite_accepted 
endscript

script check_for_signin 
    if NOT CheckForSignin
        create_dialog_box \{Title = 'Xbox Live' text = 'Du musst dich mit einem für Xbox Live freigeschalteten Profil anmelden.' buttons = [{ text = 'Weiter' pad_choose_script = xbox360live_sign_in }{ text = 'Zurück' pad_choose_script = launch_main_menu }] no_animate}
    else
        xbox360live_sign_in
    endif
endscript

script xbox360live_sign_in 
    NetSessionFunc \{ func = onlinesignin }
endscript

script do_join_invite_stuff 
    if InFrontend
        main_menu_exit_to_online <...> 
    else
        if (InNetGame)
            quit_network_game
        else
            if (NetSessionFunc obj = match func = still_in_netgame)
                quit_network_game
            else
                if ObjectExists \{ id = current_menu_anchor }
                    DestroyScreenElement \{ id = current_menu_anchor }
                endif
                change \{ XenonAcceptedInvite = 1 }
                level_select_change_level_quit \{ level = Load_Z_MainMenu }
            endif
        endif
    endif
endscript

script dont_join_invite 
    NetSessionFunc \{ func = clearinvite }
    if NOT InFrontend
        exit_pause_menu
    endif
endscript

script availability_check_wait 
    printf \{ 'IN availability_check_wait' }
    dialog_box_exit
    create_dialog_box \{ Title = net_status_msg text = net_status_checking_motd no_animate }
endscript

script download_motd 
    printf '*** download_motd ***'
    dialog_box_exit
    create_dialog_box {
        Title = net_status_msg
        text = net_status_checking_motd
        buttons = [
            {text = 'Zurück' pad_choose_script = cancelled_motd}
        ]
        no_animate
    }
    wait 10 frames
    NetSessionFunc func = content_init
    NetSessionFunc obj = content func = download_file params = {
        max_size = 25600
        file = 'http://www.thug3online.com/motd.dat'
    }
    begin 
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    NetSessionFunc obj = content func = transfer_think
    wait 1 frame
    repeat 
    if NetSessionFunc obj = content func = transfer_succeeded
        change NeedsToDownloadMOTD = 0
        if NetSessionFunc obj = content func = decode_motd
            create_motd_menu message = <message>
        else
            CreateMotdFailedDialog
        endif
    else
        CreateMotdFailedDialog
    endif
endscript

script retrieve_motd 
    if NOT AlreadyGotMotd
        DownloadMotd
    else
        if ObjectExists \{ id = current_menu_anchor }
            DestroyScreenElement \{ id = current_menu_anchor }
        endif
        if NOT ProfileLogIn
            create_internet_options
        endif
    endif
endscript

script service_never_available 
    dialog_box_exit
    create_dialog_box \{Title = net_status_msg text = net_status_never_available buttons = [{ text = 'OK' pad_choose_script = back_from_startup_error_dialog }]}
endscript

script service_not_available 
    dialog_box_exit
    create_dialog_box \{Title = net_status_msg text = net_status_not_available buttons = [{ text = 'OK' pad_choose_script = back_from_startup_error_dialog }]}
endscript

script failed_internet_connection 
    printf \{ 'script failed_internet_connection' }
    NetSessionFunc \{ func = content_uninit }
    NetSessionFunc \{ func = voice_uninit }
    create_ss_menu \{ no_animate }
endscript

script chose_internet 
    printf \{ '**** Chose Internet*****' }
    SetNetworkMode \{ INTERNET_MODE }
    if ConnectToInternet \{ success = authenticate_client failure = failed_internet_connection }
        printf \{ 'connected to internet' }
    else
        if IsPs2
            change \{ needstotestdnas = 1 }
        else
            change \{ needstotestdnas = 0 }
        endif
        if ObjectExists \{ id = current_menu_anchor }
            DestroyScreenElement \{ id = current_menu_anchor }
        endif
    endif
endscript

script confirm_observe 
    generic_menu_pad_back_sound
    exit_pause_menu
    dialog_box_exit
    EnterObserverMode
endscript

script chose_observe 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_dialog_box \{Title = 'Zuschauermodus' text = 'Willst du wirklich nur zuschauen? Du kannst später nicht mehr ins Spiel einsteigen.' buttons = [{ text = 'Ja' pad_choose_script = confirm_observe }{ text = 'Nein' pad_choose_script = back_from_dialog }] no_animate}
endscript

script launch_motd_wait_dialog 
    dialog_box_exit
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_motd_wait_dialog
endscript

script launch_network_select_lan_games_menu 
    SetNetworkMode \{ LAN_MODE }
    launch_network_select_games_menu
endscript

script launch_network_host_options_menu 
    printf \{ 'launch_network_host_options_menu' }
    dialog_box_exit
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_network_host_options_menu
    printf \{ 'launch_network_host_options_menu-Done' }
endscript
in_server_options = 0

script back_from_internet_host_options 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 frame }
    endif
    change \{ in_server_options = 0 }
    if ((IsPs2)|| (isPC))
        if InNetGame
            if GameModeEquals \{ is_lobby }
                unhide_console_window
            endif
        endif
    endif
    if InNetGame
        create_pause_menu
    else
        launch_network_select_games_menu
    endif
endscript
in_net_lobby = 0

script back_from_auth_error 
    printf \{ 'script back_from_auth_error' }
    NetSessionFunc \{ func = match_uninit }
    dialog_box_exit
    create_ss_menu \{ no_animate }
endscript

script display_auth_error 
    PauseMusicAndStreams
    dialog_box_exit
    FormatText textname = message '%h (%s)\n%e\n\n%f' h = <header> s = <sub_code> e = <desc> f = <footer>
    create_dialog_box {Title = net_error_msg
        text = <message>
        text_dims = (500.0, 0.0)
        text_font = dialog
        buttons = [{text = 'OK' pad_choose_script = back_from_auth_error}
        ]
    }
endscript

script spawn_dnas_authentication 
    wait \{ 30 frames }
    printf \{ '*** about to init_auth ***' }
    NetSessionFunc \{ func = auth_init }
    printf \{ '*** about to authenticate ***' }
    NetSessionFunc \{ obj = auth func = authenticate }
endscript

script authenticate_client 
    printf '**** in authenticate client *****'
    PauseMusicAndStreams 1
    NetSessionFunc func = match_init
    NetSessionFunc func = content_uninit
    NetSessionFunc func = auth_uninit
    if IsPs2
        if IsTrue SkipDNASAuthentication
            connected_to_internet
            return 
        endif
        if NOT IsTrue needstotestdnas
            connected_to_internet
        else
            skater ::remove_skater_from_world
            create_dialog_box {Title = net_status_msg
                text = net_auth_msg
                logo = dnas
                no_icon = no_icon
                no_animate
            }
            SpawnScriptLater spawn_dnas_authentication
        endif
    endif
    if isPC
        connected_to_internet
    endif
    if IsXbox
    endif
endscript
current_lobby_focus = 0

script host_chosen 
    console_hide
    NetSessionFunc \{ obj = match func = stop_server_list }
    NetSessionFunc \{ obj = match func = free_server_list }
    launch_network_host_options_menu
endscript

script fcfs_selected 
    dialog_box_exit
    SetHostMode \{ HOST_MODE_FCFS }
    exit_pause_menu
endscript

script auto_serve_selected 
    dialog_box_exit
    GetPreferenceChecksum pref_type = network game_type
    switch <checksum>
        case netgoalattack
        if NOT GoalManager_GoalsAreSelected
            exit_pause_menu
            create_dialog_box {Title = 'Keine Ziele ausgewählt'
                text = 'Du musst Ziele wählen, bevor du den Ziel-Turnier-Autoserver startest.'
                buttons = [{text = 'OK' pad_choose_script = back_from_dialog}
                ]
            }
            return 
        endif
    endswitch
    SetHostMode HOST_MODE_AUTO_SERVE
    exit_pause_menu
endscript

script create_sit_out_menu 
    dialog_box_exit
    make_new_themed_sub_menu Title = 'AUSSETZEN'
    SetScreenElementProps {id = sub_menu event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_pause_menu }}
        ]
    }
    create_helper_text generic_helper_text
    theme_menu_add_item text = 'First Come, First Serve' id = menu_network_fcfs_select pad_choose_script = fcfs_confirm highlight_bar_scale = (1.149999976158142, 1.2999999523162842) highlight_bar_pos = (97.0, -7.0) centered = 1
    theme_menu_add_item text = 'Auto-Serve' id = menu_network_auto_serve_select pad_choose_script = auto_serve_confirm highlight_bar_scale = (1.149999976158142, 1.2999999523162842) highlight_bar_pos = (97.0, -7.0) centered = 1 last_menu_item = 1
    finish_themed_sub_menu
endscript

script do_nothing 
endscript

script create_motd_menu 
    dialog_box_exit
    profile_connect
endscript

script create_motd_wait_dialog 
    dialog_box_exit
    create_dialog_box \{Title = net_status_msg text = net_status_checking_motd buttons = [{ text = 'Zurück' pad_choose_script = cancelled_motd }] no_animate}
endscript

script cancelled_motd 
    printf \{ 'cancelled_motd' }
endscript

script CreateMotdRetryDialog 
    dialog_box_exit
    create_dialog_box {Title = net_status_msg
        text = <message>
        no_animate
    }
endscript

script CreateCheckExternalDeviceDialog \{ choose_script = back_from_startup_error_dialog }
    dialog_box_exit
    create_dialog_box {Title = net_status_msg
        text = net_error_not_connected
        buttons = [{text = 'OK' pad_choose_script = <choose_script>}
        ]
    }
endscript

script CreateMotdFailedDialog 
    printf \{ '*** CreateMotdFailedDialog ***' }
    if NetSessionFunc \{ func = is_cable_unplugged }
        CreateCheckExternalDeviceDialog
    else
        dialog_box_exit
        create_dialog_box \{Title = net_status_msg text = net_status_motd_failed buttons = [{ text = 'OK' pad_choose_script = back_from_startup_error_dialog }]}
    endif
endscript

script statsloginfaileddialog 
    dialog_box_exit
    create_dialog_box \{Title = net_error_msg text = net_status_stats_login_failed buttons = [{ text = 'OK' pad_choose_script = back_from_profile_error }]}
endscript

script statsretrievalfaileddialog 
    dialog_box_exit
    create_dialog_box \{Title = net_error_msg text = net_status_stats_retrieval_failed buttons = [{ text = 'OK' pad_choose_script = back_from_profile_error }]}
endscript

script back_from_failed_buddy_login 
    cleanup_sessionfuncs
    dialog_box_exit
    SetNetworkMode
    create_ss_menu \{ no_animate }
endscript

script createbuddyloginfaileddialog 
    dialog_box_exit
    create_dialog_box \{Title = net_error_msg text = net_status_buddy_login_failed buttons = [{ text = 'OK' pad_choose_script = back_from_failed_buddy_login }]}
endscript

script gamespy_login_failed_dialog 
    dialog_box_exit
    create_dialog_box \{Title = net_error_msg text = net_status_login_error buttons = [{ text = 'Ja' pad_choose_script = back_from_profile_error }{ text = 'Nein' pad_choose_script = back_from_auth_error }]}
endscript

script back_from_removed_dialog 
    dialog_box_exit
    if GotParam \{ in_front_end }
        printf ('back_from_removed_dialog::cancel_join_server')
        cancel_join_server
    else
        printf ('back_from_removed_dialog::quit_network_game')
        quit_network_game
    endif
endscript

script back_from_removed_dialog2 
    dialog_box_exit
    if GotParam \{ in_front_end }
        printf ('back_from_removed_dialog2::cancel_join_server')
        cancel_join_server
    else
        printf ('back_from_removed_dialog2::quit_network_game2')
        quit_network_game2
    endif
endscript

script CreateServerRemovedYouDialog 
    hideloadingscreen
    GoalManager_DeactivateAllGoals force_all
    GoalManager_UninitializeAllGoals
    GoalManager_SetCanStartGoal 0
    kill_net_panel_messages
    force_close_rankings dont_retry
    destroy_onscreen_keyboard
    dialog_box_exit
    exit_pause_menu
    if NOT IsObserving
        skater ::vibrate Off
    endif
    if ScreenElementExists id = quit_dialog_anchor
        DestroyScreenElement id = quit_dialog_anchor
    endif
    change check_for_unplugged_controllers = 0
    create_error_box {Title = net_notice_msg
        text = net_message_server_removed_you
        buttons = [{text = 'OK' pad_choose_script = back_from_removed_dialog pad_choose_params = <...> }
        ]
        delay_input
    }
endscript

script CreateServerMovedOnDialog 
    hideloadingscreen
    force_close_rankings dont_retry
    destroy_onscreen_keyboard
    dialog_box_exit
    exit_pause_menu
    if NOT IsObserving
        skater ::vibrate Off
    endif
    if isPC
        if ScreenElementExists id = quit_dialog_anchor
            DestroyScreenElement id = quit_dialog_anchor
        endif
    endif
    change check_for_unplugged_controllers = 0
    if isPC
        create_error_box {Title = net_notice_msg
            text = net_message_server_moved_on
            buttons = [{text = 'OK' pad_choose_script = back_from_removed_dialog2 pad_choose_params = <...> }
            ]
            delay_input
        }
    else
        create_error_box {Title = net_notice_msg
            text = net_message_server_moved_on
            buttons = [{text = 'OK' pad_choose_script = back_from_removed_dialog pad_choose_params = <...> }
            ]
            delay_input
        }
    endif
endscript

script destroy_server_menu_children 
    if ObjectExists \{ id = server_list_menu }
        SetScreenElementLock \{ id = server_list_menu Off }
        DestroyScreenElement \{ id = server_list_menu recurse preserve_parent }
        if GotParam \{ refocus }
            refocus_actions_menu
        endif
    endif
endscript

script destroy_server_desc_children 
    if ObjectExists \{ id = server_desc_menu }
        SetScreenElementLock \{ id = server_desc_menu Off }
        DestroyScreenElement \{ id = server_desc_menu recurse preserve_parent }
    endif
    if ObjectExists \{ id = server_player_menu }
        DestroyScreenElement \{ id = server_player_menu recurse preserve_parent }
    endif
    refocus_gamelist_menu
endscript

script destroy_lobby_user_list_children 
    if ObjectExists \{ id = lobby_player_list_menu }
        prepare_lobby_user_list_for_new_children
        DestroyScreenElement \{ id = lobby_player_list_menu recurse preserve_parent }
    endif
endscript

script destroy_lobby_user 
    if ObjectExists id = <user_id>
        DestroyScreenElement id = <user_id>
    endif
endscript

script destroy_lobby_server 
    if ObjectExists id = <server_id>
        DestroyScreenElement id = <server_id>
    endif
endscript

script destroy_lobby_buddy_list_children 
    if ObjectExists \{ id = homie_vmenu }
        prepare_lobby_buddy_list_for_new_children
        DestroyScreenElement \{ id = homie_vmenu recurse preserve_parent }
    endif
endscript

script add_no_servers_found_message 
    if ObjectExists \{ id = server_list_menu }
        SetScreenElementLock \{ id = server_list_menu Off }
        if IsXbox
            main_menu_add_item \{ text = 'Keine Spiele gefunden' parent = server_list_menu id = menu_network_no_servers }
        else
            main_menu_add_item \{ text = 'Kein Server gefunden' parent = server_list_menu id = menu_network_no_servers }
        endif
        if GotParam \{ refocus }
            refocus_actions_menu
        endif
    endif
endscript

script prepare_server_menu_for_new_children 
    if ObjectExists \{ id = server_list_menu }
        SetScreenElementLock \{ id = server_list_menu Off }
    endif
endscript

script prepare_lobby_user_list_for_new_children 
    if ObjectExists \{ id = lobby_player_list_menu }
        SetScreenElementLock \{ id = lobby_player_list_menu Off }
    endif
endscript

script prepare_lobby_buddy_list_for_new_children 
    if ObjectExists \{ id = homie_vmenu }
        SetScreenElementLock \{ id = homie_vmenu Off }
    endif
endscript

script lobby_join_operation 
    begin 
    if NOT NetSessionFunc \{ obj = match func = operation_in_progress }
        break 
    endif
    wait \{ 1 frame }
    repeat 
    dialog_box_exit
    if NetSessionFunc \{ obj = match func = in_lobby }
        create_network_select_games_menu
        NetSessionFunc \{ obj = match func = refresh_lobby_player_list }
    else
        CreateJoinLobbyFailedDialog
    endif
endscript

script rejoin_lobby 
    printf \{ 'script rejoin_lobby' }
    NetSessionFunc \{ obj = match func = rejoin_lobby }
    create_joining_lobby_dialog
    lobby_join_operation
endscript

script async_join_lobby 
    wait \{ 10 frames }
    NetSessionFunc obj = match func = join_lobby params = <...> 
    lobby_join_operation
endscript

script choose_selected_lobby 
    printf \{ '---------------------- chose lobby ----------------------' }
    DestroyScreenElement \{ id = lobby_list_anchor }
    DestroyScreenElement \{ id = menu_parts_anchor }
    create_joining_lobby_dialog
    SpawnScriptLater async_join_lobby params = <...> 
endscript

script choose_selected_server 
    printf \{ '---- choose_selected_server ----' }
    console_hide
    NetSessionFunc obj = match func = choose_server params = <...> 
    DestroyScreenElement \{ id = current_menu_anchor }
endscript

script describe_selected_server 
    printf \{ 'script describe_selected_server' }
    NetSessionFunc obj = match func = describe_server params = <...> 
endscript

script choose_selected_player 
    CreatePlayerOptions <...> 
endscript

script choose_selected_account 
    ChooseAccount <...> 
endscript

script cancel_remove_player 
    CancelRemovePlayer
    dialog_box_exit
    create_pause_menu
endscript

script kick_player_confirm 
    create_dialog_box {Title = <name>
        text = 'Spieler rauswerfen?'
        buttons = [{text = 'Ja' pad_choose_script = kick_player}
            {text = 'no' pad_choose_script = cancel_remove_player}
        ]
    }
endscript

script kick_player 
    KickPlayer
    dialog_box_exit
    create_pause_menu
endscript

script back_from_dialog 
    dialog_box_exit
    create_pause_menu
endscript

script ban_player_confirm 
    create_dialog_box {Title = <name>
        text = 'Spieler sperren?'
        buttons = [{text = 'Ja' pad_choose_script = ban_player}
            {text = 'no' pad_choose_script = cancel_remove_player}
        ]
    }
endscript

script ban_player 
    BanPlayer
    dialog_box_exit
    create_pause_menu
endscript

script launch_pin_entry_menu 
    DestroyScreenElement \{ id = current_menu_anchor }
    create_pin_entry_menu
endscript

script launch_buddy_list 
    DestroyScreenElement \{ id = current_menu_anchor }
    create_buddy_list_menu
endscript

script async_update_homie_list 
    NetSessionFunc \{ obj = presence func = retrieve_friends_list }
    begin 
    NetSessionFunc \{ obj = presence func = pump_friends_list }
    wait \{ 1 frame }
    repeat 
endscript

script launch_homie_list parent = root_window
    pulse_blur
    dialog_box_exit
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
    if InNetGame
        GoalManager_HidePoints
    endif
    if (<parent> = root_window)
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
    endif
    SetScreenElementLock id = <parent> Off
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = homie_bg_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = homie_bg_anchor alias = current_menu_anchor
    create_helper_text generic_helper_text
    build_theme_sub_title Title = 'FREUNDESLISTE'
    if InFrontend
        build_top_and_bottom_blocks bot_z = 15
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = homie_bg_anchor
        id = homie_menu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 840.0)
    }
    AssignAlias id = homie_menu_anchor alias = current_menu_anchor
    theme_background width = 7 Pos = (320.0, 63.0) num_parts = 10 static = static dark_menu = dark_menu
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (71.30000305175781, 4.0)
        Pos = (35.0, 63.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    if InFrontend
        CreateScreenElement {
            type = SpriteElement
            parent = homie_bg_anchor
            texture = homie
            Scale = (1.7999999523162842, 1.2999999523162842)
            Pos = (380.0, 67.0)
            just = [ left bottom ]
            alpha = 0.5000
            z_priority = 5
        }
        CreateScreenElement {
            type = SpriteElement
            parent = homie_bg_anchor
            id = globe
            texture = globe
            Scale = 1.500
            Pos = (760.0, 240.0)
            just = [ center center ]
            alpha = 0.8000
            z_priority = -1
        }
    endif
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        text = 'Name'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (90.0, 83.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (260.0, 83.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (260.0, 345.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (0.800000011920929, 32.29999923706055)
        Pos = (275.0, 95.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        text = 'Status'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (285.0, 83.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (0.800000011920929, 32.29999923706055)
        Pos = (380.0, 95.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        text = 'Ort'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (390.0, 83.0)
        just = [ left center ]
    }
    if InNetGame
        pad_back_script = back_to_pause_menu_from_buddy_list
    else
        pad_back_script = back_to_server_list_from_buddy_list
    endif
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        id = homie_scrolling_menu
        just = [ left top ]
        dims = (600.0, 240.0)
        Pos = (100.0, 103.0)
    }
    CreateScreenElement {
        type = vmenu
        parent = homie_scrolling_menu
        id = homie_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            {pad_back generic_menu_pad_back params = { callback = <pad_back_script> }}
        ]
        dont_allow_wrap
    }
    if ((IsPs2)|| (isPC))
        if NetSessionFunc obj = presence func = has_friends
            if NetSessionFunc obj = match func = in_lobby
                NetSessionFunc obj = presence func = fill_friends_list params = { allow_remove allow_join }
            else
                NetSessionFunc obj = presence func = fill_friends_list params = { allow_remove }
            endif
        endif
        wait 2 gameframes
        SetScreenElementProps id = homie_scrolling_menu
    endif
    if IsXbox
        SpawnScriptLater async_update_homie_list
    endif
    AssignAlias id = homie_bg_anchor alias = current_menu_anchor
    if ScreenElementExists id = globe
        RunScriptOnScreenElement id = globe rotate_internet_options_globe
    endif
    if NOT GotParam dont_animate_in
        RunScriptOnScreenElement id = homie_menu_anchor online_stats_animate_in params = { id = homie_menu_anchor }
        FireEvent type = focus target = homie_vmenu
    endif
endscript

script homie_list_add_item name = '' status = '' location = ''
    printf 'homie_list_add_item'
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    if ScreenElementExists id = homie_vmenu
        printf 'homie_list_add_itemhomie_list_add_item'
        SetScreenElementLock id = homie_vmenu Off
        CreateScreenElement {
            type = ContainerElement
            parent = homie_vmenu
            id = <id>
            dims = (500.0, 15.0)
            Pos = (0.0, 0.0)
            event_handlers = [
                { focus online_stats_generic_focus }
                { unfocus online_stats_generic_unfocus }
                {pad_choose present_buddy_options params = { <pad_choose_params> }}
                {pad_start present_buddy_options params = { <pad_choose_params> }}
                { pad_choose generic_menu_pad_choose_sound }
            ]
        }
        anchor_id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = DE_highlight_bar
            Scale = (4.449999809265137, 0.44999998807907104)
            Pos = (-65.0, 0.0)
            just = [ left center ]
            rgba = <bar_rgba>
            alpha = 0
            z_priority = 2
        }
        if ((IsPs2)|| (isPC))
            FormatText checksumname = rank_icon 'rank_%i' i = <rank>
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id>
                texture = <rank_icon>
                Scale = 0.7000
                Pos = (-60.0, 0.0)
                just = [ left center ]
            }
        endif
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            text = <name>
            font = dialog
            Scale = 0.8000
            Pos = (-10.0, 0.0)
            just = [ left center ]
            rgba = <off_rgba>
        }
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            text = <status>
            font = dialog
            Scale = 0.8000
            Pos = (185.0, 0.0)
            just = [ left center ]
            rgba = <off_rgba>
        }
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            text = <location>
            font = dialog
            Scale = 0.8000
            Pos = (290.0, 0.0)
            just = [ left center ]
            rgba = <off_rgba>
        }
    endif
endscript

script back_to_pause_menu_from_buddy_list 
    NetSessionFunc \{ obj = presence func = stop_friends_list }
    KillSpawnedScript \{ name = async_update_homie_list }
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    GoalManager_ShowPoints
    create_pause_menu
endscript

script show_nat_start_dialog 
    PauseMusicAndStreams
    create_dialog_box \{Title = net_status_msg text = net_status_locating buttons = [{text = 'Zurück' pad_choose_script = cancel_join_server pad_choose_params = { cancel_nn }}]}
endscript

script show_nat_timeout 
    dialog_box_exit
    create_dialog_box \{Title = net_error_msg text = net_status_nat_neg_failed buttons = [{text = 'OK' pad_choose_script = cancel_join_server pad_choose_params = { cancel_nn }}]}
endscript

script present_buddy_options back_script = launch_homie_list remove_script = lobby_remove_buddy
    if GotParam in_lobby
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
        pad_back_params = { from_lobby }
    else
        DestroyScreenElement id = current_menu_anchor
    endif
    NetSessionFunc obj = presence func = stop_friends_list
    KillSpawnedScript name = async_update_homie_list
    back_script = launch_homie_list
    nick = <name>
    if GotParam allow_join
        if GotParam allow_remove
            FormatText textname = msg_text '%s : %t' s = <status> t = <location>
            create_dialog_box {Title = <nick>
                text = <msg_text>
                buttons = [{text = 'Zurück' pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
                    {text = 'Nachricht senden' pad_choose_script = message_buddy pad_choose_params = <...> }
                    {text = 'Beitreten' pad_choose_script = join_buddy pad_choose_params = <...> }
                    {text = 'Zuschauen' pad_choose_script = observe_buddy pad_choose_params = <...> }
                    {text = 'Entfernen' pad_choose_script = <remove_script> pad_choose_params = <...> }
                ]
            }
        else
            FormatText textname = msg_text '%s : %t' s = <status> t = <location>
            create_dialog_box {Title = <nick>
                text = <msg_text>
                buttons = [{text = 'Zurück' pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
                    {text = 'Nachricht senden' pad_choose_script = message_buddy pad_choose_params = <...> }
                    {text = 'Beitreten' pad_choose_script = join_buddy pad_choose_params = <...> }
                    {text = 'Zuschauen' pad_choose_script = observe_buddy pad_choose_params = <...> }
                ]
            }
        endif
    else
        if GotParam allow_remove
            FormatText textname = msg_text '%s : %t' s = <status> t = <location>
            create_dialog_box {Title = <nick>
                text = <msg_text>
                buttons = [{text = 'Zurück' pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
                    {text = 'Nachricht senden' pad_choose_script = message_buddy pad_choose_params = <...> }
                    {text = 'Entfernen' pad_choose_script = <remove_script> pad_choose_params = <...> }
                ]
            }
        else
            FormatText textname = msg_text '%s : %t' s = <status> t = <location>
            create_dialog_box {Title = <nick>
                text = <msg_text>
                buttons = [{text = 'Nachricht senden' pad_choose_script = message_buddy pad_choose_params = <...> }
                    {text = 'Zurück' pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
                ]
            }
        endif
    endif
endscript

script join_buddy 
    NetSessionFunc obj = presence func = join_friend params = <...> 
endscript

script observe_buddy 
    NetSessionFunc obj = presence func = join_friend params = { <...> observe }
endscript

script shell_remove_buddy 
    NetSessionFunc obj = presence func = remove_friend params = <...> 
    back_from_shell_buddy_options
endscript

script back_from_shell_buddy_options 
    dialog_box_exit
    launch_homie_list
endscript

script net_chosen_join_server 
    printf '******* In net_chosen_join_server *******'
    LeaveServer
    SetServerMode Off
    NetSessionFunc obj = match func = stop_lobby_list
    if GotParam cookie
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
        show_nat_start_dialog
        if NOT NetSessionFunc obj = match func = start_nat_negotiation params = <...> 
            create_join_failed_dialog
        endif
    else
        JoinServer <...> 
    endif
    kill_start_key_binding
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    change check_for_unplugged_controllers = 0
endscript

script create_lobby_list_menu 
    Theme_GetHighlightedTextColor return_value = rgba
    build_top_and_bottom_blocks
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = lobby_list_anchor
        Pos = (-5.0, 800.0)
    }
    make_new_menu {menu_id = lobby_list_menu
        parent = lobby_list_anchor
        type = vscrollingmenu
        dims = (200.0, 205.0)
        Pos = (80.0, 140.0)
        vmenu_id = lobby_list_vmenu
        menu_title = ''
        dont_allow_wrap = dont_allow_wrap
    }
    CreateScreenElement {
        type = TextElement
        parent = lobby_list_anchor
        font = testtitle
        text = 'REGIONEN'
        Scale = 1.500
        Pos = (92.0, 86.0)
        just = [ left top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = lobby_list_anchor
        texture = white2
        texture = white2
        Scale = (34.5, 5.0)
        Pos = (34.0, 82.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = lobby_list_anchor
        id = regions_up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (150.0, 121.0)
        just = [ left top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = lobby_list_anchor
        id = regions_down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (150.0, 338.0)
        just = [ left top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
    }
    theme_background parent = lobby_list_anchor width = 2.250 Pos = (170.0, 78.0) num_parts = 10
    SetScreenElementLock id = root_window Off
    SetScreenElementProps {id = lobby_list_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_lobbies }}]}
    SetScreenElementProps {id = lobby_list_vmenu event_handlers = [
            {pad_up set_which_arrow params = { arrow = regions_up_arrow }}
            {pad_down set_which_arrow params = { arrow = regions_down_arrow }}
        ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = lobby_list_anchor
        z_priority = 100
        Pos = (132.0, 68.0)
        texture = gslogo Scale = 1.100
        alpha = 1
    }
    RunScriptOnScreenElement lobby_list_animate_in id = lobby_list_anchor
    FireEvent type = focus target = lobby_list_menu
endscript

script lobby_list_animate_in \{ id = lobby_list_anchor }
    DoScreenElementMorph id = <id> Pos = (-5.0, 0.0) time = 0.3000
endscript

script regions_menu_add_item 
    FormatText checksumname = id '%i' i = <text>
    theme_menu_add_item {parent = lobby_list_vmenu centered <...> menu = 2 no_bg = no_bg}
endscript

script regions_menu_set_focus 
    generic_menu_update_arrows \{ up_arrow_id = regions_up_arrow down_arrow_id = regions_down_arrow }
    lobby_list_vmenu ::gettags
    if GotParam \{ arrow_id }
        menu_vert_blink_arrow { id = <arrow_id> }
    endif
    main_theme_focus <...> 
endscript

script create_pin_entry_menu 
    make_new_menu \{ menu_id = pin_entry_menu vmenu_id = pin_entry_vmenu menu_title = 'PIN EINGEBEN' }
    SetScreenElementLock \{ id = root_window Off }
    SetScreenElementProps \{id = pin_entry_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = do_nothing }}]}
    RunScriptOnScreenElement \{ id = main_menu_anchor menu_onscreen }
endscript

script create_buddy_list_menu 
    make_new_menu \{ menu_title = 'Freundesliste' }
    SetScreenElementLock \{ id = root_window Off }
    SetScreenElementProps \{id = main_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = launch_xbox_online_menu }}]}
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_onscreen }
endscript

script back_from_regions_menu 
    if ObjectExists \{ id = lobby_list_anchor }
        FireEvent \{ type = unfocus target = lobby_list_menu }
        FireEvent \{ type = focus target = sub_menu }
        AssignAlias \{ id = menu_parts_anchor alias = current_menu_anchor }
        DoScreenElementMorph \{ id = lobby_list_anchor Pos = (-5.0, 800.0) time = 0.3000 }
        wait \{ 0.3000 seconds }
        DestroyScreenElement \{ id = lobby_list_anchor }
    endif
endscript

script back_from_lobbies 
    printf \{ 'script back_from_lobbies' }
    NetSessionFunc \{ obj = match func = logoff }
    NetSessionFunc \{ obj = match func = stop_server_list }
    NetSessionFunc \{ obj = match func = free_server_list }
    NetSessionFunc \{ obj = match func = cancel_nat_negotiation }
    back_from_regions_menu
endscript

script back_from_network_menu 
    NetSessionFunc \{ obj = match func = stop_server_list }
    NetSessionFunc \{ obj = match func = free_server_list }
    DestroyScreenElement \{ id = current_menu_anchor }
    create_ss_menu \{ no_animate }
endscript

script back_from_multiplayer_menu 
    NetSessionFunc \{ obj = match func = stop_server_list }
    NetSessionFunc \{ obj = match func = free_server_list }
    back_from_network_select_menu <...> 
endscript

script select_host_option 
    if IsPs2
        if (<checksum> = rank_test_less)
            orig_checksum = <checksum>
            GetPreferenceChecksum pref_type = network rank_limit
            if (<checksum> = num_1)
                SetPreferencesFromUI prefs = network field = 'rank_limit' checksum = num_2 string = '2'
            endif
            checksum = <orig_checksum>
        endif
        if (<checksum> = rank_test_greater)
            orig_checksum = <checksum>
            GetPreferenceChecksum pref_type = network rank_limit
            if (<checksum> = num_10)
                SetPreferencesFromUI prefs = network field = 'rank_limit' checksum = num_9 string = '9'
            endif
            checksum = <orig_checksum>
        endif
    endif
    SetPreferencesFromUI <...> 
    if InInternetMode
        if InNetGame
            if OnServer
                NetSessionFunc obj = match func = update_game_options
            endif
        endif
    endif
    select_host_option2
endscript

script select_host_option2 
    launch_network_host_options_menu
endscript

script select_game_option 
    printf 'select_game_option'
    if (<checksum> = netctf)
        if NOT InTeamGame
            SetPreferencesFromUI prefs = network field = 'team_mode' checksum = teams_two string = '2'
            SetNumTeams 2
        endif
    endif
    SetPreferencesFromUI <...> 
    printf <checksum>
    switch <checksum>
        case netscorechallenge
        case scorechallenge
        GetPreferenceChecksum pref_type = <prefs> score_mode
        switch <checksum>
            case point_scoring
            printf 'point_scoring game option'
            SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_1000000 Score = 1000000 string = '1.000.000 Punkte'
            case tag_scoring
            printf 'tag_scoring game option'
            SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 Score = 10 string = '10 Tags'
            default 
            printf 'unknown scoring method'
        endswitch
        case netking
        case king
        SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = time_120 time = 120 string = '2 Minuten'
        case timed_gold
        printf 'setting target score to timed'
        GetPreferenceChecksum pref_type = <prefs> score_mode
        printf <checksum>
        SetPreferencesFromUI prefs = <prefs> field = 'time_limit' checksum = time_120 time = 120 string = '2 Minuten'
        case netgold
        case gold
        case score_gold
        printf 'setting target score to points/tags'
        GetPreferenceChecksum pref_type = <prefs> score_mode
        printf <checksum>
        SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_1000000 Score = 1000000 string = '1.000.000 Punkte'
        SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 Score = 10 string = '10 Tags'
        case netctf
        SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_5 Score = 5 string = '5 Eroberungen'
    endswitch
    if InNetGame
        create_network_game_options_menu <...> 
    else
        create_network_game_options_menu <...> end_run
    endif
endscript

script select_team_mode_option 
    SetPreferencesFromUI <...> 
    if GameModeEquals is_lobby
        GetPreferenceChecksum pref_type = network team_mode
        switch <checksum>
            case teams_none
            printf 'SetNumTeams 0'
            SetNumTeams 0
            case teams_two
            printf 'SetNumTeams 2'
            SetNumTeams 2
            case teams_three
            printf 'SetNumTeams 3'
            SetNumTeams 3
            case teams_four
            printf 'SetNumTeams 4'
            SetNumTeams 4
            default 
        endswitch
    endif
    launch_network_host_options_menu
endscript

script game_options_goals_sub_menu_return 
    SetPreferencesFromUI \{ prefs = network field = 'goals' string = 'ERSTELLT' checksum = goals_created }
    if NOT InFrontend
        dialog_box_exit
        kill_start_key_binding
        create_dialog_box \{Title = net_warning_msg text = net_message_goals_next_level buttons = [{ text = 'OK' pad_choose_script = create_network_game_options_menu }]}
    else
        create_network_game_options_menu
    endif
endscript

script host_options_goals_sub_menu_return 
    SetPreferencesFromUI \{ prefs = network field = 'goals' string = 'ERSTELLT' checksum = goals_created }
    if NOT InFrontend
        dialog_box_exit
        kill_start_key_binding
        create_dialog_box \{Title = net_warning_msg text = net_message_goals_next_level buttons = [{ text = 'OK' pad_choose_script = launch_network_host_options_menu }]}
    else
        launch_network_host_options_menu
    endif
endscript

script host_options_goals_sub_menu_exit 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    <new_menu_script> <...> 
endscript

script create_host_options_sub_menu pad_choose = select_host_option
    make_new_themed_sub_menu Title = <menu_title>
    if InFrontend
        CreateScreenElement {
            type = SpriteElement
            parent = menu_parts_anchor
            id = globe
            texture = globe
            Scale = 1.500
            Pos = (760.0, 240.0)
            just = [ center center ]
            alpha = 0.6000
            z_priority = -1
        }
        RunScriptOnScreenElement id = globe rotate_internet_options_globe
    endif
    SetScreenElementProps {id = sub_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = launch_network_host_options_menu }}]
    }
    RemoveParameter id
    if GotParam array
        GetArraySize <array>
        if GotParam max_index
            <array_size> = (<max_index> + 1)
        endif
        <index> = 0
        begin 
        name = ((<array> [ <index> ]).name)
        if StructureContains structure = (<array> [ <index> ])checksum
            checksum = ((<array> [ <index> ]).checksum)
        endif
        if StructureContains structure = (<array> [ <index> ])time
            time = ((<array> [ <index> ]).time)
        endif
        if StructureContains structure = (<array> [ <index> ])broadband_only
            orig_checksum = <checksum>
            GetPreferenceChecksum pref_type = network device_type
            switch <checksum>
                case device_sony_modem
                case device_usb_modem
                break 
            endswitch
            checksum = <orig_checksum>
        endif
        params = {}
        if StructureContains structure = (<array> [ <index> ])test_greater_only
            orig_checksum = <checksum>
            GetPreferenceChecksum pref_type = network rank_test
            switch <checksum>
                case rank_test_less
                params = { not_focusable }
            endswitch
            checksum = <orig_checksum>
        endif
        if StructureContains structure = (<array> [ <index> ])test_less_only
            orig_checksum = <checksum>
            GetPreferenceChecksum pref_type = network rank_test
            switch <checksum>
                case rank_test_greater
                params = { not_focusable }
            endswitch
            checksum = <orig_checksum>
        endif
        pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}
        if (<pref_field> = 'skill_level')
            <just> = [ left center ]
            RemoveParameter centered
            text_pos = (20.0, -5.0)
        else
            <just> = [ center center ]
        endif
        if (<index> = 0)
            theme_menu_add_item {
                <...> 
                text = <name>
                <params>
                pad_choose_script = <pad_choose>
                pad_choose_params = <pad_choose_params>
                text_just = <just>
            }
        else
            if (<index> = (<array_size> - 1))
                theme_menu_add_item {
                    last_menu_item = last_menu_item
                    <...> 
                    <params>
                    text = <name>
                    pad_choose_script = <pad_choose>
                    pad_choose_params = <pad_choose_params>
                    text_just = <just>
                }
            else
                theme_menu_add_item {
                    <...> 
                    <params>
                    text = <name>
                    pad_choose_script = <pad_choose>
                    pad_choose_params = <pad_choose_params>
                    text_just = <just>
                }
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    finish_themed_sub_menu
endscript

script create_game_options_sub_menu 
    if InSplitScreenGame
        prefs = splitscreen
    else
        prefs = network
    endif
    if (<pref_field> = 'game_type')
        make_new_themed_sub_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu Pos = (230.0, 603.0) dims = (450.0, 190.0) scrolling
        CreateScreenElement {
            type = SpriteElement
            parent = options_sub_menu
            id = options_sub_menu_arrow_up
            texture = up_arrow
            Pos = (315.0, 595.0)
            just = [ center bottom ]
            z_priority = 20
            Scale = 1
            rgba = [ 110 0 85 128 ]
        }
        CreateScreenElement {
            type = SpriteElement
            parent = options_sub_menu
            id = options_sub_menu_arrow_down
            texture = down_arrow
            Pos = (315.0, 800.0)
            just = [ center bottom ]
            z_priority = 20
            Scale = 1
            rgba = [ 110 0 85 128 ]
        }
        SetScreenElementProps {
            id = options_sub_vmenu
            event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = create_network_game_options_menu <...>  }}
                {pad_up blink_arrow params = { id = options_sub_menu_arrow_up }}
                {pad_down blink_arrow params = { id = options_sub_menu_arrow_down }}
            ]
        }
        generic_array_menu_desc_setup <...> 
    else
        make_new_themed_sub_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu Pos = (230.0, 620.0)
        SetScreenElementProps {
            id = options_sub_menu
            event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = create_network_game_options_menu <...>  }}
            ]
        }
        generic_array_menu_setup <...> 
    endif
    build_theme_sub_title Title = <menu_title> right_bracket_z = -1 right_bracket_alpha = 0.0
    create_helper_text generic_helper_text
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    DoScreenElementMorph id = options_sub_menu time = 0.2000 Pos = (320.0, -240.0)
    if (<pref_field> = 'game_type')
        DoScreenElementMorph id = bg_box_vmenu time = 0.2000 Pos = (320.0, 85.0)
        DoScreenElementMorph id = item_bg_box time = 0.2000 Pos = (320.0, 329.0)
        DoScreenElementMorph id = item_description_text time = 0.2000 Pos = (320.0, 318.0)
        DoScreenElementMorph id = item_description_bar time = 0.2000 Pos = (320.0, 328.0)
    endif
    if ScreenElementExists id = top_bar_anchor
        DoScreenElementMorph id = top_bar_anchor time = 0.2000 Pos = (0.0, 62.0)
    endif
    FireEvent type = focus target = options_sub_menu
endscript

script set_host_option_preference 
    GetTextElementString \{ id = keyboard_current_string }
    SetPreferencesFromUI prefs = network <...> 
    destroy_onscreen_keyboard
    create_network_host_options_menu
endscript

script host_options_back_from_keyboard 
    destroy_onscreen_keyboard
    create_network_host_options_menu
endscript

script set_horse_option_preference 
    GetTextElementString \{ id = keyboard_current_string }
    SetPreferencesFromUI prefs = splitscreen <...> 
    horse_word_back_from_keyboard
endscript

script horse_word_back_from_keyboard 
    destroy_onscreen_keyboard
    create_network_game_options_menu \{ end_run }
endscript

script create_network_host_options_server_name_menu 
    GetPreferenceString \{ pref_type = network server_name }
    DestroyScreenElement \{ id = current_menu_anchor }
    create_onscreen_keyboard allow_cancel keyboard_cancel_script = host_options_back_from_keyboard keyboard_done_script = set_host_option_preference keyboard_title = 'NAME' field = 'server_name' text = <ui_string> min_length = 1 max_length = 15
endscript

script create_network_host_options_password_menu 
    GetPreferenceString \{ pref_type = network password }
    DestroyScreenElement \{ id = current_menu_anchor }
    create_onscreen_keyboard password allow_cancel keyboard_cancel_script = host_options_back_from_keyboard keyboard_done_script = set_host_option_preference keyboard_title = 'PASSWORT' field = 'password' text = <ui_string> min_length = 0 max_length = 9
endscript

script create_network_host_options_max_players_menu 
    create_host_options_sub_menu menu_title = 'SPIELER' pref_type = network pref_field = 'num_players' array = num_players_info pad_choose_script = select_host_option Pos = (227.0, 112.0) helper_text = generic_helper_text <...> centered
endscript

script create_network_host_options_max_observers_menu 
    create_host_options_sub_menu \{menu_title = 'ZUSCHAUER' pref_type = network pref_field = 'num_observers' array = num_observers_info pad_choose_script = select_host_option Pos = (227.0, 112.0) helper_text = generic_helper_text centered}
endscript

script create_network_host_options_player_collision_menu 
    create_host_options_sub_menu \{menu_title = 'SPIELERKOLLISION' pref_type = network pref_field = 'player_collision' array = on_off_types pad_choose_script = select_host_option helper_text = generic_helper_text centered}
endscript

script create_network_host_options_team_menu 
    create_host_options_sub_menu \{menu_title = 'TEAMS' pref_type = network pref_field = 'team_mode' array = team_types pad_choose = select_team_mode_option Pos = (227.0, 112.0) helper_text = generic_helper_text centered}
endscript

script create_network_host_options_skill_level_menu 
    create_host_options_sub_menu \{menu_title = 'SCHWIERIGKEIT' pref_type = network pref_field = 'skill_level' array = skill_level_info pad_choose_script = select_host_option Pos = (227.0, 112.0) helper_text = generic_helper_text centered}
endscript

script create_network_host_options_rank_limit_menu 
    create_host_options_sub_menu \{menu_title = 'RANGLIMIT' pref_type = network pref_field = 'rank_limit' array = rank_limits pad_choose_script = select_host_option Pos = (227.0, 112.0) helper_text = generic_helper_text centered}
endscript

script create_network_host_options_rank_test_menu 
    create_host_options_sub_menu \{menu_title = 'RANGLIMITIERUNG' pref_type = network pref_field = 'rank_test' array = rank_tests pad_choose_script = select_host_option Pos = (227.0, 112.0) helper_text = generic_helper_text centered}
endscript

script create_mp_game_options_game_type_menu 
    create_game_options_sub_menu menu_title = 'SPIELTYP' pref_type = splitscreen pref_field = 'game_type' array = mp_game_type_info call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_game_type_menu 
    if IsTrue \{ DEMO_BUILD }
        create_game_options_sub_menu menu_title = 'SPIELTYP' pref_type = network pref_field = 'game_type' array = net_game_type_info_demo call_script = select_game_option helper_text = generic_helper_text <...> 
    else
        create_game_options_sub_menu menu_title = 'SPIELTYP' pref_type = network pref_field = 'game_type' array = net_game_type_info call_script = select_game_option helper_text = generic_helper_text <...> 
    endif
endscript

script create_network_game_options_goal_type_menu 
    create_game_options_sub_menu menu_title = 'ZIELART' pref_type = <prefs> pref_field = 'goals' array = net_goal_info call_script = network_game_options_goal_type_select helper_text = generic_helper_text <...> 
endscript

script network_game_options_goal_type_select 
    GoalManager_DeselectAllGoals
    select_game_option <...> 
endscript

script create_network_game_options_ctf_mode_menu 
    create_game_options_sub_menu menu_title = 'MODUS' pref_type = <prefs> pref_field = 'ctf_game_type' array = ctf_type call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_gold_mode_menu 
    create_game_options_sub_menu menu_title = 'MODUS' pref_type = <prefs> pref_field = 'gold_game_type' array = gold_type call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_score_mode_menu 
    create_game_options_sub_menu menu_title = 'PUNKTE-MODUS' pref_type = <prefs> pref_field = 'score_mode' array = score_type call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_score_menu 
    create_game_options_sub_menu menu_title = 'ZIELPUNKTZAHL' pref_type = <prefs> pref_field = 'target_score' array = target_score_options call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_tags_menu 
    create_game_options_sub_menu menu_title = 'ZIEL-TAGS' pref_type = <prefs> pref_field = 'target_tags' array = target_tags_options call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_captures_menu 
    create_game_options_sub_menu menu_title = 'EROBERUNGEN' pref_type = <prefs> pref_field = 'target_score' array = capture_options call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_target_time_menu 
    create_game_options_sub_menu menu_title = 'ZEITLIMIT' pref_type = <prefs> pref_field = 'target_score' array = time_limit_options call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_time_menu 
    create_game_options_sub_menu menu_title = 'ZEITLIMIT' pref_type = network pref_field = 'time_limit' array = time_limit_options call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_graffiti_scoring_menu 
    create_game_options_sub_menu menu_title = 'PUNKTEMODUS' pref_type = network pref_field = 'team_graffiti_mode' array = team_graffiti_mode call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_friendly_fire_menu 
    create_game_options_sub_menu menu_title = 'TEAMFEUER' pref_type = network pref_field = 'friendly_fire' array = on_off_types call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_network_game_options_fireball_difficulty_menu 
    create_game_options_sub_menu menu_title = 'SCHWIERIGKEIT' pref_type = network pref_field = 'fireball_difficulty' array = fireball_level_info call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_mp_game_options_stop_at_zero_menu 
    create_game_options_sub_menu menu_title = 'STOPP BEI NULL' pref_type = network pref_field = 'stop_at_zero' array = boolean_types call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_mp_game_options_score_reset_menu 
    create_game_options_sub_menu menu_title = 'PUNKTE ZURÜCKGESETZT' pref_type = network pref_field = 'score_reset' array = boolean_types call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_mp_game_options_time_menu 
    create_game_options_sub_menu menu_title = 'ZEITLIMIT' pref_type = splitscreen pref_field = 'time_limit' array = time_limit_options call_script = select_game_option helper_text = generic_helper_text <...> 
endscript

script create_mp_game_options_horse_time_menu 
    create_game_options_sub_menu menu_title = 'ZEITLIMIT' pref_type = splitscreen pref_field = 'horse_time_limit' array = horse_time_limit_options call_script = select_game_option helper_text = generic_helper_text prefs = splitscreen <...> 
endscript
horse_allowed_characters = [
    '1'
    '2'
    '3'
    '4'
    '5'
    '6'
    '7'
    '8'
    '9'
    '0'
    'a'
    'b'
    'c'
    'd'
    'e'
    'f'
    'g'
    'h'
    'i'
    'j'
    'k'
    'l'
    'm'
    'n'
    'o'
    'p'
    'q'
    'r'
    's'
    't'
    'u'
    'v'
    'w'
    'x'
    'y'
    'z'
    'A'
    'B'
    'C'
    'D'
    'E'
    'F'
    'G'
    'H'
    'I'
    'J'
    'K'
    'L'
    'M'
    'N'
    'O'
    'P'
    'Q'
    'R'
    'S'
    'T'
    'U'
    'V'
    'W'
    'X'
    'Y'
    'Z'
    '.'
    ','
    '!'
    '?'
    '-'
    '¦'
    '\''
    '+'
    '^'
    '#'
    '$'
    '*'
    '@'
    '`'
    '&'
    ':'
    '<'
    '>'
    '_'
    '-'
    '='
    '('
    ')'
    '/'
    'ß'
    'Ä'
    'Ü'
    'Ö'
    'à'
    'â'
    'ê'
    'è'
    'é'
    'ë'
    'ì'
    'î'
    'ï'
    'ô'
    'ò'
    'Ö'
    'ù'
    'û'
    'Ü'
    'ç'
    ''
    'ü'
    'ä'
    'ö'
    '¼'
    '½'
    '¾'
    '¢'
    'º'
    '®'
    '¡'
    '¿'
    '£'
    '¥'
    '§'
    '©'
]

script create_mp_game_options_horse_word_menu 
    GetPreferenceString \{ pref_type = splitscreen horse_word }
    create_onscreen_keyboard allowed_characters = horse_allowed_characters allow_cancel keyboard_cancel_script = horse_word_back_from_keyboard keyboard_done_script = set_horse_option_preference keyboard_title = 'LOSER-WORT' field = 'horse_word' text = <ui_string> min_length = 1 max_length = 15
endscript

script create_account_list_menu 
    make_new_menu \{ menu_id = account_list_menu vmenu_id = account_list_vmenu menu_title = 'KONTO WÄHLEN' }
    SetScreenElementLock \{ id = root_window Off }
    SetScreenElementProps \{id = account_list_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_account_list_menu }}]}
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_onscreen }
endscript

script create_network_game_options_menu 
    printf 'create_network_game_options_menu'
    dialog_box_exit
    pause_menu_gradient on
    hide_current_goal
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if InSplitScreenGame
        prefs = splitscreen
    else
        prefs = network
    endif
    hide_net_player_names on
    make_new_themed_sub_menu Title = 'SPIELOPTIONEN' right_bracket_alpha = 0.0
    if GotParam end_run
        SetScreenElementProps {id = sub_menu event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = create_end_run_menu }}
            ]
        }
    else
        SetScreenElementProps {id = sub_menu event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = create_pause_menu }}
            ]
        }
    endif
    GetPreferenceString pref_type = <prefs> game_type
    if InNetGame
        theme_menu_add_item text = 'Spieltyp:' extra_text = <ui_string> id = menu_network_host_options_game_type pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_game_type_menu }
    else
        if GotParam end_run
            theme_menu_add_item text = 'Spieltyp:' extra_text = <ui_string> id = menu_network_host_options_game_type pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_game_type_menu }
        else
            theme_menu_add_item text = 'Spieltyp:' extra_text = <ui_string> id = menu_network_host_options_game_type pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_game_type_menu }
        endif
    endif
    GetPreferenceChecksum pref_type = <prefs> game_type
    switch <checksum>
        case netgoalattack
        GetPreferenceString pref_type = <prefs> goals
        pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_ctf_mode_menu prefs = <prefs>}
        theme_menu_add_item text = 'Ziele wählen' centered = centered id = menu_network_host_options_choose_goals pad_choose_script = create_choose_goals_menu
        if GoalManager_GoalsAreSelected
            theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        else
            theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game not_focusable rgba = [ 80 80 80 128 ] last_menu_item = 1
        endif
        case freeskate2p
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case horse
        case nethorse
        GetPreferenceString pref_type = <prefs> horse_time_limit
        theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_horse_time_menu }
        GetPreferenceString pref_type = <prefs> horse_word
        theme_menu_add_item text = 'Loser-Wort:' extra_text = <ui_string> id = menu_network_host_options_horse_word pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_horse_word_menu }
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case scorechallenge
        case netscorechallenge
        GetPreferenceString pref_type = <prefs> score_mode
        if GotParam end_run
            theme_menu_add_item {
                text = 'Modus:'
                extra_text = <ui_string>
                id = menu_network_host_options_score_mode
                pad_choose_script = launch_network_host_options_sub_menu
                pad_choose_params = {
                    sub_menu_script = create_network_game_options_score_mode_menu
                    prefs = <prefs>
                    end_run
                }
            }
        else
            theme_menu_add_item {
                text = 'Modus:'
                extra_text = <ui_string>
                id = menu_network_host_options_score_mode
                pad_choose_script = launch_network_host_options_sub_menu
                pad_choose_params = {
                    sub_menu_script = create_network_game_options_score_mode_menu
                    prefs = <prefs>
                }
            }
        endif
        GetPreferenceChecksum pref_type = <prefs> score_mode
        switch <checksum>
            case point_scoring
            printf 'point_scoring'
            GetPreferenceString pref_type = <prefs> target_score
            if GotParam end_run
                theme_menu_add_item text = 'Zielpunkte:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_score_menu prefs = <prefs>}
            else
                theme_menu_add_item text = 'Zielpunkte:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_menu prefs = <prefs>}
            endif
            case tag_scoring
            printf 'tag_scoring'
            GetPreferenceString pref_type = <prefs> target_tags
            if GotParam end_run
                theme_menu_add_item text = 'Zielpunkte:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_tags_menu prefs = <prefs>}
            else
                theme_menu_add_item text = 'Zielpunkte:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_tags_menu prefs = <prefs>}
            endif
        endswitch
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case netctf
        GetPreferenceString pref_type = <prefs> ctf_game_type
        theme_menu_add_item text = 'Modus:' extra_text = <ui_string> id = menu_network_host_options_ctf_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_ctf_mode_menu prefs = <prefs>}
        GetPreferenceChecksum pref_type = <prefs> ctf_game_type
        switch <checksum>
            case timed_ctf
            GetPreferenceString pref_type = <prefs> time_limit
            theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
            case score_ctf
            GetPreferenceString pref_type = <prefs> target_score
            theme_menu_add_item text = 'Geklaute Flaggen:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_captures_menu prefs = <prefs>}
        endswitch
        GetPreferenceChecksum pref_type = <prefs> ctf_game_type
        switch <checksum>
            case timed_ctf
            GetPreferenceString pref_type = <prefs> stop_at_zero
            theme_menu_add_item text = 'Stopp bei null:' extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_stop_at_zero_menu }
        endswitch
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case king
        case netking
        GetPreferenceString pref_type = <prefs> target_score
        if GotParam end_run
            theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_target_time_menu prefs = <prefs>}
        else
            theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_target_time_menu prefs = <prefs>}
        endif
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case gold
        case netgold
        GetPreferenceString pref_type = <prefs> gold_game_type
        if GotParam end_run
            theme_menu_add_item {
                text = 'Modus:'
                extra_text = <ui_string>
                id = menu_network_host_options_gold_mode
                pad_choose_script = launch_network_host_options_sub_menu
                pad_choose_params = {
                    end_run
                    sub_menu_script = create_network_game_options_gold_mode_menu
                    prefs = <prefs>
                }
            }
        else
            theme_menu_add_item {
                text = 'Modus:'
                extra_text = <ui_string>
                id = menu_network_host_options_gold_mode
                pad_choose_script = launch_network_host_options_sub_menu
                pad_choose_params = {
                    sub_menu_script = create_network_game_options_gold_mode_menu
                    prefs = <prefs>
                }
            }
        endif
        GetPreferenceChecksum pref_type = <prefs> gold_game_type
        if (<checksum> = timed_gold)
            GetPreferenceString pref_type = <prefs> time_limit
            if GotParam end_run
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_network_game_options_time_menu }
            else
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
            endif
            GetPreferenceString pref_type = <prefs> stop_at_zero
            if GotParam end_run
                theme_menu_add_item text = 'Stopp bei null:' extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_stop_at_zero_menu }
            else
                theme_menu_add_item text = 'Stopp bei null:' extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_stop_at_zero_menu }
            endif
        endif
        GetPreferenceString pref_type = <prefs> score_mode
        if GotParam end_run
            theme_menu_add_item text = 'Punkte-Modus:' extra_text = <ui_string> id = menu_network_host_options_score_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_score_mode_menu prefs = <prefs>}
        else
            theme_menu_add_item text = 'Punkte-Modus:' extra_text = <ui_string> id = menu_network_host_options_score_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_mode_menu prefs = <prefs>}
        endif
        GetPreferenceChecksum pref_type = <prefs> score_mode
        switch <checksum>
            case point_scoring
            GetPreferenceString pref_type = <prefs> target_score
            if GotParam end_run
                theme_menu_add_item text = 'Zielpunkte:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_score_menu prefs = <prefs>}
            else
                theme_menu_add_item text = 'Zielpunkte:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_menu prefs = <prefs>}
            endif
            case tag_scoring
            GetPreferenceString pref_type = <prefs> target_tags
            if GotParam end_run
                theme_menu_add_item text = 'Ziel-Tags:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_tags_menu prefs = <prefs>}
            else
                theme_menu_add_item text = 'Ziel-Tags:' extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_tags_menu prefs = <prefs>}
            endif
        endswitch
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case elimiskate
        case netelimiskate
        GetPreferenceString pref_type = <prefs> time_limit
        theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
        GetPreferenceString pref_type = <prefs> score_mode
        theme_menu_add_item text = 'Modus:' extra_text = <ui_string> id = menu_network_host_options_score_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_mode_menu prefs = <prefs>}
        GetPreferenceString pref_type = <prefs> score_reset
        theme_menu_add_item text = 'Punkte zurückgesetzt:' extra_text = <ui_string> id = menu_network_host_options_score_reset pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_score_reset_menu }
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case netgraffiti
        if InTeamGame
            GetPreferenceString pref_type = <prefs> team_graffiti_mode
            theme_menu_add_item text = 'Punktemodus:' extra_text = <ui_string> id = menu_network_host_options_scoring_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_graffiti_scoring_menu }
        endif
        GetPreferenceString pref_type = <prefs> time_limit
        if InNetGame
            theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
        else
            if GotParam end_run
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_time_menu }
            else
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_time_menu }
            endif
        endif
        if InNetGame
            GetPreferenceString pref_type = <prefs> stop_at_zero
            theme_menu_add_item text = 'Stopp bei null:' extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_stop_at_zero_menu }
        endif
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case firefight
        case netfirefight
        if InNetGame
            if InTeamGame
                GetPreferenceString pref_type = <prefs> friendly_fire
                theme_menu_add_item text = 'Teambeschuss:' extra_text = <ui_string> id = menu_network_host_options_friendly_fire pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_friendly_fire_menu prefs = <prefs>}
            endif
            GetPreferenceString pref_type = <prefs> fireball_difficulty
            theme_menu_add_item text = 'Feuerball-Kombo-Level:' extra_text = <ui_string> id = menu_network_host_options_fireball_difficulty pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_fireball_difficulty_menu prefs = <prefs>}
        endif
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        case combomambo
        case netcombomambo
        GetPreferenceString pref_type = <prefs> score_mode
        if GotParam end_run
            theme_menu_add_item {
                text = 'Modus:'
                extra_text = <ui_string>
                id = menu_network_host_options_score_mode
                pad_choose_script = launch_network_host_options_sub_menu
                pad_choose_params = {
                    end_run
                    sub_menu_script = create_network_game_options_score_mode_menu
                    prefs = <prefs>
                }
            }
        else
            theme_menu_add_item {
                text = 'Modus:'
                extra_text = <ui_string>
                id = menu_network_host_options_score_mode
                pad_choose_script = launch_network_host_options_sub_menu
                pad_choose_params = {
                    sub_menu_script = create_network_game_options_score_mode_menu
                    prefs = <prefs>
                }
            }
        endif
        GetPreferenceString pref_type = <prefs> time_limit
        if InNetGame
            theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
        else
            if GotParam end_run
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_time_menu }
            else
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_time_menu }
            endif
        endif
        if InNetGame
            GetPreferenceString pref_type = <prefs> stop_at_zero
            theme_menu_add_item text = 'Stopp bei null:' extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_stop_at_zero_menu }
        endif
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
        default 
        GetPreferenceString pref_type = <prefs> time_limit
        if InNetGame
            theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
        else
            if GotParam end_run
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_time_menu }
            else
                theme_menu_add_item text = 'Zeitlimit:' extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_time_menu }
            endif
        endif
        if InNetGame
            GetPreferenceString pref_type = <prefs> stop_at_zero
            theme_menu_add_item text = 'Stopp bei null:' extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_stop_at_zero_menu }
        endif
        theme_menu_add_item text = 'Bereit' id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
    endswitch
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    finish_themed_sub_menu
endscript

script create_network_host_options_menu 
    printf 'create_network_host_options_menu'
    change in_server_options = 1
    hide_console_window
    dialog_box_exit
    if ((IsXbox)|| (IsXenon))
        title_text = 'HOST-OPTIONEN'
    else
        title_text = 'SERVEROPTIONEN'
    endif
    printf 'create_network_host_options_menu-init-1'
    if InFrontend
        main_menu_camera_control next_state = online
    else
        pause_menu_gradient on
    endif
    make_new_themed_sub_menu Title = <title_text> menu_id = host_options_menu vmenu_id = host_options_vmenu
    printf 'create_network_host_options_menu-init-2'
    if InFrontend
        CreateScreenElement {
            type = SpriteElement
            parent = menu_parts_anchor
            id = globe
            texture = globe
            Scale = 1.500
            Pos = (760.0, 240.0)
            just = [ center center ]
            alpha = 0.6000
            z_priority = -1
        }
    endif
    SetScreenElementProps {
        id = host_options_vmenu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_internet_host_options }}]
    }
    printf 'create_network_host_options_menu-init-3'
    if InNetGame
        if OnServer
            actual_server = 1
        else
            actual_server = 0
        endif
    else
        actual_server = 1
    endif
    printf 'create_network_host_options_menu-init-4'
    if ((IsPs2)|| (isPC))
        if (<actual_server> = 1)
            GetPreferenceString pref_type = network server_name
            theme_menu_add_item {
                parent = host_options_vmenu
                text = 'Name:'
                extra_text = <ui_string>
                id = menu_network_host_options_server_name
                pad_choose_script = create_network_host_options_server_name_menu
                first_item
            }
        endif
    endif
    printf 'create_network_host_options_menu-5'
    if NOT InNetGame
        printf 'if Not InNetGame'
        GetPreferenceString pref_type = network level
        theme_menu_add_item {
            parent = host_options_vmenu
            text = 'Level:'
            extra_text = <ui_string>
            id = menu_network_host_options_level
            pad_choose_script = launch_level_select_menu
            pad_choose_params = { from_server_options }
        }
    endif
    if ((IsPs2)|| (isPC))
        if InNetGame
            printf 'if InNetGame-2'
            if (<actual_server> = 1)
                printf 'if actual_server = 1'
                if GameModeEquals is_lobby
                    if NOT NetworkGamePending
                        if NOT ChangeLevelPending
                            GetPreferenceString pref_type = network level
                            GetPreferenceString pref_type = network goals
                        endif
                    endif
                endif
            endif
        else
            if (<actual_server> = 1)
                printf 'if actual_server == 1'
                GetPreferenceString pref_type = network level
                GetPreferenceString pref_type = network goals
            endif
        endif
    endif
    if OnServer
        printf 'OnServer'
        if NOT InNetGame
            printf 'Not InNetGame2'
            <max_index> = 6
            GetPreferenceString pref_type = network level
            if (<ui_string> = 'Erstellter Park')
                GetParkEditorMaxPlayers
                GetParkEditorMaxPlayers
                GetParkEditorMaxPlayers
                GetPreferenceChecksum pref_type = network num_players
                switch <checksum>
                    case num_2
                    <cur_max> = 2
                    case num_3
                    <cur_max> = 3
                    case num_4
                    <cur_max> = 4
                    case num_5
                    <cur_max> = 5
                    case num_6
                    <cur_max> = 6
                    case num_7
                    <cur_max> = 7
                    case num_8
                    <cur_max> = 8
                endswitch
                <max_index> = (<maxplayers> -2)
                if (<maxplayers> < 2)
                    scriptassert 'Die max. Anzahl an Spielern ist zu niedrig für ein Netzspiel mit erstelltem Park.'
                endif
                if ((((num_players_info)[ <max_index> ]).num)< <cur_max>)
                    SetPreferencesFromUI prefs = network field = 'num_players' string = (((num_players_info)[ <max_index> ]).name)checksum = (((num_players_info)[ <max_index> ]).checksum)
                endif
            endif
            if (<max_index> = 0)
                GetPreferenceString pref_type = network num_players
                theme_menu_add_item {
                    parent = host_options_vmenu
                    text = 'Spieler:'
                    extra_text = <ui_string>
                    not_focusable = not_focusable
                    id = menu_network_host_options_max_players
                }
            else
                GetPreferenceString pref_type = network num_players
                theme_menu_add_item {
                    parent = host_options_vmenu
                    text = 'Spieler:'
                    extra_text = <ui_string>
                    id = menu_network_host_options_max_players
                    pad_choose_script = create_network_host_options_max_players_menu
                    pad_choose_params = { max_index = <max_index> }
                }
            endif
        endif
        if InInternetMode
            printf ('Observer-1')
            GetPreferenceChecksum pref_type = network device_type
            printf ('Observer-2')
            switch <checksum>
                case device_sony_modem
                printf ('Observer-modem')
                case device_usb_modem
                printf ('Observer-usb')
                NullScript
                default 
                printf ('Observer-default')
                GetPreferenceString pref_type = network num_observers
                printf ('Observer-if not')
                if isPC
                    theme_menu_add_item {
                        parent = host_options_vmenu
                        text = 'Zuschauer:'
                        extra_text = <ui_string>
                        id = menu_network_host_options_max_observers
                        pad_choose_script = create_network_host_options_max_observers_menu
                    }
                else
                    if NOT NetSessionFunc obj = match func = isranked
                        theme_menu_add_item {
                            parent = host_options_vmenu
                            text = 'Zuschauer:'
                            extra_text = <ui_string>
                            id = menu_network_host_options_max_observers
                            pad_choose_script = create_network_host_options_max_observers_menu
                        }
                    endif
                endif
            endswitch
            printf ('Observer-Done')
        endif
        printf ('If OnServer-Done')
    endif
    if NOT InNetGame
        printf ('Team 0 - If Not InNetGame')
        GetPreferenceString pref_type = network team_mode
        theme_menu_add_item {
            parent = host_options_vmenu
            text = 'Teams:'
            extra_text = <ui_string>
            id = menu_network_host_options_player_team
            pad_choose_script = create_network_host_options_team_menu
        }
    else
        printf ('Team 0 - !If Not InNetGame')
        if GameModeEquals is_lobby
            printf ('if lobby')
            if ishost
                printf ('if host')
                if OnServer
                    printf ('if OnServer')
                    GetPreferenceString pref_type = network team_mode
                    theme_menu_add_item {
                        parent = host_options_vmenu
                        text = 'Teams:'
                        extra_text = <ui_string>
                        id = menu_network_host_options_player_team
                        pad_choose_script = create_network_host_options_team_menu
                    }
                else
                    printf ('if !OnServer')
                    GetPreferenceString pref_type = network team_mode
                    theme_menu_add_item {
                        parent = host_options_vmenu
                        text = 'Teams:'
                        extra_text = <ui_string>
                        id = menu_network_host_options_player_team
                        pad_choose_script = create_network_host_options_team_menu
                        first_item
                    }
                endif
                printf ('if host-end')
            endif
            printf ('if lobby-end')
        endif
    endif
    if ishost
        printf ('if IsHost')
        if GameModeEquals is_lobby
            printf ('if lobby')
            if NOT (<actual_server> = 1)
                <last_menu_item> = last_menu_item
            endif
            GetPreferenceString pref_type = network player_collision
            theme_menu_add_item {
                parent = host_options_vmenu
                text = 'Kollision:'
                extra_text = <ui_string>
                last_menu_item = <last_menu_item>
                id = menu_network_host_options_player_collision
                pad_choose_script = create_network_host_options_player_collision_menu
            }
            printf ('if lobby-end')
        endif
        printf ('if IsHost-end')
    endif
    if (<actual_server> = 1)
        GetPreferenceString pref_type = network skill_level
        printf ('actual_server === 1')
        if InNetGame
            printf ('if InNetGame 3')
            if NOT GameModeEquals is_lobby
                last_menu_item = last_menu_item
            endif
        endif
        printf ('theme menu add')
        theme_menu_add_item {
            parent = host_options_vmenu
            text = 'Stufe:'
            extra_text = <ui_string>
            id = menu_network_host_options_skill_level
            pad_choose_script = create_network_host_options_skill_level_menu
            last_menu_item = <last_menu_item>
        }
        if IsPs2
            GetPreferenceChecksum pref_type = network rank_test
            GetPreferenceString pref_type = network rank_test
            theme_menu_add_item {
                parent = host_options_vmenu
                text = 'Ranglimit:'
                extra_text = <ui_string>
                id = menu_network_host_options_rank_test
                pad_choose_script = create_network_host_options_rank_test_menu
            }
            if NOT (<checksum> = rank_test_none)
                GetPreferenceString pref_type = network rank_limit
                theme_menu_add_item {
                    parent = host_options_vmenu
                    text = 'Ranglimit:'
                    extra_text = <ui_string>
                    id = menu_network_host_options_rank_limit
                    pad_choose_script = create_network_host_options_rank_limit_menu
                }
            endif
        endif
        if GameModeEquals is_lobby
            printf ('if in lobby 4')
            if ((IsPs2)|| (isPC))
                GetPreferencePassword pref_type = network password
                theme_menu_add_item {
                    parent = host_options_vmenu
                    text = 'Passwort:'
                    extra_text = <password_string>
                    id = menu_network_host_options_password
                    pad_choose_script = create_network_host_options_password_menu
                }
            endif
            if InNetGame
                last_menu_item = last_menu_item
            endif
            if NOT ishost
                <not_focusables> = not_focusable
            endif
            printf ('printstruct')
            printstruct <not_focusables>
            printf ('theme_menu_add_item')
            theme_menu_add_item {
                parent = host_options_vmenu
                text = 'Erweiterte'
                extra_text = 'Optionen'
                id = menu_real_cheats
                pad_choose_script = create_real_cheats_menu
                pad_choose_params = { back_script = create_network_host_options_menu }
                last_menu_item = <last_menu_item>
                not_focusable = <not_focusables>
            }
        else
            if NOT IsXenon
                if NOT InNetGame
                    printf 'Not IsXenon'
                    GetPreferencePassword pref_type = network password
                    if InNetGame
                        printf 'InNetGame 66'
                        last_menu_item = last_menu_item
                    endif
                    printf 'theme_menu_add_item 66'
                    theme_menu_add_item {
                        parent = host_options_vmenu
                        text = 'Passwort:'
                        extra_text = <password_string>
                        id = menu_network_host_options_password
                        pad_choose_script = create_network_host_options_password_menu
                        last_menu_item = <last_menu_item>
                    }
                endif
                printf 'theme_menu_add_item 66 done'
            endif
        endif
    endif
    if NOT InNetGame
        printf ('Not InNetGame 77')
        focusable = {}
        GetPreferenceChecksum pref_type = network level
        if (<checksum> = load_sk5ed_gameplay)
            printf ('if (<checksum>=load_sk5ed_gameplay)')
            GetParkEditorMaxPlayers
            GetNetworkNumPlayers
            if (<num_players> > <maxplayers>)
                focusable = { not_focusable }
            endif
            printf ('if (<checksum>=load_sk5ed_gameplay)-Done')
        endif
        printf ('theme_menu_add_item')
        theme_menu_add_item {
            parent = host_options_vmenu
            text = 'Bereit'
            id = menu_network_host_options_ready
            pad_choose_script = chosen_host_game
            last_menu_item = last_menu_item
            <focusable>
        }
        printf ('Not InNetGame 77-Done')
    endif
    if InFrontend
        printf ('if InFrontend')
        RunScriptOnScreenElement id = globe rotate_internet_options_globe
    endif
    printf ('finish_themed_sub_menu')
    finish_themed_sub_menu menu = host_options_menu
    if NOT InNetGame
        printf ('if not InNetGame 88')
        RunScriptOnScreenElement id = current_menu_anchor set_ready_focus
    endif
    printf 'create_network_host_options_menu-DONE'
endscript

script set_ready_focus 
    FireEvent \{ type = unfocus target = host_options_vmenu }
    FireEvent \{type = focus target = host_options_vmenu Data = { child_id = menu_network_host_options_ready }}
endscript

script chosen_start_game 
    if InNetGame
        GetPreferenceChecksum pref_type = network game_type
        if (<checksum> = netctf)
            if NOT InTeamGame
                SetPreferencesFromUI prefs = network field = 'team_mode' checksum = teams_two string = '2'
                SetNumTeams 2
            endif
        endif
    else
    endif
    loadpendingplayers
    if StartNetworkGame
        if InSplitScreenGame
            skater ::runstarted
            skater2 ::runstarted
        endif
        if ObjectExists id = current_menu_anchor
            exit_pause_menu
        endif
    endif
endscript

script stats_start_new_game 
    if NetSessionFunc \{ obj = match func = logged_in }
        NetSessionFunc \{ obj = stats func = start_new_game }
    endif
endscript

script network_options_selected 
    printf \{ 'network_options_selected' }
    PauseMusicAndStreams
    hide_current_goal
    launch_network_host_options_menu
    printf \{ 'network_options_selected-Done' }
endscript

script network_game_options_selected 
    create_network_game_options_menu <...> 
endscript

script network_start_selected 
    if OnServer
        chosen_start_game
    else
        FCFSRequestStartGame
        exit_pause_menu
    endif
endscript

script fcfc_end_game_selected 
    report_stats \{ final }
    do_backend_retry
endscript

script report_stats 
    if OnServer
        if InInternetMode
            if NetSessionFunc \{ obj = match func = logged_in }
                if GotParam \{ final }
                    NetSessionFunc \{obj = stats func = report_stats params = { final }}
                else
                    NetSessionFunc \{ obj = stats func = report_stats }
                endif
            endif
        endif
    endif
endscript

script network_end_game_selected 
    if GameIsOver
        create_pause_menu
        return 
    endif
    kill_all_panel_messages
    if InSplitScreenGame
        SetStatOverride
        GoalManager_DeactivateAllGoals
        change_gamemode_freeskate_2p
        pause_trick_text
        create_end_run_menu
    else
        report_stats \{ final }
        EndNetworkGame
    endif
endscript

script generic_array_menu_setup time = 60
    add_item_script = theme_menu_add_centered_item
    if NOT (<pref_field> = 'game_type')
        if NOT (<pref_field> = 'device_type')
        endif
    endif
    GetArraySize <array>
    <array_size> = (<array_size> -1)
    begin 
    GetNextArrayElement <array>
    if GotParam element
        AddParams <element>
        if (<pref_field> = 'game_type')
            focus_script = game_options_focus_script
            focus_params = { description = <description> }
            add_item_script = make_text_sub_menu_item
        endif
        if GotParam not_in_custom_parks
            if CustomParkMode just_using
                show_option = 0
            else
                show_option = 1
            endif
        else
            show_option = 1
        endif
        if GotParam not_pal
            if IsPAL
                show_option = 0
            endif
        endif
        if LevelIs load_se
            if (<name> = 'Klassik-Ziele')
                AddParams { not_available }
            endif
        endif
        if NOT (<array_size> = 0)
            if (<show_option> = 1)
                if GotParam not_available
                    theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable highlight_bar_scale = <highlight_bar_scale> Scale = <Scale>
                else
                    if GotParam team_only
                        if InTeamGame
                            theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...> }focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> Scale = <Scale>
                        else
                            theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable highlight_bar_scale = <highlight_bar_scale> Scale = <Scale>
                        endif
                    else
                        theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...> }focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> Scale = <Scale>
                    endif
                endif
            endif
        else
            if (<show_option> = 1)
                if GotParam not_available
                    theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable highlight_bar_scale = <highlight_bar_scale> Scale = <Scale> last_menu_item = 1
                else
                    if GotParam team_only
                        if InTeamGame
                            theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...> }focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> Scale = <Scale> last_menu_item = 1
                        else
                            theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable highlight_bar_scale = <highlight_bar_scale> Scale = <Scale> last_menu_item = 1
                        endif
                    else
                        theme_menu_add_item text = <name> id = <checksum> font = small centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...> }focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> Scale = <Scale> last_menu_item = 1
                    endif
                endif
            endif
        endif
        <array_size> = (<array_size> -1)
        RemoveParameter not_available
        RemoveParameter not_in_custom_parks
        RemoveParameter not_pal
    else
        break 
    endif
    repeat 
endscript

script generic_array_menu_desc_setup time = 60
    add_item_script = theme_menu_add_centered_item
    if NOT (<pref_field> = 'game_type')
        if NOT (<pref_field> = 'device_type')
        endif
    endif
    GetArraySize <array>
    <array_size> = (<array_size> -1)
    theme_background parent = current_menu_anchor id = bg_box_vmenu width = 3.500 Pos = (320.0, 625.0) num_parts = 10.50 z_priority = 1
    begin 
    GetNextArrayElement <array>
    if GotParam element
        AddParams <element>
        if (<pref_field> = 'game_type')
            focus_script = game_options_focus_script
            focus_params = { description = <description> }
            add_item_script = make_text_sub_menu_item
        endif
        if GotParam not_in_custom_parks
            if CustomParkMode just_using
                show_option = 0
            else
                show_option = 1
            endif
        else
            show_option = 1
        endif
        if GotParam not_pal
            if IsPAL
                show_option = 0
            endif
        endif
        FormatText checksumname = icon_2p <icon>
        if NOT (<array_size> = 0)
            if (<show_option> = 1)
                if GotParam not_available
                    theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                else
                    if GotParam team_only
                        if InTeamGame
                            theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = small pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>}unfocus_script = sprite_unfocus highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                        else
                            theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                        endif
                    else
                        theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = small pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>}unfocus_script = sprite_unfocus highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                    endif
                endif
            endif
        else
            if (<show_option> = 1)
                if GotParam not_available
                    theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable static_width = 400 highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                else
                    if GotParam team_only
                        if InTeamGame
                            theme_menu_add_item text = <name> id = <checksum> centered text_pos = (115.0, -5.0) no_bg font = small pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>}unfocus_script = sprite_unfocus static_width = 400 highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                        else
                            theme_menu_add_item text = <name> id = <checksum> centered text_pos = (115.0, -5.0) no_bg font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}not_focusable static_width = 400 highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                        endif
                    else
                        theme_menu_add_item text = <name> id = <checksum> centered text_pos = (115.0, -5.0) no_bg font = small pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>}unfocus_script = sprite_unfocus static_width = 400 highlight_bar_scale = (2.700000047683716, 0.800000011920929) Scale = <Scale>
                    endif
                endif
            endif
        endif
        <array_size> = (<array_size> -1)
        RemoveParameter not_available
        RemoveParameter not_in_custom_parks
        RemoveParameter not_pal
    else
        break 
    endif
    repeat 
    <bg_box_scale> = (86.0, 15.0)
    <desc_text_scale> = 1
    <desc_text_dims> = (300.0, 75.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = item_bg_box
        padding_scale = 0.5000
        texture = black
        z_priority = 0
        Scale = <bg_box_scale>
        Pos = (320.0, 880.0)
        just = [ center top ]
        rgba = [ 0 0 0 200 ]
    }
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = item_description_bar
        texture = white2
        Scale = (43.0, 0.2199999988079071)
        Pos = (322.0, 894.0)
        just = [ center top ]
        rgba = <on_rgba>
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = current_menu_anchor
        id = item_description_text
        text = ''
        font = small
        dims = <desc_text_dims>
        Scale = <desc_text_scale>
        line_spacing = 1
        Pos = (320.0, 838.0)
        just = [ center top ]
        rgba = <off_rgba>
    }
    wait 1 gameframe
endscript

script game_options_focus_script 
    SetScreenElementProps id = item_description_text text = <description> line_spacing = 0.8000
    main_theme_focus
    gettags
    Theme_GetIconOnColor \{ return_value = icon_color }
    if (no_focus_sound = 1)
        change \{ no_focus_sound = 0 }
    else
    endif
    wait \{ 3 gameframes }
    if ObjectExists \{ id = cur_2p_sprite }
        DestroyScreenElement \{ id = cur_2p_sprite }
    endif
endscript

script end_network_game 
    printf \{ '************ scripting:net.q::end_network_game' }
    kill_all_panel_messages
    dialog_box_exit
    do_backend_retry
endscript

script CreateServerQuitDialog 
    hideloadingscreen
    if NOT InFrontend
        printf '**** Level was not the skateshop ****'
        GoalManager_DeactivateAllGoals force_all
        GoalManager_UninitializeAllGoals
        GoalManager_SetCanStartGoal 0
        kill_net_panel_messages
        destroy_onscreen_keyboard
        force_close_rankings dont_retry
        exit_pause_menu
        hideloadingscreen
        if NOT IsObserving
            if ObjectExists id = skater
                skater ::vibrate Off
            endif
            ExitSurveyorMode
        endif
        dialog_box_exit anchor_id = quit_dialog_anchor
        change check_for_unplugged_controllers = 0
        pausegame
        create_error_box {Title = 'Notiz'
            text = 'Der Host hat das Spiel verlassen. Wähle OK zum Verlassen.'
            buttons = [{text = 'OK' pad_choose_script = quit_network_game}
            ]
            delay_input
            delay_input_time = 3000
        }
    else
        printf '*** Level IS the skateshop ***'
    endif
endscript

script create_game_ended_dialog 
    if NOT InFrontend
        GoalManager_DeactivateAllGoals force_all
        GoalManager_UninitializeAllGoals
        GoalManager_SetCanStartGoal 0
        kill_net_panel_messages
        destroy_onscreen_keyboard
        force_close_rankings
        exit_pause_menu
        dialog_box_exit anchor_id = quit_dialog_anchor
        if NOT IsObserving
            create_error_box {Title = 'Notiz'
                text = 'Der Host hat das aktuelle Spiel beendet. Wähle OK, um zu Skate for Fun zurückzukehren.'
                buttons = [{text = 'OK' pad_choose_script = end_network_game}
                ]
                delay_input
            }
        else
            end_network_game
        endif
    endif
endscript

script accept_lost_connection 
    dialog_box_exit
    if EnteringNetGame
        cancel_join_server
    else
        quit_network_game
    endif
endscript

script createlostconnectiondialog 
    hideloadingscreen
    GoalManager_DeactivateAllGoals force_all
    GoalManager_UninitializeAllGoals
    GoalManager_SetCanStartGoal 0
    exit_pause_menu
    destroy_onscreen_keyboard
    force_close_rankings dont_retry
    if InNetGame
        if LocalSkaterExists
            skater ::vibrate Off
        endif
    endif
    if NOT IsObserving
        ExitSurveyorMode
    endif
    dialog_box_exit
    dialog_box_exit anchor_id = link_lost_dialog_anchor
    dialog_box_exit anchor_id = quit_dialog_anchor
    change check_for_unplugged_controllers = 0
    kill_start_key_binding
    create_error_box {Title = 'Notiz'
        text = 'Verbindung zum Netzwerk verloren. Bestätige, um dieses Spiel zu verlassen.'
        buttons = [{text = 'OK' pad_choose_script = accept_lost_connection}
        ]
        delay_input
    }
endscript

script BackToServerListFromJoinRefusedDialog 
    dialog_box_exit
    back_to_game_selection_menu
endscript

script createjoinrefuseddialog 
    if InNetGame
        create_dialog_box {Title = net_refused_msg
            text = <reason>
            buttons = [{text = 'OK' pad_choose_script = dialog_box_exit}
            ]
        }
    else
        if GotParam \{ just_dialog }
            create_dialog_box {Title = net_refused_msg
                text = <reason>
                buttons = [{text = 'OK' pad_choose_script = BackToServerListFromJoinRefusedDialog}
                ]
            }
        else
            cancel_join_server show_refused_dialog <...> 
        endif
    endif
endscript

script create_refused_dialog 
    if InNetGame
        create_dialog_box {Title = net_refused_msg
            text = <reason>
            buttons = [{text = 'OK' pad_choose_script = dialog_box_exit}
            ]
        }
    else
        create_dialog_box {Title = net_refused_msg
            text = <reason>
            buttons = [{text = 'OK' pad_choose_script = BackToServerListFromJoinRefusedDialog}
            ]
        }
    endif
endscript

script reattempt_join_server 
    ReattemptJoinServer
endscript

script cancel_join_server 
    printf 'cancel_join_server'
    printstruct <...> 
    if GotParam cancel_nn
        NetSessionFunc obj = match func = cancel_nat_negotiation
    endif
    destroy_onscreen_keyboard
    dialog_box_exit
    if InInternetMode
        NetSessionFunc obj = match func = cancel_join_server
        restart_local_server
        SetNetworkMode INTERNET_MODE
    else
        CancelJoinServer
        restart_local_server
        SetNetworkMode LAN_MODE
    endif
    if GotParam show_timeout
        printf 'GotParam show_timeout'
        create_join_timeout_dialog
    else
        if GotParam show_refused_dialog
            create_refused_dialog <...> 
        else
            back_to_game_selection_menu
        endif
    endif
    kill_start_key_binding
    begin 
    if LocalSkaterExists
        MakeSkaterGoto SkateshopAI params = { NoSFX }
        break 
    else
        wait 1
    endif
    repeat 
endscript

script createenterpasswordcontrol 
    dialog_box_exit
    create_onscreen_keyboard \{password allow_cancel keyboard_cancel_script = cancel_join_server keyboard_done_script = try_password keyboard_title = 'PASSWORT EINGEBEN' text = '' min_length = 1 max_length = 9}
endscript

script try_password 
    GetTextElementString \{ id = keyboard_current_string }
    destroy_onscreen_keyboard
    JoinWithPassword <...> 
endscript

script creategameinprogressdialog 
    dialog_box_exit
    kill_start_key_binding
    create_dialog_box \{Title = net_status_msg text = net_message_game_in_progress buttons = [{ text = 'OK' pad_choose_script = reattempt_join_server }{ text = 'Zurück' pad_choose_script = cancel_join_server }]}
endscript

script createconnectingdialog 
    kill_start_key_binding
    PauseMusicAndStreams
    create_dialog_box \{Title = net_status_msg text = net_status_connecting no_animate buttons = [{ text = 'Zurück' pad_choose_script = cancel_join_server }]}
endscript

script createjoiningdialog 
    dialog_box_exit
    kill_start_key_binding
    create_dialog_box \{Title = net_status_msg text = net_status_joining no_animate buttons = [{ text = 'Zurück' pad_choose_script = cancel_join_server }]}
endscript

script createtryingpassworddialog 
    kill_start_key_binding
    PauseMusicAndStreams
    create_dialog_box \{Title = net_status_msg text = net_status_trying_password no_animate buttons = [{ text = 'Zurück' pad_choose_script = cancel_join_server }]}
endscript

script wait_for_players 
    dialog_box_exit
    create_net_panel_message \{ text = net_message_game_will_start }
endscript

script dont_wait_for_players 
    dialog_box_exit
    DropPendingPlayers
endscript

script createwaitforplayersdialog 
    if ObjectExists \{ id = Pause_Menu }
        exit_pause_menu
    endif
    destroy_onscreen_keyboard
    create_error_box \{Title = net_status_msg text = net_message_waiting_for_players no_animate buttons = [{ text = 'Ja' pad_choose_script = wait_for_players }{ text = ' Nein ' pad_choose_script = dont_wait_for_players }] no_animate delay_input}
endscript

script back_from_join_timeout 
    dialog_box_exit
    back_to_game_selection_menu
endscript

script showjointimeoutnotice 
    cancel_join_server \{ show_timeout }
endscript

script create_join_timeout_dialog 
    dialog_box_exit
    create_dialog_box \{Title = net_status_msg text = net_status_join_timeout buttons = [{ text = 'OK' pad_choose_script = back_from_join_timeout }]}
endscript

script create_join_failed_dialog 
    create_dialog_box \{Title = net_status_msg text = net_status_join_failed buttons = [{ text = 'OK' pad_choose_script = cancel_join_server }]}
endscript

script exit_net_menus 
    dialog_box_exit
    SetGameType \{ career }
    SetCurrentGameType
    create_main_menu
endscript

script create_link_unplugged_front_end_dialog 
    printf \{ 'script create_link_unplugged_front_end_dialog' }
    if ((IsXbox)|| (IsXenon))
        lost_connection_to_live \{ menu_text = net_error_unplugged_front_end }
    else
        lost_connection_to_gamespy \{ via_cable_unplugged }
    endif
endscript

script link_unplugged_ok 
    dialog_box_exit anchor_id = quit_dialog_anchor no_pad_start
    dialog_box_exit anchor_id = link_lost_dialog_anchor no_pad_start
    <found_menu> = 0
    if ScreenElementExists id = current_menu_anchor
        <found_menu> = 1
        DoScreenElementMorph {
            id = current_menu_anchor
            Scale = 1
        }
        FireEvent type = focus target = current_menu_anchor
    endif
    if ScreenElementExists id = homie_menu_anchor
        FireEvent type = focus target = homie_vmenu
        <found_menu> = 1
    else
        if ScreenElementExists id = current_menu
            <found_menu> = 1
            FireEvent type = focus target = current_menu
        endif
        if ScreenElementExists id = sub_menu
            <found_menu> = 1
            FireEvent type = focus target = sub_menu
        endif
    endif
    if NOT InFrontend
        if (<found_menu> = 0)
            if SkaterCamAnimFinished
                create_pause_menu
            else
            endif
        endif
    endif
endscript

script link_unplugged_quit 
    dialog_box_exit \{ anchor_id = link_lost_dialog_anchor no_pad_start }
    launch_quit_game_dialog
endscript

script create_link_unplugged_dialog 
    printf 'script create_link_unplugged_dialog'
    if IsXbox
        disconnect_from_live
    endif
    if ((IsXbox)|| (IsXenon))
        if NOT InNetGame
            return 
        endif
    endif
    if ScreenElementExists id = dialog_box_anchor
        return 
    endif
    if ScreenElementExists id = quit_dialog_anchor
        return 
    endif
    if ScreenElementExists id = controller_unplugged_dialog_anchor
        return 
    endif
    if ScreenElementExists id = current_menu_anchor
        DoScreenElementMorph {
            id = current_menu_anchor
            Scale = 0
        }
        FireEvent type = unfocus target = current_menu_anchor
    endif
    if ScreenElementExists id = current_menu
        FireEvent type = unfocus target = current_menu
    endif
    destroy_onscreen_keyboard
    printf 'create_link_unplugged_dialog: cleaned up'
    if ((IsXbox)|| (IsXenon))
        create_error_box {
            Title = net_status_msg
            anchor_id = link_lost_dialog_anchor
            text = net_error_unplugged_front_end
            buttons = [
                {text = 'OK' pad_choose_script = live_connection_loss_back}
            ]
            no_animate
        }
    endif
    if IsXbox
        create_error_box {
            Title = net_status_msg
            anchor_id = link_lost_dialog_anchor
            text = net_error_unplugged
            buttons = [
                {text = 'OK' pad_choose_script = link_unplugged_ok}
                {text = 'Verlassen' pad_choose_script = live_connection_loss_back}
            ]
            no_animate
        }
    endif
    if ((IsPs2)|| (isPC))
        create_error_box {
            Title = net_error_msg
            anchor_id = link_lost_dialog_anchor
            text = net_error_device_not_hot
            buttons = [
                {text = 'OK' pad_choose_script = link_unplugged_ok}
                {text = 'Verlassen' pad_choose_script = link_unplugged_quit}
            ]
            no_animate
        }
    endif
    kill_start_key_binding
endscript

script exit_async_dialog 
    dialog_box_exit
    if GameIsOver
        do_backend_retry
    endif
endscript

script createnotposteddialog 
    kill_all_panel_messages
    create_error_box \{Title = net_error_msg text = net_status_not_posted buttons = [{ text = 'OK' pad_choose_script = exit_async_dialog }] no_animate delay_input z_priority = 50}
endscript

script accept_gamespy_lost_connection_dialog 
    dialog_box_exit
    ResetConnectionTimer
endscript

script ResetConnectionTimer 
    if IsPs2
        NetSessionFunc \{ obj = match func = reset_gs_connection_timer }
    endif
endscript

script creategamespylostconnectiondialog 
    if ScreenElementExists \{ id = dialog_box_anchor }
        return 
    endif
    if ScreenElementExists \{ id = current_menu_anchor }
        return 
    endif
    if ScreenElementExists \{ id = current_menu }
        return 
    endif
    if ScreenElementExists \{ id = link_lost_dialog_anchor }
        return 
    endif
    destroy_onscreen_keyboard
    create_error_box \{Title = net_error_msg text = net_error_lost_gamespy_connection buttons = [{ text = 'OK' pad_choose_script = accept_gamespy_lost_connection_dialog }] no_animate}
endscript

script CreateGettingLobbyListDialog 
    dialog_box_exit
    create_dialog_box \{Title = net_status_msg text = net_status_getting_lobbies no_animate no_bg Pos = (237.0, 250.0)}
endscript

script CreateFailedLobbyListDialog 
    printf \{ 'script CreateFailedLobbyListDialog' }
    NetSessionFunc \{ obj = match func = logoff }
    dialog_box_exit
    create_dialog_box {Title = net_status_msg
        text = <message>
        buttons = [
            {text = 'OK' pad_choose_script = cancel_gamespy_connection_failure_dialog}
        ]
        no_animate
        no_bg
    }
endscript

script CreateJoinLobbyFailedDialog 
    printf \{ 'script CreateJoinLobbyFailedDialog' }
    NetSessionFunc \{ obj = match func = logoff }
    dialog_box_exit
    create_dialog_box \{Title = net_status_msg text = 'Lobby konnte nicht betreten werden.' buttons = [{ text = 'OK' pad_choose_script = create_internet_options }]}
endscript

script create_joining_lobby_dialog 
    create_dialog_box \{Title = net_status_msg text = 'Lobby wird betreten ...' buttons = [{ text = 'Zurück' pad_choose_script = cancel_join_lobby }] no_animate}
endscript

script cancel_join_lobby 
    back_from_internet_menu
endscript

script create_net_panel_message \{ msg_time = 2000 }
    root_window ::getsingletag \{ menu_state }
    if (<menu_state> = Off)
        create_panel_block id = net_panel_msg <...> parent = root_window Pos = (320.0, 150.0) rgba = [ 144 144 144 128 ] dims = (450.0, 0.0) z_priority = 200 time = <msg_time> font_face = testtitle
    endif
endscript

script kill_net_panel_messages 
    console_clear
    if ObjectExists id = net_panel_msg
        DestroyScreenElement id = net_panel_msg
    endif
    if IsXbox
        xboxlive_menu_friends_close
    endif
    if ObjectExists id = taunt_msg_id
        DestroyScreenElement id = taunt_msg_id
    endif
    if ScreenElementExists id = perfect
        DestroyScreenElement id = perfect
    endif
    if ScreenElementExists id = perfect2
        DestroyScreenElement id = perfect2
    endif
    if ScreenElementExists id = death_message
        DestroyScreenElement id = death_message
    endif
    if ObjectExists id = speech_box_anchor
        DoScreenElementMorph id = speech_box_anchor Scale = 0
    endif
    if ScreenElementExists id = goal_start_dialog
        DestroyScreenElement id = goal_start_dialog
    endif
    if ObjectExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    if ObjectExists id = goal_retry_anchor
        DestroyScreenElement id = goal_retry_anchor
    endif
    if ObjectExists id = first_time_goal_info
        DestroyScreenElement id = first_time_goal_info
    endif
    if ObjectExists id = skater_hint
        DestroyScreenElement id = skater_hint
    endif
    GetArraySize goal_panel_message_ids
    <index> = 0
    begin 
    if ScreenElementExists id = (goal_panel_message_ids [ <index> ])
        DestroyScreenElement id = (goal_panel_message_ids [ <index> ])
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script cancel_connect_to_internet 
    dialog_box_exit
    CancelConnectToInternet
endscript

script create_modem_state_dialog 
    create_dialog_box {Title = net_status_msg
        text = <text>
        no_animate
        buttons = [
            {text = 'Zurück' pad_choose_script = cancel_connect_to_internet}
        ]
    }
endscript

script create_modem_status_dialog 
    create_dialog_box {Title = net_status_msg
        text = <text>
        no_animate
    }
endscript

script create_modem_final_state_dialog 
    create_dialog_box {Title = net_status_msg
        text = <text>
        buttons = [
            {text = 'OK' pad_choose_script = cancel_connect_to_internet}
        ]
    }
endscript

script cancel_gamespy_connection_failure_dialog 
    dialog_box_exit
    cleanup_sessionfuncs
    console_destroy
    if NOT InFrontend
        quit_network_game
    else
        create_ss_menu \{ no_animate }
        SetNetworkMode
    endif
endscript

script create_gamespy_connection_failure_dialog 
    printf \{ 'create_gamespy_connection_failure_dialog' }
    NetSessionFunc \{ obj = match func = logoff }
    dialog_box_exit
    dialog_box_exit \{ anchor_id = link_lost_dialog_anchor }
    dialog_box_exit \{ anchor_id = controller_unplugged_dialog_anchor }
    dialog_box_exit \{ anchor_id = quit_dialog_anchor }
    create_dialog_box \{Title = net_error_msg text = net_status_gamespy_no_connect buttons = [{ text = 'OK' pad_choose_script = cancel_gamespy_connection_failure_dialog }]}
endscript

script disconnect_from_live 
    KillSpawnedScript \{ name = async_xbox_login }
    if IsTrue \{ signedin }
        cleanup_sessionfuncs
        change \{ signedin = 0 }
        xboxlive_lost_connection_ui_cleanup
    endif
    xboxlive_logon_status_update \{ text = 'Nicht angemeldet' }
endscript

script live_connection_loss_back 
    dialog_box_exit
    dialog_box_exit \{ anchor_id = link_lost_dialog_anchor }
    if NetSessionFunc \{ obj = match func = still_in_netgame }
        quit_network_game \{ dont_reset_net_game_type }
    else
        xboxlive_lost_connection_ui_cleanup
        back_from_internet_options \{ sign_out }
    endif
endscript

script lost_connection_to_live menu_text = net_status_live_lost_connection
    show_dialog = 0
    if GameModeEquals is_net
        <show_dialog> = 1
    endif
    if InNetGame
        <show_dialog> = 1
    endif
    disconnect_from_live
    if (<show_dialog> = 0)
        create_panel_block id = test_msg text = <menu_text> time = 7000 parent = root_window Pos = (320.0, 320.0) rgba = [ 144 144 144 128 ] dims = (450.0, 0.0) z_priority = 200 time = <msg_time> font_face = testtitle
        return 
    endif
    if ScreenElementExists id = quit_dialog_anchor
        return 
    endif
    if ScreenElementExists id = link_lost_dialog_anchor
        return 
    endif
    if ScreenElementExists id = controller_unplugged_dialog_anchor
        return 
    endif
    if ScreenElementExists id = dialog_box_anchor
        dialog_box_exit
    endif
    if ScreenElementExists id = current_menu_anchor
        DoScreenElementMorph {
            id = current_menu_anchor
            Scale = 0
        }
        FireEvent type = unfocus target = current_menu_anchor
    endif
    if ScreenElementExists id = current_menu
        FireEvent type = unfocus target = current_menu
    endif
    destroy_onscreen_keyboard
    create_error_box {Title = net_status_msg
        text = <menu_text>
        anchor_id = link_lost_dialog_anchor
        buttons = [
            {text = 'OK' pad_choose_script = live_connection_loss_back}
        ]
    }
    kill_start_key_binding
endscript

script lost_connection_to_gamespy 
    printscriptinfo 'lost_connection_to_gamespy'
    printf 'script lost_connection_to_gamespy'
    NetSessionFunc func = stats_uninit
    NetSessionFunc func = presence_uninit
    NetSessionFunc obj = match func = logoff
    NetSessionFunc func = match_uninit
    if InFrontend
        if ObjectExists id = console_message_vmenu
            DoScreenElementMorph id = console_message_vmenu alpha = 0
        endif
        back_from_regions_menu
        net_vault_menu_exit
        if ScreenElementExists id = stats_bg_anchor
            KillSpawnedScript name = create_online_stat_scores_menu
            KillSpawnedScript name = create_online_stat_players_menu
            KillSpawnedScript name = create_online_stat_personal_menu
            DestroyScreenElement id = stats_bg_anchor
        endif
        if ObjectExists id = keyboard_anchor
            destroy_onscreen_keyboard
        endif
        dialog_box_exit
        dialog_box_exit anchor_id = link_lost_dialog_anchor
        dialog_box_exit anchor_id = controller_unplugged_dialog_anchor
        dialog_box_exit anchor_id = quit_dialog_anchor
        exit_pause_menu
        GoalManager_HidePoints
        GoalManager_HideGoalPoints
        if GotParam via_cable_unplugged
            create_dialog_box {Title = net_error_msg
                text = net_error_unplugged
                buttons = [
                    {text = 'OK' pad_choose_script = cancel_gamespy_connection_failure_dialog}
                ]
            }
        else
            create_dialog_box {Title = net_error_msg
                text = net_status_gamespy_lost_connection
                buttons = [
                    {text = 'OK' pad_choose_script = cancel_gamespy_connection_failure_dialog}
                ]
            }
        endif
    else
        if InNetGame
            if OnServer
                creategamespylostconnectiondialog
            endif
        endif
    endif
endscript

script cancel_keyboard 
    if ObjectExists \{ id = keyboard_anchor }
        destroy_onscreen_keyboard
    else
        return 
    endif
    if ObjectExists \{ id = console_message_vmenu }
        DoScreenElementMorph \{ id = console_message_vmenu alpha = 1 }
    endif
    back_to_game_selection_menu <...> 
endscript

script enter_kb_chat_message 
    printf \{ 'script enter_kb_chat_message' }
    GetTextElementString \{ id = keyboard_current_string }
    cancel_keyboard \{ focus_on_enter_message }
    NetSessionFunc obj = match func = send_chat_message params = { text = <string> }
endscript

script check_keyboard_focus 
    KillSpawnedScript \{ name = maybe_launch_lobby_keyboard }
    SpawnScriptLater \{ maybe_launch_lobby_keyboard }
    main_theme_focus <...> 
endscript

script maybe_launch_lobby_keyboard 
    begin 
    wait \{ 1 gameframe }
    if NOT ScreenElementExists \{ id = actions_menu }
        break 
    endif
    LobbyCheckKeyboard
    repeat 
endscript

script check_keyboard_unfocus 
    KillSpawnedScript \{ name = maybe_launch_lobby_keyboard }
    main_theme_unfocus <...> 
endscript

script lobby_enter_kb_chat 
    printf \{ 'script lobby_enter_kb_chat' }
    FireEvent \{ type = unfocus target = actions_menu }
    create_onscreen_keyboard \{allow_cancel no_buttons Pos = (320.0, 530.0) keyboard_done_script = lobby_entered_chat_message display_text = 'NACHRICHT EINGEBEN: ' keyboard_title = '' min_length = 1 max_length = 50 keyboard_cancel_script = lobby_keyboard_cancel}
endscript

script lobby_entered_chat_message 
    GetTextElementString \{ id = keyboard_current_string }
    NetSessionFunc obj = match func = send_chat_message params = { text = <string> }
    destroy_onscreen_keyboard
    AssignAlias \{ id = server_list_anchor alias = current_menu_anchor }
    AssignAlias \{ id = actions_menu alias = current_menu }
    FireEvent \{ type = focus target = actions_menu }
endscript

script lobby_keyboard_cancel 
    destroy_onscreen_keyboard
    AssignAlias \{ id = server_list_anchor alias = current_menu_anchor }
    AssignAlias \{ id = actions_menu alias = current_menu }
    FireEvent \{ type = focus target = actions_menu }
endscript

script back_from_buddy_messages 
    dialog_box_exit
    destroy_onscreen_keyboard
    if ObjectExists \{ id = console_message_vmenu }
        DoScreenElementMorph \{ id = console_message_vmenu alpha = 1 }
    endif
    back_to_game_selection_menu
endscript

script game_back_from_buddy_messages 
    dialog_box_exit
    destroy_onscreen_keyboard
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_pause_menu
endscript

script view_buddy_messages 
    pager_window_create
endscript

script create_lobby_onscreen_kb 
    if ObjectExists \{ id = console_message_vmenu }
        DoScreenElementMorph \{ id = console_message_vmenu alpha = 0 }
    endif
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_onscreen_keyboard \{allow_cancel in_net_lobby keyboard_cancel_script = cancel_keyboard keyboard_done_script = enter_kb_chat_message keyboard_title = 'NACHRICHT EINGEBEN' text = '' max_length = 40 display_text_offset = (0.0, 5.0)}
endscript

script add_multiplayer_mode_goals 
    AddGoal_TrickAttack
    AddGoal_combomambo
    AddGoal_ScoreChallenge
    AddGoal_Graffiti
    AddGoal_Slap
    AddGoal_King
    AddGoal_gold
    Addgoal_ctf
    AddGoal_Horse_Mp
    AddGoal_GoalAttack
    AddGoal_firefight
    AddGoal_Elimiskate
    AddGoal_Elimiskate_Break_Period
    AddGoal_Elimiskate_Interval
    AddGoal_Scavenger
    AddGoal_Scavenger_Collect
    AddGoal_Scavenger_Interval
endscript

script create_score_menu 
    if NOT ObjectExists id = net_score_menu
        SetScreenElementLock id = root_window Off
        if ((IsXbox)|| (IsXenon))
            CreateScreenElement {
                type = ContainerElement
                parent = root_window
                id = net_score_menu
                Pos = (30.0, 0.0)
                just = [ left top ]
                Scale = 0
                dims = (640.0, 480.0)
            }
        else
            CreateScreenElement {
                type = ContainerElement
                parent = root_window
                id = net_score_menu
                Pos = (0.0, 0.0)
                just = [ left top ]
                Scale = 0
                dims = (640.0, 480.0)
            }
        endif
        CreateScreenElement {
            type = vmenu
            parent = net_score_menu
            id = net_score_vmenu
            just = [ left top ]
            Pos = (45.0, 80.0)
            Scale = 0.9000
            padding_scale = 1
            internal_scale = 1
            internal_just = [ left top ]
        }
        <index> = 1
        begin 
        FormatText checksumname = current_id 'net_score_%i' i = <index>
        CreateScreenElement {
            type = TextElement
            parent = net_score_vmenu
            id = <current_id>
            font = dialog
            text = ''
            Scale = 0.9000
            rgba = [ 128 128 128 98 ]
            not_focusable
            z_priority = -5
        }
        <index> = (<index> + 1)
        repeat 8
        RunScriptOnScreenElement id = net_score_menu menu_onscreen params = { preserve_menu_state }
    endif
endscript

script clear_scores 
    if ObjectExists \{ id = net_score_menu }
        <index> = 1
        begin 
        FormatText checksumname = current_id 'net_score_%i' i = <index>
        SetScreenElementProps {
            id = <current_id>
            text = ''
        }
        ResolveScreenElementID id = {<current_id> child = voice}
        if ScreenElementExists id = <resolved_id>
            DestroyScreenElement id = <resolved_id>
        endif
        <index> = (<index> + 1)
        repeat 8
    endif
endscript

script update_score 
    if GetGlobalFlag flag = NO_DISPLAY_NET_SCORES
        hide_net_scores
    else
        if ObjectExists id = current_menu_anchor
            if NOT ObjectExists id = kb_no_button_hdr
                hide_net_scores
            else
                unhide_net_scores
            endif
        else
            unhide_net_scores
        endif
        if ScreenElementExists id = <id>
            ResolveScreenElementID id = {<id> child = voice}
            if ScreenElementExists id = <resolved_id>
                DestroyScreenElement id = <resolved_id>
            endif
            if ((IsXbox)|| (IsXenon))
                if NOT GotParam NoIcon
                    rgba = [ 128 128 128 128 ]
                    if GotParam IsMuted
                        texture = voicemute
                    else
                        if GotParam hasheadset
                            texture = voiceon
                        else
                            if GotParam VoiceOverSpeaker
                                texture = voicetv
                            endif
                        endif
                    endif
                    GetScreenElementProps id = <id>
                    if GotParam Talking
                        rgba = [ 0 128 0 128 ]
                        Scale = 0.9000
                    else
                        Scale = 0.6000
                    endif
                    SetScreenElementLock id = <id> Off
                    CreateScreenElement {
                        type = SpriteElement
                        parent = <id>
                        local_id = voice
                        texture = <texture>
                        rgba = <rgba>
                        just = [ left center ]
                        Pos = (-35.0, 10.0)
                        Scale = <Scale>
                    }
                endif
            endif
        endif
    endif
endscript

script entered_network_game 
    printf 'script entered_network_game'
    if InInternetMode
        NetSessionFunc obj = match func = leave_lobby params = { preserve_status }
        NetSessionFunc obj = match func = set_quiet_mode params = {}
        if NOT OnServer
            NetSessionFunc obj = presence func = set_state params = { playing }
        endif
    endif
    kill_net_panel_messages
    console_unhide
    restore_start_key_binding
    if LocalSkaterExists
        refresh_skater_model_for_cheats
    endif
    if OnServer
        ClearOmnigons
    else
        if InInternetMode
            NetSessionFunc obj = match func = cancel_nat_negotiation
        endif
        DisplayLoadingScreen freeze
    endif
    EnteredNetworkGame
endscript

script restart_local_server 
    SetNetworkMode
    SetServerMode \{ on }
    SetJoinMode \{ JOIN_MODE_PLAY }
    StartServer
    JoinServer <...> 
endscript

script handle_keyboard_input 
    if ObjectExists \{ id = keyboard_anchor }
        if GotParam \{ got_enter }
            if ScreenElementExists \{ id = keyboard_done_button }
                FireEvent \{ type = pad_choose target = keyboard_done_button }
            else
                FireEvent \{ type = pad_choose target = keyboard_anchor }
            endif
        else
            if GotParam \{ got_backspace }
                keyboard_handle_backspace
            else
                keyboard_button_pressed <...> 
            endif
        endif
    endif
endscript

script back_from_profile_options 
    FireEvent \{ type = unfocus target = profile_options_menu }
    DestroyScreenElement \{ id = profile_options_anchor }
    FireEvent \{ type = focus target = sub_menu }
endscript

script back_from_profile_error 
    dialog_box_exit
    create_internet_options
endscript

script start_track_usage 
    SpawnScriptLater \{ track_usage }
endscript

script track_usage 
    printf '*** track_usage ***'
    dialog_box_exit
    create_dialog_box {
        Title = net_status_msg
        text = net_status_checking_motd
        no_animate
    }
    wait 10 frames
    NetSessionFunc func = content_init
    NetSessionFunc obj = content func = track_usage
    begin 
    NetSessionFunc obj = content func = transfer_think
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    wait 1 frame
    repeat 
    wait 1 frame
    NetSessionFunc func = content_uninit
    proceed_to_motd
endscript

script proceed_to_motd 
    printf \{ '*** proceed_to_motd ***' }
    if IsTrue \{ NeedsToDownloadMOTD }
        SpawnScriptLater \{ download_motd }
    else
        if ObjectExists \{ id = current_menu_anchor }
            DestroyScreenElement \{ id = current_menu_anchor }
        endif
        if NetSessionFunc \{ obj = presence func = profile_exists }
            NetSessionFunc \{ obj = presence func = profile_login }
        else
            create_profile_warning_dialog
        endif
    endif
endscript

script profile_connect 
    dialog_box_exit
    if NOT NetSessionFunc \{ func = presence_started }
        NetSessionFunc \{ func = presence_init }
    endif
    if NetSessionFunc \{ obj = presence func = profile_exists }
        NetSessionFunc \{ obj = presence func = profile_login }
    else
        create_profile_warning_dialog
    endif
endscript

script launch_profile_menu 
    dialog_box_exit
    if NOT ScreenElementExists \{ id = menu_play_online }
        create_internet_options
    endif
    create_profile_menu
endscript

script launch_player_list_menu 
    hide_current_goal
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if InSplitScreenGame
        GoalManager_HidePoints
    endif
    make_new_themed_sub_menu Title = 'SPIELERLISTE' dims = (200.0, 237.0) Pos = (229.0, 80.0) right_bracket_z = 1
    SetScreenElementProps {id = sub_menu event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_pause_menu }}
        ]
    }
    create_helper_text generic_helper_text
    NetSessionFunc obj = presence func = fill_potential_friends_list params = {start = 0 num = 16}
    theme_menu_add_item text = ' ' not_focusable centered
    theme_menu_add_item text = 'Fertig' pad_choose_script = create_pause_menu centered last_menu_item = last_menu_item
    finish_themed_sub_menu
    printf 'endscript laungh_player_list_menu'
endscript

script update_buddy_status 
    if ObjectExists id = <id>
        SetScreenElementProps {
            id = <id>
            text = <text>
            status = <status>
            location = <location>
        }
    endif
endscript

script cancel_face_download 
    destroy_onscreen_keyboard
    create_internet_options
endscript

script face_download_chosen cancel_script = cancel_face_download
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GetPreferenceString pref_type = network face_dl_key
    create_onscreen_keyboard {allow_cancel
        keyboard_cancel_script = <cancel_script>
        keyboard_done_script = launch_face_download
        keyboard_title = 'PASSWORT EINGEBEN'
        text = <ui_string>
        max_length = 50
        from_net = <from_net>
    }
    Theme_GetUnhighlightedTextColor return_value = rgba
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    if NOT GotParam no_help_box
        CreateScreenElement {
            type = TextBlockElement
            parent = current_menu_anchor
            id = directions_text
            text = 'Gib das per Mail zugesandte Passwort ein, wenn du ein Bild geschickt hast.'
            Pos = (320.0, 668.0)
            dims = (640.0, 60.0)
            font = small
            Scale = 0.9000
            rgba = <rgba>
            line_spacing = 0.6500
            z_priority = 5
            just = [ center center ]
        }
        CreateScreenElement {
            type = SpriteElement
            parent = current_menu_anchor
            id = directions_box
            texture = myf_box_mid
            Pos = (320.0, 670.0)
            Scale = (12.0, 1.2000000476837158)
            just = [ center center ]
            rgba = <highlight_rgba>
            z_priority = 5
        }
        DoScreenElementMorph id = directions_text time = 0.2000 Pos = (320.0, 368.0)
        DoScreenElementMorph id = directions_box time = 0.2000 Pos = (320.0, 370.0)
    endif
endscript

script face_dnas_warning 
    dialog_box_exit
    Body = 'Bevor du dein Gesicht runterladen kannst, musst du im Hauptmenü\n Online-Spiel wählen\nund deine Internetverbindung authentifizieren.'
    if ObjectExists id = current_menu
        FireEvent type = unfocus target = current_menu
    endif
    create_dialog_box {Title = 'Warnung!'
        text = <Body>
        text_dims = (350.0, 0.0)
        Pos = (320.0, 240.0)
        just = [ center center ]
        text_rgba = [ 88 105 112 128 ]
        no_bg = no_bg
        buttons = [{font = small text = 'Ohne Download fortfahren' pad_choose_script = cont_wo_dl_face_dnas}
            {font = small text = 'Zum Hauptmenü zurückkehren' pad_choose_script = return_to_main_dnas}
        ]
    }
endscript

script return_to_main_dnas 
    dialog_box_exit
    change \{ main_menu_return_to_createamodes = 0 }
    UnloadCaptureDeviceLibraries
    main_menu_camera_control \{ next_state = main }
    exit_cas \{ return_script = launch_main_menu }
endscript

script cont_wo_dl_face_dnas 
    dialog_box_exit
    face_map_exit \{ new_script = create_face_map_menu focus_child = 4 }
endscript

script async_download_face 
    wait 10 frames
    FormatText textname = url 'http://www.thug3online.com/vault/faces/%s.img.ps2' s = <string>
    NetSessionFunc obj = content func = download_file params = {max_size = 32768
        file = <url>
    }
    begin 
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    NetSessionFunc obj = content func = transfer_think
    wait 1 frame
    repeat 
    if NetSessionFunc obj = content func = transfer_succeeded
        NetSessionFunc obj = content func = apply_face_map
        NetSessionFunc func = content_uninit
        LaunchFaceDownloadCompleteDialog
    else
        LaunchTransferFailedDialog
        NetSessionFunc func = content_uninit
    endif
endscript

script launch_face_download 
    if GotParam from_net
        change download_from_online = 1
    endif
    GetTextElementString id = keyboard_current_string
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    load_pro_skater_set_custom
    SetPreferencesFromUI prefs = network field = 'face_dl_key' <...> 
    printf 'Downloading face'
    create_dialog_box {Title = 'Gesicht-Download'
        text = 'Suche Datei ...'
        buttons = [{text = 'Zurück' pad_choose_script = cancel_download_face}
        ]
        no_animate
    }
    NetSessionFunc func = content_init
    SpawnScriptLater async_download_face params = <...> 
endscript

script cancel_download_face 
    change \{ download_from_online = 0 }
    KillSpawnedScript \{ name = async_download_face }
    NetSessionFunc \{ obj = content func = cancel_file_transfer }
    NetSessionFunc \{ func = content_uninit }
    dialog_box_exit
    net_vault_menu_exit
    back_from_transfer_dialog
endscript

script LaunchFaceDownloadCompleteDialog 
    dialog_box_exit
    net_vault_menu_exit
    create_dialog_box \{Title = 'Download fertig' text = 'Wähle OK, um dein Gesicht zu erstellen.' buttons = [{ text = 'OK' pad_choose_script = back_from_face_transfer_succeeded_dialog }]}
endscript

script async_download_file 
    wait 10 frames
    NetSessionFunc obj = content func = download_file params = {max_size = 122880
        file = <file>
    }
    begin 
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    NetSessionFunc obj = content func = transfer_think
    wait 1 frame
    repeat 
    if NetSessionFunc obj = content func = transfer_succeeded
        NetSessionFunc obj = content func = set_vault_data
        LaunchDownloadCompleteDialog <...> 
    else
        LaunchTransferFailedDialog
        NetSessionFunc func = content_uninit
    endif
endscript

script async_download_dir_list 
    wait 10 frames
    switch <type>
        case parks
        folder = 'levels'
        case skaters
        folder = 'skaters'
        case goals
        folder = 'goals'
        case tricks
        folder = 'tricks'
        case tags
        folder = 'tags'
    endswitch
    printf '******** Downloading root directory list'
    FormatText textname = url 'http://www.thug3online.com/vault/%s/dir_list.txt' s = <folder>
    NetSessionFunc obj = content func = download_file params = {max_size = 100000
        file = <url>
    }
    begin 
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    NetSessionFunc obj = content func = transfer_think
    wait 1 frame
    repeat 
    if NetSessionFunc obj = content func = transfer_succeeded
        printf '******** success. Parsing directory list.'
        NetSessionFunc obj = content func = parse_dir_list params = {type = <type> name = <folder>}
        NetSessionFunc obj = content func = first_vault_category
        GetArraySize <dirs>
        index = 0
        begin 
        printf '******** Downloading dir_list.'
        sub_folder = (<dirs> [ <index> ])
        FormatText textname = url 'http://www.thug3online.com/vault/%s/%f/dir_list.txt' s = <folder> f = <sub_folder>
        NetSessionFunc obj = content func = download_file params = {max_size = 100000
            file = <url>
        }
        begin 
        if NetSessionFunc obj = content func = is_transfer_complete
            break 
        endif
        NetSessionFunc obj = content func = transfer_think
        wait 1 frame
        repeat 
        if NetSessionFunc obj = content func = transfer_succeeded
            NetSessionFunc obj = content func = parse_category
        else
            printf '******** failed. '
            LaunchTransferFailedDialog
            NetSessionFunc func = content_uninit
            return 
        endif
        printf '******** success. '
        NetSessionFunc obj = content func = next_vault_category
        index = (<index> + 1)
        repeat <array_size>
        printf '******** Downloaded all directory listings!!!!'
        NetSessionFunc obj = content func = first_vault_category
        net_vault_menu_create type = <type> category = (<dirs> [ 0 ])
    else
        LaunchTransferFailedDialog
        NetSessionFunc func = content_uninit
    endif
endscript

script download_content 
    printf \{ 'retrieving directory listing' }
    DestroyScreenElement \{ id = current_menu_anchor }
    create_dialog_box \{Title = net_status_msg text = 'Abruf der Verzeichnisliste ...' buttons = [{ text = 'Zurück' pad_choose_script = cancel_download_file }] no_animate}
    NetSessionFunc \{ func = content_init }
    SpawnScriptLater async_download_dir_list params = <...> 
endscript

script download_selected_file 
    printf \{ 'Downloading content' }
    gettags
    GetTextElementString id = {<id> child = 0}
    SetScriptString string = <string>
    DestroyScreenElement \{ id = current_menu_anchor }
    create_dialog_box \{Title = 'Datei-Download ...' text = '' buttons = [{ text = 'Zurück' pad_choose_script = cancel_download_file }] no_animate}
    SpawnScriptLater async_download_file params = <...> 
endscript

script cancel_download_file 
    KillSpawnedScript \{ name = async_download_dir_list }
    KillSpawnedScript \{ name = async_download_file }
    NetSessionFunc \{ obj = content func = cancel_file_transfer }
    NetSessionFunc \{ func = content_uninit }
    net_vault_menu_exit
    dialog_box_exit
    back_from_transfer_dialog
endscript

script update_transfer_progress 
    if ObjectExists \{ id = dialog_box_text }
        SetScreenElementProps {
            id = dialog_box_text
            text = <text>
        }
    endif
endscript

script back_from_transfer_dialog 
    NetSessionFunc \{ func = content_uninit }
    if GameModeEquals \{ is_net }
        if NOT IsTrue \{ from_CAS_face_mapping }
            dialog_box_exit
            create_internet_options
        else
            change \{ from_CAS_face_mapping = 0 }
            face_back_from_net_setup
        endif
    else
        face_back_from_net_setup
    endif
endscript

script back_from_transfer_succeeded_dialog 
    dialog_box_exit
    memcard_menus_cleanup
    NetSessionFunc \{ func = content_uninit }
    create_internet_options
    change \{ savevaultdata = 0 }
endscript

script LaunchFileNotFoundDialog 
    change \{ download_from_online = 0 }
    net_vault_menu_exit
    dialog_box_exit
    create_dialog_box \{Title = 'Datei nicht gefunden' text = 'Vergewissere dich, dass du den Key richtig eingegeben und dein Bild erfolgreich an faces@tonyhawksonline.com gemailt hast.' buttons = [{ text = 'OK' pad_choose_script = back_from_transfer_dialog }]}
endscript

script LaunchGeneralFileNotFoundDialog 
    net_vault_menu_exit
    dialog_box_exit
    create_dialog_box \{Title = 'Serverfehler' text = 'Konnte gewählte Datei nicht runterladen. Möglicherweise besteht keine Verbindung zum Server. Bitte versuch es später noch einmal.' buttons = [{ text = 'OK' pad_choose_script = back_from_transfer_dialog }]}
endscript

script LaunchTransferFailedDialog 
    printf \{ 'LaunchTransferFailedDialog' }
    change \{ download_from_online = 0 }
    net_vault_menu_exit
    dialog_box_exit
    error_desc = 'Überprüf bitte deine Netzwerk-Kabel.'
    NetSessionFunc \{ obj = content func = get_download_failure_desc }
    create_dialog_box {Title = 'Fehlgeschlagen!'
        text = <error_desc>
        buttons = [{text = 'OK' pad_choose_script = back_from_transfer_dialog}
        ]
    }
endscript

script LaunchDownloadCompleteDialog 
    printf 'script LaunchDownloadCompleteDialog'
    net_vault_menu_exit
    dialog_box_exit
    printstruct <...> 
    if GotParam type
        switch <type>
            case parks
            text = 'Heruntergeladenen Park speichern?'
            file_type = Park
            case goals
            text = 'Runtergeladene Ziele speichern?'
            file_type = CreatedGoals
            case skaters
            text = 'Runtergeladenen Skater speichern?'
            file_type = OptionsAndPros
            case tricks
            text = 'Runtergeladenen Trick speichern?'
            file_type = CAT
            case tags
            text = 'Grafik-Download speichern?'
            file_type = createdgraphic
            default 
            printf 'save download: invalid type'
            return 
        endswitch
    else
        printf 'save download: missing type'
        return 
    endif
    create_dialog_box {Title = 'Download fertig'
        text = <text>
        buttons = [{text = 'Ja' pad_choose_script = launch_download_save_sequence pad_choose_params = { file_type = <file_type> }}
            {text = 'Nein' pad_choose_script = back_from_transfer_succeeded_dialog}
        ]
    }
endscript

script back_from_face_transfer_succeeded_dialog 
    dialog_box_exit
    if GameModeEquals \{ is_net }
        SpawnSecondControllerCheck
        NetSessionFunc \{ func = match_uninit }
        NetSessionFunc \{ func = presence_uninit }
        NetSessionFunc \{ func = stats_uninit }
        wait \{ 1 gameframe }
        if ScreenElementExists \{ id = current_menu_anchor }
            DestroyScreenElement \{ id = current_menu_anchor }
        endif
        launch_cas \{ face2 downloaded_face = downloaded_face }
    else
        face_back_from_net_setup
    endif
endscript

script StartFreeSkate 
    MakeSkaterGosub \{ add_skater_to_world skater = 0 }
    MakeSkaterGosub \{ add_skater_to_world skater = 1 }
    SetGameType \{ freeskate2p }
    SetCurrentGameType
    SetScreenModeFromGameMode
endscript

script kill_all_panel_messages 
    exit_pause_menu
    dialog_box_exit anchor_id = quit_dialog_anchor
    dialog_box_exit
    speech_box_exit
    force_close_rankings
    close_goals_menu
    kill_net_panel_messages
    destroy_onscreen_keyboard
    TantrumMessageKill
    if ObjectExists id = perfect
        DestroyScreenElement id = perfect
    endif
    if ObjectExists id = perfect2
        DestroyScreenElement id = perfect2
    endif
    if ObjectExists id = death_message
        DestroyScreenElement id = death_message
    endif
    if ObjectExists id = leaving_message
        DestroyScreenElement id = leaving_message
    endif
    if ObjectExists id = goal_message
        DestroyScreenElement id = goal_message
    endif
endscript

script StartingNewNetGame 
    sound_options_exit \{ just_remove }
    edit_tricks_menu_exit \{ just_remove }
    kill_all_panel_messages
    if NOT IsObserving
        skater ::runstarted
    endif
    ClearPowerups
    if NOT IsObserving
        ExitSurveyorMode
    endif
endscript

script unlock_root_window 
    SetScreenElementLock \{ id = root_window Off }
endscript

script create_object_label 
    SetScreenElementLock \{ id = root_window Off }
    CreateScreenElement {
        id = <id>
        type = TextElement
        parent = root_window
        font = small
        text = ''
        Scale = 1.0
        pos3d = (0.0, 0.0, 0.0)
        rgba = [ 128 128 0 128 ]
    }
endscript

script destroy_object_label 
    if ObjectExists id = <id>
        DestroyScreenElement id = <id>
    endif
endscript

script destroy_all_player_names 
    if ObjectExists id = skater_name_0
        DestroyScreenElement id = skater_name_0
    endif
    if ObjectExists id = skater_name_1
        DestroyScreenElement id = skater_name_1
    endif
    if ObjectExists id = skater_name_2
        DestroyScreenElement id = skater_name_2
    endif
    if ObjectExists id = skater_name_3
        DestroyScreenElement id = skater_name_3
    endif
    if ObjectExists id = skater_name_4
        DestroyScreenElement id = skater_name_4
    endif
    if ObjectExists id = skater_name_5
        DestroyScreenElement id = skater_name_5
    endif
    if ObjectExists id = skater_name_6
        DestroyScreenElement id = skater_name_6
    endif
    if ObjectExists id = skater_name_7
        DestroyScreenElement id = skater_name_7
    endif
endscript

script create_net_metrics 
    SetScreenElementLock \{ id = root_window Off }
    CreateScreenElement \{id = net_metrics type = TextElement parent = root_window font = small text = '' Scale = 1.0 Pos = (150.0, 400.0) rgba = [ 128 128 0 128 ]}
endscript

script update_net_metrics 
    if NOT ObjectExists \{ id = net_metrics }
        create_net_metrics
    endif
    SetScreenElementProps {
        id = net_metrics
        text = <text>
    }
endscript

script notify_cheating 
    create_net_panel_message \{ msg_time = 6000 text = net_message_server_cheating }
endscript

script notify_client_cheating 
    FormatText textname = msg_text 'Spieler %s verwendet Cheats!' s = <string0>
    create_net_panel_message \{ msg_time = 6000 text = 'Mindestens ein Spieler verwendet Cheats!' style = net_team_panel_message }
endscript

script warn_all_same_team 
    create_panel_message \{ id = goal_message text = 'Warnung: Alle Spieler sind im gleichen Team' style = panel_message_generic_loss time = 5000 }
endscript

script flash_buddy_message_icon 
    printf \{ '*** flashing buddy message icon ***' }
    update_pager_icon \{ Create }
    update_pager_icon \{ show }
    update_pager_icon \{ flash }
endscript

script kill_buddy_message_icon 
    printf \{ '*** killing buddy message icon ***' }
    update_pager_icon \{ stop_flash }
endscript

script InitSelectedGoals 
    GoalManager_InitializeAllSelectedGoals
    GetGoalsMode
    GoalManager_ActivateAllSelectedGoals
endscript

script PatchCleanup 
endscript
judge_full_name = 'Richter'

script main_menu_exit_to_online 
    xenon_live_start
    select_thug_online_play \{ change_gamemode = change_gamemode_net do_loading_logo }
endscript

script get_current_level_name 
    if GotParam \{ level }
        GetLevelStructureName <...> 
    else
        GetLevelStructureName
    endif
    level_struct = <level_structure_name>
    return level_name = (<level_structure_name>.name)level_load_script = (<level_structure_name>.load_script)level = (<level>)
endscript

script is_collectors_edition 
    return \{ IsCollectorsEdition }
endscript

script signinchanged 
    lost_connection_to_live \{ menu_text = net_status_live_lost_connection_dupe }
endscript
