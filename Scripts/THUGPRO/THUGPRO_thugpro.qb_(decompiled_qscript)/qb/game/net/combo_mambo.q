
combo_score = 0 
goal_combomambo_genericParams = { 
	goal_text = "You must score the most points to win!" 
	time = 10 
	net 
	init = goal_combomambo_init 
	activate = goal_combomambo_activate 
	deactivate = goal_combomambo_deactivate 
	expire = goal_combomambo_expire 
	goal_description = "Combo Mambo!" 
} 
SCRIPT goal_combomambo_init 
ENDSCRIPT

SCRIPT goal_combomambo_activate 
	thugpro_create_mode_text { 
		mode_name = "Combo Mambo" 
		mode_desc = "Highest combo wins" 
	} 
	Toggle_ShouldModulateColor off 
	KillSpawnedScript name = clock_morph 
	RunScriptOnScreenElement id = the_time clock_morph 
	ResetScore 
	ResetComboRecords 
ENDSCRIPT

SCRIPT goal_combomambo_deactivate 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
ENDSCRIPT

SCRIPT combomambo_done 
	dialog_box_exit 
	do_backend_retry 
ENDSCRIPT

SCRIPT goal_combomambo_expire 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	printf "goal_combomambo_expire" 
	IF GameModeEquals is_singlesession 
		UpdateRecords 
		high_scores_menu_create 
		ResetComboRecords 
	ELSE 
		IF OnServer 
			SpawnScript wait_then_create_rankings params = { score_title_text = "BEST COMBO" } 
		ELSE 
			create_rankings score_title_text = "BEST COMBO" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_combomambo 
	GoalManager_AddGoal name = combomambo { 
		params = { goal_combomambo_genericParams <...> 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_combomambo 
	IF InSplitScreenGame 
		SetScreenModeFromGameMode 
	ENDIF 
	GoalManager_EditGoal name = combomambo params = <...> 
	GoalManager_ActivateGoal name = combomambo 
ENDSCRIPT


