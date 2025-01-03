
SCRIPT high_scores_menu_enter_initials 
	SetScreenElementLock id = root_window off 
	PauseGame 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	kill_start_key_binding 
	GoalManager_HidePoints 
	GetInitialsString 
	IF NOT GotParam allow_back 
		no_back = no_back 
	ENDIF 
	IF IsNgc 
		<heap> = TopDown 
	ENDIF 
	create_onscreen_keyboard { 
		text = <string> 
		no_back = <no_back> 
		keyboard_done_script = high_scores_menu_entered_initials 
		<...> 
		keyboard_title = "ENTER INITIALS" 
		min_length = 1 
		max_length = 3 
		heap = <heap> 
	} 
ENDSCRIPT

SCRIPT high_scores_menu_entered_initials 
	GetTextElementString id = keyboard_current_string 
	SetInitialsString string = <string> 
	UpdateInitials 
	destroy_onscreen_keyboard 
	IF GameModeEquals is_classic 
		IF NOT GotParam just_started_game 
			launch_ss_menu from_ss_menu = <from_ss_menu> 
		ELSE 
			launch_select_skater_menu <...> 
		ENDIF 
	ELSE 
		high_scores_menu_create new_initials = <string> restart_node = <restart_node> 
	ENDIF 
ENDSCRIPT

