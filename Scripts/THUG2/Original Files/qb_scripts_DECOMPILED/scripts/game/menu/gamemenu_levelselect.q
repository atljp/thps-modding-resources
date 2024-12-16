
SCRIPT launch_level_select_menu 
	hide_current_goal 
	menu3d_hide 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = main_menu_bg_anchor 
		DestroyScreenElement id = main_menu_bg_anchor 
	ENDIF 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			hide 
		} 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
	ELSE 
		skater : hide 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim name = level_select_cam play_hold 
	ENDIF 
	load_level_select_textures_to_main_memory 
	pause_menu_gradient off 
	SetMenuPadMappings [ active 
		use_as_first 
	] 
	create_level_select_menu <...> 
ENDSCRIPT

level_select_last_level_played = Load_MainMenu 
level_select_focus_target1 = 0 
level_select_focus_target2 = 0 
SCRIPT create_level_select_menu pad_back_script = level_select_menu_exit 
	IF ( in_server_options = 1 ) 
		from_server_options = from_server_options 
		net_pad_back = 0 
		pad_back_script = network_level_select_pad_back 
	ELSE 
		RemoveParameter from_server_options 
	ENDIF 
	GoalManager_HidePoints 
	hide_current_goal 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = level_select_anchor 
	} 
	AssignAlias id = level_select_anchor alias = current_menu_anchor 
	IF GameModeEquals is_classic 
		level_list = level_select_menu_classic_level_info 
	ELSE 
		level_list = level_select_menu_level_info 
	ENDIF 
	change globe_pos = 256.00000000000 
	change globe_target_x = 89.00000000000 
	change globe_target_dot_num = 0 
	change globe_new_target_x = 89.00000000000 
	change globe_state = seeking 
	change globe_interpolation = 0 
	change level_select_item_current_index = -1 
	change level_select_focus_target1 = 0 
	change level_select_focus_target2 = null 
	IF NOT LevelIs Load_MainMenu 
		GetCurrentLevel 
		change level_select_last_level_played = <level> 
	ENDIF 
	level_select_build_signs pos = PAIR(320.00000000000, 55.00000000000) level_list = <level_list> 
	level_select_build_map level_list = <level_list> 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor 
		id = level_select_anchor_middle 
		pos = PAIR(-225.00000000000, 28.00000000000) 
	} 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ { pad_back generic_pause_exit_sound } 
			{ pad_back <pad_back_script> params = { <...> } } 
			{ pad_left level_select_pad_left } 
			{ pad_right level_select_pad_right } 
		] 
	} 
	kill_start_key_binding 
	create_helper_text helper_text_elements = [ { text = "\\b6/\\b5 = Choose Level" } 
		{ text = "\\bm = Select" } 
		{ text = "\\bn = Back" } 
	] 
	IF GotParam from_server_options 
		current_menu : SetTags from_server_options = <from_server_options> 
	ENDIF 
	IF NOT ( level_select_focus_target1 = 0 ) 
		IF ( level_select_focus_target1 > 0 ) 
			fireevent type = focus target = current_menu data = { grid_index = ( level_select_focus_target1 ) } 
		ENDIF 
		IF NOT ChecksumEquals a = ( level_select_focus_target2 ) b = null 
			fireevent type = focus target = ( level_select_focus_target2 ) data = { grid_index = ( level_select_focus_target1 ) } 
		ENDIF 
	ELSE 
		fireevent type = focus target = current_menu 
	ENDIF 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT level_select_build_signs 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor 
		id = sign_anchor 
		pos = <pos> 
	} 
	sign_scale = 0.50000000000 
	IF GameModeEquals is_classic 
		bar_bg_scale = PAIR(8.00000000000, 2.00000000000) 
		sign_width = 50 
		hmenu_pos = ( <sign_width> * PAIR(0.50000000000, 0.00000000000) ) 
		hmenu_just = [ center center ] 
	ELSE 
		bar_bg_scale = PAIR(8.00000000000, 1.50000000000) 
		sign_width = 35 
		hmenu_pos = ( <sign_width> * PAIR(0.50000000000, 0.00000000000) + PAIR(0.00000000000, -14.50000000000) ) 
		hmenu_just = [ center top ] 
	ENDIF 
	CreateScreenElement { 
		type = HMenu 
		parent = sign_anchor 
		id = level_menu 
		pos = <hmenu_pos> 
		dims = PAIR(640.00000000000, 0.00000000000) 
		just = [ center center ] 
		internal_just = <hmenu_just> 
	} 
	AssignAlias id = level_menu alias = current_menu 
	current_menu : SetTags item_parent = level_menu 
	sign_params = { width = <sign_width> scale = <sign_scale> } 
	IF GameModeEquals is_classic 
		index = 0 
		last_bracket = -1 
		GetArraySize <level_list> 
		BEGIN 
			IF StructureContains structure = ( <level_list> [ <index> ] ) bracket 
				IF NOT ( ( ( <level_list> [ <index> ] ) . bracket ) = <last_bracket> ) 
					last_bracket = ( ( <level_list> [ <index> ] ) . bracket ) 
					level_select_menu_add_bracket index = <index> bracket = <last_bracket> level_list = <level_list> <sign_params> size = <array_size> 
				ENDIF 
			ELSE 
				level_select_menu_add_item <sign_params> ( <level_list> [ <index> ] ) 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		ForEachIn <level_list> do = level_select_menu_add_item params = <sign_params> 
	ENDIF 
	Theme_GetHighlightBarColor return_value = bg_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sign_anchor 
		id = menu_bar 
		texture = DE_highlight_bar 
		pos = PAIR(0.00000000000, 0.00000000000) 
		rgba = <bg_color> 
		just = [ center center ] 
		scale = <bar_bg_scale> 
		z_priority = -1 
		alpha = 0.75000000000 
	} 
	IF GameModeEquals is_classic 
		build_big_level_select_arrows parent = sign_anchor z_priority = 5 arrow_position_shift = PAIR(25.00000000000, 0.00000000000) 
	ELSE 
		build_big_level_select_arrows parent = sign_anchor z_priority = 5 
	ENDIF 
	Theme_GetSupportPieceColor return_value = tab_color 
	IF GameModeEquals is_classic 
		tab_anchor_pos = PAIR(0.00000000000, 8.00000000000) 
	ELSE 
		tab_anchor_pos = PAIR(0.00000000000, 0.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = sign_anchor 
		id = tab_anchor 
		pos = <tab_anchor_pos> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_anchor 
		texture = goal_tab 
		rgba = <tab_color> 
		scale = PAIR(2.50000000000, 1.79999995232) 
		pos = PAIR(340.00000000000, 80.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_anchor 
		texture = goal_tab 
		rgba = [ 0 0 0 50 ] 
		scale = PAIR(2.50000000000, 1.79999995232) 
		pos = PAIR(330.00000000000, 80.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = -5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_anchor 
		texture = goal_grad 
		rgba = [ 128 128 128 38 ] 
		scale = PAIR(9.50000000000, 12.19999980927) 
		pos = PAIR(370.00000000000, 75.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_anchor 
		texture = goal_grad 
		rgba = [ 128 128 128 28 ] 
		scale = PAIR(12.50000000000, 0.50000000000) 
		pos = PAIR(450.00000000000, 77.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_anchor 
		texture = goal_grad 
		rgba = [ 128 128 128 48 ] 
		scale = PAIR(12.50000000000, 0.50000000000) 
		pos = PAIR(430.00000000000, 28.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sign_anchor 
		id = globe_arrow 
		texture = level_arrow 
		pos = PAIR(75.00000000000, 25.00000000000) 
		rgba = [ 128 128 128 120 ] 
		alpha = 0 
		just = [ right top ] 
		scale = 0 
		z_priority = -45 
		rot_angle = 100 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sign_anchor 
		texture = white2 
		pos = PAIR(75.00000000000, 25.00000000000) 
		scale = PAIR(-6.50000000000, 1.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = -40 
	} 
ENDSCRIPT

SCRIPT build_big_level_select_arrows pos = PAIR(0.00000000000, 0.00000000000) scale = 1 z_priority = 0 arrow_position_shift = PAIR(0.00000000000, 0.00000000000) 
	Theme_GetMenuTitleColor return_value = arrow_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		id = left_arrow 
		texture = left_arrow 
		rgba = <arrow_color> 
		scale = ( PAIR(2.20000004768, 1.39999997616) * <scale> ) 
		pos = ( PAIR(-305.00000000000, -5.00000000000) + <arrow_position_shift> + <pos> ) 
		rot_angle = 10 
		just = [ left center ] 
		z_priority = <z_priority> 
	} 
	RunScriptOnScreenElement id = left_arrow level_select_arrow_twitch_effect params = { rot_angle = 10 rot_angle_dir = -1 } 
	CreateScreenElement { 
		type = SpriteElement 
		parent = left_arrow 
		texture = left_arrow 
		rgba = [ 0 0 0 70 ] 
		scale = 1 
		pos = PAIR(-5.00000000000, 17.00000000000) 
		just = [ left center ] 
		z_priority = -0.50000000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		id = right_arrow 
		texture = right_arrow 
		rgba = <arrow_color> 
		scale = ( PAIR(2.20000004768, 1.39999997616) * <scale> ) 
		pos = ( PAIR(305.00000000000, 5.00000000000) - <arrow_position_shift> + <pos> ) 
		rot_angle = 10 
		just = [ right center ] 
		z_priority = <z_priority> 
	} 
	RunScriptOnScreenElement id = right_arrow level_select_arrow_twitch_effect params = { rot_angle = 10 rot_angle_dir = 1 } 
	CreateScreenElement { 
		type = SpriteElement 
		parent = right_arrow 
		texture = right_arrow 
		rgba = [ 0 0 0 70 ] 
		scale = 1 
		pos = PAIR(22.00000000000, 11.00000000000) 
		just = [ right center ] 
		z_priority = -0.50000000000 
	} 
ENDSCRIPT

SCRIPT level_select_arrow_blink_left 
	IF NOT ScreenElementExists id = left_arrow 
		RETURN 
	ENDIF 
	IF GotParam wait_first 
		wait 1 gameframes 
	ENDIF 
	left_arrow : SetTags animating 
	DoScreenElementMorph id = left_arrow alpha = 0.15000000596 time = 0 scale = 0.50000000000 relative_scale 
	DoScreenElementMorph id = left_arrow alpha = 1 time = 0.15000000596 scale = 1 relative_scale 
ENDSCRIPT

SCRIPT level_select_arrow_blink_right 
	IF NOT ScreenElementExists id = right_arrow 
		RETURN 
	ENDIF 
	IF GotParam wait_first 
		wait 1 gameframes 
	ENDIF 
	right_arrow : SetTags animating 
	DoScreenElementMorph id = right_arrow alpha = 0.15000000596 time = 0 scale = 0.50000000000 relative_scale 
	DoScreenElementMorph id = right_arrow alpha = 1 time = 0.15000000596 scale = 1 relative_scale 
ENDSCRIPT

SCRIPT level_select_arrow_twitch_effect 
	BEGIN 
		IF GetSingleTag animating 
			wait 0.15000000596 seconds 
			RemoveTags tags = [ animating ] 
		ELSE 
			DoMorph rot_angle = ( <rot_angle> + 10 * <rot_angle_dir> ) 
			wait 1 gameframe 
			DoMorph rot_angle = <rot_angle> 
		ENDIF 
		wait_time = RANDOM(1, 1, 1) RANDOMCASE 0.25000000000 RANDOMCASE 0.50000000000 RANDOMCASE 2.25000000000 RANDOMEND 
		wait <wait_time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT level_select_pad_right 
	IF NOT ScreenElementExists id = current_menu 
		RETURN 
	ENDIF 
	generic_menu_scroll_sideways_sound 
	level_select_arrow_blink_right 
ENDSCRIPT

SCRIPT level_select_pad_left 
	IF NOT ScreenElementExists id = current_menu 
		RETURN 
	ENDIF 
	generic_menu_scroll_sideways_sound 
	level_select_arrow_blink_left 
ENDSCRIPT

SCRIPT level_select_maybe_play_vert_sound 
	IF NOT ScreenElementExists id = current_menu 
		RETURN 
	ENDIF 
	generic_menu_up_or_down_sound <...> 
ENDSCRIPT

SCRIPT level_select_sign_pulse_effect 
	wait 0.10000000149 seconds 
	BEGIN 
		DoMorph scale = 2.26999998093 relative_scale time = 0.50000000000 
		DoMorph scale = 2.13000011444 relative_scale time = 0.50000000000 
	REPEAT 
ENDSCRIPT

SCRIPT sign_focus 
	GetTags 
	IF ScreenElementExists id = { <id> child = sign } 
		SetScreenElementProps id = { <id> child = sign } z_priority = 2 
		DoScreenElementMorph id = { <id> child = sign } scale = 2.20000004768 relative_scale alpha = 1 time = 0.05999999866 
		RunScriptOnScreenElement id = { <id> child = sign } level_select_sign_pulse_effect 
		DoScreenElementMorph id = { <id> child = { sign child = shadow } } alpha = 0.50000000000 time = 0.20000000298 
	ELSE 
		IF ScreenElementExists id = { <id> child = text } 
			DoScreenElementMorph id = { <id> child = text } scale = 1.50000000000 relative_scale alpha = 1 time = 0.07999999821 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT sign_unfocus 
	IF current_menu : GetSingleTag stop_animating 
		RETURN 
	ENDIF 
	GetTags 
	IF ScreenElementExists id = { <id> child = sign } 
		KillSpawnedScript name = level_select_sign_pulse_effect 
		SetScreenElementProps id = { <id> child = sign } z_priority = 1 
		DoScreenElementMorph id = { <id> child = sign } scale = 1 relative_scale alpha = 0.50000000000 time = 0.07999999821 
		DoScreenElementMorph id = { <id> child = { sign child = shadow } } alpha = 0 time = 0.20000000298 
	ELSE 
		IF ScreenElementExists id = { <id> child = text } 
			DoScreenElementMorph id = { <id> child = text } scale = 1 relative_scale alpha = 0.50000000000 time = 0.07999999821 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GetHeadshotInfo 
	found = 0 
	index = 0 
	BEGIN 
		ped = ( ( <level_info> . special_ped_info ) [ <index> ] ) 
		IF ( ( <ped> . type ) = <type> ) 
			IF StructureContains structure = <ped> name 
				GetSkaterProfileInfoByName name = ( <ped> . name ) 
				IF GotParam found_flag 
					IF GetGlobalFlag flag = <found_flag> 
						found = 1 
					ENDIF 
				ENDIF 
			ENDIF 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN found = <found> 
ENDSCRIPT

SCRIPT level_select_build_info_panel_common_bits 
	IF ScreenElementExists id = level_select_info_panel 
		DoScreenElementMorph id = level_select_info_panel alpha = 0 time = 0.20000000298 
		wait 0.20000000298 seconds 
		IF ScreenElementExists id = level_select_info_panel 
			DestroyScreenElement id = level_select_info_panel 
		ENDIF 
	ENDIF 
	IF NOT ScreenElementExists id = level_select_anchor_middle 
		RETURN die 
	ENDIF 
	SetScreenElementLock id = level_select_anchor_middle off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor_middle 
		id = level_select_info_panel 
		pos = PAIR(700.00000000000, 110.00000000000) 
	} 
	Theme_GetHighlightBarColor return_value = pts_color 
	Theme_GetSupportPieceColor return_value = tab_color 
	Theme_GetMenuTitleColor return_value = guest_color 
	RETURN <...> 
ENDSCRIPT

SCRIPT level_select_info_panel_fade_in 
	DoScreenElementMorph id = level_select_info_panel alpha = 0 time = 0 
	DoScreenElementMorph id = level_select_info_panel alpha = 1 time = 0.07999999821 
ENDSCRIPT

SCRIPT level_select_info_add_gaps 
	IF ( <level_num> = <created_park_number> ) 
		RETURN 
	ENDIF 
	GetLevelGapTotals level = <level_num> 
	IF ( <num_gaps> = 0 ) 
		num_gaps = "??" 
	ENDIF 
	FormatText textname = gaps "%a/%b GAPS FOUND" a = <num_collected_gaps> b = <num_gaps> 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <gaps> 
		font = small 
		rgba = <tab_color> 
		scale = 1 
		pos = <pos> 
		just = [ center top ] 
		z_priority = 50 
	} 
ENDSCRIPT

SCRIPT level_select_info_add_highscore 
	IF ( <level_num> = <created_park_number> ) 
		RETURN 
	ENDIF 
	GetLevelRecords level = <level_num> 
	FormatText textname = highScore "HIGHEST SCORE: %a" a = ( ( ( <highscores> . recordtable ) [ 0 ] ) . value ) UseCommas 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <highScore> 
		font = small 
		rgba = <tab_color> 
		scale = 1 
		pos = <pos> 
		just = [ center top ] 
		z_priority = 50 
	} 
ENDSCRIPT

SCRIPT level_select_build_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam sign_texture 
		RETURN 
	ENDIF 
	IF ( <level_num> < 7 ) 
		GetCareerLevelScore level = <level_num> 
		FormatText textname = score "%a/%b PTS." a = <level_score> b = <level_score_total> 
		CreateScreenElement { 
			type = TextElement 
			parent = level_select_info_panel 
			text = <score> 
			font = small 
			rgba = <pts_color> 
			scale = PAIR(1.39999997616, 1.60000002384) 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ center top ] 
			z_priority = 50 
		} 
		IF GotParam level_prefix 
			FormatText ChecksumName = level_info "Level_%i" i = <level_prefix> 
			IF StructureContains structure = <level_info> special_ped_info 
				GetArraySize ( <level_info> . special_ped_info ) 
				CreateScreenElement { 
					type = TextElement 
					parent = level_select_info_panel 
					text = "GUESTS:" 
					font = small 
					rgba = <guest_color> 
					scale = 1.29999995232 
					pos = PAIR(-75.00000000000, 108.00000000000) 
					just = [ center top ] 
					z_priority = 50 
				} 
				CreateScreenElement { 
					type = SpriteElement 
					parent = level_select_info_panel 
					texture = level_swatch 
					pos = PAIR(0.00000000000, 90.00000000000) 
					rgba = [ 128 128 128 40 ] 
					just = [ center top ] 
					scale = PAIR(0.50000000000, 2.00000000000) 
					z_priority = 50 
				} 
				GetHeadshotInfo type = guest level_prefix = <level_prefix> array_size = <array_size> level_info = <level_info> 
				IF ( <found> = 1 ) 
					FormatText ChecksumName = headshot "%a_guest" a = <level_prefix> 
					CreateScreenElement { 
						type = SpriteElement 
						parent = level_select_info_panel 
						texture = <headshot> 
						rgba = [ 128 128 128 128 ] 
						scale = 0.80000001192 
						pos = PAIR(0.00000000000, 125.00000000000) 
						just = [ center center ] 
						z_priority = 55 
					} 
				ELSE 
					CreateScreenElement { 
						type = TextElement 
						parent = level_select_info_panel 
						text = "?" 
						font = small 
						rgba = [ 0 0 0 128 ] 
						scale = 3 
						pos = PAIR(0.00000000000, 125.00000000000) 
						just = [ center center ] 
						z_priority = 55 
					} 
				ENDIF 
				CreateScreenElement { 
					type = SpriteElement 
					parent = level_select_info_panel 
					texture = level_swatch 
					pos = PAIR(70.00000000000, 90.00000000000) 
					rgba = [ 128 128 128 40 ] 
					just = [ center top ] 
					scale = PAIR(0.50000000000, 2.00000000000) 
					z_priority = 50 
				} 
				GetHeadshotInfo type = flavor level_prefix = <level_prefix> array_size = <array_size> level_info = <level_info> 
				IF ( <found> = 1 ) 
					FormatText ChecksumName = headshot "%a_secret" a = <level_prefix> 
					CreateScreenElement { 
						type = SpriteElement 
						parent = level_select_info_panel 
						texture = <headshot> 
						rgba = [ 128 128 128 128 ] 
						scale = 0.80000001192 
						pos = PAIR(70.00000000000, 125.00000000000) 
						just = [ center center ] 
						z_priority = 55 
					} 
				ELSE 
					CreateScreenElement { 
						type = TextElement 
						parent = level_select_info_panel 
						text = "?" 
						font = small 
						rgba = [ 0 0 0 128 ] 
						scale = 3 
						pos = PAIR(70.00000000000, 125.00000000000) 
						just = [ center center ] 
						z_priority = 55 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 40.00000000000) 
	GetCareerLevelScore get_total 
	FormatText textname = score "TOTAL STORY PTS: %a/%b PTS." a = <total_score> b = <total_score_potential> 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <score> 
		font = small 
		rgba = <pts_color> 
		scale = PAIR(1.00000000000, 1.10000002384) 
		pos = PAIR(0.00000000000, 165.00000000000) 
		just = [ center top ] 
		z_priority = 50 
	} 
	level_select_info_panel_fade_in 
ENDSCRIPT

SCRIPT level_select_build_classic_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam sign_texture 
		RETURN 
	ENDIF 
	GetClassicLevelGoalCount level = <level_num> get_total 
	FormatText textname = goal_count "%a/10 GOALS" a = <classic_goal_count> 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <goal_count> 
		font = small 
		rgba = <pts_color> 
		scale = PAIR(1.39999997616, 1.60000002384) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		z_priority = 50 
	} 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 40.00000000000) 
	level_select_info_add_highscore <...> pos = PAIR(0.00000000000, 60.00000000000) 
	FormatText textname = goal_count "%a/%b TOTAL GAME GOALS" a = <total_goals_complete> b = <total_goals_possible> 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <goal_count> 
		font = small 
		rgba = <pts_color> 
		scale = PAIR(1.00000000000, 1.10000002384) 
		pos = PAIR(0.00000000000, 88.00000000000) 
		just = [ center top ] 
		z_priority = 50 
	} 
	IF IsPAL 
		IF NOT English 
			hide_classic_icon = 1 
		ENDIF 
	ENDIF 
	IF NOT GotParam hide_classic_icon 
		CreateScreenElement { 
			type = SpriteElement 
			parent = level_select_info_panel 
			texture = classic_icon 
			pos = PAIR(0.00000000000, 114.00000000000) 
			rgba = [ 128 128 128 110 ] 
			just = [ center top ] 
			scale = ( PAIR(1.50000000000, 1.10000002384) * 0.89999997616 ) 
			z_priority = 50 
		} 
	ENDIF 
	GetClassicModeTargetGoalsComplete 
	IF ( <bracket> = 8 ) 
		IF ( ( GetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 ) | ( all_levels_unlocked = 1 ) ) 
		ELSE 
			bracket_size = 1 
		ENDIF 
	ENDIF 
	IF ( <bracket_size> = 1 ) 
		FormatText { 
			textname = goal_remaining_text 
			"COMPLETE %g GOALS IN %a TO MOVE ON." 
			g = <target_goals_complete> 
			a = <text> 
		} 
	ELSE 
		GetArraySize level_select_menu_classic_level_info 
		index = <first_matching_index> 
		BEGIN 
			IF StructureContains structure = ( level_select_menu_classic_level_info [ <index> ] ) bracket 
				IF ( ( ( level_select_menu_classic_level_info [ <index> ] ) . bracket ) = <bracket> ) 
					IF GotParam text1 
						text2 = ( ( level_select_menu_classic_level_info [ <index> ] ) . text ) 
						BREAK 
					ELSE 
						text1 = ( ( level_select_menu_classic_level_info [ <index> ] ) . text ) 
					ENDIF 
				ENDIF 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <bracket_size> 
		IF ( <bracket> < 8 ) 
			FormatText { 
				textname = goal_remaining_text 
				"COMPLETE %g GOALS IN %a OR %b TO MOVE ON." 
				g = <target_goals_complete> 
				a = <text1> 
				b = <text2> 
			} 
		ELSE 
			IF ( <bracket_size> < 2 ) 
				FormatText { 
					textname = goal_remaining_text 
					"COMPLETE %g GOALS IN %a TO MOVE ON." 
					g = <target_goals_complete> 
					a = <text1> 
				} 
			ELSE 
				FormatText { 
					textname = goal_remaining_text 
					"COMPLETE %g GOALS IN %a TO COMPLETE CLASSIC MODE." 
					g = <target_goals_complete> 
					a = <text2> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	level_select_get_bracket_status bracket = <bracket> level_list = <level_list> show_all 
	IF NOT GotParam beaten 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = level_select_info_panel 
			font = small 
			text = <goal_remaining_text> 
			rgba = [ 128 128 128 128 ] 
			alpha = 0 
			scale = 0.86000001431 
			pos = PAIR(0.00000000000, 185.00000000000) 
			dims = PAIR(250.00000000000, 0.00000000000) 
			allow_expansion 
			just = [ center top ] 
		} 
		RunScriptOnScreenElement id = <id> level_select_classic_goal_flash 
	ENDIF 
	level_select_info_panel_fade_in 
ENDSCRIPT

SCRIPT level_select_classic_goal_flash 
	SetProps rgba = [ 128 128 0 128 ] 
	BEGIN 
		DoMorph alpha = 1 time = 1 
		DoMorph alpha = 0 time = 1 
	REPEAT 
ENDSCRIPT

SCRIPT level_select_build_highscore_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam sign_texture 
		RETURN 
	ENDIF 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 25.00000000000) 
	level_select_info_add_highscore <...> pos = PAIR(0.00000000000, 45.00000000000) 
	IF InSplitScreenGame 
		text = "2 PLAYER" 
	ELSE 
		text = "FREE SKATE" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <text> 
		font = small 
		rgba = <pts_color> 
		scale = 1.50000000000 
		pos = PAIR(0.00000000000, 120.00000000000) 
		just = [ center top ] 
		z_priority = 50 
	} 
	level_select_info_panel_fade_in 
ENDSCRIPT

SCRIPT level_select_build_online_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam sign_texture 
		RETURN 
	ENDIF 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 45.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = "NETWORK" 
		font = small 
		rgba = <pts_color> 
		scale = 1.50000000000 
		pos = PAIR(0.00000000000, 110.00000000000) 
		just = [ center top ] 
		z_priority = 50 
	} 
	level_select_info_panel_fade_in 
ENDSCRIPT

SCRIPT level_select_build_creategoals_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam sign_texture 
		RETURN 
	ENDIF 
	GoalEditor : GetNumEditedGoals level = <level> 
	IF ( <NumGoals> = 0 ) 
		goal_count = "No Created Goals" 
	ELSE 
		FormatText textname = goal_count "%a/10 GOALS" a = <NumGoals> 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = level_select_info_panel 
		text = <goal_count> 
		font = small 
		rgba = <pts_color> 
		scale = PAIR(1.39999997616, 1.60000002384) 
		pos = PAIR(0.00000000000, 30.00000000000) 
		just = [ center top ] 
		z_priority = 50 
	} 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 100.00000000000) 
	level_select_info_panel_fade_in 
ENDSCRIPT

globe_target_x = 89.00000000000 
globe_target_y = 0.00000000000 
globe_target_dot_num = 0 
globe_new_target_x = 0.00000000000 
globe_state = still 
globe_piece_size = 64 
globe_interpolation = 0.00000000000 
globe_vel = 0 
globe_pos = 0.00000000000 
globe_idle_frames = 0 
SCRIPT GetDotNameFromNum 
	FormatText ChecksumName = dot_name "globe_dot_%a" a = <num> 
	RETURN dot_name = <dot_name> 
ENDSCRIPT

SCRIPT level_select_globe_slice 
	SetScreenElementLock id = globe_sliding_anchor off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = globe_sliding_anchor 
		local_id = <slice> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		scale = 1.00999999046 
	} 
	y = 0 
	BEGIN 
		FormatText ChecksumName = piece "map%a" a = ( ( level_map_pieces [ <x> ] . tiles ) [ <y> ] ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = { globe_sliding_anchor child = <slice> } 
			texture = <piece> 
			pos = ( <y> * PAIR(0.00000000000, 64.00000000000) ) 
			scale = 1 
			rgba = [ 128 128 128 128 ] 
			just = [ center top ] 
			z_priority = -50 
		} 
		y = ( <y> + 1 ) 
	REPEAT <y_size> 
	IF StructureContains structure = ( level_map_pieces [ <x> ] ) dot_count 
		IF ( ( ( level_map_pieces [ <x> ] ) . dot_count ) > 0 ) 
			index = 0 
			BEGIN 
				dot_index = ( ( level_map_pieces [ <x> ] ) . dots [ <index> ] ) 
				GetDotNameFromNum num = ( ( <level_list> [ <dot_index> ] ) . level_num ) 
				CreateScreenElement { 
					type = SpriteElement 
					parent = { globe_sliding_anchor child = <slice> } 
					id = <dot_name> 
					texture = level_dot 
					pos = ( ( <level_list> [ <dot_index> ] ) . dot_local_pos ) 
					scale = 0.50000000000 
					rgba = [ 128 128 128 128 ] 
					just = [ center center ] 
					z_priority = -49 
				} 
				index = ( <index> + 1 ) 
			REPEAT ( level_map_pieces [ <x> ] . dot_count ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT show_active_globe_dot 
	GetDotNameFromNum num = ( globe_target_dot_num ) 
	IF ScreenElementExists id = <dot_name> 
		DoScreenElementMorph id = <dot_name> alpha = 1 time = 0 
	ENDIF 
	change globe_target_dot_num = <num> 
	GetDotNameFromNum num = ( globe_target_dot_num ) 
	pulse_counter = 0 
	BEGIN 
		IF ScreenElementExists id = <dot_name> 
			DoScreenElementMorph id = <dot_name> alpha = 0.20000000298 time = 0.20000000298 
			wait 0.30000001192 seconds 
			IF ScreenElementExists id = <dot_name> 
				DoScreenElementMorph id = <dot_name> alpha = 1 time = 0.20000000298 
				wait 0.30000001192 seconds 
				IF GotParam do_pulse 
					IF ( <pulse_counter> > 0 ) 
						pulse_counter = 0 
						SpawnScript globe_dot_highlight_pulse 
						RETURN 
					ELSE 
						pulse_counter = ( <pulse_counter> + 1 ) 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT globe_dot_highlight_pulse 
	GetDotNameFromNum num = ( globe_target_dot_num ) 
	IF ScreenElementExists id = <dot_name> 
		IF ScreenElementExists id = { <dot_name> child = pulse } 
			RETURN 
		ENDIF 
		SetScreenElementLock id = <dot_name> off 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <dot_name> 
			local_id = pulse 
			texture = level_selected_dot 
			pos = PAIR(17.00000000000, 17.00000000000) 
			scale = 2 
			rgba = [ 115 27 13 128 ] 
			just = [ center center ] 
			z_priority = -49 
		} 
		KillSpawnedScript name = show_active_globe_dot 
		SpawnScript show_active_globe_dot params = { num = ( globe_target_dot_num ) do_pulse } 
		DoScreenElementMorph id = <id> scale = 8 alpha = 0 time = 0.64999997616 
		wait 0.69999998808 seconds 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT draw_globe_arrow 
	IF ScreenElementExists id = globe_arrow 
		IF GotParam off 
			IF globe_arrow : GetSingleTag arrow_on 
				DoScreenElementMorph id = globe_arrow alpha = 0 rot_angle = 100 scale = 0 time = 0.11999999732 
				globe_arrow : RemoveTags tags = [ arrow_on ] 
			ENDIF 
			RETURN 
		ENDIF 
		IF globe_arrow : GetSingleTag arrow_on 
			RETURN 
		ENDIF 
		globe_arrow : SetTags arrow_on = 1 
		DoScreenElementMorph id = globe_arrow scale = 0 rot_angle = 100 time = 0 
		angle = ( ( ( 0.00089400000 * globe_target_y ) - 0.42599999905 ) * globe_target_y + 50.50000000000 ) 
		scale = ( globe_target_y * 0.00429000007 + 1 ) 
		DoScreenElementMorph id = globe_arrow scale = <scale> rot_angle = <angle> alpha = 1 time = 0.20000000298 
	ENDIF 
ENDSCRIPT

SCRIPT GetAbsGlobeDelta 
	delta = ( globe_target_x - globe_pos ) 
	IF ( <delta> < 0 ) 
		delta = ( 0.00000000000 - <delta> ) 
	ENDIF 
	RETURN delta = <delta> 
ENDSCRIPT

SCRIPT level_select_spin_globe 
	IF ScreenElementExists id = globe_sliding_anchor 
		DestroyScreenElement id = globe_sliding_anchor 
	ENDIF 
	SetScreenElementLock id = map_anchor off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = map_anchor 
		id = globe_sliding_anchor 
		pos = PAIR(150.00000000000, 4.00000000000) 
		scale = 1.12800002098 
	} 
	GetArraySize level_map_pieces 
	x_size = <array_size> 
	GetArraySize ( level_map_pieces [ 0 ] . tiles ) 
	y_size = <array_size> 
	piece_size = ( globe_piece_size ) 
	visible_center = 180 
	left_edge = 0 
	right_edge = 200 
	map_width = ( <piece_size> * <x_size> ) 
	BEGIN 
		IF NOT ScreenElementExists id = globe_sliding_anchor 
			RETURN 
		ENDIF 
		GetAbsGlobeDelta 
		IF ( <delta> > ( <map_width> / 2 ) ) 
			IF ( globe_target_x > globe_pos ) 
				change globe_target_x = ( globe_target_x - <map_width> ) 
			ELSE 
				change globe_target_x = ( globe_target_x + <map_width> ) 
			ENDIF 
		ELSE 
			IF NOT ( globe_pos < <map_width> ) 
				change globe_pos = ( globe_pos - <map_width> ) 
				change globe_target_x = ( globe_target_x - <map_width> ) 
			ELSE 
				IF ( globe_pos < 0 ) 
					change globe_pos = ( globe_pos + <map_width> ) 
					change globe_target_x = ( globe_target_x + <map_width> ) 
				ENDIF 
			ENDIF 
		ENDIF 
		do_globe_state_logic delta = <delta> idle_threshold = 5 
		position_offset = -30 
		<start> = ( globe_pos - <visible_center> + <position_offset> ) 
		start = ( <start> / <piece_size> ) 
		old = <start> 
		CastToInteger start 
		index = <start> 
		local = ( <start> - <old> ) 
		slice_pos = ( <local> * <piece_size> ) 
		IF ( <slice_pos> < 0 ) 
			slice_pos = ( <slice_pos> + <piece_size> ) 
			index = ( <index> + 1 ) 
		ENDIF 
		BEGIN 
			IF ( <index> < 0 ) 
				index = ( <index> + <x_size> ) 
			ENDIF 
			IF NOT ( <index> < <x_size> ) 
				index = ( <index> - <x_size> ) 
			ENDIF 
			FormatText ChecksumName = slice "globe_slice_%a" a = <index> 
			IF ( <slice_pos> > ( <visible_center> * 2 + <position_offset> * 0.80000001192 ) ) 
				IF ScreenElementExists id = { globe_sliding_anchor child = <slice> } 
					DestroyScreenElement id = { globe_sliding_anchor child = <slice> } 
				ENDIF 
			ELSE 
				IF NOT ScreenElementExists id = { globe_sliding_anchor child = <slice> } 
					level_select_globe_slice x = <index> y = <y> y_size = <y_size> slice = <slice> level_list = <level_list> 
				ENDIF 
				DoScreenElementMorph id = { globe_sliding_anchor child = <slice> } pos = ( <slice_pos> * PAIR(1.00000000000, 0.00000000000) - ( <visible_center> * PAIR(1.00000000000, 0.00000000000) ) ) time = 0 
			ENDIF 
			slice_pos = ( <slice_pos> + <piece_size> ) 
			index = ( <index> + 1 ) 
		REPEAT <x_size> 
		wait 1 frames 
	REPEAT 
ENDSCRIPT

SCRIPT do_globe_state_logic 
	SWITCH globe_state 
		CASE still 
			IF NOT ( globe_new_target_x = globe_target_x ) 
				change globe_target_x = ( globe_new_target_x ) 
				change globe_state = seeking 
				change globe_interpolation = 0.00000000000 
				change globe_vel = 0 
			ENDIF 
		CASE seeking 
			sin ( globe_interpolation ) 
			new_pos = ( ( globe_target_x * <sin> ) + ( globe_pos * ( 1.00000000000 - <sin> ) ) ) 
			change globe_vel = ( <new_pos> - globe_pos ) 
			change globe_pos = <new_pos> 
			change globe_interpolation = ( globe_interpolation + 0.40000000596 ) 
			IF ( globe_interpolation > 90 ) 
				change globe_interpolation = 90 
			ENDIF 
			IF ( <delta> < 7 ) 
				draw_globe_arrow 
			ELSE 
				draw_globe_arrow off 
			ENDIF 
			IF ( <delta> < 0.89999997616 ) 
				IF NOT ( globe_state = still ) 
					change globe_state = still 
					SpawnScript globe_dot_highlight_pulse 
					draw_globe_arrow 
				ENDIF 
			ENDIF 
		CASE coasting 
			IF ( globe_vel < 0 ) 
				change globe_vel = ( globe_vel + 0.10000000149 ) 
				IF ( globe_vel > 0 ) 
					change globe_state = seeking 
					change globe_target_x = ( globe_new_target_x ) 
				ENDIF 
			ELSE 
				change globe_vel = ( globe_vel -0.10000000149 ) 
				IF ( globe_vel < 0 ) 
					change globe_vel = 0 
					IF ( globe_idle_frames > <idle_threshold> ) 
						change globe_state = seeking 
						change globe_target_x = ( globe_new_target_x ) 
					ELSE 
						change globe_idle_frames = ( globe_idle_frames + 1 ) 
					ENDIF 
				ENDIF 
			ENDIF 
			change globe_interpolation = 0.00000000000 
			change globe_pos = ( globe_pos + globe_vel ) 
			change globe_vel = ( globe_vel * 0.89999997616 ) 
		CASE spinning 
			draw_globe_arrow off 
			IF ( globe_idle_frames > <idle_threshold> ) 
				IF ( globe_vel < 0 ) 
					target_spinning_vel = -2.20000004768 
				ELSE 
					target_spinning_vel = 2.20000004768 
				ENDIF 
				IF ( globe_vel < <target_spinning_vel> ) 
					change globe_vel = ( globe_vel + 0.10000000149 ) 
					IF ( globe_vel > <target_spinning_vel> ) 
						change globe_vel = <target_spinning_vel> 
					ENDIF 
				ELSE 
					IF ( globe_vel > <target_spinning_vel> ) 
						change globe_vel = ( globe_vel -0.10000000149 ) 
						IF ( globe_vel < <target_spinning_vel> ) 
							change globe_vel = <target_spinning_vel> 
						ENDIF 
					ENDIF 
				ENDIF 
			ELSE 
				change globe_idle_frames = ( globe_idle_frames + 1 ) 
			ENDIF 
			change globe_pos = ( globe_pos + globe_vel ) 
			change globe_target_x = ( globe_pos ) 
			change globe_new_target_x = ( globe_new_target_x ) 
	ENDSWITCH 
ENDSCRIPT

SCRIPT level_select_get_info_panel_script 
	IF InSplitScreenGame 
		info_panel_script = level_select_build_highscore_info_panel 
	ELSE 
		GetGameMode 
		SWITCH <GameMode> 
			CASE classic 
				info_panel_script = level_select_build_classic_info_panel 
			CASE career 
				info_panel_script = level_select_build_info_panel 
			CASE freeskate 
			CASE singlesession 
				info_panel_script = level_select_build_highscore_info_panel 
			CASE net 
				info_panel_script = level_select_build_online_info_panel 
			CASE creategoals 
				info_panel_script = level_select_build_creategoals_info_panel 
			DEFAULT 
				info_panel_script = level_select_build_online_info_panel 
		ENDSWITCH 
	ENDIF 
	RETURN <...> 
ENDSCRIPT

SCRIPT level_select_update_screen 
	IF ( <level_num> = ( globe_target_dot_num ) ) 
		RETURN 
	ENDIF 
	IF GotParam dot_pos 
		change globe_new_target_x = ( <dot_pos> . PAIR(1.00000000000, 0.00000000000) ) 
		change globe_target_y = ( <dot_pos> . PAIR(0.00000000000, 1.00000000000) ) 
		SWITCH globe_state 
			CASE spinning 
			CASE seeking 
				change globe_state = coasting 
		ENDSWITCH 
	ELSE 
		change globe_state = spinning 
	ENDIF 
	draw_globe_arrow off 
	change globe_idle_frames = 0 
	KillSpawnedScript name = show_active_globe_dot 
	SpawnScript show_active_globe_dot params = { num = <level_num> } 
	level_select_get_info_panel_script 
	KillSpawnedScript name = level_select_build_info_panel_common_bits 
	KillSpawnedScript name = <info_panel_script> 
	SpawnScript <info_panel_script> params = <...> 
	KillSpawnedScript name = level_select_build_title 
	SpawnScript level_select_build_title params = <...> 
ENDSCRIPT

SCRIPT level_select_build_title 
	IF ScreenElementExists id = current_level_title 
		DoScreenElementMorph id = current_level_title alpha = 0 time = 0.07999999821 
		wait 0.10000000149 seconds 
		IF NOT ScreenElementExists id = current_level_title 
			RETURN 
		ENDIF 
		DestroyScreenElement id = current_level_title 
	ENDIF 
	IF NOT ScreenElementExists id = tab_anchor 
		RETURN 
	ENDIF 
	SetScreenElementLock id = tab_anchor off 
	CreateScreenElement { 
		type = TextElement 
		parent = tab_anchor 
		id = current_level_title 
		text = <text> 
		font = small 
		rgba = [ 128 128 128 128 ] 
		alpha = 1 
		scale = 1.79999995232 
		pos = PAIR(155.00000000000, 32.00000000000) 
		just = [ center top ] 
		z_priority = 2 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	DoScreenElementMorph id = current_level_title alpha = 0 time = 0 
	DoScreenElementMorph id = current_level_title alpha = 1 time = 0.07999999821 
ENDSCRIPT

SCRIPT dot_to_slice 
	x = ( ( <dot> ) . PAIR(1.00000000000, 0.00000000000) ) 
	x = ( <x> / ( globe_piece_size ) ) 
	CastToInteger x 
	RETURN slice = <x> 
ENDSCRIPT

SCRIPT check_level_dot_valid 
	IF StructureContains structure = ( <level_list> [ <index> ] ) dot_pos 
		IF ( all_levels_unlocked = 1 ) 
			RETURN valid = 1 
		ELSE 
			IF StructureContains structure = ( <level_list> [ <index> ] ) flag 
				level_select_should_use_seen_flags 
				IF GotParam use_seen_flags 
					IF GetGlobalFlag flag = ( ( <level_list> [ <index> ] ) . seen_flag ) 
						RETURN valid = 1 
					ENDIF 
				ELSE 
					IF GetGlobalFlag flag = ( ( <level_list> [ <index> ] ) . flag ) 
						RETURN valid = 1 
					ENDIF 
				ENDIF 
				RemoveParameter use_seen_flags 
			ELSE 
				RETURN valid = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN valid = 0 
ENDSCRIPT

level_select_last_gamemode_processed = 0 
level_select_last_demoflag_processed = 0 
level_select_last_dot_count = 0 
SCRIPT level_select_calculate_dots 
	map_info = level_map_pieces 
	GetArraySize <map_info> 
	slice_size = <array_size> 
	GetArraySize <level_list> 
	level_size = <array_size> 
	CreateIndexArray <slice_size> 
	index = 0 
	BEGIN 
		SetArrayElement ArrayName = index_array index = <index> newvalue = 0 
		index = ( <index> + 1 ) 
	REPEAT <slice_size> 
	total_dots = 0 
	index = 0 
	BEGIN 
		check_level_dot_valid level_list = <level_list> index = <index> 
		IF ( <valid> = 1 ) 
			dot_to_slice dot = ( <level_list> [ <index> ] . dot_pos ) 
			SetArrayElement ArrayName = index_array index = <slice> newvalue = ( ( <index_array> [ <slice> ] ) + 1 ) 
			total_dots = ( <total_dots> + 1 ) 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <level_size> 
	GetGameMode 
	IF ( level_select_last_gamemode_processed = <GameMode> ) 
		IF ( level_select_last_demoflag_processed = ( demo_build ) ) 
			IF ( level_select_last_dot_count = <total_dots> ) 
				
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	change level_select_last_gamemode_processed = <GameMode> 
	change level_select_last_demoflag_processed = ( demo_build ) 
	change level_select_last_dot_count = <total_dots> 
	
	dot_count = ( <index_array> ) 
	index = 0 
	BEGIN 
		slot = 0 
		IF ( ( <dot_count> [ <index> ] ) > 0 ) 
			CreateIndexArray ( <dot_count> [ <index> ] ) 
			map = 0 
			BEGIN 
				check_level_dot_valid level_list = <level_list> index = <map> 
				IF ( <valid> = 1 ) 
					dot = ( <level_list> [ <map> ] . dot_pos ) 
					dot_to_slice dot = <dot> 
					x = ( ( <dot> ) . PAIR(1.00000000000, 0.00000000000) ) 
					x = ( <x> - <slice> * ( globe_piece_size ) - ( globe_piece_size * 0.50000000000 ) ) 
					y = ( ( <dot> ) . PAIR(0.00000000000, 1.00000000000) ) 
					IF ( <slice> = <index> ) 
						SetArrayElement ArrayName = index_array index = <slot> newvalue = <map> 
						SetArrayElement ArrayName = level_list index = <map> newvalue = { ( <level_list> [ <map> ] ) 
							dot_local_pos = ( <x> * PAIR(1.00000000000, 0.00000000000) + <y> * PAIR(0.00000000000, 1.00000000000) ) 
						} 
						slot = ( <slot> + 1 ) 
					ENDIF 
				ENDIF 
				map = ( <map> + 1 ) 
			REPEAT <level_size> 
			SetArrayElement ArrayName = map_info index = <index> newvalue = { ( <map_info> [ <index> ] ) 
				dot_count = <slot> 
				dots = ( <index_array> ) 
			} 
		ELSE 
			SetArrayElement ArrayName = map_info index = <index> newvalue = { ( <map_info> [ <index> ] ) 
				dot_count = 0 
			} 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <slice_size> 
ENDSCRIPT

SCRIPT level_select_build_map 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor 
		id = map_anchor 
		pos = PAIR(45.00000000000, 90.00000000000) 
		z_priority = -50 
	} 
	IF GameModeEquals is_career 
		CreateScreenElement { 
			type = SpriteElement 
			parent = map_anchor 
			local_id = logo 
			texture = WDT_logo 
			pos = PAIR(280.00000000000, 270.00000000000) 
			rgba = [ 128 128 128 128 ] 
			just = [ center center ] 
			scale = 2 
			z_priority = 50 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_anchor 
		local_id = highlight 
		texture = level_highlight 
		pos = PAIR(110.00000000000, 100.00000000000) 
		rgba = [ 128 128 128 70 ] 
		just = [ center center ] 
		scale = 8 
		z_priority = 50 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = map_anchor 
		id = map_mask 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = map_anchor 
		id = map_circle_mask 
		pos = PAIR(73.00000000000, 75.00000000000) 
		scale = 1.13999998569 
	} 
	mask_color = [ 0 0 0 128 ] 
	fade_color = [ 0 0 0 50 ] 
	pop_color = [ 128 0 0 128 ] 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_circle_mask 
		local_id = corner_tl 
		texture = level_corner 
		pos = PAIR(0.00000000000, 0.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		scale = 1 
		rot_angle = -90 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_circle_mask 
		local_id = corner_tr 
		texture = level_corner 
		pos = PAIR(128.00000000000, 0.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		scale = 1 
		rot_angle = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_circle_mask 
		local_id = corner_br 
		texture = level_corner 
		pos = PAIR(128.00000000000, 128.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		scale = 1 
		rot_angle = 90 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_circle_mask 
		local_id = corner_bl 
		texture = level_corner 
		pos = PAIR(0.00000000000, 128.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		scale = 1 
		rot_angle = 180 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_circle_mask 
		local_id = corner_tr 
		texture = level_corner 
		pos = PAIR(100.00000000000, 0.00000000000) 
		rgba = <fade_color> 
		just = [ center center ] 
		scale = 1 
		rot_angle = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_circle_mask 
		local_id = corner_br 
		texture = level_corner 
		pos = PAIR(100.00000000000, 128.00000000000) 
		rgba = <fade_color> 
		just = [ center center ] 
		scale = 1 
		rot_angle = 90 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = white2 
		pos = PAIR(259.50000000000, 0.00000000000) 
		scale = PAIR(15.00000000000, 34.00000000000) 
		rgba = <fade_color> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = white2 
		pos = PAIR(-50.00000000000, 0.00000000000) 
		scale = PAIR(6.30000019073, 34.00000000000) 
		rgba = <mask_color> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = white2 
		pos = PAIR(290.00000000000, 0.00000000000) 
		scale = PAIR(15.00000000000, 34.00000000000) 
		rgba = <mask_color> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = white2 
		pos = PAIR(294.00000000000, 0.00000000000) 
		scale = PAIR(15.00000000000, 34.00000000000) 
		rgba = <mask_color> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(-41.00000000000, 268.00000000000) 
		scale = PAIR(1.50000000000, 2.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 11 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(70.00000000000, 292.00000000000) 
		scale = PAIR(1.29999995232, 0.80000001192) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 15 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = white2 
		pos = PAIR(100.00000000000, 293.00000000000) 
		scale = PAIR(10.00000000000, 1.50000000000) 
		rgba = <mask_color> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(180.00000000000, 300.00000000000) 
		scale = PAIR(1.39999997616, 0.50000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = -8 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(300.00000000000, 290.00000000000) 
		scale = PAIR(1.14999997616, 1.39999997616) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(340.00000000000, 270.00000000000) 
		scale = PAIR(1.00000000000, 2.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 15 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch_2 
		pos = PAIR(460.00000000000, 165.00000000000) 
		scale = PAIR(3.40000009537, 4.50000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = -5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(430.00000000000, 65.00000000000) 
		scale = PAIR(1.00000000000, 3.00000000000) 
		rgba = [ 60 60 60 28 ] 
		just = [ center center ] 
		rot_angle = -20 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(480.00000000000, 50.00000000000) 
		scale = PAIR(2.00000000000, 1.00000000000) 
		rgba = [ 0 0 0 118 ] 
		just = [ center center ] 
		rot_angle = -4 
		z_priority = -2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(340.00000000000, 35.00000000000) 
		scale = PAIR(0.50000000000, 1.50000000000) 
		rgba = [ 60 60 60 20 ] 
		just = [ center center ] 
		rot_angle = -20 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(350.00000000000, 260.00000000000) 
		scale = PAIR(1.79999995232, 1.60000002384) 
		rgba = [ 60 60 60 15 ] 
		just = [ center center ] 
		rot_angle = -10 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(-80.00000000000, 45.00000000000) 
		scale = PAIR(1.20000004768, 5.00000000000) 
		rgba = [ 60 60 60 28 ] 
		just = [ center center ] 
		rot_angle = -240 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(-100.00000000000, 205.00000000000) 
		scale = PAIR(1.20000004768, 5.00000000000) 
		rgba = [ 60 60 60 18 ] 
		just = [ center center ] 
		rot_angle = -240 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(410.00000000000, 185.00000000000) 
		scale = PAIR(1.79999995232, 4.40000009537) 
		rgba = [ 60 60 60 22 ] 
		just = [ center center ] 
		rot_angle = 150 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(490.00000000000, 254.00000000000) 
		scale = PAIR(1.20000004768, 0.69999998808) 
		rgba = [ 60 60 60 18 ] 
		just = [ center center ] 
		rot_angle = 170 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_anchor 
		local_id = highlight 
		texture = level_highlight 
		pos = PAIR(200.00000000000, 220.00000000000) 
		rgba = [ 128 128 128 30 ] 
		just = [ center center ] 
		scale = 8 
		z_priority = 50 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(360.00000000000, 0.00000000000) 
		scale = PAIR(2.00000000000, 3.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(200.00000000000, -5.00000000000) 
		scale = PAIR(1.00000000000, 1.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 18 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(200.00000000000, -15.00000000000) 
		scale = PAIR(1.00000000000, 1.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = -5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = white2 
		pos = PAIR(180.00000000000, -4.00000000000) 
		scale = PAIR(20.00000000000, 2.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(80.00000000000, -5.00000000000) 
		scale = PAIR(1.00000000000, 1.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = -10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch 
		pos = PAIR(-8.00000000000, 0.00000000000) 
		scale = PAIR(1.00000000000, 3.00000000000) 
		rgba = <mask_color> 
		just = [ center center ] 
		rot_angle = 20 
	} 
	level_select_calculate_dots level_list = <level_list> 
	SpawnScript level_select_spin_globe params = { <...> } 
ENDSCRIPT

SCRIPT get_num_levels_unlocked 
	GetArraySize level_select_menu_level_info 
	<num_unlocked> = 0 
	<index> = 0 
	BEGIN 
		IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_sk5ed_gameplay ) 
			IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_TestLevel ) 
				IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_Default ) 
					IF NOT StructureContains structure = ( ( level_select_menu_level_info [ <index> ] ) ) DEVKIT_ONLY 
						<level_num> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
						IF GetGlobalFlag flag = ( ( level_select_menu_level_info [ <index> ] ) . flag ) 
							<num_unlocked> = ( <num_unlocked> + 1 ) 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT ( <array_size> ) 
	RETURN num_unlocked = <num_unlocked> 
ENDSCRIPT

SCRIPT level_select_should_use_seen_flags 
	IF NOT GameModeEquals is_career 
		IF NOT GameModeEquals is_classic 
			use_seen_flags = 1 
		ENDIF 
	ENDIF 
	RETURN use_seen_flags = <use_seen_flags> 
ENDSCRIPT

level_select_item_current_index = 0 
SCRIPT level_select_menu_add_item width = 100 height = 30 scale = 1 created_park_number = LevelNum_Sk5ed 
	IF GotParam unlocked_with_se2 
		IF ( all_levels_unlocked = 0 ) 
			IF NOT GetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam spacer 
		width = ( <width> * 0.55000001192 ) 
	ENDIF 
	IF NOT GotParam sign_texture 
		height = ( <height> * 0.69999998808 ) 
	ENDIF 
	IF CD 
		IF GotParam DEVKIT_ONLY 
			RETURN 
		ENDIF 
		IF ( ( GameModeEquals is_career ) & ( <level_num> = <created_park_number> ) ) 
			RETURN 
		ENDIF 
	ENDIF 
	level_select_should_use_seen_flags 
	IF GotParam use_seen_flags 
		IF GotParam seen_flag 
			flag = <seen_flag> 
			RemoveParameter hide_when_locked 
		ENDIF 
	ENDIF 
	RemoveParameter use_seen_flags 
	<pad_choose_script> = level_select_valid_choice 
	<can_afford_level> = 0 
	<in_locked_group> = 0 
	locked = 0 
	IF GotParam force_locked 
		locked = 1 
		sign_texture = sign_locked 
		level_callback_script = level_select_invalid_choice 
	ELSE 
		IF IntegerEquals a = all_levels_unlocked b = 1 
			IF ( <level_num> = <created_park_number> ) 
				level_callback_script = level_select_created_park_menu 
			ELSE 
				IF ( in_server_options = 1 ) 
					level_callback_script = level_select_menu_exit 
				ELSE 
					level_callback_script = level_select_change_level 
				ENDIF 
			ENDIF 
			<locked> = 0 
		ELSE 
			IF NOT GetGlobalFlag flag = <flag> 
				locked = 1 
			ENDIF 
			IF ( <locked> = 0 ) 
				
				IF ( <level_num> = <created_park_number> ) 
					level_callback_script = level_select_created_park_menu 
				ELSE 
					IF ( in_server_options = 1 ) 
						level_callback_script = level_select_menu_exit 
					ELSE 
						level_callback_script = level_select_change_level 
					ENDIF 
				ENDIF 
			ELSE 
				text = "??????????" 
				sign_texture = sign_locked 
				level_callback_script = level_select_invalid_choice 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam hide_when_locked 
		IF ( <locked> = 1 ) 
			RETURN 
		ENDIF 
	ENDIF 
	pad_choose_params = <...> 
	IF GameModeEquals is_career 
		IF CD 
			RemoveParameter new_vmenu 
		ENDIF 
	ENDIF 
	change level_select_item_current_index = ( ( level_select_item_current_index ) + 1 ) 
	IF GotParam new_vmenu 
		CreateScreenElement { 
			type = VMenu 
			parent = current_menu 
			event_handlers = [ { pad_down level_select_maybe_play_vert_sound params = { down } } 
				{ pad_up level_select_maybe_play_vert_sound params = { up } } 
			] 
			dims = ( <width> * PAIR(1.00000000000, 0.00000000000) ) 
			not_focusable 
		} 
		<id> : SetTags tag_grid_x = ( level_select_item_current_index ) 
		current_menu : SetTags item_parent = <id> 
		item_parent = <id> 
	ELSE 
		IF GotParam hold_vmenu 
			current_menu : GetSingleTag item_parent 
		ELSE 
			item_parent = current_menu 
		ENDIF 
	ENDIF 
	IF ( <locked> = 1 ) 
		focus = not_focusable 
	ELSE 
		focus = { focusable } 
		SetScreenElementProps id = <item_parent> focusable 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <item_parent> 
		pos = ( <width> * PAIR(0.50000000000, 0.00000000000) ) 
		dims = ( <height> * PAIR(0.00000000000, 1.00000000000) + <width> * PAIR(1.00000000000, 0.00000000000) ) 
		just = [ center center ] 
		event_handlers = [ { pad_choose generic_menu_pad_choose_sound } 
			{ pad_start generic_menu_pad_choose_sound } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			{ focus sign_focus } 
			{ focus level_select_update_screen params = <pad_choose_params> } 
			{ unfocus sign_unfocus } 
		] 
		<focus> 
	} 
	IF GotParam spacer 
		RETURN 
	ENDIF 
	IF NOT GotParam new_vmenu 
		<id> : SetTags tag_grid_x = ( level_select_item_current_index ) 
	ENDIF 
	IF ( <locked> = 0 ) 
		IF GotParam level 
			IF NOT GotParam DEVKIT_ONLY 
				IF ( <level> = ( level_select_last_level_played ) ) 
					change level_select_focus_target1 = ( level_select_item_current_index ) 
					IF GameModeEquals is_classic 
						IF StructureContains structure = ( <level_list> [ <first_matching_index> ] ) level 
							IF NOT ( ( ( <level_list> [ <first_matching_index> ] ) . level ) = <level> ) 
								change level_select_focus_target2 = <item_parent> 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	container_id = <id> 
	Theme_GetPauseBarColor return_value = bar_color 
	IF GotParam sign_texture 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			local_id = sign 
			texture = <sign_texture> 
			pos = ( <height> * PAIR(0.00000000000, 0.50000000000) ) 
			rgba = <bar_color> 
			alpha = 0.50000000000 
			just = [ center center ] 
			scale = <scale> 
			z_priority = 1 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <id> 
			local_id = shadow 
			texture = sign_locked 
			pos = PAIR(34.00000000000, 36.00000000000) 
			rgba = [ 0 0 0 128 ] 
			alpha = 0 
			just = [ center center ] 
			scale = 1.04999995232 
			z_priority = -1 
		} 
	ELSE 
		CreateScreenElement { 
			type = TextElement 
			parent = <container_id> 
			local_id = text 
			text = <text> 
			font = small 
			pos = ( <height> * PAIR(0.00000000000, 0.50000000000) + PAIR(-25.00000000000, 0.00000000000) ) 
			rgba = <bar_color> 
			alpha = 0.50000000000 
			just = [ left center ] 
			scale = 1 
			z_priority = 1 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
		} 
	ENDIF 
	RETURN container_id = <container_id> 
ENDSCRIPT

SCRIPT add_bracket type = 0 state = off 
	SWITCH <type> 
		CASE 1 
			pos = PAIR(-6.50000000000, 15.00000000000) 
		CASE 2 
			pos = PAIR(-5.50000000000, 0.00000000000) 
			angle = flip_v 
	ENDSWITCH 
	IF GotParam reverse 
		pos = ( <pos> + PAIR(-26.00000000000, 0.00000000000) ) 
		angle = { <angle> flip_h } 
	ENDIF 
	SWITCH <state> 
		CASE off 
			rgba = [ 50 60 110 110 ] 
			z_priority = 0 
			alpha = 1 
		CASE unlocked 
			rgba = [ 128 128 128 128 ] 
			z_priority = 9 
			alpha = 0.80000001192 
		CASE beaten 
			Theme_GetMenuTitleColor return_value = rgba 
			alpha = 0.89999997616 
			z_priority = 10 
	ENDSWITCH 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		texture = level_bracket 
		pos = <pos> 
		rgba = <rgba> 
		alpha = <alpha> 
		just = [ right top ] 
		scale = PAIR(1.20000004768, 0.55000001192) 
		z_priority = <z_priority> 
		<angle> 
	} 
ENDSCRIPT

SCRIPT level_select_get_bracket_status 
	IF NOT GotParam bracket 
		RETURN 
	ENDIF 
	IF ( <bracket> > classic_mode_max_bracket ) 
		RETURN 
	ENDIF 
	IF ( <bracket> < 1 ) 
		IF NOT GotParam show_all 
			RETURN 
		ENDIF 
	ENDIF 
	bracket_exists = bracket_exists 
	FormatText ChecksumName = bracket_flag "LEVEL_BRACKET_UNLOCKED_%a" a = ( <bracket> + 1 ) 
	IF ( ( GetGlobalFlag flag = <bracket_flag> ) | ( all_levels_unlocked = 1 ) ) 
		unlocked = unlocked 
	ENDIF 
	level_select_get_bracket_size bracket = <bracket> level_list = <level_list> 
	GetClassicModeTargetGoalsComplete 
	IF ( <bracket_size> = 2 ) 
		GetClassicLevelGoalCount level = ( ( <level_list> [ <first_matching_index> ] ) . level_num ) 
		IF NOT ( <classic_goal_count> < <target_goals_complete> ) 
			beaten = { beaten beaten_top } 
		ENDIF 
		GetClassicLevelGoalCount level = ( ( <level_list> [ ( <first_matching_index> + 1 ) ] ) . level_num ) 
		IF NOT ( <classic_goal_count> < <target_goals_complete> ) 
			beaten = { <beaten> beaten beaten_bottom } 
		ENDIF 
	ELSE 
		IF ( <bracket_size> = 1 ) 
			GetClassicLevelGoalCount level = ( ( <level_list> [ <first_matching_index> ] ) . level_num ) 
			IF NOT ( <classic_goal_count> < <target_goals_complete> ) 
				beaten = beaten 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN { <unlocked> <beaten> <bracket_exists> } 
ENDSCRIPT

SCRIPT level_select_get_bracket_size 
	IF ( <bracket> > classic_mode_max_bracket ) 
		RETURN bracket_size = 0 
	ENDIF 
	IF ( <bracket> < 0 ) 
		RETURN bracket_size = 0 
	ENDIF 
	GetArraySize <level_list> 
	count = 0 
	index = <bracket> 
	BEGIN 
		IF StructureContains structure = ( <level_list> [ <index> ] ) bracket 
			this_bracket = ( ( <level_list> [ <index> ] ) . bracket ) 
			IF ( <this_bracket> = <bracket> ) 
				count_me = 1 
				IF GotParam unlocked_with_se2 
					IF ( all_levels_unlocked = 0 ) 
						IF NOT GetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 
							count_me = 0 
							
						ENDIF 
					ENDIF 
				ENDIF 
				IF ( <count_me> = 1 ) 
					count = ( <count> + 1 ) 
					IF NOT GotParam first_matching_index 
						first_matching_index = <index> 
					ENDIF 
				ENDIF 
			ELSE 
				IF ( <this_bracket> > <bracket> ) 
					RETURN { bracket_size = <count> first_matching_index = <first_matching_index> } 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
		IF ( <index> = <array_size> ) 
			RETURN { bracket_size = <count> first_matching_index = <first_matching_index> } 
		ENDIF 
	REPEAT <array_size> 
	RETURN { bracket_size = <count> first_matching_index = <first_matching_index> } 
ENDSCRIPT

SCRIPT level_select_menu_add_bracket 
	level_select_get_bracket_size bracket = <bracket> level_list = <level_list> 
	IF ( <bracket_size> = 1 ) 
		level_select_menu_add_item <...> ( <level_list> [ <index> ] ) 
	ELSE 
		level_select_menu_add_item <...> ( <level_list> [ <index> ] ) new_vmenu 
		top_id = <container_id> 
		level_select_menu_add_item <...> ( <level_list> [ ( <index> + 1 ) ] ) hold_vmenu 
		bottom_id = <container_id> 
	ENDIF 
	level_select_get_bracket_status bracket = <bracket> level_list = <level_list> 
	IF GotParam bracket_exists 
		IF ( <bracket_size> = 1 ) 
			IF NOT GotParam unlocked 
				add_bracket id = <container_id> type = 1 state = off 
				add_bracket id = <container_id> type = 2 state = off 
			ELSE 
				IF NOT GotParam beaten 
					add_bracket id = <container_id> type = 1 state = unlocked 
					add_bracket id = <container_id> type = 2 state = unlocked 
				ELSE 
					IF GotParam beaten 
						level_select_get_bracket_status bracket = ( <bracket> -1 ) level_list = <level_list> 
						IF GotParam beaten_top 
							add_bracket id = <container_id> type = 2 state = beaten 
						ELSE 
							add_bracket id = <container_id> type = 2 state = unlocked 
						ENDIF 
						IF GotParam beaten_bottom 
							add_bracket id = <container_id> type = 1 state = beaten 
						ELSE 
							add_bracket id = <container_id> type = 1 state = unlocked 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT GotParam unlocked 
				add_bracket id = <top_id> type = 1 state = off 
				add_bracket id = <bottom_id> type = 2 state = off 
			ELSE 
				IF NOT GotParam beaten 
					add_bracket id = <top_id> type = 1 state = unlocked 
					add_bracket id = <bottom_id> type = 2 state = unlocked 
				ELSE 
					IF GotParam beaten 
						IF GotParam beaten_top 
							add_bracket id = <top_id> type = 1 state = beaten 
						ELSE 
							add_bracket id = <top_id> type = 1 state = unlocked 
						ENDIF 
						IF GotParam beaten_bottom 
							add_bracket id = <bottom_id> type = 2 state = beaten 
						ELSE 
							add_bracket id = <bottom_id> type = 2 state = unlocked 
						ENDIF 
					ENDIF 
				ENDIF 
				IF ( <bracket> = 8 ) 
					IF ( ( GetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 ) | ( all_levels_unlocked = 1 ) ) 
						RemoveParameter beaten_top 
						RemoveParameter beaten_bottom 
						level_select_get_bracket_status bracket = ( <bracket> -1 ) level_list = <level_list> 
						IF GotParam beaten_top 
							add_bracket id = <top_id> type = 1 state = beaten reverse 
						ELSE 
							add_bracket id = <top_id> type = 1 state = unlocked reverse 
						ENDIF 
						IF GotParam beaten_bottom 
							add_bracket id = <bottom_id> type = 2 state = beaten reverse 
						ELSE 
							add_bracket id = <bottom_id> type = 2 state = unlocked reverse 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT network_level_select_pad_back 
	<net_pad_back> = 1 
	level_select_menu_exit <...> 
ENDSCRIPT

SCRIPT kill_level_select_scripts 
	level_select_get_info_panel_script 
	KillSpawnedScript name = level_select_build_info_panel_common_bits 
	KillSpawnedScript name = <info_panel_script> 
	KillSpawnedScript name = level_select_build_title 
	KillSpawnedScript name = level_select_spin_globe 
	KillSpawnedScript name = show_active_globe_dot 
	KillSpawnedScript name = globe_dot_highlight_pulse 
ENDSCRIPT

SCRIPT level_select_menu_exit 
	kill_level_select_scripts 
	kill_level_select_cams 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		load_level_select_textures_to_main_memory unload 
	ENDIF 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
	ENDIF 
	IF GotParam no_new_menu 
		unhide_current_goal 
		RETURN 
	ENDIF 
	IF LevelIs Load_MainMenu 
		GoalManager_HideGoalPoints 
		IF ( in_server_options = 1 ) 
			IF NOT GotParam net_pad_back 
				net_pad_back = 0 
			ENDIF 
			IF ( <net_pad_back> = 0 ) 
				prefs = network 
				field = "level" 
				string = <text> 
				checksum = <level> 
				select_host_option <...> 
			ENDIF 
			IF ObjectExists id = host_options_menu 
				DestroyScreenElement id = host_options_menu 
			ENDIF 
			KillSkaterCamAnim all 
			create_network_host_options_menu 
		ELSE 
			GetGameMode 
			SWITCH <GameMode> 
				CASE career 
					create_gamemode_options_menu 
				CASE freeskate 
				CASE singlesession 
				CASE creategoals 
				CASE classic 
					launch_ss_menu <...> no_animate 
			ENDSWITCH 
		ENDIF 
	ELSE 
		IF GotParam end_run 
			create_end_run_menu 
		ELSE 
			GoalManager_ShowPoints 
			IF GoalManager_HasActiveGoals 
				GoalManager_HideGoalPoints 
				IF ScreenElementExists id = current_goal 
					DoScreenElementMorph { 
						id = current_goal 
						restore_alpha 
					} 
				ENDIF 
				IF ScreenElementExists id = current_goal_key_combo_text 
					DoScreenElementMorph { 
						id = current_goal_key_combo_text 
						restore_alpha 
					} 
				ENDIF 
			ELSE 
				GoalManager_ShowGoalPoints 
			ENDIF 
			create_pause_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

created_park_warning = 0 
SCRIPT level_select_created_park_menu 
	level_menu : GetSingleTag from_server_options 
	DoScreenElementMorph id = level_select_info_panel time = 0 alpha = 0 
	make_new_skateshop_menu { 
		parent = level_select_anchor_middle 
		pos = PAIR(620.00000000000, 120.00000000000) 
		internal_just = [ left center ] 
		menu_id = created_park_menu 
		vmenu_id = created_park_vmenu 
		menu_title = "" 
	} 
	DoScreenElementMorph id = created_park_menu pos = PAIR(720.00000000000, 240.00000000000) time = 0.00000000000 
	theme_background parent = created_park_menu id = created_park_bg width = 1.50000000000 pos = PAIR(710.00000000000, 106.00000000000) num_parts = 3 z_priority = 1 dark_menu = dark_menu static = static 
	kill_start_key_binding 
	IF GotParam show_warning 
		change created_park_warning = 1 
	ENDIF 
	GetCustomParkName 
	IF ( <name> = "" ) 
		<name> = "Unnamed park" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = created_park_menu 
		pos = PAIR(710.00000000000, 110.00000000000) 
		font = dialog 
		text = <name> 
		just = [ center top ] 
		scale = 1 
		rgba = [ 128 128 128 80 ] 
		not_focusable 
		z_priority = 2 
	} 
	truncate_string id = <id> max_width = 200 
	CreateScreenElement { 
		type = SpriteElement 
		parent = created_park_menu 
		texture = black 
		pos = PAIR(710.00000000000, 109.00000000000) 
		rgba = [ 0 0 0 60 ] 
		scale = PAIR(52.00000000000, 7.00000000000) 
		just = [ center top ] 
		z_priority = 2 
	} 
	SetScreenElementProps { 
		id = created_park_vmenu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back_sound } 
			{ pad_back level_select_created_park_menu_exit params = { from_server_options = <from_server_options> } } 
		] 
		replace_handlers 
	} 
	IF GotParam from_server_options 
		created_park_menu_add_item { text = #"Play Park" 
			id = created_park_play_park 
			pad_choose_script = created_park_launch 
			pad_choose_params = { from_server_options } 
		} 
	ELSE 
		created_park_menu_add_item { text = #"Play Park" 
			id = created_park_play_park 
			pad_choose_script = created_park_launch 
			pad_choose_params = { } 
		} 
	ENDIF 
	IF GotParam from_server_options 
		created_park_menu_add_item { text = #"Load Park" 
			id = created_park_load_park 
			pad_choose_script = confirm_load_park 
			pad_choose_params = { load_park from_server_options } 
		} 
	ELSE 
		created_park_menu_add_item { text = #"Load Park" 
			id = created_park_load_park 
			pad_choose_script = confirm_load_park 
			pad_choose_params = { load_park } 
		} 
	ENDIF 
	IF GotParam from_server_options 
		created_park_menu_add_item { text = #"Pre-Made Parks" 
			id = created_park_premade 
			pad_choose_script = level_select_created_park_menu_exit 
			pad_choose_params = { park_list from_server_options } 
		} 
	ELSE 
		created_park_menu_add_item { text = #"Pre-Made Parks" 
			id = created_park_premade 
			pad_choose_script = level_select_created_park_menu_exit 
			pad_choose_params = { park_list } 
		} 
	ENDIF 
	created_park_menu_add_item { text = #"back" 
		id = created_park_back 
		pad_choose_script = level_select_created_park_menu_exit 
		pad_choose_params = { } 
	} 
	fireevent type = unfocus target = level_menu 
	fireevent type = focus target = created_park_vmenu 
	SetButtonEventMappings block_menu_input 
	DoScreenElementMorph id = created_park_menu pos = PAIR(320.00000000000, 240.00000000000) time = 0.15000000596 
	wait 0.10000000149 seconds 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT created_park_menu_add_item 
	highlight_bar_scale = PAIR(1.60000002384, 0.69999998808) 
	centered = centered 
	no_bg = no_bg 
	theme_menu_add_item <...> 
ENDSCRIPT

SCRIPT created_park_launch 
	IF ( in_server_options = 1 ) 
		GetParkEditorMaxPlayers 
		GetNetworkNumPlayers 
		IF inNetGame 
			IF ( <num_players> > <MaxPlayers> ) 
				level_select_created_park_menu_exit from_server_options 
				kill_level_select_scripts 
				IF ObjectExists id = current_menu_anchor 
					DestroyScreenElement id = current_menu_anchor 
				ENDIF 
				load_level_select_textures_to_main_memory unload 
				goto mcmess_ErrorbadParkMaxPlayers params = { num_players = <num_players> MaxPlayers = <MaxPlayers> back_script = return_to_created_park_menu back_params = { from_server_options } } 
			ENDIF 
		ENDIF 
	ENDIF 
	GetParkEditorMaxPlayers 
	GetNetworkNumPlayers 
	IF inNetGame 
		IF ( <num_players> > <MaxPlayers> ) 
			level_select_created_park_menu_exit from_server_options 
			kill_level_select_scripts 
			IF ObjectExists id = current_menu_anchor 
				DestroyScreenElement id = current_menu_anchor 
			ENDIF 
			load_level_select_textures_to_main_memory unload 
			goto mcmess_ErrorbadParkMaxPlayers params = { num_players = <num_players> MaxPlayers = <MaxPlayers> back_script = return_to_created_park_menu back_params = { from_server_options } } 
		ENDIF 
	ENDIF 
	IF ( in_server_options = 1 ) 
		level_select_created_park_menu_exit from_server_options 
		level = load_sk5ed_gameplay 
		string = "Created Park" 
		level_select_menu_exit from_server_options net_pad_back = 0 <...> 
	ELSE 
		IF inNetGame 
			change created_park_warning = 0 
			level_select_change_level level = load_sk5ed_gameplay <...> show_warning 
		ELSE 
			level_select_change_level level = load_sk5ed_gameplay <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT confirm_load_park 
	level_select_created_park_menu_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	load_level_select_textures_to_main_memory unload 
	IF GotParam from_server_options 
		change still_in_net_area = 1 
		IF IsParkUnsaved 
			menu_confirm_quit { yes_script = launch_level_select_load_park_sequence 
				title = "Replace unsaved park?" 
				text_dims = PAIR(330.00000000000, 0.00000000000) 
				back_script = return_to_created_park_menu 
				no_script = return_to_created_park_menu 
				params = { from_server_options } 
			} 
		ELSE 
			launch_level_select_load_park_sequence 
		ENDIF 
	ELSE 
		IF IsParkUnsaved 
			IF LevelIs Load_MainMenu 
				no_animate = no_animate 
			ENDIF 
			menu_confirm_quit { yes_script = launch_level_select_load_park_sequence 
				title = "Replace unsaved park?" 
				text_dims = PAIR(330.00000000000, 0.00000000000) 
				no_animate = <no_animate> 
				back_script = return_to_created_park_menu 
				no_script = return_to_created_park_menu 
			} 
		ELSE 
			launch_level_select_load_park_sequence 
		ENDIF 
	ENDIF 
	IF LevelIs Load_MainMenu 
		skater : hide 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim skater = 0 name = mainmenu_camera03 play_hold 
	ENDIF 
ENDSCRIPT

still_in_net_area = 0 
SCRIPT return_to_created_park_menu 
	dialog_box_exit 
	kill_start_key_binding 
	launch_level_select_menu <...> 
ENDSCRIPT

SCRIPT level_select_created_park_menu_exit 
	IF GotParam park_list 
		level_select_created_park_list <...> 
	ELSE 
		SetButtonEventMappings block_menu_input 
		wait 0.20000000298 seconds 
		DoScreenElementMorph id = created_park_menu pos = PAIR(420.00000000000, 240.00000000000) time = 0.10000000149 
		wait 0.10000000149 seconds 
		SetButtonEventMappings unblock_menu_input 
		IF ObjectExists id = created_park_menu 
			DestroyScreenElement id = created_park_menu 
		ENDIF 
		IF ObjectExists id = premade_park_menu 
			DestroyScreenElement id = premade_park_menu 
		ENDIF 
	ENDIF 
	IF GotParam launch_level 
		
	ENDIF 
	IF GotParam load_park 
		
	ENDIF 
	IF NOT GotParam park_list 
		AssignAlias id = level_select_anchor alias = current_menu_anchor 
		AssignAlias id = level_menu alias = current_menu 
		IF ScreenElementExists id = level_menu 
			level_menu : SetProps unblock_events 
		ENDIF 
		DoScreenElementMorph id = level_select_info_panel time = 0 alpha = 1 
		fireevent type = focus target = level_menu 
	ENDIF 
ENDSCRIPT

g_hack_push_topdownheap = 0 
SCRIPT level_select_created_park_list 
	
	IF isNgc 
		change g_hack_push_topdownheap = 1 
	ENDIF 
	dialog_box_exit 
	IF ScreenElementExists id = level_select_anchor_middle 
		dark_menu = dark_menu 
		delta_pos = PAIR(0.00000000000, 0.00000000000) 
		parent = level_select_anchor_middle 
	ELSE 
		IF ObjectExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		delta_pos = PAIR(-400.00000000000, 0.00000000000) 
		parent = root_window 
	ENDIF 
	IF GotParam in_park_editor 
		make_new_themed_scrolling_menu title = "PRE-MADE PARKS" 
	ELSE 
		make_new_skateshop_menu { 
			parent = <parent> 
			pos = ( PAIR(620.00000000000, 100.00000000000) + <delta_pos> ) 
			dims = PAIR(200.00000000000, 191.00000000000) 
			internal_just = [ left center ] 
			menu_id = premade_park_menu 
			scrolling_menu_id = premade_park_scrolling_menu 
			vmenu_id = premade_park_vmenu 
			menu_title = "PRE-MADE" 
			type = VScrollingMenu 
			scrolling_menu_title_id = "" 
			dont_allow_wrap = dont_allow_wrap 
			padding_scale = 0.89999997616 
		} 
		IF ScreenElementExists id = level_select_anchor_middle 
			DoScreenElementMorph id = premade_park_menu pos = PAIR(320.00000000000, 640.00000000000) 
		ENDIF 
	ENDIF 
	kill_start_key_binding 
	IF NOT GotParam in_park_editor 
		theme_background parent = premade_park_menu id = premade_park_bg width = 1.50000000000 pos = ( PAIR(710.00000000000, 106.00000000000) + <delta_pos> ) num_parts = 7.50000000000 z_priority = 1 dark_menu = <dark_menu> static = static 
	ENDIF 
	IF GotParam in_park_editor 
		create_helper_text generic_helper_text 
	ENDIF 
	IF GotParam from_server_options 
		pad_back_params = { from_server_options } 
	ELSE 
		pad_back_params = { } 
	ENDIF 
	IF NOT GotParam in_park_editor 
		SetScreenElementProps { 
			id = premade_park_vmenu 
			event_handlers = [ { pad_back generic_menu_pad_back params = { callback = level_select_created_park_list_exit <pad_back_params> } } ] 
			replace_handlers 
		} 
	ELSE 
		SetScreenElementProps { 
			id = sub_menu 
			event_handlers = [ { pad_back generic_menu_pad_back params = { callback = level_select_created_park_list_exit <...> } } ] 
			replace_handlers 
		} 
	ENDIF 
	GetArraySize premade_parks_info 
	index = 0 
	BEGIN 
		created_park_menu_add_item { text = ( premade_parks_info [ <index> ] . name ) 
			pad_choose_script = maybe_load_premade_park 
			pad_choose_params = { <pad_back_params> slot = ( premade_parks_info [ <index> ] . slot ) max = ( premade_parks_info [ <index> ] . max ) } 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ScreenElementExists id = level_menu 
		fireevent type = unfocus target = level_menu 
	ENDIF 
	IF ScreenElementExists id = level_select_anchor_middle 
		SetButtonEventMappings block_menu_input 
		DoScreenElementMorph id = premade_park_menu pos = PAIR(720.00000000000, 240.00000000000) time = 0 
		DoScreenElementMorph id = created_park_menu pos = PAIR(720.00000000000, 240.00000000000) time = 0.15000000596 
		wait 0.25000000000 seconds 
		DoScreenElementMorph id = premade_park_menu pos = PAIR(320.00000000000, 240.00000000000) time = 0.30000001192 
		wait 0.25000000000 seconds 
		fireevent type = unfocus target = created_park_vmenu 
		fireevent type = focus target = premade_park_vmenu 
		SetButtonEventMappings unblock_menu_input 
	ENDIF 
	IF GotParam in_park_editor 
		theme_menu_add_item text = "Done" id = menu_done scale = 1.00000000000 pad_choose_script = create_pause_menu no_bg highlight_bar_scale = PAIR(1.70000004768, 0.80000001192) 
		finish_themed_scrolling_menu bg_width = 1.50000000000 time = 0.20000000298 
	ENDIF 
	IF isNgc 
		change g_hack_push_topdownheap = 0 
	ENDIF 
ENDSCRIPT

SCRIPT maybe_load_premade_park 
	GetNetworkNumPlayers 
	IF inNetGame 
		IF ( <num_players> > <max> ) 
			level_select_created_park_menu_exit from_server_options 
			kill_level_select_scripts 
			IF ObjectExists id = current_menu_anchor 
				DestroyScreenElement id = current_menu_anchor 
			ENDIF 
			load_level_select_textures_to_main_memory unload 
			goto mcmess_ErrorbadParkMaxPlayers params = { num_players = <num_players> MaxPlayers = <max> back_script = return_to_created_park_menu back_params = { from_server_options } } 
		ENDIF 
	ENDIF 
	level_select_created_park_list_exit <...> 
ENDSCRIPT

SCRIPT level_select_created_park_list_exit 
	IF ObjectExists id = level_select_anchor 
		IF NOT GotParam slot 
			SetButtonEventMappings block_menu_input 
			DoScreenElementMorph id = premade_park_menu pos = PAIR(720.00000000000, 240.00000000000) time = 0.30000001192 
			wait 0.25000000000 seconds 
			DoScreenElementMorph id = created_park_menu pos = PAIR(320.00000000000, 240.00000000000) time = 0.15000000596 
			wait 0.25000000000 seconds 
			fireevent type = focus target = created_park_vmenu 
			SetButtonEventMappings unblock_menu_input 
			AssignAlias id = level_select_anchor alias = current_menu_anchor 
		ENDIF 
	ELSE 
		in_park_ed = 1 
	ENDIF 
	IF ObjectExists id = premade_park_menu 
		DestroyScreenElement id = premade_park_menu 
	ENDIF 
	IF GotParam slot 
		
		IF GotParam in_park_ed 
			
			parked_load_from_disk slot = <slot> 
		ELSE 
			IF GotParam from_server_options 
				LoadParkFromDisk slot = <slot> block_rebuild 
				created_park_launch from_server_options 
			ELSE 
				LoadParkFromDisk slot = <slot> block_rebuild 
				created_park_launch 
			ENDIF 
		ENDIF 
	ELSE 
		IF GotParam in_park_editor 
			create_pause_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT kill_level_select_cams 
	IF LevelIs Load_MainMenu 
		KillSkaterCamAnim name = level_select_cam 
	ENDIF 
ENDSCRIPT

SCRIPT really_change_level 
	IF OnServer 
		change_level <...> 
	ELSE 
		IF IsHost 
			FCFSRequestChangeLevel <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

return_to_level = [ null ] 
SCRIPT level_select_change_level 
	GoalManager_ShowPoints 
	IF NOT GoalManager_HasActiveGoals 
		GoalManager_ShowGoalPoints 
	ENDIF 
	IF ScreenElementExists id = level_select_anchor 
		DestroyScreenElement id = level_select_anchor 
		load_level_select_textures_to_main_memory unload 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF LevelIs load_sk5ed 
		load_parked_textures_to_main_memory unload 
	ENDIF 
	IF LevelIs Load_MainMenu 
		SetColorBufferClear clear = 0 
	ENDIF 
	IF LevelIs load_sk5ed_gameplay 
		RailEditor : DestroyEditedRailSectors DoNotUpdateSuperSectors 
	ENDIF 
	kill_level_select_cams 
	IF GameModeEquals is_career 
		IF NOT GotParam dont_end_chapter 
			SetHighestChapterWithLevel level = <level> 
		ENDIF 
		IF NOT LevelIs Load_MainMenu 
			IF ( ( <level> = load_boardshop ) | ( <level> = load_cas ) ) 
				temp = <level> 
				GetCurrentLevel 
				array = return_to_level 
				SetArrayElement ArrayName = array index = 0 newvalue = <level> 
				level = <temp> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF inNetGame 
		show_warning = 1 
	ENDIF 
	IF CD 
		IF IsCustomPark 
			IF isNgc 
				DisplayLoadingScreen Blank 
			ENDIF 
			really_change_level <...> 
		ELSE 
			IF NOT LevelIs <level> 
				IF isNgc 
					DisplayLoadingScreen Blank 
				ENDIF 
				really_change_level <...> 
			ELSE 
				IF GotParam chose_same_level_script 
					<chose_same_level_script> 
				ELSE 
					IF root_window : GetSingleTag no_exit_pause_menu 
						level_select_menu_exit 
						RETURN 
					ENDIF 
					IF GotParam end_run 
						level_select_menu_exit end_run 
						RETURN 
					ENDIF 
					IF InSplitScreenGame 
						level_select_menu_exit end_run 
						RETURN 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		really_change_level <...> 
	ENDIF 
	level_select_menu_exit no_new_menu 
	exit_pause_menu 
ENDSCRIPT

SCRIPT level_select_invalid_choice 
	
ENDSCRIPT

SCRIPT level_select_valid_choice 
	GetTags 
	theme_menu_pad_choose_sound 
	IF NOT ( <level_num> = <created_park_number> ) 
		current_menu : SetTags stop_animating 
		fireevent type = unfocus target = current_menu 
		kill_level_select_scripts 
		GetArraySize level_select_menu_level_info 
		index = 0 
		BEGIN 
			GetDotNameFromNum num = ( level_select_menu_level_info [ <index> ] . level_num ) 
			IF ScreenElementExists id = <dot_name> 
				IF ( ( level_select_menu_level_info [ <index> ] . level_num ) = <level_num> ) 
					DoScreenElementMorph id = <dot_name> alpha = 1 time = 0 
					DoScreenElementMorph id = <dot_name> alpha = 0 scale = 4 relative_scale time = 0.15000000596 
				ELSE 
					DoScreenElementMorph id = <dot_name> scale = 0 time = 0.15000000596 
				ENDIF 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
		draw_globe_arrow off 
	ELSE 
		IF ScreenElementExists id = current_menu 
			current_menu : SetProps block_events 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = { <id> child = sign } 
		DoScreenElementMorph id = { <id> child = sign } scale = 3.20000004768 relative_scale time = 0.07999999821 
		wait 0.10000000149 seconds 
		DoScreenElementMorph id = { <id> child = sign } scale = 2.20000004768 relative_scale time = 0.07999999821 
		wait 0.15000000596 seconds 
	ELSE 
		IF ScreenElementExists id = { <id> child = text } 
			DoScreenElementMorph id = { <id> child = text } scale = 2.20000004768 relative_scale time = 0.07999999821 
			wait 0.10000000149 seconds 
			DoScreenElementMorph id = { <id> child = text } scale = 1.50000000000 relative_scale time = 0.07999999821 
			wait 0.15000000596 seconds 
		ENDIF 
	ENDIF 
	IF GotParam level_callback_script 
		<level_callback_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT SetStartingLevelFlags 
	IF IsTrue demo_build 
		SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_7 
	ELSE 
		SetGlobalFlag flag = LEVEL_UNLOCKED_TR 
		SetGlobalFlag flag = LEVEL_SEEN_TR 
	ENDIF 
	SetGlobalFlag flag = LEVEL_UNLOCKED_BO 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_1 
	SetGlobalFlag flag = LEVEL_SEEN_BO 
	SetGlobalFlag flag = LEVEL_SEEN_BA 
ENDSCRIPT

e3_level_select_menu_level_info = [ 
	{ text = "BOSTON" level_num = 1 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_BO level = load_BO sign_texture = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "" level_num = 2 sign_texture = sign_barcelona force_locked } 
	{ text = "" level_num = 3 sign_texture = sign_berlin force_locked } 
	{ text = "" level_num = 4 sign_texture = sign_australia force_locked } 
	{ text = "" level_num = 5 sign_texture = sign_neworleans force_locked } 
	{ text = "" level_num = 6 sign_texture = sign_skatopia force_locked } 
	{ text = "" level_num = 7 sign_texture = sign_secret1 force_locked } 
] 
e3_level_select_menu_classic_level_info = [ 
	{ text = "" level_num = 12 sign_texture = sign_barcelona force_locked } 
	{ text = "" level_num = 13 sign_texture = sign_berlin force_locked } 
	{ text = "" level_num = 14 sign_texture = sign_australia force_locked } 
	{ text = "" level_num = 15 sign_texture = sign_neworleans force_locked } 
	{ text = "" level_num = 16 sign_texture = sign_skatopia force_locked } 
	{ text = "BOSTON" level_num = 1 num_goals = 0 flag = LEVEL_UNLOCKED_BO level = load_BO sign_texture = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "" level_num = 2 sign_texture = sign_barcelona force_locked } 
	{ text = "" level_num = 3 sign_texture = sign_berlin force_locked } 
	{ text = "" level_num = 4 sign_texture = sign_australia force_locked } 
	{ text = "" level_num = 5 sign_texture = sign_neworleans force_locked } 
	{ text = "" level_num = 6 sign_texture = sign_skatopia force_locked } 
] 
level_select_menu_level_info = [ 
	{ text = "TRAINING" level_num = LevelNum_TR level_prefix = "TR" num_goals = 0 flag = LEVEL_UNLOCKED_TR seen_flag = LEVEL_SEEN_TR level = load_TR sign_texture = sign_training dot_pos = PAIR(89.00000000000, 82.00000000000) new_vmenu } 
	{ text = "Default" level_num = 30 num_goals = 0 flag = LEVEL_UNLOCKED_TR level = load_Default DEVKIT_ONLY hold_vmenu } 
	{ text = "TestLevel" level_num = 21 num_goals = 0 flag = LEVEL_UNLOCKED_TR level = load_TestLevel DEVKIT_ONLY hold_vmenu } 
	{ text = "BOSTON" level_num = LevelNum_BO level_prefix = "BO" num_goals = 0 flag = LEVEL_UNLOCKED_BO seen_flag = LEVEL_SEEN_BO level = load_BO sign_texture = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "BARCELONA" level_num = LevelNum_BA level_prefix = "BA" num_goals = 0 flag = LEVEL_UNLOCKED_BA seen_flag = LEVEL_SEEN_BA level = load_BA sign_texture = sign_barcelona dot_pos = PAIR(223.00000000000, 84.00000000000) } 
	{ text = "BERLIN" level_num = LevelNum_BE level_prefix = "BE" num_goals = 0 flag = LEVEL_UNLOCKED_BE seen_flag = LEVEL_SEEN_BE level = load_BE sign_texture = sign_berlin dot_pos = PAIR(243.00000000000, 68.00000000000) } 
	{ text = "AUSTRALIA" level_num = LevelNum_AU level_prefix = "AU" num_goals = 0 flag = LEVEL_UNLOCKED_AU seen_flag = LEVEL_SEEN_AU level = load_AU sign_texture = sign_australia dot_pos = PAIR(426.00000000000, 194.00000000000) } 
	{ text = "NEW ORLEANS" level_num = LevelNum_NO level_prefix = "NO" num_goals = 0 flag = LEVEL_UNLOCKED_NO seen_flag = LEVEL_SEEN_NO level = load_NO sign_texture = sign_neworleans dot_pos = PAIR(104.00000000000, 94.00000000000) } 
	{ text = "SKATOPIA" level_num = LevelNum_ST level_prefix = "ST" num_goals = 0 flag = LEVEL_UNLOCKED_ST seen_flag = LEVEL_SEEN_ST level = load_ST sign_texture = sign_skatopia dot_pos = PAIR(111.00000000000, 83.00000000000) } 
	{ text = "PRO SKATER" level_num = LevelNum_SE num_goals = 0 flag = LEVEL_UNLOCKED_SE seen_flag = LEVEL_SEEN_SE level = load_SE sign_texture = sign_secret1 } 
	{ text = "THE TRIANGLE" level_num = LevelNum_SE2 num_goals = 0 flag = LEVEL_UNLOCKED_SE2 seen_flag = LEVEL_SEEN_SE2 hide_when_locked level = load_SE2 sign_texture = sign_secret2 dot_pos = PAIR(127.00000000000, 105.00000000000) } 
	{ text = "SCHOOL" level_num = LevelNum_SC num_goals = 0 flag = LEVEL_UNLOCKED_SC seen_flag = LEVEL_SEEN_SC hide_when_locked level = load_sc sign_texture = sign_school dot_pos = PAIR(261.00000000000, 185.00000000000) } 
	{ text = "PHILADELPHIA" level_num = LevelNum_PH num_goals = 0 flag = LEVEL_UNLOCKED_PH seen_flag = LEVEL_SEEN_PH hide_when_locked level = load_ph sign_texture = sign_philly dot_pos = PAIR(119.00000000000, 80.00000000000) } 
	{ text = "DOWNHILL JAM" level_num = LevelNum_DJ num_goals = 0 flag = LEVEL_UNLOCKED_DJ seen_flag = LEVEL_SEEN_DJ hide_when_locked level = load_dj sign_texture = sign_jam dot_pos = PAIR(165.00000000000, 148.00000000000) } 
	{ text = "LOS ANGELES" level_num = LevelNum_LA num_goals = 0 flag = LEVEL_UNLOCKED_LA seen_flag = LEVEL_SEEN_LA hide_when_locked level = load_la sign_texture = sign_la dot_pos = PAIR(78.00000000000, 102.00000000000) } 
	{ text = "CANADA" level_num = LevelNum_CA num_goals = 0 flag = LEVEL_UNLOCKED_CA seen_flag = LEVEL_SEEN_CA hide_when_locked level = load_ca sign_texture = sign_canada dot_pos = PAIR(85.00000000000, 65.00000000000) } 
	{ text = "AIRPORT" level_num = LevelNum_AP num_goals = 0 flag = LEVEL_UNLOCKED_AP seen_flag = LEVEL_SEEN_AP hide_when_locked level = load_ap sign_texture = sign_airport dot_pos = PAIR(410.00000000000, 87.00000000000) } 
	{ text = "CREATED PARK" level_num = LevelNum_Sk5ed num_goals = 0 flag = LEVEL_UNLOCKED_TR level = load_sk5ed_gameplay sign_texture = sign_created } 
] 
classic_mode_max_bracket = 8 
level_select_menu_classic_level_info = [ 
	{ text = "BARCELONA" level_num = LevelNum_BA bracket = 0 flag = LEVEL_BRACKET_UNLOCKED_1 seen_flag = LEVEL_SEEN_BA level = load_BA sign_texture = sign_barcelona dot_pos = PAIR(223.00000000000, 84.00000000000) } 
	{ text = "AUSTRALIA" level_num = LevelNum_AU bracket = 1 flag = LEVEL_BRACKET_UNLOCKED_2 seen_flag = LEVEL_SEEN_AU level = load_AU sign_texture = sign_australia dot_pos = PAIR(426.00000000000, 194.00000000000) } 
	{ text = "SKATOPIA" level_num = LevelNum_ST bracket = 1 flag = LEVEL_BRACKET_UNLOCKED_2 seen_flag = LEVEL_SEEN_ST level = load_ST sign_texture = sign_skatopia dot_pos = PAIR(111.00000000000, 83.00000000000) } 
	{ text = "BERLIN" level_num = LevelNum_BE bracket = 2 flag = LEVEL_BRACKET_UNLOCKED_3 seen_flag = LEVEL_SEEN_BE level = load_BE sign_texture = sign_berlin dot_pos = PAIR(243.00000000000, 68.00000000000) } 
	{ text = "AIRPORT" level_num = LevelNum_AP bracket = 3 flag = LEVEL_BRACKET_UNLOCKED_4 seen_flag = LEVEL_SEEN_AP level = load_ap sign_texture = sign_airport dot_pos = PAIR(410.00000000000, 87.00000000000) } 
	{ text = "SCHOOL" level_num = LevelNum_SC bracket = 3 flag = LEVEL_BRACKET_UNLOCKED_4 seen_flag = LEVEL_SEEN_SC level = load_sc sign_texture = sign_school dot_pos = PAIR(261.00000000000, 185.00000000000) } 
	{ text = "DOWNHILL JAM" level_num = LevelNum_DJ bracket = 4 flag = LEVEL_BRACKET_UNLOCKED_5 seen_flag = LEVEL_SEEN_DJ level = load_dj sign_texture = sign_jam dot_pos = PAIR(165.00000000000, 148.00000000000) } 
	{ text = "NEW ORLEANS" level_num = LevelNum_NO bracket = 5 flag = LEVEL_BRACKET_UNLOCKED_6 seen_flag = LEVEL_SEEN_NO level = load_NO sign_texture = sign_neworleans dot_pos = PAIR(104.00000000000, 94.00000000000) } 
	{ text = "TRAINING" level_num = LevelNum_TR bracket = 5 flag = LEVEL_BRACKET_UNLOCKED_6 seen_flag = LEVEL_SEEN_TR level = load_TR sign_texture = sign_training dot_pos = PAIR(89.00000000000, 82.00000000000) } 
	{ text = "BOSTON" level_num = LevelNum_BO bracket = 6 flag = LEVEL_BRACKET_UNLOCKED_7 seen_flag = LEVEL_SEEN_BO level = load_BO sign_texture = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "CANADA" level_num = LevelNum_CA bracket = 7 flag = LEVEL_BRACKET_UNLOCKED_8 seen_flag = LEVEL_SEEN_CA level = load_ca sign_texture = sign_canada dot_pos = PAIR(85.00000000000, 65.00000000000) } 
	{ text = "PHILADELPHIA" level_num = LevelNum_PH bracket = 7 flag = LEVEL_BRACKET_UNLOCKED_8 seen_flag = LEVEL_SEEN_PH level = load_ph sign_texture = sign_philly dot_pos = PAIR(119.00000000000, 80.00000000000) } 
	{ spacer unlocked_with_se2 force_locked level_num = 0 } 
	{ text = "LOS ANGELES" level_num = LevelNum_LA bracket = 8 flag = LEVEL_BRACKET_UNLOCKED_9 seen_flag = LEVEL_SEEN_LA level = load_la sign_texture = sign_la dot_pos = PAIR(78.00000000000, 102.00000000000) } 
	{ text = "THE TRIANGLE" level_num = LevelNum_SE2 bracket = 8 unlocked_with_se2 flag = GAME_CLASSIC_UNLOCKED_SE2 seen_flag = LEVEL_SEEN_SE2 level = load_SE2 sign_texture = sign_secret2 dot_pos = PAIR(127.00000000000, 105.00000000000) } 
] 
premade_parks_info = [ 
	{ name = "Iced Out" slot = 1 max = 8 } 
	{ name = "False Pigs." slot = 2 max = 8 } 
	{ name = "Park of Doom 8" slot = 3 max = 8 } 
	{ name = "Arctic Drill" slot = 4 max = 8 } 
	{ name = "Sik Park" slot = 5 max = 8 } 
	{ name = "England" slot = 6 max = 8 } 
	{ name = "Bubs Oldschool" slot = 7 max = 8 } 
	{ name = "No Idea" slot = 8 max = 8 } 
	{ name = "CTF Showdown" slot = 9 max = 8 } 
	{ name = "Swamp-tastic" slot = 10 max = 8 } 
	{ name = "I\'m Not Dead" slot = 11 max = 8 } 
	{ name = "Burnin\' Rubber" slot = 12 max = 8 } 
	{ name = "Montana" slot = 13 max = 8 } 
	{ name = "Daytoner XBLR" slot = 14 max = 8 } 
	{ name = "CTF Facing" slot = 15 max = 8 } 
	{ name = "DOOd Land" slot = 16 max = 8 } 
	{ name = "Slacka Land 2" slot = 17 max = 8 } 
	{ name = "Fun Towers" slot = 18 max = 8 } 
	{ name = "Da Hizzy" slot = 19 max = 8 } 
	{ name = "Martian Madness" slot = 20 max = 8 } 
	{ name = "Ji Land 4" slot = 21 max = 8 } 
] 
level_map_pieces = [ 
	{ tiles = [ 1 , 0 , 0 , 0 ] } 
	{ tiles = [ 2 , 3 , 4 , 0 ] } 
	{ tiles = [ 5 , 6 , 7 , 8 ] } 
	{ tiles = [ 9 , 10 , 11 , 0 ] } 
	{ tiles = [ 12 , 13 , 14 , 0 ] } 
	{ tiles = [ 15 , 16 , 17 , 0 ] } 
	{ tiles = [ 18 , 19 , 20 , 21 ] } 
	{ tiles = [ 0 , 0 , 0 , 0 ] } 
] 

