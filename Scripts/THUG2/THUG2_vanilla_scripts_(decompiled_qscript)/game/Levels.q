
UsePreFilesForLevelLoading = 0 
fake_net = 0 
AssertOnMissingScripts = 0 
AssertOnMissingAssets = 1 
AlwaysDump = 0 
next_level_script = nullscript 
ingame_screen_mode = current_screen_mode 
SCRIPT cleanup_before_loading_level 
	printf "*********************** cleanup_before_loading_level" 
	Cleanup 
	StopMusic 
	PauseMusic 
	ClearMusicTrackList 
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

LevelNum_TR = 9 
LevelNum_BO = 1 
LevelNum_BA = 2 
LevelNum_BE = 3 
LevelNum_AU = 4 
LevelNum_NO = 5 
LevelNum_ST = 6 
LevelNum_SE = 7 
LevelNum_SE2 = 8 
LevelNum_SC = 12 
LevelNum_PH = 13 
LevelNum_DJ = 14 
LevelNum_LA = 15 
LevelNum_CA = 16 
LevelNum_AP = 17 
LevelNum_Default = 11 
LevelNum_TestLevel = 21 
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
] 
SCRIPT LoadLevelPreFile 
	IF istrue UsePreFilesForLevelLoading 
		LoadPreFile <...> 
	ENDIF 
ENDSCRIPT

SCRIPT LoadSkaterParts { pre_files = [ 
			"skaterparts.pre" 
			"skaterparts_temp.pre" 
		] 
	} 
	IF gotparam unload 
		printf "Unloading skater parts..." 
	ELSE 
		printf "Loading Skater Parts..." 
	ENDIF 
	GetArraySize <pre_files> 
	index = 0 
	IF IsNgc 
		BEGIN 
			IF gotparam unload 
				printf ( <pre_files> [ <index> ] ) 
				UnloadPreFile ( <pre_files> [ <index> ] ) 
			ELSE 
				printf ( <pre_files> [ <index> ] ) 
				LoadPreFile ( <pre_files> [ <index> ] ) use_bottom_up_heap 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
		IF gotparam unload 
			UnloadPreFile "skaterparts_secret.pre" 
			UnloadPreFile "cagpieces.pre" 
		ELSE 
			LoadPreFile "skaterparts_secret.pre" 
			LoadPreFile "cagpieces.pre" 
		ENDIF 
	ELSE 
		IF NOT istrue cas_artist 
			BEGIN 
				IF gotparam unload 
					printf ( <pre_files> [ <index> ] ) 
					UnloadPreFile ( <pre_files> [ <index> ] ) 
				ELSE 
					printf ( <pre_files> [ <index> ] ) 
					LoadPreFile ( <pre_files> [ <index> ] ) 
				ENDIF 
				index = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT load_level level_number = 0 COIM_size = 1331200 
	TODManager_Reset 
	TODManager_SetTODScript <tod_script> 
	tod_manager_set_default_params 
	IF InNetGame 
		IF NOT IsObserving 
			ExitSurveyorMode 
		ENDIF 
	ENDIF 
	change freemem_script_lowest = 999999999 
	change freemem_main_lowest = 999999999 
	do_unload_unloadable 
	IF NOT InNetGame 
		IF NOT gotparam park_editor 
			do_load_permanent 
		ENDIF 
	ENDIF 
	SetLevelStructureName name = <structure_name> 
	load_level_handle_ambient_sfx ambient_track = <ambient_track> 
	kill_start_key_binding 
	printf "replace_handlers to take away start key in load_level" 
	SetScoreAccumulation 0 
	SetScoreDegradation 0 
	IF ObjectExists id = skater 
		IF skater : IsLocalSkater 
			skater : MotoSkateboardOff 
		ENDIF 
	ENDIF 
	IF InSplitScreenGame 
		UnSetGlobalFlag flag = CHEAT_DISCO 
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
	IF gotparam sky 
		LoadScene scene = <sky> 
	ENDIF 
	IF gotparam park_editor 
		LoadScene scene = <level> is_dictionary 
		IF gotparam outer_shell 
			ParkEdMemSnapshot start_outer_shell 
			LoadScene scene = <outer_shell> no_supersectors 
			ParkEdMemSnapshot end_outer_shell 
		ENDIF 
	ELSE 
		IF gotparam level 
			IF InNetGame 
				LoadScene scene = <level> is_net 
			ELSE 
				LoadScene scene = <level> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam level_name 
		SetLevelName <level_name> 
	ELSE 
		SetLevelName <level> 
	ENDIF 
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
	IF ( IsNgc ) 
		IF NOT InMultiPlayerGame 
			IF gotparam pedpre 
				LoadPreFile <pedpre> dont_assert 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT IsPS2 
		IF gotparam pre 
			LoadLevelPreFile <pre> 
		ENDIF 
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
				AddGoalEditorNodesToLevelNodeArray 
			ENDIF 
		ENDIF 
	ENDIF 
	IF IsPS2 
		IF gotparam pre 
			LoadLevelPreFile <pre> 
		ENDIF 
	ENDIF 
	IF gotparam park_editor 
	ELSE 
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
	PopMemProfile 
	IF gotparam qb 
		preselect_random_parts <...> 
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
		IF gotparam default_stats 
			IF ( level_stats = 1 ) 
				SetAllStats value = <default_stats> 
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
	IF gotparam park_editor 
	ELSE 
		IF IsNgc 
			IF ( <level_number> = LevelNum_Skateshop ) 
			ELSE 
				IF gotparam startup_script 
					<startup_script> 
				ENDIF 
			ENDIF 
		ELSE 
			IF gotparam startup_script 
				<startup_script> 
			ENDIF 
		ENDIF 
	ENDIF 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = loading_sounds_script "%i_LoadingSounds" i = <level_prefix> 
	IF ScriptExists <loading_sounds_script> 
		<loading_sounds_script> 
	ENDIF 
	IF NOT IsNgc 
		IF gotparam pre 
			UnloadPreFile <pre> dont_assert 
		ENDIF 
	ENDIF 
	IF NOT ( IsNgc ) 
		IF NOT InMultiPlayerGame 
			IF gotparam pedpre 
				LoadPreFile <pedpre> dont_assert 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT InMultiPlayerGame 
		IF gotparam qb 
			IF NOT gotparam frontend_level 
				IF gotparam park_editor 
					PreloadPedestrians no_random 
				ELSE 
					PreloadPedestrians 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT InNetGame 
		IF InMultiPlayerGame 
			PreloadModel name = "crown" 
		ENDIF 
	ENDIF 
	menu3d_load_assets structure_name = <structure_name> 
	IF NOT ( IsNgc ) 
		IF NOT InMultiPlayerGame 
			IF gotparam pedpre 
				UnloadPreFile <pedpre> dont_assert 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <level_number> = LevelNum_Skateshop ) 
		LoadPreFile "mainmenusprites.pre" 
		load_mainmenu_textures_to_main_memory no_pre_file 
		load_cas_textures_to_main_memory no_pre_file 
		UnloadPreFile "mainmenusprites.pre" 
	ENDIF 
	IF gotparam park_editor 
	ELSE 
		IF IsNgc 
			IF gotparam startup_script 
				IF ( <level_number> = LevelNum_Skateshop ) 
					<startup_script> 
				ENDIF 
				IF ( <level_number> = LevelNum_boardshop ) 
					<startup_script> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	PushMemProfile "Level Collision decompressed PIP + Supersectors" 
	IF istrue UsePreFilesForLevelLoading 
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
	IF InNetGame 
		IF gotparam park_editor 
			LoadCollision scene = <level> 
		ELSE 
			LoadCollision scene = <level> is_net 
		ENDIF 
	ELSE 
		LoadCollision scene = <level> 
	ENDIF 
	IF gotparam park_editor 
		IF gotparam outer_shell 
			IF istrue UsePreFilesForLevelLoading 
				<extension> = "col.pre" 
				LoadPipPre ( <outer_shell> + <extension> ) heap = bottomupheap 
			ENDIF 
			LoadCollision scene = <outer_shell> 
		ENDIF 
	ENDIF 
	PopMemProfile 
	change ParseNodeArrayIgnoreGaps = 0 
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
	IF gotparam sun_theta 
		<morning_params> = { ( tod_manager_default_morning ) sun_theta = ( <sun_theta> [ 0 ] ) } 
		<afternoon_params> = { ( tod_manager_default_afternoon ) sun_theta = ( <sun_theta> [ 1 ] ) } 
		<evening_params> = { ( tod_manager_default_evening ) sun_theta = ( <sun_theta> [ 2 ] ) } 
		<night_params> = { ( tod_manager_default_night ) sun_theta = ( <sun_theta> [ 3 ] ) } 
		TODManager_SetParams { 
			system = 1 
			current_state = afternoon 
			transition_length = 90000 
			groups = [ 
				{ parts = 6 wait_frames = 3 light_group = outdoor } 
				{ parts = 2 wait_frames = 3 light_group = nolevellights reset_light_group = indoor } 
			] 
			morning = <morning_params> 
			afternoon = <afternoon_params> 
			evening = <evening_params> 
			night = <night_params> 
		} 
		<morning_params> = { ( tod_manager_default_morning_sky ) sun_theta = ( <sun_theta> [ 0 ] ) } 
		<afternoon_params> = { ( tod_manager_default_afternoon_sky ) sun_theta = ( <sun_theta> [ 1 ] ) } 
		<evening_params> = { ( tod_manager_default_evening_sky ) sun_theta = ( <sun_theta> [ 2 ] ) } 
		<night_params> = { ( tod_manager_default_night_sky ) sun_theta = ( <sun_theta> [ 3 ] ) } 
		TODManager_SetParams { 
			system = 2 
			sky 
			current_state = afternoon 
			transition_length = 90000 
			groups = [ 
				{ parts = 6 wait_frames = 3 light_group = outdoor } 
				{ parts = 2 wait_frames = 3 light_group = nolevellights reset_light_group = indoor } 
			] 
			morning = <morning_params> 
			afternoon = <afternoon_params> 
			evening = <evening_params> 
			night = <night_params> 
		} 
	ENDIF 
	IF gotparam setup_script 
		PushMemProfile "Setup Script" 
		<setup_script> 
		PopMemProfile 
	ENDIF 
	<TOD_off> = 0 
	IF gotparam frontend_level 
		<TOD_off> = 1 
	ENDIF 
	IF ( tod_manager_inactive = 1 ) 
		<TOD_off> = 1 
	ENDIF 
	IF ( ( gotparam park_editor ) | ( <TOD_off> = 1 ) ) 
		TODManager_SetActive 0 
	ELSE 
		TODManager_SetActive 1 
	ENDIF 
	IF istrue GameInformerBuild 
		TODManager_SetActive 0 
	ENDIF 
	IF gotparam tod_manager_active 
		IF ( <tod_manager_active> = 0 ) 
			TODManager_SetActive 0 
		ENDIF 
	ENDIF 
	IF gotparam frontend_level 
		TODManager_SetTODInstant afternoon 
	ELSE 
		IF NOT gotparam tod_state 
			<tod_state> = afternoon 
		ENDIF 
		TODManager_SetTODInstant <tod_state> 
	ENDIF 
	IF gotparam uber_frig_height 
		change uber_frig_current_height = <uber_frig_height> 
	ELSE 
		change uber_frig_current_height = uber_frig_default_height 
	ENDIF 
	IF GameModeEquals is_career 
		<do_teammate_pro> = 1 
		IF gotparam skip_teammate_pro 
			<do_teammate_pro> = 0 
		ENDIF 
		IF ( <do_teammate_pro> = 1 ) 
			MemPushContext bottomupheap 
			PushMemProfile "Teammate Pro Heap" 
			IF IsNgc 
				MemInitHeap name = "TeammatePro" size = 195000 
			ELSE 
				MemInitHeap name = "TeammatePro" size = 250000 
			ENDIF 
			PopMemProfile 
			MemPopContext 
			change skater_swapping_teammate_name = none 
		ENDIF 
	ENDIF 
	setup_classic_stat_nodes level = <level> level_num = <level_num> 
	SFX_refresh_music_box_triggers 
	PushMemProfile "Permanent & semi-permanent anims" 
	IF NOT gotparam park_editor 
		IF NOT gotparam frontend_level 
			do_load_unloadable 
		ENDIF 
	ENDIF 
	PopMemProfile 
	<is_frontend> = 0 
	IF gotparam frontend_level 
		<is_frontend> = <frontend_level> 
	ENDIF 
	IF ( <is_frontend> = 1 ) 
		MemPushContext bottomupheap 
		load_multiplayer_textures_to_main_memory 
		MemPopContext 
	ENDIF 
	IF NOT IsNgc 
		IF gotparam frontend_level 
			IF ( <frontend_level> = 1 ) 
				LoadSkaterParts 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InSplitScreenGame 
		AllocateSplitScreenDMA 
	ENDIF 
	IF gotparam frontend_level 
		IF ( current_screen_mode = standard_screen_mode ) 
			change ingame_screen_mode = standard_screen_mode 
		ELSE 
			change ingame_screen_mode = ( current_screen_mode ) 
			screen_setup_standard 
		ENDIF 
	ELSE 
		IF NOT ( ingame_screen_mode = ( current_screen_mode ) ) 
			SWITCH ( ingame_screen_mode ) 
				CASE standard_screeen_mode 
					screen_setup_standard 
				CASE widescreen_screen_mode 
					screen_setup_widescreen 
				CASE letterbox_screen_mode 
					screen_setup_letterbox 
			ENDSWITCH 
		ENDIF 
	ENDIF 
	UnPauseGame 
	IF gotparam viewer_mode 
		gameflow StandardGameFlowToggleView 
		printf "****************************************** CHANGING ASSERT = 0" 
		change AssertOnMissingScripts = 0 
		change AssertOnMissingAssets = 0 
	ELSE 
		printf "****************************************** CHANGING ASSERT = 1" 
		change AssertOnMissingScripts = 1 
		change AssertOnMissingAssets = 1 
		gameflow StandardGameFlow 
	ENDIF 
	IF IsNgc 
		IF gotparam pre 
			UnloadPreFile <pre> dont_assert 
		ENDIF 
		IF NOT InMultiPlayerGame 
			IF gotparam pedpre 
				UnloadPreFile <pedpre> dont_assert 
			ENDIF 
		ENDIF 
		IF gotparam frontend_level 
			IF ( <frontend_level> = 1 ) 
				LoadSkaterParts 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT reset_level 
	ResetLevelFlags 
	GetLevelStructureName 
	IF StructureContains structure = ( <level_structure_name> ) setup_script 
		( <level_structure_name> . setup_script ) 
	ENDIF 
	setup_classic_stat_nodes level = ( <level_structure_name> . level ) level_num = ( <level_structure_name> . level_num ) 
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
	IF InNetGame 
		UnSetFlag flag = FLAG_PROSET1_GEO_ON 
		UnSetFlag flag = FLAG_PROSET2_GEO_ON 
		UnSetFlag flag = FLAG_PROSET3_GEO_ON 
		UnSetFlag flag = FLAG_PROSET4_GEO_ON 
		UnSetFlag flag = FLAG_PROSET5_GEO_ON 
		UnSetFlag flag = FLAG_PROSET6_GEO_ON 
		UnSetFlag flag = FLAG_PROSET7_GEO_ON 
	ELSE 
	ENDIF 
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
			printf "Cleaning up level-specific assets for skater %d" d = <objID> 
			IF <objID> : IsLocalSkater 
				<objID> : kill_all_vehicles 
				<objID> : SetAmmo 0 
				<objID> : ClearPagerMessages 
			ENDIF 
		ENDIF 
		<skaterNum> = ( <skaterNum> + 1 ) 
	REPEAT 8 
	IF CompositeObjectExists name = TRG_Ped_TeammatePro 
		TRG_Ped_TeammatePro : Obj_ClearGeoms 
	ENDIF 
	undo_fake_nigel 
	SFX_Change_Footstep_Sounds_To_Default 
	menu3d_unload_assets 
	MemDeleteHeap name = "TeammatePro" 
	load_multiplayer_textures_to_main_memory unload dont_assert 
	UnloadPreFile "skaterparts.pre" dont_assert 
	UnloadPreFile "skaterparts_temp.pre" dont_assert 
	IF IsNgc 
		UnloadPreFile "skaterparts_secret.pre" dont_assert 
		UnloadPreFile "cagpieces.pre" dont_assert 
	ENDIF 
ENDSCRIPT

SCRIPT Load_Default 
	load_level Level_Default 
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
	load_level Level_TestLevel 
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

Level_Default = { 
	structure_name = Level_Default 
	load_script = Load_Default 
	name = "Default" 
	loading_screen = "loadscrn_generic" 
	loading_time = 9.50000000000 
	level = "Default" 
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
	loading_screen = "loadscrn_generic" 
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
	structure_name = Level_TR 
	load_script = Load_TR 
	name = "Training" 
	ambient_track = "music\\vag\\backgrounds\\tr_bg" 
	loading_screen = "loadscrn_training" 
	loading_time = 9.35000038147 
	tod_manager_active = 0 
	COIM_size = 614400 
	pre = "TR_scripts.pre" 
	scnpre = "TRscn.pre" 
	level = "TR" 
	sky = "TR_Sky" 
	qb = "levels\\TR\\TR.qb" 
	colpre = "TRcol.pre" 
	pedpre = "TRped.pre" 
	level_qb = "levels\\TR\\TR_scripts.qb" 
	level_sfx_qb = "levels\\TR\\TR_sfx.qb" 
	menu3d_name = "menu3d\\tr_menu3d\\tr_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/TR_icon_1" 
		"PanelSprites/Menu3d/TR_icon_2" 
	] 
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
} 
Level_BO = { 
	structure_name = Level_BO 
	load_script = Load_BO 
	name = "Boston" 
	ambient_track = "music\\vag\\backgrounds\\bo_bg" 
	loading_screen = "loadscrn_boston" 
	loading_time = 12.39999961853 
	tod_manager_active = 1 
	COIM_size = 768000 
	pre = "BO_scripts.pre" 
	scnpre = "BOscn.pre" 
	level = "BO" 
	sky = "BO_Sky" 
	qb = "levels\\BO\\BO.qb" 
	colpre = "BOcol.pre" 
	pedpre = "BOped.pre" 
	level_qb = "levels\\BO\\BO_scripts.qb" 
	level_sfx_qb = "levels\\BO\\BO_sfx.qb" 
	menu3d_name = "menu3d\\bo_menu3d\\bo_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/BO_icon_1" 
		"PanelSprites/Menu3d/BO_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\BO\\BO_cutscene_particle_data.qb" 
		"levels\\BO\\BO_level_particle_data.qb" 
		"levels\\BO\\BO_cutscene_fast_particle_data.qb" 
		"levels\\BO\\BO_level_fast_particle_data.qb" 
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
} 
Level_BA = { 
	structure_name = Level_BA 
	load_script = Load_BA 
	name = "Barcelona" 
	ambient_track = "music\\vag\\backgrounds\\ba_bg" 
	loading_screen = "loadscrn_barcelona" 
	loading_time = 13.39000034332 
	COIM_size = 1536000 
	tod_manager_active = 1 
	pre = "BA_scripts.pre" 
	scnpre = "BAscn.pre" 
	level = "BA" 
	sky = "BA_Sky" 
	qb = "levels\\BA\\BA.qb" 
	colpre = "BAcol.pre" 
	pedpre = "BAped.pre" 
	level_qb = "levels\\BA\\BA_scripts.qb" 
	level_sfx_qb = "levels\\BA\\BA_sfx.qb" 
	menu3d_name = "menu3d\\ba_menu3d\\ba_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/BA_icon_1" 
		"PanelSprites/Menu3d/BA_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\BA\\BA_cutscene_particle_data.qb" 
		"levels\\BA\\BA_level_particle_data.qb" 
		"levels\\BA\\BA_cutscene_fast_particle_data.qb" 
		"levels\\BA\\BA_level_fast_particle_data.qb" 
	] 
	startup_script = BA_Startup 
	goals_script = BA_goals 
	setup_script = BA_setup 
	tod_script = BA_TOD 
	default_stats = 7 
	default_stats_classic = 3 
	level_number = LevelNum_BA 
	special_ped_info = [ 
		{ type = pro flag = PRO_FOUND_02 } 
		{ name = bullfighter type = guest } 
		{ name = mechbullrider type = flavor } 
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
} 
Level_BE = { 
	structure_name = Level_BE 
	load_script = Load_BE 
	name = "Berlin" 
	ambient_track = "music\\vag\\backgrounds\\be_bg" 
	loading_screen = "loadscrn_berlin" 
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
	menu3d_name = "menu3d\\be_menu3d\\be_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/BE_icon_1" 
		"PanelSprites/Menu3d/BE_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\BE\\BE_cutscene_particle_data.qb" 
		"levels\\BE\\BE_level_particle_data.qb" 
		"levels\\BE\\BE_cutscene_fast_particle_data.qb" 
		"levels\\BE\\BE_level_fast_particle_data.qb" 
	] 
	startup_script = BE_Startup 
	goals_script = BE_goals 
	setup_script = BE_setup 
	default_stats = 8 
	default_stats_classic = 5 
	level_number = LevelNum_BE 
	skip_teammate_pro 
	special_ped_info = [ 
		{ type = pro flag = PRO_FOUND_03 } 
		{ name = graffititagger type = guest } 
		{ name = paulie type = flavor } 
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
} 
Level_AU = { 
	structure_name = Level_AU 
	load_script = Load_AU 
	name = "Australia" 
	ambient_track = "music\\vag\\backgrounds\\au_bg" 
	loading_screen = "loadscrn_australia" 
	loading_time = 12.27999973297 
	tod_manager_active = 1 
	pre = "AU_scripts.pre" 
	scnpre = "AUscn.pre" 
	level = "AU" 
	sky = "AU_Sky" 
	qb = "levels\\AU\\AU.qb" 
	colpre = "AUcol.pre" 
	pedpre = "AUped.pre" 
	level_qb = "levels\\AU\\AU_scripts.qb" 
	level_sfx_qb = "levels\\AU\\AU_sfx.qb" 
	menu3d_name = "menu3d\\au_menu3d\\au_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/AU_icon_1" 
		"PanelSprites/Menu3d/AU_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\AU\\AU_cutscene_particle_data.qb" 
		"levels\\AU\\AU_level_particle_data.qb" 
		"levels\\AU\\AU_cutscene_fast_particle_data.qb" 
		"levels\\AU\\AU_level_fast_particle_data.qb" 
	] 
	startup_script = AU_Startup 
	goals_script = AU_goals 
	setup_script = AU_setup 
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
} 
Level_NO = { 
	structure_name = Level_NO 
	load_script = Load_NO 
	name = "New Orleans" 
	ambient_track = "music\\vag\\backgrounds\\no_bg" 
	loading_screen = "loadscrn_new_orleans" 
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
	menu3d_name = "menu3d\\no_menu3d\\no_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/NO_icon_1" 
		"PanelSprites/Menu3d/NO_icon_2" 
	] 
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
	tod_state = night 
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
} 
Level_TestLevel = { 
	structure_name = Level_TestLevel 
	load_script = Load_TestLevel 
	name = "TestLevel" 
	loading_screen = "loadscrn_generic" 
	loading_time = 9.50000000000 
	COIM_size = 1331200 
	pre = "TestLevel_scripts.pre" 
	scnpre = "TestLevelscn.pre" 
	level = "TestLevel" 
	sky = "TestLevel_Sky" 
	qb = "levels\\TestLevel\\TestLevel.qb" 
	colpre = "TestLevelcol.pre" 
	pedpre = "TestLevelped.pre" 
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
	structure_name = Level_ST 
	load_script = Load_ST 
	name = "Skatopia" 
	ambient_track = "music\\vag\\backgrounds\\st_bg" 
	loading_screen = "loadscrn_skatopia" 
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
	menu3d_name = "menu3d\\st_menu3d\\st_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/SK_icon_1" 
		"PanelSprites/Menu3d/SK_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\ST\\ST_cutscene_particle_data.qb" 
		"levels\\ST\\ST_level_particle_data.qb" 
		"levels\\ST\\ST_cutscene_fast_particle_data.qb" 
		"levels\\ST\\ST_level_fast_particle_data.qb" 
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
} 
Level_SE = { 
	structure_name = Level_SE 
	load_script = Load_SE 
	name = "Pro Skater" 
	ambient_track = [ "music\\vag\\backgrounds\\se_bg" 
		"music\\vag\\backgrounds\\se_bg2" 
		"music\\vag\\backgrounds\\se_bg3" 
	] 
	loading_screen = "loadscrn_secret_1" 
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
	menu3d_name = "menu3d\\se_menu3d\\se_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/SE_icon_1" 
	] 
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
} 
Level_SE2 = { 
	structure_name = Level_SE2 
	load_script = Load_SE2 
	name = "The Triangle" 
	ambient_track = "music\\vag\\backgrounds\\se2_bg" 
	loading_screen = "loadscrn_secret_2" 
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
	menu3d_name = "menu3d\\se2_menu3d\\se2_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/SE2_icon_1" 
		"PanelSprites/Menu3d/SE2_icon_2" 
	] 
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
} 
SCRIPT Load_Mainmenu 
	load_level level_Mainmenu 
ENDSCRIPT

level_Mainmenu = { 
	structure_name = level_Mainmenu 
	load_script = Load_Mainmenu 
	name = "Main Menu" 
	loading_screen = "loadscrn_generic" 
	loading_time = 6.75000000000 
	COIM_size = 10240 
	loading_time_xbox = 11.00000000000 
	level_name = "mainmenu" 
	pre = "mainmenu_scripts.pre" 
	scnpre = "mainmenuscn.pre" 
	level = "mainmenu" 
	qb = "levels\\mainmenu\\mainmenu.qb" 
	colpre = "mainmenucol.pre" 
	level_qb = "levels\\mainmenu\\mainmenu_scripts.qb" 
	more_level_qbs = [ 
		"levels\\mainmenu\\mainmenu_options.qb" 
		"levels\\mainmenu\\mainmenu_net.qb" 
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
Level_LA = { 
	structure_name = Level_LA 
	load_script = Load_LA 
	name = "Los Angeles" 
	ambient_track = "music\\vag\\backgrounds\\la_bg" 
	loading_screen = "loadscrn_los_angeles" 
	loading_time = 8.67000007629 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "LA_scripts.pre" 
	scnpre = "LAscn.pre" 
	level = "LA" 
	sky = "LA_Sky" 
	qb = "levels\\LA\\LA.qb" 
	colpre = "LAcol.pre" 
	pedpre = "LAped.pre" 
	level_qb = "levels\\LA\\LA_scripts.qb" 
	level_sfx_qb = "levels\\LA\\LA_sfx.qb" 
	menu3d_name = "menu3d\\la_menu3d\\la_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/LA_icon_1" 
		"PanelSprites/Menu3d/LA_icon_2" 
	] 
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
} 
Level_SC = { 
	structure_name = Level_SC 
	load_script = Load_SC 
	name = "School 1" 
	ambient_track = "music\\vag\\backgrounds\\sc_bg" 
	loading_screen = "loadscrn_school" 
	loading_time = 6.15000009537 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "SC_scripts.pre" 
	scnpre = "SCscn.pre" 
	level = "SC" 
	sky = "SC_Sky" 
	qb = "levels\\SC\\SC.qb" 
	colpre = "SCcol.pre" 
	pedpre = "SCped.pre" 
	level_qb = "levels\\SC\\SC_scripts.qb" 
	level_sfx_qb = "levels\\SC\\SC_sfx.qb" 
	menu3d_name = "menu3d\\sc_menu3d\\sc_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/SC_icon_1" 
		"PanelSprites/Menu3d/SC_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\SC\\SC_cutscene_particle_data.qb" 
		"levels\\SC\\SC_level_particle_data.qb" 
		"levels\\SC\\SC_cutscene_fast_particle_data.qb" 
		"levels\\SC\\SC_level_fast_particle_data.qb" 
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
} 
Level_PH = { 
	structure_name = Level_PH 
	load_script = Load_PH 
	name = "Philly" 
	ambient_track = "music\\vag\\backgrounds\\ph_bg" 
	loading_screen = "loadscrn_philly" 
	loading_time = 7.11999988556 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "PH_scripts.pre" 
	scnpre = "PHscn.pre" 
	level = "PH" 
	sky = "PH_Sky" 
	qb = "levels\\PH\\PH.qb" 
	colpre = "PHcol.pre" 
	pedpre = "PHped.pre" 
	level_qb = "levels\\PH\\PH_scripts.qb" 
	level_sfx_qb = "levels\\PH\\PH_sfx.qb" 
	menu3d_name = "menu3d\\PH_menu3d\\PH_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/PH_icon_1" 
		"PanelSprites/Menu3d/PH_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\PH\\PH_cutscene_particle_data.qb" 
		"levels\\PH\\PH_level_particle_data.qb" 
		"levels\\PH\\PH_cutscene_fast_particle_data.qb" 
		"levels\\PH\\PH_level_fast_particle_data.qb" 
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
} 
Level_DJ = { 
	structure_name = Level_DJ 
	load_script = Load_DJ 
	name = "Downhill Jam" 
	ambient_track = "music\\vag\\backgrounds\\dj_bg" 
	loading_screen = "loadscrn_downhill" 
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
	menu3d_name = "menu3d\\DJ_menu3d\\DJ_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/DJ_icon_1" 
		"PanelSprites/Menu3d/DJ_icon_2" 
	] 
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
} 
Level_CA = { 
	structure_name = Level_CA 
	load_script = Load_CA 
	name = "Canada" 
	ambient_track = "music\\vag\\backgrounds\\ca_bg" 
	loading_screen = "loadscrn_canada" 
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
	level_qb = "levels\\CA\\CA_scripts.qb" 
	level_sfx_qb = "levels\\CA\\CA_sfx.qb" 
	menu3d_name = "menu3d\\CA_menu3d\\CA_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/CA_icon_1" 
		"PanelSprites/Menu3d/CA_icon_2" 
	] 
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
} 
Level_AP = { 
	structure_name = Level_AP 
	load_script = Load_AP 
	name = "Airport" 
	ambient_track = "music\\vag\\backgrounds\\ap_bg" 
	loading_screen = "loadscrn_airport" 
	loading_time = 7.82999992371 
	COIM_size = 1331200 
	tod_manager_active = 0 
	pre = "AP_scripts.pre" 
	scnpre = "APscn.pre" 
	level = "AP" 
	sky = "AP_Sky" 
	qb = "levels\\AP\\AP.qb" 
	colpre = "APcol.pre" 
	pedpre = "APped.pre" 
	level_qb = "levels\\AP\\AP_scripts.qb" 
	level_sfx_qb = "levels\\AP\\AP_sfx.qb" 
	menu3d_name = "menu3d\\AP_menu3d\\AP_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/AP_icon_1" 
		"PanelSprites/Menu3d/AP_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\AP\\AP_cutscene_particle_data.qb" 
		"levels\\AP\\AP_level_particle_data.qb" 
		"levels\\AP\\AP_cutscene_fast_particle_data.qb" 
		"levels\\AP\\AP_level_fast_particle_data.qb" 
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
		load_level <structure_name> loading_screen = "loadscrn_editor_x" 
	ENDIF 
	IF IsNgc 
		load_level <structure_name> loading_screen = "loadscrn_editor_ngc" 
	ENDIF 
	IF IsPS2 
		load_level <structure_name> loading_screen = "loadscrn_editor" 
	ENDIF 
ENDSCRIPT

SCRIPT Load_Sk5Ed_gameplay 
	GetEditorTheme 
	IF ( <theme> > 0 ) 
		FormatText ChecksumName = structure_name "Level_sk5ed%d" d = ( <theme> + 1 ) 
	ELSE 
		structure_name = Level_Sk5Ed 
	ENDIF 
	load_level <structure_name> startup_script = Sk5Ed_Startup_gameplay loading_screen = "loadscrn_created" 
ENDSCRIPT

Level_sk5ed_defaults = 
{ 
	park_editor 
	load_script = Load_Sk5Ed 
	name = "Created Park" 
	loading_screen = "loadscrn_editor_play" 
	loading_time = 6.80999994278 
	loading_time_xbox = 9 
	startup_script = Sk5Ed_Startup 
	goals_script = Sk5Ed_goals 
	default_stats = 10 
	default_stats_classic = 10 
	level_number = LevelNum_Sk5ed 
	pre = "sk5ed_scripts.pre" 
	level = "sk5ed" 
	level_name = "sk5ed" 
	colpre = "sk5edcol.pre" 
	pedpre = "sk5edped.pre" 
	level_qb = "levels\\sk5ed\\sk5ed_scripts.qb" 
	qb = "levels\\sk5ed\\sk5ed.qb" 
	menu3d_name = "menu3d\\SK5ED_menu3d\\SK5ED_menu3d.mdl" 
	menu3d_sprites = [ 
		"PanelSprites/Menu3d/SK5ED_icon_1" 
		"PanelSprites/Menu3d/SK5ED_icon_2" 
	] 
	more_level_qbs = [ 
		"levels\\sk5ed\\ParkEd_node_scripts.qb" 
		"levels\\sk5ed\\ParkEd_fast_particle_data.qb" 
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
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed 
	loading_time = 7.11000013351 
	loading_time_xbox = 9 
	scnpre = "sk5ed_shellscn.pre" 
	sky = "sk5ed_Sky" 
	outer_shell = "sk5ed_shell" 
	theme_name = "Antarctica" 
} 
Level_Sk5Ed2 = { 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed2 
	loading_time = 7.38000011444 
	scnpre = "sk5ed2_shellscn.pre" 
	sky = "sk5ed2_Sky" 
	outer_shell = "sk5ed2_shell" 
	theme_name = "Mars" 
} 
Level_Sk5Ed3 = { 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed3 
	loading_time = 7.11999988556 
	scnpre = "sk5ed3_shellscn.pre" 
	sky = "sk5ed3_Sky" 
	outer_shell = "sk5ed3_shell" 
	theme_name = "Cemetary" 
} 
Level_Sk5Ed4 = { 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed4 
	loading_time = 7.15000009537 
	scnpre = "sk5ed4_shellscn.pre" 
	sky = "sk5ed4_Sky" 
	outer_shell = "sk5ed4_shell" 
	theme_name = "Race Car" 
} 
Level_Sk5Ed5 = { 
	Level_sk5ed_defaults 
	structure_name = Level_Sk5Ed5 
	loading_time = 7.59000015259 
	scnpre = "sk5ed5_shellscn.pre" 
	sky = "sk5ed5_Sky" 
	outer_shell = "sk5ed5_shell" 
	theme_name = "Swamp" 
} 

