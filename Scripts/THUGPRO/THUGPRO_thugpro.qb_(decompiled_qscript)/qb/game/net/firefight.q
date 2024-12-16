
firefight_projectile_type = fireball 
SCRIPT firefight_set_projectile_type 
	IF GotParam value 
		Change firefight_projectile_type = <value> 
	ENDIF 
ENDSCRIPT

goal_firefight_genericParams = { 
	goal_text = "You must eliminate all other players!" 
	unlimited_time = 1 
	net 
	init = goal_firefight_init 
	activate = goal_firefight_activate 
	active = goal_firefight_active 
	deactivate = goal_firefight_deactivate 
	expire = goal_firefight_expire 
	goal_description = "FireFight!" 
} 
SCRIPT goal_firefight_init 
	IF IsHost 
		Server_RunScript { _scr = firefight_set_projectile_type _params = { value = ( firefight_projectile_type ) } } 
	ENDIF 
ENDSCRIPT

SCRIPT goal_firefight_activate 
	IF InTeamGame 
		FormatText TextName = msg_text "The last team standing wins.\\n\\b1\\b7 or \\b1\\b4\\nto shoot" 
	ELSE 
		FormatText TextName = msg_text "The last player standing wins.\\n\\b1\\b7 or \\b1\\b4\\nto shoot" 
	ENDIF 
	thugpro_create_mode_text { 
		mode_name = "Fire Fight!" 
		mode_desc = <msg_text> 
	} 
	IF NOT IsObserving 
		skater : pickeduppowerup fireball 
		bind_fireball_tricks 
	ENDIF 
	ResetScore 
ENDSCRIPT

SCRIPT goal_firefight_active 
	IF OnlyOneSkaterLeft 
		IF OnServer 
			IF CalculateFinalScores 
				GoalManager_DeactivateGoal name = <goal_id> 
				goal_firefight_finished 
			ENDIF 
		ELSE 
			GoalManager_DeactivateGoal name = <goal_id> 
			goal_firefight_finished 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_firefight_finished 
	ClearPowerups 
	IF NOT IsObserving 
		unbind_fireball_tricks 
	ENDIF 
	IF InSplitScreenGame 
		unbind_fireball_tricks_player_2 
	ENDIF 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	printf "goal_firefight_deactivate" 
	IF OnServer 
		IF InInternetMode 
			ReportStats final 
		ENDIF 
	ENDIF 
	create_rankings score_title_text = "HEALTH" 
ENDSCRIPT

SCRIPT goal_firefight_deactivate 
	ClearPowerups 
	IF NOT IsObserving 
		unbind_fireball_tricks 
	ENDIF 
	IF InSplitScreenGame 
		unbind_fireball_tricks_player_2 
	ENDIF 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
ENDSCRIPT

SCRIPT firefight_done 
	dialog_box_exit 
	do_backend_retry 
ENDSCRIPT

SCRIPT goal_firefight_expire 
	IF ObjectExists id = mp_goal_text 
		DestroyScreenElement id = mp_goal_text 
	ENDIF 
	printf "goal_firefight_expire" 
	IF OnServer 
		SpawnScript wait_then_create_rankings params = { score_title_text = "Health" } 
	ELSE 
		create_rankings score_title_text = "Health" 
	ENDIF 
ENDSCRIPT

SCRIPT AddGoal_firefight 
	GoalManager_AddGoal name = firefight { 
		params = { goal_firefight_genericParams 
			<...> 
		} 
	} 
ENDSCRIPT

SCRIPT StartGoal_firefight 
	IF InSplitScreenGame 
		SetScreenModeFromGameMode 
	ENDIF 
	GoalManager_EditGoal name = firefight params = <...> 
	GoalManager_ActivateGoal name = firefight 
ENDSCRIPT

SCRIPT announce_elimination 
	printf "announcing elimination!!!!" 
	FormatText TextName = msg_text "%s has been eliminated!" s = <name> 
	create_net_panel_message msg_time = 2000 text = <msg_text> 
ENDSCRIPT

SCRIPT bind_fireball_tricks 
	GoalManager_GetTrickFromKeyCombo key_combo = Air_SquareU 
	IF GotParam cat_num 
		skater : SetTags old_fireballf_checksum = <cat_num> 
	ELSE 
		skater : SetTags old_fireballf_checksum = <trick_checksum> 
	ENDIF 
	BindTrickToKeyCombo { 
		key_combo = Air_SquareU 
		trick = FireballF 
		update_mappings = 1 
	} 
	UpdateTrickMappings skater = 0 
	RemoveParameter cat_num 
	GoalManager_GetTrickFromKeyCombo key_combo = Air_SquareD 
	IF GotParam cat_num 
		skater : SetTags old_fireballb_checksum = <cat_num> 
	ELSE 
		skater : SetTags old_fireballb_checksum = <trick_checksum> 
	ENDIF 
	BindTrickToKeyCombo { 
		key_combo = Air_SquareD 
		trick = FireballB 
		update_mappings = 1 
	} 
	UpdateTrickMappings skater = 0 
ENDSCRIPT

SCRIPT bind_fireball_tricks_player_2 
	SetCurrentSkaterProfile 1 
	GoalManager_GetTrickFromKeyCombo key_combo = Air_SquareU 
	IF GotParam cat_num 
		skater2 : SetTags old_fireballf_checksum = <cat_num> 
	ELSE 
		skater2 : SetTags old_fireballf_checksum = <trick_checksum> 
	ENDIF 
	BindTrickToKeyCombo { 
		key_combo = Air_SquareU 
		trick = FireballF 
		update_mappings = 1 
	} 
	UpdateTrickMappings skater = 1 
	RemoveParameter cat_num 
	GoalManager_GetTrickFromKeyCombo key_combo = Air_SquareD 
	IF GotParam cat_num 
		skater2 : SetTags old_fireballb_checksum = <cat_num> 
	ELSE 
		skater2 : SetTags old_fireballb_checksum = <trick_checksum> 
	ENDIF 
	BindTrickToKeyCombo { 
		key_combo = Air_SquareD 
		trick = FireballB 
		update_mappings = 1 
	} 
	UpdateTrickMappings skater = 1 
	SetCurrentSkaterProfile 0 
ENDSCRIPT

SCRIPT unbind_fireball_tricks 
	skater : GetTags 
	IF GotParam old_fireballf_checksum 
		BindTrickToKeyCombo { 
			key_combo = Air_SquareU 
			trick = <old_fireballf_checksum> 
			update_mappings = 1 
		} 
	ENDIF 
	UpdateTrickMappings skater = 0 
	IF GotParam old_fireballb_checksum 
		BindTrickToKeyCombo { 
			key_combo = Air_SquareD 
			trick = <old_fireballb_checksum> 
			update_mappings = 1 
		} 
	ENDIF 
	UpdateTrickMappings skater = 0 
ENDSCRIPT

SCRIPT unbind_fireball_tricks_player_2 
	SetCurrentSkaterProfile 1 
	skater2 : GetTags 
	IF GotParam old_fireballf_checksum 
		BindTrickToKeyCombo { 
			key_combo = Air_SquareU 
			trick = <old_fireballf_checksum> 
			update_mappings = 2 
		} 
	ENDIF 
	UpdateTrickMappings skater = 1 
	IF GotParam old_fireballb_checksum 
		BindTrickToKeyCombo { 
			key_combo = Air_SquareD 
			trick = <old_fireballb_checksum> 
			update_mappings = 2 
		} 
	ENDIF 
	UpdateTrickMappings skater = 1 
	SetCurrentSkaterProfile 0 
ENDSCRIPT


