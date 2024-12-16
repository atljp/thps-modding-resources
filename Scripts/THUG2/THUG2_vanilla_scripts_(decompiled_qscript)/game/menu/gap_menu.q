
SCRIPT launch_gap_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_gap_menu <...> 
ENDSCRIPT

SCRIPT create_gap_menu back_script = gap_menu_exit_to_pause_menu choose_script = nullscript 
	menu3d_hide 
	SetMusicVolume MusicVolOutsideBox 
	PauseMusic 0 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	hide_current_goal 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = gap_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = gap_anchor alias = current_menu_anchor 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
		] 
	} 
	kill_start_key_binding 
	build_theme_sub_title title = "GAP CHECKLIST" 
	CreateScreenElement { 
		type = ContainerElement 
		parent = gap_anchor 
		id = gap_menu 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = gap_menu alias = current_menu_anchor 
	theme_background width = 6.34999990463 pos = PAIR(320.00000000000, 85.00000000000) num_parts = 10.50000000000 
	<root_pos> = PAIR(80.00000000000, 25.00000000000) 
	Theme_GetHighlightedTextColor return_value = text_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = view_gaps_menu_top_bar 
		texture = black 
		rgba = [ 0 0 0 85 ] 
		scale = PAIR(130.00000000000, 7.00000000000) 
		pos = PAIR(65.00000000000, 87.00000000000) 
		just = [ left top ] 
		z_priority = 2 
	} 
	GetStackedScreenElementPos Y id = <id> offset = PAIR(6.00000000000, -25.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = current_menu_anchor 
		font = dialog 
		text = "Score" 
		rgba = <text_rgba> 
		scale = 1 
		pos = <pos> 
		just = [ left top ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(15.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = current_menu_anchor 
		font = dialog 
		text = "Name" 
		rgba = <text_rgba> 
		pos = <pos> 
		just = [ left top ] 
		scale = 1 
		z_priority = 3 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(115.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = view_gaps_menu_up_arrow 
		texture = up_arrow 
		rgba = [ 128 128 128 85 ] 
		pos = <pos> 
		just = [ left top ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(168.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = current_menu_anchor 
		font = dialog 
		text = "Times" 
		rgba = <text_rgba> 
		pos = <pos> 
		just = [ left top ] 
		scale = 1 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = view_gaps_menu_top_bar offset = PAIR(60.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = black 
		scale = PAIR(2.00000000000, 68.00000000000) 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 0 0 0 0 ] 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(355.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = black 
		scale = PAIR(2.00000000000, 68.00000000000) 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 0 0 0 0 ] 
	} 
	GetStackedScreenElementPos Y id = view_gaps_menu_top_bar offset = PAIR(0.00000000000, 250.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = black 
		rgba = [ 0 0 0 0 ] 
		scale = PAIR(124.00000000000, 6.00000000000) 
		pos = <pos> 
		just = [ left top ] 
		z_priority = 2 
	} 
	GetStackedScreenElementPos Y id = view_gaps_menu_up_arrow offset = PAIR(0.00000000000, 260.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = view_gaps_menu_down_arrow 
		texture = down_arrow 
		rgba = [ 128 128 128 85 ] 
		pos = <pos> 
		just = [ left top ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = view_gaps_menu_top_bar offset = PAIR(20.00000000000, 5.00000000000) 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = current_menu_anchor 
		dims = PAIR(640.00000000000, 245.00000000000) 
		pos = <pos> 
		just = [ left top ] 
		internal_just = [ center top ] 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = <id> 
		id = gap_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		dont_allow_wrap 
		event_handlers = [ 
			{ pad_up set_which_arrow params = { arrow = view_gaps_menu_up_arrow } } 
			{ pad_down set_which_arrow params = { arrow = view_gaps_menu_down_arrow } } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
	} 
	AssignAlias id = gap_vmenu alias = current_menu 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <back_script> } } ] 
	} 
	AddGapsToMenu initial_scale = 0.80000001192 choose_script = <choose_script> 
	generic_menu_animate_in force pos = PAIR(320.00000000000, 240.00000000000) 
	FireEvent type = focus target = current_menu 
ENDSCRIPT

SCRIPT gap_menu_add_item choose_script = nullscript 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	Theme_GetUnhighlightedTextColor return_value = text_rgba2 
	IF GotParam first_item 
		focus_params = { first_item } 
	ELSE 
		IF GotParam last_item 
			focus_params = { last_item } 
		ENDIF 
	ENDIF 
	IF IsNGC 
		heap = topdown 
	ELSE 
		heap = frontend 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		dims = PAIR(200.00000000000, 20.00000000000) 
		event_handlers = [ { focus gap_menu_focus params = { <focus_params> times = <times> } } 
			{ unfocus gap_menu_unfocus params = { times = <times> } } 
			{ focus gap_menu_focus_show_gap params = <...> } 
			{ pad_choose <choose_script> params = { gap_number = <gap_number> times = <times> } } 
		] 
		heap = <heap> 
	} 
	<anchor_id> = <id> 
	IF ( <times> > 0 ) 
		rgba = <text_rgba> 
		alpha = 1.00000000000 
	ELSE 
		rgba = <text_rgba> 
		alpha = 0.40000000596 
	ENDIF 
	FormatText TextName = gap_score "%i" i = <gap_score> 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = small 
		text = <gap_score> 
		pos = PAIR(13.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <rgba> 
		alpha = <alpha> 
		scale = 0.80000001192 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = small 
		text = <gap_name> 
		pos = PAIR(55.00000000000, 0.00000000000) 
		just = [ left top ] 
		rgba = <rgba> 
		alpha = <alpha> 
		scale = 0.80000001192 
		heap = <heap> 
	} 
	IF ( <times> > 99999 ) 
		<times> = 99999 
	ENDIF 
	FormatText TextName = times "%i" i = <times> 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = small 
		text = <times> 
		pos = PAIR(444.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <rgba> 
		alpha = <alpha> 
		scale = 0.80000001192 
		heap = <heap> 
	} 
	highlight_angle = 0 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = de_highlight_bar 
		pos = PAIR(232.00000000000, 10.00000000000) 
		just = [ center center ] 
		rgba = [ 0 0 0 0 ] 
		z_priority = 3 
		scale = PAIR(4.09999990463, 0.69999998808) 
		rot_angle = ( <highlight_angle> / 4 ) 
		heap = <heap> 
	} 
ENDSCRIPT

SCRIPT gap_menu_focus_show_gap 
	IF ( <times> > 0 ) 
		IF NOT ObjectExists id = menu_cam 
			create_menu_camera 
		ENDIF 
		menu_cam : UnPause 
		menu_cam : Obj_SetPosition position = ( <skater_start_pos> + VECTOR(0.00000000000, 80.00000000000, 0.00000000000) ) 
		dir_x = ( <skater_start_dir> . VECTOR(-1.00000000000, 0.00000000000, 0.00000000000) ) 
		dir_y = 0.10000000149 
		dir_z = ( <skater_start_dir> . VECTOR(0.00000000000, 0.00000000000, -1.00000000000) ) 
		dir = ( <dir_x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <dir_y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <dir_z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
		menu_cam : Obj_SetOrientation dir = <dir> 
		SetActiveCamera id = menu_cam 
	ELSE 
		restore_skater_camera 
	ENDIF 
ENDSCRIPT

SCRIPT gap_menu_focus 
	GetTags 
	Theme_GetHighlightedTextColor return_value = text_rgba 
	IF ( <times> > 0 ) 
		rgba = <text_rgba> 
	ELSE 
		rgba = <text_rgba> 
	ENDIF 
	RunScriptOnScreenElement id = { <id> child = 0 } text_twitch_effect2 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <rgba> 
		scale = 1.00000000000 
	} 
	RunScriptOnScreenElement id = { <id> child = 1 } text_twitch_effect2 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		rgba = <rgba> 
		scale = 1.00000000000 
	} 
	RunScriptOnScreenElement id = { <id> child = 2 } text_twitch_effect2 
	DoScreenElementMorph { 
		id = { <id> child = 2 } 
		rgba = <rgba> 
		scale = 1.00000000000 
	} 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	SetScreenElementProps { 
		id = { <id> child = 3 } 
		rgba = <bar_rgba> 
	} 
	IF GotParam first_item 
		SetScreenElementProps { 
			id = view_gaps_menu_up_arrow 
			rgba = [ 128 128 128 0 ] 
		} 
	ELSE 
		SetScreenElementProps { 
			id = view_gaps_menu_up_arrow 
			rgba = [ 128 128 128 85 ] 
		} 
	ENDIF 
	IF GotParam last_item 
		SetScreenElementProps { 
			id = view_gaps_menu_down_arrow 
			rgba = [ 128 128 128 0 ] 
		} 
	ELSE 
		SetScreenElementProps { 
			id = view_gaps_menu_down_arrow 
			rgba = [ 128 128 128 85 ] 
		} 
	ENDIF 
	gap_vmenu : GetTags 
	IF GotParam arrow_id 
		menu_vert_blink_arrow { id = <arrow_id> } 
	ENDIF 
ENDSCRIPT

SCRIPT gap_menu_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	KillSpawnedScript name = text_twitch_effect2 
	IF ( <times> > 0 ) 
		rgba = <text_rgba> 
	ELSE 
		rgba = <text_rgba> 
	ENDIF 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <rgba> 
		scale = 0.80000001192 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		rgba = <rgba> 
		scale = 0.80000001192 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 2 } 
		rgba = <rgba> 
		scale = 0.80000001192 
	} 
	SetScreenElementProps { 
		id = { <id> child = 3 } 
		rgba = [ 0 0 0 0 ] 
	} 
ENDSCRIPT

SCRIPT gap_menu_exit_to_pause_menu 
	IF ( FadeTempMusicVol < 0 ) 
		change FadeTempMusicVol = 0 
	ENDIF 
	IF ( FadeTempMusicVol > 100 ) 
		change FadeTempMusicVol = 100 
	ENDIF 
	SetMusicVolume FadeTempMusicVol 
	PauseMusic 1 
	root_window : SetTags need_music_zone_refresh 
	GoalManager_ShowPoints 
	IF NOT GoalManager_HasActiveGoals 
		GoalManager_ShowGoalPoints 
	ENDIF 
	restore_skater_camera 
	restore_start_key_binding 
	AssignAlias id = gap_anchor alias = current_menu_anchor 
	IF CustomParkMode testing 
		create_pause_menu 
	ELSE 
		create_your_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT got_gap_for_first_time 
	IF InMultiplayerGame 
		RETURN 
	ENDIF 
	printf <gap_text> 
	IF GotParam multiple_new_gaps 
		FormatText TextName = text "Found Gaps:" 
		SetScreenElementProps id = first_time_goal_info_title text = <text> 
		IF ( <multiple_new_gaps> < 9 ) 
			CreateScreenElement { 
				type = TextElement 
				parent = first_time_goal_info 
				font = small 
				text = <gap_text> 
				pos = ( PAIR(0.00000000000, 20.00000000000) * <multiple_new_gaps> ) 
				just = [ left top ] 
				line_spacing = 0.80000001192 
				rgba = [ 20 98 114 108 ] 
				shadow 
				shadow_rgba = UI_text_shadow_color 
				shadow_offs = UI_text_shadow_offset 
				allow_expansion 
				z_priority = -5 
			} 
		ELSE 
			IF ( <multiple_new_gaps> = 9 ) 
				CreateScreenElement { 
					type = TextElement 
					parent = first_time_goal_info 
					font = small 
					text = "..." 
					pos = ( PAIR(0.00000000000, 20.00000000000) * <multiple_new_gaps> ) 
					just = [ left top ] 
					line_spacing = 0.80000001192 
					rgba = [ 20 98 114 108 ] 
					shadow 
					shadow_rgba = UI_text_shadow_color 
					shadow_offs = UI_text_shadow_offset 
					allow_expansion 
					z_priority = -5 
				} 
			ENDIF 
		ENDIF 
	ELSE 
		SetScreenElementLock id = root_window off 
		IF ObjectExists id = first_time_goal_info 
			DestroyScreenElement id = first_time_goal_info 
		ELSE 
			SpawnSound found_gap_success_sound 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = first_time_goal_info 
			pos = PAIR(25.00000000000, 90.00000000000) 
			just = [ left top ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = first_time_goal_info 
			id = first_time_goal_info_title 
			font = small 
			text = "FOUND GAPS:" 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ left top ] 
			line_spacing = 0.80000001192 
			rgba = [ 20 98 114 108 ] 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
			allow_expansion 
			z_priority = -5 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = first_time_goal_info 
			font = small 
			text = <gap_text> 
			pos = PAIR(0.00000000000, 20.00000000000) 
			just = [ left top ] 
			line_spacing = 0.80000001192 
			rgba = [ 20 98 114 108 ] 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
			allow_expansion 
			z_priority = -5 
		} 
		RunScriptOnScreenElement id = first_time_goal_info goal_message_got_gap params = <...> 
	ENDIF 
ENDSCRIPT


