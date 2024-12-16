
total_num_goals = 0 
dont_lock_goals = 0 
total_cheat_points = 0 
current_teammate_pro_appearance_name = none 
CHAPTER_STATUS = [ 
	CHAPTER_UNLOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
	CHAPTER_LOCKED , 
] 
CHAPTER_INTROS_VIEWED = [ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ] 
CHAPTER_OUTTROS_VIEWED = [ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ] 
CHAPTER_INFO = [ 
	{ 
		title = "Chapter 1" 
		level = load_tr 
		level_total_points = 1000 
		points_to_advance = 0 
		no_advance_dialog_on_goal_win 
		setup_script = TR_1_Start 
		post_intro_cutscene_setup = TR_sound_setup 
		cleanup_script = TR_1_End 
		start_cutscenes = [ { name = "cutscenes\\TR_1A.cut" flag = VIEWED_CUTSCENE_01 } 
			{ name = "cutscenes\\TR_1B.cut" flag = VIEWED_CUTSCENE_02 } 
			{ name = "cutscenes\\TR_1C.cut" flag = VIEWED_CUTSCENE_03 } 
		] 
		goal_intro_cameras = Tr_Goal_Intro_Cameras 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "" 
			move_on_now_message = "You ready to get started?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 2" 
		level = load_bo 
		level_total_points = 1000 
		points_to_advance = [ 
			400 
			500 
			800 
		] 
		setup_script = BO_1_Start 
		cleanup_script = BO_1_End 
		end_cutscenes = [ { name = "cutscenes\\BO_2A.cut" flag = VIEWED_CUTSCENE_04 } , 
			{ name = "cutscenes\\BO_2B.cut" flag = VIEWED_CUTSCENE_05 } 
		] 
		goal_intro_cameras = BO_Goal_Intro_Cameras 
		text_message_point_triggers = [ 
			{ 
				points = 5 
				text = { 
					priority_message 
					from = "Tony Hawk" 
					message = "You banked your first points! Every once in a while you will receive a text message. Check these messages as they might contain important and useful information. The phone icon will appear when you have a new message. Pause the game and select \'View Messages\' to read these." 
				} 
			} 
			{ 
				points = [ 
					200 
					250 
					400 
				] 
				text = { 
					from = "Bam Margera" 
					message = "What do you get when you blast a fire hose at a bunch of drunks through an electric fence? 100 points for my team! Top that, sucker!" 
				} 
			} 
			{ 
				points = points_to_advance 
				text = { 
					priority_message 
					from = "Tony Hawk" 
					message = "Good job! I think we have enough points now to take the lead on Bam\'s team. I\'m hanging out on the street over by Jeers. Come see me when you are ready to move on to the next city!" 
					reply_script = GotoNextChapterAccept 
					reply_text = "REPLY: \'LET\'S GO NOW!\'" 
				} 
			} 
			{ 
				points = 1000 
				text = { 
					from = "Tony Hawk" 
					message = "Wow! We\'ve completed every possible goal in this level. Let\'s move on to the next city." 
				} 
			} 
		] 
		selectable_pros = [ Burnquist , Mullen , Muska , Vallely ] 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 3" 
		level = load_ba 
		level_total_points = 1000 
		points_to_advance = [ 
			400 
			500 
			800 
		] 
		setup_script = BA_1_Start 
		cleanup_script = BA_1_End 
		goal_intro_cleanup = BA_1_Message 
		end_cutscenes = [ { name = "cutscenes\\BA_3.cut" flag = VIEWED_CUTSCENE_06 } , 
			{ name = "cutscenes\\BA_3B.cut" flag = VIEWED_CUTSCENE_14 } 
		] 
		goal_intro_cameras = BA_Goal_Intro_Cameras 
		text_message_point_triggers = [ 
			{ 
				points = [ 
					200 
					250 
					400 
				] 
				text = { 
					from = "Wee-Man" 
					message = "I heard that someone got 100 points for using a leaf blower to rocket launch Phil\'s crusty underpants into the face of some Spaniards! Oh yea, that was me! Ha! You suck!" 
				} 
			} 
			{ 
				points = points_to_advance 
				text = { 
					priority_message 
					from = "Tony Hawk" 
					message = "We have to be in the lead with all of the points you have scored. I think we are safe to leave this city now. I\'m out near the street so come see me and we\'ll tally up our points!" 
					reply_script = GotoNextChapterAccept 
					reply_text = "REPLY: \'LET\'S GO NOW!\'" 
				} 
			} 
			{ 
				points = [ 
					500 
					750 
					750 
				] 
				text = { 
					from = "Bob Burnquist" 
					message = "In case anyone cares, yes my nuts are finally healing. And yes, one of them still has the markings of a tennis ball. Thanks!" 
				} 
			} 
			{ 
				points = 1000 
				text = { 
					from = "Tony Hawk" 
					message = "I didn\'t think we could do it, but we\'ve scored all of the possible points in this city! Let\'s get out of here!" 
				} 
			} 
		] 
		selectable_pros = [ Mullen , Muska , Vallely ] 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "Complete some more goals and then come back to see me." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 4" 
		level = load_be 
		level_total_points = 1000 
		points_to_advance = [ 
			400 
			500 
			800 
		] 
		setup_script = BE_1_Start 
		cleanup_script = BE_1_End 
		end_cutscenes = [ { name = "cutscenes\\BE_4A.cut" flag = VIEWED_CUTSCENE_07 } , 
			{ name = "cutscenes\\BE_4B.cut" flag = VIEWED_CUTSCENE_08 } 
		] 
		goal_intro_cameras = BE_Goal_Intro_Cameras 
		text_message_point_triggers = [ 
			{ 
				points = [ 
					200 
					250 
					400 
				] 
				text = { 
					from = "Tony Hawk" 
					message = "Oh man, Sparrow just tried to do a blindfolded 900 and took out an entire polka band! I think he might have even killed the tuba player. We need you back!" 
				} 
			} 
			{ 
				points = points_to_advance 
				text = { 
					priority_message 
					from = "Bam Margera" 
					message = "We have killed this city. Those dorks on Tony\'s team are probably still trying to do kickflips. I say we leave and get a head start on the next city. Meet up with Phil when you want to leave." 
					reply_script = GotoNextChapterAccept 
					reply_text = "REPLY: \'LET\'S GO NOW!\'" 
				} 
			} 
			{ 
				points = 1000 
				text = { 
					from = "Bam Margera" 
					message = "Dude, YOU ruled this city! We\'ve got all the points we can get, so let\'s make like trees and leave!" 
				} 
			} 
		] 
		selectable_pros = [ Margera ] 
		advance_ped_info = { 
			name = "Phil" 
			need_more_points_message = "You don\'t have enough points yet." 
			move_on_now_message = "Ready to go to the next city?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 5" 
		level = load_au 
		level_total_points = 1000 
		points_to_advance = [ 
			400 
			500 
			800 
		] 
		setup_script = AU_1_Start 
		cleanup_script = AU_1_End 
		goals_script = AU_Main_Story_goals 
		end_cutscenes = [ { name = "cutscenes\\AU_5.cut" flag = VIEWED_CUTSCENE_09 } ] 
		goal_intro_cameras = AU_Goal_Intro_Cameras 
		text_message_point_triggers = [ 
			{ 
				points = 50 
				text = { 
					from = "Thai-Baby68" 
					message = "You throw big good-time party! You come back Thailand soon! I call you phone number you give but man name Bob Burnquist answer. Who he?\\nP.S. How to get water buffalo off grandfather\'s roof?" 
				} 
			} 
			{ 
				points = points_to_advance 
				text = { 
					priority_message 
					from = "Tony Hawk" 
					message = "It\'s good to have you back! Our team performed really well here in Australia. I think we\'re ready to take off. If you want to come with us, come and see me." 
					reply_script = GotoNextChapterAccept 
					reply_text = "REPLY: \'LET\'S GO NOW!\'" 
				} 
			} 
			{ 
				points = 1000 
				text = { 
					from = "Tony Hawk" 
					message = "You\'ve cleared your list! Australia is out of things for us to do. Let\'s hit the road!" 
				} 
			} 
		] 
		selectable_pros = [ Mullen , Muska , Vallely ] 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 6" 
		level = load_au 
		level_total_points = 2000 
		points_to_advance = 1000 
		setup_script = AU_2_Start 
		cleanup_script = AU_2_End 
		goals_script = AU_Capstone_Story_goals 
		end_cutscenes = [ { name = "cutscenes\\AU_6.cut" flag = VIEWED_CUTSCENE_10 } ] 
		goal_intro_setup = AU_goal_intro_setup 
		goal_intro_cameras = AU_Elimination_Intro_Cameras 
		goal_intro_cleanup = AU_goal_intro_cleanup 
		text_message_point_triggers = [ 
			{ 
				points = 50 
				text = { 
					from = "Eric Sparrow" 
					message = "I\'ve got this one locked up! You can\'t possibly do something better... I stole Nigel\'s clothes! I\'m brilliant!" 
				} 
			} 
		] 
		should_do_fake_nigel = 0 
		skater_start_node = TRG_Restart_Elimination 
		capstone_chapter 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 7" 
		level = load_no 
		level_total_points = 1000 
		points_to_advance = [ 
			400 
			500 
			800 
		] 
		setup_script = NO_1_Start 
		cleanup_script = NO_1_End 
		goals_script = NO_Main_Story_goals 
		end_cutscenes = [ { name = "cutscenes\\NO_7.cut" flag = VIEWED_CUTSCENE_11 } ] 
		goal_intro_cameras = NO_Goal_Intro_Cameras 
		text_message_point_triggers = [ 
			{ 
				points = [ 
					200 
					250 
					400 
				] 
				text = { 
					from = "Paulie" 
					message = "Hey pork sniffer! Let me know when you come close to my score. I\'ll be treating the ladies to a hot plate of southern fried Paulie!" 
				} 
			} 
			{ 
				points = points_to_advance 
				text = { 
					priority_message 
					from = "Tony Hawk" 
					message = "Right on! We\'ve got more points than Bam can count. When you think you\'ve had enough, come see me!" 
					reply_script = GotoNextChapterAccept 
					reply_text = "REPLY: \'LET\'S GO NOW!\'" 
				} 
			} 
			{ 
				points = 1000 
				text = { 
					from = "Tony Hawk" 
					message = "Our team has cleaned up Nawlins! Nothing more to do here, so let\'s head on out!" 
				} 
			} 
		] 
		selectable_pros = [ Mullen , Muska , Vallely ] 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 8" 
		level = load_no 
		level_total_points = 2000 
		points_to_advance = 1000 
		setup_script = NO_2_Start 
		cleanup_script = NO_2_End 
		goals_script = NO_Capstone_Story_goals 
		end_cutscenes = [ { name = "cutscenes\\NO_8.cut" flag = VIEWED_CUTSCENE_12 } ] 
		goal_intro_setup = NO_goal_intro_setup 
		goal_intro_cameras = NO_Equalizer_Intro_Cameras 
		goal_intro_cleanup = NO_goal_intro_cleanup 
		skater_start_node = TRG_Restart_Equalizer_Intro 
		capstone_chapter 
		advance_ped_info = { 
			name = "Tony" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 9" 
		level = load_st 
		level_total_points = 1000 
		points_to_advance = [ 
			400 
			500 
			800 
		] 
		setup_script = ST_1_Start 
		cleanup_script = ST_1_End 
		goals_script = ST_Main_Story_goals 
		goal_intro_cameras = ST_Goal_Intro_Cameras 
		text_message_point_triggers = [ 
			{ 
				points = [ 
					200 
					250 
					400 
				] 
				text = { 
					from = "Mike Vallely" 
					message = "We\'re in jail but we should be rollin\' your way soon. Beaverhausen will be here to bail us out any minute. Before we got nabbed, we stole his truck!" 
				} 
			} 
			{ 
				points = points_to_advance 
				text = { 
					priority_message 
					from = "Tony Hawk" 
					message = "I really think we have enough points to win this thing! Let\'s go see Bam and we\'ll call a final point tally!" 
					reply_script = GotoNextChapterAccept 
					reply_text = "REPLY: \'LET\'S GO NOW!\'" 
				} 
			} 
			{ 
				points = 1000 
				text = { 
					from = "Tony Hawk" 
					message = "There is no way that Bam\'s guys can beat us now... you scored so many points! Come meet up with me so we can hand Bam and his team the loser trophy!" 
				} 
			} 
		] 
		selectable_pros = [ Hawk ] 
		advance_ped_info = { 
			name = "Bam" 
			need_more_points_message = "You better get some more points and come back." 
			move_on_now_message = "You ready to end this thing?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 10" 
		level = load_st 
		level_total_points = 2000 
		points_to_advance = 1000 
		setup_script = ST_2_Start 
		cleanup_script = ST_2_End 
		goals_script = ST_Capstone_Story_goals 
		goal_intro_setup = ST_EndGoal_Bam_intro_setup 
		goal_intro_cameras = ST_EndGoal_Bam_Cameras 
		goal_intro_cleanup = ST_EndGoal_Bam_intro_cleanup 
		force_skater_swap = { profile_name = Margera obj = TRG_Ped_Endgoal_Bam1 } 
		skater_start_node = TRG_restart_finalgoal 
		capstone_chapter 
		advance_ped_info = { 
			name = "Bam" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 11" 
		level = load_st 
		level_total_points = 3000 
		points_to_advance = 1000 
		setup_script = ST_3_Start 
		cleanup_script = ST_3_End 
		goals_script = ST_Capstone_Story_goals_part2 
		goal_intro_setup = ST_EndGoal_Hawk_intro_setup 
		goal_intro_cameras = ST_EndGoal_Hawk_Cameras 
		goal_intro_cleanup = ST_EndGoal_Hawk_intro_cleanup 
		force_skater_swap = { profile_name = Hawk obj = TRG_Ped_Endgoal_Hawk1 } 
		skater_start_node = TRG_restart_finalgoal2 
		capstone_chapter 
		advance_ped_info = { 
			name = "Bam" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
	{ 
		title = "Chapter 12" 
		level = load_st 
		level_total_points = 4000 
		points_to_advance = 1000 
		setup_script = ST_4_Start 
		cleanup_script = ST_4_End 
		goals_script = ST_Capstone_Story_goals_part3 
		end_cutscenes = [ { name = "cutscenes\\SK_9.cut" flag = VIEWED_CUTSCENE_13 } ] 
		post_outtro_cutscene_setup = ST_4_End 
		goal_intro_setup = ST_EndGoal_End_setup 
		goal_intro_cameras = ST_EndGoal_End_Cameras 
		goal_intro_cleanup = ST_EndGoal_End_cleanup 
		skater_start_node = [ 
			TRG_restart_finalgoal4 
			TRG_restart_finalgoal3 
			TRG_restart_finalgoal3 
		] 
		capstone_chapter 
		last_chapter 
		advance_ped_info = { 
			name = "Bam" 
			need_more_points_message = "Yo, complete some more goals and come back." 
			move_on_now_message = "You ready to move on?" 
			already_moved_on_message = "Hey, check your level select screen to move on." 
		} 
	} 
] 
SCRIPT SetCurrentTeammateProAppearanceName 
ENDSCRIPT

SCRIPT GetChapterSelectableProCount 
	IF NOT GameModeEquals is_career 
		RETURN selectable_pro_count = 0 
	ENDIF 
	GetCurrentChapterInfo 
	IF NOT LevelIs <level> 
		RETURN selectable_pro_count = 0 
	ENDIF 
	IF NOT GotParam selectable_pros 
		RETURN selectable_pro_count = 0 
	ENDIF 
	GetArraySize <selectable_pros> 
	RETURN selectable_pro_count = <array_size> 
ENDSCRIPT

SCRIPT IsCurrentChapterCapstone 
	GetCurrentChapterInfo 
	IF GotParam capstone_chapter 
		RETURN capstone_chapter 
	ENDIF 
ENDSCRIPT

SCRIPT GetValueFromDifficultyParam 
	GoalManager_GetDifficultyLevel 
	IF IsArray <param> 
		RETURN value = ( <param> [ <difficulty_level> ] ) 
	ELSE 
		RETURN value = <param> 
	ENDIF 
ENDSCRIPT

SCRIPT GetCurrentPointsToAdvance 
	GetCurrentChapterInfo 
	GetValueFromDifficultyParam param = <points_to_advance> 
	RETURN points_to_advance = <value> 
ENDSCRIPT

SCRIPT SetHighestChapterWithLevel 
	IF CD 
		IF LevelIs <level> 
			RETURN 
		ENDIF 
	ENDIF 
	force = 0 
	GetArraySize CHAPTER_STATUS 
	index = ( <array_size> -1 ) 
	BEGIN 
		IF ( CHAPTER_INFO [ <index> ] . level = <level> ) 
			IF ( CHAPTER_STATUS [ <index> ] = CHAPTER_LOCKED ) 
				IF ( all_levels_unlocked = 1 ) 
					target_chapter = <index> 
					force = 1 
				ENDIF 
			ELSE 
				IF ( CHAPTER_STATUS [ <index> ] = CHAPTER_COMPLETE ) 
					target_chapter = <index> 
				ELSE 
					force = 0 
					target_chapter = <index> 
					BREAK 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> -1 ) 
	REPEAT <array_size> 
	IF GotParam target_chapter 
		change chapter_post_cutscene_target_chapter = <target_chapter> 
		change chapter_post_cutscene_force_unlock = <force> 
		EndCurrentChapter callback = SetHighestChapterWithLevelPostCutscene 
	ELSE 
		printf "Warning! No chapter found....is this a secret level?" 
		EndCurrentChapter dont_check_outtros 
	ENDIF 
ENDSCRIPT

chapter_post_cutscene_target_chapter = 0 
chapter_post_cutscene_force_unlock = 0 
SCRIPT SetHighestChapterWithLevelPostCutscene 
	IF ( chapter_post_cutscene_force_unlock = 1 ) 
		SetCurrentChapter chapter = 0 
		BEGIN 
			UnlockNextChapter 
			AdvanceStage 
		REPEAT ( chapter_post_cutscene_target_chapter ) 
	ELSE 
		SetCurrentChapter chapter = ( chapter_post_cutscene_target_chapter ) 
	ENDIF 
	IF GotParam from_cutscenes 
		LoadCurrentChapter 
	ENDIF 
ENDSCRIPT

SCRIPT UnlockNextChapter 
	MarkChapterComplete 
	GetCurrentChapter 
	next_chapter = ( <chapter> + 1 ) 
	GetArraySize CHAPTER_STATUS 
	IF NOT ( <next_chapter> < <array_size> ) 
		printf "No more chapters to unlock" 
	ELSE 
		CheckIfChapterIntrosViewed next 
		IF ( <viewed> = 0 ) 
			IF ( CHAPTER_STATUS [ <next_chapter> ] = CHAPTER_LOCKED ) 
				<status_array> = CHAPTER_STATUS 
				SetArrayElement ArrayName = status_array index = <next_chapter> NewValue = CHAPTER_UNLOCKED 
			ENDIF 
			level = ( ( CHAPTER_INFO [ <next_chapter> ] ) . level ) 
			GetArraySize level_select_menu_level_info 
			index = 0 
			BEGIN 
				IF ( ( level_select_menu_level_info [ <index> ] . level ) = <level> ) 
					SetGlobalFlag flag = ( level_select_menu_level_info [ <index> ] . flag ) 
					IF NOT GotParam dont_set_seen_flags 
						IF StructureContains structure = ( level_select_menu_level_info [ <index> ] ) seen_flag 
							SetGlobalFlag flag = ( level_select_menu_level_info [ <index> ] . seen_flag ) 
						ENDIF 
					ENDIF 
					BREAK 
				ENDIF 
				index = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CheckIfChapterUnlocked 
	GetCurrentChapter 
	IF GotParam next 
		chapter = ( <chapter> + 1 ) 
	ENDIF 
	GetArraySize CHAPTER_STATUS 
	IF NOT ( <chapter> < <array_size> ) 
	ELSE 
		IF NOT ( CHAPTER_STATUS [ <chapter> ] = CHAPTER_LOCKED ) 
			RETURN unlocked = 1 
		ENDIF 
	ENDIF 
	RETURN unlocked = 0 
ENDSCRIPT

SCRIPT SendPagerMessageWithDelay send_delay = 2 
	wait <send_delay> seconds 
	Skater : SendPagerMessage <text> 
ENDSCRIPT

SCRIPT CheckCurrentTextMessageTriggers 
	GetCurrentChapterInfo 
	IF GotParam text_message_point_triggers 
		GetArraySize <text_message_point_triggers> 
		index = 0 
		BEGIN 
			GetValueFromDifficultyParam param = ( <text_message_point_triggers> [ <index> ] . points ) 
			IF ( <value> = points_to_advance ) 
				GetCurrentPointsToAdvance 
				value = <points_to_advance> 
			ENDIF 
			IF ( <value> > <before> ) 
				IF NOT ( <value> > <after> ) 
					SpawnScript SendPagerMessageWithDelay params = { ( <text_message_point_triggers> [ <index> ] ) } 
				ENDIF 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
ENDSCRIPT

SCRIPT WaitUntilScreenClear pass = 0 
	wait 0.20000000298 seconds 
	BEGIN 
		wait 1 gameframes 
		IF Skater : OnGround 
			root_window : GetSingleTag menu_state 
			IF ( <menu_state> = off ) 
				IF NOT ScreenElementExists id = speech_box_anchor 
					IF NOT ScreenElementExists id = goal_description_anchor 
						IF NOT ScreenElementExists id = current_menu_anchor 
							IF ( <pass> = 2 ) 
								wait 1 gameframes 
								RemoveParameter pass 
								SafeCallback <...> 
								RETURN 
							ELSE 
								BREAK 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		pass = 0 
	REPEAT 
	pass = ( <pass> + 1 ) 
	GotoPreserveParams WaitUntilScreenClear 
ENDSCRIPT

SCRIPT CheckChapterAdvancementStatus 
	IF NOT GameModeEquals is_career 
		RETURN 
	ENDIF 
	GoalManager_GetActiveRewardPoints 
	GetCurrentPointsToAdvance 
	IF GotParam RewardPoints 
		CheckCurrentTextMessageTriggers before = ( <active_points> - <RewardPoints> ) after = <active_points> 
	ENDIF 
	IF IsTrue DEMO_BUILD 
		IF LevelIs load_ba 
			RETURN 
		ENDIF 
	ENDIF 
	ProcessGameRewards 
	ProcessGoalRewards 
	IF NOT ( <active_points> < <points_to_advance> ) 
		UnlockNextChapter 
		GetCurrentChapterInfo 
		IF NOT GotParam no_advance_dialog_on_goal_win 
			IF GotParam capstone_chapter 
				change waiting_for_complete_message = 1 
				GetArraySize CHAPTER_STATUS 
				GetCurrentChapter 
				IF NOT LevelIs load_st 
					SpawnScript WaitUntilScreenClear params = { callback = GotoNextChapter } 
				ELSE 
					SpawnScript GotoNextChapter 
				ENDIF 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	DoCompletionMessages 
ENDSCRIPT

SCRIPT AdvanceStage 
	GetCurrentChapter 
	chapter = ( <chapter> + 1 ) 
	GetArraySize CHAPTER_STATUS 
	IF ( <chapter> = <array_size> ) 
		printf "No more chapters to advance" 
	ELSE 
		SetCurrentChapter chapter = <chapter> 
	ENDIF 
ENDSCRIPT

SCRIPT GetCurrentChapterInfo 
	GetCurrentChapter 
	GetArraySize CHAPTER_INFO 
	IF ( ( <chapter> < 0 ) | ( <chapter> > ( <array_size> - 1 ) ) ) 
		script_assert "current_chapter has bad value %i" i = <chapter> 
	ENDIF 
	RETURN ( CHAPTER_INFO [ <chapter> ] ) 
ENDSCRIPT

SCRIPT GotoNextChapter 
	EndCurrentChapter callback = GoToNextChapterPostCutscene 
ENDSCRIPT

SCRIPT GoToNextChapterPostCutscene 
	GetCurrentChapterInfo 
	IF GotParam post_outtro_cutscene_setup 
		<post_outtro_cutscene_setup> 
	ENDIF 
	UnlockNextChapter 
	IF GotParam last_chapter 
		GetCurrentChapter 
		SetCurrentChapter chapter = 8 
	ELSE 
		AdvanceStage 
	ENDIF 
	change waiting_for_complete_message = 0 
	IF IsTrue want_completion_movie 
		DoCompletionMessages 
	ELSE 
		LoadCurrentChapter 
	ENDIF 
ENDSCRIPT

SCRIPT LoadCurrentChapter 
	GetCurrentChapterInfo 
	IF NOT LevelIs <level> 
		change_level level = <level> 
	ELSE 
		StartCurrentChapter 
	ENDIF 
ENDSCRIPT

SCRIPT GoToPreviousChapter 
	EndCurrentChapter 
	GetCurrentChapter 
	chapter = ( <chapter> -1 ) 
	IF ( <chapter> > -1 ) 
		SetCurrentChapter chapter = <chapter> 
	ENDIF 
	LoadCurrentChapter 
ENDSCRIPT

SCRIPT SetUpChapterMenu 
	change dont_restore_start_key_binding = 1 
	Skater : PausePhysics 
	Skater : RemoveSkaterFromWorld 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	hide_all_hud_items dont_restore_input 
	kill_start_key_binding 
	PauseMusic 1 
	root_window : SetTags menu_state = on 
	SafeCallback <...> 
ENDSCRIPT

SCRIPT KillChapterMenu 
	dialog_box_exit 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam need_unpause_streams 
		PauseStream 0 
	ENDIF 
	IF GotParam inside_run 
		UnPauseGame 
		UnPauseSkaters 
		show_all_hud_items 
	ELSE 
		IF GotParam mark_first_input 
			mark_first_input_received <...> 
		ENDIF 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		root_window : SetTags menu_state = off 
		change dont_restore_start_key_binding = 0 
		restore_start_key_binding 
		PauseMusic 0 
		Skater : UnpausePhysics 
		Skater : AddSkaterToWorld 
		show_all_hud_items 
	ENDIF 
	SafeCallback <...> 
ENDSCRIPT

SCRIPT PlayChapterCutsceneList index = 0 
	IF NOT GotParam list 
		RETURN 
	ENDIF 
	GetArraySize <list> 
	IF ( <array_size> = 0 ) 
		RETURN 
	ENDIF 
	IF ( <index> = <array_size> ) 
		SafeCallback <...> from_cutscenes = from_cutscenes 
		RETURN 
	ENDIF 
	IF ( <index> = 0 ) 
		unload = 1 
		UnPauseGame 
		PauseMusic 0 
	ELSE 
		unload = 0 
	ENDIF 
	IF ( <index> = ( <array_size> -1 ) ) 
		reload = 1 
	ELSE 
		reload = 0 
	ENDIF 
	exit_params = { list = <list> 
		index = ( <index> + 1 ) 
		callback = <callback> 
	} 
	IF StructureContains structure = ( <list> [ <index> ] ) flag 
		IF GetGlobalFlag flag = ( ( <list> [ <index> ] ) . flag ) 
			PlayChapterCutsceneList <exit_params> 
			RETURN 
		ELSE 
			SetGlobalFlag flag = ( ( <list> [ <index> ] ) . flag ) 
		ENDIF 
	ENDIF 
	play_cutscene_only_if_good { 
		name = ( ( <list> [ <index> ] ) . name ) 
		unload_anims = <unload> 
		unload_goals = <unload> 
		reload_anims = <reload> 
		reload_goals = <reload> 
		exitScript = PlayChapterCutsceneList 
		exitParams = <exit_params> 
	} 
ENDSCRIPT

SCRIPT get_is_cutscene_bad 
	<bad_cutscene> = 0 
	RETURN bad_cutscene = <bad_cutscene> cutscene_name = <cutscene_name> 
ENDSCRIPT

SCRIPT play_cutscene_only_if_good 
	IF IsNgc 
		get_is_cutscene_bad name = <name> 
	ELSE 
		<bad_cutscene> = 0 
	ENDIF 
	IF IsNgc 
		IF StringEquals a = <name> b = "cutscenes\\no_7.cut" 
			Skater : Obj_ClearGeoms 
		ENDIF 
	ENDIF 
	IF ( <bad_cutscene> = 0 ) 
		RemoveComponent bad_cutscene 
		RemoveComponent cutscene_name 
		PlayCutscene <...> 
	ELSE 
		IF ( <unload_goals> = 1 ) 
			IF GameModeEquals is_classic 
				GoalManager_PauseAllGoals 
			ELSE 
				GoalManager_UninitializeAllGoals 
			ENDIF 
		ENDIF 
		IF ( <unload_anims> = 1 ) 
			IF InPreFile "skaterparts.pre" 
				UnloadPreFile "skaterparts.pre" 
				cutscene_skaterparts_unloaded = 1 
			ENDIF 
			do_unload_unloadable 
		ENDIF 
		IF NOT GotParam cutscene_name 
			script_assert "no cutscene name!" 
		ENDIF 
		FormatText ChecksumName = start_script "%i_begin" i = <cutscene_name> 
		IF ScriptExists <start_script> 
			<start_script> 
		ENDIF 
		IF ( <reload_anims> = 1 ) 
			IF ( cutscene_skaterparts_unloaded = 1 ) 
				LoadPreFile "skaterparts.pre" 
				change cutscene_skaterparts_unloaded = 0 
			ENDIF 
			do_load_unloadable 
		ENDIF 
		IF ( <reload_goals> = 1 ) 
			IF GameModeEquals is_classic 
				GoalManager_UnPauseAllGoals 
				show_goal_panel_messages 
			ELSE 
				GoalManager_InitializeAllGoals 
			ENDIF 
		ELSE 
			DisplayLoadingScreen Blank 
		ENDIF 
		FormatText ChecksumName = end_script "%i_end" i = <cutscene_name> 
		IF ScriptExists <end_script> 
			<end_script> 
		ENDIF 
		<exitScript> <exitParams> 
	ENDIF 
ENDSCRIPT

SCRIPT CheckIfChapterIntrosViewed 
	GetCurrentChapter 
	IF GotParam next 
		chapter = ( <chapter> + 1 ) 
		GetArraySize CHAPTER_STATUS 
		IF ( <chapter> = <array_size> ) 
			RETURN viewed = 1 
		ENDIF 
	ENDIF 
	RETURN viewed = ( CHAPTER_INTROS_VIEWED [ <chapter> ] ) 
ENDSCRIPT

SCRIPT CheckIfChapterOuttrosViewed 
	GetCurrentChapter 
	RETURN viewed = ( CHAPTER_OUTTROS_VIEWED [ <chapter> ] ) 
ENDSCRIPT

SCRIPT MarkChapterIntrosViewed 
	GetCurrentChapter 
	<status_array> = CHAPTER_INTROS_VIEWED 
	SetArrayElement ArrayName = status_array index = <chapter> NewValue = 1 
ENDSCRIPT

SCRIPT MarkChapterOuttrosViewed 
	GetCurrentChapter 
	<status_array> = CHAPTER_OUTTROS_VIEWED 
	SetArrayElement ArrayName = status_array index = <chapter> NewValue = 1 
ENDSCRIPT

SCRIPT MarkChapterComplete 
	GetCurrentChapter 
	<status_array> = CHAPTER_STATUS 
	SetArrayElement ArrayName = status_array index = <chapter> NewValue = CHAPTER_COMPLETE 
ENDSCRIPT

chapter_goals_loaded = 0 
SCRIPT GetOptionalChapterGoalsScript 
	change chapter_goals_loaded = 1 
	new_level = <level> 
	GetCurrentChapterInfo 
	IF NOT ( <level> = <new_level> ) 
		RETURN 
	ENDIF 
	IF GotParam goals_script 
		RETURN goals_script = <goals_script> 
	ENDIF 
ENDSCRIPT

SCRIPT StartCurrentChapter 
	SetCurrentTeammateProAppearanceName 
	change total_cheat_points = 0 
	update_goal_points_display refresh 
	Skater : StatsManager_ActivateGoals 
	IF ScreenElementExists id = new_ammo_message 
		DestroyScreenElement id = new_ammo_message 
		DestroyScreenElement id = new_ammo_message2 
	ENDIF 
	GetCurrentChapterInfo 
	IF NOT LevelIs <level> 
		create_select_pro_menu from_chapter_intro 
		RETURN 
	ENDIF 
	IF GotParam goals_script 
		IF ( chapter_goals_loaded = 0 ) 
			PushMemProfile "Goals script" 
			<goals_script> 
			PopMemProfile 
			init_goal_manager 
			change chapter_goals_loaded = 1 
		ENDIF 
	ENDIF 
	CheckIfChapterIntrosViewed 
	IF GotParam setup_script 
		<setup_script> 
	ENDIF 
	IF ( <viewed> = 1 ) 
		IF GotParam capstone_chapter 
			StartCurrentChapterStartRun 
		ELSE 
			create_select_pro_menu from_chapter_intro 
		ENDIF 
		RETURN 
	ELSE 
		IF GotParam level_total_points 
			SetLevelTotalPoints <level_total_points> 
			printf <level_total_points> 
		ENDIF 
		MarkChapterIntrosViewed 
	ENDIF 
	root_window : SetTags menu_state = on 
	IF GotParam start_cutscenes 
		printf "Playing cutscene..." 
		PlayChapterCutsceneList list = ( <start_cutscenes> ) callback = StartCurrentChapterStartRun 
		RETURN 
	ENDIF 
	StartCurrentChapterStartRun 
ENDSCRIPT

fake_nigel_active = 0 
SCRIPT StartCurrentChapterWelcome 
	GetCurrentChapterInfo 
	KillChapterMenu 
	IF NOT LevelIs <level> 
		RETURN 
	ENDIF 
	IF GotParam skater_start_node 
		GetValueFromDifficultyParam param = <skater_start_node> 
		Skater : Obj_MoveToNode name = <value> Orient 
	ENDIF 
	IF GotParam force_skater_swap 
		ChapterForceSkaterSwap <force_skater_swap> 
	ENDIF 
	IF GotParam should_do_fake_nigel 
		IF ( <should_do_fake_nigel> = 1 ) 
			do_fake_nigel 
		ENDIF 
	ENDIF 
	IF GotParam welcome_dialog 
		<welcome_dialog> 
	ENDIF 
ENDSCRIPT

SCRIPT do_fake_nigel 
	IF NOT GetGlobalFlag flag = TRICK_UNLOCKED_BEAVERBLAST 
		SetGlobalFlag flag = TRICK_UNLOCKED_BEAVERBLAST 
		AwardNewSpecialTrickToProfile { 
			all_profiles 
			trick = Trick_BeaverBlast 
			key_combo = SpAir_L_R_Square 
		} 
	ENDIF 
	IF IsTrue fake_nigel_active 
		script_assert "fake_nigel is already active?!?" 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	RememberTemporaryAppearance player = <currentSkaterProfileIndex> name = fake_nigel_temp_profile NoFaceTexture 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	IF ( <is_male> = 1 ) 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = sleeves desc_id = none } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_torso desc_id = none } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_legs desc_id = Briefs } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_hands desc_id = Hands } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = shoes desc_id = BareFeet } 
	ELSE 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = sleeves desc_id = none } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_torso desc_id = none } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_legs desc_id = none } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_hands desc_id = Hands } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = shoes desc_id = BareFeet } 
	ENDIF 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = socks } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = socks_lower } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = shoe_laces } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = kneepads } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = elbowpads } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = accessory1 } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = accessory2 } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = accessory3 } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = hat } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = skater_m_hair } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = skater_f_hair } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = sleeves desc_id = none } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_torso desc_id = Shirt_Nigel_Costume } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_jaw desc_id = %"Honest Abe" h = 325 s = 65 v = 20 use_default_hsv = 0 } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_hair desc_id = %"Ponytail 1" h = 20 s = 41 v = 26 use_default_hsv = 0 } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = glasses desc_id = Specs_Nigel_Costume } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = torso_bone_group } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = stomach_bone_group } 
	RememberTemporaryAppearance player = <currentSkaterProfileIndex> name = fake_nigel_temp_profile_save NoFaceTexture 
	refresh_skater_model 
	change fake_nigel_active = 1 
ENDSCRIPT

SCRIPT undo_fake_nigel 
	IF IsTrue fake_nigel_active 
		GetCurrentSkaterProfileIndex 
		RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = fake_nigel_temp_profile NoFaceTexture 
		refresh_skater_model 
		change fake_nigel_active = 0 
	ENDIF 
ENDSCRIPT

SCRIPT ChapterForceSkaterSwap 
	IF NOT isAlive name = <obj> 
		create name = <obj> 
	ENDIF 
	Skater : swap_skaters objid = <obj> profile_name = <profile_name> no_ped_setup 
	<obj> : Hide 
ENDSCRIPT

SCRIPT story_intro_advance_cam 
	intro_camera_event_handler : SetTags pressed_x 
ENDSCRIPT

SCRIPT PlaySingleIntroVirtualCamera 
	PlaySkaterCamAnim { 
		name = <name> 
		skaterId = <skaterId> 
		targetID = <targetID> 
		targetOffset = <targetOffset> 
		positionOffset = <positionOffset> 
		frames = <frames> 
		skippable = 0 
		virtual_cam 
	} 
ENDSCRIPT

SCRIPT PlayIntroSkaterCam 
	IF NOT GotParam cam 
		RETURN 
	ENDIF 
	IF StructureContains structure = <cam> name 
		PlaySkaterCamAnim name = ( <cam> . name ) skippable = 0 
	ELSE 
		GetIntroSkaterCamName <...> 
		PlaySingleIntroVirtualCamera <cam> name = <name> 
	ENDIF 
ENDSCRIPT

SCRIPT GetIntroSkaterCamName 
	IF StructureContains structure = <cam> name 
		RETURN name = ( <cam> . name ) 
	ELSE 
		FormatText ChecksumName = moviename "intro_cam_%i" i = <index> 
		RETURN name = <moviename> 
	ENDIF 
ENDSCRIPT

SCRIPT IntroCameraDescription 
	IF NOT GotParam text 
		IF NOT GotParam goal 
			RETURN 
		ENDIF 
	ENDIF 
	KillSpawnedScript name = TemporarilyDisableInput 
	SetButtonEventMappings block_menu_input 
	IF ( <cam_index> = 0 ) 
		SpawnScript TemporarilyDisableInput params = { time = 1000 } 
	ELSE 
		SpawnScript TemporarilyDisableInput params = { time = 300 } 
	ENDIF 
	IF GotParam text 
		create_panel_block { id = intro_panel 
			text = <text> 
			rgba = [ 128 128 128 128 ] 
			pos = PAIR(12.00000000000, 395.00000000000) 
			time = <time> 
			dims = PAIR(616.00000000000, 0.00000000000) 
			just = [ left center ] 
			internal_just = [ center top ] 
			parent = root_window 
		} 
	ELSE 
		time2 = 1000000 
		GoalManager_GetGoalParams name = <goal> 
		FormatText TextName = goal_desc "\\c0%a - \\c5%b PTS." a = <view_goals_text> b = <reward_points> 
		create_intro_panel_block { id = intro_panel 
			text = <goal_desc> 
			rgba = [ 8 97 121 128 ] 
			pos = PAIR(12.00000000000, 395.00000000000) 
			time = <time2> 
			dims = PAIR(616.00000000000, 0.00000000000) 
			just = [ left center ] 
			internal_just = [ center top ] 
			parent = root_window 
			create_bg 
		} 
	ENDIF 
	IF GotParam cam_start_script 
		<cam_start_script> 
	ENDIF 
	BEGIN 
		IF SkaterCamAnimFinished name = <name> 
			BREAK 
		ENDIF 
		IF intro_camera_event_handler : GetSingleTag pressed_x 
			intro_camera_event_handler : RemoveTags tags = [ pressed_x ] 
			KillSkaterCamAnim name = <name> 
			BREAK 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
	IF GotParam cam_end_script 
		<cam_end_script> 
	ENDIF 
	IF ScreenElementExists id = intro_panel 
		DestroyScreenElement id = intro_panel 
	ENDIF 
	Debounce X time = 0.30000001192 
ENDSCRIPT

SCRIPT DoChapterIntroCamSetup 
	GetCurrentChapterInfo 
	IF GotParam goal_intro_setup 
		<goal_intro_setup> 
	ENDIF 
ENDSCRIPT

SCRIPT DoChapterIntroCamCleanup 
	GetCurrentChapterInfo 
	IF GotParam goal_intro_cleanup 
		<goal_intro_cleanup> 
	ENDIF 
ENDSCRIPT

SCRIPT PlayIntroCameras 
	IF NOT GotParam goal_intro_cameras 
		SafeCallback <...> 
		RETURN 
	ENDIF 
	IF GotParam from_chapter_intro 
		DoChapterIntroCamSetup 
	ENDIF 
	GetArraySize <goal_intro_cameras> 
	IF ( <array_size> > 0 ) 
		IF GotParam from_cutscenes 
			fadetoblack on time = 0 alpha = 1.00000000000 
			wait 1 gameframes 
			fadetoblack off time = 0 
		ENDIF 
		SetUpChapterMenu 
		IF GotParam letterbox 
			fake_letterboxing 
		ENDIF 
		IF NOT ScreenElementExists id = intro_camera_event_handler 
			CreateScreenElement { 
				type = ContainerElement 
				parent = root_window 
				id = intro_camera_event_handler 
				event_handlers = [ { pad_choose story_intro_advance_cam } ] 
			} 
		ENDIF 
		FireEvent type = focus target = intro_camera_event_handler 
		<index> = 0 
		BEGIN 
			play_me = 1 
			IF StructureContains structure = ( <goal_intro_cameras> [ <index> ] ) goal 
				IF GoalManager_HasWonGoal name = ( ( <goal_intro_cameras> [ <index> ] ) . goal ) 
					play_me = 0 
				ENDIF 
			ENDIF 
			IF ( <play_me> = 1 ) 
				PlayIntroSkaterCam index = <index> cam = ( <goal_intro_cameras> [ <index> ] ) 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
		<index> = 0 
		BEGIN 
			play_me = 1 
			IF StructureContains structure = ( <goal_intro_cameras> [ <index> ] ) goal 
				IF GoalManager_HasWonGoal name = ( ( <goal_intro_cameras> [ <index> ] ) . goal ) 
					play_me = 0 
				ENDIF 
			ENDIF 
			IF ( <play_me> = 1 ) 
				GetIntroSkaterCamName index = <index> cam = ( <goal_intro_cameras> [ <index> ] ) 
				IntroCameraDescription ( <goal_intro_cameras> [ <index> ] ) name = <name> cam_index = <index> 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
		DestroyScreenElement id = intro_camera_event_handler 
		printf "done with all cameras" 
		fake_letterboxing remove 
		IF NOT GotParam from_chapter_intro 
			DisplayLoadingScreen freeze 
			KillChapterMenu 
			PauseMusicAndStreams 1 
			wait 1 gameframes 
			HideLoadingScreen 
			PauseGame 
			hide_all_hud_items 
			Debounce X time = 0.30000001192 
			ingame_confirm_save no_script = ingame_save_return_to_game 
			RETURN 
		ENDIF 
		KillChapterMenu 
		IF GotParam from_cutscenes 
			fadetoblack on time = 0 alpha = 1 
			wait 1 gameframes 
			fadetoblack off time = 0 
		ENDIF 
	ENDIF 
	RemoveParameter goal_intro_cameras 
	IF GotParam from_chapter_intro 
		DoChapterIntroCamCleanup 
	ENDIF 
	SafeCallback <...> 
ENDSCRIPT

SCRIPT fake_letterboxing 
	IF ScreenElementExists id = letterbox_anchor 
		DestroyScreenElement id = letterbox_anchor 
	ENDIF 
	IF GotParam remove 
		RETURN 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		id = letterbox_anchor 
		parent = root_window 
		z_priority = 999 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = letterbox_anchor 
		texture = white2 
		scale = PAIR(100.00000000000, 10.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = -5 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = letterbox_anchor 
		texture = white2 
		scale = PAIR(100.00000000000, 15.00000000000) 
		pos = PAIR(0.00000000000, 360.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = -5 
	} 
ENDSCRIPT

SCRIPT ingame_confirm_save no_script = create_pause_menu yes_script = launch_ingame_menu_save_game_sequence 
	create_snazzy_dialog_box { 
		title = "Save" 
		text = "Would you like to save your progress now?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		buttons = [ { font = small text = #"No" pad_choose_script = <no_script> 
			} 
			{ font = small text = #"Yes" pad_choose_script = <yes_script> 
			} 
		] 
	} 
ENDSCRIPT

SCRIPT ingame_save_return_to_game 
	Debounce X time = 0.30000001192 
	dialog_box_exit 
	UnPauseGame 
	UnpauseMusicAndStreams 
	show_all_hud_items 
ENDSCRIPT

SCRIPT StartCurrentChapterStartRun 
	IF IsTrue DEMO_BUILD 
		IF LevelIs load_tr 
			IF GotParam from_cutscenes 
				DisplayLoadingScreen Blank 
				AdvanceStage 
				LoadCurrentChapter 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	root_window : SetTags menu_state = off 
	update_goal_points_display refresh 
	GetCurrentChapterInfo 
	IF GotParam post_intro_cutscene_setup 
		<post_intro_cutscene_setup> 
	ENDIF 
	IF GotParam capstone_chapter 
		from_cutscenes = from_cutscenes 
	ENDIF 
	IF GotParam goal_intro_cameras 
		kill_start_key_binding 
	ENDIF 
	SpawnScript PlayIntroCameras params = { callback = create_select_pro_menu 
		from_chapter_intro 
		goal_intro_cameras = <goal_intro_cameras> 
		letterbox 
		from_cutscenes = <from_cutscenes> 
	} 
ENDSCRIPT

SCRIPT EndCurrentChapter callback = nullscript 
	GetCurrentChapterInfo 
	IF NOT LevelIs <level> 
		<callback> 
		RETURN 
	ENDIF 
	kill_speech_boxes 
	GoalManager_DeactivateAllGoals 
	Skater : ResetSkaterToCustom 
	Skater : ClearPagerMessages 
	GoalManager_GetActiveRewardPoints 
	GetCurrentPointsToAdvance 
	GoalManager_LevelUnload 
	GoalManager_RemoveAllGoals 
	change chapter_goals_loaded = 0 
	IF GotParam cleanup_script 
		<cleanup_script> 
	ENDIF 
	IF GotParam dont_check_outtros 
		<callback> 
		RETURN 
	ENDIF 
	CheckIfChapterOuttrosViewed 
	IF ( <viewed> = 1 ) 
		<callback> 
		RETURN 
	ENDIF 
	IF IsTrue DEMO_BUILD 
		IF LevelIs load_ba 
			<callback> 
			RETURN 
		ENDIF 
	ENDIF 
	IF NOT ( <active_points> < <points_to_advance> ) 
		MarkChapterOuttrosViewed 
		IF GotParam end_cutscenes 
			goto PlayChapterCutsceneList params = { list = <end_cutscenes> callback = <callback> } 
		ENDIF 
	ENDIF 
	<callback> 
ENDSCRIPT

SCRIPT PrintChapterStatus 
	index = 0 
	GetArraySize CHAPTER_STATUS 
	BEGIN 
		printf "%a - %b - %c" a = ( CHAPTER_STATUS [ <index> ] ) b = ( CHAPTER_INTROS_VIEWED [ <index> ] ) c = ( CHAPTER_OUTTROS_VIEWED [ <index> ] ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	GetCurrentChapter 
	FormatText TextName = chap "Our current chapter is %c." c = <chapter> 
	printf <chap> 
ENDSCRIPT

SCRIPT ResetChapterStatus 
	index = 0 
	GetArraySize CHAPTER_STATUS 
	chapter_size = <array_size> 
	status_array = CHAPTER_STATUS 
	intro_array = CHAPTER_INTROS_VIEWED 
	outtro_array = CHAPTER_OUTTROS_VIEWED 
	BEGIN 
		IF ( <index> = 0 ) 
			SetArrayElement ArrayName = status_array index = <index> NewValue = CHAPTER_UNLOCKED 
		ELSE 
			SetArrayElement ArrayName = status_array index = <index> NewValue = CHAPTER_LOCKED 
		ENDIF 
		SetArrayElement ArrayName = intro_array index = <index> NewValue = 0 
		SetArrayElement ArrayName = outtro_array index = <index> NewValue = 0 
		IF StructureContains structure = ( CHAPTER_INFO [ <index> ] ) start_cutscenes 
			GetArraySize ( ( CHAPTER_INFO [ <index> ] ) . start_cutscenes ) 
			index2 = 0 
			BEGIN 
				IF StructureContains structure = ( ( CHAPTER_INFO [ <index> ] ) . start_cutscenes [ <index2> ] ) flag 
					UnSetGlobalFlag flag = ( ( ( CHAPTER_INFO [ <index> ] ) . start_cutscenes [ <index2> ] ) . flag ) 
				ENDIF 
				index2 = ( <index2> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
		IF StructureContains structure = ( CHAPTER_INFO [ <index> ] ) end_cutscenes 
			GetArraySize ( ( CHAPTER_INFO [ <index> ] ) . end_cutscenes ) 
			index2 = 0 
			BEGIN 
				IF StructureContains structure = ( ( CHAPTER_INFO [ <index> ] ) . end_cutscenes [ <index2> ] ) flag 
					UnSetGlobalFlag flag = ( ( ( CHAPTER_INFO [ <index> ] ) . end_cutscenes [ <index2> ] ) . flag ) 
				ENDIF 
				index2 = ( <index2> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <chapter_size> 
ENDSCRIPT

SCRIPT ChapterAdvanceDialog 
	GetCurrentChapter 
	IF NOT StructureContains structure = ( CHAPTER_INFO [ <chapter> ] ) advance_ped_info 
		script_assert "This chapter is missing advance_ped_info....can\'t find the dialog text" 
	ENDIF 
	ped_info = ( CHAPTER_INFO [ <chapter> ] . advance_ped_info ) 
	IF ScreenElementExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	IF NOT GotParam before_run 
		PauseGame 
		PauseStream 1 
		need_unpause_streams = need_unpause_streams 
		hide_all_hud_items 
		inside_run = inside_run 
	ELSE 
		SetUpChapterMenu 
	ENDIF 
	CheckIfChapterIntrosViewed next 
	IF ( <viewed> = 1 ) 
		buttons = [ { font = small text = #"OK" pad_choose_script = KillChapterMenu 
				pad_choose_params = { callback = <callback> <...> } 
			} 
		] 
		title = ( <ped_info> . name ) 
		text = ( <ped_info> . already_moved_on_message ) 
	ELSE 
		CheckIfChapterUnlocked next 
		IF ( <unlocked> = 0 ) 
			buttons = [ { font = small text = #"OK" pad_choose_script = KillChapterMenu 
					pad_choose_params = { callback = <callback> <...> } 
				} 
			] 
			title = ( <ped_info> . name ) 
			text = ( <ped_info> . need_more_points_message ) 
		ELSE 
			buttons = [ { font = small text = #"No" pad_choose_script = KillChapterMenu 
					pad_choose_params = { callback = <callback> <...> } 
				} 
				{ font = small text = #"Yes" pad_choose_script = KillChapterMenu 
					pad_choose_params = { callback = GotoNextChapterAccept } 
				} 
			] 
			title = ( <ped_info> . name ) 
			text = ( <ped_info> . move_on_now_message ) 
		ENDIF 
	ENDIF 
	create_snazzy_dialog_box { 
		title = <title> 
		text = <text> 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		buttons = <buttons> 
	} 
ENDSCRIPT

SCRIPT GotoNextChapterAccept 
	KillChapterMenu inside_run 
	IF IsTrue DEMO_BUILD 
		IF LevelIs load_ba 
			RETURN 
		ENDIF 
	ENDIF 
	IF IsXbox 
		DisplayLoadingScreen freeze 
	ELSE 
		DisplayLoadingScreen Blank 
	ENDIF 
	GotoNextChapter 
ENDSCRIPT

SCRIPT SetChapterOnLevel 
	IF NOT GotParam level 
		RETURN 
	ENDIF 
	IF ( <level> = load_sk5ed ) 
		RETURN 
	ENDIF 
	IF ( <level> = load_skateshop ) 
		RETURN 
	ENDIF 
	IF ( <level> = load_mainmenu ) 
		RETURN 
	ENDIF 
	SetCurrentChapter chapter = 0 
	GetArraySize CHAPTER_INFO 
	index = 0 
	BEGIN 
		IF ( ( CHAPTER_INFO [ <index> ] . level ) = <level> ) 
			RETURN 
		ENDIF 
		UnlockNextChapter dont_set_seen_flags 
		AdvanceStage 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT TR_1_MoveOnDialog 
	ChapterAdvanceDialog <...> 
ENDSCRIPT

SCRIPT TR_1_Start 
	kill name = TRG_SFX_TrigBox_Drips_01 
	kill name = TRG_SFX_TrigBox_Drips_02 
	kill name = TRG_SFX_TrigBox_WarehouseHum_01 
	kill name = TRG_SFX_TrigBox_TR_Reverb01 
	UnlockNextChapter 
	printf "starting chapter 1" 
ENDSCRIPT

SCRIPT TR_sound_setup 
	printf "********************KILLING/XREATING WAREHOUSE HUM, REVERB, AND DRIP BOXES" 
	kill name = TRG_SFX_TrigBox_Drips_01 
	kill name = TRG_SFX_TrigBox_Drips_02 
	kill name = TRG_SFX_TrigBox_WarehouseHum_01 
	kill name = TRG_SFX_TrigBox_TR_Reverb01 
	create name = TRG_SFX_TrigBox_Drips_01 
	create name = TRG_SFX_TrigBox_Drips_02 
	create name = TRG_SFX_TrigBox_WarehouseHum_01 
	create name = TRG_SFX_TrigBox_TR_Reverb01 
ENDSCRIPT

SCRIPT TR_1_End 
	printf "ending chapter 1" 
ENDSCRIPT

SCRIPT BO_1_Start 
	printf "starting chapter 2" 
	IF IsTrue DEMO_BUILD 
		UnSetGlobalFlag flag = LEVEL_UNLOCKED_TR 
	ENDIF 
ENDSCRIPT

SCRIPT BO_1_End 
	printf "ending chapter 2" 
ENDSCRIPT

SCRIPT BO_1_Sample 
	printf "Testing!" 
ENDSCRIPT

SCRIPT BA_1_Start 
	printf "starting chapter 3" 
ENDSCRIPT

SCRIPT BA_1_End 
	printf "ending chapter 3" 
ENDSCRIPT

SCRIPT BA_1_Message 
	Skater : SendPagerMessage from = "Steve-O" message = "Guess what? Steve-O just joined the party! Find me and I\'ll show you a real ride... nothing like that rolling cocktail dress you call a skateboard!" 
ENDSCRIPT

SCRIPT BE_1_Start 
	printf "starting chapter 4" 
ENDSCRIPT

SCRIPT BE_1_End 
	printf "ending chapter 4" 
ENDSCRIPT

SCRIPT AU_1_Start 
	printf "starting chapter 5" 
ENDSCRIPT

SCRIPT AU_1_End 
	printf "ending chapter 5" 
ENDSCRIPT

SCRIPT AU_2_Start 
	printf "starting chapter 6" 
	AU_Elimination_Start 
ENDSCRIPT

SCRIPT AU_2_End 
	printf "ending chapter 6" 
ENDSCRIPT

SCRIPT NO_1_Start 
	printf "starting chapter 7" 
ENDSCRIPT

SCRIPT NO_1_End 
	printf "ending chapter 7" 
	printf "!!!!!!!!!!!!!! Chapter 7 end !!!!!!!!!!!!!!!!!!" 
	FlushDeadObjects 
	kill name = TRG_Ped_TeammatePro 
	kill prefix = "TRG_Ped_club" 
	kill prefix = "TRG_Ped_Hint" 
	kill prefix = "trg_ped_jazz" 
ENDSCRIPT

SCRIPT NO_2_Start 
	printf "starting chapter 8" 
	NO_Equalizer_Start 
ENDSCRIPT

SCRIPT NO_goal_intro_setup 
	NO_Equalizer_Intro_Setup 
ENDSCRIPT

SCRIPT NO_goal_intro_cleanup 
	NO_Equalizer_Intro_CleanUp 
ENDSCRIPT

SCRIPT NO_2_End 
	printf "ending chapter 8" 
ENDSCRIPT

SCRIPT ST_1_Start 
	printf "starting chapter 9" 
ENDSCRIPT

SCRIPT ST_1_End 
	printf "ending chapter 9" 
ENDSCRIPT

SCRIPT ST_2_Start 
	printf "starting chapter 10" 
	TODManager_SetActive 0 
	TODManager_SetTODInstant afternoon 
	Skater : destroyflexibleparticlesystem name = boardsmoke 
	ST_KillCars 
	IF isAlive name = TRG_Ped_Bam 
		kill name = TRG_Ped_Bam 
	ENDIF 
	IF isAlive name = TRG_ped_bigfoot 
		kill name = TRG_ped_bigfoot 
	ENDIF 
	IF isAlive name = TRG_ped_bigfoot01 
		kill name = TRG_ped_bigfoot01 
	ENDIF 
	IF isAlive name = TRG_ped_Guest 
		kill name = TRG_ped_Guest 
	ENDIF 
	IF isAlive name = TRG_ped_JesseJames 
		kill name = TRG_ped_JesseJames 
	ENDIF 
	IF isAlive name = TRG_Ped_TeammatePro 
		kill name = TRG_Ped_TeammatePro 
	ENDIF 
	IF isAlive name = TRG_ped_hint_01 
		kill prefix = "TRG_ped_hint_" 
	ENDIF 
	IF isAlive name = TRG_ped_hawkhint_01 
		kill prefix = "TRG_ped_hawkhint_" 
	ENDIF 
	IF isAlive name = g_object_chainsaw 
		kill name = g_object_chainsaw 
	ENDIF 
	IF NOT isAlive name = g_endgoal_topbomb_02 
		create prefix = "g_endgoal_topbomb_" 
	ENDIF 
	IF NOT GoalManager_HasWonGoal name = ST_goal_gaps25 
		IF NOT isAlive name = g_endgoal_top_trig_01 
			create name = g_endgoal_top_trig_01 
		ENDIF 
	ENDIF 
	IF GoalManager_HasWonGoal name = ST_goal_gaps25 
		IF NOT isAlive name = g_endgoal_topbomb_on_01 
			create name = g_endgoal_topbomb_on_01 
			createfastparticlesystem name = radiowaves01 params_script = apm_st_radioWaves_fast_particle_params 
			radiowaves01 : obj_setposition position = VECTOR(557.00000000000, 7035.00000000000, 636.00000000000) 
		ENDIF 
	ENDIF 
	IF NOT isAlive name = trg_rail_endgoal_bomb5_00 
		create prefix = "TRG_rail_endgoal_bomb5_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_spin_00 
		create prefix = "g_endgoal_spin_" 
	ENDIF 
	IF NOT isAlive name = TRG_climb_endgoal_01 
		create prefix = "TRG_climb_endgoal_" 
	ENDIF 
	IF NOT GoalManager_HasWonGoal name = ST_goal_gaps20 
		IF NOT isAlive name = g_endgoal_spin_trig_01 
			create prefix = "g_endgoal_spin_trig_" 
		ENDIF 
		IF NOT isAlive name = g_endgoal_spinlight_red 
			create name = g_endgoal_spinlight_red 
			create name = g_endgoal_spinlight_red_glow 
		ENDIF 
	ENDIF 
	IF GoalManager_HasWonGoal name = ST_goal_gaps20 
		IF NOT isAlive name = g_endgoal_spinlight_green 
			create name = g_endgoal_spinlight_green 
			create name = g_endgoal_spinlight_green_glow 
		ENDIF 
		createfastparticlesystem name = radiowaves05 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves05 : obj_setposition position = VECTOR(448.00000000000, 6363.00000000000, 2970.00000000000) 
		create name = APM_spinna_ghost01 
		create name = APM_spinna_ghost02 
		create name = APM_spinna_ghost03 
		create name = APM_spinna_ghost04 
		SpawnScript Rocketshake01 
		SpawnScript Rocketshake02 
		SpawnScript Rocketshake03 
		SpawnScript Rocketshake04 
	ENDIF 
	IF NOT isAlive name = g_endgoal_fountain_00 
		create prefix = "g_endgoal_fountain_" 
	ENDIF 
	IF NOT isAlive name = TRG_rail_endgoal_05 
		create prefix = "TRG_rail_endgoal_" 
	ENDIF 
	IF GoalManager_HasWonGoal name = ST_goal_gaps23 
		create name = g_endgoal_fountain_on 
		createfastparticlesystem name = radiowaves03 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves03 : obj_setposition position = VECTOR(1919.00000000000, 6229.00000000000, -1573.00000000000) 
	ENDIF 
	IF NOT isAlive name = g_endgoal_bombbox_01 
		create prefix = "g_endgoal_bombbox_" 
	ENDIF 
	IF NOT GoalManager_HasWonGoal name = ST_goal_gaps24 
		GoalManager_GetDifficultyLevel 
		IF ( <difficulty_level> = 0 ) 
			IF NOT isAlive name = g_endgoal_bombbox_eztrig_01 
				create prefix = "g_endgoal_bombbox_eztrig_" 
			ENDIF 
		ELSE 
			IF NOT isAlive name = g_endgoal_bombbox_trig_01 
				create prefix = "g_endgoal_bombbox_trig_" 
			ENDIF 
		ENDIF 
		IF NOT isAlive name = g_endgoal_bombbox_invis_00 
			create prefix = "g_endgoal_bombbox_invis_" 
		ENDIF 
	ENDIF 
	IF GoalManager_HasWonGoal name = ST_goal_gaps24 
		IF NOT isAlive name = g_endgoal_bombbox_antenna_on01 
			create name = g_endgoal_bombbox_antenna_on01 
		ENDIF 
		IF NOT isAlive name = g_endgoal_bombbox_on_04 
			create prefix = "g_endgoal_bombbox_on_" 
		ENDIF 
		createfastparticlesystem name = radiowaves02 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves02 : obj_setposition position = VECTOR(844.00000000000, 6258.00000000000, -2316.00000000000) 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rocket_box_02 
		create prefix = "g_endgoal_rocket_box_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rail_rocket_box_00 
		create prefix = "g_endgoal_rail_rocket_box_" 
	ENDIF 
	IF NOT GoalManager_HasWonGoal name = ST_goal_gaps22 
		IF NOT isAlive name = g_endgoal_rocket_01 
			create prefix = "g_endgoal_rocket_" 
		ENDIF 
		IF NOT isAlive name = trg_rail_endgoal_rocket_01 
			create prefix = "TRG_rail_endgoal_rocket_" 
		ENDIF 
		IF NOT isAlive name = g_endgoal_rocket_camtrig 
			create name = g_endgoal_rocket_camtrig 
		ENDIF 
	ENDIF 
	IF GoalManager_HasWonGoal name = ST_goal_gaps22 
		create name = g_endgoal_rockets_complete 
		createfastparticlesystem name = radiowaves04 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves04 : obj_setposition position = VECTOR(1190.00000000000, 5753.00000000000, 1894.00000000000) 
	ENDIF 
	IF NOT isAlive name = g_endgoal_tnt_00 
		create prefix = "g_endgoal_tnt_" 
	ENDIF 
	printf "GoalManager_GoalIsLocked" 
	IF GoalManager_GoalIsLocked name = ST_goal_gaps20 
		GoalManager_UnlockGoal name = ST_goal_gaps20 
	ENDIF 
	IF GoalManager_GoalIsLocked name = ST_goal_gaps22 
		GoalManager_UnlockGoal name = ST_goal_gaps22 
	ENDIF 
	IF GoalManager_GoalIsLocked name = ST_goal_gaps23 
		GoalManager_UnlockGoal name = ST_goal_gaps23 
	ENDIF 
	IF GoalManager_GoalIsLocked name = ST_goal_gaps24 
		GoalManager_UnlockGoal name = ST_goal_gaps24 
	ENDIF 
	IF GoalManager_GoalIsLocked name = ST_goal_gaps25 
		GoalManager_UnlockGoal name = ST_goal_gaps25 
	ENDIF 
ENDSCRIPT

SCRIPT ST_2_End 
	printf "ending chapter 10" 
	IF NOT isAlive name = g_endgoal_spinlight_green 
		create name = g_endgoal_spinlight_green 
		create name = g_endgoal_spinlight_green_glow 
	ENDIF 
	IF NOT isAlive name = g_endgoal_topbomb_on_01 
		create name = g_endgoal_topbomb_on_01 
	ENDIF 
	IF NOT isAlive name = g_endgoal_fountain_on 
		create name = g_endgoal_fountain_on 
	ENDIF 
	IF NOT isAlive name = g_endgoal_bombbox_antenna_on01 
		create name = g_endgoal_bombbox_antenna_on01 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rockets_complete 
		create name = g_endgoal_rockets_complete 
	ENDIF 
	IF isAlive name = g_endgoal_top_trig_01 
		kill name = g_endgoal_top_trig_01 
	ENDIF 
	IF isAlive name = g_endgoal_spin_trig_01 
		kill prefix = "g_endgoal_spin_trig_" 
	ENDIF 
	IF isAlive name = g_endgoal_bombbox_trig_01 
		kill prefix = "g_endgoal_bombbox_trig_" 
	ENDIF 
	IF isAlive name = trg_rail_endgoal_rocket_01 
		kill prefix = "TRG_rail_endgoal_rocket_" 
	ENDIF 
ENDSCRIPT

SCRIPT ST_3_Start 
	ST_KillPeds 
	ST_KillCars 
	IF isAlive name = TRG_Ped_Bam 
		kill name = TRG_Ped_Bam 
	ENDIF 
	IF isAlive name = TRG_ped_bigfoot 
		kill name = TRG_ped_bigfoot 
	ENDIF 
	IF isAlive name = TRG_ped_bigfoot01 
		kill name = TRG_ped_bigfoot01 
	ENDIF 
	IF isAlive name = TRG_ped_Guest 
		kill name = TRG_ped_Guest 
	ENDIF 
	IF isAlive name = TRG_Ped_TeammatePro 
		kill name = TRG_Ped_TeammatePro 
	ENDIF 
	IF isAlive name = TRG_Ped_PinkCat 
		kill name = TRG_Ped_PinkCat 
	ENDIF 
	IF isAlive name = TRG_ped_hint_01 
		kill prefix = "TRG_ped_hint_" 
	ENDIF 
	IF isAlive name = TRG_ped_hawkhint_01 
		kill prefix = "TRG_ped_hawkhint_" 
	ENDIF 
	IF NOT isAlive name = TRG_ped_endgoal_skatopiaguy 
		create name = TRG_ped_endgoal_skatopiaguy 
		create prefix = "TRG_ped_endgoal_randomized_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_topbomb_02 
		create prefix = "g_endgoal_topbomb_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_topbomb_on_01 
		create name = g_endgoal_topbomb_on_01 
		createfastparticlesystem name = radiowaves01 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves01 : obj_setposition position = VECTOR(557.00000000000, 7035.00000000000, 636.00000000000) 
	ENDIF 
	IF NOT isAlive name = trg_rail_endgoal_bomb5_00 
		create prefix = "TRG_rail_endgoal_bomb5_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_spin_00 
		create prefix = "g_endgoal_spin_" 
	ENDIF 
	IF NOT isAlive name = TRG_climb_endgoal_01 
		create prefix = "TRG_climb_endgoal_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_spinlight_green 
		create name = g_endgoal_spinlight_green 
		create name = g_endgoal_spinlight_green_glow 
	ENDIF 
	createfastparticlesystem name = radiowaves05 params_script = apm_st_radioWaves_fast_particle_params 
	radiowaves05 : obj_setposition position = VECTOR(448.00000000000, 6363.00000000000, 2970.00000000000) 
	IF NOT isAlive name = APM_spinna_ghost01 
		create name = APM_spinna_ghost01 
		create name = APM_spinna_ghost02 
		create name = APM_spinna_ghost03 
		create name = APM_spinna_ghost04 
	ENDIF 
	SpawnScript Rocketshake01 
	SpawnScript Rocketshake02 
	SpawnScript Rocketshake03 
	SpawnScript Rocketshake04 
	IF NOT isAlive name = g_endgoal_fountain_00 
		create prefix = "g_endgoal_fountain_" 
	ENDIF 
	IF NOT isAlive name = TRG_rail_endgoal_05 
		create prefix = "TRG_rail_endgoal_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_fountain_on 
		create name = g_endgoal_fountain_on 
		createfastparticlesystem name = radiowaves03 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves03 : obj_setposition position = VECTOR(1919.00000000000, 6229.00000000000, -1573.00000000000) 
	ENDIF 
	IF NOT isAlive name = g_endgoal_bombbox_01 
		create prefix = "g_endgoal_bombbox_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_bombbox_antenna_on01 
		create name = g_endgoal_bombbox_antenna_on01 
		createfastparticlesystem name = radiowaves02 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves02 : obj_setposition position = VECTOR(844.00000000000, 6258.00000000000, -2316.00000000000) 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rocket_box_02 
		create prefix = "g_endgoal_rocket_box_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rail_rocket_box_00 
		create prefix = "g_endgoal_rail_rocket_box_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rockets_complete 
		create name = g_endgoal_rockets_complete 
		createfastparticlesystem name = radiowaves04 params_script = apm_st_radioWaves_fast_particle_params 
		radiowaves04 : obj_setposition position = VECTOR(1190.00000000000, 5753.00000000000, 1894.00000000000) 
	ENDIF 
	IF NOT isAlive name = g_endgoal_tnt_00 
		create prefix = "g_endgoal_tnt_" 
	ENDIF 
	create prefix = "g_endgoal_dog_trig" 
	create prefix = "trg_endgoal_dog" 
	IF NOT isAlive name = TRG_ped_escape_pinkcat 
		create name = TRG_ped_escape_pinkcat 
	ENDIF 
	IF GoalManager_GoalExists name = ST_goal_gaps21 
		IF GoalManager_GoalIsLocked name = ST_goal_gaps21 
			GoalManager_UnlockGoal name = ST_goal_gaps21 
		ELSE 
		ENDIF 
	ENDIF 
	TODManager_SetActive 0 
	TODManager_SetTODInstant evening 
	EnableFog 
ENDSCRIPT

SCRIPT ST_3_End 
	printf "ending chapter 10" 
	destroy_digital_timer 
	kill prefix = "TRG_ped_endgoal_escape_" 
	IF isAlive name = TRG_ped_escape_pinkcat 
		kill name = TRG_ped_escape_pinkcat 
	ENDIF 
ENDSCRIPT

SCRIPT ST_4_Start 
	ST_KillCars 
	kill prefix = "TRG_SFX_Trigbox_EG" 
	kill prefix = "TRG_SFX_TrigBox_Night" 
	create prefix = "TRG_SFX_Trigbox_EG" 
	IF NOT isAlive name = g_endgoal_lowrv 
		create name = g_endgoal_lowrv 
	ENDIF 
	IF NOT isAlive name = TRG_Ped_Escape_Bam 
		create name = TRG_Ped_Escape_Bam 
	ENDIF 
	IF isAlive name = TRG_ped_skatopiaguy 
		kill name = TRG_ped_skatopiaguy 
	ENDIF 
	destroy_digital_timer 
	printf "   escape  " 
	ST_KillPeds 
	printf "   escape  " 
	IF NOT isAlive name = g_endgoal_topbomb_02 
		create prefix = "g_endgoal_topbomb_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_fountain_00 
		create prefix = "g_endgoal_fountain_" 
	ENDIF 
	IF NOT isAlive name = TRG_rail_endgoal_05 
		create prefix = "TRG_rail_endgoal_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rocket_box_02 
		create prefix = "g_endgoal_rocket_box_" 
	ENDIF 
	IF NOT isAlive name = g_endgoal_rail_rocket_box_00 
		create prefix = "g_endgoal_rail_rocket_box_" 
	ENDIF 
	IF isAlive name = g_endgoal_rockets_complete 
		kill name = g_endgoal_rockets_complete 
	ENDIF 
	kill prefix = "g_endgoal_rocket_" 
	create prefix = "trg_endgoal_rocket_fly_" 
	kill prefix = "g_endgoal_tnt_trig_" 
	create prefix = "g_endgoal_tnt_trig_" 
	kill prefix = "g_endgoal_tnt_" 
	create prefix = "g_endgoal_tnt_" 
	printf "   escape  " 
	kill name = nighton_08_g_todd_hang_lightglo04 
	TODManager_markpermanentlydead name = nighton_08_g_todd_hang_lightglo04 
	kill name = nighton_08_g_todd_hang_lightglo03 
	TODManager_markpermanentlydead name = nighton_08_g_todd_hang_lightglo03 
	kill name = nighton_08_g_todd_hang_lightglo02 
	TODManager_markpermanentlydead name = nighton_08_g_todd_hang_lightglo02 
	kill name = nighton_08_g_house_90 
	TODManager_markpermanentlydead name = nighton_08_g_house_90 
	kill name = nighton_08_g_todd_pool_gr_lightglo02 
	TODManager_markpermanentlydead name = nighton_08_g_todd_pool_gr_lightglo02 
	kill name = g_house_70 
	kill name = g_house_71 
	create name = g_house_sign_cinder_on01 
	KillSpawnedScript name = Rocketshake01 
	KillSpawnedScript name = Rocketshake02 
	KillSpawnedScript name = Rocketshake03 
	KillSpawnedScript name = Rocketshake04 
	printf "   escape  " 
	IF isAlive name = trg_rail_endgoal_bomb5_00 
		kill prefix = "TRG_rail_endgoal_bomb5_" 
	ENDIF 
	IF isAlive name = g_endgoal_spin_00 
		kill prefix = "g_endgoal_spin_" 
	ENDIF 
	IF isAlive name = TRG_climb_endgoal_01 
		kill prefix = "TRG_climb_endgoal_" 
	ENDIF 
	IF isAlive name = g_endgoal_spinlight_green 
		kill name = g_endgoal_spinlight_green 
		kill name = g_endgoal_spinlight_green_glow 
	ENDIF 
	IF isAlive name = g_endgoal_spinlight_red 
		kill name = g_endgoal_spinlight_red 
		kill name = g_endgoal_spinlight_red_glow 
	ENDIF 
	printf "   escape  " 
	destroyfastparticlesystem name = radiowaves01 
	destroyfastparticlesystem name = radiowaves02 
	destroyfastparticlesystem name = radiowaves03 
	destroyfastparticlesystem name = radiowaves04 
	destroyfastparticlesystem name = radiowaves05 
	printf "   escape  " 
	IF NOT isAlive name = g_endgoal_obj_spinbomb01 
		create name = g_endgoal_obj_spinbomb01 
		create name = g_endgoal_obj_spinbomb_base 
	ENDIF 
	create name = APM_spinna_ghost05 
	APM_spinna_ghost05 : obj_locktoobject objectname = g_endgoal_obj_spinbomb01 VECTOR(-215.00000000000, -25.00000000000, 67.00000000000) 
	APM_spinna_ghost05 : createflexibleparticlesystem name = apm_spinner01 params_script = apm_ST_spinnerF03_particle_params 
	create name = APM_spinna_ghost06 
	APM_spinna_ghost06 : obj_locktoobject objectname = g_endgoal_obj_spinbomb01 VECTOR(-67.00000000000, -25.00000000000, -215.00000000000) 
	APM_spinna_ghost06 : createflexibleparticlesystem name = apm_spinner02 params_script = apm_ST_spinnerF04_particle_params 
	create name = APM_spinna_ghost07 
	APM_spinna_ghost07 : obj_locktoobject objectname = g_endgoal_obj_spinbomb01 VECTOR(215.00000000000, -25.00000000000, -67.00000000000) 
	APM_spinna_ghost07 : createflexibleparticlesystem name = apm_spinner03 params_script = apm_ST_spinnerF01_particle_params 
	create name = APM_spinna_ghost08 
	APM_spinna_ghost08 : obj_locktoobject objectname = g_endgoal_obj_spinbomb01 VECTOR(67.00000000000, -25.00000000000, 215.00000000000) 
	APM_spinna_ghost08 : createflexibleparticlesystem name = apm_spinner04 params_script = apm_ST_spinnerF02_particle_params 
	printf "   escape  " 
	printf "starting Last Goal" 
	TODManager_SetActive 0 
	TODManager_SetParams { 
		system = 1 
		transition_length = 90000 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_light_group = indoor } 
		] 
		morning = tod_manager_default_morning 
		afternoon = tod_manager_default_afternoon 
		evening = tod_manager_default_evening 
		night = { ( tod_manager_default_night ) 
			fog_red = 33 
			fog_green = 5 
			fog_blue = 14 
			fog_alpha = 55 
			fog_dist = 100 
			bloom_on = 1 
			bloom_color = [ 150 150 150 ] 
			bloom1 = 10 
			bloom2 = 100 
			bloom_strength = [ 22 100 200 ] 
		} 
	} 
	TODManager_SetTODInstant night 
	create name = g_endgoal_firewall_killerz_01 
	create name = g_endgoal_fireWall01 
	create name = g_endgoal_fireWall02 
	create name = g_firewall_01 
	create name = g_firewall_ground01 
	create name = g_firewall_sky01 
	create prefix = "g_firewall_smoke_" 
	create name = g_trig_endgoal_combo 
	create name = g_trig_endgoal_ez_combo 
	create name = g_trig_endgoal_success 
	printf "   escape  " 
	createfastparticlesystem name = signfire01 params_script = apm_ST_fire_Sign_fast_particle_params 
	signfire01 : obj_setposition position = VECTOR(877.00000000000, 5755.00000000000, 4349.00000000000) 
	createfastparticlesystem name = signfire02 params_script = apm_ST_fire_Sign_fast_particle_params 
	signfire02 : obj_setposition position = VECTOR(982.00000000000, 5766.00000000000, 4288.00000000000) 
	createfastparticlesystem name = signfire03 params_script = apm_ST_fire_Sign_fast_particle_params 
	signfire03 : obj_setposition position = VECTOR(1062.00000000000, 5760.00000000000, 4247.00000000000) 
	createfastparticlesystem name = signfire04 params_script = apm_ST_fire_Sign_fast_particle_params 
	signfire04 : obj_setposition position = VECTOR(1127.00000000000, 5750.00000000000, 4233.00000000000) 
	printf "   escape  " 
	create name = apm_firesign01 
	createfastparticlesystem name = sparkfountain01 params_script = apm_ST_SparkFountain01_fast_particle_params 
	sparkfountain01 : obj_setposition position = VECTOR(1926.00000000000, 6603.00000000000, -654.00000000000) 
	createfastparticlesystem name = treefire01 params_script = apm_ST_fire_TREE01_fast_particle_params 
	treefire01 : obj_setposition position = VECTOR(100.00000000000, 5707.00000000000, 4250.00000000000) 
	createfastparticlesystem name = treesmoke01 params_script = apm_ST_TREE_smoke01_fast_particle_params 
	treesmoke01 : obj_setposition position = VECTOR(100.00000000000, 5707.00000000000, 4250.00000000000) 
	createfastparticlesystem name = treefire02 params_script = apm_ST_fire_TREE01_fast_particle_params 
	treefire02 : obj_setposition position = VECTOR(1746.00000000000, 6050.00000000000, 2007.00000000000) 
	createfastparticlesystem name = treesmoke02 params_script = apm_ST_TREE_smoke01_fast_particle_params 
	treesmoke02 : obj_setposition position = VECTOR(1746.00000000000, 6050.00000000000, 2007.00000000000) 
	createfastparticlesystem name = treefire03 params_script = apm_ST_fire_TREE01_fast_particle_params 
	treefire03 : obj_setposition position = VECTOR(1506.00000000000, 6450.00000000000, -930.00000000000) 
	createfastparticlesystem name = treesmoke03 params_script = apm_ST_TREE_smoke01_fast_particle_params 
	treesmoke03 : obj_setposition position = VECTOR(1506.00000000000, 6450.00000000000, -930.00000000000) 
	printf "   escape  " 
	createfastparticlesystem name = firebase01 params_script = apm_ST_fireBASE01_fast_particle_params 
	firebase01 : obj_setposition position = VECTOR(120.00000000000, 6260.00000000000, -3974.00000000000) 
	createfastparticlesystem name = firebase02 params_script = apm_ST_fireBASE02_fast_particle_params 
	firebase02 : obj_setposition position = VECTOR(-428.00000000000, 6260.00000000000, -3323.00000000000) 
ENDSCRIPT

SCRIPT ST_4_End 
	printf "ST_4_End" 
	printf "ST_4_End" 
	printf "ST_4_End" 
	printf "ST_4_End" 
	IF isAlive name = g_endgoal_lowrv 
		kill name = g_endgoal_lowrv 
	ENDIF 
	IF isAlive name = TRG_Ped_Escape_Bam 
		kill name = TRG_Ped_Escape_Bam 
	ENDIF 
	TODManager_SetParams { 
		system = 1 
		transition_length = 90000 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_light_group = indoor } 
		] 
		morning = tod_manager_default_morning 
		afternoon = tod_manager_default_afternoon 
		evening = tod_manager_default_evening 
		night = tod_manager_default_night 
	} 
	TODManager_SetActive 1 
	TODManager_SetTODInstant night 
	destroyfastparticlesystem name = signfire01 
	destroyfastparticlesystem name = signfire02 
	destroyfastparticlesystem name = signfire03 
	destroyfastparticlesystem name = signfire04 
	destroyfastparticlesystem name = sparkfountain01 
	destroyfastparticlesystem name = treefire01 
	destroyfastparticlesystem name = treesmoke01 
	destroyfastparticlesystem name = treefire02 
	destroyfastparticlesystem name = treesmoke02 
	destroyfastparticlesystem name = treefire03 
	destroyfastparticlesystem name = treesmoke03 
	destroyfastparticlesystem name = firebase01 
	destroyfastparticlesystem name = firebase02 
	IF isAlive name = g_endgoal_firewall_killerz_01 
		kill name = g_endgoal_firewall_killerz_01 
	ENDIF 
	IF isAlive name = g_endgoal_fireWall01 
		kill name = g_endgoal_fireWall01 
	ENDIF 
	IF isAlive name = g_endgoal_fireWall02 
		kill name = g_endgoal_fireWall02 
	ENDIF 
	IF isAlive name = g_firewall_01 
		kill name = g_firewall_01 
	ENDIF 
	IF isAlive name = g_firewall_ground01 
		kill name = g_firewall_ground01 
	ENDIF 
	IF isAlive name = g_firewall_sky01 
		kill name = g_firewall_sky01 
	ENDIF 
	IF isAlive name = g_firewall_smoke_perf01 
		kill name = g_firewall_smoke_perf01 
	ENDIF 
	IF isAlive name = g_firewall_smoke_perf_rear01 
		kill name = g_firewall_smoke_perf_perf_rear01 
	ENDIF 
	IF isAlive name = g_firewall_smoke_perf_rear02 
		kill name = g_firewall_smoke_perf_rear02 
	ENDIF 
	IF isAlive name = g_trig_endgoal_combo 
		kill name = g_trig_endgoal_combo 
	ENDIF 
	IF isAlive name = g_trig_endgoal_ez_combo 
		kill name = g_trig_endgoal_ez_combo 
	ENDIF 
	IF isAlive name = g_trig_endgoal_success 
		kill name = g_trig_endgoal_success 
	ENDIF 
	IF isAlive name = g_endgoal_spin_00 
		kill prefix = "g_endgoal_spin_" 
	ENDIF 
	IF isAlive name = g_endgoal_obj_spinbomb01 
		kill name = g_endgoal_obj_spinbomb01 
	ENDIF 
	IF isAlive name = APM_spinna_ghost05 
		kill name = APM_spinna_ghost05 
	ENDIF 
	IF isAlive name = APM_spinna_ghost06 
		kill name = APM_spinna_ghost06 
	ENDIF 
	IF isAlive name = APM_spinna_ghost07 
		kill name = APM_spinna_ghost07 
	ENDIF 
	IF isAlive name = APM_spinna_ghost08 
		kill name = APM_spinna_ghost08 
	ENDIF 
	IF NOT isAlive name = nighton_08_g_todd_hang_lightglo04 
		create name = nighton_08_g_todd_hang_lightglo04 
		create name = nighton_08_g_todd_hang_lightglo03 
		create name = nighton_08_g_todd_hang_lightglo02 
		create name = nighton_08_g_todd_pool_gr_lightglo02 
		create name = nighton_08_g_house_90 
		create name = g_house_70 
		create name = g_house_71 
		kill name = g_house_sign_cinder_on01 
	ENDIF 
	IF isAlive name = trg_endgoal_rocket_fly_03 
		KillSpawnedScript name = ST_Rockets_Launch_01 
		KillSpawnedScript name = ST_Rockets_Respawn_01 
		KillSpawnedScript name = ST_Rockets_Launch_02 
		KillSpawnedScript name = ST_Rockets_Respawn_02 
		KillSpawnedScript name = ST_Rockets_Launch_03 
		KillSpawnedScript name = ST_Rockets_Respawn_03 
		kill prefix = "trg_endgoal_rocket_fly_" 
	ENDIF 
	IF isAlive name = g_endgoal_tnt_trig_00 
		kill prefix = "g_endgoal_tnt_trig_" 
	ENDIF 
	KillSpawnedScript name = ST_Escape_Reactivate 
	ST_CreatePeds 
ENDSCRIPT

SCRIPT give_cheat_points points = 50 
	change total_cheat_points = ( ( total_cheat_points ) + <points> ) 
	update_goal_points_display refresh 
	CheckChapterAdvancementStatus RewardPoints = <points> 
ENDSCRIPT

SCRIPT reset_cheat_points 
	change total_cheat_points = 0 
	update_goal_points_display refresh 
	Skater : ClearPagerMessages 
ENDSCRIPT

SCRIPT unlock_all_chapters 
	prev_level = NULL 
	chapter_status2 = CHAPTER_STATUS 
	GetArraySize CHAPTER_STATUS 
	index = 0 
	BEGIN 
		IF NOT ChecksumEquals a = ( CHAPTER_INFO [ <index> ] . level ) b = <prev_level> 
			prev_level = ( CHAPTER_INFO [ <index> ] . level ) 
			SetArrayElement ArrayName = chapter_status2 index = <index> NewValue = CHAPTER_UNLOCKED 
		ELSE 
			SetArrayElement ArrayName = chapter_status2 index = <index> NewValue = CHAPTER_LOCKED 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT career_post_load 
	IF NOT IsXbox 
		IF NOT LevelIs load_mainmenu 
			IF GetGlobalFlag flag = SCREEN_MODE_STANDARD 
				IF GetGlobalFlag flag = SCREEN_MODE_WIDE 
					screen_setup_letterbox 
				ELSE 
					screen_setup_standard 
				ENDIF 
			ELSE 
				IF GetGlobalFlag flag = SCREEN_MODE_WIDE 
					screen_setup_widescreen 
				ENDIF 
			ENDIF 
		ELSE 
			IF GetGlobalFlag flag = SCREEN_MODE_STANDARD 
				IF GetGlobalFlag flag = SCREEN_MODE_WIDE 
					change ingame_screen_mode = letterbox_screen_mode 
				ELSE 
					change ingame_screen_mode = standard_screen_mode 
				ENDIF 
			ELSE 
				IF GetGlobalFlag flag = SCREEN_MODE_WIDE 
					change ingame_screen_mode = widescreen_screen_mode 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	set_default_temporary_profiles 
ENDSCRIPT


