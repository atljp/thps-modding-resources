
story_game_complete_rewards = 
[ 
	{ flags = [ GAME_COMPLETED_BEGINNER 
			LEVEL_UNLOCKED_SE 
			LEVEL_SEEN_SE 
			MOVIE_UNLOCKED_WDT 
			SKATER_UNLOCKED_SHREK 
			SKATER_UNLOCKED_PHIL 
			SKATER_UNLOCKED_PEDGROUP1 
		] 
		movie = "movies\\wdt" 
		play_credits 
		message = "\\n\\c5STORY MODE COMPLETE!\\n\\nYou\'ve unlocked the \\c5Pro Skater \\c0level!\\nYou\'ve also unlocked playable secret skaters:\\n\\c5Shrek, Phil Margera, Alien,\\n\\c5Geeky Kid, and Space Monkey 1!\\n\\nWhere did all of the footage for the\\nWorld Destruction Tour video go? Take a look...\\n\\n\\n\\n\\n\\c8Shrek is a registered trademark of DreamWorks L.L.C.\\n\\c8Shrek 2, Shrek Ear Design, Shrek \'S\' TM & (c) 2004\\n\\c8DreamWorks L.L.C." 
		use_shrek_logo = use_shrek_logo 
	} 
	{ flags = [ GAME_COMPLETED_NORMAL 
			LEVEL_UNLOCKED_SE 
			LEVEL_SEEN_SE 
			MOVIE_UNLOCKED_WDT 
			SKATER_UNLOCKED_HAND 
			SKATER_UNLOCKED_PAULIE 
			SKATER_UNLOCKED_PEDGROUP2 
		] 
		movie = "movies\\wdt" 
		play_credits 
		message = "\\n\\c5STORY MODE COMPLETE!\\n\\nYou\'ve completed Story Mode on Normal difficulty\\n and unlocked the \\c5Pro Skater \\c0level!\\n\\nYou\'ve also unlocked playable secret skaters:\\n\\c5The Hand, Paulie \'Wheels of Fury\' Ryan,\\n\\c5Alien Doctor, Boat Captain, and Lost Soul 1!\\n\\nWhere did all of the footage for the\\nWorld Destruction Tour video go? Take a look...\\n" 
	} 
	{ flags = [ GAME_COMPLETED_SICK 
			LEVEL_UNLOCKED_SE 
			LEVEL_SEEN_SE 
			MOVIE_UNLOCKED_WDT 
			SKATER_UNLOCKED_SOLDIER 
			SKATER_UNLOCKED_NIGEL 
			SKATER_UNLOCKED_PEDGROUP3 
		] 
		movie = "movies\\wdt" 
		play_credits 
		message = "\\n\\c5STORY MODE COMPLETE!\\n\\nYou\'ve completed Story Mode on Sick difficulty and unlocked the \\c5Pro Skater \\c0level!\\n\\nYou\'ve also unlocked playable secret skaters:\\n\\c5Call of Duty Soldier, Nigel Beaverhausen,\\n\\c5German Drunk 1, Mime, and Zombie 1!\\n\\nWhere did all of the footage for the\\nWorld Destruction Tour video go? Take a look...\\n" 
	} 
] 
classic_game_complete_rewards = 
[ 
	{ flags = [ GAME_COMPLETED_CLASSIC_NORMAL 
			MOVIE_UNLOCKED_PRO_BAILS 
			SKATER_UNLOCKED_THPS 
			SKATER_UNLOCKED_STEVEO 
			SKATER_UNLOCKED_PEDGROUP4 
			SKATER_UNLOCKED_SECRETPC2 
		] 
		movie = "movies\\probail1" 
		message = "\\n\\c5CLASSIC MODE COMPLETE!\\n\\nYou\'ve completed Classic Mode on Normal difficulty\\nand unlocked playable secret skaters:\\n\\c5THPS1 Tony Hawk, Nick, Steve-O, Alien Leader,\\n\\c5Inline Skater, and Ramp Kid!\\n" 
	} 
	{ flags = [ GAME_COMPLETED_CLASSIC_SICK 
			MOVIE_UNLOCKED_PRO_BAILS 
			SKATER_UNLOCKED_JESSEJAMES 
			SKATER_UNLOCKED_NATAS 
			SKATER_UNLOCKED_PEDGROUP5 
			SKATER_UNLOCKED_SECRETPC2 
		] 
		movie = "movies\\probail1" 
		message = "\\n\\c5CLASSIC MODE COMPLETE!\\n\\nYou\'ve completed Classic Mode on Sick difficulty\\nand unlocked playable secret skaters:\\n\\c5Jesse James, Nick, Natas Kaupas, Bigfoot, The Imp,\\n\\c5and Space Monkey 2!\\n" 
	} 
] 
story_goal_complete_rewards = 
{ 
	flags = [ CAREER_GOALS_COMPLETE 
		MOVIE_UNLOCKED_PRO_BAILS2 
		SKATER_UNLOCKED_PEDGROUP6 
	] 
	movie = "movies\\probail2" 
	message = "\\n\\c5ALL STORY MODE GOALS COMPLETE!\\n\\nYou\'ve completed every possible goal in Story Mode!\\n\\nYou\'ve unlocked new playable secret skaters:\\n\\c5Aborigine, Camera Man, Construction Worker,\\n\\c5Cut Chemist, German Drunk 2, Graffiti Punk,\\n\\c5Hospital Attendant, Lifeguard, Mayan,\\n\\c5Revolutionary Soldier, and Voodoo Doctor!\\n" 
	already_got_message = "\\n\\c5ALL STORY MODE GOALS COMPLETE!\\n\\nYou\'ve completed every possible goal in Story Mode!\\n\\nYou should work for Neversoft!\\n" 
} 
classic_goal_complete_rewards = 
{ 
	flags = [ CLASSIC_GOALS_COMPLETE 
		MOVIE_UNLOCKED_NS_BAILS 
		SKATER_UNLOCKED_PEDGROUP7 
	] 
	movie = "movies\\nsbails" 
	message = "\\n\\c5ALL CLASSIC MODE GOALS COMPLETE!\\n\\nYou\'ve completed every possible goal in Classic Mode!\\n\\nYou\'ve unlocked new playable secret skaters:\\n\\c5Australian Cop, Bratwurst Vendor, Corn Vendor,\\n\\c5German Cop, German Drunk 3, Horn Player,\\n\\c5Lost Soul 2, Metal Detector Guy, Pirate,\\n\\c5Skatopia Punk, and Zombie 2!\\n" 
	already_got_message = "\\n\\c5ALL CLASSIC MODE GOALS COMPLETE!\\n\\nYou\'ve completed every possible goal in Classic Mode!\\n\\nYou should work for Neversoft!\\n" 
} 
all_gaps_complete_rewards = 
{ 
	flags = [ GOT_ALL_GAPS 
		SKATER_UNLOCKED_PEDGROUP8 
	] 
	message = "\\n\\c5ALL GAPS COMPLETE!\\n\\nAmazing! You\'ve completed all the gaps in this game! You are one of the best Tony Hawk players ever!\\n\\nYou\'ve unlocked new playable secret skaters:\\n\\c5Boxer, Flute Player, Guitar Player,\\n\\c5Lounge Singer, Lost Soul 3, Mayan with Tiki\\n\\c5Mask, Paramedic, Security Guard, Skaboto,\\n\\c5Space Monkey 3 and Wiener Man!\\n" 
} 
want_game_complete_message = 0 
want_goal_complete_message = 0 
want_gaps_complete_message = 0 
want_goal_alt_message = 0 
want_completion_movie = 0 
SCRIPT SetRewardFlagArray 
	GetArraySize <flags> 
	index = 0 
	BEGIN 
		IF NOT GetGlobalFlag flag = ( <flags> [ <index> ] ) 
			SetGlobalFlag flag = ( <flags> [ <index> ] ) 
			new_reward = 1 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN new_reward = <new_reward> 
ENDSCRIPT

SCRIPT GetDifficultyLevelRewards 
	GoalManager_GetDifficultyLevel 
	IF GameModeEquals is_career 
		RETURN ( story_game_complete_rewards [ <difficulty_level> ] ) 
	ELSE 
		RETURN ( classic_game_complete_rewards [ <difficulty_level> ] ) 
	ENDIF 
ENDSCRIPT

SCRIPT GetGoalRewards 
	GoalManager_GetDifficultyLevel 
	IF GameModeEquals is_career 
		RETURN ( story_goal_complete_rewards ) 
	ELSE 
		RETURN ( classic_goal_complete_rewards ) 
	ENDIF 
ENDSCRIPT

SCRIPT ProcessGameRewards 
	
	IF GameModeEquals is_career 
		IF GetGlobalFlag flag = CAREER_SEEN_GAME_COMPLETE_MESSAGE 
			RETURN 
		ENDIF 
		GetArraySize CHAPTER_STATUS 
		GetCurrentChapter 
		IF NOT ( <chapter> = ( <array_size> -1 ) ) 
			RETURN 
		ENDIF 
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
	IF GameModeEquals is_career 
		IF GetGlobalFlag flag = CAREER_SEEN_GOAL_COMPLETE_MESSAGE 
			RETURN 
		ENDIF 
		GetCareerLevelScore get_total 
		IF ( <total_score> < 11000 ) 
			RETURN 
		ENDIF 
		SetGlobalFlag flag = CAREER_SEEN_GOAL_COMPLETE_MESSAGE 
	ELSE 
		IF GetGlobalFlag flag = CLASSIC_SEEN_GOAL_COMPLETE_MESSAGE 
			RETURN 
		ENDIF 
		GetClassicLevelGoalCount get_total 
		IF ( <total_goals_complete> < 140 ) 
			RETURN 
		ENDIF 
		SetGlobalFlag flag = CLASSIC_SEEN_GOAL_COMPLETE_MESSAGE 
	ENDIF 
	GetGoalRewards 
	SetRewardFlagArray flags = <flags> 
	change want_goal_complete_message = 1 
	change want_completion_movie = 1 
	kill_start_key_binding 
	IF GotParam new_reward 
		change want_goal_alt_message = 0 
	ELSE 
		change want_goal_alt_message = 1 
	ENDIF 
ENDSCRIPT

SCRIPT ProcessAllGapsReward 
	IF GetGlobalFlag flag = GOT_ALL_GAPS 
		RETURN 
	ENDIF 
	unlock_all_gameplay_cheat_codes 
	SetRewardFlagArray flags = ( all_gaps_complete_rewards . flags ) 
	IF InNetGame 
		AllGapsCompleteMessage 
	ELSE 
		change want_gaps_complete_message = 1 
		kill_start_key_binding 
		wait 1 seconds 
		DoCompletionMessages 
	ENDIF 
ENDSCRIPT

SCRIPT CheckNeedCompletionMessages 
	IF NOT IsTrue want_game_complete_message 
		IF NOT IsTrue want_goal_complete_message 
			IF NOT IsTrue want_gaps_complete_message 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN need_completion_messages = need_completion_messages 
ENDSCRIPT

waiting_for_complete_message = 0 
SCRIPT DoCompletionMessages 
	CheckNeedCompletionMessages 
	IF GotParam need_completion_messages 
		IF NOT IsTrue waiting_for_complete_message 
			change waiting_for_complete_message = 1 
			SpawnScript WaitUntilScreenClear params = { callback = DoCompletionMessagesNow } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT DoCompletionMessagesNow 
	PauseGame 
	PauseStream 1 
	hide_all_hud_items 
	IF IsTrue want_gaps_complete_message 
		AllGapsCompleteMessage 
		WaitForEvent type = message_accept 
		change want_gaps_complete_message = 0 
	ENDIF 
	IF IsTrue want_goal_complete_message 
		GoalCompleteMessage 
		WaitForEvent type = message_accept 
	ENDIF 
	IF IsTrue want_game_complete_message 
		GameCompleteMessage 
		WaitForEvent type = message_accept 
	ENDIF 
	change waiting_for_complete_message = 0 
	IF NOT IsTrue want_completion_movie 
		KillChapterMenu inside_run need_unpause_streams 
		RETURN 
	ENDIF 
	EndCurrentChapter dont_check_outtros 
	ingame_pre_movie_cleanup 
	IF IsTrue want_game_complete_message 
		GetEndMovieParams 
		IF GotParam movie 
			PlayMovie <movie> 
			last_movie = <movie> 
		ENDIF 
	ENDIF 
	IF IsTrue want_goal_complete_message 
		GetGoalMovieParams 
		IF GotParam last_movie 
			IF StringEquals a = <movie> b = <last_movie> 
				RemoveParameter movie 
			ENDIF 
		ENDIF 
		IF GotParam movie 
			PlayMovie <movie> 
		ENDIF 
	ENDIF 
	MaybePlayCreditsMovie 
	change want_game_complete_message = 0 
	change want_goal_complete_message = 0 
	change want_completion_movie = 0 
	ingame_post_movie_cleanup <...> 
