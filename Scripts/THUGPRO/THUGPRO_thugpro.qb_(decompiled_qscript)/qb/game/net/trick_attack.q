
goal_trickattack_genericParams = { 
	goal_text = "You must score the most points to win!" 
	time = 10 
	net 
	init = goal_trickattack_init 
	activate = goal_trickattack_activate 
	deactivate = goal_trickattack_deactivate 
	expire = goal_trickattack_expire 
	goal_description = "TrickAttack!" 
	restart_node = TRG_G_TrickAttack_RestartNode 
} 
SCRIPT goal_trickattack_init 
ENDSCRIPT

SCRIPT goal_trickattack_activate 
	thugpro_create_mode_text { 
		mode_name = "Trick Attack" 
		mode_desc = "Most points wins" 
	} 
	ResetComboRecords 
	IF ( ( GameModeEquals is_singlesession ) | ( GameModeEquals is_classic ) ) 
		Skater : RunStarted 
		SetScoreAccumulation 1 
		SetScoreDegradation 1 
	ENDIF 
	ResetScore 
ENDSCRIPT

SCRIPT goal_trickattack_deactivate 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	IF ( ( GameModeEquals is_singlesession ) | ( GameModeEquals is_classic ) ) 
		GoalManager_SetGoalTimer name = <goal_id> 
		SetScoreAccumulation 0 
		SetScoreDegradation 0 
		IF NOT ObjectExists id = dialog_bg_anchor 
			IF NOT GotParam quick_start 
				PauseGame 
				root_window : SetTags menu_state = on 
				SpawnScript goal_trick_attack_high_score_menu params = { restart_node = <restart_node> } 
			ELSE 
				ResetSkaters node = <restart_node> 
			ENDIF 
		ELSE 
			ResetSkaters node = <restart_node> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_trick_attack_high_score_menu 
	kill_start_key_binding 
	PauseGame 
	pause_trick_text 
	IF ScreenElementExists id = goal_start_dialog 
		DestroyScreenElement id = goal_start_dialog 
	ENDIF 
	TantrumMessageKill 
	kill_speech_boxes 
	UpdateRecords 
	IF NewRecord 
		high_scores_menu_enter_initials restart_node = <restart_node> 
		FireEvent type = focus target = keyboard_vmenu 
	ELSE 
		high_scores_menu_create restart_node = <restart_node> 
	ENDIF 
	ResetComboRecords 
ENDSCRIPT

SCRIPT goal_trickattack_expire 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	IF NOT GameModeEquals is_singlesession 
		IF NOT GameModeEquals is_classic 
			IF InSplitScreenGame 
				create_rankings 
			ELSE 
				IF OnServer 
					SpawnScript wait_then_create_rankings 
				ELSE 
					create_rankings 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_TrickAttack 
	GoalManager_AddGoal name = trickattack { 
		params = { goal_trickattack_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_TrickAttack 
	IF InSplitScreenGame 
		SetScreenModeFromGameMode 
	ENDIF 
	GoalManager_EditGoal name = trickattack params = <...> 
	GoalManager_ActivateGoal name = trickattack 
ENDSCRIPT

SCRIPT TrickAttack_MenuStartRun 
	HighScore_StartTrickAttack 
	exit_pause_menu 
ENDSCRIPT

SCRIPT HighScore_StartTrickAttack 
	GoalManager_EditGoal name = trickattack params = { can_retry_goal } 
	GoalManager_ActivateGoal name = trickattack 
ENDSCRIPT

SCRIPT HighScore_StartGraffiti 
	GoalManager_EditGoal name = graffiti params = { can_retry_goal } 
	GoalManager_ActivateGoal name = graffiti 
	dialog_box_exit 
	ResetSkaters 
ENDSCRIPT

SCRIPT end_high_score_run 
	change check_for_unplugged_controllers = 0 
	exit_pause_menu 
	GoalManager_DeactivateGoal name = trickattack 
	change check_for_unplugged_controllers = 1 
ENDSCRIPT


