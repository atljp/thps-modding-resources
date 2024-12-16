
controller_unplugged_frame_count = 45 
SCRIPT controller_unplugged 
	GetSkaterId 
	IF NOT LevelIs Load_MainMenu 
		IF NOT ScreenElementExists id = view_goals_root 
			IF NOT SkaterCamAnimFinished skater = <objId> 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam leaving_net_game 
		PauseGame 
		PauseMusicAndStreams 
	ENDIF 
	KillSpawnedScript name = wait_and_check_for_unplugged_controllers 
	change check_for_unplugged_controllers = 0 
	SpawnScript create_controller_unplugged_dialog params = <...> 
ENDSCRIPT

SCRIPT create_controller_unplugged_dialog pad_choose_script = controller_refresh 
	<front_end_paused> = 0 
	IF GameIsPaused 
		<front_end_paused> = 1 
	ENDIF 
	IF NOT GotParam leaving_net_game 
		IF LevelIs Load_MainMenu 
			GoalManager_DeactivateAllGoals 
			GoalManager_UninitializeAllGoals 
			PauseGame 
			PauseMusicAndStreams 1 
		ELSE 
			GoalManager_PauseAllGoals 
			PauseGame 
			PauseMusicAndStreams 1 
		ENDIF 
	ENDIF 
	wait 1 frame 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = controller_unplugged_dialog_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		priority = 10000 
		z_priority = 10000 
		event_handlers = [ 
			{ pad_choose <pad_choose_script> params = { front_end_paused = <front_end_paused> original_device_num = <device_num> } } 
			{ pad_start <pad_choose_script> params = { front_end_paused = <front_end_paused> original_device_num = <device_num> } } 
		] 
	} 
	<anchor_id> = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = white2 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		rgba = [ 40 40 90 128 ] 
		scale = PAIR(40.00000000000, 15.00000000000) 
		z_priority = 9999 
	} 
	IF GotParam leaving_net_game 
		FormatText TextName = text "Controller disconnected. Please reconnect the controller to port %i and press \\b8 to return to the main menu." i = ( <device_num> + 1 ) 
		root_window : SetTags leaving_net_game 
	ELSE 
		IF IsNGC 
			FormatText TextName = text "Please reconnect the controller to Controller Socket %i and press \\b8 to continue." i = ( <device_num> + 1 ) 
		ELSE 
			IF IsPs2 
				FormatText TextName = text "Please insert a controller into controller port %i and press \\b8 to continue." i = ( <device_num> + 1 ) 
			ELSE 
				FormatText TextName = text "Please reconnect the controller to port %i and press \\b8 to continue." i = ( <device_num> + 1 ) 
			ENDIF 
		ENDIF 
	ENDIF 
	<text_block_pos> = PAIR(320.00000000000, 200.00000000000) 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = <anchor_id> 
		pos = <text_block_pos> 
		dims = PAIR(300.00000000000, 0.00000000000) 
		allow_expansion 
		just = [ center center ] 
		font = small 
		text = <text> 
		z_priority = 10000 
	} 
	GetScreenElementDims id = <id> 
	<button_pos> = ( <text_block_pos> + ( <height> * PAIR(0.00000000000, 1.00000000000) ) ) 
	CreateScreenElement { 
		parent = <anchor_id> 
		type = TextElement 
		font = small 
		text = "OK" 
		pos = <button_pos> 
		just = [ center top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10000 
		event_handlers = [ 
			{ focus do_scale_up } 
			{ unfocus do_scale_down } 
		] 
	} 
	FireEvent type = focus target = <id> 
	FireEvent type = focus target = <anchor_id> 
ENDSCRIPT

SCRIPT controller_refresh 
	IF ( <original_device_num> = <device_num> ) 
		controller_reconnected <...> 
		IF CustomParkMode editing 
			IF NOT istrue in_create_a_goal 
				IF NOT ScreenElementExists id = dialog_box_anchor 
					IF NOT ScreenElementExists id = files_menu 
						IF NOT ScreenElementExists id = keyboard_anchor 
							IF NOT ObjectExists id = park_resize_cam 
								parked_continue_editing 
								ResetAbortAndDoneScripts 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT ( AbortScript = DefaultAbortScript ) 
				goto reload_anims_then_run_abort_script 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT controller_reconnected 
	IF NOT GotParam leaving_net_game 
		IF NOT LevelIs Load_MainMenu 
			IF NOT ScreenElementExists id = view_goals_root 
				IF NOT istrue in_create_a_goal 
					IF NOT CustomParkMode editing 
						IF NOT ScreenElementExists id = timeline_vmenu 
							Restore_skater_camera 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT GotParam leaving_net_game 
		IF ScreenElementExists id = pre_cat_menu_is_up 
			UnpauseGame 
			IF LevelIs load_nj 
				skater : Obj_MoveToNode name = TRG_G_CAT_RestartNode Orient NoReset 
			ENDIF 
			PauseGame 
			create_pre_cat_menu 
		ELSE 
			IF istrue in_create_a_goal 
				IF istrue goal_editor_placement_mode 
					Debounce X time = 0.20000000298 clear = 1 
					GoalEditor : UnPause 
					IF ObjectExists id = GoalEditorCursor 
						GoalEditorCursor : UnPause 
					ENDIF 
				ENDIF 
			ELSE 
				root_window : GetTags 
				IF ( <front_end_paused> = 0 ) 
					UnpauseGame 
					UnPauseMusicAndStreams 
				ENDIF 
				IF NOT LevelIs Load_MainMenu 
					IF NOT CustomParkMode editing 
						IF ( <menu_state> = off ) 
							FireEvent { 
								type = pad_start 
								target = root_window 
								data = { device_num = <device_num> } 
							} 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = controller_unplugged_dialog_anchor 
		DestroyScreenElement id = controller_unplugged_dialog_anchor 
	ENDIF 
	IF GotParam leaving_net_game 
		
		UnpauseGame 
		quit_network_game 
	ELSE 
		SpawnScript wait_and_check_for_unplugged_controllers 
	ENDIF 
ENDSCRIPT

SCRIPT wait_and_check_for_unplugged_controllers time = 50 
	wait <time> 
	change check_for_unplugged_controllers = 1 
ENDSCRIPT


