
Goal_Collect_GenericParams = { 
	goal_text = "Collect x things!" 
	view_goals_text = "Generic collect text" 
	goal_description = "Generic collect goal description" 
	time = 120 
	init = goal_collect_init 
	uninit = goal_uninit 
	active = goal_collect_active 
	activate = goal_collect_activate 
	deactivate = goal_collect_deactivate 
	expire = goal_collect_expire 
	fail = goal_collect_fail 
	success = goal_collect_success 
	restart_node = TRG_G_COLLECT_RestartNode 
	trigger_obj_id = TRG_G_COLLECT_Pro 
	goal_collect_object_init_script = set_goal_collect_exception 
	goal_flags = [ 
		got_1 
		got_2 
		got_3 
		got_4 
		got_5 
	] 
	goal_collect_objects = [ 
		{ id = TRG_G_COLLECT_FratBoy01 scr = goal_collect_got_object flag = got_1 } 
		{ id = TRG_G_COLLECT_FratBoy02 scr = goal_collect_got_object flag = got_2 } 
		{ id = TRG_G_COLLECT_FratBoy03 scr = goal_collect_got_object flag = got_3 } 
		{ id = TRG_G_COLLECT_FratBoy04 scr = goal_collect_got_object flag = got_4 } 
		{ id = TRG_G_COLLECT_FratBoy05 scr = goal_collect_got_object flag = got_5 } 
	] 
	start_pad_id = G_COLLECT_StartPad 
	wait_and_win_started = 0 
	record_type = time 
} 
SCRIPT goal_collect_init 
	goal_init goal_id = <goal_id> 
	ForEachIn { 
		<goal_collect_objects> 
		do = goal_collect_update_from_goal_flags 
		params = { goal_id = <goal_id> } 
	} 
ENDSCRIPT

SCRIPT goal_collect_update_from_goal_flags 
	IF GotParam flag 
		IF GoalManager_GoalFlagSet name = <goal_id> flag = <flag> 
			IF ObjectExists id = <id> 
				<id> : Obj_Invisible 
			ENDIF 
		ELSE 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT init_goal_collect_object 
	IF GotParam id 
		IF ChecksumEquals a = <trigger_obj_id> b = <id> 
			GoalManager_SetGoalFlag name = <goal_id> <flag> 1 
		ELSE 
			<id> : Obj_Visible 
			RunScriptOnObject id = <id> <goal_collect_object_init_script> params = <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT set_goal_collect_exception goal_collect_object_inner_radius = 6 
	Obj_ClearExceptions 
	Obj_SetInnerRadius <goal_collect_object_inner_radius> 
	Obj_SetException ex = ObjectInRadius scr = <scr> params = { goal_id = <goal_id> flag = <flag> } 
ENDSCRIPT

SCRIPT goal_collect_got_object 
	Obj_ClearExceptions 
	PlaySound GapSound_11 vol = 100 
	GoalManager_SetGoalFlag name = <goal_id> <flag> 1 
	GoalManager_GetGoalParams name = <goal_id> 
	IF NOT GoalManager_AllFlagsSet name = <goal_id> 
		FormatText TextName = collect_text "%c of %n %t" c = <num_flags_set> t = <collect_type> n = <num_flags> 
		create_panel_message text = <collect_text> style = goal_collect_text 
	ENDIF 
ENDSCRIPT

SCRIPT goal_collect_text 
	SetProps rgba = [ 128 128 128 128 ] pos = PAIR(320.00000000000, 220.00000000000) 
	Domorph time = 0 scale = 1.10000002384 alpha = 1 relative_scale 
	Domorph time = 0.05000000075 scale = 1 relative_scale 
	Domorph time = 0.69999998808 alpha = 0.98000001907 
	Domorph time = 0.17000000179 alpha = 0 
	Die 
ENDSCRIPT

SCRIPT goal_collect_activate 
	goal_start goal_id = <goal_id> 
	FormatText ChecksumName = script_id "%s_goal_collect_wait_and_initialize_objects" s = <goal_name> 
	SpawnScript goal_collect_wait_and_initialize_objects id = <script_id> params = <...> 
ENDSCRIPT

SCRIPT goal_collect_wait_and_initialize_objects 
	IF NOT GotParam quick_start 
		WaitForEvent type = goal_cam_anim_post_start_done 
		IF NOT GoalManager_GoalIsActive name = <goal_id> 
			RETURN 
		ENDIF 
	ENDIF 
	GetArraySize <goal_collect_objects> 
	<index> = 0 
	BEGIN 
		<array_element> = ( <goal_collect_objects> [ <index> ] ) 
		IF GoalManager_GoalFlagSet name = <goal_id> flag = ( <array_element> . flag ) 
			<object_id> = ( <array_element> . id ) 
			<object_id> : Obj_Invisible 
			<object_id> : Obj_ClearExceptions 
		ELSE 
			init_goal_collect_object { 
				<array_element> 
				goal_id = <goal_id> 
				trigger_obj_id = <trigger_obj_id> 
				goal_collect_object_init_script = <goal_collect_object_init_script> 
			} 
			IF GotParam create_collect_arrows 
				goal_collect_add_arrow { 
					<array_element> 
					goal_name = <goal_name> 
					index = <index> 
				} 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	BEGIN 
		IF GetNextArrayElement <goal_collect_objects> 
			goal_collect_run_init_script <element> 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT goal_collect_run_init_script 
	IF GotParam init_script 
		<init_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_collect_success 
	goal_success goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_collect_deactivate 
	FormatText ChecksumName = script_id "%s_goal_collect_wait_and_initialize_objects" s = <goal_name> 
	KillSpawnedScript id = <script_id> 
	GoalManager_EditGoal name = <goal_id> params = { wait_and_win_started = 0 } 
	IF GotParam trigger_obj_id 
		GoalManager_ResetGoalTrigger name = <goal_id> 
	ENDIF 
	goal_deactivate goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_collect_expire 
	goal_expire goal_id = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_collect_fail 
	goal_fail goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_collect_add_arrow 
	IF NOT IsAlive name = <id> 
		RETURN 
	ENDIF 
	IF NOT GotParam arrow_height 
		<arrow_height> = 100 
	ENDIF 
	<arrow_pos> = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <arrow_height> ) 
	IF NOT GotParam arrow_model 
		<arrow_model> = "goalarrow" 
	ENDIF 
	FormatText ChecksumName = arrow_id "%g_%i_arrow" g = <goal_name> i = <index> 
	IF ScreenElementExists id = <arrow_id> 
		DestroyScreenElement id = <arrow_id> 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		parent = root_window 
		type = Element3D 
		id = <arrow_id> 
		model = <arrow_model> 
		HoverParams = { Amp = 9.50000000000 Freq = 2.50000000000 } 
		AngVelY = 0.15999999642 
		ParentParams = { name = <id> <arrow_pos> IgnoreParentsYRotation } 
	} 
ENDSCRIPT


