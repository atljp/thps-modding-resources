
back_to_local_net_menu = 0 
dont_unhide_loading_screen = 0 
in_cinematic_sequence = 0 
dont_restore_start_key_binding = 0 
GameRunRespawns = 1 
is_first_start_run = 0 
INITIALIZE_GAMEFLOW_SCRIPT = InitializeGameFlow_THUGPRO 
CHANGE_LEVEL_GAMEFLOW_SCRIPT = ChangeLevelGameFlow_THUGPRO 
STANDARD_GAMEFLOW_SCRIPT = StandardGameFlow_THUGPRO 
CREATE_MAIN_MENU_SCRIPT = create_main_menu 
SCRIPT Game_Update 
	GoalManager_UpdateAllGoals 
ENDSCRIPT

SCRIPT load_requested_level 
	GetCurrentLevel 
	LoadLevel level = <level> 
ENDSCRIPT

SCRIPT InitializeGameFlow 
	Goto ( INITIALIZE_GAMEFLOW_SCRIPT ) 
ENDSCRIPT

SCRIPT InitializeGameFlow_THUGPRO 
	load_requested_level 
	StandardGameFlow_THUGPRO 
ENDSCRIPT

SCRIPT ChangeLevelGameFlow 
	Goto ( CHANGE_LEVEL_GAMEFLOW_SCRIPT ) 
ENDSCRIPT

SCRIPT ChangeLevelGameFlow_THUGPRO 
	PauseMusic 0 
	Change is_first_start_run = 1 
	Change FirstTimeInSplitScreen = 1 
	IF NOT IsObserving 
		Skater : SetCustomRestart clear 
	ENDIF 
	load_requested_level 
	ResetSkaters 
	IF InNetGame 
		IF NOT GameModeEquals is_lobby 
			SetGameType netlobby 
			SetCurrentGameType 
		ENDIF 
		IF OnServer 
			GetPreferenceChecksum pref_type = network team_mode 
			SWITCH <checksum> 
				CASE teams_none 
					SetNumTeams 0 
					printf "Team mode off" 
				CASE teams_two 
					SetNumTeams 2 
					printf "2 Teams" 
				CASE teams_three 
					SetNumTeams 3 
					printf "3 Teams" 
				CASE teams_four 
					SetNumTeams 4 
					printf "4 Teams" 
			ENDSWITCH 
		ENDIF 
		ForEachIn net_game_type_info do = MaybeDisableGameTypes 
		IF NOT LevelIs Load_MainMenu 
			THUGPRO_ShowStoredConsoleMessages 
		ENDIF 
	ENDIF 
	BEGIN 
		IF SkatersAreReady 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	SetScreenModeFromGameMode 
	StandardGameFlow_THUGPRO 
ENDSCRIPT

SCRIPT GameFlow_Startup 
	LaunchViewer 
	IF NOT InNetGame 
		kill_panel_messages 
	ENDIF 
	goal_panel_reset_queue 
	IF InNetGame 
		BEGIN 
			wait 1 gameframe 
			IF SkatersAreReady 
				BREAK 
			ENDIF 
		REPEAT 120 
		BEGIN 
			IF SkatersAreReady 
				dialog_box_exit 
				BREAK 
			ENDIF 
			IF NOT SkatersAreReady 
				IF NOT ScreenElementExists id = dialog_box_anchor 
					IF NOT ScreenElementExists id = quit_dialog_anchor 
						HideLoadingScreen 
						exit_pause_menu 
						create_dialog_box { 
							title = net_status_msg 
							text = net_message_waiting 
							buttons = [ 
								{ text = "Quit" pad_choose_script = quit_network_game } 
							] 
							no_animate 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
	ELSE 
		BEGIN 
			wait 1 gameframe 
			IF SkatersAreReady 
				BREAK 
			ENDIF 
		REPEAT 
	ENDIF 
	IF GotParam turn_vibration_back_on 
		wait 2 gameframes 
		VibrationOn 0 
	ENDIF 
	RestartLevel 
	InitializeSkaters 
	PauseStream 0 
	IF InNetGame 
		IF GameModeEquals is_lobby 
			IF OnServer 
				server_enter_free_skate 
				IF ( ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) | ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) ) 
					SpawnScript update_auto_modes 
				ENDIF 
			ELSE 
				IF IsHost 
					server_enter_free_skate 
					IF ( ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) | ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) ) 
						SpawnScript update_auto_modes 
					ENDIF 
				ELSE 
					client_enter_free_skate 
				ENDIF 
			ENDIF 
			IF InInternetMode 
				IF OnServer 
					PostGame 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT InNetGame 
		ReinsertSkaters 
	ENDIF 
	SetScreenModeFromGameMode 
	IF InMultiplayerGame 
		destroy_panel_stuff 
		create_panel_stuff 
		unpause_special_meter 
	ENDIF 
	IF CustomParkMode editing 
		SetActiveCamera id = parked_cam 
	ENDIF 
	create_menu_camera 
	IF NOT ObjectExists id = Overview_Cam01 
		CreateCompositeObject { 
			Components = viewercam_composite_structure 
			params = { name = Overview_Cam01 permanent } 
		} 
	ENDIF 
	IF NOT ObjectExists id = Overview_Cam02 
		CreateCompositeObject { 
			Components = viewercam_composite_structure 
			params = { name = Overview_Cam02 permanent } 
		} 
	ENDIF 
	Overview_Cam01 : Obj_SetPosition Position = VECTOR(0.00000000000, 7000.00000000000, 2000.00000000000) 
	Overview_Cam01 : Obj_SetOrientation x = 90 y = 90 
