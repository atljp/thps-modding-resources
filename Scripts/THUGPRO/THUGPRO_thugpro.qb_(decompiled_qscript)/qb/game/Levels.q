
fake_net = 0 
UsePreFilesForLevelLoading = 1 
AssertOnMissingScripts = 0 
AssertOnMissingAssets = 0 
AlwaysDump = 1 
next_level_script = nullscript 
ingame_screen_mode = current_screen_mode 
force_return_to_mainmenu = 0 
last_loaded_custom_level_script = nullscript 
LEVEL_USE_DEFAULT_TOD = 0 
LEVEL_DISABLE_GOAL_EDITOR = 0 
LEVEL_DISABLE_GOAL_ATTACK = 0 
LEVEL_CLASSIC_GOAL_MODE = 0 
LEVEL_DISABLE_GRAFFITI = 0 
LEVEL_DISABLE_CTF = 0 
LEVEL_ORIGINAL_GAME = THUG2 
should_reset_tod_flags = 1 
SCRIPT cleanup_before_loading_level 
	printf "*********************** cleanup_before_loading_level" 
	Cleanup 
	StopMusic 
	PauseMusic 
	ClearMusicTrackList 
ENDSCRIPT

SCRIPT _CustomLevelFallbackScript 
	printf "*********************** CustomLevelFallbackScript" 
	Change force_return_to_mainmenu = 1 
	Change show_custom_level_validation_failed = 1 
	load_level Level_SkProDefault 
ENDSCRIPT

SCRIPT request_level 
	IF gotparam level 
		RequestLevel <level> 
	ELSE 
		script_assert "request_level needs a level param" 
	ENDIF 
ENDSCRIPT

SCRIPT LoadLevel 
	MemPushContext 0 
	ScreenElementSystemCleanup 
	LaunchLevel <...> 
	MemPopContext 
ENDSCRIPT

SCRIPT LoadZone 
	IF InNetGame 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = star_loading 
		RETURN 
	ENDIF 
	IF NOT IsObserving 
		GetSkaterId 
		<objId> : DisablePlayerInput 
		<objId> : SetRollingFriction 100 
		<objId> : SetSpeed 0 
	ENDIF 
	IF gotparam message 
		IF ScreenElementExists id = leaving_message 
			DestroyScreenElement id = leaving_message 
		ENDIF 
		create_panel_message { 
			id = leaving_message 
			style = panel_message_teleport 
			text = <message> 
			z_priority = 9002 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = star_loading 
		texture = logo_56 
		pos = PAIR(320.00000000000, 240.00000000000) 
		scale = 0.69999998808 
		alpha = 0.60000002384 
		just = [ center center ] 
		z_priority = 9001 
	} 
	RunScriptOnScreenElement id = star_loading spin_dialog_icon 
	DoScreenElementMorph id = player1_panel_container alpha = 0.00000000000 time = 0.20000000298 
	FadeToBlack on time = 0.25000000000 alpha = 1 
	wait 0.30000001192 seconds 
	SkProDisplayLoadingScreen blank freeze 
	Change should_reset_tod_flags = 0 
	really_change_level <...> 
ENDSCRIPT

LevelNum_TR = 9 
LevelNum_BO = 1 
LevelNum_BA = 2 
LevelNum_BE = 3 
LevelNum_AU = 4 
LevelNum_NO = 5 
LevelNum_ST = 6 
LevelNum_SE = 7 
LevelNum_SE2 = 8 
LevelNum_NJ = 10 
LevelNum_SC = 12 
LevelNum_PH = 13 
LevelNum_DJ = 14 
LevelNum_LA = 15 
LevelNum_CA = 16 
LevelNum_AP = 17 
LevelNum_Default = 11 
LevelNum_Skateshop = 0 
LevelNum_Sk5ed = 11 
levels_with_gaps = [ 
	LevelNum_TR 
	LevelNum_BO 
	LevelNum_BA 
	LevelNum_BE 
	LevelNum_AU 
	LevelNum_NO 
	LevelNum_ST 
	LevelNum_SE 
	LevelNum_SE2 
	LevelNum_SC 
	LevelNum_PH 
	LevelNum_DJ 
	LevelNum_LA 
	LevelNum_CA 
	LevelNum_AP 
	LevelNum_Sk5ed 
] 
SCRIPT LoadLevelPreFile 
	IF istrue UsePreFilesForLevelLoading 
		LoadPreFile <...> 
	ENDIF 
ENDSCRIPT

skaterparts_loaded = 0 
SCRIPT LoadSkaterParts { 
		pre_files = [ 
			"skaterparts.pre" 
			"skaterparts_temp.pre" 
		] 
	} 
	IF gotparam unload 
		IF NOT ( skaterparts_loaded ) 
			RETURN 
		ENDIF 
		printf "Unloading skater parts..." 
		Change skaterparts_loaded = 0 
	ELSE 
		IF ( skaterparts_loaded ) 
			RETURN 
		ENDIF 
		printf "Loading Skater Parts..." 
		Change skaterparts_loaded = 1 
	ENDIF 
	GetArraySize <pre_files> 
	index = 0 
	IF NOT istrue cas_artist 
		BEGIN 
			IF gotparam unload 
				printf ( <pre_files> [ <index> ] ) 
				UnloadPreFile ( <pre_files> [ <index> ] ) dont_assert 
			ELSE 
				printf ( <pre_files> [ <index> ] ) 
				MemPushContext SkProPermanent 
				LoadPreFile ( <pre_files> [ <index> ] ) 
				MemPopContext 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
ENDSCRIPT

SCRIPT set_level_lights fog_red = 0 fog_blue = 0 fog_green = 0 fog_alpha = 0 fog_dist = 0 
	printf "heading=%h" h = <heading_0> 
	SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue> 
	SetLightDirection index = 0 heading = <heading_0> pitch = <pitch_0> 
	SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0> 
	SetLightDirection index = 1 heading = <heading_1> pitch = <pitch_1> 
	SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1> 
	SetDynamicLightModulationFactor ambient value = <ambient_mod_factor_lo> value2 = <ambient_mod_factor_hi> 
	SetDynamicLightModulationFactor directional = 0 value = <mod_factor_0_lo> value2 = <mod_factor_0_hi> 
	SetDynamicLightModulationFactor directional = 1 value = <mod_factor_0_lo> value2 = <mod_factor_0_lo> 
ENDSCRIPT

THUGPRO_IsJoiningServer = 0 
THUGPRO_EnteringNetLevel = 0 
load_level_times_called = 0 
has_loaded_permanent_anims = 0 
SCRIPT load_level level_number = 0 COIM_size = 1331200 
	IF gotparam indoor 
		Change LEVEL_USE_DEFAULT_TOD = 1 
	ELSE 
		Change LEVEL_USE_DEFAULT_TOD = 0 
	ENDIF 
	IF gotparam DisableGoalEditor 
		Change LEVEL_DISABLE_GOAL_EDITOR = 1 
	ELSE 
		Change LEVEL_DISABLE_GOAL_EDITOR = 0 
	ENDIF 
	IF gotparam DisableGoalAttack 
		Change LEVEL_DISABLE_GOAL_ATTACK = 1 
	ELSE 
		Change LEVEL_DISABLE_GOAL_ATTACK = 0 
	ENDIF 
	IF gotparam HasClassicGoals 
		Change LEVEL_CLASSIC_GOAL_MODE = 1 
	ELSE 
		Change LEVEL_CLASSIC_GOAL_MODE = 0 
	ENDIF 
	IF gotparam DisableGraffiti 
		Change LEVEL_DISABLE_GRAFFITI = 1 
	ELSE 
		Change LEVEL_DISABLE_GRAFFITI = 0 
	ENDIF 
	IF gotparam DisableCTF 
		Change LEVEL_DISABLE_CTF = 1 
	ELSE 
		Change LEVEL_DISABLE_CTF = 0 
	ENDIF 
	IF gotparam game 
		Change LEVEL_ORIGINAL_GAME = <game> 
	ELSE 
		Change LEVEL_ORIGINAL_GAME = unknown 
	ENDIF 
	IF gotparam frontend_level 
		IF ( <frontend_level> = 1 ) 
			LoadSkaterParts 
		ENDIF 
	ENDIF 
	TODManager_Reset 
	IF gotparam tod_script 
		TODManager_SetTODScript <tod_script> 
	ENDIF 
	THUGPRO_TriggerButtonPatch on 
	THUGPRO_ToggleSticker on 
	Change garbage_wp_checker_active = 0 
	Change garbage_wp_checker_exit = 1 
	IF InNetGame 
		IF gotparam IsBigLevel 
			THUGPRO_SetBigLevel 1 
		ELSE 
			THUGPRO_SetBigLevel 0 
		ENDIF 
		IF gotparam IsTallLevel 
			THUGPRO_SetBigLevel 1 Height 
		ELSE 
			THUGPRO_SetBigLevel 0 Height 
		ENDIF 
	ELSE 
		THUGPRO_SetBigLevel 0 
	ENDIF 
	IF gotparam wallride_hack 
		HackWallRidesOn 
	ELSE 
		HackWallRidesOff 
	ENDIF 
	IF NOT gotparam DisableBackfacePatch 
		THUGPRO_ToggleBackfacePatch on 
	ELSE 
		THUGPRO_ToggleBackfacePatch off 
	ENDIF 
	IF InNetGame 
		Change THUGPRO_EnteringNetLevel = 1 
		IF OnServer 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_01_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_02_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_03_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_04_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_05_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_06_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_07_ON off 
			BroadcastOmnigon cheat_flag = SERVER_LEVEL_CHANGE_08_ON off 
			BroadcastOmnigon cheat_flag = SERVER_G_COMP_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET1_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET2_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET3_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET4_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET5_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET6_GEO_ON off 
			BroadcastOmnigon cheat_flag = SERVER_PROSET7_GEO_ON off 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT istrue THUGPRO_IsJoiningServer 
			UnSetAllServerLevelFlags 
		ENDIF 
	ELSE 
		UnSetAllServerLevelFlags 
	ENDIF 
	Change freemem_script_lowest = 999999999 
	Change freemem_main_lowest = 999999999 
	IF gotparam isUserLevel 
		UserContent_UpdateLevelStructInfo level = <level> name = <name> index = <index> 
		Change last_loaded_custom_level_script = <load_script> 
	ELSE 
		IF NOT InNetGame 
			IF NOT ( <load_script> = Load_SkProDefault ) 
				Change last_loaded_custom_level_script = nullscript 
			ENDIF 
		ENDIF 
	ENDIF 
	SetLevelStructureName name = <structure_name> 
	load_level_handle_ambient_sfx ambient_track = <ambient_track> 
	printf "replace_handlers to take away start key in load_level" 
	kill_start_key_binding 
	SetScoreAccumulation 0 
	SetScoreDegradation 0 
	IF ObjectExists id = skater 
		IF skater : IsLocalSkater 
			skater : MotoSkateboardOff 
		ENDIF 
	ENDIF 
	printf "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" 
	printf "@@@ LOADLEVEL" 
	IF EnteringNetGame 
		IF OnServer 
			printf "@@@ AS SERVER" 
		ELSE 
			printf "@@@ AS CLIENT" 
		ENDIF 
	ELSE 
		printf "@@@ NON NET GAME" 
	ENDIF 
	load_level_handle_loading_screen <...> 
	exit_pause_menu 
	CareerStartLevel level = <level_number> 
	IF NOT InNetGame 
		PushMemProfile "Path Manager" 
		AllocatePathManMemory 
		PopMemProfile 
	ENDIF 
	ResetLevelFlags 
	IF gotparam park_editor 
		ParkEdMemSnapshot reset 
		ParkEdMemSnapshot startload 
	ENDIF 
	IF gotparam thugpro_scn_pre 
		LoadLevelPreFile ( <level> + "scn_thugpro.pre" ) 
	ELSE 
		IF gotparam scnpre 
			IF NOT InNetGame 
				LoadLevelPreFile <scnpre> 
			ELSE 
				IF gotparam park_editor 
					LoadLevelPreFile <scnpre> 
				ELSE 
					LoadLevelPreFile ( <level> + "scn.pre" ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam park_editor 
		LoadLevelPreFile "thugpro_sk5edscn.pre" 
	ENDIF 
	IF gotparam sky 
		LoadScene scene = <sky> 
	ENDIF 
	LoadPreFile "thugpro_models.pre" 
	IF gotparam default_sky 
		LoadScene scene = "default_sky" 
	ENDIF 
	IF NOT gotparam NoScene 
		IF gotparam park_editor 
			LoadScene scene = <level> is_dictionary 
			IF gotparam outer_shell 
				ParkEdMemSnapshot start_outer_shell 
				IF gotparam load_shell_collision 
					LoadScene scene = <outer_shell> 
				ELSE 
					LoadScene scene = <outer_shell> no_supersectors 
				ENDIF 
				ParkEdMemSnapshot end_outer_shell 
			ENDIF 
		ELSE 
			IF gotparam level 
				LoadScene scene = <level> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam level_name 
		SetLevelName <level_name> 
	ELSE 
		SetLevelName <level> 
	ENDIF 
	IF gotparam thugpro_scn_pre 
		UnloadPreFile ( <level> + "scn_thugpro.pre" ) dont_assert 
	ELSE 
		IF gotparam scnpre 
			IF NOT InNetGame 
				UnloadPreFile <scnpre> dont_assert 
			ELSE 
				IF gotparam park_editor 
					UnloadPreFile <scnpre> dont_assert 
				ELSE 
					UnloadPreFile ( <level> + "scn.pre" ) dont_assert 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam park_editor 
		UnloadPreFile "thugpro_sk5edscn.pre" dont_assert 
	ENDIF 
	IF gotparam pre 
		LoadLevelPreFile <pre> 
	ENDIF 
	IF gotparam thugpro_prx 
		LoadLevelPreFile <thugpro_prx> 
	ENDIF 
	IF gotparam qb 
		IF gotparam park_editor 
			NodeArrayManLoad <qb> 
		ELSE 
			NodeArrayManLoad <qb> 
			<need_goal_editor_nodes> = 0 
			IF InSplitScreenGame 
				<need_goal_editor_nodes> = 1 
			ENDIF 
			IF InNetGame 
				<need_goal_editor_nodes> = 1 
			ENDIF 
			IF GameModeEquals is_creategoals 
				<need_goal_editor_nodes> = 1 
			ENDIF 
			IF ( <need_goal_editor_nodes> = 1 ) 
				IF NOT istrue LEVEL_DISABLE_GOAL_EDITOR 
					AddGoalEditorNodesToLevelNodeArray 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT gotparam park_editor 
		IF gotparam qb 
			PreloadModels 
		ENDIF 
	ENDIF 
	PushMemProfile "Level-specific QB files" 
	IF gotparam level_qb 
		UnloadQB <level_qb> 
		LoadQB <level_qb> LevelSpecific 
	ENDIF 
	IF gotparam level_sfx_qb 
		LoadQB <level_sfx_qb> LevelSpecific 
	ENDIF 
	IF gotparam more_level_qbs 
		IF NOT IsArray <more_level_qbs> 
			script_assert "more_level_qbs is not an array" 
		ENDIF 
		GetArraySize <more_level_qbs> 
		<index> = 0 
		BEGIN 
			<curr_level_qb> = ( <more_level_qbs> [ <index> ] ) 
			UnloadQB <curr_level_qb> 
			LoadQB <curr_level_qb> LevelSpecific 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	IF gotparam frontend_level 
		IF DateEquals { 
				day_from = ( global_day_from ) 
				day_to = ( global_day_to ) 
				month_from = ( global_month_from ) 
				month_to = ( global_month_to ) 
			} 
			use_alternate_default_params = 1 
		ENDIF 
	ENDIF 
	IF gotparam use_alternate_default_params 
		tod_manager_set_default_params use_alternate_default_params 
	ELSE 
		tod_manager_set_default_params 
	ENDIF 
	THUGProPreloadModels 
	PopMemProfile 
	IF NOT gotparam dont_load_random_peds 
		IF gotparam qb 
			preselect_random_parts <...> 
		ENDIF 
	ENDIF 
	SetThisLevelSoundBanks ThisLevel = <level> 
	IF gotparam park_editor 
		LoadTerrain 
	ELSE 
		SetTerrainDefault 
		IF gotparam qb 
			LoadTerrain 
		ENDIF 
	ENDIF 
	IF gotparam park_editor 
		ParkEdMemSnapshot endload 
	ENDIF 
	startup_handle_stats <...> 
	SetAllStats value = 0 
	IF GameModeEquals is_classic 
		IF gotparam default_stats_classic 
			IF ( level_stats = 1 ) 
				SetAllStats value = <default_stats_classic> 
			ENDIF 
		ENDIF 
	ELSE 
		IF InNetGame 
			SetAllStats value = 10 
		ELSE 
			IF gotparam default_stats 
				IF ( level_stats = 1 ) 
					SetAllStats value = <default_stats> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT InNetGame 
		IF ScriptExists load_level_anims 
			PushMemProfile "Level Specific Anims" 
			load_level_anims 
			PopMemProfile 
		ENDIF 
	ENDIF 
	IF NOT InNetGame 
		IF ScriptExists LoadCameras 
			PushMemProfile "Level Cameras" 
			LoadCameras 
			PopMemProfile 
		ENDIF 
	ENDIF 
	IF ScriptExists LoadObjectAnims 
		PushMemProfile "Object Anims" 
		LoadObjectAnims 
		PopMemProfile 
	ENDIF 
	PushMemProfile "Particle Textures" 
	IF ScriptExists LoadAllParticleTextures 
		LoadAllParticleTextures 
	ENDIF 
	IF ScriptExists load_level_particle_textures 
		load_level_particle_textures 
	ENDIF 
	IF ScriptExists load_level_fast_particle_textures 
		load_level_fast_particle_textures 
	ENDIF 
	IF ScriptExists load_cutscene_particle_textures 
		load_cutscene_particle_textures 
	ENDIF 
	IF ScriptExists load_cutscene_fast_particle_textures 
		load_cutscene_fast_particle_textures 
	ENDIF 
	PopMemProfile 
	IF gotparam extranetanimsscript 
		IF InNetGame 
			printf "                    WE\'RE IN A NET GAME!!!!!!!!!!!!!" 
			PushMemProfile "Level Specific Anims" 
			<extranetanimsscript> 
			PopMemProfile 
		ENDIF 
	ENDIF 
	IF NOT gotparam park_editor 
		IF gotparam startup_script 
			IF ScriptExists <startup_script> 
				<startup_script> 
			ENDIF 
		ENDIF 
	ENDIF 
	FormatText ChecksumName = loading_sounds_script "%i_LoadingSounds" i = <level> 
	IF ScriptExists <loading_sounds_script> 
		<loading_sounds_script> 
	ENDIF 
	IF gotparam models_in_script_prx 
		IF NOT InMultiPlayerGame 
			IF gotparam qb 
				IF NOT gotparam frontend_level 
					IF gotparam park_editor 
						PreloadPedestrians no_random 
					ELSE 
						IF NOT gotparam dont_load_random_peds 
							PreloadPedestrians 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam pre 
		UnloadPreFile <pre> dont_assert 
	ENDIF 
	IF gotparam thugpro_prx 
		UnloadPreFile <thugpro_prx> dont_assert 
	ENDIF 
	IF NOT InMultiPlayerGame 
		IF gotparam pedpre 
			LoadPreFile <pedpre> dont_assert 
		ENDIF 
	ENDIF 
	IF NOT InMultiPlayerGame 
		IF gotparam qb 
			IF NOT gotparam frontend_level 
				IF gotparam park_editor 
					PreloadPedestrians no_random 
				ELSE 
					IF NOT gotparam dont_load_random_peds 
						PreloadPedestrians 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InMultiPlayerGame 
		PreloadModel name = "crown" 
	ENDIF 
	IF NOT InMultiPlayerGame 
		IF gotparam pedpre 
			UnloadPreFile <pedpre> dont_assert 
		ENDIF 
	ENDIF 
	IF ( <level_number> = LevelNum_Skateshop ) 
		LoadPreFile "mainmenusprites.pre" 
		load_cas_textures_to_main_memory no_pre_file 
		UnloadPreFile "mainmenusprites.pre" 
	ENDIF 
	PushMemProfile "Level Collision decompressed PIP + Supersectors" 
	IF NOT gotparam NoScene 
		IF istrue UsePreFilesForLevelLoading 
			IF gotparam thugpro_col_pre 
				LoadPipPre ( <level> + "col_thugpro.pre" ) heap = bottomup 
			ELSE 
				IF gotparam colpre 
					IF NOT InNetGame 
						LoadPipPre <colpre> heap = bottomup 
					ELSE 
						IF gotparam park_editor 
							LoadPipPre <colpre> heap = bottomup 
						ELSE 
							LoadPipPre ( <level> + "col.pre" ) heap = bottomup 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT gotparam NoScene 
		IF InNetGame 
			IF gotparam park_editor 
				LoadCollision scene = <level> 
			ELSE 
				LoadCollision scene = <level> 
			ENDIF 
		ELSE 
			LoadCollision scene = <level> 
		ENDIF 
	ENDIF 
	IF gotparam load_shell_collision 
		IF gotparam outer_shell 
			IF istrue UsePreFilesForLevelLoading 
				<extension> = "col.pre" 
				LoadPipPre ( <outer_shell> + <extension> ) heap = bottomupheap 
			ENDIF 
			LoadCollision scene = <outer_shell> 
		ENDIF 
	ENDIF 
	PopMemProfile 
	Change ParseNodeArrayIgnoreGaps = 0 
	IF gotparam park_editor 
		IF gotparam startup_script 
			<startup_script> 
		ENDIF 
	ELSE 
		IF gotparam qb 
			ParseNodeArray 
			CleanUpAndRemoveSymbol TriggerScripts 
			CleanUpAndRemoveSymbol LoadAllParticleTextures 
			CleanUpAndRemoveSymbol load_level_particle_textures 
			CleanUpAndRemoveSymbol load_level_fast_particle_textures 
			CleanUpAndRemoveSymbol load_cutscene_particle_textures 
			CleanUpAndRemoveSymbol load_cutscene_fast_particle_textures 
			CleanUpAndRemoveSymbol LoadTerrain 
			CleanUpAndRemoveSymbol load_level_anims 
			CleanUpAndRemoveSymbol LoadCameras 
			CleanUpAndRemoveSymbol LoadObjectAnims 
		ENDIF 
	ENDIF 
	FormatText ChecksumName = nodearray "%i_NodeArray" i = <level> 
	ForEachIn <nodearray> Do = thugpro_handleAdditionalNodeData 
	IF GameModeEquals is_career 
		GetOptionalChapterGoalsScript level = <load_script> 
	ENDIF 
	IF gotparam goals_script 
		IF NOT ScriptExists <goals_script> 
			script_assert "goals_script defined in level structure does not exist" 
		ENDIF 
		PushMemProfile "Goals script" 
		<goals_script> 
		PopMemProfile 
	ELSE 
		IF InNetGame 
			add_multiplayer_mode_goals 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_creategoals 
		InitialiseCreatedGoals 
	ELSE 
		IF InNetGame 
			InitialiseCreatedGoals DoNotCreateGoalPeds 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_singlesession 
		AddGoal_TrickAttack 
	ENDIF 
	IF GameModeEquals is_classic 
		IF NOT ( <load_script> = Load_Mainmenu ) 
			AddGoal_TimedScorerun 
		ENDIF 
	ENDIF 
	init_goal_manager 
	IF gotparam setup_script 
		IF ScriptExists <setup_script> 
			PushMemProfile "Setup Script" 
			<setup_script> 
			PopMemProfile 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF OnServer 
			IF istrue LEVEL_USE_DEFAULT_TOD 
				thugpro_reset_tod_flags 
				Server_BroadcastTOD tod_state = afternoon 
			ENDIF 
		ENDIF 
		Change THUGPRO_IsJoiningServer = 0 
	ELSE 
		IF istrue LEVEL_USE_DEFAULT_TOD 
			thugpro_reset_tod_flags 
		ENDIF 
		IF istrue should_reset_tod_flags 
			thugpro_reset_tod_flags 
		ENDIF 
		thugpro_update_tod 
		Change should_reset_tod_flags = 1 
	ENDIF 
	IF gotparam uber_frig_height 
		Change uber_frig_current_height = <uber_frig_height> 
	ELSE 
		Change uber_frig_current_height = uber_frig_default_height 
	ENDIF 
	SFX_refresh_music_box_triggers 
	<is_frontend> = 0 
	IF gotparam frontend_level 
		<is_frontend> = <frontend_level> 
	ENDIF 
	UnloadPreFile "thugpro_models.pre" dont_assert 
	IF gotparam frontend_level 
		IF ( current_screen_mode = standard_screen_mode ) 
			Change ingame_screen_mode = standard_screen_mode 
		ELSE 
			Change ingame_screen_mode = ( current_screen_mode ) 
			screen_setup_standard 
		ENDIF 
	ELSE 
		IF NOT ( ingame_screen_mode = ( current_screen_mode ) ) 
			SWITCH ( ingame_screen_mode ) 
				CASE standard_screen_mode 
					screen_setup_standard 
				CASE widescreen_screen_mode 
					screen_setup_widescreen 
				CASE %"16_10_screen_mode" 
					screen_setup_16_10 
				CASE letterbox_screen_mode 
					screen_setup_letterbox 
			ENDSWITCH 
		ENDIF 
	ENDIF 
	UnPauseGame 
	IF gotparam viewer_mode 
		gameflow StandardGameFlowToggleView 
		printf "****************************************** CHANGING ASSERT = 0" 
	ELSE 
		gameflow StandardGameFlow 
	ENDIF 
	IF gotparam nosun 
		DisableSun 
	ELSE 
		EnableSun 
	ENDIF 
ENDSCRIPT

SCRIPT reset_level 
	ResetLevelFlags 
	GetLevelStructureName 
	IF StructureContains structure = ( <level_structure_name> ) setup_script 
		( <level_structure_name> . setup_script ) 
	ENDIF 
ENDSCRIPT

SCRIPT OverrideSkaterSpeed speed = 1000 
	BEGIN 
		IF ObjectExists id = skater 
			printf "############################################" 
			printf "######### Overriding Skater Speed    #######" 
			printf "######### Speed = %i               #######" i = <speed> 
			printf "############################################" 
			skater : overridelimits max = <speed> CurrentLevel 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT GetCurrentLevelName 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = level_info "Level_%i" i = <level_prefix> 
	RETURN level_name = ( <level_info> . name ) 
ENDSCRIPT

SCRIPT init_goal_manager 
	GoalManager_LevelLoad 
	GoalManager_UpdateFamilyTrees 
	GoalManager_InitializeAllGoals 
	GoalManager_SetCanStartGoal 1 
	IF CareerLevelIs LevelNum_Skateshop 
		GoalManager_HideGoalPoints 
		GoalManager_HidePoints 
	ELSE 
		IF NOT InMultiPlayerGame 
			GoalManager_ShowGoalPoints 
		ENDIF 
		IF NOT ( in_cinematic_sequence ) 
			GoalManager_ShowPoints 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT level_cleanup_assets 
	<skaterNum> = 0 
	BEGIN 
		IF SkaterExists skater = <skaterNum> 
			printf "Cleaning up level-specific assets for skater %d" d = <objId> 
			IF <objId> : IsLocalSkater 
				<objId> : kill_all_vehicles 
				<objId> : SetAmmo 0 
				<objId> : ClearPagerMessages 
			ENDIF 
		ENDIF 
		<skaterNum> = ( <skaterNum> + 1 ) 
	REPEAT 8 
	SFX_Change_Footstep_Sounds_To_Default 
ENDSCRIPT

SCRIPT Load_Default 
	load_level Level_Default 
ENDSCRIPT

SCRIPT Load_SkProDefault 
	load_level Level_SkProDefault 
ENDSCRIPT

SCRIPT Load_EmptyDefault 
	load_level Level_EmptyDefault 
ENDSCRIPT

SCRIPT Load_BO 
	load_level Level_BO 
ENDSCRIPT

SCRIPT Load_AU 
	load_level Level_AU 
ENDSCRIPT

SCRIPT Load_BA 
	load_level Level_BA 
ENDSCRIPT

SCRIPT Load_BE 
	load_level Level_BE 
ENDSCRIPT

SCRIPT Load_NO 
	load_level Level_NO 
ENDSCRIPT

SCRIPT Load_ST 
	load_level Level_ST 
ENDSCRIPT

SCRIPT Load_SE 
	load_level Level_SE 
ENDSCRIPT

SCRIPT Load_SE2 
	load_level Level_SE2 
ENDSCRIPT

SCRIPT Load_TR 
	load_level Level_TR 
ENDSCRIPT

SCRIPT Load_TestLevel 
	load_level level_testlevel 
ENDSCRIPT

SCRIPT Load_LA 
	load_level Level_LA 
ENDSCRIPT

SCRIPT Load_SC 
	load_level Level_SC 
ENDSCRIPT

SCRIPT Load_PH 
	load_level Level_PH 
ENDSCRIPT

SCRIPT Load_DJ 
	load_level Level_DJ 
ENDSCRIPT

SCRIPT Load_CA 
	load_level Level_CA 
ENDSCRIPT

SCRIPT Load_AP 
	load_level Level_AP 
ENDSCRIPT

SCRIPT Load_NJ 
	load_level Level_NJ 
ENDSCRIPT

SCRIPT Load_NY 
	load_level Level_NY 
ENDSCRIPT

SCRIPT Load_FL 
	load_level Level_FL 
ENDSCRIPT

SCRIPT Load_SD 
	load_level Level_SD 
ENDSCRIPT

SCRIPT Load_HI 
	load_level Level_HI 
ENDSCRIPT

SCRIPT Load_VC 
	load_level Level_VC 
ENDSCRIPT

SCRIPT Load_SJ 
	load_level Level_SJ 
ENDSCRIPT

SCRIPT Load_RU 
	load_level Level_RU 
ENDSCRIPT

SCRIPT Load_HH 
	load_level Level_HH 
ENDSCRIPT

SCRIPT Load_cnv 
	load_level Level_cnv 
ENDSCRIPT

SCRIPT Load_alc 
	load_level level_alc 
ENDSCRIPT

SCRIPT Load_sf2 
	load_level level_sf2 
ENDSCRIPT

SCRIPT Load_sch 
	load_level level_sch 
ENDSCRIPT

SCRIPT Load_kon 
	load_level level_kon 
ENDSCRIPT

SCRIPT Load_zoo 
	load_level level_zoo 
ENDSCRIPT

SCRIPT Load_lon 
	load_level level_lon 
ENDSCRIPT

SCRIPT Load_jnk 
	load_level level_jnk 
ENDSCRIPT

SCRIPT Load_hof 
	load_level level_hof 
ENDSCRIPT

SCRIPT Load_practice 
	load_level level_practice 
ENDSCRIPT

SCRIPT Load_ware 
	load_level Level_ware 
ENDSCRIPT

SCRIPT Load_z_ma 
	load_level Level_z_ma 
ENDSCRIPT

SCRIPT Load_skatepark 
	load_level Level_skatepark 
ENDSCRIPT

SCRIPT Load_z_dn 
	load_level Level_z_dn 
ENDSCRIPT

SCRIPT Load_burn 
	load_level Level_burn 
ENDSCRIPT

SCRIPT Load_ros 
	load_level Level_ros 
ENDSCRIPT

SCRIPT Load_sc2 
	load_level Level_SC2 
ENDSCRIPT

SCRIPT Load_HN 
	load_level Level_HN 
ENDSCRIPT

SCRIPT Load_VN 
	load_level Level_VN 
ENDSCRIPT

SCRIPT Load_z_ms 
	load_level Level_z_ms 
ENDSCRIPT

SCRIPT Load_vans 
	load_level Level_vans 
ENDSCRIPT

SCRIPT Load_sz 
	load_level Level_sz 
ENDSCRIPT

SCRIPT Load_HISCH 
	load_level Level_HISCH 
ENDSCRIPT

SCRIPT Load_atlanta 
	load_level Level_atlanta 
ENDSCRIPT

SCRIPT Load_kyoto 
	load_level Level_kyoto 
ENDSCRIPT

SCRIPT Load_z_center 
	load_level Level_z_center 
ENDSCRIPT

SCRIPT Load_z_funpark 
	load_level Level_z_funpark 
ENDSCRIPT

SCRIPT Load_z_riod 
	load_level Level_z_riod 
ENDSCRIPT

SCRIPT load_foun 
	load_level level_foun 
ENDSCRIPT

SCRIPT load_rio 
	load_level level_rio 
ENDSCRIPT

SCRIPT load_sub 
	load_level level_sub 
ENDSCRIPT

SCRIPT load_tok 
	load_level level_tok 
ENDSCRIPT

SCRIPT load_shp 
	load_level level_shp 
ENDSCRIPT

SCRIPT load_si 
	load_level level_si 
ENDSCRIPT

SCRIPT load_oil 
	load_level level_oil 
ENDSCRIPT

SCRIPT load_toystory_bedroom 
	load_level level_toystory_bedroom 
ENDSCRIPT

level_toystory_bedroom = { 
	game = DESA 
	structure_name = level_toystory_bedroom 
	load_script = load_toystory_bedroom 
	name = "ANDY\'S ROOM" 
	loading_time = 8.50000000000 
	level = "toystory_bedroom" 
	sky = "default_sky" 
	nosun 
	startup_script = toystory_bedroom_Startup 
	goals_script = toystory_bedroom_goals 
	setup_script = toystory_bedroom_setup 
	qb = "levels\\toystory_bedroom\\toystory_bedroom.qb" 
	level_qb = "levels\\toystory_bedroom\\toystory_bedroom_scripts.qb" 
	pre = "toystory_bedroom_scripts.pre" 
	scnpre = "toystory_bedroomscn.pre" 
	colpre = "toystory_bedroomcol.pre" 
	more_level_qbs = [ 
		"levels\\toystory_bedroom\\toystory_bedroom_thugpro.qb" 
	] 
	default_level_stuff 
	indoor 
	wallride_hack 
	DisableGoalEditor 
	DisableGoalAttack 
	overview_cam_angle = -45 
	overview_cam_zoom = VECTOR(-1000.00000000000, 50000.00000000000, 5000.00000000000) 
} 
Level_Test = { 
	game = THUGPRO 
	DisableGoalEditor 
	DisableGoalAttack 
	nosun 
	structure_name = Level_Test 
	load_script = Load_Test 
	name = "Test" 
	level = "Test" 
	sky = "default_Sky" 
	startup_script = test_startup 
	goals_script = test_goals 
	setup_script = test_setup 
	qb = "levels\\test\\test.qb" 
	level_qb = "levels\\test\\test_scripts.qb" 
	default_level_stuff 
} 
Level_SkProDefault = { 
	game = THUGPRO 
	structure_name = Level_SkProDefault 
	load_script = Load_SkProDefault 
	name = "THUG Pro Default" 
	level = "SkProDefault" 
	NoScene 
	pre = "SkProDefault_Scripts.pre" 
	qb = "levels\\SkProDefault\\SkProDefault.qb" 
	level_qb = "levels\\SkProDefault\\SkProDefault_scripts.qb" 
	startup_script = SkProDefault_Startup 
	goals_script = SkProDefault_goals 
	setup_script = SkProDefault_setup 
	viewer_mode = 1 
	loading_time = 9.50000000000 
	level_number = LevelNum_Default 
} 
Level_Default = { 
	structure_name = Level_Default 
	load_script = Load_Default 
	name = "Default" 
	loading_time = 9.50000000000 
	level = "Default" 
	NoScene 
	sky = "Default_Sky" 
	qb = "levels\\Default\\Default.qb" 
	level_qb = "levels\\Default\\Default_scripts.qb" 
	startup_script = Default_Startup 
	goals_script = Default_goals 
	setup_script = Default_setup 
	default_stats = 5 
	default_stats_classic = 5 
	level_number = LevelNum_Default 
	viewer_mode = 1 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0.00000000000 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
} 
Level_EmptyDefault = { 
	structure_name = Level_EmptyDefault 
	load_script = Load_EmptyDefault 
	name = "Default" 
	loading_time = 9.50000000000 
	level = "Default" 
	sky = "Default_Sky" 
	default_stats = 5 
	default_stats_classic = 5 
	level_number = LevelNum_Default 
	viewer_mode = 1 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 120.00000000000 
	pitch_0 = -127.00000000000 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = -45.00000000000 
	pitch_1 = -110.00000000000 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.10000000149 
	mod_factor_1_hi = 0.00000000000 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
} 
Level_TR = { 
	game = THUG2 
	HasClassicGoals 
	DisableBackfacePatch 
	structure_name = Level_TR 
	load_script = Load_TR 
	name = "Training" 
	ambient_track = "tr_bg" 
	loading_time = 9.35000038147 
	tod_manager_active = 0 
	COIM_size = 614400 
	pre = "TR_scripts.pre" 
	thugpro_scn_pre 
	level = "TR" 
	sky = "TR_Sky" 
	qb = "levels\\TR\\thugpro\\TR.qb" 
	thugpro_col_pre 
	pedpre = "TRped.pre" 
	level_qb = "levels\\TR\\TR_scripts.qb" 
	level_sfx_qb = "levels\\TR\\TR_sfx.qb" 
	thugpro_prx = "thugpro_tr.pre" 
	more_level_qbs = [ 
		"levels\\TR\\TR_cutscene_particle_data.qb" 
		"levels\\TR\\TR_level_particle_data.qb" 
		"levels\\TR\\TR_cutscene_fast_particle_data.qb" 
		"levels\\TR\\TR_level_fast_particle_data.qb" 
	] 
	startup_script = TR_Startup 
	goals_script = TR_goals 
	setup_script = TR_setup 
	default_stats = 5 
	default_stats_classic = 7 
	level_number = LevelNum_TR 
	skip_teammate_pro 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0.00000000000 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	indoor 
	nosun 
	overview_cam_pos = VECTOR(-1473.68994140625, 4401.08007812500, -2635.70092773438) 
	overview_cam_angle = 180 
} 
Level_BO = { 
	game = THUG2 
	HasClassicGoals 
	DisableBackfacePatch 
	structure_name = Level_BO 
	load_script = Load_BO 
	name = "Boston" 
	ambient_track = "bo_bg" 
	loading_time = 12.39999961853 
	tod_manager_active = 1 
	COIM_size = 768000 
	pre = "BO_scripts.pre" 
	scnpre = "BOscn.pre" 
	level = "BO" 
	sky = "BO_Sky" 
	qb = "levels\\BO\\thugpro\\BO.qb" 
	colpre = "BOcol.pre" 
	pedpre = "BOped.pre" 
	level_qb = "levels\\BO\\BO_scripts.qb" 
	level_sfx_qb = "levels\\BO\\BO_sfx.qb" 
	thugpro_prx = "thugpro_bo.pre" 
	more_level_qbs = [ 
		"levels\\BO\\BO_cutscene_particle_data.qb" 
		"levels\\BO\\BO_level_particle_data.qb" 
		"levels\\BO\\BO_cutscene_fast_particle_data.qb" 
		"levels\\BO\\BO_level_fast_particle_data.qb" 
		"levels\\bo\\bo_thugpro.qb" 
	] 
	startup_script = BO_Startup 
	goals_script = BO_goals 
	setup_script = BO_setup 
	default_stats = 5 
	default_stats_classic = 7 
	level_number = LevelNum_BO 
	special_ped_info = [ 
		{ type = pro flag = PRO_FOUND_01 } 
		{ type = guest name = benfranklin } 
		{ type = flavor name = segwayrider } 
	] 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0.00000000000 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 6 
	num_m_torsos = 6 
	num_m_legs = 4 
	overview_cam_angle = 180 
	overview_cam_zoom = VECTOR(0.00000000000, 4000.00000000000, 500.00000000000) 
} 
Level_BA = { 
	game = THUG2 
	HasClassicGoals 
	structure_name = Level_BA 
	load_script = Load_BA 
	name = "Barcelona" 
	ambient_track = "ba_bg" 
	loading_time = 13.39000034332 
	COIM_size = 1536000 
	tod_manager_active = 1 
	pre = "BA_scripts.pre" 
	scnpre = "BAscn.pre" 
	level = "BA" 
	sky = "BA_Sky" 
	qb = "levels\\BA\\thugpro\\BA.qb" 
	colpre = "BAcol.pre" 
	pedpre = "BAped.pre" 
	thugpro_prx = "thugpro_ba.pre" 
	level_qb = "levels\\BA\\BA_scripts.qb" 
	level_sfx_qb = "levels\\BA\\BA_sfx.qb" 
	more_level_qbs = [ 
		"levels\\BA\\BA_cutscene_particle_data.qb" 
		"levels\\BA\\BA_level_particle_data.qb" 
		"levels\\BA\\BA_cutscene_fast_particle_data.qb" 
		"levels\\BA\\BA_level_fast_particle_data.qb" 
		"levels\\ba\\ba_thugpro.qb" 
	] 
	startup_script = BA_Startup 
	goals_script = BA_goals 
	setup_script = thugpro_BA_Setup 
	tod_script = BA_TOD 
	default_stats = 7 
	default_stats_classic = 3 
	level_number = LevelNum_BA 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 100 
	fog_blue = 150 
	fog_green = 120 
	fog_alpha = 50 
	fog_dist = 1000 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_angle = -63 
	overview_cam_zoom = VECTOR(1000.00000000000, 7500.00000000000, 1000.00000000000) 
} 
Level_BE = { 
	game = THUG2 
	HasClassicGoals 
	structure_name = Level_BE 
	load_script = Load_BE 
	name = "Berlin" 
	ambient_track = "be_bg" 
	loading_time = 14.57999992371 
	COIM_size = 1331200 
	tod_manager_active = 1 
	pre = "BE_scripts.pre" 
	scnpre = "BEscn.pre" 
	level = "BE" 
	sky = "BE_Sky" 
	qb = "levels\\BE\\BE.qb" 
	colpre = "BEcol.pre" 
	pedpre = "BEped.pre" 
	level_qb = "levels\\BE\\BE_scripts.qb" 
	level_sfx_qb = "levels\\BE\\BE_sfx.qb" 
	thugpro_prx = "thugpro_be.pre" 
	more_level_qbs = [ 
		"levels\\BE\\BE_cutscene_particle_data.qb" 
		"levels\\BE\\BE_level_particle_data.qb" 
		"levels\\BE\\BE_cutscene_fast_particle_data.qb" 
		"levels\\BE\\BE_level_fast_particle_data.qb" 
		"levels\\be\\be_thugpro.qb" 
	] 
	startup_script = BE_Startup 
	goals_script = BE_goals 
	setup_script = BE_setup 
	default_stats = 8 
	default_stats_classic = 5 
	level_number = LevelNum_BE 
	skip_teammate_pro 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 3 
	num_f_heads = 3 
	num_f_torsos = 3 
	num_f_legs = 3 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(3000.00000000000, 8000.00000000000, -5000.00000000000) 
} 
Level_AU = { 
	game = THUG2 
	HasClassicGoals 
	structure_name = Level_AU 
	load_script = Load_AU 
	name = "Australia" 
	ambient_track = "au_bg" 
	loading_time = 12.27999973297 
	tod_manager_active = 1 
	pre = "AU_scripts.pre" 
	scnpre = "AUscn.pre" 
	level = "AU" 
	sky = "AU_Sky" 
	qb = "levels\\AU\\thugpro\\AU.qb" 
	colpre = "AUcol.pre" 
	pedpre = "AUped.pre" 
	level_qb = "levels\\AU\\AU_scripts.qb" 
	level_sfx_qb = "levels\\AU\\AU_sfx.qb" 
	thugpro_prx = "thugpro_au.pre" 
	more_level_qbs = [ 
		"levels\\AU\\AU_cutscene_particle_data.qb" 
		"levels\\AU\\AU_level_particle_data.qb" 
		"levels\\AU\\AU_cutscene_fast_particle_data.qb" 
		"levels\\AU\\AU_level_fast_particle_data.qb" 
		"levels\\au\\au_thugpro.qb" 
	] 
	startup_script = AU_Startup 
	goals_script = AU_goals 
	setup_script = AU_thugpro_Setup 
	default_stats = 6 
	default_stats_classic = 4 
	level_number = LevelNum_AU 
	sun_theta = [ 50.00000000000 65.00000000000 90.00000000000 90.00000000000 ] 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	num_f_heads = 4 
	num_f_torsos = 4 
	num_f_legs = 4 
	special_ped_info = [ 
		{ type = pro flag = PRO_FOUND_04 } 
		{ name = shrimpvendor type = guest } 
		{ name = minikartdriver type = flavor } 
	] 
	overview_cam_zoom = VECTOR(3500.00000000000, 6500.00000000000, 0.00000000000) 
} 
Level_NO = { 
	game = THUG2 
	HasClassicGoals 
	structure_name = Level_NO 
	load_script = Load_NO 
	name = "New Orleans" 
	ambient_track = "no_bg" 
	loading_time = 13.93000030518 
	COIM_size = 1331200 
	tod_manager_active = 1 
	pre = "NO_scripts.pre" 
	scnpre = "NOscn.pre" 
	level = "NO" 
	sky = "NO_Sky" 
	qb = "levels\\NO\\NO.qb" 
	colpre = "NOcol.pre" 
	pedpre = "NOped.pre" 
	level_qb = "levels\\NO\\NO_scripts.qb" 
	level_sfx_qb = "levels\\NO\\NO_sfx.qb" 
	more_level_qbs = [ 
		"levels\\NO\\NO_cutscene_particle_data.qb" 
		"levels\\NO\\NO_level_particle_data.qb" 
		"levels\\NO\\NO_cutscene_fast_particle_data.qb" 
		"levels\\NO\\NO_level_fast_particle_data.qb" 
	] 
	startup_script = NO_Startup 
	goals_script = NO_goals 
	setup_script = NO_setup 
	default_stats = 8 
	default_stats_classic = 7 
	level_number = LevelNum_NO 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 1.29999995232 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 3 
	num_m_torsos = 3 
	num_m_legs = 3 
	num_f_heads = 4 
	num_f_torsos = 4 
	num_f_legs = 3 
	special_ped_info = [ 
		{ type = pro flag = PRO_FOUND_05 } 
		{ type = guest name = jester } 
		{ type = flavor name = voodoo } 
	] 
	overview_cam_angle = 90 
	overview_cam_zoom = VECTOR(-1500.00000000000, 6000.00000000000, -1000.00000000000) 
} 
level_testlevel = { 
	structure_name = level_testlevel 
	load_script = Load_TestLevel 
	name = "TestLevel" 
	loading_time = 9.50000000000 
	COIM_size = 1331200 
	pre = "TestLevel_scripts.pre" 
	scnpre = "TestLevelscn.pre" 
	level = "TestLevel" 
	sky = "TestLevel_sky" 
	qb = "levels\\TestLevel\\TestLevel.qb" 
	colpre = "TestLevelcol.pre" 
	level_qb = "levels\\TestLevel\\TestLevel_scripts.qb" 
	startup_script = TestLevel_Startup 
	goals_script = TestLevel_goals 
	setup_script = TestLevel_setup 
	default_stats = 10 
	default_stats_classic = 10 
	level_number = LevelNum_Default 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_hi = 0 
	mod_factor_0_lo = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_hi = 1.29999995232 
	mod_factor_1_lo = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 10 
	num_m_torsos = 10 
	num_m_legs = 8 
} 
Level_ST = { 
	game = THUG2 
	HasClassicGoals 
	structure_name = Level_ST 
	load_script = Load_ST 
	name = "Skatopia" 
	ambient_track = "st_bg" 
	loading_time = 10.25000000000 
	COIM_size = 1331200 
	tod_manager_active = 1 
	pre = "ST_scripts.pre" 
	scnpre = "STscn.pre" 
	level = "ST" 
	sky = "ST_Sky" 
	qb = "levels\\ST\\ST.qb" 
	colpre = "STcol.pre" 
	pedpre = "STped.pre" 
	level_qb = "levels\\ST\\ST_scripts.qb" 
	level_sfx_qb = "levels\\ST\\ST_sfx.qb" 
	thugpro_prx = "thugpro_st.pre" 
	more_level_qbs = [ 
		"levels\\ST\\ST_cutscene_particle_data.qb" 
		"levels\\ST\\ST_level_particle_data.qb" 
		"levels\\ST\\ST_cutscene_fast_particle_data.qb" 
		"levels\\ST\\ST_level_fast_particle_data.qb" 
		"levels\\st\\st_thugpro.qb" 
	] 
	startup_script = ST_Startup 
	goals_script = ST_goals 
	setup_script = ST_setup 
	default_stats = 7 
	default_stats_classic = 4 
	level_number = LevelNum_ST 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	special_ped_info = [ 
		{ type = pro flag = PRO_FOUND_06 } 
		{ type = guest name = sheckler } 
		{ type = flavor name = chainsawskater } 
	] 
	overview_cam_zoom = VECTOR(0.00000000000, -2000.00000000000, 1000.00000000000) 
} 
Level_SE = { 
	game = THUG2 
	structure_name = Level_SE 
	load_script = Load_SE 
	name = "Pro Skater" 
	ambient_track = [ "se_bg" 
		"se_bg2" 
		"se_bg3" 
	] 
	loading_time = 9.47000026703 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "SE_scripts.pre" 
	scnpre = "SEscn.pre" 
	level = "SE" 
	sky = "SE_Sky" 
	qb = "levels\\SE\\SE.qb" 
	colpre = "SEcol.pre" 
	pedpre = "SEped.pre" 
	level_qb = "levels\\SE\\SE_scripts.qb" 
	level_sfx_qb = "levels\\SE\\SE_sfx.qb" 
	more_level_qbs = [ 
		"levels\\SE\\SE_cutscene_particle_data.qb" 
		"levels\\SE\\SE_level_particle_data.qb" 
		"levels\\SE\\SE_cutscene_fast_particle_data.qb" 
		"levels\\SE\\SE_level_fast_particle_data.qb" 
	] 
	startup_script = SE_Startup 
	goals_script = SE_goals 
	setup_script = SE_setup 
	default_stats = 7 
	default_stats_classic = 7 
	level_number = LevelNum_SE 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	uber_frig_height = 800.00000000000 
	overview_cam_zoom = VECTOR(0.00000000000, 20000.00000000000, -10000.00000000000) 
} 
Level_SE2 = { 
	game = THUG2 
	HasClassicGoals 
	structure_name = Level_SE2 
	load_script = Load_SE2 
	name = "The Triangle" 
	ambient_track = "se2_bg" 
	loading_time = 7.30999994278 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "SE2_scripts.pre" 
	scnpre = "SE2scn.pre" 
	level = "SE2" 
	sky = "SE2_Sky" 
	qb = "levels\\SE2\\SE2.qb" 
	colpre = "SE2col.pre" 
	pedpre = "SE2ped.pre" 
	level_qb = "levels\\SE2\\SE2_scripts.qb" 
	level_sfx_qb = "levels\\SE2\\SE2_sfx.qb" 
	more_level_qbs = [ 
		"levels\\SE2\\SE2_cutscene_particle_data.qb" 
		"levels\\SE2\\SE2_level_particle_data.qb" 
		"levels\\SE2\\SE2_cutscene_fast_particle_data.qb" 
		"levels\\SE2\\SE2_level_fast_particle_data.qb" 
	] 
	startup_script = SE2_Startup 
	goals_script = SE2_goals 
	setup_script = SE2_setup 
	default_stats = 7 
	default_stats_classic = 9 
	level_number = LevelNum_SE2 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.10000002384 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0_lo = 0 
	mod_factor_0_hi = 0 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.29999995232 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_zoom = VECTOR(0.00000000000, 8000.00000000000, 0.00000000000) 
	overview_cam_hide_objects = [ CG_Vortex_01 CG_Vortex_02 CG_Vortex3_spinny ] 
} 
SCRIPT Load_Mainmenu2 
	load_level level_Mainmenu2 
ENDSCRIPT

level_Mainmenu2 = { 
	game = THUG2 
	structure_name = level_Mainmenu 
	load_script = Load_Mainmenu 
	name = "Main Menu" 
	loading_time = 6.75000000000 
	COIM_size = 10240 
	loading_time_xbox = 11.00000000000 
	level_name = "mainmenu" 
	pre = "mainmenu_scripts.pre" 
	scnpre = "mainmenuscn.pre" 
	level = "mainmenu" 
	qb = "levels\\mainmenu\\mainmenu.qb" 
	colpre = "mainmenucol.pre" 
	level_qb = "levels\\mainmenu\\fix\\mainmenu_scripts.qb" 
	more_level_qbs = [ 
		"levels\\mainmenu\\mainmenu_options.qb" 
		"levels\\mainmenu\\fix\\mainmenu_net.qb" 
		"levels\\mainmenu\\mainmenu_cas.qb" 
		"levels\\mainmenu\\neversoft_skaters.qb" 
		"levels\\mainmenu\\mainmenu_facemapping.qb" 
		"levels\\mainmenu\\casmenu.qb" 
		"levels\\mainmenu\\colormenu.qb" 
		"levels\\mainmenu\\scalingmenu.qb" 
		"levels\\mainmenu\\edit_graphics_premade.qb" 
		"levels\\mainmenu\\edit_graphics_sprites.qb" 
		"levels\\mainmenu\\instructions_caf.qb" 
		"levels\\mainmenu\\edit_graphics_menu.qb" 
	] 
	startup_script = mainmenu_startup 
	default_stats = 8 
	level_number = LevelNum_Skateshop 
	frontend_level = 1 
	skip_teammate_pro 
	ambient_red = 66 
	ambient_green = 67 
	ambient_blue = 68 
	ambient_mod_factor_lo = 0.00000000000 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = -90.00000000000 
	pitch_0 = -10.00000000000 
	red_0 = 0 
	green_0 = 0 
	blue_0 = 0 
	mod_factor_0_lo = 0.00000000000 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = -120.00000000000 
	pitch_1 = 120.00000000000 
	red_1 = 0 
	green_1 = 0 
	blue_1 = 0 
	mod_factor_1_lo = 0.00000000000 
	mod_factor_1_hi = 0.00000000000 
} 
SCRIPT Load_Mainmenu 
	load_level level_Mainmenu 
ENDSCRIPT

level_Mainmenu = { 
	game = THUG1 
	structure_name = level_Mainmenu 
	load_script = Load_Mainmenu 
	name = "Skate Shop" 
	loading_time = 6.75000000000 
	COIM_size = 10240 
	loading_time_xbox = 11.00000000000 
	level_name = "skateshop" 
	level = "skateshop" 
	nosun 
	qb = "levels\\skateshop\\skateshop.qb" 
	level_qb = "levels\\skateshop\\skateshop_scripts.qb" 
	more_level_qbs = [ 
		"levels\\skateshop\\skateshop_cas.qb" 
		"levels\\skateshop\\colormenu.qb" 
	] 
	startup_script = skateshop_startup 
	default_stats = 8 
	level_number = LevelNum_Skateshop 
	frontend_level = 1 
	skip_teammate_pro 
	ambient_red = 66 
	ambient_green = 67 
	ambient_blue = 68 
	ambient_mod_factor_lo = 0.00000000000 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = -90.00000000000 
	pitch_0 = -10.00000000000 
	red_0 = 0 
	green_0 = 0 
	blue_0 = 0 
	mod_factor_0_lo = 0.00000000000 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = -120.00000000000 
	pitch_1 = 120.00000000000 
	red_1 = 0 
	green_1 = 0 
	blue_1 = 0 
	mod_factor_1_lo = 0.00000000000 
	mod_factor_1_hi = 0.00000000000 
	pre = "skateshop_scripts.pre" 
	scnpre = "skateshopscn.pre" 
	colpre = "skateshopcol.pre" 
} 
Level_LA = { 
	game = THPS3 
	HasClassicGoals 
	structure_name = Level_LA 
	load_script = Load_LA 
	name = "Los Angeles" 
	ambient_track = "la_bg" 
	loading_time = 8.67000007629 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "LA_scripts.pre" 
	scnpre = "LAscn.pre" 
	level = "LA" 
	sky = "LA_Sky" 
	qb = "levels\\LA\\thugpro\\LA.qb" 
	colpre = "LAcol.pre" 
	pedpre = "LAped.pre" 
	level_qb = "levels\\LA\\thugpro\\LA_scripts.qb" 
	level_sfx_qb = "levels\\LA\\LA_sfx.qb" 
	thugpro_prx = "thugpro_la.pre" 
	more_level_qbs = [ 
		"levels\\LA\\LA_cutscene_particle_data.qb" 
		"levels\\LA\\LA_level_particle_data.qb" 
		"levels\\LA\\LA_cutscene_fast_particle_data.qb" 
		"levels\\LA\\LA_level_fast_particle_data.qb" 
	] 
	startup_script = LA_Startup 
	goals_script = LA_goals 
	setup_script = LA_setup 
	default_stats = 5 
	default_stats_classic = 9 
	level_number = LevelNum_LA 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.40000000596 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_zoom = VECTOR(0.00000000000, 10000.00000000000, 0.00000000000) 
} 
Level_SC = { 
	game = THPS1 
	HasClassicGoals 
	structure_name = Level_SC 
	load_script = Load_SC 
	name = "School 1" 
	ambient_track = "sc_bg" 
	loading_time = 6.15000009537 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "SC_scripts.pre" 
	scnpre = "SCscn.pre" 
	level = "SC" 
	sky = "SC_Sky" 
	qb = "levels\\SC\\SC.qb" 
	thugpro_col_pre 
	pedpre = "SCped.pre" 
	level_qb = "levels\\SC\\SC_scripts.qb" 
	level_sfx_qb = "levels\\SC\\SC_sfx.qb" 
	thugpro_prx = "thugpro_sc.pre" 
	more_level_qbs = [ 
		"levels\\SC\\SC_cutscene_particle_data.qb" 
		"levels\\SC\\SC_level_particle_data.qb" 
		"levels\\SC\\SC_cutscene_fast_particle_data.qb" 
		"levels\\SC\\SC_level_fast_particle_data.qb" 
		"levels\\sc\\sc_thugpro.qb" 
	] 
	startup_script = SC_Startup 
	goals_script = SC_goals 
	setup_script = SC_setup 
	default_stats = 5 
	default_stats_classic = 5 
	level_number = LevelNum_SC 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.40000000596 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_angle = -45 
	overview_cam_zoom = VECTOR(1000.00000000000, 0.00000000000, -1000.00000000000) 
} 
Level_HN = { 
	game = THPS2 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_HN 
	load_script = Load_HN 
	name = "Hangar" 
	loading_time = 8.50000000000 
	level = "hn" 
	qb = "levels\\hn\\hn.qb" 
	level_qb = "levels\\hn\\hn_scripts.qb" 
	startup_script = hn_Startup 
	goals_script = hn_goals 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 72 
	ambient_green = 72 
	ambient_blue = 72 
	ambient_mod_factor = 0.20000000298 
	heading_0 = -30 
	pitch_0 = -60 
	red_0 = 110 
	green_0 = 110 
	blue_0 = 105 
	mod_factor_0 = 0.89999997616 
	heading_1 = 200 
	pitch_1 = 33 
	red_1 = 23 
	green_1 = 24 
	blue_1 = 30 
	mod_factor_1 = 0.89999997616 
	fog_red = 0 
	fog_green = 0 
	fog_blue = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "hn_scripts.pre" 
	scnpre = "hnscn.pre" 
	colpre = "hncol.pre" 
	indoor 
	overview_cam_zoom = VECTOR(-2500.00000000000, 4000.00000000000, 0.00000000000) 
	overview_cam_hide_objects = [ 
		roof_break_heli 
		piece_roof_fall 
		piece_roof_fall_01 
		roof_piece_fall_03 
		SkHan_Wall2 
		SkHan_Wall5 
		SkHan_Wall0 
		SkHan_Wall15 
		SkHan_Wall16 
		SkHan_Wall17 
		JG_HN_TunnelRoof 
		Han_Wind_Tunnel7 
	] 
} 
Level_VN = { 
	game = THPS2 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_VN 
	load_script = Load_VN 
	name = "Venice" 
	loading_time = 8.50000000000 
	level = "VN" 
	sky = "vn_Sky" 
	qb = "levels\\VN\\VN.qb" 
	level_qb = "levels\\VN\\VN_scripts.qb" 
	startup_script = VN_Startup 
	goals_script = VN_goals 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 72 
	ambient_green = 72 
	ambient_blue = 72 
	ambient_mod_factor = 0.20000000298 
	heading_0 = -30 
	pitch_0 = -60 
	red_0 = 110 
	green_0 = 110 
	blue_0 = 105 
	mod_factor_0 = 0.89999997616 
	heading_1 = 200 
	pitch_1 = 33 
	red_1 = 23 
	green_1 = 24 
	blue_1 = 30 
	mod_factor_1 = 0.89999997616 
	fog_red = 0 
	fog_green = 0 
	fog_blue = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "vn_scripts.pre" 
	scnpre = "vnscn.pre" 
	colpre = "vncol.pre" 
	overview_cam_pos = VECTOR(1056.07202148438, 8086.35400390625, 1931.71105957031) 
} 
Level_SC2 = { 
	game = THPS2 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_SC2 
	load_script = Load_sc2 
	name = "School II" 
	loading_time = 8.50000000000 
	level = "SC2" 
	sky = "sc2_Sky" 
	nosun 
	qb = "levels\\SC2\\SC2.qb" 
	level_qb = "levels\\SC2\\SC2_scripts.qb" 
	more_level_qbs = [ 
		"levels\\SC2\\SC2_thugpro.qb" 
	] 
	startup_script = SC2_Startup 
	goals_script = SC2_Goals 
	setup_script = SC2_Setup 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 72 
	ambient_green = 72 
	ambient_blue = 72 
	ambient_mod_factor = 0.20000000298 
	heading_0 = -30 
	pitch_0 = -60 
	red_0 = 110 
	green_0 = 110 
	blue_0 = 105 
	mod_factor_0 = 0.89999997616 
	heading_1 = 200 
	pitch_1 = 33 
	red_1 = 23 
	green_1 = 24 
	blue_1 = 30 
	mod_factor_1 = 0.89999997616 
	fog_red = 0 
	fog_green = 0 
	fog_blue = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "sc2_scripts.pre" 
	scnpre = "sc2scn.pre" 
	colpre = "sc2col.pre" 
} 
Level_PH = { 
	game = THPS2 
	HasClassicGoals 
	structure_name = Level_PH 
	load_script = Load_PH 
	name = "Philly" 
	ambient_track = "ph_bg" 
	loading_time = 7.11999988556 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "PH_scripts.pre" 
	scnpre = "PHscn.pre" 
	level = "PH" 
	sky = "PH_Sky" 
	qb = "levels\\PH\\PH.qb" 
	colpre = "PHcol.pre" 
	level_qb = "levels\\PH\\PH_scripts.qb" 
	level_sfx_qb = "levels\\PH\\PH_sfx.qb" 
	thugpro_prx = "thugpro_ph.pre" 
	more_level_qbs = [ 
		"levels\\PH\\PH_cutscene_particle_data.qb" 
		"levels\\PH\\PH_level_particle_data.qb" 
		"levels\\PH\\PH_cutscene_fast_particle_data.qb" 
		"levels\\PH\\PH_level_fast_particle_data.qb" 
		"levels\\ph\\ph_thugpro.qb" 
	] 
	startup_script = PH_Startup 
	goals_script = PH_goals 
	setup_script = PH_setup 
	default_stats = 5 
	default_stats_classic = 8 
	level_number = LevelNum_PH 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.40000000596 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(0.00000000000, 5000.00000000000, 3000.00000000000) 
	overview_cam_hide_objects = [ PH_Phillyside_Ceiling0 PH_Phillyside_Ceiling01 PH_Phillyside_Ceiling5 DT_underbridge01 ] 
} 
Level_DJ = { 
	game = THPS1 
	HasClassicGoals 
	structure_name = Level_DJ 
	load_script = Load_DJ 
	name = "Downhill Jam" 
	ambient_track = "dj_bg" 
	loading_time = 5.86000013351 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "DJ_scripts.pre" 
	scnpre = "DJscn.pre" 
	level = "DJ" 
	sky = "DJ_Sky" 
	qb = "levels\\DJ\\DJ.qb" 
	colpre = "DJcol.pre" 
	pedpre = "DJped.pre" 
	level_qb = "levels\\DJ\\DJ_scripts.qb" 
	level_sfx_qb = "levels\\DJ\\DJ_sfx.qb" 
	thugpro_col_pre 
	more_level_qbs = [ 
		"levels\\DJ\\DJ_cutscene_particle_data.qb" 
		"levels\\DJ\\DJ_level_particle_data.qb" 
		"levels\\DJ\\DJ_cutscene_fast_particle_data.qb" 
		"levels\\DJ\\DJ_level_fast_particle_data.qb" 
	] 
	startup_script = DJ_Startup 
	goals_script = DJ_goals 
	setup_script = DJ_setup 
	default_stats = 5 
	default_stats_classic = 6 
	level_number = LevelNum_DJ 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.40000000596 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_pos = VECTOR(2500.00000000000, 10000.00000000000, 0.00000000000) 
} 
Level_CA = { 
	game = THPS3 
	HasClassicGoals 
	structure_name = Level_CA 
	load_script = Load_CA 
	name = "Canada" 
	nosun 
	ambient_track = "ca_bg" 
	loading_time = 6.80000019073 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "CA_scripts.pre" 
	scnpre = "CAscn.pre" 
	level = "CA" 
	sky = "CA_Sky" 
	qb = "levels\\CA\\CA.qb" 
	colpre = "CAcol.pre" 
	pedpre = "CAped.pre" 
	thugpro_sky_scn_pre 
	level_qb = "levels\\CA\\CA_scripts.qb" 
	level_sfx_qb = "levels\\CA\\CA_sfx.qb" 
	more_level_qbs = [ 
		"levels\\CA\\CA_cutscene_particle_data.qb" 
		"levels\\CA\\CA_level_particle_data.qb" 
		"levels\\CA\\CA_cutscene_fast_particle_data.qb" 
		"levels\\CA\\CA_level_fast_particle_data.qb" 
	] 
	startup_script = CA_Startup 
	goals_script = CA_goals 
	setup_script = CA_setup 
	default_stats = 5 
	default_stats_classic = 8 
	level_number = LevelNum_CA 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.40000000596 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_pos = VECTOR(1975.96801757812, 9068.75292968750, 4968.95214843750) 
	overview_cam_angle = 45.00000000000 
} 
Level_AP = { 
	game = THPS3 
	HasClassicGoals 
	structure_name = Level_AP 
	load_script = Load_AP 
	name = "Airport" 
	ambient_track = "ap_bg" 
	loading_time = 7.82999992371 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "AP_scripts.pre" 
	scnpre = "APscn.pre" 
	level = "AP" 
	sky = "AP_Sky" 
	qb = "levels\\AP\\AP.qb" 
	thugpro_col_pre 
	pedpre = "APped.pre" 
	level_qb = "levels\\AP\\AP_scripts.qb" 
	level_sfx_qb = "levels\\AP\\AP_sfx.qb" 
	thugpro_prx = "thugpro_ap.pre" 
	more_level_qbs = [ 
		"levels\\AP\\AP_level_particle_data.qb" 
		"levels\\AP\\AP_level_fast_particle_data.qb" 
		"levels\\ap\\ap_thugpro.qb" 
	] 
	startup_script = AP_Startup 
	goals_script = AP_goals 
	setup_script = AP_setup 
	default_stats = 5 
	default_stats_classic = 5 
	level_number = LevelNum_AP 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor_lo = 0.30000001192 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0_lo = 1.39999997616 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1_lo = 0.40000000596 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	overview_cam_angle = 90 
	overview_cam_zoom = VECTOR(-22000.00000000000, 30000.00000000000, 4000.00000000000) 
} 
Level_NJ = { 
	game = THUG1 
	DisableBackfacePatch 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_NJ 
	load_script = Load_NJ 
	name = "New Jersey" 
	loading_time = 8.50000000000 
	level = "NJ" 
	sky = "nj_Sky" 
	qb = "levels\\NJ\\NJ.qb" 
	level_qb = "levels\\NJ\\NJ_scripts.qb" 
	level_sfx_qb = "levels\\NJ\\NJ_sfx.qb" 
	more_level_qbs = [ 
		"levels\\nj\\nj_thugpro.qb" 
	] 
	startup_script = NJ_Startup 
	goals_script = nj_goals 
	setup_script = nj_setup 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 50 
	pitch_0 = 330 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0 = 1.39999997616 
	heading_1 = 240 
	pitch_1 = 330 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1 = 0.40000000596 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 1000 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "NJ_scripts.pre" 
	scnpre = "NJscn.pre" 
	colpre = "NJcol.pre" 
	overview_cam_angle = -10 
	overview_cam_zoom = VECTOR(0.00000000000, 10000.00000000000, 0.00000000000) 
} 
Level_NY = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_NY 
	load_script = Load_NY 
	name = "Manhattan" 
	loading_time = 8.50000000000 
	level = "ny" 
	sky = "ny_Sky" 
	qb = "levels\\ny\\ny.qb" 
	level_qb = "levels\\NY\\ny_scripts.qb" 
	level_sfx_qb = "levels\\NY\\ny_sfx.qb" 
	more_level_qbs = [ 
		"levels\\ny\\ny_thugpro.qb" 
	] 
	startup_script = ny_Startup 
	goals_script = ny_goals 
	setup_script = NY_setup 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 330.00000000000 
	pitch_0 = 330.00000000000 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0 = 1.39999997616 
	heading_1 = 150.00000000000 
	pitch_1 = 330.00000000000 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 126 
	fog_blue = 227 
	fog_green = 169 
	fog_alpha = 45 
	fog_dist = 1000 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "ny_scripts.pre" 
	scnpre = "nyscn.pre" 
	colpre = "nycol.pre" 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(1000.00000000000, 7000.00000000000, 2000.00000000000) 
	overview_cam_hide_objects = 
	[ 
		NightOn_JG_NY_77NightLights NY_CW_Office_lights03 
		JG_NY_77BuildingTop JG_NY_77LowerWindows 
		NY_CW_Office_lights CW_Chase_pills03 
		NY_Chase_EG_JP01_a NY_Chase_EG_JP01 
		NY_Chase_EG_JP_noIn_roof 
		NY_Chase_EG_JP_In_roofwall 
		cw_chase_struts 
		cw_chase_strut 
		cw_chase_struts_a 
		cw_chase_strut_a 
	] 
} 
Level_FL = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_FL 
	load_script = Load_FL 
	name = "Tampa" 
	loading_time = 8.50000000000 
	level = "FL" 
	sky = "FL_Sky" 
	nosun 
	level_qb = "levels\\fl\\FL_scripts.qb" 
	level_sfx_qb = "levels\\FL\\FL_sfx.qb" 
	more_level_qbs = [ 
		"levels\\fl\\fl_thugpro.qb" 
	] 
	qb = "levels\\fl\\fl.qb" 
	startup_script = fl_Startup 
	goals_script = fl_goals 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0 = 1.39999997616 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "fl_scripts.pre" 
	scnpre = "flscn.pre" 
	colpre = "flcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 7000.00000000000, 2000.00000000000) 
} 
Level_SD = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_SD 
	load_script = Load_SD 
	name = "San Diego" 
	loading_time = 8.50000000000 
	level = "SD" 
	sky = "SD_Sky" 
	qb = "levels\\SD\\SD.qb" 
	level_qb = "levels\\SD\\SD_scripts.qb" 
	level_sfx_qb = "levels\\SD\\SD_sfx.qb" 
	more_level_qbs = [ 
		"levels\\sd\\sd_thugpro.qb" 
	] 
	startup_script = SD_Startup 
	goals_script = sd_goals 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 159 
	pitch_0 = 308 
	red_0 = 136 
	green_0 = 120 
	blue_0 = 110 
	mod_factor_0 = 1.39999997616 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "SD_scripts.pre" 
	scnpre = "SDscn.pre" 
	colpre = "SDcol.pre" 
} 
Level_HI = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_HI 
	load_script = Load_HI 
	name = "Hawaii" 
	loading_time = 8.50000000000 
	level = "HI" 
	sky = "hi_Sky" 
	nosun 
	qb = "levels\\HI\\HI.qb" 
	level_qb = "levels\\HI\\HI_scripts.qb" 
	level_sfx_qb = "levels\\HI\\HI_sfx.qb" 
	more_level_qbs = [ 
		"levels\\hi\\hi_thugpro.qb" 
	] 
	startup_script = HI_Startup 
	goals_script = hi_goals 
	setup_script = hi_Setup 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 320.00000000000 
	pitch_0 = 330.00000000000 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0 = 1.39999997616 
	heading_1 = 160.00000000000 
	pitch_1 = 330.00000000000 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 150 
	fog_blue = 235 
	fog_green = 170 
	fog_alpha = 38 
	fog_dist = 1000 
	num_m_heads = 8 
	num_m_torsos = 8 
	num_m_legs = 6 
	num_f_heads = 4 
	num_f_torsos = 4 
	num_f_legs = 4 
	pre = "HI_scripts.pre" 
	scnpre = "HIscn.pre" 
	colpre = "HIcol.pre" 
	overview_cam_zoom = VECTOR(-1000.00000000000, 12000.00000000000, 4000.00000000000) 
} 
Level_VC = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_VC 
	load_script = Load_VC 
	name = "Vancouver" 
	loading_time = 8.50000000000 
	level = "vc" 
	sky = "vc_Sky" 
	nosun 
	qb = "levels\\vc\\vc.qb" 
	level_qb = "levels\\vc\\vc_scripts.qb" 
	level_sfx_qb = "levels\\vc\\vc_sfx.qb" 
	more_level_qbs = [ 
		"levels\\vc\\vc_thugpro.qb" 
	] 
	startup_script = vc_Startup 
	goals_script = VC_Goals 
	setup_script = VC_setup 
	default_stats = 5 
	level_number = LevelNum_Default 
	extranetanimsscript = animload_Ped_Driver 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 200.00000000000 
	pitch_0 = 330.00000000000 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0 = 1.39999997616 
	heading_1 = 40.00000000000 
	pitch_1 = 330.00000000000 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 80 
	fog_green = 90 
	fog_blue = 120 
	fog_alpha = 30 
	fog_dist = 300.00000000000 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "VC_scripts.pre" 
	scnpre = "VCscn.pre" 
	colpre = "VCcol.pre" 
	overview_cam_angle = 90 
	overview_cam_zoom = VECTOR(-2000.00000000000, 20000.00000000000, -10000.00000000000) 
} 
Level_SJ = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_SJ 
	load_script = Load_SJ 
	name = "Slam City Jam" 
	loading_time = 8.50000000000 
	level = "sj" 
	qb = "levels\\sj\\sj.qb" 
	level_qb = "levels\\sj\\sj_scripts.qb" 
	level_sfx_qb = "levels\\sj\\sj_sfx.qb" 
	startup_script = sj_Startup 
	goals_script = SJ_Goals 
	setup_script = SJ_Setup 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 58 
	ambient_green = 57 
	ambient_blue = 59 
	ambient_mod_factor = 0.75000000000 
	heading_0 = 351 
	pitch_0 = 303 
	red_0 = 80 
	green_0 = 63 
	blue_0 = 59 
	mod_factor_0 = 1.25999999046 
	heading_1 = 314 
	pitch_1 = 272 
	red_1 = 47 
	green_1 = 50 
	blue_1 = 52 
	mod_factor_1 = 0.46000000834 
	fog_red = 27 
	fog_blue = 23 
	fog_green = 19 
	fog_alpha = 70 
	fog_dist = 705 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "SJ_scripts.pre" 
	scnpre = "SJscn.pre" 
	colpre = "SJcol.pre" 
	overview_cam_zoom = VECTOR(1000.00000000000, 8000.00000000000, -500.00000000000) 
	overview_cam_hide_objects = [ 
		g_dome_00 g_dome_01 g_dome_02 g_dome_03 
		g_dome_04 g_dome_043 g_dome_05 g_dome_06 
		g_dome_07 g_dome_08 g_dome_09 g_dome_10 
		g_dome_11 g_dome_12 g_dome_13 g_dome_14 
		g_dome_15 g_dome_16 g_dome_17 g_dome_18 
		g_dome_19 g_dome_2 g_dome_20 g_dome_21 
		g_dome_22 g_dome_23 g_dome_24 g_dome_25 
		g_dome_26 g_dome_27 g_dome_28 g_dome_29 
		g_dome_30 g_dome_31 g_dome_32 g_dome_33 
		g_dome_34 g_dome_35 g_dome_36 
		g_jumbo_tron_03 
	] 
} 
Level_RU = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_RU 
	load_script = Load_RU 
	name = "Moscow" 
	loading_time = 8.50000000000 
	level = "ru" 
	sky = "ru_Sky" 
	nosun 
	qb = "levels\\ru\\ru.qb" 
	level_qb = "levels\\ru\\ru_scripts.qb" 
	level_sfx_qb = "levels\\ru\\ru_sfx.qb" 
	startup_script = ru_Startup 
	setup_script = RU_Setup 
	goals_script = ru_goals 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 69 
	ambient_green = 72 
	ambient_blue = 79 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 135.00000000000 
	pitch_0 = 330.00000000000 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0 = 1.39999997616 
	heading_1 = 300.00000000000 
	pitch_1 = 330.00000000000 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 140 
	fog_blue = 135 
	fog_green = 135 
	fog_alpha = 50 
	fog_dist = 500 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "RU_scripts.pre" 
	scnpre = "RUscn.pre" 
	colpre = "RUcol.pre" 90 
	overview_cam_zoom = VECTOR(4000.00000000000, 15000.00000000000, -8000.00000000000) 
} 
Level_HH = { 
	game = THUG1 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_HH 
	load_script = Load_HH 
	name = "Hotter Than Hell" 
	loading_time = 8.50000000000 
	level = "hh" 
	sky = "hh_Sky" 
	nosun 
	qb = "levels\\HH\\HH.qb" 
	level_qb = "levels\\HH\\HH_scripts.qb" 
	level_sfx_qb = "levels\\HH\\HH_sfx.qb" 
	startup_script = hh_Startup 
	goals_script = hh_goals 
	default_stats = 5 
	level_number = LevelNum_Default 
	ambient_red = 44 
	ambient_green = 37 
	ambient_blue = 29 
	ambient_mod_factor = 0.30000001192 
	heading_0 = 50.00000000000 
	pitch_0 = 360.00000000000 
	red_0 = 130 
	green_0 = 120 
	blue_0 = 97 
	mod_factor_0 = 1.39999997616 
	heading_1 = 270.00000000000 
	pitch_1 = 330.00000000000 
	red_1 = 58 
	green_1 = 62 
	blue_1 = 66 
	mod_factor_1 = 0.10000000149 
	fog_red = 0 
	fog_blue = 0 
	fog_green = 0 
	fog_alpha = 0 
	fog_dist = 0 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
	pre = "HH_scripts.pre" 
	scnpre = "HHscn.pre" 
	colpre = "HHcol.pre" 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(1000.00000000000, 6000.00000000000, -1000.00000000000) 
} 
level_practice = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableCTF 
	DisableGraffiti 
	structure_name = level_practice 
	load_script = Load_practice 
	name = "Skateshop" 
	loading_time = 8.50000000000 
	level = "practice" 
	sky = "practice_Sky" 
	startup_script = practice_Startup 
	goals_script = practice_goals 
	setup_script = practice_setup 
	qb = "levels\\practice\\practice.qb" 
	level_qb = "levels\\practice\\practice_scripts.qb" 
	default_level_stuff 
	pre = "practice_scripts.pre" 
	scnpre = "practicescn.pre" 
	colpre = "practicecol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 2000.00000000000, 0.00000000000) 
} 
level_sch = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	structure_name = level_sch 
	load_script = Load_sch 
	name = "College" 
	loading_time = 8.50000000000 
	level = "sch" 
	sky = "sch_Sky" 
	startup_script = sch_Startup 
	goals_script = sch_goals 
	setup_script = sch_setup 
	qb = "levels\\sch\\sch.qb" 
	level_qb = "levels\\sch\\sch_scripts.qb" 
	more_level_qbs = [ 
		"levels\\sch\\sch_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "SCH_scripts.pre" 
	scnpre = "SCHscn.pre" 
	colpre = "SCHcol.pre" 
	overview_cam_zoom = VECTOR(1000.00000000000, 6000.00000000000, 1000.00000000000) 
} 
level_alc = { 
	game = THPS4 
	ambient_track = "au_bg" 
	structure_name = level_alc 
	load_script = Load_alc 
	name = "Alcatraz" 
	loading_time = 8.50000000000 
	level = "alc" 
	sky = "alc_Sky" 
	startup_script = alc_Startup 
	goals_script = alc_goals 
	setup_script = alc_setup 
	qb = "levels\\alc\\alc.qb" 
	level_qb = "levels\\alc\\alc_scripts.qb" 
	more_level_qbs = [ 
		"levels\\alc\\alc_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "ALC_scripts.pre" 
	scnpre = "ALCscn.pre" 
	colpre = "ALCcol.pre" 
	overview_cam_zoom = VECTOR(-1000.00000000000, 11000.00000000000, 1000.00000000000) 
} 
level_sf2 = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	structure_name = level_sf2 
	load_script = Load_sf2 
	name = "San Francisco" 
	loading_time = 8.50000000000 
	level = "sf2" 
	sky = "sf2_Sky" 
	default_level_lights 
	startup_script = sf2_Startup 
	goals_script = sf2_goals 
	setup_script = sf2_setup 
	qb = "levels\\sf2\\sf2.qb" 
	level_qb = "levels\\sf2\\sf2_scripts.qb" 
	more_level_qbs = [ 
		"levels\\sf2\\sf2_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "SF2_scripts.pre" 
	scnpre = "SF2scn.pre" 
	colpre = "SF2col.pre" 
	overview_cam_angle = -90 
	overview_cam_zoom = VECTOR(-2000.00000000000, 8000.00000000000, 0.00000000000) 
} 
level_kon = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	structure_name = level_kon 
	load_script = Load_kon 
	name = "Kona" 
	loading_time = 8.50000000000 
	level = "kon" 
	sky = "kon_Sky" 
	startup_script = kon_Startup 
	goals_script = kon_goals 
	setup_script = kon_setup 
	qb = "levels\\kon\\kon.qb" 
	level_qb = "levels\\kon\\kon_scripts.qb" 
	more_level_qbs = [ 
		"levels\\kon\\kon_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "KON_scripts.pre" 
	scnpre = "KONscn.pre" 
	colpre = "KONcol.pre" 
} 
level_lon = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	structure_name = level_lon 
	load_script = Load_lon 
	name = "London" 
	loading_time = 8.50000000000 
	level = "lon" 
	sky = "lon_Sky" 
	startup_script = lon_Startup 
	goals_script = lon_goals 
	setup_script = lon_setup 
	qb = "levels\\lon\\lon.qb" 
	level_qb = "levels\\lon\\lon_scripts.qb" 
	more_level_qbs = [ 
		"levels\\lon\\lon_thugpro.qb" 
		"levels\\lon\\lon_level_particle_data.qb" 
	] 
	default_level_stuff 
	pre = "LON_scripts.pre" 
	scnpre = "LONscn.pre" 
	colpre = "LONcol.pre" 
	overview_cam_zoom = VECTOR(4000.00000000000, 3000.00000000000, -1000.00000000000) 
} 
level_jnk = { 
	game = THPS4 
	structure_name = level_jnk 
	load_script = Load_jnk 
	name = "Shipyard" 
	loading_time = 8.50000000000 
	level = "jnk" 
	sky = "jnk_Sky" 
	startup_script = jnk_Startup 
	goals_script = jnk_goals 
	setup_script = jnk_setup 
	qb = "levels\\jnk\\jnk.qb" 
	level_qb = "levels\\jnk\\jnk_scripts.qb" 
	more_level_qbs = [ 
		"levels\\jnk\\jnk_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "JNK_scripts.pre" 
	scnpre = "JNKscn.pre" 
	colpre = "JNKcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 8000.00000000000, 0.00000000000) 
} 
level_zoo = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	structure_name = level_zoo 
	load_script = Load_zoo 
	name = "Zoo" 
	loading_time = 8.50000000000 
	level = "zoo" 
	sky = "zoo_Sky" 
	startup_script = zoo_Startup 
	goals_script = zoo_goals 
	setup_script = zoo_setup 
	qb = "levels\\zoo\\zoo.qb" 
	level_qb = "levels\\zoo\\zoo_scripts.qb" 
	more_level_qbs = [ 
		"levels\\zoo\\zoo_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "ZOO_scripts.pre" 
	scnpre = "ZOOscn.pre" 
	colpre = "ZOOcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 7000.00000000000, 3000.00000000000) 
} 
Level_cnv = { 
	game = THPS4 
	indoor 
	nosun 
	ambient_track = "bo_bg" 
	structure_name = Level_cnv 
	load_script = Load_cnv 
	name = "Carnival" 
	loading_time = 8.50000000000 
	level = "cnv" 
	sky = "cnv_Sky" 
	startup_script = cnv_Startup 
	goals_script = cnv_goals 
	setup_script = cnv_setup 
	qb = "levels\\cnv\\cnv.qb" 
	level_qb = "levels\\cnv\\cnv_scripts.qb" 
	more_level_qbs = [ 
		"levels\\cnv\\cnv_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "CNV_scripts.pre" 
	scnpre = "CNVscn.pre" 
	colpre = "CNVcol.pre" 
	overview_cam_zoom = VECTOR(-500.00000000000, 5000.00000000000, -2000.00000000000) 
} 
level_hof = { 
	game = THPS4 
	ambient_track = "bo_bg" 
	nosun 
	structure_name = level_hof 
	load_script = Load_hof 
	name = "Chicago" 
	loading_time = 8.50000000000 
	level = "hof" 
	sky = "hof_Sky" 
	startup_script = hof_Startup 
	goals_script = hof_goals 
	setup_script = hof_setup 
	qb = "levels\\hof\\hof.qb" 
	level_qb = "levels\\hof\\hof_scripts.qb" 
	more_level_qbs = [ 
		"levels\\hof\\hof_thugpro.qb" 
	] 
	default_level_stuff 
	pre = "HOF_scripts.pre" 
	scnpre = "HOFscn.pre" 
	colpre = "HOFcol.pre" 
	wallride_hack 
	overview_cam_angle = -90 
	overview_cam_zoom = VECTOR(0.00000000000, 5000.00000000000, 0.00000000000) 
} 
Level_vans = { 
	game = THAW 
	ambient_track = "tr_bg" 
	DisableBackfacePatch 
	structure_name = Level_vans 
	load_script = Load_vans 
	name = "Vans Park" 
	loading_time = 8.50000000000 
	level = "vans" 
	nosun 
	indoor 
	DisableGoalEditor 
	DisableGoalAttack 
	qb = "levels\\vans\\vans.qb" 
	level_qb = "levels\\vans\\vans_scripts.qb" 
	startup_script = vans_Startup 
	setup_script = vans_setup 
	goals_script = vans_goals 
	default_level_stuff 
	pre = "VANS_scripts.pre" 
	scnpre = "VANSscn.pre" 
	colpre = "VANScol.pre" 
	overview_cam_hide_objects = [ z_sv_jc_rafters Z_SV_JH_JC_GEO_CEILING02 Z_SV_JC_GEO_CEILING03 Z_SV_JC_GEO_CEILING04 Z_SV_JC_GEO_CEILING05 ] 
} 
Level_skatepark = { 
	game = THPS1 
	ambient_track = "tr_bg" 
	DisableBackfacePatch 
	structure_name = Level_skatepark 
	load_script = Load_skatepark 
	name = "Skatepark" 
	loading_time = 8.50000000000 
	level = "skatepark" 
	nosun 
	indoor 
	DisableGoalEditor 
	qb = "levels\\skatepark\\skatepark.qb" 
	level_qb = "levels\\skatepark\\skatepark_scripts.qb" 
	startup_script = skatepark_Startup 
	setup_script = skatepark_setup 
	goals_script = skatepark_goals 
	default_level_stuff 
	pre = "skatepark_scripts.pre" 
	scnpre = "skateparkscn.pre" 
	colpre = "skateparkcol.pre" 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(0.00000000000, 12000.00000000000, -200.00000000000) 
} 
Level_sz = { 
	game = THAW 
	ambient_track = "au_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_sz 
	load_script = Load_sz 
	name = "Santa Cruz" 
	loading_time = 8.50000000000 
	level = "sz" 
	sky = "sz_sky" 
	qb = "levels\\sz\\sz.qb" 
	level_qb = "levels\\sz\\sz_scripts.qb" 
	more_level_qbs = [ 
		"levels\\sz\\sz_thugpro.qb" 
		"levels\\sz\\sz_level_particle_data.qb" 
		"levels\\sz\\sz_level_fast_particle_data.qb" 
	] 
	startup_script = sz_startup 
	setup_script = sz_setup 
	goals_script = sz_goals 
	default_level_stuff 
	pre = "SZ_scripts.pre" 
	scnpre = "SZscn.pre" 
	colpre = "SZcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 25000.00000000000, 10000.00000000000) 
} 
Level_atlanta = { 
	game = THAW 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_atlanta 
	load_script = Load_atlanta 
	name = "Atlanta" 
	loading_time = 8.50000000000 
	level = "atlanta" 
	sky = "Default_Sky" 
	qb = "levels\\atlanta\\atlanta.qb" 
	level_qb = "levels\\atlanta\\atlanta_scripts.qb" 
	level_sfx_qb = "levels\\atlanta\\atlanta_sfx.qb" 
	more_level_qbs = [ 
		"levels\\atlanta\\atlanta_thugpro.qb" 
	] 
	setup_script = at_Setup 
	startup_script = at_Startup 
	goals_script = at_goals 
	default_level_stuff 
	pre = "atlanta_scripts.pre" 
	scnpre = "atlantascn.pre" 
	colpre = "atlantacol.pre" 
	overview_cam_zoom = VECTOR(500.00000000000, 40000.00000000000, -1500.00000000000) 
} 
Level_kyoto = { 
	game = THAW 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	nosun 
	structure_name = Level_kyoto 
	load_script = Load_kyoto 
	name = "Kyoto" 
	loading_time = 8.50000000000 
	level = "kyoto" 
	default_sky 
	qb = "levels\\kyoto\\kyoto.qb" 
	level_qb = "levels\\kyoto\\kyoto_scripts.qb" 
	more_level_qbs = [ 
		"levels\\kyoto\\kyoto_thugpro.qb" 
	] 
	setup_script = kyoto_Setup 
	startup_script = kyoto_Startup 
	goals_script = kyoto_goals 
	default_level_stuff 
	pre = "kyoto_scripts.pre" 
	scnpre = "kyotoscn.pre" 
	colpre = "kyotocol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 28000.00000000000, 0.00000000000) 
} 
Level_HISCH = { 
	game = THP8 
	ambient_track = "bo_bg" 
	wallride_hack 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_HISCH 
	load_script = Load_HISCH 
	name = "High School" 
	loading_time = 4.00000000000 
	level = "HISCH" 
	sky = "default_sky" 
	qb = "levels\\HISCH\\HISCH.qb" 
	level_qb = "levels\\HISCH\\HISCH_scripts.qb" 
	more_level_qbs = [ 
		"levels\\hisch\\hisch_thugpro.qb" 
	] 
	startup_script = HISCH_startup 
	setup_script = HISCH_setup 
	goals_script = HISCH_goals 
	default_level_stuff 
	pre = "HISCH_scripts.pre" 
	scnpre = "HISCHscn.pre" 
	colpre = "HISCHcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 3000.00000000000, 1500.00000000000) 
} 
Level_z_funpark = { 
	game = THP8 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_z_funpark 
	load_script = Load_z_funpark 
	name = "Fun Park" 
	loading_time = 8.50000000000 
	level = "z_funpark" 
	sky = "Default_Sky" 
	qb = "levels\\z_funpark\\z_funpark.qb" 
	level_qb = "levels\\z_funpark\\z_funpark_scripts.qb" 
	setup_script = z_funpark_setup 
	startup_script = z_funpark_startup 
	default_level_stuff 
	pre = "z_funpark_scripts.pre" 
	scnpre = "z_funparkscn.pre" 
	colpre = "z_funparkcol.pre" 
	overview_cam_zoom = VECTOR(-27000.00000000000, 52000.00000000000, -30000.00000000000) 
} 
Level_z_center = { 
	game = THP8 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_z_center 
	load_script = Load_z_center 
	name = "City center" 
	loading_time = 8.50000000000 
	level = "z_center" 
	sky = "Default_Sky" 
	qb = "levels\\z_center\\z_center.qb" 
	level_qb = "levels\\z_center\\z_center_scripts.qb" 
	setup_script = z_center_Setup 
	startup_script = z_center_Startup 
	default_level_stuff 
	pre = "z_center_scripts.pre" 
	scnpre = "z_centerscn.pre" 
	colpre = "z_centercol.pre" 
	overview_cam_zoom = VECTOR(-2000.00000000000, 4000.00000000000, -200.00000000000) 
} 
Level_z_riod = { 
	game = THPS3 
	indoor 
	nosun 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_z_riod 
	load_script = Load_z_riod 
	name = "Rio - Downhill" 
	loading_time = 8.50000000000 
	level = "z_riod" 
	sky = "sunset_sky" 
	qb = "levels\\z_riod\\z_riod.qb" 
	level_qb = "levels\\z_riod\\z_riod_scripts.qb" 
	setup_script = z_riod_Setup 
	startup_script = z_riod_Startup 
	default_level_stuff 
	pre = "z_riod_scripts.pre" 
	scnpre = "z_riodscn.pre" 
	colpre = "z_riodcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 20000.00000000000, 17000.00000000000) 
} 
SCRIPT load_z_el 
	load_level level_z_el 
ENDSCRIPT

level_z_el = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	default_level_stuff 
	name = "East LA" 
	level = "z_el" 
	sky = "thaw_Sky" 
	qb = "levels\\z_el\\z_el.qb" 
	level_qb = "levels\\z_el\\z_el_scripts.qb" 
	level_sfx_qb = "levels\\z_el\\z_el_sfx_scripts.qb" 
	more_level_qbs = [ "levels\\z_el\\z_el_thugpro.qb" ] 
	structure_name = level_z_el 
	load_script = load_z_el 
	goals_script = z_el_goals 
	setup_script = z_el_setup 
	startup_script = z_el_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_el_scripts.pre" 
	scnpre = "z_elscn.pre" 
	colpre = "z_elcol.pre" 
	overview_cam_zoom = VECTOR(-9000.00000000000, 43000.00000000000, 0.00000000000) 
} 
SCRIPT load_z_sm 
	load_level level_z_sm 
ENDSCRIPT

level_z_sm = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	default_level_stuff 
	name = "Santa Monica" 
	level = "z_sm" 
	sky = "thaw_Sky" 
	qb = "levels\\z_sm\\z_sm.qb" 
	level_qb = "levels\\z_sm\\z_sm_scripts.qb" 
	more_level_qbs = [ "levels\\z_sm\\z_sm_thugpro.qb" ] 
	structure_name = level_z_sm 
	load_script = load_z_sm 
	goals_script = z_sm_goals 
	setup_script = z_sm_setup 
	startup_script = z_sm_startup 
	ambient_track = "au_bg" 
	loading_time = 8.50000000000 
	pre = "z_sm_scripts.pre" 
	scnpre = "z_smscn.pre" 
	colpre = "z_smcol.pre" 
	overview_cam_zoom = VECTOR(2000.00000000000, 16000.00000000000, -1000.00000000000) 
} 
SCRIPT load_z_bh 
	load_level level_z_bh 
ENDSCRIPT

level_z_bh = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	default_level_stuff 
	name = "Beverly Hills" 
	level = "z_bh" 
	sky = "thaw_Sky" 
	qb = "levels\\z_bh\\z_bh.qb" 
	level_qb = "levels\\z_bh\\z_bh_scripts.qb" 
	level_sfx_qb = "levels\\z_bh\\z_bh_sfx_scripts.qb" 
	more_level_qbs = [ "levels\\z_bh\\z_bh_thugpro.qb" ] 
	structure_name = level_z_bh 
	load_script = load_z_bh 
	goals_script = z_bh_goals 
	setup_script = z_bh_setup 
	startup_script = z_bh_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_bh_scripts.pre" 
	scnpre = "z_bhscn.pre" 
	colpre = "z_bhcol.pre" 
	overview_cam_zoom = VECTOR(2500.00000000000, 11000.00000000000, 1500.00000000000) 
	overview_cam_angle = -90 
} 
SCRIPT load_z_sv2 
	load_level level_z_sv2 
ENDSCRIPT

level_z_sv2 = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	default_level_stuff 
	default_sky 
	indoor 
	nosun 
	name = "The Ruins" 
	level = "z_sv2" 
	qb = "levels\\z_sv2\\z_sv2.qb" 
	level_qb = "levels\\z_sv2\\z_sv2_scripts.qb" 
	more_level_qbs = [ "levels\\z_sv2\\z_sv2_thugpro.qb" ] 
	structure_name = level_z_sv2 
	load_script = load_z_sv2 
	goals_script = z_sv2_goals 
	setup_script = z_sv2_setup 
	startup_script = z_sv2_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_sv2_scripts.pre" 
	scnpre = "z_sv2scn.pre" 
	colpre = "z_sv2col.pre" 
} 
SCRIPT load_z_sr 
	load_level level_z_sr 
ENDSCRIPT

level_z_sr = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	default_level_stuff 
	name = "Skate Ranch" 
	level = "z_sr" 
	sky = "thaw_Sky" 
	qb = "levels\\z_sr\\z_sr.qb" 
	level_qb = "levels\\z_sr\\z_sr_scripts.qb" 
	more_level_qbs = [ "levels\\z_sr\\z_sr_thugpro.qb" ] 
	structure_name = level_z_sr 
	load_script = load_z_sr 
	goals_script = z_sr_goals 
	setup_script = z_sr_setup 
	startup_script = z_sr_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_sr_scripts.pre" 
	scnpre = "z_srscn.pre" 
	colpre = "z_srcol.pre" 
} 
SCRIPT load_z_dt 
	load_level level_z_dt 
ENDSCRIPT

level_z_dt = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	default_level_stuff 
	name = "Downtown" 
	level = "z_dt" 
	sky = "thaw_Sky" 
	qb = "levels\\z_dt\\z_dt.qb" 
	level_qb = "levels\\z_dt\\z_dt_scripts.qb" 
	more_level_qbs = [ "levels\\z_dt\\z_dt_thugpro.qb" ] 
	structure_name = level_z_dt 
	load_script = load_z_dt 
	goals_script = z_dt_goals 
	setup_script = z_dt_setup 
	startup_script = z_dt_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_dt_scripts.pre" 
	scnpre = "z_dtscn.pre" 
	colpre = "z_dtcol.pre" 
} 
SCRIPT load_z_ho 
	load_level level_z_ho 
ENDSCRIPT

level_z_ho = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	default_level_stuff 
	name = "Hollywood" 
	level = "z_ho" 
	sky = "thaw_Sky" 
	qb = "levels\\z_ho\\z_ho.qb" 
	level_qb = "levels\\z_ho\\z_ho_scripts.qb" 
	more_level_qbs = [ "levels\\z_ho\\z_ho_thugpro.qb" ] 
	structure_name = level_z_ho 
	load_script = load_z_ho 
	goals_script = z_ho_goals 
	setup_script = z_ho_setup 
	startup_script = z_ho_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_ho_scripts.pre" 
	scnpre = "z_hoscn.pre" 
	colpre = "z_hocol.pre" 
} 
SCRIPT load_z_lv 
	load_level level_z_lv 
ENDSCRIPT

level_z_lv = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	default_level_stuff 
	name = "Casino" 
	level = "z_lv" 
	sky = "thaw_Sky" 
	qb = "levels\\z_lv\\z_lv.qb" 
	level_qb = "levels\\z_lv\\z_lv_scripts.qb" 
	more_level_qbs = [ "levels\\z_lv\\z_lv_thugpro.qb" ] 
	structure_name = level_z_lv 
	load_script = load_z_lv 
	goals_script = z_lv_goals 
	setup_script = z_lv_setup 
	startup_script = z_lv_startup 
	ambient_track = "bo_bg" 
	loading_time = 8.50000000000 
	pre = "z_lv_scripts.pre" 
	scnpre = "z_lvscn.pre" 
	colpre = "z_lvcol.pre" 
} 
SCRIPT load_z_oi 
	load_level level_z_oi 
ENDSCRIPT

level_z_oi = { 
	game = THAW 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	default_level_stuff 
	name = "Oil Rig (THAW)" 
	level = "z_oi" 
	sky = "thaw_Sky" 
	qb = "levels\\z_oi\\z_oi.qb" 
	level_qb = "levels\\z_oi\\z_oi_scripts.qb" 
	more_level_qbs = [ "levels\\z_oi\\z_oi_thugpro.qb" ] 
	structure_name = level_z_oi 
	load_script = load_z_oi 
	goals_script = z_oi_goals 
	setup_script = z_oi_setup 
	startup_script = z_oi_startup 
	ambient_track = "au_bg" 
	loading_time = 8.50000000000 
	pre = "z_oi_scripts.pre" 
	scnpre = "z_oiscn.pre" 
	colpre = "z_oicol.pre" 
} 
level_foun = { 
	game = THPS3 
	DisableGoalEditor 
	DisableGoalAttack 
	ambient_track = "tr_bg" 
	models_in_script_prx 
	DisableBackfacePatch 
	structure_name = level_foun 
	load_script = load_foun 
	name = "Foundry" 
	level = "foun" 
	nosun 
	qb = "levels\\foun\\foun.qb" 
	level_qb = "levels\\foun\\foun_scripts.qb" 
	setup_script = CJR_Foun_LoadingScript 
	startup_script = foun_startup 
	goals_script = foun_goals 
	default_level_stuff 
	pre = "foun_scripts.pre" 
	scnpre = "founscn.pre" 
	colpre = "founcol.pre" 
	indoor 
	nosun 
	overview_cam_zoom = VECTOR(1000.00000000000, 1000.00000000000, 0.00000000000) 
	overview_cam_hide_objects = [ 
		Pipes_Ceiling01 
		Pipes_Ceiling02 
		Pipes_Ceiling03 
		Opti_sWallSection_North_01 
		Opti_Generator_Exterior01 
	] 
} 
level_rio = { 
	game = THPS3 
	DisableGoalEditor 
	DisableGoalAttack 
	ambient_track = "au_bg" 
	models_in_script_prx 
	DisableBackfacePatch 
	structure_name = level_rio 
	load_script = load_rio 
	name = "Rio" 
	level = "rio" 
	sky = "rio_Sky" 
	startup_script = rio_startup 
	goals_script = rio_goals 
	setup_script = rio_setup 
	qb = "levels\\rio\\rio.qb" 
	level_qb = "levels\\rio\\rio_scripts.qb" 
	default_level_stuff 
	pre = "rio_scripts.pre" 
	scnpre = "rioscn.pre" 
	colpre = "riocol.pre" 
	nosun 
	overview_cam_zoom = VECTOR(3000.00000000000, 32000.00000000000, 7000.00000000000) 
} 
level_sub = { 
	game = THPS3 
	DisableGoalEditor 
	DisableGoalAttack 
	ambient_track = "st_bg" 
	nosun 
	models_in_script_prx 
	structure_name = level_sub 
	load_script = load_sub 
	name = "Suburbia" 
	level = "sub" 
	sky = "sub_Sky" 
	qb = "levels\\sub\\sub.qb" 
	level_qb = "levels\\sub\\sub_scripts.qb" 
	startup_script = sub_startup 
	goals_script = sub_goals 
	default_level_stuff 
	pre = "sub_scripts.pre" 
	scnpre = "subscn.pre" 
	colpre = "subcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 17000.00000000000, 0.00000000000) 
} 
level_tok = { 
	game = THPS3 
	DisableGoalEditor 
	DisableGoalAttack 
	ambient_track = "bo_bg" 
	nosun 
	indoor 
	models_in_script_prx 
	structure_name = level_tok 
	load_script = load_tok 
	name = "Tokyo" 
	level = "tok" 
	sky = "tok_Sky" 
	qb = "levels\\tok\\tok.qb" 
	level_qb = "levels\\tok\\tok_scripts.qb" 
	setup_script = tok_setup 
	startup_script = tok_startup 
	goals_script = tok_goals 
	default_level_stuff 
	pre = "tok_scripts.pre" 
	scnpre = "tokscn.pre" 
	colpre = "tokcol.pre" 
	overview_cam_zoom = VECTOR(2000.00000000000, 17000.00000000000, -2000.00000000000) 
} 
level_shp = { 
	game = THPS3 
	DisableGoalEditor 
	DisableGoalAttack 
	ambient_track = "au_bg" 
	models_in_script_prx 
	structure_name = level_shp 
	load_script = load_shp 
	name = "Cruise Ship" 
	level = "shp" 
	sky = "shp_Sky" 
	qb = "levels\\shp\\shp.qb" 
	level_qb = "levels\\shp\\shp_scripts.qb" 
	setup_script = shp_setup 
	startup_script = shp_startup 
	goals_script = shp_goals 
	default_level_stuff 
	pre = "shp_scripts.pre" 
	scnpre = "shpscn.pre" 
	colpre = "shpcol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 22000.00000000000, 1000.00000000000) 
} 
level_si = { 
	game = THPS3 
	indoor 
	DisableGoalEditor 
	DisableGoalAttack 
	models_in_script_prx 
	structure_name = level_si 
	load_script = load_si 
	name = "Skater Island" 
	level = "si" 
	sky = "si_Sky" 
	qb = "levels\\si\\si.qb" 
	level_qb = "levels\\si\\si_scripts.qb" 
	setup_script = ALF_SI_Init 
	startup_script = si_startup 
	goals_script = si_goals 
	default_level_stuff 
	pre = "si_scripts.pre" 
	scnpre = "siscn.pre" 
	colpre = "sicol.pre" 
	overview_cam_angle = 180 
	overview_cam_zoom = VECTOR(-1000.00000000000, 10000.00000000000, 3500.00000000000) 
	overview_cam_hide_objects = [ SI_Ceiling01 SI_SmallBeam SI_BigBeam SI_BigBeam01 ] 
} 
level_oil = { 
	game = THPS3 
	DisableGoalEditor 
	DisableGoalAttack 
	indoor 
	ambient_track = "au_bg" 
	nosun 
	models_in_script_prx 
	structure_name = level_oil 
	load_script = load_oil 
	name = "Oil Rig" 
	level = "oil" 
	sky = "oil_Sky" 
	startup_script = oil_startup 
	goals_script = oil_goals 
	setup_script = oil_setup 
	qb = "levels\\oil\\oil.qb" 
	level_qb = "levels\\oil\\oil_scripts.qb" 
	default_level_stuff 
	pre = "oil_scripts.pre" 
	scnpre = "oilscn.pre" 
	colpre = "oilcol.pre" 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(0.00000000000, 26000.00000000000, -1000.00000000000) 
} 
Level_ware = { 
	game = THPS1 
	ambient_track = "tr_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	structure_name = Level_ware 
	load_script = Load_ware 
	name = "Warehouse" 
	level = "ware" 
	nosun 
	qb = "levels\\ware\\ware.qb" 
	level_qb = "levels\\ware\\ware_scripts.qb" 
	setup_script = ware_setup 
	startup_script = ware_Startup 
	goals_script = ware_goals 
	default_level_stuff 
	indoor 
	pre = "ware_scripts.pre" 
	scnpre = "warescn.pre" 
	colpre = "warecol.pre" 
} 
SCRIPT Load_z_ma 
	load_level Level_z_ma 
ENDSCRIPT

Level_z_ma = { 
	game = THPS1 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	default_level_stuff 
	indoor IsBigLevel nosun 
	structure_name = Level_z_ma 
	load_script = Load_z_ma 
	name = "The Mall" 
	level = "z_ma" 
	sky = "thaw_Sky" 
	qb = "levels\\z_ma\\z_ma.qb" 
	level_qb = "levels\\z_ma\\z_ma_scripts.qb" 
	setup_script = z_ma_setup 
	startup_script = z_ma_Startup 
	goals_script = z_ma_goals 
	pre = "z_ma_scripts.pre" 
	scnpre = "z_mascn.pre" 
	colpre = "z_macol.pre" 
} 
Level_z_dn = { 
	game = THPS1 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	structure_name = Level_z_dn 
	load_script = Load_z_dn 
	name = "Minneapolis" 
	level = "z_dn" 
	nosun 
	qb = "levels\\z_dn\\z_dn.qb" 
	level_qb = "levels\\z_dn\\z_dn_scripts.qb" 
	setup_script = z_dn_setup 
	startup_script = z_dn_Startup 
	goals_script = z_dn_goals 
	default_level_stuff 
	indoor 
	pre = "z_dn_scripts.pre" 
	scnpre = "z_dnscn.pre" 
	colpre = "z_dncol.pre" 
	overview_cam_zoom = VECTOR(-2000.00000000000, 15000.00000000000, -2000.00000000000) 
} 
Level_burn = { 
	game = THPS1 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	wallride_hack 
	nosun 
	DisableBackfacePatch 
	structure_name = Level_burn 
	load_script = Load_burn 
	name = "Burnside" 
	level = "burn" 
	sky = "burn_Sky" 
	startup_script = burn_startup 
	qb = "levels\\burn\\burn.qb" 
	default_level_stuff 
	pre = "burn_scripts.pre" 
	scnpre = "burnscn.pre" 
	colpre = "burncol.pre" 
	overview_cam_angle = 90 
	overview_cam_zoom = VECTOR(-800.00000000000, 7000.00000000000, 400.00000000000) 
} 
Level_ros = { 
	game = THPS1 
	ambient_track = "st_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	indoor 
	structure_name = Level_ros 
	load_script = Load_ros 
	name = "Roswell" 
	level = "ros" 
	sky = "ros_Sky" 
	nosun 
	qb = "levels\\ros\\ros.qb" 
	startup_script = ros_Startup 
	default_level_stuff 
	pre = "ros_scripts.pre" 
	scnpre = "rosscn.pre" 
	colpre = "roscol.pre" 
	overview_cam_zoom = VECTOR(0.00000000000, 2000.00000000000, -1000.00000000000) 
	overview_cam_hide_objects = [ garage_ceiling surrounding_ground01 ] 
} 
Level_z_ms = { 
	game = THPS2 
	ambient_track = "bo_bg" 
	DisableGoalEditor 
	DisableGoalAttack 
	DisableBackfacePatch 
	structure_name = Level_z_ms 
	load_script = Load_z_ms 
	name = "Marseille" 
	level = "z_ms" 
	sky = "steamboat_sky" 
	indoor 
	qb = "levels\\z_ms\\z_ms.qb" 
	level_qb = "levels\\z_ms\\z_ms_scripts.qb" 
	setup_script = z_ms_setup 
	startup_script = z_ms_Startup 
	goals_script = z_ms_goals 
	default_level_stuff 
	pre = "z_ms_scripts.pre" 
	scnpre = "z_msscn.pre" 
	colpre = "z_mscol.pre" 
	overview_cam_angle = 0 
	overview_cam_zoom = VECTOR(-7000.00000000000, 16500.00000000000, -500.00000000000) 
} 
default_level_stuff = { 
	DisableGoalEditor 
	loading_time = 8.50000000000 
	default_stats = 10 
	level_number = LevelNum_Default 
	num_m_heads = 4 
	num_m_torsos = 4 
	num_m_legs = 4 
} 
default_level_lights = { 
	ambient_red = 54 
	ambient_green = 63 
	ambient_blue = 64 
	ambient_mod_factor_lo = 1.00000000000 
	ambient_mod_factor_hi = 1.00000000000 
	heading_0 = 60 
	pitch_0 = 350 
	red_0 = 42 
	green_0 = 40 
	blue_0 = 36 
	mod_factor_0_lo = 1.00000000000 
	mod_factor_0_hi = 1.00000000000 
	heading_1 = 305 
	pitch_1 = 37 
	red_1 = 72 
	green_1 = 70 
	blue_1 = 66 
	mod_factor_1_lo = 1.00000000000 
	mod_factor_1_hi = 1.00000000000 
} 
SCRIPT GenerateLevelStructureNameFromTheme 
	IF ( <theme> > 0 ) 
		FormatText ChecksumName = structure_name "Level_sk5ed%d" d = ( <theme> + 1 ) 
	ELSE 
		structure_name = Level_Sk5Ed 
	ENDIF 
	RETURN structure_name = <structure_name> 
ENDSCRIPT

SCRIPT Load_Sk5Ed 
	GetEditorTheme 
	load_parked_textures_to_main_memory 
	GenerateLevelStructureNameFromTheme theme = <theme> 
	IF IsXbox 
		load_level <structure_name> 
	ENDIF 
	THUGPRO_ParkEdHeightPatch off 
	Change temp_parked_height_patch_disabled = 1 
ENDSCRIPT

SCRIPT Load_Sk5Ed_gameplay 
	GetEditorTheme 
	IF ( <theme> > 0 ) 
		FormatText ChecksumName = structure_name "Level_sk5ed%d" d = ( <theme> + 1 ) 
	ELSE 
		structure_name = Level_Sk5Ed 
	ENDIF 
	load_level <structure_name> startup_script = Sk5Ed_Startup_gameplay 
	IF NOT istrue temp_parked_height_patch_disabled 
		THUGPRO_ParkEdHeightPatch off 
		Change temp_parked_height_patch_disabled = 1 
	ENDIF 
ENDSCRIPT

Level_sk5ed_defaults = 
{ 
	park_editor 
	load_script = Load_Sk5Ed 
	name = "Created Park" 
	loading_time = 6.80999994278 
	loading_time_xbox = 9 
	startup_script = Sk5Ed_Startup 
	goals_script = Sk5Ed_goals 
	default_stats = 10 
	default_stats_classic = 10 
	level_number = LevelNum_Sk5ed 
	pre = "thugpro_sk5ed.pre" 
	level = "sk5ed" 
	level_name = "sk5ed" 
	pedpre = "sk5edped.pre" 
	colpre = "thugpro_sk5edcol.pre" 
	level_qb = "levels\\sk5ed\\editor_scripts.qb" 
	qb = "levels\\sk5ed\\thugpro\\sk5ed.qb" 
	more_level_qbs = [ 
		"levels\\sk5ed\\thugpro\\ParkEd_node_scripts.qb" 
		"levels\\sk5ed\\thugpro\\ParkEd_fast_particle_data.qb" 
	] 
	ambient_red = 72 
	ambient_green = 72 
	ambient_blue = 72 
	ambient_mod_factor_lo = 0.50000000000 
	ambient_mod_factor_hi = 0.00000000000 
	heading_0 = 90.00000000000 
	pitch_0 = -60.00000000000 
	red_0 = 75 
	green_0 = 75 
	blue_0 = 75 
	mod_factor_0_lo = 0.69999998808 
	mod_factor_0_hi = 0.00000000000 
	heading_1 = 0.00000000000 
	pitch_1 = -90.00000000000 
	red_1 = 0 
	green_1 = 0 
	blue_1 = 0 
	mod_factor_1_lo = 1.00000000000 
	mod_factor_1_hi = 0.00000000000 
	fog_red = 0 
	fog_green = 0 
	fog_blue = 0 
	fog_alpha = 0 
	fog_dist = 0 
} 
Level_Sk5Ed = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed 
	loading_time = 7.11000013351 
	loading_time_xbox = 9 
	scnpre = "sk5ed_shellscn.pre" 
	sky = "sk5ed_sky" 
	outer_shell = "sk5ed_shell" 
	theme_name = "Antarctica" 
} 
Level_Sk5Ed2 = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed2 
	loading_time = 7.38000011444 
	scnpre = "sk5ed2_shellscn.pre" 
	sky = "sk5ed2_Sky" 
	outer_shell = "sk5ed2_shell" 
	theme_name = "Mars" 
} 
Level_Sk5Ed3 = { 
	ambient_track = "st_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed3 
	loading_time = 7.11999988556 
	scnpre = "sk5ed3_shellscn.pre" 
	sky = "sk5ed3_Sky" 
	outer_shell = "sk5ed3_shell" 
	theme_name = "Cemetary" 
} 
Level_Sk5Ed4 = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed4 
	loading_time = 7.15000009537 
	scnpre = "sk5ed4_shellscn.pre" 
	sky = "sk5ed4_Sky" 
	outer_shell = "sk5ed4_shell" 
	theme_name = "Race Car" 
} 
Level_Sk5Ed5 = { 
	ambient_track = "no_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed5 
	loading_time = 7.59000015259 
	scnpre = "sk5ed5_shellscn.pre" 
	sky = "sk5ed5_Sky" 
	outer_shell = "sk5ed5_shell" 
	theme_name = "Swamp" 
} 
Level_Sk5Ed6 = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed6 
	loading_time = 7.59000015259 
	scnpre = "sk5ed6_shellscn.pre" 
	sky = "sk5ed6_Sky" 
	outer_shell = "sk5ed6_shell" 
	theme_name = "Suburbia" 
} 
Level_Sk5Ed7 = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed7 
	loading_time = 8 
	scnpre = "sk5ed7_shellscn.pre" 
	sky = "sk5ed7_Sky" 
	outer_shell = "sk5ed7_shell" 
	theme_name = "City Rooftop" 
} 
Level_Sk5Ed8 = { 
	ambient_track = "au_bg" 
	nosun 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed8 
	loading_time = 8 
	scnpre = "sk5ed8_shellscn.pre" 
	sky = "sk5ed8_Sky" 
	outer_shell = "sk5ed8_shell" 
	theme_name = "Lost Island" 
} 
Level_Sk5Ed9 = { 
	ambient_track = "tr_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed9 
	loading_time = 8 
	scnpre = "sk5ed9_shellscn.pre" 
	sky = "sk5ed9_Sky" 
	outer_shell = "sk5ed9_shell" 
	theme_name = "Warehouse" 
	indoor 
	nosun 
} 
Level_Sk5Ed10 = { 
	ambient_track = "st_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed10 
	loading_time = 11 
	scnpre = "sk5ed10_shellscn.pre" 
	sky = "sk5ed10_Sky" 
	outer_shell = "sk5ed10_shell" 
	theme_name = "Prison Yard" 
	indoor 
	nosun 
} 
Level_Sk5Ed11 = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed11 
	loading_time = 11 
	scnpre = "sk5ed11_shellscn.pre" 
	sky = "sk5ed11_Sky" 
	outer_shell = "sk5ed11_shell" 
	theme_name = "Western" 
} 
Level_Sk5Ed12 = { 
	ambient_track = "la_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed12 
	loading_time = 11 
	scnpre = "sk5ed12_shellscn.pre" 
	sky = "sk5ed12_Sky" 
	outer_shell = "sk5ed12_shell" 
	theme_name = "Los Angeles" 
} 
Level_Sk5Ed13 = { 
	ambient_track = "au_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed13 
	loading_time = 11 
	scnpre = "sk5ed13_shellscn.pre" 
	sky = "sk5ed13_Sky" 
	outer_shell = "sk5ed13_shell" 
	theme_name = "Carrier" 
} 
Level_Sk5Ed14 = { 
	ambient_track = "au_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed14 
	loading_time = 11 
	scnpre = "sk5ed14_shellscn.pre" 
	sky = "sk5ed14_Sky" 
	outer_shell = "sk5ed14_shell" 
	theme_name = "Beach" 
	fence_type = Sk4Ed_Fence_20x20_Invisible 
	shell_pieces = [ 
		[ 
			Sk3Ed_Shell_Bch_Island01 
			Sk3Ed_Shell_Bch_16x16_Floor01 
			Sk3Ed_Shell_Bch_16x16_Floor02 
			Sk3Ed_Shell_Bch_16x16_Planter01 
			Sk3Ed_Shell_Bch_16x16_Barrier01 
			Sk3Ed_Shell_Bch_16x16_Barrier_Reflection01 
			Sk3Ed_Shell_Bch_30x30_ShortWall01 
			Sk3Ed_Shell_Bch_30x30_Sand01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_High01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Low01 
			Sk3Ed_Shell_Bch_30x30_Reflection01 
			Sk3Ed_Shell_Bch_30x30_Surf01 
			Sk3Ed_Shell_Bch_30x30_Planter01 
			Sk3Ed_Shell_Bch_30x30_Sidewalk01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Reflection01 
			Sk3Ed_Shell_Bch_30x30_PalmTree01 
			Sk3Ed_Shell_Bch_30x30_PalmTree02 
			Sk3Ed_Shell_Bch_30x30_PalmTree03 
			Sk3Ed_Shell_Bch_30x30_Plaza01 
			Sk3Ed_Shell_Bch_30x30_LowPalm01 
			Sk3Ed_Shell_Bch_30x30_Storefront01 
			Sk3Ed_Shell_Bch_30x30_HighRise01 
			Sk3Ed_Shell_Bch_30x30_Hotel01 
			Sk3Ed_Shell_Bch_30x30_SandPlaza01 
			Sk3Ed_Shell_Bch_30x30_Volleyball01 
			Sk3Ed_Shell_Bch_30x30_BeachTent01 
			Sk3Ed_Shell_Bch_30x30_Umbrella01 
			Sk3Ed_Shell_Bch_30x30_ShortLamp01 
			Sk3Ed_Shell_Bch_30x30_GarbageCan01 
		] 
		[ 
			Sk3Ed_Shell_Bch_Island01 
			Sk3Ed_Shell_Bch_24x24_Floor01 
			Sk3Ed_Shell_Bch_24x24_Floor02 
			Sk3Ed_Shell_Bch_24x24_Planter01 
			Sk3Ed_Shell_Bch_24x24_Barrier01 
			Sk3Ed_Shell_Bch_24x24_Barrier_Reflection01 
			Sk3Ed_Shell_Bch_30x30_ShortWall01 
			Sk3Ed_Shell_Bch_30x30_Sand01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_High01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Low01 
			Sk3Ed_Shell_Bch_30x30_Reflection01 
			Sk3Ed_Shell_Bch_30x30_Surf01 
			Sk3Ed_Shell_Bch_30x30_Planter01 
			Sk3Ed_Shell_Bch_30x30_Sidewalk01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Reflection01 
			Sk3Ed_Shell_Bch_30x30_PalmTree01 
			Sk3Ed_Shell_Bch_30x30_PalmTree02 
			Sk3Ed_Shell_Bch_30x30_PalmTree03 
			Sk3Ed_Shell_Bch_30x30_Plaza01 
			Sk3Ed_Shell_Bch_30x30_LowPalm01 
			Sk3Ed_Shell_Bch_30x30_Storefront01 
			Sk3Ed_Shell_Bch_30x30_HighRise01 
			Sk3Ed_Shell_Bch_30x30_Hotel01 
			Sk3Ed_Shell_Bch_30x30_SandPlaza01 
			Sk3Ed_Shell_Bch_30x30_Volleyball01 
			Sk3Ed_Shell_Bch_30x30_BeachTent01 
			Sk3Ed_Shell_Bch_30x30_Umbrella01 
			Sk3Ed_Shell_Bch_30x30_ShortLamp01 
			Sk3Ed_Shell_Bch_30x30_GarbageCan01 
		] 
		[ 
			Sk3Ed_Shell_Bch_Island01 
			Sk3Ed_Shell_Bch_30x30_ShortWall01 
			Sk3Ed_Shell_Bch_30x30_Sand01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_High01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Low01 
			Sk3Ed_Shell_Bch_30x30_Reflection01 
			Sk3Ed_Shell_Bch_30x30_Surf01 
			Sk3Ed_Shell_Bch_30x30_Planter01 
			Sk3Ed_Shell_Bch_30x30_Sidewalk01 
			Sk3Ed_Shell_Bch_30x30_Barrier01 
			Sk3Ed_Shell_Bch_30x30_Barrier_Reflection01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Reflection01 
			Sk3Ed_Shell_Bch_30x30_PalmTree01 
			Sk3Ed_Shell_Bch_30x30_PalmTree02 
			Sk3Ed_Shell_Bch_30x30_PalmTree03 
			Sk3Ed_Shell_Bch_30x30_Plaza01 
			Sk3Ed_Shell_Bch_30x30_LowPalm01 
			Sk3Ed_Shell_Bch_30x30_Storefront01 
			Sk3Ed_Shell_Bch_30x30_HighRise01 
			Sk3Ed_Shell_Bch_30x30_Hotel01 
			Sk3Ed_Shell_Bch_30x30_SandPlaza01 
			Sk3Ed_Shell_Bch_30x30_Volleyball01 
			Sk3Ed_Shell_Bch_30x30_BeachTent01 
			Sk3Ed_Shell_Bch_30x30_Umbrella01 
			Sk3Ed_Shell_Bch_30x30_ShortLamp01 
			Sk3Ed_Shell_Bch_30x30_GarbageCan01 
		] 
		[ 
			Sk3Ed_Shell_Bch_Island01 
			Sk3Ed_Shell_Bch_30x18_Floor01 
			Sk3Ed_Shell_Bch_30x18_Floor02 
			Sk3Ed_Shell_Bch_30x18_Planter01 
			Sk3Ed_Shell_Bch_30x18_Barrier01 
			Sk3Ed_Shell_Bch_30x18_Barrier_Reflection01 
			Sk3Ed_Shell_Bch_30x30_ShortWall01 
			Sk3Ed_Shell_Bch_30x30_Sand01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_High01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Low01 
			Sk3Ed_Shell_Bch_30x30_Reflection01 
			Sk3Ed_Shell_Bch_30x30_Surf01 
			Sk3Ed_Shell_Bch_30x30_Planter01 
			Sk3Ed_Shell_Bch_30x30_Sidewalk01 
			Sk3Ed_Shell_Bch_30x30_Barrier01 
			Sk3Ed_Shell_Bch_30x30_Barrier_Reflection01 
			Sk3Ed_Shell_Bch_30x30_StreetLamp_Reflection01 
			Sk3Ed_Shell_Bch_30x30_PalmTree01 
			Sk3Ed_Shell_Bch_30x30_PalmTree02 
			Sk3Ed_Shell_Bch_30x30_PalmTree03 
			Sk3Ed_Shell_Bch_30x30_Plaza01 
			Sk3Ed_Shell_Bch_30x30_LowPalm01 
			Sk3Ed_Shell_Bch_30x30_Storefront01 
			Sk3Ed_Shell_Bch_30x30_HighRise01 
			Sk3Ed_Shell_Bch_30x30_Hotel01 
			Sk3Ed_Shell_Bch_30x30_SandPlaza01 
			Sk3Ed_Shell_Bch_30x30_Volleyball01 
			Sk3Ed_Shell_Bch_30x30_BeachTent01 
			Sk3Ed_Shell_Bch_30x30_Umbrella01 
			Sk3Ed_Shell_Bch_30x30_ShortLamp01 
			Sk3Ed_Shell_Bch_30x30_GarbageCan01 
		] 
		[ 
			Sk3Ed_Shell_Bch_Island01 
			Sk3Ed_Shell_Bch_80x6_ShortWall01 
			Sk3Ed_Shell_Bch_80x6_Sand01 
			Sk3Ed_Shell_Bch_80x6_StreetLamp_High01 
			Sk3Ed_Shell_Bch_80x6_StreetLamp_Low01 
			Sk3Ed_Shell_Bch_80x6_Sidewalk01 
			Sk3Ed_Shell_Bch_80x6_StreetLamp_Reflection01 
			Sk3Ed_Shell_Bch_80x6_Plaza01 
			Sk3Ed_Shell_Bch_80x6_Surf01 
			Sk3Ed_Shell_Bch_80x6_HighRise01 
			Sk3Ed_Shell_Bch_80x6_BeachTent01 
			Sk3Ed_Shell_Bch_80x6_Umbrella01 
			Sk3Ed_Shell_Bch_80x6_ShortLamp01 
			Sk3Ed_Shell_Bch_80x6_SandPlaza01 
			Sk3Ed_Shell_Bch_80x6_Planter01 
			Sk3Ed_Shell_Bch_80x6_PalmTree01 
			Sk3Ed_Shell_Bch_80x6_PalmTree02 
			Sk3Ed_Shell_Bch_80x6_PalmTree03 
			Sk3Ed_Shell_Bch_80x6_PalmTree04 
			Sk3Ed_Shell_Bch_80x6_GarbageCan01 
			Sk3Ed_Shell_Bch_80x6_Hotel01 
			Sk3Ed_Shell_Bch_80x6_LowPalm01 
			Sk3Ed_Shell_Bch_80x6_Storefront01 
			Sk3Ed_Shell_Bch_80x6_Barrier01 
			Sk3Ed_Shell_Bch_80x6_Barrier_Reflection01 
			Sk3Ed_Shell_Bch_80x6_Reflection01 
		] 
	] 
} 
Level_Sk5Ed15 = { 
	ambient_track = "bo_bg" 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed15 
	loading_time = 11 
	scnpre = "sk5ed15_shellscn.pre" 
	sky = "sk5ed15_Sky" 
	outer_shell = "sk5ed15_shell" 
	theme_name = "School" 
	fence_type = Sk4Ed_Fence_20x20_Invisible 
	shell_pieces = [ 
		[ 
			Sk3Ed_Shell_Schl_16x16_Build01 
			Sk3Ed_Shell_Schl_16x16_Build02 
			Sk3Ed_Shell_Schl_16x16_Build03 
			Sk3Ed_Shell_Schl_16x16_Build04 
			Sk3Ed_Shell_Schl_16x16_Facade01 
			Sk3Ed_Shell_Schl_16x16_Facade02 
			Sk3Ed_Shell_Schl_16x16_Facade03 
			Sk3Ed_Shell_Schl_16x16_Facade04 
			Sk3Ed_Shell_Schl_16x16_Fence01 
			Sk3Ed_Shell_Schl_16x16_Fence02 
			Sk3Ed_Shell_Schl_16x16_Fence03 
			Sk3Ed_Shell_Schl_16x16_Fence04 
			Sk3Ed_Shell_Schl_16x16_Perip01 
			Sk3Ed_Shell_Schl_16x16_Perip02 
			Sk3Ed_Shell_Schl_16x16_Perip03 
			Sk3Ed_Shell_Schl_16x16_Perip04 
		] 
		[ 
			Sk3Ed_Shell_Schl_24x24_Build01 
			Sk3Ed_Shell_Schl_24x24_Build02 
			Sk3Ed_Shell_Schl_24x24_Build03 
			Sk3Ed_Shell_Schl_24x24_Build04 
			Sk3Ed_Shell_Schl_24x24_Facade01 
			Sk3Ed_Shell_Schl_24x24_Facade02 
			Sk3Ed_Shell_Schl_24x24_Facade03 
			Sk3Ed_Shell_Schl_24x24_Facade04 
			Sk3Ed_Shell_Schl_24x24_Fence01 
			Sk3Ed_Shell_Schl_24x24_Fence02 
			Sk3Ed_Shell_Schl_24x24_Fence03 
			Sk3Ed_Shell_Schl_24x24_Fence04 
			Sk3Ed_Shell_Schl_24x24_Perip01 
			Sk3Ed_Shell_Schl_24x24_Perip02 
			Sk3Ed_Shell_Schl_24x24_Perip03 
			Sk3Ed_Shell_Schl_24x24_Perip04 
		] 
		[ 
			Sk3Ed_Shell_Schl_30x30_Build01 
			Sk3Ed_Shell_Schl_30x30_Build02 
			Sk3Ed_Shell_Schl_30x30_Build03 
			Sk3Ed_Shell_Schl_30x30_Build04 
			Sk3Ed_Shell_Schl_30x30_Facade01 
			Sk3Ed_Shell_Schl_30x30_Facade02 
			Sk3Ed_Shell_Schl_30x30_Facade03 
			Sk3Ed_Shell_Schl_30x30_Facade04 
			Sk3Ed_Shell_Schl_30x30_Fence01 
			Sk3Ed_Shell_Schl_30x30_Fence02 
			Sk3Ed_Shell_Schl_30x30_Fence03 
			Sk3Ed_Shell_Schl_30x30_Fence04 
			Sk3Ed_Shell_Schl_30x30_Perip01 
			Sk3Ed_Shell_Schl_30x30_Perip02 
			Sk3Ed_Shell_Schl_30x30_Perip03 
			Sk3Ed_Shell_Schl_30x30_Perip04 
		] 
		[ 
			Sk3Ed_Shell_Schl_30x18_Build01 
			Sk3Ed_Shell_Schl_30x18_Build02 
			Sk3Ed_Shell_Schl_30x18_Build03 
			Sk3Ed_Shell_Schl_30x18_Build04 
			Sk3Ed_Shell_Schl_30x18_Facade01 
			Sk3Ed_Shell_Schl_30x18_Facade02 
			Sk3Ed_Shell_Schl_30x18_Facade03 
			Sk3Ed_Shell_Schl_30x18_Facade04 
			Sk3Ed_Shell_Schl_30x18_Fence01 
			Sk3Ed_Shell_Schl_30x18_Fence02 
			Sk3Ed_Shell_Schl_30x18_Fence03 
			Sk3Ed_Shell_Schl_30x18_Fence04 
			Sk3Ed_Shell_Schl_30x18_Perip01 
			Sk3Ed_Shell_Schl_30x18_Perip02 
			Sk3Ed_Shell_Schl_30x18_Perip03 
			Sk3Ed_Shell_Schl_30x18_Perip04 
		] 
		[ 
			Sk3Ed_Shell_Schl_80x6_Build01 
			Sk3Ed_Shell_Schl_80x6_Build02 
			Sk3Ed_Shell_Schl_80x6_Build03 
			Sk3Ed_Shell_Schl_80x6_Build04 
			Sk3Ed_Shell_Schl_80x6_Facade01 
			Sk3Ed_Shell_Schl_80x6_Facade02 
			Sk3Ed_Shell_Schl_80x6_Facade03 
			Sk3Ed_Shell_Schl_80x6_Facade04 
			Sk3Ed_Shell_Schl_80x6_Fence01 
			Sk3Ed_Shell_Schl_80x6_Fence02 
			Sk3Ed_Shell_Schl_80x6_Fence03 
			Sk3Ed_Shell_Schl_80x6_Fence04 
			Sk3Ed_Shell_Schl_80x6_Perip01 
			Sk3Ed_Shell_Schl_80x6_Perip02 
			Sk3Ed_Shell_Schl_80x6_Perip03 
			Sk3Ed_Shell_Schl_80x6_Perip04 
		] 
	] 
} 
Level_Sk5Ed16 = { 
	ambient_track = "tr_bg" 
	Level_sk5ed_defaults 
	DisableBackfacePatch 
	structure_name = Level_Sk5Ed16 
	loading_time = 11 
	scnpre = "sk5ed16_shellscn.pre" 
	outer_shell = "sk5ed16_shell" 
	theme_name = "Indoor" 
	indoor 
	nosun 
	fence_type = Sk4Ed_Fence_20x20_Wallride 
	shell_pieces = [ 
		[ 
			Sk3Ed_Shell_Indr_16X16_ExtFloor01 
			Sk3Ed_Shell_Indr_16x16_Sparks01 
			Sk3Ed_Shell_Indr_16x16_Sparkler01 
			Sk3Ed_Shell_Indr_16x16_Wall01 
			Sk3Ed_Shell_Indr_16x16_Wall02 
			Sk3Ed_Shell_Indr_16x16_Wall03 
			Sk3Ed_Shell_Indr_16x16_Wall04 
			Sk3Ed_Shell_Indr_16x16_Fence01 
			Sk3Ed_Shell_Indr_16x16_Corridor01 
			Sk3Ed_Shell_Indr_16x16_Elevator01 
			Sk3Ed_Shell_Indr_16x16_Lamp01 
			Sk3Ed_Shell_Indr_16x16_Signs01 
		] 
		[ 
			Sk3Ed_Shell_Indr_24X24_ExtFloor01 
			Sk3Ed_Shell_Indr_24x24_Sparks01 
			Sk3Ed_Shell_Indr_24x24_Sparkler01 
			Sk3Ed_Shell_Indr_24x24_Wall01 
			Sk3Ed_Shell_Indr_24x24_Wall02 
			Sk3Ed_Shell_Indr_24x24_Wall03 
			Sk3Ed_Shell_Indr_24x24_Wall04 
			Sk3Ed_Shell_Indr_24x24_Fence01 
			Sk3Ed_Shell_Indr_24x24_Corridor01 
			Sk3Ed_Shell_Indr_24x24_Elevator01 
			Sk3Ed_Shell_Indr_24x24_Sign01 
			Sk3Ed_Shell_Indr_24x24_Lamp01 
		] 
		[ 
			Sk3Ed_Shell_Indr_30X30_ExtFloor01 
			Sk3Ed_Shell_Indr_30x30_Sparks01 
			Sk3Ed_Shell_Indr_30x30_Sparkler01 
			Sk3Ed_Shell_Indr_30x30_Wall01 
			Sk3Ed_Shell_Indr_30x30_Wall02 
			Sk3Ed_Shell_Indr_30x30_Wall03 
			Sk3Ed_Shell_Indr_30x30_Wall04 
			Sk3Ed_Shell_Indr_30x30_Lamp01 
			Sk3Ed_Shell_Indr_30x30_Fence01 
			Sk3Ed_Shell_Indr_30x30_Corridor01 
			Sk3Ed_Shell_Indr_30x30_Elevator01 
			Sk3Ed_Shell_Indr_30x30_Sign01 
		] 
		[ 
			Sk3Ed_Shell_Indr_30X18_ExtFloor01 
			Sk3Ed_Shell_Indr_30x18_Sparks01 
			Sk3Ed_Shell_Indr_30x18_Sparkler01 
			Sk3Ed_Shell_Indr_30x18_Wall01 
			Sk3Ed_Shell_Indr_30x18_Wall02 
			Sk3Ed_Shell_Indr_30x18_Wall03 
			Sk3Ed_Shell_Indr_30x18_Wall04 
			Sk3Ed_Shell_Indr_30x18_Fence01 
			Sk3Ed_Shell_Indr_30x18_Corridor01 
			Sk3Ed_Shell_Indr_30x18_Elevator01 
			Sk3Ed_Shell_Indr_30x18_Sign01 
			Sk3Ed_Shell_Indr_30x18_Lamp01 
		] 
		[ 
			Sk3Ed_Shell_Indr_80X6_ExtFloor01 
			Sk3Ed_Shell_Indr_80x6_Sparks01 
			Sk3Ed_Shell_Indr_80x6_Sparkler01 
			Sk3Ed_Shell_Indr_80x6_Wall01 
			Sk3Ed_Shell_Indr_80x6_Wall02 
			Sk3Ed_Shell_Indr_80x6_Wall03 
			Sk3Ed_Shell_Indr_80x6_Wall04 
			Sk3Ed_Shell_Indr_80x6_Lamp01 
			Sk3Ed_Shell_Indr_80x6_Fence01 
			Sk3Ed_Shell_Indr_80x6_Corridor01 
			Sk3Ed_Shell_Indr_80x6_Elevator01 
			Sk3Ed_Shell_Indr_80x6_Sign01 
		] 
	] 
} 
Level_Sk5Ed17 = { 
	ambient_track = "se_bg" 
	Level_sk5ed_defaults 
	load_shell_collision 
	DisableBackfacePatch 
	structure_name = Level_Sk5Ed17 
	loading_time = 11 
	outer_shell = "sk5ed17_shell" 
	scnpre = "sk5ed17_shellscn.pre" 
	theme_name = "Hell" 
	indoor 
	nosun 
	fence_type = none 
	shell_pieces = [ 
		[ 
			SkProEdHell_Base_16x16 
			JG_Hell_CaveWalls01 
			JG_Hell_Lava01 
			JG_Hell_CaveSmoke01 
			JG_Hell_DevilBody 
			JG_Hell_DevilWings 
			JG_Hell_HeadTop 
			GEO_PreEvent_Rib_Mouth 
			JG_Hell_CaveRocks01 
			JG_Hell_CaveRocks02 
			JG_Hell_CaveRocks03 
			JG_Hell_CaveRocks04 
			JG_Hell_CaveExt01 
			JG_Hell_CaveExt02 
			JG_Hell_LavaStream01 
			JG_Hell_LavaStream02 
			JG_Hell_LavaStream03 
			JG_Hell_LavaStream04 
			JG_Hell_LavaStream05 
			TRGP_SkProEdHell_Killskater01 
		] 
		[ 
			SkProEdHell_Base_24x24 
			JG_Hell_CaveWalls01 
			JG_Hell_Lava01 
			JG_Hell_CaveSmoke01 
			JG_Hell_DevilBody 
			JG_Hell_DevilWings 
			JG_Hell_HeadTop 
			GEO_PreEvent_Rib_Mouth 
			JG_Hell_CaveRocks01 
			JG_Hell_CaveRocks02 
			JG_Hell_CaveRocks03 
			JG_Hell_CaveRocks04 
			JG_Hell_CaveExt01 
			JG_Hell_CaveExt02 
			JG_Hell_LavaStream01 
			JG_Hell_LavaStream02 
			JG_Hell_LavaStream03 
			JG_Hell_LavaStream04 
			JG_Hell_LavaStream05 
			TRGP_SkProEdHell_Killskater01 
		] 
		[ 
			SkProEdHell_Base_30x30 
			JG_Hell_CaveWalls01 
			JG_Hell_Lava01 
			JG_Hell_DevilBody 
			JG_Hell_DevilWings 
			JG_Hell_HeadTop 
			GEO_PreEvent_Rib_Mouth 
			JG_Hell_CaveRocks01 
			JG_Hell_CaveRocks02 
			JG_Hell_CaveRocks03 
			JG_Hell_CaveRocks04 
			JG_Hell_CaveExt01 
			JG_Hell_CaveExt02 
			JG_Hell_LavaStream01 
			JG_Hell_LavaStream02 
			JG_Hell_LavaStream03 
			JG_Hell_LavaStream04 
			JG_Hell_LavaStream05 
			TRGP_SkProEdHell_Killskater01 
		] 
		[ 
			SkProEdHell_Base_30x18 
			JG_Hell_CaveWalls01 
			JG_Hell_Lava01 
			JG_Hell_CaveSmoke01 
			JG_Hell_DevilBody 
			JG_Hell_DevilWings 
			JG_Hell_HeadTop 
			GEO_PreEvent_Rib_Mouth 
			JG_Hell_CaveRocks01 
			JG_Hell_CaveRocks02 
			JG_Hell_CaveRocks03 
			JG_Hell_CaveRocks04 
			JG_Hell_CaveExt01 
			JG_Hell_CaveExt02 
			JG_Hell_LavaStream01 
			JG_Hell_LavaStream02 
			JG_Hell_LavaStream03 
			JG_Hell_LavaStream04 
			JG_Hell_LavaStream05 
			TRGP_SkProEdHell_Killskater01 
		] 
		[ 
			JG_Hell_Lava01 
			TRGP_SkProEdHell_Killskater01 
		] 
	] 
} 
Level_Sk5Ed18 = { 
	ambient_track = "au_bg" 
	Level_sk5ed_defaults 
	load_shell_collision 
	DisableBackfacePatch 
	structure_name = Level_Sk5Ed18 
	loading_time = 11 
	outer_shell = "sk5ed18_shell" 
	scnpre = "sk5ed18_shellscn.pre" 
	theme_name = "Alcatraz" 
	sky = "sk5ed18_Sky" 
	fence_type = none 
	shell_pieces = [ 
		[ 
			SkProEdAlc_Base_16x16 
			TRGP_SkProEdAlc_Killskater01 
		] 
		[ 
			SkProEdAlc_Base_24x24 
			TRGP_SkProEdAlc_Killskater01 
		] 
		[ 
			SkProEdAlc_Base_30x30 
			TRGP_SkProEdAlc_Killskater01 
		] 
		[ 
			SkProEdAlc_Base_30x18 
			TRGP_SkProEdAlc_Killskater01 
		] 
		[ 
			TRGP_SkProEdAlc_Killskater01 
		] 
	] 
} 
