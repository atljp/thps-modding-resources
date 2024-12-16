
Goal_Race_GenericParams = { 
	race 
	goal_text = "generic race text" 
	view_goals_text = "Race goal" 
	time = 120 
	init = goal_race_init 
	uninit = goal_uninit 
	activate = goal_race_activate 
	deactivate = goal_race_deactivate 
	expire = goal_race_expire 
	success = goal_race_success 
	fail = goal_race_fail 
	trigger_obj_id = TRG_G_RACE_Pro 
	start_pad_id = G_RACE_StartPad 
	restart_node = TRG_G_RACE_RestartNode 
	goal_flags = [ got_1 
		got_2 
		got_3 
		got_4 
	] 
	race_waypoints = [ { id = TRG_G_RACE_RaceNav01 flag = got_1 } 
		{ id = TRG_G_RACE_RaceNav02 flag = got_2 } 
		{ id = TRG_G_RACE_RaceNav03 flag = got_3 } 
		{ id = TRG_G_RACE_RaceNav04 flag = got_4 } 
	] 
	race_total_laps = 1 
	record_type = score 
} 
SCRIPT goal_race_init 
	goal_init goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_race_create_waypoint 
	goal_race_remove_waypoint <...> 
	IF GotParam id 
		create name = <id> 
		<id> : Obj_Invisible 
		goal_race_create_cones name = <id> 
	ENDIF 
	IF GotParam prefix 
		create prefix = <prefix> 
		Invisible prefix = <prefix> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_race_remove_waypoint 
	IF GotParam id 
		IF IsAlive name = <id> 
			<id> : Die 
			goal_race_kill_cones name = <id> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_race_clear_exceptions 
	IF GotParam id 
		<id> : Obj_ClearExceptions 
	ENDIF 
ENDSCRIPT

SCRIPT goal_race_activate 
	goal_start goal_id = <goal_id> 
	ForEachIn <race_waypoints> do = goal_race_create_waypoint 
	GoalManager_NextRaceWaypoint name = <goal_id> 
ENDSCRIPT

SCRIPT goal_race_success 
	goal_success goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_race_deactivate 
	FormatText ChecksumName = next_waypoint_script_id "%s_next_waypoint_script_id" s = <goal_name> 
	KillSpawnedScript id = <next_waypoint_script_id> 
	GoalManager_ResetGoalTrigger name = <goal_id> 
	goal_deactivate goal_id = <goal_id> 
	IF ObjectExists id = race_arrow 
		DestroyScreenElement id = race_arrow 
	ENDIF 
	IF ScreenElementExists id = race_lap_message 
		DestroyScreenElement id = race_lap_message 
	ENDIF 
	ForEachIn <race_waypoints> do = goal_race_clear_exceptions 
	ForEachIn <race_waypoints> do = goal_race_remove_waypoint 
ENDSCRIPT

SCRIPT goal_race_expire 
	goal_expire goal_id = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_race_fail 
	goal_fail goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_race_next_waypoint 
	wait 1 gameframe 
	GoalManager_GetGoalParams name = <goal_id> 
	GetSkaterId 
	IF GotParam id 
		RunScriptOnObject id = <id> goal_race_init_waypoint params = { radius = <radius> flag = <flag> goal_id = <goal_id> last_waypoint = <last_waypoint> } 
	ENDIF 
	IF ObjectExists id = race_arrow 
		SetScreenElementProps { 
			id = race_arrow 
			NodeToPointTo = <id> 
		} 
	ELSE 
		IF GotParam first_waypoint 
			IF NOT GotParam quick_start 
				WaitForEvent type = goal_cam_anim_post_start_done 
			ENDIF 
			IF NOT GoalManager_GoalIsActive name = <goal_id> 
				RETURN 
			ENDIF 
		ENDIF 
		Create3dArrowPointer { 
			id = race_arrow 
			node = <id> 
			model = "HUD_arrow" 
			pos = PAIR(320.00000000000, 70.00000000000) 
			scale = 0.02500000037 
			Tilt = 7 
		} 
	ENDIF 
	IF GotParam start_lap 
		goal_race_lap_message goal_id = <goal_id> lap = <start_lap> 
	ENDIF 
	IF GotParam added_time 
		goal_race_add_time_message time = <added_time> 
	ENDIF 
	IF GotParam scr 
		SpawnScript <scr> params = { <params> } 
	ENDIF 
ENDSCRIPT

SCRIPT goal_race_init_waypoint 
	Obj_ClearExceptions 
	IF NOT GotParam radius 
		<radius> = 16 
	ENDIF 
	Obj_SetInnerRadius <radius> 
	IF GameModeEquals is_creategoals 
		wait 5 frame 
	ENDIF 
	Obj_SetException ex = ObjectInRadius scr = goal_race_got_waypoint params = { flag = <flag> goal_id = <goal_id> last_waypoint = <last_waypoint> } 
ENDSCRIPT

SCRIPT goal_race_got_waypoint 
	IF GameModeEquals is_creategoals 
		IF NOT GoalManager_CanStartGoal 
			RETURN 
		ENDIF 
	ENDIF 
	Obj_ClearExceptions 
	GoalManager_SetGoalFlag name = <goal_id> <flag> 1 
	IF GotParam last_waypoint 
		SpawnScript spawned_safe_goal_win params = { goal_id = <goal_id> } 
	ELSE 
		GoalManager_NextRaceWaypoint name = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_race_create_cones model = "Mdl_Cone/mdl_cone.mdl" 
	MangleChecksums a = <name> b = marker_cone1 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = motion } 
			{ component = lockobj } 
			{ component = model model = <model> } 
		] 
		params = { name = <mangled_id> } 
	} 
	<mangled_id> : Obj_LockToObject ObjectName = <name> VECTOR(-60.00000000000, 0.00000000000, 0.00000000000) 
	MangleChecksums a = <name> b = marker_cone2 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = motion } 
			{ component = lockobj } 
			{ component = model model = <model> } 
		] 
		params = { name = <mangled_id> } 
	} 
	<mangled_id> : Obj_LockToObject ObjectName = <name> VECTOR(60.00000000000, 0.00000000000, 0.00000000000) 
ENDSCRIPT

SCRIPT goal_race_kill_cones 
	MangleChecksums a = <name> b = marker_cone1 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : Die 
	ENDIF 
	MangleChecksums a = <name> b = marker_cone2 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : Die 
	ENDIF 
ENDSCRIPT

SCRIPT goal_race_checkpoint_message 
	FormatText TextName = message "CHECKPOINT!" 
	create_panel_message { 
		id = race_checkpoint_message 
		text = <message> 
		style = goal_race_checkpoint_message_style 
	} 
ENDSCRIPT

SCRIPT goal_race_checkpoint_message_style 
	SetProps rgba = [ 33 112 15 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 135.00000000000) scale = 0 alpha = 0 
	IF GotParam sound 
		PlaySound <sound> vol = 150 
	ENDIF 
	DoMorph time = 0.10000000149 scale = 2.50000000000 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.50000000000 
	DoMorph time = 0.10000000149 scale = 2.00000000000 
	DoMorph time = 0.10000000149 scale = 1.39999997616 
	DoMorph pos = PAIR(321.00000000000, 136.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 134.00000000000) time = 0.10000000149 
	DoMorph time = 0.10000000149 scale = 1.39999997616 
	DoMorph time = 0.15000000596 scale = 0 alpha = 0 
	Die 
ENDSCRIPT

SCRIPT goal_race_lap_message lap = 1 
	GoalManager_GetGoalParams name = <goal_id> 
	FormatText TextName = message "LAP %l/%t" l = <lap> t = <race_total_laps> 
	create_panel_message { 
		id = race_lap_message 
		text = <message> 
		style = goal_race_lap_message_style 
		params = { goal_id = <goal_id> } 
	} 
ENDSCRIPT

SCRIPT goal_race_lap_message_style 
	SetProps rgba = [ 110 110 110 128 ] 
	DoMorph time = 0 pos = PAIR(515.00000000000, 70.00000000000) scale = 0 alpha = 0 
	DoMorph time = 0.20000000298 scale = 2.20000004768 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.29999995232 
	alpha = 1 
	BEGIN 
		IF ( <alpha> = 1 ) 
			alpha = 0.30000001192 
		ELSE 
			alpha = 1 
		ENDIF 
		DoMorph time = 0.50000000000 alpha = <alpha> 
	REPEAT 
ENDSCRIPT

SCRIPT goal_race_add_time_message 
	FormatText TextName = message "+%t" t = <time> 
	create_panel_message { 
		id = race_time_message 
		text = <message> 
		style = goal_race_add_time_message_style 
	} 
ENDSCRIPT

SCRIPT goal_race_add_time_message_style 
	SetProps rgba = [ 112 112 112 128 ] 
	DoMorph time = 0 pos = PAIR(365.00000000000, 33.00000000000) scale = 0 alpha = 0 
	DoMorph time = 0.10000000149 scale = 0.89999997616 alpha = 1 
	wait 0.30000001192 seconds 
	DoMorph time = 0.50000000000 alpha = 0 rot_angle = 15 
	Die 
ENDSCRIPT


