SCRIPT leveleditor_hud_create 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		parent = root_window 
		id = leveleditor_menu_container 
		type = ContainerElement 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		event_handlers = [ 
			{ parked_menu_left parked_scroll_sideways_sound params = { } } 
			{ parked_menu_right parked_scroll_sideways_sound params = { } } 
			{ parked_menu_left parked_menu_blink_arrow params = { id = piece_menu_left_arrow } } 
			{ parked_menu_right parked_menu_blink_arrow params = { id = piece_menu_right_arrow } } 
		] 
	} 
	build_grunge_piece parent = leveleditor_menu_container rgba = [ 128 128 128 64 ] 
	build_top_bar scale = PAIR(1.48000001907, 1.50000000000) pos = PAIR(80.00000000000, 35.00000000000) parent = leveleditor_menu_container 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_menu_title 
		font = font1 
		text = "Level Editor - Default" 
		scale = 1.10000002384 
		pos = PAIR(55.00000000000, 0.00000000000) 
		just = [ center center ] 
		rgba = MENU_TITLE_COLOR 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_cursor_pos_label 
		pos = PAIR(20.00000000000, 350.00000000000) 
		text = "Cursor position:" 
		font = dialog 
		rgba = [ 90 90 150 80 ] 
		just = [ left center ] 
		scale = 0.80000001192 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_cursor_pos 
		pos = PAIR(165.00000000000, 350.00000000000) 
		text = "Cursor position" 
		font = dialog 
		rgba = [ 90 90 100 100 ] 
		just = [ left center ] 
		scale = 0.80000001192 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_piece_label 
		font = dialog 
		text = "Selected:" 
		just = [ left center ] 
		pos = PAIR(88.00000000000, 48.00000000000) 
		rgba = [ 128 90 120 100 ] 
		scale = 0.85000002384 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_piece 
		font = dialog 
		text = "Monkey Stew" 
		just = [ left center ] 
		pos = PAIR(180.00000000000, 48.00000000000) 
		rgba = [ 90 90 100 100 ] 
		scale = 0.85000002384 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_desc_label 
		font = dialog 
		text = "Detail:" 
		just = [ left center ] 
		pos = PAIR(88.00000000000, 70.00000000000) 
		rgba = [ 128 90 120 100 ] 
		scale = 0.85000002384 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = leveleditor_menu_container 
		id = leveleditor_desc 
		pos = PAIR(180.00000000000, 70.00000000000) 
		text = " " 
		font = dialog 
		rgba = [ 90 90 90 120 ] 
		just = [ left center ] 
		scale = 0.80000001192 
		not_focusable 
	} 
	create_helper_text { parent = leveleditor_menu_container 
		spacing_between = -6 
		helper_text_elements = 
		[ 
			{ text = "\\br+\\b8=Quit" } 
			{ text = "\\bp=Back" } 
			{ text = "\\bm=Place" } 
			{ text = "\\bs/\\bt=Lower/Raise" } 
			{ text = "\\bq/\\br=Zoom" } 
			{ text = "\\bq+\\br=Switch Mode" } 
			{ text = "\\bs+\\bt=Grid/Free-Roam" } 
		] 
	} 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ { pad_start leveleditor_show_menu } ] 
		replace_handlers 
	} 
ENDSCRIPT

SCRIPT leveleditor_show_menu 
	leveleditor : Suspend 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	pause_menu_gradient off 
	make_new_menu { 
		menu_id = leveleditor_menu 
		vmenu_id = leveleditor_vmenu 
		menu_title = "DEBUG" 
		type = VScrollingMenu 
		dims = PAIR(200.00000000000, 350.00000000000) 
		padding_scale = 0.94999998808 
		pos = PAIR(243.00000000000, 50.00000000000) 
	} 
	SetScreenElementProps { id = leveleditor_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = leveleditor_menu_resume } } 
		] 
	} 
	set_theme_icons 
	make_text_sub_menu_item text = "Continue" id = menu_done pad_choose_script = leveleditor_menu_resume 
	make_text_sub_menu_item text = "Place Objects" id = menu_autoraillevel pad_choose_script = leveleditor_menu_setmode pad_choose_params = { mode = LE_MODE_MODEL } 
	make_text_sub_menu_item text = "Edit Level Geometry" id = menu_timeofday pad_choose_script = leveleditor_menu_setmode pad_choose_params = { mode = LE_MODE_GEOM } 
	make_text_sub_menu_item text = "Place Pedestrians" id = menu_lighting pad_choose_script = leveleditor_menu_setmode pad_choose_params = { mode = LE_MODE_RAIL } 
	make_text_sub_menu_item text = "Place Cameras" id = menu_set_pro_skater pad_choose_script = leveleditor_menu_setmode pad_choose_params = { mode = LE_MODE_LIGHT } 
	make_text_sub_menu_item text = "Toggle Level Lights" id = _ksk_menu_toggle_lights pad_choose_script = ksk_menu_toggle_lights 
	make_text_sub_menu_item text = "Toggle Night Objects" id = _ksk_menu_toggle_nighton pad_choose_script = ksk_menu_toggle_nighton 
	make_text_sub_menu_item text = "Exit Level Editor" pad_choose_script = SwitchOffLevelEditor 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT leveleditor_menu_setmode mode = LE_MODE_MODEL 
	SWITCH <mode> 
		CASE LE_MODE_MODEL 
			LevelEditor_Model_Close 
		CASE LE_MODE_GEOM 
			LevelEditor_Geom_Close 
		CASE LE_MODE_RAIL 
			LevelEditor_Rail_Close 
		CASE LE_MODE_LIGHT 
			LevelEditor_Light_Close 
		CASE LE_MODE_PED 
			LevelEditor_Ped_CLose 
	ENDSWITCH 
	Change le_current_mode = <mode> 
	leveleditor_menu_resume 
	LevelEditor_InitMode 
ENDSCRIPT

SCRIPT leveleditor_menu_resume 
	pulse_blur 
	exit_pause_menu 
	ResumeLevelEditor 
	ControllerDebounce X time = 0.40000000596 clear = 1 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ { pad_start leveleditor_show_menu } ] 
		replace_handlers 
	} 
ENDSCRIPT

SCRIPT leveleditor_menu_launch 
	exit_pause_menu 
	WaitOneGameFrame 
	CreateLevelEditor 
	SwitchOnLevelEditor 
ENDSCRIPT

SCRIPT leveleditor_hud_destroy 
	exit_pause_menu 
	DestroyScreenElement id = leveleditor_cursor_pos 
	DestroyScreenElement id = leveleditor_cursor_pos_label 
	DestroyScreenElement id = leveleditor_piece 
	DestroyScreenElement id = leveleditor_piece_label 
	DestroyScreenElement id = leveleditor_desc 
	DestroyScreenElement id = leveleditor_desc_label 
	DestroyScreenElement id = leveleditor_menu_title 
	DestroyScreenElement id = leveleditor_menu_container 
	restore_start_key_binding 
ENDSCRIPT


