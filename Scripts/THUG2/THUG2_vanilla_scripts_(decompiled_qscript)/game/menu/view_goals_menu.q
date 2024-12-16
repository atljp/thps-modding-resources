
view_goals_test_slide = 1 
skater_goal_list_names = [ 
	{ 
		Name = "YOU" 
		Value = custom 
	} 
	{ 
		Name = "PRO" 
		Value = pro 
	} 
	{ 
		Name = "GUEST" 
		Value = guest 
	} 
	{ 
		Name = "SECRET" 
		Value = flavor 
	} 
] 
SCRIPT array_next_wraparound index = 0 
	IF NOT GotParam array 
		RETURN 0 
	ENDIF 
	<index> = ( <index> + 1 ) 
	GetArraySize <array> 
	IF ( <index> = <array_size> ) 
		<index> = 0 
	ENDIF 
	RETURN index = <index> 
ENDSCRIPT

SCRIPT array_previous_wraparound index = 0 
	IF NOT GotParam array 
		RETURN 0 
	ENDIF 
	<index> = ( <index> - 1 ) 
	IF ( <index> = -1 ) 
		GetArraySize <array> 
		<index> = ( <array_size> - 1 ) 
	ENDIF 
	RETURN index = <index> 
ENDSCRIPT

SCRIPT KillEventHandlers 
	SetScreenElementProps { 
		id = current_menu_anchor 
		event_handlers = [ 
			{ pad_up nullscript } 
			{ pad_down nullscript } 
			{ pad_left nullscript } 
			{ pad_right nullscript } 
			{ pad_back nullscript } 
			{ pad_choose nullscript } 
		] 
		replace_handlers 
	} 
ENDSCRIPT

SCRIPT view_goals_wait_and_setup_input 
	GetTags 
	IF GotParam goal 
		action = view_goals_menu_choose_goal 
		params = { goal_list_index = <goal_list_index> } 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_up nullscript } 
				{ pad_down nullscript } 
				{ pad_left nullscript } 
				{ pad_right nullscript } 
				{ pad_back <action> params = <params> } 
				{ pad_choose <action> params = <params> } 
			] 
			replace_handlers 
		} 
	ELSE 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_left view_goals_menu_pad_left params = { goal_list_index = <goal_list_index> } } 
				{ pad_right view_goals_menu_pad_right params = { goal_list_index = <goal_list_index> } } 
				{ pad_back view_goals_menu_exit } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF root_window : GetSingleTag view_goals_shortcut_on 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_select view_goals_menu_exit } 
			] 
			replace_handlers 
		} 
	ENDIF 
	wait 0.15000000596 seconds 
	IF ScreenElementExists id = view_goals_root 
		view_goals_root : RemoveTags tags = [ animating_scroll animating_select ] 
	ENDIF 
ENDSCRIPT

SCRIPT GetCurrentGoalListIndex 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	SWITCH <skater_family> 
		CASE family_pro 
			goal_list_index = 1 
		CASE family_guest 
			goal_list_index = 2 
		CASE family_flavor 
			goal_list_index = 3 
		DEFAULT 
			goal_list_index = 0 
	ENDSWITCH 
	RETURN goal_list_index = <goal_list_index> 
ENDSCRIPT

SCRIPT view_goals_menu_pad_right 
	IF NOT ScreenElementExists id = right_arrow 
		RETURN 
	ENDIF 
	IF view_goals_root : GetSingleTag animating_select 
		RETURN 
	ENDIF 
	view_goals_root : SetTags animating_scroll 
	generic_menu_scroll_sideways_sound 
	array_next_wraparound index = <goal_list_index> array = skater_goal_list_names 
	level_select_arrow_blink_right 
	IF ( view_goals_test_slide = 1 ) 
		DoScreenElementMorph id = goal_list_container pos = PAIR(1300.00000000000, 0.00000000000) time = 0.15000000596 
		wait 0.15000000596 seconds 
	ENDIF 
	view_goals_menu_create goal_list_index = <index> highlight_tab change_list 
	IF ( view_goals_test_slide = 1 ) 
		DoScreenElementMorph id = goal_list_container pos = PAIR(-1300.00000000000, 0.00000000000) time = 0 
		DoScreenElementMorph id = goal_list_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.15000000596 
		wait 0.15000000596 seconds 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_pad_left 
	IF NOT ScreenElementExists id = left_arrow 
		RETURN 
	ENDIF 
	IF view_goals_root : GetSingleTag animating_select 
		RETURN 
	ENDIF 
	view_goals_root : SetTags animating_scroll 
	generic_menu_scroll_sideways_sound 
	array_previous_wraparound index = <goal_list_index> array = skater_goal_list_names 
	level_select_arrow_blink_left 
	IF ( view_goals_test_slide = 1 ) 
		DoScreenElementMorph id = goal_list_container pos = PAIR(-1000.00000000000, 0.00000000000) time = 0.15000000596 
		wait 0.15000000596 seconds 
	ENDIF 
	view_goals_menu_create goal_list_index = <index> highlight_tab change_list 
	IF ( view_goals_test_slide = 1 ) 
		DoScreenElementMorph id = goal_list_container pos = PAIR(1000.00000000000, 0.00000000000) time = 0 
		DoScreenElementMorph id = goal_list_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.15000000596 
		wait 0.15000000596 seconds 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_tab_highlight 
	GetTags 
	DoScreenElementMorph id = <id> alpha = 0.69999998808 time = 0 
	DoScreenElementMorph id = <id> scale = 1.50000000000 relative_scale time = 0.50000000000 
	DoScreenElementMorph id = <id> alpha = 0 time = 0.50000000000 
	GetScreenElementPosition id = <id> 
	GetScreenElementDims id = <id> 
	wait 0.50000000000 seconds 
	IF ScreenElementExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT FadeAfterDelay 
	wait <delay> seconds 
	IF ScreenElementExists id = <id1> 
		DoScreenElementMorph id = <id1> alpha = <alpha> time = <delay> 
	ENDIF 
	IF GotParam id2 
		IF ScreenElementExists id = <id2> 
			DoScreenElementMorph id = <id2> alpha = <alpha> time = <delay> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_fade_tabs 
	GetArraySize skater_goal_list_names 
	counter = 0 
	BEGIN 
		FormatText ChecksumName = tabname "view_goals_tab%i" i = <counter> 
		FormatText ChecksumName = textname "view_goals_text%i" i = <counter> 
		IF ScreenElementExists id = <tabname> 
			IF GotParam goal 
				IF ( <counter> = <goal_list_index> ) 
					spawnscript FadeAfterDelay params = { id1 = <tabname> id2 = <textname> delay = 0.10000000149 alpha = 0 } 
				ELSE 
					DoScreenElementMorph id = <tabname> alpha = 0 time = 0.10000000149 
					DoScreenElementMorph id = <textname> alpha = 0 time = 0.10000000149 
				ENDIF 
			ELSE 
				IF ( <counter> = <goal_list_index> ) 
					DoScreenElementMorph id = <tabname> alpha = 1 time = 0.10000000149 
					DoScreenElementMorph id = <textname> alpha = 1 time = 0.10000000149 
				ELSE 
					spawnscript FadeAfterDelay params = { id1 = <tabname> id2 = <textname> delay = 0.10000000149 alpha = 1 } 
				ENDIF 
			ENDIF 
		ENDIF 
		<counter> = ( <counter> + 1 ) 
	REPEAT <array_size> 
	IF GotParam goal 
	ELSE 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_build_tabs 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		id = tab_container 
		not_focusable 
	} 
	Theme_GetMenuTitleColor return_value = title_color 
	CreateScreenElement { 
		type = TextElement 
		parent = tab_container 
		id = view_goals_title 
		font = testtitle 
		text = "VIEW GOALS" 
		pos = PAIR(515.00000000000, 13.00000000000) 
		scale = 1.50000000000 
		rgba = <title_color> 
		just = [ center top ] 
		z_priority = -10 
	} 
	<tab_pos> = PAIR(28.00000000000, 20.00000000000) 
	GetArraySize skater_goal_list_names 
	counter = 0 
	IF view_goals_root : GetSingleTag simple_list 
		counter = <goal_list_index> 
		array_size = 1 
	ENDIF 
	BEGIN 
		next_offset = PAIR(141.00000000000, 0.00000000000) 
		FormatText ChecksumName = tabname "view_goals_tab%i" i = <counter> 
		FormatText ChecksumName = textname "view_goals_text%i" i = <counter> 
		IF ( <counter> = <goal_list_index> ) 
			Theme_GetSupportPieceColor return_value = tab_color 
			Theme_GetPauseBarColor return_value = font_color 
			tab_scale = PAIR(1.25000000000, 1.19000005722) 
			font_scale = PAIR(1.10000002384, 1.39999997616) 
			tab_offset = PAIR(0.00000000000, 25.00000000000) 
			text_tab_relative_offset = PAIR(80.00000000000, 21.00000000000) 
			z_priority = ( <array_size> + 1 ) 
		ELSE 
			tab_color = [ 50 50 50 128 ] 
			font_color = [ 70 70 70 255 ] 
			tab_scale = PAIR(1.25000000000, 0.89999997616) 
			font_scale = PAIR(1.10000002384, 1.00000000000) 
			text_tab_relative_offset = PAIR(80.00000000000, 16.00000000000) 
			tab_offset = PAIR(0.00000000000, 34.00000000000) 
			z_priority = ( <array_size> - <counter> ) 
		ENDIF 
		IF ( ( <counter> = 0 ) | ( <counter> = <goal_list_index> ) ) 
			texture = goal_tab 
		ELSE 
			texture = goal_tab_2 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			parent = tab_container 
			id = <tabname> 
			texture = <texture> 
			rgba = <tab_color> 
			scale = <tab_scale> 
			pos = ( <tab_pos> + <tab_offset> ) 
			just = [ left top ] 
			z_priority = <z_priority> 
		} 
		IF ( <counter> = <goal_list_index> ) 
			IF GotParam highlight_tab 
				CreateScreenElement { 
					type = TextElement 
					parent = tab_container 
					id = tab_highlight 
					font = small 
					rgba = <font_color> 
					text = ( ( skater_goal_list_names [ <counter> ] ) . Name ) 
					scale = <font_scale> 
					pos = ( <tab_pos> + <text_tab_relative_offset> + <tab_offset> ) 
					just = [ center center ] 
					z_priority = ( <array_size> + 2 ) 
				} 
				RunScriptOnScreenElement id = tab_highlight view_goals_tab_highlight 
			ENDIF 
		ENDIF 
		CreateScreenElement { 
			type = TextElement 
			parent = tab_container 
			id = <textname> 
			font = small 
			rgba = <font_color> 
			text = ( ( skater_goal_list_names [ <counter> ] ) . Name ) 
			scale = <font_scale> 
			pos = ( <tab_pos> + <text_tab_relative_offset> + <tab_offset> ) 
			just = [ center center ] 
			z_priority = ( <array_size> + 2 ) 
		} 
		array_next_wraparound index = <goal_list_index> array = skater_goal_list_names 
		<tab_pos> = ( <tab_pos> + <next_offset> ) 
		<counter> = ( <counter> + 1 ) 
	REPEAT <array_size> 
	Theme_GetAltColor return_value = grad_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_container 
		id = grad_bar 
		texture = goal_grad 
		rgba = <grad_color> 
		scale = PAIR(19.00000000000, 1.00000000000) 
		pos = PAIR(30.00000000000, 83.00000000000) 
		just = [ left top ] 
		z_priority = 35 
	} 
ENDSCRIPT

SCRIPT ProcessGoalList 
	IF NOT GotParam actionScript 
		RETURN 
	ENDIF 
	IF NOT GotParam goal_list_index 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = view_goals_root 
		IF view_goals_root : GetSingleTag simple_list 
			goal_list_index = 0 
		ENDIF 
	ENDIF 
	Name = ( ( skater_goal_list_names [ <goal_list_index> ] ) . Value ) 
	hide_goal_details = 0 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = level_info "Level_%i" i = <level_prefix> 
	IF StructureContains structure = <level_info> special_ped_info 
		GetArraySize ( <level_info> . special_ped_info ) 
		index = 0 
		BEGIN 
			ped = ( ( <level_info> . special_ped_info ) [ <index> ] ) 
			IF ( ( <ped> . type ) = <Name> ) 
				IF StructureContains structure = <ped> Name 
					<Name> = ( <ped> . Name ) 
					GetSkaterProfileInfoByName Name = <Name> 
				ENDIF 
				IF StructureContains structure = <ped> flag 
					found_flag = ( <ped> . flag ) 
				ENDIF 
				IF GotParam found_flag 
					IF NOT GetGlobalFlag flag = <found_flag> 
						hide_goal_details = 1 
					ENDIF 
				ENDIF 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	IF ( <hide_goal_details> = 0 ) 
		GoalManager_GetViewGoalsInfo skater = <Name> 
		IF IsArray <view_goals_info> 
			GetArraySize <view_goals_info> 
			<index> = 0 
			BEGIN 
				<actionScript> goal = ( <view_goals_info> [ <index> ] ) goal_list_index = <goal_list_index> reminder_pos = <pos> 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			<actionScript> goal = { view_goals_text = "This character has no goals." goal_id = blank } goal_list_index = <goal_list_index> not_focusable reminder_pos = <pos> 
		ENDIF 
	ELSE 
		IF GotParam lockedScript 
			<lockedScript> <...> 
			RETURN locked = 1 
		ENDIF 
	ENDIF 
	IF GotParam pos 
		RETURN pos = <pos> 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoalSelectable 
	IF GotParam not_focusable 
		focusable = { not_focusable } 
	ELSE 
		focusable = { } 
	ENDIF 
	IF NOT view_goals_root : GetSingleTag allow_description 
		pad_choose_script = view_goals_menu_exit 
	ELSE 
		pad_choose_script = view_goals_menu_choose_goal 
	ENDIF 
	add_roundbar_menu_item { text = ( <goal> . view_goals_text ) 
		id = ( <goal> . goal_id ) 
		pad_choose_script = <pad_choose_script> 
		pad_choose_sound = nullscript 
		goal = <goal> 
		goal_list_index = <goal_list_index> 
		single_camera 
		<focusable> 
	} 
ENDSCRIPT

SCRIPT view_goals_menu_build_list goal_list_index = 0 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		id = goal_list_container 
		not_focusable 
	} 
	make_new_vg_menu { 
		parent = goal_list_container 
		padding_scale = 1 
		menu_id = view_goals_menu 
		vmenu_id = view_goals_vmenu 
		pos = PAIR(50.00000000000, 98.00000000000) 
	} 
	ProcessGoalList goal_list_index = <goal_list_index> actionScript = AddGoalSelectable lockedScript = view_goals_locked_message 
	IF NOT GotParam locked 
		IF NOT view_goals_root : GetSingleTag simple_list 
			view_goals_list_message 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_build_details 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		id = goal_list_container 
		not_focusable 
	} 
	Theme_GetAltColor return_value = grad_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = goal_list_container 
		not_focusable 
		rot_angle = 90 
		texture = goal_grad 
		just = [ left top ] 
		pos = PAIR(600.00000000000, 86.00000000000) 
		rgba = [ 0 14 10 128 ] 
		alpha = 0.30000001192 
		scale = PAIR(8.00000000000, 143.00000000000) 
		zpriority = -1 
	} 
	Theme_GetAltColor return_value = grad_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = goal_list_container 
		not_focusable 
		rot_angle = 90 
		texture = goal_grad 
		just = [ left top ] 
		pos = PAIR(600.00000000000, 86.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.30000001192 
		scale = PAIR(8.00000000000, 143.00000000000) 
		zpriority = -1 
	} 
	make_new_vg_menu { 
		parent = goal_list_container 
		padding_scale = 1 
		menu_id = view_goals_menu 
		vmenu_id = view_goals_vmenu 
		pos = PAIR(130.00000000000, 98.00000000000) 
	} 
	Theme_GetPauseBarColor return_value = title_text_color 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		id = goal_title_container 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = goal_title_container 
		id = goal_details_title 
		font = small 
		text = ( <goal> . view_goals_text ) 
		pos = PAIR(32.00000000000, 92.00000000000) 
		just = [ left bottom ] 
		scale = PAIR(1.39999997616, 1.89999997616) 
		rgba = <title_text_color> 
		shadow 
		shadow_rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_offs = PAIR(2.00000000000, 2.00000000000) 
		z_priority = 49 
	} 
	FormatText textname = points "%p PTS." p = ( <goal> . reward_points ) 
	CreateScreenElement { 
		type = TextElement 
		parent = goal_title_container 
		id = goal_details_points 
		font = small 
		text = <points> 
		pos = PAIR(600.00000000000, 90.00000000000) 
		just = [ right bottom ] 
		scale = 1.29999995232 
		rgba = <title_text_color> 
		shadow 
		shadow_rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_offs = PAIR(2.00000000000, 2.00000000000) 
	} 
	IF ( ( <goal> . beaten ) = 1 ) 
		GetScreenElementDims id = goal_details_title 
		CreateScreenElement { 
			type = SpriteElement 
			parent = goal_details_title 
			texture = goal_complete_line 
			pos = PAIR(0.00000000000, 10.00000000000) 
			rgba = [ 128 , 128 , 128 , 90 ] 
			just = [ left center ] 
			scale = ( <width> * PAIR(0.00549999997, 0.00000000000) + PAIR(0.00000000000, 0.80000001192) ) 
			z_priority = 50 
		} 
		GetScreenElementDims id = goal_details_points 
		CreateScreenElement { 
			type = SpriteElement 
			parent = goal_details_points 
			texture = goal_complete_line 
			pos = PAIR(0.00000000000, -2.00000000000) 
			rgba = [ 128 , 128 , 128 , 90 ] 
			just = [ left top ] 
			scale = ( <width> * PAIR(0.00549999997, 0.00000000000) + PAIR(0.00000000000, 0.80000001192) ) 
			z_priority = 100 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_build_bottom helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
		{ text = "\\b6/\\b5 = Switch List" } 
		{ text = "\\bm = Goal Details" } 
	] 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		id = bottom_pieces_container 
		not_focusable 
	} 
	IF view_goals_root : GetSingleTag simple_list 
		IF NOT view_goals_root : GetSingleTag allow_description 
			RemoveParameter add_points 
			helper_text_elements = [ { text = "\\bn/\\bm = Done" } ] 
		ELSE 
			IF NOT GotParam goal 
				helper_text_elements = [ 
					{ text = "\\bn = Done" } 
					{ text = "\\bm = Goal Details" } 
				] 
			ENDIF 
		ENDIF 
	ENDIF 
	create_helper_text { 
		parent = bottom_pieces_container 
		helper_pos = PAIR(330.00000000000, 426.00000000000) 
		helper_text_elements = <helper_text_elements> 
	} 
	IF GotParam add_points 
		GoalManager_GetActiveRewardPoints 
		GetCurrentLevelName 
		GetCurrentPointsToAdvance 
		to_advance = ( <points_to_advance> - <active_points> ) 
		IF ( <to_advance> < 0 ) 
			to_advance = 0 
		ENDIF 
		FormatText textname = points1 "%c: %a / %b PTS." a = <active_points> b = <total_points> c = <level_name> 
		Theme_GetAltColor return_value = points1_color 
		FormatText textname = points2 "YOU NEED %a MORE POINTS TO CONTINUE..." a = <to_advance> 
		Theme_GetPauseBarColor return_value = points2_color 
		CreateScreenElement { 
			type = TextElement 
			parent = bottom_pieces_container 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
			font = small 
			text = <points1> 
			rgba = <points1_color> 
			scale = 1.20000004768 
			pos = PAIR(620.00000000000, 350.00000000000) 
			just = [ right top ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = bottom_pieces_container 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
			font = small 
			text = <points2> 
			rgba = <points2_color> 
			scale = 1 
			pos = PAIR(620.00000000000, 375.00000000000) 
			just = [ right top ] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_build_arrows 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		id = arrows_container 
		not_focusable 
	} 
	IF view_goals_root : GetSingleTag simple_list 
		RETURN 
	ENDIF 
	build_big_level_select_arrows parent = arrows_container pos = PAIR(320.00000000000, 67.00000000000) scale = 0.80000001192 z_priority = 20 
ENDSCRIPT

SCRIPT create_view_goals_shortcut 
	IF NOT CD 
		RETURN 
	ENDIF 
	IF NOT GameModeEquals is_career 
		RETURN 
	ENDIF 
	IF LevelIs load_mainmenu 
		RETURN 
	ENDIF 
	root_window : GetTags 
	IF ( <menu_state> = on ) 
		RETURN 
	ENDIF 
	IF NOT SkaterCamAnimFinished 
		RETURN 
	ENDIF 
	IF NOT InNetGame 
		PauseGame 
		PauseMusicAndStreams 1 
	ENDIF 
	GoalManager_PauseAllGoals 
	hide_all_hud_items 
	kill_start_key_binding 
	root_window : SetTags view_goals_shortcut_on 
	view_goals_menu_create 
ENDSCRIPT

SCRIPT view_goals_menu_create 
	change block_proxim_node_updates = 1 
	GoalManager_ReplaceTrickText all 
	hide_current_goal 
	IF ObjectExists id = current_menu_anchor 
		spawnscript menu3d_animate_out params = { die } 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = view_goals_root 
		IF NOT GotParam hold_tabs 
			DestroyScreenElement id = tab_container 
		ENDIF 
		DestroyScreenElement id = goal_list_container 
		DestroyScreenElement id = bottom_pieces_container 
		IF ScreenElementExists id = goal_title_container 
			DestroyScreenElement id = goal_title_container 
		ENDIF 
		IF ScreenElementExists id = menu_gradient 
			DestroyScreenElement id = menu_gradient 
		ENDIF 
		IF ScreenElementExists id = menu3d_char 
			DestroyScreenElement id = menu3d_char 
		ENDIF 
	ELSE 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = view_goals_root 
			dims = PAIR(1.00000000000, 1.00000000000) 
			not_focusable 
		} 
		IF LevelIs load_TR 
			view_goals_root : SetTags simple_list 
		ELSE 
			IsCurrentChapterCapstone 
			IF GotParam capstone_chapter 
				view_goals_root : SetTags simple_list 
			ENDIF 
			view_goals_root : SetTags allow_description 
		ENDIF 
	ENDIF 
	IF NOT GotParam goal_list_index 
		intro = 1 
		GetCurrentGoalListIndex 
	ELSE 
		intro = 0 
	ENDIF 
	IF GotParam goal 
		pause_menu_gradient off 
	ELSE 
		pause_menu_gradient 
	ENDIF 
	IF NOT GotParam hold_tabs 
		view_goals_menu_build_tabs <...> 
	ENDIF 
	IF GotParam goal 
		view_goals_menu_build_bottom helper_text_elements = [ { text = "\\bn/\\bm = Back" } ] goal 
		view_goals_menu_build_details goal = <goal> goal_list_index = <goal_list_index> 
	ELSE 
		view_goals_menu_build_bottom add_points 
		view_goals_menu_build_list goal_list_index = <goal_list_index> 
	ENDIF 
	IF ( <intro> = 1 ) 
		view_goals_menu_build_arrows 
		DoScreenElementMorph id = arrows_container pos = PAIR(0.00000000000, -120.00000000000) time = 0 
		DoScreenElementMorph id = arrows_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.30000001192 
		DoScreenElementMorph id = tab_container pos = PAIR(0.00000000000, -100.00000000000) time = 0 
		DoScreenElementMorph id = tab_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.30000001192 
		DoScreenElementMorph id = goal_list_container pos = PAIR(700.00000000000, 0.00000000000) time = 0 
		DoScreenElementMorph id = goal_list_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.30000001192 
		DoScreenElementMorph id = bottom_pieces_container pos = PAIR(0.00000000000, 150.00000000000) time = 0 
		DoScreenElementMorph id = bottom_pieces_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.30000001192 
		wait 0.30000001192 seconds 
	ENDIF 
	RemoveParameter id 
	IF ScreenElementExists id = current_menu_anchor 
		FireEvent type = focus target = current_menu_anchor 
		RunScriptOnScreenElement id = current_menu_anchor view_goals_wait_and_setup_input params = { <...> } 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_goal_description_with_highlight line = -1 num_cameras = 0 
	Theme_GetUnhighlightedTextColorNew return_value = text_color 
	IF ScreenElementExists id = goal_description_container 
		DestroyScreenElement id = goal_description_container 
	ENDIF 
	SetScreenElementLock id = goal_list_container off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = goal_list_container 
		id = goal_description_container 
		not_focusable 
	} 
	GetScreenElementPosition id = current_menu 
	ScreenElementPos = ( <ScreenElementPos> + PAIR(-50.00000000000, 0.00000000000) ) 
	height = 0 
	index = 0 
	IF IsArray ( <goal> . goal_description ) 
		GetArraySize ( <goal> . goal_description ) 
		BEGIN 
			rgba = <text_color> 
			alpha = 1 
			IF ( <num_cameras> = <array_size> ) 
				IF ( <index> = <line> ) 
				ELSE 
					rgba = <text_color> 
					alpha = 0.60000002384 
				ENDIF 
			ENDIF 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = goal_description_container 
				font = small 
				internal_scale = 1.20000004768 
				text = ( ( <goal> . goal_description ) [ <index> ] ) 
				pos = ( <height> * PAIR(0.00000000000, 1.00000000000) + <ScreenElementPos> ) 
				just = [ left top ] 
				internal_just = [ left top ] 
				dims = PAIR(500.00000000000, 0.00000000000) 
				allow_expansion 
				rgba = <rgba> 
				alpha = <alpha> 
				shadow 
				shadow_rgba = UI_text_shadow_color 
				shadow_offs = UI_text_shadow_offset 
			} 
			GetScreenElementDims id = <id> 
			GetScreenElementPosition id = <id> 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = goal_description_container 
			font = small 
			internal_scale = 1.20000004768 
			text = ( <goal> . goal_description ) 
			pos = ( <height> * PAIR(0.00000000000, 1.00000000000) + <ScreenElementPos> ) 
			just = [ left top ] 
			internal_just = [ left top ] 
			dims = PAIR(500.00000000000, 0.00000000000) 
			allow_expansion 
			rgba = <text_color> 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
		} 
		GetScreenElementDims id = <id> 
		GetScreenElementPosition id = <id> 
	ENDIF 
	IF StructureContains structure = <goal> view_goals_tip 
		view_goals_tip = ( <goal> . view_goals_tip ) 
	ENDIF 
	GoalManager_GetGoalParams Name = ( <goal> . goal_id ) 
	IF GotParam view_goals_notify_trick 
		bound_text = view_goals_notify_message_trick_bound 
		IF GlobalExists Name = <view_goals_notify_trick> type = structure 
			IF StructureContains structure = <view_goals_notify_trick> params 
				IF StructureContains structure = ( <view_goals_notify_trick> . params ) IsSpecial 
					bound_text = view_goals_notivy_message_special_trick_bound 
				ENDIF 
			ENDIF 
		ENDIF 
		GetTrickDisplayText trick = <view_goals_notify_trick> 
		IF GetKeyComboBoundToTrick special trick = <view_goals_notify_trick> 
			FormatText { 
				textname = view_goals_tip 
				<bound_text> 
				t = <trick_display_text> 
				k = ( goal_tetris_trick_text . <current_key_combo> ) 
			} 
		ELSE 
			FormatText { 
				textname = view_goals_tip 
				view_goals_notify_message_trick_needed 
				t = <trick_display_text> 
			} 
		ENDIF 
	ENDIF 
	IF GotParam view_goals_tip 
		Theme_GetMenuTitleColor return_value = tip_color 
		CreateScreenElement { 
			type = TextElement 
			parent = goal_description_container 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
			font = small 
			text = "TIP:" 
			rgba = <tip_color> 
			alpha = 0.89999997616 
			scale = PAIR(1.50000000000, 1.60000002384) 
			pos = ( <height> * PAIR(0.00000000000, 1.50000000000) + <ScreenElementPos> ) 
			just = [ left top ] 
		} 
		GetScreenElementDims id = <id> 
		GetScreenElementPosition id = <id> 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = goal_description_container 
			font = small 
			internal_scale = 1 
			text = <view_goals_tip> 
			pos = ( <ScreenElementPos> + <width> * PAIR(1.00000000000, 0.00000000000) + PAIR(2.00000000000, 9.00000000000) ) 
			just = [ left top ] 
			internal_just = [ left top ] 
			dims = PAIR(370.00000000000, 0.00000000000) 
			allow_expansion 
			rgba = <text_color> 
			alpha = 0.80000001192 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
		} 
		GetScreenElementDims id = <id> 
		GetScreenElementPosition id = <id> 
	ELSE 
		ScreenElementPos = ( <ScreenElementPos> + PAIR(55.00000000000, 0.00000000000) ) 
	ENDIF 
	Theme_GetAltColor return_value = alt_color 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = goal_description_container 
		font = small 
		internal_scale = 1.10000002384 
		text = "\\bn" 
		pos = ( <ScreenElementPos> + <height> * PAIR(0.00000000000, 1.00000000000) + PAIR(0.00000000000, 25.00000000000) ) 
		just = [ left top ] 
		internal_just = [ left top ] 
		dims = PAIR(390.00000000000, 0.00000000000) 
		allow_expansion 
		rgba = [ 128 128 128 128 ] 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = goal_description_container 
		font = small 
		internal_scale = 1.10000002384 
		text = "Back to list" 
		pos = ( <ScreenElementPos> + <height> * PAIR(0.00000000000, 1.00000000000) + PAIR(32.00000000000, 25.00000000000) ) 
		just = [ left top ] 
		internal_just = [ left top ] 
		dims = PAIR(390.00000000000, 0.00000000000) 
		allow_expansion 
		rgba = <alt_color> 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
ENDSCRIPT

SCRIPT play_single_view_goals_cam 
	kill_single_view_goals_cam 
	IF StructureContains structure = <goal> view_goals_cameras 
		PlaySkaterCamAnim { virtual_cam 
			targetid = world 
			targetOffset = ( ( <goal> . view_goals_cameras [ <index> ] ) . targetOffset ) 
			positionOffset = ( ( <goal> . view_goals_cameras [ <index> ] ) . positionOffset ) 
			frames = 1 
		} 
		root_window : SetTags view_goals_camera_playing 
	ENDIF 
	GoalManager_GetGoalParams Name = ( <goal> . goal_id ) 
	IF GotParam trick_object_prefix 
		params = { 
			trick_object_light_group = <trick_object_light_group> 
			trick_object_prefix = <trick_object_prefix> 
			goal_name = <goal_name> 
			goal_id = <goal_id> 
		} 
		goal_trick_the_objects_colors_start <params> 
		root_window : SetTags view_goals_object_flashing = <params> 
	ELSE 
		IF GotParam goal_objects 
			GetArraySize <goal_objects> 
			index = 0 
			BEGIN 
				goal_object = ( <goal_objects> [ <index> ] ) 
				IF StructureContains structure = <goal_object> trick_objects 
					goal_skate_the_line_next_cluster { 
						trick_objects = ( ( <goal_objects> [ <index> ] ) . trick_objects ) 
						goal_name = <goal_name> 
						keep_last 
						goal_objects_index = <index> 
					} 
				ELSE 
					goal_skate_the_line_next_cluster <goal_object> keep_last 
				ENDIF 
				index = ( <index> + 1 ) 
			REPEAT <array_size> 
			root_window : SetTags { 
				view_goals_object_flashing = { 
					goal_objects = <goal_objects> 
					goal_name = <goal_name> 
					goal_id = <goal_id> 
				} 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT kill_single_view_goals_cam 
	IF root_window : GetSingleTag view_goals_camera_playing 
		root_window : RemoveTags tags = [ view_goals_camera_playing ] 
		KillSkaterCamAnim current 
	ENDIF 
	IF root_window : GetSingleTag view_goals_object_flashing 
		IF StructureContains structure = <view_goals_object_flashing> trick_object_prefix 
			goal_trick_the_objects_colors_stop <view_goals_object_flashing> 
		ELSE 
			goal_skate_the_line_colors_stop <view_goals_object_flashing> stop_all 
		ENDIF 
		root_window : RemoveTags tags = [ view_goals_object_flashing ] 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_goal_cam 
	IF NOT GotParam goal 
		RETURN 
	ENDIF 
	view_goals_goal_description_with_highlight <...> 
	IF StructureContains structure = <goal> view_goals_cameras 
		GetArraySize ( <goal> . view_goals_cameras ) 
		<index> = 0 
		BEGIN 
			play_single_view_goals_cam goal = <goal> index = <index> 
			IF ( <array_size> = 1 ) 
				BREAK 
			ENDIF 
			view_goals_goal_description_with_highlight line = <index> num_cameras = <array_size> <...> 
			wait ( ( <goal> . view_goals_cameras [ <index> ] ) . time ) seconds 
			kill_single_view_goals_cam 
			<index> = ( <index> + 1 ) 
			IF ( <index> = <array_size> ) 
				<index> = 0 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_choose_goal 
	IF view_goals_root : GetSingleTag animating_scroll 
		RETURN 
	ENDIF 
	view_goals_root : SetTags animating_select 
	IF GotParam goal 
		spawnscript FadeAfterDelay params = { id1 = arrows_container delay = 0.15000000596 alpha = 0 } 
		view_goals_menu_fade_tabs <...> 
		spawnscript FadeAfterDelay params = { id1 = view_goals_title delay = 0.15000000596 alpha = 0 } 
		theme_menu_pad_choose_sound 
	ELSE 
		generic_menu_pad_back_sound 
	ENDIF 
	IF ( view_goals_test_slide = 1 ) 
		DoScreenElementMorph id = goal_list_container pos = PAIR(0.00000000000, 550.00000000000) time = 0.15000000596 
		DoScreenElementMorph id = bottom_pieces_container alpha = 0 time = 0.10000000149 
		wait 0.15000000596 seconds 
	ENDIF 
	KillSpawnedScript Name = view_goals_goal_cam 
	view_goals_menu_create <...> hold_tabs 
	spawnscript view_goals_goal_cam params = { <...> } 
	IF NOT GotParam goal 
		spawnscript FadeAfterDelay params = { id1 = arrows_container delay = 0.15000000596 alpha = 1 } 
		spawnscript FadeAfterDelay params = { id1 = view_goals_title delay = 0.10000000149 alpha = 1 } 
		view_goals_menu_fade_tabs <...> 
	ENDIF 
	IF ( view_goals_test_slide = 1 ) 
		DoScreenElementMorph id = goal_list_container pos = PAIR(0.00000000000, 500.00000000000) time = 0 
		DoScreenElementMorph id = goal_list_container pos = PAIR(0.00000000000, 0.00000000000) time = 0.15000000596 
		DoScreenElementMorph id = bottom_pieces_container alpha = 0 time = 0 
		spawnscript FadeAfterDelay params = { id1 = bottom_pieces_container delay = 0.10000000149 alpha = 1 } 
		wait 0.30000001192 seconds 
	ENDIF 
	FireEvent type = focus target = current_menu_anchor 
ENDSCRIPT

SCRIPT view_goals_menu_exit 
	IF ScreenElementExists id = view_goals_root 
		change block_proxim_node_updates = 0 
		root_window : SetTags need_music_zone_refresh 
		kill_single_view_goals_cam 
		KillSpawnedScript Name = view_goals_menu_pad_left 
		KillSpawnedScript Name = view_goals_menu_pad_right 
		KillSpawnedScript Name = view_goals_menu_choose_goal 
		DestroyScreenElement id = view_goals_root 
	ENDIF 
	IF root_window : GetSingleTag view_goals_shortcut_on 
		root_window : RemoveTags tags = [ view_goals_shortcut_on ] 
		exit_pause_menu 
	ELSE 
		generic_menu_pad_back callback = create_pause_menu <...> 
	ENDIF 
ENDSCRIPT

SCRIPT make_new_vg_menu menu_id = main_menu_anchor vmenu_id = main_menu pos = PAIR(320.00000000000, 240.00000000000) parent = root_window spacing = 7 dims = PAIR(538.00000000000, 100.00000000000) 
	IF NOT view_goals_root : GetSingleTag allow_description 
		scrolling = scrolling 
		dims = PAIR(538.00000000000, 300.00000000000) 
		Theme_GetHighlightedTextColor return_value = arrow_rgba 
	ENDIF 
	make_new_roundbar_menu { <...> 
		additional_create_script = viewgoals_create_scratches 
		additional_focus_script = viewgoals_focus_scratches 
		additional_unfocus_script = viewgoals_unfocus_scratches 
		no_pad_handlers 
		no_helper_text 
		pad_back_sound = nullscript 
	} 
	IF NOT view_goals_root : GetSingleTag allow_description 
		SetScreenElementProps id = current_scrolling_menu event_handlers = [ { pad_back view_goals_menu_exit } ] 
		FireEvent type = focus target = current_scrolling_menu 
	ENDIF 
ENDSCRIPT

SCRIPT viewgoals_create_scratches 
	pad_choose_params = { goal = <goal> goal_list_index = <goal_list_index> } 
	SetScreenElementProps { 
		id = <container_id> 
		event_handlers = [ 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			{ focus <focus_script> params = { id = <container_id> goal = <goal> index = 0 scale_highlight_text = <scale_highlight_text> } } 
		] 
		replace_handlers 
	} 
	IF GotParam single_camera 
		<container_id> : SetTags single_camera = 1 
	ENDIF 
	IF StructureContains structure = <goal> beaten 
		IF ( ( <goal> . reward_points ) > 0 ) 
			FormatText textname = points "%p PTS." p = ( <goal> . reward_points ) 
			CreateScreenElement { 
				type = TextElement 
				parent = <container_id> 
				pos = ( <right_edge> + PAIR(0.00000000000, 9.00000000000) ) 
				font = small 
				scale = 1 
				rgba = [ 128 128 128 80 ] 
				text = <points> 
				just = [ right center ] 
				z_priority = 9 
			} 
			<id> : SetTags tag_local_id = score 
		ENDIF 
		IF ( ( <goal> . beaten ) = 1 ) 
			GetScreenElementDims id = { <container_id> child = text } 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <container_id> 
				texture = goal_complete_line 
				pos = PAIR(0.00000000000, 9.00000000000) 
				rgba = [ 128 , 128 , 128 , 90 ] 
				just = [ left center ] 
				scale = ( <width> * PAIR(0.00800000038, 0.00000000000) + PAIR(0.00000000000, 0.80000001192) ) 
				z_priority = 50 
			} 
			<id> : SetTags tag_local_id = scratch1 
			IF ( ( <goal> . reward_points ) > 0 ) 
				GetScreenElementDims id = { <container_id> child = score } 
				CreateScreenElement { 
					type = SpriteElement 
					parent = <container_id> 
					texture = goal_complete_line 
					pos = ( <right_edge> + PAIR(0.00000000000, -5.00000000000) ) 
					rgba = [ 128 , 128 , 128 , 90 ] 
					just = [ right top ] 
					scale = ( <width> * PAIR(0.00850000046, 0.00000000000) + PAIR(0.00000000000, 0.80000001192) ) 
					z_priority = 100 
				} 
				<id> : SetTags tag_local_id = scratch2 
			ENDIF 
			<container_id> : SetTags beaten = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT viewgoals_focus_scratches 
	IF <id> : GetSingleTag single_camera 
		play_single_view_goals_cam goal = <goal> index = 0 
	ENDIF 
	IF ScreenElementExists id = { <id> child = score } 
		SetScreenElementProps { 
			id = { <id> child = score } 
			rgba = [ 0 0 0 128 ] 
		} 
	ENDIF 
	IF <id> : GetSingleTag beaten 
		DoScreenElementMorph id = { <id> child = scratch1 } time = 0.05000000075 scale = PAIR(1.14999997616, 1.25000000000) relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT viewgoals_unfocus_scratches 
	IF ScreenElementExists id = { <id> child = score } 
		SetScreenElementProps { 
			id = { <id> child = score } 
			rgba = [ 128 128 128 80 ] 
		} 
	ENDIF 
	IF <id> : GetSingleTag beaten 
		DoScreenElementMorph id = { <id> child = scratch1 } time = 0.05000000075 scale = 1.00000000000 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_list_message 
	view_goals_generic_message message = "\\cbPRESS \\c0\\bm\\cb TO GET DETAILS" pos = PAIR(320.00000000000, 305.00000000000) rgba = [ 128 128 128 128 ] 
ENDSCRIPT

SCRIPT view_goals_locked_message 
	kill_single_view_goals_cam 
	FormatText textname = message "\\cbSWITCH TO %a CHARACTER TO UNLOCK NEW GOALS" a = ( ( skater_goal_list_names [ <goal_list_index> ] ) . Name ) 
	view_goals_generic_message message = <message> pos = PAIR(320.00000000000, 95.00000000000) rgba = [ 128 128 128 128 ] 
ENDSCRIPT

SCRIPT view_goals_generic_message rgba = [ 128 50 128 128 ] 
	CreateScreenElement { 
		type = TextElement 
		parent = bottom_pieces_container 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
		font = small 
		text = <message> 
		rgba = <rgba> 
		override_encoded_alpha 
		scale = PAIR(1.14999997616, 1.29999995232) 
		pos = <pos> 
		just = [ center top ] 
	} 
	RunScriptOnScreenElement id = <id> view_goals_message_highlight 
ENDSCRIPT

SCRIPT view_goals_message_highlight 
	GetTags 
	DoScreenElementMorph id = <id> time = 0 alpha = 0 
	wait 0.30000001192 seconds 
	BEGIN 
		DoScreenElementMorph id = <id> time = 0.40000000596 alpha = 0.89999997616 
		wait 0.50000000000 seconds 
		DoScreenElementMorph id = <id> time = 0.40000000596 alpha = 0.60000002384 
		wait 0.69999998808 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT view_goals_reminder_create 
	IF ScreenElementExists id = view_goals_reminders 
		GoalReminderAnimateOff id = view_goals_reminders 
		IF ScreenElementExists id = view_goals_reminders 
			DestroyScreenElement id = view_goals_reminders 
		ENDIF 
	ENDIF 
	reminder_pos = PAIR(25.00000000000, 115.00000000000) 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = view_goals_reminders 
		scale = 0.94999998808 
		pos = <reminder_pos> 
		not_focusable 
	} 
	Theme_GetSupportPieceColor return_value = tab_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = view_goals_reminders 
		texture = goal_tab 
		rgba = <tab_color> 
		scale = 1 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		z_priority = -1 
	} 
	GetCurrentGoalListIndex 
	Theme_GetPauseBarColor return_value = font_color 
	CreateScreenElement { 
		type = TextElement 
		parent = view_goals_reminders 
		font = small 
		rgba = <font_color> 
		text = ( ( skater_goal_list_names [ <goal_list_index> ] ) . Name ) 
		scale = PAIR(1.10000002384, 1.25000000000) 
		pos = PAIR(65.00000000000, 18.00000000000) 
		just = [ center center ] 
		z_priority = 0 
	} 
	Theme_GetAltColor return_value = grad_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = view_goals_reminders 
		texture = goal_grad 
		rgba = <grad_color> 
		scale = PAIR(10.00000000000, 0.80000001192) 
		pos = PAIR(-30.00000000000, 32.00000000000) 
		just = [ left top ] 
		z_priority = -2 
	} 
	ProcessGoalList goal_list_index = <goal_list_index> actionScript = AddGoalReminder pos = PAIR(3.00000000000, 38.00000000000) 
	height = ( ( ( <pos> - PAIR(0.00000000000, 38.00000000000) ) . PAIR(0.00000000000, 1.00000000000) ) / 20 ) 
	IF ( <height> = 0 ) 
		DestroyScreenElement id = view_goals_reminders 
		RETURN 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = view_goals_reminders 
		texture = white3 
		rgba = [ 0 0 0 70 ] 
		rot_angle = 179.89999389648 
		scale = ( PAIR(12.00000000000, 0.00000000000) + <height> * PAIR(0.00000000000, 0.15800000727) + PAIR(0.00000000000, 0.07999999821) ) 
		pos = PAIR(-30.00000000000, 32.00000000000) 
		just = [ right bottom ] 
		z_priority = -2 
	} 
	RunScriptOnScreenElement id = view_goals_reminders GoalReminderAnimate params = { reminder_pos = <reminder_pos> } 
ENDSCRIPT

SCRIPT AddGoalReminder 
	color = [ 128 128 128 128 ] 
	IF NOT GotParam not_focusable 
		IF ( <goal> . beaten ) 
			RETURN 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = view_goals_reminders 
		font = small 
		text = ( <goal> . view_goals_text ) 
		rgba = <color> 
		scale = 1 
		pos = <reminder_pos> 
		just = [ left top ] 
		z_priority = 0 
	} 
	RETURN pos = ( <reminder_pos> + PAIR(0.00000000000, 20.00000000000) ) 
ENDSCRIPT

SCRIPT GoalReminderAnimate 
	GetTags 
	GoalReminderAnimateOn id = <id> 
	wait 5 seconds 
	GoalReminderAnimateOff id = <id> 
	die 
ENDSCRIPT

SCRIPT GoalReminderAnimateOn 
	GetScreenElementPosition id = <id> 
	off_pos = ( <ScreenElementPos> - PAIR(400.00000000000, 0.00000000000) ) 
	DoScreenElementMorph id = <id> pos = <off_pos> time = 0 
	DoScreenElementMorph id = <id> pos = <ScreenElementPos> time = 0.20000000298 
	wait 0.30000001192 seconds 
ENDSCRIPT

SCRIPT GoalReminderAnimateOff 
	GetScreenElementPosition id = <id> 
	off_pos = ( <ScreenElementPos> - PAIR(400.00000000000, 0.00000000000) ) 
	DoScreenElementMorph id = <id> pos = <off_pos> time = 0.20000000298 
	wait 0.30000001192 seconds 
ENDSCRIPT

SCRIPT GoalListReminderHide 
	IF ScreenElementExists id = view_goals_reminders 
		DoScreenElementMorph id = view_goals_reminders alpha = 0 time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT GoalListReminderShow 
	IF ScreenElementExists id = view_goals_reminders 
		DoScreenElementMorph id = view_goals_reminders alpha = 1 time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT view_created_goals_menu_create 
	hide_current_goal 
	menu3d_hide 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = view_goals_menu 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = view_goals_menu alias = current_menu_anchor 
	create_helper_text helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Jump to Goal (if unlocked)" } 
	] 
	FormatText ChecksumName = title_icon "%i_gap" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	build_theme_sub_title title = "GOALS" title_icon = <title_icon> 
	FormatText ChecksumName = paused_icon "%i_paused_icon" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	theme_background width = 6.34999990463 pos = PAIR(320.00000000000, 85.00000000000) num_parts = 10.50000000000 
	<root_pos> = PAIR(80.00000000000, 25.00000000000) 
	Theme_GetHighlightedTextColor return_value = text_rgba 
	Theme_GetUnhighlightedTextColor return_value = untext_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = black 
		pos = PAIR(57.00000000000, 87.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 85 ] 
		scale = PAIR(130.00000000000, 5.00000000000) 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = view_goals_menu_up_arrow 
		texture = up_arrow 
		pos = PAIR(320.00000000000, 88.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = view_goals_menu_down_arrow 
		texture = down_arrow 
		pos = PAIR(320.00000000000, 372.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = black 
		pos = PAIR(57.00000000000, 370.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 85 ] 
		scale = PAIR(130.00000000000, 5.00000000000) 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = current_menu_anchor 
		dims = PAIR(640.00000000000, 264.00000000000) 
		pos = PAIR(80.00000000000, 110.00000000000) 
		just = [ left top ] 
		internal_just = [ center top ] 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = <id> 
		id = view_goals_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		dont_allow_wrap 
		event_handlers = [ 
			{ pad_down menu_vert_blink_arrow params = { id = view_goals_menu_down_arrow } } 
			{ pad_up menu_vert_blink_arrow params = { id = view_goals_menu_up_arrow } } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
			{ pad_back view_created_goals_menu_exit params = { callback = create_pause_menu } } 
		] 
	} 
	AssignAlias id = view_goals_vmenu alias = current_menu 
	GoalManager_AddViewGoalsList 
	FireEvent type = focus target = view_goals_vmenu 
ENDSCRIPT

SCRIPT view_goals_menu_add_item 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = <goal_id> 
		dims = PAIR(500.00000000000, 24.00000000000) 
	} 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	Theme_GetHighlightedTextColor return_value = highlighted_text_rgba 
	CreateScreenElement { 
		type = TextElement 
		parent = <goal_id> 
		rgba = <text_rgba> 
		text = <text> 
		font = dialog 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
	} 
	IF GotParam bogus 
		SetScreenElementProps { 
			id = <goal_id> 
			event_handlers = [ 
				{ focus view_goals_menu_focus_beaten } 
				{ unfocus view_goals_menu_unfocus_beaten } 
			] 
		} 
		RETURN 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <goal_id> 
		texture = de_highlight_bar 
		pos = PAIR(240.00000000000, 10.00000000000) 
		just = [ center center ] 
		rgba = [ 0 0 0 0 ] 
		z_priority = 3 
		scale = PAIR(4.09999990463, 0.69999998808) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <goal_id> 
		rgba = <text_rgba> 
		text = " " 
		font = dialog 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
	} 
	IF GoalManager_HasWonGoal Name = <goal_id> 
		SetScreenElementProps { 
			id = <goal_id> 
			event_handlers = [ 
				{ focus view_goals_menu_focus_beaten } 
				{ unfocus view_goals_menu_unfocus_beaten } 
				{ pad_choose theme_menu_pad_choose_sound } 
				{ pad_choose view_goals_menu_start_beaten_goal params = { goal_id = <goal_id> } } 
				{ pad_start theme_menu_pad_choose_sound } 
				{ pad_start view_goals_menu_start_beaten_goal params = { goal_id = <goal_id> } } 
				{ pad_choose generic_menu_pad_choose_sound } 
			] 
		} 
		GetScreenElementDims id = { <goal_id> child = 0 } 
		CreateScreenElement { 
			type = SpriteElement 
			parent = { <goal_id> child = 1 } 
			texture = white2 
			pos = PAIR(2.00000000000, 16.00000000000) 
			just = [ left center ] 
			rgba = <highlighted_text_rgba> 
			alpha = 1 
			z_priority = 10 
			scale = PAIR(15.50000000000, 0.15000000596) 
		} 
	ELSE 
		IF GoalManager_GoalIsLocked Name = <goal_id> 
			IF IsTrue bootstrap_build 
				<locked_text> = "NOT IN DEMO" 
			ELSE 
				GoalManager_GetGoalParams Name = <goal_id> 
				IF GotParam pro_goal 
					<locked_text> = "Complete Pro Challenge to unlock" 
				ELSE 
					<locked_text> = "Locked" 
				ENDIF 
			ENDIF 
			view_goals_menu_set_color { 
				id = <goal_id> 
				rgba = <text_rgba> 
				text = <locked_text> 
			} 
			SetScreenElementProps { 
				id = <goal_id> 
				event_handlers = [ 
					{ focus view_goals_menu_focus_locked } 
					{ unfocus view_goals_menu_unfocus_locked } 
					{ pad_choose view_goals_menu_pad_choose_locked } 
					{ pad_start view_goals_menu_pad_choose_locked } 
				] 
				replace_handlers 
			} 
		ELSE 
			IF GoalManager_HasSeenGoal Name = <goal_id> 
				view_goals_menu_set_color { 
					id = <goal_id> 
					rgba = <text_rgba> 
				} 
				SetScreenElementProps { 
					id = <goal_id> 
					event_handlers = [ 
						{ pad_start theme_menu_pad_choose_sound } 
						{ pad_choose theme_menu_pad_choose_sound } 
						{ focus view_goals_menu_focus_unlocked params = { goal_id = <goal_id> } } 
						{ unfocus view_goals_menu_unfocus_unlocked params = { goal_id = <goal_id> } } 
						{ pad_choose view_goals_menu_start_goal params = { goal_id = <goal_id> } } 
						{ pad_start view_goals_menu_start_goal params = { goal_id = <goal_id> } } 
					] 
					replace_handlers 
				} 
			ELSE 
				view_goals_menu_set_color { 
					id = <goal_id> 
					rgba = [ 42 42 38 128 ] 
					text = "??????????" 
				} 
				SetScreenElementProps { 
					id = <goal_id> 
					event_handlers = [ 
						{ focus view_goals_menu_focus_locked params = { goal_id = <goal_id> } } 
						{ unfocus view_goals_menu_unfocus_locked params = { goal_id = <goal_id> } } 
						{ pad_choose view_goals_menu_pad_choose_locked } 
						{ pad_start view_goals_menu_pad_choose_locked } 
					] 
					replace_handlers 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_set_color 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = <rgba> 
		text = <text> 
	} 
	<id> : GetTags 
	IF GotParam win_record 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			rgba = <rgba> 
			scale = <scale> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_focus_locked 
	generic_menu_update_arrows { 
		menu_id = view_goals_vmenu 
		up_arrow_id = view_goals_menu_up_arrow 
		down_arrow_id = view_goals_menu_down_arrow 
	} 
	GetTags 
	main_theme_focus 
	IF GotParam goal_id 
		view_goals_menu_play_preview_cam <...> 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_unfocus_locked 
	GetTags 
	generic_menu_pad_up_down_sound 
	main_theme_unfocus 
	IF GotParam goal_id 
		view_goals_menu_kill_preview_cam <...> 
	ENDIF 
ENDSCRIPT

SCRIPT view_goals_menu_focus_unlocked 
	generic_menu_update_arrows { 
		menu_id = view_goals_vmenu 
		up_arrow_id = view_goals_menu_up_arrow 
		down_arrow_id = view_goals_menu_down_arrow 
	} 
	GetTags 
	Theme_GetHighlightedTextColor return_value = highlighted_text_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <highlighted_text_rgba> 
		scale = 1.10000002384 
		relative_scale 
	} 
	IF ScreenElementExists id = { <id> child = 2 } 
		DoScreenElementMorph { 
			id = { <id> child = 2 } 
			rgba = <highlighted_text_rgba> 
			scale = 1.10000002384 
			relative_scale 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = 1 } 
		rgba = <bar_rgba> 
	} 
	IF ScreenElementExists id = scrolling_menu_up_arrow 
		IF GotParam first_item 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = scrolling_menu_down_arrow 
		IF GotParam last_item 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1 
		ENDIF 
	ENDIF 
	RunScriptOnScreenElement id = <id> text_twitch_effect 
	view_goals_menu_play_preview_cam <...> 
ENDSCRIPT

SCRIPT view_goals_menu_unfocus_unlocked 
	GetTags 
	generic_menu_pad_up_down_sound 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	KillSpawnedScript Name = text_twitch_effect 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <text_rgba> 
		alpha = <text_alpha> 
		scale = 1 
	} 
	IF ScreenElementExists id = { <id> child = 2 } 
		DoScreenElementMorph { 
			id = { <id> child = 2 } 
			rgba = <text_rgba> 
			alpha = <text_alpha> 
			scale = 1 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = 1 } 
		rgba = [ 128 128 128 0 ] 
	} 
	view_goals_menu_kill_preview_cam <...> 
ENDSCRIPT

SCRIPT view_goals_menu_focus_beaten 
	generic_menu_update_arrows { 
		menu_id = view_goals_vmenu 
		up_arrow_id = view_goals_menu_up_arrow 
		down_arrow_id = view_goals_menu_down_arrow 
	} 
	GetTags 
	Theme_GetHighlightedTextColor return_value = highlighted_text_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <highlighted_text_rgba> 
		scale = 1.10000002384 
		relative_scale 
	} 
	IF ScreenElementExists id = { <id> child = 2 } 
		DoScreenElementMorph { 
			id = { <id> child = 2 } 
			rgba = <highlighted_text_rgba> 
			scale = 1.10000002384 
			relative_scale 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = 1 } 
		rgba = <bar_rgba> 
	} 
	IF ScreenElementExists id = scrolling_menu_up_arrow 
		IF GotParam first_item 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = scrolling_menu_down_arrow 
		IF GotParam last_item 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1 
		ENDIF 
	ENDIF 
	RunScriptOnScreenElement id = <id> text_twitch_effect 
ENDSCRIPT

SCRIPT view_goals_menu_unfocus_beaten 
	GetTags 
	generic_menu_pad_up_down_sound 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	KillSpawnedScript Name = text_twitch_effect 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <text_rgba> 
		alpha = <text_alpha> 
		scale = 1 
	} 
	IF ScreenElementExists id = { <id> child = 2 } 
		DoScreenElementMorph { 
			id = { <id> child = 2 } 
			rgba = <text_rgba> 
			alpha = <text_alpha> 
			scale = 1 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = 1 } 
		rgba = [ 128 128 128 0 ] 
	} 
ENDSCRIPT

SCRIPT view_goals_menu_pad_choose_locked 
ENDSCRIPT

SCRIPT view_goals_menu_start_goal 
	view_created_goals_menu_exit callback = exit_pause_menu 
	GoalManager_DeactivateAllGoals 
	skater : RunTimerController_Reset 
	goal_accept_trigger goal_id = <goal_id> force_start 
ENDSCRIPT

SCRIPT view_goals_menu_start_beaten_goal 
	view_created_goals_menu_exit callback = exit_pause_menu 
	GoalManager_DeactivateAllGoals 
	skater : RunTimerController_Reset 
	goal_accept_trigger goal_id = <goal_id> force_start 
ENDSCRIPT

SCRIPT view_goals_menu_play_preview_cam 
	GoalManager_GetGoalParams Name = <goal_id> 
	IF IsAlive Name = <trigger_obj_id> 
		IF NOT ObjectExists id = Menu_Cam 
			create_menu_camera 
		ELSE 
			Menu_Cam : unpause 
		ENDIF 
		<trigger_obj_id> : Obj_GetPosition 
		Menu_Cam : Obj_SetPosition Position = ( <pos> + VECTOR(0.00000000000, 40.00000000000, 110.00000000000) ) 
		Menu_Cam : Obj_SetOrientation Y = 0 
		<trigger_obj_id> : Obj_GetOrientation 
		<trigger_obj_id> : Obj_SetOrientation Y = 0 
		SetActiveCamera id = Menu_Cam 
		SetSkaterCamAnimShouldPause Name = <goal_id> should_pause = 0 
		<trigger_obj_id> : unpause 
		wait 5 frames 
		<trigger_obj_id> : pause 
	ENDIF 
	view_goals_vmenu : SetTags current_cam_anim = <goal_id> 
ENDSCRIPT

SCRIPT view_goals_menu_kill_preview_cam 
	GetSkaterId 
	KillSkaterCamAnim skater = <objId> Name = <goal_id> 
ENDSCRIPT

SCRIPT view_created_goals_menu_exit 
	IF ScreenElementExists id = view_goals_vmenu 
		view_goals_vmenu : GetTags 
		IF GotParam current_cam_anim 
			GetSkaterId 
			KillSkaterCamAnim skater = <objId> Name = <current_cam_anim> 
		ENDIF 
	ENDIF 
	restore_skater_camera 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
	GoalManager_ShowPoints 
	IF NOT GoalManager_HasActiveGoals 
		GoalManager_ShowGoalPoints 
	ENDIF 
	<callback> 
ENDSCRIPT


