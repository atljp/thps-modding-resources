
goal_highcombo_genericParams = { 
	goal_text = "generic highcombo text" 
	view_goals_text = "High combo" 
	time = 120 
	init = goal_highcombo_init 
	uninit = goal_uninit 
	activate = goal_highcombo_activate 
	success = goal_highcombo_success 
	fail = goal_highcombo_fail 
	deactivate = goal_highcombo_deactivate 
	expire = goal_highcombo_expire 
	trigger_obj_id = TRG_G_HIGHCOMBO_Pro 
	restart_node = TRG_G_HIGHCOMBO_RestartNode 
	start_pad_id = G_HIGHCOMBO_StartPad 
	exception_set = 0 
	score = 10000 
	record_type = score 
	high_combo 
} 
SCRIPT goal_highcombo_init 
	goal_init goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_activate 
	goal_start goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_check_score 
	GoalManager_GetGoalParams name = <goal_id> 
	IF NOT ( <last_score_landed> < <score> ) 
		GoalManager_WinGoal name = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_highcombo_success 
	goal_success goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_deactivate 
	GoalManager_ResetGoalTrigger name = <goal_id> 
	goal_deactivate goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_fail 
	goal_fail goal_id = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_expire 
	goal_expire goal_id = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_enter_area 
	IF NOT GoalManager_GoalExists name = <goal_id> 
		RETURN 
	ENDIF 
	IF GoalManager_GoalIsActive name = <goal_id> 
		RETURN 
	ENDIF 
	IF GoalManager_GoalIsLocked name = <goal_id> 
		RETURN 
	ENDIF 
	IF GoalManager_HasWonGoal name = <goal_id> 
		RETURN 
	ENDIF 
	KillSpawnedScript name = goal_highcombo_wait_and_activate 
	IF SkaterCurrentScorePotGreaterThan 0 
		SpawnScript goal_highcombo_wait_and_activate params = { goal_id = <goal_id> } 
	ELSE 
		goal_highcombo_combo_started goal_id = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_highcombo_combo_started 
	GoalManager_ActivateGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_highcombo_wait_and_activate 
	SetException ex = SkaterEnterCombo scr = goal_highcombo_combo_started params = { goal_id = <goal_id> } 
	Block 
ENDSCRIPT

SCRIPT goal_highcombo_leave_area 
	IF NOT GoalManager_GoalExists name = <goal_id> 
		RETURN 
	ENDIF 
	IF GoalManager_GoalIsLocked name = <goal_id> 
		RETURN 
	ENDIF 
	KillSpawnedScript name = goal_highcombo_wait_and_activate 
	IF GoalManager_GoalIsActive name = <goal_id> 
		GoalManager_DeactivateGoal name = <goal_id> 
	ENDIF 
ENDSCRIPT


