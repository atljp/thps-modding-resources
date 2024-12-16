
goal_slap_genericParams = { 
	goal_text = "You must slap the most players to win!" 
	time = 10 
	net 
	init = goal_slap_init 
	activate = goal_slap_activate 
	deactivate = goal_slap_deactivate 
	expire = goal_slap_expire 
	goal_description = "Slap!" 
} 
SCRIPT goal_slap_init 
ENDSCRIPT

SCRIPT goal_slap_activate 
	IF InTeamGame 
		FormatText TextName = msg_text "The team with the most slaps wins" 
	ELSE 
		FormatText TextName = msg_text "The player with the most slaps wins" 
	ENDIF 
	thugpro_create_mode_text { 
		mode_name = "Slap!" 
		mode_desc = <msg_text> 
	} 
	KillSpawnedScript name = clock_morph 
	RunScriptOnScreenElement id = the_time clock_morph 
	ResetScore 
ENDSCRIPT

SCRIPT goal_slap_deactivate 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
ENDSCRIPT

SCRIPT slap_done 
	dialog_box_exit 
	do_backend_retry 
ENDSCRIPT

SCRIPT goal_slap_expire 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	printf "goal_slap_expire" 
	IF OnServer 
		SpawnScript wait_then_create_rankings params = { score_title_text = "SLAPS" } 
	ELSE 
		create_rankings score_title_text = "SLAPS" 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_Slap 
	GoalManager_AddGoal name = slap { 
		params = { goal_slap_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_Slap 
	IF InSplitScreenGame 
		SetScreenModeFromGameMode 
	ENDIF 
	GoalManager_EditGoal name = slap params = <...> 
	GoalManager_ActivateGoal name = slap 
ENDSCRIPT


