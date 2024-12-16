
SCRIPT create_options_menu 
	menu3d_zoom_options 
	hide_current_goal 
	make_new_roundbar_menu title = "OPTIONS" pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_pause_menu } 
	IF NOT InSplitScreenGame 
		pause_menu_gradient 
	ENDIF 
	pad_back_script = create_pause_menu 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	IF NOT GameModeEquals is_creategoals 
		IF NOT inNetGame 
			add_roundbar_menu_item text = "SAVE GAME" id = menu_save_game pad_choose_script = launch_pause_menu_save_game_sequence 
		ENDIF 
	ENDIF 
	IF NOT ( DEMO_BUILD ) 
		IF GameModeEquals is_singlesession 
			IF NOT InSplitScreenGame 
				IF NOT inNetGame 
					add_roundbar_menu_item text = "HIGH SCORES" id = menu_high_scores pad_choose_script = high_scores_menu_create pad_choose_params = { from_pause = from_pause } 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT InMultiPlayerGame 
			IF isngc 
				SWITCH camera_angle 
					CASE 0 
						camera_text = "CAMERA ANGLE: 1" 
					CASE 1 
						camera_text = "CAMERA ANGLE: 2" 
					CASE 2 
						camera_text = "CAMERA ANGLE: 3" 
					CASE 3 
						camera_text = "CAMERA ANGLE: 4" 
				ENDSWITCH 
				add_roundbar_menu_item text = <camera_text> id = menu_camera pad_choose_script = toggle_camera_angle pad_choose_params = { } 
			ENDIF 
			add_roundbar_menu_item text = "CHEATS" id = menu_real_cheats pad_choose_script = create_real_cheats_menu 
		ELSE 
			IF inNetGame 
				IF NOT ( ( isTrue Bootstrap_build ) | ( isTrue DEMO_BUILD ) ) 
					IF NOT CD 
						add_roundbar_menu_item text = "Cheats: DO NOT TEST" id = menu_cheats pad_choose_script = launch_cheats_menu 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	add_roundbar_menu_item text = "SOUND OPTIONS" id = menu_sound_options pad_choose_script = launch_sound_options_menu pad_choose_params = { from_options } 
	IF NOT InSplitScreenGame 
		IF NOT inNetGame 
			add_roundbar_menu_item { text = #"CONTROL SETUP" 
				id = options_controller 
				pad_choose_script = create_controller_config_menu 
				pad_choose_params = { controller_number = 1 from_options } 
				centered 
				no_bg 
			} 
		ENDIF 
	ENDIF 
	IF IsXbox 
		add_roundbar_menu_item text = "ADJUST GAMMA" id = menu_gamma pad_choose_script = create_gamma_menu 
	ELSE 
		add_roundbar_menu_item text = "SCREEN MODE" id = menu_screen pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_screen_menu } 
	ENDIF 
	add_roundbar_menu_item text = "DISPLAY OPTIONS" id = menu_display_options pad_choose_script = launch_display_options_menu pad_choose_params = { from_options } 
	IF NOT ( DEMO_BUILD ) 
		IF inNetGame 
			IF InTeamGame 
				GetPreferenceString pref_type = network score_display 
				add_roundbar_menu_item text = "SCORE DISPLAY MODE" id = menu_score_display pad_choose_script = create_options_score_display_menu 
				add_roundbar_menu_item text = <ui_string> id = menu_score_display_str rgba = [ 80 80 80 128 ] not_focusable 
			ENDIF 
			GetPreferenceString pref_type = network auto_brake 
			FormatText TextName = AutoBrake_toggle_text "AUTO-BRAKE: %s" s = <ui_string> 
			add_roundbar_menu_item text = <AutoBrake_toggle_text> id = menu_auto_brake pad_choose_script = toggle_auto_brake_option toggle_pos = PAIR(163.00000000000, 12.00000000000) 
			GetPreferenceString pref_type = network auto_brake 
			IF ( <ui_string> = "Off" ) 
				set_restart_not_focusable = not_focusable 
			ENDIF 
			IF GameModeEquals is_lobby 
				IF NOT isObserving 
					IF skater : Obj_FlagSet FLAG_SKATER_KILLING 
						set_restart_not_focusable = not_focusable 
					ENDIF 
					IF skater : Skating 
						IF skater : OnLip 
							set_restart_not_focusable = not_focusable 
						ELSE 
							IF skater : OnRail 
								set_restart_not_focusable = not_focusable 
							ENDIF 
						ENDIF 
					ENDIF 
					IF skater : InAir 
						set_restart_not_focusable = not_focusable 
					ENDIF 
					IF skater : Walk_air 
						set_restart_not_focusable = not_focusable 
					ENDIF 
					IF skater : Walking 
						skater : Walk_GetState 
						IF ( <State> = WALKING_HANG | <State> = WALKING_LADDER | <State> = WALKING_ANIMWAIT ) 
							set_restart_not_focusable = not_focusable 
						ENDIF 
					ENDIF 
					add_roundbar_menu_item { 
						text = "SET RESTART" 
						id = menu_set_custom 
						pad_choose_script = menu_select 
						pad_choose_params = { menu_select_script = set_custom_restart } 
						not_focusable = <set_restart_not_focusable> 
					} 
					IF skater : SetCustomRestart 
						add_roundbar_menu_item text = "GOTO RESTART" id = menu_skip_to_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = skip_to_custom_restart } 
					ELSE 
						add_roundbar_menu_item text = "GOTO RESTART" id = menu_skip_to_custom not_focusable 
					ENDIF 
				ELSE 
					add_roundbar_menu_item text = "SET RESTART" id = menu_set_custom not_focusable 
					add_roundbar_menu_item text = "GOTO RESTART" id = menu_skip_to_custom not_focusable 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT ObjectExists id = menu_real_cheats 
				add_roundbar_menu_item text = "CHEATS" id = menu_real_cheats pad_choose_script = create_real_cheats_menu 
			ENDIF 
		ENDIF 
	ENDIF 
	
	IF inNetGame 
		IF GameModeEquals is_lobby 
			IF isObserving 
				NoCustomRestarts = 1 
			ELSE 
				IF NOT ObjectExists id = skater 
					NoCustomRestarts = 1 
				ELSE 
					IF skater : Skating 
						IF skater : OnLip 
							NoCustomRestarts = 1 
						ELSE 
							IF skater : OnRail 
								NoCustomRestarts = 1 
							ENDIF 
						ENDIF 
					ELSE 
						IF skater : Walking 
							skater : Walk_GetState 
							IF ( <State> = WALKING_HANG | <State> = WALKING_LADDER | <State> = WALKING_ANIMWAIT ) 
								NoCustomRestarts = 1 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF GoalManager_HasActiveGoals count_all 
			NoCustomRestarts = 1 
		ELSE 
			IF skater : PlayerInputIsDisabled 
				NoCustomRestarts = 1 
			ELSE 
				IF GameModeEquals is_creategoals 
					NoCustomRestarts = 1 
				ELSE 
					IF skater : Skating 
						IF skater : OnLip 
							NoCustomRestarts = 1 
						ELSE 
							IF skater : OnRail 
								NoCustomRestarts = 1 
							ENDIF 
						ENDIF 
					ELSE 
						IF skater : Walking 
							skater : Walk_GetState 
							IF ( <State> = WALKING_HANG | <State> = WALKING_LADDER | <State> = WALKING_ANIMWAIT ) 
								NoCustomRestarts = 1 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	roundbar_menu_finish 
ENDSCRIPT

camera_angle = 0 
SCRIPT toggle_camera_angle 
	SWITCH camera_angle 
		CASE 0 
			change camera_angle = 1 
			SetScreenElementProps id = { menu_camera child = 0 } text = "CAMERA ANGLE: 2" 
			ToggleSkaterCamMode skater = 0 
		CASE 1 
			change camera_angle = 2 
			SetScreenElementProps id = { menu_camera child = 0 } text = "CAMERA ANGLE: 3" 
			ToggleSkaterCamMode skater = 0 
		CASE 2 
			change camera_angle = 3 
			SetScreenElementProps id = { menu_camera child = 0 } text = "CAMERA ANGLE: 4" 
			ToggleSkaterCamMode skater = 0 
		CASE 3 
			change camera_angle = 0 
			SetScreenElementProps id = { menu_camera child = 0 } text = "CAMERA ANGLE: 1" 
			ToggleSkaterCamMode skater = 0 
	ENDSWITCH 
ENDSCRIPT

SCRIPT create_real_cheats_menu back_script = create_options_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF InSplitScreenGame 
		GoalManager_HidePoints 
	ENDIF 
	IF inNetGame 
		make_new_themed_scrolling_menu title = "ADVANCED OPTIONS" dims = PAIR(600.00000000000, 237.00000000000) pos = PAIR(229.00000000000, 80.00000000000) right_bracket_z = 1 
	ELSE 
		make_new_themed_scrolling_menu title = "CHEATS" dims = PAIR(600.00000000000, 237.00000000000) pos = PAIR(229.00000000000, 80.00000000000) right_bracket_z = 1 
	ENDIF 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = <back_script> } } 
		] 
	} 
	create_helper_text generic_helper_text_toggle 
	kill_start_key_binding 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_1 
			make_cheats_menu_item text = "Cool Specials" cheat_flag = CHEAT_COOL_SPECIAL_TRICKS pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_3 
			make_cheats_menu_item { 
				text = "Kid Mode" 
				cheat_flag = CHEAT_KID 
				pad_choose_script = toggle_cheat 
				pad_choose_params = { 
					on_callback = refresh_skater_model_for_cheats 
					off_callback = refresh_skater_model_for_cheats 
				} 
			} 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_5 
			make_cheats_menu_item { 
				text = "RollerSkates" 
				cheat_flag = CHEAT_HOVERBOARD 
				pad_choose_script = toggle_cheat 
				pad_choose_params = { 
					on_callback = refresh_skater_model_for_cheats 
					off_callback = refresh_skater_model_for_cheats 
				} 
			} 
		ENDIF 
	ENDIF 
	IF GetGlobalFlag flag = CHEAT_UNLOCKED_10 
		make_cheats_menu_item text = "Flame" cheat_flag = CHEAT_FLAME pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_12 
			make_cheats_menu_item text = "Always Special" cheat_flag = CHEAT_ALWAYS_SPECIAL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_13 
			make_cheats_menu_item text = "Perfect Rail" cheat_flag = CHEAT_PERFECT_RAIL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_14 
			make_cheats_menu_item text = "Perfect Skitch" cheat_flag = CHEAT_PERFECT_SKITCH pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_16 
			make_cheats_menu_item text = "Perfect Manual" cheat_flag = CHEAT_PERFECT_MANUAL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GetGlobalFlag flag = CHEAT_UNLOCKED_17 
			make_cheats_menu_item text = "Moon Gravity" cheat_flag = CHEAT_MOON pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
		ENDIF 
	ENDIF 
	IF inNetGame 
		IF IsHost 
			make_cheats_menu_item text = "No Reverts" cheat_flag = FLAG_G_EXPERT_MODE_NO_REVERTS pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript reverse } 
			make_cheats_menu_item text = "No Walking" cheat_flag = FLAG_G_EXPERT_MODE_NO_WALKING pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript reverse } 
			make_cheats_menu_item text = "No Manuals" cheat_flag = FLAG_G_EXPERT_MODE_NO_MANUALS pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript reverse } 
			make_cheats_menu_item text = "No Bal. Meters" cheat_flag = NO_G_DISPLAY_BALANCE pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript reverse } 
		ENDIF 
	ENDIF 
	theme_menu_add_item text = "Done" id = menu_done scale = 1.00000000000 pad_choose_script = <back_script> no_bg highlight_bar_scale = PAIR(2.79999995232, 0.80000001192) 
	finish_themed_scrolling_menu bg_width = 4.00000000000 time = 0.20000000298 
ENDSCRIPT

SCRIPT make_cheats_menu_item { focus_script = do_scale_up 
		unfocus_script = do_scale_down 
		pad_choose_script = nullscript 
		font_face = small 
		parent_menu_id = current_menu 
		scale = 0.80000001192 
		dims = PAIR(350.00000000000, 14.00000000000) 
		rgba = [ 88 105 112 128 ] 
	} 
	pad_choose_params = { cheat_flag = <cheat_flag> <pad_choose_params> } 
	IF GotParam not_focusable 
		CreateScreenElement { 
			type = textelement 
			parent = <parent_menu_id> 
			id = <id> 
			text = <text> 
			font = <font_face> 
			rgba = [ 30 30 30 128 ] 
			scale = <scale> 
			dims = <dims> 
			not_focusable 
		} 
	ELSE 
		IF ( GetGlobalFlag flag = <cheat_flag> ) 
			on_off_text = "On" 
		ELSE 
			on_off_text = "Off" 
		ENDIF 
		theme_menu_add_item text = <text> id = <checksum> highlight_bar_scale = PAIR(2.79999995232, 0.80000001192) extra_text = <on_off_text> no_bg pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params> 
	ENDIF 
ENDSCRIPT

SCRIPT create_controller_config_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam controller_number 
		IF ( <controller_number> = -1 ) 
			FormatText TextName = menu_title "COMMON" n = <controller_number> 
		ELSE 
			FormatText TextName = menu_title "PLAYER %n" n = <controller_number> 
		ENDIF 
		helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
				{ text = "\\b6/\\b5 = Adjust" } 
				{ text = "\\bn = Back" } 
				{ text = "\\bm = Accept" } 
			] 
		} 
	ELSE 
		menu_title = "CONTROL SETUP" 
		helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
				{ text = "\\bn = Back" } 
				{ text = "\\bm = Accept" } 
			] 
		} 
	ENDIF 
	make_new_themed_sub_menu title = <menu_title> 
	IF LevelIs Load_MainMenu 
		build_top_and_bottom_blocks 
		make_mainmenu_3d_plane 
		change joystick_pushed = 0 
		control_options_graphic 
		SetScreenElementProps { id = sub_vmenu event_handlers = [ 
				{ pad_up animate_joystick params = { dir = up } } 
				{ pad_down animate_joystick params = { dir = down } } 
			] 
		} 
	ENDIF 
	kill_start_key_binding 
	IF isngc 
		<vibration_text> = "Rumble" 
	ELSE 
		<vibration_text> = "Vibration" 
	ENDIF 
	IF GotParam from_options 
		<from_options> = from_options 
	ENDIF 
	IF GotParam controller_number 
		IF GotParam from_options 
			SetScreenElementProps { id = sub_menu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = controller_config_exit from_options = <from_options> } } 
				] 
			} 
		ELSE 
			SetScreenElementProps { id = sub_menu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = create_controller_config_menu from_options = <from_options> } } 
				] 
			} 
		ENDIF 
		IF NOT ( <controller_number> = -1 ) 
			theme_menu_add_item { text = <vibration_text> 
				id = menu_vibration 
				focus_script = controller_config_focus 
				unfocus_script = controller_config_unfocus 
				pad_choose_script = nullscript 
			} 
			theme_menu_add_item { text = "Autokick" 
				id = menu_autokick 
				focus_script = controller_config_focus 
				unfocus_script = controller_config_unfocus 
				pad_choose_script = nullscript 
			} 
			IF NOT isngc 
				theme_menu_add_item { text = "180 Spin Taps" 
					id = menu_spintaps 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
				} 
			ENDIF 
		ENDIF 
		IF ( <controller_number> = 1 ) 
			IF NOT LevelIs Load_MainMenu 
				IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS ) ) 
					theme_menu_add_item { text = "No Reverts" 
						id = menu_reverts 
						focus_script = controller_config_focus 
						unfocus_script = controller_config_unfocus 
						pad_choose_script = nullscript 
						not_focusable = not_focusable 
					} 
				ELSE 
					theme_menu_add_item { text = "No Reverts" 
						id = menu_reverts 
						focus_script = controller_config_focus 
						unfocus_script = controller_config_unfocus 
						pad_choose_script = nullscript 
					} 
				ENDIF 
				IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
					theme_menu_add_item { text = "No Manuals" 
						id = menu_manuals 
						focus_script = controller_config_focus 
						unfocus_script = controller_config_unfocus 
						pad_choose_script = nullscript 
						not_focusable = not_focusable 
					} 
				ELSE 
					theme_menu_add_item { text = "No Manuals" 
						id = menu_manuals 
						focus_script = controller_config_focus 
						unfocus_script = controller_config_unfocus 
						pad_choose_script = nullscript 
					} 
				ENDIF 
				IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
					theme_menu_add_item { text = "No Walking" 
						id = menu_walking 
						focus_script = controller_config_focus 
						unfocus_script = controller_config_unfocus 
						pad_choose_script = nullscript 
						not_focusable = not_focusable 
					} 
				ELSE 
					theme_menu_add_item { text = "No Walking" 
						id = menu_walking 
						focus_script = controller_config_focus 
						unfocus_script = controller_config_unfocus 
						pad_choose_script = nullscript 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		IF ( <controller_number> = -1 ) 
			IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS ) ) 
				theme_menu_add_item { text = "No Reverts" 
					id = menu_reverts 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
					not_focusable = not_focusable 
				} 
			ELSE 
				theme_menu_add_item { text = "No Reverts" 
					id = menu_reverts 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
				} 
			ENDIF 
			IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
				theme_menu_add_item { text = "No Manuals" 
					id = menu_manuals 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
					not_focusable = not_focusable 
				} 
			ELSE 
				theme_menu_add_item { text = "No Manuals" 
					id = menu_manuals 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
				} 
			ENDIF 
			IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
				theme_menu_add_item { text = "No Walking" 
					id = menu_walking 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
					not_focusable = not_focusable 
				} 
			ELSE 
				theme_menu_add_item { text = "No Walking" 
					id = menu_walking 
					focus_script = controller_config_focus 
					unfocus_script = controller_config_unfocus 
					pad_choose_script = nullscript 
				} 
			ENDIF 
		ENDIF 
		IF GotParam from_options 
			theme_menu_add_item { text = "Done" 
				id = menu_done 
				pad_choose_script = generic_menu_pad_choose 
				pad_choose_params = { callback = controller_config_exit from_options = <from_options> } 
				last_menu_item = last_menu_item 
			} 
		ELSE 
			theme_menu_add_item { text = "Done" 
				id = menu_done 
				pad_choose_script = generic_menu_pad_choose 
				pad_choose_params = { callback = create_controller_config_menu from_options = <from_options> } 
				last_menu_item = last_menu_item 
			} 
		ENDIF 
		control_config_show_values controller_number = <controller_number> 
	ELSE 
		SetScreenElementProps { id = sub_menu 
			event_handlers = [ 
				{ pad_back generic_menu_pad_back params = { callback = controller_config_exit from_options = <from_options> } } 
			] 
		} 
		theme_menu_add_item { text = "Player 1" 
			id = menu_controller_1 
			pad_choose_script = generic_menu_pad_choose 
			pad_choose_params = { callback = create_controller_config_menu controller_number = 1 from_options = <from_options> } 
			centered 
		} 
		theme_menu_add_item { text = "Player 2" 
			id = menu_controller_2 
			pad_choose_script = generic_menu_pad_choose 
			pad_choose_params = { callback = create_controller_config_menu controller_number = 2 from_options = <from_options> } 
			centered 
		} 
		theme_menu_add_item { text = "Common" 
			id = menu_controller_x 
			pad_choose_script = generic_menu_pad_choose 
			pad_choose_params = { callback = create_controller_config_menu controller_number = -1 from_options = <from_options> } 
			centered 
		} 
		theme_menu_add_item { text = "Done" 
			id = menu_done 
			pad_choose_script = generic_menu_pad_choose 
			pad_choose_params = { callback = controller_config_exit from_options = <from_options> } 
			last_menu_item = last_menu_item 
			centered 
		} 
	ENDIF 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = control_icon no_animate icon_pos = PAIR(565.00000000000, 135.00000000000) icon_scale = 1.14999997616 
	ENDIF 
	finish_themed_sub_menu 
	create_helper_text <helper_text> 
ENDSCRIPT

SCRIPT controller_config_exit 
	KillSpawnedScript name = shake_projector 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam from_options 
		create_options_menu 
	ELSE 
		IF GotParam from_movies 
			create_gamemovies_menu 
		ELSE 
			create_gamesettings_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT control_change_values 
	player = ( <controller_number> - 1 ) 
	IF GotParam vibration 
		KillSpawnedScript name = control_menu_vibrate_controller 
		IF IsXbox 
			Vibrate_Controller_Safe_Explicit actuator = 1 percent = 0 skaternumber = <player> 
		ELSE 
			VibrateController port = <player> actuator = 1 percent = 0 
		ENDIF 
		IF VibrationIsOn <player> 
			VibrationOff <player> 
			SetScreenElementProps id = menu_vibration_value text = "off" 
		ELSE 
			VibrationOn <player> 
			SetScreenElementProps id = menu_vibration_value text = "on" 
			SpawnScript control_menu_vibrate_controller params = <...> 
		ENDIF 
	ENDIF 
	IF GotParam autokick 
		IF AutokickIsOn <player> 
			AutokickOff <player> 
			SetScreenElementProps id = menu_autokick_value text = "off" 
		ELSE 
			AutokickOn <player> 
			SetScreenElementProps id = menu_autokick_value text = "on" 
		ENDIF 
	ENDIF 
	IF NOT isngc 
		IF GotParam spintaps 
			IF SpinTapsAreOn <player> 
				SpinTapsOff <player> 
				SetScreenElementProps id = menu_spintaps_value text = "off" 
			ELSE 
				SpinTapsOn <player> 
				SetScreenElementProps id = menu_spintaps_value text = "on" 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam reverts 
		IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS ) 
			SetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS 
			SetScreenElementProps id = menu_reverts_value text = "on" 
		ELSE 
			UnsetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS 
			SetScreenElementProps id = menu_reverts_value text = "off" 
		ENDIF 
	ENDIF 
	IF GotParam manuals 
		IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS ) 
			SetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS 
			SetScreenElementProps id = menu_manuals_value text = "on" 
		ELSE 
			UnsetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS 
			SetScreenElementProps id = menu_manuals_value text = "off" 
		ENDIF 
	ENDIF 
	IF GotParam Walking 
		IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) 
			SetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING 
			SetScreenElementProps id = menu_walking_value text = "on" 
		ELSE 
			UnsetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING 
			SetScreenElementProps id = menu_walking_value text = "off" 
		ENDIF 
	ENDIF 
	GetTags 
	IF GotParam left 
		RunScriptOnScreenElement id = { <id> child = 5 } menu_blink_arrow 
	ELSE 
		RunScriptOnScreenElement id = { <id> child = 6 } menu_blink_arrow 
	ENDIF 
	generic_menu_pad_choose_sound 
	TemporarilyDisableInput time = 100 
ENDSCRIPT

SCRIPT control_menu_vibrate_controller 
	IF ScreenElementExists id = joystick_anchor 
		SpawnScript shake_projector params = { id = joystick_anchor amplitude = 5 time = 0.05000000075 } 
	ENDIF 
	IF LevelIs Load_MainMenu 
		IF IsXbox 
			Vibrate_Controller_Safe_Explicit actuator = 1 percent = 70 skaternumber = <player> 
		ELSE 
			VibrateController port = <player> actuator = 1 percent = 70 
		ENDIF 
		wait 250 
		IF IsXbox 
			Vibrate_Controller_Safe_Explicit actuator = 1 percent = 0 skaternumber = <player> 
		ELSE 
			VibrateController port = <player> actuator = 1 percent = 0 
		ENDIF 
		KillSpawnedScript name = shake_projector 
	ELSE 
		index = 0 
		BEGIN 
			IF ControllerBoundToSkater controller = <index> skater = <player> 
				VibrateController port = <index> actuator = 1 percent = 70 
				wait 250 
				VibrateController port = <index> actuator = 1 percent = 0 
				KillSpawnedScript name = shake_projector 
				BREAK 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT 4 
	ENDIF 
	IF ScreenElementExists id = joystick_anchor 
		DoScreenElementMorph id = joystick_anchor pos = PAIR(340.00000000000, 30.00000000000) time = 0.10000000149 
	ENDIF 
ENDSCRIPT

joystick_pushed = 0 
SCRIPT control_config_show_values 
	Theme_GetUnhighlightedTextColor return_value = text_color 
	player = ( <controller_number> - 1 ) 
	IF NOT ( <controller_number> = -1 ) 
		IF VibrationIsOn <player> 
			vibration_value = "on" 
		ELSE 
			vibration_value = "off" 
		ENDIF 
		IF AutokickIsOn <player> 
			autokick_value = "on" 
		ELSE 
			autokick_value = "off" 
		ENDIF 
		IF SpinTapsAreOn <player> 
			spintaps_value = "on" 
		ELSE 
			spintaps_value = "off" 
		ENDIF 
	ENDIF 
	IF ( <controller_number> = 1 ) 
		IF NOT LevelIs Load_MainMenu 
			IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS ) 
				reverts_value = "off" 
			ELSE 
				reverts_value = "on" 
			ENDIF 
			IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) 
				walking_value = "off" 
			ELSE 
				walking_value = "on" 
			ENDIF 
			IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS ) 
				manuals_value = "off" 
			ELSE 
				manuals_value = "on" 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <controller_number> = -1 ) 
		IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS ) 
			reverts_value = "off" 
		ELSE 
			reverts_value = "on" 
		ENDIF 
		IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) 
			walking_value = "off" 
		ELSE 
			walking_value = "on" 
		ENDIF 
		IF NOT ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS ) 
			manuals_value = "off" 
		ELSE 
			manuals_value = "on" 
		ENDIF 
	ENDIF 
	IF NOT ( <controller_number> = -1 ) 
		CreateScreenElement { 
			type = textelement 
			parent = menu_vibration 
			id = menu_vibration_value 
			font = small 
			just = [ center top ] 
			pos = PAIR(142.00000000000, -17.00000000000) 
			text = <vibration_value> 
			rgba = <text_color> 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_vibration 
			texture = left_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(122.00000000000, -17.00000000000) 
			just = [ right top ] 
			scale = 0.75000000000 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_vibration 
			texture = right_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(162.00000000000, -17.00000000000) 
			just = [ left top ] 
			scale = 0.75000000000 
		} 
		CreateScreenElement { 
			type = textelement 
			parent = menu_autokick 
			id = menu_autokick_value 
			font = small 
			just = [ center top ] 
			pos = PAIR(142.00000000000, -17.00000000000) 
			text = <autokick_value> 
			rgba = <text_color> 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_autokick 
			texture = left_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(122.00000000000, -17.00000000000) 
			just = [ right top ] 
			scale = 0.75000000000 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_autokick 
			texture = right_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(162.00000000000, -17.00000000000) 
			just = [ left top ] 
			scale = 0.75000000000 
		} 
		IF NOT isngc 
			CreateScreenElement { 
				type = textelement 
				parent = menu_spintaps 
				id = menu_spintaps_value 
				font = small 
				just = [ center top ] 
				pos = PAIR(142.00000000000, -17.00000000000) 
				text = <spintaps_value> 
				rgba = <text_color> 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_spintaps 
				texture = left_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(122.00000000000, -17.00000000000) 
				just = [ right top ] 
				scale = 0.75000000000 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_spintaps 
				texture = right_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(162.00000000000, -17.00000000000) 
				just = [ left top ] 
				scale = 0.75000000000 
			} 
		ENDIF 
	ENDIF 
	IF ( <controller_number> = 1 ) 
		IF NOT LevelIs Load_MainMenu 
			IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS ) ) 
				<rgba> = [ 60 60 60 75 ] 
			ELSE 
				<rgba> = <text_color> 
			ENDIF 
			CreateScreenElement { 
				type = textelement 
				parent = menu_reverts 
				id = menu_reverts_value 
				font = small 
				just = [ center top ] 
				pos = PAIR(142.00000000000, -17.00000000000) 
				text = <reverts_value> 
				rgba = <rgba> 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_reverts 
				texture = left_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(122.00000000000, -17.00000000000) 
				just = [ right top ] 
				scale = 0.75000000000 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_reverts 
				texture = right_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(162.00000000000, -17.00000000000) 
				just = [ left top ] 
				scale = 0.75000000000 
			} 
			IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
				<rgba> = [ 60 60 60 75 ] 
			ELSE 
				<rgba> = <text_color> 
			ENDIF 
			CreateScreenElement { 
				type = textelement 
				parent = menu_manuals 
				id = menu_manuals_value 
				font = small 
				just = [ center top ] 
				pos = PAIR(142.00000000000, -17.00000000000) 
				text = <manuals_value> 
				rgba = <rgba> 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_manuals 
				texture = left_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(122.00000000000, -17.00000000000) 
				just = [ right top ] 
				scale = 0.75000000000 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_manuals 
				texture = right_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(162.00000000000, -17.00000000000) 
				just = [ left top ] 
				scale = 0.75000000000 
			} 
			IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
				<rgba> = [ 60 60 60 75 ] 
			ELSE 
				<rgba> = <text_color> 
			ENDIF 
			CreateScreenElement { 
				type = textelement 
				parent = menu_walking 
				id = menu_walking_value 
				font = small 
				just = [ center top ] 
				pos = PAIR(142.00000000000, -17.00000000000) 
				text = <walking_value> 
				rgba = <rgba> 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_walking 
				texture = left_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(122.00000000000, -17.00000000000) 
				just = [ right top ] 
				scale = 0.75000000000 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = menu_walking 
				texture = right_arrow 
				rgba = [ 128 128 128 0 ] 
				pos = PAIR(162.00000000000, -17.00000000000) 
				just = [ left top ] 
				scale = 0.75000000000 
			} 
		ENDIF 
	ENDIF 
	IF ( <controller_number> = -1 ) 
		IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS ) ) 
			<rgba> = [ 60 60 60 75 ] 
		ELSE 
			<rgba> = <text_color> 
		ENDIF 
		CreateScreenElement { 
			type = textelement 
			parent = menu_reverts 
			id = menu_reverts_value 
			font = small 
			just = [ center top ] 
			pos = PAIR(142.00000000000, -17.00000000000) 
			text = <reverts_value> 
			rgba = <rgba> 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_reverts 
			texture = left_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(122.00000000000, -17.00000000000) 
			just = [ right top ] 
			scale = 0.75000000000 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_reverts 
			texture = right_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(162.00000000000, -17.00000000000) 
			just = [ left top ] 
			scale = 0.75000000000 
		} 
		IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
			<rgba> = [ 60 60 60 75 ] 
		ELSE 
			<rgba> = <text_color> 
		ENDIF 
		CreateScreenElement { 
			type = textelement 
			parent = menu_manuals 
			id = menu_manuals_value 
			font = small 
			just = [ center top ] 
			pos = PAIR(142.00000000000, -17.00000000000) 
			text = <manuals_value> 
			rgba = <rgba> 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_manuals 
			texture = left_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(122.00000000000, -17.00000000000) 
			just = [ right top ] 
			scale = 0.75000000000 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_manuals 
			texture = right_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(162.00000000000, -17.00000000000) 
			just = [ left top ] 
			scale = 0.75000000000 
		} 
		IF ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
			<rgba> = [ 60 60 60 75 ] 
		ELSE 
			<rgba> = <text_color> 
		ENDIF 
		CreateScreenElement { 
			type = textelement 
			parent = menu_walking 
			id = menu_walking_value 
			font = small 
			just = [ center top ] 
			pos = PAIR(142.00000000000, -17.00000000000) 
			text = <walking_value> 
			rgba = <rgba> 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_walking 
			texture = left_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(122.00000000000, -17.00000000000) 
			just = [ right top ] 
			scale = 0.75000000000 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = menu_walking 
			texture = right_arrow 
			rgba = [ 128 128 128 0 ] 
			pos = PAIR(162.00000000000, -17.00000000000) 
			just = [ left top ] 
			scale = 0.75000000000 
		} 
	ENDIF 
	IF LevelIs Load_MainMenu 
		pad_left_2 = animate_joystick 
		pad_right_2 = animate_joystick 
	ELSE 
		pad_left_2 = null_script 
		pad_right_2 = null_script 
	ENDIF 
	IF NOT ( <controller_number> = -1 ) 
		SetScreenElementProps { 
			id = menu_vibration 
			event_handlers = [ { pad_left control_change_values params = { vibration controller_number = <controller_number> left } } 
				{ pad_right control_change_values params = { vibration controller_number = <controller_number> } } 
				{ pad_left <pad_left_2> params = { dir = left } } 
				{ pad_right <pad_right_2> params = { dir = right } } 
			] 
			replace_handlers 
		} 
		SetScreenElementProps { 
			id = menu_autokick 
			event_handlers = [ { pad_left control_change_values params = { autokick controller_number = <controller_number> left } } 
				{ pad_right control_change_values params = { autokick controller_number = <controller_number> } } 
				{ pad_left <pad_left_2> params = { dir = left } } 
				{ pad_right <pad_right_2> params = { dir = right } } 
			] 
			replace_handlers 
		} 
		IF NOT isngc 
			SetScreenElementProps { 
				id = menu_spintaps 
				event_handlers = [ { pad_left control_change_values params = { spintaps controller_number = <controller_number> left } } 
					{ pad_right control_change_values params = { spintaps controller_number = <controller_number> } } 
					{ pad_left <pad_left_2> params = { dir = left } } 
					{ pad_right <pad_right_2> params = { dir = right } } 
				] 
				replace_handlers 
			} 
		ENDIF 
	ENDIF 
	IF ( <controller_number> = 1 ) 
		IF NOT LevelIs Load_MainMenu 
			SetScreenElementProps { 
				id = menu_reverts 
				event_handlers = [ { pad_left control_change_values params = { reverts controller_number = <controller_number> left } } 
					{ pad_right control_change_values params = { reverts controller_number = <controller_number> } } 
					{ pad_left <pad_left_2> params = { dir = left } } 
					{ pad_right <pad_right_2> params = { dir = right } } 
				] 
				replace_handlers 
			} 
			SetScreenElementProps { 
				id = menu_walking 
				event_handlers = [ { pad_left control_change_values params = { Walking controller_number = <controller_number> left } } 
					{ pad_right control_change_values params = { Walking controller_number = <controller_number> } } 
					{ pad_left <pad_left_2> params = { dir = left } } 
					{ pad_right <pad_right_2> params = { dir = right } } 
				] 
				replace_handlers 
			} 
			SetScreenElementProps { 
				id = menu_manuals 
				event_handlers = [ { pad_left control_change_values params = { manuals controller_number = <controller_number> left } } 
					{ pad_right control_change_values params = { manuals controller_number = <controller_number> } } 
					{ pad_left <pad_left_2> params = { dir = left } } 
					{ pad_right <pad_right_2> params = { dir = right } } 
				] 
				replace_handlers 
			} 
		ENDIF 
	ENDIF 
	IF ( <controller_number> = -1 ) 
		SetScreenElementProps { 
			id = menu_reverts 
			event_handlers = [ { pad_left control_change_values params = { reverts controller_number = <controller_number> left } } 
				{ pad_right control_change_values params = { reverts controller_number = <controller_number> } } 
				{ pad_left <pad_left_2> params = { dir = left } } 
				{ pad_right <pad_right_2> params = { dir = right } } 
			] 
			replace_handlers 
		} 
		SetScreenElementProps { 
			id = menu_walking 
			event_handlers = [ { pad_left control_change_values params = { Walking controller_number = <controller_number> left } } 
				{ pad_right control_change_values params = { Walking controller_number = <controller_number> } } 
				{ pad_left <pad_left_2> params = { dir = left } } 
				{ pad_right <pad_right_2> params = { dir = right } } 
			] 
			replace_handlers 
		} 
		SetScreenElementProps { 
			id = menu_manuals 
			event_handlers = [ { pad_left control_change_values params = { manuals controller_number = <controller_number> left } } 
				{ pad_right control_change_values params = { manuals controller_number = <controller_number> } } 
				{ pad_left <pad_left_2> params = { dir = left } } 
				{ pad_right <pad_right_2> params = { dir = right } } 
			] 
			replace_handlers 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT controller_config_focus 
	GetTags 
	Theme_GetHighlightedTextColorNew return_value = text_color 
	Theme_GetUnhighlightedTextColor return_value = arrow_color 
	main_theme_focus <...> 
	SetScreenElementProps { id = { <id> child = 4 } rgba = <text_color> } 
	SetScreenElementProps { id = { <id> child = 5 } rgba = <arrow_color> } 
	SetScreenElementProps { id = { <id> child = 6 } rgba = <arrow_color> } 
ENDSCRIPT

SCRIPT controller_config_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColorNew return_value = text_color 
	main_theme_unfocus <...> 
	SetScreenElementProps { id = { <id> child = 4 } rgba = <text_color> } 
	SetScreenElementProps { id = { <id> child = 5 } rgba = [ 128 128 128 0 ] } 
	SetScreenElementProps { id = { <id> child = 6 } rgba = [ 128 128 128 0 ] } 
ENDSCRIPT

SCRIPT create_gamma_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "GAMMA" 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back create_options_menu } ] 
		replace_handlers 
	} 
	GetGammaValues 
	FormatText TextName = red_text "%i" i = <red> 
	FormatText TextName = green_text "%i" i = <green> 
	FormatText TextName = blue_text "%i" i = <blue> 
	theme_menu_add_item text = "Red: " extra_text = <red_text> id = gamma_menu_red 
	theme_menu_add_item text = "Green: " extra_text = <green_text> id = gamma_menu_green 
	theme_menu_add_item text = "Blue: " extra_text = <blue_text> id = gamma_menu_blue 
	theme_menu_add_item text = "Done" id = gamma_menu_done pad_choose_script = create_options_menu last_menu_item = last_menu_item 
	SetScreenElementProps { 
		id = gamma_menu_red 
		event_handlers = [ { pad_left gamma_menu_turn_down params = { color = red } } 
			{ pad_right gamma_menu_turn_up params = { color = red } } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { 
		id = gamma_menu_green 
		event_handlers = [ { pad_left gamma_menu_turn_down params = { color = green } } 
			{ pad_right gamma_menu_turn_up params = { color = green } } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { 
		id = gamma_menu_blue 
		event_handlers = [ { pad_left gamma_menu_turn_down params = { color = blue } } 
			{ pad_right gamma_menu_turn_up params = { color = blue } } 
		] 
		replace_handlers 
	} 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bn=Back" } 
		] 
	} 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT gamma_menu_check_levels 
	GetGammaValues 
	FormatText TextName = red_text "%i" i = <red> 
	FormatText TextName = green_text "%i" i = <green> 
	FormatText TextName = blue_text "%i" i = <blue> 
	SetScreenElementLock id = gamma_menu_red off 
	SetScreenElementLock id = gamma_menu_green off 
	SetScreenElementLock id = gamma_menu_blue off 
	SetScreenElementProps { 
		id = { gamma_menu_red child = 3 } 
		text = <red_text> 
	} 
	SetScreenElementProps { 
		id = { gamma_menu_green child = 3 } 
		text = <green_text> 
	} 
	SetScreenElementProps { 
		id = { gamma_menu_blue child = 3 } 
		text = <blue_text> 
	} 
ENDSCRIPT

SCRIPT gamma_menu_turn_up 
	GetGammaValues 
	SWITCH <color> 
		CASE red 
			IF NOT ( <red> > 99 ) 
				PlaySound MenuUp 
			ENDIF 
		CASE blue 
			IF NOT ( <blue> > 99 ) 
				PlaySound MenuUp 
			ENDIF 
		CASE green 
			IF NOT ( <green> > 99 ) 
				PlaySound MenuUp 
			ENDIF 
	ENDSWITCH 
	ApplyChangeGamma <...> change = 0.00999999978 
	wait 1 frame 
	gamma_menu_check_levels 
ENDSCRIPT

SCRIPT gamma_menu_turn_down 
	GetGammaValues 
	SWITCH <color> 
		CASE red 
			IF NOT ( 1 > <red> ) 
				PlaySound MenuUp 
			ENDIF 
		CASE blue 
			IF NOT ( 1 > <blue> ) 
				PlaySound MenuUp 
			ENDIF 
		CASE green 
			IF NOT ( 1 > <green> ) 
				PlaySound MenuUp 
			ENDIF 
	ENDSWITCH 
	ApplyChangeGamma <...> change = -0.00999999978 
	wait 1 frame 
	gamma_menu_check_levels 
ENDSCRIPT

SCRIPT create_split_menu callback_script = create_options_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "SCREEN SETUP" right_bracket_alpha = 0.00000000000 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <callback_script> } } ] 
		replace_handlers 
	} 
	theme_menu_add_item text = "Horizontal" pad_choose_script = generic_menu_pad_choose centered = centered pad_choose_params = { <...> callback = split_setup_horizontal } 
	theme_menu_add_item text = "Vertical" last_menu_item = 1 centered = centered pad_choose_script = generic_menu_pad_choose pad_choose_params = { <...> callback = split_setup_vertical } 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_screen_menu callback_script = create_options_menu 
	make_new_themed_sub_menu title = "SCREEN" 
	IF LevelIs Load_MainMenu 
		callback_script = create_gamesettings_menu 
	ELSE 
		callback_script = create_options_menu 
	ENDIF 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <callback_script> } } ] 
		replace_handlers 
	} 
	IF IsPS2 
		SWITCH ( ingame_screen_mode ) 
			CASE standard_screen_mode 
				mode = "Standard" 
			CASE widescreen_screen_mode 
				mode = "Widescreen" 
			CASE letterbox_screen_mode 
				mode = "Letterbox" 
		ENDSWITCH 
		theme_menu_add_item text = "Display Setting:" extra_text = <mode> pad_choose_script = create_display_menu 
	ENDIF 
	IF isngc 
		theme_menu_add_item text = "Standard" extra_text = "4:3" pad_choose_script = change_screen_mode pad_choose_params = { standard callback = screen_setup_standard set_screen_flags } 
		theme_menu_add_item text = "Widescreen" extra_text = "16:9" pad_choose_script = change_screen_mode pad_choose_params = { wide callback = screen_setup_widescreen set_screen_flags } 
	ENDIF 
	IF NOT isTrue Bootstrap_build 
		theme_menu_add_item text = "Done" id = screen_menu_done pad_choose_script = <callback_script> last_menu_item = 1 
	ENDIF 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = screen_icon no_animate icon_scale = 1 icon_pos = PAIR(551.00000000000, 140.00000000000) 
	ENDIF 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_display_menu callback_script = create_screen_menu 
	make_new_themed_sub_menu title = "Display Setting" 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <callback_script> } } ] 
		replace_handlers 
	} 
	theme_menu_add_item text = "Standard" extra_text = "4:3" pad_choose_script = select_return_display_menu pad_choose_params = { standard } 
	theme_menu_add_item text = "Widescreen" extra_text = "16:9" pad_choose_script = select_return_display_menu pad_choose_params = { wide } 
	theme_menu_add_item text = "Letterbox" extra_text = "16:9" pad_choose_script = select_return_display_menu pad_choose_params = { letter } last_menu_item = 1 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = screen_icon no_animate icon_scale = 1 icon_pos = PAIR(551.00000000000, 140.00000000000) 
	ENDIF 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT theme_menu_add_flag_item_confirm callback = create_screen_menu 
	IF NOT GotParam flag 
		
		RETURN 
	ENDIF 
	IF NOT GotParam id 
		
		RETURN 
	ENDIF 
	IF GetGlobalFlag flag = <flag> 
		IF GotParam reverse 
			extra_text = "Off" 
			reverse = reverse 
		ELSE 
			extra_text = "On" 
		ENDIF 
	ELSE 
		IF GotParam reverse 
			extra_text = "On" 
			reverse = reverse 
		ELSE 
			extra_text = "Off" 
		ENDIF 
	ENDIF 
	theme_menu_add_item <...> pad_choose_script = theme_toggle_flag_confirm pad_choose_params = { flag = <flag> id = <id> reverse = <reverse> } 
ENDSCRIPT

SCRIPT theme_toggle_flag_confirm 
	IF NOT GetGlobalFlag flag = <flag> 
		IF ObjectExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		create_dialog_box { title = "Progressive Scan" 
			text = #"You are changing Progressive Scan mode to On. Your television must be capable of displaying a Progressive Scan signal. Do you wish to continue?" 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			box_animate 
			text_scale = 1 
			buttons = [ { font = small text = "Yes" pad_choose_script = yes_progressive_scan pad_choose_params = { flag = <flag> id = <id> reverse = <reverse> } } 
				{ font = small text = "No" pad_choose_script = no_progressive_scan } 
			] 
		} 
	ELSE 
		theme_toggle_flag flag = <flag> id = <id> reverse = <reverse> 
		SetProgressive on = 0 
	ENDIF 
ENDSCRIPT

SCRIPT confirm_no_progressive 
	UnsetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
	dialog_box_exit 
	SetProgressive on = 0 
	create_snazzy_dialog_box { title = "Progressive Scan" 
		text = "Interlaced video mode has been restored." 
		no_animate 
		buttons = [ { font = small text = "Continue" pad_choose_script = progressive_done pad_choose_params = { <...> } } 
		] 
	} 
ENDSCRIPT

SCRIPT no_progressive_scan 
	dialog_box_exit 
	create_screen_menu 
ENDSCRIPT

SCRIPT yes_progressive_scan 
	dialog_box_exit 
	IF GetGlobalFlag flag = <flag> 
		UnsetGlobalFlag flag = <flag> 
		SetProgressive on = 0 
	ELSE 
		SetGlobalFlag flag = <flag> 
		SetProgressive on = 1 
	ENDIF 
	<callback_script> = create_screen_menu 
	create_snazzy_dialog_box { title = "Progressive Scan" 
		text = "Progressive Scan (480p) video mode selected. Select YES if you would like to continue playing in Progressive Scan mode or NO to return to normal Interlaced video mode." 
		no_animate 
		buttons = [ { font = small text = "Yes" pad_choose_script = progressive_done pad_choose_params = { <...> } } 
			{ font = small text = "No" pad_choose_script = confirm_no_progressive pad_choose_params = { callback_script = <callback_script> } } 
		] 
	} 
	RunScriptOnScreenElement id = dialog_box_anchor progressive_timeout params = { <...> } 
ENDSCRIPT

SCRIPT onload_progressive_scan_check callback_script = create_options_menu 
	create_snazzy_dialog_box { title = "Progressive Scan" 
		text = "You had previously chosen to display the game in Progressive Scan mode. Your television must be capable of displaying a Progressive Scan signal. Do you want to display the game in Progressive Scan mode again?" 
		no_animate 
		buttons = [ { font = small text = "Yes" pad_choose_script = set_progressive_mode_onload pad_choose_params = { callback_script = <callback_script> } } 
			{ font = small text = "No" pad_choose_script = unset_progressive_mode_onload pad_choose_params = { callback_script = <callback_script> } } 
		] 
	} 
ENDSCRIPT

SCRIPT progressive_timeout 
	wait 10 seconds 
	UnsetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
	SetProgressive on = 0 
	dialog_box_exit 
	create_snazzy_dialog_box { title = "Progressive Scan" 
		text = "Interlaced video mode has been restored." 
		no_animate 
		buttons = [ { font = small text = "Continue" pad_choose_script = progressive_done pad_choose_params = { <...> } } 
		] 
	} 
ENDSCRIPT

SCRIPT set_progressive_mode_onload 
	SetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
	dialog_box_exit 
	SetProgressive on = 1 
	create_snazzy_dialog_box { title = "Progressive Scan" 
		text = "Progressive Scan (480p) video mode selected. Select YES if you would like to continue playing in Progressive Scan mode or NO to return to normal Interlaced video mode." 
		no_animate 
		buttons = [ { font = small text = "Yes" pad_choose_script = progressive_done pad_choose_params = { <...> } } 
			{ font = small text = "No" pad_choose_script = confirm_no_progressive pad_choose_params = { callback_script = <callback_script> } } 
		] 
	} 
	RunScriptOnScreenElement id = dialog_box_anchor progressive_timeout params = { <...> } 
ENDSCRIPT

SCRIPT progressive_done 
	dialog_box_exit 
	<callback_script> <...> 
ENDSCRIPT

SCRIPT unset_progressive_mode_onload 
	UnsetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
	dialog_box_exit 
	SetProgressive on = 0 
	<callback_script> <...> 
ENDSCRIPT

SCRIPT select_return_display_menu 
	IF GotParam standard 
		change_screen_mode standard callback = screen_setup_standard set_screen_flags 
	ENDIF 
	IF GotParam wide 
		change_screen_mode wide callback = screen_setup_widescreen set_screen_flags 
	ENDIF 
	IF GotParam letter 
		change_screen_mode letter callback = screen_setup_letterbox set_screen_flags 
	ENDIF 
	create_screen_menu 
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
	ELSE 
		<callback> <...> 
		change ingame_screen_mode = ( current_screen_mode ) 
	ENDIF 
ENDSCRIPT

SCRIPT build_screen_menu_graphic logo_scale = PAIR(1.00000000000, 1.00000000000) alpha = 0 tv_scale = PAIR(1.00000000000, 0.80000001192) 
	
ENDSCRIPT

SCRIPT morph_tv_scan_line scale = PAIR(21.00000000000, 0.25000000000) scale2 = PAIR(22.79999923706, 0.25000000000) pos = PAIR(28.00000000000, -55.00000000000) pos2 = PAIR(-6.00000000000, 38.00000000000) 
	
ENDSCRIPT

SCRIPT tv_logo_twitch id = tv_thug_logo time = 0.75000000000 
	
ENDSCRIPT

SCRIPT split_setup_horizontal 
	
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
	IF ( <ui_string> = "Off" ) 
		text = "On" 
		SetPreferencesFromUI prefs = network field = "auto_brake" checksum = boolean_true string = "On" 
		SetScreenElementProps id = { <id> child = 0 } text = "AUTO-BRAKE: On" 
	ELSE 
		text = "Off" 
		SetPreferencesFromUI prefs = network field = "auto_brake" checksum = boolean_false string = "Off" 
		SetScreenElementProps id = { <id> child = 0 } text = "AUTO-BRAKE: Off" 
	ENDIF 
ENDSCRIPT


