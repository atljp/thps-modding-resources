dialup_authentication_types = [ 
	{ name = "Yes" checksum = yes } 
	{ name = "No" checksum = no } 
] 
device_types = [ 
	{ name = "None" checksum = device_none } 
	{ name = "Ethernet (Network Adaptor for PS2)" checksum = device_broadband_pc } 
	{ name = "Ethernet (Network Adaptor for PS2) (PPPoE)" checksum = device_broadband_pc_pppoe } 
	{ name = "USB Ethernet Adaptor" checksum = device_broadband_usb } 
	{ name = "USB Ethernet Adaptor (PPPoE)" checksum = device_broadband_usb_pppoe } 
	{ name = "Modem (Network Adaptor for PS2)" checksum = device_sony_modem } 
	{ name = "USB Modem" checksum = device_usb_modem } 
] 
device_types_pal = [ 
	{ name = "None" checksum = device_none } 
	{ name = "Network Adaptor (for PlayStation\xAE2)" checksum = device_broadband_pc } 
	{ name = "Network Adaptor (for PlayStation\xAE2) (PPPoE)" checksum = device_broadband_pc_pppoe } 
	{ name = "USB Ethernet Adaptor" checksum = device_broadband_usb } 
	{ name = "USB Ethernet Adaptor (PPPoE)" checksum = device_broadband_usb_pppoe } 
] 
broadband_types = [ 
	{ name = "Auto-Detect (DHCP)" checksum = ip_dhcp } 
	{ name = "Static IP Address" checksum = ip_static } 
] 
boolean_types = [ 
	{ name = "Yes" checksum = boolean_true } 
	{ name = "No" checksum = boolean_false } 
] 
on_off_types = [ 
	{ name = "On" checksum = boolean_true } 
	{ name = "Off" checksum = boolean_false } 
] 
team_types = [ 
	{ name = "None" checksum = teams_none } 
	{ name = "2" checksum = teams_two } 
	{ name = "3" checksum = teams_three } 
	{ name = "4" checksum = teams_four } 
] 
config_types = [ 
	{ name = "Your Network Configuration" checksum = config_sony } 
	{ name = "Manual Settings" checksum = config_manual } 
] 
score_players = [ 
	{ name = "Show Players" checksum = score_players } 
	{ name = "Show Teams" checksum = score_teams } 
] 
ctf_type = [ 
	{ name = "Use Time Limit" checksum = timed_ctf } 
	{ name = "Use Capture Limit" checksum = score_ctf } 
] 
default_master_servers = [ 
	{ name = "205.147.4.17" } 
	{ name = "63.241.179.8" } 
	{ name = "205.147.28.3" } 
] 
rank_limits = [ 
	{ name = "1" checksum = num_1 num = 1 test_greater_only } 
	{ name = "2" checksum = num_2 num = 2 } 
	{ name = "3" checksum = num_3 num = 3 } 
	{ name = "4" checksum = num_4 num = 4 } 
	{ name = "5" checksum = num_5 num = 5 } 
	{ name = "6" checksum = num_6 num = 6 } 
	{ name = "7" checksum = num_7 num = 7 } 
	{ name = "8" checksum = num_8 num = 8 } 
	{ name = "9" checksum = num_9 num = 9 } 
	{ name = "10" checksum = num_10 num = 10 test_less_only } 
] 
rank_tests = [ 
	{ name = "None" checksum = rank_test_none } 
	{ name = "Less Than" checksum = rank_test_less } 
	{ name = "Greater Than" checksum = rank_test_greater } 
] 
team_graffiti_mode = [ 
	{ name = "Combined" checksum = graffiti_team_scoring } 
	{ name = "Individual" checksum = graffiti_individual_scoring } 
] 
default_taunt_preferences = 
{ 
	no_way_string = { ui_string = "No Way" } 
	your_daddy_string = { ui_string = "Who\'s your daddy?" } 
	props_string = { ui_string = "Props" } 
	get_some_string = { ui_string = "Come Get Some" } 
} 
default_network_preferences = { 
	game_type = { ui_string = "Trick Attack" checksum = nettrickattack } 
	num_players = { ui_string = "8 Players" checksum = num_8 value = 8 } 
	num_observers = { ui_string = "No Observers" checksum = num_0 value = 0 } 
	player_collision = { ui_string = "Off" checksum = boolean_false } 
	friendly_fire = { ui_string = "Off" checksum = boolean_false } 
	team_mode = { ui_string = "None" checksum = teams_none } 
	password = { ui_string = "" } 
	level = { ui_string = "Boston" checksum = load_bo } 
	goals = { ui_string = "Classic Goals" checksum = goals_classic } 
	server_name = { ui_string = "Beenox" } 
	network_id = { ui_string = "ProSkater" } 
	ip_address = { ui_string = "192.168.0.10" } 
	gateway = { ui_string = "192.168.0.1" } 
	subnet_mask = { ui_string = "255.255.255.0" } 
	auto_dns = { ui_string = "Yes" checksum = boolean_true } 
	dns_server = { ui_string = "192.168.0.1" } 
	dns_server2 = { ui_string = "192.168.0.2" } 
	device_type = { ui_string = "None" checksum = device_none } 
	broadband_type = { ui_string = "Auto-Detect (DHCP)" checksum = ip_dhcp } 
	dialup_number = { ui_string = "" } 
	dialup_username = { ui_string = "" } 
	dialup_password = { ui_string = "" } 
	time_limit = { ui_string = "2 minutes" checksum = time_120 time = 120 } 
	target_score = { ui_string = "1,000,000 points" checksum = score_1000000 score = 1000000 } 
	host_name = { ui_string = "" } 
	domain_name = { ui_string = "" } 
	dialup_authentication = { ui_string = "Yes" checksum = boolean_true } 
	skill_level = { ui_string = "3: Hold My Own" checksum = num_3 } 
	use_default_master_servers = { ui_string = "Yes" checksum = boolean_true } 
	master_server1 = { ui_string = "0.0.0.0" } 
	master_server2 = { ui_string = "0.0.0.0" } 
	dialup_number2 = { ui_string = "" } 
	dialup_number3 = { ui_string = "" } 
	signed_disclaimer = { ui_string = "No" checksum = boolean_false } 
	profile_email = { ui_string = "" } 
	profile_password = { ui_string = "" } 
	profile_password_confirm = { ui_string = "" } 
	profile_success = { ui_string = "No" checksum = boolean_false } 
	profile_warning_shown = { ui_string = "No" checksum = boolean_false } 
	config_type = { ui_string = "None" checksum = config_sony } 
	unique_id = { ui_string = "123456789" } 
	auto_brake = { ui_string = "On" checksum = boolean_true } 
	show_names = { ui_string = "On" checksum = boolean_true } 
	score_display = { ui_string = "Show Players" checksum = score_players } 
	ctf_game_type = { ui_string = "Use Time Limit" checksum = timed_ctf } 
	stop_at_zero = { ui_string = "No" checksum = boolean_false } 
	score_reset = { ui_string = "No" checksum = boolean_false } 
	face_dl_key = { ui_string = "" } 
	fireball_difficulty = { ui_string = "3" checksum = num_3 fireball_level = 3 } 
	rank_limit = { ui_string = "9" checksum = num_9 num = 9 } 
	rank_test = { ui_string = "None" checksum = rank_test_none } 
	team_graffiti_mode = { ui_string = "Combined" checksum = graffiti_team_scoring } 
	buddy_array = [ ] 
} 
SCRIPT launch_network_options_menu 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_network_options_menu 
ENDSCRIPT

SCRIPT back_from_net_options_menu 
	go_to_sub_menu = 0 
	PauseMusicAndStreams 
	IF IsTrue InNetOptionsFromNetPlay 
		
		go_to_sub_menu = 1 
	ELSE 
		IF IsTrue InNetOptionsFromFaceDownload 
			
			go_to_sub_menu = 1 
		ENDIF 
	ENDIF 
	IF ( <go_to_sub_menu> = 1 ) 
		GetPreferenceChecksum pref_type = network device_type 
		SWITCH <checksum> 
			CASE device_sony_modem 
			CASE device_usb_modem 
				GetPreferenceString pref_type = network dialup_number 
				IF ( <ui_string> = "" ) 
					IF IsTrue InNetOptionsFromNetPlay 
						create_ss_menu 
					ELSE 
						face_back_from_net_setup 
					ENDIF 
				ELSE 
					FormatText TextName = msg_text "***** NOT EMPTY, WAS %s *****" s = <ui_string> 
					
					IF ObjectExists id = current_menu_anchor 
						DestroyScreenElement id = current_menu_anchor 
					ENDIF 
					IF IsTrue InNetOptionsFromNetPlay 
						do_network_setup error_script = back_from_startup_error_dialog success_script = net_setup_from_net_play_successful need_setup_script = create_net_startup_need_setup_dialog 
					ELSE 
						do_network_setup error_script = face_back_from_net_setup success_script = create_face_download_menu_from_net_setup need_setup_script = face_create_net_startup_need_setup_dialog 
					ENDIF 
				ENDIF 
			CASE device_none 
				IF IsTrue InNetOptionsFromNetPlay 
					create_ss_menu 
				ELSE 
					face_back_from_net_setup 
				ENDIF 
			DEFAULT 
				IF ObjectExists id = current_menu_anchor 
					DestroyScreenElement id = current_menu_anchor 
				ENDIF 
				IF IsTrue InNetOptionsFromNetPlay 
					do_network_setup error_script = back_from_startup_error_dialog success_script = net_setup_from_net_play_successful need_setup_script = create_net_startup_need_setup_dialog 
				ELSE 
					do_network_setup error_script = face_back_from_net_setup success_script = create_face_download_menu_from_net_setup need_setup_script = face_create_net_startup_need_setup_dialog 
				ENDIF 
		ENDSWITCH 
		change InNetOptionsFromNetPlay = 0 
		change InNetOptionsFromFaceDownload = 0 
		UnpauseMusicAndStreams 
	ELSE 
		launch_ss_menu 
		UnpauseMusicAndStreams 
	ENDIF 
