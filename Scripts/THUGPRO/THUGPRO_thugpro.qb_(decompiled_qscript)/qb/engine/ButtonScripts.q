
exit_pause_menu_ready = 0 
select_shift = 0 
memcard_screenshots = 0 
skater_cam_0_mode = 2 
skater_cam_1_mode = 2 
thugpro_userselect_action = thugpro_userselect_case_camera_toggle 
disable_user_button_scripts = 0 
SCRIPT UserSelectSelect 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	IF IsTrue __ANIM_IS_PLAYING 
		RETURN 
	ENDIF 
	IF NOT IsTrue exit_pause_menu_ready 
		RETURN 
	ENDIF 
	IF LevelIs Load_Sk5Ed 
		IF CustomParkMode editing 
			IF ( ( thugpro_userselect_action ) = thugpro_userselect_case_viewer ) 
				UserSelectX 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF LevelIs load_mainmenu 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = root_window 
		IF root_window : GetSingleTag menu_state 
			IF ( <menu_state> = on ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	KillSpawnedScript Name = quick_menu_input_checker 
	SpawnScript quick_menu_input_checker 
ENDSCRIPT

SCRIPT quick_menu_input_checker 
	<SHOW_QUICK_MENU> = 0 
	<BUTTON_HELD_FRAMES> = 0 
	BEGIN 
		IF IsObserving 
			BREAK 
		ENDIF 
		IF ( <BUTTON_HELD_FRAMES> > 12 ) 
			<SHOW_QUICK_MENU> = 1 
			BREAK 
		ENDIF 
		Wait 1 gameframes 
		IF THUGPRO_GetButtonPressed SELECT 
			<BUTTON_HELD_FRAMES> = ( 1 + <BUTTON_HELD_FRAMES> ) 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 60 
	IF NOT IsTrue exit_pause_menu_ready 
		RETURN 
	ENDIF 
	IF ( <SHOW_QUICK_MENU> = 1 ) 
		thugpro_show_quick_menu 
	ELSE 
		IF ( ( thugpro_userselect_action ) = thugpro_userselect_case_viewer ) 
			UserSelectX 
		ELSE 
			thugpro_camera_toggle 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_show_quick_menu 
	IF NOT IsObserving 
		GetSkaterId 
		<objId> : NetDisablePlayerInput 
	ENDIF 
	GoalManager_HidePoints 
	thugpro_menu_create { 
		menu_name = quick 
		menu_title = "Quick Menu" 
		menu_style = MENU_STYLE_MIDDLE 
		pad_back_script = thugpro_hide_quick_menu 
		pad_back_params = { } 
		boxed 
	} 
	kill_start_key_binding 
	IF NOT ( ( GameModeEquals is_lobby ) | ( GameModeEquals is_singlesession ) ) 
		not_focusable_in_game = not_focusable 
	ENDIF 
	IF ( ( last_loaded_custom_level_script ) = nullscript ) 
		not_focusable_reload_level = not_focusable 
	ENDIF 
	GetValueFromVolume cdvol 
	IF ( <value> > 0 ) 
		make_thugpro_menu_item { 
			text = "Skip track" 
			id = quick_menu_skip_track 
			pad_choose_script = skip_track 
		} 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Set Restart" 
		id = quick_menu_set_restart 
		not_focusable = <not_focusable_in_game> 
		pad_choose_script = quick_menu_restart 
		pad_choose_params = { Set } 
	} 
	IF NOT IsObserving 
		IF Skater : SetCustomRestart 
			make_thugpro_menu_item { 
				text = "Goto Restart" 
				id = quick_menu_goto_restart 
				not_focusable = <not_focusable_in_game> 
				pad_choose_script = quick_menu_restart 
				pad_choose_params = { goto } 
			} 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Level Restarts" 
		id = quick_menu_level_restarts 
		not_focusable = <not_focusable_in_game> 
		pad_choose_script = launch_quick_menu_restart_menu 
	} 
	make_thugpro_menu_item { 
		text = "Hide HUD" 
		id = quick_menu_hide_hud 
		not_focusable = <not_focusable_in_game> 
		pad_choose_script = launch_quick_menu_hide_hud 
	} 
	IF InNetGame 
		make_thugpro_menu_item { 
			text = "On-Screen Keyboard" 
			id = quick_menu_keyboard 
			pad_choose_script = launch_quick_menu_keyboard 
		} 
	ENDIF 
	IF NOT InNetGame 
		make_thugpro_menu_item { 
			text = "Reload Level" 
			id = quick_menu_keyboard 
			not_focusable = <not_focusable_reload_level> 
			pad_choose_script = launch_quick_menu_reload_level 
		} 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT quick_menu_add_item 
ENDSCRIPT

SCRIPT quick_menu_restart 
	IF GotParam Set 
		global_cmd_set 
	ELSE 
		IF GotParam goto 
			global_cmd_goto 
		ENDIF 
	ENDIF 
	thugpro_hide_quick_menu 
ENDSCRIPT

SCRIPT thugpro_hide_quick_menu 
	IF NOT IsObserving 
		GetSkaterId 
		<objId> : NetEnablePlayerInput 
	ENDIF 
	IF ScreenElementExists id = current_menu 
		FireEvent type = unfocus target = current_menu 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		FireEvent type = unfocus target = current_menu_anchor 
	ENDIF 
	DoScreenElementMorph { 
		id = current_menu_anchor 
		alpha = 0.00000000000 
		time = 0.10000000149 
	} 
	Wait 0.10000000149 seconds 
	thugpro_menu_destroy 
	SetScreenElementProps id = root_window tags = { menu_state = off } 
	GoalManager_ShowPoints 
	restore_start_key_binding 
ENDSCRIPT

SCRIPT launch_quick_menu_restart_menu 
	kill_start_key_binding 
	create_restart_menu from_quick_menu 
ENDSCRIPT

SCRIPT launch_quick_menu_hide_hud 
	exit_quick_menu 
	hide_all_hud_items 
ENDSCRIPT

SCRIPT launch_quick_menu_screenshot 
	thugpro_hide_quick_menu 
	Wait 1 second 
	RequestScreenShot 
	playsound HUD_jumpgap 
ENDSCRIPT

should_reload_custom_last_level = 0 
SCRIPT launch_quick_menu_reload_level 
	exit_quick_menu 
	Change should_reload_custom_last_level = 1 
	level_select_change_level level = load_SkProDefault 
ENDSCRIPT

SCRIPT exit_quick_menu 
	exit_pause_menu 
	IF NOT IsObserving 
		GetSkaterId 
		<objId> : NetEnablePlayerInput 
	ENDIF 
ENDSCRIPT

music_control_sub_menu_items = 2 
SCRIPT music_control_focus_item 
	music_control_container : SetTags music_control_item_index = <index> 
	<i> = 0 
	BEGIN 
		FireEvent type = music_item_unfocus target = { music_control_container child = <i> } 
		<i> = ( 1 + <i> ) 
	REPEAT ( music_control_sub_menu_items ) 
	FireEvent type = music_item_focus target = { music_control_container child = <index> } 
ENDSCRIPT

SCRIPT music_control_item_focus 
	music_control_container : GetSingleTag music_control_item_index 
	music_control_focus_item index = <music_control_item_index> 
ENDSCRIPT

SCRIPT music_control_item_pad_choose 
	music_control_container : GetSingleTag music_control_item_index 
	FireEvent type = music_item_choose target = { music_control_container child = <music_control_item_index> } 
ENDSCRIPT

SCRIPT music_control_item_pad_left 
	music_control_container : GetSingleTag music_control_item_index 
	index_previous_wraparound index = <music_control_item_index> max = ( music_control_sub_menu_items ) 
	music_control_focus_item index = <index> 
ENDSCRIPT

SCRIPT music_control_item_pad_right 
	music_control_container : GetSingleTag music_control_item_index 
	index_next_wraparound index = <music_control_item_index> max = ( music_control_sub_menu_items ) 
	music_control_focus_item index = <index> 
ENDSCRIPT

SCRIPT music_control_button_item_focus 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = item_background } 
		alpha = 0.50000000000 
		time = 0.00000000000 
	} 
ENDSCRIPT

SCRIPT music_control_button_item_unfocus 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = item_background } 
		alpha = 0.00000000000 
		time = 0.00000000000 
	} 
ENDSCRIPT

SCRIPT music_control_toggle_pause 
	IF MusicIsPaused 
		PauseMusic 0 
		DoScreenElementMorph { 
			id = { <id> child = play_button } 
			alpha = 0.00000000000 
			time = 0.00000000000 
		} 
		DoScreenElementMorph { 
			id = { <id> child = pause_button } 
			alpha = 1.00000000000 
			time = 0.00000000000 
		} 
	ELSE 
		PauseMusic 1 
		DoScreenElementMorph { 
			id = { <id> child = play_button } 
			alpha = 1.00000000000 
			time = 0.00000000000 
		} 
		DoScreenElementMorph { 
			id = { <id> child = pause_button } 
			alpha = 0.00000000000 
			time = 0.00000000000 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT music_control_action_pause 
	GetTags 
	music_control_toggle_pause id = <id> 
ENDSCRIPT

SCRIPT music_control_action_skip 
	IF MusicIsPaused 
		music_control_toggle_pause id = play_pause_button_container 
	ENDIF 
	SkipMusicTrack 
ENDSCRIPT

SCRIPT music_control_action_trackinfo 
	edmsg2 "music_control_action_trackinfo" 
ENDSCRIPT

SCRIPT add_quick_menu_music_control_item 
	GetValueFromVolume cdvol 
	IF ( <value> = 0 ) 
		<not_focusable> = not_focusable 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		id = music_control_container 
		parent = current_menu 
		dims = PAIR(100.00000000000, 22.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		<not_focusable> 
	} 
	SetScreenElementProps { 
		id = music_control_container 
		event_handlers = [ 
			{ focus music_control_item_focus params = { } } 
			{ pad_choose music_control_item_pad_choose params = { } } 
			{ pad_left music_control_item_pad_left params = { } } 
			{ pad_right music_control_item_pad_right params = { } } 
		] 
	} 
	music_control_container : SetTags music_control_item_index = 0 
	<item_offset> = PAIR(6.00000000000, -0.50000000000) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = music_control_container 
		id = play_pause_button_container 
		dims = PAIR(10.00000000000, 10.00000000000) 
		pos = ( PAIR(0.00000000000, 0.00000000000) + <item_offset> ) 
		just = [ left top ] 
		internal_just = [ left top ] 
		event_handlers = [ 
			{ music_item_choose music_control_action_pause params = { } } 
			{ music_item_focus music_control_button_item_focus params = { } } 
			{ music_item_unfocus music_control_button_item_unfocus params = { } } 
		] 
	} 
	IF MusicIsPaused 
		<pause_button_alpha> = 0.00000000000 
		<play_button_alpha> = 1.00000000000 
	ELSE 
		<pause_button_alpha> = 1.00000000000 
		<play_button_alpha> = 0.00000000000 
	ENDIF 
	IF ( <value> = 0 ) 
		<pause_button_alpha> = 0.00000000000 
		<play_button_alpha> = 1.00000000000 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = play_pause_button_container 
		local_id = pause_button 
		dims = PAIR(0.00000000000, 0.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		alpha = <pause_button_alpha> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = { play_pause_button_container child = pause_button } 
		id = buttonsprite1 
		texture = white 
		scale = PAIR(0.50000000000, 2.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = { play_pause_button_container child = pause_button } 
		id = buttonsprite2 
		texture = white 
		scale = PAIR(0.50000000000, 2.00000000000) 
		pos = PAIR(4.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = play_pause_button_container 
		local_id = play_button 
		dims = PAIR(0.00000000000, 0.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		alpha = <play_button_alpha> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = { play_pause_button_container child = play_button } 
		id = buttonsprite3 
		texture = right_arrow 
		scale = PAIR(0.40000000596, 0.40000000596) 
		pos = PAIR(2.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = play_pause_button_container 
		local_id = item_background 
		texture = white 
		scale = PAIR(4.00000000000, 4.00000000000) 
		pos = PAIR(2.00000000000, 0.00000000000) 
		alpha = 0.00000000000 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = music_control_container 
		id = next_button_container 
		dims = PAIR(10.00000000000, 10.00000000000) 
		pos = ( PAIR(18.50000000000, 0.00000000000) + <item_offset> ) 
		just = [ left top ] 
		internal_just = [ left top ] 
		event_handlers = [ 
			{ music_item_choose music_control_action_skip params = { } } 
			{ music_item_focus music_control_button_item_focus params = { } } 
			{ music_item_unfocus music_control_button_item_unfocus params = { } } 
		] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = next_button_container 
		id = buttonsprite6 
		texture = white 
		scale = PAIR(0.40000000596, 2.00000000000) 
		pos = PAIR(3.50000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = next_button_container 
		id = buttonsprite7 
		texture = right_arrow 
		scale = PAIR(0.40000000596, 0.40000000596) 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = next_button_container 
		local_id = item_background 
		texture = white 
		scale = PAIR(4.00000000000, 4.00000000000) 
		pos = PAIR(1.00000000000, 0.00000000000) 
		alpha = 0.00000000000 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
ENDSCRIPT

SCRIPT launch_quick_menu_keyboard 
	thugpro_menu_destroy 
	kill_start_key_binding 
	create_onscreen_keyboard { 
		text_block 
		allow_cancel 
		keyboard_cancel_script = quick_menu_cancel_chat 
		keyboard_done_script = quick_menu_entered_chat_message 
		keyboard_title = "ENTER MESSAGE" 
		min_length = 0 
		max_length = 75 
		text = "" 
	} 
ENDSCRIPT

SCRIPT quick_menu_cancel_chat 
	cancel_chat_menu 
	exit_quick_menu 
ENDSCRIPT

SCRIPT quick_menu_entered_chat_message 
	entered_chat_message 
	exit_quick_menu 
ENDSCRIPT

SCRIPT thugpro_camera_toggle 
	IF ObjectExists id = skatercam0 
		SWITCH skater_cam_0_mode 
			CASE 1 
				Change skater_cam_0_mode = 2 
			CASE 2 
				Change skater_cam_0_mode = 3 
			CASE 3 
				Change skater_cam_0_mode = 4 
			CASE 4 
				Change skater_cam_0_mode = 1 
		ENDSWITCH 
		skatercam0 : sc_setmode mode = skater_cam_0_mode 
		thugpro_save_key_value Key = "camera_angle" value = ( skater_cam_0_mode ) 
	ENDIF 
ENDSCRIPT

view_mode = 0 
render_mode = 0 
wireframe_mode = 0 
drop_in_car = 0 
drop_in_car_setup = MiniBajaCarSetup 
SCRIPT UserSelectTriangle 
ENDSCRIPT

SCRIPT UserSelectSquare 
ENDSCRIPT

SCRIPT UserSelectCircle 
	IF ( ( IsTrue disable_user_button_scripts ) | ( InNetGame ) ) 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT UserSelectStart 
ENDSCRIPT

SCRIPT THUGPROResetViewer 
	IF IsTrue view_mode 
		IF GotParam unfreeze 
			IF NOT InNetGame 
				ToggleViewMode 
				RETURN 
			ENDIF 
		ENDIF 
		Change view_mode = 0 
		SetViewMode 0 
	ENDIF 
	IF GotParam force_reset 
		Change view_mode = 0 
		SetViewMode 0 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPROResetViewer_Dev 
ENDSCRIPT

PARKED_NO_VIEWERCAM = 0 
SCRIPT ToggleViewMode 
	<can_use_viewer> = 1 
	IF InNetGame 
		IF IsObserving 
			<can_use_viewer> = 1 
		ELSE 
			IF NOT IsTrue THUGPRO_ObserveOn 
				<can_use_viewer> = 0 
				IF IsSurveying 
					<can_use_viewer> = 1 
				ENDIF 
			ENDIF 
			IF Skater : Skating 
				IF NOT Skater : OnGround 
					<can_use_viewer> = 0 
				ENDIF 
			ELSE 
				IF Skater : Walking 
					IF Skater : Walk_Air 
						<can_use_viewer> = 0 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		<can_use_viewer> = 0 
	ENDIF 
	IF ScreenElementExists id = cat_menu_anchor 
		<can_use_viewer> = 0 
	ENDIF 
	IF ScreenElementExists id = dialog_box_anchor 
		<can_use_viewer> = 0 
	ENDIF 
	IF LevelIs Load_Sk5Ed 
		<can_use_viewer> = 1 
		IF IsTrue PARKED_NO_VIEWERCAM 
			<can_use_viewer> = 0 
		ENDIF 
	ENDIF 
	IF LevelIs load_mainmenu 
		<can_use_viewer> = 0 
	ENDIF 
	IF IsTrue view_mode 
		Change view_mode = 0 
		SetViewMode 0 
		IF CustomParkMode editing 
			IF IsTrue RAILTOOL_IS_ACTIVE 
				RailEditor : UnSuspend 
				SetActiveCamera id = RailEditor 
			ELSE 
				SetActiveCamera id = parked_cam 
			ENDIF 
			SetParkEditorPauseMode UnPause 
		ELSE 
			IF NOT IsObserving 
				GoalManager_ShowPoints 
				unpause_trick_text 
			ENDIF 
			IF InNetGame 
			ELSE 
				UnPauseSkaters 
				MakeSkaterGoto THUGPRO_EnablePlayerInput 
				IF Skater : Walking 
					ResetPhysics Walk 
				ELSE 
					ResetPhysics 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF IsTrue observe_overview_cam_state 
			<can_use_viewer> = 0 
		ENDIF 
		IF ( <can_use_viewer> = 1 ) 
			Change view_mode = 1 
			SetViewMode 1 
			IF CustomParkMode editing 
				RailEditor : Suspend 
				SetParkEditorPauseMode Pause 
			ELSE 
				IF NOT IsObserving 
					GoalManager_HidePoints 
					pause_trick_text 
				ENDIF 
				IF NOT InNetGame 
					PauseSkaters 
					MakeSkaterGoto THUGPRO_DisablePlayerInput 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT UserSelectX 
	IF IsTrue disable_user_button_scripts 
		RETURN 
	ENDIF 
	Change viewer_rotation_angle = 0 
	IF InNetGame 
		IF IsTrue THUGPRO_ObserveOn 
			IF SkaterSpeedGreaterThan 1 
				RETURN 
			ENDIF 
			ToggleViewMode 
		ELSE 
			IF IsObserving 
				ToggleViewMode 
			ELSE 
				IF IsSurveying 
					IF SkaterSpeedGreaterThan 1 
						RETURN 
					ENDIF 
					ToggleViewMode 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		ToggleViewMode 
	ENDIF 
ENDSCRIPT

viewer_rotation_angle = 0 
SCRIPT UserViewerX 
	IF IsTrue disable_user_button_scripts 
		RETURN 
	ENDIF 
	IF NOT InNetGame 
		Skater : PlaceBeforeCamera 
		THUGPROResetViewer unfreeze 
	ENDIF 
ENDSCRIPT

SCRIPT UserViewerSquare 
	IF IsTrue disable_user_button_scripts 
		RETURN 
	ENDIF 
ENDSCRIPT

Viewer_move_mode = 0 
SCRIPT UserViewerCircle 
	IF IsTrue disable_user_button_scripts 
		RETURN 
	ENDIF 
	Change viewer_rotation_angle = 0 
	SWITCH Viewer_move_mode 
		CASE 0 
			Change Viewer_move_mode = 1 
			SetMovementVelocity 400 
			SetRotateVelocity 120 
			create_panel_message { 
				id = viewermovemode 
				text = "Camera Speed: 2" 
				font_face = aventra 
				pos = PAIR(320.00000000000, 30.00000000000) 
				scale = 0.25000000000 
			} 
		CASE 1 
			Change Viewer_move_mode = 2 
			SetMovementVelocity 2000 
			SetRotateVelocity 300 
			create_panel_message { 
				id = viewermovemode 
				text = "Camera Speed: 3" 
				font_face = aventra 
				pos = PAIR(320.00000000000, 30.00000000000) 
				scale = 0.25000000000 
			} 
		CASE 2 
			Change Viewer_move_mode = 3 
			SetMovementVelocity 6000 
			SetRotateVelocity 300 
			create_panel_message { 
				id = viewermovemode 
				text = "Camera Speed: 4" 
				font_face = aventra 
				pos = PAIR(320.00000000000, 30.00000000000) 
				scale = 0.25000000000 
			} 
		CASE 3 
			Change Viewer_move_mode = 0 
			SetMovementVelocity 100 
			SetRotateVelocity 50 
			create_panel_message { 
				id = viewermovemode 
				text = "Camera Speed: 1" 
				font_face = aventra 
				pos = PAIR(320.00000000000, 30.00000000000) 
				scale = 0.25000000000 
			} 
	ENDSWITCH 
ENDSCRIPT

SCRIPT UserViewerTriangle 
	IF IsTrue disable_user_button_scripts 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT show_wireframe_mode 
ENDSCRIPT

SCRIPT wireframe_message 
ENDSCRIPT

SCRIPT wireframe_style 
ENDSCRIPT


