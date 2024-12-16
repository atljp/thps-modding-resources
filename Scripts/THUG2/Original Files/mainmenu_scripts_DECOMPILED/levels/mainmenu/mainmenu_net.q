
SCRIPT join_chosen 
	IF FoundServers 
		StopServerList 
		SetJoinMode JOIN_MODE_PLAY 
		actions_menu_anchor : DoMorph scale = 0 
		DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 1 
		DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 1 
		build_theme_sub_title title = "GAME INFO" parent = server_list_anchor 
		hide_internet_only_menus keep_chat 
		server_desc_menu_anchor : DoMorph scale = 1 
		FireEvent type = unfocus target = actions_menu 
		FireEvent type = focus target = server_list_menu 
		change current_lobby_focus = 1 
		AssignAlias id = server_list_menu alias = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT observe_chosen 
	IF FoundServers 
		StopServerList 
		SetJoinMode JOIN_MODE_OBSERVE 
		actions_menu_anchor : DoMorph scale = 0 
		build_theme_sub_title title = "GAME INFO" parent = server_list_anchor 
		hide_internet_only_menus keep_chat 
		server_desc_menu_anchor : DoMorph scale = 1 
		FireEvent type = unfocus target = actions_menu 
		FireEvent type = focus target = server_list_menu 
		change current_lobby_focus = 1 
		AssignAlias id = server_list_menu alias = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT user_list_chosen 
	StopServerList 
	DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 1 
	DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 1 
	FireEvent type = unfocus target = actions_menu 
	FireEvent type = focus target = lobby_player_list_menu 
	change current_lobby_focus = 2 
	AssignAlias id = lobby_player_list_menu alias = current_menu 
ENDSCRIPT

SCRIPT refresh_chosen 
	RefreshServerList 
	IF InInternetMode 
		FillPlayerList 
	ENDIF 
ENDSCRIPT

SCRIPT refocus_actions_menu 
	FireEvent type = unfocus target = server_list_menu 
	FireEvent type = focus target = actions_menu 
	change current_lobby_focus = 0 
	AssignAlias id = actions_menu alias = current_menu 
	build_theme_sub_title title = "ACTIONS" parent = server_list_anchor 
	IF InInternetMode 
		FireEvent type = unfocus target = lobby_player_list_menu 
		DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 0 
		DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 0 
		DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 0 
		DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 0 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1 
		IF ObjectExists id = console_message_vmenu 
			DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
		ENDIF 
		DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT refocus_gamelist_menu 
	SetScreenElementProps id = game_list_up_arrow alpha = 1 
	SetScreenElementProps id = game_list_down_arrow alpha = 1 
	FireEvent type = unfocus target = server_desc_menu 
	FireEvent type = focus target = server_list_menu 
ENDSCRIPT

SCRIPT back_from_internet_options 
	CleanUpTopStats 
	StatsLogOff 
	ProfileLogOff 
	SetNetworkMode 
	DestroyScreenElement id = current_menu_anchor 
	select_skater_relight_skater 
	create_ss_menu 
ENDSCRIPT

SCRIPT create_profile_warning_dialog 
	create_dialog_box { title = "GameSpy Profile" 
		text = "Would you like to create a GameSpy profile? When logged in with a profile, you can find friends more easily and track high scores." 
		buttons = [ { text = "Yes" pad_choose_script = launch_profile_menu } 
			{ text = " No " pad_choose_script = create_internet_options } 
		] 
	} 
ENDSCRIPT