ENDSCRIPT

SCRIPT net_options_menu_back_from_keyboard 
	destroy_onscreen_keyboard 
	create_network_options_menu 
ENDSCRIPT

SCRIPT net_options_set_connection_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = network <...> 
	destroy_onscreen_keyboard 
	create_network_options_menu 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_net_options_menu 
	pulse_blur 
	create_onscreen_keyboard { in_ss allow_cancel keyboard_cancel_script = net_options_menu_back_from_keyboard keyboard_done_script = net_options_set_connection_preference keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT create_network_options_menu 
	skater : unhide 
	make_new_themed_sub_menu title = "ONLINE PREFERENCES" 
	UnpauseMusicAndStreams 
	IF levelis Load_MainMenu 
		build_top_and_bottom_blocks 
		make_mainmenu_3d_plane 
	ENDIF 
	create_helper_text = generic_helper_text pos = PAIR(225.00000000000, 109.00000000000) 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = back_from_net_options_menu } } 
		] 
	} 
	GetPreferenceString pref_type = network network_id 
	theme_menu_add_item { text = #"Player Name" 
		centered 
		id = menu_player_name 
		pad_choose_script = ss_menu_exit 
		pad_choose_params = { new_menu_script = launch_onscreen_keyboard_from_net_options_menu 
			field = "network_id" 
			text = <ui_string> 
			title = "PLAYER NAME" 
			min_length = 1 
			max_length = 15 
			highlight_bar_scale = PAIR(1.39999997616, 1.29999995232) 
		} 
	} 
	theme_menu_add_item text = <ui_string> id = menu_player_name_str centered not_focusable 
	theme_menu_add_item text = "Done" id = network_option_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = back_from_net_options_menu } centered last_menu_item = last_menu_item 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT maybe_load_net_settings 
	skater : hide 
	IF CanChangeDevices 
		launch_load_network_settings 
	ELSE 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_net_load_refused_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT refuse_net_configuration 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_net_load_refused_dialog 
ENDSCRIPT

SCRIPT maybe_change_current_net_settings 
	IF CanChangeDevices 
		launch_configuration_choices_menu 
	ELSE 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_net_load_refused_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT launch_configuration_choices_menu 
	DestroyScreenElement id = current_menu_anchor 
	make_new_themed_sub_menu title = "NETWORK CONFIGURATION" title_scale = 1.70000004768 skateshop_pos = PAIR(240.00000000000, 72.00000000000) 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane 
	create_helper_text = generic_helper_text 
	SetScreenElementProps id = sub_vmenu event_handlers = [ { pad_back launch_network_options_menu } ] 
	theme_menu_add_item text = "Your Network Configuration Files" id = network_config_load_config pad_choose_script = choose_sony_combination centered 
	theme_menu_add_item text = "Manual Settings" id = network_option_manual_setup pad_choose_script = choose_manual_setup last_menu_item = last_menu_item centered 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT choose_sony_combination 
	launch_load_net_config 
ENDSCRIPT

SCRIPT choose_manual_setup 
	GetPreferenceChecksum pref_type = network config_type 
	SWITCH <checksum> 
		CASE config_sony 
			clear_net_options 
	ENDSWITCH 
	SetPreferencesFromUI prefs = network field = "config_type" string = "Manual Settings" checksum = config_manual 
	launch_manual_net_setup 
ENDSCRIPT

SCRIPT clear_config_type 
	SetPreferencesFromUI prefs = network field = "config_type" string = "None" checksum = config_sony 
ENDSCRIPT

SCRIPT clear_device_type 
	SetPreferencesFromUI prefs = network field = "device_type" string = "None" checksum = device_none 
ENDSCRIPT

SCRIPT clear_net_options 
	SetPreferencesFromUI prefs = network field = "dialup_number" string = "" 
	SetPreferencesFromUI prefs = network field = "dialup_username" string = "" 
	SetPreferencesFromUI prefs = network field = "dialup_password" string = "" 
	SetPreferencesFromUI prefs = network field = "broadband_type" string = "Auto-Detect (DHCP)" checksum = ip_dhcp 
	SetPreferencesFromUI prefs = network field = "ip_address" string = "192.168.0.10" 
	SetPreferencesFromUI prefs = network field = "gateway" string = "192.168.0.1" 
	SetPreferencesFromUI prefs = network field = "subnet_mask" string = "255.255.255.0" 
	SetPreferencesFromUI prefs = network field = "dns_server" string = "0.0.0.0" 
	SetPreferencesFromUI prefs = network field = "dns_server2" string = "0.0.0.0" 
	SetPreferencesFromUI prefs = network field = "auto_dns" string = "Yes" checksum = boolean_true 
	SetPreferencesFromUI prefs = network field = "host_name" string = "" 
	SetPreferencesFromUI prefs = network field = "domain_name" string = "" 
	SetPreferencesFromUI prefs = network field = "dialup_authentication" string = "Yes" checksum = boolean_true 
ENDSCRIPT

SCRIPT maybe_launch_load_net_config 
	IF CanChangeDevices 
		launch_load_net_config 
	ELSE 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_net_load_refused_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT launch_load_net_config 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = _CreationOptionsLoadNetConfig 
ENDSCRIPT

SCRIPT _CreationOptionsLoadNetConfig 
	SpawnScript CreationOptionsLoadNetConfig 
ENDSCRIPT

SCRIPT back_from_load_net_config 
	memcard_menus_cleanup 
	dialog_box_exit 
	create_network_options_menu 
ENDSCRIPT

SCRIPT CreationOptionsLoadNetConfig 
	change RetryScript = CreationOptionsLoadNetConfig 
	change AbortScript = back_from_load_net_config 
	change SavingOrLoading = Loading 
	check_card 
	IF LoadNetConfigs 
		dialog_box_exit 
		IF NoNetConfigFiles 
			IF IsPal 
				create_error_box { title = "None Found" 
					text = net_error_no_net_configs_pal 
					buttons = [ { text = "ok" pad_choose_script = back_from_load_net_config } 
					] 
				} 
			ELSE 
				create_error_box { title = "None Found" 
					text = net_error_no_net_configs 
					buttons = [ { text = "ok" pad_choose_script = back_from_load_net_config } 
					] 
				} 
			ENDIF 
		ELSE 
			create_load_net_config_menu 
		ENDIF 
	ELSE 
		dialog_box_exit 
		IF GotParam corrupt 
			create_error_box { title = net_error_msg 
				text = "This Your Network Configuration file is corrupt and cannot be used." 
				buttons = [ { text = "ok" pad_choose_script = back_from_load_net_config } 
				] 
			} 
		ELSE 
			create_error_box { title = net_error_msg 
				text = "Your Network Configuration file was created on another console and cannot be used." 
				buttons = [ { text = "ok" pad_choose_script = back_from_load_net_config } 
				] 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT choose_net_config 
	change NeedsToTestDNAS = 1 
	ChooseNetConfig <...> 
	launch_network_options_menu 
ENDSCRIPT

SCRIPT create_load_net_config_menu 
	make_new_themed_sub_menu title = "LOAD NETWORK CONFIGURATION" title_scale = 1.39999997616 skateshop_pos = PAIR(230.00000000000, 72.00000000000) 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane 
	create_helper_text = generic_helper_text 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back launch_network_options_menu } 
		] 
	} 
	FillNetConfigList 
	theme_menu_add_item text = "Cancel" scale = 0.80000001192 focus_script = main_theme_focus_noscale unfocus_script = main_theme_unfocus_noscale id = network_option_connection_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_network_options_menu } last_menu_item = last_menu_item centered 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT launch_manual_net_setup 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_manual_net_setup 
ENDSCRIPT

SCRIPT create_manual_net_setup 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF levelis Load_MainMenu 
		make_new_themed_sub_menu title = "NETWORK SETUP" 
	ELSE 
		make_new_themed_sub_menu title = "NETWORK SETUP" skateshop_pos = PAIR(135.00000000000, 55.00000000000) 
	ENDIF 
	IF levelis Load_MainMenu 
		build_top_and_bottom_blocks 
		make_mainmenu_3d_plane 
	ENDIF 
	create_helper_text = generic_helper_text 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back launch_network_options_menu } 
		] 
	} 
	GetPreferenceString pref_type = network network_id 
	theme_menu_add_item text = "Online Player Name" id = network_option_player_name pad_choose_script = launch_onscreen_keyboard_from_setup_menu pad_choose_params = { field = "network_id" text = <ui_string> title = "NETWORK PLAYER NAME" min_length = 1 max_length = 15 } centered 
	theme_menu_add_item text = <ui_string> font = dialog id = network_option_player_name_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 not_focusable = not_focusable centered 
	IF NOT OnXBox 
		GetPreferenceChecksum pref_type = network device_type 
		IF ( <checksum> = device_none ) 
			GetPreferenceString pref_type = network device_type 
			theme_menu_add_item text = "Hardware Setup" id = network_option_hardware_setup pad_choose_script = launch_hardware_setup centered 
			theme_menu_add_item text = <ui_string> font = dialog id = network_option_hardware_setup_string rgba = [ 80 80 80 128 ] scale = 0.69999998808 not_focusable = not_focusable centered 
		ELSE 
			GetPreferenceString pref_type = network device_type 
			theme_menu_add_item text = "Hardware Setup" id = network_option_hardware_setup pad_choose_script = launch_hardware_setup centered 
			theme_menu_add_item text = <ui_string> font = dialog id = network_option_hardware_setup_string rgba = [ 80 80 80 128 ] scale = 0.69999998808 not_focusable = not_focusable centered 
			GetPreferenceChecksum pref_type = network device_type 
			theme_menu_add_item text = "Connection Settings" id = network_option_connection_settings pad_choose_script = launch_connection_settings centered 
		ENDIF 
	ENDIF 
	theme_menu_add_item text = "Done" id = network_option_connection_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_network_options_menu } last_menu_item = last_menu_item centered 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_setup_menu 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_setup_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = net_setup_back_from_keyboard keyboard_done_script = set_connection_preference keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_ss_menu 
	pulse_blur 
	create_onscreen_keyboard { in_ss allow_cancel keyboard_cancel_script = ss_menu_back_from_keyboard keyboard_done_script = ss_set_connection_preference keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT pre_create_setup_onscreen_keyboard 
	create_onscreen_keyboard <...> 
ENDSCRIPT

SCRIPT launch_phone_entry 
	launch_onscreen_keyboard <...> allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "," "*" "#" ] 
ENDSCRIPT

SCRIPT launch_email_keyboard 
	launch_onscreen_keyboard_from_profile_menu <...> allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" 
		"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" 
		"k" "l" "m" "n" "o" "p" "q" "r" "s" "t" 
		"u" "v" "w" "x" "y" "z" 
		"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" 
		"K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" 
		"U" "V" "W" "X" "Y" "Z" 
	"." "-" "_" "@" ] 
ENDSCRIPT

SCRIPT launch_ip_entry 
	launch_onscreen_keyboard <...> allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "." ] 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_setup_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = net_options_back_from_keyboard keyboard_done_script = set_manual_connection_preference keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT back_from_hardware_setup_refused_dialog 
	dialog_box_exit 
	create_manual_net_setup 
ENDSCRIPT

SCRIPT back_from_load_refused_dialog 
	dialog_box_exit 
	create_network_options_menu 
ENDSCRIPT

SCRIPT launch_hardware_setup_refused_dialog 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_hardware_setup_refused_dialog 
ENDSCRIPT