SCRIPT high_scores_menu_create 
	IF GameModeEquals is_classic 
		IF ( classic_mode_in_end_run_sequence = 1 ) 
			GetInitialsString 
			new_initials = <string> 
		ENDIF 
	ENDIF 
	SetScreenElementLock id = root_window off 
	IF NOT GotParam from_options 
		PauseGame 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = menu_parts_anchor 
		DestroyScreenElement id = menu_parts_anchor 
	ENDIF 
	IF LevelIs Load_MainMenu 
		make_new_themed_sub_menu { 
			menu_id = high_scores_records_menu 
			title = "HIGH SCORES" 
			just = [ center center ] 
			no_grad_bar 
		} 
	ELSE 
		make_new_themed_sub_menu { 
			menu_id = high_scores_records_menu 
			title = "HIGH SCORES" 
			just = [ center center ] 
		} 
	ENDIF 
	AssignAlias id = high_scores_records_menu alias = sub_menu 
	kill_start_key_binding 
	Theme_GetHighlightedTextColor return_value = on_color 
	Theme_GetUnhighlightedTextColor return_value = off_color 
	Theme_GetIconOnColor return_value = on_icon_color 
	IF GotParam from_options 
		theme_background parent = sub_menu id = bg_box_vmenu width = 5 pos = PAIR(320.00000000000, 60.00000000000) num_parts = 11 z_priority = 1 
		DoScreenElementMorph id = bg_box_vmenu scale = PAIR(1.00000000000, 0.98000001907) 
		SetScreenElementProps { id = sub_menu 
			event_handlers = [ { pad_choose null_script } 
				{ pad_start null_script } 
				{ pad_back generic_menu_pad_back params = { callback = high_scores_menu_exit from_options no_unload_textures } } 
				{ pad_left high_scores_change_level params = { level = <level> level_name = <level_name> minus } } 
				{ pad_right high_scores_change_level params = { level = <level> level_name = <level_name> } } 
			] 
			replace_handlers 
		} 
		create_helper_text { helper_text_elements = [ { text = "\\b6/\\b5 = Select" } 
				{ text = "\\bn = Back" } 
			] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = sub_menu 
			texture = black 
			rgba = [ 0 0 0 128 ] 
			scale = PAIR(109.50000000000, 5.50000000000) 
			pos = PAIR(320.00000000000, 65.00000000000) 
			just = [ center top ] 
			z_priority = 1.10000002384 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = sub_menu 
			font = Dialog 
			rgba = <off_color> 
			text = <level_name> 
			scale = 0.94999998808 
			pos = PAIR(220.00000000000, 65.00000000000) 
			just = [ center top ] 
			z_priority = 5 
		} 
		GetScreenElementPosition id = <id> 
		GetScreenElementDims id = <id> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = sub_menu 
			id = high_scores_left_arrow 
			texture = left_arrow 
			scale = PAIR(0.69999998808, 0.60000002384) 
			pos = ( <ScreenElementPos> - PAIR(5.00000000000, -3.00000000000) ) 
			just = [ right top ] 
			rgba = <on_color> 
			z_priority = 5 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = sub_menu 
			id = high_scores_right_arrow 
			texture = right_arrow 
			scale = PAIR(0.69999998808, 0.60000002384) 
			pos = ( <ScreenElementPos> + <width> * PAIR(1.00000000000, 0.00000000000) + PAIR(5.00000000000, 4.00000000000) ) 
			just = [ left top ] 
			rgba = <on_color> 
			z_priority = 5 
		} 
		<root_pos> = PAIR(100.00000000000, 50.00000000000) 
		<top_bar_b> = PAIR(1.00000000000, 34.00000000000) 
		<blue_pixel> = PAIR(1.00000000000, 15.00000000000) 
	ELSE 
		pause_menu_gradient on 
		theme_background parent = sub_menu id = bg_box_vmenu width = 5 pos = PAIR(320.00000000000, 85.00000000000) num_parts = 10 z_priority = 1 
		IF GotParam from_pause 
			SetScreenElementProps { id = sub_menu 
				event_handlers = [ { pad_choose null_script } 
					{ pad_back high_scores_menu_exit params = { from_pause = from_pause } } 
					{ pad_start null_script } 
				] 
				replace_handlers 
			} 
			create_helper_text helper_text_elements = [ { text = "\\bn = Back" } ] 
		ELSE 
			SetScreenElementProps { id = sub_menu 
				event_handlers = [ { pad_choose high_scores_menu_exit params = { restart_node = <restart_node> } } 
					{ pad_start high_scores_menu_exit params = { restart_node = <restart_node> } } 
				] 
				replace_handlers 
			} 
			create_helper_text helper_text_elements = [ { text = "\\bm = Continue" } ] 
		ENDIF 
		<root_pos> = PAIR(100.00000000000, 53.00000000000) 
		<top_bar_b> = PAIR(1.00000000000, 36.00000000000) 
		<blue_pixel> = PAIR(1.00000000000, 35.00000000000) 
	ENDIF 
	IF NOT GotParam no_load_textures 
		LoadTexture no_vram_alloc "MultiplayerSprites/stat_scores" 
		LoadTexture no_vram_alloc "MultiplayerSprites/stat_combos" 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(109.75000000000, 6.00000000000) 
		pos = ( <root_pos> + <top_bar_b> ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	Theme_GetHighlightBarColor return_value = bg_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = black 
		rgba = <bg_color> 
		scale = PAIR(0.50000000000, 0.50000000000) 
		pos = ( <root_pos> + <blue_pixel> ) 
		just = [ left top ] 
		z_priority = 50 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = sub_menu 
		font = Dialog 
		rgba = <on_color> 
		text = "5 BEST HIGH SCORES" 
		scale = 1.00000000000 
		pos = ( <root_pos> + PAIR(21.00000000000, 34.00000000000) ) 
		just = [ left top ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		id = high_scores_menu_icon 
		texture = black 
		pos = <root_pos> 
		just = [ left top ] 
		rgba = [ 127 102 0 0 ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = black 
		rgba = [ 0 0 0 0 ] 
		scale = PAIR(97.00000000000, 1.00000000000) 
		pos = ( <root_pos> + PAIR(35.00000000000, 57.00000000000) ) 
		just = [ left top ] 
	} 
	FormatText ChecksumName = stat_scores_icon "stat_scores" 
	<five_best_icon_scale> = PAIR(1.51999998093, 1.20000004768) 
	GetStackedScreenElementPos Y id = <id> offset = PAIR(-10.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		id = high_scores_menu_scores_icon 
		texture = <stat_scores_icon> 
		scale = <five_best_icon_scale> 
		pos = <pos> 
		rgba = <on_icon_color> 
		just = [ left top ] 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(3.00000000000, 46.29999923706) 
		pos = ( <pos> + PAIR(140.00000000000, -8.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(3.00000000000, 66.00000000000) 
		pos = ( <pos> + PAIR(205.00000000000, -8.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	GetStackedScreenElementPos Y id = high_scores_menu_scores_icon offset = PAIR(-4.00000000000, 1.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(109.75000000000, 6.00000000000) 
		pos = ( <pos> + PAIR(-20.00000000000, 0.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = sub_menu 
		font = Dialog 
		rgba = <on_color> 
		text = "5 BEST COMBO SCORES" 
		scale = 1.00000000000 
		pos = ( <pos> + PAIR(0.00000000000, 0.00000000000) ) 
		just = [ left top ] 
		z_priority = 5 
	} 
	FormatText ChecksumName = stat_comboss_icon "stat_combos" 
	GetStackedScreenElementPos Y id = <id> offset = PAIR(2.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		id = high_scores_menu_combos_icon 
		texture = <stat_comboss_icon> 
		scale = <five_best_icon_scale> 
		rgba = <on_icon_color> 
		pos = ( <pos> + PAIR(0.00000000000, 0.00000000000) ) 
		just = [ left top ] 
		z_priority = 1 
	} 
	GetStackedScreenElementPos Y id = high_scores_menu_combos_icon offset = PAIR(0.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		id = high_scores_menu_lower_yellow_bar 
		texture = black 
		rgba = <on_color> 
		scale = PAIR(109.75000000000, 0.50000000000) 
		pos = ( <pos> + PAIR(-22.00000000000, 0.00000000000) ) 
		just = [ left top ] 
	} 
	GetStackedScreenElementPos X id = high_scores_menu_scores_icon offset = PAIR(10.00000000000, -3.00000000000) 
	CreateScreenElement { 
		type = VMenu 
		parent = sub_menu 
		id = high_scores_menu_five_best_high_scores_vmenu 
		pos = <pos> 
		just = [ left top ] 
		internal_just = [ left top ] 
	} 
	GetStackedScreenElementPos X id = high_scores_menu_combos_icon offset = PAIR(10.00000000000, -3.00000000000) 
	CreateScreenElement { 
		type = VMenu 
		parent = sub_menu 
		id = high_scores_menu_five_best_combos_vmenu 
		pos = <pos> 
		just = [ left top ] 
		internal_just = [ left top ] 
	} 
	GetStackedScreenElementPos Y id = high_scores_menu_lower_yellow_bar offset = PAIR(0.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = VMenu 
		parent = sub_menu 
		id = high_scores_menu_longest_tricks_vmenu 
		pos = ( <pos> + PAIR(6.00000000000, 0.00000000000) ) 
		just = [ left top ] 
		internal_just = [ left top ] 
		z_priority = 3 
	} 
	high_scores_menu_fill_menus level = <level> new_initials = <new_initials> 
	IF GotParam no_animate 
		finish_themed_sub_menu time = 0.00000000000 
	ELSE 
		finish_themed_sub_menu 
	ENDIF 
ENDSCRIPT

SCRIPT high_scores_menu_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = menu_parts_anchor 
		DestroyScreenElement id = menu_parts_anchor 
	ENDIF 
	IF NOT GotParam no_unload_textures 
		UnloadTexture "MultiplayerSprites/stat_scores" 
		UnloadTexture "MultiplayerSprites/stat_combos" 
	ENDIF 
	IF GotParam from_pause 
		goto create_options_menu 
	ENDIF 
	IF ( classic_mode_in_end_run_sequence = 1 ) 
		classic_mode_do_end_run_stats 
		RETURN 
	ENDIF 
	restore_start_key_binding 
	IF GotParam from_options 
		create_setup_options_menu 
	ELSE 
		GoalManager_ShowPoints 
		IF VibrationIsOn 0 
			VibrationOff 0 
			VibrationOn 0 
		ELSE 
			VibrationOff 0 
		ENDIF 
		IF GotParam restart_node 
			exit_pause_menu 
			ResetSkaters node_name = <restart_node> 
		ELSE 
			create_pause_menu no_exit 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT high_scores_change_level 
	GetArraySize level_select_menu_level_info 
	<index> = 0 
	BEGIN 
		IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_sk5ed_gameplay ) 
			IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_TestLevel ) 
				IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_Default ) 
					IF NOT StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) DEVKIT_ONLY 
						IF ( <level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) ) 
							BREAK 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT ( <array_size> ) 
	IF GotParam minus 
		<index> = ( <index> -1 ) 
		printf <index> 
		<to_repeat> = <index> 
		IF ( <index> > -1 ) 
			BEGIN 
				IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_sk5ed_gameplay ) 
					IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_TestLevel ) 
						IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_Default ) 
							IF NOT StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) DEVKIT_ONLY 
								IF StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) flag 
									IF GetGlobalFlag flag = ( ( ( level_select_menu_level_info ) [ <index> ] ) . flag ) 
										<level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
										BREAK 
									ELSE 
										IF ( all_levels_unlocked = 1 ) 
											<level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
											BREAK 
										ENDIF 
									ENDIF 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
				<level> = ( ( level_select_menu_level_info [ 0 ] ) . level_num ) 
				<index> = ( <index> - 1 ) 
			REPEAT <to_repeat> 
		ELSE 
			<index> = ( <array_size> -1 ) 
			BEGIN 
				IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_sk5ed_gameplay ) 
					IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_TestLevel ) 
						IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_Default ) 
							IF NOT StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) DEVKIT_ONLY 
								IF StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) flag 
									IF GetGlobalFlag flag = ( ( ( level_select_menu_level_info ) [ <index> ] ) . flag ) 
										<level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
										BREAK 
									ELSE 
										IF ( all_levels_unlocked = 1 ) 
											<level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
											BREAK 
										ENDIF 
									ENDIF 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
				<level> = ( ( level_select_menu_level_info [ ( <array_size> -4 ) ] ) . level_num ) 
				<index> = ( <index> - 1 ) 
			REPEAT <to_repeat> 
		ENDIF 
	ELSE 
		<index> = ( <index> + 1 ) 
		IF ( <index> < ( <array_size> -1 ) ) 
			<times> = ( <array_size> - <index> -1 ) 
			BEGIN 
				IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_sk5ed_gameplay ) 
					IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_TestLevel ) 
						IF NOT ( ( ( level_select_menu_level_info [ <index> ] ) . level ) = load_Default ) 
							IF NOT StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) DEVKIT_ONLY 
								IF StructureContains structure = ( ( level_select_menu_level_info ) [ <index> ] ) flag 
									IF GetGlobalFlag flag = ( ( ( level_select_menu_level_info ) [ <index> ] ) . flag ) 
										<level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
										BREAK 
									ELSE 
										IF ( all_levels_unlocked = 1 ) 
											<level> = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) 
											BREAK 
										ENDIF 
									ENDIF 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
				<level> = 1 
				<index> = ( <index> + 1 ) 
			REPEAT ( <times> ) 
		ELSE 
			<level> = 9 
		ENDIF 
	ENDIF 
	GetArraySize level_select_menu_level_info 
	<index> = 0 
	BEGIN 
		IF ( ( ( level_select_menu_level_info [ <index> ] ) . level_num ) = <level> ) 
			<level_name> = ( ( level_select_menu_level_info [ <index> ] ) . text ) 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	PlaySound MenuUp 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
	high_scores_menu_create level = <level> level_name = <level_name> from_options no_animate no_load_textures 
	IF GotParam minus 
		RunScriptOnScreenElement id = high_scores_left_arrow menu_blink_arrow 
	ELSE 
		RunScriptOnScreenElement id = high_scores_right_arrow menu_blink_arrow 
	ENDIF 
ENDSCRIPT

SCRIPT high_scores_menu_fill_menus 
	GetLevelRecords level = <level> 
	GetArraySize ( <highscores> . RecordTable ) 
	<index> = 0 
	BEGIN 
		high_scores_menu_add_five_best_item { 
			parent = high_scores_menu_five_best_high_scores_vmenu 
			place = ( <index> + 1 ) 
			initials = ( ( ( <highscores> . RecordTable ) [ <index> ] ) . initials ) 
			score = ( ( ( <highscores> . RecordTable ) [ <index> ] ) . value ) 
			new_initials = <new_initials> 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	GetArraySize ( <bestcombos> . RecordTable ) 
	<index> = 0 
	BEGIN 
		high_scores_menu_add_five_best_item { 
			parent = high_scores_menu_five_best_combos_vmenu 
			place = ( <index> + 1 ) 
			initials = ( ( ( <bestcombos> . RecordTable ) [ <index> ] ) . initials ) 
			score = ( ( ( <bestcombos> . RecordTable ) [ <index> ] ) . value ) 
			new_initials = <new_initials> 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	<c> = #"." 
	IF German 
		<c> = #"," 
	ENDIF 
	IF French 
		<c> = #"," 
	ENDIF 
	FormatText TextName = score "%i%c%f sec." i = ( ( <longestgrind> . value / 100 ) ) c = <c> f = ( ( <longestgrind> . value ) - ( ( <longestgrind> . value / 100 ) * 100 ) ) 
	high_scores_menu_add_longest_trick_item { 
		header = "Longest grind:" 
		initials = ( <longestgrind> . initials ) 
		score = <score> 
		new_initials = <new_initials> 
	} 
	FormatText TextName = score "%i%c%f sec." i = ( ( <longestmanual> . value / 100 ) ) c = <c> f = ( ( <longestmanual> . value ) - ( ( <longestmanual> . value / 100 ) * 100 ) ) 
	high_scores_menu_add_longest_trick_item { 
		header = "Longest manual:" 
		initials = ( <longestmanual> . initials ) 
		score = <score> 
		new_initials = <new_initials> 
	} 
	FormatText TextName = score "%i%c%f sec." i = ( ( <longestliptrick> . value / 100 ) ) c = <c> f = ( ( <longestliptrick> . value ) - ( ( <longestliptrick> . value / 100 ) * 100 ) ) 
	high_scores_menu_add_longest_trick_item { 
		header = "Longest lip:" 
		initials = ( <longestliptrick> . initials ) 
		score = <score> 
		new_initials = <new_initials> 
	} 
	FormatText TextName = score "%i tricks" i = ( <longestcombo> . value ) 
	high_scores_menu_add_longest_trick_item { 
		header = "Longest combo:" 
		initials = ( <longestcombo> . initials ) 
		score = <score> 
		new_initials = <new_initials> 
	} 
ENDSCRIPT

SCRIPT high_scores_menu_add_five_best_item 
	SetScreenElementLock id = <parent> off 
	Theme_GetHighlightedTextColor return_value = on_color 
	Theme_GetUnhighlightedTextColor return_value = off_color 
	<scale> = 0.85000002384 
	FormatText TextName = place_string "%i)" i = <place> 
	FormatText TextName = score_string "%i" i = <score> UseCommas 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		dims = PAIR(400.00000000000, 15.00000000000) 
		just = [ left top ] 
	} 
	<anchor_id> = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = Dialog 
		text = <place_string> 
		rgba = <off_color> 
		scale = <scale> 
		pos = PAIR(19.00000000000, 0.00000000000) 
		just = [ center top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = Dialog 
		text = <initials> 
		rgba = <off_color> 
		scale = <scale> 
		pos = PAIR(71.00000000000, 0.00000000000) 
		just = [ center top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = Dialog 
		text = <score_string> 
		pos = PAIR(250.00000000000, 0.00000000000) 
		rgba = <off_color> 
		scale = <scale> 
		just = [ right top ] 
	} 
	highlight = 0 
	IF GotParam in_arcade_machine 
		IF ( GotParam target_index ) 
			IF ( <target_index> = <place> ) 
				<highlight> = 1 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( GotParam new_initials ) 
			IF ( <new_initials> = <initials> ) 
				<highlight> = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <highlight> = 1 ) 
		GetScreenElementPosition { 
			id = { <anchor_id> child = 1 } 
		} 
		IF GotParam in_arcade_machine 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <anchor_id> 
				texture = white2 
				rgba = [ 128 128 128 50 ] 
				scale = PAIR(33.00000000000, 1.79999995232) 
				pos = ( <ScreenElementPos> + PAIR(-56.00000000000, 2.00000000000) ) 
				just = [ left top ] 
				z_priority = 1.10000002384 
			} 
		ELSE 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <anchor_id> 
				texture = black 
				rgba = [ 0 0 0 50 ] 
				scale = PAIR(109.00000000000, 3.70000004768) 
				pos = ( <ScreenElementPos> + PAIR(-185.00000000000, 2.00000000000) ) 
				just = [ left top ] 
				z_priority = 1.10000002384 
			} 
		ENDIF 
		SetScreenElementProps { 
			id = { <anchor_id> child = 0 } 
			rgba = <on_color> 
		} 
		SetScreenElementProps { 
			id = { <anchor_id> child = 1 } 
			rgba = <on_color> 
		} 
		SetScreenElementProps { 
			id = { <anchor_id> child = 2 } 
			rgba = <on_color> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT high_scores_menu_add_longest_trick_item 
	SetScreenElementLock id = high_scores_menu_longest_tricks_vmenu off 
	<scale> = 0.85000002384 
	Theme_GetHighlightedTextColor return_value = on_color 
	Theme_GetUnhighlightedTextColor return_value = off_color 
	FormatText TextName = score_string "%i" i = <score> 
	CreateScreenElement { 
		type = ContainerElement 
		parent = high_scores_menu_longest_tricks_vmenu 
		dims = PAIR(400.00000000000, 16.50000000000) 
		just = [ left top ] 
	} 
	<anchor_id> = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = Dialog 
		text = <header> 
		rgba = <on_color> 
		scale = <scale> 
		pos = PAIR(12.00000000000, 0.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = Dialog 
		text = <initials> 
		rgba = <off_color> 
		scale = <scale> 
		pos = PAIR(195.00000000000, 0.00000000000) 
		just = [ center top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = Dialog 
		text = <score_string> 
		pos = PAIR(320.00000000000, 0.00000000000) 
		rgba = <off_color> 
		scale = <scale> 
		just = [ center top ] 
	} 
	IF ( GotParam new_initials ) 
		IF ( <new_initials> = <initials> ) 
			GetScreenElementPosition { 
				id = { <anchor_id> child = 1 } 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <anchor_id> 
				texture = black 
				rgba = [ 0 0 0 50 ] 
				scale = PAIR(109.00000000000, 4.09999990463) 
				pos = ( <ScreenElementPos> + PAIR(-185.00000000000, 0.00000000000) ) 
				just = [ left top ] 
				z_priority = 1.10000002384 
			} 
			SetScreenElementProps { 
				id = { <anchor_id> child = 1 } 
				rgba = <on_color> 
			} 
			SetScreenElementProps { 
				id = { <anchor_id> child = 2 } 
				rgba = <on_color> 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT


