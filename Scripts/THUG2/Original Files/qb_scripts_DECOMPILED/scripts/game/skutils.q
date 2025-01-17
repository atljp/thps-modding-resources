
ParseNodeArrayIgnoreGaps = 0 
block_proxim_node_updates = 0 
check_for_unplugged_controllers = 0 
TimeOfDayDebug = 0 
main_menu_ok_to_go = 0 
DebugPausedObjects = 0 
DebugPausedObjectsComponentToCheck = animblender 
scripts_to_kill_when_changing_levels = [ 
	SK3_KillSkater 
	SK3_KillSkater_Finish 
	SK3_KillSkater_Finish3 
	SK3_KillSkater_Water 
	SK3_KillSkater_Pungee 
	BA_Goal_Catapult720_EnterGrab 
	BA_Goal_Catapult720_Counter 
	BA_Goal_Catapult720_SpinChecker 
] 
SCRIPT PrintState 
	IF InAir 
		
	ENDIF 
	IF OnGround 
		
	ENDIF 
	IF OnWall 
		
	ENDIF 
	IF OnLip 
		
	ENDIF 
	IF OnRail 
		
	ENDIF 
ENDSCRIPT

SCRIPT DefaultGapScript 
	IF IsSoundPlaying MainGapSound 
		StopSound MainGapSound 
	ENDIF 
	PlaySound HUD_jumpgap id = MainGapSound 
	IF Skating 
		IF OnGround 
			LandGapsImmediately = 1 
		ENDIF 
	ELSE 
		IF Walking 
			LandGapsImmediately = 1 
		ELSE 
			IF Driving 
				LandGapsImmediately = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam LandGapsImmediately 
		GetNumberOfNonGapTricks 
		IF ( <NumberOfNonGapTricks> = 0 ) 
			LandSkaterTricks 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SetAllStats value = 3 
	IF ( <value> = 0 ) 
		
	ELSE 
		
	ENDIF 
	SetStatOverride <value> 
ENDSCRIPT

SCRIPT ToggleMinMetrics 
	ToggleMetricItem item = METRIC_TIME 
	ToggleMetricItem item = METRIC_TOTALPOLYS 
	ToggleMetricItem item = METRIC_VERTS 
	ToggleMetricItem item = METRIC_RESOURCEALLOCS 
	ToggleMetricItem item = METRIC_TEXTUREUPLOADS 
	ToggleMetricItem item = METRIC_VU1 
	ToggleMetricItem item = METRIC_DMA1 
	ToggleMetricItem item = METRIC_DMA2 
	ToggleMetricItem item = METRIC_IHANDLERTIME 
	ToggleMetricItem item = METRIC_SKYCACHE 
	ToggleMetricItem item = METRIC_VIDEOMODE 
	ToggleMetricItem item = METRIC_MEMFREE 
	ToggleMetricItem item = METRIC_REGIONINFO 
ENDSCRIPT

SCRIPT WaitOneGameFrame 
	Wait 1 gameframes 
ENDSCRIPT

SCRIPT WaitAnimWhilstChecking 
	BEGIN 
		DoNextTrick 
		IF GotParam AndManuals 
			DoNextManualTrick 
		ENDIF 
		IF AnimFinished 
			BREAK 
		ENDIF 
		Wait 1 GameFrame 
	REPEAT 
ENDSCRIPT

SCRIPT WaitAnimFinished 
	
	Obj_WaitAnimFinished 
ENDSCRIPT

SCRIPT WaitWhilstChecking 
	GetStartTime 
	BEGIN 
		DoNextTrick 
		IF GotParam AndManuals 
			DoNextManualTrick 
		ENDIF 
		Wait 1 GameFrame 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > <Duration> ) 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT Reverse 
	PlayAnim Anim = Current From = Current To = 0 
ENDSCRIPT

main_menu_jump_to_cas = 0 
SCRIPT CheckForInvalidLevels 
	change main_menu_jump_to_cas = 0 
	IF ( <level> = load_cas ) 
		change main_menu_jump_to_cas = 1 
		level = Load_MainMenu 
	ENDIF 
	IF ( <level> = load_skateshop ) 
		
		<level> = Load_MainMenu 
	ENDIF 
	RETURN level = <level> 
ENDSCRIPT

SCRIPT autolaunch 
	IF NOT CD 
		change entered_from_autolaunch = 1 
	ENDIF 
	IF GotParam game 
		SetGameType <game> 
	ELSE 
		SetGameType career 
	ENDIF 
	SetCurrentGameType 
	IF GameModeEquals is_career 
		SetChapterOnLevel level = <level> 
	ENDIF 
	CheckForInvalidLevels level = <level> 
	request_level level = <level> 
	cleanup_before_loading_level 
	load_requested_level 
ENDSCRIPT

SCRIPT change_level 
	parked_loading_screen_show level = <level> 
	Skater : Vibrate Off 
	IF InSplitScreenGame 
		IF ObjectExists id = Skater2 
			Skater2 : Vibrate Off 
		ENDIF 
	ENDIF 
	GetArraySize scripts_to_kill_when_changing_levels 
	<index> = 0 
	BEGIN 
		KillSpawnedScript name = ( scripts_to_kill_when_changing_levels [ <index> ] ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	change is_changing_levels = 1 
	change tod_manager_inactive = 0 
	CheckForInvalidLevels level = <level> 
	IF LevelIs Load_MainMenu 
		load_cas_textures_to_main_memory unload dont_assert 
		load_mainmenu_textures_to_main_memory unload dont_assert 
	ENDIF 
	IF LevelIs load_sk5ed 
		SwitchOffRailEditor 
	ENDIF 
	ResetScore 
	SetMusicLooping 0 
	SFX_Music_Volume_Box_Kill_State 
	IF NOT IsObserving 
		Skater : reset_model_lights 
	ENDIF 
	IF ObjectExists id = Skater2 
		Skater2 : reset_model_lights 
	ENDIF 
	change check_for_unplugged_controllers = 0 
	IF GotParam next_level_script 
		change next_level_script = <next_level_script> 
	ENDIF 
	IF NOT IsObserving 
		Skater : ClearPanel_Landed 
	ENDIF 
	IF NOT GotParam no_levelUnload 
		
		GoalManager_LevelUnload 
	ENDIF 
	ResetScore 
	ResetScorePot 
	hide_console_window 
	GoalManager_LevelUnload 
	GoalManager_DeactivateAllGoals 
	IF NOT IsObserving 
		Skater : StatsManager_DeactivateGoals 
	ENDIF 
	ScreenElementSystemCleanup 
	IF NOT inNetGame 
		hide_everything 
	ENDIF 
	kill_blur 
	IF InSplitScreenGame 
		launch_two_player 
	ENDIF 
	IF IsXbox 
		DisplayLoadingScreen freeze 
	ENDIF 
	ChangeLevel <...> 
ENDSCRIPT

SCRIPT QuickScript 
	
	ReloadNodeArray 
	IF ScriptExists LoadAllParticleTextures 
		LoadAllParticleTextures 
	ENDIF 
	Retry 
ENDSCRIPT

SCRIPT ReloadScene 
	Skater : SetCustomRestart Set 
	IF GotParam scene 
		IF UnloadScene <...> 
			Cleanup 
			IF NOT inNetGame 
				AllocatePathManMemory 
			ENDIF 
			FormatText ChecksumName = struct_name "level_%s" s = <scene> 
			AddParams <struct_name> 
			IF GotParam sky 
				LoadScene scene = <sky> 
			ENDIF 
			LoadScene <...> 
			IF GotParam level_name 
				SetLevelName <level_name> 
			ELSE 
				SetLevelName <level> 
			ENDIF 
			IF GotParam qb 
				NodeArrayManLoad <qb> 
			ENDIF 
			IF GotParam qb 
				PreloadModels 
			ENDIF 
			menu3d_load_assets structure_name = <structure_name> 
			IF GotParam level_qb 
				LoadQB <level_qb> LevelSpecific 
			ENDIF 
			IF GotParam level_sfx_qb 
				LoadQB <level_sfx_qb> LevelSpecific 
			ENDIF 
			IF GotParam more_level_qbs 
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
			LoadTerrain 
			IF GotParam temp_script 
				<temp_script> 
			ENDIF 
			IF NOT inNetGame 
				PushMemProfile "Level Specific Anims" 
				load_level_anims 
				PopMemProfile 
			ENDIF 
			PushMemProfile "Level Cameras" 
			LoadCameras 
			PopMemProfile 
			IF ScriptExists LoadObjectAnims 
				PushMemProfile "Object Anims" 
				LoadObjectAnims 
				PopMemProfile 
			ENDIF 
			IF ScriptExists LoadAllParticleTextures 
				LoadAllParticleTextures 
			ENDIF 
			IF GotParam startup_script 
				<startup_script> 
			ENDIF 
			GoalManager_GetLevelPrefix 
			FormatText ChecksumName = loading_sounds_script "%i_LoadingSounds" i = <level_prefix> 
			IF ScriptExists <loading_sounds_script> 
				<loading_sounds_script> 
			ENDIF 
			LoadCollision <...> 
			ParseNodeArray 
			IF GotParam setup_script 
				<setup_script> 
			ENDIF 
			TODManager_GetCurrentTODParams 
			TODManager_SetTODInstant ( <tod_params> . current_state_name ) 
			refresh_poly_count 
			IF ( SHOWPOLYS_ONQUICKVIEW ) 
				IF ( poly_count_on = 0 ) 
					show_poly_count 
				ENDIF 
			ENDIF 
		ELSE 
			autolaunch level = <scene> 
		ENDIF 
	ELSE 
		script_assert "No scene param specified for autolaunching" 
	ENDIF 
	Skater : SkipToCustomRestart 
	IF IsTrue TimeOfDayDebug 
		set_all_light_values level_only 
	ENDIF 
ENDSCRIPT

SCRIPT AddToScene 
	IF GotParam add 
	ELSE 
		add "update" 
	ENDIF 
	IF GotParam scene 
		AddScene scene = <scene> add = <add> 
		AddCollision scene = <scene> add = <add> 
	ELSE 
		script_assert "No scene param specified for autolaunching" 
	ENDIF 
ENDSCRIPT

CANCEL_GROUND = 1 
CANCEL_AIR = 2 
CANCEL_RAIL = 4 
CANCEL_WALL = 8 
CANCEL_LIP = 16 
CANCEL_WALLPLANT = 32 
CANCEL_MANUAL = 64 
CANCEL_HANG = 128 
CANCEL_LADDER = 256 
PURE_GROUND = 510 
PURE_AIR = 509 
PURE_RAIL = 507 
PURE_WALL = 503 
PURE_LIP = 495 
PURE_WALLPLANT = 479 
PURE_MANUAL = 447 
PURE_HANG = 383 
PURE_LADDER = 255 
REQUIRE_GROUND = 65536 
REQUIRE_AIR = 131072 
REQUIRE_RAIL = 262144 
REQUIRE_WALL = 524288 
REQUIRE_LIP = 1048576 
REQUIRE_WALLPLANT = 2097152 
REQUIRE_MANUAL = 4194304 
REQUIRE_HANG = 8388608 
REQUIRE_LADDER = 16777216 
CANCEL_SKATE = 512 
CANCEL_WALK = 1024 
CANCEL_DRIVE = 2048 
REQUIRE_SKATE = 33554432 
REQUIRE_WALK = 67108864 
REQUIRE_DRIVE = 134217728 
mFD_SKATABLE = 1 
mFD_NOT_SKATABLE = 2 
mFD_WALL_RIDABLE = 4 
mFD_VERT = 8 
mFD_NON_COLLIDABLE = 16 
mFD_LIGHT_MODULATION_ONLY = 32 
mFD_TRIGGER = 64 
mFD_CAMERA_NON_COLLIDABLE = 128 
mFD_NO_SKATER_SHADOW = 256 
mFD_SKATER_SHADOW = 512 
mFD_NO_SKATER_SHADOW_WALL = 1024 
mFD_UNDER_OK = 2048 
mFD_INVISIBLE = 4096 
mFD_NOT_TAGGABLE = 8192 
SCRIPT show_all 
	DebugRenderIgnore 
ENDSCRIPT

SCRIPT show_vert 
	DebugRenderIgnore ignore_0 = mFD_VERT 
ENDSCRIPT

SCRIPT show_wallride 
	DebugRenderIgnore ignore_0 = mFD_WALL_RIDABLE 
ENDSCRIPT

SCRIPT show_wall_ridable 
	DebugRenderIgnore ignore_0 = mFD_WALL_RIDABLE 
ENDSCRIPT

SCRIPT show_trigger 
	DebugRenderIgnore ignore_0 = mFD_TRIGGER 
ENDSCRIPT

SCRIPT show_invisible 
	DebugRenderIgnore ignore_0 = mFD_INVISIBLE 
ENDSCRIPT

SCRIPT show_triggers 
	show_trigger 
ENDSCRIPT

SCRIPT show_CAMERA 
	DebugRenderIgnore ignore_0 = mFD_NON_CAMERA_COLLIDABLE 
ENDSCRIPT

SCRIPT show_CAMERA_COLLIDE 
	DebugRenderIgnore ignore_0 = mFD_CAMERA_NON_COLLIDABLE 
ENDSCRIPT

SCRIPT show_skatable 
	DebugRenderIgnore ignore_0 = mFD_SKATABLE 
ENDSCRIPT

SCRIPT show_not_skatable 
	DebugRenderIgnore ignore_0 = mFD_NOT_SKATABLE 
ENDSCRIPT

SCRIPT show_no_skater_shadow 
	DebugRenderIgnore ignore_0 = mFD_NO_SKATER_SHADOW 
ENDSCRIPT

SCRIPT show_skater_shadow 
	DebugRenderIgnore ignore_0 = mFD_SKATER_SHADOW 
ENDSCRIPT

SCRIPT show_no_skater_shadow_wall 
	DebugRenderIgnore ignore_0 = mFD_NO_SKATER_SHADOW_WALL 
ENDSCRIPT

SCRIPT show_non_collidable 
	DebugRenderIgnore ignore_0 = mFD_NON_COLLIDABLE 
ENDSCRIPT

SCRIPT show_collidable 
	DebugRenderIgnore ignore_1 = mFD_NON_COLLIDABLE 
ENDSCRIPT

SCRIPT JumpSkaterToNode 
	MakeSkaterGoto JumpToNode Params = { NodeName = <NodeName> <...> } 
ENDSCRIPT

SCRIPT JumpToNode 
	IF NodeExists <NodeName> 
		StopBalanceTrick 
		SetSpeed 0 
		IF GotParam MoveUpABit 
			Move y = 10 
		ENDIF 
		Obj_MoveToNode name = <NodeName> Orient NoReset 
		Goto GroundGone 
	ENDIF 
ENDSCRIPT

SCRIPT ScreenElementSystemCleanup 
	
	IF ObjectExists id = root_window 
		DestroyScreenElement id = root_window 
		ScreenElementSystemInit 
		SetScreenElementProps { 
			id = root_window 
			event_handlers = [ 
				{ pad_start handle_start_pressed } 
			] 
			replace_handlers 
			tags = { menu_state = Off } 
		} 
		FireEvent type = focus target = root_window 
		IF NOT GotParam no_panel_stuff 
			create_panel_stuff 
		ENDIF 
	ENDIF 
	IF IsXbox 
		SetButtonEventMappings unblock_menu_input 
	ENDIF 
ENDSCRIPT

SCRIPT KillElement3d 
	Wait 1 GameFrame 
	Die 
ENDSCRIPT

SCRIPT setup_ped_speech { 
		inner_radius = 12 
		speed = 20 
		pad_choose_script = ped_speech_exit 
	} 
	<ped_id> : Obj_SetInnerRadius <inner_radius> 
	ClearEventHandler AnyObjectInRadius 
	ClearEventHandler ObjectOutofRadius 
	SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
ENDSCRIPT

SCRIPT ped_speech_got_trigger 
	IF NOT <colObjId> : IsLocalSkater 
		RETURN 
	ENDIF 
	ClearEventHandler AnyObjectInRadius 
	IF ObjectExists id = ped_speech_dialog 
		<should_destroy> = 0 
		IF Skater : IsInBail 
			<should_destroy> = 1 
		ENDIF 
		IF SkaterCurrentScorePotGreaterThan 0 
			<should_destroy> = 1 
		ENDIF 
		IF <colObjId> : DoingTrick 
			<should_destroy> = 1 
		ENDIF 
		IF NOT GoalManager_CanStartGoal 
			<should_destroy> = 1 
		ENDIF 
		IF GoalManager_IsInCompetition 
			<should_destroy> = 1 
		ENDIF 
		IF ( <should_destroy> = 1 ) 
			DestroyScreenElement id = ped_speech_dialog 
		ENDIF 
		SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
	ELSE 
		IF ObjectExists id = root_window 
			root_window : GetTags 
			IF GotParam menu_state 
				IF ( <menu_state> = on ) 
					SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT GoalManager_CanStartGoal 
			IF NOT inNetGame 
				SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
				RETURN 
			ENDIF 
		ENDIF 
		IF GoalManager_IsInCompetition 
			SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
			RETURN 
		ENDIF 
		IF <colObjId> : OnGround 
			IF NOT <colObjId> : IsInBail 
				IF NOT <colObjId> : DoingTrick 
					IF NOT SkaterCurrentScorePotGreaterThan 0 
						Obj_SetOuterRadius <inner_radius> 
						SetEventHandler ex = ObjectOutofRadius scr = ped_speech_refuse Params = <...> 
						IF NOT GotParam accept_text 
							IF NOT GotParam display_name 
								<display_name> = "Ped" 
							ENDIF 
							FormatText TextName = accept_text "%s: \\m5 to talk." s = <display_name> 
						ENDIF 
						IF ObjectExists id = ped_speech_dialog 
							DestroyScreenElement id = ped_speech_dialog 
						ENDIF 
						create_speech_box { 
							anchor_id = ped_speech_dialog 
							text = <accept_text> 
							no_pad_choose 
							no_pad_start 
							pad_circle_script = ped_speech_accept 
							pad_circle_params = <...> 
							bg_rgba = [ 100 100 100 128 ] 
							text_rgba = [ 128 128 128 128 ] 
							pos = PAIR(320.00000000000, 400.00000000000) 
							z_priority = 5 
						} 
						ped_speech_dialog : Obj_SpawnScript ped_speech_die_with_trigger Params = { ped_id = <ped_id> } 
					ELSE 
						SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
						RETURN 
					ENDIF 
				ELSE 
					SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
					RETURN 
				ENDIF 
			ELSE 
				SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
				RETURN 
			ENDIF 
		ELSE 
			SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger Params = <...> 
			RETURN 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ped_speech_accept 
	IF <colObjId> : IsInBail 
		RETURN 
	ENDIF 
	IF <colObjId> : DoingTrick 
		RETURN 
	ENDIF 
	speech_box_exit 
	IF NOT ObjectExists id = <ped_id> 
		RETURN 
	ENDIF 
	DeBounce X time = 0.50000000000 
	IF <colObjId> : OnGround 
		IF NOT SkaterCurrentScorePotGreaterThan 0 
			Wait 5 frame 
			IF <colObjId> : OnGround 
				ped_speech_accept2 <...> 
			ELSE 
				IF NOT <colObjId> : RightPressed 
					IF NOT <colObjId> : LeftPressed 
						IF NOT <colObjId> : UpPressed 
							IF NOT <colObjId> : DownPressed 
								ped_speech_accept2 <...> 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT <colObjId> : RightPressed 
			IF NOT <colObjId> : LeftPressed 
				IF NOT <colObjId> : UpPressed 
					IF NOT <colObjId> : DownPressed 
						ped_speech_accept2 <...> 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ped_speech_accept2 
	IF NOT GotParam dont_deactivate_goals 
		IF NOT GameModeEquals is_singlesession 
			IF NOT GameModeEquals is_classic 
				GoalManager_DeactivateAllGoals 
			ENDIF 
		ENDIF 
	ENDIF 
	PauseSkaters 
	ClearEventHandler AnyObjectInRadius 
	IF ObjectExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	IF GotParam swap_skaters 
		KillSpawnedScript name = TemporarilyDisableInput 
		kill_start_key_binding 
		SpawnScript TemporarilyDisableInput Params = { time = 250 } 
		Skater : Obj_SpawnScript swap_skaters Params = <swap_skaters_params> 
	ENDIF 
	IF GotParam activation_script 
		<colObjId> : Obj_SpawnScript <activation_script> Params = { ped_id = <ped_id> <activation_script_params> } 
	ENDIF 
	IF GotParam cam_anim 
		PlaySkaterCamAnim name = <cam_anim> 
	ENDIF 
	IF GotParam text 
		create_speech_box <...> no_pad_start 
	ENDIF 
ENDSCRIPT

SCRIPT ped_speech_refuse 
	IF GotParam intId 
		IF GotParam outIntId 
			IF NOT ( <outIntId> = <intId> ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam hint_text 
		ped_utils_hint_dialog_refuse <...> 
	ENDIF 
	ClearEventHandler ObjectOutofRadius 
	speech_box_exit anchor_id = ped_speech_dialog 
	ped_speech_reset <...> 
ENDSCRIPT

SCRIPT ped_speech_reset 
	IF GotParam outer_radius_script 
		<outer_radius_script> <outer_radius_params> 
	ENDIF 
	IF NOT GotParam no_repeat 
		setup_ped_speech <...> 
	ENDIF 
ENDSCRIPT

SCRIPT ped_speech_exit 
	UnPauseSkaters 
	speech_box_exit 
ENDSCRIPT

SCRIPT ped_speech_die_with_trigger 
	IF NOT GotParam ped_id 
		RETURN 
	ENDIF 
	alive = 1 
	BEGIN 
		IF NOT NodeExists <ped_id> 
			alive = 0 
		ENDIF 
		IF NOT IsAlive name = <ped_id> 
			alive = 0 
		ENDIF 
		IF ( <alive> = 0 ) 
			FireEvent type = speech_box_destroyed 
			Die 
			RETURN 
		ENDIF 
		Wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT script_assert <...> 
	
	ScriptAssert <...> 
ENDSCRIPT

SCRIPT GetStackedScreenElementPos 
	IF GotParam XY 
		GetStackedScreenElementPosOnXY <...> 
	ELSE 
		IF GotParam X 
			IF GotParam y 
				GetStackedScreenElementPosOnXY <...> 
			ELSE 
				GetStackedScreenElementPosOnX <...> 
			ENDIF 
		ELSE 
			IF GotParam y 
				GetStackedScreenElementPosOnY <...> 
			ELSE 
				script_assert "GetStackedScreenElementPos called without an axis" 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN pos = <pos> 
ENDSCRIPT

SCRIPT GetStackedScreenElementPosOnX 
	GetScreenElementPosition id = <id> 
	GetScreenElementDims id = <id> 
	<unit_pair> = PAIR(1.00000000000, 0.00000000000) 
	IF GotParam negative 
		<unit_pair> = PAIR(-1.00000000000, 0.00000000000) 
	ENDIF 
	IF GotParam offset 
		RETURN pos = ( <ScreenElementPos> + ( <unit_pair> * <width> + <offset> ) ) 
	ELSE 
		RETURN pos = ( <ScreenElementPos> + ( <unit_pair> * <width> ) ) 
	ENDIF 
ENDSCRIPT

SCRIPT GetStackedScreenElementPosOnY 
	GetScreenElementPosition id = <id> 
	GetScreenElementDims id = <id> 
	<unit_pair> = PAIR(0.00000000000, 1.00000000000) 
	IF GotParam negative 
		<unit_pair> = PAIR(0.00000000000, -1.00000000000) 
	ENDIF 
	IF GotParam offset 
		RETURN pos = ( <ScreenElementPos> + ( <unit_pair> * <height> + <offset> ) ) 
	ELSE 
		RETURN pos = ( <ScreenElementPos> + ( <unit_pair> * <height> ) ) 
	ENDIF 
ENDSCRIPT

SCRIPT GetStackedScreenElementPosOnXY 
	GetScreenElementPosition id = <id> 
	GetScreenElementDims id = <id> 
	<x_unit_pair> = PAIR(1.00000000000, 0.00000000000) 
	<y_unit_pair> = PAIR(0.00000000000, 1.00000000000) 
	IF GotParam negative 
		<x_unit_pair> = PAIR(-1.00000000000, 0.00000000000) 
		<y_unit_pair> = PAIR(0.00000000000, -1.00000000000) 
	ENDIF 
	IF GotParam offset 
		RETURN pos = ( <ScreenElementPos> + ( <y_unit_pair> * <height> + <x_unit_pair> * <width> + <offset> ) ) 
	ELSE 
		RETURN pos = ( <ScreenElementPos> + ( <y_unit_pair> * <height> + <x_unit_pair> * <width> ) ) 
	ENDIF 
ENDSCRIPT

SCRIPT kill_blur 
	IF NOT InSplitScreenGame 
		KillSpawnedScript name = pulse_blur_script_down 
		KillSpawnedScript name = pulse_blur_script_up 
		SetScreenBlur <start> 
	ENDIF 
ENDSCRIPT

SCRIPT pulse_blur start = 200 end = 0 speed = 4 
	KillSpawnedScript name = pulse_blur_script_down 
	KillSpawnedScript name = pulse_blur_script_up 
	IF ( <start> > <end> ) 
		SpawnScript pulse_blur_script_down Params = <...> 
	ELSE 
		SpawnScript pulse_blur_script_up Params = <...> 
	ENDIF 
ENDSCRIPT

SCRIPT pulse_blur_script_down 
	IF GotParam force_pulse 
		BEGIN 
			IF ( <start> < <end> ) 
				SetScreenBlur <end> 
				BREAK 
			ENDIF 
			SetScreenBlur <start> 
			<start> = ( <start> - <speed> ) 
			Wait 1 GameFrame 
		REPEAT 
		RETURN 
	ENDIF 
	IF NOT InSplitScreenGame 
		BEGIN 
			IF ( <start> < <end> ) 
				SetScreenBlur <end> 
				BREAK 
			ENDIF 
			SetScreenBlur <start> 
			<start> = ( <start> - <speed> ) 
			Wait 1 GameFrame 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT pulse_blur_script_up 
	IF GotParam force_pulse 
		BEGIN 
			IF ( <start> > <end> ) 
				SetScreenBlur <end> 
				BREAK 
			ENDIF 
			SetScreenBlur <start> 
			<start> = ( <start> + <speed> ) 
			Wait 1 GameFrame 
		REPEAT 
		RETURN 
	ENDIF 
	IF NOT InSplitScreenGame 
		BEGIN 
			IF ( <start> > <end> ) 
				SetScreenBlur <end> 
				BREAK 
			ENDIF 
			SetScreenBlur <start> 
			<start> = ( <start> + <speed> ) 
			Wait 1 GameFrame 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT NullScript 
ENDSCRIPT

SCRIPT mark_first_input_received 
	GetCurrentSkaterProfileIndex 
	GetSkaterId 
	IF GotParam device_num 
		<controller_index> = <device_num> 
	ELSE 
		<controller_index> = <controller> 
	ENDIF 
	BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index> 
	SpawnScript mark_first_input_received_spawned Params = <...> 
	FirstInputReceived 
	change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT mark_first_input_received_spawned 
	BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <controller_index> 
ENDSCRIPT

SCRIPT lighting target = 8421504 percent = 0 
	IF GotParam lights 
		IF GotParam id 
			FakeLights percent = <lights> id = <id> prefix = <prefix> 
		ELSE 
			IF GotParam prefix 
				FakeLights percent = <lights> prefix = <prefix> 
			ELSE 
				FakeLights percent = <lights> prefix = TRG_LevelLight 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam color 
		IF NOT GotParam sky 
			<sky> = <color> 
		ENDIF 
		SetSceneColor color = <color> sky = <sky> lightgroup = <lightgroup> 
	ENDIF 
ENDSCRIPT

SCRIPT DumpMetrics 
	GetMetrics 
	
	
	
ENDSCRIPT

dummy_metrics_struct = { 
	mainscene = 0 
	skyscene = 0 
	metrics = 0 
	Sectors = 0 
	ColSectors = 0 
	Verts = 0 
	BasePolys = 0 
	TextureMemory = 0 
} 
test_letter_a = { 
	model = "gameobjects\\skate\\letter_a\\letter_a.mdl" 
} 
proximobj_composite_structure = [ 
	{ component = sound } 
	{ component = stream } 
] 
gameobj_composite_structure = [ 
	{ component = suspend } 
	{ component = motion } 
	{ component = objectproximity } 
	{ component = sound } 
] 
SCRIPT bouncyobj_add_components 
	CreateComponentFromStructure component = suspend <...> 
	CreateComponentFromStructure component = rigidbody <...> 
	IF GotParam FireSkaterProximityEvents 
		CreateComponentFromStructure component = objectproximity 
	ENDIF 
	CreateComponentFromStructure component = model <...> 
	CreateComponentFromStructure component = sound <...> 
	IF GotParam UseLockObjComponent 
		CreateComponentFromStructure component = lockobj 
	ENDIF 
ENDSCRIPT

particle_composite_structure = [ 
	{ component = suspend } 
	{ component = particle } 
] 
moving_particle_composite_structure = [ 
	{ component = suspend } 
	{ component = motion } 
	{ component = particle } 
] 
skatercam_composite_structure = [ 
	{ component = cameralookaround } 
	{ component = skatercamera } 
	{ component = walkcamera } 
	{ component = camera } 
	{ component = input } 
] 
viewercam_composite_structure = [ 
	{ component = camera } 
] 
parkedcam_composite_structure = [ 
	{ component = camera } 
] 
menucam_composite_structure = 
[ 
	{ component = camera } 
] 
explosion_composite_structure = 
[ 
	{ component = suspend } 
	{ component = particle } 
] 
fireball_composite_structure = 
[ 
	{ component = velocity } 
	{ component = suspend } 
	{ component = collideanddie } 
	{ component = particle } 
] 
SCRIPT Restore_skater_camera 
	IF NOT ( view_mode = 0 ) 
		SetActiveCamera id = viewer_cam 
		RETURN 
	ENDIF 
	IF IsObserving 
		SetActiveCamera id = SkaterCam0 
	ELSE 
		IF NOT LocalSkaterExists 
			SetActiveCamera id = SkaterCam0 
		ELSE 
			IF NOT Skater : Driving 
				SetActiveCamera id = SkaterCam0 
			ELSE 
				SetActiveCamera id = PlayerVehicleCamera 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		IF NOT LevelIs load_cas 
			IF NOT IsObserving 
				IF LocalSkaterExists 
					Skater : Obj_EnableScaling 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT disable_skater_scaling 
	IF NOT LevelIs Load_MainMenu 
		IF NOT LevelIs load_cas 
			IF NOT IsObserving 
				IF NOT GetGlobalFlag flag = CHEAT_KID 
					Skater : Obj_DisableScaling 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_menu_camera 
	IF NOT ObjectExists id = menu_cam 
		MemPushContext FrontEndHeap 
		
		CreateCompositeObject { 
			Components = menucam_composite_structure 
			Params = { name = menu_cam } 
		} 
		MemPopContext 
	ENDIF 
ENDSCRIPT

SCRIPT GetSkaterCam 
	camera_object = SkaterCam0 
	IF InSplitScreenGame 
		IF IsObjectScript 
			Obj_GetId 
			IF NOT ChecksumEquals a = <ObjId> b = 0 
				camera_object = skatercam1 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN skatercam = <camera_object> 
ENDSCRIPT

SCRIPT SetSkaterCamOverride 
	GetSkaterCam 
	<skatercam> : SC_SetSkaterCamOverride <...> 
ENDSCRIPT

SCRIPT ClearSkaterCamOverride 
	GetSkaterCam 
	<skatercam> : SC_ClearSkaterCamOverride <...> 
ENDSCRIPT

SCRIPT ShakeCamera 
	GetSkaterCam 
	<skatercam> : SC_ShakeCamera <...> 
ENDSCRIPT

SCRIPT empty_script 
ENDSCRIPT

SCRIPT HideSkaterAndMiscSkaterEffects 
	KillAllTextureSplats 
	Skater : SparksOff 
	Skater : SwitchOnBoard 
	Skater : RemoveSkaterFromWorld 
ENDSCRIPT

SCRIPT ResetLookAround 
	
ENDSCRIPT

SCRIPT toggle_framerate 
	SWITCH lock_framerate 
		CASE 0 
			change lock_framerate = 2 
		CASE 1 
			change lock_framerate = 2 
		CASE 2 
			change lock_framerate = 1 
	ENDSWITCH 
ENDSCRIPT

SCRIPT CalcPosRelative ob = Skater dx = 0 dy = 0 dz = 0 
	<ob> : Obj_GetPosition 
	<ob> : Obj_GetOrientation 
	unit_z = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <X> + VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <y> + VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <z> ) 
	unit_x = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <unit_z> ) 
	unit_y = ( <unit_z> * <unit_x> ) 
	pos = ( <pos> + <dx> * <unit_x> + <dy> * <unit_y> + <dz> * <unit_z> ) 
	RETURN X = ( <pos> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) y = ( <pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) z = ( <pos> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) pos = <pos> 
ENDSCRIPT

SCRIPT Forced_Create 
	IF GotParam prefix 
		kill prefix = <prefix> 
		create prefix = <prefix> 
	ELSE 
		IF GotParam name 
			IF NodeExists <name> 
				kill name = <name> 
				create name = <name> 
			ELSE 
				
			ENDIF 
		ELSE 
			
		ENDIF 
	ENDIF 
ENDSCRIPT

skater_special_index = 0 
have_loaded_permanent = 0 
have_loaded_unloadable = 0 
have_loaded_net = 0 
SCRIPT do_load_permanent 
	IF ( have_loaded_permanent ) 
	ELSE 
		IF IsNGC 
			LoadPreFile "anims.pre" 
			PushMemProfile "Permanent Anims" 
			MemPushContext TopDownHeap 
			load_permanent_anims 
			MemPopContext 
			PopMemProfile 
			UnloadPreFile "anims.pre" 
		ELSE 
			do_unload_unloadable 
			PushMemProfile "Permanent Anims" 
			MemPushContext TopDownHeap 
			SetDefaultPermanent 1 
			PushMemProfile "Permanent Anim Pipped PRE" 
			LoadPipPre "anims.pre" 
			PopMemProfile 
			load_permanent_anims use_pip 
			SetDefaultPermanent 0 
			MemPopContext 
			PopMemProfile 
		ENDIF 
		change have_loaded_permanent = 1 
	ENDIF 
ENDSCRIPT

SCRIPT do_unload_permanent 
	IF NOT IsNGC 
		IF ( have_loaded_permanent ) 
			load_permanent_anims LoadFunction = UnloadAnim 
			
			IF NOT UnloadPipPre "anims.pre" 
				script_assert "couldn\'t unload pip pre" 
			ENDIF 
			change have_loaded_permanent = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT do_load_unloadable load_peds = 1 
	
	IF inNetGame 
		load_peds = 0 
	ENDIF 
	IF ( <load_peds> = 1 ) 
		IF ( have_loaded_unloadable ) 
		ELSE 
			IF ( have_loaded_net ) 
				do_unload_unloadable 
			ENDIF 
			do_load_permanent 
			IF IsNGC 
				LoadPreFile "unloadableanims.pre" 
				PushMemProfile "Unloadable Anims" 
				MemPushContext TopDownHeap 
				load_unloadable_anims 
				MemPopContext 
				PopMemProfile 
				UnloadPreFile "unloadableanims.pre" 
			ELSE 
				PushMemProfile "Unloadable Anims" 
				MemPushContext TopDownHeap 
				PushMemProfile "Unloadable Anims Pipped PRE" 
				LoadPipPre "unloadableanims.pre" 
				PopMemProfile 
				SetDefaultPermanent 1 
				load_unloadable_anims use_pip 
				SetDefaultPermanent 0 
				MemPopContext 
				PopMemProfile 
			ENDIF 
			change have_loaded_unloadable = 1 
		ENDIF 
	ELSE 
		IF NOT IsNGC 
			IF ( have_loaded_net ) 
			ELSE 
				IF ( have_loaded_unloadable ) 
					do_unload_unloadable 
				ENDIF 
				do_unload_permanent 
				PushMemProfile "Net Anims" 
				MemPushContext TopDownHeap 
				LoadPipPre "Netanims.pre" 
				SetDefaultPermanent 1 
				load_net_anims use_pip 
				SetDefaultPermanent 0 
				MemPopContext 
				PopMemProfile 
				change have_loaded_net = 1 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT do_unload_unloadable 
	IF NOT IsNGC 
		IF ( have_loaded_unloadable ) 
			load_unloadable_anims LoadFunction = UnloadAnim 
			IF NOT UnloadPipPre "unloadableanims.pre" 
			ENDIF 
			change have_loaded_unloadable = 0 
		ENDIF 
		IF ( have_loaded_net ) 
			load_net_anims LoadFunction = UnloadAnim 
			IF NOT UnloadPipPre "netanims.pre" 
				script_assert "couldn\'t unload pip pre" 
			ENDIF 
			change have_loaded_net = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT what_is_loaded 
	IF ( have_loaded_permanent ) 
		
	ENDIF 
	IF ( have_loaded_unloadable ) 
		
	ENDIF 
	IF ( have_loaded_net ) 
		
	ENDIF 
ENDSCRIPT

SCRIPT SetObjectColor_CurrentTOD 
	TODManager_GetCurrentTODParams 
	<lev_red> = ( <tod_params> . lev_red ) 
	<lev_green> = ( <tod_params> . lev_green ) 
	<lev_blue> = ( <tod_params> . lev_blue ) 
	SetObjectColor <...> color = ( lev_red + ( lev_green * 256 ) + ( lev_blue * 65536 ) ) 
ENDSCRIPT

SCRIPT KillCreateSponsorGeo 
	GoalManager_GetSponsor 
	IF GotParam sponsor_kill_prefix 
		kill prefix = <sponsor_kill_prefix> 
	ELSE 
		
		RETURN 
	ENDIF 
	IF GotParam nosponsor_prefix 
		kill prefix = <nosponsor_prefix> 
	ENDIF 
	SWITCH <sponsor> 
		CASE sponsor_birdhouse 
			
			create prefix = <sponsor_birdhouse_prefix> 
		CASE sponsor_element 
			
			create prefix = <sponsor_element_prefix> 
		CASE sponsor_flip 
			
			create prefix = <sponsor_flip_prefix> 
		CASE sponsor_girl 
			
			create prefix = <sponsor_girl_prefix> 
		CASE sponsor_zero 
			
			create prefix = <sponsor_zero_prefix> 
		DEFAULT 
			IF GotParam nosponsor_prefix 
				create prefix = <nosponsor_prefix> 
			ENDIF 
	ENDSWITCH 
ENDSCRIPT

SCRIPT GetNetworkNumPlayers 
	GetPreferenceChecksum pref_type = network num_players 
	SWITCH <checksum> 
		CASE num_2 
			RETURN num_players = 2 
		CASE num_3 
			RETURN num_players = 3 
		CASE num_4 
			RETURN num_players = 4 
		CASE num_5 
			RETURN num_players = 5 
		CASE num_6 
			RETURN num_players = 6 
		CASE num_7 
			RETURN num_players = 7 
		CASE num_8 
			RETURN num_players = 8 
		DEFAULT 
			RETURN num_players = 1 
	ENDSWITCH 
ENDSCRIPT

SCRIPT trigger_speed_boost multi = 7.50000000000 
	SpawnSound SK6_SFX_Roll_Booster_Sound Params = { DefBoostSound = <DefBoostSound> DefSkaterVO = <DefSkaterVO> } 
	IF GotParam max_speed 
		GetSpeed 
		IF ( ( <speed> * <multi> ) > <max_speed> ) 
			IF ( <speed> < <max_speed> ) 
				<new_speed> = <max_speed> 
			ELSE 
				RETURN 
			ENDIF 
		ELSE 
			<new_speed> = ( <speed> * <multi> ) 
		ENDIF 
		SetSkaterVelocity <new_speed> 
	ELSE 
		IF GotParam speed 
			SetSkaterVelocity <speed> 
		ELSE 
			GetSkaterVelocity 
			SetSkaterVelocity vel_x = ( <vel_x> * <multi> ) vel_y = ( <vel_y> * <multi> ) vel_z = ( <vel_z> * <multi> ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT trigger_jump_boost multi = 7.50000000000 
	SpawnSound SK6_SFX_Jump_Booster_Sound 
	GetSkaterVelocity 
	IF GotParam speed 
		SetSkaterVelocity vel_x = <vel_x> vel_y = <speed> vel_z = <vel_z> 
	ELSE 
		SetSkaterVelocity vel_x = <vel_x> vel_y = ( <vel_y> * <multi> ) vel_z = <vel_z> 
	ENDIF 
ENDSCRIPT

SCRIPT ForceToWalk 
	
	IF IsSkaterOnVehicle 
		RETURN 
	ENDIF 
	SetForceWalk 
	Wait 1 GameFrame 
	TantrumOff 
	IF IsInBail 
		waitforevent type = finished_bailing 
	ENDIF 
	IF NOT Walking 
		MakeSkaterGoto Switch_OnGroundAI Params = { NewScript = Walking_OnGroundAI } 
	ELSE 
		ClearTrickQueues 
		SetWalkingAirTricks 
		SetWalkingGroundTricks 
	ENDIF 
	SwitchOnBoard 
ENDSCRIPT

SCRIPT KillForceToWalk 
	
	IF IsSkaterOnVehicle 
		RETURN 
	ENDIF 
	UnSetForceWalk 
	SwitchOnBoard 
	ClearTrickQueues 
	SetWalkingAirTricks 
	SetWalkingGroundTricks 
ENDSCRIPT

SCRIPT GetTriggerArray 
	IF GotParam array 
		GetTriggerArrays array = <array> 
		RETURN trigger_array = <trigger_array> 
	ENDIF 
	array = [ -1 , -1 , -1 ] 
	index = 0 
	value1 = NULL 
	value2 = NULL 
	value3 = NULL 
	IF GotParam walk 
		value1 = 14 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam skate 
		SWITCH <index> 
			CASE 0 
				value1 = 1 
			CASE 1 
				value2 = 1 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam jump 
		SWITCH <index> 
			CASE 0 
				value1 = 2 
			CASE 1 
				value2 = 2 
			CASE 2 
				value3 = 2 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam onto 
		SWITCH <index> 
			CASE 0 
				value1 = 3 
			CASE 1 
				value2 = 3 
			CASE 2 
				value3 = 3 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ELSE 
		IF GotParam on 
			SWITCH <index> 
				CASE 0 
					value1 = 3 
				CASE 1 
					value2 = 3 
				CASE 2 
					value3 = 3 
			ENDSWITCH 
			index = ( <index> + 1 ) 
		ENDIF 
	ENDIF 
	IF GotParam Off 
		SWITCH <index> 
			CASE 0 
				value1 = 4 
			CASE 1 
				value2 = 4 
			CASE 2 
				value3 = 4 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam offedge 
		SWITCH <index> 
			CASE 0 
				value1 = 5 
			CASE 1 
				value2 = 5 
			CASE 2 
				value3 = 5 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam wallplant 
		SWITCH <index> 
			CASE 0 
				value1 = 6 
			CASE 1 
				value2 = 6 
			CASE 2 
				value3 = 6 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam lip 
		SWITCH <index> 
			CASE 0 
				value1 = 7 
			CASE 1 
				value2 = 7 
			CASE 2 
				value3 = 7 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam land 
		SWITCH <index> 
			CASE 0 
				value1 = 8 
			CASE 1 
				value2 = 8 
			CASE 2 
				value3 = 8 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam bonk 
		SWITCH <index> 
			CASE 0 
				value1 = 9 
			CASE 1 
				value2 = 9 
			CASE 2 
				value3 = 9 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam climb 
		SWITCH <index> 
			CASE 0 
				value1 = 10 
			CASE 1 
				value2 = 10 
			CASE 2 
				value3 = 10 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ELSE 
		IF GotParam hang 
			SWITCH <index> 
				CASE 0 
					value1 = 10 
				CASE 1 
					value2 = 10 
				CASE 2 
					value3 = 10 
			ENDSWITCH 
			index = ( <index> + 1 ) 
		ENDIF 
	ENDIF 
	IF GotParam graffiti 
		SWITCH <index> 
			CASE 0 
				value1 = 11 
			CASE 1 
				value2 = 11 
			CASE 2 
				value3 = 11 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam spin 
		SWITCH <index> 
			CASE 0 
				value1 = 12 
			CASE 1 
				value2 = 12 
			CASE 2 
				value3 = 12 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam grind 
		SWITCH <index> 
			CASE 0 
				value1 = 13 
			CASE 1 
				value2 = 13 
			CASE 2 
				value3 = 13 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF GotParam projectile 
		SWITCH <index> 
			CASE 0 
				value1 = 14 
			CASE 1 
				value2 = 14 
			CASE 2 
				value3 = 14 
		ENDSWITCH 
		index = ( <index> + 1 ) 
	ENDIF 
	IF NOT ( <value1> = NULL ) 
		SetArrayElement ArrayName = array index = 0 NewValue = <value1> 
	ENDIF 
	IF NOT ( <value2> = NULL ) 
		SetArrayElement ArrayName = array index = 1 NewValue = <value2> 
	ENDIF 
	IF NOT ( <value3> = NULL ) 
		SetArrayElement ArrayName = array index = 2 NewValue = <value3> 
	ENDIF 
	RETURN trigger_array = <array> 
ENDSCRIPT

SCRIPT GetTriggerArrays 
	IF NOT GotParam array 
		
	ENDIF 
	output_array = [ [ 15 , 4 , 3 ] , [ 15 , 4 , 3 ] , [ 15 , 4 , 3 ] ] 
	GetArraySize <array> 
	index = 0 
	BEGIN 
		GetTriggerArray ( <array> [ <index> ] ) 
		SetArrayElement ArrayName = output_array index = <index> NewValue = <trigger_array> 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN trigger_array = <output_array> 
ENDSCRIPT

SCRIPT StopParticleObject 
	IF GotParam Debug 
		
	ENDIF 
	<name> : setemitrate 0 
	IF NOT GotParam StayAlive 
		BEGIN 
			IF NOT <name> : IsEmitting 
				kill name = <name> 
				BREAK 
			ENDIF 
			Wait 30 gameframes 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT restore_start_key_binding 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ { pad_start handle_start_pressed } ] 
		replace_handlers 
	} 
	IF ( enable_view_goals_select_shortcut = 1 ) 
		SetScreenElementProps { 
			id = root_window 
			event_handlers = [ { pad_select create_view_goals_shortcut } ] 
			replace_handlers 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT kill_start_key_binding 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ { pad_start null_script } ] 
		replace_handlers 
	} 
	IF ( enable_view_goals_select_shortcut = 1 ) 
		SetScreenElementProps { 
			id = root_window 
			event_handlers = [ { pad_select null_script } ] 
			replace_handlers 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT ShowUIMem 
	<profile_names> = [ 
		"Fonts and Bitmaps" 
		"Sprites - Fonts and Bitmaps" 
	] 
	GetMemProfileSize profile_names = <profile_names> 
	<usage_2d> = <profile_size> 
	GetMemProfileSize profile_name = "Menu 3D" 
	<usage_3d> = <profile_size> 
	IF ( ( <usage_2d> > -1 ) & ( <usage_3d> > -1 ) ) 
		
		
		
		
		
		
		
	ELSE 
		
	ENDIF 
ENDSCRIPT

SCRIPT ShowAnimMem 
	<profile_names> = [ 
		"Permanent Anims" 
		"Permanent & semi-permanent anims" 
	] 
	GetMemProfileSize profile_names = <profile_names> 
	<usage_permanent> = <profile_size> 
	GetMemProfileSize profile_name = "Level Specific Anims" 
	<usage_levelspecific> = <profile_size> 
	IF ( <profile_size> > -1 ) 
		
		
		
		
		
		
		
	ELSE 
		
	ENDIF 
ENDSCRIPT

SCRIPT make_new_menu { menu_title = "" 
		padding_scale = 1.14999997616 
		internal_scale = 1 
		pos = PAIR(230.00000000000, 109.00000000000) 
		dims = PAIR(200.00000000000, 100.00000000000) 
		internal_just = [ left top ] 
		parent = root_window 
		just = [ center center ] 
		scrolling_menu_offset = PAIR(0.00000000000, 10.00000000000) 
	} 
	<pos> = ( <pos> + PAIR(0.00000000000, 12.00000000000) ) 
	SetScreenElementLock id = <parent> Off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <menu_id> 
		font = small 
		pos = PAIR(320.00000000000, 240.00000000000) 
		scale = 1 
		dims = PAIR(640.00000000000, 480.00000000000) 
		focusable_child = <vmenu_id> 
	} 
	SWITCH <type> 
		CASE VScrollingMenu 
			IF GotParam scrolling_menu_title_id 
				CreateScreenElement { 
					type = TextElement 
					parent = <menu_id> 
					id = <scrolling_menu_title_id> 
					font = testtitle 
					text = <menu_title> 
					scale = 1.39999997616 
					pos = <pos> 
					just = [ left top ] 
					rgba = MENU_TITLE_COLOR 
					not_focusable 
				} 
				GetStackedScreenElementPos y id = <id> offset = <scrolling_menu_offset> 
			ENDIF 
			CreateScreenElement { 
				type = VScrollingMenu 
				parent = <menu_id> 
				id = <scrolling_menu_id> 
				pos = <pos> 
				just = [ left top ] 
				dims = <dims> 
				scale = <scale> 
				internal_just = [ left top ] 
				num_items_to_show = <num_items_to_show> 
			} 
			<vscrolling_menu_id> = <id> 
			CreateScreenElement { 
				type = VMenu 
				parent = <vscrolling_menu_id> 
				id = <vmenu_id> 
				dims = <dims> 
				font = small 
				just = [ left top ] 
				pos = PAIR(0.00000000000, 0.00000000000) 
				scale = <scale> 
				regular_space_amount = <regular_space_amount> 
				padding_scale = <padding_scale> 
				internal_scale = <internal_scale> 
				internal_just = <internal_just> 
				<dont_allow_wrap> 
				event_handlers = [ { pad_up generic_menu_up_or_down_sound Params = { up } } 
					{ pad_down generic_menu_up_or_down_sound Params = { down } } 
				] 
			} 
		DEFAULT 
			CreateScreenElement { 
				type = VMenu 
				parent = <menu_id> 
				id = <vmenu_id> 
				font = small 
				just = [ left top ] 
				pos = <pos> 
				padding_scale = <padding_scale> 
				internal_scale = <internal_scale> 
				internal_just = <internal_just> 
				<dont_allow_wrap> 
				event_handlers = [ { pad_up generic_menu_up_or_down_sound Params = { up } } 
					{ pad_down generic_menu_up_or_down_sound Params = { down } } 
				] 
			} 
			IF NOT GotParam no_menu_title 
				CreateScreenElement { 
					type = TextElement 
					parent = <vmenu_id> 
					font = testtitle 
					text = <menu_title> 
					scale = 1.39999997616 
					rgba = MENU_TITLE_COLOR 
					not_focusable 
				} 
			ENDIF 
	ENDSWITCH 
	IF NOT GotParam no_alias 
		AssignAlias id = <menu_id> alias = current_menu_anchor 
	ENDIF 
	AssignAlias id = <vmenu_id> alias = current_menu 
	IF GotParam helper_text 
		create_helper_text <helper_text> 
	ENDIF 
ENDSCRIPT

SCRIPT make_text_sprite pos = PAIR(215.00000000000, 15.00000000000) just = [ center center ] scale = 0.44999998808 
	IF GotParam id 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent> 
			id = <id> 
			texture = <texture> 
			pos = <pos> 
			rgba = [ 0 0 0 0 ] 
			just = <just> 
			scale = <scale> 
			z_priority = 2 
		} 
	ELSE 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent> 
			texture = <texture> 
			pos = <pos> 
			rgba = [ 0 0 0 0 ] 
			just = <just> 
			scale = <scale> 
			z_priority = 2 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT make_text_sub_menu_item { focus_script = do_scale_up 
		unfocus_script = do_scale_down 
		pad_choose_script = NullScript 
		font_face = small 
		parent_menu_id = current_menu 
		scale = 1 
		rgba = [ 88 105 112 128 ] 
	} 
	IF GotParam not_focusable 
		CreateScreenElement { 
			type = TextElement 
			parent = <parent_menu_id> 
			id = <id> 
			text = <text> 
			font = <font_face> 
			rgba = <rgba> 
			scale = <scale> 
			event_handlers = [ 
				{ focus <focus_script> Params = <focus_params> } 
				{ unfocus <unfocus_script> Params = <unfocus_params> } 
				{ pad_choose <pad_choose_script> Params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
			] 
			not_focusable 
		} 
	ELSE 
		IF GotParam no_choose_sound 
			CreateScreenElement { 
				type = TextElement 
				parent = <parent_menu_id> 
				id = <id> 
				text = <text> 
				font = <font_face> 
				rgba = <rgba> 
				scale = <scale> 
				event_handlers = [ 
					{ focus <focus_script> Params = <focus_params> } 
					{ unfocus <unfocus_script> Params = <unfocus_params> } 
					{ pad_choose <pad_choose_script> Params = <pad_choose_params> } 
					{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
				] 
			} 
		ELSE 
			CreateScreenElement { 
				type = TextElement 
				parent = <parent_menu_id> 
				id = <id> 
				text = <text> 
				font = <font_face> 
				rgba = <rgba> 
				scale = <scale> 
				event_handlers = [ 
					{ focus <focus_script> Params = <focus_params> } 
					{ unfocus <unfocus_script> Params = <unfocus_params> } 
					{ pad_choose generic_menu_pad_choose_sound } 
					{ pad_start generic_menu_pad_choose_sound } 
					{ pad_choose <pad_choose_script> Params = <pad_choose_params> } 
					{ pad_start <pad_choose_script> Params = <pad_choose_params> } 
				] 
			} 
		ENDIF 
	ENDIF 
	IF GotParam pad_circle_script 
		SetScreenElementProps { id = <id> 
			event_handlers = [ 
				{ pad_circle <pad_circle_script> Params = <pad_circle_params> } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT SafeCallback 
	IF NOT GotParam callback 
		RETURN 
	ENDIF 
	old_callback = <callback> 
	RemoveParameter callback 
	<old_callback> <...> 
ENDSCRIPT

SCRIPT get_current_skater_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN name = <name> 
ENDSCRIPT

SCRIPT AwardNewSpecialTrickToProfile 
	IF GotParam all_profiles 
		IF GotParam name 
			profile = <name> 
		ELSE 
			ForEachSkaterName do = AwardNewSpecialTrickToProfile Params = { <...> dont_replace_trick_text } 
			GoalManager_ReplaceTrickText all 
			RETURN 
		ENDIF 
	ELSE 
		IF NOT GotParam profile 
			script_assert "AwardNewSpecialTrickToProfile needs a profile param" 
		ENDIF 
	ENDIF 
	IF NOT GotParam trick 
		script_assert "AwardNewSpecialTrickToProfile needs a trick param" 
	ENDIF 
	IF NOT GotParam key_combo 
		script_assert "AwardNewSpecialTrickToProfile needs a key_combo param" 
	ENDIF 
	AwardSpecialTrickSlot profile = <profile> 
	IF GoalManager_GetTrickFromKeyCombo profile = <profile> special key_combo = <key_combo> 
		
		BindTrickToKeyCombo { 
			profile = <profile> 
			special 
			index = <current_index> 
			key_combo = Unassigned 
			trick = Unassigned 
			update_mappings = 1 
		} 
		<index> = <current_index> 
	ENDIF 
	IF GetKeyComboBoundToTrick profile = <profile> special trick = <trick> cat_num = <trick> 
		
		BindTrickToKeyCombo { 
			profile = <profile> 
			special 
			index = <current_index> 
			key_combo = Unassigned 
			trick = Unassigned 
			update_mappings = 1 
		} 
		<index> = <current_index> 
	ENDIF 
	GetSkaterProfileInfoByName name = <profile> 
	IF NOT GotParam index 
		<index> = ( <max_specials> - 1 ) 
	ENDIF 
	BindTrickToKeyCombo { 
		profile = <profile> 
		special 
		index = <index> 
		key_combo = <key_combo> 
		trick = <trick> 
		update_mappings = 1 
	} 
	IF NOT GotParam dont_replace_trick_text 
		GoalManager_ReplaceTrickText all 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	UpdateTrickMappings Skater = <currentSkaterProfileIndex> 
ENDSCRIPT

SCRIPT TurnOffLevelParticles 
	IF LevelIs load_BO 
		BO_AllParticlesOff 
	ENDIF 
ENDSCRIPT

SCRIPT flip_skating_backwards 
	IF NOT DoingBalanceTrick 
		Flip 
	ELSE 
		Flip 
		BoardRotate 
		IF InNollie 
			IF IsLatestTrick TrickText = "One Foot Nose Manual" 
				MakeSkaterGoto ManualLink Params = { name = #"One Foot Manual" Score = 100 blend = 0.10000000149 BalanceAnim = OneFootManual_Range OffMeterTop = ManualLand OffMeterBottom = ManualBail ExtraTricks = ManualBranches ExtraTricks2 = FlatlandBranches IsExtra } 
			ELSE 
				IF IsLatestTrick TrickText = "Anti Casper" 
					MakeSkaterGoto ManualLink Params = { name = #"Casper" Score = 100 blend = 0.10000000149 BalanceAnim = Casper_Range OutAnim = Casper_out OffMeterTop = ManualLand OffMeterBottom = NoseManualBail Friction = 0.50000000000 BoardRotate ExtraTricks = FlatlandBranches ExtraTricks2 = CasperBranches } 
				ELSE 
					MakeSkaterGoto ManualLink Params = { name = #"Manual" Score = 100 blend = 0.10000000149 BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 BalanceAnim3 = Manual_Range3 OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatlandBranches CheckCheese AllowWallpush } 
				ENDIF 
			ENDIF 
		ELSE 
			IF IsLatestTrick TrickText = "One Foot Manual" 
				MakeSkaterGoto ManualLink Params = { name = #"One Foot Nose Manual" Score = 100 blend = 0 BalanceAnim = OneFootNoseManual_Range Nollie OffMeterTop = NoseManualBail OffMeterBottom = ManualLand IsExtra ExtraTricks = NoseManualBranches ExtraTricks2 = FlatlandBranches } 
			ELSE 
				IF IsLatestTrick TrickText = "Casper" 
					MakeSkaterGoto ManualLink Params = { name = #"Anti Casper" Score = 100 blend = 0 BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out OffMeterTop = ManualBail OffMeterBottom = ManualLand Friction = 0.50000000000 BoardRotate Nollie ExtraTricks = FlatlandBranches ExtraTricks2 = AntiCasperBranches } 
				ELSE 
					MakeSkaterGoto ManualLink Params = { name = #"Nose Manual" Score = 100 blend = 0 BalanceAnim = NoseManual_Range BalanceAnim2 = NoseManual_Range2 Nollie OffMeterTop = ManualLand OffMeterBottom = NoseManualBail ExtraTricks2 = NoseManualBranches ExtraTricks = FlatlandBranches CheckCheese AllowWallpush } 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SetDepthOfFieldParams front_start = 0.00000000000 back_start = 200.00000000000 front_strength = [ 50 50 50 ] back_strength = [ 50 50 50 ] 
	IF GotParam Off 
		on = 0 
	ELSE 
		on = 1 
	ENDIF 
	SetScreenEffectsDOFParams { 
		on = <on> 
		FrontBlurStart = <front_start> 
		BackBlurStart = <back_start> 
		FrontStrenth = <front_strength> 
		BackStrength = <back_strength> 
	} 
ENDSCRIPT

SCRIPT fam_play_stream vol = 190 
	IF GotParam streamId 
		BEGIN 
			IF PreLoadStreamDone <streamId> 
				BREAK 
			ENDIF 
			Wait 1 frame 
		REPEAT 
	ENDIF 
	IF GotParam play_anim 
		RemoveAnimController id = jawRotation 
		AddAnimController { 
			type = partialAnim 
			id = jawRotation 
			animName = <stream_checksum> 
			From = start 
			To = end 
			speed = 1.00000000000 
		} 
	ENDIF 
	IF GotParam streamId 
		StartPreloadedStream { 
			streamId = <streamId> 
			volume = <vol> 
		} 
	ELSE 
		Obj_PlayStream { 
			<stream_checksum> 
			vol = <vol> 
			dropoff = 300 
			use_pos_info = <use_pos_info> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT reset_balance_indicator 
	SpawnScript reset_balance_indicator2 
ENDSCRIPT

SCRIPT reset_balance_indicator2 
	SetScreenElementLock Off id = root_window 
	IF NOT ScreenElementExists id = balance_indicator 
		CreateScreenElement { 
			type = SpriteElement 
			id = balance_indicator 
			texture = heart 
			parent = root_window 
			pos = PAIR(570.00000000000, 240.00000000000) 
			scale = PAIR(1.00000000000, 1.00000000000) 
			rgba = [ 100 100 100 100 ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			id = balance_indicator3 
			texture = white2 
			parent = root_window 
			pos = PAIR(569.00000000000, 220.00000000000) 
			scale = PAIR(0.50000000000, 4.75000000000) 
			rgba = [ 100 0 0 100 ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			id = balance_indicator2 
			texture = white2 
			parent = root_window 
			pos = PAIR(568.00000000000, 220.00000000000) 
			scale = PAIR(0.75000000000, 5.00000000000) 
			rgba = [ 0 0 0 100 ] 
		} 
		Wait 0.50000000000 seconds 
		IF ScreenElementExists id = balance_indicator 
			DestroyScreenElement id = balance_indicator 
			DestroyScreenElement id = balance_indicator2 
			DestroyScreenElement id = balance_indicator3 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Vibrate_Controller_Safe actuator = 1 percent = 95 
	GetSkaterNumber 
	IF ControllerBoundToSkater controller = 0 Skater = <skaternumber> 
		VibrateController port = 0 actuator = <actuator> percent = <percent> 
	ELSE 
		IF ControllerBoundToSkater controller = 1 Skater = <skaternumber> 
			VibrateController port = 1 actuator = <actuator> percent = <percent> 
		ELSE 
			IF ControllerBoundToSkater controller = 2 Skater = <skaternumber> 
				VibrateController port = 2 actuator = <actuator> percent = <percent> 
			ELSE 
				IF ControllerBoundToSkater controller = 3 Skater = <skaternumber> 
					VibrateController port = 3 actuator = <actuator> percent = <percent> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Vibrate_Controller_Safe_Explicit actuator = 1 percent = 95 skaternumber = 0 
	IF ControllerBoundToSkater controller = 0 Skater = <skaternumber> 
		VibrateController port = 0 actuator = <actuator> percent = <percent> 
	ELSE 
		IF ControllerBoundToSkater controller = 1 Skater = <skaternumber> 
			VibrateController port = 1 actuator = <actuator> percent = <percent> 
		ELSE 
			IF ControllerBoundToSkater controller = 2 Skater = <skaternumber> 
				VibrateController port = 2 actuator = <actuator> percent = <percent> 
			ELSE 
				IF ControllerBoundToSkater controller = 3 Skater = <skaternumber> 
					VibrateController port = 3 actuator = <actuator> percent = <percent> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT


