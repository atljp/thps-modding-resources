
level_select_current_list_index = 0 
SCRIPT load_update_level_select_textures_to_main_memory 
	IF GotParam unload 
		printf "load_update_level_select_textures_to_main_memory unload" 
	ELSE 
		printf "load_update_level_select_textures_to_main_memory" 
	ENDIF 
	textures = [ 
		"Update/levelselect/logo_park" 
		"Update/levelselect/logo_thps" 
		"Update/levelselect/logo_thps2" 
		"Update/levelselect/logo_thps3" 
		"Update/levelselect/logo_thps4" 
		"Update/levelselect/logo_thug" 
		"Update/levelselect/logo_thug2" 
		"Update/levelselect/level_swatch_3" 
		"Update/levelselect/posters/poster_hi" 
		"Update/levelselect/posters/poster_nj" 
		"Update/levelselect/posters/poster_vc" 
		"Update/levelselect/posters/poster_ny" 
		"Update/levelselect/posters/poster_sj" 
		"Update/levelselect/posters/poster_ru" 
		"Update/levelselect/posters/poster_default" 
	] 
	load_array_of_textures <...> 
	printf "done load_update_level_select_textures_to_main_memory" 
ENDSCRIPT

SCRIPT get_new_level_info_size 
	GetArraySize level_select_tabs 
	<num_tabs> = <array_size> 
	<new_size> = 0 
	<index> = 0 
	BEGIN 
		<array> = ( ( level_select_tabs [ <index> ] ) . levels ) 
		GetArraySize <array> 
		<new_size> = <new_size> + <array_size> 
		<index> = <index> + 1 
	REPEAT <num_tabs> 
	RETURN new_size = <new_size> 
ENDSCRIPT

SCRIPT populate_level_info_array 
	get_new_level_info_size 
	wait 10 gameframes 
	ResizeArray array = level_select_menu_level_info size = 10 
	<tmpArray> = level_select_menu_level_info 
	GetArraySize level_select_tabs 
	<num_tabs> = <array_size> 
	<index> = 0 
	<level_info_index> = 0 
	BEGIN 
		level_array = ( ( level_select_tabs [ <index> ] ) . levels ) 
		GetArraySize <level_array> 
		<level_index> = 0 
		BEGIN 
			SetArrayElement { arrayname = tmpArray index = <level_info_index> 
				newvalue = { 
					text = ( ( <level_array> [ <level_index> ] ) . text ) 
					level = ( ( <level_array> [ <level_index> ] ) . level ) 
				} 
			} 
			<level_index> = <level_index> + 1 
			<level_info_index> = <level_info_index> + 1 
		REPEAT <array_size> 
		<index> = <index> + 1 
	REPEAT <num_tabs> 
ENDSCRIPT

SCRIPT launch_level_select_menu 
	load_update_level_select_textures_to_main_memory 
	hide_current_goal 
	menu3d_hide 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	LoadPreFile "mainmenusprites.pre" 
	load_mainmenu_textures_to_main_memory no_pre_file 
	load_cas_textures_to_main_memory no_pre_file 
	UnloadPreFile "mainmenusprites.pre" 
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
SCRIPT create_level_select_menu pad_back_script = level_select_menu_exit level_list = ( ( level_select_tabs [ ( level_select_current_list_index ) ] ) . levels ) 
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
	change level_select_item_current_index = -1 
	change level_select_focus_target1 = 0 
	change level_select_focus_target2 = null 
	level_select_build_BG 
	level_select_create_menu_block pad_back_script = <pad_back_script> <...> 
	tab_anchor_pos = PAIR(0.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor 
		id = tab_anchor 
		pos = <tab_anchor_pos> 
	} 
	RemoveParameter text 
	RemoveParameter name 
	ForEachIn ( ( level_select_tabs [ ( level_select_current_list_index ) ] ) . levels ) do = level_select_menu_add_item params = <...> 
	DoScreenElementMorph id = level_select_anchor_middle pos = PAIR(0.00000000000, 240.00000000000) 
	kill_start_key_binding 
	create_helper_text helper_text_elements = [ { text = "\\b7/\\b4 = Choose Level" } 
		{ text = "\\b6/\\b5 = Switch List" } 
		{ text = "\\bm = Select" } 
		{ text = "\\bn = Back" } 
	] 
	IF GotParam from_server_options 
		current_menu : SetTags from_server_options = <from_server_options> 
	ENDIF 
	fireevent type = focus target = current_menu 
	SetButtonEventMappings block_menu_input 
	wait 3 gameframes 
	SetScreenElementProps id = level_select_scrolling_menu reset_window_top 
	DoScreenElementMorph id = level_select_anchor_middle pos = PAIR(10.00000000000, 240.00000000000) 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT level_select_build_BG 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor 
		id = map_anchor 
		pos = PAIR(45.00000000000, 70.00000000000) 
		z_priority = -50 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = map_anchor 
		id = map_mask 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = level_swatch_3 
		pos = PAIR(237.50000000000, 0.00000000000) 
		scale = PAIR(1.00000000000, 1.39999997616) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = map_mask 
		texture = poster_default 
		id = level_poster 
		pos = PAIR(400.00000000000, 0.00000000000) 
		scale = PAIR(1.00000000000, 1.00000000000) 
		just = [ left top ] 
	} 
ENDSCRIPT

SCRIPT level_select_create_menu_block 
	IF ObjectExists id = level_select_anchor_middle 
		DestroyScreenElement id = level_select_anchor_middle 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor 
		id = level_select_anchor_middle 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(10.00000000000, 240.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = level_select_anchor_middle 
		id = tab_bg 
		texture = CAT_bar 
		pos = PAIR(480.00000000000, 93.00000000000) 
		scale = PAIR(28.00000000000, 1.29999995232) 
		z_priority = 8.00000000000 
	} 
	Theme_GetSupportPieceColor return_value = tab_color 
	CreateScreenElement { 
		type = ContainerElement 
		parent = level_select_anchor_middle 
		id = page_indicators 
		just = [ left center ] 
		pos = PAIR(355.00000000000, 340.00000000000) 
		z_priority = 10.00000000000 
	} 
	GetArraySize level_select_tabs 
	index = 1 
	BEGIN 
		FormatText ChecksumName = indicator_id "indicator_%i" i = ( <index> - 1 ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = page_indicators 
			id = <indicator_id> 
			texture = circle 
			scale = 0.80000001192 
			alpha = 0.30000001192 
			just = [ left center ] 
			pos = ( <index> * PAIR(12.00000000000, 0.00000000000) ) 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = level_select_anchor_middle 
		id = _leftarrow 
		texture = left_arrow 
		scale = 1.00000000000 
		rgba = <tab_color> 
		just = [ left center ] 
		pos = PAIR(360.00000000000, 93.00000000000) 
		z_priority = 10.00000000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = level_select_anchor_middle 
		id = _rightarrow 
		texture = right_arrow 
		scale = 1.00000000000 
		rgba = <tab_color> 
		just = [ right center ] 
		pos = PAIR(600.00000000000, 93.00000000000) 
		z_priority = 10.00000000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = level_select_anchor_middle 
		id = tab_title_bg 
		texture = level_swatch 
		scale = 2.00000000000 
		rgba = [ 0 0 0 80 ] 
		just = [ center center ] 
		pos = PAIR(480.00000000000, 93.00000000000) 
		z_priority = 9.00000000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = level_select_anchor_middle 
		id = tab_title_logo 
		texture = ( ( level_select_tabs [ ( level_select_current_list_index ) ] ) . logo ) 
		scale = 0.50000000000 
		just = [ center center ] 
		pos = PAIR(480.00000000000, 91.00000000000) 
		z_priority = 10.00000000000 
	} 
	FormatText ChecksumName = indicator_id "indicator_%i" i = ( level_select_current_list_index ) 
	<indicator_id> : DoMorph alpha = 1.00000000000 time = 0.05000000075 
	RunScriptOnScreenElement id = _rightarrow do_random_effect params = { id = _rightarrow } 
	RunScriptOnScreenElement id = _leftarrow do_random_effect params = { id = _leftarrow } 
	RunScriptOnScreenElement id = tab_title_bg do_random_effect 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = level_select_anchor_middle 
		id = level_select_scrolling_menu 
		pos = PAIR(480.00000000000, 120.00000000000) 
		just = [ left top ] 
		dims = PAIR(300.00000000000, 203.00000000000) 
	} 
	theme_background parent = level_select_scrolling_menu width = 1.50000000000 pos = PAIR(0.00000000000, -15.00000000000) num_parts = 7.09999990463 z_priority = 1 dark_menu = dark_menu static = static 
	CreateScreenElement { 
		type = VMenu 
		parent = level_select_scrolling_menu 
		id = level_select_vmenu 
		just = [ left top ] 
		internal_just = [ left center ] 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <pad_back_script> <...> } } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_left level_select_move_tab params = { left } } 
			{ pad_right level_select_move_tab params = { right } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
		padding_scale = 0.89999997616 
		replace_handlers 
	} 
	AssignAlias id = level_select_vmenu alias = current_menu 
ENDSCRIPT

SCRIPT level_select_move_tab 
	IF GotParam left 
		<old_level_list> = ( ( level_select_tabs [ ( level_select_current_list_index ) ] ) . levels ) 
		GetArraySize <old_level_list> 
		FormatText ChecksumName = indicator_id "indicator_%i" i = ( level_select_current_list_index ) 
		<indicator_id> : DoMorph alpha = 0.30000001192 time = 0.00000000000 
		generic_menu_scroll_sideways_sound 
		array_previous_wraparound index = ( level_select_current_list_index ) array = level_select_tabs 
		change level_select_current_list_index = <index> 
		<level_list> = ( ( level_select_tabs [ <index> ] ) . levels ) 
		IF ObjectExists id = current_menu 
			i = 0 
			BEGIN 
				IF ObjectExists id = ( ( ( <old_level_list> ) [ <i> ] ) . level ) 
					DestroyScreenElement id = ( ( ( <old_level_list> ) [ <i> ] ) . level ) 
				ENDIF 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
		change level_select_item_current_index = 0 
		ForEachIn <level_list> do = level_select_menu_add_item params = <...> 
		level_select_update_screen 
		RunScriptOnScreenElement id = _leftarrow do_arrow_effect 
		tab_title_logo : DoMorph pos = PAIR(360.00000000000, 91.00000000000) alpha = 0.00000000000 scale = 0.20000000298 time = 0.20000000298 
		tab_title_logo : DoMorph pos = PAIR(600.00000000000, 91.00000000000) time = 0.00000000000 
		FormatText ChecksumName = indicator_id "indicator_%i" i = ( level_select_current_list_index ) 
		<indicator_id> : DoMorph alpha = 1.00000000000 time = 0.05000000075 
		SetScreenElementProps id = tab_title_logo texture = ( ( level_select_tabs [ <index> ] ) . logo ) 
		tab_title_logo : DoMorph pos = PAIR(480.00000000000, 91.00000000000) alpha = 1.00000000000 scale = 0.50000000000 time = 0.20000000298 
	ENDIF 
	IF GotParam right 
		<old_level_list> = ( ( level_select_tabs [ ( level_select_current_list_index ) ] ) . levels ) 
		GetArraySize <old_level_list> 
		FormatText ChecksumName = indicator_id "indicator_%i" i = ( level_select_current_list_index ) 
		<indicator_id> : DoMorph alpha = 0.30000001192 time = 0.00000000000 
		generic_menu_scroll_sideways_sound 
		array_next_wraparound index = ( level_select_current_list_index ) array = level_select_tabs 
		change level_select_current_list_index = <index> 
		<level_list> = ( ( level_select_tabs [ <index> ] ) . levels ) 
		IF ObjectExists id = current_menu 
			i = 0 
			BEGIN 
				IF ObjectExists id = ( ( ( <old_level_list> ) [ <i> ] ) . level ) 
					DestroyScreenElement id = ( ( ( <old_level_list> ) [ <i> ] ) . level ) 
				ENDIF 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
		change level_select_item_current_index = 0 
		ForEachIn <level_list> do = level_select_menu_add_item params = <...> 
		level_select_update_screen 
		RunScriptOnScreenElement id = _rightarrow do_arrow_effect 
		tab_title_logo : DoMorph pos = PAIR(600.00000000000, 91.00000000000) alpha = 0.00000000000 scale = 0.20000000298 time = 0.20000000298 
		tab_title_logo : DoMorph pos = PAIR(360.00000000000, 91.00000000000) time = 0.00000000000 
		FormatText ChecksumName = indicator_id "indicator_%i" i = ( level_select_current_list_index ) 
		<indicator_id> : DoMorph alpha = 1.00000000000 time = 0.05000000075 
		SetScreenElementProps id = tab_title_logo texture = ( ( level_select_tabs [ <index> ] ) . logo ) 
		tab_title_logo : DoMorph pos = PAIR(480.00000000000, 91.00000000000) alpha = 1.00000000000 scale = 0.50000000000 time = 0.20000000298 
	ENDIF 
ENDSCRIPT

SCRIPT do_arrow_effect 
	Theme_GetSupportPieceColor return_value = tab_color 
	DoMorph scale = 0.89999997616 time = 0.10000000149 rgba = [ 0 0 0 80 ] 
	DoMorph scale = 1.00000000000 time = 0.10000000149 rgba = <tab_color> 
ENDSCRIPT

level_select_menu_level_info = [ 
	{ text = "TRAINING" level = load_tr } 
	{ text = "BOSTON" level = load_BO } 
	{ text = "BARCELONA" level = load_BA } 
	{ text = "BERLIN" level = load_BE } 
	{ text = "AUSTRALIA" level = load_AU } 
	{ text = "SKATOPIA" level = load_ST } 
	{ text = "NEW ORLEANS" level = load_NO } 
	{ text = "PRO SKATER" level = load_SE } 
	{ text = "THE TRIANGLE" level = load_SE2 } 
	{ text = "NEW JERSEY" level = load_NJ } 
	{ text = "MANHATTAN" level = load_NY } 
	{ text = "TAMPA" level = load_fl } 
	{ text = "SAN DIEGO" level = load_sd } 
	{ text = "HAWAII" level = load_HI } 
	{ text = "VANCOUVER" level = load_VC } 
	{ text = "SLAM CITY JAM" level = load_SJ } 
	{ text = "MOSCOW" level = load_RU } 
	{ text = "HOTTER THAN HELL" level = load_hh } 
	{ text = "LOS ANGELES" level = load_la } 
	{ text = "CANADA" level = load_ca } 
	{ text = "AIRPORT" level = load_ap } 
	{ text = "HANGAR" level = load_hn } 
	{ text = "SCHOOL II" level = load_sc2 } 
	{ text = "VENICE" level = load_vn } 
	{ text = "PHILADELPHIA" level = load_ph } 
	{ text = "DOWNHILL JAM" level = load_dj } 
	{ text = "SCHOOL" level = load_sc } 
] 
level_select_tabs = [ 
	{ 
		logo = logo_thug2 
		levels = list_level_thug2 
	} 
	{ 
		logo = logo_thug 
		levels = list_level_thug 
	} 
	{ 
		logo = logo_thps4 
		levels = list_level_thps4 
	} 
	{ 
		logo = logo_thps3 
		levels = list_level_thps3 
	} 
	{ 
		logo = logo_thps2 
		levels = list_level_thps2 
	} 
	{ 
		logo = logo_thps 
		levels = list_level_thps 
	} 
	{ 
		logo = logo_park 
		levels = list_level_custom 
	} 
] 
list_level_thug2 = [ 
	{ text = "TRAINING" level = load_tr level_thumb = poster_default dot_pos = PAIR(89.00000000000, 82.00000000000) level_num = LevelNum_tr } 
	{ text = "BOSTON" level = load_BO level_thumb = poster_default dot_pos = PAIR(135.00000000000, 80.00000000000) level_num = LevelNum_BO } 
	{ text = "BARCELONA" level = load_BA level_thumb = poster_default dot_pos = PAIR(223.00000000000, 84.00000000000) level_num = LevelNum_BA } 
	{ text = "BERLIN" level = load_BE level_thumb = poster_default dot_pos = PAIR(243.00000000000, 68.00000000000) level_num = LevelNum_BE } 
	{ text = "AUSTRALIA" level = load_AU level_thumb = poster_default dot_pos = PAIR(426.00000000000, 194.00000000000) level_num = LevelNum_AU } 
	{ text = "NEW ORLEANS" level = load_NO level_thumb = poster_default dot_pos = PAIR(104.00000000000, 94.00000000000) level_num = LevelNum_NO } 
	{ text = "SKATOPIA" level = load_ST level_thumb = poster_default dot_pos = PAIR(111.00000000000, 83.00000000000) level_num = LevelNum_ST } 
	{ text = "PRO SKATER" level = load_SE level_thumb = poster_default level_num = LevelNum_SE } 
	{ text = "THE TRIANGLE" level = load_SE2 level_thumb = poster_default dot_pos = PAIR(127.00000000000, 105.00000000000) level_num = LevelNum_SE2 } 
] 
list_level_thug = [ 
	{ text = "NEW JERSEY" level = load_NJ level_thumb = poster_nj level_num = LevelNum_NJ dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "MANHATTAN" level = load_NY level_thumb = poster_ny level_num = LevelNum_NY dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "TAMPA" level = load_fl level_thumb = poster_default level_num = LevelNum_FL dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "SAN DIEGO" level = load_sd level_thumb = poster_default level_num = LevelNum_SD dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "HAWAII" level = load_HI level_thumb = poster_hi level_num = LevelNum_HI dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "VANCOUVER" level = load_VC level_thumb = poster_vc level_num = LevelNum_VC dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "SLAM CITY JAM" level = load_SJ level_thumb = poster_sj level_num = LevelNum_SJ dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "MOSCOW" level = load_RU level_thumb = poster_ru level_num = LevelNum_RU dot_pos = PAIR(0.00000000000, 0.00000000000) } 
	{ text = "HOTTER THAN HELL" level = load_hh level_thumb = poster_default level_num = LevelNum_HH dot_pos = PAIR(0.00000000000, 0.00000000000) } 
] 
list_level_thps4 = [ 
	{ text = "COLLEGE" level = load_sch level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_SCH } 
	{ text = "SAN FRANCISCO" level = load_sf2 level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_SF2 } 
	{ text = "ALCATRAZ" level = load_alc level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_ALC } 
	{ text = "KONA" level = load_kon level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_KON } 
	{ text = "SHIPYARD" level = load_jnk level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_JNK } 
	{ text = "LONDON" level = load_lon level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_LON } 
	{ text = "ZOO" level = load_zoo level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_ZOO } 
	{ text = "CARNIVAL" level = load_cnv level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_CNV } 
	{ text = "CHICAGO" level = load_hof level_thumb = sign_secret1 dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_HOF } 
] 
list_level_thps3 = [ 
	{ text = "LOS ANGELES" level = load_la level_thumb = poster_default dot_pos = PAIR(78.00000000000, 102.00000000000) level_num = LevelNum_LA } 
	{ text = "CANADA" level = load_ca level_thumb = poster_default dot_pos = PAIR(85.00000000000, 65.00000000000) level_num = LevelNum_CA } 
	{ text = "AIRPORT" level = load_ap level_thumb = poster_default dot_pos = PAIR(410.00000000000, 87.00000000000) level_num = LevelNum_AP } 
] 
list_level_thps2 = [ 
	{ text = "HANGAR" level = load_hn level_thumb = poster_default dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_HN } 
	{ text = "SCHOOL II" level = load_sc2 level_thumb = poster_default dot_pos = PAIR(0.00000000000, 0.00000000000) level_num = LevelNum_SC2 } 
	{ text = "VENICE" level = load_vn level_thumb = poster_default dot_pos = PAIR(85.00000000000, 65.00000000000) level_num = LevelNum_VN } 
	{ text = "PHILADELPHIA" level = load_ph level_thumb = poster_default dot_pos = PAIR(119.00000000000, 80.00000000000) level_num = LevelNum_PH } 
] 
list_level_thps = [ 
	{ text = "DOWNHILL JAM" level_num = LevelNum_DJ level = load_dj level_thumb = poster_default dot_pos = PAIR(165.00000000000, 148.00000000000) } 
	{ text = "SCHOOL" level_num = LevelNum_SC level = load_sc level_thumb = poster_default dot_pos = PAIR(261.00000000000, 185.00000000000) } 
] 
list_level_custom = [ 
	{ text = "BOARDSHOP" level_num = LevelNum_boardshop level = load_boardshop level_thumb = poster_default dot_pos = PAIR(165.00000000000, 148.00000000000) } 
	{ text = "SCHOOL" level_num = LevelNum_SC level = load_sc level_thumb = poster_default dot_pos = PAIR(261.00000000000, 185.00000000000) } 
] 
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
		pos = PAIR(480.00000000000, 330.00000000000) 
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
	IF NOT ArrayContains array = levels_with_gaps contains = <level_num> 
		num_gaps = "??" 
	ELSE 
		GetLevelGapTotals level = <level_num> 
	ENDIF 
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
	IF NOT ArrayContains array = levels_with_gaps contains = <level_num> 
		RETURN 
	ENDIF 
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
	IF NOT GotParam level_thumb 
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
	IF NOT GotParam level_thumb 
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
	IF NOT GotParam level_thumb 
		RETURN 
	ENDIF 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 25.00000000000) 
	level_select_info_add_highscore <...> pos = PAIR(0.00000000000, 45.00000000000) 
	level_select_info_panel_fade_in 
ENDSCRIPT

SCRIPT level_select_build_online_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam level_thumb 
		RETURN 
	ENDIF 
	level_select_info_add_gaps <...> pos = PAIR(0.00000000000, 45.00000000000) 
	level_select_info_panel_fade_in 
ENDSCRIPT

SCRIPT level_select_build_creategoals_info_panel 
	level_select_build_info_panel_common_bits <...> 
	IF GotParam die 
		RETURN 
	ENDIF 
	IF NOT GotParam level_thumb 
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
	Y = 0 
	BEGIN 
		FormatText ChecksumName = piece "map%a" a = ( ( level_map_pieces [ <X> ] . tiles ) [ <Y> ] ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = { globe_sliding_anchor child = <slice> } 
			texture = <piece> 
			pos = ( <Y> * PAIR(0.00000000000, 64.00000000000) ) 
			scale = 1 
			rgba = [ 128 128 128 128 ] 
			just = [ center top ] 
			z_priority = -50 
		} 
		Y = ( <Y> + 1 ) 
	REPEAT <y_size> 
	IF StructureContains structure = ( level_map_pieces [ <X> ] ) dot_count 
		IF ( ( ( level_map_pieces [ <X> ] ) . dot_count ) > 0 ) 
			index = 0 
			BEGIN 
				dot_index = ( ( level_map_pieces [ <X> ] ) . dots [ <index> ] ) 
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
			REPEAT ( level_map_pieces [ <X> ] . dot_count ) 
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
			rgba = [ 115 14 13 128 ] 
			just = [ center center ] 
			z_priority = -49 
		} id = <id> scale = 8 alpha = 0 time = 0.64999997616 
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
					level_select_globe_slice X = <index> Y = <Y> y_size = <y_size> slice = <slice> level_list = <level_list> 
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
	IF GotParam dot_pos 
	ELSE 
	ENDIF 
	IF ScreenElementExists id = level_poster 
		SetScreenElementProps id = level_poster texture = <texture> 
	ELSE 
		SetScreenElementProps id = level_poster texture = white2 
	ENDIF 
	level_select_get_info_panel_script 
	KillSpawnedScript name = level_select_build_info_panel_common_bits 
	KillSpawnedScript name = <info_panel_script> 
	SpawnScript <info_panel_script> params = <...> 
ENDSCRIPT

SCRIPT level_select_build_title 
	IF ScreenElementExists id = current_level_title 
		DoScreenElementMorph id = current_level_title alpha = 0 time = 0.07999999821 
		DoScreenElementMorph id = current_level_image alpha = 0 time = 0.07999999821 
		wait 0.10000000149 seconds 
		IF NOT ScreenElementExists id = current_level_title 
			RETURN 
		ENDIF 
		DestroyScreenElement id = current_level_title 
		DestroyScreenElement id = current_level_image 
	ENDIF 
	IF NOT ScreenElementExists id = tab_anchor 
		RETURN 
	ENDIF 
	SetScreenElementLock id = tab_anchor off 
	FormatText ChecksumName = title_color "%i_MENU_TITLE_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	CreateScreenElement { 
		type = TextElement 
		parent = tab_anchor 
		id = current_level_title 
		text = <text> 
		font = testtitle 
		rgba = <title_color> 
		alpha = 1 
		scale = 1.79999995232 
		pos = PAIR(155.00000000000, 42.00000000000) 
		just = [ center top ] 
		z_priority = 6 
		shadow 
		shadow_rgba = [ 0 0 0 128 ] 
		shadow_offs = PAIR(0.40000000596, 0.50000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tab_anchor 
		id = current_level_image 
		texture = <texture> 
		scale = 2.20000004768 
		pos = PAIR(320.00000000000, 60.00000000000) 
		z_priority = 1 
		rgba = [ 128 128 128 100 ] 
	} 
	DoScreenElementMorph id = current_level_title alpha = 0 time = 0 
	DoScreenElementMorph id = current_level_title alpha = 1 time = 0.07999999821 
	DoScreenElementMorph id = current_level_image alpha = 0 time = 0 
	DoScreenElementMorph id = current_level_image alpha = 1 time = 0.07999999821 
ENDSCRIPT

SCRIPT dot_to_slice 
	X = ( ( <dot> ) . PAIR(1.00000000000, 0.00000000000) ) 
	X = ( <X> / ( globe_piece_size ) ) 
	CastToInteger X 
	RETURN slice = <X> 
ENDSCRIPT

SCRIPT check_level_dot_valid 
	RETURN valid = 1 
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
		SetArrayElement arrayname = index_array index = <index> newvalue = 0 
		index = ( <index> + 1 ) 
	REPEAT <slice_size> 
	total_dots = 0 
	index = 0 
	BEGIN 
		check_level_dot_valid level_list = <level_list> index = <index> 
		IF ( <valid> = 1 ) 
			dot_to_slice dot = ( <level_list> [ <index> ] . dot_pos ) 
			SetArrayElement arrayname = index_array index = <slice> newvalue = ( ( <index_array> [ <slice> ] ) + 1 ) 
			total_dots = ( <total_dots> + 1 ) 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <level_size> 
	GetGameMode 
	IF ( level_select_last_gamemode_processed = <GameMode> ) 
		IF ( level_select_last_demoflag_processed = ( demo_build ) ) 
			IF ( level_select_last_dot_count = <total_dots> ) 
				printf "using existing dot positions" 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	change level_select_last_gamemode_processed = <GameMode> 
	change level_select_last_demoflag_processed = ( demo_build ) 
	change level_select_last_dot_count = <total_dots> 
	printf "calculating new dot positions" 
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
					X = ( ( <dot> ) . PAIR(1.00000000000, 0.00000000000) ) 
					X = ( <X> - <slice> * ( globe_piece_size ) - ( globe_piece_size * 0.50000000000 ) ) 
					Y = ( ( <dot> ) . PAIR(0.00000000000, 1.00000000000) ) 
					IF ( <slice> = <index> ) 
						SetArrayElement arrayname = index_array index = <slot> newvalue = <map> 
						SetArrayElement arrayname = level_list index = <map> newvalue = { ( <level_list> [ <map> ] ) 
							dot_local_pos = ( <X> * PAIR(1.00000000000, 0.00000000000) + <Y> * PAIR(0.00000000000, 1.00000000000) ) 
						} 
						slot = ( <slot> + 1 ) 
					ENDIF 
				ENDIF 
				map = ( <map> + 1 ) 
			REPEAT <level_size> 
			SetArrayElement arrayname = map_info index = <index> newvalue = { ( <map_info> [ <index> ] ) 
				dot_count = <slot> 
				dots = ( <index_array> ) 
			} 
		ELSE 
			SetArrayElement arrayname = map_info index = <index> newvalue = { ( <map_info> [ <index> ] ) 
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
	CreateScreenElement { 
		type = ContainerElement 
		parent = map_anchor 
		id = map_mask 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	mask_color = [ 0 0 0 128 ] 
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
SCRIPT created_park_menu_add_item 
	highlight_bar_scale = PAIR(1.60000002384, 0.69999998808) 
	centered = centered 
	no_bg = no_bg 
	theme_menu_add_item <...> 
ENDSCRIPT

SCRIPT level_select_menu_add_item 
	IF GotParam spacer 
		width = ( <width> * 0.55000001192 ) 
	ENDIF 
	Theme_GetHighlightBarColor return_value = bg_color 
	<pad_choose_script> = level_select_valid_choice 
	<can_afford_level> = 0 
	<highlight_bar_scale> = PAIR(1.60000002384, 0.69999998808) 
	<highlight_bar_pos> = PAIR(0.00000000000, 10.00000000000) 
	<no_bg> = no_bg 
	<texture> = <level_thumb> 
	<in_locked_group> = 0 
	locked = 0 
	IF ( in_server_options = 1 ) 
		level_callback_script = level_select_menu_exit 
	ELSE 
		level_callback_script = level_select_change_level 
	ENDIF 
	pad_choose_params = <...> 
	change level_select_item_current_index = ( ( level_select_item_current_index ) + 1 ) 
	item_parent = current_menu 
	IF NOT ScriptExists <level> 
		focus = not_focusable 
	ELSE 
		focus = { focusable } 
		SetScreenElementProps id = <item_parent> focusable 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = <level> 
		dims = PAIR(256.00000000000, 20.00000000000) 
		event_handlers = [ { pad_choose generic_menu_pad_choose_sound } 
			{ pad_start generic_menu_pad_choose_sound } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			{ focus level_select_update_screen params = <pad_choose_params> texture = <texture> } 
			{ focus main_theme_focus_noscale params = { text_alpha = <alpha> highlighted_text_rgba = <bg_color> } } 
			{ unfocus main_theme_unfocus_noscale params = { text_rgba = <rgba> text_alpha = <alpha> } } 
		] 
		replace_handlers 
		<focus> 
	} 
	IF GotParam spacer 
		RETURN 
	ENDIF 
	IF ( <focus> = not_focusable ) 
		CreateScreenElement { 
			type = TextElement 
			parent = <id> 
			font = newtrickfont 
			scale = 0.69999998808 
			just = [ center top ] 
			text = <text> 
			rgba = [ 70 70 70 128 ] 
			alpha = <alpha> 
			z_priority = 4 
			pos = PAIR(6.00000000000, 0.00000000000) 
		} 
	ELSE 
		CreateScreenElement { 
			type = TextElement 
			parent = <id> 
			font = newtrickfont 
			scale = 0.69999998808 
			just = [ center top ] 
			text = <text> 
			rgba = <rgba> 
			alpha = <alpha> 
			z_priority = 4 
			pos = PAIR(6.00000000000, 0.00000000000) 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <level> 
		texture = DE_highlight_bar 
		pos = <highlight_bar_pos> 
		rgba = [ 0 0 0 0 ] 
		just = [ center center ] 
		scale = <highlight_bar_scale> 
		z_priority = 2 
	} 
	IF GotParam cross_it_out 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <id> 
			texture = streak_2 
			just = [ center center ] 
			z_priority = 2 
		} 
	ENDIF 
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
							printf "se2 blocked" 
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
			GoalManager_showPoints 
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
				GoalManager_showGoalPoints 
			ENDIF 
			create_pause_menu 
		ENDIF 
	ENDIF 
	load_update_level_select_textures_to_main_memory unload 
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
		IF InNetGame 
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
	IF InNetGame 
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
		IF InNetGame 
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
		printf "launching created level" 
	ENDIF 
	IF GotParam load_park 
		printf "launching created level" 
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
	printf "level_select_created_park_list" 
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
	IF InNetGame 
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
		printf "loading from disk" 
		IF GotParam in_park_ed 
			printf "in the park editor" 
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
	GoalManager_showPoints 
	IF NOT GoalManager_HasActiveGoals 
		GoalManager_showGoalPoints 
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
				SetArrayElement arrayname = array index = 0 newvalue = <level> 
				level = <temp> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InNetGame 
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
	printf "locked!" 
ENDSCRIPT

SCRIPT level_select_valid_choice 
	GetTags 
	theme_menu_pad_choose_sound 
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
	{ text = "BOSTON" level_num = 1 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_BO level = load_BO level_thumb = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "" level_num = 2 level_thumb = sign_barcelona force_locked } 
	{ text = "" level_num = 3 level_thumb = sign_berlin force_locked } 
	{ text = "" level_num = 4 level_thumb = sign_australia force_locked } 
	{ text = "" level_num = 5 level_thumb = sign_neworleans force_locked } 
	{ text = "" level_num = 6 level_thumb = sign_skatopia force_locked } 
	{ text = "" level_num = 7 level_thumb = sign_secret1 force_locked } 
] 
e3_level_select_menu_classic_level_info = [ 
	{ text = "" level_num = 12 level_thumb = sign_barcelona force_locked } 
	{ text = "" level_num = 13 level_thumb = sign_berlin force_locked } 
	{ text = "" level_num = 14 level_thumb = sign_australia force_locked } 
	{ text = "" level_num = 15 level_thumb = sign_neworleans force_locked } 
	{ text = "" level_num = 16 level_thumb = sign_skatopia force_locked } 
	{ text = "BOSTON" level_num = 1 num_goals = 0 flag = LEVEL_UNLOCKED_BO level = load_BO level_thumb = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "" level_num = 2 level_thumb = sign_barcelona force_locked } 
	{ text = "" level_num = 3 level_thumb = sign_berlin force_locked } 
	{ text = "" level_num = 4 level_thumb = sign_australia force_locked } 
	{ text = "" level_num = 5 level_thumb = sign_neworleans force_locked } 
	{ text = "" level_num = 6 level_thumb = sign_skatopia force_locked } 
] 
classic_mode_max_bracket = 8 
level_select_menu_classic_level_info = [ 
	{ text = "BARCELONA" level_num = LevelNum_BA bracket = 0 flag = LEVEL_BRACKET_UNLOCKED_1 seen_flag = LEVEL_SEEN_BA level = load_BA level_thumb = sign_barcelona dot_pos = PAIR(223.00000000000, 84.00000000000) } 
	{ text = "AUSTRALIA" level_num = LevelNum_AU bracket = 1 flag = LEVEL_BRACKET_UNLOCKED_2 seen_flag = LEVEL_SEEN_AU level = load_AU level_thumb = sign_australia dot_pos = PAIR(426.00000000000, 194.00000000000) } 
	{ text = "SKATOPIA" level_num = LevelNum_ST bracket = 1 flag = LEVEL_BRACKET_UNLOCKED_2 seen_flag = LEVEL_SEEN_ST level = load_ST level_thumb = sign_skatopia dot_pos = PAIR(111.00000000000, 83.00000000000) } 
	{ text = "BERLIN" level_num = LevelNum_BE bracket = 2 flag = LEVEL_BRACKET_UNLOCKED_3 seen_flag = LEVEL_SEEN_BE level = load_BE level_thumb = sign_berlin dot_pos = PAIR(243.00000000000, 68.00000000000) } 
	{ text = "AIRPORT" level_num = LevelNum_AP bracket = 3 flag = LEVEL_BRACKET_UNLOCKED_4 seen_flag = LEVEL_SEEN_AP level = load_ap level_thumb = sign_airport dot_pos = PAIR(410.00000000000, 87.00000000000) } 
	{ text = "SCHOOL" level_num = LevelNum_SC bracket = 3 flag = LEVEL_BRACKET_UNLOCKED_4 seen_flag = LEVEL_SEEN_SC level = load_sc level_thumb = sign_school dot_pos = PAIR(261.00000000000, 185.00000000000) } 
	{ text = "DOWNHILL JAM" level_num = LevelNum_DJ bracket = 4 flag = LEVEL_BRACKET_UNLOCKED_5 seen_flag = LEVEL_SEEN_DJ level = load_dj level_thumb = sign_jam dot_pos = PAIR(165.00000000000, 148.00000000000) } 
	{ text = "NEW ORLEANS" level_num = LevelNum_NO bracket = 5 flag = LEVEL_BRACKET_UNLOCKED_6 seen_flag = LEVEL_SEEN_NO level = load_NO level_thumb = sign_neworleans dot_pos = PAIR(104.00000000000, 94.00000000000) } 
	{ text = "TRAINING" level_num = LevelNum_tr bracket = 5 flag = LEVEL_BRACKET_UNLOCKED_6 seen_flag = LEVEL_SEEN_TR level = load_tr level_thumb = sign_training dot_pos = PAIR(89.00000000000, 82.00000000000) } 
	{ text = "BOSTON" level_num = LevelNum_BO bracket = 6 flag = LEVEL_BRACKET_UNLOCKED_7 seen_flag = LEVEL_SEEN_BO level = load_BO level_thumb = sign_boston dot_pos = PAIR(135.00000000000, 80.00000000000) } 
	{ text = "CANADA" level_num = LevelNum_CA bracket = 7 flag = LEVEL_BRACKET_UNLOCKED_8 seen_flag = LEVEL_SEEN_CA level = load_ca level_thumb = sign_canada dot_pos = PAIR(85.00000000000, 65.00000000000) } 
	{ text = "PHILADELPHIA" level_num = LevelNum_PH bracket = 7 flag = LEVEL_BRACKET_UNLOCKED_8 seen_flag = LEVEL_SEEN_PH level = load_ph level_thumb = sign_philly dot_pos = PAIR(119.00000000000, 80.00000000000) } 
	{ spacer unlocked_with_se2 force_locked level_num = 0 } 
	{ text = "LOS ANGELES" level_num = LevelNum_LA bracket = 8 flag = LEVEL_BRACKET_UNLOCKED_9 seen_flag = LEVEL_SEEN_LA level = load_la level_thumb = sign_la dot_pos = PAIR(78.00000000000, 102.00000000000) } 
	{ text = "THE TRIANGLE" level_num = LevelNum_SE2 bracket = 8 unlocked_with_se2 flag = GAME_CLASSIC_UNLOCKED_SE2 seen_flag = LEVEL_SEEN_SE2 level = load_SE2 level_thumb = sign_secret2 dot_pos = PAIR(127.00000000000, 105.00000000000) } 
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

