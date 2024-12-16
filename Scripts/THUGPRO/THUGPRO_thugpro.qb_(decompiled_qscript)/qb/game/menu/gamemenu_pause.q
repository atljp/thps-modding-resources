
SCRIPT parked_setup_main_menu_updated 
	IF NOT IsTrue temp_parked_height_patch_disabled 
		THUGPRO_ParkEdHeightPatch off 
		Change temp_parked_height_patch_disabled = 1 
	ENDIF 
	SetParkEditorPauseMode pause 
	ParkUpdateUsageInfo 
	dialog_box_exit no_pad_start 
	destroy_onscreen_keyboard 
	thugpro_menu_create { 
		menu_name = park_editor_pause 
		menu_title = "Editor Paused" 
		menu_style = MENU_STYLE_CUSTOM 
		menu_pos = PAIR(-20.00000000000, 88.00000000000) 
		menu_internal_just = [ center center ] 
		menu_bg_just = left 
		helper_text = generic_helper_text 
		show_description_panel 
		show_gradient 
	} 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ 
			{ pad_back generic_pause_exit_sound } 
			{ pad_back parked_continue_editing params = { } } 
			{ pad_start parked_continue_editing params = { } } 
		] 
	} 
	IF GotParam from_start 
		generic_create_pause_menu_sound_thug2 
	ENDIF 
	make_thugpro_menu_item { 
		text = "continue" 
		id = menu_continue 
		pad_choose_script = parked_continue_editing 
	} 
	make_thugpro_menu_item { 
		text = "test play" 
		id = menu_test_park 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { new_menu_script = parked_test_play } 
	} 
	make_thugpro_menu_item { 
		text = "create a goal" 
		id = menu_create_a_goal 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { new_menu_script = parked_create_a_goal } 
	} 
	make_thugpro_menu_item { 
		text = "park properties" 
		id = menu_park_props 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { new_menu_script = parked_create_park_props } 
	} 
	make_thugpro_menu_item { 
		text = "nuke park" 
		id = menu_clear_park 
		pad_choose_script = menu_confirm_quit 
		pad_choose_params = { yes_script = parked_clear_park title = "CLEAR PARK?" } 
	} 
	make_thugpro_menu_item { 
		text = "save park" 
		id = menu_save_park_mem 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { new_menu_script = launch_pause_menu_save_park_sequence } 
	} 
	make_thugpro_menu_item { 
		text = "load park" 
		id = menu_load_park_mem 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { new_menu_script = parked_confirm_load_park } 
	} 
	make_thugpro_menu_item { 
		text = "load pre-made park" 
		id = menu_load_park 
		pad_choose_script = parked_confirm_disk_load_park 
	} 
	make_thugpro_menu_item { 
		text = "quit" 
		id = menu_skateshop 
		pad_choose_script = parked_quit_chosen 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT parked_create_park_props 
	thugpro_menu_create { 
		menu_name = park_props 
		menu_title = "Park properties" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_pause_menu 
		helper_text = generic_helper_text 
		show_description_panel 
		boxed 
	} 
	make_thugpro_menu_item { 
		id = menu_switch_theme 
		text = "Switch theme" 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { 
			new_menu_script = parked_setup_switch_theme_menu_updated 
		} 
	} 
	make_thugpro_menu_item { 
		id = menu_resize_park 
		text = "Resize park" 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { 
			new_menu_script = parked_setup_new_resize_screen 
		} 
	} 
	GetParkEditorMaxPlayers 
	FormatText TextName = max_players_extra_text "%a" a = <MaxPlayers> 
	make_thugpro_menu_item { 
		id = menu_max_players 
		text = "Max players" 
		extra_text = <max_players_extra_text> 
		option_arrows_callback = toggle_park_editor_max_players 
		option_arrows pad_choose 
	} 
	IF THUGPRO_ParkEdHacksOn 
		<parked_hacks_extra_text> = "OFF" 
	ELSE 
		<parked_hacks_extra_text> = "ON" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_park_ed_limits 
		text = "Limits" 
		description_text = "Allows stacking/merged pieces and infinite cap space... (Unstable)" 
		extra_text = <parked_hacks_extra_text> 
		option_arrows_callback = toggle_ParkEdHacks 
		option_arrows pad_choose 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT toggle_park_editor_max_players 
	GetTags 
	GetParkEditorMaxPlayers 
	GetParkEditorMaxPlayersPossible 
	IF ( <MaxPlayersPossible> > 8 ) 
		<MaxPlayersPossible> = 8 
	ENDIF 
	IF GotParam right 
		index_next_wraparound_2 { index = <MaxPlayers> min = 2 max = <MaxPlayersPossible> } 
	ELSE 
		index_previous_wraparound_2 { index = <MaxPlayers> min = 2 max = <MaxPlayersPossible> } 
	ENDIF 
	SetParkEditorMaxPlayers <new_index> 
	FormatText TextName = max_players_extra_text "%a" a = <new_index> 
	thugpro_menu_item_update_extra_text id = <id> text = <max_players_extra_text> 
ENDSCRIPT

SCRIPT toggle_ParkEdHacks 
	GetTags 
	IF THUGPRO_ParkEdHacksOn 
		THUGPRO_ParkEdHacks off 
		thugpro_save_key_value Key = "ParkEdHacks" value = 0 
		thugpro_menu_item_update_extra_text id = <id> on 
	ELSE 
		THUGPRO_ParkEdHacks on 
		thugpro_save_key_value Key = "ParkEdHacks" value = 1 
		thugpro_menu_item_update_extra_text id = <id> off 
	ENDIF 
ENDSCRIPT

SCRIPT parked_setup_switch_theme_menu_updated 
	thugpro_menu_create { 
		menu_name = park_shell 
		menu_title = "Switch Theme" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = parked_create_park_props 
		scrolling 
		boxed 
	} 
	GetEditorMaxThemes 
	i = 0 
	BEGIN 
		GenerateLevelStructureNameFromTheme theme = <i> 
		IF StructureContains structure = <structure_name> theme_name 
			FormatText ChecksumName = id "menu_set_theme_%d" d = ( <structure_name> . theme_name ) 
			make_thugpro_menu_item { 
				id = <id> 
				text = ( <structure_name> . theme_name ) 
				pad_choose_script = parked_set_theme 
				pad_choose_params = { theme = <i> from_menu } 
				centered 
			} 
		ENDIF 
		<i> = ( <i> + 1 ) 
	REPEAT <max_themes> 
	GetEditorTheme 
	GenerateLevelStructureNameFromTheme theme = <theme> 
	FormatText ChecksumName = focus_target "menu_set_theme_%d" d = ( <structure_name> . theme_name ) 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT parked_setup_test_play_menu_updated 
	IF NOT IsTrue temp_parked_height_patch_disabled 
		THUGPRO_ParkEdHeightPatch off 
		Change temp_parked_height_patch_disabled = 1 
	ENDIF 
	SetParkEditorPauseMode pause 
	thugpro_menu_create { 
		menu_name = game_pause 
		menu_title = "Paused" 
		menu_style = MENU_STYLE_CUSTOM 
		menu_pos = PAIR(-20.00000000000, 88.00000000000) 
		menu_internal_just = [ center center ] 
		menu_bg_just = left 
		helper_text = generic_helper_text 
		pause_menu 
		show_description_panel 
		show_gradient 
	} 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ 
			{ pad_back generic_pause_exit_sound } 
			{ pad_back parked_continue_test_play params = { } } 
			{ pad_start parked_continue_test_play params = { } } 
		] 
	} 
	kill_start_key_binding 
	IF GotParam from_start 
		generic_create_pause_menu_sound_thug2 
	ENDIF 
	make_thugpro_menu_item { 
		text = "continue" 
		id = menu_continue 
		pad_choose_script = parked_continue_test_play 
	} 
	IF GoalManager_CanRetryGoal 
		IF GoalManager_GetLastGoalId 
			IF NOT GoalManager_HasWonGoal name = <goal_id> 
				make_thugpro_menu_item { 
					text = "retry last goal" 
					id = menu_retry_goal 
					pad_choose_script = menu_select 
					pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal } 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GoalManager_HasActiveGoals 
		make_thugpro_menu_item { 
			text = "end current goal" 
			id = menu_end_current_goal 
			pad_choose_script = menu_select 
			pad_choose_params = { menu_select_script = end_current_goal_run } 
		} 
	ENDIF 
	make_thugpro_menu_item { 
		text = "view goals" 
		id = menu_view_goals 
		pad_choose_script = view_created_goals_menu_create 
	} 
	make_thugpro_menu_item { 
		text = "view gaps" 
		id = menu_skip_to_gap 
		pad_choose_script = parked_spawn_menu 
		pad_choose_params = { new_menu_script = launch_gap_menu } 
	} 
	make_thugpro_menu_item { 
		text = "game options" 
		id = menu_game_options 
		pad_choose_script = create_options_menu 
	} 
	make_thugpro_menu_item { 
		text = "back to editor" 
		id = menu_skateshop 
		pad_choose_script = parked_test_play_back_to_editor 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT parked_spawn_menu 
	destroy_menu_background_title 
	<new_menu_script> 
ENDSCRIPT

center_menu_root_pos = PAIR(140.00000000000, 60.00000000000) 
pause_menu_root_pos = PAIR(-20.00000000000, 60.00000000000) 
pause_menu_title_pos = PAIR(-30.00000000000, 42.00000000000) 
right_menu_title_pos = PAIR(280.00000000000, 42.00000000000) 
SCRIPT create_pause_menu 
	IF NOT InNetGame 
		SpawnScript slomo_menu_check 
	ENDIF 
	IF ScreenElementExists id = net_panel_msg_bg 
		DestroyScreenElement id = net_panel_msg_bg 
	ENDIF 
	IF ScreenElementExists id = net_panel_msg 
		DestroyScreenElement id = net_panel_msg 
	ENDIF 
	IF ScreenElementExists id = observe_input_handler 
		DestroyScreenElement id = observe_input_handler 
	ENDIF 
	SetScreenElementLock id = root_window off 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF CustomParkMode editing 
		SetParkEditorPauseMode pause 
	ENDIF 
	IF GotParam no_exit 
		set_pause_menu_allow_continue off 
	ELSE 
		IF root_window : GetSingleTag no_exit_pause_menu 
			no_exit = no_exit 
		ENDIF 
	ENDIF 
	hide_all_hud_items 
	unhide_current_goal 
	IF IsTrue MUSIC_IN_PAUSE_MENU 
		PauseStream 1 
	ELSE 
		PauseMusicAndStreams 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
				IF GameModeEquals is_lobby 
					Change AutoServer_PausedTimer = 1 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT IsObserving 
			skater : NetDisablePlayerInput 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT IsObserving 
			CheckForNetBrake 
		ENDIF 
	ELSE 
		IF CustomParkMode editing 
			parked_setup_main_menu_updated <...> 
			IF IsTrue MUSIC_IN_PAUSE_MENU 
				PauseStream 1 
			ELSE 
				PauseMusicAndStreams 
			ENDIF 
			RETURN 
		ENDIF 
		IF CustomParkMode testing 
			parked_setup_test_play_menu_updated <...> 
			IF IsTrue MUSIC_IN_PAUSE_MENU 
				PauseStream 1 
			ELSE 
				PauseMusicAndStreams 
			ENDIF 
			RETURN 
		ENDIF 
	ENDIF 
	IF NOT GotParam no_exit 
		helper_text = generic_helper_text 
	ELSE 
		helper_text = generic_helper_text_no_back 
	ENDIF 
	IF ( in_cat_preview_mode = 1 ) 
		create_CAT_pause_menu <...> 
		RETURN 
	ENDIF 
	IF NOT ( ( ( THUGPRO_GlobalThemeInfo ) . PAUSED_TEXTURE ) = WHITE ) 
		menu_title_texture = ( ( THUGPRO_GlobalThemeInfo ) . PAUSED_TEXTURE ) 
		menu_title_pos = ( PAIR(0.00000000000, 52.50000000000) + ( ( THUGPRO_GlobalThemeInfo ) . PAUSED_TEXTURE_OFFSET ) ) 
	ENDIF 
	thugpro_menu_create { 
		menu_name = game_pause 
		menu_title = "Paused" 
		menu_title_texture = <menu_title_texture> 
		menu_title_pos = <menu_title_pos> 
		menu_style = MENU_STYLE_CUSTOM 
		menu_pos = PAIR(-20.00000000000, 88.00000000000) 
		menu_internal_just = [ center center ] 
		menu_bg_just = left 
		helper_text = <helper_text> 
		pause_menu 
		show_description_panel 
		show_gradient 
	} 
	pause_show_deck fly_in parent = root_window 
	kill_start_key_binding 
	IF NOT GotParam no_exit 
		SetScreenElementProps { 
			id = current_menu 
			event_handlers = [ 
				{ pad_back generic_pause_exit_sound } 
				{ pad_back handle_start_pressed params = { } } 
				{ pad_start handle_start_pressed params = { } } 
			] 
		} 
	ENDIF 
	IF GotParam from_start 
		generic_create_pause_menu_sound 
	ENDIF 
	autoserver_status = "" 
	IF GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		FormatText TextName = autoserver_status "\\nAutoserver:\\n%a of %b games played" a = ( AutoLevel_GamesPlayed ) b = ( AutoLevel_TotalGamesToPlay ) c = <vote_text> 
	ENDIF 
	vote_text = "" 
	IF GetGlobalFlag flag = SERVER_VOTE_LEVEL_OPEN 
		IF NOT IsTrue SERVER_VOTE_CAST 
			vote_text = "level vote open!" 
		ELSE 
			vote_text = "\\c3level vote casted!" 
		ENDIF 
	ENDIF 
	FormatText TextName = pausemenu_text "\\n%a%b" a = <autoserver_status> b = <vote_text> 
	SetScreenElementProps { 
		id = PAUSE_MENU_EXTRA_TEXT_ID 
		text = <pausemenu_text> 
	} 
	debug_ui_create 
	IF NOT GotParam no_exit 
		make_thugpro_menu_item { 
			description_text = "Continue skating..." 
			text = "Continue" 
			id = menu_continue 
			pad_choose_script = handle_pause_continue 
			pad_choose_sound = generic_pause_exit_sound 
		} 
	ENDIF 
	IF GameModeEquals is_singlesession 
		IF GoalManager_goalIsActive name = TrickAttack 
			make_thugpro_menu_item { 
				text = "Retry High Score Run" 
				id = menu_retry_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal } 
			} 
			make_thugpro_menu_item { 
				text = "End High Score Run" 
				id = menu_end_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = end_high_score_run } 
			} 
		ELSE 
			make_thugpro_menu_item { 
				text = "Start High Score Run" 
				id = menu_start_high_score_run 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = TrickAttack_MenuStartRun } 
			} 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_goal_attack 
		IF NOT IsObserving 
			IF NOT IsTrue LEVEL_CLASSIC_GOAL_MODE 
				IF GoalManager_HasActiveGoals 
					make_thugpro_menu_item { 
						text = "End Current Goal" 
						id = menu_end_current_goal 
						pad_choose_script = menu_select 
						pad_choose_params = { menu_select_script = end_current_goal_run } 
					} 
				ENDIF 
			ENDIF 
			GetGoalsMode 
			IF ( <goals> = goals_created ) 
				IF GoalManager_CanRetryGoal 
					IF GoalManager_GetLastGoalId 
						IF NOT GoalManager_HasWonGoal name = <goal_id> 
							make_thugpro_menu_item { 
								text = "Retry Last Goal" 
								id = menu_retry_goal 
								pad_choose_script = menu_select 
								pad_choose_params = { stop_vibration menu_select_script = RetryCurrentGoal } 
							} 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		make_thugpro_menu_item { 
			text = "View Goals" 
			id = menu_view_goals 
			pad_choose_script = create_view_selected_goals_menu 
			pad_choose_params = { from_pause } 
		} 
	ENDIF 
	IF GameModeEquals is_creategoals 
		IF GoalManager_HasActiveGoals 
			make_thugpro_menu_item { 
				text = "End Current Goal" 
				id = menu_end_current_goal 
				pad_choose_script = menu_select 
				pad_choose_params = { menu_select_script = end_current_goal_run } 
			} 
		ENDIF 
		make_thugpro_menu_item { 
			text = "View Goals" 
			id = menu_view_goals 
			pad_choose_script = view_created_goals_menu_create 
		} 
		IF NOT LevelIs load_sk5ed_gameplay 
			make_thugpro_menu_item { 
				text = "Create a Goal" 
				id = menu_create_a_goal 
				pad_choose_script = create_existing_goals_menu 
			} 
			make_thugpro_menu_item { 
				text = "Load Goals" 
				id = menu_load_goals 
				pad_choose_script = prompt_launch_cag_pause_load 
			} 
			GoalEditor : GetNumEditedGoals ExcludeParkEditorGoals 
			IF ( <NumGoals> = 0 ) 
				no_edited_goals = 1 
			ENDIF 
			make_thugpro_menu_item { 
				text = "Save Goals" 
				id = menu_save_goals 
				pad_choose_script = launch_pause_menu_save_created_goals 
				not_focusable = <no_edited_goals> 
			} 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			IF GameModeEquals is_lobby 
				IF NOT NetworkGamePending 
					IF NOT ChangeLevelPending 
						make_thugpro_menu_item { 
							text = "Start Game" 
							description_text = "Start a game!" 
							id = menu_network_start_select 
							pad_choose_script = network_game_options_selected 
						} 
					ENDIF 
				ENDIF 
			ELSE 
				make_thugpro_menu_item { 
					text = "Restart Game" 
					id = menu_network_start_select 
					pad_choose_script = network_game_options_selected 
				} 
				make_thugpro_menu_item { 
					text = "End Current Game" 
					id = menu_network_end_select 
					pad_choose_script = network_end_game_selected 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT NetworkGamePending 
			IF OnServer 
				make_thugpro_menu_item { 
					text = "Host Options" 
					id = menu_network_server_opts_select 
					pad_choose_script = network_options_selected 
				} 
			ENDIF 
			IF IsHost 
				IF GameModeEquals is_lobby 
					IF NOT OnServer 
						make_thugpro_menu_item { 
							text = "Host Options" 
							id = menu_network_server_opts_select 
							pad_choose_script = network_options_selected 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT NetworkGamePending 
			IF NOT ChangeLevelPending 
				IF NOT IsHost 
					IF LevelIs load_sk5ed_gameplay 
						make_thugpro_menu_item { 
							text = "Save Park" 
							id = menu_save_park_mem 
							pad_choose_script = parked_spawn_menu 
							pad_choose_params = { new_menu_script = launch_pause_menu_save_park_sequence } 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT IsObserving 
		make_thugpro_menu_item { 
			text = "Edit Tricks" 
			id = menu_edit_tricks 
			pad_choose_script = create_edit_tricks_menu 
		} 
	ENDIF 
	GetLevelStructureName 
	<levelnum> = ( <level_structure_name> . level_number ) 
	IF ArrayContains array = levels_with_gaps contains = <levelnum> 
		make_thugpro_menu_item { 
			text = "View Gaps" 
			id = menu_view_gaps 
			pad_choose_script = launch_gap_menu 
		} 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			IF ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) 
				<level_text> = "Select Levels" 
			ELSE 
				<level_text> = "Change Level" 
			ENDIF 
			make_thugpro_menu_item { 
				text = <level_text> 
				id = menu_level_select 
				pad_choose_script = launch_level_select_menu 
				pad_choose_params = { show_warning } 
			} 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Player List" 
			id = menu_network_player_list_select 
			pad_choose_script = launch_player_list_menu 
		} 
		IF NOT IsObserving 
			IF NOT GameModeEquals is_lobby 
				GoalManager_GetTimeLeftInNetGame 
				IF ( <time_left> < 1 ) 
					IF IsSurveying 
						IF NOT IsTrue THUGPRO_ObserveOn 
							<InNormalObserveAfterZero> = 1 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			IF NOT GoalManager_HasActiveGoals 
				IF IsTrue ReJoinNextGame 
					make_thugpro_menu_item { 
						text = "Rejoining Next Game" 
						id = menu_rejoining_next_game 
						not_focusable 
					} 
				ELSE 
					IF NOT skater : OnLip 
						IF IsTrue THUGPRO_ObserveOn 
							IF GameModeEquals is_lobby 
								make_thugpro_menu_item { 
									text = "Exit Observe Mode" 
									id = menu_rejoin_next_game 
									pad_choose_script = THUGPRO_ObserveMode 
									pad_choose_params = { off FromPauseMenu } 
								} 
							ELSE 
								make_thugpro_menu_item { 
									text = "Rejoin Next Game" 
									id = menu_rejoin_next_game 
									pad_choose_script = THUGPRO_RejoinNextGame 
									pad_choose_params = { FromPauseMenu } 
								} 
							ENDIF 
						ELSE 
							IF NOT GotParam InNormalObserveAfterZero 
								make_thugpro_menu_item { 
									text = "Enter Observe Mode" 
									id = menu_observe_mode 
									pad_choose_script = THUGPRO_ObserveMode 
									pad_choose_params = { on FromPauseMenu } 
								} 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		make_thugpro_menu_item { 
			text = "Change Level" 
			id = menu_level_select 
			pad_choose_script = launch_level_select_menu 
		} 
		get_approx_num_level_options_items 
		IF ( <num_items> > 0 ) 
			make_thugpro_menu_item { 
				text = "Level Options" 
				id = menu_level_options 
				pad_choose_script = create_level_options_menu 
			} 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Game Options" 
		id = menu_game_options 
		pad_choose_script = create_options_menu 
	} 
	IF InNetGame 
		make_thugpro_menu_item { 
			text = "Quit" 
			description_text = "Return to the skateshop..." 
			id = menu_quit 
			pad_choose_script = generic_menu_pad_choose 
			pad_choose_params = { callback = launch_quit_game_dialog } 
		} 
	ELSE 
		make_thugpro_menu_item { 
			text = "Quit" 
			description_text = "Return to the skateshop..." 
			id = menu_quit 
			pad_choose_script = generic_menu_pad_choose 
			pad_choose_params = { callback = menu_confirm_quit } 
		} 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_mp_pause_menu 
ENDSCRIPT

SCRIPT do_localized_pause_title { 
		pos = PAIR(500.00000000000, 40.00000000000) 
	} 
ENDSCRIPT

SCRIPT reset_exit_pause_menu_delay 
	KillSpawnedScript name = exit_pause_menu_delay 
	Change exit_pause_menu_ready = 1 
ENDSCRIPT

SCRIPT exit_pause_menu_delay time = 0.30000001192 
	Change exit_pause_menu_ready = 0 
	wait <time> seconds 
	IF ScreenElementExists id = current_menu_anchor 
		Change exit_pause_menu_ready = 0 
		RETURN 
	ENDIF 
	Change exit_pause_menu_ready = 1 
ENDSCRIPT

storedslomo = 1 
SCRIPT slomo_menu_check 
	wait 2 gameframes 
	IF GotParam TurnSlomo_BackOn 
		IF skater : IsSkaterFocused 
			SetSlomo 0.50000000000 
		ELSE 
			IF NOT ( storedslomo = 1 ) 
				SetSlomo ( storedslomo ) 
			ENDIF 
		ENDIF 
	ELSE 
		GetSlomo 
		IF NOT ( slomo = 1 ) 
			IF NOT skater : IsSkaterFocused 
				Change ( storedslomo = slomo ) 
			ENDIF 
			SetSlomo 1 
		ENDIF 
	ENDIF 
	KillSpawnedScript name = slomo_menu_check 
