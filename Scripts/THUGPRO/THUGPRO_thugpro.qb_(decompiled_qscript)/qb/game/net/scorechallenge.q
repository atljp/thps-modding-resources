
goal_scorechallenge_genericParams = { 
	goal_text = "You must score the most points to win!" 
	unlimited_time = 1 
	score = 1000000 
	net 
	init = goal_scorechallenge_init 
	activate = goal_scorechallenge_activate 
	active = goal_scorechallenge_active 
	deactivate = goal_scorechallenge_deactivate 
	goal_description = "Score Challenge!" 
} 
SCRIPT goal_scorechallenge_init 
ENDSCRIPT

SCRIPT goal_scorechallenge_activate 
	IF NOT IsHost 
		IF ( GetGlobalFlag flag = FLAG_TOGGLE_GRAFF_MODE ) 
			Change GraffMode = 1 
			UnSetGlobalFlag flag = FLAG_TOGGLE_GRAFF_MODE 
		ELSE 
			Change GraffMode = 0 
		ENDIF 
	ENDIF 
	IF IsTrue GraffMode 
		FormatText TextName = msg_text "%s tags to win" s = <score> 
		thugpro_create_mode_text { 
			mode_name = "Graff Challenge" 
			mode_desc = <msg_text> 
		} 
		Toggle_ShouldModulateColor on 
	ELSE 
		get_points_string_with_commas score = <score> 
		FormatText TextName = msg_text "%t\\n\\c0points to win" s = <points_string> 
		thugpro_create_mode_text { 
			mode_name = "Score Challenge" 
			mode_desc = <msg_text> 
		} 
		Toggle_ShouldModulateColor off 
	ENDIF 
	printf "************** ACTIVATING SCORECHALLENGE **********************" 
	ResetScore 
ENDSCRIPT

SCRIPT goal_scorechallenge_active 
	IF AnySkaterTotalScoreAtLeast <score> 
		IF OnServer 
			IF CalculateFinalScores 
				GoalManager_DeactivateGoal name = <goal_id> 
				goal_scorechallenge_finished 
			ENDIF 
		ELSE 
			GoalManager_DeactivateGoal name = <goal_id> 
			goal_scorechallenge_finished 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scorechallenge_deactivate 
	destroy_goal_panel_messages 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
ENDSCRIPT

SCRIPT goal_scorechallenge_finished 
	destroy_goal_panel_messages 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	printf "goal_scorechallenge_deactivate" 
	ResetScorePot 
	IF OnServer 
		IF InInternetMode 
			ReportStats final 
		ENDIF 
	ENDIF 
	create_rankings 
ENDSCRIPT

SCRIPT AddGoal_scorechallenge 
	GoalManager_AddGoal name = scorechallenge { 
		params = { goal_scorechallenge_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_scorechallenge 
	IF InSplitScreenGame 
		SetScreenModeFromGameMode 
	ENDIF 
	GoalManager_EditGoal name = scorechallenge params = <...> 
	GoalManager_ActivateGoal name = scorechallenge 
ENDSCRIPT


