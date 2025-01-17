SCRIPT download_stats 
	
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF NeedToRetrieveTopStats 
		RetrieveTopStats file = 0 
		dialog_box_exit 
		create_dialog_box { title = net_status_msg 
			text = "Retrieving stats." 
			buttons = [ { text = "cancel" pad_choose_script = cancel_download_stats } 
			] 
			no_animate 
		} 
	ELSE 
		create_online_stats_menu 
	ENDIF 
ENDSCRIPT

SCRIPT cancel_download_stats 
	dialog_box_exit 
	CancelFileTransfer 
	online_stats_exit 
ENDSCRIPT

SCRIPT download_more_stats 
	RetrieveTopStats 
ENDSCRIPT

SCRIPT StatsRetrievalFailed 
	
	dialog_box_exit 
	create_dialog_box { title = "Transfer Failed" 
		text = "Could not retrieve stats. Try again later or check your network cables." 
		buttons = [ { text = "ok" pad_choose_script = online_stats_exit } 
		] 
	} 
ENDSCRIPT

SCRIPT stats_retrieval_complete 
	create_online_stats_menu 
ENDSCRIPT

SCRIPT create_online_stats_menu 
	dialog_box_exit 
	pulse_blur 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementLock id = root_window off 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = stats_bg_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = stats_bg_anchor alias = current_menu_anchor 
	create_helper_text generic_helper_text_up_down_left_right 
	build_theme_sub_title title = "ONLINE STATS" no_grad_bar 
	build_top_and_bottom_blocks bot_z = 15 no_lines 
	make_mainmenu_3d_plane 
	CreateScreenElement { 
		type = ContainerElement 
		parent = stats_bg_anchor 
		id = stats_menu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 840.00000000000) 
	} 
	AssignAlias id = stats_menu_anchor alias = current_menu_anchor 
	theme_background width = 7 pos = PAIR(320.00000000000, 65.00000000000) num_parts = 10 static = static dark_menu = dark_menu 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		texture = white2 
		scale = PAIR(71.30000305176, 8.00000000000) 
		pos = PAIR(35.00000000000, 67.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = current_menu_anchor 
		id = subtitle 
		text = "" 
		scale = 1.39999997616 
		font = small 
		rgba = <on_rgba> 
		pos = PAIR(170.00000000000, 89.00000000000) 
		just = [ center center ] 
		z_priority = 30 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		id = left_arrow 
		texture = left_arrow 
		scale = PAIR(1.00000000000, 1.00000000000) 
		pos = PAIR(60.00000000000, 87.00000000000) 
		just = [ right center ] 
		alpha = 0.50000000000 
		z_priority = 30 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		id = right_arrow 
		texture = right_arrow 
		scale = PAIR(1.00000000000, 1.00000000000) 
		pos = PAIR(280.00000000000, 87.00000000000) 
		just = [ left center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		texture = white2 
		scale = PAIR(36.00000000000, 5.00000000000) 
		pos = PAIR(34.00000000000, 35.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = current_menu_anchor 
		texture = white2 
		scale = PAIR(36.50000000000, 5.00000000000) 
		pos = PAIR(32.00000000000, 35.00000000000) 
		just = [ left top ] 
		rgba = [ 26 43 84 128 ] 
		z_priority = 1.50000000000 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = stats_bg_anchor 
		id = timetext 
		text = "" 
		scale = 1.39999997616 
		font = small 
		rgba = <on_rgba> 
		pos = PAIR(170.00000000000, 77.00000000000) 
		just = [ center center ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = HMenu 
		parent = current_menu_anchor 
		id = top_hmenu 
		pos = PAIR(300.00000000000, 66.00000000000) 
		just = [ left top ] 
		padding_scale = 0.75000000000 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = online_stats_exit } } 
			{ pad_left generic_menu_up_or_down_sound params = { up } } 
			{ pad_right generic_menu_up_or_down_sound params = { down } } 
		] 
	} 
	GetArraySize online_stats_categories 
	index = 0 
	BEGIN 
		online_stats_hmenu_add_item index = <index> 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	CreateScreenElement { 
		type = spriteElement 
		parent = stats_bg_anchor 
		id = globe 
		texture = globe 
		scale = 1.29999995232 
		pos = PAIR(320.00000000000, 560.00000000000) 
		just = [ center center ] 
		alpha = 0.30000001192 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = stats_bg_anchor 
		z_priority = 100 
		pos = PAIR(132.00000000000, 42.00000000000) 
		texture = gslogo scale = 1.10000002384 
		alpha = 1 
	} 
	RunScriptOnScreenElement id = globe rotate_internet_options_globe 
	RunScriptOnScreenElement id = stats_menu_anchor online_stats_animate_in 
	FireEvent type = focus target = top_hmenu 
ENDSCRIPT

SCRIPT online_stats_animate_in id = stats_menu_anchor 
	wait 2 gameframes 
	IF LevelIs Load_MainMenu 
		DoScreenElementMorph id = <id> time = 0.20000000298 pos = PAIR(320.00000000000, 255.00000000000) 
	ELSE 
		IF ScreenElementExists id = top_bar_anchor 
			DoScreenElementMorph id = top_bar_anchor time = 0.20000000298 pos = PAIR(0.00000000000, 62.00000000000) 
		ENDIF 
		DoScreenElementMorph id = <id> time = 0.20000000298 pos = PAIR(320.00000000000, 265.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT online_stats_exit 
	KillSpawnedScript name = create_online_stat_scores_menu 
	KillSpawnedScript name = create_online_stat_players_menu 
	KillSpawnedScript name = create_online_stat_personal_menu 
	IF ScreenElementExists id = stats_bg_anchor 
		DestroyScreenElement id = stats_bg_anchor 
	ENDIF 
	create_internet_options 
ENDSCRIPT

SCRIPT online_stats_hmenu_add_item 
	icon = ( online_stats_categories [ <index> ] . icon ) 
	text = ( online_stats_categories [ <index> ] . text ) 
	time = ( online_stats_categories [ <index> ] . time ) 
	array = ( online_stats_categories [ <index> ] . array ) 
	menu_type = ( online_stats_categories [ <index> ] . menu_type ) 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	CreateScreenElement { 
		type = spriteElement 
		parent = top_hmenu 
		texture = <icon> 
		rgba = <rgba> 
		scale = 0.69999998808 
		z_priority = 3 
		event_handlers = [ { focus online_stats_hmenu_focus params = { text = <text> menu_type = <menu_type> time = <time> array = <array> warned = no } } 
			{ unfocus online_stats_hmenu_unfocus } 
		] 
	} 
ENDSCRIPT

SCRIPT online_stats_hmenu_focus 
	GetTags 
	Theme_GetHighlightedTextColor return_value = rgba 
	SetScreenElementProps id = <id> rgba = <rgba> 
	SetScreenElementProps id = subtitle text = <text> 
	GetTextElementString id = timetext 
	IF ( <time> = all ) 
		IF NOT ( <string> = "All Time" ) 
			RunScriptOnScreenElement online_stats_swap_time_text id = timetext params = { text = "All Time" } 
		ENDIF 
	ENDIF 
	IF ( <time> = week ) 
		IF NOT ( <string> = "Recent" ) 
			RunScriptOnScreenElement online_stats_swap_time_text id = timetext params = { text = "Recent" } 
		ENDIF 
	ENDIF 
	KillSpawnedScript name = create_online_stat_scores_menu 
	KillSpawnedScript name = create_online_stat_players_menu 
	KillSpawnedScript name = create_online_stat_personal_menu 
	IF ( <menu_type> = scores ) 
		SpawnScript create_online_stat_scores_menu params = { array = <array> } 
	ENDIF 
	IF ( <menu_type> = players ) 
		SpawnScript create_online_stat_players_menu params = { array = <array> } 
	ENDIF 
	IF ( <menu_type> = personal ) 
		IF NOT ProfileLoggedIn 
			IF ( <warned> = no ) 
				FireEvent type = unfocus target = top_hmenu 
				create_dialog_box { title = "No Stats" 
					text = "You are not logged into GameSpy.\\n You must be logged into GameSpy in order to record stats." 
					buttons = [ { text = "ok" pad_choose_script = ok_no_personal_stats } 
					] 
					text_dims = PAIR(380.00000000000, 0.00000000000) 
					no_bg 
					pad_left_script = dialog_box_exit 
					pad_right_script = dialog_box_exit 
				} 
				SetTags warned = yes 
			ENDIF 
		ENDIF 
		GetRank 
		GetPreferenceString pref_type = network network_id 
		SpawnScript create_online_stat_personal_menu params = { array = <array> name = <ui_string> rank = <rank> } 
	ENDIF 
ENDSCRIPT

SCRIPT ok_no_personal_stats 
	dialog_box_exit 
	wait 2 frames 
	FireEvent type = focus target = top_hmenu 
ENDSCRIPT

SCRIPT online_stats_swap_time_text time = 0.20000000298 
	DoScreenElementMorph id = timetext scale = PAIR(0.00000000000, 1.00000000000) relative_scale time = <time> 
	wait ( <time> + 0.10000000149 ) seconds 
	SetScreenElementProps id = timetext text = <text> 
	DoScreenElementMorph id = timetext scale = PAIR(1.00000000000, 1.00000000000) relative_scale time = <time> 
ENDSCRIPT

SCRIPT online_stats_hmenu_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	SetScreenElementProps id = <id> rgba = <rgba> 
ENDSCRIPT

online_stats_categories = [ 
	{ text = "Best Scores" icon = stat_scores menu_type = scores time = week array = high_scores_array_monthly } 
	{ text = "Best Combos" icon = stat_combos menu_type = scores time = week array = best_combos_array_monthly } 
	{ text = "Top Players" icon = stat_players menu_type = players time = all array = top_players_array } 
	{ text = "Best Scores" icon = stat_scores menu_type = scores time = all array = high_scores_array_all_time } 
	{ text = "Best Combos" icon = stat_combos menu_type = scores time = all array = best_combos_array_all_time } 
	{ text = "Personal Stats" icon = stat_personal menu_type = personal time = all array = personal_stats_array } 
] 
high_scores_array_all_time = [ ] 
best_combos_array_all_time = [ ] 
high_scores_array_monthly = [ ] 
best_combos_array_monthly = [ ] 
top_players_array = [ ] 
personal_stats_array = [ ] 
SCRIPT create_online_stat_scores_menu 
	IF ScreenElementExists id = online_stats_submenu_anchor 
		DestroyScreenElement id = online_stats_submenu_anchor 
	ENDIF 
	wait 5 gameframes 
	SetScreenElementLock off id = stats_menu_anchor 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = stats_menu_anchor 
		id = online_stats_submenu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 244.00000000000) 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Name" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(90.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = up_arrow 
		texture = up_arrow 
		scale = 1 
		pos = PAIR(260.00000000000, 115.00000000000) 
		just = [ center center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = down_arrow 
		texture = down_arrow 
		scale = 1 
		pos = PAIR(260.00000000000, 345.00000000000) 
		just = [ center center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(0.80000001192, 28.29999923706) 
		pos = PAIR(320.00000000000, 127.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Level" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(325.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(0.80000001192, 28.29999923706) 
		pos = PAIR(450.00000000000, 127.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Score" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(480.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = vscrollingmenu 
		parent = online_stats_submenu_anchor 
		id = bottom_scrolling_menu 
		just = [ left top ] 
		dims = PAIR(600.00000000000, 210.00000000000) 
		pos = PAIR(100.00000000000, 135.00000000000) 
		alpha = 0 
	} 
	CreateScreenElement { 
		type = vmenu 
		parent = bottom_scrolling_menu 
		id = bottom_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
		dont_allow_wrap 
	} 
	FillStatsArrays array = <array> 
	wait 2 gameframes 
	pulse_blur 
	SetScreenElementProps id = bottom_scrolling_menu reset_window_top 
	DoScreenElementMorph id = bottom_scrolling_menu alpha = 1 
	FireEvent type = focus target = bottom_vmenu 
ENDSCRIPT

SCRIPT add_stat_score_menu_item 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = bottom_vmenu 
		dims = PAIR(400.00000000000, 15.00000000000) 
		event_handlers = [ { focus online_stats_generic_focus } 
			{ unfocus online_stats_generic_unfocus } 
		] 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = DE_highlight_bar 
		scale = PAIR(4.44999980927, 0.44999998808) 
		pos = PAIR(-65.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <bar_rgba> 
		alpha = 0 
		z_priority = 2 
	} 
	FormatText checksumname = rank_icon "rank_%i" i = <rank> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = <rank_icon> 
		scale = 0.69999998808 
		pos = PAIR(-60.00000000000, 0.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <name> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <off_rgba> 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <level> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(235.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <off_rgba> 
	} 
	FormatText textname = score_text "%i" i = <score> UseCommas 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <score_text> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(490.00000000000, 0.00000000000) 
		just = [ right center ] 
		rgba = <off_rgba> 
	} 
ENDSCRIPT

SCRIPT add_stat_header_menu_item 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = bottom_vmenu 
		dims = PAIR(400.00000000000, 15.00000000000) 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = white2 
		scale = PAIR(70.00000000000, 2.00000000000) 
		pos = PAIR(-55.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = [ 0 0 0 128 ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <text> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <on_rgba> 
	} 
ENDSCRIPT

SCRIPT online_stats_generic_focus 
	GetTags 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	DoScreenElementMorph id = { <id> child = 0 } alpha = 1 
	index = 2 
	BEGIN 
		IF ScreenElementExists id = { <id> child = <index> } 
			SetScreenElementProps id = { <id> child = <index> } rgba = <on_rgba> 
		ELSE 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 
ENDSCRIPT

SCRIPT online_stats_generic_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	DoScreenElementMorph id = { <id> child = 0 } alpha = 0 
	index = 2 
	BEGIN 
		IF ScreenElementExists id = { <id> child = <index> } 
			SetScreenElementProps id = { <id> child = <index> } rgba = <off_rgba> 
		ELSE 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 
ENDSCRIPT

SCRIPT create_online_stat_players_menu 
	IF ScreenElementExists id = online_stats_submenu_anchor 
		DestroyScreenElement id = online_stats_submenu_anchor 
	ENDIF 
	wait 5 gameframes 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	SetScreenElementLock off id = stats_menu_anchor 
	CreateScreenElement { 
		type = ContainerElement 
		parent = stats_menu_anchor 
		id = online_stats_submenu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 244.00000000000) 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Name" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(90.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = up_arrow 
		texture = up_arrow 
		scale = 1 
		pos = PAIR(260.00000000000, 115.00000000000) 
		just = [ center center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = down_arrow 
		texture = down_arrow 
		scale = 1 
		pos = PAIR(260.00000000000, 345.00000000000) 
		just = [ center center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(0.80000001192, 28.29999923706) 
		pos = PAIR(320.00000000000, 127.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Rating" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(330.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(0.80000001192, 28.29999923706) 
		pos = PAIR(405.00000000000, 127.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Highest Score" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(415.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = vscrollingmenu 
		parent = online_stats_submenu_anchor 
		id = bottom_scrolling_menu 
		just = [ left top ] 
		dims = PAIR(600.00000000000, 210.00000000000) 
		pos = PAIR(100.00000000000, 135.00000000000) 
		alpha = 0 
	} 
	CreateScreenElement { 
		type = vmenu 
		parent = bottom_scrolling_menu 
		id = bottom_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
		dont_allow_wrap 
	} 
	FillStatsArrays array = <array> 
	wait 2 gameframes 
	pulse_blur 
	SetScreenElementProps id = bottom_scrolling_menu reset_window_top 
	DoScreenElementMorph id = bottom_scrolling_menu alpha = 1 
	FireEvent type = focus target = bottom_vmenu 
ENDSCRIPT

SCRIPT add_stat_player_menu_item 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = bottom_vmenu 
		dims = PAIR(400.00000000000, 15.00000000000) 
		event_handlers = [ { focus online_stats_generic_focus } 
			{ unfocus online_stats_generic_unfocus } 
		] 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = DE_highlight_bar 
		scale = PAIR(4.44999980927, 0.44999998808) 
		pos = PAIR(-65.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <bar_rgba> 
		alpha = 0 
		z_priority = 2 
	} 
	FormatText checksumname = rank_icon "rank_%i" i = <rank> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = <rank_icon> 
		scale = 0.69999998808 
		pos = PAIR(-60.00000000000, 0.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <name> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <off_rgba> 
	} 
	FormatText textname = rating_text "%i" i = <rating> 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <rating_text> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(295.00000000000, 0.00000000000) 
		just = [ right center ] 
		rgba = <off_rgba> 
	} 
	FormatText textname = score_text "%i" i = <score> UseCommas 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <score_text> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(490.00000000000, 0.00000000000) 
		just = [ right center ] 
		rgba = <off_rgba> 
	} 
ENDSCRIPT

SCRIPT create_online_stat_personal_menu name_text = "" 
	IF ScreenElementExists id = online_stats_submenu_anchor 
		DestroyScreenElement id = online_stats_submenu_anchor 
	ENDIF 
	wait 5 gameframes 
	SetScreenElementLock off id = stats_menu_anchor 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = stats_menu_anchor 
		id = online_stats_submenu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 268.00000000000) 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(71.30000305176, 4.00000000000) 
		pos = PAIR(35.00000000000, 127.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(71.30000305176, 0.10000000149) 
		pos = PAIR(35.00000000000, 132.00000000000) 
		just = [ left top ] 
		rgba = <on_rgba> 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Name:" 
		scale = 0.80000001192 
		font = dialog 
		rgba = <off_rgba> 
		alpha = 0.50000000000 
		pos = PAIR(50.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		id = name_value 
		text = <name> 
		scale = 1 
		font = dialog 
		rgba = <off_rgba> 
		pos = PAIR(105.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	IF NOT GotParam rank 
		rank = 0 
	ENDIF 
	FormatText textname = rank_text "%i" i = <rank> 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Rating:" 
		scale = 0.80000001192 
		font = dialog 
		rgba = <off_rgba> 
		alpha = 0.50000000000 
		pos = PAIR(300.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		id = rating_value 
		text = <rank_text> 
		scale = 1 
		font = dialog 
		rgba = <off_rgba> 
		pos = PAIR(380.00000000000, 115.00000000000) 
		just = [ right center ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "/10" 
		scale = 1 
		font = dialog 
		rgba = <off_rgba> 
		pos = PAIR(415.00000000000, 115.00000000000) 
		just = [ right center ] 
	} 
	FormatText checksumname = rank_icon "rank_%i" i = <rank> 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = rating_icon 
		texture = <rank_icon> 
		scale = 0.80000001192 
		pos = PAIR(425.00000000000, 115.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Score" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(180.00000000000, 145.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = up_arrow 
		texture = up_arrow 
		scale = 1 
		pos = PAIR(260.00000000000, 145.00000000000) 
		just = [ center center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		id = down_arrow 
		texture = down_arrow 
		scale = 1 
		pos = PAIR(260.00000000000, 322.00000000000) 
		just = [ center center ] 
		alpha = 0.50000000000 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = online_stats_submenu_anchor 
		texture = white2 
		scale = PAIR(0.80000001192, 28.29999923706) 
		pos = PAIR(320.00000000000, 127.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = online_stats_submenu_anchor 
		text = "Level" 
		scale = 1 
		font = dialog 
		rgba = <on_rgba> 
		pos = PAIR(330.00000000000, 145.00000000000) 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = vscrollingmenu 
		parent = online_stats_submenu_anchor 
		id = bottom_scrolling_menu 
		just = [ left top ] 
		dims = PAIR(600.00000000000, 158.00000000000) 
		pos = PAIR(100.00000000000, 165.00000000000) 
		alpha = 0 
	} 
	CreateScreenElement { 
		type = vmenu 
		parent = bottom_scrolling_menu 
		id = bottom_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
		dont_allow_wrap 
	} 
	FillStatsArrays array = <array> 
	wait 2 gameframes 
	pulse_blur 
	SetScreenElementProps id = bottom_scrolling_menu reset_window_top 
	DoScreenElementMorph id = bottom_scrolling_menu alpha = 1 
	FireEvent type = focus target = bottom_vmenu 
ENDSCRIPT

SCRIPT add_stat_personal_menu_item 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = ContainerElement 
		parent = bottom_vmenu 
		dims = PAIR(400.00000000000, 15.00000000000) 
		event_handlers = [ { focus online_stats_generic_focus } 
			{ unfocus online_stats_generic_unfocus } 
		] 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = DE_highlight_bar 
		scale = PAIR(4.44999980927, 0.44999998808) 
		pos = PAIR(-65.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <bar_rgba> 
		alpha = 0 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = <anchor_id> 
		texture = black 
		scale = 0.00000000000 
		pos = PAIR(-60.00000000000, 0.00000000000) 
		just = [ left center ] 
	} 
	FormatText textname = score_text "%i" i = <score> UseCommas 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <score_text> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(200.00000000000, 0.00000000000) 
		just = [ right center ] 
		rgba = <off_rgba> 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		text = <level> 
		font = dialog 
		scale = 0.80000001192 
		pos = PAIR(235.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <off_rgba> 
	} 
ENDSCRIPT

stats_level_names = [ 
	{ text = "Training" level = load_TR } 
	{ text = "Boston" level = load_BO } 
	{ text = "Barcelona" level = load_BA } 
	{ text = "Berlin" level = load_BE } 
	{ text = "Australia" level = load_AU } 
	{ text = "New Orleans" level = load_NO } 
	{ text = "Skatopia" level = load_ST } 
	{ text = "Pro Skater" level = load_SE } 
	{ text = "The Triangle" level = load_SE2 } 
	{ text = "School" level = load_sc } 
	{ text = "Philly" level = load_ph } 
	{ text = "Downhill Jam" level = load_dj } 
	{ text = "Los Angeles" level = load_la } 
	{ text = "Canada" level = load_ca } 
	{ text = "Airport" level = load_ap } 
] 

