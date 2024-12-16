
ALWAYSPLAYMUSIC = 1 
HIDEHUD = 0 
DEVKIT_LEVELS = 1 
UI_text_shadow_offset = PAIR(1.00000000000, 1.00000000000) 
UI_text_shadow_color = [ 0 , 0 , 0 , 100 ] 
meta_button_map_ps2 = [ 
	3 
	0 
	0 
	1 
	2 
	2 
	1 
	1 
	2 
	1 
	14 
	15 
	0 
	1 
	2 
	16 
	17 
	2 
	1 
	17 
	17 
	17 
	18 
	16 
	16 
	16 
	19 
	0 
	0 
	0 
	0 
	0 
] 
meta_button_map_gamecube = [ 
	3 
	1 
	0 
	1 
	2 
	2 
	1 
	1 
	2 
	0 
	14 
	15 
	1 
	2 
	2 
	14 
	15 
	0 
	0 
	9 
	15 
	15 
	9 
	2 
	14 
	14 
	14 
	0 
	0 
	0 
	0 
	0 
] 
meta_button_map_xbox = [ 
	3 
	2 
	0 
	1 
	2 
	2 
	1 
	1 
	0 
	1 
	14 
	15 
	2 
	1 
	1 
	14 
	15 
	0 
	0 
	17 
	15 
	18 
	16 
	16 
	14 
	14 
	21 
	0 
	0 
	0 
	0 
	0 
] 
smallfont_colors = [ 
	[ 128 128 128 100 ] 
	[ 102 26 8 100 ] 
	[ 17 64 116 100 ] 
	[ 9 107 36 100 ] 
	[ 123 99 3 100 ] 
	[ 0 128 128 100 ] 
	[ 128 0 128 100 ] 
	[ 30 50 80 100 ] 
	[ 88 105 112 128 ] 
] 
dialogfont_colors = [ 
	[ 88 105 112 128 ] 
	[ 102 26 8 100 ] 
	[ 17 64 116 100 ] 
	[ 9 107 36 100 ] 
	[ 123 99 3 100 ] 
	[ 127 102 0 100 ] 
	[ 100 100 128 100 ] 
] 
SCRIPT prompt_launch_cag_pause_load 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_dialog_box { title = "Load Goals" 
		text = #"Warning !\\nAny unsaved changes to your current CREATED GOALS will be lost.\\nContinue ?" 
		pos = PAIR(320.00000000000, 240.00000000000) 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_scale = 1 
		buttons = [ { font = small text = "Yes" pad_choose_script = launch_pause_menu_load_created_goals } 
			{ font = small text = "No" pad_choose_script = no_launch_cag_pause_load } 
		] 
	} 
ENDSCRIPT

SCRIPT no_launch_cag_pause_load 
	dialog_box_exit 
	create_pause_menu 
ENDSCRIPT

SCRIPT maybe_edit_skater 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	wait 2 frames 
	create_dialog_box { title = "Edit Confirmation" 
		text = "Exit the current level to change options?" 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_scale = 1 
		pad_back_script = no_edit_skater 
		buttons = [ { font = small text = "Yes" pad_choose_script = <yes_script> pad_choose_params = <yes_params> } 
			{ font = small text = "No" pad_choose_script = no_edit_skater } 
		] 
	} 
ENDSCRIPT

SCRIPT no_edit_skater 
	dialog_box_exit 
	wait 1 frame 
	create_your_options_menu 
ENDSCRIPT

music_was_paused = 0 
inside_pause = 0 
SCRIPT kill_pause_menu_cams 
ENDSCRIPT

SCRIPT launch_restart_menu 
	generic_menu_animate_out menu = current_menu force 
	create_restart_menu 
ENDSCRIPT

SCRIPT create_restart_menu 
	hide_current_goal 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_scrolling_menu title = "RESTART" dims = PAIR(600.00000000000, 237.00000000000) pos = PAIR(229.00000000000, 80.00000000000) right_bracket_z = 1 
	IF CD 
		<callback_script> = create_pause_menu 
	ELSE 
		<callback_script> = create_debug_options_menu 
	ENDIF 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = <callback_script> } } 
		] 
	} 
	create_helper_text generic_helper_text 
	kill_start_key_binding 
	AddRestartsToMenu initial_scale = 1.00000000000 
	theme_menu_add_item text = "Done" pad_choose_script = create_debug_options_menu no_bg last_item = last_item centered = centered 
	finish_themed_scrolling_menu 
ENDSCRIPT

SCRIPT skip_to_selected_restart 
	ResetSkaters <...> 
	exit_pause_menu 
ENDSCRIPT

SCRIPT menu_confirm_quit { 
		yes_script = level_select_change_level_quit 
		no_script = menu_quit_no 
		back_script = menu_quit_no 
		title = "QUIT?" 
		text = "Are you sure?" 
		text_dims = PAIR(200.00000000000, 0.00000000000) 
		params = { } 
	} 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF NOT istrue bootstrap_build 
		create_error_box { title = <title> 
			text = <text> 
			pos = PAIR(310.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			text_dims = <text_dims> 
			pad_back_script = <back_script> 
			pad_back_params = <params> 
			buttons = [ { font = small text = "Yes" pad_choose_script = <yes_script> pad_choose_params = { level = Load_MainMenu <params> } } 
				{ font = small text = "No" pad_choose_script = <no_script> pad_choose_params = <params> } 
			] 
		} 
	ELSE 
		create_error_box { title = <title> 
			text = "Exit Demo?" 
			pos = PAIR(310.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			pad_back_script = <back_script> 
			buttons = [ { font = small text = "Yes" pad_choose_script = bootstrap_quit } 
				{ font = small text = "No" pad_choose_script = <back_script> } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT menu_confirm_quit_park_editor { 
		yes_script = launch_park_editor_save_park_sequence 
		no_script = parked_quit 
		back_script = menu_quit_no 
		title = "Save Park?" 
	} 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF IsParkUnsaved 
		IF isxbox 
			error_text = "Do you want to save your park before quitting?" 
		ELSE 
			IF isngc 
				error_text = "Do you want to save your park before quitting?" 
			ELSE 
				error_text = "Playing online or downloading a new park will cause you to lose unsaved changes to this park. Save it now?" 
			ENDIF 
		ENDIF 
		create_error_box { title = <title> 
			text = <error_text> 
			pos = PAIR(310.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			pad_back_script = <back_script> 
			buttons = [ { font = small text = "Yes" pad_choose_script = <yes_script> pad_choose_params = { level = Load_MainMenu } } 
				{ font = small text = "No" pad_choose_script = <no_script> pad_choose_params = { level = Load_MainMenu } } 
			] 
		} 
	ELSE 
		<no_script> level = Load_MainMenu 
	ENDIF 
ENDSCRIPT

SCRIPT level_select_change_level_quit 
	IF isxbox 
		DisplayLoadingScreen freeze 
	ELSE 
		DisplayLoadingScreen blank 
	ENDIF 
	GoalManager_DeactivateAllGoals 
	GoalManager_LevelUnload 
	IF GameModeEquals is_career 
		Skater : ResetSkaterToCustom 
	ELSE 
		MakeSkaterGoto SkaterInit 
	ENDIF 
	SetButtonEventMappings block_menu_input 
	RailEditor : DestroyEditedRailSectors 
	printf "leaving and destroying server" 
	chosen_leave_server 
	IF NOT GameModeEquals is_career 
		dont_end_chapter = 1 
	ENDIF 
	SetGameType career 
	SetCurrentGameType 
	SetStatOverride 
	setservermode on 
	StartServer 
	SetJoinMode JOIN_MODE_PLAY 
	printf "attempting to join server" 
	JoinServer 
	printf "waiting" 
	BEGIN 
		printf "waiting 1 frame" 
		IF JoinServerComplete 
			BREAK 
		ELSE 
			wait 1 
		ENDIF 
		printf "still waiting" 
	REPEAT 
	printf "attempting to change level" 
	level_select_change_level <...> 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT make_select_set_pro_skater_line 
	make_text_sub_menu_item text = <text> pad_choose_script = set_pro_skater pad_choose_params = <...> 
ENDSCRIPT

SCRIPT create_set_pro_skater_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_menu { menu_id = set_pro_skater_menu 
		vmenu_id = set_pro_skater_vmenu 
		menu_title = "PRO SKATERS" 
		type = VScrollingMenu 
		scrolling_menu_title_id = set_pro_skater_title 
		num_items_to_show = 6 
		dims = PAIR(200.00000000000, 180.00000000000) 
	} 
	IF LevelIs Load_MainMenu 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim name = SS_SkaterChoosing play_hold 
		SetScreenElementProps { 
			id = set_pro_skater_menu 
			event_handlers = [ { pad_back create_main_menu } ] 
			replace_handlers 
		} 
		make_text_sub_menu_item { text = "Continue" 
			pad_choose_script = skateshop_transition 
			pad_choose_params = { new_menu_script = launch_ss_menu } 
		} 
	ELSE 
		SetScreenElementProps { 
			id = set_pro_skater_menu 
			event_handlers = [ { pad_back create_test_menu } ] 
			replace_handlers 
		} 
	ENDIF 
	add_set_pro_skater_to_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT set_pro_skater 
	printf "Set pro skater here" 
	load_pro_skater { profile = 0 Skater = 0 <...> } 
	IF LevelIs Load_MainMenu 
		printf "we\'re in the skateshop" 
		launch_ss_menu 
	ELSE 
		exit_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT create_watch_cutscenes_menu back_script = create_options_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "CUTSCENES" 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = <back_script> } } 
		] 
	} 
	add_viewed_cutscenes_to_menu 
	theme_menu_add_item text = "Done" pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = <back_script> } centered last_menu_item = last_menu_item 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT has_cutscenes 
	GetCurrentLevel 
	SWITCH <level> 
		CASE load_nj 
		CASE load_ny 
		CASE load_fl 
		CASE load_sd 
		CASE load_hi 
		CASE load_vc 
		CASE load_sj 
		CASE load_ru 
			RETURN does_have_cutscenes = 1 
		DEFAULT 
			RETURN does_have_cutscenes = 0 
	ENDSWITCH 
ENDSCRIPT

SCRIPT add_viewed_cutscenes_to_menu 
	GetCurrentLevel 
	SWITCH <level> 
		CASE load_ny 
			<cutscene_list> = cutscene_unlock_list_ny 
		CASE load_fl 
			<cutscene_list> = cutscene_unlock_list_fl 
		CASE load_vc 
			<cutscene_list> = cutscene_unlock_list_vc 
		DEFAULT 
			RETURN 
	ENDSWITCH 
	GetArraySize <cutscene_list> 
	<index> = 0 
	BEGIN 
		IF NOT isngc 
			<skip_me> = 0 
		ELSE 
			IF StructureContains structure = ( ( ( <cutscene_list> ) [ <index> ] ) ) not_with_ngc 
				<skip_me> = 1 
			ELSE 
				<skip_me> = 0 
			ENDIF 
		ENDIF 
		IF GetGlobalFlag flag = ( ( ( <cutscene_list> ) [ <index> ] ) . flag ) 
			IF StructureContains structure = ( ( ( <cutscene_list> ) [ <index> ] ) ) name2 
				IF ( <skip_me> = 0 ) 
					theme_menu_add_item { 
						text = ( ( ( <cutscene_list> ) [ <index> ] ) . text ) 
						pad_choose_script = watch_cutscene 
						pad_choose_params = { name = ( ( ( <cutscene_list> ) [ <index> ] ) . name ) name2 = ( ( ( <cutscene_list> ) [ <index> ] ) . name2 ) tod_action = ( ( ( <cutscene_list> ) [ <index> ] ) . tod_action ) tod_action2 = ( ( ( <cutscene_list> ) [ <index> ] ) . tod_action2 ) tod_action3 = ( ( ( <cutscene_list> ) [ <index> ] ) . tod_action3 ) } 
						centered 
					} 
				ENDIF 
			ELSE 
				IF ( <skip_me> = 0 ) 
					theme_menu_add_item { 
						text = ( ( ( <cutscene_list> ) [ <index> ] ) . text ) 
						pad_choose_script = watch_cutscene 
						pad_choose_params = { name = ( ( ( <cutscene_list> ) [ <index> ] ) . name ) tod_action = ( ( ( <cutscene_list> ) [ <index> ] ) . tod_action ) tod_action2 = ( ( ( <cutscene_list> ) [ <index> ] ) . tod_action2 ) } 
						centered 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT watch_cutscene 
	Debounce X 2.50000000000 
	pause_menu_gradient off 
	IF GotParam tod_action 
	ENDIF 
	IF GotParam tod_action2 
	ENDIF 
	UnpauseGame 
	Debounce X 2.50000000000 
	PauseMusic 0 
	IF NOT GotParam name2 
		PlayCutscene <...> from_cutscene_menu dont_send_skater_to_hand_brake exitScript = watch_cutscene_done 
	ELSE 
		PlayCutscene { 
			name = <name> 
			from_cutscene_menu 
			dont_send_skater_to_hand_brake 
			unload_anims = 1 
			reload_anims = 0 
			unload_goals = 1 
			reload_goals = 0 
			exitScript = spawn_next_cutscene 
			exitParams = { name = <name2> from_cutscene_menu dont_send_skater_to_hand_brake tod_action = <tod_action3> unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitScript = watch_cutscene_done } 
		} 
	ENDIF 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen 
ENDSCRIPT

SCRIPT watch_cutscene_done 
	PauseGame 
	PauseMusic 1 
	Debounce X 0.50000000000 
	pause_menu_gradient on 
	create_watch_cutscenes_menu 
ENDSCRIPT

SCRIPT choose_boolean_option 
	SetPreferencesFromUI prefs = network <...> 
	create_options_menu 
ENDSCRIPT

SCRIPT back_from_boolean_menus 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_options_menu 
ENDSCRIPT

SCRIPT create_options_score_display_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "SCORE DISPLAY MODE" right_bracket_alpha = 0.00000000000 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = back_from_boolean_menus } } ] 
		replace_handlers 
	} 
	theme_menu_add_item text = "Show Players" centered id = menu_players pad_choose_script = choose_boolean_option pad_choose_params = { field = "score_display" checksum = score_players string = "Show Players" } 
	theme_menu_add_item text = "Show Teams" centered id = menu_teams pad_choose_script = choose_boolean_option pad_choose_params = { field = "score_display" checksum = score_teams string = "Show Teams" } 
	theme_menu_add_item text = "Done" pad_choose_script = back_from_boolean_menus last_menu_item = last_menu_item 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT launch_chapter_stage_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_chapter_stage_menu 
ENDSCRIPT

SCRIPT create_chapter_stage_menu 
	GetCurrentChapter 
	SetScreenElementLock id = root_window off 
	make_new_menu { 
		menu_id = chapter_stage_menu 
		vmenu_id = chapter_stage_vmenu 
		menu_title = "SET CHAPTER/STAGE" 
		helper_text = generic_helper_text_left_right 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = chapter_stage_vmenu 
		id = chapter_stage_menu_chapter_container 
		dims = PAIR(100.00000000000, 20.00000000000) 
		event_handlers = [ 
			{ focus chapter_stage_menu_focus } 
			{ unfocus chapter_stage_menu_unfocus } 
			{ pad_right chapter_stage_menu_change params = { chapter right } } 
			{ pad_left chapter_stage_menu_change params = { chapter left } } 
		] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = chapter_stage_vmenu 
		id = chapter_stage_menu_stage_container 
		dims = PAIR(100.00000000000, 20.00000000000) 
		event_handlers = [ 
			{ focus chapter_stage_menu_focus } 
			{ unfocus chapter_stage_menu_unfocus } 
			{ pad_right chapter_stage_menu_change params = { stage right } } 
			{ pad_left chapter_stage_menu_change params = { stage left } } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = chapter_stage_vmenu 
		font = small 
		text = "Done" 
		event_handlers = [ 
			{ pad_choose chapter_stage_menu_done } 
			{ focus do_scale_up } 
			{ unfocus do_scale_down } 
		] 
		rgba = [ 128 128 128 128 ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = chapter_stage_menu_chapter_container 
		font = small 
		text = "Chapter" 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = chapter_stage_menu_stage_container 
		font = small 
		text = "Stage" 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
	} 
	FormatText TextName = currentChapterText "%i" i = <chapter> 
	CreateScreenElement { 
		type = TextElement 
		parent = chapter_stage_menu_chapter_container 
		font = small 
		text = <currentChapterText> 
		just = [ right top ] 
		rgba = [ 128 128 128 128 ] 
		pos = PAIR(120.00000000000, 0.00000000000) 
	} 
	FormatText TextName = currentStageText "%i" i = <chapter> 
	CreateScreenElement { 
		type = TextElement 
		parent = chapter_stage_menu_stage_container 
		font = small 
		text = <currentStageText> 
		just = [ right top ] 
		rgba = [ 128 128 128 128 ] 
		pos = PAIR(120.00000000000, 0.00000000000) 
	} 
	FireEvent type = focus target = chapter_stage_vmenu 
ENDSCRIPT

SCRIPT chapter_stage_menu_focus 
	GetTags 
	RunScriptOnScreenElement id = { <id> child = 1 } do_scale_up 
ENDSCRIPT

SCRIPT chapter_stage_menu_unfocus 
	GetTags 
	RunScriptOnScreenElement id = { <id> child = 1 } do_scale_down 
ENDSCRIPT

SCRIPT chapter_stage_menu_change 
	GetCurrentChapter 
	<currentChapter> = <chapter> 
	IF GotParam left 
		<change> = -1 
	ELSE 
		<change> = 1 
	ENDIF 
	IF GotParam chapter 
		<currentChapter> = ( <currentChapter> + <change> ) 
		IF ( <currentChapter> < 0 ) 
			RETURN 
		ELSE 
			IF ( <currentChapter> > 30 ) 
				RETURN 
			ENDIF 
		ENDIF 
	ELSE 
		<currentStage> = ( <currentStage> + <change> ) 
		IF ( <currentStage> < 0 ) 
			RETURN 
		ELSE 
			IF ( <currentStage> > 10 ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	GetTags 
	IF GotParam chapter 
		FormatText TextName = chapterText "%i" i = <currentChapter> 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			text = <chapterText> 
		} 
	ELSE 
		FormatText TextName = stageText "%i" i = <currentStage> 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			text = <stageText> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT chapter_stage_menu_done 
	GoalManager_DeactivateAllGoals 
	GoalManager_UninitializeAllGoals 
	GoalManager_InitializeAllGoals 
	launch_cheats_menu 
ENDSCRIPT

SCRIPT menu_start_autotest 
	SetTesterScript test_advance 
	exit_pause_menu 
ENDSCRIPT

SCRIPT menu_stop_autotest 
	KillTesterScript 
	exit_pause_menu 
ENDSCRIPT

SCRIPT fake_button 
	FireEvent type = <type> source = system target = system data = { controller = 0 device_num = 0 } 
ENDSCRIPT

SCRIPT test_advance 
	BEGIN 
		<loops> = 5 
		BEGIN 
			wait 10 gameframes 
			IF IsMovieQueued 
				printf "AUTOTEST: In Cutscene/Movie/Camanim" 
				printf "AUTOTEST: Fake X" 
				fake_button type = pad_x 
				<loops> = 5 
			ELSE 
				IF NOT ScreenElementExists id = current_menu_anchor 
					printf "AUTOTEST: Menu Gone" 
					printf "AUTOTEST: Fake X and start" 
					fake_button type = pad_x 
					fake_button type = pad_down 
					<loops> = ( <loops> -1 ) 
				ELSE 
					printf "AUTOTEST: Fake Start" 
					fake_button type = pad_start 
					fake_button type = pad_down 
					<loops> = 5 
				ENDIF 
			ENDIF 
			IF ( <loops> = 0 ) 
				BREAK 
			ENDIF 
		REPEAT 
		printf "AUTOTEST: Advancing in 3 seconds" 
		wait 150 gameframes 
		printf "AUTOTEST: Advance" 
		cheats_menu_advance_stage 
	REPEAT 
ENDSCRIPT

SCRIPT launch_menu_test 
	RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_menu_test_menu 
ENDSCRIPT

boardshop_deck_price = 50 
unlock_sponsor_boards = 0 
in_boardshop = 0 
entered_skateshop_through_door = 0 
SCRIPT set_boardshop_cam 
	IF NOT GotParam no_wait 
		wait 3 gameframe 
		GoalManager_HidePoints 
	ENDIF 
	IF LevelIs load_boardshop 
		Skater : Obj_MoveToNode name = skateshop_player_restart orient 
		MakeSkaterGoto SkateShopAI params = { NoSFX CAS_Screen } 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim name = skateshop_startcam play_hold 
	ENDIF 
ENDSCRIPT

SCRIPT create_end_run_menu 
	dialog_box_exit 
	SetGameType freeskate2p 
	SetCurrentGameType 
	PauseMusicAndStreams 
	PauseGame 
	kill_start_key_binding 
	make_new_roundbar_menu title = "2 PLAYERS" 
	create_helper_text generic_helper_text_no_back 
	add_roundbar_menu_item text = "Start Game" id = menu_end_run_start_game pad_choose_script = create_network_game_options_menu pad_choose_params = { end_run } 
	add_roundbar_menu_item text = "Change Levels" id = menu_end_run_change_levels pad_choose_script = launch_level_select_menu pad_choose_params = { end_run } 
	add_roundbar_menu_item text = "Split Mode" id = menu_end_run_split_mode pad_choose_script = create_split_menu pad_choose_params = { callback_script = create_end_run_menu end_run } 
	add_roundbar_menu_item text = "Quit" id = menu_end_run_quit pad_choose_script = menu_confirm_quit pad_choose_params = { no_script = create_end_run_menu back_script = create_end_run_menu } 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_your_options_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "YOUR OPTIONS" pos = PAIR(130.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_pause_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	edit_tricks_menu_can_edit 
	IF ( <tricks_editable> = 0 ) 
		IF ( <tricks_viewable> = 1 ) 
			add_roundbar_menu_item { 
				text = "VIEW TRICKS" 
				id = menu_edit_tricks 
				pad_choose_script = create_edit_tricks_menu 
			} 
		ELSE 
			add_roundbar_menu_item { 
				text = "VIEW TRICKS" 
				id = menu_edit_tricks 
				not_focusable 
			} 
		ENDIF 
	ELSE 
		add_roundbar_menu_item { 
			text = "EDIT TRICKS" 
			id = menu_edit_tricks 
			pad_choose_script = create_edit_tricks_menu 
		} 
	ENDIF 
	IF ( <cat_shown> = 1 ) 
		IF ( <cat_active> = 0 ) 
			add_roundbar_menu_item { 
				text = "CREATE-A-TRICK" 
				id = menu_cat 
				not_focusable 
			} 
		ELSE 
			add_roundbar_menu_item { 
				text = "CREATE-A-TRICK" 
				id = menu_cat 
				pad_choose_script = create_pre_cat_menu 
			} 
		ENDIF 
	ENDIF 
	select_skater_get_current_skater_name 
	IF ( <current_skater> = custom ) 
		IF NOT LevelIs load_sk5ed_gameplay 
			add_roundbar_menu_item { 
				text = "EDIT APPEARANCE" 
				id = menu_edit_appearance 
				pad_choose_script = maybe_edit_skater 
				pad_choose_params = { yes_script = pause_launch_level yes_params = { level = load_cas } } 
			} 
		ENDIF 
	ENDIF 
	IF ( ( GameModeEquals is_career ) | ( GameModeEquals is_classic ) ) 
		add_roundbar_menu_item text = "GAME PROGRESS" id = menu_game_progress pad_choose_script = game_progress_menu_create 
	ENDIF 
	add_roundbar_menu_item text = "VIEW GAPS" id = menu_skip_to_gap pad_choose_script = launch_gap_menu 
	IF ( ( GameModeEquals is_career ) | ( GameModeEquals is_classic ) ) 
		IF Skater : IsSkaterOnVehicle 
			add_roundbar_menu_item text = "VIEW STATS" id = menu_edit_stats pad_choose_script = create_stats_menu not_focusable 
		ELSE 
			add_roundbar_menu_item text = "VIEW STATS" id = menu_edit_stats pad_choose_script = create_stats_menu 
		ENDIF 
	ENDIF 
	IF root_window : GetSingleTag no_exit_pause_menu 
		NoCustomRestarts = NoCustomRestarts 
	ENDIF 
	IF NOT GotParam NoCustomRestarts 
		IF InNetGame 
			GetPreferenceString pref_type = network auto_brake 
			IF ( <ui_string> = "Off" ) 
				set_restart_not_focusable = not_focusable 
			ENDIF 
		ENDIF 
		IF NOT isObserving 
			IF Skater : Obj_FlagSet FLAG_SKATER_KILLING 
				set_restart_not_focusable = not_focusable 
			ENDIF 
			IF Skater : Skating 
				IF Skater : OnLip 
					set_restart_not_focusable = not_focusable 
				ELSE 
					IF Skater : OnRail 
						set_restart_not_focusable = not_focusable 
					ENDIF 
				ENDIF 
			ENDIF 
			IF Skater : InAir 
				set_restart_not_focusable = not_focusable 
			ENDIF 
			IF Skater : Walk_air 
				set_restart_not_focusable = not_focusable 
			ENDIF 
			IF Skater : Walking 
				Skater : Walk_GetState 
				IF ( <State> = WALKING_HANG | <State> = WALKING_LADDER | <State> = WALKING_ANIMWAIT ) 
					set_restart_not_focusable = not_focusable 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT GameModeEquals is_career 
			IF NOT isObserving 
				add_roundbar_menu_item { 
					text = "SET RESTART" 
					id = menu_set_custom 
					pad_choose_script = menu_select 
					pad_choose_params = { menu_select_script = set_custom_restart } 
					not_focusable = <set_restart_not_focusable> 
				} 
				IF Skater : SetCustomRestart 
					add_roundbar_menu_item text = "GOTO RESTART" id = menu_skip_to_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = skip_to_custom_restart } 
				ELSE 
					add_roundbar_menu_item text = "GOTO RESTART" id = menu_skip_to_custom not_focusable 
				ENDIF 
			ELSE 
				add_roundbar_menu_item text = "SET RESTART" id = menu_set_custom not_focusable 
				add_roundbar_menu_item text = "GOTO RESTART" id = menu_skip_to_custom not_focusable 
			ENDIF 
		ENDIF 
	ENDIF 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_debug_options_menu 
	menu3d_hide 
	hide_current_goal 
	make_new_themed_option_menu title = "DEBUG OPTIONS" 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	SetScreenElementProps { id = options_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	make_theme_menu_item text = "Cheats: Debug" id = menu_cheats pad_choose_script = launch_cheats_menu 
	make_theme_menu_item text = "Goto Restart" id = menu_skip_to_restart pad_choose_script = launch_restart_menu 
	make_theme_menu_item text = "Debug Menu" id = debug_menu pad_choose_script = create_debug_menu 
	make_theme_menu_item text = "Test Menu" id = test_menu pad_choose_script = create_test_menu 
	pause_menu_gradient 
	<show_cutscene_menu> = 1 
	IF Pal 
		IF isngc 
			<show_cutscene_menu> = 0 
		ENDIF 
	ENDIF 
	IF ( <show_cutscene_menu> = 1 ) 
		IF GameModeEquals is_career 
			has_cutscenes 
			IF ( <does_have_cutscenes> = 1 ) 
				make_theme_menu_item text = "Watch Cutscenes" id = menu_watch_cutscenes pad_choose_script = create_watch_cutscenes_menu 
			ELSE 
				make_theme_menu_item text = "Watch Cutscenes" id = menu_watch_cutscenes not_focusable 
			ENDIF 
		ENDIF 
	ENDIF 
	add_music_track_text 
	FireEvent type = focus target = current_menu_anchor 
ENDSCRIPT

SCRIPT create_select_pro_menu 
	IF GotParam from_chapter_intro 
		callback = StartCurrentChapterWelcome 
	ELSE 
		callback = exit_pause_menu 
	ENDIF 
	GetCurrentChapterInfo 
	IF NOT LevelIs <level> 
		SafeCallback <...> 
		RETURN 
	ENDIF 
	IF NOT GotParam selectable_pros 
		printf "No pro list found!" 
		SetCurrentTeammateProAppearanceName 
		SafeCallback <...> 
		RETURN 
	ENDIF 
	GetArraySize <selectable_pros> 
	IF ( <array_size> = 0 ) 
		printf "Empty pro list - setting to null" 
		SafeCallback <...> 
		RETURN 
	ELSE 
		IF ( <array_size> = 1 ) 
			printf "Setting only pro found" 
			SetCurrentTeammateProAppearanceName pro = ( <selectable_pros> [ 0 ] ) 
			SafeCallback <...> 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam from_chapter_intro 
		SetUpChapterMenu 
		pad_back = nullscript 
		helpers = generic_helper_text_no_back 
	ELSE 
		pad_back = generic_menu_pad_back 
		helpers = generic_helper_text 
	ENDIF 
	make_new_roundbar_menu { 
		title = "SELECT PRO TEAMMATE" 
		pad_back_script = <pad_back> 
		pad_back_params = { callback = <callback> } 
		helper_text = <helpers> 
		additional_focus_script = focus_stats_display 
		additional_unfocus_script = unfocus_stats_display 
	} 
	pause_menu_gradient 
	index = 0 
	BEGIN 
		FormatText ChecksumName = item "menu_item_%i" i = <index> 
		GetSkaterProfileInfoByName name = ( <selectable_pros> [ <index> ] ) 
		add_roundbar_menu_item { text = <display_name> 
			id = <item> 
			pad_choose_script = select_pro_menu_choose 
			pad_choose_params = { pro = ( <selectable_pros> [ <index> ] ) <...> } 
			mark_first_input 
		} 
		<item> : SetTags name = ( <selectable_pros> [ <index> ] ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT focus_stats_display 
	GetTags 
	SetScreenElementLock id = <id> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <id> 
		id = stats_block 
		pos = PAIR(150.00000000000, 20.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = stats_block 
		id = stat_bg 
		texture = white2 
		z_priority = -4 
		scale = PAIR(31.00000000000, 27.00000000000) 
		pos = PAIR(50.00000000000, -10.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 80 ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = stats_block 
		texture = white2 
		pos = PAIR(50.00000000000, -10.00000000000) 
		rgba = [ 101 , 71 , 26 , 128 ] 
		just = [ left center ] 
		scale = PAIR(31.00000000000, 0.40000000596) 
		z_priority = -3 
	} 
	stats_menu_create_stats_block { 
		parent = stats_block 
		id = stats_block_anchor 
		not_focusable 
		on = on 
		scale = 0.85000002384 
		pos = PAIR(0.00000000000, 20.00000000000) 
		pro_name = <name> 
	} 
ENDSCRIPT

SCRIPT unfocus_stats_display 
	IF ScreenElementExists id = stats_block 
		DestroyScreenElement id = stats_block 
	ENDIF 
ENDSCRIPT

SCRIPT select_pro_menu_choose 
	IF NOT GotParam teammate_pro_appearance_name 
		script_assert "no teammate pro appearance name specified in skater profile!" 
	ENDIF 
	IF NOT ChecksumEquals a = ( skater_swapping_teammate_name ) b = none 
		SetSwappedSkaterName profile_name = <name> 
		RefreshSwappedSkaterData 
	ENDIF 
	change skater_swapping_teammate_name = <name> 
	IF MemHeapExists name = TeammatePro 
		MemPushContext TeammatePro 
		<swappable_pro_name> = TRG_Ped_TeammatePro 
		IF CompositeObjectExists name = <swappable_pro_name> 
			IF GetSkaterModelIsSwapped 
				<skater_swapped> = 1 
			ELSE 
				<skater_swapped> = 0 
			ENDIF 
			IF ( <skater_swapped> = 1 ) 
				SwapObjectModels obj_1 = Skater obj_2 = <swappable_pro_name> 
			ENDIF 
			<swappable_pro_name> : Obj_ClearGeoms 
			<swappable_pro_name> : Obj_ShadowOff 
			<swappable_pro_name> : Obj_InitModelFromProfile { 
				texDictOffset = 800 
				use_asset_manager = 0 
				struct = <teammate_pro_appearance_name> 
				buildscript = create_ped_model_from_appearance 
			} 
			<swappable_pro_name> : Obj_ResetNoSuspendCount 
			IF ( <skater_swapped> = 1 ) 
				SwapObjectModels obj_1 = Skater obj_2 = <swappable_pro_name> 
			ENDIF 
		ELSE 
			printf "Couldn\'t find teammate pro to switch" 
		ENDIF 
		MemPopContext 
	ELSE 
		script_assert "Where\'s the teammate pro heap?" 
	ENDIF 
	IF GoalManager_GoalIsActive name = BO_Goal_Gaps7 
		Skater : remove_all_anim_subsets 
		GoalManager_LoseGoal name = BO_Goal_Gaps7 
	ENDIF 
	SafeCallback <...> mark_first_input 
ENDSCRIPT


