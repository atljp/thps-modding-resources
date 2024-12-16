
display_multiplied_score = 0 
display_SPECIAL_text = 1 
display_balance_indicators = 1 
skpro_bullettime_allowed = 1 
userselect_index = 0 
userselect_options = [ 
	{ action = thugpro_userselect_case_camera_toggle text = "Camera Toggle" } 
	{ action = thugpro_userselect_case_chat text = "KB Chat" } 
	{ action = thugpro_userselect_case_viewer text = "Free Cam" } 
] 
SCRIPT launch_display_options_menu 
	IF GotParam from_options 
		create_display_options_menu from_options 
	ELSE 
		create_display_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT create_general_options_menu 
	thugpro_menu_create { 
		menu_name = general_options 
		menu_title = "General Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text_toggle 
		pad_back_script = display_options_exit 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	get_skater_number 
	num = <skater_number> 
	IF GetGlobalFlag flag = BLOOD_OFF 
		blood_text = "Off" 
	ELSE 
		blood_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Blood" 
		extra_text = <blood_text> 
		id = menu_blood 
		option_arrows_callback = toggle_display_blood 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue GLOBAL_EnableBoardScuffs 
		enableboardscuffs_text = "On" 
	ELSE 
		enableboardscuffs_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Board Scuffs" 
		extra_text = <enableboardscuffs_text> 
		id = menu_enableboardscuffs 
		option_arrows_callback = toggle_EnableBoardScuffs 
		option_arrows 
		pad_choose 
	} 
	IF ( ( Toggle_Special_item ) = 0 ) 
		special_item_text = "On" 
	ELSE 
		special_item_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Special trick items" 
		extra_text = <special_item_text> 
		description_text = "Toggle spawning props for certain special tricks..." 
		id = menu_display_special_item 
		option_arrows_callback = toggle_display_special_item 
		option_arrows 
		pad_choose 
	} 
	make_thugpro_menu_item { 
		text = "Select Button" 
		id = menu_select_function 
		extra_text = ( ( ( userselect_options ) [ ( userselect_index ) ] ) . text ) 
		option_arrows 
		option_arrows_callback = change_select_button_function 
		pad_choose 
	} 
	IF NOT InNetGame 
		IF IsTrue skpro_bullettime_allowed 
			bullettime_text = "On" 
		ELSE 
			bullettime_text = "Off" 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Focus Mode" 
			extra_text = <bullettime_text> 
			id = menu_bullettime 
			option_arrows_callback = skpro_toggle_bullettime 
			option_arrows 
			pad_choose 
		} 
	ENDIF 
	IF VibrationIsOn <num> 
		vibration_value = "On" 
	ELSE 
		vibration_value = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Vibration" 
		id = menu_vibration 
		extra_text = <vibration_value> 
		option_arrows_callback = change_basic_control_options 
		option_arrows_callback_params = { vibration } 
		option_arrows 
		pad_choose 
	} 
	IF InNetGame 
		IF IsTrue GameRunRespawns 
			gamerunrespawns_value = "On" 
		ELSE 
			gamerunrespawns_value = "Off" 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Respawn on New Run" 
			id = menu_gamerunrespawns 
			extra_text = <gamerunrespawns_value> 
			option_arrows_callback = toggle_gamerunrespawns 
			option_arrows 
			pad_choose 
		} 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_predisplay_options_menu 
	destroy_edit_theme_preveiw_specialmeter 
	destroy_edit_theme_preveiw_balancemeter 
	thugpro_menu_create { 
		menu_name = pre_display 
		menu_title = "Display Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = display_options_exit 
		helper_text = generic_helper_text 
		show_description_panel 
		show_gradient 
	} 
	IF NOT IsFullscreen 
		adjust_gamma_focus = not_focusable 
	ENDIF 
	make_thugpro_menu_item { 
		id = ProCrastination_menu_adjust_gamma 
		text = "Adjust Gamma" 
		child_texture = icon_screen 
		pad_choose_script = GammaOptions_Create_menu 
		<adjust_gamma_focus> 
	} 
	make_thugpro_menu_item { 
		id = display_options_menu 
		text = "HUD Options" 
		child_texture = icon_hud 
		pad_choose_script = create_display_options_menu 
	} 
	make_thugpro_menu_item { 
		id = menu_interface_themes 
		text = "Theme Options" 
		child_texture = icon_theme 
		pad_choose_script = swap_themes_menu 
	} 
	make_thugpro_menu_item { 
		id = ProCrastination_menu_console_options 
		text = "Console/Chat Options" 
		child_texture = icon_chat 
		pad_choose_script = ConsoleOptions_Create_Menu 
	} 
	make_thugpro_menu_item { 
		id = menu_camera_options 
		text = "Camera Options" 
		child_texture = icon_camera 
		pad_choose_script = create_camera_options_menu 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_display_options_menu 
	thugpro_menu_create { 
		menu_name = hud_options 
		menu_title = "HUD options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text_toggle 
		pad_back_script = create_predisplay_options_menu 
		show_description_panel 
		show_gradient 
		width_ajustment = 1.25000000000 
		boxed 
	} 
	IF GetGlobalFlag flag = NO_DISPLAY_BALANCE 
		balancemeter_text = "Off" 
	ELSE 
		balancemeter_text = "On" 
	ENDIF 
	IF InNetGame 
		IF GetGlobalFlag flag = NO_G_DISPLAY_BALANCE 
			balancemeter_focusable = not_focusable 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Balance Meter" 
		extra_text = <balancemeter_text> 
		id = menu_display_balance 
		option_arrows_callback = toggle_display_balance 
		option_arrows 
		pad_choose 
		<balancemeter_focusable> 
	} 
	IF IsTrue display_balance_indicators 
		balance_indicator_text = "On" 
	ELSE 
		balance_indicator_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Balance Meter Indicator" 
		extra_text = <balance_indicator_text> 
		id = menu_display_balance_indicators 
		option_arrows_callback = toggle_display_balance_indicators 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = NO_DISPLAY_HUD 
		specialmeter_text = "Off" 
	ELSE 
		specialmeter_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Special Meter" 
		extra_text = <specialmeter_text> 
		id = menu_display_hud 
		option_arrows_callback = toggle_display_hud 
		option_arrows 
		pad_choose 
	} 
	IF ( display_SPECIAL_text = 0 ) 
		specialtext_text = "Off" 
	ELSE 
		specialtext_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "SPECIAL Text" 
		extra_text = <specialtext_text> 
		id = menu_display_SPECIAL_text 
		option_arrows_callback = toggle_display_SPECIAL_text 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		trickstring_text = "Off" 
	ELSE 
		trickstring_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Trick String" 
		extra_text = <trickstring_text> 
		id = menu_display_trickstring 
		option_arrows_callback = toggle_display_trickstring 
		option_arrows 
		pad_choose 
	} 
	IF ( display_multiplied_score = 1 ) 
		basescore_text = "Multiplied" 
	ELSE 
		IF GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
			basescore_text = "Off" 
		ELSE 
			basescore_text = "Normal" 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Base Score" 
		extra_text = <basescore_text> 
		id = menu_display_basescore 
		option_arrows_callback = toggle_display_basescore_type 
		option_arrows 
		pad_choose 
	} 
	IF InTeamGame 
		GetPreferenceString pref_type = network score_display 
		make_thugpro_menu_item { 
			text = "Score display mode" 
			extra_text = <ui_string> 
			id = menu_score_display 
			pad_choose_script = create_options_score_display_menu 
		} 
	ENDIF 
	IF InNetGame 
		IF GetGlobalFlag flag = NO_DISPLAY_NET_SCORES 
			netscores_text = "Off" 
		ELSE 
			netscores_text = "On" 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Names and Scores" 
			extra_text = <netscores_text> 
			id = menu_display_net_scores 
			option_arrows_callback = toggle_display_net_scores 
			option_arrows 
			pad_choose 
		} 
		IF IsTrue GLOBAL_HideObjectLabels 
			label_text = "Off" 
		ELSE 
			label_text = "On" 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Skater ID\'s" 
			extra_text = <label_text> 
			id = menu_label_text 
			option_arrows_callback = toggle_display_object_labels 
			option_arrows 
			pad_choose 
		} 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Panel Message Options" 
		id = menu_display_panel_messages 
		pad_choose_script = create_panel_message_options_menu 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_panel_message_options_menu 
	destroy_edit_theme_preveiw_specialmeter 
	destroy_edit_theme_preveiw_balancemeter 
	thugpro_menu_create { 
		menu_name = panel_message_options 
		menu_title = "Panel message options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_display_options_menu 
		helper_text = generic_helper_text 
		show_description_panel 
		show_gradient 
		width_ajustment = 1.25000000000 
		boxed 
	} 
	IF IsTrue ENABLE_PANEL_MESSAGES 
		<extra_text> = "On" 
		<focusable> = focusable 
	ELSE 
		<extra_text> = "Off" 
		<focusable> = not_focusable 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Panel Messages" 
		extra_text = <extra_text> 
		description_text = "Toggle all panel messages... (You will still get the awarded points)" 
		id = menu_display_panel_messages 
		option_arrows_callback = toggle_display_panel_messages 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue ENABLE_BSCOUNTER 
		<extra_text> = "On" 
	ELSE 
		<extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Buttslap Message" 
		extra_text = <extra_text> 
		description_text = "Toggle the Buttslap counter message" 
		id = menu_display_buttslap_counter 
		option_arrows_callback = toggle_display_buttslap_counter 
		option_arrows 
		pad_choose 
		<focusable> 
	} 
	IF IsTrue ENABLE_NEUROCOUNTER 
		<extra_text> = "On" 
	ELSE 
		<extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Neuroplant Message" 
		extra_text = <extra_text> 
		description_text = "Toggle the Neuroplant counter message" 
		id = menu_display_neuroplant_counter 
		option_arrows_callback = thugpro_menu_item_toggle_global_value 
		option_arrows_callback_params = { 
			globalname = ENABLE_NEUROCOUNTER 
			keyname = "NeuroplantCounterOn" 
		} 
		option_arrows 
		pad_choose 
		<focusable> 
	} 
	IF IsTrue ENABLE_BPCOUNTER 
		<extra_text> = "On" 
	ELSE 
		<extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Boostplant Message" 
		extra_text = <extra_text> 
		description_text = "Toggle the Boostplant counter message" 
		id = menu_display_boostplant_counter 
		option_arrows_callback = thugpro_menu_item_toggle_global_value 
		option_arrows_callback_params = { 
			globalname = ENABLE_BPCOUNTER 
			keyname = "BoostplantCounterOn" 
		} 
		option_arrows 
		pad_choose 
		<focusable> 
	} 
	IF IsTrue ENABLE_BONK_MESSAGE 
		<extra_text> = "On" 
	ELSE 
		<extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Bonk Message" 
		extra_text = <extra_text> 
		description_text = "Toggle Bonk messages" 
		id = menu_display_bonk_counter 
		option_arrows_callback = thugpro_menu_item_toggle_global_value 
		option_arrows_callback_params = { 
			globalname = ENABLE_BONK_MESSAGE 
			keyname = "BonkMessageOn" 
		} 
		option_arrows 
		pad_choose 
		<focusable> 
	} 
	IF IsTrue ENABLE_WRB_MESSAGE 
		<extra_text> = "On" 
	ELSE 
		<extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Wallride Bounce Message" 
		extra_text = <extra_text> 
		description_text = "Toggle Wallride Bounce messages" 
		id = menu_display_wrb_counter 
		option_arrows_callback = thugpro_menu_item_toggle_global_value 
		option_arrows_callback_params = { 
			globalname = ENABLE_WRB_MESSAGE 
			keyname = "WRBMessageOn" 
		} 
		option_arrows 
		pad_choose 
		<focusable> 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT toggle_display_tantrum 
	GetTags 
	IF NOT GetGlobalFlag flag = TANTRUM_OFF 
		SetGlobalFlag flag = TANTRUM_OFF 
		thugpro_save_key_value Key = "NoFreakout" value = 1 
		thugpro_menu_item_update_extra_text id = <id> off 
	ELSE 
		UnSetGlobalFlag flag = TANTRUM_OFF 
		thugpro_save_key_value Key = "NoFreakout" value = 0 
		thugpro_menu_item_update_extra_text id = <id> on 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_buttslap_counter 
	GetTags 
	IF ( ( ENABLE_BSCOUNTER ) = 1 ) 
		Change ENABLE_BSCOUNTER = 0 
		thugpro_save_key_value Key = "ButtslapCounterOn" value = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
	ELSE 
		Change ENABLE_BSCOUNTER = 1 
		thugpro_save_key_value Key = "ButtslapCounterOn" value = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_panel_messages 
	GetTags 
	IF ( ( ENABLE_PANEL_MESSAGES ) = 1 ) 
		Change ENABLE_PANEL_MESSAGES = 0 
		thugpro_save_key_value Key = "PanelMessagesOn" value = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
	ELSE 
		Change ENABLE_PANEL_MESSAGES = 1 
		thugpro_save_key_value Key = "PanelMessagesOn" value = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
	ENDIF 
	create_panel_message_options_menu focus_target = <id> no_animate 
ENDSCRIPT

SCRIPT toggle_display_special_item 
	GetTags 
	IF ( ( Toggle_Special_item ) = 1 ) 
		Change Toggle_Special_item = 0 
		thugpro_save_key_value Key = "SpecialItems" value = 0 
		thugpro_menu_item_update_extra_text id = <id> on 
	ELSE 
		Change Toggle_Special_item = 1 
		thugpro_save_key_value Key = "SpecialItems" value = 1 
		thugpro_menu_item_update_extra_text id = <id> off 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_hud 
	GetTags 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetGlobalFlag flag = NO_DISPLAY_HUD 
		thugpro_save_key_value Key = "NoDisplayHud" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		UnSetGlobalFlag flag = NO_DISPLAY_HUD 
		thugpro_save_key_value Key = "NoDisplayHud" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_trickstring 
	GetTags 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		thugpro_save_key_value Key = "NoDisplayTrickString" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		UnSetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		thugpro_save_key_value Key = "NoDisplayTrickString" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_basescore_type 
	GetTags 
	IF GotParam right 
		IF ( display_multiplied_score = 1 ) 
			thugpro_menu_item_update_extra_text id = <id> off 
			SetGlobalFlag flag = NO_DISPLAY_BASESCORE 
			thugpro_save_key_value Key = "NoDisplayBasescore" value = 1 
			thugpro_save_key_value Key = "ShowMultipliedScore" value = 0 
			Change display_multiplied_score = 0 
			ShowMultipliedScore off 
		ELSE 
			IF GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				thugpro_menu_item_update_extra_text id = <id> text = "Normal" 
				UnSetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				thugpro_save_key_value Key = "NoDisplayBasescore" value = 0 
				thugpro_save_key_value Key = "ShowMultipliedScore" value = 0 
				Change display_multiplied_score = 0 
				ShowMultipliedScore off 
			ELSE 
				thugpro_menu_item_update_extra_text id = <id> text = "Multiplied" 
				UnSetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				thugpro_save_key_value Key = "NoDisplayBasescore" value = 0 
				thugpro_save_key_value Key = "ShowMultipliedScore" value = 1 
				Change display_multiplied_score = 1 
				ShowMultipliedScore on 
			ENDIF 
		ENDIF 
	ELSE 
		IF GotParam left 
			IF ( display_multiplied_score = 1 ) 
				thugpro_menu_item_update_extra_text id = <id> text = "Normal" 
				UnSetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				thugpro_save_key_value Key = "NoDisplayBasescore" value = 0 
				thugpro_save_key_value Key = "ShowMultipliedScore" value = 0 
				Change display_multiplied_score = 0 
				ShowMultipliedScore off 
			ELSE 
				IF GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
					thugpro_menu_item_update_extra_text id = <id> text = "Multiplied" 
					UnSetGlobalFlag flag = NO_DISPLAY_BASESCORE 
					thugpro_save_key_value Key = "NoDisplayBasescore" value = 0 
					thugpro_save_key_value Key = "ShowMultipliedScore" value = 1 
					Change display_multiplied_score = 1 
					ShowMultipliedScore on 
				ELSE 
					thugpro_menu_item_update_extra_text id = <id> off 
					SetGlobalFlag flag = NO_DISPLAY_BASESCORE 
					thugpro_save_key_value Key = "NoDisplayBasescore" value = 1 
					thugpro_save_key_value Key = "ShowMultipliedScore" value = 0 
					Change display_multiplied_score = 0 
					ShowMultipliedScore off 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_SPECIAL_text 
	GetTags 
	IF IsTrue display_SPECIAL_text 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "ShowSpecialText" value = 0 
		Change display_SPECIAL_text = 0 
		destroy_panel_stuff 
		create_panel_stuff 
		hide_all_hud_items 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "ShowSpecialText" value = 1 
		Change display_SPECIAL_text = 1 
		destroy_panel_stuff 
		create_panel_stuff 
		hide_all_hud_items 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_chatwindow 
	GetTags 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetGlobalFlag flag = NO_DISPLAY_CHATWINDOW 
		thugpro_save_key_value Key = "NO_DISPLAY_CHATWINDOW" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		UnSetGlobalFlag flag = NO_DISPLAY_CHATWINDOW 
		thugpro_save_key_value Key = "NO_DISPLAY_CHATWINDOW" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_balance 
	GetTags 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetGlobalFlag flag = NO_DISPLAY_BALANCE 
		thugpro_save_key_value Key = "NoBalanceMeters" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		UnSetGlobalFlag flag = NO_DISPLAY_BALANCE 
		thugpro_save_key_value Key = "NoBalanceMeters" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_balance_indicators 
	GetTags 
	IF IsTrue display_balance_indicators 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "BalanceIndicators" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "BalanceIndicators" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_net_names 
	GetTags 
	GetPreferenceString pref_type = network show_names 
	IF ( <ui_string> = "off" ) 
		thugpro_menu_item_update_extra_text id = <id> on 
		SetPreferencesFromUI prefs = network field = "show_names" checksum = boolean_true string = "on" 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetPreferencesFromUI prefs = network field = "show_names" checksum = boolean_false string = "off" 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_net_scores 
	GetTags 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_NET_SCORES 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetGlobalFlag flag = NO_DISPLAY_NET_SCORES 
		thugpro_save_key_value Key = "NoNetNamesScores" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		UnSetGlobalFlag flag = NO_DISPLAY_NET_SCORES 
		thugpro_save_key_value Key = "NoNetNamesScores" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_display_object_labels 
	GetTags 
	IF NOT IsTrue GLOBAL_HideObjectLabels 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "HideObjectLabels" value = 1 
		Change GLOBAL_HideObjectLabels = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "HideObjectLabels" value = 0 
		Change GLOBAL_HideObjectLabels = 0 
	ENDIF 
	wait 2 frames 
	update_all_player_names 
ENDSCRIPT

SCRIPT display_options_exit 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		create_options_menu 
	ELSE 
		create_setup_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_cutscene_subtitles 
	GetTags 
	IF GetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES 
		UnSetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES 
		thugpro_menu_item_update_extra_text id = <id> on 
	ELSE 
		SetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES 
		thugpro_menu_item_update_extra_text id = <id> off 
	ENDIF 
ENDSCRIPT

SCRIPT change_select_button_function 
	GetTags 
	<userselect_options> = userselect_options 
	IF GotParam left 
		array_previous_wraparound index = ( userselect_index ) array = <userselect_options> 
		Change userselect_index = <index> 
		thugpro_save_key_value Key = "UserSelectAction" value = <index> 
	ELSE 
		IF GotParam right 
			array_next_wraparound index = ( userselect_index ) array = <userselect_options> 
			Change userselect_index = <index> 
			thugpro_save_key_value Key = "UserSelectAction" value = <index> 
		ENDIF 
	ENDIF 
	Change thugpro_userselect_action = ( ( ( <userselect_options> ) [ ( userselect_index ) ] ) . action ) 
	thugpro_menu_item_update_extra_text id = <id> text = ( ( ( <userselect_options> ) [ ( userselect_index ) ] ) . text ) 
ENDSCRIPT

