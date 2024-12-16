
stats_menu_bar_highlight = [ 55 , 55 , 110 , 128 ] 
stats_menu_bar_lowlight = [ 50 50 50 128 ] 
stats_menu_star_highlight = [ 85 , 85 , 0 , 110 ] 
stats_menu_star_lowlight = [ 10 , 10 , 10 , 128 ] 
helper_text_change_elements = [ { text = "\\b6/\\b5 = Change" } 
	{ text = "\\bn/\\bm = Done" } 
] 
helper_text_select_elements = [ { text = "\\b7/\\b4/\\b6/\\b5 = Select" } 
	{ text = "\\bn = Back" } 
	{ text = "\\bm = Change" } 
] 
helper_text_select_elements_no_change = [ 
	{ text = "\\b7/\\b4/\\b6/\\b5 = Select" } 
	{ text = "\\bn = Back" } 
] 
helper_text_classic_elements = [ 
	{ text = "\\b7/\\b4 = Select" } 
	{ text = "\\b6/\\b5 = Change" } 
	{ text = "\\bn = Back" } 
] 
SCRIPT create_classic_stats_menu 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = classic_stats_menu 
	} 
	AssignAlias id = classic_stats_menu alias = current_menu_anchor 
	AssignAlias id = classic_stats_menu alias = sub_menu 
	create_helper_text helper_text_elements = helper_text_classic_elements 
	CreateScreenElement { 
		type = ContainerElement 
		parent = classic_stats_menu 
		id = classic_stats_block_anchor 
		pos = PAIR(120.00000000000, 110.00000000000) 
		just = [ center center ] 
	} 
	Theme_GetSupportPieceColor return_value = tab_color 
	Theme_GetPauseBarColor return_value = font_color 
	Theme_GetAltColor return_value = alt_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = goal_tab 
		rgba = <tab_color> 
		scale = 1.20000004768 
		pos = PAIR(108.00000000000, -35.00000000000) 
		just = [ center center ] 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = goal_tab 
		rgba = <tab_color> 
		scale = 1.20000004768 
		pos = PAIR(290.00000000000, -35.00000000000) 
		just = [ center center ] 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = white2 
		rgba = <tab_color> 
		scale = PAIR(10.00000000000, 4.25000000000) 
		pos = PAIR(200.00000000000, -35.00000000000) 
		just = [ center center ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = white2 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(10.00000000000, 0.37999999523) 
		pos = PAIR(200.00000000000, -53.00000000000) 
		just = [ center center ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		id = bg 
		texture = white2 
		rgba = [ 0 0 0 70 ] 
		scale = PAIR(42.00000000000, 31.00000000000) 
		pos = PAIR(200.00000000000, 103.00000000000) 
		just = [ center center ] 
		z_priority = -10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = goal_tab 
		rgba = <alt_color> 
		scale = 1 
		pos = PAIR(95.00000000000, 239.00000000000) 
		just = [ center center ] 
		z_priority = 1 
		flip_h 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = goal_tab 
		rgba = <alt_color> 
		scale = 1 
		pos = PAIR(305.00000000000, 239.00000000000) 
		just = [ center center ] 
		z_priority = 1 
		flip_h 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = white2 
		rgba = <alt_color> 
		scale = PAIR(20.00000000000, 3.50000000000) 
		pos = PAIR(200.00000000000, 239.00000000000) 
		just = [ center center ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_stats_block_anchor 
		texture = white2 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(20.00000000000, 0.20000000298) 
		pos = PAIR(200.00000000000, 254.00000000000) 
		just = [ center center ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = classic_stats_block_anchor 
		text = "EDIT STATS" 
		font = small 
		rgba = [ 128 128 128 128 ] 
		scale = 1.89999997616 
		pos = PAIR(207.00000000000, -32.00000000000) 
		just = [ center center ] 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = classic_stats_block_anchor 
		id = stat_count 
		text = "" 
		font = small 
		rgba = [ 128 128 128 128 ] 
		scale = 1.29999995232 
		pos = PAIR(95.00000000000, 240.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = classic_stats_block_anchor 
		id = classic_stats_vmenu 
		font = small 
		just = [ left top ] 
		pos = PAIR(76.00000000000, 0.00000000000) 
		padding_scale = 1.14999997616 
		internal_scale = 1 
		internal_just = [ left top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back classic_stats_pad_choose params = { <...> back } } 
			{ pad_choose classic_stats_pad_choose params = <...> } 
			{ pad_start nullscript } 
		] 
	} 
	parent = classic_stats_vmenu 
	GetArraySize stat_names 
	<index> = 0 
	BEGIN 
		stats_menu_add_item { ( stat_names [ <index> ] ) 
			index = <index> 
			stats_parent = <parent> 
			pad_left_script = stats_change_menu_left 
			pad_right_script = stats_change_menu_right 
			StatMenu 
			can_edit 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	FireEvent type = focus target = classic_stats_vmenu 
ENDSCRIPT

SCRIPT classic_stats_pad_choose 
	UpdateSkaterStats player = 0 
	IF GotParam end_run 
		generic_menu_pad_choose_sound 
		gamemode_end_run_maybe_save 
	ELSE 
		IF GotParam back 
			generic_menu_pad_back_sound 
		ELSE 
			generic_menu_pad_choose_sound 
		ENDIF 
		GetStatValue air 
		IF GotParam overridden 
			IF NOT GotParam back 
				SetAllStats value = 0 
				index = 0 
				GetArraySize stat_names 
				BEGIN 
					FireEvent type = unfocus target = { classic_stats_vmenu child = <index> } 
					index = ( <index> + 1 ) 
				REPEAT <array_size> 
				FireEvent type = unfocus target = classic_stats_vmenu 
				FireEvent type = focus target = classic_stats_vmenu 
				RETURN 
			ENDIF 
		ENDIF 
		stats_menu_exit 
	ENDIF 
ENDSCRIPT

SCRIPT create_stats_menu 
	IF GameModeEquals is_classic 
		create_classic_stats_menu 
		RETURN 
	ENDIF 
	hide_current_goal 
	stats_menu_get_skater_name_and_family 
	IF NOT ( <skater_family> = family_custom ) 
		helpers = ( helper_text_select_elements_no_change ) 
		height = 254 
		scale = PAIR(65.00000000000, 8.50000000000) 
		num_parts = 6 
	ELSE 
		helpers = ( helper_text_select_elements ) 
		height = 362 
		scale = PAIR(65.00000000000, 21.50000000000) 
		num_parts = 10.50000000000 
	ENDIF 
	make_new_themed_sub_menu { 
		title = "STATS" 
		pos = PAIR(70.00000000000, 94.00000000000) 
		skateshop_pos = PAIR(60.00000000000, 97.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		no_menu_title = no_menu_title 
	} 
	create_helper_text helper_text_elements = <helpers> 
	IF ( <skater_family> = family_custom ) 
		sub_menu : SetTags can_edit 
	ENDIF 
	sub_menu : SetTags skater_name = <skater_name> 
	Theme_GetUnhighlightedTextColor return_value = off_color 
	Theme_GetHighlightedTextColor return_value = on_color 
	CreateScreenElement { 
		type = VMenu 
		parent = sub_menu 
		id = sub_vmenu2 
		font = small 
		just = [ left top ] 
		pos = PAIR(325.00000000000, 106.00000000000) 
		padding_scale = 1.14999997616 
		internal_scale = 1 
		internal_just = [ left top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back params = { callback = stats_menu_exit } } 
		] 
	} 
	SetScreenElementProps { 
		id = sub_vmenu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = stats_menu_exit } } ] 
		replace_handlers 
	} 
	FormatText textname = stat_title "%i:" i = ( ( stat_names [ 0 ] ) . string ) 
	CreateScreenElement { 
		type = TextElement 
		parent = sub_menu 
		id = stat_title 
		pos = PAIR(240.00000000000, 215.00000000000) 
		font = small 
		just = [ right top ] 
		scale = 1.50000000000 
		text = <stat_title> 
		rgba = <on_color> 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = sub_menu 
		id = stat_count 
		pos = PAIR(270.00000000000, 215.00000000000) 
		font = small 
		just = [ right top ] 
		scale = 1.50000000000 
		text = "" 
		rgba = <on_color> 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = sub_menu 
		id = stat_count2 
		pos = PAIR(350.00000000000, 203.00000000000) 
		dims = PAIR(250.00000000000, 60.00000000000) 
		font = small 
		just = [ left top ] 
		internal_just = [ left center ] 
		line_spacing = 0.80000001192 
		scale = 0.89999997616 
		text = "" 
		rgba = <on_color> 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = sub_menu 
		pos = PAIR(270.00000000000, 215.00000000000) 
		font = small 
		just = [ left top ] 
		scale = 1.50000000000 
		text = "/10" 
		rgba = <on_color> 
		z_priority = 4 
	} 
	Theme_GetAltColor return_value = alt_color 
	IF sub_menu : GetSingleTag can_edit 
		CreateScreenElement { 
			type = SpriteElement 
			parent = sub_menu 
			texture = white2 
			pos = PAIR(320.00000000000, 362.00000000000) 
			just = [ center top ] 
			scale = PAIR(63.50000000000, 0.25000000000) 
			rgba = <alt_color> 
			alpha = 0.69999998808 
		} 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = sub_menu 
		id = stat_point_description 
		pos = ( PAIR(320.00000000000, 2.00000000000) + <height> * PAIR(0.00000000000, 1.00000000000) ) 
		font = small 
		just = [ center top ] 
		scale = PAIR(1.00000000000, 0.89999997616) 
		text = ( ( stat_names [ 0 ] ) . description ) 
		rgba = <alt_color> 
		z_priority = 4 
	} 
	build_stat_goals_menu 
	theme_background width = 6.40000009537 pos = PAIR(320.00000000000, 85.00000000000) num_parts = <num_parts> parent = sub_menu 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = white2 
		pos = PAIR(320.00000000000, 250.00000000000) 
		just = [ center top ] 
		scale = PAIR(63.50000000000, 0.25000000000) 
		rgba = <on_color> 
		alpha = 0.69999998808 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = white2 
		pos = PAIR(322.00000000000, 212.00000000000) 
		just = [ center top ] 
		scale = PAIR(63.50000000000, 0.25000000000) 
		rgba = <on_color> 
		alpha = 0.69999998808 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = white2 
		pos = PAIR(322.00000000000, 214.00000000000) 
		just = [ center top ] 
		scale = PAIR(0.34999999404, 4.50000000000) 
		rgba = <on_color> 
		alpha = 0.69999998808 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = white2 
		pos = PAIR(320.00000000000, 214.00000000000) 
		just = [ center top ] 
		scale = <scale> 
		rgba = [ 0 0 0 88 ] 
		alpha = 0.69999998808 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = white2 
		pos = PAIR(320.00000000000, 212.00000000000) 
		just = [ center top ] 
		scale = PAIR(65.00000000000, 4.50000000000) 
		rgba = [ 0 0 0 118 ] 
		alpha = 0.69999998808 
	} 
	GetArraySize stat_names 
	<index> = 0 
	BEGIN 
		RemoveParameter pad_right_script 
		RemoveParameter pad_left_script 
		IF ( <index> > ( ( <array_size> / 2 ) - 1 ) ) 
			parent = sub_vmenu2 
			pad_left_script = focus_stats_vmenu 
			child = ( <index> - ( <array_size> / 2 ) ) 
		ELSE 
			parent = sub_vmenu 
			pad_right_script = focus_stats_vmenu2 
			child = <index> 
		ENDIF 
		stats_menu_add_item { ( stat_names [ <index> ] ) 
			index = <index> 
			stats_parent = <parent> 
			pad_right_script = <pad_right_script> 
			pad_left_script = <pad_left_script> 
			pad_right_params = { grid_index = ( <child> ) } 
			pad_left_params = { grid_index = ( <child> ) } 
			StatMenu 
		} 
		SetScreenElementProps { 
			id = { <parent> child = <child> } 
			tags = { tag_grid_x = <child> } 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF NOT LevelIs Load_MainMenu 
		finish_themed_sub_menu 
	ELSE 
		skater : remove_skater_from_world 
		DoScreenElementMorph id = sub_menu time = 0.00000000000 pos = PAIR(320.00000000000, 720.00000000000) 
		DoScreenElementMorph id = sub_menu time = 0.50000000000 pos = PAIR(320.00000000000, 218.00000000000) 
		FireEvent type = focus target = sub_menu 
	ENDIF 
	IF NOT sub_menu : GetSingleTag can_edit 
		update_stats_menu_count name = air 
	ENDIF 
ENDSCRIPT

SCRIPT get_stats_menu_goal_count 
	GetArraySize stats_goals 
	index = 0 
	count = 3 
	BEGIN 
		IF ( ( ( stats_goals [ <index> ] ) . stattype ) = <name> ) 
			skater : StatsManager_GetGoalStatus <index> 
			IF ( <status> = 1 ) 
				count = ( <count> + 1 ) 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN count = <count> 
ENDSCRIPT

SCRIPT update_stats_menu_count 
	IF NOT ScreenElementExists id = stat_count 
		RETURN 
	ENDIF 
	IF GameModeEquals is_classic 
		GetStatValue <name> 
		IF GotParam overridden 
			text = "OVERRIDES ARE ON!" 
		ELSE 
			GetStatValue points_available 
			FormatText textname = text "Points Available: %i" i = <stat_value> 
		ENDIF 
		SetScreenElementProps id = stat_count text = <text> 
		RETURN 
	ENDIF 
	GetStatValue <name> 
	IF ( <stat_value> > 10 ) 
		stat_value = 10 
	ENDIF 
	FormatText textname = text "%i" i = <stat_value> 
	SetScreenElementProps id = stat_count text = <text> 
	IF GotParam overridden 
		text = "THESE VALUES CURRENTLY BEING OVERRIDDEN!" 
	ELSE 
		IF sub_menu : GetSingleTag can_edit 
			get_stats_menu_goal_count name = <name> 
			left = ( <count> - <stat_value> ) 
			<row_id> : GetSingleTag display_string 
			FormatText textname = text "%i %a points available" i = <left> a = <display_string> 
		ELSE 
			FormatText textname = text "You can\'t change your Teammate\'s stats!" i = <left> a = <display_string> 
		ENDIF 
	ENDIF 
	SetScreenElementProps id = stat_count2 text = <text> 
ENDSCRIPT

SCRIPT build_stat_goals_menu stat_type = air 
	IF NOT sub_menu : GetSingleTag can_edit 
		RETURN 
	ENDIF 
	Theme_GetUnhighlightedTextColor return_value = on_rgba 
	IF ScreenElementExists id = stat_goal_menu 
		DestroyScreenElement id = stat_goal_menu 
	ENDIF 
	CreateScreenElement { 
		type = VMenu 
		parent = sub_menu 
		id = stat_goal_menu 
		font = dialog 
		just = [ center top ] 
		pos = PAIR(320.00000000000, 255.00000000000) 
		padding_scale = 0.75000000000 
		internal_scale = 1 
		internal_just = [ center top ] 
	} 
	GetArraySize stats_goals 
	index = 0 
	BEGIN 
		skater : StatsManager_GetGoalStatus <index> 
		IF ( ( ( stats_goals [ <index> ] ) . stattype ) = <stat_type> ) 
			SWITCH <status> 
				CASE 2 
					text = "Turn Am to Unlock" 
					alpha = 0.50000000000 
				CASE 3 
					text = "Turn Pro to Unlock" 
					alpha = 0.50000000000 
				DEFAULT 
					GoalManager_GetDifficultyLevel 
					string = ( ( stats_goals [ <index> ] ) . text ) 
					value = ( ( stats_goals [ <index> ] ) . value [ <difficulty_level> ] ) 
					IF ( <value> = 1 ) 
						string = ( ( stats_goals [ <index> ] ) . alt_text ) 
					ENDIF 
					IF StructureContains structure = ( stats_goals [ <index> ] ) value_string 
						vstring = ( ( stats_goals [ <index> ] ) . value_string [ <difficulty_level> ] ) 
					ENDIF 
					IF NOT StructureContains structure = ( stats_goals [ <index> ] ) no_commas 
						FormatText textname = text <string> i = <value> s = <vstring> UseCommas 
					ELSE 
						FormatText textname = text <string> i = <value> s = <vstring> 
					ENDIF 
					alpha = 1.00000000000 
			ENDSWITCH 
			IF ( <status> = 1 ) 
				rgba = [ 30 30 30 80 ] 
			ELSE 
				rgba = <on_rgba> 
			ENDIF 
			CreateScreenElement { 
				type = ContainerElement 
				parent = stat_goal_menu 
				just = [ center top ] 
				internal_just = [ center center ] 
				dims = PAIR(0.00000000000, 20.00000000000) 
				alpha = <info_panel_alpha> 
			} 
			anchor_id = <id> 
			CreateScreenElement { 
				type = TextElement 
				parent = <anchor_id> 
				font = dialog 
				just = [ center top ] 
				scale = 0.80000001192 
				text = <text> 
				rgba = <rgba> 
				z_priority = 4 
				alpha = <alpha> 
			} 
			GetScreenElementDims id = <id> 
			scale = PAIR(61.00000000000, 0.30000001192) 
			IF ( <status> = 1 ) 
				CreateScreenElement { 
					type = SpriteElement 
					parent = <anchor_id> 
					texture = white2 
					just = [ center center ] 
					scale = <scale> 
					pos = PAIR(0.00000000000, 9.00000000000) 
					rgba = <rgba> 
					z_priority = 5 
					alpha = <alpha> 
				} 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT focus_stats_vmenu 
	IF ScreenElementExists id = change_stat_sub_anchor 
		stats_change_menu_left <...> 
		RETURN 
	ENDIF 
	PlaySound MenuUp vol = 100 
	FireEvent type = unfocus target = sub_vmenu2 
	FireEvent type = focus target = sub_vmenu data = { grid_index = <grid_index> } 
ENDSCRIPT

SCRIPT focus_stats_vmenu2 
	IF ScreenElementExists id = change_stat_sub_anchor 
		stats_change_menu_right <...> 
		RETURN 
	ENDIF 
	PlaySound MenuUp vol = 100 
	FireEvent type = unfocus target = sub_vmenu 
	FireEvent type = focus target = sub_vmenu2 data = { grid_index = <grid_index> } 
ENDSCRIPT

SCRIPT stats_menu_create_stats_block parent = current_menu scale = 1 pos = PAIR(180.00000000000, 147.00000000000) 
	IF isNGC 
		MemPushContext TopDownHeap 
		heap = TopDown 
	ELSE 
		heap = FrontEnd 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = stats_block_anchor 
		pos = <pos> 
		just = [ left top ] 
		dims = PAIR(640.00000000000, 480.00000000000) 
		scale = <scale> 
		heap = <heap> 
	} 
	<stats_parent> = <id> 
	GetArraySize stat_names 
	<index> = 0 
	BEGIN 
		stats_menu_add_item { 
			( stat_names [ <index> ] ) 
			stats_parent = <stats_parent> 
			pro_name = <pro_name> 
			index = <index> 
			on = <on> 
			heap = <heap> 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	<pos> = ( PAIR(0.00000000000, 1.00000000000) * ( 23 * ( <index> + 1 ) ) ) 
	<pos> = ( <pos> + PAIR(150.00000000000, -12.00000000000) ) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = stats_block_anchor 
		id = stats_bottom_anchor 
		dims = PAIR(200.00000000000, 20.00000000000) 
		pos = <pos> 
		z_priority = 10 
		heap = <heap> 
	} 
	IF isNGC 
		MemPopContext 
	ENDIF 
ENDSCRIPT

SCRIPT stats_menu_add_item z_priority = 2 highlight_bar_scale = PAIR(3.09999990463, 0.69999998808) highlight_bar_pos = PAIR(90.00000000000, -7.00000000000) pad_right_script = null_script pad_left_script = null_script 
	FormatText ChecksumName = row_id "stats_menu_names_%n" n = <index> 
	<pos> = ( PAIR(0.00000000000, 1.00000000000) * ( 23 * ( <index> + 1 ) ) ) 
	<pos> = ( <pos> + PAIR(150.00000000000, -12.00000000000) ) 
	IF ScreenElementExists id = sub_menu 
		sub_menu : GetSingleTag can_edit 
	ENDIF 
	IF GotParam can_edit 
		choose_script1 = stats_menu_build_change_menu 
		choose_script2 = generic_menu_pad_choose_sound 
		choose_params = { parent = <stats_parent> row_id = <row_id> name = <name> } 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <stats_parent> 
			id = <row_id> 
			local_id = <name> 
			dims = PAIR(200.00000000000, 20.00000000000) 
			pos = <pos> 
			just = [ center center ] 
			event_handlers = [ 
				{ focus stats_menu_focus params = { name = <name> row_id = <row_id> string = <string> description = <description> } } 
				{ unfocus stats_menu_unfocus params = { name = <name> row_id = <row_id> } } 
				{ pad_right <pad_right_script> params = { <pad_right_params> row_id = <row_id> name = <name> } } 
				{ pad_left <pad_left_script> params = { <pad_left_params> row_id = <row_id> name = <name> } } 
				{ pad_choose <choose_script1> params = <choose_params> } 
				{ pad_start <choose_script1> params = <choose_params> } 
				{ pad_choose <choose_script2> } 
				{ pad_start <choose_script2> } 
			] 
			heap = <heap> 
		} 
	ELSE 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <stats_parent> 
			id = <row_id> 
			local_id = <name> 
			dims = PAIR(200.00000000000, 20.00000000000) 
			pos = <pos> 
			just = [ center center ] 
			heap = <heap> 
		} 
	ENDIF 
	<anchor_id> = <id> 
	IF GotParam not_focusable 
		SetScreenElementProps { 
			id = <anchor_id> 
			not_focusable 
		} 
	ENDIF 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	IF GotParam short_string 
		<string> = <short_string> 
	ENDIF 
	<anchor_id> : SetTags display_string = <string> 
	IF LevelIs Load_MainMenu 
		font = dialog 
		size = PAIR(1.20000004768, 0.89999997616) 
	ELSE 
		font = small 
		size = 1.25000000000 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		rgba = <text_rgba> 
		font = <font> 
		scale = <size> 
		text = <string> 
		z_priority = <z_priority> 
		just = [ right center ] 
		pos = PAIR(90.00000000000, -5.00000000000) 
		z_priority = 5 
		heap = <heap> 
	} 
	IF GotParam on 
		highlight_rgba = ( stats_menu_bar_highlight ) 
	ELSE 
		highlight_rgba = ( stats_menu_bar_lowlight ) 
	ENDIF 
	build_stat_slider parent = <row_id> pos = PAIR(95.00000000000, -5.00000000000) 
	stats_menu_update_row { 
		name = <name> 
		pro_name = <pro_name> 
		row_id = <row_id> 
		highlight_rgba = <highlight_rgba> 
	} 
	IF GotParam StatMenu 
		DoScreenElementMorph { 
			id = <row_id> 
			scale = 0.80000001192 
		} 
		Theme_GetPauseBarColor return_value = bar_color 
		IF GameModeEquals is_classic 
			scale = PAIR(52.00000000000, 3.50000000000) 
		ELSE 
			scale = PAIR(36.00000000000, 3.50000000000) 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <row_id> 
			local_id = bg_bar 
			rgba = <bar_color> 
			alpha = 0 
			texture = white2 
			scale = <scale> 
			z_priority = 3 
			just = [ center center ] 
			pos = PAIR(154.00000000000, -5.50000000000) 
			heap = <heap> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT stats_menu_classic_focus 
	build_stat_arrows parent = { classic_stats_vmenu child = <name> } 
ENDSCRIPT

SCRIPT stats_menu_classic_unfocus 
	IF ScreenElementExists id = right_arrow 
		DestroyScreenElement id = right_arrow 
		DestroyScreenElement id = left_arrow 
	ENDIF 
ENDSCRIPT

SCRIPT stats_menu_build_change_menu 
	IF ScreenElementExists id = change_stat_sub_anchor 
		kill_stats_change_menu <...> 
		RETURN 
	ENDIF 
	GetStatValue <name> 
	IF GotParam overridden 
		SetAllStats value = 0 
		GetArraySize stat_names 
		index = 0 
		BEGIN 
			FormatText ChecksumName = row_id2 "stats_menu_names_%n" n = <index> 
			stats_menu_unfocus name = ( ( stat_names [ <index> ] ) . name ) row_id = <row_id2> highlight_rgba = [ 50 50 50 100 ] bar_bg_rgba = [ 100 100 100 128 ] 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	SetScreenElementLock id = { <parent> child = <name> } off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = { <parent> child = <name> } 
		id = change_stat_sub_anchor 
		event_handlers = [ { pad_back kill_stats_change_menu params = <...> } 
			{ pad_left stats_change_menu_left params = { row_id = <row_id> name = <name> } } 
			{ pad_right stats_change_menu_right params = { row_id = <row_id> name = <name> } } 
		] 
	} 
	create_helper_text helper_text_elements = helper_text_change_elements 
	build_stat_arrows parent = change_stat_sub_anchor 
	id = { <parent> child = { <name> child = bg_bar } } 
	SetScreenElementLock id = <id> off 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		local_id = stat_roundbar_highlight 
		texture = roundbar_highlight 
		pos = PAIR(0.00000000000, 4.00000000000) 
		rgba = [ 128 , 128 , 128 , 128 ] 
		alpha = 0 
		just = [ left center ] 
		z_priority = 5 
		scale = PAIR(0.10000000149, 0.38499999046) 
	} 
	RunScriptOnScreenElement id = <id> stats_menu_bar_do_highlight 
	FireEvent type = unfocus target = sub_menu 
	FireEvent type = focus target = { <parent> child = <name> } 
	FireEvent type = focus target = change_stat_sub_anchor 
ENDSCRIPT

SCRIPT build_stat_arrows 
	SetScreenElementLock id = <parent> off 
	Theme_GetMenuTitleColor return_value = arrow_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		id = left_arrow 
		texture = left_arrow 
		rgba = <arrow_color> 
		scale = PAIR(1.29999995232, 1.10000002384) 
		pos = PAIR(-11.00000000000, -5.50000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		id = right_arrow 
		texture = right_arrow 
		rgba = <arrow_color> 
		scale = PAIR(1.29999995232, 1.10000002384) 
		pos = PAIR(319.00000000000, -5.50000000000) 
		just = [ right center ] 
	} 
ENDSCRIPT

SCRIPT stats_menu_bar_do_highlight 
	Theme_GetPauseBarColor return_value = bar_color 
	SetProps rgba = <bar_color> 
	DoMorph alpha = 0.89999997616 
	BEGIN 
		DoMorph pos = PAIR(6.50000000000, 4.00000000000) time = 0.50000000000 anim = gentle 
		DoMorph pos = PAIR(-0.20000000298, 4.00000000000) time = 0.50000000000 anim = gentle 
	REPEAT 
ENDSCRIPT

SCRIPT kill_stats_change_menu 
	DestroyScreenElement id = change_stat_sub_anchor 
	highlight_bar_id = { <parent> child = { <name> child = { bg_bar child = stat_roundbar_highlight } } } 
	IF ScreenElementExists id = <highlight_bar_id> 
		DestroyScreenElement id = <highlight_bar_id> 
	ENDIF 
	FireEvent type = focus target = <parent> 
	create_helper_text helper_text_elements = helper_text_select_elements 
ENDSCRIPT

SCRIPT stats_change_menu_right 
	DoScreenElementMorph id = right_arrow alpha = 0 
	DoScreenElementMorph id = right_arrow alpha = 1 time = 0.20000000298 
	IF GameModeEquals is_classic 
		GetStatValue points_available 
		available = <stat_value> 
		IF ( <available> > 0 ) 
			GetStatValue <name> 
			IF GotParam overridden 
				RETURN 
			ENDIF 
			IF ( <stat_value> < 10 ) 
				stat_menu_change_stat name = <name> value = ( <stat_value> + 1 ) 
				stat_menu_change_stat name = points_available value = ( <available> -1 ) 
			ENDIF 
		ENDIF 
	ELSE 
		get_stats_menu_goal_count name = <name> 
		GetStatValue <name> 
		IF ( <count> > <stat_value> ) 
			stat_menu_change_stat name = <name> value = ( <stat_value> + 1 ) 
		ENDIF 
	ENDIF 
	stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = stats_menu_bar_highlight 
ENDSCRIPT

SCRIPT stats_change_menu_left 
	DoScreenElementMorph id = left_arrow alpha = 0 
	DoScreenElementMorph id = left_arrow alpha = 1 time = 0.20000000298 
	GetStatValue <name> 
	value = <stat_value> 
	IF ( <value> > 0 ) 
		IF GameModeEquals is_classic 
			IF GotParam overridden 
				RETURN 
			ENDIF 
			GetStatValue points_available 
			stat_menu_change_stat name = points_available value = ( <stat_value> + 1 ) 
		ENDIF 
		stat_menu_change_stat name = <name> value = ( <value> -1 ) 
		stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = stats_menu_bar_highlight 
	ENDIF 
ENDSCRIPT

SCRIPT build_stat_slider 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		texture = roundbar_tip_left 
		scale = 0.75000000000 
		rgba = stats_menu_bar_lowlight 
		pos = <pos> 
		just = [ left center ] 
		local_id = roundbar_left 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		texture = roundbar_middle 
		scale = PAIR(4.69999980927, 0.75000000000) 
		rgba = stats_menu_bar_lowlight 
		pos = ( <pos> + PAIR(24.00000000000, 0.00000000000) ) 
		just = [ left center ] 
		local_id = roundbar_middle 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		texture = roundbar_tip_right 
		scale = 0.75000000000 
		rgba = stats_menu_bar_lowlight 
		pos = ( <pos> + PAIR(174.00000000000, 0.00000000000) ) 
		just = [ left center ] 
		local_id = roundbar_right 
		z_priority = 5 
	} 
	IF GameModeEquals is_classic 
		texture = circle 
		scale = 1.41999995708 
	ELSE 
		texture = star 
		scale = 0.30000001192 
	ENDIF 
	<pos> = ( <pos> + PAIR(4.00000000000, -10.50000000000) ) 
	<index> = 0 
	BEGIN 
		FormatText ChecksumName = local_id "star_%i" i = <index> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent> 
			texture = <texture> 
			scale = <scale> 
			rgba = stats_menu_star_lowlight 
			pos = <pos> 
			just = [ left top ] 
			local_id = <local_id> 
			z_priority = 6 
		} 
		GetStackedScreenElementPos id = <id> X 
		<index> = ( <index> + 1 ) 
	REPEAT 10 
ENDSCRIPT

stats_color_1 = [ 40 0 0 80 ] 
stats_color_2 = [ 128 0 0 80 ] 
SCRIPT stat_menu_change_stat 
	IF GameModeEquals is_classic 
		SetClassicStat <name> <value> 
	ELSE 
		GetCurrentSkaterProfileIndex 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> <name> <value> 
	ENDIF 
ENDSCRIPT

SCRIPT stats_menu_get_skater_name_and_family 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN { skater_name = <name> skater_family = <skater_family> } 
ENDSCRIPT

SCRIPT stats_menu_update_row highlight_rgba = [ 100 100 100 80 ] locked_highlight_rgba = [ 50 50 50 80 ] slider_rgba = [ 128 128 128 0 ] 
	IF IsTrue gary_debug 
		IF GotParam skater_name 
			script_assert "Get rid of skater name" 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = sub_menu 
		sub_menu : GetSingleTag skater_name 
		GetStatValue <name> skater = <skater_name> 
	ELSE 
		IF GotParam pro_name 
			GetStatValue <name> skater = <pro_name> 
		ELSE 
			GetStatValue <name> 
		ENDIF 
	ENDIF 
	need_count = 0 
	IF NOT LevelIs Load_MainMenu 
		IF NOT GameModeEquals is_classic 
			IF ScreenElementExists id = sub_menu 
				IF sub_menu : GetSingleTag can_edit 
					IF NOT GotParam overridden 
						need_count = 1 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <stat_value> > 10 ) 
		<stat_value> = 10 
	ENDIF 
	IF ( <need_count> = 1 ) 
		get_stats_menu_goal_count name = <name> 
	ELSE 
		count = <stat_value> 
	ENDIF 
	SetScreenElementProps { 
		id = { <row_id> child = roundbar_left } 
		rgba = <highlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <row_id> child = roundbar_middle } 
		rgba = <highlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <row_id> child = roundbar_right } 
		rgba = <highlight_rgba> 
	} 
	<index> = 0 
	BEGIN 
		FormatText ChecksumName = local_id "star_%i" i = <index> 
		alpha = 1 
		IF ( <index> < <count> ) 
			color = stats_menu_star_highlight 
			IF NOT ( <index> < <stat_value> ) 
				alpha = 0.30000001192 
			ENDIF 
		ELSE 
			color = stats_menu_star_lowlight 
		ENDIF 
		SetScreenElementProps { 
			id = { <row_id> child = <local_id> } 
			rgba = <color> 
		} 
		DoScreenElementMorph id = { <row_id> child = <local_id> } alpha = <alpha> 
		<index> = ( <index> + 1 ) 
	REPEAT 10 
	IF ScreenElementExists id = stat_count 
		update_stats_menu_count <...> 
	ENDIF 
ENDSCRIPT

SCRIPT stats_menu_focus 
	IF GameModeEquals is_classic 
		stats_menu_classic_focus <...> 
	ENDIF 
	stats_menu_update_row { 
		name = <name> 
		row_id = <row_id> 
		highlight_rgba = stats_menu_bar_highlight 
	} 
	stats_menu_done_focus <...> 
ENDSCRIPT

SCRIPT stats_menu_unfocus 
	IF GameModeEquals is_classic 
		stats_menu_classic_unfocus <...> 
	ENDIF 
	stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = [ 50 50 50 100 ] bar_bg_rgba = [ 100 100 100 128 ] 
	stats_menu_done_unfocus <...> 
ENDSCRIPT

SCRIPT stats_menu_done_focus description = "" 
	GetTags 
	Theme_GetHighlightedTextColorNew return_value = text_rgba 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = <text_rgba> 
	} 
	IF ObjectExists id = stat_title 
		FormatText textname = stat_title "%i:" i = <string> 
		SetScreenElementProps { 
			id = stat_title 
			text = <stat_title> 
		} 
	ENDIF 
	IF ObjectExists id = stat_point_description 
		SetScreenElementProps { 
			id = stat_point_description 
			text = <description> 
		} 
	ENDIF 
	IF ScreenElementExists id = { <row_id> child = bg_bar } 
		DoScreenElementMorph id = { <row_id> child = bg_bar } alpha = 0.75000000000 
	ENDIF 
	build_stat_goals_menu stat_type = <name> 
ENDSCRIPT

SCRIPT stats_menu_done_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColorNew return_value = text_rgba 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = <text_rgba> 
	} 
	IF ScreenElementExists id = { <row_id> child = bg_bar } 
		DoScreenElementMorph id = { <row_id> child = bg_bar } alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT stats_menu_exit 
	UpdateSkaterStats player = 0 
	IF LevelIs Load_MainMenu 
		skater : add_skater_to_world 
		launch_ss_menu 
	ELSE 
		create_your_options_menu 
	ENDIF 
ENDSCRIPT


