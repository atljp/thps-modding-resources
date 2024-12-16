
NotifiedLastPlacePlayer = 0 
NotifiedSecondToLastPlacePlayer = 0 
goal_elimiskate_genericParams = { 
	goal_text = "Avoid elimination by staying out of last place!" 
	time = 10 
	net 
	game_continues_after_expiration 
	init = goal_elimiskate_init 
	active = goal_elimiskate_active 
	activate = goal_elimiskate_activate 
	deactivate = goal_elimiskate_deactivate 
	expire = goal_elimiskate_expire 
	goal_description = "Elimiskate!" 
} 
SCRIPT goal_elimiskate_init 
ENDSCRIPT

SCRIPT goal_elimiskate_active 
	GoalManager_GetTimeLeftInNetGame 
	IF GotParam time_left 
		IF ( <time_left> < 5000 ) 
			IF InLastPlace 
				IF NOT IsTrue NotifiedLastPlacePlayer 
					Change NotifiedLastPlacePlayer = 1 
					IF ( <points> = 0 ) 
						FormatText TextName = msg_text "\\c2You\'re tied for last place!" 
					ELSE 
						FormatText TextName = msg_text "\\c2You\'re in last place by %s points!" s = <points> 
					ENDIF 
					create_net_panel_message text = <msg_text> msg_time = 3000 
				ENDIF 
			ELSE 
				IF InSecondToLastPlace 
					IF NOT IsTrue NotifiedSecondToLastPlacePlayer 
						Change NotifiedSecondToLastPlacePlayer = 1 
						FormatText TextName = msg_text "\\c2You\'re only %s points ahead of last place!" s = <points> 
						create_net_panel_message text = <msg_text> msg_time = 3000 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

goal_elimiskate_round = 0 
SCRIPT goal_elimiskate_activate 
	RoundIncrement 
	Toggle_TrackTrickScore on 
	Change NotifiedLastPlacePlayer = 0 
	Change NotifiedSecondToLastPlacePlayer = 0 
	IF ( goal_elimiskate_round = 0 ) 
		IF NOT IsHost 
			IF ( GetGlobalFlag flag = FLAG_TOGGLE_GRAFF_MODE ) 
				Change GraffMode = 1 
				UnSetGlobalFlag flag = FLAG_TOGGLE_GRAFF_MODE 
			ELSE 
				Change GraffMode = 0 
			ENDIF 
			Change goal_elimiskate_round = 1 
		ENDIF 
	ENDIF 
	IF IsTrue GraffMode 
		thugpro_create_mode_text { 
			mode_name = "Elimi-Graff" 
			mode_desc = "Avoid Elimination!" 
		} 
		Toggle_ShouldModulateColor on 
	ELSE 
		thugpro_create_mode_text { 
			mode_name = "Elimi-Skate" 
			mode_desc = "Avoid Elimination!" 
		} 
		Toggle_ShouldModulateColor off 
	ENDIF 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
		KillSpawnedScript name = clock_morph 
		RunScriptOnScreenElement id = the_time clock_morph 
	ENDIF 
	IF GameModeEquals should_reset_scores 
		IF IsTrue GraffMode 
			skater = 0 
			BEGIN 
				THUGPRO_ClearGraffiti SkaterId = <skater> 
				<skater> = ( <skater> + 1 ) 
			REPEAT 8 
		ENDIF 
		ResetScore reset_all 
		ResetComboRecords 
		thugpro_update_tod 
	ENDIF 
ENDSCRIPT

SCRIPT goal_elimiskate_deactivate 
	IF NOT GoalManager_GoalIsActive name = elimiskate_break_period 
		IF NOT GoalManager_GoalIsActive name = elimiskate_interval 
			IF ObjectExists id = mp_goal_text 
				DestroyScreenElement id = mp_goal_text 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_elimiskate_expire 
	IF IsTrue GraffMode 
		Toggle_ShouldModulateColor off 
	ENDIF 
	Toggle_TrackTrickScore off 
	StartGoal_ElimiSkate_Interval 
ENDSCRIPT

SCRIPT goal_elimiskate_finished 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	Change goal_elimiskate_round = 0 
	SpawnScript wait_then_create_rankings 
ENDSCRIPT

SCRIPT THUGPRO_EliminatedSkater 
	IF IsTrue GraffMode 
		printf "Calling ClearGraffiti" 
		THUGPRO_ClearGraffiti SkaterId = <objId> 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_Elimiskate 
	GoalManager_AddGoal name = elimiskate { 
		params = { goal_elimiskate_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_ElimiSkate 
	GoalManager_EditGoal name = elimiskate params = <...> 
	GoalManager_ActivateGoal name = elimiskate 
	GoalManager_SetGoalTimer name = elimiskate 
ENDSCRIPT

goal_elimiskate_break_period_genericParams = { 
	goal_text = "Next round starting..." 
	time = 4 
	net 
	game_continues_after_expiration 
	init = goal_elimiskate_break_period_init 
	activate = goal_elimiskate_break_period_activate 
	deactivate = goal_elimiskate_break_period_deactivate 
	expire = goal_elimiskate_break_period_expire 
	goal_description = "Elimiskate!" 
} 
SCRIPT goal_elimiskate_break_period_init 
ENDSCRIPT

SCRIPT goal_elimiskate_break_period_active 
ENDSCRIPT

SCRIPT goal_elimiskate_break_period_activate 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
		KillSpawnedScript name = clock_morph 
		RunScriptOnScreenElement id = the_time clock_morph 
	ENDIF 
	IF IsTrue GraffMode 
		Toggle_ShouldModulateColor off 
	ENDIF 
	Toggle_TrackTrickScore off 
	create_net_panel_message text = "Getting ready to start next round. Scoring will begin when round starts." 
ENDSCRIPT

SCRIPT goal_elimiskate_break_period_deactivate 
ENDSCRIPT

SCRIPT goal_elimiskate_break_period_expire 
	StartGoal_ElimiSkate 
ENDSCRIPT

SCRIPT AddGoal_Elimiskate_Break_Period 
	GoalManager_AddGoal name = elimiskate_break_period { 
		params = { goal_elimiskate_break_period_genericParams 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_ElimiSkate_Break_Period 
	GoalManager_EditGoal name = elimiskate_break_period params = <...> 
	GoalManager_ActivateGoal name = elimiskate_break_period 
ENDSCRIPT

goal_elimiskate_interval_genericParams = { 
	goal_text = "" 
	time = 4 
	net 
	init = goal_elimiskate_interval_init 
	activate = goal_elimiskate_interval_activate 
	deactivate = goal_elimiskate_interval_deactivate 
	expire = goal_elimiskate_interval_expire 
	game_continues_after_expiration 
	goal_description = "" 
} 
SCRIPT goal_elimiskate_interval_init 
ENDSCRIPT

SCRIPT goal_elimiskate_interval_active 
ENDSCRIPT

SCRIPT goal_elimiskate_interval_activate 
	IF IsTrue GraffMode 
		Toggle_ShouldModulateColor off 
	ENDIF 
	Toggle_TrackTrickScore off 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			hide 
		} 
		DoScreenElementMorph { id = the_time rgba = [ 128 128 128 128 ] } 
	ENDIF 
	create_net_panel_message text = "Calculating final scores. Points scored in this time period will not count." 
	IF OnServer 
		SpawnScript wait_and_eliminate 
	ENDIF 
	IF GameModeEquals should_reset_scores 
		SpawnScript wait_and_accumulate 
	ENDIF 
ENDSCRIPT

SCRIPT wait_and_eliminate 
	Wait 2 seconds 
	EliminateLastPlacePlayer 
ENDSCRIPT

SCRIPT wait_and_accumulate 
	AccumulateScores 
ENDSCRIPT

SCRIPT goal_elimiskate_interval_deactivate 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
		KillSpawnedScript name = clock_morph 
		RunScriptOnScreenElement id = the_time clock_morph 
	ENDIF 
ENDSCRIPT

SCRIPT goal_elimiskate_interval_expire 
	IF OnlyOnePlayerLeft 
		goal_elimiskate_finished 
	ELSE 
		StartGoal_ElimiSkate_Break_Period 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_Elimiskate_Interval 
	GoalManager_AddGoal name = elimiskate_interval { 
		params = { goal_elimiskate_interval_genericParams } 
	} 
ENDSCRIPT

SCRIPT StartGoal_ElimiSkate_Interval 
	GoalManager_ActivateGoal name = elimiskate_interval 
ENDSCRIPT

SCRIPT CheckForElimiskateGameOver 
	IF OnlyOnePlayerLeft 
		GoalManager_DeactivateGoal name = elimiskate 
		GoalManager_DeactivateGoal name = elimiskate_break_period 
		GoalManager_DeactivateGoal name = elimiskate_interval 
		goal_elimiskate_finished 
	ENDIF 
ENDSCRIPT


