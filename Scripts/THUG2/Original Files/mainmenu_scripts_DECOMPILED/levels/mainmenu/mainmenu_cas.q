
SCRIPT make_cas_bg_elements 
	make_mainmenu_3d_plane scale = VECTOR(2.09999990463, 2.79999995232, 2.09999990463) <...> 
ENDSCRIPT

entered_cas_from_main = 0 
SCRIPT debug_the_cas 
	killskatercamanim all 
	restore_start_key_binding 
	create_pause_menu 
ENDSCRIPT

SCRIPT init_cas_skater_and_cam 
	IF NOT LocalSkaterExists 
		BEGIN 
			IF LocalSkaterExists 
				BREAK 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
	ENDIF 
	IF isTrue main_menu_jump_to_cas 
		wait 30 gameframes 
	ENDIF 
	unpauseskaters 
	MakeSkaterGoto CasAI 
	change cas_cam_angle = 154 
	cas_setup_rotating_camera 
ENDSCRIPT

SCRIPT CasAI 
	IF NOT GotParam no_init 
		SkaterInit NoEndRun ReturnControl NoAnims no_board = no_board 
		TurnOffSpecialItem 
		ClearExceptions 
		Obj_MoveToNode name = trg_playerrestart Orient NoReset 
		IF NOT Obj_HasModelLights 
			script_assert "No skater lighting!" 
		ENDIF 
		Obj_SetLightAmbientColor { 
			r = ( skater_ambient_color [ 0 ] ) 
			g = ( skater_ambient_color [ 1 ] ) 
			b = ( skater_ambient_color [ 2 ] ) 
		} 
		Obj_SetLightDiffuseColor { 
			index = 0 
			r = ( skater_diffuse_color1 [ 0 ] ) 
			g = ( skater_diffuse_color1 [ 1 ] ) 
			b = ( skater_diffuse_color1 [ 2 ] ) 
		} 
		Obj_SetLightDiffuseColor { 
			index = 1 
			r = ( skater_diffuse_color2 [ 0 ] ) 
			g = ( skater_diffuse_color2 [ 1 ] ) 
			b = ( skater_diffuse_color2 [ 2 ] ) 
		} 
		Obj_SetLightDirection index = 0 heading = 60 pitch = 350 
		Obj_SetLightDirection index = 1 heading = -190 pitch = 270 
		CancelRotateDisplay 
		DisablePlayerInput 
		SetRollingFriction 10000 
		SetSpeed 0 
		Rotate y = 190 
	ENDIF 
	IF GotParam deck_bottom 
		IF flipped 
			flip 
		ENDIF 
		PlayAnim Blendperiod = 0.20000000298 Anim = FrontEnd_CAS_HoldBoard_Bot 
		Obj_WaitAnimFinished 
		RETURN 
	ENDIF 
	IF GotParam deck_top 
		IF flipped 
			flip 
		ENDIF 
		PlayAnim Blendperiod = 0.20000000298 Anim = FrontEnd_CAS_HoldBoard_Top 
		Obj_WaitAnimFinished 
		RETURN 
	ENDIF 
	BEGIN 
		PlayAnim Blendperiod = 0.20000000298 Anim = Ped_M_Idle1 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

goto_face_menu = 0 
SCRIPT launch_face_menu 
	IF NOT GotParam no_library 
		<load_library> = load_library 
	ENDIF 
	create_face_map_menu downloaded_face = <downloaded_face> goto_face_map = <goto_face_map> load_library = <load_library> 
ENDSCRIPT

SCRIPT launch_cas 
	SetGameType freeskate 
	SetCurrentGameType 
	select_skater_get_current_skater_name 
	IF NOT ( <current_skater> = custom ) 
		load_pro_skater { profile = 0 skater = 0 name = custom } 
	ENDIF 
	IF GotParam face2 
		change goto_face_menu = 2 
	ENDIF 
	IF LevelIs Load_MainMenu 
		change entered_cas_from_main = 1 
	ENDIF 
	cas_mainmenu_startup downloaded_face = <downloaded_face> 
ENDSCRIPT

SCRIPT cas_mainmenu_startup 
	
	
	
	
	
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	Randomize 
	SetScoreDegradation 0 
	load_skater_stickers_to_main_memory 
	IF ( goto_face_menu = 0 ) 
		IF ( in_cinematic_sequence = 1 ) 
		ELSE 
			launch_pre_cas_menu 
		ENDIF 
	ELSE 
		IF ( goto_face_menu = 1 ) 
			launch_face_menu 
		ELSE 
			launch_face_menu goto_face_map = goto_face_map downloaded_face = <downloaded_face> no_library 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT launch_pre_cas_menu 
	create_pre_cas_menu load_assets = 1 
ENDSCRIPT

SCRIPT pre_cas_menu_exit 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
	IF GotParam pause_skater 
		MakeSkaterGoto CasAI params = { no_init pause_skater } 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT

SCRIPT create_pre_cas_menu load_assets = 0 
	main_menu_wait_until_all_clear 
	IF ScreenElementExists id = black_top_strip 
		DoScreenElementMorph { 
			id = black_top_strip 
			time = 0 
			alpha = 1 
		} 
	ENDIF 
	IF ( <load_assets> = 1 ) 
		init_cas_skater_and_cam 
		build_cas_category_menu 
	ELSE 
		MakeSkaterGoto CasAI params = { no_init } 
	ENDIF 
	dialog_box_exit 
	IF main_menu_jump_to_cas = 1 
		back_text = 0 
	ELSE 
		back_text = 1 
	ENDIF 
	change main_menu_jump_to_cas = 1 
	change current_cas_category = 0 
	hide_cas_category_menu 
	make_new_roundbar_menu { 
		pos = PAIR(28.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 480.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = exit_cas 
		helper_text = generic_helper_text_cas 
		no_bar_edges 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 30 , 30 , 30 , 60 ] } 
		title = "CREATE-A-SKATER" 
		no_animate 
		menu_id = pre_cas_menu 
		vmenu_id = pre_cas_vmenu 
		add_tab = add_tab 
		add_bar = add_bar 
	} 
	kill_start_key_binding 
	SetScreenElementProps { 
		id = pre_cas_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
			{ pad_back exit_cas } 
		] 
		replace_handlers 
	} 
	IF ( in_cinematic_sequence = 1 ) 
		allow_load = 0 
	ELSE 
		IF GameModeEquals is_career 
			IF ( entered_cas_from_main = 1 ) 
				allow_load = 1 
			ELSE 
				allow_load = 0 
			ENDIF 
		ELSE 
			allow_load = 1 
		ENDIF 
	ENDIF 
	add_roundbar_menu_item { 
		text = "EDIT CURRENT" 
		id = cas_edit_current 
		pad_choose_script = pre_cas_menu_exit 
		pad_choose_params = { new_menu_script = create_edit_skater_menu came_from_main_menu } 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	IF ( <allow_load> = 1 ) 
		add_roundbar_menu_item { 
			text = "RESET APPEARANCE" 
			id = cas_create_new 
			pad_choose_script = pre_cas_menu_exit 
			pad_choose_params = { new_menu_script = confirm_reset_appearance } 
			scale_highlight_text = 0 
			scale = 0.85000002384 
		} 
		add_roundbar_menu_item { 
			text = "PRE-MADE SKATERS" 
			id = cas_premade_skaters 
			pad_choose_script = edit_skater_premade_skater_menu 
			scale_highlight_text = 0 
			scale = 0.85000002384 
		} 
	ENDIF 
	IF ( <allow_load> = 1 ) 
		add_roundbar_menu_item { 
			text = "LOAD SKATER" 
			id = cas_load_skater 
			pad_choose_script = pre_cas_menu_exit 
			pad_choose_params = { new_menu_script = cas_overwrite_warning title = #"Load Skater" callback = launch_load_cas_sequence } 
			scale_highlight_text = 0 
			scale = 0.85000002384 
		} 
	ENDIF 
	add_roundbar_menu_item { 
		text = "SAVE SKATER" 
		id = cas_save_skater 
		pad_choose_script = pre_cas_menu_exit 
		pad_choose_params = { new_menu_script = launch_save_cas_sequence } 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	IF IsXbox 
		IF isTrue DEMO_BUILD 
			demo_lockout = not_focusable 
		ENDIF 
		add_roundbar_menu_item { 
			text = "FACE MAPPING" 
			id = cas_face_mapping 
			pad_choose_script = pre_cas_menu_exit 
			pad_choose_params = { new_menu_script = create_face_map_menu pause_skater load_library } 
			scale_highlight_text = 0 
			scale = 0.85000002384 
			<demo_lockout> 
		} 
	ENDIF 
	add_roundbar_menu_item { 
		text = "DONE" 
		id = cas_done 
		pad_choose_script = exit_cas 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	roundbar_menu_finish build_pause_parts = 0 
ENDSCRIPT

SCRIPT confirm_reset_appearance 
	DoScreenElementMorph { 
		id = black_top_strip 
		time = 0 
		alpha = 0 
	} 
	create_snazzy_dialog_box { 
		title = "WARNING!" 
		text = "You will lose all unsaved changes to your skater.\\n Are you sure?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		pad_back_script = no_reest_appearance 
		no_bg 
		buttons = [ 
			{ text = "Yes" pad_choose_script = yes_reset_appearance } 
			{ text = "No" pad_choose_script = no_reest_appearance } 
		] 
	} 
ENDSCRIPT

SCRIPT yes_reset_appearance 
	dialog_box_exit 
	DoScreenElementMorph { 
		id = black_top_strip 
		time = 0 
		alpha = 1 
	} 
	cas_reset_skater_and_goto_menu 
ENDSCRIPT

SCRIPT no_reest_appearance 
	dialog_box_exit 
	DoScreenElementMorph { 
		id = black_top_strip 
		time = 0 
		alpha = 1 
	} 
	create_pre_cas_menu 
ENDSCRIPT

SCRIPT exit_cas level = Load_MainMenu return_script = create_createamodes_menu 
	KillSpawnedScript name = cas_rotate_skater 
	kill_cas_pull_back_camera 
	killskatercamanim all 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = cas_category_anchor 
		DestroyScreenElement id = cas_category_anchor 
	ENDIF 
	load_skater_stickers_to_main_memory unload 
	change main_menu_jump_to_cas = 0 
	change entered_cas_from_main = 0 
	IF NOT ( return_to_level [ 0 ] = null ) 
		level = ( return_to_level [ 0 ] ) 
		array = return_to_level 
		SetArrayElement arrayname = array index = 0 newvalue = null 
	ENDIF 
	IF NOT ( <level> = Load_MainMenu ) 
		change_level level = <level> <...> 
	ELSE 
		<return_script> 
	ENDIF 
ENDSCRIPT

SCRIPT cas_overwrite_warning title = #"Overwrite" callback = cas_reset_skater_and_goto_menu 
	DoScreenElementMorph { 
		id = black_top_strip 
		time = 0 
		alpha = 0 
	} 
	create_snazzy_dialog_box { 
		title = <title> 
		text = #"Warning !\\nAny unsaved changes to your current Game Progress will be lost.\\nContinue ?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		pad_back_script = create_pre_cas_menu 
		buttons = [ 
			{ font = small text = #"No" pad_choose_script = create_pre_cas_menu } 
			{ 
				font = small text = #"Yes" 
				pad_choose_script = pre_cas_menu_exit 
				pad_choose_params = 
				{ 
					new_menu_script = <callback> 
				} 
			} 
		] 
		from_cas 
	} 
ENDSCRIPT

SCRIPT cas_reset_skater_and_goto_menu 
	GetCurrentSkaterProfileIndex 
	GetSkaterSex player = <CurrentSkaterProfileIndex> 
	IF ( <is_male> ) 
		<new_appearance> = ( ( custom_male_appearances [ 2 ] ) . struct ) 
	ELSE 
		<new_appearance> = ( ( custom_male_appearances [ 6 ] ) . struct ) 
		<female> = 1 
	ENDIF 
	ResetToDefaultProfile name = custom partial = appearance 
	set_default_temporary_profiles 
	load_pro_skater name = custom 
	edit_skater_premade_skater_choose { 
		appearance = <new_appearance> 
		female = <female> 
	} 
	create_edit_skater_menu came_from_main_menu 
ENDSCRIPT

SCRIPT build_cas_category_menu scale = 0.50000000000 
	IF ScreenElementExists id = cas_category_anchor 
		RETURN 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = cas_category_anchor 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 87.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_anchor 
		id = black_top_strip 
		texture = white2 
		rgba = [ 0 , 0 , 0 , 128 ] 
		scale = PAIR(45.50000000000, 4.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		z_priority = -1 
	} 
	IF IsXbox 
		circle_button = pad_expand 
	ELSE 
		circle_button = pad_circle 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = cas_category_anchor 
		id = cas_category_menu 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
		event_handlers = [ 
			{ pad_square toggle_cas_category_menu params = { left } } 
			{ <circle_button> toggle_cas_category_menu params = { right } } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = cas_category_menu 
		text = "\\bo" 
		font = dialog 
		just = [ left top ] 
		pos = PAIR(20.00000000000, 6.00000000000) 
		z_priority = 0 
		alpha = 0.64999997616 
	} 
	CreateScreenElement { 
		type = hmenu 
		parent = cas_category_menu 
		id = cas_category_hmenu 
		pos = PAIR(43.00000000000, -5.00000000000) 
		just = [ left top ] 
		padding_scale = 0.75000000000 
		not_focusable 
	} 
	Theme_GetPauseBarColor return_value = icon_rgb 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_info 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_head 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_torso 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_legs 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_resize 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_board 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cas_category_hmenu 
		texture = ED_sticker 
		scale = <scale> 
		just = [ left center ] 
		rgba = <icon_rgb> 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = cas_category_menu 
		text = "\\bp" 
		font = dialog 
		just = [ left top ] 
		pos = PAIR(334.00000000000, 6.00000000000) 
		z_priority = 0 
		alpha = 0.64999997616 
	} 
	FireEvent type = focus target = cas_category_menu 
ENDSCRIPT

SCRIPT hide_cas_category_menu 
	SetScreenElementProps id = cas_category_menu pos = PAIR(800.00000000000, 800.00000000000) time = 0 
	FireEvent type = unfocus target = cas_category_menu 
ENDSCRIPT

SCRIPT update_cas_category_menu 
	SetScreenElementProps id = cas_category_menu pos = PAIR(0.00000000000, 0.00000000000) time = 0 
	FireEvent type = focus target = cas_category_menu 
	<index> = 0 
	BEGIN 
		DoScreenElementMorph id = { cas_category_hmenu child = <index> } alpha = 0.20000000298 time = 0 
		<index> = ( <index> + 1 ) 
	REPEAT 7 
	IF NOT GotParam no_highlight 
		DoScreenElementMorph id = { cas_category_hmenu child = ( current_cas_category ) } alpha = 1 time = 0 
	ENDIF 
ENDSCRIPT

current_cas_category = 0 
SCRIPT toggle_cas_category_menu 
	IF ( current_cas_category = 6 ) 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
	ENDIF 
	IF GotParam left 
		<increment> = -1 
	ELSE 
		<increment> = 1 
	ENDIF 
	change current_cas_category = ( current_cas_category + <increment> ) 
	IF ( current_cas_category < 0 ) 
		change current_cas_category = 6 
	ENDIF 
	IF ( current_cas_category > 6 ) 
		change current_cas_category = 0 
	ENDIF 
	IF ScreenElementExists id = mod_menu 
		DestroyScreenElement id = mod_menu 
	ENDIF 
	IF ScreenElementExists id = cas_menu 
		DestroyScreenElement id = cas_menu 
	ENDIF 
	IF ScreenElementExists id = sub_options_menu 
		DestroyScreenElement id = sub_options_menu 
	ENDIF 
	IF ScreenElementExists id = options_menu 
		DestroyScreenElement id = options_menu 
	ENDIF 
	IF ScreenElementExists id = scaling_menu 
		DestroyScreenElement id = scaling_menu 
	ENDIF 
	IF ScreenElementExists id = edit_skater_menu 
		edit_skater_menu_exit just_exit 
		DestroyScreenElement id = edit_skater_menu 
	ENDIF 
	IF ScreenElementExists id = edit_skater_info_menu 
		DestroyScreenElement id = edit_skater_info_menu 
	ENDIF 
	SWITCH current_cas_category 
		CASE 0 
			edit_skater_info_menu 
		CASE 1 
			edit_skater_create_options_menu category = 1 options_array = edit_skater_head_options cam_anim = head 
		CASE 2 
			edit_skater_create_options_menu category = 2 options_array = edit_skater_torso_options cam_anim = adjtorso 
		CASE 3 
			edit_skater_create_options_menu category = 3 options_array = edit_skater_leg_options cam_anim = legs 
		CASE 4 
			create_edit_skater_menu 
			create_scale_options_menu category = 4 options_array = edit_skater_scaling_options cam_anim = fullbody 
			MakeSkaterGoto CasAI params = { no_init } 
		CASE 5 
			edit_skater_create_options_menu category = 5 options_array = edit_skater_deck_options cam_anim = Deck show_deck 
		CASE 6 
			edit_skater_create_sticker_menu 
			MakeSkaterGoto CasAI params = { no_init } 
			skater : SwitchOffBoard 
	ENDSWITCH 
ENDSCRIPT

SCRIPT edit_skater_premade_skater_menu 
	make_new_roundbar_menu { 
		pos = PAIR(28.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 280.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = create_pre_cas_menu 
		helper_text = generic_helper_text 
		no_bar_edges 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 30 , 30 , 30 , 60 ] } 
		title = "SELECT PRE-MADE SKATER" 
		menu_id = premade_menu 
		vmenu_id = premade_vmenu 
		arrow_up = premade_arrow_up 
		arrow_down = premade_arrow_down 
		scrolling 
		no_animate 
		add_tab = add_tab 
		add_bar = add_bar 
	} 
	SetScreenElementProps { 
		id = premade_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
		] 
		replace_handlers 
	} 
	DoScreenElementMorph id = current_scrolling_menu alpha = 0 
	GetArraySize custom_male_appearances 
	index = 0 
	BEGIN 
		GetUpperCaseString ( ( custom_male_appearances [ <index> ] ) . name ) 
		add_roundbar_menu_item { 
			text = <UpperCaseString> 
			pad_choose_script = edit_skater_premade_skater_choose 
			pad_choose_params = { 
				appearance = ( ( custom_male_appearances [ <index> ] ) . struct ) 
				female = ( ( custom_male_appearances [ <index> ] ) . female ) 
				voice = ( ( custom_male_appearances [ <index> ] ) . voice ) 
			} 
			scale_highlight_text = 0 
			scale = 0.85000002384 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	add_roundbar_menu_item { 
		text = "DONE" 
		id = cas_done 
		pad_choose_script = create_pre_cas_menu 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	wait 2 gameframes 
	SetScreenElementProps id = current_scrolling_menu reset_window_top 
	DoScreenElementMorph id = current_scrolling_menu alpha = 1 
	roundbar_menu_finish build_pause_parts = 0 
ENDSCRIPT

SCRIPT edit_skater_premade_skater_choose 
	GetCurrentSkaterProfileIndex 
	IF NOT GotParam female 
		<is_male> = 1 
		SetSkaterProfileProperty player = <CurrentSkaterProfileIndex> is_male 1 
	ELSE 
		<is_male> = 0 
		SetSkaterProfileProperty player = <CurrentSkaterProfileIndex> is_male 0 
	ENDIF 
	SetPlayerAppearance appearance_structure = <appearance> player = <CurrentSkaterProfileIndex> 
	<index> = 0 
	GetArraySize player_voices 
	<voice_set> = 0 
	IF GotParam voice 
		BEGIN 
			IF ChecksumEquals a = <voice> b = ( player_voices [ <index> ] . id ) 
				SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { voice = ( player_voices [ <index> ] . id ) } 
				change edit_skater_voice_index = <index> 
				<voice_set> = 1 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	IF ( <voice_set> = 0 ) 
		<index> = 0 
		BEGIN 
			IF ( <is_male> = ( player_voices [ <index> ] . is_male ) ) 
				SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { voice = ( player_voices [ <index> ] . id ) } 
				change edit_skater_voice_index = <index> 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RefreshSkaterModel skater = 0 profile = <CurrentSkaterProfileIndex> no_board = no_board 
ENDSCRIPT

SCRIPT create_edit_skater_menu 
	skater : SwitchOffBoard 
	MakeSkaterGoto CasAI params = { no_init } 
	update_cas_category_menu no_highlight 
	make_new_roundbar_menu { 
		pos = PAIR(28.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 260.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = edit_skater_menu_exit 
		helper_text = generic_helper_text_cas 
		no_bar_edges 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 30 , 30 , 30 , 60 ] } 
		title = "EDIT-SKATER" 
		menu_id = edit_skater_menu 
		vmenu_id = edit_skater_vmenu 
		additional_create_script = set_cas_menu_item_index 
		no_animate 
		add_tab = add_tab 
		add_bar = add_bar 
	} 
	kill_cas_pull_back_camera 
	change in_boardshop = 0 
	SetScreenElementProps { 
		id = edit_skater_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
		] 
		replace_handlers 
	} 
	add_roundbar_menu_item { 
		text = "INFORMATION" 
		id = cas_information 
		pad_choose_script = edit_skater_info_menu 
		index = 0 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	add_roundbar_menu_item { 
		text = "HEAD OPTIONS" 
		id = cas_head_options 
		pad_choose_script = edit_skater_create_options_menu 
		pad_choose_params = { category = 1 options_array = edit_skater_head_options cam_anim = head } 
		index = 1 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	add_roundbar_menu_item { 
		text = "TORSO OPTIONS" 
		id = cas_torso_options 
		pad_choose_script = edit_skater_create_options_menu 
		pad_choose_params = { category = 2 options_array = edit_skater_torso_options cam_anim = adjtorso } 
		index = 2 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	add_roundbar_menu_item { 
		text = "LEG OPTIONS" 
		id = cas_leg_options 
		pad_choose_script = edit_skater_create_options_menu 
		pad_choose_params = { category = 3 options_array = edit_skater_leg_options cam_anim = legs } 
		index = 3 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	RemoveParameter not_focusable 
	check_if_group_editable group = scaling_options not_with_scaling_cheats 
	IF ( <is_enabled> = 0 ) 
		<not_focusable> = not_focusable 
	ENDIF 
	add_roundbar_menu_item { 
		text = "SCALE OPTIONS" 
		id = cas_scale_options 
		pad_choose_script = create_scale_options_menu 
		pad_choose_params = { category = 4 options_array = edit_skater_scaling_options cam_anim = fullbody } 
		<not_focusable> 
		index = 4 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	add_roundbar_menu_item { 
		text = "DECK OPTIONS" 
		id = cas_deck_options 
		pad_choose_script = edit_skater_create_options_menu 
		pad_choose_params = { category = 5 options_array = edit_skater_deck_options cam_anim = Deck show_deck } 
		index = 5 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	add_roundbar_menu_item { 
		text = "STICKER OPTIONS" 
		id = cas_sticker_options 
		pad_choose_script = edit_skater_create_sticker_menu 
		index = 6 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	add_roundbar_menu_item { 
		text = "DONE" 
		id = cas_done 
		pad_choose_script = edit_skater_menu_exit 
		index = 10 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	roundbar_menu_finish build_pause_parts = 0 data = { grid_index = current_cas_category } 
	killskatercamanim all 
	cas_setup_rotating_camera 
ENDSCRIPT

SCRIPT edit_skater_menu_exit 
	IF NOT GotParam just_exit 
		IF GotParam to_secrets 
			create_secrets_menu 
		ELSE 
			create_pre_cas_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

skater_sticker_item_menu_selection = 0 
SCRIPT edit_skater_create_sticker_menu 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = unfocus target = cas_category_menu 
	ENDIF 
	kill_cas_pull_back_camera 
	IF IsNgc 
		<heap> = TopDown 
	ELSE 
		<heap> = FrontEnd 
	ENDIF 
	change current_cas_category = 6 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = current_menu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		heap = <heap> 
	} 
	build_theme_sub_title title = "SELECT STICKER" add_tab add_bar 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		pos = PAIR(28.00000000000, 119.00000000000) 
		texture = white2 
		rgba = [ 30 , 30 , 30 , 60 ] 
		scale = PAIR(41.00000000000, 35.00000000000) 
		just = [ left top ] 
		z_priority = -1 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		pos = PAIR(20.00000000000, 119.00000000000) 
		texture = white2 
		rgba = [ 0 , 0 , 0 , 128 ] 
		scale = PAIR(1.00000000000, 35.00000000000) 
		just = [ left top ] 
		z_priority = -1 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		pos = PAIR(356.00000000000, 119.00000000000) 
		texture = white2 
		rgba = [ 0 , 0 , 0 , 128 ] 
		scale = PAIR(1.00000000000, 35.00000000000) 
		just = [ left top ] 
		z_priority = -1 
		heap = <heap> 
	} 
	create_helper_text { 
		helper_text_elements = [ 
			{ text = "\\b7/\\b4/\\b6/\\b5 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = current_menu_anchor 
		id = edit_skater_sticker_vscrollingmenu 
		just = [ left top ] 
		pos = PAIR(80.00000000000, 138.00000000000) 
		dims = PAIR(224.00000000000, 212.00000000000) 
		alpha = 0 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = edit_skater_sticker_vscrollingmenu 
		id = edit_skater_sticker_vmenu 
		spacing_between = 4 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		dims = PAIR(224.00000000000, 212.00000000000) 
		tags = { category_index = <index> } 
		heap = <heap> 
	} 
	SetScreenElementProps { 
		id = edit_skater_sticker_vmenu 
		event_handlers = [ { pad_back generic_menu_pad_back_sound } 
			{ pad_back edit_skater_exit_sticker_menu } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
		replace_handlers 
	} 
	sticker_images = edit_graphics_corp_logo 
	sticker_images = ( <sticker_images> + edit_graphics_graphics ) 
	sticker_images = ( <sticker_images> + edit_graphics_illustrations ) 
	GetArraySize <sticker_images> 
	<index> = 0 
	<hcounter> = 0 
	<row_counter> = 0 
	BEGIN 
		IF ( <hcounter> = 0 ) 
			FormatText checksumname = menu_id "edit_skater_sticker_row_%i" i = <row_counter> 
			CreateScreenElement { 
				type = hmenu 
				parent = edit_skater_sticker_vmenu 
				id = <menu_id> 
				spacing_between = 4 
				dims = PAIR(224.00000000000, 68.00000000000) 
				pos = PAIR(0.00000000000, 0.00000000000) 
				just = [ left top ] 
				heap = <heap> 
			} 
			SetScreenElementProps { 
				id = <menu_id> 
				event_handlers = [ { focus edit_skater_sticker_menu_focus params = { menu_id = <menu_id> } } 
					{ pad_left check_ok_pad_left } 
					{ pad_right check_ok_pad_right } 
				] 
				replace_handlers 
			} 
			AssignAlias id = <menu_id> alias = current_sticker_hmenu 
			<row_counter> = ( <row_counter> + 1 ) 
		ENDIF 
		GetTextureFromPath path = ( <sticker_images> [ <index> ] ) 
		FormatText checksumname = texture_id "%t" t = <texture> 
		edit_skater_add_sticker_menu_item texture = <texture_id> index = <index> hindex = <hcounter> texture_string = ( <sticker_images> [ <index> ] ) 
		<hcounter> = ( <hcounter> + 1 ) 
		IF ( <hcounter> = 4 ) 
			<hcounter> = 0 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( ( <hcounter> < 4 ) & ( <hcounter> > 0 ) ) 
		BEGIN 
			CreateScreenElement { 
				parent = current_sticker_hmenu 
				type = ContainerElement 
				dims = PAIR(68.00000000000, 68.00000000000) 
				not_focusable 
				just = [ left top ] 
				heap = <heap> 
			} 
			<hcounter> = ( <hcounter> + 1 ) 
			IF ( <hcounter> = 4 ) 
				BREAK 
			ENDIF 
		REPEAT 
	ENDIF 
	create_scroll_bar parent = current_menu_anchor VMenu = edit_skater_sticker_vmenu items = <array_size> cols = 4 pos = PAIR(360.00000000000, 120.00000000000) size_height = 278 
	change skater_sticker_item_menu_selection = 0 
	cas_setup_rotating_camera 
	wait 2 gameframes 
	IF ScreenElementExists id = edit_skater_sticker_vscrollingmenu 
		SetScreenElementProps id = edit_skater_sticker_vscrollingmenu reset_window_top 
		DoScreenElementMorph id = edit_skater_sticker_vscrollingmenu alpha = 1 
	ENDIF 
	IF ScreenElementExists id = edit_skater_sticker_vmenu 
		FireEvent type = focus target = edit_skater_sticker_vmenu 
	ENDIF 
	IF ScreenElementExists id = cas_category_menu 
		wait 2 gameframes 
		FireEvent type = focus target = cas_category_menu 
		update_cas_category_menu 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_exit_sticker_menu 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_edit_skater_menu 
ENDSCRIPT

SCRIPT edit_skater_add_sticker_menu_item 
	FormatText checksumname = id "sticker-%a" a = <index> 
	CreateScreenElement { 
		parent = current_sticker_hmenu 
		type = ContainerElement 
		id = <id> 
		dims = PAIR(68.00000000000, 68.00000000000) 
		event_handlers = [ { focus edit_skater_sticker_menu_item_focus params = { id = <id> index = <hindex> } } 
			{ unfocus edit_skater_sticker_menu_item_unfocus params = { id = <id> } } 
			{ pad_choose generic_menu_pad_choose_sound } 
			{ pad_choose edit_skater_select_sticker params = { graphic_index = <index> texture = <texture> texture_string = <texture_string> } } 
			{ pad_start null_script } 
		] 
		just = [ left top ] 
	} 
	<item_id> = <id> 
	IF IsNgc 
		<heap> = TopDown 
	ELSE 
		<heap> = FrontEnd 
	ENDIF 
	CreateScreenElement { 
		parent = <item_id> 
		type = SpriteElement 
		texture = white2 
		rgba = [ 64 , 64 , 64 , 128 ] 
		scale = PAIR(8.50000000000, 8.50000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		heap = <heap> 
	} 
	CreateScreenElement { 
		parent = <item_id> 
		type = SpriteElement 
		texture = white2 
		rgba = [ 32 , 32 , 32 , 128 ] 
		scale = PAIR(7.50000000000, 7.50000000000) 
		pos = PAIR(4.00000000000, 4.00000000000) 
		just = [ left top ] 
		z_priority = 8 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <item_id> 
		texture = <texture> 
		z_priority = 9 
		scale = PAIR(0.89999997616, 0.89999997616) 
		pos = PAIR(5.00000000000, 6.00000000000) 
		just = [ left top ] 
		z_priority = 9 
		heap = <heap> 
	} 
ENDSCRIPT

SCRIPT check_ok_pad_left 
	generic_menu_up_or_down_sound params = { up } 
ENDSCRIPT

SCRIPT check_ok_pad_right 
	generic_menu_up_or_down_sound params = { down } 
ENDSCRIPT

ok_pad_left_right = 1 
SCRIPT edit_skater_sticker_menu_focus 
	<menu_id> : GetTags 
	IF GotParam tag_selected_index 
		IF NOT ( <tag_selected_index> = skater_sticker_item_menu_selection ) 
			IF ( <tag_selected_index> > skater_sticker_item_menu_selection ) 
				<num_pads> = ( <tag_selected_index> - skater_sticker_item_menu_selection ) 
				<pad_event> = pad_left 
			ELSE 
				<num_pads> = ( skater_sticker_item_menu_selection - <tag_selected_index> ) 
				<pad_event> = pad_right 
			ENDIF 
			wait 1 gameframe 
			change ok_pad_left_right = 0 
			BEGIN 
				FireEvent type = <pad_event> target = <menu_id> 
			REPEAT <num_pads> 
			change ok_pad_left_right = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_sticker_menu_item_focus 
	Theme_GetPauseBarColor return_value = rgba 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = <rgba> 
	} 
	change skater_sticker_item_menu_selection = <index> 
ENDSCRIPT

SCRIPT edit_skater_sticker_menu_item_unfocus 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 64 , 64 , 64 , 128 ] 
	} 
ENDSCRIPT

SCRIPT edit_skater_select_sticker 
	GetCurrentSkaterProfileIndex 
	SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { sticker_texture = <texture_string> } 
	GetCurrentSkaterProfileIndex 
	GetSkaterID skater = <CurrentSkaterProfileIndex> 
	<objID> : SetStickerTexture <texture_string> 
	edit_skater_exit_sticker_menu 
ENDSCRIPT

SCRIPT edit_skater_info_menu 
	dialog_box_exit 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = unfocus target = cas_category_menu 
	ENDIF 
	change current_cas_category = 0 
	kill_cas_pull_back_camera 
	FireEvent type = focus target = cas_category_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = edit_skater_info_menu 
		just = [ top left ] 
	} 
	AssignAlias id = edit_skater_info_menu alias = current_menu_anchor 
	build_theme_sub_title title = "INFORMATION" add_tab add_bar 
	CreateScreenElement { 
		type = VMenu 
		parent = current_menu_anchor 
		id = edit_skater_info_vmenu 
		pos = PAIR(70.00000000000, 127.00000000000) 
		just = [ left top ] 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back_sound } 
			{ pad_back create_edit_skater_menu } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
	} 
	AssignAlias id = edit_skater_info_vmenu alias = current_menu 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bm=Accept" } 
		] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		pos = PAIR(28.00000000000, 119.00000000000) 
		texture = white2 
		rgba = [ 30 , 30 , 30 , 60 ] 
		scale = PAIR(41.00000000000, 35.00000000000) 
		just = [ left top ] 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		pos = PAIR(20.00000000000, 119.00000000000) 
		texture = white2 
		rgba = [ 0 , 0 , 0 , 128 ] 
		scale = PAIR(1.00000000000, 35.00000000000) 
		just = [ left top ] 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		pos = PAIR(356.00000000000, 119.00000000000) 
		texture = white2 
		rgba = [ 0 , 0 , 0 , 128 ] 
		scale = PAIR(1.00000000000, 35.00000000000) 
		just = [ left top ] 
		z_priority = -1 
	} 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <CurrentSkaterProfileIndex> 
	info_name = <display_name> 
	info_town = <hometown> 
	IF ( <age> = -1 ) 
		<info_age> = "Unknown" 
	ELSE 
		FormatText textname = info_age "%a" a = <age> 
	ENDIF 
	SWITCH <is_male> 
		CASE 1 
			info_sex = "Male" 
			IF NOT GotParam voice 
				<voice> = male1 
			ENDIF 
		CASE 0 
			info_sex = "Female" 
			IF NOT GotParam voice 
				<voice> = female1 
			ENDIF 
	ENDSWITCH 
	edit_skater_set_voice_index voice = <voice> 
	SWITCH <stance> 
		CASE regular 
			info_stance = "Regular" 
		CASE goofy 
			info_stance = "Goofy" 
	ENDSWITCH 
	SWITCH <pushstyle> 
		CASE never_mongo 
			info_push = "Never Mongo" 
		CASE mongo_when_switch 
			info_push = "Mongo Switch" 
		CASE always_mongo 
			info_push = "Always Mongo" 
	ENDSWITCH 
	SWITCH <trickstyle> 
		CASE vert 
			info_style = "Vert" 
		CASE street 
			info_style = "Street" 
	ENDSWITCH 
	IF ( <is_pro> = 1 ) 
		IF ( <is_locked> = 1 ) 
			<not_focusable> = not_focusable 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 118.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"NAME:" 
		pad_choose_script = launch_onscreen_keyboard_from_edit_skater 
		pad_choose_params = { field = "" text = <display_name> title = #"NAME" min_length = 1 max_length = 15 text_to_change = name } 
		focus_params = { top_row } 
		unfocus_params = { top_row } 
		tab = tab2 
		top_row 
		item_value_text = <info_name> 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 148.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	IF ( <is_locked> = 1 ) 
		IF NOT GotParam no_bg 
			<not_focusable> = not_focusable 
		ENDIF 
	ENDIF 
	edit_skater_info_add_item { 
		text = #"HOMETOWN:" 
		pad_choose_script = launch_onscreen_keyboard_from_edit_skater 
		pad_choose_params = { field = "" text = <hometown> title = #"HOMETOWN" min_length = 1 max_length = 15 text_to_change = town } 
		focus_params = { top_row } 
		unfocus_params = { top_row } 
		tab = tab2 
		top_row 
		item_value_text = <info_town> 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 178.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"AGE:" 
		pad_choose_script = nullscript 
		pad_right_script = edit_skater_info_change 
		pad_left_script = edit_skater_info_change 
		pad_right_params = { change_age } 
		pad_left_params = { change_age left } 
		tab = tab2 
		item_value_text = <info_age> 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 208.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"SEX:" 
		item_id = skater_sex_value 
		pad_choose_script = nullscript 
		pad_right_script = edit_skater_info_change 
		pad_left_script = edit_skater_info_change 
		pad_right_params = { change_is_male } 
		pad_left_params = { change_is_male } 
		tab = tab2 
		item_value_text = <info_sex> 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 238.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"VOICE:" 
		item_id = skater_voice_value 
		pad_choose_script = nullscript 
		focus_params = { play_voice } 
		pad_right_script = edit_skater_info_change 
		pad_left_script = edit_skater_info_change 
		pad_right_params = { change_voice } 
		pad_left_params = { change_voice left } 
		tab = tab2 
		item_value_text = ( player_voices [ edit_skater_voice_index ] . frontend_desc ) 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 268.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"STANCE:" 
		pad_choose_script = nullscript 
		pad_right_script = edit_skater_info_change 
		pad_left_script = edit_skater_info_change 
		pad_right_params = { change_stance } 
		pad_left_params = { change_stance } 
		tab = tab2 
		item_value_text = <info_stance> 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 298.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"PUSH:" 
		pad_choose_script = nullscript 
		pad_right_script = edit_skater_info_change 
		pad_left_script = edit_skater_info_change 
		pad_right_params = { change_push } 
		pad_left_params = { change_push left } 
		tab = tab2 
		item_value_text = <info_push> 
		wide_arrows 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 328.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"TRICKS:" 
		pad_choose_script = nullscript 
		pad_right_script = edit_skater_info_change 
		pad_left_script = edit_skater_info_change 
		pad_right_params = { change_trickstyle } 
		pad_left_params = { change_trickstyle } 
		tab = tab2 
		item_value_text = <info_style> 
		narrow_arrows 
		not_focusable = <not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 358.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	edit_skater_info_add_item { 
		text = #"DONE" 
		pad_choose_script = create_edit_skater_menu 
		focus_params = { top_row } 
		unfocus_params = { top_row } 
		tab = tab2 
		no_bg 
		text_pos = PAIR(110.00000000000, 8.00000000000) 
		top_row 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(27.00000000000, 388.00000000000) 
		scale = PAIR(41.00000000000, 0.25000000000) 
	} 
	skater : SwitchOffBoard 
	killskatercamanim all 
	cas_setup_rotating_camera 
	MakeSkaterGoto CasAI params = { no_init } 
	FireEvent type = focus target = current_menu 
	IF ScreenElementExists id = cas_category_menu 
		wait 2 gameframes 
		FireEvent type = focus target = cas_category_menu 
		update_cas_category_menu 
	ENDIF 
ENDSCRIPT

edit_skater_voice_index = 0 
SCRIPT edit_skater_set_voice_index 
	GetArraySize player_voices 
	<index> = 0 
	BEGIN 
		IF ( ( player_voices [ <index> ] . id ) = <voice> ) 
			change edit_skater_voice_index = <index> 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT CAS_SFX_PlayVoiceStream voicename = 0 
	StopStream CAS_SFX_VoiceAuditionStream 
	
	wait 5 gameframes 
	SWITCH <voicename> 
		CASE 0 
			
			RANDOM_NO_REPEAT(1, 1, 1, 1, 1) 
				RANDOMCASE PlayStream CustomM1_TakeOver01 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM1_TakeOver02 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM1_TakeOver03 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM1_TakeOver04 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM1_TakeOver05 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
			RANDOMEND 
		CASE 1 
			
			RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1) 
				RANDOMCASE PlayStream CustomM2_TakeOver01 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM2_TakeOver02 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM2_TakeOver03 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM2_TakeOver04 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM2_TakeOver05 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM2_TakeOver06 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM2_TakeOver07 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
			RANDOMEND 
		CASE 2 
			
			RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1) 
				RANDOMCASE PlayStream CustomM3_TakeOver01 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM3_TakeOver02 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM3_TakeOver03 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM3_TakeOver04 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM3_TakeOver05 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM3_TakeOver06 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM3_TakeOver07 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
			RANDOMEND 
		CASE 3 
			
			RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1) 
				RANDOMCASE PlayStream CustomM4_TakeOver01 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM4_TakeOver02 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM4_TakeOver03 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM4_TakeOver04 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM4_TakeOver05 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM4_TakeOver06 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomM4_TakeOver07 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
			RANDOMEND 
		CASE 4 
			
			RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1) 
				RANDOMCASE PlayStream CustomF1_TakeOver01 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF1_TakeOver02 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF1_TakeOver03 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF1_TakeOver04 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF1_TakeOver05 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF1_TakeOver06 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF1_TakeOver07 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
			RANDOMEND 
		CASE 5 
			
			RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1) 
				RANDOMCASE PlayStream CustomF2_TakeOver01 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF2_TakeOver02 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF2_TakeOver03 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF2_TakeOver04 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF2_TakeOver05 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF2_TakeOver06 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
				RANDOMCASE PlayStream CustomF2_TakeOver07 vol = 200 priority = StreamPriorityHigh id = CAS_SFX_VoiceAuditionStream 
			RANDOMEND 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT edit_skater_info_add_item { pad_choose_script = nullscript 
		pad_right_script = nullscript 
		pad_left_script = nullscript 
		focus_script = edit_skater_info_focus 
		unfocus_script = edit_skater_info_unfocus 
		tab = tab2 
		text_pos = PAIR(78.00000000000, 8.00000000000) 
		left_arrow_pos = PAIR(90.00000000000, 6.00000000000) 
		right_arrow_pos = PAIR(130.00000000000, 6.00000000000) 
		rgba = [ 128 , 128 , 128 , 128 ] 
	} 
	SetScreenElementLock id = current_menu off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = <item_id> 
		event_handlers = [ { focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			{ pad_right <pad_right_script> params = <pad_right_params> } 
			{ pad_left <pad_left_script> params = <pad_left_params> } 
		] 
		dims = PAIR(300.00000000000, 30.00000000000) 
		<not_focusable> 
	} 
	<parent_id> = <id> 
	IF GotParam index 
		SetScreenElementProps { 
			id = <parent_id> 
			tags = { tag_grid_x = <index> } 
		} 
	ENDIF 
	IF GotParam top_row 
		SetScreenElementProps { id = <parent_id> 
			event_handlers = [ { pad_choose generic_menu_pad_choose_sound } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } ] 
		} replace_handlers 
	ENDIF 
	IF GotParam no_bg 
		SetScreenElementProps { id = <parent_id> 
			event_handlers = [ { pad_choose generic_menu_pad_choose_sound } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } ] 
		} replace_handlers 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		local_id = text 
		font = small 
		text = <text> 
		rgba = <rgba> 
		just = [ right center ] 
		pos = <text_pos> 
		replace_handlers 
		<not_focusable> 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		local_id = bg 
		pos = PAIR(-41.00000000000, -8.00000000000) 
		scale = PAIR(10.19999980927, 1.00000000000) 
		just = [ left top ] 
		texture = roundbar_middle 
		rgba = [ 0 , 0 , 0 , 0 ] 
		z_priority = 1 
	} 
	IF GotParam item_value_text 
		CreateScreenElement { 
			type = TextElement 
			parent = <parent_id> 
			local_id = text_value 
			font = small 
			text = <item_value_text> 
			scale = 0.89999997616 
			rgba = <rgba> 
			just = [ left center ] 
			pos = PAIR(100.00000000000, 6.00000000000) 
			not_focusable = not_focusable 
			shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
		} 
		<value_id> = <id> 
		truncate_string id = <id> max_width = 195 
		IF NOT GotParam top_row 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <parent_id> 
				local_id = left_arrow 
				pos = <left_arrow_pos> 
				scale = PAIR(0.60000002384, 0.60000002384) 
				texture = left_arrow 
				rgba = [ 128 128 128 0 ] 
			} 
			GetStackedScreenElementPos X id = <value_id> offset = PAIR(11.00000000000, 10.00000000000) 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <parent_id> 
				local_id = right_arrow 
				pos = <pos> 
				scale = PAIR(0.60000002384, 0.60000002384) 
				texture = right_arrow 
				rgba = [ 128 128 128 0 ] 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_info_focus 
	GetTags 
	Theme_GetPauseBarColor return_value = bar_color 
	SetScreenElementProps { 
		id = { <id> child = text } 
		rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_rgba = [ 128 , 128 , 128 , 0 ] 
	} 
	IF ScreenElementExists id = { <id> child = text_value } 
		SetScreenElementProps { 
			id = { <id> child = text_value } 
			rgba = [ 0 , 0 , 0 , 128 ] 
			shadow_rgba = [ 128 , 128 , 128 , 0 ] 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = bg } 
		rgba = <bar_color> 
	} 
	IF NOT GotParam top_row 
		SetScreenElementProps { id = { <id> child = left_arrow } rgba = [ 80 , 80 , 80 , 128 ] } 
		SetScreenElementProps { id = { <id> child = right_arrow } rgba = [ 80 , 80 , 80 , 128 ] } 
		GetStackedScreenElementPos X id = { <id> child = 2 } offset = PAIR(11.00000000000, 10.00000000000) 
		DoScreenElementMorph time = 0 id = { <id> child = right_arrow } pos = <pos> 
	ENDIF 
	IF GotParam play_voice 
		CAS_SFX_PlayVoiceStream voicename = edit_skater_voice_index 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_info_unfocus bg_rgba = [ 128 128 128 60 ] 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = text } 
		rgba = [ 128 , 128 , 128 , 128 ] 
		shadow_rgba = UI_text_shadow_color 
	} 
	IF ScreenElementExists id = { <id> child = text_value } 
		SetScreenElementProps { 
			id = { <id> child = text_value } 
			rgba = [ 128 , 128 , 128 , 128 ] 
			shadow_rgba = UI_text_shadow_color 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = bg } 
		rgba = [ 0 , 0 , 0 , 0 ] 
	} 
	IF NOT GotParam top_row 
		SetScreenElementProps { id = { <id> child = left_arrow } rgba = [ 0 , 0 , 0 , 0 ] } 
		SetScreenElementProps { id = { <id> child = right_arrow } rgba = [ 0 , 0 , 0 , 0 ] } 
	ENDIF 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_edit_skater 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <CurrentSkaterProfileIndex> 
	IF ( <is_pro> = 1 ) 
		IF ( <is_locked> = 1 ) 
			RETURN 
		ENDIF 
	ENDIF 
	FireEvent type = unfocus target = cas_category_menu 
	DestroyScreenElement id = current_menu_anchor 
	wait 1 frame 
	create_onscreen_keyboard { 
		text = <text> 
		keyboard_title = <title> 
		min_length = <min_length> 
		max_length = <max_length> 
		text_to_change = <text_to_change> 
		keyboard_done_script = exit_onscreen_keyboard_from_edit_skater 
		keyboard_cancel_script = exit_onscreen_keyboard_from_edit_skater 
		allow_cancel 
	} 
ENDSCRIPT

SCRIPT exit_onscreen_keyboard_from_edit_skater 
	GetTextElementString id = keyboard_current_string 
	GetCurrentSkaterProfileIndex 
	SWITCH <text_to_change> 
		CASE name 
			SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { display_name = <string> } 
			check_for_neversoft_skaters name = <string> 
		CASE town 
			SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { hometown = <string> } 
	ENDSWITCH 
	destroy_onscreen_keyboard 
	edit_skater_info_menu 
ENDSCRIPT

SCRIPT edit_skater_info_change 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <CurrentSkaterProfileIndex> 
	GetTags 
	IF ( <is_locked> = 1 ) 
		RETURN 
	ENDIF 
	IF GotParam change_age 
		IF GotParam left 
			IF NOT ( <age> > 1 ) 
				RETURN 
			ENDIF 
			age = ( <age> - 1 ) 
		ELSE 
			IF NOT ( 99 > <age> ) 
				RETURN 
			ENDIF 
			age = ( <age> + 1 ) 
		ENDIF 
		FormatText textname = info_age "%a" a = <age> 
		SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { age = <age> } 
		SetScreenElementProps { id = { <id> child = 2 } text = <info_age> } 
	ENDIF 
	IF GotParam change_is_male 
		confirm_skater_sexchange is_male = <is_male> 
	ENDIF 
	IF GotParam change_stance 
		SWITCH <stance> 
			CASE regular 
				SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { stance = goofy } 
				RefreshSkaterModel skater = 0 profile = <CurrentSkaterProfileIndex> no_board = no_board 
				SetScreenElementProps { id = { <id> child = 2 } text = "Goofy" } 
			CASE goofy 
				SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { stance = regular } 
				RefreshSkaterModel skater = 0 profile = <CurrentSkaterProfileIndex> no_board = no_board 
				SetScreenElementProps { id = { <id> child = 2 } text = "Regular" } 
		ENDSWITCH 
	ENDIF 
	IF GotParam change_trickstyle 
		SWITCH <trickstyle> 
			CASE street 
				SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { trickstyle = vert } 
				SetScreenElementProps { id = { <id> child = 2 } text = "Vert" } 
			CASE vert 
				SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { trickstyle = street } 
				SetScreenElementProps { id = { <id> child = 2 } text = "Street" } 
		ENDSWITCH 
	ENDIF 
	IF GotParam change_push 
		IF GotParam left 
			SWITCH <pushstyle> 
				CASE mongo_when_switch 
					SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { pushstyle = never_mongo } 
					SetScreenElementProps { id = { <id> child = 2 } text = "Never Mongo" } 
				CASE never_mongo 
					SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { pushstyle = always_mongo } 
					SetScreenElementProps { id = { <id> child = 2 } text = "Always Mongo" } 
				CASE always_mongo 
					SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { pushstyle = mongo_when_switch } 
					SetScreenElementProps { id = { <id> child = 2 } text = "Mongo Switch" } 
			ENDSWITCH 
		ELSE 
			SWITCH <pushstyle> 
				CASE mongo_when_switch 
					SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { pushstyle = always_mongo } 
					SetScreenElementProps { id = { <id> child = 2 } text = "Always Mongo" } 
				CASE never_mongo 
					SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { pushstyle = mongo_when_switch } 
					SetScreenElementProps { id = { <id> child = 2 } text = "Mongo Switch" } 
				CASE always_mongo 
					SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { pushstyle = never_mongo } 
					SetScreenElementProps { id = { <id> child = 2 } text = "Never Mongo" } 
			ENDSWITCH 
		ENDIF 
		RefreshSkaterModel skater = 0 profile = <CurrentSkaterProfileIndex> no_board = no_board 
	ENDIF 
	IF GotParam change_voice 
		<voice_index> = edit_skater_voice_index 
		GetArraySize player_voices 
		BEGIN 
			IF GotParam left 
				<voice_index> = ( <voice_index> - 1 ) 
				IF ( <voice_index> < 0 ) 
					<voice_index> = ( <array_size> - 1 ) 
				ENDIF 
			ELSE 
				<voice_index> = ( <voice_index> + 1 ) 
				IF ( <voice_index> = <array_size> ) 
					<voice_index> = 0 
				ENDIF 
			ENDIF 
			IF ( <is_male> = ( player_voices [ <voice_index> ] . is_male ) ) 
				BREAK 
			ENDIF 
		REPEAT 
		change edit_skater_voice_index = <voice_index> 
		SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { voice = ( player_voices [ <voice_index> ] . id ) } 
		SetScreenElementProps { id = { <id> child = 2 } text = ( player_voices [ <voice_index> ] . frontend_desc ) } 
		
		CAS_SFX_PlayVoiceStream voicename = <voice_index> 
	ENDIF 
	GetStackedScreenElementPos X id = { <id> child = 2 } offset = PAIR(11.00000000000, 10.00000000000) 
	DoScreenElementMorph { time = 0 id = { <id> child = right_arrow } pos = <pos> } 
	generic_menu_scroll_sideways_sound 
ENDSCRIPT

SCRIPT confirm_skater_sexchange 
	create_error_box { 
		title = "WARNING!" 
		text = "Changing the sex of your skater will erase any changes.\\n Are you sure?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		bg_scale = 1.20000004768 
		buttons = [ 
			{ text = "Yes" pad_choose_script = perform_skater_sexchange } 
			{ text = "No" pad_choose_script = cancel_skater_sexchange } 
		] 
	} 
	FireEvent type = unfocus target = current_menu_anchor 
	FireEvent type = unfocus target = cas_category_menu 
	FireEvent type = focus target = dialog_box_vmenu 
ENDSCRIPT

SCRIPT cancel_skater_sexchange 
	edit_skater_info_menu 
	FireEvent type = unfocus target = edit_skater_info_vmenu 
	FireEvent type = focus target = cas_category_menu 
	FireEvent type = focus target = edit_skater_info_vmenu data = { child_id = skater_sex_value } 
ENDSCRIPT

SCRIPT perform_skater_sexchange 
	edit_skater_info_menu 
	FireEvent type = unfocus target = edit_skater_info_vmenu 
	FireEvent type = focus target = cas_category_menu 
	FireEvent type = focus target = edit_skater_info_vmenu data = { child_id = skater_sex_value } 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <CurrentSkaterProfileIndex> 
	SWITCH <is_male> 
		CASE 0 
			cas_apply_sex apply_male = 1 
			SetScreenElementProps { id = { skater_sex_value child = 2 } text = "Male" } 
		CASE 1 
			cas_apply_sex apply_male = 0 
			SetScreenElementProps { id = { skater_sex_value child = 2 } text = "Female" } 
	ENDSWITCH 
	<index> = 0 
	GetArraySize player_voices 
	BEGIN 
		IF NOT ( <is_male> = ( player_voices [ <index> ] . is_male ) ) 
			SetSkaterProfileInfo player = <CurrentSkaterProfileIndex> params = { voice = ( player_voices [ <index> ] . id ) } 
			SetScreenElementProps { id = { skater_voice_value child = 2 } text = ( player_voices [ <index> ] . frontend_desc ) } 
			change edit_skater_voice_index = <index> 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( ( LevelIs load_cas ) | ( LevelIs Load_MainMenu ) ) 
		MakeSkaterGoto CasAI 
	ENDIF 
	FireEvent type = focus target = skater_voice_value 
	FireEvent type = unfocus target = skater_voice_value 
	FireEvent type = focus target = skater_sex_value 
ENDSCRIPT

SCRIPT edit_skater_create_options_menu pad_back_script = create_edit_skater_menu 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = unfocus target = cas_category_menu 
	ENDIF 
	kill_cas_pull_back_camera 
	IF ChecksumEquals a = <options_array> b = edit_skater_deck_options 
		MakeSkaterGoto CasAI params = { no_init deck_bottom } 
	ELSE 
		IF ChecksumEquals a = <options_array> b = edit_skater_head_options 
			MakeSkaterGoto CasAI params = { no_init pause_skater } 
		ELSE 
			MakeSkaterGoto CasAI params = { no_init } 
		ENDIF 
	ENDIF 
	IF StructureContains structure = ( <options_array> [ 0 ] ) group_title 
		<title> = ( ( <options_array> [ 0 ] ) . group_title ) 
	ENDIF 
	IF GotParam category 
		change current_cas_category = <category> 
	ENDIF 
	<helper_text> = generic_helper_text_cas_z 
	make_new_roundbar_menu { 
		pos = PAIR(28.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 280.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = <pad_back_script> 
		helper_text = <helper_text> 
		no_bar_edges 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 30 , 30 , 30 , 60 ] } 
		additional_create_script = set_options_item_enabled_script 
		title = <title> 
		menu_id = options_menu 
		vmenu_id = options_vmenu 
		arrow_up = options_arrow_up 
		arrow_down = options_arrow_down 
		scrolling 
		no_animate 
		add_tab = add_tab 
		add_bar = add_bar 
	} 
	SetScreenElementProps { 
		id = options_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
			{ pad_alt spawn_cas_pull_back_camera params = { cam_anim = <cam_anim> } } 
		] 
		replace_handlers 
	} 
	DoScreenElementMorph id = current_scrolling_menu alpha = 0 
	IF GotParam options_array 
		GetArraySize <options_array> 
		<index> = 0 
		BEGIN 
			RemoveParameter not_focusable 
			RemoveParameter is_enabled_script 
			RemoveParameter is_visible_script 
			check_option_is_visible ( <options_array> [ <index> ] ) 
			IF NOT ( <is_visible> = 0 ) 
				IF ChecksumEquals a = <options_array> b = edit_skater_deck_options 
					IF ChecksumEquals a = ( <options_array> [ <index> ] . submenu ) b = wheel_color_menu 
						<choose_script> = create_cas_modifier_menu 
						<choose_params> = { 
							pos = PAIR(206.00000000000, 130.00000000000) 
							helper_pos = PAIR(114.00000000000, 296.00000000000) 
							parent_menu = options_menu 
							parent_vmenu = options_vmenu 
							submenu = ( <options_array> [ <index> ] . submenu ) 
							cam_anim = <cam_anim> 
							cam_anim_sub = <cam_anim_sub> 
						} 
					ELSE 
						<choose_script> = edit_skater_create_cas_menu 
						<choose_params> = { options_array = <options_array> ( <options_array> [ <index> ] ) back_to_sub = 0 keep_current = keep_current cam_anim = <cam_anim> } 
					ENDIF 
				ELSE 
					<choose_script> = edit_skater_create_sub_options_menu 
					<choose_params> = { options_array = <options_array> part_parent_index = <index> cam_anim = <cam_anim> } 
				ENDIF 
				GetUpperCaseString ( <options_array> [ <index> ] . text ) 
				add_roundbar_menu_item { 
					text = <UpperCaseString> 
					pad_choose_script = <choose_script> 
					pad_choose_params = <choose_params> 
					scale_highlight_text = 0 
					scale = 0.85000002384 
					option_details = ( <options_array> [ <index> ] ) 
				} 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	add_roundbar_menu_item { 
		text = "DONE" 
		id = cas_done 
		pad_choose_script = <pad_back_script> 
		index = <index> 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	IF GotParam cam_anim 
		killskatercamanim all 
		cas_setup_rotating_camera cam_anim = <cam_anim> 
	ENDIF 
	IF GotParam show_deck 
		skater : SwitchOnBoard 
	ELSE 
		skater : SwitchOffBoard 
	ENDIF 
	wait 2 gameframes 
	SetScreenElementProps id = current_scrolling_menu reset_window_top 
	DoScreenElementMorph id = current_scrolling_menu alpha = 1 
	roundbar_menu_finish build_pause_parts = 0 
	update_options_menu 
	IF ScreenElementExists id = cas_category_menu 
		wait 2 gameframes 
		FireEvent type = focus target = cas_category_menu 
		update_cas_category_menu 
	ENDIF 
ENDSCRIPT

SCRIPT set_options_item_enabled_script 
	IF StructureContains structure = <option_details> is_enabled_script 
		<container_id> : SetTags is_enabled_script = ( <option_details> . is_enabled_script ) is_enabled_params = ( <option_details> . is_enabled_params ) 
	ENDIF 
ENDSCRIPT

SCRIPT update_options_menu 
	IF ScreenElementExists id = options_vmenu 
		options_vmenu : GetTags 
		GetScreenElementChildren id = options_vmenu 
		GetArraySize <children> 
		<index> = 0 
		BEGIN 
			IF NOT ( <index> = <tag_selected_index> ) 
				( <children> [ <index> ] ) : GetTags 
				IF GotParam is_enabled_script 
					<is_enabled_script> <is_enabled_params> 
					IF ( <is_enabled> ) 
						SetScreenElementProps { 
							id = ( <children> [ <index> ] ) 
							focusable 
						} 
						SetScreenElementProps { 
							id = { ( <children> [ <index> ] ) child = text } 
							rgba = [ 128 128 128 128 ] 
						} 
					ELSE 
						SetScreenElementProps { 
							id = ( <children> [ <index> ] ) 
							not_focusable 
						} 
						SetScreenElementProps { 
							id = { ( <children> [ <index> ] ) child = text } 
							rgba = [ 70 70 70 120 ] 
						} 
					ENDIF 
				ENDIF 
				RemoveParameter is_enabled_script 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_create_sub_options_menu 
	current_menu : GetSingleTag tag_selected_id 
	FireEvent type = unfocus target = current_menu 
	cas_rehighlight_menu_item id = <tag_selected_id> no_bar_edges 
	kill_cas_pull_back_camera 
	make_new_roundbar_menu { 
		pos = PAIR(196.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 280.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = edit_skater_exit_sub_menu 
		pad_back_params = { parent_menu = options_menu parent_vmenu = options_vmenu cam_anim = <cam_anim> } 
		no_bar_edges 
		no_helper_text 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 0 , 0 , 0 , 60 ] } 
		menu_id = sub_options_menu 
		vmenu_id = sub_options_vmenu 
		keep_current 
		no_animate 
	} 
	IF StructureContains structure = ( <options_array> [ <part_parent_index> ] ) cam_anim_sub 
		<back_cam_anim> = ( <options_array> [ <part_parent_index> ] . cam_anim_sub ) 
	ELSE 
		<back_cam_anim> = <cam_anim> 
	ENDIF 
	SetScreenElementProps { 
		id = sub_options_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
			{ pad_alt spawn_cas_pull_back_camera params = { cam_anim = <back_cam_anim> } } 
		] 
		replace_handlers 
	} 
	IF StructureContains structure = ( <options_array> [ <part_parent_index> ] ) short_text 
		<sub_text> = ( <options_array> [ <part_parent_index> ] . short_text ) 
	ELSE 
		FormatText textname = sub_text "Choose %s" s = ( <options_array> [ <part_parent_index> ] . text ) 
	ENDIF 
	GetUpperCaseString <sub_text> 
	add_roundbar_menu_item { 
		text = <UpperCaseString> 
		pad_choose_script = edit_skater_create_cas_menu 
		pad_choose_params = { 
			options_array = <options_array> 
			part_parent_index = <part_parent_index> 
			( <options_array> [ <part_parent_index> ] ) 
			cam_anim = <cam_anim> 
		} 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	GetArraySize <options_array> 
	<index> = 0 
	BEGIN 
		RemoveParameter not_focusable 
		RemoveParameter pad_choose_script 
		RemoveParameter pad_choose_params 
		RemoveParameter cam_anim_sub 
		IF StructureContains structure = ( <options_array> [ <index> ] ) part_parent 
			IF ( ( <options_array> [ <index> ] . part_parent ) = ( <options_array> [ <part_parent_index> ] . text ) ) 
				check_option_is_visible ( <options_array> [ <index> ] ) ignore_modifier 
				IF NOT ( <is_visible> = 0 ) 
					check_option_is_enabled ( <options_array> [ <index> ] ) 
					IF ( <is_enabled> = 0 ) 
						AddParams not_focusable = not_focusable 
					ENDIF 
					IF StructureContains structure = ( <options_array> [ <index> ] ) list 
						pad_choose_script = edit_skater_create_cas_menu 
						pad_choose_params = { 
							options_array = <options_array> 
							part_parent_index = <part_parent_index> 
							( <options_array> [ <index> ] ) 
							cam_anim = <cam_anim> 
						} 
					ELSE 
						pad_choose_script = create_cas_modifier_menu 
						IF StructureContains structure = ( <options_array> [ <part_parent_index> ] ) cam_anim_sub 
							<cam_anim_sub> = ( <options_array> [ <part_parent_index> ] . cam_anim_sub ) 
						ENDIF 
						pad_choose_params = { 
							parent_menu = sub_options_menu 
							parent_vmenu = sub_options_vmenu 
							submenu = ( <options_array> [ <index> ] . submenu ) 
							cam_anim = <cam_anim> 
							cam_anim_sub = <cam_anim_sub> 
						} 
					ENDIF 
					GetUpperCaseString ( <options_array> [ <index> ] . text ) 
					add_roundbar_menu_item { 
						text = <UpperCaseString> 
						pad_choose_script = <pad_choose_script> 
						pad_choose_params = <pad_choose_params> 
						not_focusable = <not_focusable> 
						scale_highlight_text = 0 
						scale = 0.85000002384 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	roundbar_menu_finish build_pause_parts = 0 
	IF StructureContains structure = ( <options_array> [ <part_parent_index> ] ) cam_anim_sub 
		killskatercamanim all 
		cas_setup_rotating_camera cam_anim = ( <options_array> [ <part_parent_index> ] . cam_anim_sub ) 
	ENDIF 
	IF StructureContains structure = ( <options_array> [ <part_parent_index> ] ) cam_angle 
	ENDIF 
ENDSCRIPT

SCRIPT create_scale_options_menu 
	FireEvent type = unfocus target = current_menu 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = unfocus target = cas_category_menu 
	ENDIF 
	cas_rehighlight_menu_item id = cas_scale_options no_bar_edges 
	kill_cas_pull_back_camera 
	IF StructureContains structure = ( <options_array> [ 0 ] ) group_title 
		<title> = ( ( <options_array> [ 0 ] ) . group_title ) 
	ENDIF 
	IF GotParam category 
		change current_cas_category = <category> 
	ENDIF 
	make_new_roundbar_menu { 
		pos = PAIR(196.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 280.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = edit_skater_exit_sub_menu 
		pad_back_params = { 
			parent_menu = edit_skater_menu 
			parent_vmenu = edit_skater_vmenu 
			cam_anim = <cam_anim> 
			update_categories 
			title = "EDIT-SKATER" 
			no_zoom 
		} 
		no_bar_edges 
		no_helper_text 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 0 , 0 , 0 , 60 ] } 
		title = <title> 
		menu_id = scaling_menu 
		vmenu_id = scaling_vmenu 
		arrow_up = scaling_arrow_up 
		arrow_down = scaling_arrow_down 
		keep_current 
		no_animate 
		scrolling 
		add_tab = add_tab 
		add_bar = add_bar 
	} 
	SetScreenElementProps { 
		id = scaling_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
		] 
		replace_handlers 
	} 
	DoScreenElementMorph id = current_scrolling_menu alpha = 0 
	add_roundbar_menu_item { 
		text = "RESET SCALING" 
		pad_choose_script = cas_reset_all_scaling 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	GetArraySize <options_array> 
	<index> = 0 
	BEGIN 
		RemoveParameter not_focusable 
		check_option_is_visible ( <options_array> [ <index> ] ) 
		IF NOT ( <is_visible> = 0 ) 
			check_option_is_enabled ( <options_array> [ <index> ] ) 
			IF ( <is_enabled> = 0 ) 
				AddParams not_focusable = not_focusable 
			ENDIF 
			GetUpperCaseString ( <options_array> [ <index> ] . text ) 
			add_roundbar_menu_item { 
				text = <UpperCaseString> 
				pad_choose_script = create_cas_modifier_menu 
				pad_choose_params = { 
					parent_menu = scaling_menu 
					parent_vmenu = scaling_vmenu 
					add_scaling 
					cam_anim = <cam_anim> 
					( <options_array> [ <index> ] ) 
					use_cam_anim_for_back = use_cam_anim_for_back 
				} 
				not_focusable = <not_focusable> 
				scale_highlight_text = 0 
				scale = 0.85000002384 
			} 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	wait 2 gameframes 
	IF ScreenElementExists id = current_scrolling_menu 
		SetScreenElementProps id = current_scrolling_menu reset_window_top 
		DoScreenElementMorph id = current_scrolling_menu alpha = 1 
	ENDIF 
	roundbar_menu_finish build_pause_parts = 0 
	IF ScreenElementExists id = cas_category_menu 
		wait 2 gameframes 
		FireEvent type = focus target = cas_category_menu 
		update_cas_category_menu 
	ENDIF 
ENDSCRIPT

CASCURRENTCOLOR = [ 12 44 67 110 ] 
SCRIPT edit_skater_create_cas_menu back_to_sub = 1 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = unfocus target = cas_category_menu 
	ENDIF 
	kill_cas_pull_back_camera 
	IF ChecksumEquals a = <submenu> b = grip_tape_style_menu 
		MakeSkaterGoto CasAI params = { no_init deck_top } 
	ENDIF 
	IF ChecksumEquals a = <submenu> b = deck_graphic_menu 
		MakeSkaterGoto CasAI params = { no_init deck_bottom } 
	ENDIF 
	<helper_text> = generic_helper_text_cas_z 
	IF GotParam cam_anim_sub 
		killskatercamanim all 
		cas_setup_rotating_camera cam_anim = <cam_anim_sub> 
		<back_cam_anim> = <cam_anim_sub> 
	ELSE 
		<back_cam_anim> = <cam_anim> 
	ENDIF 
	FireEvent type = unfocus target = current_menu 
	make_new_roundbar_menu { 
		pos = PAIR(196.00000000000, 126.00000000000) 
		dims = PAIR(160.00000000000, 280.00000000000) 
		internal_text_just = right 
		internal_text_offset = PAIR(-6.00000000000, 0.00000000000) 
		parent = root_window 
		pad_back_script = edit_skater_exit_cas_menu 
		pad_back_params = { part_parent_index = <part_parent_index> options_array = <options_array> cam_anim = <cam_anim> back_to_sub = <back_to_sub> } 
		helper_text = <helper_text> 
		no_bar_edges 
		additional_menu_create_script = add_cas_menu_box 
		additional_menu_create_params = { bg_rgba = [ 0 , 0 , 0 , 60 ] } 
		additional_create_script = edit_skater_set_selected_cas_item 
		additional_focus_script = edit_skater_highlight_cas_item 
		additional_unfocus_script = edit_skater_unhighlight_cas_item 
		menu_id = cas_menu 
		vmenu_id = cas_vmenu 
		arrow_up = cas_arrow_up 
		arrow_down = cas_arrow_down 
		scrolling 
		keep_current = <keep_current> 
		no_animate 
	} 
	SetScreenElementProps { 
		id = cas_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
			{ pad_alt spawn_cas_pull_back_camera params = { cam_anim = <back_cam_anim> } } 
		] 
		replace_handlers 
	} 
	DoScreenElementMorph id = current_scrolling_menu alpha = 0 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <CurrentSkaterProfileIndex> 
	GetArraySize master_editable_list 
	<master_size> = <array_size> 
	<index> = 0 
	<current_submenu> = <submenu> 
	BEGIN 
		RemoveParameter colormenu 
		RemoveParameter posmenu 
		RemoveParameter submenu 
		RemoveParameter no_pos 
		RemoveParameter no_rot 
		RemoveParameter no_scale 
		RemoveParameter accessory_lists 
		AddParams ( master_editable_list [ <index> ] ) 
		<shouldDisplayList> = 0 
		IF ( <is_male> = 1 ) 
			IF GotParam male 
				<shouldDisplayList> = ( <male> = 1 ) 
			ENDIF 
		ELSE 
			IF GotParam female 
				<shouldDisplayList> = ( <female> = 1 ) 
			ENDIF 
		ENDIF 
		IF GotParam submenu 
			IF ( <submenu> = <current_submenu> ) 
				IF NOT ( <shouldDisplayList> = 0 ) 
					GetArraySize <part> 
					IF NOT GotParam startlist 
						<part_index> = 0 
					ELSE 
						<part_index> = <startlist> 
					ENDIF 
					BEGIN 
						IF ( <array_size> > <part_index> ) 
							edit_skater_possibly_add_cas_item { 
								( <part> [ <part_index> ] ) 
								part = <part> 
								desc_id = <desc_id> 
								show_logos = <show_logos> 
								part_index = <part_index> 
								startlist = <startlist> 
								endlist = <endlist> 
								accessory_lists = <accessory_lists> 
							} 
						ELSE 
							BREAK 
						ENDIF 
						<part_index> = ( <part_index> + 1 ) 
					REPEAT <array_size> 
				ENDIF 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <master_size> 
	add_roundbar_menu_item { 
		text = "DONE" 
		pad_choose_script = edit_skater_exit_cas_menu 
		pad_choose_params = { part_parent_index = <part_parent_index> options_array = <options_array> cam_anim = <cam_anim> back_to_sub = <back_to_sub> } 
		scale_highlight_text = 0 
		scale = 0.85000002384 
	} 
	IF ( <current_submenu> = wheel_color_menu ) 
		DoScreenElementMorph id = edit_skater_menu_down_arrow pos = PAIR(150.00000000000, 283.00000000000) scale = 1 
		DoScreenElementMorph id = edit_skater_menu_up_arrow pos = PAIR(150.00000000000, 132.00000000000) scale = 1 
	ENDIF 
	dialog_box_exit 
	wait 2 gameframes 
	SetScreenElementProps id = current_scrolling_menu reset_window_top 
	DoScreenElementMorph id = current_scrolling_menu alpha = 1 
	roundbar_menu_finish build_pause_parts = 0 
	IF ScreenElementExists id = cas_category_menu 
		wait 2 gameframes 
		FireEvent type = focus target = cas_category_menu 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_exit_cas_menu 
	IF ( <back_to_sub> ) 
		edit_skater_exit_sub_menu parent_menu = options_menu parent_vmenu = options_vmenu cam_anim = <cam_anim> 
		edit_skater_create_sub_options_menu part_parent_index = <part_parent_index> options_array = <options_array> cam_anim = <cam_anim> 
	ELSE 
		DestroyScreenElement id = cas_menu 
		AssignAlias id = options_menu alias = current_menu_anchor 
		AssignAlias id = options_vmenu alias = current_menu 
		SetScreenElementLock id = current_menu_anchor off 
		create_helper_text generic_helper_text_cas_z 
		FireEvent type = focus target = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT create_cas_modifier_menu pos = PAIR(388.00000000000, 282.00000000000) helper_pos = PAIR(-68.00000000000, 144.00000000000) 
	kill_cas_pull_back_camera 
	IF ChecksumEquals a = <submenu> b = wheel_color_menu 
		MakeSkaterGoto CasAI params = { no_init deck_bottom } 
	ENDIF 
	current_menu : GetSingleTag tag_selected_id 
	FireEvent type = unfocus target = current_menu 
	cas_rehighlight_menu_item id = <tag_selected_id> 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = mod_menu 
		just = [ top left ] 
		pos = <pos> 
	} 
	AssignAlias id = mod_menu alias = current_menu_anchor 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		pos = 0 
		scale = PAIR(26.00000000000, 12.50000000000) 
		just = [ left top ] 
		rgba = [ 30 , 30 , 30 , 80 ] 
		z_priority = -1 
	} 
	Theme_GetPauseBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, -4.00000000000) 
		scale = PAIR(26.00000000000, 0.50000000000) 
		just = [ left top ] 
		rgba = <bar_rgba> 
		z_priority = -1 
		alpha = 0.60000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		pos = PAIR(208.00000000000, -4.00000000000) 
		scale = PAIR(0.50000000000, 13.50000000000) 
		just = [ left top ] 
		rgba = <bar_rgba> 
		z_priority = -1 
		alpha = 0.60000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 100.00000000000) 
		scale = PAIR(26.00000000000, 0.50000000000) 
		just = [ left top ] 
		rgba = <bar_rgba> 
		z_priority = -1 
		alpha = 0.60000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		pos = PAIR(-4.00000000000, -4.00000000000) 
		scale = PAIR(0.50000000000, 13.50000000000) 
		just = [ left top ] 
		rgba = <bar_rgba> 
		z_priority = -1 
		alpha = 0.60000002384 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = current_menu_anchor 
		id = mod_vmenu 
		pos = PAIR(112.00000000000, 18.00000000000) 
		font = small 
		just = [ left top ] 
		event_handlers = [ 
			{ pad_back generic_pause_exit_sound } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
	} 
	<menu_cam_anim> = <cam_anim> 
	<menu_cam_anim_sub> = <cam_anim_sub> 
	IF GotParam cam_anim_sub 
		<back_cam_anim> = <cam_anim_sub> 
	ELSE 
		IF NOT ChecksumEquals a = <submenu> b = skin_color_menu 
			<back_cam_anim> = <cam_anim> 
		ENDIF 
	ENDIF 
	SetScreenElementProps { 
		id = mod_vmenu 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
			{ pad_alt spawn_cas_pull_back_camera params = { cam_anim = <back_cam_anim> } } 
		] 
		replace_handlers 
	} 
	AssignAlias id = mod_vmenu alias = current_menu 
	IF GotParam add_scaling 
		GetCurrentSkaterProfileIndex 
		GetSkaterSex player = <CurrentSkaterProfileIndex> 
		IF ( <is_male> ) 
			<cas_part> = <male_part> 
		ELSE 
			<cas_part> = <female_part> 
		ENDIF 
		scalingmenu_add_options_to_menu part = <bone_group> <scaling_params> cas_part = <cas_part> 
		IF GotParam cam_anim_sub 
			create_helper_text helper_pos = <helper_pos> generic_helper_text_color_menu_z scale = 0.89999997616 
			killskatercamanim all 
			cas_setup_rotating_camera cam_anim = <cam_anim_sub> 
			<no_zoom> = no_zoom 
		ELSE 
			create_helper_text helper_pos = <helper_pos> generic_helper_text_color_menu 
			SetScreenElementProps { 
				id = mod_vmenu 
				event_handlers = [ 
					{ pad_alt null_script } 
				] 
				replace_handlers 
			} 
			<no_zoom> = no_zoom 
		ENDIF 
	ELSE 
		GetCurrentSkaterProfileIndex 
		GetSkaterProfileInfo player = <CurrentSkaterProfileIndex> 
		GetArraySize master_editable_list 
		<master_size> = <array_size> 
		<index> = 0 
		<current_submenu> = <submenu> 
		BEGIN 
			RemoveParameter colormenu 
			RemoveParameter posmenu 
			RemoveParameter submenu 
			RemoveParameter no_pos 
			RemoveParameter no_rot 
			RemoveParameter no_scale 
			RemoveParameter accessory_lists 
			AddParams ( master_editable_list [ <index> ] ) 
			<shouldDisplayList> = 0 
			IF ( <is_male> = 1 ) 
				IF GotParam male 
					<shouldDisplayList> = ( <male> = 1 ) 
				ENDIF 
			ELSE 
				IF GotParam female 
					<shouldDisplayList> = ( <female> = 1 ) 
				ENDIF 
			ENDIF 
			IF GotParam colormenu 
				IF ( <colormenu> = <current_submenu> ) 
					IF NOT ( <shouldDisplayList> = 0 ) 
						colormenu_add_options_to_menu part = <part> from_cas 
						IF ( <current_submenu> = skin_color_menu ) 
							cas_setup_rotating_camera name = fullbody play_hold 
							create_helper_text helper_pos = <helper_pos> generic_helper_text_color_menu 
							SetScreenElementProps { 
								id = mod_vmenu 
								event_handlers = [ 
									{ pad_alt null_script } 
								] 
								replace_handlers 
							} 
						ELSE 
							create_helper_text helper_pos = <helper_pos> generic_helper_text_color_menu_z scale = 0.89999997616 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			IF GotParam posmenu 
				IF ( <posmenu> = <current_submenu> ) 
					IF NOT ( <shouldDisplayList> = 0 ) 
						posmenu_add_options_to_menu part = <part> from_cas no_pos = <no_pos> no_rot = <no_rot> no_scale = <no_scale> 
						IF GotParam cam_anim 
							IF NOT ( <cam_anim> = fullbody ) 
								IF IsNgc 
									create_helper_text helper_pos = <helper_pos> generic_helper_text_color_menu_reset_ngc 
								ELSE 
									create_helper_text helper_pos = <helper_pos> generic_helper_text_color_menu_reset 
								ENDIF 
							ENDIF 
						ENDIF 
						dialog_box_exit 
						make_temp_fake_pos_menu no_pos = <no_pos> no_rot = <no_rot> no_scale = <no_scale> 
						BREAK 
					ENDIF 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <master_size> 
	ENDIF 
	SetScreenElementProps { 
		id = mod_vmenu 
		event_handlers = [ 
			{ 
				pad_back 
				edit_skater_exit_sub_menu 
				params = { 
					parent_menu = <parent_menu> 
					parent_vmenu = <parent_vmenu> 
					cam_anim = <menu_cam_anim> 
					cam_anim_sub = <menu_cam_anim_sub> 
					use_cam_anim_for_back = <use_cam_anim_for_back> 
					no_zoom = <no_zoom> 
				} 
			} 
		] 
	} 
	FireEvent type = focus target = current_menu 
ENDSCRIPT

SCRIPT make_temp_fake_pos_menu 
	
	SetScreenElementProps id = current_menu pos = PAIR(800.00000000000, 800.00000000000) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = new_pos_menu 
		pos = PAIR(-34.00000000000, 12.00000000000) 
		just = [ left top ] 
	} 
	<sprite_on_rgba> = [ 128 128 128 128 ] 
	<text_on_rgba> = [ 128 128 128 128 ] 
	<help_text_on_rgba> = [ 0 0 0 128 ] 
	<sprite_off_rgba> = [ 60 60 60 60 ] 
	<text_off_rgba> = [ 60 60 60 60 ] 
	<help_text_off_rgba> = [ 60 60 60 60 ] 
	IF GotParam no_pos 
		IF ( <no_pos> = 1 ) 
			<text_rgba> = <text_off_rgba> 
			<sprite_rgba> = <sprite_off_rgba> 
			<help_text_rgba> = <help_text_off_rgba> 
		ELSE 
			<text_rgba> = <text_on_rgba> 
			<sprite_rgba> = <sprite_on_rgba> 
			<help_text_rgba> = <help_text_on_rgba> 
		ENDIF 
	ELSE 
		<text_rgba> = <text_on_rgba> 
		<sprite_rgba> = <sprite_on_rgba> 
		<help_text_rgba> = <help_text_on_rgba> 
	ENDIF 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = TextElement 
		font = small 
		text = "Pos" 
		pos = PAIR(55.00000000000, 8.00000000000) 
		rgba = <text_rgba> 
		just = [ left top ] 
		z_priority = 5 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = TextElement 
		font = small 
		text = "\\b7/\\b4/\\b6/\\b5" 
		scale = PAIR(0.75000000000, 0.75000000000) 
		pos = PAIR(110.00000000000, 8.00000000000) 
		rgba = <text_rgba> 
		just = [ left top ] 
		z_priority = 6 
	} 
	IF GotParam no_rot 
		IF ( <no_rot> = 1 ) 
			<text_rgba> = <text_off_rgba> 
			<sprite_rgba> = <sprite_off_rgba> 
			<help_text_rgba> = <help_text_off_rgba> 
		ELSE 
			<text_rgba> = <text_on_rgba> 
			IF IsNgc 
				Theme_GetPauseBarColor return_value = stick_color 
			ELSE 
				<stick_color> = <sprite_on_rgba> 
			ENDIF 
			<sprite_rgba> = <sprite_on_rgba> 
			<help_text_rgba> = <help_text_on_rgba> 
		ENDIF 
	ELSE 
		<text_rgba> = <text_on_rgba> 
		IF IsNgc 
			Theme_GetPauseBarColor return_value = stick_color 
		ELSE 
			<sprite_rgba> = <sprite_on_rgba> 
		ENDIF 
		<sprite_rgba> = <sprite_on_rgba> 
		<help_text_rgba> = <help_text_on_rgba> 
	ENDIF 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = TextElement 
		font = small 
		text = "Rot" 
		pos = PAIR(55.00000000000, 31.00000000000) 
		rgba = <text_rgba> 
		just = [ left top ] 
		z_priority = 5 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = SpriteElement 
		texture = left_arrow 
		pos = PAIR(125.00000000000, 31.00000000000) 
		scale = PAIR(0.75000000000, 0.75000000000) 
		rgba = <sprite_rgba> 
		just = [ left top ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = TextElement 
		font = small 
		text = "\\bj" 
		scale = PAIR(1.20000004768, 0.80000001192) 
		pos = PAIR(145.00000000000, 31.00000000000) 
		rgba = <text_rgba> 
		just = [ left top ] 
		z_priority = 6 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = SpriteElement 
		texture = right_arrow 
		pos = PAIR(185.00000000000, 31.00000000000) 
		scale = PAIR(0.75000000000, 0.75000000000) 
		rgba = <sprite_rgba> 
		just = [ left top ] 
		z_priority = 5 
	} 
	IF GotParam no_scale 
		IF ( <no_scale> = 1 ) 
			<text_rgba> = <text_off_rgba> 
			<sprite_rgba> = <sprite_off_rgba> 
			<help_text_rgba> = <help_text_off_rgba> 
		ELSE 
			<text_rgba> = <text_on_rgba> 
			IF IsNgc 
				Theme_GetPauseBarColor return_value = stick_color 
			ELSE 
				<stick_color> = <sprite_on_rgba> 
			ENDIF 
			<sprite_rgba> = <sprite_on_rgba> 
			<help_text_rgba> = <help_text_on_rgba> 
		ENDIF 
	ELSE 
		<text_rgba> = <text_on_rgba> 
		IF IsNgc 
			Theme_GetPauseBarColor return_value = stick_color 
		ELSE 
			<stick_color> = <sprite_on_rgba> 
		ENDIF 
		<sprite_rgba> = <sprite_on_rgba> 
		<help_text_rgba> = <help_text_on_rgba> 
	ENDIF 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = TextElement 
		font = small 
		text = "Scale" 
		pos = PAIR(55.00000000000, 53.00000000000) 
		rgba = <text_rgba> 
		just = [ left top ] 
		z_priority = 5 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = SpriteElement 
		texture = up_arrow 
		pos = PAIR(125.00000000000, 53.00000000000) 
		scale = PAIR(0.75000000000, 0.75000000000) 
		rgba = <sprite_rgba> 
		just = [ left top ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = TextElement 
		font = small 
		text = "\\bk" 
		scale = PAIR(1.20000004768, 0.80000001192) 
		pos = PAIR(145.00000000000, 53.00000000000) 
		rgba = <text_rgba> 
		just = [ left top ] 
		z_priority = 6 
	} 
	CreateScreenElement { 
		parent = new_pos_menu 
		type = SpriteElement 
		texture = down_arrow 
		pos = PAIR(185.00000000000, 53.00000000000) 
		scale = PAIR(0.75000000000, 0.75000000000) 
		rgba = <sprite_rgba> 
		just = [ left top ] 
		z_priority = 5 
	} 
ENDSCRIPT

SCRIPT edit_skater_exit_sub_menu 
	kill_cas_pull_back_camera 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	AssignAlias id = <parent_menu> alias = current_menu_anchor 
	AssignAlias id = <parent_vmenu> alias = current_menu 
	FireEvent type = focus target = current_menu 
	SetScreenElementLock id = current_menu_anchor off 
	IF GotParam no_zoom 
		create_helper_text generic_helper_text_cas 
	ELSE 
		create_helper_text generic_helper_text_cas_z 
	ENDIF 
	IF GotParam title 
		build_theme_sub_title title = <title> add_tab add_bar 
	ENDIF 
	SetScreenElementLock id = current_menu_anchor on 
	IF NOT GotParam cam_anim_sub 
		IF GotParam cam_anim 
			killskatercamanim all 
			cas_setup_rotating_camera cam_anim = <cam_anim> 
		ENDIF 
	ENDIF 
	IF GotParam use_cam_anim_for_back 
		cas_setup_rotating_camera cam_anim = <cam_anim> 
	ENDIF 
	IF GotParam update_categories 
		update_cas_category_menu no_highlight 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_possibly_add_cas_item 
	cas_item_is_visible <...> 
	get_part_current_desc_id part = <part> 
	IF GotParam current_desc_id 
		IF ( <desc_id> = <current_desc_id> ) 
			current_part = current_part 
		ENDIF 
	ENDIF 
	IF GotParam secret_color 
		<rgba> = [ 32 32 255 128 ] 
		focus_params = { rgba = [ 32 32 255 255 ] } 
		unfocus_params = { rgba = [ 32 32 255 128 ] } 
	ENDIF 
	IF GotParam startlist 
		IF NOT ( ( <part_index> + 1 ) > <startlist> ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam endlist 
		IF NOT ( ( <endlist> + 1 ) > <part_index> ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam show_logos 
		IF GotParam with 
			GetTextureFromPath path = <with> 
			FormatText checksumname = texture_name "%t" t = <texture> 
			texture = <texture_name> 
		ENDIF 
	ENDIF 
	IF ChecksumEquals a = <part> b = board 
		<is_visible> = 0 
	ENDIF 
	IF ( <is_visible> = 1 ) 
		check_if_item_accessible part = <part> desc_id = <desc_id> 
		IF ( <is_enabled> = 1 ) 
			IF NOT GotParam frontend_desc 
				<frontend_desc> = "Unknown" 
			ENDIF 
			IF GotParam current_part 
				rgba = CASCURRENTCOLOR 
			ENDIF 
			GetUpperCaseString <frontend_desc> 
			add_roundbar_menu_item { 
				text = <UpperCaseString> 
				pad_choose_script = cas_add_item 
				pad_choose_params = { part = <part> desc_id = <desc_id> } 
				not_focusable = <not_focusable> 
				current_part = <current_part> 
				rgba = <rgba> 
				scale_highlight_text = 0 
				scale = 0.85000002384 
			} 
			RETURN cas_item_was_added = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_update_selected_cas_item 
	IF ScreenElementExists id = cas_vmenu 
		GetScreenElementChildren id = cas_vmenu 
		GetArraySize <children> 
		<index> = 0 
		BEGIN 
			( <children> [ <index> ] ) : GetTags 
			IF ( <selected> ) 
				SetScreenElementProps { 
					id = { <id> child = text } 
					rgba = [ 128 128 128 128 ] 
				} 
				SetScreenElementProps { 
					id = <id> 
					tags = { selected = 0 } 
				} 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
		cas_vmenu : GetTags 
		SetScreenElementProps { 
			id = { ( <children> [ <tag_selected_index> ] ) child = text } 
			rgba = CASCURRENTCOLOR 
		} 
		SetScreenElementProps { 
			id = ( <children> [ <tag_selected_index> ] ) 
			tags = { selected = 1 } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_set_selected_cas_item 
	IF GotParam current_part 
		SetScreenElementProps { 
			id = <container_id> 
			tags = { selected = 1 } 
		} 
	ELSE 
		SetScreenElementProps { 
			id = <container_id> 
			tags = { selected = 0 } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_highlight_cas_item 
	GetTags 
	IF ( <selected> ) 
		SetScreenElementProps { 
			id = { <id> child = text } 
			rgba = CASCURRENTCOLOR 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_unhighlight_cas_item 
	GetTags 
	IF ( <selected> ) 
		SetScreenElementProps { 
			id = { <id> child = text } 
			rgba = CASCURRENTCOLOR 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT set_cas_menu_item_index 
	<container_id> : SetTags { 
		tag_grid_x = <index> 
	} 
ENDSCRIPT

SCRIPT add_cas_menu_box border_rgba = [ 0 , 0 , 0 , 128 ] bg_rgba = [ 0 , 0 , 0 , 128 ] height = 280 
	current_menu : GetSingleTag width 
	current_menu : GetSingleTag right_edge 
	current_menu : GetSingleTag menu_pos 
	<scale> = ( ( ( <height> / 8 ) * PAIR(0.00000000000, 1.00000000000) ) + PAIR(1.00000000000, 0.00000000000) ) 
	CreateScreenElement { 
		parent = current_menu_anchor 
		type = SpriteElement 
		texture = white2 
		rgba = <border_rgba> 
		scale = <scale> 
		pos = ( <menu_pos> + PAIR(-8.00000000000, -7.00000000000) ) 
		just = [ left top ] 
		z_priority = -1 
	} 
	CreateScreenElement { 
		parent = current_menu_anchor 
		type = SpriteElement 
		texture = white2 
		rgba = <border_rgba> 
		scale = <scale> 
		pos = ( <menu_pos> + <right_edge> + PAIR(0.00000000000, -7.00000000000) ) 
		just = [ left top ] 
		z_priority = -1 
	} 
	<scale> = ( ( ( <width> / 8 ) * PAIR(1.00000000000, 0.00000000000) ) + ( ( <height> / 8 ) * PAIR(0.00000000000, 1.00000000000) ) ) 
	CreateScreenElement { 
		parent = current_menu_anchor 
		type = SpriteElement 
		texture = white2 
		rgba = <bg_rgba> 
		scale = <scale> 
		pos = ( <menu_pos> + PAIR(0.00000000000, -7.00000000000) ) 
		just = [ left top ] 
		z_priority = -1 
	} 
ENDSCRIPT

SCRIPT cas_rehighlight_menu_item 
	Theme_GetPauseBarColor return_value = bar_color 
	Theme_GetHighlightedTextColorNew return_value = on_color 
	SetScreenElementProps { 
		id = { <id> child = text } 
		rgba = <on_color> 
		shadow_rgba = [ 128 , 128 , 128 , 0 ] 
	} 
	SetScreenElementProps { 
		id = { <id> child = roundbar_middle } 
		rgba = <bar_color> 
	} 
	RunScriptOnScreenElement id = { <id> child = roundbar_highlight } roundbar_menu_highlight 
ENDSCRIPT

in_net_setup_flow = 0 
SCRIPT cas_post_load 
	set_default_temporary_profiles 
ENDSCRIPT

SCRIPT jump_to_edit_skater 
	restore_previous_progressive_mode 
	dialog_box_exit 
	create_edit_skater_menu came_from_main_menu 
ENDSCRIPT

SCRIPT cas_rotate_skater_left 
	IF InSplitScreenGame 
		GetCurrentSkaterProfileIndex 
		<skater> = <CurrentSkaterProfileIndex> 
	ELSE 
		<skater> = 0 
	ENDIF 
	KillSpawnedScript name = cas_rotate_skater 
	SpawnScript cas_rotate_skater params = { angle = -3 button = L1 } 
ENDSCRIPT

SCRIPT cas_rotate_skater_right 
	IF InSplitScreenGame 
		GetCurrentSkaterProfileIndex 
		<skater> = <CurrentSkaterProfileIndex> 
	ELSE 
		<skater> = 0 
	ENDIF 
	KillSpawnedScript name = cas_rotate_skater 
	SpawnScript cas_rotate_skater params = { angle = 3 button = R1 } 
ENDSCRIPT

SCRIPT cas_rotate_skater 
	BEGIN 
		IF ControllerPressed <button> 
			skater : Rotate y = <angle> 
		ELSE 
			BREAK 
		ENDIF 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT check_option_is_enabled 
	<ret_val> = 1 
	IF GotParam is_enabled_script 
		<is_enabled_script> <is_enabled_params> 
		<ret_val> = <is_enabled> 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	IF SkaterIsCustom player = <CurrentSkaterProfileIndex> 
		RETURN is_enabled = 1 
	ELSE 
		RETURN is_enabled = 0 
	ENDIF 
ENDSCRIPT

SCRIPT check_option_is_visible 
	<ret_val> = 1 
	IF GotParam is_visible_script 
		<is_visible_script> <is_visible_params> 
		IF ( <is_enabled> = 0 ) 
			<ret_val> = 0 
		ENDIF 
	ENDIF 
	IF GotParam is_visible_script2 
		<is_visible_script2> <is_visible_params2> 
		IF ( <is_enabled> = 0 ) 
			<ret_val> = 0 
		ENDIF 
	ENDIF 
	IF NOT GotParam ignore_modifier 
		IF GotParam modifier 
			<ret_val> = 0 
		ENDIF 
	ENDIF 
	IF isTrue worst_case_cas_debug 
		RETURN is_visible = 1 
	ENDIF 
	RETURN is_visible = <ret_val> 
ENDSCRIPT

SCRIPT get_skater_unlocked 
	GetSkaterProfileInfoByName name = <name> 
	IF GotParam is_hidden 
		IF ( <is_hidden> = 0 ) 
			RETURN is_unlocked = 1 
		ELSE 
			RETURN is_unlocked = 0 
		ENDIF 
	ELSE 
		RETURN is_unlocked = 1 
	ENDIF 
ENDSCRIPT

SCRIPT get_has_weird_head 
	<retVal> = 0 
	GetCurrentSkaterProfileIndex 
	IF GetPlayerAppearancePart player = <CurrentSkaterProfileIndex> part = skater_m_head 
		GetActualCASOptionStruct part = skater_m_head desc_id = <desc_id> 
		IF GotParam is_weird_head 
			<retVal> = 1 
		ENDIF 
	ENDIF 
	RETURN has_weird_head = <retVal> 
ENDSCRIPT

SCRIPT get_has_hoody_up 
	<retVal> = 0 
	GetCurrentSkaterProfileIndex 
	IF GetPlayerAppearancePart player = <CurrentSkaterProfileIndex> part = skater_m_torso 
		GetActualCASOptionStruct part = skater_m_torso desc_id = <desc_id> 
		IF GotParam is_hoody_up 
			<retVal> = 1 
		ENDIF 
	ENDIF 
	RETURN has_hoody_up = <retVal> 
ENDSCRIPT

SCRIPT check_for_incompatible_pants 
	<found_incompatible> = 0 
	GetCurrentSkaterProfileIndex 
	GetSkaterSex player = <CurrentSkaterProfileIndex> 
	IF ( <is_male> ) 
		IF GotParam female 
			RETURN incompatible = <found_incompatible> 
		ENDIF 
		GetPlayerAppearancePart player = <CurrentSkaterProfileIndex> part = skater_m_legs 
		<incompatible_array> = incompatible_male_pants 
	ELSE 
		IF GotParam male 
			RETURN incompatible = <found_incompatible> 
		ENDIF 
		GetPlayerAppearancePart player = <CurrentSkaterProfileIndex> part = skater_f_legs 
		<incompatible_array> = incompatible_female_pants 
	ENDIF 
	GetArraySize <incompatible_array> 
	<index> = 0 
	BEGIN 
		IF ChecksumEquals a = <desc_id> b = ( <incompatible_array> [ <index> ] ) 
			<found_incompatible> = 1 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN incompatible = <found_incompatible> 
ENDSCRIPT

SCRIPT check_for_incompatible_shirts 
	<has_incompatible_shirt> = 0 
	GetCurrentSkaterProfileIndex 
	GetSkaterSex player = <CurrentSkaterProfileIndex> 
	IF ( <is_male> ) 
		<player_part> = skater_m_torso 
	ELSE 
		<player_part> = skater_f_torso 
	ENDIF 
	GetPlayerAppearancePart player = <CurrentSkaterProfileIndex> part = <player_part> 
	GetActualCASOptionStruct part = <player_part> desc_id = <desc_id> 
	IF GotParam not_with_skeleton_arms 
		<has_incompatible_shirt> = 1 
	ENDIF 
	RETURN incompatible = <has_incompatible_shirt> 
ENDSCRIPT

SCRIPT cas_item_is_visible 
	<is_visible> = 1 
	IF GotParam hidden 
		<is_visible> = 0 
	ENDIF 
	IF GotParam only_with 
		get_current_skater_name 
		GetArraySize <only_with> 
		<index> = 0 
		<is_visible> = 0 
		BEGIN 
			IF ChecksumEquals a = <name> b = ( <only_with> [ <index> ] ) 
				<is_visible> = 1 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	IF GotParam unlock_flag 
		<is_visible> = 0 
		IF GetGlobalFlag flag = <unlock_flag> 
			<is_visible> = 1 
			<secret_color> = secret_color 
		ENDIF 
	ENDIF 
	IF GotParam only_if_unlocked 
		<is_visible> = 0 
		get_skater_unlocked name = <only_if_unlocked> 
		IF ( <is_unlocked> = 1 ) 
			<is_visible> = 1 
		ENDIF 
	ENDIF 
	IF GotParam only_with_neversoft_skater 
		<is_visible> = 0 
		get_is_neversoft_skater 
		IF ( <is_neversoft_skater> = 1 ) 
			<is_visible> = 1 
		ENDIF 
	ENDIF 
	IF GotParam not_with_weird_head 
		get_has_weird_head 
		IF ( <has_weird_head> = 1 ) 
			<is_visible> = 0 
		ENDIF 
	ENDIF 
	IF GotParam not_with_hoody_up 
		get_has_hoody_up 
		IF ( <has_hoody_up> = 1 ) 
			<is_visible> = 0 
		ENDIF 
	ENDIF 
	IF GotParam not_with_female 
		GetCurrentSkaterProfileIndex 
		GetSkaterSex player = <CurrentSkaterProfileIndex> 
		IF NOT ( <is_male> ) 
			<is_visible> = 0 
		ENDIF 
	ENDIF 
	IF GotParam not_with_certain_shirts 
		check_for_incompatible_shirts 
		IF ( <incompatible> ) 
			<is_visible> = 0 
		ENDIF 
	ENDIF 
	IF GotParam not_with_certain_male_pants 
		check_for_incompatible_pants male 
		IF ( <incompatible> ) 
			<is_visible> = 0 
		ENDIF 
	ENDIF 
	IF GotParam not_with_certain_female_pants 
		check_for_incompatible_pants female 
		IF ( <incompatible> ) 
			<is_visible> = 0 
		ENDIF 
	ENDIF 
	IF isTrue worst_case_cas_debug 
		<is_visible> = 1 
	ENDIF 
	RETURN is_visible = <is_visible> secret_color = <secret_color> 
ENDSCRIPT

SCRIPT get_part_current_desc_id 
	GetPlayerAppearancePart player = 0 part = <part> 
	RETURN current_desc_id = <desc_id> 
ENDSCRIPT

cas_cam_angle = 0 
cas_cam_target_x = 0 
cas_cam_target_y = 0 
cas_cam_target_z = 0 
cas_cam_pos_x = 0 
cas_cam_pos_y = 0 
cas_cam_pos_z = 0 
SCRIPT cas_setup_rotating_camera 
	skater : Obj_GetID 
	default_target_vector = VECTOR(-40.00000000000, 45.00000000000, 0.00000000000) default_pos_vector = VECTOR(-60.00000000000, 60.00000000000, 80.00000000000) 
	IF GotParam cam_anim 
		SWITCH <cam_anim> 
			CASE head 
				GetBonePosRelative bone = bone_head 
				target_vector = ( <pos> + VECTOR(-12.00000000000, 2.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(-15.00000000000, -3.00000000000, 30.00000000000) ) 
			CASE HeadTop 
				GetBonePosRelative bone = bone_head 
				target_vector = ( <pos> + VECTOR(-12.00000000000, 2.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(4.00000000000, 25.00000000000, 21.00000000000) ) 
			CASE Torso 
				GetBonePosRelative bone = bone_chest 
				target_vector = ( <pos> + VECTOR(-14.00000000000, 0.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(-5.00000000000, 9.00000000000, 35.00000000000) ) 
			CASE adjtorso 
				GetBonePosRelative bone = bone_chest 
				target_vector = ( <pos> + VECTOR(-20.00000000000, 0.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(-5.00000000000, 10.00000000000, 54.00000000000) ) 
			CASE Accessory 
				GetBonePosRelative bone = bone_stomach_lower 
				target_vector = ( <pos> + VECTOR(-23.00000000000, -5.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(-10.00000000000, 5.00000000000, 60.00000000000) ) 
			CASE waist 
				GetBonePosRelative bone = bone_pelvis 
				target_vector = ( <pos> + VECTOR(-20.00000000000, 0.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(0.00000000000, 11.00000000000, 50.00000000000) ) 
			CASE legs 
				GetBonePosRelative bone = bone_knee_r 
				target_vector = ( <pos> + VECTOR(-26.00000000000, 0.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(-15.00000000000, 5.00000000000, 55.00000000000) ) 
			CASE pants 
				GetBonePosRelative bone = bone_pelvis 
				target_vector = ( <pos> + VECTOR(-23.00000000000, 25.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(0.00000000000, 0.00000000000, 55.00000000000) ) 
			CASE Deck 
				target_vector = VECTOR(-40.00000000000, 20.00000000000, 0.00000000000) pos_vector = VECTOR(-55.00000000000, 25.00000000000, 50.00000000000) 
			CASE LegTattoo 
				GetBonePosRelative bone = bone_knee_r 
				target_vector = ( <pos> + VECTOR(-23.00000000000, -12.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(0.00000000000, 0.00000000000, 45.00000000000) ) 
			CASE AdjLegTattoo 
				GetBonePosRelative bone = bone_knee_r 
				target_vector = ( <pos> + VECTOR(-16.00000000000, 0.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(0.00000000000, 5.00000000000, 45.00000000000) ) 
			CASE Feet 
				GetBonePosRelative bone = bone_foot_r 
				target_vector = ( <pos> + VECTOR(-17.00000000000, 0.00000000000, 3.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(0.00000000000, 15.00000000000, 47.00000000000) ) 
			CASE calves 
				GetBonePosRelative bone = bone_ankle_r 
				target_vector = ( <pos> + VECTOR(-14.00000000000, 0.00000000000, 0.00000000000) ) 
				pos_vector = ( <pos> + VECTOR(0.00000000000, 5.00000000000, 45.00000000000) ) 
			CASE fullbody 
				target_vector = <default_target_vector> pos_vector = <default_pos_vector> 
			CASE selectSkater 
				target_vector = VECTOR(43.00000000000, 47.00000000000, 0.00000000000) pos_vector = VECTOR(-10.00000000000, 60.00000000000, 105.00000000000) 
			CASE story_mode_menu 
				target_vector = VECTOR(60.00000000000, 120.00000000000, -300.00000000000) pos_vector = VECTOR(-280.00000000000, 80.00000000000, -245.00000000000) 
			CASE create_modes_camera 
				target_vector = VECTOR(-400.00000000000, 150.00000000000, 0.00000000000) pos_vector = VECTOR(-280.00000000000, 120.00000000000, -245.00000000000) 
			CASE careerCam 
				target_vector = VECTOR(-8.00000000000, 65.00000000000, 0.00000000000) pos_vector = VECTOR(-15.00000000000, 65.00000000000, 40.00000000000) 
			DEFAULT 
				target_vector = <default_target_vector> pos_vector = <default_pos_vector> 
		ENDSWITCH 
	ELSE 
		target_vector = <default_target_vector> pos_vector = <default_pos_vector> 
	ENDIF 
	change cas_cam_target_x = ( <target_vector> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	change cas_cam_target_y = ( <target_vector> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
	change cas_cam_target_z = ( <target_vector> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	change cas_cam_pos_x = ( <pos_vector> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	change cas_cam_pos_y = ( <pos_vector> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
	change cas_cam_pos_z = ( <pos_vector> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	CalcPosRelative 
	get_rotated_vector vector = <target_vector> 
	t_off = ( <vector> + <pos> ) 
	get_rotated_vector vector = <pos_vector> 
	p_off = ( <vector> + <pos> ) 
	killskatercamanim all 
	PlaySkaterCamAnim { skater = 0 
		targetID = world 
		targetOffset = <t_off> 
		positionOffset = <p_off> 
		play_hold 
		frames = 1 
		virtual_cam 
	} 
ENDSCRIPT

SCRIPT GetBonePosRelative bone = bone_head id = skater 
	<id> : obj_GetBonePosition bone = <bone> 
	<id> : Obj_GetScaling 
	<id> : Obj_GetPosition 
	rx = ( ( <pos> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) - <X> ) * ( <scaling> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) ) 
	ry = ( ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) - <y> ) * ( <scaling> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) ) 
	rz = ( ( <pos> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) - <z> ) * ( <scaling> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) ) 
	abs a = <rx> 
	rx = <a> 
	abs a = <ry> 
	ry = <a> 
	abs a = <rz> 
	rz = <a> 
	pos = ( <rx> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <ry> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <rz> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	RETURN pos = <pos> 
ENDSCRIPT

SCRIPT abs a = 1 
	IF ( <a> < 0 ) 
		a = ( <a> * -1 ) 
		RETURN a = <a> 
	ELSE 
		IF ( <a> > 0 ) 
			RETURN a = <a> 
		ELSE 
			RETURN a = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT get_rotated_vector 
	X = ( <vector> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	y = ( <vector> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
	z = ( <vector> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	cos cas_cam_angle 
	sin cas_cam_angle 
	x2 = ( <X> * <cos> - <z> * <sin> ) 
	y2 = <y> 
	z2 = ( <X> * <sin> + <z> * <cos> ) 
	vector = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <x2> + VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <y2> + VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <z2> ) 
	RETURN vector = <vector> 
ENDSCRIPT

SCRIPT kill_cas_pull_back_camera 
	change pulled_back = 0 
	KillSpawnedScript name = cas_pull_back_camera 
ENDSCRIPT

SCRIPT spawn_cas_pull_back_camera 
	IF ( pulled_back = 0 ) 
		kill_cas_pull_back_camera 
		SpawnScript cas_pull_back_camera params = { cam_anim = <cam_anim> } 
	ENDIF 
ENDSCRIPT

pulled_back = 0 
SCRIPT cas_pull_back_camera 
	change pulled_back = 1 
	pulse_blur 
	cas_setup_rotating_camera 
	wait 0.30000001192 seconds 
	BEGIN 
		IF isPS2 
			IF NOT ControllerPressed R2 
				BREAK 
			ENDIF 
		ENDIF 
		IF IsXbox 
			IF NOT ControllerPressed black 
				BREAK 
			ENDIF 
		ENDIF 
		IF IsNgc 
			IF NOT ControllerPressed z 
				BREAK 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	cas_setup_rotating_camera cam_anim = <cam_anim> 
	wait 0.30000001192 seconds 
	change pulled_back = 0 
ENDSCRIPT

edit_skater_head_options = [ 
	{ 
		group_title = "HEAD OPTIONS" 
		text = #"Face" 
		submenu = face_menu 
		cam_angle = 0 
	} 
	{ 
		text = #"Skin Color" 
		submenu = skin_color_menu 
		modifier 
		part_parent = #"Face" 
	} 
	{ 
		text = #"Choose Facial Hair" 
		submenu = jaw_menu 
		is_visible_script = currently_editing_male 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_head hat ] menu_parts = [ skater_m_jaw ] } 
		cam_angle = 0 
		list 
		modifier 
		part_parent = #"Face" 
	} 
	{ 
		text = #"Facial Hair Color" 
		submenu = facial_hair_color_menu 
		is_visible_script = currently_editing_male 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { 
			part = skater_m_jaw 
			extra_script = check_for_lockout_parts 
			extra_script_params = { blah = 1 parts = [ skater_m_head hat ] menu_parts = [ skater_m_jaw ] } 
		} 
		cam_angle = 0 
		modifier 
		part_parent = #"Face" 
	} 
	{ 
		text = #"Head Tattoo" 
		short_text = #"Choose Tattoo" 
		submenu = head_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { 
			parts = [ skater_m_head skater_f_head hat skater_m_hair skater_f_hair ] 
			menu_parts = [ head_tattoo ] 
		} 
		cam_anim_sub = HeadTop 
		cam_angle = 180 
	} 
	{ 
		text = #"Eyes" 
		submenu = eyes_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_head skater_f_head glasses hat ] menu_parts = [ eyes ] } 
	} 
	{ 
		text = #"Hair" 
		submenu = hair_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { 
			parts = [ skater_m_head skater_f_head hat ] 
			menu_parts = [ skater_m_hair skater_f_hair ] 
		} 
	} 
	{ 
		text = #"Hair Color" 
		submenu = hair_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { 
			parts = [ skater_m_hair skater_f_hair ] 
			extra_script = check_if_parts_editable 
			extra_script_params = { parts = [ skater_m_hair skater_f_hair ] } 
		} 
		modifier 
		part_parent = #"Hair" 
	} 
	{ 
		text = #"Hats" 
		submenu = hats_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_head skater_f_head ] menu_parts = [ hat ] } 
	} 
	{ 
		text = #"Hat Color" 
		submenu = hat_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ hat ] } 
		modifier 
		part_parent = #"Hats" 
	} 
	{ 
		text = #"Hat Logo" 
		submenu = hat_logo_menu 
		is_enabled_script = check_if_part_logoable 
		is_enabled_params = { parts = [ hat ] } 
		list 
		modifier 
		part_parent = #"Hats" 
	} 
	{ 
		text = #"Choose Hat Hair" 
		submenu = hat_hair_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { 
			part = hat 
			extra_script = check_for_lockout_parts 
			extra_script_params = { parts = [ hat skater_m_head skater_f_head ] menu_parts = [ skater_m_hat_hair skater_f_hat_hair ] } 
		} 
		list 
		modifier 
		part_parent = #"Hats" 
	} 
	{ 
		text = #"Hat Hair Color" 
		submenu = hat_hair_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { 
			parts = [ skater_m_hat_hair skater_f_hat_hair ] 
			extra_script = check_for_lockout_parts 
			extra_script_params = { parts = [ hat skater_m_head skater_f_head ] menu_parts = [ skater_m_hat_hair skater_f_hat_hair ] } 
		} 
		modifier 
		part_parent = #"Hats" 
	} 
	{ 
		text = #"Glasses" 
		submenu = glasses_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_head skater_f_head hat ] menu_parts = [ glasses ] } 
		cam_angle = 0 
	} 
	{ 
		text = #"Glasses Color" 
		submenu = glasses_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ glasses ] } 
		cam_angle = 0 
		modifier 
		part_parent = #"Glasses" 
	} 
] 
edit_skater_torso_options = [ 
	{ 
		group_title = "TORSO OPTIONS" 
		text = #"Shirt Style" 
		submenu = shirt_style_menu 
	} 
	{ 
		text = #"Shirt main Color" 
		submenu = shirt_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] } 
		modifier 
		part_parent = #"Shirt Style" 
	} 
	{ 
		text = #"Shirt second Color" 
		submenu = sleeve_color_menu 
		is_enabled_script = check_if_sleeve_colorable 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] } 
		modifier 
		part_parent = #"Shirt Style" 
	} 
	{ 
		text = #"Choose Front Logo" 
		submenu = front_logo_menu 
		is_enabled_script = check_if_part_logoable 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] } 
		cam_angle = 0 
		cam_anim_sub = Torso 
		list 
		modifier 
		part_parent = #"Shirt Style" 
	} 
	{ 
		text = #"Adjust Front Logo" 
		submenu = front_logo_pos_menu 
		is_enabled_script = check_if_part_logoable 
		is_enabled_params = { 
			parts = [ skater_m_torso skater_f_torso ] 
			extra_script = check_if_part_editable 
			extra_script_params = { part = front_logo } 
		} 
		cam_angle = 0 
		modifier 
		part_parent = #"Shirt Style" 
	} 
	{ 
		text = #"Choose Back Logo" 
		submenu = back_logo_menu 
		is_enabled_script = check_if_part_back_logoable 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] } 
		cam_angle = 180 
		cam_anim_sub = Torso 
		list 
		modifier 
		part_parent = #"Shirt Style" 
	} 
	{ 
		text = #"Adjust Back Logo" 
		submenu = back_logo_pos_menu 
		is_enabled_script = check_if_part_back_logoable 
		is_enabled_params = { 
			parts = [ skater_m_torso skater_f_torso ] 
			extra_script = check_if_part_editable 
			extra_script_params = { part = back_logo } 
		} 
		cam_angle = 180 
		modifier 
		part_parent = #"Shirt Style" 
	} 
	{ 
		text = #"Chest Tattoo" 
		short_text = #"choose tattoo" 
		submenu = chest_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ chest_tattoo ] } 
		cam_anim_sub = Torso 
		cam_angle = 0 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = chest_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = chest_tattoo } 
		cam_anim_sub = Torso 
		cam_angle = 0 
		modifier 
		part_parent = #"Chest Tattoo" 
	} 
	{ 
		text = #"Back Tattoo" 
		short_text = #"choose tattoo" 
		submenu = back_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ back_tattoo ] } 
		cam_anim_sub = Torso 
		cam_angle = 180 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = back_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = back_tattoo } 
		cam_anim_sub = Torso 
		cam_angle = 180 
		modifier 
		part_parent = #"Back Tattoo" 
	} 
	{ 
		text = #"L Sleeve Tattoo" 
		short_text = #"choose tattoo" 
		submenu = left_sleeve_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ left_sleeve_tattoo ] } 
	} 
	{ 
		text = #"L Arm Tattoo 1" 
		short_text = #"choose tattoo" 
		submenu = left_bicep_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ left_bicep_tattoo ] } 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = left_bicep_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = left_bicep_tattoo } 
		modifier 
		part_parent = #"L Arm Tattoo 1" 
	} 
	{ 
		text = #"L Arm Tattoo 2" 
		short_text = #"choose tattoo" 
		submenu = left_forearm_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ left_forearm_tattoo ] } 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = left_forearm_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = left_forearm_tattoo } 
		modifier 
		part_parent = #"L Arm Tattoo 2" 
	} 
	{ 
		text = #"R Sleeve Tattoo" 
		short_text = #"choose tattoo" 
		submenu = right_sleeve_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ right_sleeve_tattoo ] } 
	} 
	{ 
		text = #"R Arm Tattoo 1" 
		short_text = #"choose tattoo" 
		submenu = right_bicep_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ right_bicep_tattoo ] } 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = right_bicep_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = right_bicep_tattoo } 
		cam_anim_sub = adjtorso 
		modifier 
		part_parent = #"R Arm Tattoo 1" 
	} 
	{ 
		text = #"R Arm Tattoo 2" 
		short_text = #"choose tattoo" 
		submenu = right_forearm_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ right_forearm_tattoo ] } 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = right_forearm_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = right_forearm_tattoo } 
		modifier 
		part_parent = #"R Arm Tattoo 2" 
	} 
	{ 
		text = #"Elbow Pads" 
		submenu = elbowpads_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ elbowpads ] } 
	} 
	{ 
		text = #"Elbow Pad Color" 
		submenu = elbowpads_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ elbowpads ] } 
		modifier 
		part_parent = #"Elbow Pads" 
	} 
	{ 
		text = #"Left Accessory" 
		short_text = #"choose accessory" 
		submenu = accessory1_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ accessory1 ] } 
		cam_anim_sub = Accessory 
	} 
	{ 
		text = #"Accessory Color" 
		submenu = accessory1_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ accessory1 ] } 
		cam_anim_sub = Accessory 
		modifier 
		part_parent = #"Left Accessory" 
	} 
	{ 
		text = #"Right Accessory" 
		short_text = #"choose accessory" 
		submenu = accessory2_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ accessory2 ] } 
		cam_anim_sub = Accessory 
	} 
	{ 
		text = #"Accessory Color" 
		submenu = accessory2_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ accessory2 ] } 
		cam_anim_sub = Accessory 
		modifier 
		part_parent = #"Right Accessory" 
	} 
	{ 
		text = #"Gloves" 
		submenu = hands_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ skater_m_hands skater_f_hands ] } 
		cam_anim_sub = Accessory 
	} 
	{ 
		text = #"Gloves Color" 
		submenu = hands_color_menu 
		is_enabled_script = check_if_hands_selected 
		cam_anim_sub = Accessory 
		modifier 
		part_parent = #"Gloves" 
	} 
	{ 
		text = #"Misc items" 
		submenu = accessory3_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ accessory3 ] } 
	} 
	{ 
		text = #"Misc items Color" 
		submenu = accessory3_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ accessory3 ] } 
		modifier 
		part_parent = #"Misc items" 
	} 
	{ 
		text = #"Backpack" 
		submenu = backpack_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] menu_parts = [ skater_m_backpack skater_f_backpack ] } 
	} 
	{ 
		text = #"Pack Color" 
		submenu = pack_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ skater_m_backpack skater_f_backpack ] } 
		modifier 
		part_parent = #"Backpack" 
	} 
] 
edit_skater_leg_options = [ 
	{ 
		group_title = "LEG OPTIONS" 
		text = #"Pants" 
		submenu = pants_menu 
	} 
	{ 
		text = #"Pants Color" 
		submenu = pants_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ skater_m_legs skater_f_legs ] } 
		group = legs_items 
		modifier 
		part_parent = #"Pants" 
	} 
	{ 
		text = #"L Leg Tattoo" 
		short_text = #"choose tattoo" 
		submenu = left_leg_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_legs skater_f_legs ] menu_parts = [ left_leg_tattoo ] } 
		cam_anim_sub = LegTattoo 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = left_leg_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = left_leg_tattoo } 
		cam_anim_sub = AdjLegTattoo 
		modifier 
		part_parent = #"L Leg Tattoo" 
	} 
	{ 
		text = #"R Leg Tattoo" 
		short_text = #"choose tattoo" 
		submenu = right_leg_tattoo_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_legs skater_f_legs ] menu_parts = [ right_leg_tattoo ] } 
		cam_anim_sub = LegTattoo 
	} 
	{ 
		text = #"Adjust tattoo" 
		submenu = right_leg_tattoo_pos_menu 
		is_enabled_script = check_if_part_editable 
		is_enabled_params = { part = right_leg_tattoo } 
		cam_anim_sub = AdjLegTattoo 
		modifier 
		part_parent = #"R Leg Tattoo" 
	} 
	{ 
		text = #"Knee Pads" 
		submenu = kneepads_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_legs skater_f_legs ] menu_parts = [ kneepads ] } 
		cam_anim_sub = legs 
	} 
	{ 
		text = #"Knee Pad Color" 
		submenu = kneepads_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ kneepads ] } 
		cam_anim_sub = legs 
		modifier 
		part_parent = #"Knee Pads" 
	} 
	{ 
		text = #"Socks" 
		submenu = socks_menu 
		cam_anim_sub = Feet 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_legs skater_f_legs shoes ] menu_parts = [ socks ] } 
	} 
	{ 
		text = #"Socks Color" 
		submenu = socks_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ socks ] } 
		cam_anim_sub = Feet 
		modifier 
		part_parent = #"Socks" 
	} 
	{ 
		text = #"Shoes" 
		submenu = shoes_menu 
		is_enabled_script = check_for_lockout_parts 
		is_enabled_params = { parts = [ skater_m_legs skater_f_legs shoes ] menu_parts = [ shoes ] } 
		cam_anim_sub = Feet 
	} 
	{ 
		text = #"Shoe Color" 
		submenu = shoe_color_menu 
		is_enabled_script = check_if_part_colorable 
		is_enabled_params = { parts = [ shoes ] } 
		cam_anim_sub = Feet 
		modifier 
		part_parent = #"Shoes" 
	} 
	{ 
		text = #"Shoelace Color" 
		submenu = shoe_laces_color_menu 
		is_enabled_script = check_if_sleeve_colorable 
		is_enabled_params = { parts = [ shoes ] } 
		cam_anim_sub = Feet 
		modifier 
		part_parent = #"Shoes" 
	} 
] 
edit_skater_deck_options = [ 
	{ 
		group_title = "DECK OPTIONS" 
		text = #"Deck Graphic" 
		submenu = deck_graphic_menu 
	} 
	{ 
		text = #"Grip Tape" 
		submenu = grip_tape_style_menu 
	} 
	{ 
		text = #"Wheel Color" 
		submenu = wheel_color_menu 
	} 
] 
edit_skater_scaling_options = skateshop_scaling_options 

