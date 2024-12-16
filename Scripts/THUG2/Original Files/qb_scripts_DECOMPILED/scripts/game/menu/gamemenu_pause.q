
SCRIPT create_pause_menu 
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
	IF InNetGame 
		IF NOT IsObserving 
			Skater : NetDisablePlayerInput 
		ENDIF 
	ELSE 
		IF CustomParkMode editing 
			parked_setup_main_menu 
			PauseMusicAndStreams 1 
			build_pause_menu_parts 
			RETURN 
		ENDIF 
		IF CustomParkMode testing 
			parked_setup_test_play_menu 
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
			change music_was_paused = 1 
		ELSE 
			change music_was_paused = 0 
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
			pad_back_script = nullscript 
			pos = PAIR(250.00000000000, 95.00000000000) 
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
			pos = PAIR(250.00000000000, 95.00000000000) 
			dims = PAIR(250.00000000000, 480.00000000000) 
			internal_text_just = right 
			helper_text = <helper> 
			add_3d_bg 
		} 
	ENDIF 
	do_localized_pause_title pos = PAIR(500.00000000000, 95.00000000000) 
	kill_start_key_binding 
	pause_menu_gradient right 
	add_music_track_text pos = PAIR(575.00000000000, 320.00000000000) 
	IF GameModeEquals is_singlesession 
		add_roundbar_menu_item { text = "CONTINUE" 
			id = menu_continue 
			pad_choose_script = handle_pause_continue 
			pad_choose_sound = generic_pause_exit_sound 
		} 
		IF GoalManager_goalIsActive name = TrickAttack 
			add_roundbar_menu_item { 
				text = "RETRY HIGH SCORE RUN" 
				id = menu_retry_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal } 
			} 
			add_roundbar_menu_item { 
				text = "END HIGH SCORE RUN" 
				id = menu_end_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = end_high_score_run } 
			} 
		ELSE 
			add_roundbar_menu_item { 
				text = "START HIGH SCORE RUN" 
				id = menu_start_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = TrickAttack_MenuStartRun } 
			} 
		ENDIF 
	ELSE 
		IF NOT GotParam no_exit 
			add_roundbar_menu_item { text = "CONTINUE" 
				id = menu_continue 
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
							add_roundbar_menu_item text = "RETRY LAST GOAL" id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_vibration menu_select_script = RetryCurrentGoal } 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		add_roundbar_menu_item text = "VIEW GOALS" id = menu_view_goals pad_choose_script = create_view_selected_goals_menu pad_choose_params = { from_pause } 
	ENDIF 
	IF GameModeEquals is_career 
		goal_id = ( goal_utility_allow_end_goal_name ) 
		IF NOT ChecksumEquals a = <goal_id> b = null 
			IF GoalManager_GoalExists name = <goal_id> 
				IF GoalManager_goalIsActive name = <goal_id> 
					add_roundbar_menu_item text = "END CURRENT RUN" id = menu_end_run pad_choose_script = arcade_machine_end_run pad_choose_params = { goal_id = <goal_id> } 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GoalManager_CanRetryGoal 
			add_roundbar_menu_item text = "RETRY LAST GOAL" id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_vibration stop_streams menu_select_script = RetryCurrentGoal } 
		ENDIF 
		IF NOT LevelIs load_se 
			add_roundbar_menu_item text = "VIEW GOALS" id = menu_chapters pad_choose_script = view_goals_menu_create 
		ENDIF 
		add_roundbar_menu_item text = "TEXT MESSAGES" id = menu_pager pad_choose_script = pager_window_create 
	ELSE 
		IF GameModeEquals is_creategoals 
			IF GoalManager_HasActiveGoals 
				add_roundbar_menu_item text = "END CURRENT GOAL" id = menu_end_current_goal pad_choose_script = menu_select pad_choose_params = { menu_select_script = end_current_goal_run } 
			ENDIF 
			add_roundbar_menu_item text = "VIEW GOALS" id = menu_view_goals pad_choose_script = view_created_goals_menu_create 
			IF NOT LevelIs load_sk5ed_gameplay 
				add_roundbar_menu_item text = "CREATE A GOAL" id = menu_create_a_goal pad_choose_script = create_existing_goals_menu 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_classic 
		classic_mode_menu_add_pause_options 
	ENDIF 
	IF GameModeEquals is_creategoals 
		IF NOT LevelIs load_sk5ed_gameplay 
			add_roundbar_menu_item text = "LOAD GOALS" id = menu_load_goals pad_choose_script = prompt_launch_cag_pause_load 
			GoalEditor : GetNumEditedGoals ExcludeParkEditorGoals 
			IF ( <NumGoals> = 0 ) 
				no_edited_goals = 1 
			ENDIF 
			add_roundbar_menu_item text = "SAVE GOALS" id = menu_save_goals pad_choose_script = launch_pause_menu_save_created_goals not_focusable = <no_edited_goals> 
		ENDIF 
	ENDIF 
	display_level_select = 1 
	IF InNetGame 
		display_level_select = 0 
	ENDIF 
	IF GameModeEquals is_classic 
		IF NOT GotParam no_exit 
			display_level_select = 0 
		ENDIF 
	ENDIF 
	IF ( <display_level_select> = 1 ) 
		add_roundbar_menu_item { text = "CHANGE LEVEL" 
			id = menu_level_select 
			pad_choose_script = launch_level_select_menu 
			tag_grid_x = 1 
		} 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			IF GameModeEquals is_lobby 
				IF NOT NetworkGamePending 
					IF NOT ChangeLevelPending 
						add_roundbar_menu_item text = "START GAME" id = menu_network_start_select pad_choose_script = network_game_options_selected 
					ENDIF 
				ENDIF 
			ELSE 
				add_roundbar_menu_item text = "END CURRENT GAME" id = menu_network_end_select pad_choose_script = network_end_game_selected 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT NetworkGamePending 
			IF OnServer 
				IF OnXbox 
					add_roundbar_menu_item text = "HOST OPTIONS" id = menu_network_server_opts_select pad_choose_script = network_options_selected 
				ELSE 
					add_roundbar_menu_item text = "SERVER OPTIONS" id = menu_network_server_opts_select pad_choose_script = network_options_selected 
				ENDIF 
			ENDIF 
			IF IsHost 
				IF GameModeEquals is_lobby 
					IF NOT OnServer 
						IF OnXbox 
							add_roundbar_menu_item text = "HOST OPTIONS" id = menu_network_server_opts_select pad_choose_script = network_options_selected 
						ELSE 
							add_roundbar_menu_item text = "SERVER OPTIONS" id = menu_network_server_opts_select pad_choose_script = network_options_selected 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT IsObserving 
			<game_active> = 0 
			IF GoalManager_HasActiveGoals count_all 
				<game_active> = 1 
			ENDIF 
			IF ( <game_active> = 1 ) 
				<trick_text> = "VIEW TRICKS" 
				<trick_helper> = view_tricks_helper_desc 
			ELSE 
				IF NOT GoalManager_HasActiveGoals 
					<trick_text> = "EDIT TRICKS" 
					<trick_helper> = edit_tricks_helper_desc 
				ELSE 
					<trick_text> = "VIEW TRICKS" 
					<trick_helper> = view_tricks_helper_desc 
				ENDIF 
			ENDIF 
			add_roundbar_menu_item text = <trick_text> id = menu_cas pad_choose_script = create_edit_tricks_menu 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			IF GameModeEquals is_lobby 
				IF NOT NetworkGamePending 
					IF NOT ChangeLevelPending 
						add_roundbar_menu_item text = "CHANGE LEVEL" id = menu_level_select pad_choose_script = launch_level_select_menu pad_choose_params = { show_warning } 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		IF OnXbox 
			IF IsTrue bootstrap_build 
				add_roundbar_menu_item text = "PLAYER LIST" id = menu_network_remove_select pad_choose_script = launch_remove_players_menu not_focusable = not_focusable 
			ELSE 
				add_roundbar_menu_item text = "PLAYER LIST" id = menu_network_player_list_select pad_choose_script = launch_player_list_menu 
				IF ProfileLoggedIn 
					add_roundbar_menu_item text = "HOMIE LIST" id = menu_network_homie_list_select pad_choose_script = launch_homie_list 
					IF AnyBuddyMessagesLeft 
						add_roundbar_menu_item text = "VIEW MESSAGES" id = menu_network_homie_list_view pad_choose_script = view_buddy_messages 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT InNetGame 
		IF GameModeEquals is_career 
			GetChapterSelectableProCount 
			IF ( <selectable_pro_count> > 1 ) 
				GetCurrentSkaterProfileIndex 
				GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
				IF ChecksumEquals a = <skater_family> b = family_pro 
					IF Skater : IsInBail 
						pro_focus_param = not_focusable 
					ELSE 
						pro_focus_param = { } 
					ENDIF 
					add_roundbar_menu_item text = "CHANGE PRO" id = menu_change_pro pad_choose_script = create_select_pro_menu <pro_focus_param> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT InNetGame 
		add_roundbar_menu_item text = "YOUR OPTIONS" id = menu_your_options pad_choose_script = create_your_options_menu 
	ENDIF 
	add_roundbar_menu_item text = "GAME OPTIONS" id = menu_game_options pad_choose_script = create_options_menu 
	IF NOT CD 
		IF ( main_menu_jump_to_cas = 1 ) 
			add_roundbar_menu_item text = "BACK TO CAS" id = debug_cas_menu pad_choose_script = create_pre_cas_menu pad_choose_params = { load_assets = 1 } 
		ENDIF 
	ENDIF 
	IF InNetGame 
		add_roundbar_menu_item text = "CHAT MESSAGE" id = menu_chat pad_choose_script = launch_chat_keyboard 
		IF NOT OnServer 
			IF NOT IsObserving 
				IF InInternetMode 
					IF IsTrue bootstrap_build 
						IF NOT GoalManager_HasActiveGoals 
							add_roundbar_menu_item text = "OBSERVE" id = menu_network_observe_select pad_choose_script = chose_observe not_focusable = not_focusable 
						ENDIF 
					ELSE 
						IF NOT GoalManager_HasActiveGoals 
							add_roundbar_menu_item text = "OBSERVE" id = menu_network_observe_select pad_choose_script = chose_observe 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		add_roundbar_menu_item text = "QUIT" id = menu_quit pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_quit_game_dialog } 
	ELSE 
		IF CustomParkMode testing 
			
			add_roundbar_menu_item text = "BACK TO EDITOR" id = menu_skateshop pad_choose_script = menu_confirm_quit pad_choose_params = { yes_script = exit_test_play } 
		ELSE 
			IF GameModeEquals is_classic 
				classic_mode_menu_add_quit_option 
			ELSE 
				add_roundbar_menu_item { text = "QUIT" 
					id = menu_skateshop 
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
	add_roundbar_menu_item text = "Continue" id = menu_continue pad_choose_script = handle_start_pressed 
	add_roundbar_menu_item text = "End Current Game" id = menu_network_end_select pad_choose_script = network_end_game_selected 
	add_roundbar_menu_item text = "Options" id = menu_mp_options pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_options_menu } 
	add_roundbar_menu_item text = "Quit" id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit } 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT do_localized_pause_title pos = PAIR(500.00000000000, 40.00000000000) 
	IF IsPAL 
		IF NOT English 
			CreateScreenElement { 
				type = TextElement 
				parent = current_menu_anchor 
				id = localized_pause_title 
				font = small 
				text = "PAUSED" 
				pos = <pos> 
				just = [ right bottom ] 
				scale = 2 
				rgba = [ 128 40 10 128 ] 
				shadow 
				shadow_rgba = [ 0 , 0 , 0 , 128 ] 
				shadow_offs = PAIR(3.00000000000, 3.00000000000) 
				z_priority = 50 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT exit_pause_menu menu_id = current_menu_anchor 
	change check_for_unplugged_controllers = 0 
	IF ScreenElementExists id = current_menu_anchor 
		FireEvent type = unfocus target = current_menu_anchor 
	ENDIF 
	ClearViewerObject 
	Debounce X time = 0.30000001192 
	Debounce Triangle time = 0.30000001192 
	pause_menu_gradient off 
	change inside_pause = 0 
	change no_focus_sound = 1 
	IF NOT CD 
		change viewer_buttons_enabled = 1 
	ENDIF 
	show_all_hud_items 
	IF InNetGame 
		IF NOT IsObserving 
			IF ObjectExists id = Skater 
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
		SpawnScript SFX_refresh_music_box_triggers params = { wait } 
	ENDIF 
	unpause_rain 
	GoalManager_UnPauseAllGoals 
	IF ObjectExists id = <menu_id> 
		DestroyScreenElement id = <menu_id> 
	ENDIF 
	SetScreenElementProps id = root_window tags = { menu_state = off } 
	IF CustomParkMode editing 
		IF NOT GotParam DoNotSwitchEditorState 
			SetParkEditorState state = edit 
			SetParkEditorPauseMode unpause 
			SwitchToParkEditorCamera 
		ENDIF 
	ENDIF 
	IF NOT GotParam dont_restore_start_key_binding 
		restore_start_key_binding 
	ENDIF 
	menu3d_hide 
	IF NOT InNetGame 
		IF NOT GameModeEquals is_horse 
			unpauseskaters 
		ENDIF 
	ENDIF 
	change check_for_unplugged_controllers = 1 
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


