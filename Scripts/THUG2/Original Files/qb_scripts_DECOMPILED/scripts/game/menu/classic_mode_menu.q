
classic_mode_skip_intro = 0 
SCRIPT classic_mode_menu_add_pause_options 
	add_roundbar_menu_item text = "RETRY LEVEL" id = menu_classic_retry pad_choose_script = classic_mode_retry 
	IF root_window : GetSingleTag no_exit_pause_menu 
		add_roundbar_menu_item text = "VIEW GOAL CAMERAS" id = menu_classic_goals pad_choose_script = classic_mode_view_goal_cameras 
	ENDIF 
	add_roundbar_menu_item text = "VIEW GOALS" id = menu_classic_goals_list pad_choose_script = classic_mode_view_goals 
ENDSCRIPT

SCRIPT classic_mode_menu_add_quit_option 
	IF NOT root_window : GetSingleTag no_exit_pause_menu 
		add_roundbar_menu_item text = "END RUN" id = menu_classic_endrun pad_choose_script = classic_mode_choose_end_run 
	ELSE 
		add_roundbar_menu_item text = "QUIT" id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit } 
	ENDIF 
ENDSCRIPT

SCRIPT classic_mode_view_goal_cameras 
	classic_mode_process_intro_cameras 
	spawnscript PlayClassicIntroCameras params = { callback = classic_mode_view_goal_cameras_back_to_pause 
		GoalList = <GoalList> 
		end_run 
	} 
ENDSCRIPT

SCRIPT classic_mode_view_goal_cameras_back_to_pause 
	PauseGame 
	create_pause_menu 
ENDSCRIPT

SCRIPT classic_mode_retry 
	DisplayLoadingScreen freeze 
	ResetSkaters 
	GoalManager_DeactivateAllGoals 
	exit_pause_menu dont_restore_start_key_binding 
	change dont_restore_start_key_binding = 0 
	destroy_goal_panel_messages all 
	kill_speech_boxes 
	TantrumMessageKill 
	console_clear 
	IF ObjectExists id = first_time_goal_info 
		DestroyScreenElement id = first_time_goal_info 
	ENDIF 
	change classic_mode_skip_intro = 1 
	TODManager_SetTempBloomParams on = 0 
	change ParseNodeArrayIgnoreGaps = 1 
	retry 
ENDSCRIPT

SCRIPT classic_mode_choose_end_run 
	root_window : GetSingleTag classic_ghost_timed_run_goal 
	skater : BailSkaterTricks 
	GoalManager_ExpireGoal name = <classic_ghost_timed_run_goal> 
	TODManager_SetTempBloomParams on = 0 
ENDSCRIPT

classic_mode_in_end_run_sequence = 0 
SCRIPT classic_mode_end_run 
	change classic_mode_in_end_run_sequence = 1 
	CheckClassicAdvancementStatus 
	classic_mode_process_intro_cameras show_beaten = 1 <...> 
	spawnscript PlayClassicIntroCameras params = { callback = classic_mode_view_goals 
		GoalList = <GoalList> 
		end_run 
	} 
ENDSCRIPT

SCRIPT classic_mode_done_with_intro 
	GoalManager_UnPauseAllGoals 
ENDSCRIPT

SCRIPT classic_mode_play_intro_cams 
	classic_mode_setup_ghost_score_run 
	GoalManager_ActivateAllGoals 
	change classic_all_goals_complete_message_shown = 0 
	change ParseNodeArrayIgnoreGaps = 0 
	IF ( classic_mode_skip_intro = 1 ) 
		change classic_mode_skip_intro = 0 
		RETURN 
	ENDIF 
	change classic_mode_skip_intro = 0 
	GoalManager_PauseAllGoals 
	classic_mode_process_intro_cameras 
	spawnscript PlayClassicIntroCameras params = { callback = classic_mode_done_with_intro 
		GoalList = <GoalList> 
	} 
ENDSCRIPT

SCRIPT classic_mode_setup_ghost_score_run 
	GoalManager_GetGoalList 
	GetArraySize <GoalList> 
	<index> = 0 
	BEGIN 
		goal = ( <GoalList> [ <index> ] . goalId ) 
		RemoveParameter TimedScoreRun 
		classic_mode_is_goal_timed goal = <goal> 
		IF GotParam TimedScoreRun 
			root_window : SetTags classic_ghost_timed_run_goal = <goal> 
			GoalManager_EditGoal name = <goal> params = { classic_goal_list = <GoalList> } 
			RETURN 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	script_assert "Couldn\'t find a timed score run. Is this classic mode?" 
ENDSCRIPT

SCRIPT classic_mode_get_previous_goal_data 
	root_window : GetSingleTag classic_ghost_timed_run_goal 
	GoalManager_GetGoalParams name = <classic_ghost_timed_run_goal> 
	RETURN previous_goal_data = <classic_goal_list> 
ENDSCRIPT

SCRIPT classic_mode_process_intro_cameras show_beaten = 0 
	GoalManager_GetGoalList 
	classic_mode_get_previous_goal_data 
	GetArraySize <GoalList> 
	index = 0 
	BEGIN 
		RemoveParameter TimedScoreRun 
		RemoveParameter view_goals_text 
		old_cameras = <view_goals_cameras> 
		RemoveParameter view_goals_cameras 
		GoalManager_GetGoalParams name = ( ( <GoalList> [ <index> ] ) . goalId ) 
		IF NOT GotParam view_goals_cameras 
			view_goals_cameras = <old_cameras> 
			unique_cam = 0 
		ELSE 
			unique_cam = 1 
			IF NOT GotParam default_level_message_cameras 
				default_level_message_cameras = <view_goals_cameras> 
			ENDIF 
		ENDIF 
		beaten_this_time = ( ( <GoalList> [ <index> ] ) . hasBeaten ) 
		beaten_last_time = ( ( <previous_goal_data> [ <index> ] ) . hasBeaten ) 
		show = 0 
		timer = 180 
		IF ( <beaten_last_time> = 0 ) 
			IF ( <beaten_this_time> = <show_beaten> ) 
				show = 1 
			ENDIF 
		ENDIF 
		style = classic_goal_intro_style 
		IF GotParam TimedScoreRun 
			IF GotParam just_unlocked 
				root_window : SetTags highlight_change_level 
				IF ( <just_unlocked> = just_unlocked_bracket ) 
					view_goals_text = "You\'ve Unlocked the Next Level Bracket!" 
					style = classic_goal_intro_style_bracketmessage 
				ELSE 
					view_goals_text = "You\'ve Unlocked the Secret Triangle Level!" 
					style = classic_goal_intro_style_bracketmessage_icon 
				ENDIF 
				view_goals_cameras = <default_level_message_cameras> 
				show = 1 
				timer = 360 
				unique_cam = 1 
			ELSE 
				show = 0 
			ENDIF 
		ENDIF 
		SetArrayElement ArrayName = GoalList index = <index> newvalue = { ( <GoalList> [ <index> ] ) 
			show = <show> 
			view_goals_text = <view_goals_text> 
			view_goals_cameras = <view_goals_cameras> 
			unique_cam = <unique_cam> 
			timer = <timer> 
			style = <style> 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN GoalList = <GoalList> 
ENDSCRIPT

SCRIPT PlayClassicIntroCameras 
	GoalManager_ReplaceTrickText all 
	LoadTexture no_vram_alloc "LevelSelectSprites/sign_secret2" 
	GetArraySize <GoalList> 
	IF ( <array_size> > 0 ) 
		IF ScreenElementExists id = current_menu_anchor 
			exit_pause_menu dont_restore_start_key_binding 
		ENDIF 
		IF GotParam end_run 
			inside_run = inside_run 
		ENDIF 
		SetUpChapterMenu 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = classic_intro_root 
			event_handlers = [ { pad_choose classic_intro_advance_cam } ] 
		} 
		FireEvent type = focus target = classic_intro_root 
		GetCurrentLevelName 
		create_panel_block { parent = classic_intro_root 
			id = intro_title 
			font_face = testtitle 
			text = <level_name> 
			rgba = [ 16 67 113 90 ] 
			pos = PAIR(320.00000000000, 50.00000000000) 
			time = 200000 
			dims = PAIR(616.00000000000, 0.00000000000) 
			scale = 1.79999995232 
			just = [ center top ] 
			internal_just = [ center top ] 
		} 
		index = 0 
		BEGIN 
			IF ( ( ( <GoalList> [ <index> ] ) . show ) = 1 ) 
				skip_me = 0 
			ELSE 
				skip_me = 1 
			ENDIF 
			IF classic_intro_root : GetSingleTag pressed_x 
				IF ( ( ( <GoalList> [ <index> ] ) . unique_cam ) = 0 ) 
					skip_me = 1 
				ELSE 
					classic_intro_root : RemoveTags tags = [ pressed_x ] 
				ENDIF 
			ENDIF 
			IF ( <skip_me> = 0 ) 
				DeBounce X time = 0.30000001192 
				KillSpawnedScript name = TemporarilyDisableInput 
				spawnscript TemporarilyDisableInput params = { time = 200 } 
				GetCurrentSkaterCamAnimName 
				GetIntroSkaterCamName index = <index> cam = ( ( <GoalList> [ <index> ] ) . view_goals_cameras [ 0 ] ) 
				IF NOT ( <name> = <CurrentSkaterCamAnimName> ) 
					KillSkaterCamAnim current 
					PlayIntroSkaterCam index = <index> cam = ( ( <GoalList> [ <index> ] ) . view_goals_cameras [ 0 ] ) 
				ENDIF 
				spawnscript display_classic_goal_intro_panel params = { goal_name = ( ( <GoalList> [ <index> ] ) . view_goals_text ) 
					beaten = ( ( <GoalList> [ <index> ] ) . hasBeaten ) 
					style = ( ( <GoalList> [ <index> ] ) . style ) 
				} 
				PauseStream 0 
				StopStream UnlockOldTHPSLevel 
				KillSpawnedScript name = PlayTHPSSoundAfterWait 
				spawnscript PlayTHPSSoundAfterWait 
				timer = 0 
				BEGIN 
					IF ( <timer> > ( ( <GoalList> [ <index> ] ) . timer ) ) 
						BREAK 
					ENDIF 
					IF classic_intro_root : GetSingleTag pressed_x 
						BREAK 
					ENDIF 
					IF SkaterCamAnimFinished 
						BREAK 
					ENDIF 
					timer = ( <timer> + 1 ) 
					wait 1 gameframes 
				REPEAT 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
		KillSkaterCamAnim all 
		StopStream UnlockOldTHPSLevel 
		IF ScreenElementExists id = classic_intro_root 
			DestroyScreenElement id = classic_intro_root 
		ENDIF 
		KillChapterMenu inside_run = <inside_run> 
	ENDIF 
	UnloadTexture "LevelSelectSprites/sign_secret2" 
	RemoveParameter goals 
	SafeCallback <...> 
ENDSCRIPT

SCRIPT PlayTHPSSoundAfterWait 
	wait 1 gameframe 
	PlayStream UnlockOldTHPSLevel vol = 150 
ENDSCRIPT

SCRIPT classic_intro_advance_cam 
	classic_intro_root : SetTags pressed_x 
ENDSCRIPT

SCRIPT classic_mode_view_goals_exit 
	DestroyScreenElement id = view_goals_root 
	IF ( classic_mode_in_end_run_sequence = 0 ) 
		IF GotParam back 
			generic_menu_pad_back_sound 
		ELSE 
			generic_menu_pad_choose_sound 
		ENDIF 
		create_pause_menu 
	ELSE 
		generic_menu_pad_choose_sound 
		classic_mode_do_high_scores 
	ENDIF 
ENDSCRIPT

SCRIPT classic_mode_do_high_scores 
	UpdateRecords 
	UpdateInitials 
	ResetComboRecords 
	IF NewRecord 
		high_scores_menu_create 
	ELSE 
		classic_mode_do_end_run_stats 
	ENDIF 
ENDSCRIPT

SCRIPT classic_mode_do_end_run_stats 
	GetStatValue points_available 
	IF ( <stat_value> > 0 ) 
		IF NOT GotParam overridden 
			create_classic_stats_menu end_run 
			RETURN 
		ENDIF 
	ENDIF 
	gamemode_end_run_maybe_save 
ENDSCRIPT

SCRIPT gamemode_end_run_maybe_save 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	change classic_mode_in_end_run_sequence = 0 
	IF root_window : GetSingleTag highlight_change_level 
		ingame_confirm_save 
		RETURN 
	ENDIF 
	create_pause_menu 
ENDSCRIPT

