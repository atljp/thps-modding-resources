
SCRIPT create_pause_menu 
	Skater : Obj_SetFlag ANTEARA_FAILSAFE_FLAG 
	anteara_failsafe 
	IF GotParam no_exit 
		set_pause_menu_allow_continue off 
	ELSE 
		IF root_window : GetSingleTag no_exit_pause_menu 
			no_exit = no_exit 
		ENDIF 
	ENDIF 
	IF CustomParkMode editing 
		SetParkEditorPauseMode pause 
	ENDIF 
	IF NOT GotParam no_sound 
	ENDIF 
	unhide_root_window 
	IF ( inside_pause = 1 ) 
	ENDIF 
	hide_all_hud_items 
	unhide_current_goal 
	IF inNetGame 
		IF NOT IsObserving 
			Skater : NetDisablePlayerInput 
		ENDIF 
	ELSE 
		IF CustomParkMode editing 
			anteara_parked_setup_main_menu 
			PauseMusicAndStreams 1 
			build_pause_menu_parts 
			RETURN 
		ENDIF 
		IF CustomParkMode testing 
			anteara_parked_setup_test_play_menu 
			PauseMusicAndStreams 1 
			build_pause_menu_parts 
			RETURN 
		ENDIF 
		IF InSplitScreenGame 
			create_mp_pause_menu 
			PauseMusicAndStreams 1 
			build_pause_menu_parts 
			RETURN 
		ENDIF 
	ENDIF 
	IF ( inside_pause = 0 ) 
		IF MusicIsPaused 
			Change music_was_paused = 1 
		ELSE 
			Change music_was_paused = 0 
		ENDIF 
	ENDIF 
	PauseMusicAndStreams 1 
	pause_rain 
	IF ( in_cat_preview_mode = 1 ) 
		create_CAT_pause_menu 
		RETURN 
	ENDIF 
	IF NOT GotParam no_exit 
		helper = generic_helper_text 
	ELSE 
		helper = generic_helper_text_no_back 
	ENDIF 
	IF GotParam no_exit 
		make_new_roundbar_menu { 
			menu_id = pause_menu 
			vmenu_id = pause_vmenu 
			pad_back_script = NullScript 
			Pos = PAIR(250.00000000000, 95.00000000000) 
			dims = PAIR(250.00000000000, 480.00000000000) 
			internal_text_just = right 
			helper_text = <helper> 
			add_3d_bg 
		} 
	ELSE 
		IF Skater : driving 
			make_new_roundbar_menu { 
				menu_id = pause_menu 
				vmenu_id = pause_vmenu 
				pad_back_script = handle_start_pressed 
				Pos = PAIR(250.00000000000, 75.00000000000) 
				dims = PAIR(250.00000000000, 480.00000000000) 
				internal_text_just = right 
				helper_text = <helper> 
				add_3d_bg 
			} 
		ELSE 
			make_new_roundbar_menu { 
				menu_id = pause_menu 
				vmenu_id = pause_vmenu 
				pad_back_script = handle_start_pressed 
				Pos = PAIR(250.00000000000, 95.00000000000) 
				dims = PAIR(250.00000000000, 480.00000000000) 
				internal_text_just = right 
				helper_text = <helper> 
				add_3d_bg 
			} 
		ENDIF 
	ENDIF 
	do_localized_pause_title Pos = PAIR(500.00000000000, 95.00000000000) 
	kill_start_key_binding 
	pause_menu_gradient right 
	add_music_track_text Pos = PAIR(575.00000000000, 320.00000000000) 
	IF ObjectExists Id = PlayerVehicle 
		add_roundbar_menu_item { text = "EXIT VEHICLE" 
			Id = ditch_vehicle_id 
			pad_choose_script = Anteara_Easy_ExitVehicle 
			pad_choose_sound = generic_pause_exit_sound 
		} 
	ENDIF 
	IF GameModeEquals is_singlesession 
		add_roundbar_menu_item { text = "CONTINUE" 
			Id = menu_continue 
			pad_choose_script = handle_pause_continue 
			pad_choose_sound = generic_pause_exit_sound 
		} 
		IF GoalManager_goalIsActive name = TrickAttack 
			add_roundbar_menu_item { 
				text = "RETRY HIGH SCORE RUN" 
				Id = menu_retry_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal } 
			} 
			add_roundbar_menu_item { 
				text = "END HIGH SCORE RUN" 
				Id = menu_end_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = end_high_score_run } 
			} 
		ELSE 
			add_roundbar_menu_item { 
				text = "START HIGH SCORE RUN" 
				Id = menu_start_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = TrickAttack_MenuStartRun } 
			} 
		ENDIF 
	ELSE 
		IF NOT GotParam no_exit 
			add_roundbar_menu_item { text = "CONTINUE" 
				Id = menu_continue 
				pad_choose_script = handle_pause_continue 
				pad_choose_sound = generic_pause_exit_sound 
			} 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_goal_attack 
		IF NOT IsObserving 
			GetGoalsMode 
			IF ( <goals> = goals_created ) 
				IF GoalManager_CanRetryGoal 
					IF GoalManager_GetLastGoalId 
						IF NOT GoalManager_HasWonGoal name = <goal_id> 
							add_roundbar_menu_item text = "RETRY LAST GOAL" Id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_vibration menu_select_script = RetryCurrentGoal } 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		add_roundbar_menu_item text = "VIEW GOALS" Id = menu_view_goals pad_choose_script = create_view_selected_goals_menu pad_choose_params = { from_pause } 
	ENDIF 
	IF GameModeEquals is_career 
		goal_id = ( goal_utility_allow_end_goal_name ) 
		IF NOT ChecksumEquals A = <goal_id> B = null 
			IF GoalManager_GoalExists name = <goal_id> 
				IF GoalManager_goalIsActive name = <goal_id> 
					add_roundbar_menu_item text = "END CURRENT RUN" Id = menu_end_run pad_choose_script = arcade_machine_end_run pad_choose_params = { goal_id = <goal_id> } 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GoalManager_CanRetryGoal 
			add_roundbar_menu_item text = "RETRY LAST GOAL" Id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_vibration stop_streams menu_select_script = RetryCurrentGoal } 
		ENDIF 
		IF NOT LevelIs load_se 
			add_roundbar_menu_item text = "VIEW GOALS" Id = menu_chapters pad_choose_script = view_goals_menu_create 
		ENDIF 
		add_roundbar_menu_item text = "TEXT MESSAGES" Id = menu_pager pad_choose_script = pager_window_create 
	ELSE 
		IF GameModeEquals is_creategoals 
			IF GoalManager_HasActiveGoals 
				add_roundbar_menu_item text = "END CURRENT GOAL" Id = menu_end_current_goal pad_choose_script = menu_select pad_choose_params = { menu_select_script = end_current_goal_run } 
			ENDIF 
			add_roundbar_menu_item text = "VIEW GOALS" Id = menu_view_goals pad_choose_script = view_created_goals_menu_create 
			IF NOT LevelIs load_sk5ed_gameplay 
				add_roundbar_menu_item text = "CREATE A GOAL" Id = menu_create_a_goal pad_choose_script = create_existing_goals_menu 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_classic 
		classic_mode_menu_add_pause_options 
	ENDIF 
	IF GameModeEquals is_creategoals 
		IF NOT LevelIs load_sk5ed_gameplay 
			add_roundbar_menu_item text = "LOAD GOALS" Id = menu_load_goals pad_choose_script = prompt_launch_cag_pause_load 
			GoalEditor : GetNumEditedGoals ExcludeParkEditorGoals 
			IF ( <NumGoals> = 0 ) 
				no_edited_goals = 1 
			ENDIF 
			add_roundbar_menu_item text = "SAVE GOALS" Id = menu_save_goals pad_choose_script = launch_pause_menu_save_created_goals not_focusable = <no_edited_goals> 
		ENDIF 
	ENDIF 
	display_level_select = 1 
	IF inNetGame 
		display_level_select = 0 
	ENDIF 
	IF GameModeEquals is_classic 
		IF NOT GotParam no_exit 
			display_level_select = 0 
		ENDIF 
	ENDIF 
	IF ( <display_level_select> = 1 ) 
		add_roundbar_menu_item { text = "CHANGE LEVEL" 
			Id = menu_level_select 
			pad_choose_script = launch_level_select_menu 
			tag_grid_x = 1 
		} 
	ENDIF 
	IF inNetGame 
		IF IsHost 
			IF GameModeEquals is_lobby 
				IF NOT NetworkGamePending 
					IF NOT ChangeLevelPending 
						add_roundbar_menu_item text = "START GAME" Id = menu_network_start_select pad_choose_script = network_game_options_selected 
					ENDIF 
				ENDIF 
			ELSE 
				add_roundbar_menu_item text = "END CURRENT GAME" Id = menu_network_end_select pad_choose_script = network_end_game_selected 
			ENDIF 
		ENDIF 
	ENDIF 
	IF inNetGame 
		IF NOT NetworkGamePending 
			IF OnServer 
				IF OnXbox 
					add_roundbar_menu_item text = "HOST OPTIONS" Id = menu_network_server_opts_select pad_choose_script = network_options_selected 
				ELSE 
					add_roundbar_menu_item text = "SERVER OPTIONS" Id = menu_network_server_opts_select pad_choose_script = network_options_selected 
				ENDIF 
			ENDIF 
			IF IsHost 
				IF GameModeEquals is_lobby 
					IF NOT OnServer 
						IF OnXbox 
							add_roundbar_menu_item text = "HOST OPTIONS" Id = menu_network_server_opts_select pad_choose_script = network_options_selected 
						ELSE 
							add_roundbar_menu_item text = "SERVER OPTIONS" Id = menu_network_server_opts_select pad_choose_script = network_options_selected 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF inNetGame 
		IF NOT IsObserving 
			<game_active> = 0 
			IF GoalManager_HasActiveGoals count_all 
				<game_active> = 1 
			ENDIF 
			IF ( <game_active> = 1 ) 
				<trick_text> = "EDIT TRICKS" 
				<trick_helper> = view_tricks_helper_desc 
			ELSE 
				IF NOT GoalManager_HasActiveGoals 
					<trick_text> = "EDIT TRICKS" 
					<trick_helper> = edit_tricks_helper_desc 
				ELSE 
					<trick_text> = "EDIT TRICKS" 
					<trick_helper> = view_tricks_helper_desc 
				ENDIF 
			ENDIF 
			add_roundbar_menu_item text = <trick_text> Id = menu_cas pad_choose_script = create_edit_tricks_menu 
		ENDIF 
	ENDIF 
	IF inNetGame 
		IF IsHost 
			IF GameModeEquals is_lobby 
				IF NOT NetworkGamePending 
					IF NOT ChangeLevelPending 
						add_roundbar_menu_item text = "CHANGE LEVEL" Id = menu_level_select pad_choose_script = launch_level_select_menu pad_choose_params = { show_warning } 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		IF OnXbox 
			IF IsTrue Bootstrap_Build 
				add_roundbar_menu_item text = "PLAYER LIST" Id = menu_network_remove_select pad_choose_script = launch_remove_players_menu not_focusable = not_focusable 
			ELSE 
				add_roundbar_menu_item text = "PLAYER LIST" Id = menu_network_player_list_select pad_choose_script = launch_player_list_menu 
				IF ProfileLoggedIn 
					add_roundbar_menu_item text = "HOMIE LIST" Id = menu_network_homie_list_select pad_choose_script = launch_homie_list 
					IF AnyBuddyMessagesLeft 
						add_roundbar_menu_item text = "VIEW MESSAGES" Id = menu_network_homie_list_view pad_choose_script = view_buddy_messages 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		IF GameModeEquals is_career 
			GetChapterSelectableProCount 
			IF ( <selectable_pro_count> > 1 ) 
				GetCurrentSkaterProfileIndex 
				GetSkaterProfileInfo Player = <currentSkaterProfileIndex> 
				IF ChecksumEquals A = <skater_family> B = family_pro 
					IF Skater : IsInBail 
						pro_focus_param = not_focusable 
					ELSE 
						pro_focus_param = { } 
					ENDIF 
					add_roundbar_menu_item text = "CHANGE PRO" Id = menu_change_pro pad_choose_script = create_select_pro_menu <pro_focus_param> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT inNetGame 
		add_roundbar_menu_item text = "YOUR OPTIONS" Id = menu_your_options pad_choose_script = create_your_options_menu 
	ENDIF 
	add_roundbar_menu_item text = "ANTEARA MENU" Id = menu_anteara_options pad_choose_script = create_anteara_menu 
	add_roundbar_menu_item text = "GAME OPTIONS" Id = menu_game_options pad_choose_script = create_options_menu 
	IF NOT CD 
		IF ( main_menu_jump_to_cas = 1 ) 
			add_roundbar_menu_item text = "BACK TO CAS" Id = debug_cas_menu pad_choose_script = create_pre_cas_menu pad_choose_params = { load_assets = 1 } 
		ENDIF 
	ENDIF 
	IF inNetGame 
		add_roundbar_menu_item text = "CHAT MESSAGE" Id = menu_chat pad_choose_script = launch_chat_keyboard 
		IF NOT OnServer 
			IF NOT IsObserving 
				IF InInternetMode 
					IF IsTrue Bootstrap_Build 
						IF NOT GoalManager_HasActiveGoals 
							add_roundbar_menu_item text = "OBSERVE" Id = menu_network_observe_select pad_choose_script = chose_observe not_focusable = not_focusable 
						ENDIF 
					ELSE 
						IF NOT GoalManager_HasActiveGoals 
							add_roundbar_menu_item text = "OBSERVE" Id = menu_network_observe_select pad_choose_script = chose_observe 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		add_roundbar_menu_item text = "QUIT" Id = menu_quit pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_quit_game_dialog } 
	ELSE 
		IF CustomParkMode testing 
			printf "PARK EDITOR TEST PLAY MENU" 
			add_roundbar_menu_item text = "BACK TO EDITOR" Id = menu_skateshop pad_choose_script = menu_confirm_quit pad_choose_params = { yes_script = exit_test_play } 
		ELSE 
			IF GameModeEquals is_classic 
				classic_mode_menu_add_quit_option 
			ELSE 
				add_roundbar_menu_item { text = "QUIT" 
					Id = menu_skateshop 
					pad_choose_script = generic_menu_pad_choose 
					pad_choose_params = { callback = menu_confirm_quit } 
					tip_text = "Seeya!" 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	kill_blur start = 0 
	IF root_window : GetSingleTag highlight_change_level 
		focus_data = { grid_index = 1 } 
		root_window : RemoveTags tags = [ highlight_change_level ] 
	ENDIF 
	roundbar_menu_finish show_deck = show_deck data = <focus_data> 
ENDSCRIPT

SCRIPT create_mp_pause_menu 
	SetButtonEventMappings unblock_menu_input 
	kill_start_key_binding 
	make_new_roundbar_menu { 
		menu_id = pause_menu 
		vmenu_id = pause_vmenu 
		pad_back_script = handle_start_pressed 
		title = "Paused" 
		additional_create_script = pause_create_tipbox 
		additional_focus_script = pause_focus_tipbox 
		additional_unfocus_script = pause_unfocus_tipbox 
		helper_text = <helper> 
	} 
	create_helper_text generic_helper_text 
	add_roundbar_menu_item text = "Continue" Id = menu_continue pad_choose_script = handle_start_pressed 
	add_roundbar_menu_item text = "End Current Game" Id = menu_network_end_select pad_choose_script = network_end_game_selected 
	add_roundbar_menu_item text = "Options" Id = menu_mp_options pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_options_menu } 
	add_roundbar_menu_item text = "Quit" Id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit } 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT exit_pause_menu menu_id = current_menu_anchor 
	Change check_for_unplugged_controllers = 0 
	IF ScreenElementExists Id = current_menu_anchor 
		FireEvent Type = unfocus target = current_menu_anchor 
	ENDIF 
	ClearViewerObject 
	Debounce x time = 0.30000001192 
	Debounce Triangle time = 0.30000001192 
	pause_menu_gradient off 
	Change inside_pause = 0 
	Change no_focus_sound = 1 
	IF NOT CD 
		Change viewer_buttons_enabled = 1 
	ENDIF 
	show_all_hud_items 
	IF inNetGame 
		IF NOT IsObserving 
			IF ObjectExists Id = Skater 
				Skater : NetEnablePlayerInput 
			ENDIF 
		ENDIF 
	ENDIF 
	UnpauseGame 
	possibly_add_temp_special_trick 
	PauseStream 0 
	IF ( music_was_paused = 0 ) 
		PauseMusic 0 
	ENDIF 
	IF root_window : GetSingleTag need_music_zone_refresh 
		root_window : RemoveTags tags = [ need_music_zone_refresh ] 
		spawnscript SFX_refresh_music_box_triggers params = { Wait } 
	ENDIF 
	unpause_rain 
	GoalManager_UnPauseAllGoals 
	IF ObjectExists Id = <menu_id> 
		DestroyScreenElement Id = <menu_id> 
	ENDIF 
	SetScreenElementProps Id = root_window tags = { menu_state = off } 
	IF CustomParkMode editing 
		IF NOT GotParam DoNotSwitchEditorState 
			SetParkEditorState state = edit 
			SetParkEditorPauseMode UnPause 
			SwitchToParkEditorCamera 
		ENDIF 
	ENDIF 
	IF NOT GotParam dont_restore_start_key_binding 
		restore_start_key_binding 
	ENDIF 
	menu3d_hide 
	IF NOT inNetGame 
		IF NOT GameModeEquals is_horse 
			unpauseskaters 
		ENDIF 
	ENDIF 
	Change check_for_unplugged_controllers = 1 
	KillSpawnedScript name = do_localized_pause_title 
	IF NOT inNetGame 
		IF ObjectExists Id = PlayerVehicleCamera 
			IF NOT ( ( ( ( case_anteara_veh = 4 ) | ( case_anteara_veh = 7 ) | ( case_anteara_veh = 8 ) | ( case_anteara_veh = 13 ) ) ) ) 
				Skater : hide 
			ENDIF 
			SetActiveCamera Id = PlayerVehicleCamera 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Veh_Camera_fix 
	PlayerVehicleCamera : VehicleCamera_Reset 
	SetActiveCamera Id = PlayerVehicleCamera 
ENDSCRIPT

SCRIPT pause_launch_level 
	Skater : StatsManager_Reset 
	IF ( ( <level> = load_boardshop ) | ( <level> = load_cas ) ) 
		temp = <level> 
		GetCurrentLevel 
		array = return_to_level 
		SetArrayElement arrayname = array index = 0 newvalue = <level> 
		level = <temp> 
	ENDIF 
	IF GameModeEquals is_career 
		GoalManager_DeactivateAllGoals 
		Skater : ResetSkaterToCustom 
	ENDIF 
	change_level <...> 
ENDSCRIPT

SCRIPT proj_menu_update_amount 
	Skater : GetAmmo 
	Skater : SetAmmo <value> 
ENDSCRIPT

SCRIPT proj_menu_remove_amount 
	Skater : GetAmmo 
	Skater : SetAmmo 0 
ENDSCRIPT

SCRIPT Remove_my_board 
	Wait 1 gameframe 
	Skater : SwitchOffBoard 
	Wait 1 gameframe 
	Skater : SetBoardMissing 
ENDSCRIPT

SCRIPT fall_underground 
	exit_pause_menu 
	Skater : move Y = -99.00000000000 
ENDSCRIPT

SCRIPT fall_underground1 
	exit_pause_menu 
	Skater : move Y = -29.00000000000 
ENDSCRIPT

SCRIPT fall_sideways 
	exit_pause_menu 
	Skater : move x = 99.00000000000 
ENDSCRIPT

SCRIPT fall_up 
	exit_pause_menu 
	Skater : move Y = 99.00000000000 
ENDSCRIPT

SCRIPT fall_up1 
	exit_pause_menu 
	Skater : move Y = 999.00000000000 
ENDSCRIPT

SCRIPT noclipon 
	MakeSkaterFly 
	Skater : pausephysics 
	exit_pause_menu 
ENDSCRIPT

SCRIPT MakeSkaterFly 
	MakeSkaterGoto FlyAi 
ENDSCRIPT

SCRIPT FlyAi move = 8 
	ClearExceptions 
	SetQueueTricks NoTricks 
	SetSpeed 0 
	setstate AIR 
	SetRollingFriction 1000 
	NoRailTricks 
	BEGIN 
		IF Held R2 
			move Y = -6 
		ENDIF 
		IF Held L1 
			move Y = 6 
		ENDIF 
		IF Held L2 
			IF Held Square 
				move x = 18 
			ENDIF 
			IF Held Circle 
				move x = -18 
			ENDIF 
			IF Held Triangle 
				move z = 18 
			ENDIF 
			IF Held x 
				move z = -18 
			ENDIF 
		ELSE 
			IF Held Square 
				move x = 6 
			ENDIF 
			IF Held Circle 
				move x = -6 
			ENDIF 
			IF Held Triangle 
				move z = 8 
			ENDIF 
			IF Held x 
				move z = -8 
			ENDIF 
		ENDIF 
		waitonegameframe 
	REPEAT 
	AllowRailTricks 
	MakeSkaterGoto onGroundAi 
ENDSCRIPT

obs_is_on = 0 
SCRIPT anteara_observe_obs 
	IF ObjectExists Id = PlayerVehicle 
		MakeSkaterGoto Switch_OnGroundAi params = { NewScript = walking_onGroundAi } 
		anteara_board 
		Skater : UnPausePhysics 
		Skater : AddSkaterToWorld 
	ENDIF 
	SWITCH obs_is_on 
		CASE 0 
			Skater : remove_skater_from_world 
			EnterSurveyorMode 
			Skater : remove_skater_from_world 
			fake_button Type = pad_x 
			Change obs_is_on = 1 
		CASE 1 
			ExitSurveyorMode 
			Skater : add_skater_to_world 
			Change obs_is_on = 0 
	ENDSWITCH 
ENDSCRIPT

SCRIPT set_custom_restart1 
	IF ObjectExists Id = PlayerVehicle 
		NullScript 
	ELSE 
		Skater : SetCustomRestart Set 
	ENDIF 
ENDSCRIPT

SCRIPT skip_to_custom_restart1 
	IF ObjectExists Id = PlayerVehicle 
		NullScript 
	ELSE 
		Skater : SkipToCustomRestart 
	ENDIF 
ENDSCRIPT

SCRIPT kirillgta_clean 
	exit_pause_menu 
	SendChatMessage String = "\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n" 
ENDSCRIPT

SCRIPT test_widescreen 
	SetPreferencesFromUI prefs = network field = "Anteara_Resolution" checksum = Widescreen 
	change_screen_mode wide callback = screen_setup_widescreen set_screen_flags 
	create_anteara_menu 
ENDSCRIPT

SCRIPT test_standard 
	SetPreferencesFromUI prefs = network field = "Anteara_Resolution" checksum = standard 
	change_screen_mode standard callback = screen_setup_standard set_screen_flags 
	create_anteara_menu 
ENDSCRIPT

case_hair = 1 
SCRIPT toggle_TakeAwayHair 
	printf "un/Hide Hair" 
	SWITCH case_hair 
		CASE 0 
			Change case_hair = 1 
			SetScreenElementProps Id = { menu_TakeAwayHair child = 0 } text = "Hair: Visible" 
			Skater : TurnOnHair 
		CASE 1 
			Change case_hair = 0 
			SetScreenElementProps Id = { menu_TakeAwayHair child = 0 } text = "Hair: Invisible" 
			Skater : TakeAwayHair 
	ENDSWITCH 
ENDSCRIPT

case_head = 1 
SCRIPT toggle_TakeAwayHead 
	printf "un/Hide Head" 
	SWITCH case_head 
		CASE 0 
			Change case_head = 1 
			SetScreenElementProps Id = { menu_TakeAwayHead child = 0 } text = "Head: Visible" 
			Skater : TurnOnHead 
		CASE 1 
			Change case_head = 0 
			SetScreenElementProps Id = { menu_TakeAwayHead child = 0 } text = "Head: Invisible" 
			Skater : TakeAwayHead 
	ENDSWITCH 
ENDSCRIPT

case_torso = 1 
SCRIPT toggle_TakeAwayTorso 
	printf "un/Hide Torso" 
	SWITCH case_torso 
		CASE 0 
			Change case_torso = 1 
			SetScreenElementProps Id = { menu_TakeAwayTorso child = 0 } text = "Torso: Visible" 
			Skater : TurnOnTorso 
		CASE 1 
			Change case_torso = 0 
			SetScreenElementProps Id = { menu_TakeAwayTorso child = 0 } text = "Torso: Invisible" 
			Skater : TakeAwayTorso 
	ENDSWITCH 
ENDSCRIPT

case_legs = 1 
SCRIPT toggle_TakeAwayLegs 
	printf "un/Hide Legs" 
	SWITCH case_legs 
		CASE 0 
			Change case_legs = 1 
			SetScreenElementProps Id = { menu_TakeAwayLegs child = 0 } text = "Legs: Visible" 
			Skater : TurnOnLegs 
		CASE 1 
			Change case_legs = 0 
			SetScreenElementProps Id = { menu_TakeAwayLegs child = 0 } text = "Legs: Invisible" 
			Skater : TakeAwayLegs 
	ENDSWITCH 
ENDSCRIPT

case_hands = 1 
SCRIPT toggle_TakeAwayHands 
	printf "un/Hide Hands" 
	SWITCH case_hands 
		CASE 0 
			Change case_hands = 1 
			SetScreenElementProps Id = { menu_TakeAwayHand child = 0 } text = "Hands: Visible" 
			Skater : TurnOnHands 
		CASE 1 
			Change case_hands = 0 
			SetScreenElementProps Id = { menu_TakeAwayHand child = 0 } text = "Hands: Invisible" 
			Skater : TakeAwayHands 
	ENDSWITCH 
ENDSCRIPT

case_shoes = 1 
SCRIPT toggle_TakeAwayShoes 
	printf "un/Hide Shoes" 
	SWITCH case_shoes 
		CASE 0 
			Change case_shoes = 1 
			SetScreenElementProps Id = { menu_TakeAwayShoes child = 0 } text = "Shoes: Visible" 
			Skater : TurnOnShoes 
		CASE 1 
			Change case_shoes = 0 
			SetScreenElementProps Id = { menu_TakeAwayShoes child = 0 } text = "Shoes: Invisible" 
			Skater : TakeAwayShoes 
	ENDSWITCH 
ENDSCRIPT

SCRIPT TakeAwayHair 
	SwitchOffAtomic skater_m_hair 
	SwitchOffAtomic skater_f_hair 
	SwitchOffAtomic skater_f_hat_hair 
ENDSCRIPT

SCRIPT TakeAwayHead 
	SwitchOffAtomic skater_m_head 
	SwitchOffAtomic skater_f_head 
ENDSCRIPT

SCRIPT TakeAwayTorso 
	SwitchOffAtomic skater_m_torso 
	SwitchOffAtomic skater_f_torso 
ENDSCRIPT

SCRIPT TakeAwayLegs 
	SwitchOffAtomic skater_m_legs 
	SwitchOffAtomic skater_f_legs 
ENDSCRIPT

SCRIPT TakeAwayHands 
	SwitchOffAtomic skater_m_hands 
	SwitchOffAtomic skater_f_hands 
ENDSCRIPT

SCRIPT TakeAwayShoes 
	SwitchOffAtomic shoes 
ENDSCRIPT

SCRIPT TurnOnHair 
	SwitchOnAtomic skater_m_hair 
	SwitchOnAtomic skater_f_hair 
	SwitchOnAtomic skater_f_hat_hair 
ENDSCRIPT

SCRIPT TurnOnHead 
	SwitchOnAtomic skater_m_head 
	SwitchOnAtomic skater_f_head 
ENDSCRIPT

SCRIPT TurnOnTorso 
	SwitchOnAtomic skater_m_torso 
	SwitchOnAtomic skater_f_torso 
ENDSCRIPT

SCRIPT TurnOnLegs 
	SwitchOnAtomic skater_m_legs 
	SwitchOnAtomic skater_f_legs 
ENDSCRIPT

SCRIPT TurnOnShoes 
	SwitchOnAtomic shoes 
ENDSCRIPT

SCRIPT TurnOnHands 
	SwitchOnAtomic skater_m_hands 
	SwitchOnAtomic skater_f_hands 
ENDSCRIPT

SCRIPT anteara_bounds 
	Change TODManager_SetActive 1 
	Change tod_manager_active = 1 
	Change TOD_OFF = 0 
ENDSCRIPT

case_RunOutTimer = 1 
SCRIPT toggle_SwitchOffTimer 
	printf "On/Off Timer" 
	SWITCH case_RunOutTimer 
		CASE 0 
			Change case_RunOutTimer = 1 
			SetScreenElementProps Id = { menu_SwitchOffRunOutTimer child = 0 } text = "Infinite Run Out Timer: Off" 
			anteara_timeroff 
		CASE 1 
			Change case_RunOutTimer = 0 
			SetScreenElementProps Id = { menu_SwitchOffRunOutTimer child = 0 } text = "Infinite Run Out Timer: On" 
			anteara_timeron 
	ENDSWITCH 
ENDSCRIPT

case_WallJump = 1 
SCRIPT toggle_SwitchOffWallJump 
	printf "On/Off Walljump" 
	SWITCH case_WallJump 
		CASE 0 
			Change case_WallJump = 1 
			SetScreenElementProps Id = { menu_SwitchOffWallJump child = 0 } text = "Infinite Wall Jumps: Off" 
			walljumpoff 
		CASE 1 
			Change case_WallJump = 0 
			SetScreenElementProps Id = { menu_SwitchOffWallJump child = 0 } text = "Infinite Wall Jumps: On" 
			walljumpon 
	ENDSWITCH 
ENDSCRIPT

case_WallSkate = 1 
SCRIPT toggle_SwitchOffWallSkate 
	printf "On/Off Wallskate" 
	SWITCH case_WallSkate 
		CASE 0 
			Change case_WallSkate = 1 
			SetScreenElementProps Id = { menu_SwitchOffWallSkate child = 0 } text = "Skate on Walls: Off" 
			wallskateoff 
		CASE 1 
			Change case_WallSkate = 0 
			SetScreenElementProps Id = { menu_SwitchOffWallSkate child = 0 } text = "Skate on Walls: On" 
			Skater : wallskateon 
	ENDSWITCH 
ENDSCRIPT

case_NoClip = 1 
SCRIPT toggle_SwitchOffNoClip 
	printf "on/Off NoClip" 
	SWITCH case_NoClip 
		CASE 0 
			Change case_NoClip = 1 
			SetScreenElementProps Id = { menu_SwitchOffNoClip child = 0 } text = "No Clip: Off" 
			MakeSkaterGoto Switch_OnGroundAi params = { NewScript = walking_onGroundAi } 
			Skater : UnPausePhysics 
		CASE 1 
			Change case_NoClip = 0 
			SetScreenElementProps Id = { menu_SwitchOffNoClip child = 0 } text = "No Clip: On" 
			MakeSkaterGoto Switch_OnGroundAi params = { NewScript = onGroundAi } 
			Skater : pausephysics 
			MakeSkaterFly 
			Skater : pausephysics 
	ENDSWITCH 
ENDSCRIPT

case_NO_BOUNDS = 1 
SCRIPT toggle_SwitchNoBounds 
	SWITCH case_NO_BOUNDS 
		CASE 0 
			Change case_NO_BOUNDS = 1 
			SetScreenElementProps Id = { menu_SwitchNoBounds child = 0 } text = "No Out Of Bounds: Off" 
			UnSetGlobalFlag flag = FREEMAN_BOUND 
		CASE 1 
			Change case_NO_BOUNDS = 0 
			SetScreenElementProps Id = { menu_SwitchNoBounds child = 0 } text = "No Out Of Bounds: On" 
			SetGlobalFlag flag = FREEMAN_BOUND 
	ENDSWITCH 
ENDSCRIPT

case_Observe = 1 
SCRIPT toggle_SwitchOffObserve 
	printf "On/Off Observe" 
	SWITCH case_Observe 
		CASE 0 
			Change case_Observe = 1 
			SetScreenElementProps Id = { menu_SwitchOffObserve child = 0 } text = "Observing: Off" 
			Skater : add_skater_to_world 
			ExitSurveyorMode 
			Change obs_is_on = 0 
		CASE 1 
			Change case_Observe = 0 
			SetScreenElementProps Id = { menu_SwitchOffObserve child = 0 } text = "Observing: On" 
			Skater : remove_skater_from_world 
			EnterSurveyorMode 
			Change obs_is_on = 1 
	ENDSWITCH 
ENDSCRIPT

case_Airshuffle = 1 
SCRIPT toggle_SwitchOffAirshuffle 
	SWITCH case_Airshuffle 
		CASE 0 
			Change case_Airshuffle = 1 
			SetScreenElementProps Id = { menu_SwitchOffAirshuffle child = 0 } text = "Airshuffle (DownLeft + Flip): Off" 
			UnSetGlobalFlag flag = ANTEARA_AIRSHUFFLE 
		CASE 1 
			Change case_Airshuffle = 0 
			SetScreenElementProps Id = { menu_SwitchOffAirshuffle child = 0 } text = "Airshuffle (DownLeft + Flip): On" 
			SetGlobalFlag flag = ANTEARA_AIRSHUFFLE 
	ENDSWITCH 
ENDSCRIPT

SCRIPT anteara_noclipoff 
	Skater : UnPausePhysics 
ENDSCRIPT

SCRIPT walljumpon 
	Change Physics_Disallow_Rewallplant_Duration = 0 
ENDSCRIPT

SCRIPT walljumpoff 
	Change Physics_Disallow_Rewallplant_Duration = 850 
ENDSCRIPT

SCRIPT wallskateon 
	Change Wall_Non_Skatable_Angle = 0 
ENDSCRIPT

SCRIPT wallskateoff 
	Change Wall_Non_Skatable_Angle = 25 
ENDSCRIPT

SCRIPT anteara_timeron 
	Change Physics_RunTimer_Duration = { PAIR(50000.00000000000, 20000.00000000000) STATS_RUN switch = no_switch } 
ENDSCRIPT

SCRIPT anteara_timeroff 
	Change Physics_RunTimer_Duration = { PAIR(2.00000000000, 3.00000000000) STATS_RUN switch = no_switch } 
ENDSCRIPT

SCRIPT wallshuffleon 
	Change wall_ride_delay = 0.00000000000 
ENDSCRIPT

SCRIPT wallshuffleoff 
	Change wall_ride_delay = 0.66600000858 
ENDSCRIPT

case_anteara_text_colour = 5 
SCRIPT toggle_SwitchTextColour 
	printf "Text Colour" 
	SWITCH case_anteara_text_colour 
		CASE 5 
			Change case_anteara_text_colour = 6 
			SetScreenElementProps Id = { menu_SwitchTextColour child = 0 } text = "Text Colour: Orange" 
			SetPreferencesFromUI prefs = network field = "TextColor" checksum = color_cb 
		CASE 6 
			Change case_anteara_text_colour = 7 
			SetScreenElementProps Id = { menu_SwitchTextColour child = 0 } text = "Text Colour: Green" 
			SetPreferencesFromUI prefs = network field = "TextColor" checksum = color_c4 
		CASE 7 
			Change case_anteara_text_colour = 8 
			SetScreenElementProps Id = { menu_SwitchTextColour child = 0 } text = "Text Colour: Pink" 
			SetPreferencesFromUI prefs = network field = "TextColor" checksum = color_cL 
		CASE 8 
			Change case_anteara_text_colour = 5 
			SetScreenElementProps Id = { menu_SwitchTextColour child = 0 } text = "Text Colour: White" 
			SetPreferencesFromUI prefs = network field = "TextColor" checksum = color_c0 
	ENDSWITCH 
ENDSCRIPT

case_give_ammo = 5 
SCRIPT toggle_SwitchAmmoNum 
	printf "On/Off Ammo" 
	SWITCH case_give_ammo 
		CASE 5 
			Change case_give_ammo = 6 
			SetScreenElementProps Id = { menu_SwitchAmmoNum child = 0 } text = "Ammo: 500" 
			Skater : GetAmmo 
			Skater : SetAmmo 500 
		CASE 6 
			Change case_give_ammo = 7 
			SetScreenElementProps Id = { menu_SwitchAmmoNum child = 0 } text = "Ammo: 1000" 
			Skater : GetAmmo 
			Skater : SetAmmo 1000 
		CASE 7 
			Change case_give_ammo = 5 
			SetScreenElementProps Id = { menu_SwitchAmmoNum child = 0 } text = "Ammo: 0" 
			Skater : GetAmmo 
			Skater : SetAmmo 0 
	ENDSWITCH 
ENDSCRIPT

case_Color = 10 
SCRIPT toggle_SwitchColor 
	printf "On/Off Color" 
	SWITCH case_Color 
		CASE 5 
			Change case_Color = 6 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: Green" 
			Change DE_BALANCE_METER_COLOR = [ 0 255 18 100 ] 
		CASE 6 
			Change case_Color = 7 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: Red" 
			Change DE_BALANCE_METER_COLOR = [ 255 0 0 100 ] 
		CASE 7 
			Change case_Color = 8 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: Light Blue" 
			Change DE_BALANCE_METER_COLOR = [ 0 252 255 100 ] 
		CASE 8 
			Change case_Color = 9 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: Yellow" 
			Change DE_BALANCE_METER_COLOR = [ 125 107 34 128 ] 
		CASE 9 
			Change case_Color = 10 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: Default Blue" 
			Change DE_BALANCE_METER_COLOR = [ 15 82 117 128 ] 
		CASE 10 
			Change case_Color = 11 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: White" 
			Change DE_BALANCE_METER_COLOR = [ 255 255 255 100 ] 
		CASE 11 
			Change case_Color = 5 
			SetScreenElementProps Id = { menu_SwitchColor child = 0 } text = "Balance Bar Colour: Pink" 
			Change DE_BALANCE_METER_COLOR = [ 225 18 213 100 ] 
	ENDSWITCH 
ENDSCRIPT

case_ColorTwo = 9 
SCRIPT toggle_SwitchColorTwo 
	printf "On/Off ColorTwo" 
	SWITCH case_ColorTwo 
		CASE 5 
			Change case_ColorTwo = 6 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: Green" 
			Change DE_BALANCE_ARROW_COLOR = [ 0 255 18 100 ] 
		CASE 6 
			Change case_ColorTwo = 7 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: Red" 
			Change DE_BALANCE_ARROW_COLOR = [ 255 0 0 100 ] 
		CASE 7 
			Change case_ColorTwo = 8 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: Light Blue" 
			Change DE_BALANCE_ARROW_COLOR = [ 0 252 255 100 ] 
		CASE 8 
			Change case_ColorTwo = 9 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: Yellow" 
			Change DE_BALANCE_ARROW_COLOR = [ 125 107 34 128 ] 
		CASE 9 
			Change case_ColorTwo = 10 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: Default Blue" 
			Change DE_BALANCE_ARROW_COLOR = [ 15 82 117 128 ] 
		CASE 10 
			Change case_ColorTwo = 11 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: White" 
			Change DE_BALANCE_ARROW_COLOR = [ 255 255 255 100 ] 
		CASE 11 
			Change case_ColorTwo = 5 
			SetScreenElementProps Id = { menu_SwitchColorTwo child = 0 } text = "Balance Arrow Colour: Pink" 
			Change DE_BALANCE_ARROW_COLOR = [ 225 18 213 100 ] 
	ENDSWITCH 
ENDSCRIPT

case_Ammo = 5 
SCRIPT toggle_SwitchAmmo 
	printf "Select Ammo type" 
	SWITCH case_Ammo 
		CASE 5 
			Change case_Ammo = 6 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Apple" 
			Skater : SetAmmoType apple 
		CASE 6 
			Change case_Ammo = 7 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Shrimp" 
			Skater : SetAmmoType shrimp 
		CASE 7 
			Change case_Ammo = 8 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Smokebomb" 
			Skater : SetAmmoType smokebomb 
		CASE 8 
			Change case_Ammo = 9 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Paintcan" 
			Skater : SetAmmoType paintcan 
		CASE 9 
			Change case_Ammo = 10 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Skateboard" 
			Skater : SetAmmoType skateboard 
		CASE 10 
			Change case_Ammo = 11 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Crystal Ball" 
			Skater : SetAmmoType Crystal_Ball 
		CASE 11 
			Change case_Ammo = 5 
			SetScreenElementProps Id = { menu_SwitchAmmo child = 0 } text = "Ammo Type: Tomato" 
			Skater : SetAmmoType tomato 
	ENDSWITCH 
ENDSCRIPT