ENDSCRIPT

is_quitting = 0 
SCRIPT exit_pause_menu menu_id = current_menu_anchor 
	IF NOT InNetGame 
		SpawnScript slomo_menu_check params = { TurnSlomo_BackOn } 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
	IF ScreenElementExists id = current_menu_anchor 
		FireEvent type = unfocus target = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	ClearViewerObject 
	Debounce X time = 0.30000001192 
	Debounce circle time = 0.30000001192 
	Debounce Triangle time = 0.30000001192 
	Debounce start time = 0.30000001192 
	pause_menu_gradient off 
	Change inside_pause = 0 
	Change no_focus_sound = 1 
	Change viewer_buttons_enabled = 1 
	show_all_hud_items 
	unhide_current_goal 
	IF InNetGame 
		IF NOT IsObserving 
			IF ObjectExists id = skater 
				skater : NetEnablePlayerInput 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ObjectExists id = skater 
		IF skater : Driving 
			IF ObjectExists id = PlayerVehicleCamera 
				SetActiveCamera id = PlayerVehicleCamera 
			ENDIF 
			HideSkaterAndMiscSkaterEffects 
		ENDIF 
	ENDIF 
	UnpauseGame 
	possibly_add_temp_special_trick 
	IF NOT GotParam NetServerChangeLevelMUSICFix 
		PauseStream 0 
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
	thugpro_menu_destroy 
	SetScreenElementProps id = root_window tags = { menu_state = off } 
	IF CustomParkMode editing 
		IF NOT GotParam DoNotSwitchEditorState 
			SetParkEditorState state = edit 
			SetParkEditorPauseMode unpause 
			SwitchToParkEditorCamera 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
				IF NOT IsTrue is_quitting 
					IF GameModeEquals is_lobby 
						Change AutoServer_PausedTimer = 0 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT GotParam dont_restore_start_key_binding 
		restore_start_key_binding 
	ENDIF 
	IF NOT InNetGame 
		IF NOT GameModeEquals is_horse 
			unpauseskaters 
		ENDIF 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
	IF InNetGame 
		exit_pause_menu_maybe_create_observe_menu 
	ENDIF 
	IF GotParam from_level_editor 
	ELSE 
		IF NOT ( ( LevelIs load_sk5ed_gameplay ) | ( LevelIs load_sk5ed ) ) 
			IF NOT ScreenElementExists id = observe_input_handler 
				restore_skater_camera 
			ENDIF 
		ENDIF 
	ENDIF 
	Change is_quitting = 0 
	KillSpawnedScript name = exit_pause_menu_delay 
	SpawnScript exit_pause_menu_delay params = { time = 0.40000000596 } 
ENDSCRIPT

SCRIPT exit_pause_menu_maybe_create_observe_menu 
	IF IsTrue THUGPRO_ObserveOn 
		create_observe_menu 
		RETURN 
	ENDIF 
	IF IsTrue IsObserving 
		create_observe_menu 
		RETURN 
	ENDIF 
	IF IsTrue JoinedAsObserver 
		create_observe_menu 
		RETURN 
	ENDIF 
	IF IsTrue JoinedGameInProgress 
		create_observe_menu 
		RETURN 
	ENDIF 
	IF NOT GameModeEquals is_lobby 
		IF NOT GameModeEquals is_singlesession 
			IF IsSurveying 
				create_observe_menu 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT pause_launch_level 
	skater : StatsManager_Reset 
	IF GameModeEquals is_career 
		GoalManager_DeactivateAllGoals 
		skater : ResetSkaterToCustom 
	ENDIF 
	change_level <...> 
ENDSCRIPT