SCRIPT toggle_display_blood 
	GetTags 
	IF NOT GetGlobalFlag flag = BLOOD_OFF 
		thugpro_menu_item_update_extra_text id = <id> off 
		SetGlobalFlag flag = BLOOD_OFF 
		thugpro_save_key_value Key = "NoBlood" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		UnSetGlobalFlag flag = BLOOD_OFF 
		thugpro_save_key_value Key = "NoBlood" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_EnableBoardScuffs 
	GetTags 
	IF NOT IsTrue GLOBAL_EnableBoardScuffs 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "EnableBoardScuffs" value = 1 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "EnableBoardScuffs" value = 0 apply_changes 
		IF NOT IsObserving 
			GetSkaterId 
			<objid> : SetTags boardscuff = 0 
			<objid> : Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_board_trans01" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT skpro_toggle_bullettime 
	GetTags 
	IF IsTrue skpro_bullettime_allowed 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "AllowFocusMode" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "AllowFocusMode" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_gamerunrespawns 
	GetTags 
	IF IsTrue GameRunRespawns 
		Change GameRunRespawns = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		IF NOT GotParam no_menu 
			thugpro_save_key_value Key = "GameRunRespawns" value = 0 
		ENDIF 
	ELSE 
		Change GameRunRespawns = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		IF NOT GotParam no_menu 
			thugpro_save_key_value Key = "GameRunRespawns" value = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT


