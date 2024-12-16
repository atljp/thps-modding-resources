
skater_select_light0_heading = 60 
skater_select_light1_heading = -190 
skater_rot_angle = 0 
main_menu_return_to_createamodes = 0 
SCRIPT wait_and_pause_skater time = 10 
	BEGIN 
		IF ObjectExists id = skater 
			wait <time> gameframes 
			IF NOT GotParam dont_pause_music 
				PauseMusic 1 
			ENDIF 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT SkateshopAI stopskateshopstreams = 1 
	no_board = no_board 
	SkaterInit NoEndRun ReturnControl NoAnims no_board = <no_board> 
	stream_repetition = 4 
	TurnOffSpecialItem 
	IF ( ( LevelIs load_boardshop ) | ( LevelIs load_cas ) ) 
		UnpausePhysics 
	ELSE 
		PausePhysics 
	ENDIF 
	ClearExceptions 
	SetQueueTricks NoTricks 
	DisablePlayerInput 
	SetRollingFriction 10000 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	skater : unhide 
	skater : Obj_MoveToNode name = trg_playerrestart NoReset Orient 
	skater : Rotate y = 190 
	IF GotParam BlendOK 
		Obj_WaitAnimFinished 
	ELSE 
		BlendperiodOut 0 
	ENDIF 
	IF GotParam CAS_Screen 
		IF ( <is_male> = 1 ) 
			<name> = editskater_male 
			TurnOffSpecialItem 
		ELSE 
			SWITCH <name> 
				CASE steamer 
					
					<name> = editskater_male 
				DEFAULT 
					<name> = editskater_female 
					
			ENDSWITCH 
		ENDIF 
	ELSE 
	ENDIF 
	IF GotParam Credits 
		<name> = neversoft 
	ENDIF 
	IF ( <name> = custom ) 
		IF ( <is_male> = 0 ) 
			<name> = editskater_female 
		ENDIF 
	ENDIF 
	
	stream_freq = 0 
	stream_freq = RANDOM_RANGE PAIR(0.00000000000, 7.00000000000) 
	IF NOT ( <stream_repetition> > 3 ) 
		<stream_repetition> = ( <stream_repetition> + 1 ) 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		RANDOM(1) 
		RANDOMCASE RANDOMEND PlayAnim Anim = Ped_M_Idle1 
		
	ELSE 
		IF ObjectExists id = ss_play_level 
			Obj_WaitAnimFinished 
			RANDOM(1) 
			RANDOMCASE RANDOMEND PlayAnim Anim = Ped_M_Idle1 
			
		ELSE 
			RANDOM(1, 1, 1, 1, 1) 
				RANDOMCASE PlayAnim Anim = Ped_M_Idle1 
				RANDOMCASE PlayAnim Anim = FrontEnd_1 
				RANDOMCASE PlayAnim Anim = FrontEnd_2 
				RANDOMCASE PlayAnim Anim = FrontEnd_3 
				RANDOMCASE PlayAnim Anim = FrontEnd_4 
			RANDOMEND 
		ENDIF 
	ENDIF 
	GetTags 
	IF ( <stopskateshopstreams> = 0 ) 
		IF ( <stream_freq> = 1 ) 
			IF ( <stream_repetition> > 2 ) 
				StopStream 
				PlaySkaterStream Type = "SSIntro" 
				stream_repetition = 0 
			ENDIF 
		ENDIF 
	ENDIF 
	Obj_WaitAnimFinished 
	BEGIN 
		wait 1 frame 
		PlayAnim Anim = Ped_M_Idle1 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT start_internet_game 
	memcard_menus_cleanup 
	InitPrefsBeenox 
	SetNetworkMode LAN_MODE 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = SS_MenuCam play_hold 
	MakeSkaterGoto SkateshopAI Params = { NoSFX } 
	SetMemThreadSafe off 
	KillSpawnedScript name = Skateshop_Slideshow 
	SpawnScript attract_mode_timer 
	SpawnSecondControllerCheck 
	wait 5 gameframe 
	kill_start_key_binding 
	select_xbox_multiplayer { change_gamemode = change_gamemode_net } 
ENDSCRIPT

SCRIPT make_new_skateshop_menu 
	SetScreenElementProps { id = root_window 
		replace_handlers 
		event_handlers = [ 
			{ pad_start main_menu_start_pressed } 
		] 
	} 
	make_new_menu <...> 
ENDSCRIPT

SCRIPT main_menu_start_pressed 
ENDSCRIPT

SCRIPT skateshop_transition menu_anim = animate_out 
	RunScriptOnScreenElement id = current_menu_anchor <menu_anim> callback = skateshop_transition2 callback_params = <...> 
ENDSCRIPT

SCRIPT skateshop_transition2 
	IF GotParam cam_anim 
		
		PlaySkaterCamAnim skater = 0 name = <cam_anim> 
	ENDIF 
	IF GotParam came_from_main_menu 
		<new_menu_script> came_from_main_menu 
	ELSE 
		<new_menu_script> 
	ENDIF 
ENDSCRIPT

SCRIPT main_menu_add_item { parent = current_menu 
		font = small 
		highlight_bar_scale = PAIR(2.00000000000, 0.69999998808) 
		highlight_bar_pos = PAIR(97.00000000000, -7.00000000000) 
		text_just = [ center center ] 
		focus_script = main_menu_focus 
		unfocus_script = main_menu_unfocus 
		text_pos = PAIR(95.00000000000, -5.00000000000) 
		dims = PAIR(200.00000000000, 20.00000000000) 
		pad_choose_script = nullscript 
	} 
	IF GotParam not_focusable 
		CreateScreenElement { 
			Type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			event_handlers = [ { focus <focus_script> Params = <focus_params> } 
				{ unfocus <unfocus_script> Params = <unfocus_params> } 
				{ pad_choose <pad_choose_script> Params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
			] 
			replace_handlers 
			not_focusable 
		} 
	ELSE 
		CreateScreenElement { 
			Type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			event_handlers = [ { focus <focus_script> Params = <focus_params> } 
				{ unfocus <unfocus_script> Params = <unfocus_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	<anchor_id> = <id> 
	IF NOT GotParam no_sound 
		SetScreenElementProps id = <anchor_id> event_handlers = [ { pad_choose generic_menu_pad_choose_sound } 
			{ pad_choose <pad_choose_script> Params = <pad_choose_params> } 
			{ pad_start generic_menu_pad_choose_sound } 
			{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
		] 
	ELSE 
		SetScreenElementProps id = <anchor_id> event_handlers = [ { pad_choose <pad_choose_script> Params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
		] 
	ENDIF 
	IF GotParam mark_first_input 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_choose mark_first_input_received } 
				{ pad_choose generic_menu_pad_choose_sound } 
				{ pad_choose <pad_choose_script> Params = <pad_choose_params> } 
				{ pad_start mark_first_input_received } 
				{ pad_start generic_menu_pad_choose_sound } 
				{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam not_focusable 
		text_rgba = [ 60 60 60 75 ] 
		CreateScreenElement { 
			Type = TextElement 
			parent = <anchor_id> 
			font = <font> 
			text = <text> 
			scale = <scale> 
			pos = <text_pos> 
			just = <text_just> 
			rgba = <text_rgba> 
			not_focusable 
		} 
	ELSE 
		Theme_GetUnhighlightedTextColor return_value = text_rgba 
		CreateScreenElement { 
			Type = TextElement 
			parent = <anchor_id> 
			id = <text_id> 
			font = <font> 
			text = <text> 
			scale = <scale> 
			pos = <text_pos> 
			just = <text_just> 
			rgba = <text_rgba> 
		} 
	ENDIF 
	IF GotParam max_width 
		truncate_string id = <id> max_width = <max_width> 
	ENDIF 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = <anchor_id> 
		texture = de_highlight_bar 
		pos = <highlight_bar_pos> 
		scale = <highlight_bar_scale> 
		just = [ center center ] 
		rgba = <bar_rgba> 
		alpha = 0 
		z_priority = 3 
	} 
ENDSCRIPT

SCRIPT make_main_menu_item { 
		focus_script = main_menu_item_focus 
		dims = PAIR(300.00000000000, 18.00000000000) 
	} 
	make_theme_menu_item <...> no_highlight_bar 
ENDSCRIPT

SCRIPT main_menu_item_focus 
	GetTags 
	IF GotParam attract_timer 
	ENDIF 
	theme_item_focus <...> 
ENDSCRIPT

SCRIPT main_menu_focus 
	GetTags 
	DoScreenElementMorph id = { <id> child = 0 } rgba = [ 0 0 0 128 ] 
	IF ObjectExists id = park_menu_up_arrow 
		generic_menu_update_arrows { 
			up_arrow_id = park_menu_up_arrow 
			down_arrow_id = park_menu_down_arrow 
		} 
	ENDIF 
	IF GotParam attract_timer 
	ENDIF 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		alpha = 1 
	} 
ENDSCRIPT

SCRIPT main_menu_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	DoScreenElementMorph id = { <id> child = 0 } rgba = <text_rgba> 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		alpha = 0 
	} 
ENDSCRIPT

launch_to_createatrick = 0 
main_menu_spinning = 0 
SCRIPT main_menu_exit 
	IF ( ( main_menu_spinning = 1 ) | ( spin_menu_input_enabled = 0 ) ) 
		RETURN 
	ELSE 
		change main_menu_spinning = 1 
	ENDIF 
	KillSpawnedScript name = TemporarilyDisableInput 
	SetButtonEventMappings block_menu_input 
	IF NOT GotParam hold_camera 
		skater : reset_model_lights 
		skater : PausePhysics 
		skater : CancelRotateDisplay 
		play_no_skater_cam 
	ENDIF 
	KillSpawnedScript name = attract_mode_timer 
	IF GotParam change_cas_from_main 
		change entered_cas_from_main = 1 
	ENDIF 
	IF NOT GotParam ignore_second_controller 
		StopSecondControllerCheck 
	ENDIF 
	IF GotParam kill_clouds 
		IF ObjectExists id = cloud_anchor 
			DestroyScreenElement id = cloud_anchor 
		ENDIF 
	ENDIF 
	IF GotParam set_cat_mode_flag 
		change launch_to_createatrick = 1 
	ELSE 
		change launch_to_createatrick = 0 
	ENDIF 
	IF NOT GotParam no_spin_animation 
		MakeSkaterGoto SpinMenuSkaterAction Params = { spin } 
		SpawnScript Menu_SFX_Wheel_Click_Long 
		<time> = 0.25000000000 
		<angle> = ( spin_menu_angle + 179 ) 
		DoScreenElementMorph id = current_menu rot_angle = <angle> time = <time> 
		spin_menu_spin_geometry rot_angle = <angle> spin_time = <time> no_wait 
		wait <time> seconds 
		<angle> = ( <angle> + 179 ) 
		<time> = 0.25000000000 
		IF ScreenElementExists id = current_menu_anchor 
			main_menu_loading_screen <...> 
		ENDIF 
		DoScreenElementMorph id = current_menu rot_angle = <angle> time = <time> 
		spin_menu_spin_geometry rot_angle = <angle> spin_time = <time> no_wait 
		wait <time> seconds 
	ELSE 
		play_no_skater_cam 
		spin_menu_visible on = 0 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	change main_menu_spinning = 0 
	SetButtonEventMappings unblock_menu_input 
	IF GotParam new_menu_script 
		<new_menu_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT main_menu_loading_screen 
	fadetoblack on time = ( <time> * 0.80000001192 ) alpha = 1.00000000000 parent = current_menu_anchor id = screenfader z_priority = 5000 
ENDSCRIPT

SCRIPT play_no_skater_cam 
	KillSkaterCamAnim all 
	SetActiveCamera id = SkaterCam0 
	PlaySkaterCamAnim skater = 0 name = mainmenu_camera03 play_hold 
ENDSCRIPT

SCRIPT make_mainmenu_3d_plane id = bg_plane parent = current_menu_anchor z_priority = -500 model = "UI_bg\\UI_bg.mdl" scale = VECTOR(2.09999990463, 2.20000004768, 2.09999990463) pos = PAIR(320.00000000000, 225.00000000000) 
	IF ScreenElementExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
	IF ScreenElementExists id = <parent> 
		SetScreenElementLock off id = <parent> 
		CreateScreenElement { 
			parent = <parent> 
			Type = Element3d 
			id = <id> 
			model = <model> 
			TexDictOffset = 20 
			pos = <pos> 
			CameraZ = <z_priority> 
			scale = <scale> 
			Tilt = 0 
		} 
	ELSE 
		
	ENDIF 
ENDSCRIPT

current_attract_movie = 0 
SCRIPT attract_mode_timer 
	<anim_wait_time> = 10 
	<attract_wait_time> = 20 
	BEGIN 
		wait <anim_wait_time> seconds 
		IF NOT ( spin_menu_skater_idling ) 
			change spin_menu_skater_idling = 1 
			change spin_menu_skater_transitioning = 1 
		ENDIF 
		wait <attract_wait_time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT reset_attract_mode_timer 
	KillSpawnedScript name = attract_mode_timer 
	SpawnScript attract_mode_timer 
ENDSCRIPT

in_options_menu = 0 
SCRIPT check_cheat_from_keyboard 
	GetTextElementString id = keyboard_current_string 
	IF NOT GotParam cancel 
		TryCheatString string = <string> 
	ENDIF 
	destroy_onscreen_keyboard 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT story_options_change_level 
	dialog_box_exit 
	load_mainmenu_textures_to_main_memory unload 
	restore_start_key_binding 
	SetGlobalFlag flag = CAREER_STARTED 
	LoadCurrentChapter 
ENDSCRIPT

SCRIPT create_select_goals_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	skater : unhide 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	play_no_skater_cam 
	kill_start_key_binding 
	make_new_themed_sub_menu title = "SELECT GOALS" 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	SetScreenElementProps { id = current_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back Params = { callback = select_goals_menu_exit new_menu_script = create_createamodes_menu } } 
		] 
	} 
	GoalEditor : GetNumEditedGoals 
	IF ( <NumGoals> = 0 ) 
		text = #"Create New Goals" 
	ELSE 
		text = #"Play Current Goals" 
	ENDIF 
	theme_menu_add_item { text = <text> 
		pad_choose_script = select_goals_menu_exit 
		pad_choose_params = { new_menu_script = launch_select_skater_menu } 
		centered 
	} 
	IF ( <NumGoals> > 0 ) 
		theme_menu_add_item { text = #"Load Goals" 
			pad_choose_script = select_goals_menu_exit 
			pad_choose_params = { new_menu_script = prompt_launch_cag_menu_load } 
			centered 
		} 
		theme_menu_add_item { text = #"Nuke All Goals" 
			pad_choose_script = select_goals_menu_exit 
			pad_choose_params = { new_menu_script = prompt_nuke_goals } 
			last_menu_item = last_menu_item 
			centered 
		} 
	ELSE 
		theme_menu_add_item { text = #"Load Goals" 
			pad_choose_script = select_goals_menu_exit 
			pad_choose_params = { new_menu_script = prompt_launch_cag_menu_load } 
			last_menu_item = last_menu_item 
			centered 
		} 
	ENDIF 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = goal_icon 
	ENDIF 
	FireEvent Type = focus target = current_menu_anchor 
	IF GotParam from_skater_select 
		SpawnScript shadow_skater_script2 Params = { make_it_safe } 
	ENDIF 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT prompt_launch_cag_menu_load 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	skater : hide 
	create_dialog_box { title = "Load Goals" 
		text = #"Warning !\\nAny unsaved changes to your current CREATED GOALS will be lost.\\nContinue ?" 
		pos = PAIR(320.00000000000, 240.00000000000) 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_scale = 1 
		buttons = [ { font = small text = "Yes" pad_choose_script = launch_load_created_goals_from_select_goals_menu } 
			{ font = small text = "No" pad_choose_script = no_launch_cag_menu_load } 
		] 
	} 
ENDSCRIPT

SCRIPT no_launch_cag_menu_load 
	dialog_box_exit 
	skater : unhide 
	create_select_goals_menu 
ENDSCRIPT

SCRIPT prompt_nuke_goals 
	skater : hide 
	menu_confirm_quit back_script = nuke_goals_deny no_script = nuke_goals_deny yes_script = nuke_goals_confirm title = "CLEAR GOALS?" 
ENDSCRIPT

SCRIPT nuke_goals_confirm 
	dialog_box_exit 
	select_goals_menu_exit new_menu_script = nuke_all_goals 
ENDSCRIPT

SCRIPT nuke_goals_deny 
	dialog_box_exit 
	create_select_goals_menu 
ENDSCRIPT

SCRIPT select_goals_menu_exit 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT

SCRIPT nuke_all_goals 
	GoalEditor : NukeAllGoals 
	create_select_goals_menu 
ENDSCRIPT

SCRIPT launch_ss_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_ss_menu <...> 
ENDSCRIPT

SCRIPT ss_initialization 
	skater : add_skater_to_world 
	UnPauseSkaters 
	MakeSkaterGoto SkateshopAI Params = { BlendOK } 
	change cas_cam_angle = 154 
ENDSCRIPT

SCRIPT create_ss_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	ss_initialization 
	cas_setup_rotating_camera cam_anim = careerCam 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	GetGameMode 
	SWITCH <GameMode> 
		CASE career 
			<menu_title> = #"STORY MODE" 
		CASE freeskate 
			IF InSplitScreenGame 
				IF ( <currentSkaterProfileIndex> = 1 ) 
					<menu_title> = #"PLAYER TWO" 
				ELSE 
					<menu_title> = #"PLAYER ONE" 
				ENDIF 
			ELSE 
				<menu_title> = #"FREE SKATE" 
			ENDIF 
		CASE net 
			IF isxbox 
				IF ( network_connection_type = internet ) 
					<menu_title> = #"THUG 2 ONLINE" 
				ELSE 
					<menu_title> = #"NETWORK PLAY" 
				ENDIF 
			ELSE 
				<menu_title> = #"THUG 2 ONLINE" 
			ENDIF 
		CASE singlesession 
			<menu_title> = #"SINGLE SESSION" 
		CASE creategoals 
			<menu_title> = #"CREATE GOALS" 
		CASE classic 
			<menu_title> = #"CLASSIC MODE" 
		DEFAULT 
			<menu_title> = #"SKATESHOP" 
	ENDSWITCH 
	IF GameModeEquals is_net 
		IF isxbox 
			IF ( network_connection_type = internet ) 
				<menu_title> = #"THUG 2 ONLINE" 
			ELSE 
				<menu_title> = #"NETWORK PLAY" 
			ENDIF 
		ELSE 
			<menu_title> = #"THUG 2 ONLINE" 
		ENDIF 
	ENDIF 
	IF ( launch_to_createatrick = 1 ) 
		<menu_title> = #"CREATE TRICKS" 
	ENDIF 
	make_new_roundbar_menu { 
		title = <menu_title> 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = ss_menu_exit new_menu_script = launch_select_skater_menu reset_skater = 0 } 
	} 
	create_helper_text = generic_helper_text 
	kill_start_key_binding 
	GetCurrentSkaterProfileIndex 
	IF InSplitScreenGame 
		IF ( <currentSkaterProfileIndex> = 1 ) 
			add_roundbar_menu_item { text = #"Ready" 
				id = ss_play_level 
				pad_choose_script = ss_menu_exit 
				pad_choose_params = { new_menu_script = launch_level_select_menu player_two } 
			} 
		ELSE 
			add_roundbar_menu_item { text = #"Ready" 
				id = ss_play_level 
				pad_choose_script = ss_menu_exit 
				pad_choose_params = { new_menu_script = player_1_ready } 
			} 
		ENDIF 
	ELSE 
		IF GameModeEquals is_net 
			IF IsInternetGameHost 
				add_roundbar_menu_item { text = #"Ready" 
					id = ss_play_level 
					pad_choose_script = ss_menu_exit 
					pad_choose_params = { new_menu_script = create_network_select_games_menu play_cam } 
				} 
			ELSE 
				IF ( network_connection_type = internet ) 
					add_roundbar_menu_item { text = #"Ready" 
						id = ss_play_level 
						pad_choose_script = ss_menu_exit 
						pad_choose_params = { new_menu_script = select_internet_play } 
					} 
				ELSE 
					add_roundbar_menu_item { text = #"Ready" 
						id = ss_play_level 
						pad_choose_script = ss_menu_exit 
						pad_choose_params = { new_menu_script = select_lan_play } 
					} 
				ENDIF 
			ENDIF 
		ELSE 
			RemoveParameter callback 
			add_roundbar_menu_item { text = #"Play Level" 
				id = ss_play_level 
				pad_choose_script = ss_menu_exit 
				pad_choose_params = { new_menu_script = launch_level_select_menu <...> } 
			} 
		ENDIF 
	ENDIF 
	add_roundbar_menu_item { text = #"Edit Tricks" 
		pad_choose_script = ss_menu_exit 
		pad_choose_params = { new_menu_script = create_edit_tricks_menu from_ss_menu hide_bg = 1 } 
	} 
	IF ( ( GameModeEquals is_creategoals ) | ( GameModeEquals is_singlesession ) ) 
		add_roundbar_menu_item { text = #"Difficulty" 
			pad_choose_script = ss_menu_exit 
			pad_choose_params = { new_menu_script = create_gamemode_difficulty_menu from_ss_menu = 1 } 
		} 
	ENDIF 
	IF InSplitScreenGame 
		IF ( <currentSkaterProfileIndex> = 0 ) 
			add_roundbar_menu_item { text = #"Difficulty" 
				pad_choose_script = ss_menu_exit 
				pad_choose_params = { new_menu_script = create_gamemode_difficulty_menu from_ss_menu = 1 } 
			} 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_classic 
		GetInitialsString 
		FormatText textname = initials_string "Update Initials: %i" i = <string> 
		add_roundbar_menu_item { text = <initials_string> 
			pad_choose_script = ss_menu_exit 
			pad_choose_params = { new_menu_script = high_scores_menu_enter_initials from_ss_menu = 1 } 
		} 
	ENDIF 
	IF GameModeEquals is_net 
		IF isps2 
			IF IsTrue AllowLanPlay 
				IF ( network_connection_type = internet ) 
					ui_string = "internet" 
				ELSE 
					ui_string = "lan" 
				ENDIF 
				add_roundbar_menu_item { text = "Connection:" 
					id = menu_connection 
					pad_choose_script = toggle_net_connection_type 
					pad_choose_params = { new_menu_script = <new_menu_script> } 
				} 
				CreateScreenElement { 
					Type = ContainerElement 
					parent = menu_connection 
				} 
				CreateScreenElement { 
					Type = TextElement 
					parent = menu_connection 
					id = connection_type_string 
					text = <ui_string> 
					font = small 
					rgba = [ 60 60 60 100 ] 
					scale = 1 
					pos = PAIR(200.00000000000, -3.00000000000) 
					just = [ left top ] 
					z_priority = 5 
				} 
			ENDIF 
			IF IsOnline 
				GetPreferenceChecksum pref_type = network device_type 
				SWITCH <checksum> 
					CASE device_sony_modem 
					CASE device_usb_modem 
						add_roundbar_menu_item { 
							text = "Hang Up Modem" 
							id = menu_network_select_hang_up 
							pad_choose_script = disconnect_from_internet 
						} 
				ENDSWITCH 
			ENDIF 
		ENDIF 
		add_roundbar_menu_item { 
			text = "Online Preferences" 
			id = menu_network_options 
			pad_choose_script = ss_menu_exit 
			pad_choose_params = { new_menu_script = create_network_options_menu } 
		} 
	ENDIF 
	roundbar_menu_finish 
ENDSCRIPT

network_connection_type = internet 
SCRIPT toggle_net_connection_type 
	GetCurrentSkaterProfileIndex 
	GetGameMode 
	SWITCH network_connection_type 
		CASE lan 
			SetNetworkMode INTERNET_MODE 
			change network_connection_type = internet 
			SetScreenElementProps id = connection_type_string text = "internet" 
		CASE internet 
			SetNetworkMode LAN_MODE 
			change network_connection_type = lan 
			SetScreenElementProps id = connection_type_string text = "lan" 
	ENDSWITCH 
	IF InSplitScreenGame 
		IF ( <currentSkaterProfileIndex> = 1 ) 
			SetScreenElementProps { 
				id = ss_play_level 
				event_handlers = [ { pad_choose ss_menu_exit Params = { new_menu_script = launch_level_select_menu player_two } } ] 
				replace_handlers 
			} 
		ELSE 
			SetScreenElementProps { 
				id = ss_play_level 
				event_handlers = [ { pad_choose ss_menu_exit Params = { new_menu_script = player_1_ready } } ] 
				replace_handlers 
			} 
		ENDIF 
	ELSE 
		IF GameModeEquals is_net 
			IF isxbox 
				SetScreenElementProps { 
					id = ss_play_level 
					event_handlers = [ { pad_choose ss_menu_exit Params = { new_menu_script = create_network_select_games_menu play_cam } } ] 
					replace_handlers 
				} 
			ELSE 
				IF ( network_connection_type = internet ) 
					SetScreenElementProps { 
						id = ss_play_level 
						event_handlers = [ { pad_choose ss_menu_exit Params = { new_menu_script = chose_internet } } ] 
						replace_handlers 
					} 
				ELSE 
					SetScreenElementProps { 
						id = ss_play_level 
						event_handlers = [ { pad_choose ss_menu_exit Params = { new_menu_script = launch_network_select_lan_games_menu } } ] 
						replace_handlers 
					} 
				ENDIF 
			ENDIF 
		ELSE 
			SetScreenElementProps { 
				id = ss_play_level 
				event_handlers = [ { pad_choose ss_menu_exit Params = { new_menu_script = launch_level_select_menu <...> } } ] 
				replace_handlers 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT player_1_ready 
	load_second_skater_profile 
	launch_select_skater_menu second_player 
ENDSCRIPT

SCRIPT ss_menu_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam hide_bg 
		play_no_skater_cam 
	ENDIF 
	IF GotParam new_menu_script 
		<new_menu_script> <...> animate_in = 1 
	ENDIF 
	IF OnXbox 
		IF GameModeEquals is_net 
			IF ( <new_menu_script> = launch_select_skater_menu ) 
				SetNetworkMode 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT launch_select_skater_menu 
	pulse_blur speed = 2 start = 255 
	spin_menu_visible on = 0 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF LevelIs Load_MainMenu 
		IF ( goto_secret_shop = 2 ) 
			wait 1 gameframe 
			change goto_secret_shop = 0 
		ENDIF 
	ENDIF 
	SetMenuPadMappings [ active use_as_first ] 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	create_select_skater_menu <...> 
ENDSCRIPT

SCRIPT create_select_skater_menu reset_skater = 1 cam_anim = selectSkater 
	IF NOT GotParam no_reload_textures 
		load_select_skater_textures_to_main_memory 
	ENDIF 
	ss_initialization 
	cas_setup_rotating_camera cam_anim = <cam_anim> 
	ResetComboRecords 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		Type = ContainerElement 
		parent = root_window 
		id = select_skater_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	AssignAlias id = select_skater_anchor alias = current_menu_anchor 
	create_helper_text { 
		helper_text_elements = [ 
			{ text = "\\b6/\\b5=Select" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bo=Load Skater" } 
		] 
	} 
	Theme_GetHighlightBarColor return_value = bg_color 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		id = menu_bar 
		texture = de_highlight_bar 
		pos = PAIR(0.00000000000, 24.00000000000) 
		rgba = <bg_color> 
		just = [ left top ] 
		scale = PAIR(5.00000000000, 2.90000009537) 
		alpha = 0.60000002384 
		z_priority = -2 
	} 
	create_select_skater_hmenu 
	kill_start_key_binding 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = star 
		pos = PAIR(5.00000000000, 52.00000000000) 
		scale = 0.50000000000 
		alpha = 0.40000000596 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = star 
		pos = PAIR(590.00000000000, 52.00000000000) 
		scale = 0.50000000000 
		alpha = 0.40000000596 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_1 
		pos = PAIR(0.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_2 
		pos = PAIR(80.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_3 
		pos = PAIR(164.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_4 
		pos = PAIR(248.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_5 
		pos = PAIR(330.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_6 
		pos = PAIR(414.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_7 
		pos = PAIR(500.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = current_menu_anchor 
		texture = strip_8 
		pos = PAIR(584.00000000000, 30.00000000000) 
		scale = 1.29999995232 
		rgba = [ 10 56 112 60 ] 
		just = [ left top ] 
	} 
	Theme_GetSupportPieceColor return_value = tab_color 
	CreateScreenElement { 
		Type = ContainerElement 
		parent = current_menu_anchor 
		id = tab_anchor 
		pos = PAIR(310.00000000000, 88.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = tab_anchor 
		texture = goal_tab 
		rgba = <tab_color> 
		scale = PAIR(2.75000000000, 1.79999995232) 
		pos = PAIR(340.00000000000, 80.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = -1 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = tab_anchor 
		texture = goal_tab 
		rgba = [ 0 0 0 50 ] 
		scale = PAIR(2.75000000000, 1.79999995232) 
		pos = PAIR(330.00000000000, 80.00000000000) 
		just = [ left top ] 
		rot_angle = 180 
		z_priority = -5 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
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
		Type = SpriteElement 
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
		Type = SpriteElement 
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
		Type = TextElement 
		parent = current_menu_anchor 
		id = select_skater_name 
		text = "" 
		font = testtitle 
		pos = PAIR(350.00000000000, 120.00000000000) 
		scale = 1.62999999523 
		just = [ left top ] 
		rgba = [ 85 , 30 , 0 , 128 ] 
	} 
	IF ObjectExists id = stats_block_anchor_parent 
		DestroyScreenElement id = stats_block_anchor_parent 
	ENDIF 
	CreateScreenElement { 
		Type = ContainerElement 
		parent = current_menu_anchor 
		id = stats_block_anchor_parent 
		pos = PAIR(245.00000000000, 190.00000000000) 
		just = [ left top ] 
		scale = 1.00000000000 
	} 
	stats_menu_create_stats_block parent = stats_block_anchor_parent not_focusable on = on pos = PAIR(0.00000000000, 0.00000000000) scale = 0.85000002384 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = select_skater_anchor 
		texture = thug_2 
		pos = PAIR(490.00000000000, 170.00000000000) 
		just = [ left top ] 
		scale = 2.09999990463 
		alpha = 0.50000000000 
		z_priority = -1 
	} 
	build_big_level_select_arrows pos = PAIR(150.00000000000, 250.00000000000) scale = 1 z_priority = 0 arrow_position_shift = PAIR(185.00000000000, 0.00000000000) parent = select_skater_anchor 
	IF GotParam second_player 
		<current_skater> = hawk 
	ELSE 
		select_skater_get_current_skater_name 
		IF ChecksumEquals a = <current_skater> b = custom 
			change select_skater_needs_refresh = 0 
		ENDIF 
	ENDIF 
	FireEvent Type = focus target = select_skater_hmenu data = { child_id = <current_skater> } 
	skater : SetTags stopskateshopstreams = 0 
ENDSCRIPT

SCRIPT SkaterSelectAI stopskateshopstreams = 1 
	SkaterInit NoEndRun ReturnControl NoAnims 
	Obj_SetLightAmbientColor r = 53 g = 50 b = 60 
	Obj_SetLightDiffuseColor index = 0 r = 100 g = 115 b = 145 
	Obj_SetLightDiffuseColor index = 1 r = 5 g = 3 b = 5 
	Obj_SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
	Obj_SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
	SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
	SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
	stream_repetition = 4 
	TurnOffSpecialItem 
	SwitchOffBoard 
	ClearExceptions 
	SetQueueTricks NoTricks 
	DisablePlayerInput 
	SetRollingFriction 10000 
	Obj_MoveToNode name = SS_player_restart Orient NoReset 
	PausePhysics 
ENDSCRIPT

SCRIPT reset_model_lights 
	IF Obj_HasModelLights 
		Obj_DisableAmbientLight 
		Obj_DisableDiffuseLight index = 0 
		Obj_DisableDiffuseLight index = 1 
	ELSE 
		
	ENDIF 
ENDSCRIPT

SCRIPT create_select_skater_hmenu scale = PAIR(1.13999998569, 1.00000000000) text = "" 
	CreateScreenElement { 
		Type = ContainerElement 
		parent = current_menu_anchor 
		id = select_skater_hmenu_anchor 
		pos = PAIR(30.00000000000, 34.00000000000) 
	} 
	CreateScreenElement { 
		Type = HMenu 
		parent = select_skater_hmenu_anchor 
		id = select_skater_hmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		padding_scale = 1 
	} 
	AssignAlias id = select_skater_hmenu alias = current_menu 
	ForEachSkaterProfile do = select_skater_menu_add_hmenu_items 
	GetCurrentSkaterProfileIndex 
	IF LevelIs Load_MainMenu 
		IF ( <currentSkaterProfileIndex> = 1 ) 
			SetScreenElementProps { 
				id = select_skater_hmenu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back_sound } 
					{ pad_back select_skater_menu_back Params = { callback = back_from_player_two_select } } 
					{ pad_option ss_overwrite_warning Params = { } } 
					{ pad_option generic_menu_pad_choose_sound } 
				] 
				replace_handlers 
			} 
		ELSE 
			GetGameMode 
			SWITCH <GameMode> 
				CASE classic 
				CASE career 
					SetScreenElementProps { 
						id = select_skater_hmenu 
						event_handlers = [ { pad_back generic_menu_pad_back_sound } 
							{ pad_back select_skater_menu_back Params = { callback = create_gamemode_options_menu } } 
							{ pad_option ss_overwrite_warning Params = { } } 
							{ pad_option generic_menu_pad_choose_sound } 
						] 
						replace_handlers 
					} 
				DEFAULT 
					SetScreenElementProps { 
						id = select_skater_hmenu 
						event_handlers = [ { pad_back generic_menu_pad_back_sound } 
							{ pad_back select_skater_menu_back Params = { callback = create_main_menu } } 
							{ pad_option ss_overwrite_warning Params = { } } 
							{ pad_option generic_menu_pad_choose_sound } 
						] 
						replace_handlers 
					} 
			ENDSWITCH 
			IF ( InSplitScreenGame ) 
				SetScreenElementProps { 
					id = select_skater_hmenu 
					event_handlers = [ { pad_back change_gamemode_career } ] 
				} 
			ENDIF 
		ENDIF 
	ELSE 
		SetScreenElementProps { 
			id = select_skater_hmenu 
			event_handlers = [ { pad_back select_skater_menu_back Params = { callback = create_options_menu } } ] 
			replace_handlers 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = select_skater_hmenu 
		event_handlers = [ 
			{ pad_left level_select_arrow_blink_left Params = { wait_first } } 
			{ pad_left generic_menu_scroll_sideways_sound } 
			{ pad_right level_select_arrow_blink_right Params = { wait_first } } 
			{ pad_right generic_menu_scroll_sideways_sound } 
		] 
	} 
ENDSCRIPT

SCRIPT ss_overwrite_warning title = #"Load Skater" callback = cas_reset_skater_and_goto_menu 
	FireEvent Type = unfocus target = select_skater_hmenu 
	create_snazzy_dialog_box { 
		title = <title> 
		text = #"Warning !\\nAny unsaved changes to your current Game Progress will be lost.\\nContinue ?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = ss_cancel_load_skater } 
		buttons = [ 
			{ font = small text = #"No" pad_choose_script = ss_cancel_load_skater } 
			{ 
				font = small text = #"Yes" 
				pad_choose_script = ss_yes_load_skater 
				{ 
				} 
			} 
		] 
	} 
ENDSCRIPT

SCRIPT ss_yes_load_skater 
	GetCurrentSkaterProfileIndex 
	IF ( <currentSkaterProfileIndex> = 1 ) 
		change layer_infos_need_resetting = 1 
		edit_graphic_copy_layer_infos 
	ENDIF 
	launch_load_cas_from_select_sequence 
ENDSCRIPT

SCRIPT ss_cancel_load_skater 
	dialog_box_exit 
	SetScreenElementLock id = current_menu_anchor off 
	create_helper_text { helper_text_elements = [ { text = "\\b6/\\b5=Select" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bo=Load Skater" } 
		] 
	} 
	FireEvent Type = focus target = select_skater_hmenu 
ENDSCRIPT

SCRIPT menu_horiz_blink_arrow 
	TerminateObjectsScripts id = <arrow_id> 
	RunScriptOnScreenElement id = <arrow_id> menu_blink_arrow 
ENDSCRIPT

SCRIPT back_from_player_two_select 
	IF ( layer_infos_need_resetting = 1 ) 
		edit_graphic_reset_layer_infos 
		edit_graphic_apply_graphic_from_save 
		change layer_infos_need_resetting = 0 
	ENDIF 
	SetCurrentSkaterProfile 0 
	RefreshSkaterModel profile = 0 skater = 0 
	launch_select_skater_menu from2p 
ENDSCRIPT

SCRIPT select_skater_menu_add_hmenu_items 
	rgba = [ 0 0 0 108 ] 
	IF GotParam not_in_frontend 
		RETURN 
	ENDIF 
	IF GotParam is_secret 
		IF NOT GetGlobalFlag flag = ( <unlock_flag> + 0 ) 
			<selectable> = not_focusable 
			rgba = [ 0 0 0 60 ] 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = select_skater_hmenu 
		id = <name> 
		texture = <select_icon> 
		scale = PAIR(0.94999998808, 1.14999997616) 
		rgba = <rgba> 
		<selectable> 
		event_handlers = [ 
			{ focus select_skater_hmenu_focus Params = <...> } 
			{ unfocus select_skater_hmenu_unfocus } 
			{ pad_choose select_skater_hmenu_choose Params = <...> } 
			{ pad_start select_skater_hmenu_choose Params = <...> } 
			{ pad_choose generic_menu_pad_choose_sound } 
			{ pad_start generic_menu_pad_choose_sound } 
		] 
	} 
ENDSCRIPT

SCRIPT get_current_skater_display_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN display_name = <display_name> 
ENDSCRIPT

SCRIPT select_skater_relight_skater 
	FakeLights percent = 100 prefix = TRG_TR_Level_Light 
	skater : Obj_SetLightAmbientColor r = ( skater_ambient_color [ 0 ] ) g = ( skater_ambient_color [ 1 ] ) b = ( skater_ambient_color [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 0 r = ( skater_diffuse_color1 [ 0 ] ) g = ( skater_diffuse_color1 [ 1 ] ) b = ( skater_diffuse_color1 [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 1 r = ( skater_diffuse_color2 [ 0 ] ) g = ( skater_diffuse_color2 [ 1 ] ) b = ( skater_diffuse_color2 [ 2 ] ) 
	skater : Obj_SetLightAmbientColor r = ( skater_ambient_color [ 0 ] ) g = ( skater_ambient_color [ 1 ] ) b = ( skater_ambient_color [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 0 r = ( skater_diffuse_color1 [ 0 ] ) g = ( skater_diffuse_color1 [ 1 ] ) b = ( skater_diffuse_color1 [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 1 r = ( skater_diffuse_color2 [ 0 ] ) g = ( skater_diffuse_color2 [ 1 ] ) b = ( skater_diffuse_color2 [ 2 ] ) 
	skater : Obj_SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
	skater : Obj_SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
	SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
	SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
ENDSCRIPT

select_skater_needs_refresh = 1 
SCRIPT select_skater_hmenu_focus 
	GetTags 
	SetScreenElementProps { 
		id = <id> 
		rgba = [ 64 92 126 128 ] 
	} 
	IF LevelIs Load_MainMenu 
		select_skater_get_current_skater_name 
		GetCurrentSkaterProfileIndex 
		IF ( select_skater_needs_refresh = 1 ) 
			IF ( layer_infos_need_resetting = 1 ) 
				edit_graphic_reset_layer_infos 
				edit_graphic_apply_graphic_from_save 
				change layer_infos_need_resetting = 0 
			ENDIF 
			load_pro_skater { profile = <currentSkaterProfileIndex> skater = 0 <...> } 
		ELSE 
			change select_skater_needs_refresh = 1 
		ENDIF 
		GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
		IF ( <name> = ped ) 
			skater : Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
			skater : Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
			skater : Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
			skater : Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
			skater : Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
			skater : Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
			FakeLights percent = 0 prefix = TRG_TR_Level_Light 
		ELSE 
			select_skater_relight_skater 
		ENDIF 
		StopStream 
		MakeSkaterGoto SkateshopAI Params = { } 
		skater : SwitchOffBoard 
		get_current_skater_display_name 
		GetUpperCaseString <display_name> 
		SetScreenElementProps { 
			id = select_skater_name 
			text = <UpperCaseString> 
		} 
	ENDIF 
	IF ObjectExists id = stats_block_anchor 
		DestroyScreenElement id = stats_block_anchor 
	ENDIF 
	IF NOT ( <name> = ped ) 
		GetCurrentSkaterProfileIndex 
		GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
		SetScreenElementLock id = stats_block_anchor_parent off 
		stats_menu_create_stats_block { 
			parent = stats_block_anchor_parent 
			id = stats_block_anchor 
			not_focusable 
			on = on 
			scale = 0.85000002384 
			pos = PAIR(0.00000000000, 0.00000000000) 
		} 
	ENDIF 
	IF isxbox 
		SpawnScript TemporarilyDisableInput Params = { time = 100 } 
	ENDIF 
ENDSCRIPT

SCRIPT highlight_box_pulse 
	BEGIN 
		DoScreenElementMorph id = <id> time = 0.02999999933 scale = PAIR(1.07000005245, 1.04999995232) 
		wait 0.20000000298 second 
		DoScreenElementMorph id = <id> time = 0.02999999933 scale = PAIR(1.10000002384, 1.07000005245) 
		wait 0.20000000298 second 
	REPEAT 
ENDSCRIPT

SCRIPT select_skater_get_current_skater_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN current_skater = <name> 
ENDSCRIPT

SCRIPT select_skater_hmenu_unfocus 
	GetTags 
	generic_menu_pad_up_down_sound 
	SetScreenElementProps { 
		id = <id> 
		rgba = [ 0 , 0 , 0 , 108 ] 
	} 
	skater : reset_model_lights 
ENDSCRIPT

SCRIPT select_skater_hmenu_choose 
	GetCurrentSkaterProfileIndex 
	IF ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex> 
		RETURN 
	ENDIF 
	IF LevelIs Load_MainMenu 
		IF GotParam name 
			IF ( <name> = ped ) 
				IF NOT GotParam choose_ped 
					goto MakeSelectPedMenu Params = { ped_info = <...> } 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	cas_setup_rotating_camera cam_anim = careerCam 
	IF ObjectExists id = select_skater_anchor 
		DestroyScreenElement id = select_skater_anchor 
		restore_start_key_binding 
	ENDIF 
	load_select_skater_textures_to_main_memory unload 
	IF LevelIs Load_MainMenu 
		GetSkaterId 
		IF GotParam device_num 
			<controller_index> = <device_num> 
		ELSE 
			<controller_index> = <controller> 
		ENDIF 
		BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index> 
		BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <controller_index> 
		StopStream 
		GetCurrentSkaterProfileIndex 
		skater : Obj_SpawnScript SkateshopGO 
		IF InSplitScreenGame 
			launch_ss_menu <...> 
		ELSE 
			launch_ss_menu 
		ENDIF 
	ELSE 
		IF NOT GoalManager_HasActiveGoals 
			GoalManager_ShowGoalPoints 
		ENDIF 
		select_skater_get_current_skater_name 
		IF NOT ( <current_skater> = <name> ) 
			GetCurrentSkaterProfileIndex 
			load_pro_skater { profile = <currentSkaterProfileIndex> skater = 0 <...> } 
		ENDIF 
		GoalManager_ShowPoints 
		GoalManager_ReplaceTrickText all 
		exit_pause_menu 
	ENDIF 
	skater : SetTags stopskateshopstreams = 1 
ENDSCRIPT

SCRIPT select_skater_get_profile_info 
	GetArraySize master_skater_list 
	<index> = 0 
	BEGIN 
		IF ChecksumEquals a = ( ( master_skater_list [ <index> ] ) . name ) b = <skater_profile> 
			RETURN profile_info = ( master_skater_list [ <index> ] ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT MakeSelectPedMenu dims = PAIR(300.00000000000, 150.00000000000) pos = PAIR(322.00000000000, -2.00000000000) menu_id = sub_menu vmenu_id = sub_vmenu 
	FireEvent Type = unfocus target = select_skater_hmenu 
	SetScreenElementLock id = root_window off 
	change widest_menu_item_width = 0 
	CreateScreenElement { 
		Type = ContainerElement 
		parent = root_window 
		id = ped_menu_parts_anchor 
		dims = PAIR(640.00000000000, 150.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	Type = VScrollingMenu 
	scrolling_menu_id = sub_scrolling_menu 
	make_new_menu { 
		pos = <pos> 
		parent = ped_menu_parts_anchor 
		internal_just = [ left center ] 
		menu_id = <menu_id> 
		vmenu_id = <vmenu_id> 
		scrolling_menu_id = <scrolling_menu_id> 
		Type = <Type> 
		dims = <dims> 
		dont_allow_wrap = <dont_allow_wrap> 
		<no_menu_title> 
	} 
	DoScreenElementMorph id = <menu_id> time = 0 pos = PAIR(310.00000000000, 620.00000000000) 
	AssignAlias id = ped_menu_parts_anchor alias = current_menu_anchor 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ 
			{ pad_back BackFromPedMenu } 
			{ pad_up set_which_arrow Params = { arrow = scrolling_menu_up_arrow } } 
			{ pad_down set_which_arrow Params = { arrow = scrolling_menu_down_arrow } } 
			{ pad_up generic_menu_up_or_down_sound Params = { up } } 
			{ pad_down generic_menu_up_or_down_sound Params = { down } } 
		] 
	} 
	<num_added> = 0 
	GetArraySize ped_profile_list 
	<index> = 0 
	BEGIN 
		<add_item> = 0 
		IF GetGlobalFlag flag = ( ( ped_profile_list [ <index> ] ) . ped_group_flag ) 
			<add_item> = 1 
		ENDIF 
		IF ( <add_item> ) 
			IF StructureContains structure = ( ped_profile_list [ <index> ] ) skater_profile 
				select_skater_get_profile_info profile = ( ( ped_profile_list [ <index> ] ) . skater_profile ) 
				<info> = <profile_info> 
			ELSE 
				<info> = <ped_info> 
			ENDIF 
			theme_menu_add_item { 
				text = ( ( ped_profile_list [ <index> ] ) . display_name ) 
				focus_script = PedFocus 
				focus_params = { 
					appearance = ( ( ped_profile_list [ <index> ] ) . ped_appearance_structure ) 
					tag_texture = ( ( ped_profile_list [ <index> ] ) . tag_texture ) 
				} 
				pad_choose_script = PedChoose 
				pad_choose_params = { info = <info> controller = <controller> device_num = <device_num> } 
				centered 
				highlight_bar_scale = PAIR(1.70000004768, 0.69999998808) 
				no_bg 
			} 
			<num_added> = ( <num_added> + 1 ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( <num_added> ) 
		FakeLights percent = 100 prefix = TRG_TR_Level_Light 
		skater : Obj_SetLightAmbientColor r = 73 g = 70 b = 80 
		skater : Obj_SetLightDiffuseColor index = 0 r = 110 g = 125 b = 155 
		skater : Obj_SetLightDiffuseColor index = 1 r = 10 g = 3 b = 5 
		skater : Obj_SetLightAmbientColor r = 73 g = 70 b = 80 
		skater : Obj_SetLightDiffuseColor index = 0 r = 110 g = 125 b = 155 
		skater : Obj_SetLightDiffuseColor index = 1 r = 10 g = 3 b = 5 
		skater : Obj_SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
		skater : Obj_SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
		SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
		SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
	ENDIF 
	theme_menu_add_item { text = "Done" 
		pad_choose_script = BackFromPedMenu 
		centered 
		highlight_bar_scale = PAIR(1.70000004768, 0.69999998808) 
		no_bg 
	} 
	finish_themed_scrolling_menu pos = PAIR(360.00000000000, 8.00000000000) bg_width = 1.39999997616 
	DoScreenElementMorph id = bg_box_vmenu pos = PAIR(412.00000000000, 8.00000000000) 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	DoScreenElementMorph id = scrolling_menu_up_arrow time = 0 rgba = <on_rgba> 
	DoScreenElementMorph id = scrolling_menu_down_arrow time = 0 rgba = <on_rgba> 
	SetScreenElementLock id = ped_menu_parts_anchor off 
	create_helper_text generic_helper_text parent = ped_menu_parts_anchor helper_pos = PAIR(320.00000000000, 261.00000000000) 
	SetScreenElementLock id = ped_menu_parts_anchor on 
ENDSCRIPT

SCRIPT PedChoose 
	GetCurrentSkaterProfileIndex 
	IF ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex> 
		RETURN 
	ENDIF 
	IF ObjectExists id = ped_menu_parts_anchor 
		DestroyScreenElement id = ped_menu_parts_anchor 
	ENDIF 
	select_skater_hmenu_choose <info> choose_ped controller = <controller> device_num = <device_num> 
ENDSCRIPT

SCRIPT PedFocus 
	main_theme_focus 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = <appearance> 
	SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
	EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = { part = board desc_id = Default } 
	IF ( <currentSkaterProfileIndex> = 0 ) 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> tag_texture <tag_texture> 
		set_correct_graffiti_textures name = ped tag_texture = <tag_texture> 
	ENDIF 
	RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <controller> no_board = no_board 
	current_menu : GetTags 
	IF GotParam arrow_id 
		Theme_GetHighlightedTextColor return_value = on_rgba 
		menu_vert_blink_arrow id = <arrow_id> rgba = <on_rgba> 
	ENDIF 
ENDSCRIPT

SCRIPT BackFromPedMenu 
	IF ObjectExists id = ped_menu_parts_anchor 
		DestroyScreenElement id = ped_menu_parts_anchor 
	ENDIF 
	SetScreenElementLock id = select_skater_anchor off 
	create_helper_text { helper_text_elements = [ { text = "\\b6/\\b5=Select" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bo=Load Skater" } 
		] 
		parent = select_skater_anchor 
	} 
	SetScreenElementLock id = select_skater_anchor on 
	Debounce X time = 0.50000000000 
	FireEvent Type = focus target = select_skater_hmenu data = { child_id = 19 } 
	AssignAlias id = select_skater_anchor alias = current_menu_anchor 
ENDSCRIPT

SCRIPT SkateshopGO 
	wait 0.18000000715 seconds 
	PlaySkaterStream Type = "SSGo" 
ENDSCRIPT

SCRIPT load_second_skater_profile 
	
	SetCurrentSkaterProfile 1 
	RefreshSkaterModel profile = 1 skater = 0 
	SyncPlayer2Profile 
ENDSCRIPT

SCRIPT select_skater_menu_back 
	IF IsInternetGameHost 
		QuitGame 
		RETURN 
	ENDIF 
	IF IsJoiningInternetGame 
		QuitGame 
		RETURN 
	ENDIF 
	KillSpawnedScript name = highlight_box_pulse 
	IF ObjectExists id = select_skater_anchor 
		DestroyScreenElement id = select_skater_anchor 
		restore_start_key_binding 
	ENDIF 
	load_select_skater_textures_to_main_memory unload 
	skater : Obj_MoveToNode name = trg_playerrestart Orient NoReset 
	skater : CancelRotateDisplay 
	FakeLights percent = 100 prefix = TRG_TR_Level_Light 
	skater : SetTags stopskateshopstreams = 1 
	<callback> from_skater_select 
ENDSCRIPT

SCRIPT select_skater_menu_animate_top 
	DoMorph pos = { PAIR(0.00000000000, -120.00000000000) relative } alpha = 0 
	DoMorph time = 0.20000000298 pos = { PAIR(0.00000000000, 120.00000000000) relative } alpha = 1 
ENDSCRIPT

SCRIPT select_skater_menu_animate_stats 
	FireEvent Type = select_skater_menu_animate_stats_done 
ENDSCRIPT

SCRIPT menu_blink_arrow 
	DoMorph alpha = 0 
	wait 100 
	DoMorph time = 0.30000001192 alpha = 1 
ENDSCRIPT

SCRIPT blink_arrow 
	IF NOT ScreenElementExists id = <id> 
		RETURN 
	ENDIF 
	DoScreenElementMorph id = <id> alpha = 0 
	wait 100 
	DoScreenElementMorph id = <id> time = 0.30000001192 alpha = 1 
ENDSCRIPT

SCRIPT set_which_arrow 
	SetTags arrow_id = <arrow> 
ENDSCRIPT

SCRIPT menu_vert_blink_arrow menu_id = current_menu rgba = [ 128 128 128 128 ] 
	IF NOT ObjectExists id = <id> 
		
		RETURN 
	ENDIF 
	TerminateObjectsScripts id = <id> 
	DoScreenElementMorph { 
		id = <id> 
		alpha = 1 
	} 
	wait 1 gameframe 
	IF NOT ( ( MenuSelectedIndexIs id = <menu_id> first ) | ( MenuSelectedIndexIs id = <menu_id> last ) ) 
		SetScreenElementProps { id = <id> rgba = <rgba> } 
		RunScriptOnScreenElement id = <id> menu_blink_arrow 
	ENDIF 
ENDSCRIPT

SCRIPT launch_park_editor 
	SetGameType creategoals 
	SetCurrentGameType 
	SetParkName "" 
	BindParkEditorToController <device_num> 
	GetCurrentSkaterProfileIndex 
	BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <device_num> 
	BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <device_num> 
	main_menu_play_level2 level = load_Sk5Ed 
ENDSCRIPT

SCRIPT main_menu_play_level 
	main_menu_exit new_menu_script = main_menu_play_level2 kill_clouds <...> 
ENDSCRIPT

SCRIPT main_menu_play_level2 
	load_mainmenu_textures_to_main_memory unload 
	restore_start_key_binding 
	skater : reset_model_lights 
	change_level level = <level> 
ENDSCRIPT

SCRIPT leave_front_end 
	restore_start_key_binding 
	load_cas_textures_to_main_memory unload 
	load_mainmenu_textures_to_main_memory unload 
ENDSCRIPT

SCRIPT spawn_two_player 
	Cleanup preserve_skaters 
	LeaveServer 
	FlushDeadObjects 
	InitSkaterHeaps 
	SetServerMode 
	StartServer 
	SetJoinMode JOIN_MODE_PLAY 
	JoinServer 
	BEGIN 
		IF JoinServerComplete 
			BREAK 
		ELSE 
			wait 1 
		ENDIF 
	REPEAT 
	ScreenElementSystemCleanup 
ENDSCRIPT

SCRIPT launch_two_player 
	SetCurrentSkaterProfile 0 
	RefreshSkaterModel profile = 0 skater = 0 
	SetMenuPadMappings [ active 
		use_as_first 
	] 
	SpawnScript spawn_two_player NotSessionSpecific = 1 
ENDSCRIPT

SCRIPT enable_two_player_option 
	IF ObjectExists id = main_menu_2_player_option 
		handle_enable_two_player_option item = main_menu_2_player_option 
	ENDIF 
	IF ObjectExists id = main_menu_2_player_option2 
		handle_enable_two_player_option item = main_menu_2_player_option2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_enable_two_player_option 
	IF IsTrue DEMO_BUILD 
		RETURN 
	ENDIF 
	<item> : GetTags 
	IF ( <active> = 0 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				Theme_GetHighlightedTextColor return_value = rgba 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = <rgba> 
					z_priority = 4 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = <rgba> 
						z_priority = 4 
					} 
				ENDIF 
			ELSE 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = spin_menu_unhighlighted_text 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = spin_menu_unhighlighted_text 
						z_priority = 4 
					} 
				ENDIF 
			ENDIF 
			SetScreenElementProps { 
				id = <item> 
				tags = { active = 1 } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT disable_two_player_option 
	IF ObjectExists id = main_menu_2_player_option 
		handle_disable_two_player_option item = main_menu_2_player_option 
	ENDIF 
	IF ObjectExists id = main_menu_2_player_option2 
		handle_disable_two_player_option item = main_menu_2_player_option2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_disable_two_player_option 
	<item> : GetTags 
	IF ( <active> = 1 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				FireEvent Type = pad_up target = current_menu 
			ENDIF 
		ENDIF 
		SetScreenElementProps { 
			id = { <item> child = 0 } 
			rgba = spin_menu_disabled_text 
		} 
		IF ScreenElementExists id = { <item> child = 1 } 
			SetScreenElementProps { 
				id = { <item> child = 0 } 
				rgba = spin_menu_disabled_text 
			} 
		ENDIF 
		SetScreenElementProps { 
			id = <item> 
			tags = { active = 0 } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT enable_system_link_option 
	IF ObjectExists id = mm_multi_play 
		handle_enable_system_link_option item = mm_multi_play 
	ENDIF 
	IF ObjectExists id = mm_multi_play2 
		handle_enable_system_link_option item = mm_multi_play2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_enable_system_link_option 
	<item> : GetTags 
	IF ( <active> = 0 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				Theme_GetHighlightedTextColor return_value = rgba 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = <rgba> 
					z_priority = 4 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = <rgba> 
						z_priority = 4 
					} 
				ENDIF 
			ELSE 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = spin_menu_unhighlighted_text 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = spin_menu_unhighlighted_text 
						z_priority = 4 
					} 
				ENDIF 
			ENDIF 
			SetScreenElementProps { 
				id = <item> 
				tags = { active = 1 } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT disable_system_link_option 
	IF ObjectExists id = mm_multi_play 
		handle_disable_system_link_option item = mm_multi_play 
	ENDIF 
	IF ObjectExists id = mm_multi_play2 
		handle_disable_system_link_option item = mm_multi_play2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_disable_system_link_option 
	<item> : GetTags 
	IF ( <active> = 1 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				FireEvent Type = pad_up target = current_menu 
			ENDIF 
		ENDIF 
		SetScreenElementProps { 
			id = { <item> child = 0 } 
			rgba = spin_menu_disabled_text 
		} 
		IF ScreenElementExists id = { <item> child = 1 } 
			SetScreenElementProps { 
				id = { <item> child = 1 } 
				rgba = spin_menu_disabled_text 
			} 
		ENDIF 
		SetScreenElementProps { 
			id = <item> 
			tags = { active = 0 } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT make_mainmenu_clouds 
	
ENDSCRIPT

attract_mode_movies = [ 
	"movies\\demo_1" 
	"movies\\demo_2" 
] 