SCRIPT hide_internet_only_menus 
	IF InInternetMode 
		IF NOT GotParam keep_chat 
			IF ObjectExists id = console_message_vmenu 
				DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
			ENDIF 
			DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0 
		ENDIF 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT create_internet_options 
	ClearMemcardDataForUpload 
	dialog_box_exit 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	GetPreferenceChecksum pref_type = network profile_warning_shown 
	IF ( <checksum> = boolean_false ) 
		SetPreferencesFromUI prefs = network field = "profile_warning_shown" checksum = boolean_true string = "Yes" 
		create_profile_warning_dialog 
		RETURN 
	ENDIF 
	change in_net_lobby = 0 
	change has_accepted_dnas = 1 
	make_new_themed_sub_menu title = "INTERNET OPTIONS" skateshop_pos = PAIR(355.00000000000, 78.00000000000) 
	SetScreenElementProps { id = sub_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = back_from_internet_options } } 
		] 
	} 
	theme_menu_add_item { 
		text = "Play Online" 
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
			{ focus PlayHelperDesc params = { play_online_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	IF NOT ProfileLoggedIn 
		IF IsTrue DEMO_BUILD 
			theme_menu_add_item { 
				text = "Login/Create Profile" 
				id = menu_create_profile 
				not_focusable = not_focusable 
				centered 
			} 
		ELSE 
			theme_menu_add_item { 
				text = "Login/Create Profile" 
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
					{ focus PlayHelperDesc params = { login_profile_helper_desc } } 
					{ unfocus StopHelperDesc } 
				] 
			} 
		ENDIF 
	ELSE 
		theme_menu_add_item { 
			text = "Change GameSpy Login" 
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
				{ focus PlayHelperDesc params = { login_profile_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ENDIF 
	IF IsTrue DEMO_BUILD 
		theme_menu_add_item { 
			text = "Upload" 
			id = menu_upload 
			not_focusable = not_focusable 
			centered 
		} 
		theme_menu_add_item { 
			text = "Download" 
			id = menu_download 
			not_focusable = not_focusable 
			centered 
			last_menu_item = last_menu_item 
		} 
	ELSE 
		theme_menu_add_item { 
			text = "Save Settings" 
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
				{ focus PlayHelperDesc params = { save_settings_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
		theme_menu_add_item { 
			text = "Online Stats" 
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
				{ focus PlayHelperDesc params = { online_stats_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ENDIF 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		texture = satellite 
		scale = 1 
		pos = PAIR(55.00000000000, 210.00000000000) 
		just = [ center center ] 
		rot_angle = -50 
		alpha = 0.30000001192 
		rgba = <rgba> 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		id = internet_options_icon 
		texture = io_play 
		scale = 1.50000000000 
		pos = PAIR(210.00000000000, 275.00000000000) 
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
		pos = PAIR(130.00000000000, 130.00000000000) 
		just = [ left top ] 
		rot_angle = 10 
		alpha = 0.10000000149 
		rgba = <rgba> 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		id = globe 
		texture = globe 
		scale = 1.29999995232 
		pos = PAIR(300.00000000000, 480.00000000000) 
		just = [ center center ] 
		alpha = 0.40000000596 
		z_priority = 0 
	} 
	RunScriptOnScreenElement id = globe rotate_internet_options_globe 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT internet_options_focus 
	SetScreenElementProps id = internet_options_icon texture = <texture> 
	main_theme_focus <...> 
	DoScreenElementMorph id = internet_options_icon relative_scale scale = 0 alpha = 0 pos = PAIR(130.00000000000, 130.00000000000) 
	DoScreenElementMorph id = satellite_beam relative_scale scale = 0 alpha = 0.10000000149 
	DoScreenElementMorph id = internet_options_icon relative_scale scale = 1.10000002384 time = 0.20000000298 alpha = 1 pos = PAIR(210.00000000000, 265.00000000000) 
	DoScreenElementMorph id = satellite_beam relative_scale scale = 1 time = 0.20000000298 
	RunScriptOnScreenElement id = satellite_beam satellite_beam_flicker 
ENDSCRIPT

SCRIPT internet_options_unfocus 
	KillSpawnedScript name = satellite_beam_flicker 
	DoScreenElementMorph id = internet_options_icon alpha = 0 
	DoScreenElementMorph id = satellite_beam alpha = 0 
	main_theme_unfocus <...> 
ENDSCRIPT

SCRIPT satellite_beam_flicker time = 0.05000000075 
	BEGIN 
		DoScreenElementMorph id = satellite_beam alpha = 0.30000001192 time = <time> 
		DoScreenElementMorph id = internet_options_icon alpha = 0.80000001192 time = <time> 
		wait <time> seconds 
		DoScreenElementMorph id = satellite_beam alpha = 0.07999999821 time = <time> 
		DoScreenElementMorph id = internet_options_icon alpha = 0.50000000000 time = <time> 
		wait <time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT rotate_internet_options_globe time = 60.00000000000 num_rots = 10 
	BEGIN 
		DoScreenElementMorph id = globe rot_angle = ( 360 * <num_rots> ) time = ( <time> * <num_rots> ) 
		wait ( <time> * <num_rots> ) seconds 
		DoScreenElementMorph id = globe rot_angle = 0 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT get_upload_description 
	
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_onscreen_keyboard { allow_cancel 
		keyboard_cancel_script = create_internet_options 
		keyboard_done_script = upload_content 
		type = <type> 
		filename = <filename> 
		keyboard_title = "ENTER DESCRIPTION" 
		text = "" 
		max_length = 50 
		text_block 
	} 
ENDSCRIPT

SCRIPT upload_content 
	
	IF ObjectExists id = keyboard_anchor 
		GetTextElementString id = keyboard_current_string 
		destroy_onscreen_keyboard 
	ENDIF 
	GetSummaryInfo <type> VaultData = 1 
	IF GotParam type 
		SWITCH <type> 
			CASE OptionsAndPros 
				typename = skaters 
			CASE cat 
				typename = tricks 
				calculate_cat_score get_values return_it 
			CASE createdgoals 
				typename = goals 
			CASE park 
				typename = parks 
			CASE CreatedGraphic 
				typename = tags 
			DEFAULT 
				
				
				RETURN 
		ENDSWITCH 
	ELSE 
		
		
		RETURN 
	ENDIF 
	create_dialog_box { title = "Uploading file" 
		text = "Starting transfer..." 
		buttons = [ { text = "cancel" pad_choose_script = cancel_upload_file } 
		] 
	} 
	GetMemcardDataForUpload 
	UploadFile { description = <string> type = <typename> filename = <filename> score = <score> is_male = <is_male> 
		num_goals = <num_edited_goals> num_gaps = <num_gaps> num_pieces = <num_pieces> theme = <theme> tod_script = <tod_script> 
		width = <width> length = <length> 
	} 
ENDSCRIPT

SCRIPT cancel_upload_file 
	CancelFileTransfer 
	net_vault_menu_exit 
	dialog_box_exit 
	back_from_transfer_dialog 
ENDSCRIPT

SCRIPT LaunchUploadCompleteDialog 
	ClearMemcardDataForUpload 
	net_vault_menu_exit 
	dialog_box_exit 
	create_dialog_box { title = "Upload Complete" 
		text = "" 
		buttons = [ { text = "ok" pad_choose_script = back_from_transfer_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT back_from_directory_listing 
	DestroyScreenElement id = current_menu_anchor 
	create_internet_options 
ENDSCRIPT

SCRIPT play_online_chosen 
	CleanUpTopStats 
	spawn_lobby_list 
ENDSCRIPT

SCRIPT spawn_lobby_list 
	dialog_box_exit 
	FireEvent type = unfocus target = sub_menu 
	create_dialog_box { title = net_status_msg 
		text = "Connecting to GameSpy..." 
		no_bg 
		pos = PAIR(237.00000000000, 250.00000000000) 
	} 
	LobbyConnect 
ENDSCRIPT

SCRIPT cancel_lobby_list 
	CancelLobbyConnect 
	LobbyDisconnect 
	create_internet_options 
ENDSCRIPT

SCRIPT back_from_internet_menu 
	kill_buddy_message_icon 
	console_destroy 
	LeaveLobby 
	StopServerList 
	FreeServerList 
	LobbyDisconnect 
	create_internet_options 
ENDSCRIPT

SCRIPT back_from_network_select_menu 
	SetNetworkMode 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
	IF NOT GotParam no_menu 
		launch_ss_menu 
	ENDIF 
ENDSCRIPT

SCRIPT disconnect_from_internet 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	DisconnectFromInternet callback = failed_internet_connection 
ENDSCRIPT

SCRIPT maybe_show_disclaimer 
	IF IsTrue SignedDisclaimer 
		signed_disclaimer 
	ELSE 
		show_disclaimer 
	ENDIF 
ENDSCRIPT

SCRIPT show_disclaimer 
	PauseMusicAndStreams 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	dialog_box_exit 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	IF ScreenElementExists id = disclaimer_anchor 
		DestroyScreenElement id = disclaimer_anchor 
	ENDIF 
	SetScreenElementLock Off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
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
		text = "Terms of Use" 
		pos = PAIR(320.00000000000, 40.00000000000) 
		scale = 2.00000000000 
		rgba = <on_rgba> 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = disclaimer_anchor 
		id = down_arrow 
		texture = down_arrow 
		pos = PAIR(320.00000000000, 350.00000000000) 
		scale = 1.00000000000 
		rgba = <off_rgba> 
	} 
	CreateScreenElement { 
		type = hmenu 
		parent = disclaimer_anchor 
		dims = PAIR(300.00000000000, 20.00000000000) 
		id = disclaimer_hmenu 
		pos = PAIR(360.00000000000, 350.00000000000) 
		z_priority = 20 
		event_handlers = [ 
			{ pad_back back_from_disclaimer } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = disclaimer_hmenu 
		font = dialog 
		text = "Decline" 
		dims = PAIR(150.00000000000, 20.00000000000) 
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
		text = "Accept" 
		dims = PAIR(150.00000000000, 20.00000000000) 
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
		scale = PAIR(90.00000000000, 5.00000000000) 
		pos = PAIR(0.00000000000, 335.00000000000) 
		rgba = [ 0 0 0 255 ] 
		just = [ left top ] 
		z_priority = -3 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = disclaimer_anchor 
		id = disclaimer_vmenu 
		pos = PAIR(150.00000000000, 80.00000000000) 
		just = [ left top ] 
		internal_just = [ center top ] 
		z_priority = -4 
		dont_allow_wrap 
		padding_scale = 0.69999998808 
	} 
	IF ( ( IsPal ) & ( English ) ) 
		<disclaimer_text> = online_disclaimer_english 
	ELSE 
		<disclaimer_text> = online_disclaimer 
	ENDIF 
	CreateMultipleTextElements { 
		parent = disclaimer_vmenu 
		text = <disclaimer_text> 
		font = small 
		rgba = <off_rgba> 
		scale = 1 
		width = 500 
	} 
	create_helper_text helper_text_elements = [ { text = "\\b6/\\b5 = Select" } 
		{ text = "\\b4 = Scroll" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Accept" } 
	] 
	FireEvent type = focus target = disclaimer_hmenu 
	FireEvent type = focus target = disclaimer_anchor 
	wait 2 gameframes 
ENDSCRIPT

SCRIPT disclaimer_scroll_down 
	GetTags 
	GetScreenElementPosition id = disclaimer_vmenu 
	IF NOT ( <ScreenElementPos> . PAIR(0.00000000000, 1.00000000000) < -300 ) 
		SetScreenElementProps { 
			id = disclaimer_vmenu 
			pos = ( <ScreenElementPos> + PAIR(0.00000000000, -20.00000000000) ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT disclaimer_scroll_up 
	GetTags 
	GetScreenElementPosition id = disclaimer_vmenu 
	IF NOT ( <ScreenElementPos> . PAIR(0.00000000000, 1.00000000000) > 60 ) 
		SetScreenElementProps { 
			id = disclaimer_vmenu 
			pos = ( <ScreenElementPos> + PAIR(0.00000000000, 20.00000000000) ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT disclaimer_focus 
	GetTags 
	Theme_GetHighlightedTextColor return_value = rgba 
	DoScreenElementMorph id = <id> rgba = <rgba> scale = 1.20000004768 
ENDSCRIPT

SCRIPT disclaimer_unfocus 
	GetTags 
	DoScreenElementMorph id = <id> rgba = [ 50 50 50 50 ] scale = 1 
ENDSCRIPT

SCRIPT signed_disclaimer 
	IF ScreenElementExists id = disclaimer_anchor 
		DestroyScreenElement id = disclaimer_anchor 
	ENDIF 
	change SignedDisclaimer = 1 
	chose_internet 
ENDSCRIPT

SCRIPT back_from_disclaimer 
	dialog_box_exit 
	IF ScreenElementExists id = disclaimer_anchor 
		DestroyScreenElement id = disclaimer_anchor 
	ENDIF 
	create_ss_menu no_animate 
ENDSCRIPT

online_disclaimer = [ 
	"THUG 2 Terms of Use for Online Play:  I have read the Terms of Use for THUG 2 Online Play at www.thug2online.com and I agree to abide by these Terms of Use." 
	" " 
	"This Software uses \'DNAS\' (Dynamic Network Authentication System), a proprietary authentication system created by Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' retrieves information about a user\'s hardware and software for authentication, copy protection, account blocking, system, rules, or game management and other purposes. The information collected does not identify the user personally and will not be shared with any non-SCE company." 
	"A PUBLISHER CAN COMBINE THIS INFORMATION WITH PERSONALLY IDENTIFYING INFORMATION FROM THE PUBLISHER\'S RECORDS IF THE USER PROVIDES THE PERSONALLY IDENTIFYING INFORMATION.  BEFORE PROVIDING ANY PERSONAL INFORMATION TO A PUBLISHER, PLEASE BE SURE TO REVIEW THE PUBLISHER\'S PRIVACY POLICY AND TERMS AND CONDITIONS OF USE.  DO NOT PROVIDE PERSONALLY IDENTIFYING INFORMATION TO A PUBLISHER UNLESS YOU ACCEPT THE CONDITIONS OF USE AND TERMS OF THEIR PRIVACY POLICY." 
	"SCEI, Sony Computer Entertainment America (\'SCEA\') and their affiliates cannot guarantee the continuous operation of the \'DNAS\' servers. SCEA shall not be liable for any delay or failure of the \'DNAS\' servers to perform.  If you receive a message during login identifying a \'DNAS\' authentication error, please contact SCEA Consumer Services at 1-866-466-5333.  For additional information concerning \'DNAS\', visit www.us.playstation.com/DNAS." 
	"In the event of a systems incompatibility or inoperability with DNAS, the sole liability of SCEI, SCEA and their affiliates shall be limited to the repair or replacement of the user\'s affected game software, console or peripherals at the option of SCEA.  SCEA, its parents, affiliates, or licensed Publishers shall not be liable for any delays, system failures, authentication failures, or system outages, which may, from time to time, affect online game play or access thereto." 
] 
online_disclaimer_english = [ 
	"THUG 2 Terms of Use for Online Play:  I have read the Terms of Use for THUG 2 Online Play at www.thug2online.com and I agree to abide by these Terms of Use." 
	" " 
	"This Software uses \'DNAS\' (Dynamic Network Authentication System), a proprietary authentication system created by Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' retrieves information about a user\'s hardware and software for authentication, copy protection, account blocking, system, rules, or game management and other purposes. SCEI, Sony Computer Entertainment Europe (\'SCEE\') and their affiliates cannot guarantee the continuous operation of the \'DNAS\' servers." 
	"SCEE shall not be liable for any delay or failure of the \'DNAS\' servers to perform. If you receive a message during login identifying a \'DNAS\' authentication error, please contact your local PlayStation Customer Care line on the number provided in the software manual. For additional information concerning \'DNAS\', visit PlayStation.com." 
	"In the event of a systems incompatibility or inoperability with DNAS, the sole liability of SCEI, SCEE and their affiliates shall be limited to the repair or replacement of the user\'s affected game software, console or peripherals at the option of SCEE. SCEE, its parents, affiliates, or licensed Publishers shall not be liable for any delays, system failures, authentication failures, or system outages, which may, from time to time, affect online game play or access thereto." 
] 
SCRIPT create_network_select_menu 
	
	make_new_menu menu_id = network_select_menu pos = PAIR(227.00000000000, 109.00000000000) vmenu_id = network_select_vmenu menu_title = "NETWORK" helper_text = generic_helper_text 
	kill_start_key_binding 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = SS_MenuCam play_hold 
	SetScreenElementProps { id = network_select_vmenu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = back_from_network_select_menu } } 
		] 
	} 
	main_menu_add_item { 
		text = "Internet" 
		id = menu_network_select_internet 
		pad_choose_script = network_select_menu_exit 
		pad_choose_params = { callback = show_disclaimer } 
	} 
	GetPreferenceChecksum pref_type = network device_type 
	SWITCH <checksum> 
		CASE device_sony_modem 
		CASE device_usb_modem 
			do_nothing 
		DEFAULT 
			main_menu_add_item { 
				text = "LAN" 
				id = menu_network_select_lan 
				pad_choose_script = network_select_menu_exit 
				pad_choose_params = { callback = launch_network_select_lan_games_menu } 
			} 
	ENDSWITCH 
	IF IsOnline 
		GetPreferenceChecksum pref_type = network device_type 
		SWITCH <checksum> 
			CASE device_sony_modem 
			CASE device_usb_modem 
				main_menu_add_item text = "Hang Up Modem" id = menu_network_select_hang_up pad_choose_script = disconnect_from_internet 
		ENDSWITCH 
	ENDIF 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
	RunScriptOnScreenElement id = current_menu_anchor animate_in 
ENDSCRIPT

SCRIPT network_select_menu_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
	<callback> 
ENDSCRIPT

SCRIPT make_server_list_menu 
	create_console 
	console_unhide 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	SetScreenElementLock id = root_window Off 
	change in_net_lobby = 1 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = server_list_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		just = [ center center ] 
		scale = 0 
		focusable_child = actions_menu 
	} 
	build_theme_sub_title title = "ACTIONS" parent = server_list_anchor 
	build_top_and_bottom_blocks parent = server_list_anchor 
	make_mainmenu_3d_plane parent = server_list_anchor 
	CreateScreenElement { 
		type = spriteElement 
		parent = server_list_anchor 
		id = globe 
		texture = globe 
		scale = 1.29999995232 
		pos = PAIR(300.00000000000, 480.00000000000) 
		just = [ center center ] 
		alpha = 0.40000000596 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = actions_menu_anchor 
		pos = PAIR(320.00000000000, 280.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	theme_background width = 1 pos = PAIR(320.00000000000, 60.00000000000) num_parts = 5 parent = actions_menu_anchor 
	CreateScreenElement { 
		type = Vmenu 
		parent = actions_menu_anchor 
		id = actions_menu 
		font = small 
		just = [ left top ] 
		pos = PAIR(330.00000000000, 85.00000000000) 
		dims = PAIR(222.00000000000, 170.00000000000) 
		just = [ center top ] 
		internal_just = [ center top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = game_list_menu_anchor 
		dims = PAIR(300.00000000000, 300.00000000000) 
		pos = PAIR(450.00000000000, 100.00000000000) 
		just = [ left top ] 
	} 
	theme_background width = 1.29999995232 pos = PAIR(70.00000000000, 0.00000000000) num_parts = 5 parent = game_list_menu_anchor id = bg_box_vmenu2 bg_rgba = [ 80 80 100 100 ] 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = game_list_menu_anchor 
		id = server_list_scrolling_menu 
		just = [ left top ] 
		pos = PAIR(-15.00000000000, 56.00000000000) 
		dims = PAIR(440.00000000000, 130.00000000000) 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_list_scrolling_menu 
		id = server_list_menu 
		scale = 0.89999997616 
		pos = PAIR(0.00000000000, 0.00000000000) 
		dims = PAIR(440.00000000000, 300.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		event_handlers = [ 
			{ pad_up server_blink_up_arrow } 
			{ pad_down server_blink_down_arrow } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
		dont_allow_wrap 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = game_list_menu_anchor 
		font = testtitle 
		text = "GAMES" 
		scale = 1.29999995232 
		pos = PAIR(0.00000000000, 10.00000000000) 
		just = [ left top ] 
		not_focusable 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = game_list_menu_anchor 
		texture = white2 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(25.10000038147, 4.00000000000) 
		pos = PAIR(-30.00000000000, 10.00000000000) 
		just = [ left top ] 
		not_focusable 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = game_list_menu_anchor 
		id = lobby_game_list_title 
		font = dialog 
		text = ": 0" 
		scale = 1.00000000000 
		pos = PAIR(100.00000000000, 14.00000000000) 
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
		pos = PAIR(140.00000000000, 15.00000000000) 
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
		pos = PAIR(140.00000000000, 155.00000000000) 
		not_focusable 
		scale = 0 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = server_desc_menu_anchor 
		scale = 0 
		pos = PAIR(320.00000000000, 280.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	theme_background width = 1 pos = PAIR(320.00000000000, 60.00000000000) num_parts = 5 parent = server_desc_menu_anchor id = bg_box_vmenu4 
	theme_background width = 1 pos = PAIR(130.00000000000, 60.00000000000) num_parts = 5 parent = server_desc_menu_anchor id = bg_box_vmenu5 
	CreateScreenElement { 
		type = TextElement 
		parent = server_desc_menu_anchor 
		font = testtitle 
		text = "PLAYERS" 
		scale = 1.20000004768 
		pos = PAIR(45.00000000000, 68.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = server_desc_menu_anchor 
		id = server_desc_player_number 
		font = dialog 
		text = ": 0/0" 
		scale = 1.00000000000 
		pos = PAIR(170.00000000000, 65.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_desc_menu_anchor 
		id = server_desc_menu 
		pos = PAIR(320.00000000000, 70.00000000000) 
		dims = PAIR(200.00000000000, 170.00000000000) 
		scale = 0.89999997616 
		just = [ left top ] 
		internal_just = [ left top ] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_desc_menu_anchor 
		id = server_player_menu 
		pos = PAIR(50.00000000000, 110.00000000000) 
		dims = PAIR(200.00000000000, 100.00000000000) 
		scale = 0.80000001192 
		just = [ left top ] 
		internal_just = [ left top ] 
		not_focusable 
	} 
	IF InInternetMode 
		CreateScreenElement { 
			type = spriteElement 
			parent = game_list_menu_anchor 
			z_priority = 100 
			pos = PAIR(-320.00000000000, -20.00000000000) 
			texture = gslogo scale = 1.10000002384 
			alpha = 1 
		} 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = player_list_anchor 
			dims = PAIR(300.00000000000, 300.00000000000) 
			pos = PAIR(50.00000000000, 100.00000000000) 
			just = [ left top ] 
			internal_just = [ left top ] 
		} 
		theme_background width = 1 pos = PAIR(80.00000000000, 0.00000000000) num_parts = 5 parent = player_list_anchor id = bg_box_vmenu3 bg_rgba = [ 80 80 100 100 ] 
		CreateScreenElement { 
			type = VScrollingMenu 
			parent = player_list_anchor 
			id = player_list_scrolling_menu 
			pos = PAIR(0.00000000000, 55.00000000000) 
			dims = PAIR(200.00000000000, 110.00000000000) 
			just = [ left top ] 
		} 
		CreateScreenElement { 
			type = Vmenu 
			parent = player_list_scrolling_menu 
			id = lobby_player_list_menu 
			pos = PAIR(0.00000000000, 0.00000000000) 
			dims = PAIR(200.00000000000, 0.00000000000) 
			just = [ left top ] 
			internal_just = [ left top ] 
			scale = 0.80000001192 
			event_handlers = [ 
				{ pad_up user_blink_up_arrow } 
				{ pad_down user_blink_down_arrow } 
				{ pad_up generic_menu_up_or_down_sound params = { up } } 
				{ pad_down generic_menu_up_or_down_sound params = { down } } 
				{ pad_back generic_menu_pad_back_sound } 
			] 
			dont_allow_wrap 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = player_list_anchor 
			font = testtitle 
			text = "USERS" 
			scale = 1.29999995232 
			pos = PAIR(20.00000000000, 10.00000000000) 
			just = [ left top ] 
			z_priority = 5 
			not_focusable 
		} 
		CreateScreenElement { 
			type = spriteElement 
			parent = player_list_anchor 
			texture = white2 
			rgba = [ 0 0 0 128 ] 
			scale = PAIR(22.79999923706, 4.00000000000) 
			pos = PAIR(-11.00000000000, 10.00000000000) 
			just = [ left top ] 
			z_priority = 4 
			not_focusable 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = player_list_anchor 
			id = lobby_player_list_title 
			font = dialog 
			text = ": 0" 
			scale = 1.00000000000 
			pos = PAIR(115.00000000000, 14.00000000000) 
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
			pos = PAIR(-5.00000000000, 17.00000000000) 
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
			pos = PAIR(-5.00000000000, 155.00000000000) 
			not_focusable 
			scale = 0 
		} 
		GetStackedScreenElementPos X id = <id> offset = PAIR(-114.00000000000, 90.00000000000) 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = buddy_list_anchor 
			dims = PAIR(640.00000000000, 480.00000000000) 
			pos = <pos> 
			scale = 0 
		} 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = chat_box_anchor 
			dims = PAIR(640.00000000000, 480.00000000000) 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
		} 
		CreateScreenElement { 
			type = spriteElement 
			parent = chat_box_anchor 
			texture = chat_bracket 
			just = [ left top ] 
			pos = PAIR(30.00000000000, 220.00000000000) 
			scale = PAIR(1.39999997616, 2.40000009537) 
		} 
	ENDIF 
	RunScriptOnScreenElement id = globe rotate_internet_options_globe 
	IF InInternetMode 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		FillPlayerList 
		FireEvent type = unfocus target = lobby_player_list_menu 
		DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1 
		DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0 
	ENDIF 
	AssignAlias id = server_list_anchor alias = current_menu_anchor 
	AssignAlias id = actions_menu alias = current_menu 
ENDSCRIPT

SCRIPT server_list_menu_add_item 
	
	IF ObjectExists id = server_list_menu 
		highlight_bar_scale = PAIR(1.79999995232, 0.60000002384) 
		highlight_bar_pos = PAIR(96.00000000000, -6.00000000000) 
		focus_script = server_list_focus 
		<server_id> = <id> 
		SetScreenElementLock id = server_list_menu Off 
		FormatText ChecksumName = mode_name <mode> 
		FormatText ChecksumName = mode_attack "Trick Attack" 
		FormatText ChecksumName = mode_score "Score Challenge" 
		FormatText ChecksumName = mode_mambo "Combo Mambo" 
		FormatText ChecksumName = mode_slap "Slap!" 
		FormatText ChecksumName = mode_koth "King of the Hill" 
		FormatText ChecksumName = mode_graffiti "Graffiti" 
		FormatText ChecksumName = mode_goal "Goal Attack" 
		FormatText ChecksumName = mode_ctf "Capture the Flag" 
		FormatText ChecksumName = mode_fire "FireFight" 
		FormatText ChecksumName = mode_elim "Elimiskate" 
		FormatText ChecksumName = mode_hunt "Scavenger Hunt" 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_menu 
			id = <server_id> 
			dims = PAIR(200.00000000000, 20.00000000000) 
			event_handlers = [ { focus server_list_focus params = { id = <server_id> } } 
				{ unfocus server_list_unfocus } 
				{ pad_choose choose_selected_server params = { id = <server_id> } } 
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
			scale = 1.00000000000 
			pos = PAIR(10.00000000000, -5.00000000000) 
			just = [ left center ] 
			rgba = <text_rgba> 
		} 
		<text_id> = <id> 
		truncate_string id = <text_id> max_width = 200 
		SWITCH <mode_name> 
			CASE <mode_attack> 
				FormatText ChecksumName = gametype_icon "2p_attack" 
			CASE <mode_score> 
				FormatText ChecksumName = gametype_icon "2p_score" 
			CASE <mode_mambo> 
				FormatText ChecksumName = gametype_icon "2p_mambo" 
			CASE <mode_slap> 
				FormatText ChecksumName = gametype_icon "2p_slap" 
			CASE <mode_koth> 
				FormatText ChecksumName = gametype_icon "2p_koth" 
			CASE <mode_graffiti> 
				FormatText ChecksumName = gametype_icon "2p_graffiti" 
			CASE <mode_goal> 
				FormatText ChecksumName = gametype_icon "2p_goal" 
			CASE <mode_ctf> 
				FormatText ChecksumName = gametype_icon "2p_flag" 
			CASE <mode_fire> 
				FormatText ChecksumName = gametype_icon "2p_fire" 
			CASE <mode_elim> 
				FormatText ChecksumName = gametype_icon "2p_elim" 
			CASE <mode_hunt> 
				FormatText ChecksumName = gametype_icon "2p_hunt" 
			DEFAULT 
				FormatText ChecksumName = gametype_icon "2p_free" 
		ENDSWITCH 
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
			scale = 0.69999998808 
			pos = PAIR(-14.00000000000, 10.00000000000) 
			just = [ center center ] 
		} 
		SetScreenElementLock id = server_list_menu on 
		update_lobby_server_list 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_add_item rank = 1 
	IF ObjectExists id = <id> 
		RETURN 
	ENDIF 
	IF ObjectExists id = lobby_player_list_menu 
		SetScreenElementLock id = lobby_player_list_menu Off 
		main_menu_add_item { 
			parent = lobby_player_list_menu 
			highlight_bar_scale = PAIR(1.79999995232, 0.60000002384) 
			highlight_bar_pos = PAIR(97.00000000000, -6.00000000000) 
			text_just = [ left center ] 
			text_pos = PAIR(35.00000000000, -5.00000000000) 
			pad_choose_script = <pad_choose_script> 
			pad_choose_params = <pad_choose_params> 
			focus_script = player_list_focus 
			unfocus_script = player_list_unfocus 
			text = <text> 
			id = <id> 
		} 
		FormatText ChecksumName = rank_texture "rank_%i" i = <rank> 
		CreateScreenElement { 
			type = spriteElement 
			parent = <id> 
			texture = <rank_texture> 
			scale = 0.69999998808 
			alpha = 0.80000001192 
			pos = PAIR(10.00000000000, -3.00000000000) 
		} 
		SetScreenElementLock id = lobby_player_list_menu on 
		update_lobby_player_list 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_focus 
	GetTags 
	main_menu_focus 
	RunScriptOnScreenElement id = <id> theme_highlight_sweep 
ENDSCRIPT

SCRIPT player_list_unfocus 
	GetTags 
	main_menu_unfocus 
	kill_theme_highlight_sweep id = <id> 
ENDSCRIPT

SCRIPT player_list_update_rank 
	IF ScreenElementExists id = <id> 
		IF GotParam rank 
			FormatText ChecksumName = rank_icon "rank_%i" i = <rank> 
			SetScreenElementProps id = { <id> child = 2 } texture = <rank_icon> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_add_item parent = server_desc_menu dims = PAIR(300.00000000000, 16.00000000000) 
	IF ObjectExists id = <parent> 
		Theme_GetUnhighlightedTextColor return_value = rgba 
		SetScreenElementLock id = <parent> Off 
		IF GotParam value 
			dims = PAIR(300.00000000000, 32.00000000000) 
		ENDIF 
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
			pos = PAIR(0.00000000000, 0.00000000000) 
			rgba = <rgba> 
		} 
		IF GotParam value 
			CreateScreenElement { 
				type = spriteElement 
				parent = <anchor_id> 
				texture = white2 
				just = [ center top ] 
				pos = PAIR(0.00000000000, 18.00000000000) 
				scale = PAIR(26.00000000000, 2.25000000000) 
				rgba = [ 0 0 0 80 ] 
			} 
			CreateScreenElement { 
				type = TextElement 
				parent = <anchor_id> 
				text = <value> 
				font = dialog 
				just = [ center top ] 
				pos = PAIR(0.00000000000, 15.00000000000) 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_add_player rank = 1 
	IF ObjectExists id = server_player_menu 
		FormatText ChecksumName = id "%a%b" a = <name> b = <value> 
		SetScreenElementLock id = server_player_menu Off 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
		main_menu_add_item { 
			parent = server_player_menu 
			text = <value> 
			highlight_bar_scale = PAIR(1.79999995232, 0.60000002384) 
			highlight_bar_pos = PAIR(97.00000000000, -6.00000000000) 
			<...> 
		} 
		IF ( ( <rank> < 0 ) | ( <rank> > 10 ) ) 
			<rank> = 0 
		ENDIF 
		FormatText ChecksumName = rank_texture "rank_%i" i = <rank> 
		CreateScreenElement { 
			type = spriteElement 
			parent = <id> 
			texture = <rank_texture> 
			scale = 0.69999998808 
			alpha = 0.80000001192 
			pos = PAIR(10.00000000000, -3.00000000000) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_update_player_title 
	SetScreenElementProps id = server_desc_player_number text = <text> 
ENDSCRIPT

SCRIPT update_lobby_player_list 
	IF ScreenElementExists id = lobby_player_list_menu 
		IF NOT ( current_lobby_focus = 2 ) 
			IF ScreenElementExists id = lobby_player_list_title 
				NumPlayersInLobby 
				FormatText textname = title_text ": %n" n = <num_players> 
				SetScreenElementProps id = lobby_player_list_title text = <title_text> 
			ENDIF 
			SetScreenElementProps id = player_list_scrolling_menu reset_window_top 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT update_lobby_server_list 
	
	IF ScreenElementExists id = server_list_menu 
		IF NOT ( current_lobby_focus = 1 ) 
			IF ScreenElementExists id = lobby_game_list_title 
				NumServersInLobby 
				FormatText textname = title_text ": %n" n = <num_servers> 
				SetScreenElementProps id = lobby_game_list_title text = <title_text> 
			ENDIF 
			SetScreenElementProps id = server_list_scrolling_menu reset_window_top 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT server_list_focus 
	generic_menu_update_arrows menu_id = server_list_menu up_arrow_id = game_list_up_arrow down_arrow_id = game_list_down_arrow 
	main_menu_focus 
	RunScriptOnScreenElement id = <id> theme_highlight_sweep 
	IF RetrieveServerInfo <...> 
		describe_selected_server <...> 
	ENDIF 
ENDSCRIPT

SCRIPT server_list_unfocus 
	GetTags 
	kill_theme_highlight_sweep id = <id> 
	main_menu_unfocus 
ENDSCRIPT

SCRIPT user_blink_up_arrow 
	RunScriptOnScreenElement id = user_list_up_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT user_blink_down_arrow 
	RunScriptOnScreenElement id = user_list_down_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT server_blink_up_arrow 
	RunScriptOnScreenElement id = game_list_up_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT server_blink_down_arrow 
	RunScriptOnScreenElement id = game_list_down_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT back_from_game_list 
	actions_menu_anchor : DoMorph scale = 1 
	server_desc_menu_anchor : DoMorph scale = 0 
	destroy_server_desc_children 
	refocus_actions_menu 
ENDSCRIPT

SCRIPT back_from_user_list 
	actions_menu_anchor : DoMorph scale = 1 
	refocus_actions_menu 
ENDSCRIPT

SCRIPT back_from_buddy_list 
	actions_menu_anchor : DoMorph scale = 1 
	refocus_actions_menu 
ENDSCRIPT

already_tried = 0 
SCRIPT create_network_select_games_menu 
	IF IsInternetGameHost 
		IF ( already_tried = 1 ) 
			QuitGame 
			RETURN 
		ENDIF 
	ENDIF 
	IF IsJoiningInternetGame 
		IF ( already_tried = 1 ) 
			IF NOT TryJoinServerIPSuccess 
				QuitGame 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	change already_tried = 1 
	KillSkaterCamAnim all 
	Skater : reset_model_lights 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	IF GotParam play_cam 
		PlaySkaterCamAnim name = SS_MenuCam play_hold 
	ENDIF 
	dialog_box_exit 
	make_server_list_menu 
	create_helper_text generic_helper_text pos = PAIR(0.00000000000, 0.00000000000) 
	IF NOT OnXbox 
		SetNetworkMode LAN_MODE 
	ENDIF 
	IF IsInternetGameHost 
		host_net_chosen 
	ELSE 
		IF IsXbox 
			IF ProfileLoggedIn 
				IF AnyBuddyMessagesLeft 
					flash_buddy_message_icon 
				ENDIF 
			ENDIF 
		ENDIF 
		IF InInternetMode 
			SetScreenElementProps { id = actions_menu event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_internet_menu } } 
				] 
			} 
			SetScreenElementProps { id = lobby_player_list_menu event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_user_list } } 
				] 
			} 
		ELSE 
			IF NOT OnXbox 
				SetScreenElementProps { id = actions_menu event_handlers = [ 
						{ pad_back generic_menu_pad_back params = { callback = back_from_multiplayer_menu } } 
					] 
				} 
			ELSE 
				SetScreenElementProps { id = actions_menu event_handlers = [ 
						{ pad_back generic_menu_pad_back params = { callback = back_from_network_menu } } 
					] 
				} 
			ENDIF 
		ENDIF 
		SetScreenElementProps { id = server_list_menu event_handlers = [ 
				{ pad_back generic_menu_pad_back params = { callback = back_from_game_list } } 
			] 
		} 
		highlight_bar_scale = PAIR(1.50000000000, 0.60000002384) 
		IF InInternetMode 
			IF CanHostGame 
				theme_menu_add_item text = " Host Game" parent = actions_menu no_bg centered id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			ELSE 
				theme_menu_add_item text = " Host Game" parent = actions_menu no_bg centered id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> not_focusable 
			ENDIF 
		ELSE 
			theme_menu_add_item text = " Host Game" parent = actions_menu no_bg centered id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> 
		ENDIF 
		IF InInternetMode 
			theme_menu_add_item text = " Join Game" parent = actions_menu no_bg centered id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			theme_menu_add_item text = " Observe Game" parent = actions_menu no_bg centered id = menu_network_select_observe pad_choose_script = observe_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			theme_menu_add_item text = " Refresh" parent = actions_menu no_bg centered id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
		ELSE 
			theme_menu_add_item text = " Join Game" parent = actions_menu no_bg centered id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = <highlight_bar_scale> 
			theme_menu_add_item text = " Refresh" parent = actions_menu no_bg centered id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = <highlight_bar_scale> 
		ENDIF 
		IF InInternetMode 
			theme_menu_add_item text = " User List" parent = actions_menu no_bg centered id = menu_network_select_user_list pad_choose_script = user_list_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			IF ProfileLoggedIn 
				pad_choose = launch_homie_list 
			ELSE 
				pad_choose = no_profile_homie_list_prompt 
			ENDIF 
			theme_menu_add_item text = " Homie List" parent = actions_menu no_bg centered id = menu_network_select_buddy_list pad_choose_script = <pad_choose> pad_choose_params = { from_lobby } highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			theme_menu_add_item text = " Enter Chat Message" parent = actions_menu no_bg centered id = fmenu_network_select_chat pad_choose_script = create_lobby_onscreen_kb highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			IF ProfileLoggedIn 
				theme_menu_add_item text = " View Messages" parent = actions_menu no_bg centered id = menu_network_select_view pad_choose_script = view_buddy_messages highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			ENDIF 
		ENDIF 
		add_no_servers_found_message refocus 
		RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
		SetScreenElementLock id = current_menu_anchor Off 
		create_helper_text generic_helper_text 
		SetScreenElementLock id = current_menu_anchor on 
		FireEvent type = unfocus target = server_list_menu 
		FireEvent type = unfocus target = server_desc_menu 
		IF InInternetMode 
			FireEvent type = unfocus target = lobby_player_list_menu 
		ENDIF 
		FireEvent type = focus target = actions_menu 
		change current_lobby_focus = 0 
		AssignAlias id = actions_menu alias = current_menu 
		change check_for_unplugged_controllers = 1 
		IF GotParam focus_on_enter_message 
			RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus 
		ENDIF 
		IF NOT TryJoinServerIPSuccess 
			IF IsJoiningInternetGame 
				check_join_internet_ip 
				RETURN 
			ENDIF 
			RefreshServerList force_refresh 
		ENDIF 
		change check_for_unplugged_controllers = 1 
		IF GotParam focus_on_enter_message 
			RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus 
		ENDIF 
		IF TryJoinServerIPSuccess 
			ForceServerListRefresh 
			join_chosen 
			GetScreenElementProps id = { server_list_menu child = 0 } 
			FireEvent type = pad_choose target = <id> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT set_enter_message_focus 
	menu_onscreen <...> 
	FireEvent type = unfocus target = actions_menu 
	FireEvent type = focus target = actions_menu data = { child_id = menu_network_select_chat } 
ENDSCRIPT

SCRIPT back_to_server_list_from_buddy_list 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_network_select_games_menu 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
	ENDIF 
ENDSCRIPT

SCRIPT create_remove_players_menu 
	make_new_menu menu_id = remove_players_menu vmenu_id = remove_players_vmenu menu_title = "REMOVE WHICH PLAYER?" 
	SetScreenElementProps { id = remove_players_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	FillRemovePlayersMenu 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
ENDSCRIPT

SCRIPT create_xbox_online_menu 
	make_new_menu menu_id = xbox_online_menu vmenu_id = xbox_online_vmenu menu_title = "THUG 2 ONLINE" 
	SetScreenElementProps { id = xbox_online_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	make_text_sub_menu_item text = "Play Live" id = menu_xonline_play_live pad_choose_script = do_nothing 
	make_text_sub_menu_item text = "Friends" id = menu_xonline_friends pad_choose_script = launch_buddy_list 
	make_text_sub_menu_item text = "Sign Out" id = menu_xonline_sign_out pad_choose_script = sign_out 
	make_text_sub_menu_item text = "Free More Space" id = menu_xonline_dashboard pad_choose_script = go_to_xbox_dashboard 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
ENDSCRIPT

SCRIPT create_profile_menu 
	Theme_GetHighlightedTextColor return_value = rgba 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane 
	SetScreenElementLock id = menu_parts_anchor Off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = menu_parts_anchor 
		id = profile_options_anchor 
		pos = PAIR(-5.00000000000, 800.00000000000) 
	} 
	make_new_menu { menu_id = profile_options_menu 
		vmenu_id = profile_options_vmenu 
		parent = profile_options_anchor 
		pos = PAIR(80.00000000000, 85.00000000000) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = profile_options_anchor 
		font = testtitle 
		text = "LOGIN/PROFILE" 
		scale = 1.50000000000 
		pos = PAIR(65.00000000000, 86.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 98 ] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = profile_options_anchor 
		texture = white2 
		scale = PAIR(32.50000000000, 5.00000000000) 
		pos = PAIR(39.00000000000, 82.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		not_focusable 
	} 
	SetScreenElementProps { id = profile_options_menu event_handlers = [ { pad_back generic_menu_pad_back params = { callback = back_from_profile_options } } ] } 
	profile_options_add_item text = "" not_focusable = not_focusable 
	GetPreferenceString pref_type = network profile_email 
	profile_options_add_item text = "Email Address" id = network_profile_email pad_choose_script = launch_email_keyboard pad_choose_params = { field = "profile_email" text = <ui_string> title = "EMAIL ADDRESS" min_length = 1 max_length = 50 } 
	profile_options_add_item text = <ui_string> id = network_profile_email_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width scale = 0.74000000954 
	GetPreferenceString pref_type = network profile_password 
	GetPreferencePassword pref_type = network profile_password 
	profile_options_add_item text = "Password" id = network_profile_password pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = { field = "profile_password" text = <ui_string> title = "PROFILE PASSWORD" min_length = 1 max_length = 10 password } 
	profile_options_add_item text = <password_string> id = network_profile_password_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width 
	GetPreferenceString pref_type = network profile_password_confirm 
	GetPreferencePassword pref_type = network profile_password_confirm 
	profile_options_add_item text = "Confirm Password" id = network_profile_password_confirm pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = { field = "profile_password_confirm" text = <ui_string> title = "CONFIRM PASSWORD" min_length = 1 max_length = 10 password } 
	profile_options_add_item text = <password_string> id = network_profile_password_confirm_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width 
	GetPreferenceString pref_type = network profile_email 
	IF ( <ui_string> = "" ) 
		profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = profile_options_confirm_messagebox not_focusable last_menu_item = last_menu_item 
	ELSE 
		GetPreferenceString pref_type = network profile_password 
		IF ( <ui_string> = "" ) 
			profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = profile_options_confirm_messagebox not_focusable last_menu_item = last_menu_item 
		ELSE 
			pw_string = <ui_string> 
			GetPreferenceString pref_type = network profile_password_confirm 
			IF ( <pw_string> = <ui_string> ) 
				profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = profile_options_confirm_messagebox last_menu_item = last_menu_item 
			ELSE 
				profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = profile_options_confirm_messagebox not_focusable last_menu_item = last_menu_item 
			ENDIF 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = spriteElement 
		parent = profile_options_anchor 
		z_priority = 100 
		pos = PAIR(132.00000000000, 68.00000000000) 
		texture = gslogo scale = 1.10000002384 
		alpha = 1 
	} 
	RunScriptOnScreenElement lobby_list_animate_in id = profile_options_anchor params = { id = profile_options_anchor } 
	FireEvent type = unfocus target = sub_menu 
	FireEvent type = focus target = profile_options_menu 
	AssignAlias id = menu_parts_anchor alias = current_menu_anchor 
ENDSCRIPT

SCRIPT profile_options_add_item 
	theme_menu_add_item { parent = profile_options_vmenu centered <...> menu = 2 } 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_profile_menu 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_onscreen_keyboard callback_params = { allow_cancel in_profile_options keyboard_cancel_script = profile_setup_back_from_keyboard keyboard_done_script = set_profile_setting keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT profile_options_confirm_messagebox 
	FireEvent type = unfocus target = profile_options_menu 
	create_snazzy_dialog_box { 
		title = "Warning!" 
		text = "You are about to send this information over the network. Are you sure?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		buttons = [ { font = small text = #"No" 
				pad_choose_script = profile_options_confirm_messagebox_no 
			} 
			{ font = small text = #"Yes" 
				pad_choose_script = profile_options_confirm_messagebox_yes 
			} 
		] 
	} 
ENDSCRIPT

SCRIPT profile_options_confirm_messagebox_yes 
	dialog_box_exit no_pad_start 
	create_profile 
ENDSCRIPT

SCRIPT profile_options_confirm_messagebox_no 
	dialog_box_exit no_pad_start 
	FireEvent type = focus target = profile_options_menu 
ENDSCRIPT

SCRIPT profile_setup_back_from_keyboard 
	destroy_onscreen_keyboard 
	launch_profile_menu 
ENDSCRIPT

SCRIPT set_profile_setting 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = network <...> 
	destroy_onscreen_keyboard 
	launch_profile_menu 
ENDSCRIPT

SCRIPT create_profile 
	DestroyScreenElement id = current_menu_anchor 
	CreateProfile 
	create_dialog_box { title = net_status_msg 
		text = "Please Wait..." 
		no_animate 
	} 
ENDSCRIPT

SCRIPT log_in_profile 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Logging in..." 
		no_animate 
	} 
ENDSCRIPT

SCRIPT stats_log_in_profile 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Connecting to stats server..." 
		no_animate 
	} 
ENDSCRIPT

SCRIPT back_to_profile_menu 
	dialog_box_exit 
	launch_profile_menu 
ENDSCRIPT

SCRIPT create_wrong_profile_password_dialog 
	dialog_box_exit 
	create_dialog_box { title = "WRONG PASSWORD" 
		text = "The password you have entered is invalid for this account." 
		buttons = [ { text = "ok" pad_choose_script = back_to_profile_menu } 
		] 
	} 
ENDSCRIPT

SCRIPT profile_logged_in 
	
	SetPreferencesFromUI prefs = network field = "profile_success" string = "Yes" checksum = boolean_true 
	dialog_box_exit 
	StatsLogIn 
ENDSCRIPT

SCRIPT stats_logged_in 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Retrieving stats..." 
		no_animate 
	} 
	RetrievePersonalStats 
ENDSCRIPT

SCRIPT stats_retrieved 
	dialog_box_exit 
	create_internet_options 
ENDSCRIPT

SCRIPT no_profile_homie_list_prompt 
	FireEvent type = unfocus target = actions_menu 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
	ENDIF 
	FormatText textname = msg_text "Cannot access homie list without logging into GameSpy first." 
	create_dialog_box { title = "PLAYER NOT LOGGED IN" 
		text = <msg_text> 
		buttons = [ { text = "ok" pad_choose_script = cancel_view_homies } 
		] 
		text_dims = PAIR(260.00000000000, 0.00000000000) 
		no_bg = no_bg 
	} 
ENDSCRIPT

SCRIPT cancel_view_homies 
	dialog_box_exit 
	FireEvent type = focus target = actions_menu 
	SetScreenElementLock id = server_list_anchor Off 
	create_helper_text generic_helper_text 
	SetScreenElementLock id = server_list_anchor on 
ENDSCRIPT

SCRIPT lobby_remove_buddy 
	RemoveBuddy <...> 
	FillBuddyList clear_list allow_remove 
	launch_homie_list 
ENDSCRIPT

SCRIPT select_network_play_multi 
	dialog_box_exit 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	change cas_cam_angle = 0 
	cas_setup_rotating_camera cam_anim = story_mode_menu 
	make_new_roundbar_menu { pos = PAIR(130.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu } vmenu_id = multiplayer_options_vmenu } 
	build_theme_sub_title title = "MULTIPLAYER" 
	add_roundbar_menu_item { 
		text = ( "Network Play" ) 
		id = mm_multi_play 
		pad_choose_script = gamemode_options_menu_exit 
		pad_choose_params = { 
			new_menu_script = select_xbox_multiplayer 
			change_gamemode = change_gamemode_net 
		} 
	} 
	add_roundbar_menu_item { 
		text = ( "Online Play" ) 
		id = mm_net_play 
		pad_choose_script = gamemode_options_menu_exit 
		pad_choose_params = { 
			new_menu_script = select_network_play 
			change_gamemode = change_gamemode_net 
		} 
	} 
	roundbar_menu_finish build_pause_parts = 0 
ENDSCRIPT

SCRIPT select_network_play 
	change network_connection_type = internet 
	change_gamemode_net 
	GoalManager_SetDifficultyLevel 1 
	UseNetworkPreferences 
	net_setup_from_net_play_successful 
ENDSCRIPT

SCRIPT create_network_menu_exit 
	console_hide 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT


