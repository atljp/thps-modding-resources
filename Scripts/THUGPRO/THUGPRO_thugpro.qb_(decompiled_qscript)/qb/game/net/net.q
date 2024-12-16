
vMAX_PLAYERS = 8 
network_connection_type = internet 
InNetOptionsFromNetPlay = 0 
InNetOptionsFromFaceDownload = 0 
has_accepted_dnas = 1 
SkipDNASAuthentication = 0 
NeedsToTestDNAS = 1 
SignedDisclaimer = 0 
tp_show_fcfs_notification = 0 
SCRIPT launch_viewer 
	printf "launch_viewer is no longer needed ... you can remove it from your startup script" 
ENDSCRIPT

SCRIPT auto_launch_viewer 
	LaunchViewer 
ENDSCRIPT

NO_NET_MODE = 0 
LAN_MODE = 1 
INTERNET_MODE = 2 
HOST_MODE_SERVE = 0 
HOST_MODE_AUTO_SERVE = 1 
HOST_MODE_FCFS = 2 
JOIN_MODE_PLAY = 0 
JOIN_MODE_OBSERVE = 1 
net_game_type_info = [ 
	{ 
		Name = "Trick Attack" 
		description = "Player with the highest score at the end of the time limit wins" 
		checksum = nettrickattack 
		goal_script = StartGoal_TrickAttack 
		icon = "2p_attack" 
		enabled = 1 
	} 
	{ 
		Name = "Scavenger Hunt" 
		description = "Player with the most objects at the end of the time limit wins." 
		checksum = netscavengerhunt 
		goal_script = StartGoal_Scavenger 
		icon = "2p_hunt" 
		enabled = 0 
	} 
	{ 
		Name = "Elimiskate" 
		description = "Player with the lowest score at game intervals is eliminated" 
		checksum = netelimiskate 
		goal_script = StartGoal_ElimiSkate 
		icon = "2p_elim" 
		enabled = 0 
	} 
	{ 
		Name = "Score Challenge" 
		description = "The first player to reach the set score wins" 
		checksum = netscorechallenge 
		goal_script = StartGoal_ScoreChallenge 
		icon = "2p_score" 
		enabled = 0 
	} 
	{ 
		Name = "Combo Mambo" 
		description = "The player who busts the biggest combo during the time limit, wins" 
		checksum = netcombomambo 
		goal_script = StartGoal_ComboMambo 
		icon = "2p_mambo" 
		enabled = 1 
	} 
	{ 
		Name = "Slap!" 
		description = "The player who slaps their opponents the most times, wins" 
		checksum = netslap 
		goal_script = StartGoal_Slap 
		icon = "2p_slap" 
		enabled = 0 
	} 
	{ 
		Name = "King of the Hill" 
		description = "The player who holds the crown for the set time wins" 
		checksum = netking 
		goal_script = StartGoal_King 
		icon = "2p_koth" 
		enabled = 0 
	} 
	{ 
		Name = "Graffiti" 
		description = "The player who tags the most objects wins" 
		checksum = netgraffiti 
		goal_script = StartGoal_Graffiti 
		icon = "2p_graffiti" 
		enabled = 1 
	} 
	{ 
		Name = "Goal Attack" 
		description = "First one to finish all the selected goals wins" 
		checksum = netgoalattack 
		goal_script = StartGoal_GoalAttack 
		icon = "2p_goal" 
		enabled = 0 
		disabled_in_auto_game 
	} 
	{ 
		Name = "Capture the Flag" 
		description = "Capture another team\'s flag and return it to your base" 
		checksum = netctf 
		goal_script = StartGoal_CTF 
		icon = "2p_flag" 
		enabled = 0 
	} 
	{ 
		Name = "FireFight" 
		description = "Launch fireballs with either \\b1\\b7 or \\b1\\b4. Last man standing wins." 
		checksum = netfirefight 
		goal_script = StartGoal_FireFight 
		icon = "2p_fire" 
		enabled = 0 
	} 
] 
mp_game_type_info = [ 
	{ 
		Name = "Trick Attack" 
		description = "Player with the highest score at the end of the time limit wins" 
		checksum = trickattack 
		goal_script = StartGoal_TrickAttack 
		icon = "2p_attack" 
	} 
	{ 
		Name = "Scavenger Hunt" 
		description = "Player with the most objects at the end of the time limit wins." 
		checksum = scavengerhunt 
		goal_script = StartGoal_Scavenger 
		icon = "2p_attack" 
	} 
	{ 
		Name = "Score Challenge" 
		description = "First one to reach set score wins" 
		checksum = scorechallenge 
		goal_script = StartGoal_ScoreChallenge 
		icon = "2p_score" 
	} 
	{ 
		Name = "Combo Mambo" 
		description = "The player who busts the biggest combo during the time limit, wins!" 
		checksum = combomambo 
		goal_script = StartGoal_ComboMambo 
		icon = "2p_mambo" 
	} 
	{ 
		Name = "Slap!" 
		description = "Player who slaps their opponent the most times within the time limit wins" 
		checksum = slap 
		goal_script = StartGoal_Slap 
		icon = "2p_slap" 
	} 
	{ 
		Name = "King of the Hill" 
		description = "Player who holds the crown for the set time wins" 
		checksum = king 
		goal_script = StartGoal_King 
		icon = "2p_koth" 
	} 
	{ 
		Name = "Graffiti" 
		description = "Player who tags the most objects wins" 
		checksum = graffiti 
		goal_script = StartGoal_Graffiti 
		icon = "2p_graffiti" 
	} 
	{ 
		Name = "Horse" 
		description = "Pull off combos until someone spells horse" 
		checksum = horse 
		goal_script = do_nothing 
		icon = "2p_horse" 
	} 
	{ 
		Name = "Free Skate" 
		description = "Skate the level freely" 
		checksum = freeskate2p 
		goal_script = StartFreeSkate 
		icon = "2p_free" 
	} 
	{ 
		Name = "FireFight" 
		description = "Launch fireballs with either \\b1\\b7 or \\b1\\b4.\\nLast man standing wins." 
		checksum = firefight 
		goal_script = StartGoal_FireFight 
		icon = "2p_fire" 
	} 
] 
net_goal_info = [ 
	{ 
		Name = "Classic Goals" 
		checksum = goals_classic 
	} 
	{ 
		Name = "Created Goals" 
		checksum = goals_created 
	} 
] 
skill_level_info = [ 
	{ 
		Name = "1: Baby Steps" 
		checksum = num_1 
	} 
	{ 
		Name = "2: I Can Crawl!" 
		checksum = num_2 
	} 
	{ 
		Name = "3: Hold My Own" 
		checksum = num_3 
	} 
	{ 
		Name = "4: Let\'s Do This" 
		checksum = num_4 
	} 
	{ 
		Name = "5: Bring It On!" 
		checksum = num_5 
	} 
] 
fireball_level_info = [ 
	{ 
		Name = "1 (easy)" 
		checksum = num_1 
		fireball_level = 1 
	} 
	{ 
		Name = "2" 
		checksum = num_2 
		fireball_level = 2 
	} 
	{ 
		Name = "3" 
		checksum = num_3 
		fireball_level = 3 
	} 
	{ 
		Name = "4" 
		checksum = num_4 
		fireball_level = 4 
	} 
	{ 
		Name = "5 (hard)" 
		checksum = num_5 
		fireball_level = 5 
	} 
] 
SCRIPT create_big_black_hiding_box 
	unlock_root_window 
	IF ScreenElementExists id = big_black_box 
		DestroyScreenElement id = big_black_box 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = THUGPRO_IconSprite 
		texture = thugpro_icon_text 
		pos = PAIR(320.00000000000, 240.00000000000) 
		scale = 0.30000001192 
		just = [ center center ] 
		z_priority = 5003 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = THUGPRO_IconSpriteBack 
		texture = thugpro_icon_wheel 
		pos = PAIR(320.00000000000, 240.00000000000) 
		scale = 0.30000001192 
		just = [ center center ] 
		z_priority = 5002 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = big_black_box 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(190.00000000000, 190.00000000000) 
		just = [ center center ] 
		z_priority = 5001 
	} 
ENDSCRIPT

SCRIPT quit_network_game 
	Change SKATER_BOARD_IS_SPINNING = 0 
	Change garbage_wp_checker_active = 0 
	Change garbage_wp_checker_exit = 1 
	Change is_quitting = 1 
	Change is_changing_levels = 1 
	create_big_black_hiding_box 
	console_destroy 
	restore_start_key_binding 
	IF IsHost 
		UnSetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
		UnSetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		KillSpawnedScript Name = AutoServer_Break_Timer 
		IF ScreenElementExists id = autoserver_timer 
			DestroyScreenElement id = autoserver_timer 
		ENDIF 
	ENDIF 
	THUGPRO_ClearAllObserveValues quit 
	Change RejoinNextGame = 0 
	IF InInternetMode 
		IF OnServer 
			ReportStats final 
		ENDIF 
		IF ProfileLoggedIn 
			SetLobbyStatus 
		ENDIF 
		CancelNatNegotiation 
	ENDIF 
	IF ObjectExists id = skater 
		IF NOT IsObserving 
			skater : NetEnablePlayerInput 
			skater : DestroyAllSpecialItems 
		ENDIF 
	ENDIF 
	IF NOT IsObserving 
		ExitSurveyorMode 
	ENDIF 
	ProximCleanup 
	chosen_leave_server 
	dialog_box_exit anchor_id = quit_dialog_anchor 
	dialog_box_exit 
	IF IsInternetGameHost 
		QuitGame 
		RETURN 
	ENDIF 
	IF IsJoiningInternetGame 
		QuitGame 
		RETURN 
	ENDIF 
	SetGameType career 
	SetCurrentGameType 
	SetStatOverride 
	setservermode on 
	StartServer 
	SetJoinMode JOIN_MODE_PLAY 
	SetNetworkMode LAN_MODE 
	JoinServer 
	BEGIN 
		IF JoinServerComplete 
			BREAK 
		ELSE 
			Wait 1 
		ENDIF 
	REPEAT 
	IF InInternetMode 
		SetQuietMode OFF 
	ENDIF 
	SetGameType NetLobby 
	SetCurrentGameType 
	level_select_change_level level = Load_MainMenu no_levelUnload 
	SetNetworkMode 
ENDSCRIPT

SCRIPT spawned_chosen_host_game 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		DestroyIfObjectExist id = bg_container 
		CreateScreenElement { 
			type = SpriteElement 
			parent = root_window 
			id = THUGPRO_IconSprite 
			texture = thugpro_icon_text 
			pos = PAIR(320.00000000000, 240.00000000000) 
			scale = 0.30000001192 
			just = [ center center ] 
			z_priority = 5003 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = root_window 
			id = THUGPRO_IconSpriteBack 
			texture = thugpro_icon_wheel 
			pos = PAIR(320.00000000000, 240.00000000000) 
			scale = 0.30000001192 
			just = [ center center ] 
			z_priority = 5002 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = root_window 
			id = big_black_box 
			texture = black 
			pos = PAIR(320.00000000000, 240.00000000000) 
			rgba = [ 0 0 0 128 ] 
			scale = PAIR(190.00000000000, 190.00000000000) 
			just = [ center center ] 
			alpha = 0.69999998808 
		} 
		Wait 1 frame 
	ENDIF 
	leave_front_end 
	Cleanup preserve_skaters 
	SkProDisplayLoadingScreen blank freeze 
	FreeServerList 
	LeaveServer 
	SetGameType NetLobby 
	SetCurrentGameType 
	InitSkaterHeaps 
	setservermode 
	StartServer 
	SetJoinMode JOIN_MODE_PLAY 
	JoinServer 
	BEGIN 
		IF JoinServerComplete 
			BREAK 
		ELSE 
			Wait 1 
		ENDIF 
	REPEAT 
	ChangeLevel level = use_preferences 
	exit_pause_menu 
ENDSCRIPT

SCRIPT chosen_host_game 
	Change in_server_options = 0 
	thugpro_menu_destroy_title 
	IF InNetGame 
		network_start_selected_thugpro 
	ELSE 
		IF InSplitScreenGame 
			ApplySplitScreenOptions 
			chosen_start_game 
		ELSE 
			Change check_for_unplugged_controllers = 0 
			Change is_changing_levels = 1 
			SpawnScript spawned_chosen_host_game NotSessionSpecific = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT network_start_selected_thugpro 
	GetPreferenceChecksum pref_type = network game_type 
	IF ( <checksum> = netscorechallenge ) 
		IF ( score_mode = point_scoring ) 
			Change GraffMode = 0 
			IF OnServer 
				BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE OFF 
			ENDIF 
			set_graff_mode_name id_checksum = netscorechallenge 
		ELSE 
			IF ( score_mode = tag_scoring ) 
				Change GraffMode = 1 
				IF OnServer 
					BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE on 
				ENDIF 
				set_graff_mode_name id_checksum = netscorechallenge graff 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( <checksum> = netgold ) 
			IF ( score_mode = point_scoring ) 
				Change GraffMode = 0 
				IF OnServer 
					BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE OFF 
				ENDIF 
				set_graff_mode_name id_checksum = netgold 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					Change GraffMode = 1 
					IF OnServer 
						BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE on 
					ENDIF 
					set_graff_mode_name id_checksum = netgold graff 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( <checksum> = netelimiskate ) 
				IF ( score_mode = point_scoring ) 
					Change GraffMode = 0 
					IF OnServer 
						BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE OFF 
					ENDIF 
					set_graff_mode_name id_checksum = netelimiskate 
				ELSE 
					IF ( score_mode = tag_scoring ) 
						Change GraffMode = 1 
						IF OnServer 
							BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE on 
						ENDIF 
						set_graff_mode_name id_checksum = netelimiskate graff 
					ENDIF 
				ENDIF 
			ELSE 
				IF ( <checksum> = netcombomambo ) 
					IF ( score_mode = point_scoring ) 
						Change GraffMode = 0 
						IF OnServer 
							BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE OFF 
						ENDIF 
						set_graff_mode_name id_checksum = netcombomambo 
					ELSE 
						IF ( score_mode = tag_scoring ) 
							Change GraffMode = 1 
							IF OnServer 
								BroadcastOmnigon cheat_flag = FLAG_TOGGLE_GRAFF_MODE on 
							ENDIF 
							set_graff_mode_name id_checksum = netcombomambo graff 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	network_start_selected 
ENDSCRIPT

SCRIPT select_thug_online_play 
	change_gamemode_net 
	GoalManager_SetDifficultyLevel 1 
	launch_select_skater_menu change_gamemode = change_gamemode_net 
ENDSCRIPT

SCRIPT prompt_for_net_config 
	Change InNetOptionsFromNetPlay = 1 
	_CreationOptionsLoadNetConfig 
ENDSCRIPT

SCRIPT select_internet_play 
	Change network_connection_type = internet 
	do_network_setup error_script = back_from_startup_error_dialog success_script = chose_internet need_setup_script = prompt_for_net_config 
ENDSCRIPT

SCRIPT select_lan_play 
	IF IsTrue show_custom_level_validation_failed 
		PlaySkaterCamAnim skater = 0 Name = skateshop_board_select_cam play_hold 
		HideLoadingScreen 
		Change show_custom_level_validation_failed_wait = 0 
		show_custom_level_validation_failed_dialog 
		thugpro_wait ReadyVal = show_custom_level_validation_failed_wait 
		Change show_custom_level_validation_failed = 0 
	ENDIF 
	do_network_setup error_script = back_from_startup_error_dialog success_script = launch_network_select_lan_games_menu need_setup_script = prompt_for_net_config 
ENDSCRIPT

SCRIPT net_setup_from_net_play_successful 
	dialog_box_exit 
	launch_select_skater_menu change_gamemode = change_gamemode_net 
ENDSCRIPT

SCRIPT do_network_setup 
	UseNetworkPreferences 
	SpawnScript test_network_setup params = <...> 
ENDSCRIPT

SCRIPT spoof_usb_adaptor_setup 
	IF NOT IsTrue DontSpoofAdaptor 
		SetPreferencesFromUI prefs = network field = "device_type" string = "USB Ethernet Adaptor" checksum = device_broadband_usb 
	ENDIF 
ENDSCRIPT

SCRIPT spoof_pcmcia_adaptor_setup 
	IF NOT IsTrue DontSpoofAdaptor 
		SetPreferencesFromUI prefs = network field = "device_type" string = "Ethernet (Network Adaptor for PS2)" checksum = device_broadband_pc 
	ENDIF 
ENDSCRIPT

SCRIPT test_network_setup 
	IF NeedToTestNetSetup 
		Change NeedsToTestDNAS = 1 
		create_testing_network_settings_dialog 
		Wait 1 Seconds 
		TestNetSetup <...> 
	ELSE 
		<success_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT launch_network_host_options_sub_menu 
	PrintStruct <...> 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	<sub_menu_script> <...> 
ENDSCRIPT

SCRIPT back_from_account_list_menu 
	CancelLogon 
	SetNetworkMode 
	create_pause_menu 
ENDSCRIPT

SCRIPT back_from_create_account_dialog 
	dialog_box_exit 
	back_from_account_list_menu 
ENDSCRIPT

SCRIPT back_from_wrong_pin_dialog 
	dialog_box_exit 
	ConnectToInternet 
ENDSCRIPT

SCRIPT launch_no_accounts_dialog 
	create_dialog_box { title = "NO ACCOUNTS FOUND" 
		text = "No accounts were found on your system. Would you like to create an account now?" 
		buttons = [ { text = "Yes" pad_choose_script = go_to_xbox_dashboard } 
			{ text = "No" pad_choose_script = back_from_create_account_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT launch_fcfs_notification 
	IF IsTrue tp_show_fcfs_notification 
		IF ( <checksum> = boolean_true ) 
			SetPreferencesFromUI prefs = network field = "player_collision" string = "On" <...> 
		ELSE 
			SetPreferencesFromUI prefs = network field = "player_collision" string = "Off" <...> 
		ENDIF 
		destroy_onscreen_keyboard 
		force_close_rankings 
		exit_pause_menu 
		create_error_box { title = "Host Notification" 
			text = "This server is in First Come First Serve mode.  You are the designated host.  You may change options and start games." 
			buttons = [ { text = "ok" pad_choose_script = exit_async_dialog } 
			] 
			no_animate 
			delay_input 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT fcfs_confirm 
	DestroyScreenElement id = current_menu_anchor 
	create_dialog_box { title = "First Come First Serve" 
		text = "This option will make you a permanent observer and will allow the first joining player to choose game modes and change levels.  Are you sure?" 
		text_dims = PAIR(350.00000000000, 0.00000000000) 
		buttons = [ { text = "Yes" pad_choose_script = fcfs_selected } 
			{ text = "No" pad_choose_script = create_sit_out_menu } 
		] 
		no_animate 
	} 
ENDSCRIPT

SCRIPT create_kick_ban_menu 
	DestroyScreenElement id = current_menu_anchor 
	create_dialog_box { title = <Name> 
		text = "Remove Player?" 
		buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player } 
			{ text = "kick" pad_choose_script = kick_player_confirm pad_choose_params = <...> } 
			{ text = "ban" pad_choose_script = ban_player_confirm pad_choose_params = <...> } 
		] 
		no_animate 
	} 
ENDSCRIPT

SCRIPT launch_quit_game_dialog 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	create_quit_game_dialog 
ENDSCRIPT

SCRIPT create_quit_game_dialog 
	create_dialog_box { title = "Quit Game" 
		text = "Are you sure?" 
		anchor_id = quit_dialog_anchor 
		no_animate callbackfix 
		buttons = [ { text = "Yes" pad_choose_script = quit_network_game } 
			{ text = "No" pad_choose_script = quit_game_dialog_box_exit } 
		] 
	} 
ENDSCRIPT

SCRIPT quit_game_dialog_box_exit 
	generic_menu_pad_back_sound 
	exit_pause_menu 
	dialog_box_exit anchor_id = quit_dialog_anchor 
ENDSCRIPT

SCRIPT launch_wrong_pin_dialog_box 
	DestroyScreenElement id = current_menu_anchor 
	create_dialog_box { title = "WRONG PIN" 
		text = "The PIN you have entered is incorrect." 
		buttons = [ { text = "ok" pad_choose_script = back_from_wrong_pin_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT select_xbox_multiplayer 
	Change network_connection_type = lan 
	change_gamemode_net 
	launch_select_skater_menu 
ENDSCRIPT

SCRIPT launch_network_select_games_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	create_network_select_games_menu play_cam 
ENDSCRIPT

SCRIPT launch_remove_players_menu 
	hide_current_goal 
	DestroyScreenElement id = current_menu_anchor 
	create_remove_players_menu 
ENDSCRIPT

SCRIPT launch_xbox_online_menu 
	DestroyScreenElement id = current_menu_anchor 
	create_xbox_online_menu 
ENDSCRIPT

SCRIPT chose_xbox_online 
	IF AlreadySignedIn 
		create_xbox_online_menu 
	ELSE 
		chose_internet 
	ENDIF 
ENDSCRIPT

SCRIPT connected_to_internet 
	Change NeedsToTestDNAS = 0 
	IF ServicesAreAvailable 
		retrieve_motd 
	ENDIF 
ENDSCRIPT

SCRIPT availability_check_wait 
	printf "IN availability_check_wait" 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_checking_motd 
		no_animate 
	} 
ENDSCRIPT

SCRIPT retrieve_motd 
	IF NOT AlreadyGotMotd 
		DownloadMotd 
	ELSE 
		IF ObjectExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		IF NOT ProfileLogIn 
			create_internet_options 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT service_never_available 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_never_available 
		buttons = [ { text = "ok" pad_choose_script = back_from_startup_error_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT service_not_available 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_not_available 
		buttons = [ { text = "ok" pad_choose_script = back_from_startup_error_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT failed_internet_connection 
	printf "script failed_internet_connection" 
	launch_new_ss_menu no_animate 
ENDSCRIPT

SCRIPT chose_internet 
	printf "**** Chose Internet*****" 
	SetNetworkMode INTERNET_MODE 
	ConnectToInternet 
ENDSCRIPT

SCRIPT confirm_observe 
	generic_menu_pad_back_sound 
	exit_pause_menu 
	dialog_box_exit 
	EnterObserverMode 
ENDSCRIPT

SCRIPT chose_observe 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_dialog_box { title = "Sit Out" 
		text = "Are you sure you would like to permanently observe this game? You will not be able to jump back in." 
		buttons = [ { text = "Yes" pad_choose_script = confirm_observe } 
			{ text = "No" pad_choose_script = back_from_permanent_observe_dialog } 
		] 
		no_animate 
	} 
ENDSCRIPT

SCRIPT back_from_permanent_observe_dialog 
	dialog_box_exit 
	create_options_menu 
ENDSCRIPT

SCRIPT launch_motd_wait_dialog 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_motd_wait_dialog 
ENDSCRIPT

SCRIPT launch_network_select_lan_games_menu 
	KillSkaterCamAnim all 
	skater : reset_model_lights 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim skater = 0 Name = skateshop_board_select_cam play_hold 
	SetNetworkMode LAN_MODE 
	Change back_to_local_net_menu = 1 
	launch_network_select_games_menu_update 
ENDSCRIPT

SCRIPT launch_network_host_options_menu 
	dialog_box_exit 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	IF levelIs Load_MainMenu 
		create_network_host_options_menu 
	ELSE 
		create_pre_network_host_options_menu 
	ENDIF 
ENDSCRIPT

in_server_options = 0 
SCRIPT back_from_internet_host_options 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		Wait 1 frame 
	ENDIF 
	Change in_server_options = 0 
	IF InNetGame 
		create_pause_menu 
	ELSE 
		launch_network_select_games_menu 
	ENDIF 
ENDSCRIPT

in_net_lobby = 0 
SCRIPT back_from_auth_error 
	printf "script back_from_auth_error" 
	dialog_box_exit 
	launch_new_ss_menu no_animate 
ENDSCRIPT

SCRIPT display_auth_error 
	dialog_box_exit 
	FormatText TextName = message "%h (%s)\\n%e\\n\\n%f" h = <header> s = <sub_code> e = <desc> f = <footer> 
	create_dialog_box { title = net_error_msg 
		text = <message> 
		text_dims = PAIR(500.00000000000, 0.00000000000) 
		buttons = [ { text = "OK" pad_choose_script = back_from_auth_error } 
		] 
	} 
ENDSCRIPT

SCRIPT spawn_dnas_authentication 
	Wait 30 frames 
	AuthenticateClient 
ENDSCRIPT

SCRIPT authenticate_client 
	printf "**** in authenticate client *****" 
	KillSkaterCamAnim all 
	skater : reset_model_lights 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim skater = 0 Name = skateshop_board_select_cam play_hold 
	connected_to_internet 
ENDSCRIPT

current_lobby_focus = 0 
SCRIPT host_chosen 
	Change JoinedGameInProgress = 0 
	Change JoinedAsObserver = 0 
	console_hide 
	GSDisableNet 
	StopServerList 
	FreeServerList 
	launch_network_host_options_menu 
ENDSCRIPT

SCRIPT host_net_chosen 
	Change JoinedGameInProgress = 0 
	Change JoinedAsObserver = 0 
	console_hide 
	StopServerList 
	FreeServerList 
	launch_network_host_options_menu 
	GSEnableNet 
ENDSCRIPT

SCRIPT create_network_menu_exit 
	console_hide 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam new_menu_script 
		<new_menu_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT check_ip_from_keyboard_failure_exit 
	dialog_box_exit 
	create_network_select_games_menu 
ENDSCRIPT

SCRIPT check_ip_from_keyboard_failure 
	TryJoinServerIPCancel 
	create_snazzy_dialog_box { 
		title = #"Unable to connect" 
		text = #"Unable to connect to server." 
		pad_back_script = create_network_select_games_menu 
		buttons = [ 
			{ font = small text = #"OK" pad_choose_script = check_ip_from_keyboard_failure_exit } 
		] 
	} 
	ResetTimer 
	BEGIN 
		IF TimeGreaterThan 5 
			BREAK 
		ENDIF 
		Wait 1 gameframe 
	REPEAT 
	IF ScreenElementExists id = dialog_box_anchor 
		dialog_box_exit 
		create_network_select_games_menu play_cam 
	ENDIF 
ENDSCRIPT

SCRIPT check_ip_from_keyboard_cancel 
	IF GotParam Cancel 
		destroy_onscreen_keyboard 
	ELSE 
		dialog_box_exit 
	ENDIF 
	TryJoinServerIPCancel 
	create_network_select_games_menu play_cam 
ENDSCRIPT

SCRIPT check_ip_from_keyboard 
	GetTextElementString id = keyboard_current_string 
	destroy_onscreen_keyboard 
	IF NOT GotParam Cancel 
		TryJoinServerIP string = <string> 
		ResetTimer 
		create_snazzy_dialog_box { title = #"Checking..." 
			text = #"Checking for server..." 
			pad_back_script = check_ip_from_keyboard_cancel 
			buttons = [ 
				{ font = small text = #"Cancel" pad_choose_script = check_ip_from_keyboard_cancel } 
			] 
		} 
		BEGIN 
			IF TimeGreaterThan 5 
				BREAK 
			ENDIF 
			IF TryJoinServerIPSuccess 
				BREAK 
			ENDIF 
			Wait 1 gameframe 
		REPEAT 
	ENDIF 
	IF GotParam Cancel 
		create_network_select_games_menu 
	ELSE 
		IF NOT TryJoinServerIPSuccess 
			IF ScreenElementExists id = dialog_box_anchor 
				dialog_box_exit 
				check_ip_from_keyboard_failure 
			ENDIF 
		ELSE 
			dialog_box_exit 
			create_network_select_games_menu play_cam 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT check_join_internet_ip 
	console_hide 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	TryJoinInternetGame 
	create_snazzy_dialog_box { title = #"Checking..." 
		text = #"Checking for server..." 
		pad_back_script = check_ip_from_keyboard_cancel 
		buttons = [ 
			{ font = small text = #"Cancel" pad_choose_script = check_ip_from_keyboard_cancel } 
		] 
	} 
	BEGIN 
		IF NOT TryingToJoinGame 
			BREAK 
		ENDIF 
		TryJoinInternetGame 
		ResetTimer 
		BEGIN 
			IF TimeGreaterThan 3 
				BREAK 
			ENDIF 
			IF TryJoinServerIPSuccess 
				BREAK 
			ENDIF 
			Wait 1 gameframe 
		REPEAT 
		IF TryJoinServerIPSuccess 
			BREAK 
		ENDIF 
	REPEAT 10 
	IF NOT TryJoinServerIPSuccess 
		TryJoinServerIPCancel 
		IF ScreenElementExists id = dialog_box_anchor 
			dialog_box_exit 
			check_ip_from_keyboard_failure 
		ENDIF 
	ELSE 
		dialog_box_exit 
		create_network_select_games_menu play_cam 
	ENDIF 
ENDSCRIPT

SCRIPT fcfs_selected 
	dialog_box_exit 
	SetHostMode HOST_MODE_FCFS 
	exit_pause_menu 
ENDSCRIPT

SCRIPT do_nothing 
ENDSCRIPT

SCRIPT create_motd_menu 
	edmsg2 "MESSAGE: %a" a = <message> 
	RETURN 
	dialog_box_exit 
	IF IsPal 
		create_dialog_box { title = "MESSAGE" 
			text = <message> 
			text_dims = PAIR(500.00000000000, 0.00000000000) 
			buttons = [ { text = "ok" pad_choose_script = profile_connect } 
			] 
			box_animate 
		} 
	ELSE 
		create_dialog_box { title = "MESSAGE" 
			text = <message> 
			sub_logo = esrb 
			text_dims = PAIR(500.00000000000, 0.00000000000) 
			buttons = [ { text = "ok" pad_choose_script = profile_connect } 
			] 
			box_animate 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT create_motd_wait_dialog 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_checking_motd 
		buttons = [ { text = "cancel" pad_choose_script = cancelled_motd } ] 
		no_animate 
	} 
ENDSCRIPT

SCRIPT cancelled_motd 
	CancelMotdDownload 
ENDSCRIPT

SCRIPT CreateMotdRetryDialog 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = <message> 
		no_animate 
	} 
ENDSCRIPT

SCRIPT CreateMotdFailedDialog 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_motd_failed 
		buttons = [ { text = "ok" pad_choose_script = back_from_startup_error_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT StatsLoginFailedDialog 
	dialog_box_exit 
	create_dialog_box { title = net_error_msg 
		text = net_status_stats_login_failed 
		buttons = [ { text = "ok" pad_choose_script = back_from_profile_error } 
		] 
	} 
ENDSCRIPT

SCRIPT StatsRetrievalFailedDialog 
	dialog_box_exit 
	create_dialog_box { title = net_error_msg 
		text = net_status_stats_retrieval_failed 
		buttons = [ { text = "ok" pad_choose_script = back_from_profile_error } 
		] 
	} 
ENDSCRIPT

SCRIPT back_from_removed_dialog 
	dialog_box_exit 
	IF EnteringNetGame 
		cancel_join_server 
	ELSE 
		quit_network_game 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_KickedFromServerCleanup 
	IF NOT IsObserving 
		IF IsTrue THUGPRO_ObserveOn 
			THUGPRO_ObserveMode OFF 
		ENDIF 
	ELSE 
		Change THUGPRO_ObserveOn = 0 
	ENDIF 
	HideLoadingScreen 
	GoalManager_DeactivateAllGoals force_all 
	GoalManager_UninitializeAllGoals 
	GoalManager_SetCanStartGoal 0 
	kill_net_panel_messages 
	force_close_rankings dont_retry 
	destroy_onscreen_keyboard 
	dialog_box_exit 
	exit_pause_menu 
	IF NOT IsObserving 
		skater : Vibrate OFF 
	ENDIF 
	IF ScreenElementExists id = quit_dialog_anchor 
		DestroyScreenElement id = quit_dialog_anchor 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
ENDSCRIPT

SCRIPT CreateServerMissingLevelDialog 
	THUGPRO_KickedFromServerCleanup 
	IF NOT GotParam m_level 
		m_level = "Unknown" 
	ENDIF 
	IF NOT GotParam m_levelName 
		m_levelName = "Unknown" 
	ENDIF 
	FormatText TextName = msg_text "You have been removed from the server because you do not have this level installed.\\n\\nLevel name: \'%a\'\\nLevel ID: %b" a = <m_levelName> b = <m_level> 
	create_error_box { 
		title = net_notice_msg 
		text = <msg_text> 
		text_dims = PAIR(320.00000000000, 0.00000000000) 
		text_scale = 0.80000001192 
		buttons = [ { text = "ok" pad_choose_script = back_from_removed_dialog } ] 
		delay_input 
	} 
ENDSCRIPT

SCRIPT CreateServerRemovedYouDialog 
	THUGPRO_KickedFromServerCleanup 
	create_error_box { title = net_notice_msg 
		text = net_message_server_removed_you 
		buttons = [ { text = "ok" pad_choose_script = back_from_removed_dialog } 
		] 
		delay_input 
	} 
ENDSCRIPT

SCRIPT CreateServerMovedOnDialog 
	HideLoadingScreen 
	force_close_rankings dont_retry 
	destroy_onscreen_keyboard 
	dialog_box_exit 
	exit_pause_menu 
	IF NOT IsObserving 
		skater : Vibrate OFF 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
	create_error_box { title = net_notice_msg 
		text = net_message_server_moved_on 
		buttons = [ { text = "ok" pad_choose_script = back_from_removed_dialog } 
		] 
		delay_input 
	} 
ENDSCRIPT

SCRIPT destroy_server_menu_children 
	IF ObjectExists id = server_list_menu 
		SetScreenElementLock id = server_list_menu OFF 
		DestroyScreenElement id = server_list_menu recurse preserve_parent 
		IF GotParam refocus 
			refocus_actions_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_server_desc_children 
	SetScreenElementLock id = server_desc_menu OFF 
	DestroyScreenElement id = server_desc_menu recurse preserve_parent 
	DestroyScreenElement id = server_player_menu recurse preserve_parent 
	refocus_gamelist_menu 
ENDSCRIPT

SCRIPT destroy_lobby_user_list_children 
	IF ObjectExists id = lobby_player_list_menu 
		prepare_lobby_user_list_for_new_children 
		DestroyScreenElement id = lobby_player_list_menu recurse preserve_parent 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_lobby_user 
	IF ObjectExists id = <user_id> 
		DestroyScreenElement id = <user_id> 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_lobby_server 
	IF ObjectExists id = <server_id> 
		DestroyScreenElement id = <server_id> 
	ENDIF 
ENDSCRIPT

SCRIPT add_no_servers_found_message 
	IF ObjectExists id = server_list_menu 
		SetScreenElementLock id = server_list_menu OFF 
		make_thugpro_menu_item { 
			text = "No Games Found" 
			parent_id = server_list_menu 
			id = menu_network_no_servers 
		} 
		IF GotParam refocus 
			refocus_actions_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT prepare_server_menu_for_new_children 
	IF ObjectExists id = server_list_menu 
		SetScreenElementLock id = server_list_menu OFF 
	ENDIF 
ENDSCRIPT

SCRIPT prepare_lobby_user_list_for_new_children 
	IF ObjectExists id = lobby_player_list_menu 
		SetScreenElementLock id = lobby_player_list_menu OFF 
	ENDIF 
ENDSCRIPT

SCRIPT rejoin_lobby 
	IF IsTrue show_custom_level_validation_failed 
		PlaySkaterCamAnim skater = 0 Name = skateshop_board_select_cam play_hold 
		HideLoadingScreen 
		Change show_custom_level_validation_failed_wait = 0 
		show_custom_level_validation_failed_dialog 
		thugpro_wait ReadyVal = show_custom_level_validation_failed_wait 
		Change show_custom_level_validation_failed = 0 
	ENDIF 
	RejoinLobby 
	create_joining_lobby_dialog 
ENDSCRIPT

SCRIPT choose_selected_server 
	console_hide 
	ChooseServer <...> 
	DestroyScreenElement id = current_menu_anchor 
ENDSCRIPT

SCRIPT describe_selected_server 
	IF RetrieveServerInfo <...> 
		THUGPRO_DescribeServer <...> 
	ENDIF 
ENDSCRIPT

SCRIPT choose_selected_player 
	IF OnXbox 
		RemovePlayer <...> 
	ELSE 
		CreatePlayerOptions <...> 
	ENDIF 
ENDSCRIPT

SCRIPT choose_selected_account 
	ChooseAccount <...> 
ENDSCRIPT

SCRIPT cancel_remove_player 
	CancelRemovePlayer 
	dialog_box_exit 
	create_pause_menu 
ENDSCRIPT

SCRIPT cancel_remove_player2 
	CancelRemovePlayer 
	dialog_box_exit 
	launch_player_list_menu 
ENDSCRIPT

SCRIPT kick_player_confirm 
	create_dialog_box { title = <Name> 
		text = "Kick player?" 
		buttons = [ { text = "yes" pad_choose_script = kick_player } 
			{ text = "no" pad_choose_script = cancel_remove_player2 } 
		] 
	} 
ENDSCRIPT

SCRIPT kick_player 
	KickPlayer 
	dialog_box_exit 
	launch_player_list_menu 
ENDSCRIPT

SCRIPT back_from_dialog 
	dialog_box_exit 
	create_pause_menu 
ENDSCRIPT

SCRIPT ban_player_confirm 
	create_dialog_box { title = <Name> 
		text = "Ban player?" 
		buttons = [ { text = "yes" pad_choose_script = ban_player } 
			{ text = "no" pad_choose_script = cancel_remove_player2 } 
		] 
	} 
ENDSCRIPT

SCRIPT ban_player 
	BanPlayer 
	dialog_box_exit 
	launch_player_list_menu 
ENDSCRIPT

SCRIPT create_player_options_dialog 
	DestroyScreenElement id = current_menu_anchor 
	IF THUGPRO_IsPlayerMuted 
		IF OnServer 
			va = [ 
				{ text = "Kick" pad_choose_script = kick_player_confirm pad_choose_params = <...> } 
				{ text = "Ban" pad_choose_script = ban_player_confirm pad_choose_params = <...> } 
				{ text = "Unblock" pad_choose_script = unblock_player pad_choose_params = <...> } 
				{ text = "Cancel" pad_choose_script = cancel_remove_player2 } 
			] 
		ELSE 
			va = [ 
				{ text = "Unblock" pad_choose_script = unblock_player pad_choose_params = <...> } 
				{ text = "Cancel" pad_choose_script = cancel_remove_player2 } 
			] 
		ENDIF 
	ELSE 
		IF OnServer 
			va = [ 
				{ text = "Kick" pad_choose_script = kick_player_confirm pad_choose_params = <...> } 
				{ text = "Ban" pad_choose_script = ban_player_confirm pad_choose_params = <...> } 
				{ text = "Block" pad_choose_script = block_player pad_choose_params = <...> } 
				{ text = "Cancel" pad_choose_script = cancel_remove_player2 } 
			] 
		ELSE 
			va = [ 
				{ text = "Block" pad_choose_script = block_player pad_choose_params = <...> } 
				{ text = "Cancel" pad_choose_script = cancel_remove_player2 } 
			] 
		ENDIF 
	ENDIF 
	<butt> = <va> 
	create_dialog_box { title = "Player Options" 
		text = <Name> 
		pad_back_script = cancel_remove_player2 
		buttons = <butt> 
		no_animate 
	} 
ENDSCRIPT

blacklist_player_array = [ 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
] 
whitelist_player_array = [ 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
	"" 
] 
SCRIPT create_view_blacklist_menu 
	hide_current_goal 
	thugpro_menu_create { 
		menu_name = player_blacklist 
		menu_title = "PLAYER BLACKLIST" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = launch_player_list_menu } 
		num_items_to_show = 11 
		scrolling 
		boxed 
	} 
	index = 0 
	count = 0 
	GetArraySize ( blacklist_player_array ) 
	BEGIN 
		IF ( blacklist_player_array [ <index> ] = "" ) 
		ELSE 
			FormatText checksumname = chk "%a_%b" a = ( blacklist_player_array [ <index> ] ) b = <index> 
			FormatText TextName = txt "%c" c = ( blacklist_player_array [ <index> ] ) 
			make_thugpro_menu_item { 
				text = <txt> 
				id = <chk> 
				pad_choose_script = unblock_player_confirm 
				pad_choose_params = { Name = <txt> from_menu } 
				centered 
			} 
			<count> = ( <count> + 1 ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( <count> > 0 ) 
		make_thugpro_menu_item id = player_blacklist_separator not_focusable centered 
		make_thugpro_menu_item { 
			text = "Clear Blacklist" 
			id = clear_blacklist_option 
			pad_choose_script = menu_clear_blacklist 
			centered 
		} 
	ELSE 
		make_thugpro_menu_item { 
			text = "Blacklist is empty" 
			id = player_blacklist_none 
			not_focusable 
			centered 
		} 
	ENDIF 
	thugpro_menu_create_remainder_items 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT menu_clear_blacklist 
	clear_blacklist_array 
	create_view_blacklist_menu 
ENDSCRIPT

dev_list = [ 
	"QUAZZ" 
	"MORTEN" 
	"%.GONE." 
	"CHASE" 
] 
SCRIPT unblock_player_confirm 
	get_clean_string string = <Name> 
	create_dialog_box { title = <clean_string> text = "Unblock player?" buttons = [ { text = "yes" pad_choose_script = unblock_player pad_choose_params = <...> } { text = "no" pad_choose_script = cancel_remove_player } ] } 
ENDSCRIPT

SCRIPT unblock_player 
	THUGPRO_MutePlayer unblock <...> 
	dialog_box_exit 
	IF GotParam from_menu 
		create_view_blacklist_menu 
	ELSE 
		launch_player_list_menu 
	ENDIF 
ENDSCRIPT

SCRIPT block_player_confirm 
	get_clean_string string = <Name> 
	IF ArrayContains array = whitelist_player_array contains = <clean_string> 
		create_dialog_box { title = <clean_string> text = "Player is a friend\\nBlocking this player will remove friendship\\nBlock player anyway?" buttons = [ { text = "yes" pad_choose_script = block_player pad_choose_params = <...> } { text = "no" pad_choose_script = cancel_remove_player2 } ] } 
	ELSE 
		create_dialog_box { title = <clean_string> text = "Block player?" buttons = [ { text = "yes" pad_choose_script = block_player pad_choose_params = <...> } { text = "no" pad_choose_script = cancel_remove_player2 } ] } 
	ENDIF 
ENDSCRIPT

SCRIPT block_player 
	THUGPRO_MutePlayer <...> 
	dialog_box_exit 
	launch_player_list_menu 
ENDSCRIPT

SCRIPT unfriend_player 
	get_clean_string string = <Name> 
	IF ArrayContains array = whitelist_player_array contains = <clean_string> 
		get_index_of array = whitelist_player_array Name = <clean_string> 
		IF NOT ( <index_of> = -1 ) 
			temp_array = whitelist_player_array 
			SetArrayElement arrayname = temp_array index = <index_of> newvalue = "" 
			whitelist_player_array = <temp_array> 
		ENDIF 
	ENDIF 
	dialog_box_exit 
	launch_player_list_menu 
ENDSCRIPT

SCRIPT befriend_player_confirm 
	get_clean_string string = <Name> 
	IF ArrayContains array = blacklist_player_array contains = <clean_string> 
		create_dialog_box { title = <clean_string> text = "Player is blocked\\nBefriending this player will stop blocking this player\\nBefriend player anyway?" buttons = [ { text = "yes" pad_choose_script = befriend_player pad_choose_params = <...> } { text = "no" pad_choose_script = cancel_remove_player2 } ] } 
	ELSE 
		create_dialog_box { title = <clean_string> text = "Befriend player?" buttons = [ { text = "yes" pad_choose_script = befriend_player pad_choose_params = <...> } { text = "no" pad_choose_script = cancel_remove_player2 } ] } 
	ENDIF 
ENDSCRIPT

SCRIPT befriend_player 
	get_clean_string string = <Name> 
	IF ArrayContains array = blacklist_player_array contains = <clean_string> 
		unblock_player <...> 
	ENDIF 
	IF NOT ArrayContains array = whitelist_player_array contains = <clean_string> 
		get_index_of array = whitelist_player_array empty_index 
		temp_array = whitelist_player_array 
		SetArrayElement arrayname = temp_array index = <index_of> newvalue = <clean_string> 
		whitelist_player_array = <temp_array> 
	ENDIF 
	dialog_box_exit 
	launch_player_list_menu 
ENDSCRIPT

SCRIPT clear_blacklist_array 
	temp_array = blacklist_player_array 
	GetArraySize ( <temp_array> ) 
	index = 0 
	BEGIN 
		SetArrayElement arrayname = temp_array index = <index> newvalue = "" 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	blacklist_player_array = <temp_array> 
ENDSCRIPT

SCRIPT get_index_of 
	IF NOT GotParam array 
		RETURN index_of = -1 
	ENDIF 
	exist = -1 
	index = 0 
	GetArraySize ( <array> ) 
	BEGIN 
		IF ( ( <array> [ <index> ] ) = "" ) 
			IF GotParam empty_index 
				<exist> = 1 
				BREAK 
			ENDIF 
		ELSE 
			IF GotParam Name 
				IF ( ( <array> [ <index> ] ) = <Name> ) 
					<exist> = 1 
					BREAK 
				ENDIF 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN index_of = <index> 
ENDSCRIPT

SCRIPT launch_pin_entry_menu 
	DestroyScreenElement id = current_menu_anchor 
	create_pin_entry_menu 
ENDSCRIPT

SCRIPT show_nat_start_dialog 
	create_dialog_box { title = net_status_msg 
		text = net_status_locating 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_join_server pad_choose_params = { cancel_nn } } 
		] 
	} 
ENDSCRIPT

SCRIPT show_nat_timeout 
	dialog_box_exit 
	create_dialog_box { title = net_error_msg 
		text = net_status_nat_neg_failed 
		buttons = [ { text = "ok" pad_choose_script = cancel_join_server pad_choose_params = { cancel_nn } } 
		] 
	} 
ENDSCRIPT

nat_neg_fallback = 0 
SCRIPT NatNegotiateFallbackTimer 
	printf "NatNegotiateFallbackTimer" 
	Wait 4.50000000000 Seconds 
	IF ( nat_neg_fallback = 0 ) 
		printf "Calling NatNegotiateFallback" 
		NatNegotiateFallback 
	ENDIF 
	printf "NatNegotiateFallbackTimer ended" 
ENDSCRIPT

SCRIPT net_chosen_join_server 
	printf "******* In net_chosen_join_server *******" 
	LeaveServer 
	setservermode OFF 
	IF GotParam cookie 
		IF ObjectExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		show_nat_start_dialog 
		Change nat_neg_fallback = 0 
		printf "Spawn NatNegotiateFallbackTimer" 
		SpawnScript NatNegotiateFallbackTimer 
		IF NOT StartNatNegotiation <...> 
			IF ( nat_neg_fallback = 0 ) 
				create_join_failed_dialog 
			ENDIF 
		ENDIF 
		printf "After StartNatNegotiation" 
	ELSE 
		Change THUGPRO_IsJoiningServer = 1 
		JoinServer <...> 
	ENDIF 
	PlaySkaterCamAnim Name = skateshop_board_select_cam play_hold 
	kill_start_key_binding 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
ENDSCRIPT

SCRIPT lobby_list_animate_in id = lobby_list_anchor 
	DoScreenElementMorph id = <id> pos = PAIR(-5.00000000000, 0.00000000000) time = 0.30000001192 
ENDSCRIPT

SCRIPT regions_menu_set_focus 
	generic_menu_update_arrows { 
		up_arrow_id = regions_up_arrow 
		down_arrow_id = regions_down_arrow 
	} 
	lobby_list_vmenu : GetTags 
	IF GotParam arrow_id 
		menu_vert_blink_arrow { id = <arrow_id> } 
	ENDIF 
	main_theme_focus <...> 
ENDSCRIPT

SCRIPT create_pin_entry_menu 
	make_new_menu menu_id = pin_entry_menu vmenu_id = pin_entry_vmenu menu_title = "ENTER PIN" 
	SetScreenElementLock id = root_window OFF 
	SetScreenElementProps { id = pin_entry_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = do_nothing } } 
		] 
	} 
	RunScriptOnScreenElement id = main_menu_anchor menu_onscreen 
ENDSCRIPT

SCRIPT back_from_regions_menu 
	IF ObjectExists id = lobby_list_anchor 
		FireEvent type = unfocus target = lobby_list_menu 
		FireEvent type = focus target = sub_menu 
		AssignAlias id = menu_parts_anchor alias = current_menu_anchor 
		DoScreenElementMorph id = lobby_list_anchor pos = PAIR(-5.00000000000, 800.00000000000) time = 0.30000001192 
		Wait 0.30000001192 Seconds 
		DestroyScreenElement id = lobby_list_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_lobbies 
	StopServerList 
	FreeServerList 
	LobbyDisconnect 
	CancelNatNegotiation 
	back_from_regions_menu_update 
ENDSCRIPT

SCRIPT back_from_multiplayer_menu 
	StopServerList 
	FreeServerList 
	back_from_network_select_menu <...> 
ENDSCRIPT

SCRIPT back_from_network_menu 
	create_console_message { text = "OH SHIT! What did you do???" } 
	StopServerList 
	FreeServerList 
	DestroyScreenElement id = current_menu_anchor 
	select_network_play_multi 
ENDSCRIPT

SCRIPT select_host_option 
	SetPreferencesFromUI <...> 
	launch_network_host_options_menu 
ENDSCRIPT

SCRIPT select_game_option 
	IF ( <checksum> = netctf ) 
		IF NOT InTeamGame 
			SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_two string = "2" 
			SetNumTeams 2 
		ENDIF 
	ENDIF 
	SetPreferencesFromUI <...> 
	SWITCH <checksum> 
		CASE netscorechallenge 
		CASE scorechallenge 
			SWITCH score_mode 
				CASE point_scoring 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_1000000 score = 1000000 string = "1,000,000 points" 
				CASE tag_scoring 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_10 score = 10 string = "10 tags" 
			ENDSWITCH 
		CASE gold 
		CASE netgold 
			GetPreferenceChecksum pref_type = <prefs> ctf_game_type 
			IF ( <checksum> = score_ctf ) 
				SetPreferencesFromUI prefs = <prefs> field = "ctf_game_type" checksum = score_ctf string = "Use Score Limit" 
			ENDIF 
			SWITCH score_mode 
				CASE point_scoring 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_1000000 score = 1000000 string = "1,000,000 points" 
				CASE tag_scoring 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_10 score = 10 string = "10 tags" 
			ENDSWITCH 
		CASE king 
		CASE netking 
			SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = time_120 time = 120 string = "2:00 minutes" 
		CASE netctf 
			GetPreferenceChecksum pref_type = <prefs> ctf_game_type 
			IF ( <checksum> = score_ctf ) 
				SetPreferencesFromUI prefs = <prefs> field = "ctf_game_type" checksum = score_ctf string = "Use Capture Limit" 
			ENDIF 
			SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_5 score = 5 string = "5 captures" 
	ENDSWITCH 
	create_network_game_options_menu <...> 
ENDSCRIPT

SCRIPT game_options_goals_sub_menu_return 
	SetPreferencesFromUI prefs = network field = "goals" string = "CREATED" checksum = goals_created 
	IF NOT levelIs Load_MainMenu 
		dialog_box_exit 
		kill_start_key_binding 
		create_dialog_box { title = net_warning_msg 
			text = net_message_goals_next_level 
			buttons = [ 
				{ text = "ok" pad_choose_script = create_network_game_options_menu } 
			] 
		} 
	ELSE 
		create_network_game_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT host_options_goals_sub_menu_return 
	SetPreferencesFromUI prefs = network field = "goals" string = "CREATED" checksum = goals_created 
	IF NOT levelIs Load_MainMenu 
		dialog_box_exit 
		kill_start_key_binding 
		create_dialog_box { title = net_warning_msg 
			text = net_message_goals_next_level 
			buttons = [ 
				{ text = "ok" pad_choose_script = launch_network_host_options_menu } 
			] 
		} 
	ELSE 
		launch_network_host_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT host_options_goals_sub_menu_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT

SCRIPT create_host_options_sub_menu 
ENDSCRIPT

SCRIPT create_game_options_sub_menu 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	thugpro_menu_create { 
		menu_name = options_sub 
		menu_title = <menu_title> 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = create_network_game_options_menu <...> } 
		show_description_panel 
		boxed 
	} 
	thugpro_menu_create_background gradient 
	IF InSplitScreenGame 
		prefs = splitscreen 
	ELSE 
		prefs = network 
	ENDIF 
	IF ( <pref_field> = "game_type" ) 
		generic_array_menu_desc_setup <...> 
	ELSE 
		generic_array_menu_setup <...> 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT set_host_option_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = network <...> 
	destroy_onscreen_keyboard 
	create_network_host_options_menu 
ENDSCRIPT

SCRIPT host_options_back_from_keyboard 
	destroy_onscreen_keyboard 
	create_network_host_options_menu 
ENDSCRIPT

SCRIPT set_horse_option_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = splitscreen <...> 
	horse_word_back_from_keyboard 
ENDSCRIPT

SCRIPT horse_word_back_from_keyboard 
	destroy_onscreen_keyboard 
	create_network_game_options_menu end_run 
ENDSCRIPT

SCRIPT create_network_host_options_server_name_menu 
	GetPreferenceString pref_type = network server_name 
	DestroyScreenElement id = current_menu_anchor 
	destroy_menu_background_title 
	create_onscreen_keyboard { 
		allow_cancel 
		keyboard_cancel_script = host_options_back_from_keyboard 
		keyboard_done_script = set_host_option_preference 
		keyboard_title = "Server name" 
		field = "server_name" 
		text = <ui_string> 
		min_length = 1 
		max_length = 15 
	} 
ENDSCRIPT

SCRIPT create_network_host_options_password_menu 
	GetPreferenceString pref_type = network password 
	DestroyScreenElement id = current_menu_anchor 
	destroy_menu_background_title 
	create_onscreen_keyboard { 
		password 
		allow_cancel 
		keyboard_cancel_script = host_options_back_from_keyboard 
		keyboard_done_script = set_host_option_preference 
		keyboard_title = "Password" 
		field = "password" 
		text = <ui_string> 
		min_length = 0 
		max_length = 9 
	} 
ENDSCRIPT

SCRIPT tp_host_option_cycle_num_players 
	GetTags 
	GetPreferenceChecksum pref_type = network num_players 
	IF GotParam Right 
		SWITCH <checksum> 
			CASE num_2 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_3 value = 3 string = "3 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "3 Players" 
			CASE num_3 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_4 value = 4 string = "4 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "4 Players" 
			CASE num_4 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_5 value = 5 string = "5 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "5 Players" 
			CASE num_5 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_6 value = 6 string = "6 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "6 Players" 
			CASE num_6 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_7 value = 7 string = "7 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "7 Players" 
			CASE num_7 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_8 value = 8 string = "8 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "8 Players" 
			CASE num_8 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_2 value = 2 string = "2 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "2 Players" 
			DEFAULT 
		ENDSWITCH 
	ELSE 
		SWITCH <checksum> 
			CASE num_2 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_8 value = 8 string = "8 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "8 Players" 
			CASE num_3 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_2 value = 2 string = "2 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "2 Players" 
			CASE num_4 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_3 value = 3 string = "3 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "3 Players" 
			CASE num_5 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_4 value = 4 string = "4 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "4 Players" 
			CASE num_6 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_5 value = 5 string = "5 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "5 Players" 
			CASE num_7 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_6 value = 6 string = "6 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "6 Players" 
			CASE num_8 
				SetPreferencesFromUI prefs = network field = "num_players" checksum = num_7 value = 7 string = "7 Players" 
				thugpro_menu_item_update_extra_text id = <id> text = "7 Players" 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT tp_host_option_cycle_num_observers 
	GetTags 
	GetPreferenceChecksum pref_type = network num_observers 
	IF GotParam Right 
		SWITCH <checksum> 
			CASE num_0 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_1 value = 1 string = "1 Observer" 
				thugpro_menu_item_update_extra_text id = <id> text = "1 Observer" 
			CASE num_1 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_2 value = 2 string = "2 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "2 Observers" 
			CASE num_2 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_3 value = 3 string = "3 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "3 Observers" 
			CASE num_3 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_4 value = 4 string = "4 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "4 Observers" 
			CASE num_4 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_5 value = 5 string = "5 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "5 Observers" 
			CASE num_5 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_6 value = 6 string = "6 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "6 Observers" 
			CASE num_6 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_7 value = 7 string = "7 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "7 Observers" 
			CASE num_7 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_8 value = 8 string = "8 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "8 Observers" 
			CASE num_8 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_0 value = 0 string = "No Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "No Observers" 
			DEFAULT 
		ENDSWITCH 
	ELSE 
		SWITCH <checksum> 
			CASE num_0 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_8 value = 8 string = "8 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "8 Observers" 
			CASE num_1 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_0 value = 0 string = "No Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "No Observers" 
			CASE num_2 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_1 value = 1 string = "1 Observer" 
				thugpro_menu_item_update_extra_text id = <id> text = "1 Observer" 
			CASE num_3 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_2 value = 2 string = "2 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "2 Observers" 
			CASE num_4 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_3 value = 3 string = "3 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "3 Observers" 
			CASE num_5 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_4 value = 4 string = "4 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "4 Observers" 
			CASE num_6 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_5 value = 5 string = "5 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "5 Observers" 
			CASE num_7 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_6 value = 6 string = "6 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "6 Observers" 
			CASE num_8 
				SetPreferencesFromUI prefs = network field = "num_observers" checksum = num_7 value = 7 string = "7 Observers" 
				thugpro_menu_item_update_extra_text id = <id> text = "7 Observers" 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT tp_host_option_cycle_skill_level 
	GetTags 
	GetPreferenceChecksum pref_type = network skill_level 
	IF GotParam Right 
		SWITCH <checksum> 
			CASE num_1 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_2 string = "2: I Can Crawl!" 
				thugpro_menu_item_update_extra_text id = <id> text = "2: I Can Crawl!" 
			CASE num_2 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_3 string = "3: Hold My Own" 
				thugpro_menu_item_update_extra_text id = <id> text = "3: Hold My Own" 
			CASE num_3 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_4 string = "4: Let\'s Do This" 
				thugpro_menu_item_update_extra_text id = <id> text = "4: Let\'s Do This" 
			CASE num_4 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_5 string = "5: Bring It On!" 
				thugpro_menu_item_update_extra_text id = <id> text = "5: Bring It On!" 
			CASE num_5 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_1 string = "1: Baby Steps" 
				thugpro_menu_item_update_extra_text id = <id> text = "1: Baby Steps" 
			DEFAULT 
		ENDSWITCH 
	ELSE 
		SWITCH <checksum> 
			CASE num_1 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_5 string = "5: Bring It On!" 
				thugpro_menu_item_update_extra_text id = <id> text = "5: Bring It On!" 
			CASE num_2 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_1 string = "1: Baby Steps" 
				thugpro_menu_item_update_extra_text id = <id> text = "1: Baby Steps" 
			CASE num_3 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_2 string = "2: I Can Crawl!" 
				thugpro_menu_item_update_extra_text id = <id> text = "2: I Can Crawl!" 
			CASE num_4 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_3 string = "3: Hold My Own" 
				thugpro_menu_item_update_extra_text id = <id> text = "3: Hold My Own" 
			CASE num_5 
				SetPreferencesFromUI prefs = network field = "skill_level" checksum = num_4 string = "4: Let\'s Do This" 
				thugpro_menu_item_update_extra_text id = <id> text = "4: Let\'s Do This" 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT tp_host_option_cycle_player_collision 
	GetTags 
	GetPreferenceString pref_type = network player_collision 
	IF ( <ui_string> = "Off" ) 
		SetPreferencesFromUI prefs = network field = "player_collision" checksum = boolean_true string = "On" 
		thugpro_menu_item_update_extra_text id = <id> text = "On" 
	ELSE 
		SetPreferencesFromUI prefs = network field = "player_collision" checksum = boolean_false string = "Off" 
		thugpro_menu_item_update_extra_text id = <id> text = "Off" 
	ENDIF 
ENDSCRIPT

SCRIPT tp_host_option_cycle_team_mode 
	GetTags 
	GetPreferenceChecksum pref_type = network team_mode 
	IF GotParam Right 
		SWITCH <checksum> 
			CASE teams_four 
				printf "SetNumTeams 0" 
				SetNumTeams 0 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_none string = "None" 
				thugpro_menu_item_update_extra_text id = <id> text = "None" 
			CASE teams_none 
				printf "SetNumTeams 2" 
				SetNumTeams 2 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_two string = "2" 
				thugpro_menu_item_update_extra_text id = <id> text = "2" 
			CASE teams_two 
				printf "SetNumTeams 3" 
				SetNumTeams 3 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_three string = "3" 
				thugpro_menu_item_update_extra_text id = <id> text = "3" 
			CASE teams_three 
				printf "SetNumTeams 4" 
				SetNumTeams 4 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_four string = "4" 
				thugpro_menu_item_update_extra_text id = <id> text = "4" 
			DEFAULT 
		ENDSWITCH 
	ELSE 
		SWITCH <checksum> 
			CASE teams_four 
				printf "SetNumTeams 3" 
				SetNumTeams 3 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_three string = "3" 
				thugpro_menu_item_update_extra_text id = <id> text = "3" 
			CASE teams_three 
				printf "SetNumTeams 2" 
				SetNumTeams 2 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_two string = "2" 
				thugpro_menu_item_update_extra_text id = <id> text = "2" 
			CASE teams_two 
				printf "SetNumTeams 0" 
				SetNumTeams 0 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_none string = "None" 
				thugpro_menu_item_update_extra_text id = <id> text = "None" 
			CASE teams_none 
				printf "SetNumTeams 4" 
				SetNumTeams 4 
				SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_four string = "4" 
				thugpro_menu_item_update_extra_text id = <id> text = "4" 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT create_mp_game_options_game_type_menu 
	create_game_options_sub_menu { 
		menu_title = "GAME TYPE" 
		pref_type = splitscreen 
		pref_field = "game_type" 
		array = mp_game_type_info 
		call_script = select_game_option 
		helper_text = generic_helper_text 
		<...> 
	} 
ENDSCRIPT

SCRIPT create_network_game_options_game_type_menu 
	create_game_options_sub_menu { 
		menu_title = "GAME TYPE" 
		pref_type = network 
		pref_field = "game_type" 
		array = net_game_type_info 
		call_script = select_game_option 
		helper_text = generic_helper_text 
		<...> 
	} 
ENDSCRIPT

SCRIPT create_network_game_options_goal_type_menu 
	create_game_options_sub_menu { 
		menu_title = "GOAL TYPE" 
		pref_type = <prefs> 
		pref_field = "goals" 
		array = net_goal_info 
		call_script = network_game_options_goal_type_select 
		helper_text = generic_helper_text 
		<...> 
	} 
ENDSCRIPT

SCRIPT network_game_options_goal_type_select 
	GoalManager_DeselectAllGoals 
	select_game_option <...> 
ENDSCRIPT

SCRIPT Get_firefight_projectile_text 
	SWITCH firefight_projectile_type 
		CASE fireball 
			<projectile_text> = "Fireballs" 
		CASE rocket 
			<projectile_text> = "Rockets" 
		CASE snowball 
			<projectile_text> = "Snowballs" 
		DEFAULT 
			<projectile_text> = "_Fireballs" 
	ENDSWITCH 
	RETURN projectile_text = <projectile_text> 
ENDSCRIPT

SCRIPT tp_host_option_cycle_firefight_ammo 
	GetTags 
	IF GotParam Right 
		SWITCH ( firefight_projectile_type ) 
			CASE fireball 
				Change firefight_projectile_type = rocket 
			CASE rocket 
				Change firefight_projectile_type = snowball 
			CASE snowball 
				Change firefight_projectile_type = fireball 
		ENDSWITCH 
	ELSE 
		SWITCH ( firefight_projectile_type ) 
			CASE fireball 
				Change firefight_projectile_type = snowball 
			CASE rocket 
				Change firefight_projectile_type = fireball 
			CASE snowball 
				Change firefight_projectile_type = rocket 
		ENDSWITCH 
	ENDIF 
	Get_firefight_projectile_text 
	thugpro_menu_item_update_extra_text id = <id> text = <projectile_text> 
ENDSCRIPT

SCRIPT tp_host_option_cycle_scavenger_object 
	GetTags 
	IF GotParam Right 
		SWITCH TP_Scavenger_Hunt_Model 
			CASE TP_Scavenger_Hunt_Model_Coin 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Cash 
				thugpro_menu_item_update_extra_text id = <id> text = "Cash" 
			CASE TP_Scavenger_Hunt_Model_Cash 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Treasure_Chest 
				thugpro_menu_item_update_extra_text id = <id> text = "Treasure Chest" 
			CASE TP_Scavenger_Hunt_Model_Treasure_Chest 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_SkateBoard 
				thugpro_menu_item_update_extra_text id = <id> text = "Skateboards" 
			CASE TP_Scavenger_Hunt_Model_SkateBoard 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Food 
				thugpro_menu_item_update_extra_text id = <id> text = "Food" 
			CASE TP_Scavenger_Hunt_Model_Food 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Coin 
				thugpro_menu_item_update_extra_text id = <id> text = "Coin" 
			DEFAULT 
		ENDSWITCH 
	ELSE 
		SWITCH TP_Scavenger_Hunt_Model 
			CASE TP_Scavenger_Hunt_Model_Coin 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Food 
				thugpro_menu_item_update_extra_text id = <id> text = "Food" 
			CASE TP_Scavenger_Hunt_Model_Food 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_SkateBoard 
				thugpro_menu_item_update_extra_text id = <id> text = "Skateboards" 
			CASE TP_Scavenger_Hunt_Model_SkateBoard 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Treasure_Chest 
				thugpro_menu_item_update_extra_text id = <id> text = "Treasure Chest" 
			CASE TP_Scavenger_Hunt_Model_Treasure_Chest 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Cash 
				thugpro_menu_item_update_extra_text id = <id> text = "Cash" 
			CASE TP_Scavenger_Hunt_Model_Cash 
				Change TP_Scavenger_Hunt_Model = TP_Scavenger_Hunt_Model_Coin 
				thugpro_menu_item_update_extra_text id = <id> text = "Coin" 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT create_mp_game_options_horse_time_menu 
	create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = splitscreen pref_field = "horse_time_limit" array = horse_time_limit_options call_script = select_game_option helper_text = generic_helper_text prefs = splitscreen <...> 
ENDSCRIPT

horse_allowed_characters = [ 
	"1" "2" "3" "4" "5" "6" "7" "8" "9" "0" 
	"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" 
	"k" "l" "m" "n" "o" "p" "q" "r" "s" "t" 
	"u" "v" "w" "x" "y" "z" 
	"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" 
	"K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" 
	"U" "V" "W" "X" "Y" "Z" 
	"." "," "!" "?" "-" "\xC3\x1A\xC2\xA6" "\'" "+" "^" 
	"#" "$" "*" "@" "`" "&" ":" "<" ">" 
	"_" "-" "=" "(" ")" "/" 
	"\xC3\x92\xC2x" "\xC3\x92\xC2\x1E" "\xC3\x92\xC2S" "\xC3\x92\xC2\x13" "\xC3\x92\xC2\xA0" "\xC3\x92\xC2\xA2" "\xC3\x92\xC2\xAA" "\xC3\x92\xC2\xA8" "\xC3\x92\xC2\xA9" "\xC3\x92\xC2\xAB" 
	"\xC3\x92\xC2\xAC" "\xC3\x92\xC2\xAE" "\xC3\x92\xC2\xAF" "\xC3\x92\xC2\xB4" "\xC3\x92\xC2\xB2" "\xC3\x92\xC2\x13" "\xC3\x92\xC2\xB9" "\xC3\x92\xC2\xBB" "\xC3\x92\xC2S" "\xC3\x92\xC2\xA7" 
	"\xC3&\xC2\x1C" "\xC3\x92\xC2\xBC" "\xC3\x92\xC2\xA4" "\xC3\x92\xC2\xB6" "\xC3\x1A\xC2\xBC" "\xC3\x1A\xC2\xBD" "\xC3\x1A\xC2\xBE" "\xC3\x1A\xC2\xA2" "\xC3\x1A\xC2\xBA" "\xC3\x1A\xC2\xAE" 
	"\xC3\x1A\xC2\xA1" "\xC3\x1A\xC2\xBF" "\xC3\x1A\xC2\xA3" "\xC3\x1A\xC2\xA5" "\xC3\x1A\xC2\xA7" "\xC3\x1A\xC2\xA9" 
] 
SCRIPT create_mp_game_options_horse_word_menu 
	GetPreferenceString pref_type = splitscreen horse_word 
	create_onscreen_keyboard { 
		allow_cancel 
		allowed_characters = horse_allowed_characters 
		keyboard_cancel_script = horse_word_back_from_keyboard 
		keyboard_done_script = set_horse_option_preference 
		keyboard_title = "Horse word" 
		field = "horse_word" 
		text = <ui_string> 
		min_length = 1 
		max_length = 15 
	} 
ENDSCRIPT

SCRIPT create_network_game_options_menu 
	dialog_box_exit 
	hide_current_goal 
	prefs = network 
	hide_net_player_names on 
	kill_start_key_binding 
	IF GotParam end_run 
		<pad_back_script> = create_end_run_menu 
	ELSE 
		<pad_back_script> = create_pause_menu 
	ENDIF 
	thugpro_menu_create { 
		menu_name = sub 
		menu_title = "Game Setup" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = <pad_back_script> } 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	GetPreferenceString pref_type = <prefs> game_type 
	IF InNetGame 
		make_thugpro_menu_item { 
			text = "Game Type" 
			extra_text = <ui_string> 
			id = menu_network_host_options_game_type 
			pad_choose_script = launch_network_host_options_sub_menu 
			pad_choose_params = { sub_menu_script = create_network_game_options_game_type_menu } 
		} 
	ELSE 
		IF GotParam end_run 
			<end_run> = end_run 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Game Type" 
			extra_text = <ui_string> 
			id = menu_network_host_options_game_type 
			pad_choose_script = launch_network_host_options_sub_menu 
			pad_choose_params = { <end_run> sub_menu_script = create_mp_game_options_game_type_menu } 
		} 
	ENDIF 
	GetPreferenceChecksum pref_type = <prefs> game_type 
	SWITCH <checksum> 
		CASE netgoalattack 
			IF IsTrue LEVEL_DISABLE_GOAL_ATTACK 
				<focus> = not_focusable 
				GetPreferenceChecksum pref_type = <prefs> goals 
				IF ( <checksum> = goals_created ) 
					SetPreferencesFromUI { prefs = network field = "goals" checksum = goals_classic string = "Classic Goals" } 
				ENDIF 
			ENDIF 
			GetPreferenceString pref_type = <prefs> goals 
			make_thugpro_menu_item { 
				text = "Goal Type" 
				extra_text = <ui_string> 
				id = menu_network_host_options_choose_goal_type 
				option_arrows pad_choose <focus> 
				option_arrows_callback = toggle_LR_mode 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_choose_goal_type 
					id_check = goals 
					id_field = "goals" 
				} 
			} 
			pad_choose_script = launch_network_host_options_sub_menu 
			pad_choose_params = { sub_menu_script = create_network_game_options_ctf_mode_menu prefs = <prefs> } 
			make_thugpro_menu_item { 
				text = "Choose Goals" 
				id = menu_network_host_options_choose_goals 
				pad_choose_script = create_choose_goals_menu 
			} 
			IF OnServer 
				GetPreferenceChecksum pref_type = <prefs> goals 
				IF ( <checksum> = goals_created ) 
					make_thugpro_menu_item { 
						text = "Load Created Goals" 
						pad_choose_script = host_options_goals_sub_menu_exit 
						pad_choose_params = { 
							new_menu_script = launch_load_created_goals_from_game_options_menu 
							from_game_options = from_game_options 
						} 
					} 
				ENDIF 
			ENDIF 
			IF GoalManager_GoalsAreSelected 
				make_thugpro_menu_item { 
					text = "Ready" 
					id = menu_network_host_options_ready 
					pad_choose_script = chosen_host_game 
				} 
			ELSE 
				make_thugpro_menu_item { 
					text = "Ready" 
					id = menu_network_host_options_ready 
					pad_choose_script = chosen_host_game 
					not_focusable 
				} 
			ENDIF 
		CASE horse 
		CASE nethorse 
			GetPreferenceString pref_type = <prefs> horse_time_limit 
			make_thugpro_menu_item { 
				text = "Time Limit" 
				extra_text = <ui_string> 
				id = menu_network_host_options_time_limit 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_game_time 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_time_limit 
					id_check = time_limit 
					id_field = "time_limit" 
				} 
			} 
			GetPreferenceString pref_type = <prefs> horse_word 
			make_thugpro_menu_item { 
				text = "Horse Word" 
				extra_text = <ui_string> 
				id = menu_network_host_options_horse_word 
				pad_choose_script = launch_network_host_options_sub_menu 
				pad_choose_params = { end_run sub_menu_script = create_mp_game_options_horse_word_menu } 
			} 
		CASE freeskate2p 
			make_thugpro_menu_item { 
				text = "Ready" 
				id = menu_network_host_options_ready 
				pad_choose_script = chosen_host_game 
			} 
		CASE graffiti 
		CASE netgraffiti 
			IF InTeamGame 
				GetPreferenceString pref_type = <prefs> team_graffiti_mode 
				make_thugpro_menu_item { 
					text = "Scoring Mode" 
					extra_text = <ui_string> 
					id = menu_network_host_options_scoring_mode 
					option_arrows pad_choose 
					option_arrows_callback = toggle_LR_mode 
					option_arrows_callback_params = { 
						id_id = menu_network_host_options_scoring_mode 
						id_check = team_graffiti_mode 
						id_field = "team_graffiti_mode" 
					} 
				} 
			ENDIF 
			GetPreferenceString pref_type = <prefs> time_limit 
			make_thugpro_menu_item { 
				text = "Time Limit" 
				extra_text = <ui_string> 
				id = menu_network_host_options_time_limit 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_game_time 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_time_limit 
					id_check = time_limit 
					id_field = "time_limit" 
				} 
			} 
			GetPreferenceString pref_type = <prefs> stop_at_zero 
			make_thugpro_menu_item { 
				text = "Stop at Zero" 
				extra_text = <ui_string> 
				id = menu_network_host_options_stop_at_zero 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_boolean 
				option_arrows_callback_params = { 
					yesno 
					id_id = menu_network_host_options_stop_at_zero 
					id_check = stop_at_zero 
					id_field = "stop_at_zero" 
				} 
			} 
		CASE combomambo 
		CASE netcombomambo 
			GetPreferenceString pref_type = <prefs> time_limit 
			make_thugpro_menu_item { 
				text = "Time Limit" 
				extra_text = <ui_string> 
				id = menu_network_host_options_time_limit 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_game_time 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_time_limit 
					id_check = time_limit 
					id_field = "time_limit" 
				} 
			} 
			GetPreferenceString pref_type = <prefs> stop_at_zero 
			make_thugpro_menu_item { 
				text = "Stop at Zero" 
				extra_text = <ui_string> 
				id = menu_network_host_options_stop_at_zero 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_boolean 
				option_arrows_callback_params = { 
					yesno 
					id_id = menu_network_host_options_stop_at_zero 
					id_check = stop_at_zero 
					id_field = "stop_at_zero" 
				} 
			} 
		CASE scorechallenge 
		CASE netscorechallenge 
			IF ( score_mode = point_scoring ) 
				mode_str = "Point Scoring" 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					mode_str = "Tag Scoring" 
				ENDIF 
			ENDIF 
			GetLevelStructureName 
			IF NOT StructureContains structure = <level_structure_name> DisableGraffiti 
				make_thugpro_menu_item { 
					text = "Mode" 
					extra_text = <mode_str> 
					id = MoreOptions_menu_score_type 
					option_arrows pad_choose 
					option_arrows_callback = change_score_type 
				} 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					Change score_mode = point_scoring 
				ENDIF 
			ENDIF 
			SWITCH score_mode 
				CASE point_scoring 
					IF GotParam end_run 
						<end_run> = end_run 
					ENDIF 
					GetPreferenceString pref_type = <prefs> target_score 
					make_thugpro_menu_item { 
						text = "Target Score" 
						extra_text = <ui_string> 
						id = menu_network_host_options_target_score 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_value 
						option_arrows_callback_params = { 
							<end_run> 
							min = 100000 
							max = 1000000000 
							step = 100000 
							id_id = menu_network_host_options_target_score 
							id_check = target_score 
							id_field = "target_score" 
						} 
					} 
				CASE tag_scoring 
					IF GotParam end_run 
						<end_run> = end_run 
					ENDIF 
					GetPreferenceString pref_type = <prefs> target_score 
					make_thugpro_menu_item { 
						text = "Target Score" 
						extra_text = <ui_string> 
						id = menu_network_host_options_target_graff 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_value 
						option_arrows_callback_params = { 
							<end_run> 
							min = 1 
							max = 200 
							step = 1 
							id_id = menu_network_host_options_target_graff 
							id_check = target_score 
							id_field = "target_score" 
						} 
					} 
			ENDSWITCH 
		CASE elimiskate 
		CASE netelimiskate 
			GetPreferenceString pref_type = <prefs> time_limit 
			make_thugpro_menu_item { 
				text = "Time Limit" 
				extra_text = <ui_string> 
				id = menu_network_host_options_time_limit 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_game_time 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_time_limit 
					id_check = time_limit 
					id_field = "time_limit" 
				} 
			} 
			IF ( score_mode = point_scoring ) 
				mode_str = "Point Scoring" 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					mode_str = "Tag Scoring" 
				ENDIF 
			ENDIF 
			GetLevelStructureName 
			IF NOT StructureContains structure = <level_structure_name> DisableGraffiti 
				make_thugpro_menu_item { 
					text = "Mode" 
					extra_text = <mode_str> 
					id = MoreOptions_menu_score_type 
					option_arrows pad_choose 
					option_arrows_callback = change_score_type 
				} 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					Change score_mode = point_scoring 
				ENDIF 
			ENDIF 
			IF ( score_mode = point_scoring ) 
				GetPreferenceString pref_type = <prefs> score_reset 
				make_thugpro_menu_item { 
					text = "Score Reset" 
					extra_text = <ui_string> 
					id = menu_network_host_options_score_reset 
					option_arrows pad_choose 
					option_arrows_callback = toggle_LR_boolean 
					option_arrows_callback_params = { 
						yesno 
						id_id = menu_network_host_options_score_reset 
						id_check = score_reset 
						id_field = "score_reset" 
					} 
				} 
			ENDIF 
		CASE king 
		CASE netking 
			IF GotParam end_run 
				<end_run> = end_run 
			ENDIF 
			GetPreferenceString pref_type = <prefs> target_score 
			make_thugpro_menu_item { 
				text = "Time Limit" 
				extra_text = <ui_string> 
				id = menu_network_host_options_target_score 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_game_time 
				option_arrows_callback_params = { 
					<end_run> 
					id_id = menu_network_host_options_target_score 
					id_check = target_score 
					id_field = "target_score" 
				} 
			} 
		CASE netctf 
			GetPreferenceString pref_type = <prefs> ctf_game_type 
			make_thugpro_menu_item { 
				text = "Mode" 
				extra_text = <ui_string> 
				id = menu_network_host_options_ctf_mode 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_mode 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_ctf_mode 
					id_check = ctf_game_type 
					id_field = "ctf_game_type" 
				} 
			} 
			GetPreferenceChecksum pref_type = <prefs> ctf_game_type 
			SWITCH <checksum> 
				CASE timed_ctf 
					GetPreferenceString pref_type = <prefs> time_limit 
					make_thugpro_menu_item { 
						text = "Time Limit" 
						extra_text = <ui_string> 
						id = menu_network_host_options_time_limit 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_game_time 
						option_arrows_callback_params = { 
							id_id = menu_network_host_options_time_limit 
							id_check = time_limit 
							id_field = "time_limit" 
						} 
					} 
				CASE score_ctf 
					GetPreferenceString pref_type = <prefs> target_score 
					make_thugpro_menu_item { 
						text = "Captures" 
						extra_text = <ui_string> 
						id = menu_network_host_options_target_score 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_value 
						option_arrows_callback_params = { 
							IsCTF 
							min = 1 
							max = 50 
							id_id = menu_network_host_options_target_score 
							id_check = target_score 
							id_field = "target_score" 
						} 
					} 
			ENDSWITCH 
			GetPreferenceChecksum pref_type = <prefs> ctf_game_type 
			SWITCH <checksum> 
				CASE timed_ctf 
					GetPreferenceString pref_type = <prefs> stop_at_zero 
					make_thugpro_menu_item { 
						text = "Stop at Zero" 
						extra_text = <ui_string> 
						id = menu_network_host_options_stop_at_zero 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_boolean 
						option_arrows_callback_params = { 
							yesno 
							id_id = menu_network_host_options_stop_at_zero 
							id_check = stop_at_zero 
							id_field = "stop_at_zero" 
						} 
					} 
			ENDSWITCH 
		CASE firefight 
		CASE netfirefight 
			IF InNetGame 
				Get_firefight_projectile_text 
				IF NOT GameModeEquals is_lobby 
					<focusable> = not_focusable 
				ENDIF 
				make_thugpro_menu_item { 
					text = "Ammo type" 
					extra_text = <projectile_text> 
					id = menu_network_host_options_firefight_ammo 
					option_arrows pad_choose 
					option_arrows_callback = tp_host_option_cycle_firefight_ammo 
					<focusable> 
				} 
				GetPreferenceString pref_type = <prefs> friendly_fire 
				make_thugpro_menu_item { 
					text = "Friendly Fire" 
					extra_text = <ui_string> 
					id = menu_network_host_options_friendly_fire 
					option_arrows pad_choose 
					option_arrows_callback = toggle_LR_boolean 
					option_arrows_callback_params = { 
						onoff 
						id_id = menu_network_host_options_friendly_fire 
						id_check = friendly_fire 
						id_field = "friendly_fire" 
					} 
				} 
				GetPreferenceString pref_type = <prefs> fireball_difficulty 
				make_thugpro_menu_item { 
					text = "Fireball Combo Level" 
					extra_text = <ui_string> 
					id = menu_network_host_options_fireball_difficulty 
					option_arrows pad_choose 
					option_arrows_callback = toggle_LR_value 
					option_arrows_callback_params = { 
						min = 1 
						max = 5 
						id_id = menu_network_host_options_fireball_difficulty 
						id_check = fireball_difficulty 
						id_field = "fireball_difficulty" 
					} 
				} 
			ENDIF 
		CASE netscavengerhunt 
			SWITCH TP_Scavenger_Hunt_Model 
				CASE TP_Scavenger_Hunt_Model_Coin 
					extra_text = "Coin" 
				CASE TP_Scavenger_Hunt_Model_Cash 
					extra_text = "Cash" 
				CASE TP_Scavenger_Hunt_Model_Treasure_Chest 
					extra_text = "Treasure Chest" 
				CASE TP_Scavenger_Hunt_Model_SkateBoard 
					extra_text = "Skateboards" 
				CASE TP_Scavenger_Hunt_Model_Food 
					extra_text = "Food" 
				DEFAULT 
					extra_text = "\\c2ERROR!" 
			ENDSWITCH 
			IF NOT GameModeEquals is_lobby 
				<focusable> = not_focusable 
			ENDIF 
			make_thugpro_menu_item { 
				text = "Collect" 
				extra_text = <extra_text> 
				id = menu_network_host_options_scavenger_objects 
				option_arrows pad_choose 
				option_arrows_callback = tp_host_option_cycle_scavenger_object 
				<focusable> 
			} 
			IF GotParam end_run 
				<end_run> = end_run 
			ENDIF 
			GetPreferenceString pref_type = <prefs> time_limit 
			make_thugpro_menu_item { 
				text = "Time Limit" 
				extra_text = <ui_string> 
				id = menu_network_host_options_time_limit 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_game_time 
				option_arrows_callback_params = { 
					<end_run> 
					id_id = menu_network_host_options_time_limit 
					id_check = time_limit 
					id_field = "time_limit" 
				} 
			} 
			GetPreferenceString pref_type = <prefs> stop_at_zero 
			make_thugpro_menu_item { 
				text = "Stop at Zero" 
				extra_text = <ui_string> 
				id = menu_network_host_options_stop_at_zero 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_boolean 
				option_arrows_callback_params = { 
					yesno 
					id_id = menu_network_host_options_stop_at_zero 
					id_check = stop_at_zero 
					id_field = "stop_at_zero" 
				} 
			} 
		CASE gold 
		CASE netgold 
			GetPreferenceString pref_type = <prefs> ctf_game_type 
			make_thugpro_menu_item { 
				text = "Mode" 
				extra_text = <ui_string> 
				id = menu_network_host_options_ctf_mode 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_mode 
				option_arrows_callback_params = { 
					id_id = menu_network_host_options_ctf_mode 
					id_check = ctf_game_type 
					id_field = "ctf_game_type" 
				} 
			} 
			GetPreferenceChecksum pref_type = <prefs> ctf_game_type 
			IF ( <checksum> = timed_ctf ) 
				IF GotParam end_run 
					<end_run> = end_run 
				ENDIF 
				GetPreferenceString pref_type = <prefs> time_limit 
				make_thugpro_menu_item { 
					text = "Time Limit" 
					extra_text = <ui_string> 
					id = menu_network_host_options_time_limit 
					option_arrows pad_choose 
					option_arrows_callback = toggle_LR_game_time 
					option_arrows_callback_params = { 
						<end_run> 
						id_id = menu_network_host_options_time_limit 
						id_check = time_limit 
						id_field = "time_limit" 
					} 
				} 
				GetPreferenceString pref_type = <prefs> stop_at_zero 
				make_thugpro_menu_item { 
					text = "Stop at Zero" 
					extra_text = <ui_string> 
					id = menu_network_host_options_stop_at_zero 
					option_arrows pad_choose 
					option_arrows_callback = toggle_LR_boolean 
					option_arrows_callback_params = { 
						yesno 
						id_id = menu_network_host_options_stop_at_zero 
						id_check = stop_at_zero 
						id_field = "stop_at_zero" 
					} 
				} 
			ENDIF 
			IF ( score_mode = point_scoring ) 
				mode_str = "Point Scoring" 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					mode_str = "Tag Scoring" 
				ENDIF 
			ENDIF 
			GetLevelStructureName 
			IF NOT StructureContains structure = <level_structure_name> DisableGraffiti 
				make_thugpro_menu_item { 
					text = "Score Mode" 
					extra_text = <mode_str> 
					id = MoreOptions_menu_score_type 
					option_arrows pad_choose 
					option_arrows_callback = change_score_type 
				} 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					Change score_mode = point_scoring 
				ENDIF 
			ENDIF 
			SWITCH score_mode 
				CASE point_scoring 
					GetPreferenceString pref_type = <prefs> target_score 
					IF GotParam end_run 
						<end_run> = end_run 
					ENDIF 
					make_thugpro_menu_item { 
						text = "Target Score" 
						extra_text = <ui_string> 
						id = menu_network_host_options_target_score 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_value 
						option_arrows_callback_params = { 
							<end_run> 
							min = 100000 
							max = 1000000000 
							step = 100000 
							id_id = menu_network_host_options_target_score 
							id_check = target_score 
							id_field = "target_score" 
						} 
					} 
				CASE tag_scoring 
					GetPreferenceString pref_type = <prefs> target_score 
					IF GotParam end_run 
						<end_run> = end_run 
					ENDIF 
					make_thugpro_menu_item { 
						text = "Target Score" 
						extra_text = <ui_string> 
						id = menu_network_host_options_target_graff 
						option_arrows pad_choose 
						option_arrows_callback = toggle_LR_value 
						option_arrows_callback_params = { 
							<end_run> 
							min = 1 
							max = 200 
							step = 1 
							id_id = menu_network_host_options_target_graff 
							id_check = target_score 
							id_field = "target_score" 
						} 
					} 
			ENDSWITCH 
		DEFAULT 
			GetPreferenceString pref_type = <prefs> time_limit 
			IF GotParam end_run 
				make_thugpro_menu_item { 
					text = "Time Limit" 
					extra_text = <ui_string> 
					id = menu_network_host_options_time_limit 
					option_arrows_callback = toggle_LR_game_time 
					option_arrows_callback_params = { 
						id_id = menu_network_host_options_time_limit 
						id_check = time_limit 
						id_field = "time_limit" 
					} 
					option_arrows 
					pad_choose 
				} 
			ELSE 
				make_thugpro_menu_item { 
					text = "Time Limit" 
					extra_text = <ui_string> 
					id = menu_network_host_options_time_limit 
					option_arrows_callback = toggle_LR_game_time 
					option_arrows_callback_params = { 
						id_id = menu_network_host_options_time_limit 
						id_check = time_limit 
						id_field = "time_limit" 
					} 
					option_arrows 
					pad_choose 
				} 
			ENDIF 
			GetPreferenceString pref_type = <prefs> stop_at_zero 
			make_thugpro_menu_item { 
				text = "Stop at Zero" 
				extra_text = <ui_string> 
				id = menu_network_host_options_stop_at_zero 
				option_arrows pad_choose 
				option_arrows_callback = toggle_LR_boolean 
				option_arrows_callback_params = { 
					yesno 
					id_id = menu_network_host_options_stop_at_zero 
					id_check = stop_at_zero 
					id_field = "stop_at_zero" 
				} 
			} 
	ENDSWITCH 
	GetPreferenceChecksum pref_type = <prefs> game_type 
	IF ( ( <checksum> = netgoalattack ) | ( <checksum> = freeskate2p ) ) 
	ELSE 
		make_thugpro_menu_item { 
			text = "Ready" 
			id = menu_network_host_options_ready 
			pad_choose_script = chosen_host_game 
		} 
	ENDIF 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT toggle_LR_boolean 
	prefs = network 
	GetPreferenceChecksum pref_type = <prefs> <id_check> 
	IF GotParam onoff 
		SWITCH <checksum> 
			CASE boolean_true 
				SetPreferencesFromUI prefs = <prefs> field = <id_field> checksum = boolean_false string = "Off" 
				temp_s = "Off" 
			CASE boolean_false 
				SetPreferencesFromUI prefs = <prefs> field = <id_field> checksum = boolean_true string = "On" 
				temp_s = "On" 
		ENDSWITCH 
	ELSE 
		IF GotParam yesno 
			SWITCH <checksum> 
				CASE boolean_true 
					SetPreferencesFromUI prefs = <prefs> field = <id_field> checksum = boolean_false string = "No" 
					temp_s = "No" 
				CASE boolean_false 
					SetPreferencesFromUI prefs = <prefs> field = <id_field> checksum = boolean_true string = "Yes" 
					temp_s = "Yes" 
			ENDSWITCH 
		ELSE 
			IF GotParam truefalse 
				SWITCH <checksum> 
					CASE boolean_true 
						SetPreferencesFromUI prefs = <prefs> field = <id_field> checksum = boolean_false string = "False" 
						temp_s = "False" 
					CASE boolean_false 
						SetPreferencesFromUI prefs = <prefs> field = <id_field> checksum = boolean_true string = "True" 
						temp_s = "True" 
				ENDSWITCH 
			ELSE 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	GetTags 
	thugpro_menu_item_update_extra_text id = <id> text = <temp_s> 
ENDSCRIPT

SCRIPT get_game_time_string 
	new_value = -1 
	prefs = network 
	IF NOT GotParam score 
		GetPreferenceChecksum pref_type = <prefs> target_score 
		index = 0 
		BEGIN 
			FormatText checksumname = chk "time_%s" s = <index> 
			IF ( <chk> = <checksum> ) 
				<new_value> = <index> 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT 601 
	ELSE 
		IF ( <score> > 999 ) 
			<new_value> = ( <score> / 1000 ) 
		ELSE 
			<new_value> = <score> 
		ENDIF 
	ENDIF 
	num1 = 0 
	num2 = 0 
	temp_s = "" 
	IF ( <new_value> > 59 ) 
		<num1> = ( <new_value> / 60 ) 
		<num2> = ( <new_value> - ( <num1> * 60 ) ) 
		IF ( <num2> < 10 ) 
			IF ( <num2> = 0 ) 
				IF ( <num1> = 1 ) 
					FormatText TextName = temp "%a:0%b minute" a = <num1> b = <num2> 
				ELSE 
					FormatText TextName = temp "%a:0%b minutes" a = <num1> b = <num2> 
				ENDIF 
			ELSE 
				FormatText TextName = temp "%a:0%b minutes" a = <num1> b = <num2> 
			ENDIF 
		ELSE 
			FormatText TextName = temp "%a:%b minutes" a = <num1> b = <num2> 
		ENDIF 
		<temp_s> = <temp> 
	ELSE 
		<num2> = <new_value> 
		IF ( <new_value> = 1 ) 
			FormatText TextName = temp "%a:0%b second" a = <num1> b = <num2> 
		ELSE 
			IF ( <new_value> < 10 ) 
				FormatText TextName = temp "%a:0%b seconds" a = <num1> b = <num2> 
			ELSE 
				FormatText TextName = temp "%a:%b seconds" a = <num1> b = <num2> 
			ENDIF 
		ENDIF 
		<temp_s> = <temp> 
	ENDIF 
	RETURN time_string = <temp_s> 
ENDSCRIPT

SCRIPT toggle_LR_game_time 
	min = 1 
	max = 600 
	step = 1 
	prefs = network 
	GetPreferenceChecksum pref_type = <prefs> <id_check> 
	index = <min> 
	BEGIN 
		FormatText checksumname = chk "time_%s" s = <index> 
		IF ( <chk> = <checksum> ) 
			new_value = <index> 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT ( <max> + 1 ) 
	temp_array = [ { min = 1 max = 4 step = 1 } { min = 5 max = 59 step = 5 } { min = 60 max = 299 step = 30 } { min = 300 max = 600 step = 60 } ] 
	IF GotParam Right 
		variable_step Right value = <new_value> array = <temp_array> 
	ELSE 
		IF GotParam left 
			variable_step left value = <new_value> array = <temp_array> 
		ENDIF 
	ENDIF 
	IF GotParam new_number 
		<new_value> = <new_number> 
	ENDIF 
	FormatText checksumname = chk "time_%s" s = <new_value> 
	get_game_time_string score = <new_value> 
	SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = <chk> string = <time_string> time = <new_value> } 
	GetTags 
	thugpro_menu_item_update_extra_text id = <id> text = <time_string> 
ENDSCRIPT

SCRIPT toggle_LR_value 
	IF GotParam min 
		min = <min> 
	ELSE 
		min = 0 
	ENDIF 
	IF GotParam max 
		max = <max> 
	ELSE 
		max = 1000 
	ENDIF 
	IF GotParam step 
		step = <step> 
	ELSE 
		step = 1 
	ENDIF 
	prefs = network 
	index = <min> 
	GetPreferenceChecksum pref_type = <prefs> <id_check> 
	IF ( <id_check> = fireball_difficulty ) 
		BEGIN 
			FormatText checksumname = chk "num_%s" s = <index> 
			IF ( <chk> = <checksum> ) 
				new_value = <index> 
				BREAK 
			ENDIF 
			<index> = ( <index> + <step> ) 
		REPEAT <max> 
	ELSE 
		IF ( <id_check> = target_score ) 
			BEGIN 
				FormatText checksumname = chk "score_%s" s = <index> 
				IF ( <chk> = <checksum> ) 
					new_value = <index> 
					BREAK 
				ENDIF 
				<index> = ( <index> + <step> ) 
			REPEAT <max> 
		ENDIF 
	ENDIF 
	IF ( <id_check> = target_score ) 
		IF GotParam IsCTF 
			temp_array = [ { min = 1 max = 50 step = 1 } ] 
		ELSE 
			IF ( score_mode = point_scoring ) 
				temp_array = [ { min = 100000 max = 999999 step = 100000 } { min = 1000000 max = 4999999 step = 1000000 } { min = 5000000 max = 24999999 step = 5000000 } { min = 25000000 max = 99999999 step = 25000000 } { min = 100000000 max = 1000000000 step = 100000000 } ] 
			ELSE 
				IF ( score_mode = tag_scoring ) 
					temp_array = [ { min = 1 max = 15 step = 1 } { min = 16 max = 19 step = 4 } { min = 20 max = 49 step = 5 } { min = 50 max = 200 step = 10 } ] 
				ELSE 
					temp_array = [ { min = 1 max = 100 step = 1 } ] 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		temp_array = [ { min = 1 max = 5 step = 1 } ] 
	ENDIF 
	IF GotParam Right 
		variable_step Right value = <new_value> array = <temp_array> 
	ELSE 
		IF GotParam left 
			variable_step left value = <new_value> array = <temp_array> 
		ENDIF 
	ENDIF 
	IF GotParam new_number 
		<new_value> = <new_number> 
	ENDIF 
	IF ( <id_check> = fireball_difficulty ) 
		FormatText checksumname = chk "num_%s" s = <new_value> 
		IF ( <new_value> = 1 ) 
			FormatText TextName = txt "%s (easy)" s = <new_value> 
		ELSE 
			IF ( <new_value> = 5 ) 
				FormatText TextName = txt "%s (hard)" s = <new_value> 
			ELSE 
				FormatText TextName = txt "%s" s = <new_value> 
			ENDIF 
		ENDIF 
		SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = <chk> string = <txt> fireball_level = <new_value> } 
	ELSE 
		IF ( <id_check> = target_score ) 
			GetPreferenceChecksum pref_type = <prefs> game_type 
			FormatText checksumname = chk "score_%s" s = <new_value> 
			IF ( <checksum> = netctf ) 
				IF ( <new_value> = 1 ) 
					FormatText TextName = txt "%s capture" s = <new_value> 
				ELSE 
					FormatText TextName = txt "%s captures" s = <new_value> 
				ENDIF 
			ELSE 
				IF ( ( <checksum> = netgold ) | ( <checksum> = gold ) ) 
					IF ( score_mode = tag_scoring ) 
						IF ( <new_value> = 1 ) 
							FormatText TextName = txt "%s tag" s = <new_value> 
						ELSE 
							FormatText TextName = txt "%s tags" s = <new_value> 
						ENDIF 
					ELSE 
						IF ( score_mode = point_scoring ) 
							get_points_string_with_commas score = <new_value> 
							IF ( <new_value> = 1 ) 
								FormatText TextName = txt "%s point" s = <points_string> 
							ELSE 
								FormatText TextName = txt "%s points" s = <points_string> 
							ENDIF 
						ENDIF 
					ENDIF 
				ELSE 
					IF ( ( <checksum> = netscorechallenge ) | ( <checksum> = scorechallenge ) ) 
						IF ( score_mode = tag_scoring ) 
							IF ( <new_value> = 1 ) 
								FormatText TextName = txt "%s tag" s = <new_value> 
							ELSE 
								FormatText TextName = txt "%s tags" s = <new_value> 
							ENDIF 
						ELSE 
							IF ( score_mode = point_scoring ) 
								get_points_string_with_commas score = <new_value> 
								IF ( <new_value> = 1 ) 
									FormatText TextName = txt "%s point" s = <points_string> 
								ELSE 
									FormatText TextName = txt "%s points" s = <points_string> 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = <chk> string = <txt> score = <new_value> } 
	ENDIF 
	GetTags 
	thugpro_menu_item_update_extra_text id = <id> text = <txt> 
ENDSCRIPT

SCRIPT toggle_LR_mode 
	prefs = network 
	txt = "" 
	GetPreferenceChecksum pref_type = <prefs> <id_check> 
	SWITCH <checksum> 
		CASE timed_ctf 
			GetPreferenceChecksum pref_type = <prefs> game_type 
			IF ( ( <checksum> = netgold ) | ( <checksum> = gold ) ) 
				SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = score_ctf string = "Use Score Limit" } 
				<txt> = "Use Score Limit" 
			ELSE 
				IF ( ( <checksum> = netctf ) | ( <checksum> = ctf ) ) 
					SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = score_ctf string = "Use Capture Limit" } 
					<txt> = "Use Capture Limit" 
				ENDIF 
			ENDIF 
		CASE score_ctf 
			SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = timed_ctf string = "Use Time Limit" } 
			<txt> = "Use Time Limit" 
		CASE graffiti_team_scoring 
			SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = graffiti_individual_scoring string = "Individual" } 
			<txt> = "Individual" 
		CASE graffiti_individual_scoring 
			SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = graffiti_team_scoring string = "Combined" } 
			<txt> = "Combined" 
		CASE goals_classic 
			SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = goals_created string = "Created Goals" } 
			<txt> = "Created Goals" 
		CASE goals_created 
			SetPreferencesFromUI { prefs = <prefs> field = <id_field> checksum = goals_classic string = "Classic Goals" } 
			<txt> = "Classic Goals" 
	ENDSWITCH 
	thugpro_menu_item_update_extra_text id = <id_id> text = <txt> 
	create_network_game_options_menu 
	FireEvent type = unfocus target = sub_vmenu 
	FireEvent type = focus target = sub_vmenu data = { child_id = <id_id> } 
ENDSCRIPT

SCRIPT variable_step 
	IF NOT GotParam array 
		RETURN 
	ENDIF 
	IF NOT GotParam value 
		RETURN 
	ENDIF 
	new_value = <value> 
	index = 0 
	GetArraySize <array> 
	step = ( ( <array> [ <index> ] ) . step ) 
	abs_min = ( ( <array> [ <index> ] ) . min ) 
	abs_max = ( ( <array> [ <index> ] ) . max ) 
	IF ( <array_size> > 1 ) 
		<abs_max> = ( ( <array> [ ( <array_size> - 1 ) ] ) . max ) 
	ENDIF 
	BEGIN 
		IF ( <new_value> > ( ( <array> [ <index> ] ) . min ) ) 
			IF ( <new_value> < ( ( <array> [ <index> ] ) . max ) ) 
				<step> = ( ( <array> [ <index> ] ) . step ) 
				BREAK 
			ELSE 
				IF ( <new_value> = ( ( <array> [ <index> ] ) . max ) ) 
					<step> = ( ( <array> [ <index> ] ) . step ) 
					BREAK 
				ELSE 
					<index> = ( <index> + 1 ) 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( <new_value> = ( ( <array> [ <index> ] ) . min ) ) 
				IF GotParam left 
					IF ( <index> = 0 ) 
						<step> = ( ( <array> [ ( <array_size> - 1 ) ] ) . step ) 
					ELSE 
						<step> = ( ( <array> [ ( <index> - 1 ) ] ) . step ) 
					ENDIF 
				ELSE 
					<step> = ( ( <array> [ <index> ] ) . step ) 
				ENDIF 
				BREAK 
			ENDIF 
		ENDIF 
	REPEAT <array_size> 
	IF GotParam Right 
		<new_value> = ( <new_value> + <step> ) 
		IF ( <new_value> > <abs_max> ) 
			<new_value> = <abs_min> 
		ENDIF 
	ELSE 
		IF GotParam left 
			<new_value> = ( <new_value> - <step> ) 
			IF ( <new_value> < <abs_min> ) 
				<new_value> = <abs_max> 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN new_number = <new_value> 
ENDSCRIPT

SCRIPT create_pre_network_host_options_menu 
	IF levelIs Load_MainMenu 
		<pad_back_script> = create_setup_options_menu 
	ELSE 
		<pad_back_script> = create_pause_menu 
	ENDIF 
	thugpro_menu_create { 
		menu_name = pre_host_options 
		menu_title = "Host Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = <pad_back_script> 
		show_description_panel 
		show_gradient 
	} 
	IF NOT OnServer 
		<focusable> = not_focusable 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Server Options" 
		id = server_options_menu_item 
		pad_choose_script = create_network_host_options_menu 
	} 
	make_thugpro_menu_item { 
		text = "Autoserver Options" 
		id = autoserver_menu_item 
		pad_choose_script = AutoServerMenu_Create_Menu 
		not_focusable = <focusable> 
	} 
	get_approx_num_level_options_items 
	IF ( <num_items> > 0 ) 
		<level_options_focusable> = <focusable> 
	ELSE 
		<level_options_focusable> = not_focusable 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Level Options" 
		id = level_options_menu_item 
		pad_choose_script = create_level_options_menu 
		not_focusable = <level_options_focusable> 
	} 
	make_thugpro_menu_item { 
		text = "Game Modifiers" 
		id = game_modifiers_menu_item 
		pad_choose_script = create_game_modifiers_menu 
		not_focusable = <focusable> 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_network_host_options_menu 
	Change in_server_options = 1 
	dialog_box_exit 
	kill_start_key_binding 
	IF levelIs Load_MainMenu 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim skater = 0 Name = skateshop_board_select_cam play_hold 
	ENDIF 
	IF IsInternetGameHost 
		<pad_back_script> = quit_game 
		<pad_back_params> = { } 
	ELSE 
		IF levelIs Load_MainMenu 
			<pad_back_script> = generic_menu_pad_back 
			<pad_back_params> = { callback = back_from_internet_host_options } 
		ELSE 
			<pad_back_script> = generic_menu_pad_back 
			<pad_back_params> = { callback = create_pre_network_host_options_menu } 
		ENDIF 
	ENDIF 
	thugpro_menu_create { 
		menu_name = host_options 
		menu_title = "Server Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = <pad_back_script> 
		pad_back_params = <pad_back_params> 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	IF InNetGame 
		IF OnServer 
			actual_server = 1 
		ELSE 
			actual_server = 0 
		ENDIF 
	ELSE 
		actual_server = 1 
	ENDIF 
	IF ( <actual_server> = 1 ) 
		GetPreferenceString pref_type = network server_name 
		make_thugpro_menu_item { 
			text = "Name" 
			extra_text = <ui_string> 
			id = menu_network_host_options_server_name 
			pad_choose_script = create_network_host_options_server_name_menu 
		} 
	ENDIF 
	IF NOT InNetGame 
		GetPreferenceString pref_type = network level 
		IF ( <ui_string> = "Created Park" ) 
			GetCustomParkName 
			IF ( <Name> = "" ) 
				<Name> = "Unnamed park" 
			ENDIF 
			<ui_string> = <Name> 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Level" 
			extra_text = <ui_string> 
			id = menu_network_host_options_level 
			pad_choose_script = launch_level_select_menu 
			pad_choose_params = { from_server_options } 
		} 
	ENDIF 
	IF GameModeEquals is_goal_attack 
		IF ( <actual_server> = 1 ) 
			GetPreferenceString pref_type = network level 
			GetPreferenceChecksum pref_type = network level 
			IF ( <checksum> = load_sk5ed_gameplay ) 
				SetPreferencesFromUI prefs = network field = "goals" string = ( ( ( net_goal_info ) [ 1 ] ) . Name ) checksum = ( ( ( net_goal_info ) [ 1 ] ) . checksum ) 
				<not_focusable> = not_focusable 
			ELSE 
				GoalEditor : GetNumEditedGoals level = <checksum> 
				IF ( <NumGoals> = 0 ) 
					SetPreferencesFromUI prefs = network field = "goals" string = ( ( ( net_goal_info ) [ 0 ] ) . Name ) checksum = ( ( ( net_goal_info ) [ 0 ] ) . checksum ) 
				ENDIF 
			ENDIF 
			GetPreferenceString pref_type = network goals 
			IF NOT GoalManager_HasActiveGoals 
				make_thugpro_menu_item { 
					text = "Load Goals" 
					pad_choose_script = host_options_goals_sub_menu_exit 
					pad_choose_params = { new_menu_script = launch_load_created_goals_from_host_goals_menu } 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	GetPreferenceString pref_type = network num_players 
	make_thugpro_menu_item { 
		text = "Players" 
		extra_text = <ui_string> 
		id = menu_network_host_options_max_players 
		option_arrows pad_choose 
		option_arrows_callback = tp_host_option_cycle_num_players 
	} 
	GetPreferenceString pref_type = network num_observers 
	make_thugpro_menu_item { 
		text = "Observers" 
		extra_text = <ui_string> 
		id = menu_network_host_options_max_observers 
		option_arrows pad_choose 
		option_arrows_callback = tp_host_option_cycle_num_observers 
	} 
	IF NOT InNetGame 
		GetPreferenceString pref_type = network team_mode 
		make_thugpro_menu_item { 
			text = "Teams" 
			extra_text = <ui_string> 
			id = menu_network_host_options_player_team 
			option_arrows pad_choose 
			option_arrows_callback = tp_host_option_cycle_team_mode 
		} 
	ELSE 
		IF GameModeEquals is_lobby 
			IF IsHost 
				IF OnServer 
					GetPreferenceString pref_type = network team_mode 
					make_thugpro_menu_item { 
						text = "Teams" 
						extra_text = <ui_string> 
						id = menu_network_host_options_player_team 
						option_arrows pad_choose 
						option_arrows_callback = tp_host_option_cycle_team_mode 
					} 
				ELSE 
					GetPreferenceString pref_type = network team_mode 
					make_thugpro_menu_item { 
						text = "Teams" 
						extra_text = <ui_string> 
						id = menu_network_host_options_player_team 
						option_arrows pad_choose 
						option_arrows_callback = tp_host_option_cycle_team_mode 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF IsHost 
		IF NOT ( <actual_server> = 1 ) 
			<last_menu_item> = last_menu_item 
		ENDIF 
		GetPreferenceString pref_type = network player_collision 
		make_thugpro_menu_item { 
			text = "Collision" 
			extra_text = <ui_string> 
			id = menu_network_host_options_player_collision 
			option_arrows pad_choose 
			option_arrows_callback = tp_host_option_cycle_player_collision 
		} 
	ENDIF 
	GetPreferenceString pref_type = network skill_level 
	make_thugpro_menu_item { 
		text = "Skill Level" 
		extra_text = <ui_string> 
		id = menu_network_host_options_skill_level 
		option_arrows pad_choose 
		option_arrows_callback = tp_host_option_cycle_skill_level 
	} 
	IF OnServer 
		IF GameModeEquals is_lobby 
			GetPreferencePassword pref_type = network password 
			make_thugpro_menu_item { 
				text = "Password" 
				extra_text = <password_string> 
				id = menu_network_host_options_password 
				pad_choose_script = create_network_host_options_password_menu 
			} 
			IF NOT IsHost 
				<not_focusables> = not_focusable 
			ENDIF 
			PrintStruct <not_focusables> 
		ELSE 
			GetPreferencePassword pref_type = network password 
			make_thugpro_menu_item { 
				text = "Password" 
				extra_text = <password_string> 
				id = menu_network_host_options_password 
				pad_choose_script = create_network_host_options_password_menu 
			} 
		ENDIF 
	ENDIF 
	IF IsTrue should_randomize_skater_restarts 
		randomize_restarts_text = "On" 
	ELSE 
		randomize_restarts_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Randomize restarts" 
		extra_text = <randomize_restarts_text> 
		option_arrows_callback = toggle_randomize_skater_restarts 
		description_text = "Toggle whether players should start at a random location or based on the player index" 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue allow_client_script_mods 
		<script_mods_extra_text> = "On" 
	ELSE 
		<script_mods_extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Allow Script Mods" 
		extra_text = <script_mods_extra_text> 
		option_arrows pad_choose 
		option_arrows_callback = network_host_options_toggle_script_mods 
		id = menu_network_host_options_script_mods 
	} 
	IF NOT InNetGame 
		make_thugpro_menu_item { 
			text = "Ready" 
			id = menu_network_host_options_ready 
			pad_choose_script = chosen_host_game 
			<focusable> 
		} 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

allow_client_script_mods = 0 
SCRIPT network_host_options_toggle_script_mods 
	GetTags 
	IF IsTrue allow_client_script_mods 
		thugpro_menu_item_update_extra_text id = <id> text = "Off" 
		Change allow_client_script_mods = 0 
		THUGPRO_SetProxyGlobal global = g_host_allow_mods value = 0 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> text = "On" 
		Change allow_client_script_mods = 1 
		THUGPRO_SetProxyGlobal global = g_host_allow_mods value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT set_ready_focus 
	FireEvent type = unfocus target = host_options_vmenu 
	FireEvent type = focus target = host_options_vmenu data = { child_id = menu_network_host_options_ready } 
ENDSCRIPT

NoGameTypesSelected = 0 
SCRIPT CheckForEnabledGameTypes 
	IF IntegerEquals a = <enabled> b = 1 
		Change NoGameTypesSelected = 0 
	ENDIF 
ENDSCRIPT

SCRIPT MaybeDisableGameTypes 
	IF levelIs load_practice 
		temp_array = net_game_type_info 
		IF IntegerEquals a = <enabled> b = 1 
			IF CheckSumEquals a = <checksum> b = netgraffiti 
				temp_struct = { 
					Name = <Name> 
					description = <description> 
					checksum = <checksum> 
					goal_script = <goal_script> 
					icon = <icon> 
					enabled = 2 
				} 
				SetArrayElement { 
					arrayname = temp_array 
					index = 7 
					newvalue = <temp_struct> 
				} 
			ENDIF 
			IF CheckSumEquals a = <checksum> b = netctf 
				temp_struct = { 
					Name = <Name> 
					description = <description> 
					checksum = <checksum> 
					goal_script = <goal_script> 
					icon = <icon> 
					enabled = 2 
				} 
				SetArrayElement { 
					arrayname = temp_array 
					index = 9 
					newvalue = <temp_struct> 
				} 
			ENDIF 
		ENDIF 
	ELSE 
		temp_array = net_game_type_info 
		IF IntegerEquals a = <enabled> b = 2 
			IF CheckSumEquals a = <checksum> b = netgraffiti 
				temp_struct = { 
					Name = <Name> 
					description = <description> 
					checksum = <checksum> 
					goal_script = <goal_script> 
					icon = <icon> 
					enabled = 1 
				} 
				SetArrayElement { 
					arrayname = 
					temp_array 
					index = 7 
					newvalue = <temp_struct> 
				} 
			ENDIF 
			IF CheckSumEquals a = <checksum> b = netctf 
				temp_struct = { 
					Name = <Name> 
					description = <description> 
					checksum = <checksum> 
					goal_script = <goal_script> 
					icon = <icon> 
					enabled = 1 
				} 
				SetArrayElement { 
					arrayname = temp_array 
					index = 9 
					newvalue = <temp_struct> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT chosen_start_game 
	IF InNetGame 
		IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
			IF IsHost 
				IF GetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
					Change NoGameTypesSelected = 1 
					ForEachIn net_game_type_info do = CheckForEnabledGameTypes 
					IF IsTrue NoGameTypesSelected 
						SetPreferencesFromUI { 
							prefs = network 
							field = "game_type" 
							checksum = ( net_game_type_info [ 0 ] . checksum ) 
							string = ( net_game_type_info [ 0 ] . Name ) 
						} 
						Change AutoGameMode_Index = 0 
					ELSE 
						BEGIN 
							SWITCH ( AutoGameMode_ShuffleType ) 
								CASE 0 
									IF IntegerEquals a = ( net_game_type_info [ ( AutoGameMode_Index ) ] . enabled ) b = 1 
										SetPreferencesFromUI { 
											prefs = network 
											field = "game_type" 
											checksum = ( net_game_type_info [ ( AutoGameMode_Index ) ] . checksum ) 
											string = ( net_game_type_info [ ( AutoGameMode_Index ) ] . Name ) 
										} 
										edmsg2 "NEXT MODE IS %a" a = ( net_game_type_info [ ( AutoGameMode_Index ) ] . Name ) 
										array_next_wraparound index = ( AutoGameMode_Index ) array = net_game_type_info 
										Change AutoGameMode_Index = <index> 
										BREAK 
									ELSE 
										array_next_wraparound index = ( AutoGameMode_Index ) array = net_game_type_info 
										Change AutoGameMode_Index = <index> 
									ENDIF 
								CASE 1 
									IF IntegerEquals a = ( net_game_type_info [ ( AutoGameMode_Index ) ] . enabled ) b = 1 
										SetPreferencesFromUI { 
											prefs = network 
											field = "game_type" 
											checksum = ( net_game_type_info [ ( AutoGameMode_Index ) ] . checksum ) 
											string = ( net_game_type_info [ ( AutoGameMode_Index ) ] . Name ) 
										} 
										edmsg2 "NEXT MODE IS %a" a = ( net_game_type_info [ ( AutoGameMode_Index ) ] . Name ) 
										GetArraySize net_game_type_info 
										GetRandomValue Name = gamemode_rand_index a = 0 b = ( <array_size> - 1 ) integer 
										Change AutoGameMode_Index = <gamemode_rand_index> 
										BREAK 
									ELSE 
										array_previous_wraparound index = ( AutoGameMode_Index ) array = net_game_type_info 
										Change AutoGameMode_Index = <index> 
									ENDIF 
							ENDSWITCH 
						REPEAT 
						printf "new AutoGameMode_Index = \\c4%a" a = AutoGameMode_Index 
					ENDIF 
					GetPreferenceChecksum pref_type = network game_type 
					IF ( <checksum> = netctf ) 
						IF NOT InTeamGame 
							SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_two string = "2" 
							SetNumTeams 2 
						ENDIF 
					ENDIF 
					IF ( <checksum> = netking ) 
						SetPreferencesFromUI prefs = network field = "target_score" checksum = time_120 time = 120 string = "2:00 minutes" 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		IF levelIs load_practice 
			GetPreferenceChecksum pref_type = network game_type 
			IF ( <checksum> = netgraffiti ) 
				SetPreferencesFromUI { 
					prefs = network 
					field = "game_type" 
					checksum = ( net_game_type_info [ 0 ] . checksum ) 
					string = ( net_game_type_info [ 0 ] . Name ) 
				} 
			ENDIF 
			IF ( <checksum> = netctf ) 
				SetPreferencesFromUI { 
					prefs = network 
					field = "game_type" 
					checksum = ( net_game_type_info [ 0 ] . checksum ) 
					string = ( net_game_type_info [ 0 ] . Name ) 
				} 
			ENDIF 
		ENDIF 
	ELSE 
	ENDIF 
	LoadPendingPlayers 
	StartNetworkGame 
	IF InSplitScreenGame 
		skater : RunStarted 
		Skater2 : RunStarted 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		exit_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT network_options_selected 
	hide_current_goal 
	launch_network_host_options_menu 
ENDSCRIPT

SCRIPT network_game_options_selected 
	create_network_game_options_menu <...> 
ENDSCRIPT

SCRIPT network_start_selected 
	IF OnServer 
		chosen_start_game 
	ELSE 
		FCFSRequestStartGame 
		exit_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT fcfc_end_game_selected 
	ReportStats final 
	do_backend_retry 
ENDSCRIPT

SCRIPT network_end_game_selected 
	IF GameIsOver 
		create_pause_menu 
		RETURN 
	ENDIF 
	kill_all_panel_messages 
	IF InSplitScreenGame 
		SetStatOverride 
		GoalManager_DeactivateAllGoals 
		change_gamemode_freeskate_2p 
		pause_trick_text 
		create_end_run_menu 
	ELSE 
		IF InInternetMode 
			IF OnServer 
				ReportStats final 
			ENDIF 
		ENDIF 
		EndNetworkGame 
	ENDIF 
ENDSCRIPT

SCRIPT generic_array_menu_setup { time = 60 } 
	IF NOT ( <pref_field> = "game_type" ) 
		IF NOT ( <pref_field> = "device_type" ) 
		ENDIF 
	ENDIF 
	GetArraySize <array> 
	<array_size> = ( <array_size> -1 ) 
	BEGIN 
		GetNextArrayElement <array> 
		IF GotParam Element 
			AddParams <Element> 
			IF ( <pref_field> = "game_type" ) 
				focus_script = game_options_focus_script 
				focus_params = { description = <description> } 
			ENDIF 
			IF GotParam not_in_custom_parks 
				IF CustomParkMode just_using 
					show_option = 0 
				ELSE 
					show_option = 1 
				ENDIF 
			ELSE 
				show_option = 1 
			ENDIF 
			IF GotParam not_pal 
				IF IsPal 
					show_option = 0 
				ENDIF 
			ENDIF 
			IF levelIs load_se 
				IF ( <Name> = "Classic Goals" ) 
					AddParams { not_available } 
				ENDIF 
			ENDIF 
			IF NOT ( <array_size> = 0 ) 
				IF ( <show_option> = 1 ) 
					IF GotParam not_available 
						make_thpg_menu_item text = <Name> id = <checksum> font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> } not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale> 
					ELSE 
						IF GotParam team_only 
							IF InTeamGame 
								make_thpg_menu_item text = <Name> id = <checksum> font = small pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> <...> } focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale> 
							ELSE 
								make_thpg_menu_item text = <Name> id = <checksum> font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> } not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale> 
							ENDIF 
						ELSE 
							make_thpg_menu_item text = <Name> id = <checksum> font = small pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> <...> } focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale> 
						ENDIF 
					ENDIF 
				ENDIF 
			ELSE 
				IF ( <show_option> = 1 ) 
					IF GotParam not_available 
						make_thpg_menu_item text = <Name> id = <checksum> font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> } not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1 
					ELSE 
						IF GotParam team_only 
							IF InTeamGame 
								make_thpg_menu_item text = <Name> id = <checksum> font = small pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> <...> } focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1 
							ELSE 
								make_thpg_menu_item text = <Name> id = <checksum> font = small rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> } not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1 
							ENDIF 
						ELSE 
							make_thpg_menu_item text = <Name> id = <checksum> font = small pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <Name> checksum = <checksum> time = <time> <...> } focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			<array_size> = ( <array_size> -1 ) 
			RemoveParameter not_available 
			RemoveParameter not_in_custom_parks 
			RemoveParameter not_pal 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT generic_array_menu_desc_setup { 
		time = 60 
	} 
	GetPreferenceChecksum pref_type = network game_type 
	<current_game_type> = <checksum> 
	RemoveParameter checksum 
	GetArraySize <array> 
	<array_size> = ( <array_size> -1 ) 
	BEGIN 
		GetNextArrayElement <array> 
		IF GotParam Element 
			AddParams <Element> 
			IF ( <checksum> = netgoalattack ) 
				IF IsTrue LEVEL_DISABLE_GOAL_ATTACK 
					<not_focusable> = not_focusable 
				ENDIF 
			ENDIF 
			IF ( <checksum> = netgraffiti ) 
				IF IsTrue LEVEL_DISABLE_GRAFFITI 
					<not_focusable> = not_focusable 
				ENDIF 
			ENDIF 
			IF ( <checksum> = netctf ) 
				IF IsTrue LEVEL_DISABLE_CTF 
					<not_focusable> = not_focusable 
				ENDIF 
			ENDIF 
			pad_choose_params = { 
				prefs = <pref_type> 
				field = <pref_field> 
				string = <Name> 
				checksum = <checksum> 
				time = <time> 
				<...> 
			} 
			make_thugpro_menu_item { 
				text = <Name> 
				id = <checksum> 
				pad_choose_script = <call_script> 
				pad_choose_params = <pad_choose_params> 
				description_text = <description> 
				centered 
				<not_focusable> 
			} 
			<array_size> = ( <array_size> - 1 ) 
			RemoveParameter not_focusable 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
	Wait 1 gameframe 
ENDSCRIPT

SCRIPT game_options_focus_script 
ENDSCRIPT

SCRIPT end_network_game 
	kill_all_panel_messages 
	dialog_box_exit 
	do_backend_retry 
ENDSCRIPT

SCRIPT CreateServerQuitDialog 
	printf "**** in CreateServerQuitDialog ****" 
	HideLoadingScreen 
	IF NOT levelIs Load_MainMenu 
		printf "**** Level was not the skateshop ****" 
		GoalManager_DeactivateAllGoals force_all 
		GoalManager_UninitializeAllGoals 
		GoalManager_SetCanStartGoal 0 
		kill_net_panel_messages 
		destroy_onscreen_keyboard 
		force_close_rankings dont_retry 
		exit_pause_menu 
		HideLoadingScreen 
		IF NOT IsObserving 
			IF ObjectExists id = skater 
				skater : Vibrate OFF 
			ENDIF 
			ExitSurveyorMode 
		ENDIF 
		dialog_box_exit anchor_id = quit_dialog_anchor 
		Change check_for_unplugged_controllers = 0 
		PauseGame 
		create_error_box { title = "Notice" 
			text = "The host has quit. Select OK to leave this game." 
			buttons = [ { text = "ok" pad_choose_script = quit_network_game } 
			] 
			delay_input 
			delay_input_time = 500 
		} 
	ELSE 
		printf "*** Level IS the skateshop ***" 
	ENDIF 
ENDSCRIPT

SCRIPT create_game_ended_dialog 
	IF NOT levelIs Load_MainMenu 
		GoalManager_DeactivateAllGoals force_all 
		GoalManager_UninitializeAllGoals 
		GoalManager_SetCanStartGoal 0 
		kill_net_panel_messages 
		destroy_onscreen_keyboard 
		force_close_rankings 
		exit_pause_menu 
		dialog_box_exit anchor_id = quit_dialog_anchor 
		create_error_box { title = "Notice" 
			text = "The host has terminated the current game.  Select OK to go back to freeskate." 
			buttons = [ { text = "ok" pad_choose_script = end_network_game } 
			] 
			delay_input 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT accept_lost_connection 
	dialog_box_exit 
	IF EnteringNetGame 
		cancel_join_server 
	ELSE 
		quit_network_game 
	ENDIF 
ENDSCRIPT

SCRIPT CreateLostConnectionDialog 
	HideLoadingScreen 
	GoalManager_DeactivateAllGoals force_all 
	GoalManager_UninitializeAllGoals 
	GoalManager_SetCanStartGoal 0 
	exit_pause_menu 
	destroy_onscreen_keyboard 
	force_close_rankings dont_retry 
	IF InNetGame 
		IF LocalSkaterExists 
			skater : Vibrate OFF 
		ENDIF 
	ENDIF 
	IF NOT IsObserving 
		ExitSurveyorMode 
	ENDIF 
	dialog_box_exit 
	dialog_box_exit anchor_id = link_lost_dialog_anchor 
	dialog_box_exit anchor_id = quit_dialog_anchor 
	Change check_for_unplugged_controllers = 0 
	create_error_box { title = "Notice" 
		text = "You have lost connection to the host. Select OK to leave this game." 
		buttons = [ { text = "ok" pad_choose_script = accept_lost_connection } 
		] 
		delay_input 
	} 
ENDSCRIPT

SCRIPT BackToServerListFromJoinRefusedDialog 
	printf "BackToServerListFromJoinRefusedDialog" 
	dialog_box_exit 
	create_network_select_games_menu 
ENDSCRIPT

thugpro_reason = tp_net_reason_generic 
thugpro_show_reason = 0 
SCRIPT CreateJoinRefusedDialog 
	IF InNetGame 
		create_dialog_box { 
			title = net_refused_msg 
			text = <reason> 
			buttons = [ 
				{ text = "ok" pad_choose_script = dialog_box_exit } 
			] 
		} 
	ELSE 
		IF GotParam just_dialog 
			create_dialog_box { 
				title = net_refused_msg 
				text = <reason> 
				buttons = [ 
					{ text = "ok" pad_choose_script = BackToServerListFromJoinRefusedDialog } 
				] 
			} 
		ELSE 
			cancel_join_server show_refused_dialog <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_refused_dialog 
	printf "******* in cancel_join_server 12" 
	IF InNetGame 
		create_dialog_box { 
			title = net_refused_msg 
			text = <reason> 
			buttons = [ 
				{ text = "ok" pad_choose_script = dialog_box_exit } 
			] 
		} 
	ELSE 
		create_dialog_box { 
			title = net_refused_msg 
			text = <reason> 
			buttons = [ 
				{ text = "ok" pad_choose_script = BackToServerListFromJoinRefusedDialog } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT reattempt_join_server 
	Change JoinedGameInProgress = 1 
	Change JoinedAsObserver = 0 
	ReattemptJoinServer 
	PlaySkaterCamAnim Name = skateshop_board_select_cam play_hold 
ENDSCRIPT

SCRIPT cancel_join_server 
	printf "******* in cancel_join_server" 
	IF GotParam cancel_nn 
		CancelNatNegotiation 
	ENDIF 
	destroy_onscreen_keyboard 
	dialog_box_exit 
	printf "******* in cancel_join_server 2" 
	IF InInternetMode 
		printf "******* in cancel_join_server 3" 
		CancelJoinServer 
		restart_local_server 
		SetNetworkMode INTERNET_MODE 
	ELSE 
		printf "******* in cancel_join_server 4" 
		CancelJoinServer 
		printf "******* in cancel_join_server 5" 
		restart_local_server 
		printf "******* in cancel_join_server 6" 
		SetNetworkMode LAN_MODE 
	ENDIF 
	printf "******* in cancel_join_server 7" 
	IF GotParam show_timeout 
		printf "******* in cancel_join_server 8" 
		create_join_timeout_dialog 
	ELSE 
		IF GotParam show_refused_dialog 
			printf "******* in cancel_join_server 9" 
			create_refused_dialog <...> 
		ELSE 
			printf "******* in cancel_join_server 10" 
			create_network_select_games_menu 
		ENDIF 
	ENDIF 
	kill_start_key_binding 
	printf "******* in cancel_join_server 11" 
	BEGIN 
		IF LocalSkaterExists 
			MakeSkaterGoto SkateshopIdle 
			KillSkaterCamAnim all 
			skater : reset_model_lights 
			PlaySkaterCamAnim Name = skateshop_board_select_cam play_hold 
			BREAK 
		ELSE 
			Wait 1 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT CreateEnterPasswordControl 
	dialog_box_exit 
	create_onscreen_keyboard { 
		password 
		allow_cancel 
		keyboard_cancel_script = cancel_join_server 
		keyboard_done_script = try_password 
		keyboard_title = "Enter password" 
		text = "" 
		min_length = 1 
		max_length = 9 
	} 
ENDSCRIPT

SCRIPT try_password 
	GetTextElementString id = keyboard_current_string 
	destroy_onscreen_keyboard 
	JoinWithPassword <...> 
ENDSCRIPT

SCRIPT CreateGameInProgressDialog 
	dialog_box_exit 
	kill_start_key_binding 
	create_dialog_box { title = net_status_msg 
		text = net_message_game_in_progress 
		buttons = [ 
			{ text = "ok" pad_choose_script = reattempt_join_server } 
			{ text = "cancel" pad_choose_script = cancel_join_server } 
		] 
	} 
ENDSCRIPT

SCRIPT CreateConnectingDialog 
	kill_start_key_binding 
	create_dialog_box { title = net_status_msg 
		text = net_status_connecting 
		no_animate 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_join_server } 
		] 
	} 
ENDSCRIPT

SCRIPT CreateJoiningDialog 
	dialog_box_exit 
	kill_start_key_binding 
	create_dialog_box { title = net_status_msg 
		text = net_status_joining 
		no_animate 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_join_server } 
		] 
	} 
ENDSCRIPT

SCRIPT CreateTryingPasswordDialog 
	kill_start_key_binding 
	create_dialog_box { title = net_status_msg 
		text = net_status_trying_password 
		no_animate 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_join_server } 
		] 
	} 
ENDSCRIPT

SCRIPT wait_for_players 
	dialog_box_exit 
	create_net_panel_message text = net_message_game_will_start 
ENDSCRIPT

SCRIPT dont_wait_for_players 
	dialog_box_exit 
	DropPendingPlayers 
ENDSCRIPT

SCRIPT CreateWaitForPlayersDialog 
	IF ObjectExists id = pause_menu 
		exit_pause_menu 
	ENDIF 
	destroy_onscreen_keyboard 
	IF ( ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) | ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) ) 
		dont_wait_for_players 
	ELSE 
		create_error_box { title = net_status_msg 
			text = net_message_waiting_for_players 
			no_animate 
			buttons = [ 
				{ text = "Yes" pad_choose_script = wait_for_players } 
				{ text = " No " pad_choose_script = dont_wait_for_players } 
			] 
			no_animate 
			delay_input 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_join_timeout 
	dialog_box_exit 
	create_network_select_games_menu 
ENDSCRIPT

SCRIPT ShowJoinTimeoutNotice 
	cancel_join_server show_timeout 
ENDSCRIPT

SCRIPT create_join_timeout_dialog 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_join_timeout 
		buttons = [ 
			{ text = "ok" pad_choose_script = back_from_join_timeout } 
		] 
	} 
ENDSCRIPT

SCRIPT create_join_failed_dialog 
	create_dialog_box { title = net_status_msg 
		text = net_status_join_failed 
		buttons = [ 
			{ text = "ok" pad_choose_script = cancel_join_server } 
		] 
	} 
ENDSCRIPT

SCRIPT exit_net_menus 
	dialog_box_exit 
	SetGameType career 
	SetCurrentGameType 
	create_main_menu 
ENDSCRIPT

SCRIPT create_link_unplugged_front_end_dialog 
	lost_connection_to_gamespy 
ENDSCRIPT

SCRIPT link_unplugged_ok 
	dialog_box_exit anchor_id = quit_dialog_anchor no_pad_start 
	dialog_box_exit anchor_id = link_lost_dialog_anchor no_pad_start 
	<found_menu> = 0 
	IF ScreenElementExists id = current_menu_anchor 
		<found_menu> = 1 
		DoScreenElementMorph { 
			id = current_menu_anchor 
			scale = 1 
		} 
		FireEvent type = focus target = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = homie_menu_anchor 
		FireEvent type = focus target = homie_vmenu 
		<found_menu> = 1 
	ELSE 
		IF ScreenElementExists id = current_menu 
			<found_menu> = 1 
			FireEvent type = focus target = current_menu 
		ENDIF 
		IF ScreenElementExists id = sub_menu 
			<found_menu> = 1 
			FireEvent type = focus target = sub_menu 
		ENDIF 
	ENDIF 
	IF NOT levelIs Load_MainMenu 
		IF ( <found_menu> = 0 ) 
			IF SkaterCamAnimFinished 
				create_pause_menu 
			ELSE 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT link_unplugged_quit 
	dialog_box_exit anchor_id = link_lost_dialog_anchor no_pad_start 
	launch_quit_game_dialog 
ENDSCRIPT

SCRIPT create_link_unplugged_dialog 
	IF ScreenElementExists id = dialog_box_anchor 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = quit_dialog_anchor 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		DoScreenElementMorph { 
			id = current_menu_anchor 
			scale = 0 
		} 
		FireEvent type = unfocus target = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = current_menu 
		FireEvent type = unfocus target = current_menu 
	ENDIF 
	destroy_onscreen_keyboard 
	IF OnXbox 
		create_error_box { title = net_error_msg 
			anchor_id = link_lost_dialog_anchor 
			text = net_error_unplugged 
			buttons = [ 
				{ text = "ok" pad_choose_script = link_unplugged_ok } 
				{ text = "quit" pad_choose_script = link_unplugged_quit } 
			] 
			no_animate 
		} 
	ELSE 
		create_error_box { title = net_error_msg 
			anchor_id = link_lost_dialog_anchor 
			text = net_error_unplugged_ps2 
			buttons = [ 
				{ text = "ok" pad_choose_script = link_unplugged_ok } 
				{ text = "quit" pad_choose_script = link_unplugged_quit } 
			] 
			no_animate 
		} 
	ENDIF 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT exit_async_dialog 
	DeBounce x time = 0.30000001192 
	dialog_box_exit 
	IF GameIsOver 
		do_backend_retry 
	ENDIF 
ENDSCRIPT

SCRIPT CreateNotPostedDialog 
	DeBounce x time = 0.30000001192 
	kill_all_panel_messages 
	create_error_box { title = net_error_msg 
		text = net_status_not_posted 
		buttons = [ 
			{ text = "ok" pad_choose_script = exit_async_dialog } 
		] 
		no_animate 
		delay_input 
		z_priority = 50 
	} 
ENDSCRIPT

SCRIPT CreateGenericOKDialogInGame 
	DeBounce x time = 0.30000001192 
	kill_all_panel_messages 
	create_error_box { title = <title> 
		text = <text> 
		buttons = [ 
			{ text = "ok" pad_choose_script = exit_async_dialog } 
		] 
		no_animate 
		delay_input 
		z_priority = 50 
	} 
ENDSCRIPT

SCRIPT accept_gamespy_lost_connection_dialog 
	dialog_box_exit 
	ResetConnectionTimer 
ENDSCRIPT

SCRIPT reset_gamespy_connection_timer 
	IF isPS2 
		ResetConnectionTimer 
	ENDIF 
ENDSCRIPT

SCRIPT CreateGamespyLostConnectionDialog 
	IF ScreenElementExists id = dialog_box_anchor 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = current_menu 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = link_lost_dialog_anchor 
		RETURN 
	ENDIF 
	destroy_onscreen_keyboard 
	create_error_box { title = net_error_msg 
		text = net_error_lost_gamespy_connection 
		buttons = [ 
			{ text = "ok" pad_choose_script = accept_gamespy_lost_connection_dialog } 
		] 
		no_animate 
	} 
ENDSCRIPT

SCRIPT CreateFailedLobbyListDialog 
	LobbyDisconnect 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = <message> 
		buttons = [ 
			{ text = "ok" pad_choose_script = cancel_gamespy_connection_failure_dialog } 
		] 
		no_animate 
		no_bg 
	} 
ENDSCRIPT

SCRIPT CreateJoinLobbyFailedDialog 
	LobbyDisconnect 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Failed to join lobby." 
		buttons = [ 
			{ text = "ok" pad_choose_script = JoinLobbyFailed_Back } 
		] 
	} 
ENDSCRIPT

SCRIPT create_joining_lobby_dialog 
	PlaySkaterCamAnim skater = 0 Name = skateshop_board_select_cam play_hold 
	create_dialog_box { title = net_status_msg 
		text = "Joining lobby..." 
		no_bg 
		pos = PAIR(237.00000000000, 250.00000000000) 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_lobby_ } 
		] 
		no_animate 
		delay_input 
	} 
ENDSCRIPT

SCRIPT JoinLobbyFailed_Back 
	dialog_box_exit 
	console_destroy 
	back_from_lobbies 
	FireEvent type = focus target = ss_vmenu 
ENDSCRIPT

SCRIPT cancel_join_lobby 
	back_from_internet_menu 
ENDSCRIPT

SCRIPT create_net_panel_message_menu 
	IF ScreenElementExists id = net_panel_message_menu 
		DestroyScreenElement id = net_panel_message_menu 
	ENDIF 
	SetScreenElementLock id = root_window OFF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = net_panel_message_menu 
		pos = PAIR(560.00000000000, 120.00000000000) 
		just = [ left top ] 
		scale = 0.69999998808 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = vmenu 
		parent = net_panel_message_menu 
		id = net_panel_message_vmenu 
		just = [ left top ] 
	} 
ENDSCRIPT

SCRIPT create_net_panel_message { 
		msg_time = 1200 
	} 
	IF NOT ScreenElementExists id = game_pause_menu 
		root_window : GetSingleTag menu_state 
		IF ( <menu_state> = OFF ) 
			SetScreenElementLock id = net_panel_message_vmenu OFF 
			CreateScreenElement { 
				type = ContainerElement 
				parent = net_panel_message_vmenu 
				just = [ left top ] 
				alpha = 1 
				scale = 0 
				dims = PAIR(320.00000000000, 60.00000000000) 
				not_focusable 
				z_priority = 1 
			} 
			<message_id> = <id> 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = <message_id> 
				local_id = text 
				font = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_FONT ) 
				scale = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_SCALE ) 
				text = <text> 
				dims = PAIR(1400.00000000000, 80.00000000000) 
				internal_just = [ Right top ] 
				z_priority = 1 
				allow_expansion 
				rgba = [ 128 128 128 100 ] 
				shadow 
				shadow_offs = PAIR(0.80000001192, 0.80000001192) 
				shadow_rgba = [ 20 20 20 128 ] 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <message_id> 
				alpha = 0.80000001192 
				scale = 0.30000001192 
				local_id = icon 
				texture = ( ( THUGPRO_GlobalThemeInfo ) . NEW_ICON_TEXTURE ) 
				pos = PAIR(130.00000000000, 0.00000000000) 
				internal_just = [ center top ] 
				just = [ center center ] 
				z_priority = 0 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
				rot_angle = RANDOM_RANGE PAIR(-45.00000000000, 45.00000000000) 
			} 
			RunScriptOnScreenElement { 
				id = { <message_id> child = icon } 
				panel_message_net_icon_animation 
				params = { msg_time = <msg_time> } 
			} 
			RunScriptOnScreenElement { 
				id = <message_id> 
				panel_message_net_text_animation 
				params = { msg_time = <msg_time> } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT panel_message_net_icon_animation 
	GetTags 
	DoScreenElementMorph { 
		id = <id> 
		scale = 0.25000000000 
		time = 0.07000000030 
	} 
	Wait 0.07000000030 second 
	DoScreenElementMorph { 
		id = <id> 
		scale = 0.18999999762 
		time = 0.07999999821 
	} 
	Wait 0.07999999821 second 
	DoScreenElementMorph { 
		id = <id> 
		scale = 0.20000000298 
		time = 0.02999999933 
	} 
	Wait 0.02999999933 second 
	Wait <msg_time> 
	DoScreenElementMorph { 
		id = <id> 
		alpha = 0.00000000000 
		time = 0.89999997616 
	} 
	Wait 0.89999997616 second 
ENDSCRIPT

SCRIPT panel_message_net_text_animation 
	GetTags 
	DoScreenElementMorph { 
		id = <id> 
		alpha = 1 
	} 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.29999995232 
		time = 0.07000000030 
	} 
	Wait 0.07000000030 second 
	Wait <msg_time> 
	DoScreenElementMorph { 
		id = <id> 
		pos = { PAIR(666.00000000000, 0.00000000000) relative } 
		time = 0.20000000298 
	} 
	Wait 0.30000001192 second 
	Die 
ENDSCRIPT

SCRIPT panel_message_bg_net final_pos = PAIR(625.00000000000, 120.00000000000) 
	DoMorph scale = 0 alpha = 0 
	DoMorph scale = 0.33000001311 alpha = 0.60000002384 time = 0.20000000298 
	Wait 0.20000000298 second 
	Wait <msg_time> 
	DoMorph scale = 0 alpha = 0 time = 0.20000000298 
	IF ScreenElementExists id = net_panel_msg_bg 
		DestroyScreenElement id = net_panel_msg_bg 
	ENDIF 
ENDSCRIPT

SCRIPT panel_message_net2 blink_time = 0.10000000149 final_pos = ( net_panel_message_pos ) 
	IF NOT GotParam dont_animate 
		SetProps just = [ Right top ] internal_just = [ Right top ] rgba = [ 128 128 128 128 ] 
		DoMorph pos = <final_pos> scale = 0 alpha = 0 
		DoMorph pos = <final_pos> scale = 0.73000001907 alpha = 0.60000002384 time = 0.20000000298 
		Wait 0.20000000298 second 
	ENDIF 
	Wait <msg_time> 
	DoMorph scale = 0 alpha = 0 time = 0.20000000298 
	IF ScreenElementExists id = net_panel_msg 
		DestroyScreenElement id = net_panel_msg 
	ENDIF 
ENDSCRIPT

SCRIPT kill_net_panel_messages 
	IF ObjectExists id = goal_comp_out_of_bounds_warning 
		DestroyScreenElement id = goal_comp_out_of_bounds_warning 
	ENDIF 
	IF ObjectExists id = net_panel_msg 
		DestroyScreenElement id = net_panel_msg 
	ENDIF 
	IF ScreenElementExists id = net_panel_msg_bg 
		DestroyScreenElement id = net_panel_msg_bg 
	ENDIF 
	IF ObjectExists id = taunt_msg_id 
		DestroyScreenElement id = taunt_msg_id 
	ENDIF 
	IF ScreenElementExists id = perfect 
		DestroyScreenElement id = perfect 
	ENDIF 
	IF ScreenElementExists id = perfect2 
		DestroyScreenElement id = perfect2 
	ENDIF 
	IF ScreenElementExists id = death_message 
		DestroyScreenElement id = death_message 
	ENDIF 
	IF ObjectExists id = speech_box_anchor 
		DoScreenElementMorph id = speech_box_anchor scale = 0 
	ENDIF 
	IF ScreenElementExists id = goal_start_dialog 
		DestroyScreenElement id = goal_start_dialog 
	ENDIF 
	IF ObjectExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	IF ObjectExists id = goal_retry_anchor 
		DestroyScreenElement id = goal_retry_anchor 
	ENDIF 
	IF ObjectExists id = first_time_goal_info 
		DestroyScreenElement id = first_time_goal_info 
	ENDIF 
	IF ObjectExists id = skater_hint 
		DestroyScreenElement id = skater_hint 
	ENDIF 
	GetArraySize goal_panel_message_ids 
	<index> = 0 
	BEGIN 
		IF ScreenElementExists id = ( goal_panel_message_ids [ <index> ] ) 
			DestroyScreenElement id = ( goal_panel_message_ids [ <index> ] ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT cancel_connect_to_internet 
	printf "script cancel_connect_to_internet" 
	dialog_box_exit 
	CancelConnectToInternet 
ENDSCRIPT

SCRIPT create_modem_state_dialog 
	create_dialog_box { title = net_status_msg 
		text = <text> 
		no_animate 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_connect_to_internet } 
		] 
	} 
ENDSCRIPT

SCRIPT create_modem_status_dialog 
	create_dialog_box { title = net_status_msg 
		text = <text> 
		no_animate 
	} 
ENDSCRIPT

SCRIPT create_modem_final_state_dialog 
	create_dialog_box { title = net_status_msg 
		text = <text> 
		buttons = [ 
			{ text = "ok" pad_choose_script = cancel_connect_to_internet } 
		] 
	} 
ENDSCRIPT

SCRIPT cancel_gamespy_connection_failure_dialog 
	printf "script cancel_gamespy_connection_failure_dialog" 
	dialog_box_exit 
	StatsLogOff 
	ProfileLogOff 
	console_destroy 
	launch_new_ss_menu no_animate 
ENDSCRIPT

SCRIPT create_gamespy_connection_failure_dialog 
	IF ScreenElementExists id = ss_vmenu 
		FireEvent type = unfocus target = ss_vmenu 
		DestroyScreenElement id = ss_vmenu 
	ENDIF 
	LobbyDisconnect 
	create_dialog_box { title = net_error_msg 
		text = net_status_gamespy_no_connect 
		buttons = [ 
			{ text = "ok" pad_choose_script = cancel_gamespy_connection_failure_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT lost_connection_to_gamespy 
	printf "script lost_connection_to_gamespy" 
	IF levelIs Load_MainMenu 
		LobbyDisconnect 
		IF StatsLoggedIn 
			StatsLogOff 
		ENDIF 
		IF ProfileLoggedIn 
			ProfileLogOff 
		ENDIF 
		IF ObjectExists id = console_message_vmenu 
			DoScreenElementMorph id = console_message_vmenu alpha = 0 
		ENDIF 
		back_from_regions_menu 
		net_vault_menu_exit 
		IF ScreenElementExists id = stats_bg_anchor 
			KillSpawnedScript Name = create_online_stat_scores_menu 
			KillSpawnedScript Name = create_online_stat_players_menu 
			KillSpawnedScript Name = create_online_stat_personal_menu 
			DestroyScreenElement id = stats_bg_anchor 
		ENDIF 
		IF ObjectExists id = keyboard_anchor 
			destroy_onscreen_keyboard 
		ENDIF 
		dialog_box_exit 
		exit_pause_menu 
		GoalManager_HidePoints 
		GoalManager_HideGoalPoints 
		create_dialog_box { 
			title = net_error_msg 
			text = net_status_gamespy_lost_connection 
			buttons = [ 
				{ text = "ok" pad_choose_script = cancel_gamespy_connection_failure_dialog } 
			] 
		} 
	ELSE 
		IF OnServer 
			IF IsHost 
				dialog_box_exit 
				exit_pause_menu 
				create_error_box { 
					title = "Notice" 
					text = "You have lost connection to OpenSpy. You can continue to play, but your game is not visible in the lobby anymore." 
					buttons = [ { text = "ok" pad_choose_script = dialog_box_exit } ] 
					delay_input 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cancel_keyboard 
	IF ObjectExists id = keyboard_anchor 
		destroy_onscreen_keyboard 
	ELSE 
		RETURN 
	ENDIF 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu alpha = 1 
	ENDIF 
	create_network_select_games_menu <...> 
ENDSCRIPT

SCRIPT enter_kb_chat_message 
	GetTextElementString id = keyboard_current_string 
	cancel_keyboard focus_on_enter_message 
	SendMessage text = <string> 
ENDSCRIPT

SCRIPT check_keyboard_focus 
	KillSpawnedScript Name = maybe_launch_lobby_keyboard 
	SpawnScript maybe_launch_lobby_keyboard 
	main_theme_focus <...> 
ENDSCRIPT

SCRIPT maybe_launch_lobby_keyboard 
	BEGIN 
		Wait 1 gameframe 
		IF NOT ScreenElementExists id = actions_menu 
			BREAK 
		ENDIF 
		LobbyCheckKeyboard 
	REPEAT 
ENDSCRIPT

SCRIPT check_keyboard_unfocus 
	KillSpawnedScript Name = maybe_launch_lobby_keyboard 
	main_theme_unfocus <...> 
ENDSCRIPT

SCRIPT lobby_enter_kb_chat 
	FireEvent type = unfocus target = actions_menu 
	create_onscreen_keyboard { 
		allow_cancel 
		no_buttons 
		pos = PAIR(320.00000000000, 530.00000000000) 
		keyboard_done_script = lobby_entered_chat_message 
		display_text = "Enter message" 
		keyboard_title = "" 
		min_length = 1 
		max_length = 60 
		text_block 
		keyboard_cancel_script = lobby_keyboard_cancel 
	} 
ENDSCRIPT

SCRIPT lobby_entered_chat_message 
	GetTextElementString id = keyboard_current_string 
	SendMessage text = <string> 
	destroy_onscreen_keyboard 
	AssignAlias id = server_list_anchor alias = current_menu_anchor 
	AssignAlias id = actions_menu alias = current_menu 
	FireEvent type = focus target = actions_menu 
ENDSCRIPT

SCRIPT lobby_keyboard_cancel 
	destroy_onscreen_keyboard 
	AssignAlias id = server_list_anchor alias = current_menu_anchor 
	AssignAlias id = actions_menu alias = current_menu 
	FireEvent type = focus target = actions_menu 
ENDSCRIPT

SCRIPT create_lobby_onscreen_kb 
	destroy_menu_background_title 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu alpha = 0.60000002384 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_onscreen_keyboard { 
		text_block 
		allow_cancel 
		in_net_lobby 
		keyboard_cancel_script = cancel_keyboard 
		keyboard_done_script = enter_kb_chat_message 
		keyboard_title = "Enter chat message" 
		text = "" 
		min_length = 1 
		max_length = 60 
		display_text_offset = PAIR(0.00000000000, 5.00000000000) 
	} 
ENDSCRIPT

SCRIPT add_multiplayer_mode_goals 
	AddGoal_TrickAttack 
	AddGoal_ComboMambo 
	AddGoal_ScoreChallenge 
	AddGoal_Graffiti 
	AddGoal_Slap 
	AddGoal_King 
	AddGoal_Ctf 
	AddGoal_GoalAttack 
	AddGoal_FireFight 
	AddGoal_Elimiskate 
	AddGoal_Elimiskate_Break_Period 
	AddGoal_ElimiSkate_Interval 
	AddGoal_Scavenger 
	AddGoal_Scavenger_Collect 
	AddGoal_Scavenger_Interval 
ENDSCRIPT

SCRIPT create_score_menu 
	IF NOT ObjectExists id = net_score_menu 
		SetScreenElementLock id = root_window OFF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = net_score_menu 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ left top ] 
			scale = 0 
			dims = PAIR(640.00000000000, 480.00000000000) 
		} 
		CreateScreenElement { 
			type = vmenu 
			parent = net_score_menu 
			id = net_score_vmenu 
			just = [ left top ] 
			pos = ( net_score_menu_pos ) 
			scale = 0.21999999881 
			padding_scale = 1 
			internal_scale = 1 
			internal_just = [ left top ] 
		} 
		<index> = 1 
		BEGIN 
			FormatText checksumname = current_id "net_score_%i" i = <index> 
			CreateScreenElement { 
				type = textElement 
				parent = net_score_vmenu 
				id = <current_id> 
				font = impact 
				text = "" 
				scale = 0.20000000298 
				rgba = [ 128 128 128 98 ] 
				not_focusable 
				z_priority = -5 
			} 
			<index> = ( <index> + 1 ) 
		REPEAT ( vMAX_PLAYERS ) 
		RunScriptOnScreenElement id = net_score_menu menu_onscreen params = { preserve_menu_state } 
	ENDIF 
ENDSCRIPT

SCRIPT clear_scores 
	IF ObjectExists id = net_score_menu 
		<index> = 1 
		BEGIN 
			FormatText checksumname = current_id "net_score_%i" i = <index> 
			SetScreenElementProps { 
				id = <current_id> 
				text = "" 
			} 
			<index> = ( <index> + 1 ) 
		REPEAT ( vMAX_PLAYERS ) 
	ENDIF 
ENDSCRIPT

SCRIPT update_score 
	IF GetGlobalFlag flag = NO_DISPLAY_NET_SCORES 
		hide_net_scores 
	ELSE 
		IF ObjectExists id = current_menu_anchor 
			IF NOT ObjectExists id = kb_no_button_hdr 
				hide_net_scores 
			ELSE 
				unhide_net_scores 
			ENDIF 
		ELSE 
			unhide_net_scores 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT entered_network_game 
	IF InInternetMode 
		LeaveLobby preserve_status 
		SetQuietMode 
	ENDIF 
	kill_net_panel_messages 
	console_unhide 
	restore_start_key_binding 
	IF LocalSkaterExists 
		refresh_skater_model_for_cheats 
	ENDIF 
	IF OnServer 
		ClearOmnigons 
	ELSE 
		IF InInternetMode 
			CancelNatNegotiation 
		ENDIF 
		SkProDisplayLoadingScreen blank freeze 
	ENDIF 
	EnteredNetworkGame 
ENDSCRIPT

SCRIPT restart_local_server 
	SetNetworkMode 
	setservermode on 
	SetJoinMode JOIN_MODE_PLAY 
	StartServer 
	JoinServer <...> 
	hide_balance_meter 
ENDSCRIPT

SCRIPT handle_keyboard_input 
	IF ObjectExists id = keyboard_anchor 
		IF GotParam got_enter 
			IF ScreenElementExists id = keyboard_done_button 
				FireEvent type = pad_choose target = keyboard_done_button 
			ELSE 
				FireEvent type = pad_choose target = keyboard_anchor 
			ENDIF 
		ELSE 
			IF GotParam got_backspace 
				keyboard_handle_backspace 
			ELSE 
				keyboard_button_pressed <...> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_profile_options 
	FireEvent type = unfocus target = profile_options_menu 
	DestroyScreenElement id = profile_options_anchor 
	FireEvent type = focus target = sub_menu 
ENDSCRIPT

SCRIPT back_from_profile_error 
	printf "script back_from_profile_error" 
	dialog_box_exit 
	create_internet_options 
ENDSCRIPT

SCRIPT profile_connect 
	dialog_box_exit 
	IF NOT ProfileLogIn 
		create_internet_options 
	ENDIF 
ENDSCRIPT

SCRIPT launch_profile_menu 
	dialog_box_exit 
	IF NOT ScreenElementExists id = menu_play_online 
		create_internet_options 
	ENDIF 
	create_profile_menu 
ENDSCRIPT

SCRIPT add_player_list_menu_item 
	FormatText checksumname = menu_id "player_%a_%b" a = <text> b = <index> 
	make_thugpro_menu_item { 
		text = <text> 
		id = <menu_id> 
		pad_choose_script = <pad_choose_script> 
		pad_choose_params = <pad_choose_params> 
	} 
ENDSCRIPT

SCRIPT launch_player_list_menu 
	hide_current_goal 
	thugpro_menu_create { 
		menu_name = player_list 
		menu_title = "Player List" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = create_pause_menu } 
		boxed 
	} 
	kill_start_key_binding 
	GetPreferenceString pref_type = network network_id 
	make_thugpro_menu_item { 
		text = <ui_string> 
	} 
	FillPlayerListMenu 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT cancel_face_download 
	destroy_onscreen_keyboard 
	create_internet_options 
ENDSCRIPT

SCRIPT face_download_chosen cancel_script = cancel_face_download 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	GetPreferenceString pref_type = network face_dl_key 
	create_onscreen_keyboard { 
		allow_cancel 
		keyboard_cancel_script = <cancel_script> 
		keyboard_done_script = launch_face_download 
		keyboard_title = "Enter password" 
		text = <ui_string> 
		max_length = 50 
		from_net = <from_net> 
	} 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	IF NOT GotParam no_help_box 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = current_menu_anchor 
			id = directions_text 
			text = "Enter the password that was e-mailed\\nto you after submitting your picture." 
			pos = PAIR(320.00000000000, 668.00000000000) 
			dims = PAIR(640.00000000000, 60.00000000000) 
			font = small 
			scale = 0.89999997616 
			rgba = <rgba> 
			line_spacing = 0.64999997616 
			z_priority = 5 
			just = [ center center ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = current_menu_anchor 
			id = directions_box 
			texture = myf_box_mid 
			pos = PAIR(320.00000000000, 670.00000000000) 
			scale = PAIR(12.00000000000, 1.20000004768) 
			just = [ center center ] 
			rgba = <highlight_rgba> 
			z_priority = 5 
		} 
		DoScreenElementMorph id = directions_text time = 0.20000000298 pos = PAIR(320.00000000000, 368.00000000000) 
		DoScreenElementMorph id = directions_box time = 0.20000000298 pos = PAIR(320.00000000000, 370.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT face_dnas_warning 
	dialog_box_exit 
	body = "Before you can download your face, you will need to select THUG 2 Online Play\\n from the Main Menu\\nand authenticate your internet connection." 
	IF ObjectExists id = current_menu 
		FireEvent type = unfocus target = current_menu 
	ENDIF 
	create_dialog_box { 
		title = "Warning!" 
		text = <body> 
		text_dims = PAIR(350.00000000000, 0.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		no_bg = no_bg 
		buttons = [ 
			{ font = small text = "Continue Without Downloading" pad_choose_script = cont_wo_dl_face_dnas } 
			{ font = small text = "Return to Main Menu" pad_choose_script = return_to_main_dnas } 
		] 
	} 
ENDSCRIPT

SCRIPT return_to_main_dnas 
	dialog_box_exit 
	UnloadCaptureDeviceLibraries 
	exit_cas return_script = launch_main_menu 
ENDSCRIPT

SCRIPT cont_wo_dl_face_dnas 
	dialog_box_exit 
	face_map_exit new_script = create_face_map_menu focus_child = 4 
ENDSCRIPT

SCRIPT ok_face_dnas 
	dialog_box_exit 
	create_main_menu 
ENDSCRIPT

SCRIPT launch_face_download 
	IF GotParam from_net 
		Change download_from_online = 1 
	ENDIF 
	GetTextElementString id = keyboard_current_string 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	select_skater_get_current_skater_name 
	IF NOT ( <current_skater> = custom ) 
		load_pro_skater { profile = 0 skater = 0 Name = custom } 
	ENDIF 
	SetPreferencesFromUI prefs = network field = "face_dl_key" <...> 
	printf "Downloading face" 
	create_dialog_box { 
		title = "Downloading Face" 
		text = "Checking for file..." 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_download_face } 
		] 
		no_animate 
	} 
	DownloadFace <...> 
ENDSCRIPT

SCRIPT cancel_download_face 
	Change download_from_online = 0 
	CancelFileTransfer 
	dialog_box_exit 
	net_vault_menu_exit 
	back_from_face_transfer_succeeded_dialog 
ENDSCRIPT

SCRIPT LaunchFaceDownloadCompleteDialog 
	dialog_box_exit 
	net_vault_menu_exit 
	create_dialog_box { 
		title = "Download Complete" 
		text = "Press OK to go map your face." 
		buttons = [ 
			{ text = "OK" pad_choose_script = back_from_face_transfer_succeeded_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT download_content 
	printf "retrieving directory listing" 
	DestroyScreenElement id = current_menu_anchor 
	create_dialog_box { 
		title = net_status_msg 
		text = "Retrieving directory listing..." 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_download_file } 
		] 
		no_animate 
	} 
	DownloadDirectoryList <type> 
ENDSCRIPT

SCRIPT download_selected_file 
	printf "Downloading content" 
	GetTags 
	GetTextElementString id = { <id> child = 0 } 
	SetScriptString string = <string> 
	DestroyScreenElement id = current_menu_anchor 
	create_dialog_box { 
		title = "Downloading File" 
		text = "" 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_download_file } 
		] 
		no_animate 
	} 
	DownloadFile <...> 
ENDSCRIPT

SCRIPT cancel_download_file 
	CancelFileTransfer 
	net_vault_menu_exit 
	dialog_box_exit 
	back_from_transfer_dialog 
ENDSCRIPT

SCRIPT update_transfer_progress 
	IF ObjectExists id = dialog_box_text 
		SetScreenElementProps { 
			id = dialog_box_text 
			text = <text> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_transfer_dialog 
	IF GameModeEquals is_net 
		IF NOT IsTrue from_CAS_face_mapping 
			dialog_box_exit 
			launch_new_ss_menu 
		ELSE 
			Change from_CAS_face_mapping = 0 
			launch_new_ss_menu 
		ENDIF 
	ELSE 
		launch_new_ss_menu 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_transfer_succeeded_dialog 
	dialog_box_exit 
	memcard_menus_cleanup 
	create_internet_options 
	Change savevaultdata = 0 
ENDSCRIPT

SCRIPT LaunchFileNotFoundDialog 
	Change download_from_online = 0 
	net_vault_menu_exit 
	dialog_box_exit 
	create_dialog_box { 
		title = "File Not Found" 
		text = "Please verify that you have entered your key correctly and make sure that you have successfully emailed your face to: faces@thug2online.com." 
		buttons = [ 
			{ text = "ok" pad_choose_script = back_from_transfer_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT LaunchGeneralFileNotFoundDialog 
	net_vault_menu_exit 
	dialog_box_exit 
	create_dialog_box { 
		title = "Server Error" 
		text = "Could not download the selected file. The server may be down. Please try again later." 
		buttons = [ 
			{ text = "ok" pad_choose_script = back_from_transfer_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT LaunchTransferFailedDialog 
	Change download_from_online = 0 
	net_vault_menu_exit 
	dialog_box_exit 
	create_dialog_box { 
		title = "Transfer Failed" 
		text = "Please check your network cables." 
		buttons = [ 
			{ text = "ok" pad_choose_script = back_from_transfer_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT LaunchDownloadCompleteDialog 
	printf "script LaunchDownloadCompleteDialog" 
	net_vault_menu_exit 
	dialog_box_exit 
	PrintStruct <...> 
	IF GotParam type 
		SWITCH <type> 
			CASE parks 
				text = "Save downloaded park?" 
				file_type = park 
			CASE goals 
				text = "Save downloaded goals?" 
				file_type = createdgoals 
			CASE skaters 
				text = "Save downloaded skater?" 
				file_type = optionsandpros 
			CASE tricks 
				text = "Save downloaded trick?" 
				file_type = cat 
			CASE tags 
				text = "Save downloaded graphic?" 
				file_type = createdgraphic 
			DEFAULT 
				printf "save download: invalid type" 
				RETURN 
		ENDSWITCH 
	ELSE 
		printf "save download: missing type" 
		RETURN 
	ENDIF 
	create_dialog_box { 
		title = "Download Complete" 
		text = <text> 
		buttons = [ 
			{ text = "Yes" pad_choose_script = launch_download_save_sequence pad_choose_params = { file_type = <file_type> } } 
			{ text = "No" pad_choose_script = back_from_transfer_succeeded_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT back_from_face_transfer_succeeded_dialog 
	dialog_box_exit 
	IF GameModeEquals is_net 
		SpawnSecondControllerCheck 
		StatsLogOff 
		ProfileLogOff 
		Wait 1 gameframe 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		launch_cas { face2 downloaded_face = downloaded_face } 
	ELSE 
		face_back_from_net_setup 
	ENDIF 
ENDSCRIPT

SCRIPT StartFreeSkate 
	MakeSkaterGosub add_skater_to_world skater = 0 
	MakeSkaterGosub add_skater_to_world skater = 1 
	SetGameType freeskate2p 
	SetCurrentGameType 
	SetScreenModeFromGameMode 
ENDSCRIPT

SCRIPT kill_all_panel_messages 
	exit_pause_menu 
	dialog_box_exit anchor_id = quit_dialog_anchor 
	dialog_box_exit 
	speech_box_exit 
	force_close_rankings 
	close_goals_menu 
	kill_net_panel_messages 
	destroy_onscreen_keyboard 
	TantrumMessageKill 
	IF ObjectExists id = perfect 
		DestroyScreenElement id = perfect 
	ENDIF 
	IF ObjectExists id = perfect2 
		DestroyScreenElement id = perfect2 
	ENDIF 
	IF ObjectExists id = death_message 
		DestroyScreenElement id = death_message 
	ENDIF 
	IF ObjectExists id = leaving_message 
		DestroyScreenElement id = leaving_message 
	ENDIF 
	IF ObjectExists id = goal_message 
		DestroyScreenElement id = goal_message 
	ENDIF 
	kill_panel_message_if_it_exists id = message_THAW_Grind_Count 
	kill_panel_message_if_it_exists id = skater_hint 
	kill_panel_message_if_it_exists id = new_ammo_message 
	kill_panel_message_if_it_exists id = new_ammo_message2 
	kill_panel_message_if_it_exists id = buttslap 
	kill_panel_message_if_it_exists id = buttslap2 
	kill_panel_message_if_it_exists id = boostplantcounter 
	kill_panel_message_if_it_exists id = boostplantcounter2 
	kill_panel_message_if_it_exists id = neuroplantcounter 
	kill_panel_message_if_it_exists id = neuroplantcounter2 
	kill_panel_message_if_it_exists id = maxfocus 
	kill_panel_message_if_it_exists id = pumpkin_smash_message 
	kill_panel_message_if_it_exists id = smash_message 
	kill_panel_message_if_it_exists id = goal_comp_out_of_bounds_warning 
	kill_panel_message_if_it_exists id = panel_message_death 
	IF levelIs Load_ALC 
		kill_panel_message_if_it_exists id = bullseyescore 
	ENDIF 
	IF levelIs Load_VC 
		kill_panel_message_if_it_exists id = hockey_score 
		kill_panel_message_if_it_exists id = combo_gap_message 
	ENDIF 
	IF levelIs Load_Z_EL 
		kill_panel_message_if_it_exists id = message_telegrind1 
	ENDIF 
	IF levelIs Load_AU 
		kill_panel_message_if_it_exists id = wetwarning 
	ENDIF 
	IF levelIs Load_AP 
		kill_panel_message_if_it_exists id = message_circbench 
	ENDIF 
	IF levelIs Load_LA 
		kill_panel_message_if_it_exists id = message_circbench 
		kill_panel_message_if_it_exists id = message_circwall 
		kill_panel_message_if_it_exists id = message_wcombo 
	ENDIF 
	IF levelIs Load_CA 
		kill_panel_message_if_it_exists id = message_rock 
	ENDIF 
	IF levelIs Load_NO 
		kill_panel_message_if_it_exists id = message_panels_broken 
		kill_panel_message_if_it_exists id = message_sign_spun 
		kill_panel_message_if_it_exists id = message_skulltime 
		kill_panel_message_if_it_exists id = message_skulls 
		kill_panel_message_if_it_exists id = message_skulls2 
	ENDIF 
	destroy_edit_theme_preveiw_specialmeter 
	destroy_edit_theme_preveiw_balancemeter 
ENDSCRIPT

SCRIPT StartingNewNetGame 
	destroy_edit_theme_preveiw_specialmeter 
	destroy_edit_theme_preveiw_balancemeter 
	sound_options_exit just_remove 
	edit_tricks_menu_exit just_remove 
	kill_all_panel_messages 
	IF NOT IsObserving 
		skater : RunStarted 
	ENDIF 
	ClearPowerups 
	IF NOT IsObserving 
		ExitSurveyorMode 
	ENDIF 
	IF ScreenElementExists id = screenflash 
		fadetoblack OFF time = <FadeOffTime> id = screenflash 
	ENDIF 
	IF ObjectExists id = killskater_cam 
		SetActiveCamera id = skatercam0 
		killskater_cam : Die 
	ENDIF 
ENDSCRIPT

SCRIPT unlock_root_window 
	SetScreenElementLock id = root_window OFF 
ENDSCRIPT

SCRIPT create_object_label 
	SetScreenElementLock id = root_window OFF 
	IF IsTrue GLOBAL_HideObjectLabels 
		<scale> = 0.00000000000 
	ELSE 
		<scale> = 0.20000000298 
	ENDIF 
	CreateScreenElement { 
		id = <id> 
		type = textElement 
		parent = root_window 
		font = impact 
		text = "" 
		scale = <scale> 
		pos3D = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		rgba = [ 128 128 0 128 ] 
		alpha = 0.80000001192 
	} 
	IF NOT GotParam debug 
		IF InNetGame 
			IF OnServer 
				Server_BroadcastAllFlags 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_object_label_update 
	SetScreenElementLock id = root_window OFF 
	IF IsTrue GLOBAL_HideObjectLabels 
		<scale> = 0.00000000000 
	ELSE 
		IF IsTrue observe_overview_cam_state 
			<scale> = 3 
		ELSE 
			<scale> = 0.20000000298 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		id = <id> 
		type = textElement 
		parent = root_window 
		font = impact 
		text = "" 
		scale = <scale> 
		pos3D = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		rgba = [ 128 128 0 128 ] 
		alpha = 0.80000001192 
	} 
ENDSCRIPT

SCRIPT destroy_object_label 
	IF ObjectExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_all_player_names 
	IF ObjectExists id = skater_name_0 
		DestroyScreenElement id = skater_name_0 
	ENDIF 
	IF ObjectExists id = skater_name_1 
		DestroyScreenElement id = skater_name_1 
	ENDIF 
	IF ObjectExists id = skater_name_2 
		DestroyScreenElement id = skater_name_2 
	ENDIF 
	IF ObjectExists id = skater_name_3 
		DestroyScreenElement id = skater_name_3 
	ENDIF 
	IF ObjectExists id = skater_name_4 
		DestroyScreenElement id = skater_name_4 
	ENDIF 
	IF ObjectExists id = skater_name_5 
		DestroyScreenElement id = skater_name_5 
	ENDIF 
	IF ObjectExists id = skater_name_6 
		DestroyScreenElement id = skater_name_6 
	ENDIF 
	IF ObjectExists id = skater_name_7 
		DestroyScreenElement id = skater_name_7 
	ENDIF 
ENDSCRIPT

SCRIPT update_all_player_names 
	IF ObjectExists id = skater_name_0 
		DestroyScreenElement id = skater_name_0 
		create_object_label_update id = skater_name_0 
	ENDIF 
	IF ObjectExists id = skater_name_1 
		DestroyScreenElement id = skater_name_1 
		create_object_label_update id = skater_name_1 
	ENDIF 
	IF ObjectExists id = skater_name_2 
		DestroyScreenElement id = skater_name_2 
		create_object_label_update id = skater_name_2 
	ENDIF 
	IF ObjectExists id = skater_name_3 
		DestroyScreenElement id = skater_name_3 
		create_object_label_update id = skater_name_3 
	ENDIF 
	IF ObjectExists id = skater_name_4 
		DestroyScreenElement id = skater_name_4 
		create_object_label_update id = skater_name_4 
	ENDIF 
	IF ObjectExists id = skater_name_5 
		DestroyScreenElement id = skater_name_5 
		create_object_label_update id = skater_name_5 
	ENDIF 
	IF ObjectExists id = skater_name_6 
		DestroyScreenElement id = skater_name_6 
		create_object_label_update id = skater_name_6 
	ENDIF 
	IF ObjectExists id = skater_name_7 
		DestroyScreenElement id = skater_name_7 
		create_object_label_update id = skater_name_7 
	ENDIF 
ENDSCRIPT

SCRIPT create_net_metrics 
	SetScreenElementLock id = root_window OFF 
	CreateScreenElement { 
		id = net_metrics 
		type = textElement 
		parent = root_window 
		font = small 
		text = "" 
		scale = 1.00000000000 
		pos = PAIR(150.00000000000, 400.00000000000) 
		rgba = [ 128 128 0 128 ] 
	} 
ENDSCRIPT

SCRIPT update_net_metrics 
	IF NOT ObjectExists id = net_metrics 
		create_net_metrics 
	ENDIF 
	SetScreenElementProps { 
		id = net_metrics 
		text = <text> 
	} 
ENDSCRIPT

SCRIPT notify_cheating 
	IF ( ( request_cheat_toggle ) = 1 ) 
		printf "*          requested that we not notify" 
		Change request_cheat_toggle = 0 
	ELSE 
		printf "*          net_message_server_cheating" 
		create_net_panel_message msg_time = 6000 text = net_message_server_cheating 
	ENDIF 
ENDSCRIPT

SCRIPT notify_client_cheating 
	IF ( ( request_cheat_toggle ) = 1 ) 
		printf "*          requested that we not notify client" 
		Change request_cheat_toggle = 0 
	ELSE 
		FormatText TextName = msg_text "Player %s is cheating!" s = <String0> 
		printf <msg_text> 
		create_net_panel_message msg_time = 6000 text = <msg_text> style = net_team_panel_message 
	ENDIF 
ENDSCRIPT

SCRIPT warn_all_same_team 
	create_net_panel_message id = goal_message text = "Warning: All players are on the same team" style = panel_message_generic_loss msg_time = 5000 
ENDSCRIPT

SCRIPT flash_buddy_message_icon 
ENDSCRIPT

SCRIPT kill_buddy_message_icon 
ENDSCRIPT

SCRIPT GotBuddyMessage 
ENDSCRIPT

SCRIPT ReadLastBuddyMessage 
ENDSCRIPT

SCRIPT InitSelectedGoals 
	GoalManager_InitializeAllSelectedGoals 
	GetGoalsMode 
	IF ( <goals> = goals_classic ) 
		IF IsTrue LEVEL_CLASSIC_GOAL_MODE 
			GoalManager_ActivateAllSelectedGoals 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PatchCleanup 
ENDSCRIPT

judge_full_name = "Quazz" 