SCRIPT classic_mode_view_goals 
	CheckNeedCompletionMessages 
	IF GotParam need_completion_messages 
		spawnscript DoCompletionMessagesNow 
		RETURN 
	ENDIF 
	IF GotParam end_run 
		PauseGame 
		kill_start_key_binding 
		set_pause_menu_allow_continue off 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	kill_speech_boxes 
	TantrumMessageKill 
	console_clear 
	hide_all_hud_items 
	kill_start_key_binding 
	GoalManager_ReplaceTrickText all 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = view_goals_root 
		not_focusable 
	} 
	SetScreenElementProps { 
		id = view_goals_root 
		event_handlers = [ 
			{ pad_back classic_mode_view_goals_exit params = { back } } 
			{ pad_choose classic_mode_view_goals_exit } 
		] 
		replace_handlers 
	} 
	create_helper_text { 
		parent = view_goals_root 
		helper_pos = PAIR(330.00000000000, 426.00000000000) 
		helper_text_elements = [ { text = "\\bn/\\bm = Done" } ] 
	} 
	GoalManager_GetGoalList 
	classic_mode_get_previous_goal_data 
	CreateScreenElement { 
		type = ContainerElement 
		parent = view_goals_root 
		pos = PAIR(320.00000000000, 105.00000000000) 
		just = [ center center ] 
		not_focusable 
	} 
	container_id = <id> 
	position = PAIR(0.00000000000, 0.00000000000) 
	scale = 0.89999997616 
	left_right_pos = -1 
	any_goals_beaten = 0 
	GetArraySize <GoalList> 
	<index> = 0 
	BEGIN 
		goal = ( <GoalList> [ <index> ] ) 
		RemoveParameter TimedScoreRun 
		classic_mode_is_goal_timed goal = ( <goal> . goalId ) 
		IF NOT GotParam TimedScoreRun 
			CreateScreenElement { 
				type = ContainerElement 
				parent = <container_id> 
				pos = <position> 
			} 
			IF ( <left_right_pos> < 0 ) 
				left_right_pos = 1 
			ELSE 
				left_right_pos = -1 
			ENDIF 
			local_container_id = <id> 
			RunScriptOnScreenElement id = <local_container_id> classic_view_goals_animate_in params = { left_right_pos = <left_right_pos> 
				position = <position> 
				index = <index> 
			} 
			GoalManager_GetGoalParams name = ( <goal> . goalId ) 
			CreateScreenElement { 
				type = TextElement 
				parent = <local_container_id> 
				shadow 
				shadow_rgba = UI_text_shadow_color 
				shadow_offs = UI_text_shadow_offset 
				font = small 
				text = <view_goals_text> 
				scale = <scale> 
				pos = PAIR(0.00000000000, 0.00000000000) 
				just = [ center center ] 
			} 
			IF ( ( <previous_goal_data> [ <index> ] . hasBeaten ) = 1 ) 
				<id> : SetProps rgba = [ 50 50 50 128 ] 
			ELSE 
				IF ( ( <goal> . hasBeaten ) = 1 ) 
					RunScriptOnScreenElement id = <id> classic_view_goals_style params = { color = [ 128 40 40 128 ] wait_first } 
				ENDIF 
			ENDIF 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <local_container_id> 
				pos = PAIR(0.00000000000, 0.00000000000) 
				just = [ center center ] 
				scale = PAIR(50.00000000000, 3.00000000000) 
				texture = white2 
				z_priority = 2 
				rgba = [ 0 0 0 50 ] 
			} 
			position = ( <position> + PAIR(0.00000000000, 28.00000000000) ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	spawnscript SK6_SFX_ShowClassicGoals 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <container_id> 
		font = small 
		pos = PAIR(0.00000000000, -150.00000000000) 
		alpha = 1 
	} 
	container_id = <id> 
	GetCurrentLevelName 
	FormatText TextName = title "%a Goals" a = <level_name> 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
		font = small 
		text = <title> 
		scale = 1.79999995232 
		pos = PAIR(0.00000000000, 2.00000000000) 
		rgba = [ 30 60 128 128 ] 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center center ] 
		scale = PAIR(50.00000000000, 6.00000000000) 
		texture = white2 
		z_priority = -2 
		rgba = [ 0 0 0 100 ] 
	} 
	RunScriptOnScreenElement id = <container_id> classic_view_goals_title 
	FireEvent type = focus target = view_goals_root 
ENDSCRIPT

SCRIPT classic_view_goals_title 
	wait 0.44999998808 seconds 
	DoMorph alpha = 1 time = 0.15000000596 pos = PAIR(0.00000000000, -40.00000000000) 
ENDSCRIPT

SCRIPT classic_view_goals_animate_in 
	DoMorph pos = ( <position> + <left_right_pos> * PAIR(600.00000000000, 0.00000000000) ) 
	wait ( <index> * 2 ) gameframes 
	DoMorph pos = ( <position> - <left_right_pos> * PAIR(100.00000000000, 0.00000000000) ) time = 0.20000000298 
	DoMorph pos = <position> time = 0.10000000149 
ENDSCRIPT

SCRIPT classic_view_goals_style color = [ 128 128 128 128 ] 
	IF GotParam wait_first 
		wait 0.60000002384 seconds 
	ENDIF 
	SetProps rgba = <color> 
	DoMorph time = 0 scale = 0 relative_scale 
	DoMorph time = 0.20000000298 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale 
	DoMorph time = 0.05000000075 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 1 relative_scale 
	BEGIN 
		DoMorph time = 0.50000000000 scale = 1.04999995232 
		DoMorph time = 0.50000000000 scale = 0.94999998808 
	REPEAT 
ENDSCRIPT

SCRIPT classic_goal_intro_style color = [ 128 128 128 128 ] 
	SetProps rgba = <color> 
	DoMorph time = 0 scale = 0 relative_scale 
	DoMorph time = 0.20000000298 scale = 1.60000002384 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale 
	DoMorph time = 0.05000000075 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 1 relative_scale 
ENDSCRIPT

SCRIPT classic_goal_intro_style_bracketmessage color = [ 121 80 6 128 ] 
	SetProps rgba = <color> 
	DoMorph time = 0 scale = 10.80000019073 relative_scale rot_angle = 0 alpha = 0 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale alpha = 1 
	DoMorph time = 0.05000000075 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 1 relative_scale rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 0.69999998808 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 0.50000000000 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 0.80000001192 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 0.80000001192 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 0.80000001192 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 5 
	DoMorph time = 0.02999999933 scale = 1.50000000000 relative_scale rot_angle = 5 alpha = 1 
	DoMorph time = 0.15000000596 scale = 1.75000000000 relative_scale rot_angle = 5 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.79999995232 relative_scale rot_angle = 5 alpha = 1 
	DoMorph time = 0.30000001192 scale = 0.30000001192 relative_scale alpha = 0 
ENDSCRIPT

SCRIPT classic_goal_intro_style_bracketmessage_icon color = [ 121 80 6 128 ] 
	SetProps rgba = <color> 
	SetScreenElementLock id = classic_intro_root off 
	Theme_GetPauseBarColor return_value = bar_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = classic_intro_root 
		id = unlocked_sign_icon 
		texture = sign_secret2 
		scale = 3 
		z_priority = -10 
		rgba = [ 128 109 9 80 ] 
	} 
	RunScriptOnScreenElement id = unlocked_sign_icon unlocked_sign_icon_animate 
	DoMorph time = 0 scale = 10.80000019073 relative_scale rot_angle = 0 alpha = 0 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale alpha = 1 
	DoMorph time = 0.05000000075 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 1 relative_scale rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 0.69999998808 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 0.50000000000 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 0.80000001192 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 0.80000001192 rot_angle = 3 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 5 
	DoMorph time = 0.10000000149 alpha = 0.80000001192 rot_angle = 4 
	DoMorph time = 0.10000000149 alpha = 1 rot_angle = 6 
	DoMorph time = 0.10000000149 alpha = 0.60000002384 rot_angle = 5 
	DoMorph time = 0.02999999933 scale = 1.50000000000 relative_scale rot_angle = 5 alpha = 1 
	DoMorph time = 0.15000000596 scale = 1.75000000000 relative_scale rot_angle = 5 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.79999995232 relative_scale rot_angle = 5 alpha = 1 
	DoMorph time = 0.30000001192 scale = 0.30000001192 relative_scale alpha = 0 
ENDSCRIPT

SCRIPT unlocked_sign_icon_animate 
	DoMorph time = 0 pos = PAIR(320.00000000000, 600.00000000000) 
	DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 240.00000000000) 
	GetTags 
	SetTags random_effect_done = 0 
	RunScriptOnScreenElement id = <id> do_random_effect2 
	BEGIN 
		GetTags 
		IF ( <random_effect_done> = 1 ) 
			SetTags random_effect_done = 0 
			RunScriptOnScreenElement id = unlocked_sign_icon do_random_effect2 params = { 
				id = unlocked_sign_icon 
				effect = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 2 RANDOMCASE 6 RANDOMCASE 5 RANDOMCASE 8 RANDOMCASE 2 RANDOMCASE 1 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 10 RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 8 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 9 RANDOMCASE 2 RANDOMCASE 9 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 2 RANDOMCASE 1 RANDOMCASE 9 RANDOMCASE 5 RANDOMCASE 3 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 1 RANDOMEND 
				<...> 
			} 
		ENDIF 
		wait 4 frame 
	REPEAT 40 
	DoMorph time = 0.40000000596 alpha = 0 scale = 0.50000000000 
ENDSCRIPT

SCRIPT classic_goal_intro_complete_style color = [ 128 128 128 128 ] 
	SetProps rgba = <color> 
	DoMorph time = 0 scale = 0 relative_scale 
	DoMorph time = 0.20000000298 scale = 1.60000002384 relative_scale 
	BEGIN 
		DoMorph time = 0.30000001192 scale = 0.85000002384 relative_scale 
		DoMorph time = 0.30000001192 scale = 1.14999997616 relative_scale 
	REPEAT 
ENDSCRIPT

classic_all_goals_complete_message_shown = 0 
SCRIPT classic_mode_check_for_all_complete_message 
	IF IsTrue classic_all_goals_complete_message_shown 
		RETURN 
	ENDIF 
	change classic_all_goals_complete_message_shown = 1 
	GetClassicLevelGoalCount 
	IF ( <classic_goal_count> = 10 ) 
		wait 0.50000000000 seconds 
		goal_panel_wait_for_my_turn 
		spawnscript Goal_Success_Message_Sound 
		create_panel_message { 
			id = all_goals_completed_message 
			text = "All Goals Complete!" 
			style = classic_goals_all_complete_message 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT classic_goals_all_complete_message 
	SetProps rgba = [ 128 128 0 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 125.00000000000) scale = 0 alpha = 0 
	DoMorph time = 0.20000000298 alpha = 1 
	DoMorph time = 0.20000000298 scale = 2.50000000000 
	DoMorph time = 0.20000000298 scale = 1.50000000000 
	DoMorph time = 0.20000000298 scale = 2.00000000000 
	DoMorph time = 0.20000000298 scale = 1.39999997616 
	DoMorph pos = PAIR(321.00000000000, 126.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 124.00000000000) time = 0.10000000149 
	DoMorph time = 0.20000000298 scale = 1.39999997616 
	DoMorph time = 0.30000001192 scale = 0 alpha = 0 
	Die 
ENDSCRIPT

SCRIPT classic_mode_is_goal_timed 
	GoalManager_GetGoalParams name = <goal> 
	IF GotParam TimedScoreRun 
		RETURN TimedScoreRun 
	ENDIF 
ENDSCRIPT

SCRIPT display_classic_goal_intro_panel style = classic_goal_intro_style 
	IF ScreenElementExists id = intro_panel 
		DestroyScreenElement id = intro_panel 
	ENDIF 
	IF ScreenElementExists id = intro_panel_complete 
		DestroyScreenElement id = intro_panel_complete 
	ENDIF 
	create_panel_block { parent = classic_intro_root 
		id = intro_panel 
		font_face = small 
		text = <goal_name> 
		rgba = [ 128 128 128 128 ] 
		pos = PAIR(320.00000000000, 200.00000000000) 
		time = 3000 
		dims = PAIR(300.00000000000, 200.00000000000) 
		scale = 1.60000002384 
		just = [ center center ] 
		internal_just = [ center top ] 
		time = 10000 
	} 
	IF ( <beaten> = 1 ) 
		color = [ 128 0 0 128 ] 
		create_panel_block { parent = classic_intro_root 
			id = intro_panel_complete 
			font_face = small 
			text = "Complete!" 
			rgba = <color> 
			pos = PAIR(320.00000000000, 240.00000000000) 
			time = 3000 
			dims = PAIR(300.00000000000, 200.00000000000) 
			scale = 2 
			just = [ center center ] 
			internal_just = [ center top ] 
			time = 10000 
		} 
		RunScriptOnScreenElement id = intro_panel_complete classic_goal_intro_complete_style params = { color = <color> } 
	ELSE 
		RunScriptOnScreenElement id = intro_panel <style> 
	ENDIF 
ENDSCRIPT

SCRIPT CheckClassicAdvancementStatus 
	IF NOT GameModeEquals is_classic 
		RETURN 
	ENDIF 
	IF IsTrue DEMO_BUILD 
		RETURN 
	ENDIF 
	GetCurrentLevel 
	GetArraySize level_select_menu_classic_level_info 
	GetClassicModeTargetGoalsComplete 
	index = 0 
	BEGIN 
		IF StructureContains structure = ( level_select_menu_classic_level_info [ <index> ] ) level 
			GetClassicLevelGoalCount level = ( ( level_select_menu_classic_level_info [ <index> ] ) . level_num ) 
			IF ( ( ( level_select_menu_classic_level_info [ <index> ] ) . level ) = <level> ) 
				IF NOT ( <classic_goal_count> < <target_goals_complete> ) 
					next_index = ( <index> + 1 ) 
					bracket1 = ( ( level_select_menu_classic_level_info [ <index> ] ) . bracket ) 
					BEGIN 
						IF ( <next_index> < <array_size> ) 
							IF StructureContains structure = ( level_select_menu_classic_level_info [ <next_index> ] ) flag 
								flag = ( ( level_select_menu_classic_level_info [ <next_index> ] ) . flag ) 
								bracket2 = ( ( level_select_menu_classic_level_info [ <next_index> ] ) . bracket ) 
								IF ( <bracket2> = ( <bracket1> + 1 ) ) 
									IF NOT GetGlobalFlag flag = <flag> 
										just_unlocked = just_unlocked_bracket 
										IF NOT ( <flag> = GAME_CLASSIC_UNLOCKED_SE2 ) 
											SetGlobalFlag flag = <flag> 
										ENDIF 
									ENDIF 
									IF StructureContains structure = ( level_select_menu_classic_level_info [ <next_index> ] ) seen_flag 
										seen_flag = ( level_select_menu_classic_level_info [ <next_index> ] . seen_flag ) 
										IF NOT ( <seen_flag> = LEVEL_SEEN_SE2 ) 
											SetGlobalFlag flag = <seen_flag> 
										ENDIF 
									ENDIF 
								ENDIF 
							ENDIF 
						ELSE 
							BREAK 
						ENDIF 
						next_index = ( <next_index> + 1 ) 
					REPEAT <array_size> 
				ENDIF 
			ENDIF 
			IF ( ( ( level_select_menu_classic_level_info [ <index> ] ) . level ) = load_la ) 
				IF NOT ( <classic_goal_count> < <target_goals_complete> ) 
					IF NOT GetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 
						just_unlocked = just_unlocked_se2 
						SetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 
						SetGlobalFlag flag = LEVEL_SEEN_SE2 
						SetClassicTotalGoals 140 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	GetClassicLevelGoalCount get_total 
	IF ( <total_goals_complete> = <total_goals_possible> ) 
		GetClassicModeCompleteFlag 
		SetGlobalFlag flag = <complete_flag> 
	ENDIF 
	ProcessGameRewards 
	ProcessGoalRewards 
	RETURN just_unlocked = <just_unlocked> 
ENDSCRIPT

SCRIPT GetClassicModeCompleteFlag 
	GoalManager_GetDifficultyLevel 
	IF ( <difficulty_level> = 0 ) 
		flag = GAME_COMPLETED_CLASSIC_NORMAL 
	ELSE 
		flag = GAME_COMPLETED_CLASSIC_SICK 
	ENDIF 
	RETURN complete_flag = <flag> 
ENDSCRIPT

classic_mode_use_cheat_points = 0 
SCRIPT GetClassicModeTargetGoalsComplete 
	IF IsTrue classic_mode_use_cheat_points 
		RETURN target_goals_complete = 1 
	ENDIF 
	GoalManager_GetDifficultyLevel 
	IF ( <difficulty_level> = 0 ) 
		RETURN target_goals_complete = 6 
	ELSE 
		RETURN target_goals_complete = 8 
	ENDIF 
ENDSCRIPT

SCRIPT IsClassicModeComplete 
	GetClassicModeCompleteFlag 
	IF GetGlobalFlag flag = <complete_flag> 
		RETURN classic_mode_completed 
	ENDIF 
ENDSCRIPT