SCRIPT create_hardware_setup_refused_dialog 
	create_dialog_box { title = net_notice_msg 
		text = net_error_cant_change_device 
		buttons = [ { text = "ok" pad_choose_script = back_from_hardware_setup_refused_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT create_net_load_refused_dialog 
	create_dialog_box { title = net_notice_msg 
		text = net_error_cant_load_settings 
		buttons = [ { text = "back" pad_choose_script = back_from_load_refused_dialog } 
			{ text = "restart" pad_choose_script = restart_ps2 } 
		] 
	} 
ENDSCRIPT

SCRIPT restart_ps2 
	IF IsPal 
		IF IsFrench 
			LoadExecPS2 elf = "cdrom0:\\SLES_522.90" 
		ELSE 
			LoadExecPS2 elf = "cdrom0:\\SLES_512.97" 
		ENDIF 
	ELSE 
		LoadExecPS2 elf = "cdrom0:\\SLUS_203.99" 
	ENDIF 
ENDSCRIPT

SCRIPT launch_hardware_setup 
	IF CanChangeDevices 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_hardware_setup_menu 
	ELSE 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_hardware_setup_refused_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT launch_connection_settings 
	IF ObjectExists id = current_menu_anchor 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_settings 
	ELSE 
		dialog_box_exit 
		create_connection_settings 
	ENDIF 
ENDSCRIPT

SCRIPT create_connection_settings 
	GetPreferenceChecksum pref_type = network device_type 
	SWITCH <checksum> 
		CASE device_broadband_pc 
		CASE device_broadband_usb 
			create_ethernet_connection_settings_menu 
		CASE device_broadband_pc_pppoe 
		CASE device_broadband_usb_pppoe 
			create_pppoe_connection_settings_menu 
		DEFAULT 
			create_modem_connection_settings_menu 
	ENDSWITCH 
ENDSCRIPT

SCRIPT launch_connection_type_sub_menu 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_type_sub_menu 
ENDSCRIPT

SCRIPT launch_connection_auto_dns_sub_menu 
	IF GotParam always_allow 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_auto_dns_sub_menu 
	ELSE 
		IF CanChangeDevices 
			RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_auto_dns_sub_menu 
		ELSE 
			RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_hardware_setup_refused_dialog 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT launch_connection_use_auth_sub_menu 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_use_auth_sub_menu 
ENDSCRIPT

SCRIPT create_hardware_setup_menu 
	make_new_themed_sub_menu title = "HARDWARE SETUP" skateshop_pos = PAIR(180.00000000000, 55.00000000000) 
	IF levelis Load_MainMenu 
		build_top_and_bottom_blocks 
		make_mainmenu_3d_plane 
	ENDIF 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back launch_manual_net_setup } 
		] 
	} 
	create_hardware_setup_device_sub_menu 
	create_helper_text generic_helper_text 
	IF levelis Load_MainMenu 
		createScreenElement { type = textElement parent = sub_menu font = dialog rgba = [ 60 60 60 100 ] text = "* Most DSL users should select PPPoE devices" scale = 0.69999998808 pos = PAIR(250.00000000000, 250.00000000000) } 
	ELSE 
		createScreenElement { type = textElement parent = sub_menu font = dialog rgba = [ 60 60 60 100 ] text = "* Most DSL users should select PPPoE devices" scale = 0.69999998808 pos = PAIR(250.00000000000, 275.00000000000) } 
	ENDIF 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_ethernet_connection_settings_menu 
	make_new_themed_sub_menu title = "NETWORK SETUP" skateshop_pos = PAIR(110.00000000000, 55.00000000000) 
	IF levelis Load_MainMenu 
		build_top_and_bottom_blocks 
		make_mainmenu_3d_plane 
	ENDIF 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back launch_manual_net_setup } 
		] 
	} 
	create_helper_text generic_helper_text 
	GetPreferenceString pref_type = network broadband_type 
	theme_menu_add_centered_item text = "Type" id = network_connection_type pad_choose_script = launch_connection_type_sub_menu 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_type_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceChecksum pref_type = network broadband_type 
	IF ( <checksum> = ip_static ) 
		GetPreferenceString pref_type = network ip_address 
		theme_menu_add_centered_item text = "IP Address" id = network_connection_ip pad_choose_script = launch_ip_entry pad_choose_params = { field = "ip_address" text = <ui_string> title = "IP ADDRESS" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_ip_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		GetPreferenceString pref_type = network gateway 
		theme_menu_add_centered_item text = "Gateway" id = network_connection_gateway pad_choose_script = launch_ip_entry pad_choose_params = { field = "gateway" text = <ui_string> title = "GATEWAY" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_gateway_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		GetPreferenceString pref_type = network subnet_mask 
		theme_menu_add_centered_item text = "Subnet Mask" id = network_connection_subnet pad_choose_script = launch_ip_entry pad_choose_params = { field = "subnet_mask" text = <ui_string> title = "SUBNET MASK" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_subnet_mask_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	ELSE 
		GetPreferenceString pref_type = network host_name 
		theme_menu_add_centered_item text = "* Hostname" id = network_connection_hostname pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "host_name" text = <ui_string> title = "HOSTNAME" min_length = 0 max_length = 31 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_hostname_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		GetPreferenceString pref_type = network auto_dns 
		theme_menu_add_centered_item text = "Auto-Obtain DNS Servers?" id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu pad_choose_params = { always_allow } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	ENDIF 
	GetPreferenceChecksum pref_type = network auto_dns 
	IF ( <checksum> = boolean_false ) 
		GetPreferenceString pref_type = network dns_server 
		theme_menu_add_centered_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server" text = <ui_string> title = "DNS SERVER 1" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		GetPreferenceString pref_type = network dns_server2 
		theme_menu_add_centered_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server2" text = <ui_string> title = "DNS SERVER 2" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	ENDIF 
	GetPreferenceChecksum pref_type = network broadband_type 
	IF ( <checksum> = ip_dhcp ) 
		theme_menu_add_centered_item text = "* Required by some ISPs" id = hostname_footnote not_focusable = not_focusable rgba = [ 80 80 80 128 ] scale = 0.69999998808 
	ENDIF 
	theme_menu_add_centered_item text = "Done" pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_manual_net_setup } last_menu_item = last_menu_item 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_pppoe_connection_settings_menu 
	make_new_themed_sub_menu title = "CONNECTION SETTINGS" skateshop_pos = PAIR(110.00000000000, 55.00000000000) 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back launch_manual_net_setup } 
		] 
	} 
	create_helper_text generic_helper_text 
	GetPreferenceString pref_type = network dialup_username 
	theme_menu_add_centered_item text = "Username" id = network_connection_username pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_username" text = <ui_string> title = "USERNAME" min_length = 1 max_length = 47 } 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_username_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceString pref_type = network dialup_password 
	GetPreferencePassword pref_type = network dialup_password 
	theme_menu_add_centered_item text = "Password" id = network_connection_password pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_password" text = <ui_string> title = "PASSWORD" min_length = 1 max_length = 47 password } 
	theme_menu_add_centered_item text = <password_string> id = network_connection_password_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceChecksum pref_type = network auto_dns 
	GetPreferenceString pref_type = network auto_dns 
	theme_menu_add_centered_item text = "Auto-Obtain DNS Servers?" id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu pad_choose_params = { always_allow } 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	IF ( <checksum> = boolean_false ) 
		GetPreferenceString pref_type = network dns_server 
		theme_menu_add_centered_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dns_server" text = <ui_string> title = "DNS SERVER 1" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		GetPreferenceString pref_type = network dns_server2 
		theme_menu_add_centered_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dns_server2" text = <ui_string> title = "DNS SERVER 2" min_length = 7 max_length = 15 } 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] scale = 0.80000001192 font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	ENDIF 
	theme_menu_add_centered_item text = "" not_focusable = not_focusable last_menu_item = last_menu_item 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_modem_connection_settings_menu 
	make_new_themed_sub_menu title = "CONNECTION SETTINGS" skateshop_pos = PAIR(110.00000000000, 55.00000000000) 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back launch_manual_net_setup } 
		] 
	} 
	create_helper_text generic_helper_text 
	GetPreferenceChecksum pref_type = network auto_dns 
	IF ( <checksum> = boolean_false ) 
		scale = 1.00000000000 
	ELSE 
		scale = 0.80000001192 
	ENDIF 
	GetPreferenceString pref_type = network dialup_number 
	theme_menu_add_centered_item text = "ISP Phone Number" id = network_connection_isp_phone pad_choose_script = launch_phone_entry pad_choose_params = { field = "dialup_number" text = <ui_string> title = "ISP PHONE NUMBER" min_length = 7 max_length = 20 } 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_isp_phone_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceString pref_type = network dialup_username 
	theme_menu_add_centered_item text = "Username" id = network_connection_username pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_username" text = <ui_string> title = "USERNAME" min_length = 1 max_length = 36 } 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_username_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceString pref_type = network dialup_password 
	GetPreferencePassword pref_type = network dialup_password 
	theme_menu_add_centered_item text = "Password" id = network_connection_password pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_password" text = <ui_string> title = "PASSWORD" min_length = 1 max_length = 36 password } 
	theme_menu_add_centered_item text = <password_string> id = network_connection_password_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceChecksum pref_type = network dialup_authentication 
	GetPreferenceString pref_type = network dialup_authentication 
	theme_menu_add_centered_item text = "Use Authentication?" id = network_connection_use_auth pad_choose_script = launch_connection_use_auth_sub_menu 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_use_auth_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceString pref_type = network auto_dns 
	theme_menu_add_centered_item text = "Auto-Obtain DNS Servers?" id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu 
	theme_menu_add_centered_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
	GetPreferenceChecksum pref_type = network auto_dns 
	IF ( <checksum> = boolean_false ) 
		GetPreferenceString pref_type = network dns_server 
		IF CanChangeDevices 
			theme_menu_add_centered_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server" text = <ui_string> title = "DNS SERVER 1" min_length = 7 max_length = 15 } 
		ELSE 
			theme_menu_add_centered_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_hardware_setup_refused_dialog 
		ENDIF 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		GetPreferenceString pref_type = network dns_server2 
		IF CanChangeDevices 
			theme_menu_add_centered_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server2" text = <ui_string> title = "DNS SERVER 2" min_length = 7 max_length = 15 } 
		ELSE 
			theme_menu_add_centered_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_hardware_setup_refused_dialog 
		ENDIF 
		theme_menu_add_centered_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] scale = <scale> font = dialog not_focusable = not_focusable box_it_up = box_it_up 
		DoScreenElementMorph id = sub_vmenu scale = 0.85000002384 pos = PAIR(100.00000000000, 60.00000000000) 
	ENDIF 
	theme_menu_add_centered_item text = "" not_focusable = not_focusable last_menu_item = last_menu_item 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT select_connection_option 
	SetPreferencesFromUI <...> 
	IF ( <checksum> = ip_static ) 
		SetPreferencesFromUI prefs = <prefs> field = "auto_dns" checksum = boolean_false string = "No" 
	ELSE 
		IF ( <checksum> = ip_dhcp ) 
			SetPreferencesFromUI prefs = <prefs> field = "auto_dns" checksum = boolean_true string = "Yes" 
		ENDIF 
	ENDIF 
	launch_connection_settings 
ENDSCRIPT

SCRIPT select_hardware_option 
	SetPreferencesFromUI <...> 
	launch_manual_net_setup 
ENDSCRIPT

SCRIPT create_hardware_setup_sub_menu 
	generic_array_menu_setup <...> 
ENDSCRIPT

SCRIPT create_hardware_setup_device_sub_menu 
	IF IsPal 
		create_hardware_setup_sub_menu pref_type = network pref_field = "device_type" array = device_types_pal call_script = select_hardware_option highlight_bar_scale = <highlight_bar_scale> scale = <scale> 
	ELSE 
		create_hardware_setup_sub_menu pref_type = network pref_field = "device_type" array = device_types call_script = select_hardware_option highlight_bar_scale = <highlight_bar_scale> scale = <scale> 
	ENDIF 
ENDSCRIPT

SCRIPT create_connection_type_sub_menu 
	menu_title = "Connection Type" 
	pref_type = network 
	pref_field = "broadband_type" 
	array = broadband_types 
	call_script = select_connection_option 
	create_dialog_box { title = <menu_title> 
		text = "Which type of connection do you use?" 
		buttons = [ { text = "Auto-Detect (DHCP)" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Auto-Detect (DHCP)" checksum = ip_dhcp <...> } } 
			{ text = "Static IP Address" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Static IP Address" checksum = ip_static <...> } } 
		] 
	} 
ENDSCRIPT

SCRIPT create_connection_auto_dns_sub_menu 
	menu_title = "DNS Servers" 
	pref_type = network 
	pref_field = "auto_dns" 
	array = boolean_types 
	call_script = select_connection_option 
	create_dialog_box { title = <menu_title> 
		text = "Do you want to auto obtain DNS servers?" 
		buttons = [ { text = "Yes" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Yes" checksum = boolean_true <...> } } 
			{ text = "No" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "No" checksum = boolean_false <...> } } 
		] 
	} 
ENDSCRIPT

SCRIPT create_connection_use_auth_sub_menu 
	menu_title = "Authentication" 
	pref_type = network 
	pref_field = "dialup_authentication" 
	array = boolean_types 
	call_script = select_connection_option 
	create_dialog_box { title = <menu_title> 
		text = "Use authentication?" 
		buttons = [ { text = "Yes" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Yes" checksum = boolean_true <...> } } 
			{ text = "No" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "No" checksum = boolean_false <...> } } 
		] 
	} 
ENDSCRIPT

SCRIPT set_connection_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = network <...> 
	destroy_onscreen_keyboard 
	create_manual_net_setup 
ENDSCRIPT

SCRIPT ss_set_connection_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = network <...> 
	destroy_onscreen_keyboard 
	launch_ss_menu 
ENDSCRIPT

SCRIPT set_manual_connection_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = network <...> 
	destroy_onscreen_keyboard 
	create_connection_settings 
ENDSCRIPT

SCRIPT net_options_back_from_keyboard 
	destroy_onscreen_keyboard 
	create_connection_settings 
ENDSCRIPT

SCRIPT net_setup_back_from_keyboard 
	destroy_onscreen_keyboard 
	create_manual_net_setup 
ENDSCRIPT

SCRIPT ss_menu_back_from_keyboard 
	destroy_onscreen_keyboard 
	launch_ss_menu no_animate 
ENDSCRIPT

SCRIPT back_from_startup_error_dialog 
	UnpauseMusicAndStreams 
	
	dialog_box_exit 
	IF ObjectExists id = select_skater_anchor 
		DestroyScreenElement id = select_skater_anchor 
		restore_start_key_binding 
	ENDIF 
	skater : Obj_MoveToNode name = trg_playerrestart Orient NoReset 
	skater : CancelRotateDisplay 
	create_main_menu 
ENDSCRIPT

SCRIPT create_net_startup_error_dialog 
	create_dialog_box { title = net_error_msg 
		text = <text> 
		buttons = [ { text = "ok" pad_choose_script = <error_script> } 
		] 
	} 
ENDSCRIPT

SCRIPT go_to_connection_setup_from_dialog 
	dialog_box_exit 
	change InNetOptionsFromNetPlay = 1 
	change InNetOptionsFromFaceDownload = 0 
	create_network_options_menu 
ENDSCRIPT

SCRIPT create_net_startup_need_setup_dialog 
	
	create_dialog_box { title = net_status_msg 
		text = <text> 
		buttons = [ { text = " Yes " pad_choose_script = go_to_connection_setup_from_dialog } 
			{ text = " No " pad_choose_script = <error_script> } 
		] 
	} 
ENDSCRIPT

SCRIPT create_testing_network_settings_dialog 
	create_dialog_box { title = net_status_msg 
		text = net_status_testing_settings 
	} 
ENDSCRIPT


