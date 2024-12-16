
PreviousSfxLevel = 0 
cutscene_frame_advance_delay = 10 
todmanager_temp_tod_changed = 0 
TODManagerActiveBeforeCutscene = 0 
SCRIPT CutsceneFadeIn time = 0.00000000000 
	IF IsTrue output_cutscene_video 
		
		RETURN 
	ENDIF 
	
	KillSpawnedScript name = FadeInCutscene 
	spawnscript FadeInCutscene params = { fadein_time = <time> } 
ENDSCRIPT

SCRIPT CutsceneFadeOut time = 0.00000000000 
	IF IsTrue output_cutscene_video 
		
		RETURN 
	ENDIF 
	
	FadeOutCutscene fadeout_time = <time> 
ENDSCRIPT

SCRIPT FadeInCutscene 
	IF NOT GotParam fadein_time 
		script_assert "no fadein time" 
	ENDIF 
	IF NOT ( <fadein_time> = 0 ) 
		fadetoblack on time = 0.00000000000 alpha = 1.00000000000 
		fadetoblack off time = <fadein_time> 
	ELSE 
		fadetoblack off time = 0.00000000000 
	ENDIF 
ENDSCRIPT

SCRIPT FadeOutCutscene 
	KillSpawnedScript name = FadeInCutscene 
	IF NOT GotParam fadeout_time 
		script_assert "no fadeout time" 
	ENDIF 
	fadetoblack on time = <fadeout_time> alpha = 1.00000000000 
ENDSCRIPT

last_screen_mode = standard_screen_mode 
SCRIPT CutsceneDestroyUI 
	ScreenElementSystemCleanup no_panel_stuff 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT CutsceneRestoreUI 
	ScreenElementSystemCleanup 
ENDSCRIPT

SCRIPT CutsceneHideUI 
	IF NOT GameModeEquals is_classic 
		ResetScore 
	ENDIF 
	speech_box_exit { anchor_id = goal_start_dialog no_pad_start } 
	pause_bloom_on 
	hide_all_hud_items dont_disable_screen_effects 
	toggle_bullettime 
	TODManager_SetTempBloomParams on = 0 
	SetSlomo 1 
	menu3d_hide 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT CutsceneUnhideUI 
	show_all_hud_items 
	restore_start_key_binding 
ENDSCRIPT

SCRIPT cutscene_hide_objects 
ENDSCRIPT

SCRIPT cutscene_unhide_objects 
ENDSCRIPT

SCRIPT UnhideLoResHeads 
	Skater : SwitchOnAtomic skater_m_head 
	Skater : SwitchOnAtomic skater_f_head 
ENDSCRIPT

cutscene_is_playing = 0 
SCRIPT PreCutscene 
	change cutscene_is_playing = 1 
	IF GotParam name 
		IF StringEquals a = <name> b = "cutscenes\\au_5.cut" 
			set_temporary_nude_appearance 
		ENDIF 
	ENDIF 
	cutscene_deactivate_tod_manager 
	UnPauseMusicAndStreams 
	SetSfxReverb 0 mode = REV_MODE_CAVE 
	KillSpawnedScript name = wait_and_check_for_unplugged_controllers 
	change check_for_unplugged_controllers = 0 
	GetValueFromVolume sfxvol 
	change PreviousSfxLevel = <value> 
	change PreviousSfxLevel = ( PreviousSfxLevel * 10 ) 
	StopMusic 
	SetMusicStreamVolume PreviousSfxLevel 
	
	IF IsSoundPlaying TestLight01 
		
		SetSoundParams TestLight01 vol = 0 
	ENDIF 
	IF IsSoundPlaying TestLight02 
		
		SetSoundParams TestLight02 vol = 0 
	ENDIF 
	IF IsSoundPlaying TestMedium02 
		
		SetSoundParams TestMedium02 vol = 0 
	ENDIF 
	
	pause_rain 
	
	StopStream 
	Skater : SkaterLoopingSound_TurnOff 
	
	RunScriptOnComponentType component = SkaterLoopingSound target = SkaterLoopingSound_TurnOff 
	
	SetSfxVolume 0 
	
	Skater : VibrateOff 
	Skater : Obj_KillSpawnedScript name = BloodSmall 
	Skater : Obj_KillSpawnedScript name = BloodSplat 
	Skater : Obj_KillSpawnedScript name = SkaterBloodOn 
	Skater : ResetSkaterParticleSystems 
	CutsceneHideUI 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	Skater : StatsManager_DeactivateGoals 
	GoalManager_SetCanStartGoal 0 
	IF ( <unload_goals> = 1 ) 
		IF ( ( GameModeEquals is_classic ) | ( GameModeEquals is_singlesession ) | ( GameModeEquals is_creategoals ) ) 
			GoalManager_PauseAllGoals 
		ELSE 
			IF GameModeEquals is_career 
				GoalManager_UninitializeAllGoals 
			ENDIF 
		ENDIF 
	ENDIF 
	PauseObjects 
	PauseSpawnedScripts 
	Skater : SwitchOffAtomic skater_m_head 
	Skater : SwitchOffAtomic skater_f_head 
	Skater : SwitchOnBoard 
	Skater : Hide 
	Skater : StopSkaterVehicleSounds 
	KillSpawnedScript name = FadeInCutscene 
	IF ( <unload_anims> = 1 ) 
		IF InPreFile "skaterparts.pre" 
			UnloadPreFile "skaterparts.pre" 
			cutscene_skaterparts_unloaded = 1 
		ENDIF 
		do_unload_unloadable 
	ENDIF 
	IF isNGC 
		unload_current_theme 
	ENDIF 
	SetSfxReverb 0 mode = REV_MODE_CAVE 
ENDSCRIPT

SCRIPT CutsceneStartVideo 
	CutsceneHideUI 
	CutsceneFadeOut time = 0 
	SWITCH ( current_screen_mode ) 
		CASE standard_screen_mode 
			cutscene_fake_letterboxing 
			change last_screen_mode = standard_screen_mode 
		CASE widescreen_screen_mode 
			change last_screen_mode = widescreen_screen_mode 
		CASE letterbox_screen_mode 
			change last_screen_mode = letterbox_screen_mode 
		DEFAULT 
			
			script_assert "Unrecognized screen mode" 
	ENDSWITCH 
ENDSCRIPT

cutscene_skaterparts_unloaded = 0 
SCRIPT CutsceneKillObjects 
	IF IsArray CutsceneParticleTextures 
		GetArraySize CutsceneParticleTextures 
		IF ( <array_size> = 0 ) 
			
		ELSE 
			<index> = 0 
			BEGIN 
				<nameString> = ( CutsceneParticleTextures [ <index> ] ) 
				UnloadParticleTexture <nameString> 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	IF IsArray CutsceneObjectNames 
		GetArraySize CutsceneObjectNames 
		IF ( <array_size> = 0 ) 
			
		ELSE 
			<index> = 0 
			BEGIN 
				<name> = ( CutsceneObjectNames [ <index> ] ) 
				IF CompositeObjectExists name = <name> 
					<name> : Die 
				ELSE 
				ENDIF 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	FlushDeadObjects 
ENDSCRIPT

SCRIPT PostCutscene 
	cutscene_subtitle_cleanup 
	CutsceneUnhideUI 
	SetScreenEffectsDOFParams on = 0 
	spawnscript wait_and_check_for_unplugged_controllers 
	cutscene_reactivate_tod_manager 
	restore_start_key_binding 
	Skater : Obj_DisableAmbientLight 
	TODManager_RestoreCurrentTOD 
	SetSfxVolume PreviousSfxLevel 
	SetSfxReverb 0 mode = REV_MODE_CAVE 
	
	Skater : SkaterLoopingSound_TurnOn 
	
	RunScriptOnComponentType component = SkaterLoopingSound target = SkaterLoopingSound_TurnOn 
	IF isNGC 
		reload_current_theme 
	ENDIF 
	IF ( <reload_anims> = 1 ) 
		IF ( cutscene_skaterparts_unloaded = 1 ) 
			LoadPreFile "skaterparts.pre" 
			change cutscene_skaterparts_unloaded = 0 
		ENDIF 
		do_load_unloadable 
	ENDIF 
	fadetoblack off time = 0.00000000000 
	kill_cutscene_camera_hud 
	Skater : Unhide 
	Skater : SwitchOnAtomic skater_m_head 
	Skater : SwitchOnAtomic skater_f_head 
	IF GotParam RestartNode 
		ResetSkaters node_name = <RestartNode> 
	ENDIF 
	IF GameModeEquals is_classic 
		ResetSkaters 
	ENDIF 
	IF NOT Skater : IsSkaterOnVehicle 
		IF NOT GotParam dont_send_skater_to_hand_brake 
			IF NOT Skater : IsInBail 
				IF NOT Skater : Walking 
					Skater : OnGroundExceptions 
					MakeSkaterGoto HandBrake 
					Skater : StopBalanceTrick 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	UnpauseObjects 
	UnpauseSpawnedScripts 
	GoalManager_ShowPoints 
	GoalManager_ShowGoalPoints 
	GoalManager_SetCanStartGoal 1 
	Skater : StatsManager_ActivateGoals 
	IF ( <reload_goals> = 1 ) 
		IF ( ( GameModeEquals is_classic ) | ( GameModeEquals is_singlesession ) | ( GameModeEquals is_creategoals ) ) 
			GoalManager_UnPauseAllGoals 
			show_goal_panel_messages 
		ELSE 
			IF GameModeEquals is_career 
				GoalManager_InitializeAllGoals 
			ENDIF 
		ENDIF 
	ELSE 
		IF IsXbox 
			DisplayLoadingScreen Freeze 
		ELSE 
			DisplayLoadingScreen Blank 
		ENDIF 
	ENDIF 
	SWITCH ( last_screen_mode ) 
		CASE standard_screen_mode 
			cutscene_fake_letterboxing remove 
		CASE widescreen_screen_mode 
		CASE letterbox_screen_mode 
		DEFAULT 
			
			script_assert "Unrecognized screen mode" 
	ENDSWITCH 
	SetSfxReverb 0 mode = REV_MODE_CAVE 
	
	unpause_rain <...> 
	IF isNGC 
		IF GotParam name 
			IF StringEquals a = <name> b = "cutscenes\\no_7.cut" 
				RefreshSkaterModel profile = 0 Skater = 0 
			ENDIF 
		ENDIF 
	ENDIF 
	change cutscene_is_playing = 0 
	AllowBoneLOD allow = 1 
ENDSCRIPT

SCRIPT cutsceneobj_add_components 
	CreateComponentFromStructure component = cutsceneupdate 
	IF GotParam CutsceneDummy 
		RETURN 
	ENDIF 
	IF GotParam skeletonName 
		CreateComponentFromStructure component = skeleton <...> skeleton = <skeletonName> 
	ENDIF 
	IF GotParam isBlocking 
		IF NOT GotParam IsSkinnedModel 
			CreateComponentFromStructure component = model <...> UseModelLights max_scene_lights = 1 
		ELSE 
			CreateComponentFromStructure component = model <...> UseModelLights max_scene_lights = 1 
		ENDIF 
	ELSE 
		CreateComponentFromStructure component = model <...> 
	ENDIF 
	IF GotParam isBlocking 
		IF ( <isBlocking> = 0 ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cutscene_restore_skater_model_lights 
	
	Obj_DisableAmbientLight 
	Obj_DisableDiffuseLight index = 0 
	Obj_DisableDiffuseLight index = 1 
ENDSCRIPT

SCRIPT cutsceneobj_init_model 
	IF GotParam isBlocking 
		IF NOT GotParam CutsceneDummy 
			IF Obj_HasModelLights 
				IF NOT GotParam IsSkinnedModel 
					TODManager_GetCurrentTODParams 
					Obj_SetLightAmbientColor { 
						r = ( ( <tod_params> ) . ambient_red ) 
						g = ( ( <tod_params> ) . ambient_green ) 
						b = ( ( <tod_params> ) . ambient_blue ) 
					} 
					Obj_SetLightDiffuseColor { 
						index = 0 
						r = ( ( <tod_params> ) . red_0 ) 
						g = ( ( <tod_params> ) . green_0 ) 
						b = ( ( <tod_params> ) . blue_0 ) 
					} 
					Obj_SetLightDirection { 
						index = 0 
						heading = ( ( <tod_params> ) . heading_0 ) 
						pitch = ( ( <tod_params> ) . pitch_0 ) 
					} 
					Obj_SetLightDiffuseColor { 
						index = 1 
						r = ( ( <tod_params> ) . red_0 ) 
						g = ( ( <tod_params> ) . green_0 ) 
						b = ( ( <tod_params> ) . blue_0 ) 
					} 
					Obj_SetLightDirection { 
						index = 1 
						heading = ( ( <tod_params> ) . heading_1 ) 
						pitch = ( ( <tod_params> ) . pitch_1 ) 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT draw_cutscene_panel 
	IF ObjectExists id = vo_line1 
		SetScreenElementProps { id = vo_line1 text = <line1> } 
	ELSE 
		create_panel_message id = vo_line1 text = <line1> style = panel_message_viewobj_line params = { xy = PAIR(40.00000000000, 60.00000000000) } 
	ENDIF 
	IF ObjectExists id = vo_line2 
		SetScreenElementProps { id = vo_line2 text = <line2> } 
	ELSE 
		create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = { xy = PAIR(40.00000000000, 80.00000000000) } 
	ENDIF 
ENDSCRIPT

SCRIPT kill_cutscene_panel 
	IF ObjectExists id = vo_line1 
		RunScriptOnScreenElement id = vo_line1 kill_panel_message 
	ENDIF 
	IF ObjectExists id = vo_line2 
		RunScriptOnScreenElement id = vo_line2 kill_panel_message 
	ENDIF 
ENDSCRIPT

SCRIPT spawn_next_cutscene 
	PauseObjects 
	spawnscript start_next_cutscene params = { <...> } 
ENDSCRIPT

SCRIPT start_next_cutscene 
	IF GotParam Tod_Action 
		DisplayLoadingScreen Freeze 
	ENDIF 
	UnpauseObjects 
	PlayCutscene name = <name> unload_anims = <unload_anims> reload_anims = <reload_anims> exitScript = <exitScript> 
ENDSCRIPT

camera_hud_is_hidden = 0 
SCRIPT show_cutscene_camera_hud mins = 2 secs = 16 frames = 3 
	IF ScreenElementExists id = cutscene_camera_hud_anchor 
		DestroyScreenElement id = cutscene_camera_hud_anchor 
	ENDIF 
	IF GotParam for_goal 
		mins = 0 secs = 0 frames = 0 
		rec_alpha = 0 
		rec_pos = PAIR(500.00000000000, 90.00000000000) 
	ELSE 
		IF GotParam play 
			rec_alpha = 0 
		ELSE 
			rec_alpha = 1 
		ENDIF 
		rec_pos = PAIR(500.00000000000, 50.00000000000) 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		id = cutscene_camera_hud_anchor 
		parent = root_window 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = cutscene_camera_hud_anchor 
		id = video_screen 
		texture = videoscreen 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		scale = PAIR(5.00000000000, 10.00000000000) 
		alpha = 0.30000001192 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = camera_hud_line 
		parent = cutscene_camera_hud_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left center ] 
		scale = PAIR(100.00000000000, 0.10000000149) 
		alpha = 0.50000000000 
	} 
	IF GotParam play 
		CreateScreenElement { 
			type = TextElement 
			parent = cutscene_camera_hud_anchor 
			id = play 
			pos = <rec_pos> 
			text = "PLAY" 
			font = small 
			just = [ left top ] 
			scale = 1.50000000000 
			rgba = [ 100 100 100 128 ] 
			alpha = 0.80000001192 
		} 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		id = rec_anchor 
		parent = cutscene_camera_hud_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		alpha = <rec_alpha> 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = rec_anchor 
		id = rec 
		pos = <rec_pos> 
		text = "REC" 
		font = small 
		just = [ left top ] 
		scale = 1.50000000000 
		rgba = [ 100 0 0 128 ] 
		alpha = 0.80000001192 
	} 
	GetStackedScreenElementPos X id = rec offset = PAIR(10.00000000000, 16.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		id = rec_dot 
		parent = rec_anchor 
		texture = recdot 
		pos = <pos> 
		just = [ left center ] 
		scale = 1.50000000000 
		alpha = 0.80000001192 
	} 
	scale = 1.50000000000 
	alpha = 0.60000002384 
	font = dialog 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		id = mins2 
		pos = PAIR(450.00000000000, 355.00000000000) 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		id = mins 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(5.00000000000, -2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		pos = <pos> 
		text = ":" 
		font = <font> 
		just = [ left top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		id = secs2 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		id = secs 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(5.00000000000, -2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		pos = <pos> 
		text = ":" 
		font = <font> 
		just = [ left top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		id = frames2 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = cutscene_camera_hud_anchor 
		id = frames 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	mins2 = ( <mins> / 10 ) 
	mins1 = ( <mins> - ( <mins2> * 10 ) ) 
	secs2 = ( <secs> / 10 ) 
	secs1 = ( <secs> - ( <secs2> * 10 ) ) 
	frames2 = ( <frames> / 10 ) 
	frames1 = ( <frames> - ( <frames2> * 10 ) ) 
	FormatText textname = min_text "%m" m = <mins1> 
	SetScreenElementProps id = mins text = <min_text> 
	FormatText textname = min_text "%m" m = <mins2> 
	SetScreenElementProps id = mins2 text = <min_text> 
	FormatText textname = sec_text "%s" s = <secs1> 
	SetScreenElementProps id = secs text = <sec_text> 
	FormatText textname = sec_text "%s" s = <secs2> 
	SetScreenElementProps id = secs2 text = <sec_text> 
	FormatText textname = frame_text "%f" f = <frames1> 
	SetScreenElementProps id = frames text = <frame_text> 
	FormatText textname = frame_text "%f" f = <frames2> 
	SetScreenElementProps id = frames2 text = <frame_text> 
	mins : SetTags frames = <frames> secs = <secs> mins = <mins> 
	IF GotParam fade 
		RunScriptOnScreenElement id = rec_dot cutscene_camera_hud_fade_in 
	ENDIF 
	RunScriptOnScreenElement id = video_screen flicker_video_screen 
	RunScriptOnScreenElement id = camera_hud_line morph_camera_hud_line 
	RunScriptOnScreenElement id = rec_dot blink_rec_dot 
	IF NOT GotParam for_goal 
		RunScriptOnScreenElement id = secs camera_hud_count 
	ENDIF 
ENDSCRIPT

SCRIPT kill_cutscene_camera_hud 
	IF GotParam fade 
		RunScriptOnScreenElement id = rec_dot fadetoblack params = { on time = 0.50000000000 alpha = 1.00000000000 z_priority = 5 } 
		RunScriptOnScreenElement id = rec_dot really_kill_cutscene_camera_hud 
	ELSE 
		IF ScreenElementExists id = cutscene_camera_hud_anchor 
			DestroyScreenElement id = cutscene_camera_hud_anchor 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cutscene_camera_hud_fade_in 
	fadetoblack on time = 0 alpha = 1.00000000000 z_priority = 5 
	wait 0.20000000298 seconds 
	fadetoblack off time = 0.50000000000 
ENDSCRIPT

SCRIPT really_kill_cutscene_camera_hud 
	wait 0.69999998808 seconds 
	fadetoblack off time = 0 
	IF ScreenElementExists id = cutscene_camera_hud_anchor 
		DestroyScreenElement id = cutscene_camera_hud_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT hide_cutscene_camera_hud 
	IF ScreenElementExists id = cutscene_camera_hud_anchor 
		DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_cutscene_camera_hud 
	IF ScreenElementExists id = cutscene_camera_hud_anchor 
		DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 1 
	ENDIF 
ENDSCRIPT

SCRIPT blink_rec_dot 
	BEGIN 
		DoScreenElementMorph id = rec_dot alpha = 0.80000001192 
		wait 0.50000000000 seconds 
		DoScreenElementMorph id = rec_dot alpha = 0 
		wait 0.50000000000 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT flicker_video_screen time = 0.05000000075 
	BEGIN 
		DoScreenElementMorph id = video_screen alpha = 0.30000001192 time = <time> 
		wait <time> seconds 
		DoScreenElementMorph id = video_screen alpha = 0.22499999404 time = <time> 
		wait <time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT morph_camera_hud_line time = 1.50000000000 
	BEGIN 
		DoScreenElementMorph id = camera_hud_line pos = PAIR(0.00000000000, 480.00000000000) time = <time> 
		wait <time> seconds 
		DoScreenElementMorph id = camera_hud_line pos = PAIR(0.00000000000, 0.00000000000) 
	REPEAT 
ENDSCRIPT

SCRIPT camera_hud_count up = 1 
	IF ( <up> = 1 ) 
		<action> = camera_hud_count_one 
	ELSE 
		<action> = camera_hud_count_minus_one 
	ENDIF 
	BEGIN 
		wait 2 gameframes 
		<action> 
		IF GotParam done 
			BREAK 
		ENDIF 
	REPEAT 
	mins : GetTags 
	<callback> <callback_params> 
ENDSCRIPT

SCRIPT camera_hud_count_one 
	mins : GetTags 
	frames = ( <frames> + 1 ) 
	IF ( <frames> > 29 ) 
		frames = 0 
		secs = ( <secs> + 1 ) 
		IF ( <secs> > 59 ) 
			secs = 0 
			mins = ( <mins> + 1 ) 
			mins2 = ( <mins> / 10 ) 
			mins1 = ( <mins> - ( <mins2> * 10 ) ) 
			FormatText textname = min_text "%m" m = <mins1> 
			SetScreenElementProps id = mins text = <min_text> 
			FormatText textname = min_text "%m" m = <mins2> 
			SetScreenElementProps id = mins2 text = <min_text> 
		ENDIF 
		secs2 = ( <secs> / 10 ) 
		secs1 = ( <secs> - ( <secs2> * 10 ) ) 
		FormatText textname = sec_text "%s" s = <secs1> 
		SetScreenElementProps id = secs text = <sec_text> 
		FormatText textname = sec_text "%s" s = <secs2> 
		SetScreenElementProps id = secs2 text = <sec_text> 
	ENDIF 
	frames2 = ( <frames> / 10 ) 
	frames1 = ( <frames> - ( <frames2> * 10 ) ) 
	FormatText textname = frame_text "%f" f = <frames1> 
	SetScreenElementProps id = frames text = <frame_text> 
	FormatText textname = frame_text "%f" f = <frames2> 
	SetScreenElementProps id = frames2 text = <frame_text> 
	mins : SetTags frames = <frames> secs = <secs> mins = <mins> 
ENDSCRIPT

SCRIPT camera_hud_count_minus_one 
	mins : GetTags 
	IF ( <mins> < 1 ) 
		IF ( <secs> < 1 ) 
			IF ( <frames> < 1 ) 
				RETURN done = done 
			ENDIF 
		ENDIF 
	ENDIF 
	frames = ( <frames> - 1 ) 
	IF ( <frames> < 0 ) 
		frames = 29 
		secs = ( <secs> - 1 ) 
		IF ( <secs> < 0 ) 
			secs = 59 
			mins = ( <mins> - 1 ) 
			mins2 = ( <mins> / 10 ) 
			mins1 = ( <mins> - ( <mins2> * 10 ) ) 
			FormatText textname = min_text "%m" m = <mins1> 
			SetScreenElementProps id = mins text = <min_text> 
			FormatText textname = min_text "%m" m = <mins2> 
			SetScreenElementProps id = mins2 text = <min_text> 
		ENDIF 
		secs2 = ( <secs> / 10 ) 
		secs1 = ( <secs> - ( <secs2> * 10 ) ) 
		FormatText textname = sec_text "%s" s = <secs1> 
		SetScreenElementProps id = secs text = <sec_text> 
		FormatText textname = sec_text "%s" s = <secs2> 
		SetScreenElementProps id = secs2 text = <sec_text> 
	ENDIF 
	frames2 = ( <frames> / 10 ) 
	frames1 = ( <frames> - ( <frames2> * 10 ) ) 
	FormatText textname = frame_text "%f" f = <frames1> 
	SetScreenElementProps id = frames text = <frame_text> 
	FormatText textname = frame_text "%f" f = <frames2> 
	SetScreenElementProps id = frames2 text = <frame_text> 
	mins : SetTags frames = <frames> secs = <secs> mins = <mins> 
ENDSCRIPT

SCRIPT camera_hud_breakup_frames 
	IF NOT ScreenElementExists id = mins 
		RETURN 
	ENDIF 
	IF ( <millisecs> > 60000 ) 
		mins = ( <millisecs> / 6000 ) 
		millisecs = ( <millisecs> - ( <mins> * 6000 ) ) 
	ELSE 
		mins = 0 
	ENDIF 
	IF ( <millisecs> > 1000 ) 
		secs = ( <millisecs> / 1000 ) 
		millisecs = ( <millisecs> - ( <secs> * 1000 ) ) 
	ELSE 
		secs = 0 
	ENDIF 
	frames = ( <millisecs> / 17 ) 
	mins2 = ( <mins> / 10 ) 
	mins1 = ( <mins> - ( <mins2> * 10 ) ) 
	FormatText textname = min_text "%m" m = <mins1> 
	SetScreenElementProps id = mins text = <min_text> 
	FormatText textname = min_text "%m" m = <mins2> 
	SetScreenElementProps id = mins2 text = <min_text> 
	secs2 = ( <secs> / 10 ) 
	secs1 = ( <secs> - ( <secs2> * 10 ) ) 
	FormatText textname = sec_text "%s" s = <secs1> 
	SetScreenElementProps id = secs text = <sec_text> 
	FormatText textname = sec_text "%s" s = <secs2> 
	SetScreenElementProps id = secs2 text = <sec_text> 
	frames2 = ( <frames> / 10 ) 
	frames1 = ( <frames> - ( <frames2> * 10 ) ) 
	FormatText textname = frame_text "%f" f = <frames1> 
	SetScreenElementProps id = frames text = <frame_text> 
	FormatText textname = frame_text "%f" f = <frames2> 
	SetScreenElementProps id = frames2 text = <frame_text> 
ENDSCRIPT

SCRIPT really_kill_cutscene_hangover_hud 
	setscreenblur 0 
	wait 0.69999998808 seconds 
	fadetoblack off time = 0 
	IF ScreenElementExists id = cutscene_hangover_hud_anchor 
		DestroyScreenElement id = cutscene_hangover_hud_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT show_videointro_hud 
	IF ScreenElementExists id = videointro_hud_anchor 
		DestroyScreenElement id = videointro_hud_anchor 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		id = videointro_hud_anchor 
		parent = root_window 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = videointro_hud_anchor 
		id = videointro_black 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		scale = PAIR(200.00000000000, 200.00000000000) 
		rgba = [ 0 0 0 128 ] 
		z_priority = -5 
		alpha = 1 
		z_priority = 50000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = videointro_hud_anchor 
		id = bg_icon 
		texture = go_fail 
		pos = PAIR(320.00000000000, 250.00000000000) 
		just = [ center center ] 
		scale = PAIR(1.20000004768, 1.20000004768) 
		rgba = [ 128 128 128 10 ] 
		z_priority = 500013 
		rot_angle = 5 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = videointro_hud_anchor 
		id = peralta_name 
		pos = PAIR(150.00000000000, 190.00000000000) 
		text = "Peralta Productions Presents" 
		font = dialog 
		just = [ left , top ] 
		scale = 1.10000002384 
		rgba = [ 128 128 128 100 ] 
		z_priority = 1397 
		z_priority = 50004 
	} 
	RunScriptOnScreenElement id = peralta_name flicker_textintro 
	RunScriptOnScreenElement id = bg_icon flicker_skullintro 
ENDSCRIPT

SCRIPT videointro_hud_fade_in 
	setscreenblur 70 
	fadetoblack on time = 0 alpha = 1.00000000000 z_priority = 10000 
	make_black_in2 
	wait 1.39999997616 seconds 
	show_videointro_hud 
	make_black_out2 
	wait 0.20000000298 seconds 
	fadetoblack off time = 0.50000000000 
ENDSCRIPT

SCRIPT really_kill_videointro_hud 
	setscreenblur 1 
	make_black_out2 
	fadetoblack off time = 0.30000001192 
	IF ScreenElementExists id = videointro_hud_anchor 
		DestroyScreenElement id = videointro_hud_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT flicker_textintro time = 0.05000000075 
	BEGIN 
		DoScreenElementMorph id = peralta_name alpha = 1 time = <time> pos = PAIR(150.00000000000, 189.00000000000) 
		wait <time> seconds 
		DoScreenElementMorph id = peralta_name alpha = 0.69999998808 time = <time> pos = PAIR(150.00000000000, 190.00000000000) 
		wait <time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT flicker_skullintro time = 0.05000000075 
	BEGIN 
		DoScreenElementMorph id = bg_icon alpha = 1 time = <time> 
		wait <time> seconds 
		DoScreenElementMorph id = bg_icon alpha = 0.69999998808 time = <time> 
		wait <time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT show_videointro_hud2 
	IF ScreenElementExists id = videointro_hud_anchor2 
		DestroyScreenElement id = videointro_hud_anchor2 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		id = videointro_hud_anchor2 
		parent = root_window 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		z_priority = 50 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = videointro_hud_anchor2 
		id = videointro_black2 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		scale = PAIR(200.00000000000, 200.00000000000) 
		rgba = [ 0 0 0 128 ] 
		z_priority = -5 
		alpha = 1 
		z_priority = 50000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = videointro_hud_anchor2 
		id = star1 
		texture = PA_goals 
		pos = PAIR(100.00000000000, 110.00000000000) 
		just = [ center center ] 
		scale = PAIR(2.00000000000, 2.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		rot_angle = -3 
		z_priority = 50003 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = videointro_hud_anchor2 
		id = star2 
		texture = PA_goals 
		pos = PAIR(480.00000000000, 310.00000000000) 
		just = [ center center ] 
		scale = PAIR(2.00000000000, 2.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.89999997616 
		rot_angle = -7 
		z_priority = 50004 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = videointro_hud_anchor2 
		id = star3 
		texture = PA_goals 
		pos = PAIR(430.00000000000, 120.00000000000) 
		just = [ center center ] 
		scale = PAIR(1.29999995232, 1.29999995232) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		rot_angle = 18 
		z_priority = 50004 
	} 
	GoalManager_GetTeam 
	CreateScreenElement { 
		type = TextElement 
		parent = videointro_hud_anchor2 
		id = team name 
		pos = PAIR(310.00000000000, 190.00000000000) 
		text = ( <team> . team_name ) 
		font = small 
		just = [ center top ] 
		scale = 2.20000004768 
		rgba = [ 128 77 0 100 ] 
		z_priority = 50008 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = videointro_hud_anchor2 
		id = a 
		pos = PAIR(110.00000000000, 120.00000000000) 
		text = "A" 
		font = dialog 
		just = [ left , top ] 
		scale = 1.50000000000 
		rgba = [ 128 73 0 88 ] 
		z_priority = 50009 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = videointro_hud_anchor2 
		id = videoname 
		pos = PAIR(420.00000000000, 245.00000000000) 
		text = "VIDEO" 
		font = dialog 
		just = [ left , top ] 
		scale = 2.50000000000 
		rgba = [ 128 73 0 78 ] 
		z_priority = 50009 
	} 
ENDSCRIPT

SCRIPT videointro_hud_fade_in2 
	setscreenblur 20 
	fadetoblack on time = 0 alpha = 1.00000000000 z_priority = 100000 
	make_black_in 
	wait 0.02500000037 seconds 
	show_videointro_hud2 
	make_black_out 
	wait 0.20000000298 seconds 
	fadetoblack off time = 0.20000000298 
ENDSCRIPT

SCRIPT really_kill_videointro_hud2 
	setscreenblur 4 
	IF ScreenElementExists id = videointro_hud_anchor2 
		DestroyScreenElement id = videointro_hud_anchor2 
	ENDIF 
ENDSCRIPT

SCRIPT make_black_in 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = videointro_black3 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		scale = PAIR(200.00000000000, 200.00000000000) 
		rgba = [ 0 0 0 128 ] 
		z_priority = -5 
		alpha = 0 
		z_priority = 4560040 
	} 
	DoScreenElementMorph id = videointro_black3 alpha = 1 time = 0 
ENDSCRIPT

SCRIPT kill_black 
	DestroyScreenElement id = videointro_black3 
ENDSCRIPT

SCRIPT make_black_out 
	DoScreenElementMorph id = videointro_black3 alpha = 0 time = 0.50000000000 
ENDSCRIPT

SCRIPT make_black_in2 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = videointro_black4 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		scale = PAIR(200.00000000000, 200.00000000000) 
		rgba = [ 0 0 0 128 ] 
		z_priority = -5 
		alpha = 0 
		z_priority = 160080 
	} 
	DoScreenElementMorph id = videointro_black4 alpha = 1 time = 0 
ENDSCRIPT

SCRIPT make_black_out2 
	DoScreenElementMorph id = videointro_black4 alpha = 0 time = 0 
ENDSCRIPT

SCRIPT kill_black2 
	DestroyScreenElement id = videointro_black4 
ENDSCRIPT

SCRIPT show_underground_hud 
	IF ScreenElementExists id = underground_hud_anchor 
		DestroyScreenElement id = underground_hud_anchor 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		id = underground_hud_anchor 
		parent = root_window 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = underground_hud_anchor 
		id = underground_black 
		texture = white2 
		pos = PAIR(-30.00000000000, 63.00000000000) 
		just = [ top left ] 
		scale = PAIR(100.00000000000, 38.20000076294) 
		rgba = [ 2 8 12 128 ] 
		z_priority = -5 
		alpha = 1 
		z_priority = 1000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = underground_hud_anchor 
		id = underground_black2 
		texture = white2 
		pos = PAIR(240.00000000000, 63.00000000000) 
		just = [ center center ] 
		scale = PAIR(100.00000000000, 200.00000000000) 
		rgba = [ 0 0 0 128 ] 
		z_priority = -5 
		alpha = 1 
		z_priority = 100000000 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = under_1 
		pos = PAIR(52.00000000000, 190.00000000000) 
		text = "UNDERGROUND" 
		font = testtitle 
		just = [ left , top ] 
		scale = ( 2 ) 
		rgba = [ 114 23 13 128 ] 
		alpha = 0 
		z_priority = 10000003 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = under_2 
		pos = PAIR(52.00000000000, 190.00000000000) 
		text = "UNDERGROUND" 
		font = testtitle 
		just = [ left , top ] 
		scale = ( 3 ) 
		rgba = [ 60 60 60 98 ] 
		alpha = 0 
		z_priority = 10000003 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = underground_hud_anchor 
		id = understar_1 
		texture = PA_goals 
		pos = PAIR(730.00000000000, 210.00000000000) 
		just = [ center center ] 
		scale = PAIR(1.29999995232, 1.29999995232) 
		rgba = [ 128 0 0 128 ] 
		alpha = 1 
		rot_angle = 18 
		z_priority = 10000001 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = underground_hud_anchor 
		id = understar_2 
		texture = PA_goals 
		pos = PAIR(-250.00000000000, 210.00000000000) 
		just = [ center center ] 
		scale = PAIR(1.29999995232, 1.29999995232) 
		rgba = [ 128 0 0 128 ] 
		alpha = 1 
		rot_angle = 18 
		z_priority = 10000001 
	} 
	GetTeamNames 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = skater_name_1 
		pos = PAIR(52.00000000000, 70.00000000000) 
		text = <team_name1> 
		font = small 
		just = [ left , top ] 
		scale = PAIR(1.29999995232, 2.00000000000) 
		rgba = [ 80 80 80 98 ] 
		z_priority = 10000001 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = skater_name_2 
		pos = PAIR(-200.00000000000, 270.00000000000) 
		text = <team_name2> 
		font = small 
		just = [ left , top ] 
		scale = PAIR(1.60000002384, 2.20000004768) 
		rgba = [ 80 80 80 98 ] 
		z_priority = 10000001 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = skater_name_3 
		pos = PAIR(300.00000000000, 600.00000000000) 
		text = <team_name3> 
		font = small 
		just = [ left , top ] 
		scale = PAIR(2.29999995232, 3.00000000000) 
		rgba = [ 80 80 80 98 ] 
		z_priority = 10000001 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = skater_name_4 
		pos = PAIR(100.00000000000, -600.00000000000) 
		text = <team_name4> 
		font = small 
		just = [ left , top ] 
		scale = PAIR(1.29999995232, 2.00000000000) 
		rgba = [ 80 80 80 98 ] 
		z_priority = 10000001 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = underground_hud_anchor 
		id = skater_name_5 
		pos = PAIR(320.00000000000, 170.00000000000) 
		text = <team_name5> 
		font = small 
		just = [ center , center ] 
		scale = PAIR(1.29999995232, 2.00000000000) 
		rgba = [ 80 80 80 98 ] 
		alpha = 0 
		z_priority = 10000001 
	} 
	RunScriptOnScreenElement id = underground_black2 fadeinout 
	build_top_and_bottom_blocks parent = underground_hud_anchor top_z = 100000 bot_z = 100000 
	RunScriptOnScreenElement id = under_1 underground_fly_in 
	RunScriptOnScreenElement id = under_2 underground_fly_in2 
	RunScriptOnScreenElement id = skater_name_1 skater_name_fly_1 
	RunScriptOnScreenElement id = skater_name_2 skater_name_fly_2 
	RunScriptOnScreenElement id = skater_name_3 skater_name_fly_3 
	RunScriptOnScreenElement id = skater_name_4 skater_name_fly_4 
	RunScriptOnScreenElement id = skater_name_5 skater_name_fly_5 
	RunScriptOnScreenElement id = understar_1 star_fly_1 
	RunScriptOnScreenElement id = understar_2 star_fly_2 
ENDSCRIPT

SCRIPT underground_fly_in 
	wait 1 second 
	DoScreenElementMorph id = under_1 alpha = 0 time = 0 scale = 8 
	DoScreenElementMorph id = under_1 alpha = 0.89999997616 time = 0.30000001192 scale = 3 
	wait 4.50000000000 second 
	DoScreenElementMorph id = under_1 alpha = 0 scale = PAIR(20.00000000000, 3.00000000000) time = 0.20000000298 
ENDSCRIPT

SCRIPT underground_fly_in2 
	wait 1 second 
	DoScreenElementMorph id = under_2 alpha = 0 time = 0 pos = PAIR(700.00000000000, 190.00000000000) 
	DoScreenElementMorph id = under_2 alpha = 0.89999997616 time = 0.40000000596 pos = PAIR(52.00000000000, 190.00000000000) 
	wait 3.00000000000 second 
	DoScreenElementMorph id = under_2 alpha = 0 time = 0.20000000298 
ENDSCRIPT

SCRIPT skater_name_fly_1 
	DoScreenElementMorph id = skater_name_1 alpha = 0 time = 0 pos = PAIR(700.00000000000, 70.00000000000) 
	DoScreenElementMorph id = skater_name_1 alpha = 0.60000002384 time = 6.19999980927 scale = PAIR(5.00000000000, 5.00000000000) pos = PAIR(-650.00000000000, 70.00000000000) 
ENDSCRIPT

SCRIPT skater_name_fly_2 
	DoScreenElementMorph id = skater_name_2 alpha = 0 time = 0 pos = PAIR(-200.00000000000, 270.00000000000) 
	DoScreenElementMorph id = skater_name_2 alpha = 0.50000000000 time = 5.80000019073 pos = PAIR(1000.00000000000, 270.00000000000) 
ENDSCRIPT

SCRIPT skater_name_fly_3 
	DoScreenElementMorph id = skater_name_3 alpha = 0 time = 0 pos = PAIR(300.00000000000, 600.00000000000) 
	DoScreenElementMorph id = skater_name_3 alpha = 0.55000001192 time = 6.40000009537 pos = PAIR(300.00000000000, -600.00000000000) 
ENDSCRIPT

SCRIPT skater_name_fly_4 
	DoScreenElementMorph id = skater_name_4 alpha = 0 time = 0 pos = PAIR(100.00000000000, -600.00000000000) 
	DoScreenElementMorph id = skater_name_4 alpha = 0.40000000596 time = 6.19999980927 scale = PAIR(4.80000019073, 4.80000019073) pos = PAIR(100.00000000000, 600.00000000000) 
ENDSCRIPT

SCRIPT skater_name_fly_5 
	wait 2 second 
	DoScreenElementMorph id = skater_name_5 alpha = 0.69999998808 time = 0 scale = 9 pos = PAIR(320.00000000000, 170.00000000000) 
	DoScreenElementMorph id = skater_name_5 alpha = 0 time = 3.50000000000 scale = 0 pos = PAIR(320.00000000000, 170.00000000000) 
ENDSCRIPT

SCRIPT star_fly_1 
	wait 1 second 
	DoScreenElementMorph id = understar_1 alpha = 0.50000000000 time = 0 pos = PAIR(730.00000000000, 210.00000000000) rot_angle = 0 
	DoScreenElementMorph id = understar_1 alpha = 0.94999998808 time = 2.79999995232 scale = PAIR(2.29999995232, 2.29999995232) pos = PAIR(-250.00000000000, 210.00000000000) rot_angle = 720 
ENDSCRIPT

SCRIPT star_fly_2 
	wait 1.50000000000 second 
	DoScreenElementMorph id = understar_2 alpha = 0.50000000000 time = 0 pos = PAIR(-250.00000000000, 210.00000000000) rot_angle = 0 
	DoScreenElementMorph id = understar_2 alpha = 0.80000001192 time = 1.79999995232 scale = PAIR(2.29999995232, 2.29999995232) pos = PAIR(720.00000000000, 210.00000000000) rot_angle = -720 
ENDSCRIPT

SCRIPT fadeinout 
	wait 0.60000002384 second 
	DoScreenElementMorph id = underground_black2 alpha = 0 time = 0 
	DoScreenElementMorph id = underground_black2 alpha = 1 time = 0.20000000298 
	DoScreenElementMorph id = underground_black2 alpha = 0 time = 0.10000000149 
ENDSCRIPT

SCRIPT GetTeamNames 
	GoalManager_GetTeam 
	GetArraySize master_skater_list 
	index = 0 
	index2 = 0 
	BEGIN 
		name = ( master_skater_list [ <index> ] . name ) 
		IF StructureContains structure = <team> <name> 
			SWITCH <index2> 
				CASE 0 
					team_name1 = ( master_skater_list [ <index> ] . display_name ) 
				CASE 1 
					team_name2 = ( master_skater_list [ <index> ] . display_name ) 
				CASE 2 
					team_name3 = ( master_skater_list [ <index> ] . display_name ) 
				CASE 3 
					team_name4 = ( master_skater_list [ <index> ] . display_name ) 
				CASE 4 
					team_name5 = ( master_skater_list [ <index> ] . display_name ) 
				DEFAULT 
					RETURN 
			ENDSWITCH 
			index2 = ( <index2> + 1 ) 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RemoveParameter name 
	RemoveParameter team 
	RemoveParameter num_team_members 
	RemoveParameter index 
	RemoveParameter index2 
	RemoveParameter array_size 
	RETURN <...> 
ENDSCRIPT

nightvision_hud_is_hidden = 0 
SCRIPT nightvision_hud 
	IF ScreenElementExists id = nightvision_hud_anchor 
		DestroyScreenElement id = nightvision_hud_anchor 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		id = nightvision_hud_anchor 
		parent = root_window 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = nightvision_hud_line 
		parent = nightvision_hud_anchor 
		texture = white2 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left center ] 
		scale = PAIR(100.00000000000, 0.10000000149) 
		alpha = 0.50000000000 
	} 
	RunScriptOnScreenElement id = nightvision_hud_line morph_nightvision_hud_line 
ENDSCRIPT

SCRIPT really_kill_flicker_nightvision_hud 
	wait 0.69999998808 seconds 
	fadetoblack off time = 0 
	IF ScreenElementExists id = nightvision_hud_anchor 
		DestroyScreenElement id = nightvision_hud_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT morph_nightvision_hud_line time = 1.50000000000 
	BEGIN 
		DoScreenElementMorph id = nightvision_hud_line pos = PAIR(0.00000000000, 480.00000000000) time = <time> 
		wait <time> seconds 
		DoScreenElementMorph id = nightvision_hud_line pos = PAIR(0.00000000000, 0.00000000000) 
	REPEAT 
ENDSCRIPT

SCRIPT play_cutscene 
	IF IsObjectScript 
		Obj_GetId 
		
		
		
		
		
		spawnscript play_cutscene_from_gameplay params = { <...> } 
	ELSE 
		PlayCutscene <...> 
	ENDIF 
ENDSCRIPT

SCRIPT play_cutscene_from_gameplay 
	IF NOT GotParam name 
		script_assert "missing name parameter for cutscene" 
	ENDIF 
	PlayCutscene <...> 
ENDSCRIPT

SCRIPT cutscene_deactivate_tod_manager 
	TODManager_GetCurrentTODParams 
	<active> = ( <tod_params> . active ) 
	change TODManagerActiveBeforeCutscene = <active> 
	TODManager_SetActive 0 
ENDSCRIPT

SCRIPT cutscene_reactivate_tod_manager 
	IF ( TODManagerActiveBeforeCutscene = 1 ) 
		TODManager_SetActive 1 
	ENDIF 
	TODManager_SetTempBloomParams on = 0 
ENDSCRIPT

SCRIPT cutscene_set_pad_event_handlers 
	IF NOT CD 
		SetScreenElementLock id = root_window off 
		IF ScreenElementExists id = cutscene_anchor 
			DestroyScreenElement id = cutscene_anchor 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = cutscene_anchor 
		} 
		SetScreenElementProps { 
			id = cutscene_anchor 
			event_handlers = [ 
				{ pad_start cutscene_pause } 
			] 
			replace_handlers 
		} 
		FireEvent type = focus target = cutscene_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT cutscene_pause 
	
	PauseCutscene toggle 
ENDSCRIPT

SCRIPT cutscene_frame_advance 
	Cutscene_FrameAdvance 
ENDSCRIPT

SCRIPT cutscene_clear_pad_event_handlers 
	IF NOT CD 
		IF ScreenElementExists id = cutscene_anchor 
			DestroyScreenElement id = cutscene_anchor 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cutscene_fake_letterboxing 
	IF ScreenElementExists id = letterbox_anchor 
		DestroyScreenElement id = letterbox_anchor 
	ENDIF 
	IF GotParam remove 
		SetScreen angle = 72.00000000000 aspect = 1.33333337307 
		RETURN 
	ELSE 
		SetScreen angle = 88.18000030518 aspect = 1.33333337307 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		id = letterbox_anchor 
		parent = root_window 
		z_priority = 999 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = letterbox_anchor 
		texture = white2 
		scale = PAIR(100.00000000000, 9.50000000000) 
		pos = PAIR(0.00000000000, -20.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = 15 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = letterbox_anchor 
		texture = white2 
		scale = PAIR(100.00000000000, 12.00000000000) 
		pos = PAIR(0.00000000000, 392.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = 15 
	} 
ENDSCRIPT

SCRIPT cutscene_kill_spawned_script 
	KillSpawnedScript id = <id> 
ENDSCRIPT

SCRIPT create_digital_timer pos = PAIR(50.00000000000, 100.00000000000) scale = 1.50000000000 alpha = 0.60000002384 font = dialog rgba = [ 128 128 128 128 ] mins = 2 secs = 16 frames = 3 
	IF ScreenElementExists id = digital_timer_anchor 
		DestroyScreenElement id = digital_timer_anchor 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		id = digital_timer_anchor 
		parent = root_window 
		pos = <pos> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		id = mins2 
		pos = PAIR(0.00000000000, 0.00000000000) 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		id = mins 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(5.00000000000, -2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		pos = <pos> 
		text = ":" 
		font = <font> 
		just = [ left top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		id = secs2 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		id = secs 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(5.00000000000, -2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		pos = <pos> 
		text = ":" 
		font = <font> 
		just = [ left top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 2.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		id = frames2 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(23.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = digital_timer_anchor 
		id = frames 
		pos = <pos> 
		text = "0" 
		font = <font> 
		just = [ right top ] 
		scale = <scale> 
		alpha = <alpha> 
		rgba = <rgba> 
	} 
	<mins2> = ( <mins> / 10 ) 
	<mins1> = ( <mins> - ( <mins2> * 10 ) ) 
	<secs2> = ( <secs> / 10 ) 
	<secs1> = ( <secs> - ( <secs2> * 10 ) ) 
	<frames2> = ( <frames> / 10 ) 
	<frames1> = ( <frames> - ( <frames2> * 10 ) ) 
	FormatText textname = min_text "%m" m = <mins1> 
	SetScreenElementProps id = mins text = <min_text> 
	FormatText textname = min_text "%m" m = <mins2> 
	SetScreenElementProps id = mins2 text = <min_text> 
	FormatText textname = sec_text "%s" s = <secs1> 
	SetScreenElementProps id = secs text = <sec_text> 
	FormatText textname = sec_text "%s" s = <secs2> 
	SetScreenElementProps id = secs2 text = <sec_text> 
	FormatText textname = frame_text "%f" f = <frames1> 
	SetScreenElementProps id = frames text = <frame_text> 
	FormatText textname = frame_text "%f" f = <frames2> 
	SetScreenElementProps id = frames2 text = <frame_text> 
	mins : SetTags frames = <frames> secs = <secs> mins = <mins> callback = <callback> callback_params = <callback_params> 
	RunScriptOnScreenElement id = secs camera_hud_count params = { up = 0 } 
ENDSCRIPT

SCRIPT reset_digital_timer 
	KillSpawnedScript name = camera_hud_count 
	IF ScreenElementExists id = mins 
		IF GotParam frames 
			IF NOT GotParam secs 
				mins : GetSingleTag secs 
			ENDIF 
			BEGIN 
				IF ( <frames> > 29 ) 
					<secs> = ( <secs> + 1 ) 
					<frames> = ( <frames> - 29 ) 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT 
			<frames2> = ( <frames> / 10 ) 
			<frames1> = ( <frames> - ( <frames2> * 10 ) ) 
			FormatText textname = frame_text "%f" f = <frames1> 
			SetScreenElementProps id = frames text = <frame_text> 
			FormatText textname = frame_text "%f" f = <frames2> 
			SetScreenElementProps id = frames2 text = <frame_text> 
			mins : SetTags frames = <frames> 
		ENDIF 
		IF GotParam secs 
			<secs2> = ( <secs> / 10 ) 
			<secs1> = ( <secs> - ( <secs2> * 10 ) ) 
			FormatText textname = sec_text "%s" s = <secs1> 
			SetScreenElementProps id = secs text = <sec_text> 
			FormatText textname = sec_text "%s" s = <secs2> 
			SetScreenElementProps id = secs2 text = <sec_text> 
			mins : SetTags secs = <secs> 
		ENDIF 
		IF GotParam mins 
			<mins2> = ( <mins> / 10 ) 
			<mins1> = ( <mins> - ( <mins2> * 10 ) ) 
			<secs2> = ( <secs> / 10 ) 
			<secs1> = ( <secs> - ( <secs2> * 10 ) ) 
			FormatText textname = min_text "%m" m = <mins1> 
			SetScreenElementProps id = mins text = <min_text> 
			FormatText textname = min_text "%m" m = <mins2> 
			SetScreenElementProps id = mins2 text = <min_text> 
			mins : SetTags mins = <mins> 
		ENDIF 
	ENDIF 
	RunScriptOnScreenElement id = secs camera_hud_count params = { up = 0 } 
ENDSCRIPT

SCRIPT get_digital_timer_time 
	<mins> = 0 
	<secs> = 0 
	<frames> = 0 
	IF ScreenElementExists id = mins 
		mins : GetTags 
	ENDIF 
	RETURN mins = <mins> secs = <secs> frames = <frames> 
ENDSCRIPT

SCRIPT destroy_digital_timer 
	IF ScreenElementExists id = digital_timer_anchor 
		DestroyScreenElement id = digital_timer_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT cutscene_create_loadscreen 
	IF ScreenElementExists id = root_window 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = loading_logo_anchor 
			pos = PAIR(0.00000000000, 0.00000000000) 
			alpha = 1 
			z_priority = 9999 
		} 
		Theme_GetAltColor return_value = grad_color 
		pos = PAIR(35.00000000000, 310.00000000000) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = loading_logo_anchor 
			texture = goal_grad 
			rgba = <grad_color> 
			scale = PAIR(19.00000000000, 0.80000001192) 
			pos = ( <pos> + PAIR(0.00000000000, 0.00000000000) ) 
			just = [ left top ] 
			flip_v 
			alpha = 0.40000000596 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = loading_logo_anchor 
			texture = goal_grad 
			rgba = <grad_color> 
			scale = PAIR(19.00000000000, 0.80000001192) 
			pos = ( <pos> + PAIR(0.00000000000, 10.00000000000) ) 
			just = [ left top ] 
			flip_v 
			alpha = 0.50000000000 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = loading_logo_anchor 
			texture = goal_grad 
			rgba = <grad_color> 
			scale = PAIR(19.00000000000, 0.80000001192) 
			pos = ( <pos> + PAIR(0.00000000000, 20.00000000000) ) 
			just = [ left top ] 
			flip_v 
			alpha = 0.60000002384 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = loading_logo_anchor 
			texture = goal_grad 
			rgba = <grad_color> 
			scale = PAIR(19.00000000000, 0.80000001192) 
			pos = ( <pos> + PAIR(0.00000000000, 30.00000000000) ) 
			just = [ left top ] 
			flip_v 
			alpha = 0.69999998808 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = loading_logo_anchor 
			texture = goal_grad 
			rgba = <grad_color> 
			scale = PAIR(19.00000000000, 0.80000001192) 
			pos = ( <pos> + PAIR(0.00000000000, 40.00000000000) ) 
			just = [ left top ] 
			flip_v 
			alpha = 0.80000001192 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT cutscene_destroy_loadscreen 
	IF ScreenElementExists id = loading_logo_anchor 
		DestroyScreenElement id = loading_logo_anchor 
	ENDIF 
ENDSCRIPT


