
Goal_TrickBeat_GenericParams = { 
	goal_text = "Trick to the beat!" 
	view_goals_text = "Generic trick to the beat text" 
	time = 120 
	init = goal_trick_beat_init 
	uninit = goal_uninit 
	activate = goal_trick_beat_activate 
	deactivate = goal_trick_beat_deactivate 
	expire = goal_trick_beat_expire 
	fail = goal_trick_beat_fail 
	success = goal_trick_beat_success 
	restart_node = TRG_G_TRICKBEAT_RestartNode 
	trigger_obj_id = TRG_G_TRICKBEAT_Pro 
	record_type = score 
	TrickBeat 
} 
goal_trick_beat_faded_trick_alpha = 0.40000000596 
goal_trick_beat_unfaded_trick_alpha = 1.00000000000 
SCRIPT goal_trick_beat_init 
	goal_init <...> 
ENDSCRIPT

SCRIPT goal_trick_beat_activate 
	IF NOT GotParam quick_start 
		GoalManager_EditGoal name = <goal_id> params = { wait_to_add_tricks = 1 } 
		SpawnScript goal_trick_beat_wait_and_add_tricks params = <...> 
	ENDIF 
	IF GotParam no_cam_anim 
		goal_passive_start goal_id = <goal_id> 
		SpawnScript goal_trick_beat_fade_out_music 
	ELSE 
		IF GotParam quick_start 
			SpawnScript goal_trick_beat_fade_out_music 
		ELSE 
			goal_start goal_id = <goal_id> 
			SpawnScript goal_trick_beat_wait_and_fade_music 
		ENDIF 
	ENDIF 
	create_trick_beat_menu 
ENDSCRIPT

SCRIPT goal_trick_beat_wait_and_add_tricks 
	Block UntilEvent = goal_cam_anim_post_start_done 
	GoalManager_ResetTrickBeatTimer name = <goal_id> 
	GoalManager_EditGoal name = <goal_id> params = { wait_to_add_tricks = 0 } 
ENDSCRIPT

SCRIPT goal_trick_beat_deactivate 
	goal_deactivate <...> 
	IF ScreenElementExists id = trick_beat_menu_anchor 
		RunScriptOnScreenElement id = trick_beat_menu_anchor menu_offscreen params = { menu_id = trick_beat_menu_anchor } 
	ENDIF 
	IF NOT GotParam quick_start 
		SpawnScript goal_trick_beat_fade_in_music 
	ENDIF 
ENDSCRIPT

SCRIPT goal_trick_beat_expire 
	goal_expire <...> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_trick_beat_fail 
	goal_fail <...> 
ENDSCRIPT

SCRIPT goal_trick_beat_success 
	goal_success <...> 
ENDSCRIPT

SCRIPT goal_trick_beat_wait_and_fade_music 
	WaitForEvent type = goal_cam_anim_post_start_done 
	SpawnScript goal_trick_beat_fade_out_music 
ENDSCRIPT

SCRIPT create_trick_beat_menu 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = trick_beat_menu_anchor 
		font = small 
		pos = PAIR(320.00000000000, 218.00000000000) 
		just = [ center center ] 
		scale = 1 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = trick_beat_menu_anchor 
		id = trick_beat_tricks_menu 
		font = small 
		padding_scale = 0.94999998808 
		just = [ right bottom ] 
		pos = PAIR(615.00000000000, 370.00000000000) 
		internal_just = [ right center ] 
		scale = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = trick_beat_menu_anchor 
		local_id = the_stereo 
		texture = kyron 
		just = [ center center ] 
		pos = PAIR(560.00000000000, 410.00000000000) 
	} 
ENDSCRIPT

SCRIPT goal_trick_beat_remove_trick 
	GetTags 
	DoMorph time = 0 scale = 0.69999998808 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 144 32 32 85 ] 
	} 
	IF NOT GotParam tricktris 
		DoMorph scale = 0 time = 0.50000000000 scale = 0 
	ENDIF 
	Die 
ENDSCRIPT

SCRIPT goal_trick_beat_add_trick 
	GetTags 
	goal_trick_beat_move_button_text <...> 
	DoMorph time = 0 scale = 0 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 127 102 0 75 ] 
	} 
	DoMorph time = 0.30000001192 scale = 0.80000001192 
	DoMorph time = 0.20000000298 scale = 0.60000002384 
	DoMorph time = 0.10000000149 scale = 0.69999998808 
	SetProps rgba = [ 128 128 128 75 ] 
ENDSCRIPT

SCRIPT goal_trick_beat_move_button_text 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		just = [ right top ] 
	} 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		pos = PAIR(100.00000000000, 0.00000000000) 
	} 
	IF NOT GotParam no_key_combo 
		GetScreenElementPosition id = { <id> child = 0 } 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			just = [ right top ] 
		} 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			pos = ( <ScreenElementPos> - PAIR(10.00000000000, 0.00000000000) ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT goal_trick_beat_pulse_trick 
	goal_trick_beat_turn_trick_red 
	wait <wait_time> 
	goal_trick_beat_turn_trick_white 
ENDSCRIPT

SCRIPT goal_trick_beat_turn_trick_red 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 144 32 32 85 ] 
	} 
	DoScreenElementMorph { 
		id = { trick_beat_menu_anchor child = the_stereo } 
		rgba = [ 144 32 32 85 ] 
		scale = 1.29999995232 
	} 
ENDSCRIPT

SCRIPT goal_trick_beat_turn_trick_white 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 127 102 0 75 ] 
	} 
	DoScreenElementMorph { 
		id = { trick_beat_menu_anchor child = the_stereo } 
		rgba = [ 128 128 128 90 ] 
		scale = 1 
	} 
ENDSCRIPT

SCRIPT goal_trick_beat_reset_trick_container 
	TerminateObjectsScripts id = <id> 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 127 102 0 75 ] 
	} 
	DoScreenElementMorph { 
		id = <id> 
		scale = 0.69999998808 
	} 
ENDSCRIPT

SCRIPT goal_trick_beat_play_trick_removed_sound 
	wait 0.10000000149 seconds 
	PlaySound TetrisAway vol = 125 pitch = 125 
ENDSCRIPT

SCRIPT goal_trick_beat_fade_out_music 
	SpawnScript SK6_Music_Fade_Out 
	wait 1 gameframe 
	change DontAdjustMusicViaProximNode = 1 
ENDSCRIPT

SCRIPT goal_trick_beat_fade_in_music 
	change DontAdjustMusicViaProximNode = 0 
	IF NOT ( ( in_create_a_goal ) ) 
		SpawnScript SK6_Music_Fade_In 
	ELSE 
		KillSpawnedScript name = SK6_Music_Fade_Out 
		change music_was_paused = 0 
		SetMusicVolume MusicVolOutsideBox 
	ENDIF 
ENDSCRIPT


