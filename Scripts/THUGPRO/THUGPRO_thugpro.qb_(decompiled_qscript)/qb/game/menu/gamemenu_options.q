
SCRIPT create_options_menu 
	IF NOT IsTrue MUSIC_IN_PAUSE_MENU 
		PauseMusicAndStreams 
	ENDIF 
	IF InNetGame 
		IF NOT IsObserving 
			Skater : NetDisablePlayerInput 
		ENDIF 
	ENDIF 
	IF NOT GotParam no_exit 
		helper_text = generic_helper_text 
	ELSE 
		helper_text = generic_helper_text_no_back 
	ENDIF 
	thugpro_menu_create { 
		menu_name = game_options 
		menu_title = "Game Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = <helper_text> 
		pad_back_script = create_pause_menu 
		show_description_panel 
		show_gradient 
	} 
	make_thugpro_menu_item { 
		text = "General Options" 
		id = menu_general_options 
		child_texture = icon_general 
		pad_choose_script = create_general_options_menu 
	} 
	make_thugpro_menu_item { 
		text = "Control Options" 
		id = menu_control_options 
		child_texture = icon_gamepad 
		pad_choose_script = create_control_setup_menu 
		pad_choose_params = { controller_number = 1 from_options } 
	} 
	make_thugpro_menu_item { 
		text = "Display Options" 
		id = menu_display_options 
		child_texture = icon_screen 
		pad_choose_script = create_predisplay_options_menu 
	} 
	make_thugpro_menu_item { 
		text = "Sound Options" 
		id = menu_sound_options 
		child_texture = icon_audio 
		pad_choose_script = launch_sound_options_menu 
		pad_choose_params = { from_options } 
	} 
	make_thugpro_menu_item { 
		text = "Music Options" 
		id = menu_music_optons 
		child_texture = icon_audio 
		pad_choose_script = create_music_options_menu 
	} 
	make_thugpro_menu_item { 
		text = "" 
		id = menu_separator_0 
		not_focusable = 1 
	} 
	IF NOT InMultiPlayerGame 
		IF GameModeEquals is_singlesession 
			IF NOT InSplitScreenGame 
				IF NOT InNetGame 
					make_thugpro_menu_item { 
						text = "High Scores" 
						id = menu_high_scores 
						child_texture = icon_clipboard 
						pad_choose_script = high_scores_menu_create 
						pad_choose_params = { from_pause = from_pause } 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT GameModeEquals is_creategoals 
			make_thugpro_menu_item { 
				text = "Save Game" 
				id = menu_save_game 
				child_texture = icon_save 
				pad_choose_script = launch_pause_menu_save_game_sequence 
			} 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Cheats" 
			id = menu_real_cheats 
			pad_choose_script = create_real_cheats_menu 
		} 
	ENDIF 
	IF ( view_mode = 0 ) 
		IF NOT GameModeEquals is_career 
			IF NOT IsObserving 
				IF NOT IsTrue THUGPRO_ObserveOn 
					IF Skater : Skating 
						IF Skater : OnLip 
							IF IsTrue THUGPRO_ObserveOn 
								set_restart_not_focusable = 1 
							ENDIF 
						ENDIF 
					ENDIF 
					IF NOT CustomParkMode testing 
						IF NOT ( ( GameModeEquals is_lobby ) | ( GameModeEquals is_singlesession ) ) 
							restart_not_focusable = 1 
						ENDIF 
					ENDIF 
					make_thugpro_menu_item { 
						text = "Set Restart" 
						id = menu_set_custom 
						pad_choose_script = menu_select 
						pad_choose_params = { menu_select_script = set_custom_restart } 
						not_focusable = <restart_not_focusable> 
					} 
					IF Skater : SetCustomRestart 
						make_thugpro_menu_item { 
							text = "Go to Restart" 
							id = menu_skip_to_custom 
							pad_choose_script = menu_select 
							pad_choose_params = { menu_select_script = skip_to_custom_restart } 
							not_focusable = <restart_not_focusable> 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT get_camera_angle_text 
	SWITCH ( skater_cam_0_mode ) 
		CASE 1 
			RETURN angle_text = "Near" 
		CASE 2 
			RETURN angle_text = "Standard" 
		CASE 3 
			RETURN angle_text = "Far High" 
		CASE 4 
			RETURN angle_text = "Far Low" 
		DEFAULT 
			RETURN angle_text = "Unknown" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT create_camera_options_menu 
	thugpro_menu_create { 
		menu_name = camera_options 
		menu_title = "Camera Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text_toggle 
		pad_back_script = create_predisplay_options_menu 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	IF NOT LevelIs Load_MainMenu 
		get_camera_angle_text 
		make_thugpro_menu_item { 
			text = "Camera Angle" 
			extra_text = <angle_text> 
			id = menu_camera 
			option_arrows pad_choose 
			option_arrows_callback = toggle_camera_angle 
		} 
		RemoveParameter first_item_params 
	ENDIF 
	RemoveParameter text 
	menu_camera_aspect_get_string 
	make_thugpro_menu_item { 
		text = "Aspect Ratio" 
		extra_text = <text> 
		id = menu_camera_aspect 
		option_arrows pad_choose 
		option_arrows_callback = toggle_camera_aspect 
	} 
	RemoveParameter text 
	menu_camera_fov_get_string 
	make_thugpro_menu_item { 
		text = "Field of View" 
		extra_text = <text> 
		id = menu_camera_fov 
		option_arrows pad_choose 
		option_arrows_callback = toggle_camera_fov 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

camera_angle = 0 
SCRIPT toggle_camera_angle 
	IF GotParam left 
		index_previous_wraparound_2 index = ( skater_cam_0_mode ) max = 4 min = 1 
		change skater_cam_0_mode = <new_index> 
	ELSE 
		index_next_wraparound_2 index = ( skater_cam_0_mode ) max = 4 min = 1 
		change skater_cam_0_mode = <new_index> 
	ENDIF 
	get_camera_angle_text 
	thugpro_menu_item_update_extra_text id = menu_camera text = <angle_text> 
	IF ObjectExists id = skatercam0 
		skatercam0 : sc_setmode mode = skater_cam_0_mode 
	ENDIF 
	thugpro_save_key_value Key = "camera_angle" value = ( skater_cam_0_mode ) 
ENDSCRIPT

camera_aspect_mode = 0 
SCRIPT menu_camera_aspect_get_string 
	SWITCH ( camera_aspect_mode ) 
		CASE 0 
			RETURN text = "Auto" 
		CASE 1 
			RETURN text = "4:3" 
		CASE 2 
			RETURN text = "16:9" 
		CASE 3 
			RETURN text = "16:10" 
		DEFAULT 
			RETURN text = "\\c2Error!!" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT toggle_camera_aspect 
	GetTags 
	IF GotParam left 
		index_previous_wraparound_2 index = ( camera_aspect_mode ) max = 3 min = 0 
		change camera_aspect_mode = <new_index> 
	ELSE 
		index_next_wraparound_2 index = ( camera_aspect_mode ) max = 3 min = 0 
		change camera_aspect_mode = <new_index> 
	ENDIF 
	menu_camera_aspect_get_string 
	thugpro_menu_item_update_extra_text id = <id> text = <text> 
	thugpro_save_key_value Key = "camera_aspect_mode" value = ( camera_aspect_mode ) apply_changes 
ENDSCRIPT

camera_fov_value = 72.00000000000 
camera_fov_def = 72.00000000000 
camera_fov_min = 22.00000000000 
camera_fov_max = 132.00000000000 
SCRIPT menu_camera_fov_get_string 
	FormatText TextName = fov_text "%a" a = ( camera_fov_value ) 
	RETURN text = <fov_text> 
ENDSCRIPT

SCRIPT toggle_camera_fov 
	IF GotParam left 
		IF ( ( ( camera_fov_value ) - 2.00000000000 ) > ( camera_fov_min ) ) 
			change camera_fov_value = ( ( camera_fov_value ) - 2.00000000000 ) 
		ENDIF 
	ELSE 
		IF ( ( ( camera_fov_value ) + 2.00000000000 ) < ( camera_fov_max ) ) 
			change camera_fov_value = ( ( camera_fov_value ) + 2.00000000000 ) 
		ENDIF 
	ENDIF 
	IF NOT GotParam no_menu 
		GetTags 
		menu_camera_fov_get_string 
		SetScreenElementProps { 
			id = { <id> child = extra_text } 
			text = <text> 
		} 
	ENDIF 
	thugpro_save_key_value Key = "camera_fov_value" value = ( camera_fov_value ) apply_changes 
ENDSCRIPT

SCRIPT create_real_cheats_menu { 
		back_script = create_options_menu 
	} 
	thugpro_menu_create { 
		menu_name = cheats 
		menu_title = "CHEATS" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text_toggle 
		pad_back_script = <back_script> 
		show_description_panel 
		boxed 
	} 
	kill_start_key_binding 
	make_cheats_menu_item { 
		text = "Cool Specials" 
		cheat_flag = CHEAT_COOL_SPECIAL_TRICKS 
	} 
	make_cheats_menu_item { 
		text = "Super Blood" 
		cheat_flag = CHEAT_SUPER_BLOOD 
	} 
	make_cheats_menu_item { 
		text = "Kid Mode" 
		cheat_flag = CHEAT_KID 
		pad_choose_params = { 
			on_callback = refresh_skater_model_for_cheats 
			off_callback = refresh_skater_model_for_cheats 
		} 
	} 
	make_cheats_menu_item { 
		text = "Invisible" 
		cheat_flag = CHEAT_INVISIBLE 
		pad_choose_params = { 
			on_callback = refresh_skater_model_for_cheats 
			off_callback = refresh_skater_model_for_cheats 
		} 
	} 
	make_cheats_menu_item { 
		text = "Hoverboard" 
		cheat_flag = CHEAT_HOVERBOARD 
		pad_choose_params = { 
			on_callback = refresh_skater_model_for_cheats 
			off_callback = refresh_skater_model_for_cheats 
		} 
	} 
	make_cheats_menu_item { 
		text = "Always Special" 
		cheat_flag = CHEAT_ALWAYS_SPECIAL 
	} 
	make_cheats_menu_item { 
		text = "Perfect Rail" 
		cheat_flag = CHEAT_PERFECT_RAIL 
	} 
	make_cheats_menu_item { 
		text = "Perfect Skitch" 
		cheat_flag = CHEAT_PERFECT_SKITCH 
	} 
	make_cheats_menu_item { 
		text = "Perfect Manual" 
		cheat_flag = CHEAT_PERFECT_MANUAL 
	} 
	make_cheats_menu_item { 
		text = "Moon Gravity" 
		cheat_flag = CHEAT_MOON 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT make_cheats_menu_item { 
		pad_choose_script = nullscript 
	} 
	IF GotParam not_focusable 
		make_thugpro_menu_item { 
			text = <text> 
			not_focusable 
		} 
	ELSE 
		IF ( GetGlobalFlag flag = <cheat_flag> ) 
			<extra_text> = "On" 
		ELSE 
			<extra_text> = "Off" 
		ENDIF 
		make_thugpro_menu_item { 
			text = <text> 
			extra_text = <extra_text> 
			option_arrows_callback = toggle_cheat 
			option_arrows_callback_params = { cheat_flag = <cheat_flag> <pad_choose_params> } 
			option_arrows 
			pad_choose 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT create_controller_config_menu 
ENDSCRIPT

SCRIPT controller_config_exit 
ENDSCRIPT

SCRIPT control_change_values 
ENDSCRIPT

SCRIPT control_menu_vibrate_controller 
ENDSCRIPT

joystick_pushed = 0 
SCRIPT control_config_show_values 
ENDSCRIPT

SCRIPT controller_config_focus 
ENDSCRIPT

SCRIPT controller_config_unfocus 
ENDSCRIPT

SCRIPT GammaOptions_Create_menu 
	thugpro_menu_create { 
		menu_name = gamma_options 
		menu_title = "Gamma Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_predisplay_options_menu 
		helper_text = generic_helper_text_toggle 
	} 
	GetGammaValues 
	FormatText TextName = red_text "%i" i = <red> 
	FormatText TextName = green_text "%i" i = <green> 
	FormatText TextName = blue_text "%i" i = <blue> 
	make_thugpro_menu_item { 
		id = gamma_menu_red 
		text = "Red" 
		extra_text = <red_text> 
		option_arrows_callback = GammaOptions_turn_up_or_down 
		option_arrows_callback_params = { color = red } 
		option_arrows 
	} 
	make_thugpro_menu_item { 
		id = gamma_menu_green 
		text = "Green" 
		extra_text = <green_text> 
		option_arrows_callback = GammaOptions_turn_up_or_down 
		option_arrows_callback_params = { color = green } 
		option_arrows 
	} 
	make_thugpro_menu_item { 
		id = gamma_menu_blue 
		text = "Blue" 
		extra_text = <blue_text> 
		option_arrows_callback = GammaOptions_turn_up_or_down 
		option_arrows_callback_params = { color = blue } 
		option_arrows 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT GammaOptions_turn_up_or_down 
	GetGammaValues 
	IF GotParam right 
		GetGammaValues 
		ApplyChangeGamma <...> change = 0.00999999978 
	ELSE 
		IF GotParam left 
			ApplyChangeGamma <...> change = -0.00999999978 
		ENDIF 
	ENDIF 
	wait 1 frame 
	GammaOptions_check_levels 
ENDSCRIPT

SCRIPT GammaOptions_turn_up 
	GetGammaValues 
	ApplyChangeGamma <...> change = 0.00999999978 
	wait 1 frame 
	GammaOptions_check_levels 
ENDSCRIPT

SCRIPT GammaOptions_turn_down 
	GetGammaValues 
	ApplyChangeGamma <...> change = -0.00999999978 
	wait 1 frame 
	GammaOptions_check_levels 
ENDSCRIPT

SCRIPT GammaOptions_check_levels 
	GetGammaValues 
	FormatText TextName = red_text "%i" i = <red> 
	FormatText TextName = green_text "%i" i = <green> 
	FormatText TextName = blue_text "%i" i = <blue> 
	SetScreenElementLock id = gamma_menu_red off 
	SetScreenElementLock id = gamma_menu_green off 
	SetScreenElementLock id = gamma_menu_blue off 
	SetScreenElementProps { 
		id = { gamma_menu_red child = extra_text } 
		text = <red_text> 
	} 
	SetScreenElementProps { 
		id = { gamma_menu_green child = extra_text } 
		text = <green_text> 
	} 
	SetScreenElementProps { 
		id = { gamma_menu_blue child = extra_text } 
		text = <blue_text> 
	} 
ENDSCRIPT

SCRIPT theme_menu_add_flag_item_confirm 
ENDSCRIPT

SCRIPT theme_toggle_flag_confirm 
ENDSCRIPT

SCRIPT confirm_no_progressive 
ENDSCRIPT

SCRIPT no_progressive_scan 
ENDSCRIPT

SCRIPT yes_progressive_scan 
ENDSCRIPT

SCRIPT onload_progressive_scan_check 
ENDSCRIPT

SCRIPT progressive_timeout 
ENDSCRIPT

SCRIPT set_progressive_mode_onload 
ENDSCRIPT

SCRIPT progressive_done 
ENDSCRIPT

SCRIPT unset_progressive_mode_onload 
ENDSCRIPT

SCRIPT change_screen_mode 
	IF LevelIs Load_MainMenu 
		IF GotParam standard 
			change ingame_screen_mode = standard_screen_mode 
		ENDIF 
		IF GotParam wide 
			change ingame_screen_mode = widescreen_screen_mode 
		ENDIF 
		IF GotParam letter 
			change ingame_screen_mode = letterbox_screen_mode 
		ENDIF 
		IF GotParam %"16_10" 
			change ingame_screen_mode = %"16_10_screen_mode" 
		ENDIF 
	ELSE 
		<callback> <...> 
		change ingame_screen_mode = ( current_screen_mode ) 
	ENDIF 
ENDSCRIPT

SCRIPT build_screen_menu_graphic 
	printf "build_screen_menu_graphic not available" 
ENDSCRIPT

SCRIPT morph_tv_scan_line 
	printf "morph_tv_scan_line not available" 
ENDSCRIPT

SCRIPT tv_logo_twitch 
	printf "tv_logo_twitch not available" 
ENDSCRIPT

SCRIPT split_setup_horizontal 
	printf "changing split mode to horizontal" 
	SetScreenMode split_horizontal 
	ScreenElementSystemCleanup 
	IF GotParam end_run 
		create_end_run_menu 
	ELSE 
		create_pause_menu 
	ENDIF 
	UpdateScore 
	SetActivecamera id = skatercam0 viewport = 0 
	SetActivecamera id = skatercam1 viewport = 1 
ENDSCRIPT

SCRIPT split_setup_vertical 
	printf "changing split mode to vertical" 
	SetScreenMode split_vertical 
	ScreenElementSystemCleanup 
	IF GotParam end_run 
		create_end_run_menu 
	ELSE 
		create_pause_menu 
	ENDIF 
	UpdateScore 
	SetActivecamera id = skatercam0 viewport = 0 
	SetActivecamera id = skatercam1 viewport = 1 
ENDSCRIPT

SCRIPT toggle_auto_brake_option 
	GetTags 
	GetPreferenceString pref_type = network auto_brake 
	IF ( <ui_string> = "off" ) 
		text = "on" 
		SetPreferencesFromUI prefs = network field = "auto_brake" checksum = boolean_true string = "on" 
		SetScreenElementProps id = { <id> child = extra_text } text = "on" 
	ELSE 
		text = "off" 
		SetPreferencesFromUI prefs = network field = "auto_brake" checksum = boolean_false string = "off" 
		SetScreenElementProps id = { <id> child = extra_text } text = "off" 
	ENDIF 
ENDSCRIPT


