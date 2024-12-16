dont_unhide_loading_screen = 0 
in_cinematic_sequence = 0 
SCRIPT Game_Update 
	GoalManager_UpdateAllGoals 
ENDSCRIPT

SCRIPT load_requested_level 
	GetCurrentLevel 
	LoadLevel level = <level> 
ENDSCRIPT

SCRIPT InitializeGameFlow 
	load_requested_level 
	StandardGameFlow 
ENDSCRIPT

SCRIPT ChangeLevelGameFlow 
	change FirstTimeInSplitScreen = 1 
	IF NOT IsObserving 
		Skater : SetCustomRestart clear 
	ENDIF 
	load_requested_level 
	IF NOT InSplitScreenGame 
		ResetSkaters 
	ENDIF 
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
	ENDIF 
	BEGIN 
		IF SkatersAreReady 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	SetScreenModeFromGameMode 
	StandardGameFlow 
ENDSCRIPT

SCRIPT GameFlow_Startup 
	IF NOT InNetGame 
		kill_panel_messages 
	ENDIF 
	goal_panel_reset_queue 
	IF InSplitScreenGame 
		IF VibrationIsOn 0 
			VibrationOff 0 
			turn_vibration_back_on = 1 
		ENDIF 
		IF VibrationIsOn 1 
			VibrationOff 1 
			turn_player2_vibration_back_on = 1 
		ENDIF 
	ENDIF 
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
						create_dialog_box { title = net_status_msg 
							text = net_message_waiting 
							buttons = [ { text = "Quit" pad_choose_script = quit_network_game } 
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
	IF GotParam turn_player2_vibration_back_on 
		IF NOT GotParam turn_vibration_back_on 
			wait 2 gameframes 
		ENDIF 
		VibrationOn 1 
	ENDIF 
	RestartLevel 
	InitializeSkaters 
	KillMessages 
	PauseStream 0 
	IF InNetGame 
		IF GameModeEquals is_lobby 
			IF OnServer 
				server_enter_free_skate 
			ELSE 
				IF IsHost 
					server_enter_free_skate 
				ENDIF 
				client_enter_free_skate 
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
	ENDIF 
	IF GameModeEquals is_horse 
		StartHorse 
	ENDIF 
	IF CustomParkMode editing 
		SetActiveCamera id = parked_cam 
	ENDIF 
	create_menu_camera 
ENDSCRIPT

dont_restore_start_key_binding = 0 
SCRIPT GameFlow_StartRun 
	printf "GameFlow_StartRun" 
	IF NOT LevelIs Load_MainMenu 
		IF GameModeEquals is_singlesession 
			GoalManager_SetEndRunType name = TrickAttack EndOfRun 
			GoalManager_EditGoal name = TrickAttack params = { time = 120 } 
		ENDIF 
	ENDIF 
	IF IsXbox 
		IF InNetGame 
			IF ProfileLoggedIn 
				IF AnyBuddyMessagesLeft 
					printf "***** Buddy Messages are left ******" 
					flash_buddy_message_icon 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InSplitScreenGame 
		GetSkaterId Skater = 0 
		<ObjId> : Obj_SpawnScript CleanUp_Scuffs 
		GetSkaterId Skater = 1 
		<ObjId> : Obj_SpawnScript CleanUp_Scuffs 
	ELSE 
		IF NOT IsObserving 
			Skater : Obj_SpawnScript CleanUp_Scuffs 
		ENDIF 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		PlaySkaterCamAnim Skater = 0 stop 
		ResetSkaters 
	ELSE 
		SpawnScript main_menu_startup_wait_and_signal_clear 
		ResetSkaters node_name = trg_playerrestart RestartWalking 
	ENDIF 
	IF IsCareerMode 
		UnSetGlobalFlag flag = PROMPT_FOR_SAVE 
	ENDIF 
	printf "starting a run....skip tracks and crank up the music" 
	IF GameModeEquals is_horse 
	ELSE 
		SkipMusicTrack 
	ENDIF 
	IF IsCareerMode 
		IF IsTrue ALWAYSPLAYMUSIC 
			PauseMusic 0 
		ELSE 
			PauseMusic 1 
		ENDIF 
	ELSE 
		PauseMusic 0 
	ENDIF 
	IF GameModeEquals default_time_limit 
		ResetClock 
	ELSE 
	ENDIF 
	IF GameModeEquals is_horse 
		horse_start_run 
	ENDIF 
	IF InNetGame 
		IF OnServer 
		ELSE 
			LaunchQueuedScripts 
			IF IsObserving 
				IF GameModeEquals is_goal_attack 
					GoalManager_InitializeAllSelectedGoals 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT ( next_level_script = nullscript ) 
		IF ( next_level_script = select_sponsor_select_after_movies ) 
			DisplayLoadingScreen blank 
			change dont_unhide_loading_screen = 1 
			change dont_restore_start_key_binding = 1 
		ENDIF 
		SpawnScript next_level_script 
		change next_level_script = nullscript 
	ENDIF 
	<should_check_for_controllers> = 1 
	IF ( <should_check_for_controllers> = 1 ) 
		SpawnScript wait_and_check_for_unplugged_controllers 
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
	IF NOT LevelIs Load_MainMenu 
		IF NOT LevelIs load_cas 
			IF ( launch_to_createatrick = 1 ) 
				PauseGame 
				change inside_pause = 1 
				IF MusicIsPaused 
					change music_was_paused = 1 
				ELSE 
					change music_was_paused = 0 
				ENDIF 
				PauseMusicAndStreams 1 
				pause_menu_gradient on 
				create_pre_cat_menu from_mainmenu 
				change check_for_unplugged_controllers = 1 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF LevelIs load_sk5ed_gameplay 
		parked_set_tod 
	ELSE 
		IF InMultiplayerGame 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GameFlow_PlayRun 
	IF IsTrue AlwaysDump 
		DumpHeaps 
		change AlwaysDump = 0 
	ENDIF 
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
	IF IsTrue bootstrap_build 
		IF IsTrue STARTGAME_FIRST_TIME 
			create_startup_menu 
		ENDIF 
	ENDIF 
	IF InSplitScreenGame 
		IF IsTrue FirstTimeInSplitScreen 
			PauseGame 
		ENDIF 
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
	wait 2 gameframe 
	change is_changing_levels = 0 
	IF NOT ( dont_unhide_loading_screen = 1 ) 
		IF IsNgc 
			VMCacheFlush 
		ENDIF 
		HideLoadingScreen 
	ENDIF 
	IF InSplitScreenGame 
		SetActiveCamera id = skatercam0 viewport = 0 
		SetActiveCamera id = skatercam1 viewport = 1 
		IF IsTrue FirstTimeInSplitScreen 
			ScreenElementSystemCleanup 
			change FirstTimeInSplitScreen = 0 
			PauseGame 
			create_end_run_menu 
		ENDIF 
	ENDIF 
	IF InMultiplayerGame 
	ELSE 
		UseOnePadInFrontEnd 
	ENDIF 
	EnableActuators 
	refresh_poly_count 
	IF ( toggled_fps_on = 1 ) 
		ToggleFPS 
		ToggleFPS 
	ENDIF 
	IF ( toggled_geom_stats_on = 1 ) 
		ToggleGeomStats 
		ToggleGeomStats 
	ENDIF 
	BEGIN 
		IF ShouldEndRun 
			printf "************ SHOULD BREAK" 
			BREAK 
		ENDIF 
		IF GameModeEquals is_horse 
			IF FirstTrickStarted 
				HideClock 
				GoalManager_ZeroGoalTimer name = horse_mp 
				printf "************ TRICK STARTED" 
				BREAK 
			ENDIF 
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
		IF IsCareerMode 
		ELSE 
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
	wait 2 game frames 
	IF NOT GameModeEquals is_singlesession 
		IF NOT InSplitScreenGame 
			UnpauseGame 
		ENDIF 
	ENDIF 
	wait 2 game frames 
	KillMessages 
	KillSpawnedScript name = SK3_Killskater_Finish 
ENDSCRIPT

SCRIPT GameFlow_End 
	printf "************** IN GAMEFLOW END************" 
	BEGIN 
		IF CalculateFinalScores 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	IF IsCareerMode 
		IF GetGlobalFlag flag = SHOW_CREDITS 
			UnSetGlobalFlag flag = SHOW_CREDITS 
			IF CD 
				wait 1 gameframe 
				cleanup_play_movie "movies\\pccredits" 
				ingame_play_movie "movies\\credits" 
			ENDIF 
		ENDIF 
	ELSE 
		IF IsCustomPark 
		ELSE 
			IF GameModeEquals is_singlesession 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GameModeEquals show_ranking_screen 
	ENDIF 
	IF InNetGame 
		IF OnServer 
			wait 5 gameframes 
			LoadPendingPlayers 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT StandardGameFlow 
	printf "starting standard gameflow" 
	GameFlow_Startup 
	StandardGameFlowBody 
ENDSCRIPT

SCRIPT StandardGameFlowToggleView 
	printf "starting standard gameflow" 
	GameFlow_Startup 
	ToggleViewMode 
	StandardGameFlowBody 
ENDSCRIPT

SCRIPT StandardGameFlowBody 
	BEGIN 
		GameFlow_StartRun 
		GameFlow_PlayRun 
		GameFlow_WaitEnd 
		IF GameModeEquals is_horse 
			IF EndRunSelected 
				BREAK 
			ENDIF 
			horse_end_run 
			IF HorseEnded 
				BREAK 
			ELSE 
				InitializeSkaters 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
	IF GameModeEquals is_horse 
		horse_uninit 
	ENDIF 
	GameFlow_End 
	BEGIN 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT


