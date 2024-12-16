
goal_goalattack_genericParams = { 
	goal_text = "You must complete all of the goals to win!" 
	unlimited_time = 1 
	no_restart 
	net 
	init = goal_goalattack_init 
	activate = goal_goalattack_activate 
	deactivate = goal_goalattack_deactivate 
	expire = goal_goalattack_expire 
	goal_description = "Goal Attack!" 
} 
SCRIPT goal_goalattack_init 
ENDSCRIPT

SCRIPT goal_goalattack_activate 
	IF InNetGame 
		FormatText TextName = msg_text "%s tags to win" s = <score> 
		thugpro_create_mode_text { 
			mode_name = "Goal Attack" 
			mode_desc = "Complete all goals to win" 
		} 
		GetGoalsMode 
		IF ( <goals> = goals_classic ) 
			IF IsTrue LEVEL_CLASSIC_GOAL_MODE 
				SetScoreAccumulation 1 
			ELSE 
				SetScoreAccumulation 0 
			ENDIF 
		ELSE 
			SetScoreAccumulation 0 
		ENDIF 
	ENDIF 
	ResetScore 
	GoalManager_ClearLastGoal 
	GoalManager_SetCanStartGoal 1 
ENDSCRIPT

SCRIPT goal_goalattack_deactivate 
	GoalManager_ClearLastGoal 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	IF ScreenElementExists id = goal_retry_anchor 
		DestroyScreenElement id = goal_retry_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT goalattack_done 
	dialog_box_exit 
	do_backend_retry 
ENDSCRIPT

SCRIPT goal_goalattack_expire 
	IF ObjectExists id = goal_message 
		DestroyScreenElement id = goal_message 
	ENDIF 
	printf "goal_goalattack_expire" 
	GoalManager_LoseGoal name = <goal_id> 
	IF OnServer 
		CalculateFinalScores 
		SendGameOverToObservers 
		SpawnScript wait_then_create_rankings params = { score_title_text = "GOALS" } 
	ELSE 
		create_rankings score_title_text = "GOALS" 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_GoalAttack 
	GoalManager_AddGoal name = goalattack { 
		params = { goal_goalattack_genericParams <...> } 
	} 
ENDSCRIPT

SCRIPT StartGoal_GoalAttack 
	GoalManager_EditGoal name = goalattack params = <...> 
	GoalManager_ActivateGoal name = goalattack 
ENDSCRIPT

SCRIPT back_to_game_options 
	dialog_box_exit 
	create_network_game_options_menu 
ENDSCRIPT

SCRIPT create_choose_goals_menu 
	thugpro_menu_create { 
		menu_name = goals 
		menu_title = "Choose goals" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = exit_choose_goals_menu 
		boxed 
	} 
	current_menu : SetTags num_goals = 0 
	current_menu : SetTags ForceOff = 0 
	make_thugpro_menu_item { 
		id = goals_menu_select_all_no_goals 
		text = "Select all/no goals" 
		pad_choose_script = force_select_goals_on_off 
	} 
	GetPreferenceChecksum pref_type = network goals 
	IF ( <checksum> = goals_classic ) 
		GoalManager_AddGoalChoices classic_only 
	ELSE 
		GoalManager_AddGoalChoices created_only 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT exit_choose_goals_menu 
	IF ObjectExists id = goals_anchor 
		DestroyScreenElement id = goals_anchor 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = box_icon 
		DestroyScreenElement id = box_icon 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = box_icon_2 
		DestroyScreenElement id = box_icon_2 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = grunge_anchor 
		DestroyScreenElement id = grunge_anchor 
		wait 1 gameframe 
	ENDIF 
	create_network_game_options_menu 
ENDSCRIPT

SCRIPT hide_net_player_names 
	IF GotParam on 
		scale = 0.21999999881 
	ELSE 
		scale = 0 
	ENDIF 
	index = 0 
	BEGIN 
		IF ScreenElementExists id = { net_score_menu child = <index> } 
			DoScreenElementMorph id = { net_score_menu child = <index> } scale = <scale> time = 0 
		ENDIF 
	REPEAT 8 
ENDSCRIPT

SCRIPT choose_goals_menu_set_events 
	current_menu : GetSingleTag num_goals 
	current_menu : SetTags num_goals = ( <num_goals> + 1 ) 
	IF GoalManager_GoalIsSelected name = <goal_id> 
		<checked> = checked 
	ELSE 
		<checked> = unchecked 
	ENDIF 
	AppendSuffixToChecksum base = <goal_id> SuffixString = "_goals_menu_item" 
	make_thugpro_menu_checkbox_item { 
		id = <appended_id> 
		text = <text> 
		<checked> 
		pad_choose_script = choose_goals_menu_choose 
		pad_choose_params = { name = <goal_id> } 
	} 
ENDSCRIPT

SCRIPT view_selected_goals_menu_set_events 
	GoalManager_ReplaceTrickText name = <goal_id> 
	wait 200 
	IF GoalManager_HasWonGoal name = <goal_id> 
		<checked> = checked 
	ELSE 
		<checked> = unchecked 
	ENDIF 
	AppendSuffixToChecksum base = <goal_id> SuffixString = "_view_goals_menu_item" 
	make_thugpro_menu_checkbox_item { 
		id = <appended_id> 
		text = <text> 
		<checked> 
	} 
ENDSCRIPT

SCRIPT choose_goals_menu_choose 
	GetTags 
	IF OnServer 
		IF NOT GotParam Force 
			GoalManager_ToggleGoalSelection <...> 
		ELSE 
			IF GoalManager_GoalIsSelected name = <name> 
				IF ( <ForceOff> = 1 ) 
					GoalManager_ToggleGoalSelection <...> 
				ENDIF 
			ELSE 
				IF NOT ( <ForceOff> = 1 ) 
					GoalManager_ToggleGoalSelection <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT GotParam Force 
			GoalManager_ToggleGoalSelection <...> 
		ELSE 
			IF GoalManager_GoalIsSelected name = <name> 
				IF ( <ForceOff> = 1 ) 
					GoalManager_ToggleGoalSelection <...> 
					FCFSRequestToggleGoalSelection <...> 
				ENDIF 
			ELSE 
				IF NOT ( <ForceOff> = 1 ) 
					GoalManager_ToggleGoalSelection <...> 
					FCFSRequestToggleGoalSelection <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	wait 0.20000000298 seconds 
	IF GoalManager_GoalIsSelected name = <name> 
		thugpro_menu_item_update_checkbox id = <id> on 
	ELSE 
		thugpro_menu_item_update_checkbox id = <id> off 
	ENDIF 
ENDSCRIPT

SCRIPT wait_and_create_view_selected_goals_menu 
	wait 120 frames 
	create_view_selected_goals_menu <...> 
ENDSCRIPT

SCRIPT create_view_selected_goals_menu 
	IF GotParam goal_summary 
		<menu_title> = "Goal list" 
		<menu_callback> = close_goals_menu 
	ELSE 
		<menu_title> = "View goals" 
		<menu_callback> = exit_view_goals_menu 
	ENDIF 
	thugpro_menu_create { 
		menu_name = goals 
		menu_title = <menu_title> 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text_back_only 
		pad_back_script = <menu_callback> 
		boxed 
	} 
	GoalManager_AddGoalChoices selected_only 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT exit_view_goals_menu 
	IF ObjectExists id = goals_anchor 
		DestroyScreenElement id = goals_anchor 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = box_icon 
		DestroyScreenElement id = box_icon 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = box_icon_2 
		DestroyScreenElement id = box_icon_2 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = grunge_anchor 
		DestroyScreenElement id = grunge_anchor 
		wait 1 gameframe 
	ENDIF 
	create_pause_menu 
ENDSCRIPT

SCRIPT close_goals_menu 
	IF ObjectExists id = goals_anchor 
		DestroyScreenElement id = goals_anchor 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = box_icon 
		DestroyScreenElement id = box_icon 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = box_icon_2 
		DestroyScreenElement id = box_icon_2 
		wait 1 gameframe 
	ENDIF 
	IF ObjectExists id = grunge_anchor 
		DestroyScreenElement id = grunge_anchor 
		wait 1 gameframe 
	ENDIF 
	GoalManager_ShowPoints 
	unpause_balance_meter 
	unpause_run_timer 
	restore_start_key_binding 
	IF ObjectExists id = view_goals_menu 
		exit_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT goal_attack_completed_goal 
	FormatText TextName = msg_text "Goal Completed! %i to go!" i = <NumGoalsLeft> 
	create_net_panel_message text = <msg_text> style = net_team_panel_message 
ENDSCRIPT

SCRIPT goal_attack_completed_goal_other_same_team 
	FormatText TextName = msg_text "%n Completed %t! %i to go!" n = <PlayerName> t = <GoalText> i = <NumGoalsLeft> 
	create_net_panel_message text = <msg_text> style = net_team_panel_message 
ENDSCRIPT

SCRIPT goal_attack_started_goal_other_same_team 
	FormatText TextName = msg_text "%n Started %t!" n = <PlayerName> t = <GoalText> 
	create_net_panel_message text = <msg_text> style = net_team_panel_message 
ENDSCRIPT

SCRIPT force_select_goals_on_off 
	current_menu : GetSingleTag ForceOff 
	IF ( <ForceOff> = 1 ) 
		current_menu : SetTags ForceOff = 0 
	ELSE 
		current_menu : SetTags ForceOff = 1 
	ENDIF 
	current_menu : GetSingleTag num_goals 
	IF ( <num_goals> > 0 ) 
		counter = 1 
		BEGIN 
			FireEvent type = pad_choose target = { current_menu child = <counter> } data = { Force ForceOff = <ForceOff> } 
			counter = ( <counter> + 1 ) 
		REPEAT <num_goals> 
	ENDIF 
ENDSCRIPT


