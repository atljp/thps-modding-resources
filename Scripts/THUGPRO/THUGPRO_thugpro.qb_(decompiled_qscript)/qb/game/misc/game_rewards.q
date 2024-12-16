
want_game_complete_message = 0 
want_goal_complete_message = 0 
want_gaps_complete_message = 0 
want_goal_alt_message = 0 
want_completion_movie = 0 
SCRIPT SetRewardFlagArray 
ENDSCRIPT

SCRIPT GetDifficultyLevelRewards 
ENDSCRIPT

SCRIPT GetGoalRewards 
ENDSCRIPT

SCRIPT ProcessGameRewards 
	printf "Processing Game Rewards" 
	IF GameModeEquals is_career 
		IF GetGlobalFlag flag = CAREER_SEEN_GAME_COMPLETE_MESSAGE 
			RETURN 
		ENDIF 
		GetArraySize CHAPTER_STATUS 
		GetCurrentChapter 
		GoalManager_GetActiveRewardPoints 
		GetCurrentPointsToAdvance 
		IF ( <active_points> < <points_to_advance> ) 
			RETURN 
		ENDIF 
		SetGlobalFlag flag = CAREER_SEEN_GAME_COMPLETE_MESSAGE 
	ELSE 
		IF GetGlobalFlag flag = CLASSIC_SEEN_GAME_COMPLETE_MESSAGE 
			RETURN 
		ENDIF 
		IF NOT LevelIs load_se2 
			RETURN 
		ENDIF 
		GetClassicLevelGoalCount 
		GetClassicModeTargetGoalsComplete 
		IF ( <classic_goal_count> < <target_goals_complete> ) 
			RETURN 
		ENDIF 
		SetGlobalFlag flag = CLASSIC_SEEN_GAME_COMPLETE_MESSAGE 
	ENDIF 
	GetDifficultyLevelRewards 
	SetRewardFlagArray flags = <flags> 
	change want_game_complete_message = 1 
	change want_completion_movie = 1 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT ProcessGoalRewards 
ENDSCRIPT

SCRIPT ProcessAllGapsReward 
ENDSCRIPT

SCRIPT CheckNeedCompletionMessages 
ENDSCRIPT

waiting_for_complete_message = 0 
SCRIPT DoCompletionMessages 
ENDSCRIPT

SCRIPT DoCompletionMessagesNow 
ENDSCRIPT

SCRIPT MaybePlayCreditsMovie 
ENDSCRIPT

SCRIPT GameCompleteMessage 
ENDSCRIPT

SCRIPT GoalCompleteMessage 
ENDSCRIPT

SCRIPT AllGapsCompleteMessage 
ENDSCRIPT

SCRIPT GetEndMovieParams 
ENDSCRIPT

SCRIPT GetGoalMovieParams 
ENDSCRIPT