ENDSCRIPT

SCRIPT MaybePlayCreditsMovie 
	IF IsTrue want_game_complete_message 
		GetDifficultyLevelRewards 
		IF GotParam play_credits 
			PlayMovie "movies\\credits" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GameCompleteMessage 
	StopStream 
	PlayStream FoundAllGaps vol = 150 
	GetDifficultyLevelRewards 
	IF GameModeEquals is_career 
		title = "CONGRATULATIONS!" 
	ELSE 
		title = "CONGRATULATIONS!" 
	ENDIF 
	create_snazzy_dialog_box { 
		title = <title> 
		text = <message> 
		text_dims = PAIR(500.00000000000, 0.00000000000) 
		no_bg 
		buttons = [ { font = small text = #"Continue" pad_choose_script = dialog_box_accept } ] 
		style = special_dialog_style 
		delay_input 
		use_shrek_logo = <use_shrek_logo> 
	} 
ENDSCRIPT

SCRIPT GoalCompleteMessage 
	StopStream 
	PlayStream FoundAllGaps vol = 150 
	GetGoalRewards 
	IF IsTrue want_goal_alt_message 
		message = <already_got_message> 
	ENDIF 
	IF GameModeEquals is_career 
		title = "CONGRATULATIONS!" 
	ELSE 
		title = "CONGRATULATIONS!" 
	ENDIF 
	create_snazzy_dialog_box { 
		title = <title> 
		text = <message> 
		text_dims = PAIR(500.00000000000, 0.00000000000) 
		no_bg 
		buttons = [ { font = small text = #"Continue" pad_choose_script = dialog_box_accept } ] 
		delay_input 
		style = special_dialog_style 
	} 
ENDSCRIPT

SCRIPT AllGapsCompleteMessage 
	StopStream 
	PlayStream FoundAllGaps vol = 150 
	create_dialog_box { title = "CONGRATULATIONS!" 
		text = ( all_gaps_complete_rewards . message ) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_dims = PAIR(440.00000000000, 0.00000000000) 
		style = special_dialog_style 
		buttons = [ { font = small text = "Continue" pad_choose_script = dialog_box_accept } ] 
		delay_input 
	} 
ENDSCRIPT

SCRIPT GetEndMovieParams 
	GetDifficultyLevelRewards 
	IF GameModeEquals is_career 
		level = load_se 
	ELSE 
		level = load_se2 
	ENDIF 
	RETURN { movie = <movie> level = <level> } 
ENDSCRIPT

SCRIPT GetGoalMovieParams 
	GetGoalRewards 
	RETURN movie = <movie> 
ENDSCRIPT


