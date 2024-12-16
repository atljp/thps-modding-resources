
Goal_Gaps_genericParams = { 
	goal_text = "generic gaps text" 
	view_goals_text = "Gaps goal" 
	time = 120 
	init = goal_gaps_init 
	uninit = goal_uninit 
	activate = goal_gaps_activate 
	active = goal_gaps_active 
	deactivate = goal_gaps_deactivate 
	expire = goal_gaps_expire 
	success = goal_gaps_success 
	fail = goal_gaps_fail 
	trigger_obj_id = TRG_G_GAP_Pro 
	restart_node = TRG_G_GAP_RestartNode 
	start_pad_id = G_GAP_StartPad 
	record_type = score 
	gaps 
} 
SCRIPT goal_gaps_init 
	goal_init goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_gaps_activate 
	IF GameModeEquals is_creategoals 
		skater : landskatertricks 
	ENDIF 
	IF GotParam goal_object_params 
		ForEachIn <goal_object_params> Do = MaybeCreateProximRootNode Params = { goal_id = <goal_id> goal_text = <goal_text> } 
	ENDIF 
	IF GotParam no_cam_anim 
		goal_passive_start goal_id = <goal_id> 
	ELSE 
		goal_start goal_id = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_gaps_deactivate 
	GoalManager_ResetGoalTrigger name = <goal_id> 
	goal_deactivate goal_id = <goal_id> 
	IF GotParam goal_object_params 
		ForEachIn <goal_object_params> Do = MaybeDeleteProximRootNodes Params = { goal_id = <goal_id> goal_text = <goal_text> } 
	ENDIF 
ENDSCRIPT

SCRIPT goal_gaps_success 
	IF ScreenElementExists id = goal_gaps_got_gap_message 
		DestroyScreenElement id = goal_gaps_got_gap_message 
	ENDIF 
	goal_success goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_gaps_fail 
	goal_fail goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_gaps_expire 
	goal_expire goal_id = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_gaps_got_gap 
	IF NOT GoalManager_AllFlagsSet name = <goal_id> 
		IF ScreenElementExists id = goal_gaps_got_gap_message 
			DestroyScreenElement id = goal_gaps_got_gap_message 
		ENDIF 
		IF NOT GotParam collect_type 
			<collect_type> = "gaps" 
		ENDIF 
		FormatText TextName = got_gap_text "%c of %n %s" c = <num_flags_set> n = <num_flags> s = <collect_type> 
		create_panel_message id = goal_gaps_got_gap_message text = <got_gap_text> style = goal_collect_text 
	ENDIF 
ENDSCRIPT