ENDSCRIPT

SCRIPT GameFlow_StartRun 
	printf "GameFlow_StartRun" 
	UnPauseSkaters 
	SFX_Change_Footstep_Sounds_To_Default 
	THUGPRO_ToggleSticker on 
	Change garbage_wp_checker_active = 0 
	Change AlreadyEndedRun = 0 
	index = number_of_console_lines 
	BEGIN 
		IF ScreenElementExists id = { console_message_vmenu child = ( number_of_console_lines - <index> ) } 
			RunScriptOnScreenElement id = { console_message_vmenu child = ( number_of_console_lines - <index> ) } console_message_wait_and_die 
		ELSE 
		ENDIF 
		<index> = ( <index> - 1 ) 
	REPEAT number_of_console_lines 
	IF ObjectExists id = goal_comp_out_of_bounds_warning 
		DestroyScreenElement id = goal_comp_out_of_bounds_warning 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		IF GameModeEquals is_singlesession 
			GoalManager_SetEndRunType name = TrickAttack EndOfRun 
			GoalManager_EditGoal name = TrickAttack params = { time = 120 } 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = screenflash 
		fadetoblack off time = <FadeOffTime> id = screenflash 
	ENDIF 
	IF NOT InNetGame 
		IF IsTrue should_reload_custom_last_level 
			Change should_reload_custom_last_level = 0 
			level_select_change_level level = ( last_loaded_custom_level_script ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF IsTrue force_return_to_mainmenu 
		Change force_return_to_mainmenu = 0 
		IF InNetGame 
			quit_network_game 
		ELSE 
			level_select_change_level_quit level = Load_MainMenu 
		ENDIF 
		RETURN 
	ENDIF 
	IF InNetGame 
		Change observe_overview_cam_state = 0 
		update_all_player_names 
	ENDIF 
	IF InNetGame 
		IF NOT IsObserving 
			Skater : Obj_SpawnScript CleanUp_Scuffs 
			IF IsTrue THUGPRO_ObserveOn 
				IF Skater : Obj_FlagSet FLAG_SKATER_DROPPING_IN 
					ResetSkaters 
					Skater : Obj_WaitAnimFinished 
				ENDIF 
				IF IsTrue RejoinNextGame 
					THUGPRO_ObserveMode off 
					Change RejoinNextGame = 0 
					IF IsTrue THUGPRO_EnteringNetLevel 
						Change THUGPRO_EnteringNetLevel = 0 
						ResetSkaters 
					ELSE 
						THUGPRO_ResetPhysics_or_ResetSkaters 
					ENDIF 
				ELSE 
					THUGPRO_ObserveMode on 
				ENDIF 
			ELSE 
				IF IsTrue THUGPRO_EnteringNetLevel 
					Change THUGPRO_EnteringNetLevel = 0 
					ResetSkaters 
				ELSE 
					GetGameMode 
					IF ArrayContains array = [ nettrickattack netgraffiti netcombomambo netlobby ] contains = <gamemode> 
						THUGPRO_ResetPhysics_or_ResetSkaters 
					ELSE 
						ResetSkaters 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		Skater : Obj_SpawnScript CleanUp_Scuffs 
		IF LevelIs Load_MainMenu 
			ResetSkaters node_name = TRG_PlayerRestart RestartWalking 
		ELSE 
			ResetSkaters 
		ENDIF 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		IF ( ( ( LEVEL_ORIGINAL_GAME ) = THPS4 ) | ( LevelIs Load_NY ) ) 
			HandleProtrickObjects 
		ENDIF 
		HandleLevelOptionObjects 
	ENDIF 
	IF InNetGame 
		thugpro_update_tod 
	ENDIF 
	IF GameModeEquals default_time_limit 
		ResetClock 
	ENDIF 
	IF IsTrue GLOBAL_SkipTrackAtRuns 
		SkipMusicTrack 
	ENDIF 
	IF InNetGame 
		IF NOT OnServer 
			LaunchQueuedScripts 
			IF IsObserving 
				IF GameModeEquals is_goal_attack 
					GoalManager_InitializeAllSelectedGoals 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT ( next_level_script = nullscript ) 
		SpawnScript next_level_script 
		Change next_level_script = nullscript 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		IF GameModeEquals is_career 
			StartCurrentChapter 
		ENDIF 
		IF GameModeEquals is_classic 
			classic_mode_play_intro_cams 
		ENDIF 
		IF NOT ( dont_restore_start_key_binding = 1 ) 
			restore_start_key_binding 
		ENDIF 
	ENDIF 
	Change is_first_start_run = 0 
	thugpro_init_dynamic_level_changes 
	IF LevelIs Load_MainMenu 
		THUGPRO_TriggerButtonPatch off 
		printf "@@@@ should spawn menu now...." 
		maybe_auto_load_from_memory_card 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		IF IsTrue launch_to_createatrick 
			PauseGame 
			Change inside_pause = 1 
			IF MusicIsPaused 
				Change music_was_paused = 1 
			ELSE 
				Change music_was_paused = 0 
			ENDIF 
			PauseStream 1 
			pause_menu_gradient on 
			create_pre_cat_menu from_mainmenu 
			Change check_for_unplugged_controllers = 1 
			Change launch_to_createatrick = 0 
			RETURN 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GameFlow_PlayRun 
	IF NOT LevelIs Load_MainMenu 
		IF ScreenElementExists id = controller_unplugged_dialog_anchor 
			kill_start_key_binding 
		ELSE 
			IF NOT ( dont_restore_start_key_binding = 1 ) 
				restore_start_key_binding 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_creategoals 
		restore_start_key_binding 
	ENDIF 
	wait 1 gameframe 
	IF IsMovieQueued 
		BEGIN 
			IF HasMovieStarted 
				BREAK 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
	ENDIF 
	IF NOT InMultiplayerGame 
		UseOnePadInFrontEnd 
	ENDIF 
	EnableActuators 
	IF NOT LevelIs Load_MainMenu 
		IF ObjectExists id = level_select_panel_container 
			THUGPRO_LevelSelect_menu_exit no_new_menu from_gameflow 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF IsHost 
			GetPreferenceChecksum pref_type = network game_type 
			IF ( <checksum> = netgoalattack ) 
				IF IsTrue LEVEL_DISABLE_GOAL_ATTACK 
					SetPreferencesFromUI { 
						prefs = network 
						field = "game_type" 
						checksum = nettrickattack 
						string = "Trick Attack" 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	wait 2 gameframe 
	Change is_changing_levels = 0 
	IF NOT IsTrue dont_unhide_loading_screen 
		HideLoadingScreen 
	ENDIF 
	BEGIN 
		IF ShouldEndRun 
			printf "************ SHOULD BREAK" 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT GameFlow_WaitEnd 
	printf "************ IN GAMEFLOW_WAITEND" 
	BEGIN 
		IF EndRunSelected 
			BREAK 
		ENDIF 
		IF NOT IsCareerMode 
			IF GameModeEquals is_singlesession 
				BREAK 
			ELSE 
				IF NOT LevelIs Load_MainMenu 
					IF AllSkatersAreIdle 
						BREAK 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	EnableActuators 0 
	wait 2 gameframes 
	IF NOT GameModeEquals is_singlesession 
		UnPauseGame 
	ENDIF 
	wait 2 gameframes 
	KillSpawnedScript name = SK3_Killskater_Finish 
ENDSCRIPT

SCRIPT GameFlow_End 
	printf "************** IN GAMEFLOW END************" 
	Change is_first_start_run = 0 
	IF NOT LevelIs Load_MainMenu 
		IF ObjectExists id = level_select_panel_container 
			THUGPRO_LevelSelect_menu_exit no_new_menu from_gameflow 
		ENDIF 
	ENDIF 
	BEGIN 
		IF CalculateFinalScores 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	IF InNetGame 
		IF OnServer 
			wait 5 gameframes 
			LoadPendingPlayers 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT StandardGameFlow 
	Goto ( STANDARD_GAMEFLOW_SCRIPT ) 
ENDSCRIPT

SCRIPT StandardGameFlow_THUGPRO 
	printf "starting standard gameflow" 
	GameFlow_Startup 
	StandardGameFlowBody 
ENDSCRIPT

SCRIPT StandardGameFlowToggleView 
	printf "starting viewer gameflow" 
	GameFlow_Startup 
	ToggleViewMode 
	StandardGameFlowBody 
ENDSCRIPT

SCRIPT StandardGameFlowBody 
	IF NOT LevelIs Load_Sk5ed 
		THUGPROResetViewer force_reset 
	ENDIF 
	GameFlow_StartRun 
	GameFlow_PlayRun 
	GameFlow_WaitEnd 
	IF NOT LevelIs Load_Sk5ed 
		THUGPROResetViewer force_reset 
	ENDIF 
	GameFlow_End 
	BEGIN 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT


