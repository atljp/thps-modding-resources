
generic_pro_name = "peds/PedPros/PedPro_Neversoft/PedPro_Neversoft.skin" 
generic_pro_first_name = "Neversoft" 
generic_pro_full_name = "Neversoft Skater" 
goal_want_to_save_volume = 0 
goal_bind_retry_to_select = 0 
max_number_of_special_trickslots = 14 
goal_utility_allow_end_goal_name = null 
SCRIPT goal_init 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam trigger_obj_id 
		GoalManager_InitGoalTrigger name = <goal_id> 
	ENDIF 
	IF GotParam init_geo_prefix 
		create prefix = <init_geo_prefix> 
	ELSE 
		IF GotParam init_geo_prefixes 
			GetArraySize <init_geo_prefixes> 
			<index> = 0 
			BEGIN 
				create prefix = ( <init_geo_prefixes> [ <index> ] ) 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	IF GotParam init_script 
		<init_script> <init_script_params> 
	ENDIF 
ENDSCRIPT

cur_tod_cur_action = set_tod_day 
SCRIPT goal_passive_start 
	GoalManager_GetGoalParams name = <goal_id> 
	GetCurrentLevel 
	IF ChecksumEquals a = <level> b = Load_Sk5Ed 
		GoalManager_EditGoal name = <goal_id> params = { testing_goal } 
	ENDIF 
	IF InNetGame 
		GoalManager_AnnounceGoalStarted name = <goal_id> 
	ENDIF 
	IF GotParam custom_score_record 
		GoalManager_EditGoal name = <goal_id> params = { custom_score_record = 0 } 
	ENDIF 
	IF GotParam edited_goal 
		IF GotParam control_type 
			IF NOT ( ( <control_type> = Skate ) | ( <control_type> = Walk ) ) 
				GoalManager_GetLevelPrefix 
				FormatText ChecksumName = ReadyLevelScript "%l_KillVehicles" l = <level_prefix> 
				IF ScriptExists <ReadyLevelScript> 
					<ReadyLevelScript> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam use_hud_counter 
		goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption> 
	ENDIF 
	IF GotParam goal_start_script 
		<goal_start_script> <goal_start_script_params> 
	ENDIF 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF GotParam kill_radius 
			<trigger_obj_id> : Obj_SetOuterRadius <kill_radius> 
			<trigger_obj_id> : Obj_SetException ex = ObjectOutofRadius scr = goal_crossed_kill_radius params = { goal_id = <goal_id> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_start 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam play_goal_start_sound 
		ALL_Levels_SFX_Start_Goal 
	ENDIF 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	GetCurrentLevel 
	IF ChecksumEquals a = <level> b = Load_Sk5Ed 
		GoalManager_EditGoal name = <goal_id> params = { testing_goal } 
	ENDIF 
	IF NOT GameModeEquals is_classic 
		IF GotParam reset_score 
			ResetScore 
		ENDIF 
		IF ( ( GotParam start_cam_anim ) | ( GotParam start_cam_anims ) ) 
			Skater : Vibrate Off 
			KillAllTextureSplats 
		ENDIF 
		destroy_goal_panel_messages 
	ENDIF 
	KillSpawnedScript name = goal_wait_and_show_key_combo_text 
	KillSpawnedScript name = SK3_Killskater_Finish use_proper_version 
	IF ( <trigger_exists> = 1 ) 
		IF NOT GotParam quick_start 
			kill_start_key_binding 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF NOT IsAlive name = <trigger_obj_id> 
			GoalManager_EditGoal name = <goal_id> params = { force_create_trigger = 1 } 
			GoalManager_InitializeGoal name = <goal_id> 
			GoalManager_EditGoal name = <goal_id> params = { force_create_trigger = 0 } 
			GoalManager_GetGoalParams name = <goal_id> 
		ENDIF 
	ENDIF 
	IF InNetGame 
		GoalManager_AnnounceGoalStarted name = <goal_id> 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		<trigger_obj_id> : Obj_ClearExceptions 
		TerminateObjectsScripts id = <trigger_obj_id> script_name = goal_pro_wait_and_reset_avoid_exception 
		TerminateObjectsScripts id = <trigger_obj_id> script_name = goal_set_trigger_exceptions 
	ENDIF 
	IF GotParam custom_score_record 
		GoalManager_EditGoal name = <goal_id> params = { custom_score_record = 0 } 
	ENDIF 
	IF ObjectExists id = goal_start_dialog 
		speech_box_exit anchor_id = goal_start_dialog 
	ENDIF 
	IF ObjectExists id = goal_retry_anchor 
		DestroyScreenElement id = goal_retry_anchor 
	ENDIF 
	FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name> 
	IF ScreenElementExists id = <arrow_id> 
		DestroyScreenElement id = <arrow_id> 
	ENDIF 
	KillSpawnedScript name = goal_init_after_end_of_run 
	IF NOT IsObserving 
		GetSkaterId 
		KillSkaterCamAnim skaterId = <ObjId> all 
	ENDIF 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam geo_prefix 
		goal_create_geo_prefix geo_prefix = <geo_prefix> 
	ELSE 
		IF GotParam geo_prefixes 
			GetArraySize <geo_prefixes> 
			<index> = 0 
			BEGIN 
				goal_create_geo_prefix geo_prefix = ( <geo_prefixes> [ <index> ] ) 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	IF NOT GameModeEquals is_classic 
		IF NOT IsObserving 
			Skater : RunStarted 
		ENDIF 
		IF ( ( GotParam quick_start ) | ( GameModeEquals is_creategoals ) ) 
			goal_initialize_skater <...> 
			DeBounce x time = 0.30000001192 
		ENDIF 
	ENDIF 
	IF GotParam goal_intro_script 
		<goal_intro_script> <goal_intro_script_params> 
	ENDIF 
	GoalManager_GetGoalParams name = <goal_id> 
	IF NOT InNetGame 
		goal_create_proset_geom <...> 
	ENDIF 
	IF GotParam edited_goal 
		IF GotParam control_type 
			IF NOT ( ( <control_type> = Skate ) | ( <control_type> = Walk ) ) 
				GoalManager_GetLevelPrefix 
				FormatText ChecksumName = ReadyLevelScript "%l_KillVehicles" l = <level_prefix> 
				IF ScriptExists <ReadyLevelScript> 
					<ReadyLevelScript> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( Inside_Light_Rain = 1 ) 
		IF IsSoundPlaying TestLight01 
			SetSoundParams TestLight01 vol = LightRainVolume 
		ENDIF 
		change Paused_Light_Rain = 0 
		change Inside_Light_Rain = 0 
	ENDIF 
	IF ( Inside_Heavy_Rain = 1 ) 
		IF IsSoundPlaying TestLight02 
			SetSoundParams TestLight02 vol = LightRainVolume 
		ENDIF 
		IF IsSoundPlaying TestMedium02 
			SetSoundParams TestMedium02 vol = MediumRainVolume 
		ENDIF 
		change Paused_Heavy_Rain = 0 
		change Inside_Heavy_Rain = 0 
	ENDIF 
	IF GotParam trigger_prefix 
		create prefix = <trigger_prefix> 
	ENDIF 
	IF GotParam quick_start 
		IF ( <trigger_exists> = 1 ) 
			IF GotParam hide_goal_pro 
				<trigger_obj_id> : Obj_Invisible 
			ENDIF 
		ENDIF 
		IF GotParam use_hud_counter 
			goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption> 
		ENDIF 
		IF NOT GotParam dont_show_goal_text 
			create_current_goal_panel_message { 
				text = <goal_text> 
			} 
			IF GotParam key_combo_text 
				SpawnScript goal_wait_and_show_key_combo_text params = { text = <key_combo_text> } 
			ENDIF 
		ENDIF 
		IF GotParam goal_start_script 
			<goal_start_script> <goal_start_script_params> 
		ENDIF 
		IF NOT goalmanager_haswongoal name = <goal_id> 
			SpawnScript goal_show_tips params = { goal_id = <goal_id> } 
		ENDIF 
		IF ( <trigger_exists> = 1 ) 
			goal_pro_stop_anim_scripts <...> 
		ENDIF 
		IF ( <trigger_exists> = 1 ) 
			IF NOT GotParam trigger_wait_script 
				<trigger_wait_script> = GenericProWaiting 
			ENDIF 
			<trigger_obj_id> : Obj_SpawnScript <trigger_wait_script> params = { type = "midgoal" goal_id = <goal_id> pro = <pro> } 
		ENDIF 
		FireEvent type = goal_cam_anim_post_start_done 
	ELSE 
		IF ( <trigger_exists> = 1 ) 
			goal_pro_stop_anim_scripts <...> 
			IF GotParam trigger_start_script 
				<trigger_obj_id> : Obj_SpawnScript <trigger_start_script> params = { goal_id = <goal_id> type = "talking" pro = <pro> } 
			ELSE 
				<trigger_obj_id> : Obj_SpawnScript GenericProTalking params = { goal_id = <goal_id> type = "talking" pro = <pro> } 
			ENDIF 
			IF NOT GotParam trigger_wait_script 
				<trigger_wait_script> = GenericProWaiting 
			ENDIF 
			IF GotParam goal_start_movie_script 
				<goal_start_movie_script> <goal_start_movie_script_params> 
			ENDIF 
			IF GotParam no_play_hold 
				<no_play_hold> = no_play_hold 
			ENDIF 
			SpawnScript goal_cam_anim_play id = new_goal_cam_anim params = { goal_id = <goal_id> 
				next_trigger_script = <trigger_wait_script> 
				type = "midgoal" 
				<no_play_hold> 
				dont_unpause = <dont_unpause> 
			} 
		ELSE 
			IF GotParam goal_start_script 
				<goal_start_script> <goal_start_script_params> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF GotParam kill_radius 
			<trigger_obj_id> : Obj_SetOuterRadius <kill_radius> 
			<trigger_obj_id> : Obj_SetException ex = ObjectOutofRadius scr = goal_crossed_kill_radius params = { goal_id = <goal_id> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_create_geo_prefix 
	create prefix = <geo_prefix> 
	FormatText TextName = geo_trigger_prefix "TRG_%p" p = <geo_prefix> 
	create prefix = <geo_trigger_prefix> 
	GoalManager_GetProsetNotPrefix <geo_prefix> 
	kill prefix = <proset_not_prefix> 
	FormatText TextName = geo_not_trigger_prefix "TRG_%p" p = <proset_not_prefix> 
	kill prefix = <geo_not_trigger_prefix> 
ENDSCRIPT

SCRIPT goal_kill_geo_prefix 
	kill prefix = <geo_prefix> 
	FormatText TextName = geo_trigger_prefix "TRG_%p" p = <geo_prefix> 
	kill prefix = <geo_trigger_prefix> 
	GoalManager_GetProsetNotPrefix <geo_prefix> 
	create prefix = <proset_not_prefix> 
	FormatText TextName = geo_not_trigger_prefix "TRG_%p" p = <proset_not_prefix> 
	create prefix = <geo_not_trigger_prefix> 
ENDSCRIPT

SCRIPT goal_create_proset_geom 
	IF GotParam proset_prefix 
		FormatText ChecksumName = proset_flag "FLAG_%pGEO_ON" p = <proset_prefix> 
		SetFlag flag = <proset_flag> 
		create prefix = <proset_prefix> 
		FormatText TextName = proset_trigger_prefix "TRG_%p" p = <proset_prefix> 
		create prefix = <proset_trigger_prefix> 
		GoalManager_GetProsetNotPrefix <proset_prefix> 
		kill prefix = <proset_not_prefix> 
		FormatText TextName = proset_not_trigger_prefix "TRG_%p" p = <proset_not_prefix> 
		kill prefix = <proset_not_trigger_prefix> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_kill_proset_geom 
	IF GotParam proset_prefix 
		FormatText ChecksumName = proset_flag "FLAG_%pGEO_ON" p = <proset_prefix> 
		UnSetFlag flag = <proset_flag> 
		kill prefix = <proset_prefix> 
		FormatText TextName = proset_trigger_prefix "TRG_%p" p = <proset_prefix> 
		kill prefix = <proset_trigger_prefix> 
		GoalManager_GetProsetNotPrefix <proset_prefix> 
		create prefix = <proset_not_prefix> 
		FormatText TextName = proset_not_trigger_prefix "TRG_%p" p = <proset_not_prefix> 
		create prefix = <proset_not_trigger_prefix> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_crossed_kill_radius 
	create_panel_message id = goal_message text = "You left the goal area!" style = panel_message_generic_loss 
	Obj_ClearException ObjectOutofRadius 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_expire 
	destroy_goal_panel_messages 
	create_panel_message id = goal_message text = "Out of time!" style = panel_message_generic_loss 
	IF GoalManager_EndRunCalled name = <goal_id> 
		IF GoalManager_StartedEndOfRun name = <goal_id> 
			SpawnSkaterScript goal_init_after_end_of_run params = { goal_id = <goal_id> } 
		ELSE 
			GoalManager_ClearEndRun name = <goal_id> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_success goal_text = "Default goal success text" 
	IF NOT InNetGame 
		kill_start_key_binding 
	ENDIF 
	goal_destroy_counter 
	GoalManager_GetGoalParams name = <goal_id> 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF NOT GotParam testing_goal 
		GoalEditor : FlagGoalAsWon goal_id = <goal_id> 
	ENDIF 
	IF GotParam goal_outro_script 
		<goal_outro_script> <goal_outro_script_params> 
	ENDIF 
	IF ObjectExists id = goal_message 
		RunScriptOnScreenElement id = goal_message kill_panel_message 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		goal_pro_stop_anim_scripts <...> 
		IF ObjectExists id = <trigger_obj_id> 
			IF GotParam trigger_success_script 
				<trigger_obj_id> : Obj_SpawnScript <trigger_success_script> params = { goal_id = <goal_id> pro = <pro> type = "Success" } 
			ELSE 
				<trigger_obj_id> : Obj_SpawnScript GenericProSuccess params = { goal_id = <goal_id> pro = <pro> type = "Success" } 
			ENDIF 
		ENDIF 
		IF NOT GotParam trigger_wait_script 
			<trigger_wait_script> = GenericProWaiting 
		ENDIF 
	ENDIF 
	<already_beat_goal> = 0 
	IF goalmanager_haswongoal name = <goal_id> 
		<already_beat_goal> = 1 
	ENDIF 
	IF NOT ( <already_beat_goal> = 1 ) 
		IF GotParam reward_trickslot 
			IF NOT GotParam already_added_trickslot 
				GoalManager_EditGoal name = <goal_id> params = { just_added_trickslot = 1 } 
				GetSkaterProfileInfoByName name = custom 
				IF ( <max_specials> < max_number_of_special_trickslots ) 
					AwardSpecialTrickslot 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	SpawnScript goal_success_messages params = <...> 
	IF GameModeEquals is_classic 
		SpawnScript classic_mode_check_for_all_complete_message 
	ENDIF 
	IF NOT InMultiplayerGame 
		<played_success_movie> = 0 
		IF ( ( GotParam success_cam_anim ) | ( GotParam success_cam_anims ) ) 
			<played_success_movie> = 1 
			change check_for_unplugged_controllers = 0 
			SpawnScript goal_cam_anim_play params = { goal_id = <goal_id> 
				just_won_goal = 1 
				gonna_show_message 
				already_beat_goal = <already_beat_goal> 
			} 
		ENDIF 
		IF ( <played_success_movie> = 0 ) 
			SpawnScript goal_success_no_anims params = <...> 
		ENDIF 
	ELSE 
		IF NOT InNetGame 
			restore_start_key_binding 
		ENDIF 
		IF GotParam goal_success_script 
			<goal_success_script> <goal_success_params> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_success_no_anims 
	goal_cam_anim_post_cleanup <...> 
	goal_cam_anim_post_success dont_kill_messages <...> 
ENDSCRIPT

goal_panel_total_messages_queued = 0 
goal_panel_current_message = 1 
goal_panel_queue_size = 0 
SCRIPT goal_panel_wait_and_reset_queue 
	wait 2 seconds 
	change goal_panel_current_message = ( goal_panel_current_message + 1 ) 
	change goal_panel_queue_size = ( goal_panel_queue_size -1 ) 
	wait 5 seconds 
	goal_panel_reset_queue 
ENDSCRIPT

SCRIPT goal_panel_reset_queue 
	change goal_panel_queue_size = 0 
	change goal_panel_total_messages_queued = 0 
	change goal_panel_current_message = 1 
	KillSpawnedScript name = goal_panel_wait_for_my_turn 
ENDSCRIPT

SCRIPT goal_panel_wait_for_my_turn 
	IF ( goal_panel_queue_size > 9 ) 
		goto nullscript 
	ENDIF 
	change goal_panel_total_messages_queued = ( goal_panel_total_messages_queued + 1 ) 
	change goal_panel_queue_size = ( goal_panel_queue_size + 1 ) 
	my_turn = ( goal_panel_total_messages_queued ) 
	BEGIN 
		IF ( <my_turn> = goal_panel_current_message ) 
			BREAK 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
	KillSpawnedScript name = goal_panel_wait_and_reset_queue 
	SpawnScript goal_panel_wait_and_reset_queue 
ENDSCRIPT

SCRIPT Goal_Success_Message_Sound_oldschool 
	PlaySound GoalGood vol = 200 
ENDSCRIPT

SCRIPT Goal_Success_Message_Sound_thps3 
	SpawnScript PlayTHPSSoundAfterWait 
ENDSCRIPT

SCRIPT goal_success_messages 
	goal_panel_wait_for_my_turn 
	IF ( ( LEVEL_ORIGINAL_GAME ) = THPS4 ) 
		SpawnScript Goal_Success_Message_Sound_oldschool 
	ELSE 
		IF GotParam IsTHPS3Level 
			SpawnScript Goal_Success_Message_Sound_thps3 
		ELSE 
			SpawnScript Goal_Success_Message_Sound 
		ENDIF 
	ENDIF 
	IF GotParam view_goals_text 
		create_panel_block dims = PAIR(1200.00000000000, 0.00000000000) id = goal_complete text = <view_goals_text> style = panel_message_goalcomplete 
	ELSE 
		create_panel_block dims = PAIR(1200.00000000000, 0.00000000000) id = goal_complete text = <goal_text> style = panel_message_goalcomplete 
	ENDIF 
	create_panel_message id = goal_complete_line2 text = "Complete!" style = panel_message_goalcompleteline2 
	IF GotParam reward_trickslot 
		IF GotParam just_added_trickslot 
			IF ( <just_added_trickslot> = 1 ) 
				GoalManager_EditGoal name = <goal_id> params = { just_added_trickslot = 0 } 
				goal_got_trickslot 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GoalManager_GoalExists name = <goal_id> 
		IF GoalManager_GetGoalRewardPoints name = <goal_id> 
			SpawnScript points_total params = { points = <reward_points> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT points_total 
	wait 0.75000000000 seconds 
	FormatText TextName = message "+%p POINTS" p = <points> 
	create_panel_message { 
		id = points_message 
		text = <message> 
		style = goal_points_animation 
	} 
	SpawnScript SK6_SFX_ShowPointsFromGoal 
	update_goal_points_display refresh 
ENDSCRIPT

SCRIPT goal_points_animation 
	SetProps rgba = [ 128 109 9 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 85.00000000000) scale = 5 alpha = 0 
	DoMorph time = 0.10000000149 scale = 1.79999995232 alpha = 1 rot_angle = 0 
	DoMorph time = 0.05999999866 pos = PAIR(322.00000000000, 88.00000000000) rot_angle = 3 
	DoMorph time = 0.05999999866 pos = PAIR(318.00000000000, 82.00000000000) rot_angle = -2 
	DoMorph time = 0.05999999866 pos = PAIR(322.00000000000, 88.00000000000) rot_angle = 4 
	DoMorph time = 0.05000000075 pos = PAIR(318.00000000000, 82.00000000000) rot_angle = -3 
	DoMorph time = 0.05000000075 pos = PAIR(322.00000000000, 88.00000000000) rot_angle = 2 
	DoMorph time = 0.05000000075 pos = PAIR(318.00000000000, 82.00000000000) rot_angle = 0 
	wait 0.20000000298 second 
	DoMorph time = 0.50000000000 pos = PAIR(320.00000000000, 30.00000000000) alpha = 0 
	Die 
ENDSCRIPT

SCRIPT goal_fail_messages 
	goal_panel_wait_for_my_turn 
	IF NOT GoalManager_GoalExists name = <goal_id> 
		RETURN 
	ENDIF 
	PlaySound GoalFail vol = 200 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam goal_fail_script 
		<goal_fail_script> <goal_fail_script_params> 
	ENDIF 
	IF GotParam view_goals_text 
		create_panel_block dims = PAIR(1200.00000000000, 0.00000000000) id = GoalFail text = <view_goals_text> style = panel_message_goalfail 
	ELSE 
		create_panel_block dims = PAIR(1200.00000000000, 0.00000000000) id = GoalFail text = <goal_text> style = panel_message_goalfail 
	ENDIF 
	create_panel_message id = goalfailedline2 text = "Failed!" style = panel_message_goalfailline2 
	retry_text = "Press \\b8 to retry goal" 
ENDSCRIPT

SCRIPT goal_lose_next_frame 
	printf "goal_lose_next_frame" 
	wait 1 frame 
	IF GoalManager_GoalIsActive name = <goal_id> 
		printf "losing goal" 
		GoalManager_LoseGoal name = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_fail 
	IF GotParam no_fail_messages 
		RETURN 
	ENDIF 
	SpawnScript goal_fail_messages params = { <...> } 
ENDSCRIPT

SCRIPT goal_uninit 
	GoalManager_GetGoalParams name = <goal_id> 
	goal_kill_proset_geom <...> 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF NOT GotParam testing_goal 
		IF NOT GotParam dont_kill_trigger_on_success 
			IF ( <trigger_exists> = 1 ) 
				IF IsAlive name = <trigger_obj_id> 
					GoalManager_StopLastStream name = <goal_id> 
					GoalManager_UnloadLastFam name = <goal_id> 
					kill name = <trigger_obj_id> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam init_geo_prefix 
		kill prefix = <init_geo_prefix> 
	ELSE 
		IF GotParam init_geo_prefixes 
			GetArraySize <init_geo_prefixes> 
			<index> = 0 
			BEGIN 
				kill prefix = ( <init_geo_prefixes> [ <index> ] ) 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_deactivate 
	GoalManager_GetGoalParams name = <goal_id> 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			IF IsAlive name = <trigger_obj_id> 
				<trigger_exists> = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GameModeEquals is_goal_attack 
		KillSpawnedScript name = goal_cam_anim_play 
		KillSpawnedScript name = goal_cam_anim_play_single_element 
		KillSpawnedScript name = TemporarilyDisableInput 
		KillSkaterCamAnim all 
		restore_skater_camera 
		speech_box_exit anchor_id = goal_description_anchor no_pad_start 
		IF NOT IsObserving 
			Skater : NetEnablePlayerInput 
		ENDIF 
		SetButtonEventMappings unblock_menu_input 
		restore_start_key_binding 
		IF NOT IsObserving 
			IF NOT GoalManager_CanStartGoal 
				MakeSkaterGoto OnGroundAI 
			ENDIF 
		ENDIF 
	ENDIF 
	KillAllTextureSplats 
	KillSpawnedScript name = goal_show_tips 
	KillSpawnedScript name = goal_wait_and_show_key_combo_text 
	goal_destroy_counter 
	IF GoalManager_EndRunCalled name = <goal_id> 
		IF GoalManager_StartedEndOfRun name = <goal_id> 
			SpawnSkaterScript goal_init_after_end_of_run params = { goal_id = <goal_id> } 
		ELSE 
			GoalManager_ClearEndRun name = <goal_id> 
		ENDIF 
	ENDIF 
	GoalManager_StopLastStream name = <goal_id> 
	GoalManager_UnloadLastFam name = <goal_id> 
	IF GotParam quick_start 
		GoalManager_EditGoal name = <goal_id> params = { last_start_was_quick_start = 1 } 
	ELSE 
		GoalManager_EditGoal name = <goal_id> params = { last_start_was_quick_start = 0 } 
	ENDIF 
	IF GotParam goal_intro_script 
		KillSpawnedScript name = goal_intro_script 
	ENDIF 
	IF GotParam goal_deactivate_script 
		<goal_deactivate_script> <goal_deactivate_script_params> 
	ENDIF 
	KillSpawnedScript name = goal_description_and_speech 
	KillSpawnedScript name = goal_wait_for_cam_anim 
	IF ScreenElementExists id = current_goal 
		DestroyScreenElement id = current_goal 
	ENDIF 
	IF ScreenElementExists id = current_goal_key_combo_text 
		DestroyScreenElement id = current_goal_key_combo_text 
	ENDIF 
	IF ObjectExists id = current_goal_description 
		DestroyScreenElement id = current_goal_description 
	ENDIF 
	IF NOT GotParam quick_start 
		IF ( <trigger_exists> = 1 ) 
			IF NOT GotParam just_won_goal 
				goal_pro_stop_anim_scripts <...> 
				IF GotParam trigger_wait_script 
					<trigger_obj_id> : Obj_SpawnScript <trigger_wait_script> params = { goal_id = <goal_id> pro = <pro> } 
				ELSE 
					<trigger_obj_id> : Obj_SpawnScript GenericProWaiting params = { goal_id = <goal_id> type = "wait" pro = <pro> } 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam control_type 
		IF NOT ( ( <control_type> = Skate ) | ( <control_type> = Walk ) ) 
			IF GotParam exit_node 
				ResetSkaters node_name = <exit_node> 
			ELSE 
				ResetSkaters node_name = <restart_node> 
			ENDIF 
			MakeSkaterGoto HandBrake 
			IF NOT IsObserving 
				IF GameIsPaused 
					Skater : Pause 
				ENDIF 
			ENDIF 
			IF GotParam edited_goal 
				GoalManager_GetLevelPrefix 
				FormatText ChecksumName = ReadyLevelScript "%l_CreateVehicles" l = <level_prefix> 
				IF ScriptExists <ReadyLevelScript> 
					<ReadyLevelScript> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam geo_prefix 
		goal_kill_geo_prefix geo_prefix = <geo_prefix> 
	ELSE 
		IF GotParam geo_prefixes 
			GetArraySize <geo_prefixes> 
			<index> = 0 
			BEGIN 
				goal_kill_geo_prefix geo_prefix = ( <geo_prefixes> [ <index> ] ) 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	IF GotParam trigger_prefix 
		kill prefix = <trigger_prefix> 
	ENDIF 
	IF NOT GotParam quick_start 
		IF ( <trigger_exists> = 1 ) 
			<trigger_obj_id> : Obj_Visible 
		ENDIF 
		GoalManager_ShowGoalPoints 
		IF NOT IsTrue ALWAYSPLAYMUSIC 
			IF NOT goalmanager_haswongoal name = <goal_id> 
				PauseMusic 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF NOT GotParam just_won_goal 
			IF NOT GotParam quick_start 
				IF NOT goalmanager_haswongoal name = <goal_id> 
					goal_add_ped_arrow goal_id = <goal_id> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF goalmanager_haswongoal name = <goal_id> 
		IF NOT GotParam quick_start 
			IF GotParam just_won_goal 
			ELSE 
				GoalManager_UninitializeGoal name = <goal_id> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_retry_select_handler 
	IF ( goal_bind_retry_to_select = 1 ) 
		IF GoalManager_CanStartGoal 
			RetryCurrentGoal 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT RetryCurrentGoal 
	IF GoalManager_CanRetryGoal 
		GoalManager_RestartLastGoal 
	ELSE 
	ENDIF 
ENDSCRIPT

SCRIPT end_current_goal_run 
	wait 1 gameframe 
	IF ObjectExists id = goal_message 
		RunScriptOnScreenElement id = goal_message kill_panel_message 
	ENDIF 
	IF GoalManager_HasActiveGoals 
		GoalManager_DeactivateAllGoals 
	ENDIF 
ENDSCRIPT

SCRIPT ready_skater_for_early_end_current_goal 
	IF InNetGame 
		IF GotParam Net 
			RETURN 
		ENDIF 
	ENDIF 
	IF InSplitScreenGame 
		RETURN 
	ENDIF 
	IF IsObserving 
		RETURN 
	ENDIF 
	IF GameModeEquals is_classic 
		RETURN 
	ENDIF 
	IF NOT ObjectExists id = Skater 
		RETURN 
	ENDIF 
	IF NOT IsObserving 
		IF Skater : IsInEndOfRun 
			ResetSkaters node_name = <restart_node> 
		ENDIF 
	ENDIF 
ENDSCRIPT

goal_cam_anim_offsets = [ 
	{ targetOffset = VECTOR(0.00000000000, 46.79999923706, 0.00000000000) positionOffset = VECTOR(9.60000038147, 10.80000019073, 75.59999847412) } 
	{ targetOffset = VECTOR(1.20000004768, 62.40000152588, 0.00000000000) positionOffset = VECTOR(-2.40000009537, 0.00000000000, 26.39999961853) } 
	{ targetOffset = VECTOR(3.59999990463, 57.59999847412, 0.00000000000) positionOffset = VECTOR(-7.19999980927, -31.20000076294, 70.80000305176) } 
	{ targetOffset = VECTOR(8.39999961853, 49.20000076294, 1.20000004768) positionOffset = VECTOR(-8.39999961853, 30.00000000000, 63.59999847412) } 
	{ targetOffset = VECTOR(-24.00000000000, 58.79999923706, 13.19999980927) positionOffset = VECTOR(51.59999847412, -2.40000009537, 91.19999694824) } 
	{ targetOffset = VECTOR(30.00000000000, 58.79999923706, 20.39999961853) positionOffset = VECTOR(-56.40000152588, -2.40000009537, 85.19999694824) } 
	{ targetOffset = VECTOR(30.00000000000, 58.79999923706, 20.39999961853) positionOffset = VECTOR(-56.40000152588, -2.40000009537, 85.19999694824) } 
	{ targetOffset = VECTOR(-20.39999961853, 43.20000076294, 32.40000152588) positionOffset = VECTOR(100.80000305176, 6.00000000000, 63.59999847412) } 
	{ targetOffset = VECTOR(30.00000000000, -14.39999961853, 2.40000009537) positionOffset = VECTOR(-36.00000000000, 148.80000305176, 446.39999389648) } 
	{ targetOffset = VECTOR(12.00000000000, -25.20000076294, -9.60000038147) positionOffset = VECTOR(312.00000000000, 159.60000610352, 366.00000000000) } 
	{ targetOffset = VECTOR(7.19999980927, 4.80000019073, 21.60000038147) positionOffset = VECTOR(-420.00000000000, 128.39999389648, 129.60000610352) } 
] 
SCRIPT goal_cam_anim_play 
	GoalManager_GetGoalParams name = <goal_id> 
	goal_cam_anim_pre_cleanup <...> 
	IF GotParam just_won_goal 
		IF GotParam success_cam_anim 
			<anim> = <success_cam_anim> 
		ELSE 
			IF GotParam success_cam_anims 
				<anims> = <success_cam_anims> 
			ELSE 
				<virtual_cam> = virtual_cam 
			ENDIF 
		ENDIF 
		goal_cam_anim_pre_success <...> 
		just_won_goal = just_won_goal 
	ELSE 
		IF GotParam start_cam_anim 
			<anim> = <start_cam_anim> 
		ELSE 
			IF GotParam start_cam_anims 
				<anims> = <start_cam_anims> 
			ELSE 
				IF ( ( GotParam pro ) & ( GotParam view_goals_cameras ) ) 
					IF StringEquals a = "Arcade Machine" b = <pro> 
						use_view_goals_cameras_for_intro = 1 
					ENDIF 
					IF StringEquals a = "Boombox" b = <pro> 
						use_view_goals_cameras_for_intro = 1 
					ENDIF 
				ENDIF 
				<virtual_cam> = virtual_cam 
			ENDIF 
		ENDIF 
		goal_cam_anim_pre_start <...> 
	ENDIF 
	hide_speech_boxes 
	GetSkaterId 
	<skaterId> = <ObjId> 
	IF NOT GotParam no_cam_anim 
		IF GotParam anims 
			GetArraySize <anims> 
			<index> = 0 
			BEGIN 
				IF ( <index> = ( <array_size> - 1 ) ) 
					<last_anim> = 1 
				ELSE 
					<last_anim> = 0 
				ENDIF 
				goal_cam_anim_play_single_element { ( <anims> [ <index> ] ) 
					goal_id = <goal_id> 
					anim_index = <index> 
					last_anim = <last_anim> 
					<just_won_goal> 
					cam_anim_index = <index> 
				} 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			goal_cam_anim_play_single_element <...> last_anim = 1 cam_anim_index = 0 
		ENDIF 
	ENDIF 
	goal_cam_anim_post_cleanup <...> 
	IF GotParam just_won_goal 
		goal_cam_anim_post_success <...> 
	ELSE 
		goal_cam_anim_post_start <...> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_cam_anim_pre_cleanup 
	GoalManager_PauseAllGoals 
	GetValueFromVolume cdvol 
	IF NOT InNetGame 
		IF ( <value> > 0 ) 
			<volume> = <value> 
			SetMusicVolume 20 
		ENDIF 
	ENDIF 
	IF GotParam TrickBeat 
		PauseMusic 1 
	ENDIF 
	IF GotParam edited_goal 
		Skater : PausePhysics 
	ENDIF 
	change check_for_unplugged_controllers = 0 
	Skater : StatsManager_DeactivateGoals 
	IF InNetGame 
		Skater : NetDisablePlayerInput 
	ELSE 
		Skater : DisablePlayerInput 
	ENDIF 
	GoalManager_SetCanStartGoal 0 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF GotParam trigger_obj_id 
			IF IsAlive name = <trigger_obj_id> 
				TerminateObjectsScripts id = <trigger_obj_id> script_name = GenericPro_LookAtSkater use_proper_version 
				<trigger_obj_id> : Obj_StopRotating 
				<trigger_obj_id> : Obj_LookAtObject type = Skater AngleThreshold = 15 speed = 500 time = 0 
			ENDIF 
		ENDIF 
	ENDIF 
	pause_trick_text 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			hide 
		} 
	ENDIF 
	IF GotParam letterbox 
		change last_screen_mode = ( current_screen_mode ) 
		IF NOT ( current_screen_mode = letterbox_screen_mode ) 
			screen_setup_letterbox 
		ENDIF 
	ENDIF 
	SetButtonEventMappings block_menu_input 
	GetSkaterId 
	IF InNetGame 
		<ObjId> : NetDisablePlayerInput 
	ELSE 
		<ObjId> : DisablePlayerInput 
	ENDIF 
	kill_start_key_binding 
	SpawnScript TemporarilyDisableInput 
	RETURN volume = <volume> 
ENDSCRIPT

SCRIPT goal_cam_anim_post_cleanup 
	change check_for_unplugged_controllers = 1 
	restore_start_key_binding 
	IF GotParam edited_goal 
		Skater : UnPausePhysics 
	ENDIF 
	IF InNetGame 
		Skater : NetEnablePlayerInput 
	ELSE 
		Skater : EnablePlayerInput 
	ENDIF 
	IF NOT GotParam dont_unpause 
		GoalManager_UnPauseAllGoals 
	ENDIF 
	GoalManager_SetCanStartGoal 
	Skater : StatsManager_ActivateGoals 
	IF NOT GotParam TrickBeat 
		PauseMusic 0 
	ENDIF 
	IF GotParam volume 
		SetMusicVolume ( <volume> * 10 ) 
	ENDIF 
	speech_box_exit 
	IF NOT Skater : Driving 
		UnPauseSkaters 
	ENDIF 
	unpause_trick_text 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps { 
			id = the_time 
			unhide 
		} 
		KillSpawnedScript name = clock_morph 
		RunScriptOnScreenElement id = the_time clock_morph 
	ENDIF 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF GotParam trigger_obj_id 
			IF IsAlive name = <trigger_obj_id> 
				IF NOT InNetGame 
					RunScriptOnObject { 
						id = <trigger_obj_id> 
						goal_trigger_reset_avoid_radius_exception 
						params = { goal_id = <goal_id> } 
					} 
				ENDIF 
				GoalManager_StopLastStream name = <goal_id> 
				GoalManager_UnloadLastFam name = <goal_id> 
			ENDIF 
		ENDIF 
		IF GotParam next_trigger_script 
			goal_pro_stop_anim_scripts <...> 
			IF ObjectExists id = <trigger_obj_id> 
				<trigger_obj_id> : Obj_SpawnScript <next_trigger_script> params = { type = <type> goal_id = <goal_id> pro = <pro> } 
			ENDIF 
		ENDIF 
	ENDIF 
	restore_start_key_binding 
	FireEvent type = goal_cam_anim_done 
	unhide_speech_boxes 
	IF GotParam letterbox 
		IF NOT ( last_screen_mode = current_screen_mode ) 
			SWITCH ( last_screen_mode ) 
				CASE standard_screen_mode 
					screen_setup_standard 
				CASE widescreen_screen_mode 
					screen_setup_widescreen 
				CASE %"16_10_screen_mode" 
					screen_setup_16_10 
				CASE letterbox_screen_mode 
					screen_setup_letterbox 
			ENDSWITCH 
		ENDIF 
	ENDIF 
	IF GotParam show_movie 
		IF ( <show_movie> = 1 ) 
			IF GotParam movie_file 
				ingame_play_movie <movie_file> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_cam_anim_pre_success 
	IF NOT InMultiplayerGame 
		SetButtonEventMappings block_menu_input 
		GetSkaterId 
		<ObjId> : DisablePlayerInput 
		SetScreenElementProps { 
			id = root_window 
			event_handlers = [ { pad_start nullscript } ] 
			replace_handlers 
		} 
		SpawnScript TemporarilyDisableInput 
		PauseSkaters 
	ENDIF 
	Skater : Obj_SetFlag FLAG_SKATER_INGOALINIT 
	IF GotParam success_node 
		ResetSkaters node_name = <success_node> 
	ENDIF 
	PauseSkaters 
	IF NOT GotParam dont_hide_skater 
		Skater : RemoveSkaterFromWorld 
	ENDIF 
	IF GotParam success_movie_wait_frames 
		wait <success_movie_wait_frames> gameframe 
	ENDIF 
	root_window : SetTags giving_rewards = 1 
ENDSCRIPT

SCRIPT goal_cam_anim_post_success 
	Skater : Obj_ClearFlag FLAG_SKATER_INGOALINIT 
	IF NOT GotParam dont_hide_skater 
		Skater : AddSkaterToWorld 
	ENDIF 
	KillSpawnedScript name = TemporarilyDisableInput 
	SetButtonEventMappings unblock_menu_input 
	Skater : EnablePlayerInput 
	root_window : SetTags giving_rewards = 0 
	IF NOT GotParam dont_kill_messages 
		KillSpawnedScript name = goal_success_messages 
		IF ScreenElementExists id = goal_complete_sprite 
			DestroyScreenElement id = goal_complete_sprite 
		ENDIF 
		IF ScreenElementExists id = goal_complete 
			DestroyScreenElement id = goal_complete 
		ENDIF 
		IF ScreenElementExists id = goal_complete_line2 
			DestroyScreenElement id = goal_complete_line2 
		ENDIF 
		IF ScreenElementExists id = goal_new_record 
			DestroyScreenElement id = goal_new_record 
		ENDIF 
		IF ScreenElementExists id = goal_current_reward 
			DestroyScreenElement id = goal_current_reward 
		ENDIF 
	ENDIF 
	IF NOT GoalManager_GoalExists name = <goal_id> 
		RETURN 
	ENDIF 
	goal_uninit goal_id = <goal_id> <...> 
	IF GotParam goal_success_script 
		<goal_success_script> <goal_success_params> 
	ENDIF 
	GoalManager_GetNumberOfGoalPoints total 
	IF ( <goal_points> = 129 ) 
		IF NOT GetGlobalFlag flag = GOT_ALL_GOALS 
		ENDIF 
	ENDIF 
	IF GotParam create_a_trick 
		goal_cat_create_menu goal_id = <goal_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_stage_script_done 
	restore_start_key_binding 
ENDSCRIPT

SCRIPT show_all_goals_done_dlg 
	wait 2 seconds 
	PauseGame 
	SetGlobalFlag flag = GOT_ALL_GOALS 
	goal_got_all_goals 
	WaitForEvent type = goal_got_all_goals_done 
	UnPauseGame 
	KillSpawnedScript name = show_all_goals_done_dlg 
ENDSCRIPT

SCRIPT goal_cam_anim_pre_start 
	MakeSkaterGoto Skater_GoalInit 
	KillSpawnedScript name = goal_description_and_speech 
	KillSpawnedScript name = goal_description_and_speech2 
ENDSCRIPT

SCRIPT goal_cam_anim_post_start 
	IF NOT GoalManager_GoalIsActive name = <goal_id> 
		FireEvent type = goal_cam_anim_post_start_done 
		RETURN 
	ENDIF 
	IF GotParam use_hud_counter 
		goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption> 
	ENDIF 
	goal_initialize_skater <...> 
	IF GotParam goal_start_script 
		<goal_start_script> <goal_start_script_params> 
	ENDIF 
	IF GotParam hide_goal_pro 
		<trigger_obj_id> : Obj_Invisible 
	ENDIF 
	DeBounce x time = 0.30000001192 
	FireEvent type = goal_cam_anim_post_start_done 
	BroadcastEvent type = goal_cam_anim_post_start_done 
ENDSCRIPT

SCRIPT hide_loading_screen 
	HideLoadingScreen 
ENDSCRIPT

SCRIPT goal_cam_anim_play_single_element 
	GoalManager_GetGoalParams name = <goal_id> 
	KillSpawnedScript name = TemporarilyDisableInput 
	SpawnScript TemporarilyDisableInput params = { time = 1000 } 
	GetSkaterId 
	<skaterId> = <ObjId> 
	IF GotParam pre_anim_script 
		<pre_anim_script> <pre_anim_script_params> 
	ENDIF 
	IF GotParam skater_node 
		ResetSkaters node_name = <skater_node> 
		MakeSkaterGoto Skater_GoalInit 
	ENDIF 
	IF GotParam walk_into_frame 
		IF NOT GotParam walk_into_frame_distance 
			<walk_into_frame_distance> = 120 
		ENDIF 
		MakeSkaterGoto Skater_GoalInit params = { Walk walk_distance = <walk_into_frame_distance> } 
	ENDIF 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF ( <trigger_exists> = 1 ) 
		IF GotParam ped_node 
			IF GotParam trigger_obj_id 
				<trigger_obj_id> : Obj_MoveToNode name = <ped_node> orient 
			ENDIF 
		ENDIF 
		IF GotParam trigger_obj_id 
			IF IsAlive name = <trigger_obj_id> 
				<trigger_obj_id> : Obj_StopRotating 
				<trigger_obj_id> : Obj_LookAtObject type = Skater AngleThreshold = 15 speed = 50600 time = 0 
			ENDIF 
		ENDIF 
		IF GotParam ped_script 
			IF GotParam trigger_obj_id 
				goal_pro_stop_anim_scripts <...> 
				<trigger_obj_id> : Obj_SpawnScript <ped_script> params = { goal_id = <goal_id> } 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT GotParam no_play_hold 
		<play_hold> = play_hold 
	ENDIF 
	IF NOT GotParam skippable 
		<skippable> = 1 
	ENDIF 
	IF ( <last_anim> = 1 ) 
		IF NOT GotParam just_won_goal 
			<skippable> = 0 
		ENDIF 
		<play_hold> = play_hold 
	ENDIF 
	IF GotParam virtual_cam 
		<anim> = <goal_id> 
		<virtual_cam> = virtual_cam 
		IF ( <trigger_exists> = 1 ) 
			IF NOT GotParam targetId 
				<trigger_obj_id> : Obj_GetID 
				<targetId> = <ObjId> 
			ENDIF 
		ENDIF 
		IF NOT ( ( GotParam targetOffset ) & ( GotParam positionOffset ) ) 
			IF GotParam use_view_goals_cameras_for_intro 
				RemoveParameter skaterId 
				targetId = world 
				element = ( <view_goals_cameras> [ 0 ] ) 
			ELSE 
				GetRandomArrayElement goal_cam_anim_offsets 
			ENDIF 
			<targetOffset> = ( <element> . targetOffset ) 
			<positionOffset> = ( <element> . positionOffset ) 
		ENDIF 
		IF NOT GotParam frames 
			<frames> = 120 
		ENDIF 
	ELSE 
		IF NOT GotParam anim 
			printstruct <...> 
			script_assert "No anim specified and no virtual_cam flag present" 
		ENDIF 
	ENDIF 
	SkProDisplayLoadingScreen freeze 
	PlaySkaterCamAnim { name = <anim> 
		skaterId = <skaterId> 
		targetId = <targetId> 
		targetOffset = <targetOffset> 
		positionOffset = <positionOffset> 
		frames = <frames> 
		<play_hold> 
		skippable = <skippable> 
		<virtual_cam> 
	} 
	DeBounce x time = 0.30000001192 
	IF GotParam null_goal 
		IF ( <last_anim> = 1 ) 
			<cam_anim_index> = -2 
		ENDIF 
		<last_anim> = 0 
		<skippable> = 1 
	ENDIF 
	IF ( ( GotParam edited_goal ) & ( GotParam just_won_goal ) ) 
		<last_anim> = 0 
		<skippable> = 1 
	ENDIF 
	<should_use_cam_anim_text> = 1 
	IF ( <last_anim> = 1 ) 
		IF NOT GotParam just_won_goal 
			<should_use_cam_anim_text> = 0 
		ENDIF 
	ENDIF 
	IF ( <should_use_cam_anim_text> = 0 ) 
		SpawnScript goal_description_and_speech params = <...> 
	ELSE 
		IF GotParam cam_anim_text 
			IF ( ( GotParam trigger_obj_id ) | ( GotParam speaker_obj_id ) ) 
				IF GotParam just_won_goal 
					GoalManager_PlayGoalWinStream { 
						name = <goal_id> 
						speaker_obj_id = <speaker_obj_id> 
						speaker_name = <speaker_name> 
						cam_anim_index = ( <cam_anim_index> + 1 ) 
					} 
				ELSE 
					GoalManager_PlayGoalStartStream { 
						name = <goal_id> 
						speaker_obj_id = <speaker_obj_id> 
						speaker_name = <speaker_name> 
						cam_anim_index = ( <cam_anim_index> + 1 ) 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GotParam cam_anim_text 
			<display_cam_anim_text> = "" 
			IF GotParam cam_anim_speaker_name 
				FormatText TextName = display_cam_anim_text "\\ca%s :\\c0\\n" s = <cam_anim_speaker_name> 
			ELSE 
				IF GotParam full_name 
					FormatText TextName = display_cam_anim_text "\\ca%s :\\c0\\n" s = <full_name> 
				ELSE 
					IF GotParam pro 
						FormatText ChecksumName = pro_checksum "%s" s = <pro> 
						goal_get_last_name pro = <pro> 
						IF GetSkaterLastNameString <pro_checksum> 
							FormatText TextName = pro_name_text "\\ca%s %l :\\c0\\n" s = <pro> l = <last_name> 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			IF IsArray <cam_anim_text> 
				GetArraySize <cam_anim_text> 
				<index> = 0 
				BEGIN 
					FormatText TextName = display_cam_anim_text "%s%n" s = <display_cam_anim_text> n = ( <cam_anim_text> [ <index> ] ) 
					<index> = ( <index> + 1 ) 
				REPEAT <array_size> 
			ELSE 
				FormatText TextName = display_cam_anim_text "%s%n" s = <display_cam_anim_text> n = <cam_anim_text> 
			ENDIF 
			IF NOT ( <skippable> = 0 ) 
				SetSkaterCamAnimSkippable skaterId = <skaterId> name = <anim> skippable = 0 
				FormatText TextName = display_cam_anim_text "%s\\nPress \\m0 to continue." s = <display_cam_anim_text> 
				<pad_choose_script> = goal_description_and_speech_continue 
				<pad_choose_params> = { no_pad_start anim = <anim> skippable = <skippable> } 
			ENDIF 
			IF ScreenElementExists id = speech_box_anchor 
				DestroyScreenElement id = speech_box_anchor 
			ENDIF 
			kill_start_key_binding 
			create_speech_box { 
				anchor_id = goal_description_anchor 
				text = <display_cam_anim_text> 
				pos = <text_anchor_pos> 
				style = speech_box_style 
				bg_x_scale = 1.29999995232 
				pad_choose_script = <pad_choose_script> 
				pad_choose_params = <pad_choose_params> 
			} 
		ELSE 
			<pad_choose_script> = goal_description_and_speech_continue 
			<pad_choose_params> = { no_pad_start anim = <anim> skippable = <skippable> } 
			create_speech_box { 
				anchor_id = goal_description_anchor 
				text = "Press \\m0 to continue." 
				pos = <text_anchor_pos> 
				style = speech_box_style 
				bg_x_scale = 1.29999995232 
				pad_choose_script = <pad_choose_script> 
				pad_choose_params = <pad_choose_params> 
			} 
		ENDIF 
	ENDIF 
	BEGIN 
		IF SkaterCamAnimFinished skaterId = <skaterId> name = <anim> 
			IF ScreenElementExists id = goal_description_anchor 
				DestroyScreenElement id = goal_description_anchor 
			ENDIF 
			GoalManager_StopLastStream name = <goal_id> 
			GoalManager_UnloadLastFam name = <goal_id> 
			DeBounce x time = 0.30000001192 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	IF GotParam post_anim_script 
		<post_anim_script> goal_id = <goal_id> <post_anim_script_params> 
	ENDIF 
	SkProDisplayLoadingScreen freeze 
	wait 1 gameframe 
	HideLoadingScreen 
ENDSCRIPT

SCRIPT goal_initialize_skater 
	Skater : RunStarted 
	IF NOT GotParam control_type 
		NonVehicleControlType = 1 
	ELSE 
		IF ( ( <control_type> = Skate ) | ( <control_type> = Walk ) ) 
			NonVehicleControlType = 1 
		ENDIF 
	ENDIF 
	IF GotParam NonVehicleControlType 
		SWITCH <control_type> 
			CASE Walk 
				IF GotParam restart_node 
					ResetSkaters node_name = <restart_node> RestartWalking 
				ENDIF 
			CASE Skate 
				IF GotParam restart_node 
					ResetSkaters node_name = <restart_node> 
				ENDIF 
				IF GotParam start_skater_standing 
					MakeSkaterGoto HandBrake 
				ENDIF 
			DEFAULT 
				IF GotParam restart_node 
					ResetSkaters node_name = <restart_node> 
				ENDIF 
				IF GotParam start_skater_standing 
					MakeSkaterGoto HandBrake 
				ENDIF 
		ENDSWITCH 
	ELSE 
		GetVehicleSetup control_type = <control_type> 
		IF NOT GotParam Exitable 
			IF GotParam edited_goal 
				MakeSkaterGoto Switch_OnGroundAI params = { NewScript = TransAm VehicleSetup = <VehicleSetup> edited_goal } 
			ELSE 
				MakeSkaterGoto Switch_OnGroundAI params = { NewScript = TransAm VehicleSetup = <VehicleSetup> } 
			ENDIF 
		ELSE 
			IF GotParam edited_goal 
				MakeSkaterGoto Switch_OnGroundAI params = { NewScript = TransAm VehicleSetup = <VehicleSetup> Exitable edited_goal } 
			ELSE 
				MakeSkaterGoto Switch_OnGroundAI params = { NewScript = TransAm VehicleSetup = <VehicleSetup> Exitable } 
			ENDIF 
		ENDIF 
		IF GotParam restart_node 
			PlayerVehicle : Vehicle_MoveToRestart <restart_node> 
		ENDIF 
		PlayerVehicleCamera : VehicleCamera_Reset 
		SetActiveCamera id = PlayerVehicleCamera 
		IF GotParam edited_goal 
			PlayerVehicle : Vehicle_Wake 
		ENDIF 
		IF GotParam goal_id 
			GoalManager_SetEndRunType name = <goal_id> None 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT TemporarilyDisableInput time = 1500 
	SetButtonEventMappings block_menu_input 
	wait <time> 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT goal_wait_and_show_key_combo_text 
	WaitForEvent type = panel_message_goal_done2 
	SetScreenElementLock id = current_goal on 
	SetScreenElementLock id = current_goal Off 
	SetScreenElementLock id = root_window Off 
	GetScreenElementPosition id = current_goal 
	<ScreenElementPos> = ( <ScreenElementPos> + PAIR(120.00000000000, 0.00000000000) ) 
	GetScreenElementDims id = current_goal 
	IF ScreenElementExists id = current_goal_key_combo_text 
		DestroyScreenElement id = current_goal_key_combo_text 
	ENDIF 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = root_window 
		id = current_goal_key_combo_text 
		dims = PAIR(300.00000000000, 0.00000000000) 
		allow_expansion 
		z_priority = -5 
		font = small 
		scale = 1 
		rgba = [ 128 128 128 110 ] 
		text = <text> 
		pos = ( <ScreenElementPos> + ( PAIR(0.00000000000, 1.00000000000) * <height> / 0.77999997139 ) ) 
		just = [ center top ] 
		internal_just = [ center top ] 
		scale = 0.75000000000 
	} 
ENDSCRIPT

SCRIPT hide_key_combo_text 
	IF ObjectExists id = current_goal_key_combo_text 
		DoScreenElementMorph id = current_goal_key_combo_text time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_key_combo_text 
	IF ObjectExists id = current_goal_key_combo_text 
		DoScreenElementMorph id = current_goal_key_combo_text time = 0 scale = 0.75000000000 
	ENDIF 
ENDSCRIPT

SCRIPT goal_description_and_speech 
	GoalManager_GetGoalParams name = <goal_id> 
	IF ScreenElementExists id = current_goal 
		DestroyScreenElement id = current_goal 
	ENDIF 
	IF ScreenElementExists id = current_goal_key_combo_text 
		DestroyScreenElement id = current_goal_key_combo_text 
	ENDIF 
	IF NOT GotParam null_goal 
		SpawnScript goal_wait_for_cam_anim params = <...> 
	ENDIF 
	<pro_name_text> = "" 
	IF GotParam cam_anim_speaker_name 
		FormatText TextName = pro_name_text "\\ca%s :\\c0\\n" s = <cam_anim_speaker_name> 
	ELSE 
		IF GotParam full_name 
			FormatText TextName = pro_name_text "\\ca%s :\\c0\\n" s = <full_name> 
		ELSE 
			IF GotParam pro 
				FormatText ChecksumName = pro_checksum "%s" s = <pro> 
				IF GetSkaterLastNameString <pro_checksum> 
					FormatText TextName = pro_name_text "\\ca%s %l :\\c0\\n" s = <pro> l = <last_name> 
				ENDIF 
				IF StringEquals a = "Arcade machine" b = <pro> 
					IF GotParam goal_text 
						goal_description = <goal_text> 
					ENDIF 
				ENDIF 
				IF StringEquals a = "Boombox" b = <pro> 
					IF GotParam view_goals_tip 
						goal_description = <view_goals_tip> 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam goal_description 
		IF IsArray <goal_description> 
			GetArraySize <goal_description> 
			<index> = 0 
			BEGIN 
				FormatText TextName = pro_name_text "%s%n" s = <pro_name_text> n = ( <goal_description> [ <index> ] ) 
				<index> = ( <index> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			FormatText TextName = pro_name_text "%s%n" s = <pro_name_text> n = <goal_description> 
		ENDIF 
		FormatText TextName = pro_name_text "%s\\nPress \\m0 to continue." s = <pro_name_text> 
	ENDIF 
	IF NOT GotParam just_won_goal 
		IF GotParam goal_description 
			GetSkaterId 
			IF NOT SkaterCamAnimFinished skaterId = <ObjId> name = <anim> 
				IF ObjectExists id = speech_box_anchor 
					DestroyScreenElement id = speech_box_anchor 
				ENDIF 
				create_speech_box { 
					anchor_id = goal_description_anchor 
					text = <pro_name_text> 
					pos = <text_anchor_pos> 
					style = speech_box_style 
					bg_x_scale = 1.29999995232 
					pad_choose_script = goal_description_and_speech_continue 
					pad_choose_params = { no_pad_start anim = <anim> skippable = 0 } 
				} 
				goal_description_anchor : SetTags anim = <anim> 
				AssignAlias id = goal_description_anchor alias = current_goal_description 
				wait 60 frame 
				IF NOT SkaterCamAnimFinished skaterId = <ObjId> name = <anim> 
					GoalManager_PlayGoalStartStream { 
						name = <goal_id> 
						speaker_obj_id = <speaker_obj_id> 
						speaker_name = <speaker_name> 
						last_anim 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_description_and_speech_continue 
	DeBounce x time = 0.30000001192 
	<should_kill_anim> = 1 
	IF ( ( GotParam anim ) & ( <should_kill_anim> = 1 ) ) 
		GetSkaterId 
		KillSkaterCamAnim skaterId = <ObjId> name = <anim> 
	ENDIF 
	IF GotParam no_pad_start 
		speech_box_exit anchor_id = goal_description_anchor no_pad_start 
	ELSE 
		speech_box_exit anchor_id = goal_description_anchor 
	ENDIF 
	FireEvent type = goal_description_and_speech_continue 
ENDSCRIPT

SCRIPT create_current_goal_panel_message { 
		id = current_goal 
		parent = root_window 
		style = panel_message_goal 
		final_pos = PAIR(610.00000000000, 80.00000000000) 
		final_scale = 0.15999999642 
	} 
	create_panel_block { 
		id = <id> 
		text = <text> 
		style = <style> 
		parent = <parent> 
		final_pos = <final_pos> 
		final_scale = <final_scale> 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		dims = PAIR(1100.00000000000, 0.00000000000) 
		font_face = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
	} 
ENDSCRIPT

SCRIPT goal_wait_for_cam_anim 
	GetSkaterId 
	BEGIN 
		IF SkaterCamAnimFinished skaterId = <ObjId> name = <anim> 
			SpawnScript goal_show_tips params = { goal_id = <goal_id> } 
			IF NOT GotParam dont_show_goal_text 
				create_current_goal_panel_message { 
					text = <goal_text> 
				} 
				IF GotParam key_combo_text 
					SpawnScript goal_wait_and_show_key_combo_text params = { text = <key_combo_text> } 
				ENDIF 
			ENDIF 
			BREAK 
		ENDIF 
		wait 10 one_per_frame 
	REPEAT 
ENDSCRIPT

SCRIPT goal_description_and_speech2 blink_time = 0.05000000075 
	SetProps just = [ center top ] internal_just = [ center center ] rgba = [ 128 128 128 128 ] 
	DoMorph pos = PAIR(320.00000000000, 114.00000000000) scale = 0 
	DoMorph pos = PAIR(320.00000000000, 114.00000000000) scale = 1.20000004768 time = 0.10000000149 
	DoMorph pos = PAIR(320.00000000000, 114.00000000000) scale = 0.80000001192 time = 0.10000000149 
	DoMorph pos = PAIR(320.00000000000, 114.00000000000) scale = 1 time = 0.10000000149 
	DoMorph pos = PAIR(320.00000000000, 114.00000000000) scale = 0.89999997616 time = 0.05000000075 
	DoMorph pos = PAIR(321.00000000000, 116.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 113.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 115.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(318.00000000000, 113.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 115.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 113.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 117.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 113.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(320.00000000000, 120.00000000000) scale = 1.25000000000 time = 0.10000000149 
	SetProps internal_just = [ center top ] rgba = [ 128 128 128 110 ] just = [ right top ] 
	DoMorph pos = PAIR(625.00000000000, 15.00000000000) scale = 0.77999997139 time = 0.05000000075 
	RunScriptOnScreenElement id = current_goal blink_current_goal params = { blink_time = <blink_time> } 
ENDSCRIPT

SCRIPT blink_current_goal 
	BEGIN 
		DoMorph alpha = 0 
		wait <blink_time> seconds 
		DoMorph alpha = 1 
		wait <blink_time> seconds 
	REPEAT 6 
ENDSCRIPT

SCRIPT GoalManager_InitGoalTrigger 
	GoalManager_GetGoalParams name = <name> 
	IF NOT NodeExists <trigger_obj_id> 
		RETURN 
	ENDIF 
	IF NOT IsAlive name = <trigger_obj_id> 
		create name = <trigger_obj_id> 
	ENDIF 
	<trigger_obj_id> : SetTags goal_id = <goal_id> 
	IF NOT GotParam quick_start 
		goal_add_ped_arrow goal_id = <goal_id> 
	ENDIF 
	goal_pro_stop_anim_scripts <...> 
	<trigger_obj_id> : Obj_SpawnScript goal_set_trigger_exceptions params = { goal_id = <goal_id> } 
	IF GotParam trigger_wait_script 
		<trigger_obj_id> : Obj_SpawnScript <trigger_wait_script> params = { goal_id = <goal_id> pro = <pro> } 
	ELSE 
		<trigger_obj_id> : Obj_SpawnScript GenericProWaiting params = { goal_id = <goal_id> type = "wait" pro = <pro> } 
	ENDIF 
ENDSCRIPT

SCRIPT goal_add_ped_arrow 
	GoalManager_GetGoalParams name = <goal_id> 
	IF NOT IsAlive name = <trigger_obj_id> 
		RETURN 
	ENDIF 
	IF NOT GotParam goal_ped_arrow_height 
		<goal_ped_arrow_height> = 100 
	ENDIF 
	<goal_arrow_pos> = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <goal_ped_arrow_height> ) 
	IF GotParam pro_specific_challenge 
		<arrow> = "Super_Pro_Arrow" 
	ELSE 
		IF GotParam pro_goal 
			<arrow> = "Ped_Pro_Arrow" 
		ELSE 
			<arrow> = "Arrow" 
		ENDIF 
	ENDIF 
	FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name> 
	IF ScreenElementExists id = <arrow_id> 
		DestroyScreenElement id = <arrow_id> 
	ENDIF 
	SetScreenElementLock id = root_window Off 
	IF NOT IsTrue no_arrows 
		CreateScreenElement { 
			parent = root_window 
			type = Element3D 
			id = <arrow_id> 
			model = <arrow> 
			HoverParams = { Amp = 9.50000000000 Freq = 2.50000000000 } 
			AngVelY = 0.15999999642 
			ParentParams = { name = <trigger_obj_id> <goal_arrow_pos> IgnoreParentsYRotation } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT goal_ped_kill_arrow 
	GoalManager_GetGoalParams name = <goal_id> 
	FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name> 
	IF ScreenElementExists id = <arrow_id> 
		DestroyScreenElement id = <arrow_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_trigger_wait_and_set_exceptions 
	wait 20 gameframe 
	goal_set_trigger_exceptions <...> 
ENDSCRIPT

SCRIPT goal_set_trigger_exceptions trigger_radius = 16 
	IF ObjectExists id = goal_start_dialog 
		speech_box_exit anchor_id = goal_start_dialog 
	ENDIF 
	Obj_ClearException ObjectOutofRadius 
	Obj_SetInnerRadius <trigger_radius> 
	IF NOT GotParam dont_bounce_skater 
		Obj_GetID 
		SetEventHandlerOnObject { 
			object = <ObjId> 
			exception 
			ex = ObjectInRadius 
			scr = goal_got_trigger 
			params = { goal_id = <goal_id> } 
		} 
	ENDIF 
	GoalManager_GetGoalParams name = <goal_id> 
	IF NOT InNetGame 
		IF NOT GotParam dont_bounce_skater 
			IF NOT InNetGame 
				Obj_SpawnScript goal_trigger_reset_avoid_radius_exception params = { goal_id = <goal_id> } 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_pro_bounce_skater speed = 88 
	IF NOT SkaterCamAnimFinished 
		RETURN 
	ENDIF 
	IF InNetGame 
		RETURN 
	ENDIF 
	printf "goal_pro_bounce_skater" 
	IF NOT GotParam ped_id 
		Obj_GetID 
		<ped_id> = <ObjId> 
	ENDIF 
	GetSkaterId 
	<skaterId> = <ObjId> 
	IF NOT <skaterId> : IsLocalSkater 
		RETURN 
	ENDIF 
	IF <skaterId> : Driving 
		RETURN 
	ENDIF 
	IF ( cutscene_is_playing = 1 ) 
		RETURN 
	ENDIF 
	IF NOT SkaterCamAnimFinished 
		RETURN 
	ENDIF 
	IF SkaterCurrentScorePotGreaterThan 0 
		RETURN 
	ENDIF 
	<skaterId> : GetSkaterState 
	IF NOT ( <state> = Skater_OnGround ) 
		RETURN 
	ENDIF 
	IF <ped_id> : IsHidden 
		RETURN 
	ENDIF 
	root_window : GetTags 
	IF GotParam giving_rewards 
		IF ( <giving_rewards> = 1 ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF <skaterId> : SpeedGreaterThan 200 
		IF GotParam goal_id 
			GoalManager_PlayGoalStream name = <goal_id> type = "avoid" play_random 
		ENDIF 
		<ped_id> : Obj_ClearException ObjectInAvoidRadius 
		<ped_id> : Obj_SpawnScript { 
			<reset_script> 
			params = <...> 
		} 
		RETURN 
	ENDIF 
	<skaterId> : GetTags 
	IF NOT ( <racemode> = None ) 
		RETURN 
	ENDIF 
	<ped_id> : Obj_ClearException ObjectInAvoidRadius 
	<ped_id> : Obj_SpawnScript { 
		<reset_script> 
		params = <...> 
	} 
	<should_bounce_skater> = 1 
	<ped_id> : GetTags 
	<skaterId> : Obj_GetOrientationToObject <id> 
	IF ( <dotProd> < 0.00000000000 ) 
		IF ( <dotProd> > -0.10000000149 ) 
			<speed> = 500 
			<heading> = 180 
		ELSE 
			<heading> = 90.00000000000 
		ENDIF 
	ELSE 
		IF ( <dotProd> < 0.10000000149 ) 
			<speed> = 500 
			<heading> = 180 
		ELSE 
			<heading> = -90 
		ENDIF 
	ENDIF 
	<skaterId> : SkaterAvoidGoalPed heading = <heading> speed = <speed> 
	IF GotParam collision_exception_return_state 
		goto <collision_exception_return_state> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_pro_wait_and_reset_avoid_exception 
	IF InNetGame 
		RETURN 
	ENDIF 
	wait 20 gameframe 
	goal_trigger_reset_avoid_radius_exception <...> 
ENDSCRIPT

SCRIPT goal_trigger_reset_avoid_radius_exception 
	IF InNetGame 
		RETURN 
	ENDIF 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam dont_bounce_skater 
		RETURN 
	ENDIF 
	Obj_SetInnerAvoidRadius 3 
	Obj_GetID 
	SetEventHandlerOnObject { 
		object = <ObjId> 
		exception 
		ex = ObjectInAvoidRadius 
		scr = goal_pro_bounce_skater 
		params = { 
			ped_id = <ObjId> 
			goal_id = <goal_id> 
			reset_script = goal_pro_wait_and_reset_avoid_exception 
		} 
	} 
ENDSCRIPT

SCRIPT goal_got_trigger 
	GetSkaterId 
	<skaterId> = <ObjId> 
	IF goalmanager_haswongoal name = <goal_id> 
		GoalManager_GetGoalParams name = <goal_id> 
		IF NOT GotParam dont_kill_trigger_on_success 
			RETURN 
		ENDIF 
	ENDIF 
	IF GoalManager_GoalIsActive name = <goal_id> 
		RETURN 
	ENDIF 
	IF GoalManager_GoalIsLocked name = <goal_id> 
		RETURN 
	ENDIF 
	IF Skater : IsSkaterOnVehicle 
		RETURN 
	ENDIF 
	IF CustomParkMode editing 
		RETURN 
	ENDIF 
	IF ObjectExists id = goal_start_dialog 
		<should_destroy> = 0 
		IF <skaterId> : IsInBail 
			<should_destroy> = 1 
		ENDIF 
		IF SkaterCurrentScorePotGreaterThan 0 
			<should_destroy> = 1 
		ENDIF 
		IF <skaterId> : Driving 
			<should_destroy> = 1 
		ENDIF 
		IF NOT GoalManager_CanStartGoal 
			<should_destroy> = 1 
		ENDIF 
		IF ( <should_destroy> = 1 ) 
			DestroyScreenElement id = goal_start_dialog 
		ENDIF 
	ELSE 
		IF ObjectExists id = root_window 
			root_window : GetTags 
			IF GotParam menu_state 
				IF ( <menu_state> = on ) 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GoalManager_CanStartGoal name = <goal_id> 
			<skater_ready_for_goal> = 0 
			IF NOT <skaterId> : Driving 
				IF <skaterId> : Skating 
					IF <skaterId> : OnGround 
						<skater_ready_for_goal> = 1 
					ENDIF 
				ELSE 
					IF <skaterId> : Walk_Ground 
						<skater_ready_for_goal> = 1 
					ENDIF 
				ENDIF 
			ENDIF 
			IF ( <skater_ready_for_goal> = 1 ) 
				IF NOT <skaterId> : IsInBail 
					IF NOT SkaterCurrentScorePotGreaterThan 0 
						GoalManager_GetGoalParams name = <goal_id> 
						<trigger_obj_id> : Obj_SetOuterRadius 20 
						<trigger_obj_id> : Obj_SetException ex = ObjectOutofRadius scr = goal_trigger_refuse params = { goal_id = <goal_id> } 
						IF InNetGame 
							<quick_start_text> = "\\n\\m7 to quick start." 
							<pad_square_script> = goal_accept_trigger 
							<pad_square_params> = { goal_id = <goal_id> quick_start } 
						ELSE 
							<quick_start_text> = "" 
						ENDIF 
						IF NOT GotParam trigger_action_text 
							trigger_action_text = "talk" 
						ENDIF 
						IF GotParam full_name 
							FormatText TextName = accept_text "%f: \\m5 to %a.%q" f = <full_name> q = <quick_start_text> a = <trigger_action_text> 
						ELSE 
							IF GotParam pro 
								IF StringEquals a = "Arcade machine" b = <pro> 
									trigger_action_text = "play" 
								ELSE 
									IF StringEquals a = "Boombox" b = <pro> 
										trigger_action_text = "start the music" 
									ENDIF 
								ENDIF 
								FormatText ChecksumName = name_checksum "%s" s = <pro> 
								GetSkaterLastNameString <name_checksum> 
								IF GotParam last_name 
									FormatText TextName = accept_text "%s %l: \\m5 to %a.%q" s = <pro> l = <last_name> q = <quick_start_text> a = <trigger_action_text> 
								ELSE 
									FormatText TextName = accept_text "%s: \\m5 to %a.%q" s = <pro> q = <quick_start_text> a = <trigger_action_text> 
								ENDIF 
							ELSE 
								FormatText TextName = accept_text "\\m5 to %a.%q" q = <quick_start_text> a = <trigger_action_text> 
							ENDIF 
						ENDIF 
						create_speech_box { 
							anchor_id = goal_start_dialog 
							text = <accept_text> 
							no_pad_choose 
							no_pad_start 
							pad_circle_script = goal_accept_trigger 
							pad_circle_params = { goal_id = <goal_id> } 
							pad_square_script = <pad_square_script> 
							pad_square_params = <pad_square_params> 
							bg_rgba = [ 100 100 100 128 ] 
							text_rgba = [ 128 128 128 128 ] 
							z_priority = 5 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_trigger_refuse anchor_id = goal_start_dialog 
	Obj_ClearException ObjectOutofRadius 
	speech_box_exit anchor_id = <anchor_id> 
	GoalManager_ResetGoalTrigger name = <goal_id> 
ENDSCRIPT

SCRIPT goal_accept_trigger 
	DeBounce x time = 0.50000000000 
	speech_box_exit anchor_id = goal_start_dialog 
	goal_check_for_required_tricks goal_id = <goal_id> 
	<trigger_exists> = 0 
	IF GotParam trigger_obj_id 
		IF NodeExists <trigger_obj_id> 
			<trigger_exists> = 1 
		ENDIF 
	ENDIF 
	IF GotParam force_start 
		IF NOT GoalManager_GoalInitialized name = <goal_id> 
			GoalManager_InitializeGoal name = <goal_id> 
		ENDIF 
		IF ( <trigger_exists> = 1 ) 
			GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions 
			IF IsAlive name = <trigger_obj_id> 
				<trigger_obj_id> : Obj_ClearException ObjectInRadius 
			ENDIF 
		ENDIF 
		GoalManager_DeactivateAllGoals 
		GoalManager_ActivateGoal name = <goal_id> <...> 
		RETURN 
	ENDIF 
	IF NOT SkaterCurrentScorePotGreaterThan 0 
		IF GoalManager_CanStartGoal name = <goal_id> 
			GetSkaterId 
			IF <ObjId> : OnGround 
				IF SkaterCurrentScorePotLessThan 1 
					IF <ObjId> : OnGround 
						GoalManager_GetGoalParams name = <goal_id> 
						IF ( <trigger_exists> = 1 ) 
							GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions 
							IF IsAlive name = <trigger_obj_id> 
								<trigger_obj_id> : Obj_ClearException ObjectInRadius 
							ENDIF 
						ENDIF 
						GoalManager_DeactivateAllGoals 
						IF GotParam quick_start 
							GoalManager_QuickStartGoal name = <goal_id> 
						ELSE 
							GoalManager_ActivateGoal name = <goal_id> <...> 
						ENDIF 
					ELSE 
						IF NOT <ObjId> : RightPressed 
							IF NOT <ObjId> : LeftPressed 
								IF NOT <ObjId> : UpPressed 
									IF NOT <ObjId> : DownPressed 
										GoalManager_GetGoalParams name = <goal_id> 
										IF ( <trigger_exists> = 1 ) 
											GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions 
											IF IsAlive name = <trigger_obj_id> 
												<trigger_obj_id> : Obj_ClearException ObjectInRadius 
											ENDIF 
										ENDIF 
										GoalManager_DeactivateAllGoals 
										IF GotParam quick_start 
											GoalManager_QuickStartGoal name = <goal_id> 
										ELSE 
											GoalManager_ActivateGoal name = <goal_id> <...> 
										ENDIF 
									ENDIF 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ELSE 
				IF NOT <ObjId> : RightPressed 
					IF NOT <ObjId> : LeftPressed 
						IF NOT <ObjId> : UpPressed 
							IF NOT <ObjId> : DownPressed 
								GoalManager_GetGoalParams name = <goal_id> 
								IF ( <trigger_exists> = 1 ) 
									GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions 
									IF IsAlive name = <trigger_obj_id> 
										<trigger_obj_id> : Obj_ClearException ObjectInRadius 
									ENDIF 
								ENDIF 
								GoalManager_DeactivateAllGoals 
								IF GotParam quick_start 
									GoalManager_QuickStartGoal name = <goal_id> 
								ELSE 
									GoalManager_ActivateGoal name = <goal_id> <...> 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GoalManager_ResetGoalTrigger 
	IF GotParam goal_id 
		GoalManager_GetGoalParams name = <goal_id> 
	ELSE 
		GoalManager_GetGoalParams name = <name> 
	ENDIF 
	IF NOT GotParam trigger_obj_id 
		RETURN 
	ENDIF 
	IF NOT NodeExists <trigger_obj_id> 
		RETURN 
	ENDIF 
	IF IsAlive name = <trigger_obj_id> 
		<trigger_obj_id> : Obj_ClearException ObjectInRadius 
		IF NOT GotParam no_new_exceptions 
			IF NOT GotParam just_won_goal 
				<trigger_obj_id> : Obj_SpawnScript goal_trigger_wait_and_set_exceptions params = { goal_id = <goal_id> } 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_check_for_required_tricks 
	<found_unmapped_trick> = 0 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam required_tricks 
		FormatText TextName = warning_string "You do not have all the tricks you will need to complete this goal. You will need to assign:" 
		GetArraySize <required_tricks> 
		<index> = 0 
		BEGIN 
			IF NOT GetKeyComboBoundToTrick trick = ( <required_tricks> [ <index> ] ) 
				IF NOT GetKeyComboBoundToTrick trick = ( <required_tricks> [ <index> ] ) special 
					<trick_name> = ( <required_tricks> [ <index> ] ) 
					<trick_params> = ( <trick_name> . params ) 
					<trick_string> = ( <trick_params> . name ) 
					IF ( <found_unmapped_trick> = 0 ) 
						FormatText TextName = warning_string "%s\\n%t" s = <warning_string> t = <trick_string> 
					ELSE 
						FormatText TextName = warning_string "%s, %t" s = <warning_string> t = <trick_string> 
					ENDIF 
					<found_unmapped_trick> = 1 
				ENDIF 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	IF ( <found_unmapped_trick> = 1 ) 
		PauseGame 
		create_error_box { title = "WARNING!" 
			text = <warning_string> 
			text_dims = PAIR(400.00000000000, 0.00000000000) 
			bg_scale = 1.20000004768 
			buttons = [ { text = "Edit Tricks" pad_choose_script = goal_unmapped_tricks_box_accept } 
				{ text = "Skip this challenge" pad_choose_script = goal_unmapped_tricks_box_exit pad_choose_params = { goal_id = <goal_id> } } 
			] 
		} 
	ENDIF 
	RETURN found_unmapped_trick = <found_unmapped_trick> 
ENDSCRIPT

SCRIPT goal_unmapped_tricks_box_accept 
	dialog_box_exit 
	create_edit_tricks_menu 
ENDSCRIPT

SCRIPT goal_unmapped_tricks_box_exit 
	GoalManager_ResetGoalTrigger name = <goal_id> 
	dialog_box_exit 
	UnPauseGame 
ENDSCRIPT

SCRIPT goal_got_trickslot 
	create_panel_message { 
		id = goal_current_reward 
		text = "You got a new special trick slot" 
		style = goal_message_got_trickslot 
	} 
ENDSCRIPT

SCRIPT goal_got_all_goals 
	StopStream 
	PlayStream FoundAllGaps vol = 150 
	unlock_all_cheat_codes 
	unlock_all_gameplay_cheat_codes 
	StopStream 
	PlayStream FoundAllGaps vol = 150 
	<text> = "Way to go back and clean out the story goals. \\n\\nYou\'ve unlocked \\c3new cheats\\c0 to help you take it further. Access them from the Pause menu under Options. Good luck!" 
	create_dialog_box { title = "All Goals" 
		text = <text> 
		pos = PAIR(310.00000000000, 225.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		buttons = [ { font = small text = "OK" pad_choose_script = goal_got_all_goals_accept } ] 
		delay_input 
	} 
ENDSCRIPT

SCRIPT goal_got_all_goals_accept 
	dialog_box_exit 
	FireEvent type = goal_got_all_goals_done 
ENDSCRIPT

SCRIPT goal_play_stream 
	IF GotParam streamId 
		BEGIN 
			IF PreLoadStreamDone <streamId> 
				BREAK 
			ENDIF 
			wait 1 frame 
		REPEAT 
	ENDIF 
	IF GotParam play_anim 
		AddAnimController { 
			type = partialAnim 
			id = jawRotation 
			animName = <stream_checksum> 
			from = start 
			to = end 
			speed = 1.00000000000 
		} 
	ENDIF 
	IF GotParam streamId 
		StartPreloadedStream { 
			streamId = <streamId> 
			volume = 190 
		} 
	ELSE 
		Obj_PlayStream { 
			<stream_checksum> 
			vol = 120 
			dropoff = 300 
			use_pos_info = <use_pos_info> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT goal_init_after_end_of_run 
	IF NOT GoalManager_GoalExists name = <goal_id> 
		RETURN 
	ENDIF 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam competition 
		RETURN 
	ENDIF 
	GetSkaterId 
	BEGIN 
		IF GoalManager_GoalExists name = <goal_id> 
			IF GoalManager_FinishedEndOfRun name = <goal_id> 
				GoalManager_ClearEndRun name = <goal_id> 
				IF NOT GameModeEquals is_classic 
					IF <ObjId> : IsSkaterOnVehicle 
						GetCurrentSkaterProfileIndex 
						GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
						IF GotParam vehicle_params 
							Vehicle_Start params = <vehicle_params> 
						ENDIF 
					ELSE 
						IF <ObjId> : Skating 
							MakeSkaterGoto OnGroundAI 
						ENDIF 
					ENDIF 
				ENDIF 
				IF InNetGame 
					<ObjId> : NetEnablePlayerInput 
				ELSE 
					IF NOT GameModeEquals is_classic 
						<ObjId> : EnablePlayerInput 
					ENDIF 
				ENDIF 
				BREAK 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT goal_new_level_reject 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementProps { 
		id = root_window 
		tags = { menu_state = Off } 
	} 
	FireEvent type = goal_new_level_unlocked_done 
ENDSCRIPT

SCRIPT goal_want_to_save 
	GetValueFromVolume cdvol 
	root_window : SetTags menu_state = on 
	hide_console_window 
	pause_trick_text 
	destroy_goal_panel_messages 
	GoalManager_SetCanStartGoal 0 
	pause_rain 
	DeBounce x time = 0.30000001192 
	PauseGame 
	kill_start_key_binding 
	FormatText TextName = dialog_box_text "Do you want to save now?" 
	create_snazzy_dialog_box { text = <dialog_box_text> 
		title = "" 
		buttons = [ { text = "Yes" pad_choose_script = goal_save_accept } 
			{ text = "No" pad_choose_script = goal_save_reject } 
		] 
		pad_back_script = goal_save_reject 
	} 
	AssignAlias id = dialog_box_anchor alias = current_menu_anchor 
	create_helper_text generic_helper_text 
ENDSCRIPT

SCRIPT goal_save_accept 
	dialog_box_exit 
	kill_start_key_binding 
	launch_beat_goal_save_game_sequence pad_back_script = goal_save_reject no_cam_anim 
ENDSCRIPT

SCRIPT goal_save_reject 
	UnPauseGame 
	GoalManager_SetCanStartGoal 1 
	restore_start_key_binding 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementProps { 
		id = root_window 
		tags = { menu_state = Off } 
	} 
	root_window : SetTags menu_state = Off 
	unpause_rain 
	unhide_console_window 
	unpause_trick_text 
	FireEvent type = goal_wait_for_save 
ENDSCRIPT

SCRIPT goal_create_counter 
	SetScreenElementLock id = root_window Off 
	goal_destroy_counter 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = goal_counter_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(305.00000000000, 320.00000000000) 
	} 
	<root_pos> = PAIR(550.00000000000, 90.00000000000) 
	Theme_GetUnhighlightedTextColor return_value = rgba_off 
	Theme_GetHighlightedTextColor return_value = rgba_on 
	CreateScreenElement { 
		type = TextElement 
		parent = goal_counter_anchor 
		id = goal_counter_number_collected 
		font = small 
		text = "0" 
		pos = <root_pos> 
		just = [ center top ] 
		scale = 0.89999997616 
		rgba = <rgba_on> 
	} 
	IF GoalManager_GetNumberOfFlags name = <goal_id> 
		<total_number> = <number_of_flags> 
	ELSE 
		GoalManager_GetGoalParams name = <goal_id> 
		IF GotParam number 
			<total_number> = <number> 
		ELSE 
			IF GotParam num_gaps_to_find 
				<total_number> = <num_gaps_to_find> 
			ELSE 
				script_assert "Couldn\'t find number param.  Are the params for the hud counter setup?" 
			ENDIF 
		ENDIF 
	ENDIF 
	FormatText TextName = total_number "%i" i = <total_number> 
	CreateScreenElement { 
		type = TextElement 
		parent = goal_counter_anchor 
		id = goal_counter_number_total 
		rgba = <rgba_off> 
		font = small 
		text = <total_number> 
		pos = ( <root_pos> + PAIR(47.00000000000, 0.00000000000) ) 
		just = [ center top ] 
		scale = 0.89999997616 
	} 
	Theme_GetSpeechBoxColor return_value = bg_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = goal_counter_anchor 
		id = mini_score_hud_box 
		texture = mini_score_hud 
		pos = ( <root_pos> - PAIR(25.00000000000, 6.00000000000) ) 
		just = [ left top ] 
		scale = PAIR(1.47000002861, 1.00000000000) 
		rgba = <bg_rgba> 
	} 
	IF GotParam hud_counter_caption 
		GetStackedScreenElementPos Y id = <id> offset = PAIR(48.00000000000, -12.00000000000) 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = goal_counter_anchor 
			id = goal_counter_caption 
			font = small 
			text = <hud_counter_caption> 
			rgba = [ 128 128 128 108 ] 
			pos = <pos> 
			just = [ center top ] 
			scale = 0.80000001192 
			line_spacing = 0.60000002384 
			dims = PAIR(117.50000000000, 0.00000000000) 
			allow_expansion 
		} 
	ENDIF 
	goal_update_counter <...> 
ENDSCRIPT

SCRIPT goal_update_counter 
	GoalManager_GetNumberCollected name = <goal_id> 
	IF NOT ScreenElementExists id = goal_counter_number_collected 
		RETURN 
	ENDIF 
	FormatText TextName = new_number_collected "%i" i = <number_collected> 
	SetScreenElementProps { 
		id = goal_counter_number_collected 
		text = <new_number_collected> 
	} 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GotParam hud_counter_caption 
		IF ScreenElementExists id = goal_counter_caption 
			SetScreenElementProps { 
				id = goal_counter_caption 
				text = <hud_counter_caption> 
			} 
		ENDIF 
	ENDIF 
	KillSpawnedScript name = mini_hud_anim 
	RunScriptOnScreenElement id = goal_counter_number_collected mini_hud_anim 
ENDSCRIPT

SCRIPT goal_destroy_counter 
	IF ObjectExists id = goal_counter_anchor 
		DestroyScreenElement id = goal_counter_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT mini_hud_anim 
	DoMorph time = 0.07999999821 scale = 0 alpha = 0 
	DoMorph time = 0.11999999732 scale = 1.29999995232 alpha = 1 
	DoMorph time = 0.14000000060 scale = 0.69999998808 
	DoMorph time = 0.15999999642 scale = 0.89999997616 
ENDSCRIPT

SCRIPT goal_got_flag_sound 
	PlaySound GoalMidGood vol = 200 
ENDSCRIPT

goal_panel_message_ids = [ 
	goal_complete 
	goal_complete_line2 
	goal_complete_sprite 
	trick_beat_menu_anchor 
	goal_description_anchor 
	points_message 
	current_goal 
	goal_message 
	GoalFail 
	goalfail_sprite 
	goalfailedline2 
	goal_tip 
	new_goal_message 
	new_goal_sprite 
	tetris_menu_anchor 
	current_horse_spot 
	goal_counter_anchor 
	goal_instruction1 
	skater_hint 
	death_message 
	perfect 
	perfect2 
	goal_current_reward 
	Eric_text 
	race_lap_message 
	race_checkpoint_message 
	race_time_message 
] 
SCRIPT hide_goal_panel_messages 
	GetArraySize goal_panel_message_ids 
	<index> = 0 
	BEGIN 
		IF NOT ( ( goal_panel_message_ids [ <index> ] ) = current_goal ) 
			hide_panel_message id = ( goal_panel_message_ids [ <index> ] ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT show_goal_panel_messages 
	GetArraySize goal_panel_message_ids 
	<index> = 0 
	BEGIN 
		show_panel_message id = ( goal_panel_message_ids [ <index> ] ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT destroy_goal_panel_messages 
	GetArraySize goal_panel_message_ids 
	IF GotParam all 
		<index> = 0 
	ELSE 
		<index> = 4 
		<array_size> = ( <array_size> - 4 ) 
	ENDIF 
	IF ( <index> < <array_size> ) 
		BEGIN 
			destroy_panel_message id = ( goal_panel_message_ids [ <index> ] ) 
			<index> = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
ENDSCRIPT

SCRIPT GoalManager_HidePoints 
	DoScreenElementMorph { 
		id = the_score_sprite 
		alpha = 0 
	} 
	DoScreenElementMorph { 
		id = the_score 
		alpha = 0 
	} 
	IF ScreenElementExists id = the_score_string_text 
		SetScreenElementProps id = the_score_string_text hide 
	ENDIF 
	IF ScreenElementExists id = player2_panel_container 
		DoScreenElementMorph id = player2_panel_container time = 0 scale = 0 
	ENDIF 
	update_goal_points_display hide 
	update_pager_icon hide 
ENDSCRIPT

SCRIPT GoalManager_ShowPoints 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
		IF CustomParkMode editing 
		ELSE 
			DoScreenElementMorph { 
				id = the_score_sprite 
				alpha = 1 
			} 
			DoScreenElementMorph { 
				id = the_score 
				alpha = 1 
			} 
			IF ScreenElementExists id = the_score_string_text 
				SetScreenElementProps id = the_score_string_text unhide 
			ENDIF 
			IF ScreenElementExists id = player2_panel_container 
				DoScreenElementMorph id = player2_panel_container time = 0 scale = 1 
			ENDIF 
			update_goal_points_display show 
			update_pager_icon show 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GoalManager_HideGoalPoints 
	DoScreenElementMorph { 
		id = goal_points_text 
		alpha = 0 
	} 
ENDSCRIPT

SCRIPT GoalManager_ShowGoalPoints 
	IF CustomParkMode editing 
		RETURN 
	ENDIF 
	IF InMultiplayerGame 
		RETURN 
	ENDIF 
	IF GameModeEquals is_singlesession 
		RETURN 
	ENDIF 
	IF GameModeEquals is_freeskate 
		RETURN 
	ENDIF 
	GoalManager_GetNumberOfGoalPoints total 
	FormatText TextName = goal_points "%i" i = <goal_points> 
	SetScreenElementProps { 
		id = goal_points_text 
		text = <goal_points> 
	} 
	DoScreenElementMorph { 
		id = goal_points_text 
		alpha = 1 
	} 
ENDSCRIPT

SCRIPT goal_show_tips 
	WaitForEvent type = panel_message_goal_done 
	GoalManager_GetGoalParams name = <goal_id> 
	<tip_pos> = PAIR(320.00000000000, 140.00000000000) 
	IF NOT GotParam goal_tips 
		RETURN 
	ENDIF 
	IF NOT GotParam goal_tip_interval 
		goal_tip_interval = 5 
	ENDIF 
	GoalManager_GetNumberOfTimesGoalStarted name = <goal_id> 
	GetArraySize <goal_tips> 
	IF ( <array_size> = 0 ) 
		RETURN 
	ENDIF 
	tips_index = ( <array_size> - 1 ) 
	current_multiple = ( <goal_tip_interval> * <array_size> ) 
	IF ( <times_started> = 0 ) 
		RETURN 
	ENDIF 
	IF NOT ( ( ( <times_started> / <goal_tip_interval> ) * <goal_tip_interval> ) = <times_started> ) 
		RETURN 
	ENDIF 
	times_started = ( <times_started> - ( <times_started> / <current_multiple> ) * <current_multiple> ) 
	BEGIN 
		IF ( ( ( <times_started> / <current_multiple> ) * <current_multiple> ) = <times_started> ) 
			create_panel_block id = goal_tip text = ( <goal_tips> [ <tips_index> ] ) pos = <tip_pos> style = panel_message_tips just = [ center top ] 
			BREAK 
		ELSE 
			tips_index = ( <tips_index> - 1 ) 
			current_multiple = ( <current_multiple> - <goal_tip_interval> ) 
		ENDIF 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT goal_no_valid_key_combos 
	create_panel_message text = "You don\'t know enough tricks!  Come back when you\'ve learned something." 
	GoalManager_DeactivateGoal name = <goal_id> 
ENDSCRIPT

SCRIPT AddGoal_Race 
	IF GotParam version 
		FormatText TextName = goal_type "RAce%v" v = <version> 
		FormatText ChecksumName = trigger_obj_id "TRG_G_RACE%v_Pro" v = <version> 
		FormatText ChecksumName = restart_node "TRG_G_RACE%v_RestartNode" v = <version> 
	ELSE 
		<goal_type> = "RAce" 
	ENDIF 
	GoalManager_CreateGoalName goal_type = <goal_type> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Race_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Race2 
	GoalManager_CreateGoalName goal_type = "RAce2" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Race2_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Race3 
	GoalManager_CreateGoalName goal_type = "RAce3" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Race3_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Race4 
	GoalManager_CreateGoalName goal_type = "RAce4" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Race4_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Race5 
	GoalManager_CreateGoalName goal_type = "RAce5" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Race5_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Race6 
	GoalManager_CreateGoalName goal_type = "RAce6" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Race6_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Combo 
	IF GotParam version 
		FormatText TextName = goal_type "Combo%v" v = <version> 
		IF NOT GotParam letter_info 
			FormatText ChecksumName = c_obj_id "TRG_Goal_COMBO_C%v" v = <version> 
			FormatText ChecksumName = o_obj_id "TRG_Goal_COMBO_O%v" v = <version> 
			FormatText ChecksumName = m_obj_id "TRG_Goal_COMBO_M%v" v = <version> 
			FormatText ChecksumName = b_obj_id "TRG_Goal_COMBO_B%v" v = <version> 
			FormatText ChecksumName = o2_obj_id "TRG_Goal_COMBO_O2%v" v = <version> 
			letter_info = [ 
				{ obj_id = <c_obj_id> text = "C" } 
				{ obj_id = <o_obj_id> text = "O" } 
				{ obj_id = <m_obj_id> text = "M" } 
				{ obj_id = <b_obj_id> text = "B" } 
				{ obj_id = <o2_obj_id> text = "O" } 
			] 
		ENDIF 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_COMBO%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_COMBO%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "Combo" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_amateurCOMBOline_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_ProCombo 
	GoalManager_CreateGoalName goal_type = "ProCombo" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_ProComboLine_GenericParams <...> } 
	} 
ENDSCRIPT

SCRIPT AddGoal_MedCombo 
	GoalManager_CreateGoalName goal_type = "MedCombo" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_MedComboLine_GenericParams <...> } 
	} 
ENDSCRIPT

SCRIPT AddGoal_Kill 
	IF GotParam version 
		FormatText TextName = goal_type "KIll%v" v = <version> 
		FormatText ChecksumName = trigger_obj_id "TRG_G_KILL%v_Pro" v = <version> 
		FormatText ChecksumName = restart_node "TRG_G_KILL%v_RestartNode" v = <version> 
	ELSE 
		<goal_type> = "KIll" 
	ENDIF 
	GoalManager_CreateGoalName goal_type = <goal_type> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Kill_GenericParams <...> } 
	} 
ENDSCRIPT

SCRIPT AddGoal_Skate 
	IF GotParam version 
		FormatText TextName = goal_type "Skate%v" v = <version> 
		FormatText ChecksumName = trigger_obj_id "TRG_G_SKATE%v_Pro" v = <version> 
		FormatText ChecksumName = s_obj_id "TRG_Goal_Letter_S%v" v = <version> 
		FormatText ChecksumName = k_obj_id "TRG_Goal_Letter_K%v" v = <version> 
		FormatText ChecksumName = a_obj_id "TRG_Goal_Letter_A%v" v = <version> 
		FormatText ChecksumName = t_obj_id "TRG_Goal_Letter_T%v" v = <version> 
		FormatText ChecksumName = e_obj_id "TRG_Goal_Letter_E%v" v = <version> 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_SKATE%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "Skate" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_SkateLetters_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_HighScore 
	GoalManager_CreateGoalName <...> goal_type = "HighScore" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_HighScore_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_ProScore 
	GoalManager_CreateGoalName <...> goal_type = "ProScore" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_ProScore_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_SickScore 
	GoalManager_CreateGoalName <...> goal_type = "SickScore" 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_SickScore_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Collect 
	IF GotParam version 
		FormatText TextName = goal_type "Collect%v" v = <version> 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_Collect%v_RestartNode" v = <version> 
		ENDIF 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_Collect%v_Pro" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "Collect" 
	ENDIF 
	IF GotParam career_only 
		IF InNetGame 
			RETURN 
		ENDIF 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Collect_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Gaps 
	IF GotParam version 
		FormatText TextName = goal_type "GAps%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_GAP%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_GAP%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "GAps" 
	ENDIF 
	IF GotParam goal_id 
		<_goal_id> = <goal_id> 
	ELSE 
		GoalManager_CreateGoalName <...> 
		<_goal_id> = <goal_id> 
		RemoveParameter goal_id 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	RemoveParameter goal_id 
	GoalManager_AddGoal name = <_goal_id> { 
		params = { Goal_Gaps_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_HighCombo 
	IF GotParam version 
		FormatText TextName = goal_type "HIghCombo%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_HIGHCOMBO%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_HIGHCOMBO%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "HIghCombo" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_HighCombo_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Special 
	IF GotParam version 
		FormatText TextName = goal_type "SPecial%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_SPECIAL%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_SPECIAL%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "SPecial" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Special_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Counter 
	IF GotParam version 
		FormatText TextName = goal_type "COunter%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_COUNTER%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_COUNTER%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "COunter" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Counter_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_TrickTheObjects 
	IF GotParam version 
		FormatText TextName = goal_type "TRICKOBJECTS%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_TRICKOBJECTS%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_TRICKOBJECTS%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "TRICKOBJECTS" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { goal_TrickObjects_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_SkateTheLine 
	IF GotParam version 
		FormatText TextName = goal_type "SkateTheLine%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_SKATETHELINE%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_SKATETHELINE%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "SkateTheLine" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_SkateTheLine_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_TimedScoreRun 
	IF GotParam version 
		FormatText TextName = goal_type "TimedScoreRun%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_TIMEDSCORERUN%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_TIMEDSCORERUN%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "TimedScoreRun" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_TimedScoreRun_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_TrickBeat 
	IF GotParam version 
		FormatText TextName = goal_type "TrickBeat%v" v = <version> 
		IF NOT GotParam trigger_obj_id 
			FormatText ChecksumName = trigger_obj_id "TRG_G_TRICKBEAT%v_Pro" v = <version> 
		ENDIF 
		IF NOT GotParam restart_node 
			FormatText ChecksumName = restart_node "TRG_G_TRICKBEAT%v_RestartNode" v = <version> 
		ENDIF 
	ELSE 
		<goal_type> = "TrickBeat" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_TrickBeat_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_SecretTape 
	IF GotParam version 
		FormatText TextName = goal_type "SecretTape%v" v = <version> 
	ELSE 
		<goal_type> = "SecretTape" 
	ENDIF 
	GoalManager_CreateGoalName <...> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_SecretTape_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT AddGoal_Competition 
	IF GotParam version 
		FormatText TextName = goal_type "Comp%v" v = <version> 
		FormatText ChecksumName = trigger_obj_id "TRG_G_JUDGE_COMP%v" v = <version> 
		FormatText TextName = geo_prefix "G_COMP%v" v = <version> 
		FormatText ChecksumName = restart_node "TRG_G_COMP%v_RestartNode" v = <version> 
	ELSE 
		<goal_type> = "Comp" 
	ENDIF 
	IF GotParam career_only 
		IF InNetGame 
			RETURN 
		ENDIF 
	ENDIF 
	GoalManager_CreateGoalName goal_type = <goal_type> 
	GoalManager_AddGoal name = <goal_id> { 
		params = { Goal_Comp_GenericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT panel_message_goalfail 
	SetProps just = [ center center ] rgba = [ 115 26 26 128 ] 
	panel_message_goalgeneric <...> 
ENDSCRIPT

SCRIPT panel_sprite_goalfail time = 1500 
	SetProps just = [ center center ] rgba = [ 115 26 26 128 ] 
	RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> } 
	DoMorph time = 0 scale = 0 pos = PAIR(320.00000000000, 104.00000000000) 
	DoMorph time = 0.10000000149 scale = 2.40000009537 
	DoMorph time = 0.18000000715 scale = 0.60000002384 
	DoMorph time = 0.15999999642 scale = 1.20000004768 
	DoMorph time = 0.14000000060 scale = 0.80000001192 
	DoMorph time = 0.11999999732 scale = 1 
ENDSCRIPT

SCRIPT panel_message_goalfailline2 time = 1500 
	SetProps just = [ center center ] rgba = [ 115 26 26 128 ] 
	RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> } 
	DoMorph time = 0 pos = PAIR(320.00000000000, 284.00000000000) scale = 0 alpha = 0 relative_scale 
	DoMorph time = 0.30000001192 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.70000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.89999997616 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.00000000000 relative_scale 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph time = 0.10000000149 scale = 1.39999997616 relative_scale 
	DoMorph time = 0.15000000596 scale = 0 alpha = 0 relative_scale 
	Die 
ENDSCRIPT

SCRIPT panel_message_goalgeneric { 
		time = 1500 
	} 
	GetTags 
	RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> } 
	DoMorph time = 0 pos = PAIR(320.00000000000, 252.00000000000) scale = 0 alpha = 0 relative_scale 
	DoMorph time = 0.50000000000 scale = 1.79999995232 alpha = 1 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.89999997616 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.29999995232 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.00000000000 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.10000002384 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(318.00000000000, 250.00000000000) 
	DoMorph time = 0.10000000149 pos = PAIR(322.00000000000, 250.00000000000) 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 254.00000000000) 
	DoMorph time = 0.10000000149 pos = PAIR(318.00000000000, 250.00000000000) 
	DoMorph time = 0.10000000149 pos = PAIR(322.00000000000, 250.00000000000) 
	DoMorph time = 0.10000000149 pos = PAIR(318.00000000000, 250.00000000000) 
	DoMorph time = 0.10000000149 pos = PAIR(322.00000000000, 250.00000000000) 
	DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 252.00000000000) scale = 0 alpha = 0 relative_scale 
ENDSCRIPT

SCRIPT panel_message_goalcomplete 
	SetProps just = [ center center ] rgba = [ 127 102 0 128 ] 
	panel_message_goalgeneric <...> 
ENDSCRIPT

SCRIPT panel_sprite_goalcomplete time = 1500 
	SetProps just = [ center center ] rgba = [ 127 102 0 128 ] 
	DoMorph pos = PAIR(0.00000000000, 330.00000000000) scale = 0 alpha = 0 time = 0 
	DoMorph pos = PAIR(264.00000000000, 330.00000000000) scale = 1 alpha = 1 time = 0.10000000149 
	wait 1 frame 
	DoMorph pos = PAIR(258.00000000000, 330.00000000000) time = 0.10000000149 
	wait 1 frame 
	DoMorph pos = PAIR(260.00000000000, 330.00000000000) time = 0.10000000149 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph pos = PAIR(0.00000000000, 330.00000000000) scale = 0.50000000000 alpha = 0 time = 0.20000000298 
	FireEvent type = panel_sprite_goalcomplete_done 
ENDSCRIPT

SCRIPT panel_message_goalcompleteline2 time = 1500 
	SetProps just = [ center center ] rgba = [ 128 128 128 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 284.00000000000) scale = 0 alpha = 0 relative_scale 
	DoMorph time = 0.30000001192 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.70000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.89999997616 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.00000000000 relative_scale 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 285.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 283.00000000000) time = 0.10000000149 
	DoMorph time = 0.10000000149 scale = 1.39999997616 relative_scale 
	DoMorph time = 0.15000000596 scale = 0 alpha = 0 relative_scale 
	Die 
	FireEvent type = panel_message_goalcompleteline2_done 
ENDSCRIPT

SCRIPT debug_message_text_style { 
		pos = PAIR(320.00000000000, 115.00000000000) 
	} 
	SetProps rgba = [ 128 128 128 128 ] pos = <pos> 
	wait 1000 
	Die 
ENDSCRIPT

panel_message_goal_final_scale = 0.20000000298 
SCRIPT panel_message_goal { 
		blink_time = 0.10000000149 
	} 
	IF NOT GotParam dont_animate 
		DoMorph pos = PAIR(320.00000000000, 120.00000000000) scale = 0 alpha = 0 
		DoMorph pos = PAIR(320.00000000000, 120.00000000000) scale = 0.20000000298 time = 0.30000001192 alpha = 0.34999999404 
		wait 0.20000000298 second 
	ENDIF 
	DoMorph pos = <final_pos> scale = <final_scale> time = 0.09000000358 alpha = 0.89999997616 
	FireEvent type = panel_message_goal_done 
	FireEvent type = panel_message_goal_done2 
ENDSCRIPT

SCRIPT panel_message_goal_new { 
		blink_time = 0.10000000149 
		final_pos = PAIR(620.00000000000, 27.00000000000) 
		final_scale = ( panel_message_goal_final_scale ) 
	} 
	IF NOT GotParam dont_animate 
		DoMorph pos = PAIR(320.00000000000, 120.00000000000) scale = 0 alpha = 0 
		DoMorph pos = PAIR(320.00000000000, 120.00000000000) scale = 0.27500000596 time = 0.30000001192 alpha = 0.34999999404 
		wait 0.20000000298 second 
	ENDIF 
	DoMorph pos = <final_pos> scale = <final_scale> time = 0.09000000358 alpha = 1 
	FireEvent type = panel_message_goal_done 
	FireEvent type = panel_message_goal_done2 
ENDSCRIPT

SCRIPT panel_message_found_secret time = 1500 
	SetProps just = [ center center ] rgba = [ 115 116 13 128 ] 
	DoMorph pos = PAIR(320.00000000000, 157.00000000000) scale = 6 alpha = 0 time = 0 
	DoMorph pos = PAIR(320.00000000000, 157.00000000000) scale = 0.75000000000 alpha = 1 time = 0.10000000149 
	wait 1 frame 
	DoMorph pos = PAIR(320.00000000000, 157.00000000000) scale = 1.60000002384 alpha = 1 time = 0.10000000149 
	wait 1 frame 
	DoMorph pos = PAIR(320.00000000000, 157.00000000000) scale = 1.29999995232 alpha = 1 time = 0.10000000149 
	wait 1 frame 
	SetProps blur_effect 
	do_blur_effect 
	SetProps no_blur_effect 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 alpha = 0.40000000596 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph alpha = 0 time = 0.05000000075 scale = PAIR(10.00000000000, 0.00000000000) rgba = [ 0 0 0 128 ] 
	Die 
	FireEvent type = panel_message_found_secret_done 
ENDSCRIPT

SCRIPT panel_message_generic_loss 
	SetProps just = [ center center ] rgba = [ 128 128 128 100 ] 
	RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = 1500 } 
	DoMorph pos = PAIR(320.00000000000, 185.00000000000) time = 0 scale = 0 relative_scale 
	DoMorph time = 0.30000001192 scale = 1.29999995232 relative_scale 
	DoMorph time = 0.20000000298 scale = 1.00000000000 relative_scale 
	DoMorph pos = PAIR(319.00000000000, 184.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 186.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 184.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(322.00000000000, 186.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 184.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 186.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 182.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 186.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 184.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 186.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(318.00000000000, 184.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 187.00000000000) time = 0.10000000149 
ENDSCRIPT

SCRIPT panel_message_tips blink_time = 0.05000000075 
	SetProps just = [ center top ] internal_just = [ center center ] rgba = [ 127 102 0 100 ] 
	DoMorph scale = 0 
	DoMorph scale = 1.20000004768 time = 0.10000000149 
	DoMorph scale = 0.80000001192 time = 0.10000000149 
	DoMorph scale = 1 time = 0.10000000149 
	DoMorph scale = 0.89999997616 time = 0.10000000149 
	DoMorph pos = { PAIR(1.00000000000, 2.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(-2.00000000000, -3.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(2.00000000000, 2.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(-3.00000000000, -2.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(3.00000000000, 2.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(-2.00000000000, -2.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(2.00000000000, 4.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(-2.00000000000, -4.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(1.00000000000, 7.00000000000) relative } scale = 1.25000000000 time = 0.10000000149 
	SetProps internal_just = [ center top ] rgba = [ 127 102 0 90 ] just = [ right top ] 
	DoMorph pos = { PAIR(155.00000000000, -40.00000000000) relative } scale = 0.77999997139 time = 0.05000000075 
	BEGIN 
		DoMorph alpha = 0 
		wait <blink_time> seconds 
		DoMorph alpha = 1 
		wait <blink_time> seconds 
	REPEAT 6 
ENDSCRIPT

SCRIPT clock_morph 
	KillSpawnedScript name = clock_morph 
	SetProps rgba = [ 128 128 128 128 ] 
	DoMorph relative_scale scale = 0 alpha = 0 time = 0.10000000149 
	DoMorph relative_scale scale = ( the_time_scale ) alpha = ( the_time_alpha ) time = 0.30000001192 
ENDSCRIPT

SCRIPT goal_message_got_trickslot 
	SetProps rgba = [ 43 95 53 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 214.00000000000) scale = 0 alpha = 0 relative_scale 
	wait 30 frame 
	DoMorph time = 0.50000000000 alpha = 1 
	IF GotParam sound 
		PlaySound <sound> vol = 150 
	ENDIF 
	DoMorph time = 0.10000000149 scale = 1.70000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.80000001192 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 0.89999997616 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.00000000000 relative_scale 
	DoMorph pos = PAIR(321.00000000000, 215.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 213.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(321.00000000000, 215.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 213.00000000000) time = 0.10000000149 
	DoMorph time = 0.10000000149 scale = 1.39999997616 relative_scale 
	DoMorph time = 0.15000000596 scale = 0 alpha = 0 relative_scale 
	Die 
	FireEvent type = goal_got_reward_done 
ENDSCRIPT

SCRIPT goal_message_stat_up 
	SetProps rgba = [ 33 112 15 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 195.00000000000) scale = 0 alpha = 0 
	DoMorph time = 0.20000000298 alpha = 1 
	IF GotParam sound 
		PlaySound <sound> vol = 150 
	ENDIF 
	DoMorph time = 0.10000000149 scale = 2.50000000000 
	DoMorph time = 0.10000000149 scale = 1.50000000000 
	DoMorph time = 0.10000000149 scale = 2.00000000000 
	DoMorph time = 0.10000000149 scale = 1.39999997616 
	DoMorph pos = PAIR(321.00000000000, 196.00000000000) time = 0.10000000149 
	DoMorph pos = PAIR(319.00000000000, 194.00000000000) time = 0.10000000149 
	DoMorph time = 0.10000000149 scale = 1.39999997616 
	DoMorph time = 0.15000000596 scale = 0 alpha = 0 
	Die 
ENDSCRIPT

SCRIPT new_ammo_message_up 
	DoMorph time = 0 scale = 0 alpha = 0 relative_scale 
	DoMorph time = 0.20000000298 alpha = 1 
	IF GotParam sound 
		PlaySound <sound> vol = 150 
	ENDIF 
	DoMorph time = 0.10000000149 scale = 2.50000000000 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.50000000000 relative_scale 
	DoMorph time = 0.10000000149 scale = 2.00000000000 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.20000004768 relative_scale 
	DoMorph time = 1.20000004768 scale = 1.20000004768 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.79999995232 relative_scale 
	DoMorph time = 0.15000000596 scale = 0 alpha = 0 relative_scale 
	Die 
ENDSCRIPT

SCRIPT goal_message_got_gap 
	SetProps rgba = [ 20 98 114 108 ] 
	DoMorph time = 0.10000000149 alpha = 1 
	DoMorph time = 0.10000000149 scale = 1.89999997616 
	DoMorph time = 0.10000000149 scale = 0.89999997616 
	DoMorph time = 0.10000000149 scale = 1.20000004768 
	DoMorph time = 0.10000000149 scale = 0.94999998808 
	DoMorph time = 0.10000000149 scale = 1.00000000000 
	DoMorph alpha = 0.40000000596 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.60000002384 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.30000001192 time = 0.07000000030 
	DoMorph alpha = 0.60000002384 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.30000001192 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.30000001192 time = 0.07000000030 
	DoMorph alpha = 0.60000002384 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.30000001192 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.30000001192 time = 0.07000000030 
	DoMorph alpha = 0.60000002384 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.30000001192 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 
	DoMorph alpha = 0.60000002384 time = 0.07000000030 
	DoMorph alpha = 1 time = 0.07000000030 scale = 1.00000000000 
	DoMorph time = 0.10000000149 scale = 1.70000004768 
	DoMorph time = 0.10000000149 scale = 0 alpha = 0 
	Die 
ENDSCRIPT

SCRIPT spawned_safe_goal_win 
	GoalManager_WinGoal name = <goal_id> 
ENDSCRIPT


