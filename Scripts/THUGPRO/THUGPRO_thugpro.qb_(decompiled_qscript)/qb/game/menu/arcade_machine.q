
default_arcade_scores = [ 
	{ value = 50000 initials = "AXX" } 
	{ value = 40000 initials = "BXX" } 
	{ value = 30000 initials = "CXX" } 
	{ value = 20000 initials = "DXX" } 
	{ value = 10000 initials = "EXX" } 
	{ value = 5000 initials = "FXX" } 
	{ value = 4000 initials = "GXX" } 
	{ value = 3000 initials = "HXX" } 
	{ value = 2000 initials = "IXX" } 
	{ value = 1000 initials = "JXX" } 
] 
SCRIPT GetLocalArcadeArray 
	GetLevelRecords 
	RETURN scores_array = ( <ArcadeScores> . recordtable ) 
ENDSCRIPT

SCRIPT arcade_machine_write_score_text 
	GoalManager_GetGoalParams name = <goal_id> 
	IF NOT GotParam original_arcade_goal_text 
		original_arcade_goal_text = <goal_text> 
	ENDIF 
	FormatText textname = score_text "%a\\nScore to Beat: %s!" a = <original_arcade_goal_text> s = ( <scores_array> [ 0 ] . value ) UseCommas 
	GoalManager_EditGoal name = <goal_id> params = { goal_text = <score_text> 
		original_arcade_goal_text = <original_arcade_goal_text> 
		arcade_current_score_total = 0 
	} 
ENDSCRIPT

SCRIPT arcade_machine_start_goal 
	GetLocalArcadeArray 
	arcade_machine_view_scores <...> 
ENDSCRIPT

SCRIPT arcade_machine_setup_goal 
	change goal_utility_allow_end_goal_name = <goal_id> 
	GetLocalArcadeArray 
	arcade_machine_write_score_text <...> 
ENDSCRIPT

SCRIPT arcade_machine_cleanup_goal 
	change goal_utility_allow_end_goal_name = null 
ENDSCRIPT

SCRIPT arcade_machine_end_run 
	change check_for_unplugged_controllers = 0 
	exit_pause_menu 
	change check_for_unplugged_controllers = 1 
	GoalManager_ExpireGoal name = <goal_id> 
ENDSCRIPT

SCRIPT arcade_machine_view_scores 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = menu_parts_anchor 
		DestroyScreenElement id = menu_parts_anchor 
	ENDIF 
	hide_all_hud_items ignore_speech_boxes 
	root_window : SetTags menu_state = on 
	PauseMusic 1 
	IF ObjectExists id = arcade_score_anchor 
		arcade_machine_finished_viewing 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = arcade_score_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 220.00000000000) 
	} 
	<root_pos> = ( PAIR(125.00000000000, 65.00000000000) ) 
	LoadTexture no_vram_alloc "MultiplayerSprites/stat_scores" 
	Theme_GetHighlightedTextColor return_value = on_color 
	Theme_GetUnhighlightedTextColor return_value = off_color 
	Theme_GetIconOnColor return_value = on_icon_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(98.00000000000, 6.00000000000) 
		pos = ( <root_pos> + PAIR(0.00000000000, 34.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = arcade_score_anchor 
		font = Dialog 
		rgba = <on_color> 
		text = "PRO SKATER MACHINE HIGH SCORES" 
		scale = 1.00000000000 
		pos = ( <root_pos> + PAIR(18.00000000000, 34.00000000000) ) 
		just = [ left top ] 
		z_priority = 5 
	} 
	Theme_GetSupportPieceColor return_value = line_color 
	FormatText ChecksumName = stat_scores_icon "stat_scores" 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		id = high_scores_menu_scores_icon 
		texture = <stat_scores_icon> 
		scale = PAIR(2.50000000000, 2.50000000000) 
		pos = ( <root_pos> + PAIR(150.00000000000, 65.00000000000) ) 
		rgba = <line_color> 
		just = [ left top ] 
		alpha = 0.69999998808 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		id = menu_anchor 
		texture = black 
		scale = PAIR(1.45000004768, 1.20000004768) 
		pos = ( <root_pos> + PAIR(3.00000000000, 57.00000000000) ) 
		rgba = [ 0 0 0 0 ] 
		just = [ left top ] 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = menu_anchor 
		id = high_scores_vmenu 
		pos = ( <root_pos> - PAIR(125.00000000000, 65.00000000000) ) 
		just = [ left top ] 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(3.00000000000, 50.00000000000) 
		pos = ( <root_pos> + PAIR(60.00000000000, 50.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		texture = black 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(3.00000000000, 50.00000000000) 
		pos = ( <root_pos> + PAIR(140.00000000000, 50.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		texture = black 
		rgba = [ 0 0 0 120 ] 
		scale = PAIR(98.00000000000, 6.00000000000) 
		pos = ( <root_pos> + PAIR(0.00000000000, 240.00000000000) ) 
		just = [ left top ] 
		z_priority = 1.10000002384 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arcade_score_anchor 
		texture = black 
		rgba = <line_color> 
		alpha = 0.40000000596 
		scale = PAIR(98.00000000000, 50.00000000000) 
		pos = ( <root_pos> + PAIR(0.00000000000, 50.00000000000) ) 
		just = [ left top ] 
		z_priority = -100 
	} 
	arcade_machine_fill_scores <...> 
	IF NOT GotParam success 
		WaitForEvent type = speech_box_destroyed 
		arcade_machine_finished_viewing <...> 
	ELSE 
		AssignAlias id = arcade_score_anchor alias = current_menu_anchor 
		SetScreenElementProps { id = high_scores_vmenu 
			event_handlers = [ { pad_choose arcade_machine_finished_viewing params = { need_unpause <...> } } 
				{ pad_start arcade_machine_finished_viewing params = { need_unpause <...> } } 
			] 
			replace_handlers 
		} 
		create_helper_text helper_text_elements = [ { text = "\\bm = Continue" } ] 
		FireEvent type = focus target = high_scores_vmenu 
	ENDIF 
ENDSCRIPT

SCRIPT arcade_machine_finished_viewing 
	dialog_box_exit 
	IF ObjectExists id = arcade_score_anchor 
		DestroyScreenElement id = arcade_score_anchor 
	ENDIF 
	IF GotParam success 
		UpdateArcadeScores recordtable = <scores_array> 
		ArcadeMachineAskForSave 
		RETURN 
	ENDIF 
	root_window : SetTags menu_state = off 
	UnloadTexture "MultiplayerSprites/stat_scores" 
	GoalManager_UnPauseAllGoals 
	show_all_hud_items 
	IF GotParam need_unpause 
		UnPauseGame 
		PauseMusic 0 
		restore_start_key_binding 
	ENDIF 
ENDSCRIPT

SCRIPT ArcadeMachineAskForSave 
	create_snazzy_dialog_box { 
		title = "Save" 
		text = #"Would you like to save?" text_dims = PAIR(300.00000000000, 0.00000000000) 
		no_bg 
		buttons = [ { font = small text = #"No" 
				pad_choose_script = arcade_machine_finished_viewing 
				pad_choose_params = { need_unpause } 
			} 
			{ font = small text = #"Yes" pad_choose_script = ArcadeMachineSaveYes } 
		] 
	} 
ENDSCRIPT

SCRIPT ArcadeMachineSaveYes 
	UnloadTexture "MultiplayerSprites/stat_scores" 
	launch_pause_menu_save_game_sequence 
ENDSCRIPT

SCRIPT arcade_machine_fill_scores 
	target = -1 
	IF GotParam target_index 
		target = ( <target_index> + 1 ) 
	ENDIF 
	GetArraySize <scores_array> 
	<index> = 0 
	BEGIN 
		high_scores_menu_add_five_best_item { 
			parent = high_scores_vmenu 
			place = ( <index> + 1 ) 
			initials = ( ( <scores_array> [ <index> ] ) . initials ) 
			score = ( ( <scores_array> [ <index> ] ) . value ) 
			target_index = <target> 
			in_arcade_machine 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT arcade_machine_enter_initials 
	Skater : KillSpecial force 
	SetScreenElementLock id = root_window off 
	PauseGame 
	PauseMusic 1 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	GoalManager_PauseAllGoals 
	hide_all_hud_items 
	root_window : SetTags menu_state = on 
	GetInitialsString 
	create_onscreen_keyboard { 
		text = <string> 
		no_back = no_back 
		keyboard_done_script = arcade_machine_entered_initials 
		<...> 
		keyboard_title = "ENTER INITIALS" 
		min_length = 1 
		max_length = 3 
	} 
ENDSCRIPT

SCRIPT arcade_machine_entered_initials 
	GetTextElementString id = keyboard_current_string 
	SetInitialsString string = <string> 
	UpdateInitials 
	BEGIN 
		GetTextElementLength id = keyboard_current_string 
		IF ( <length> < <max_length> ) 
			TextElementConcatenate id = keyboard_current_string " " 
			RemoveParameter string 
			GetTextElementString id = keyboard_current_string 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT <max_length> 
	index = <target_index> 
	temp = ( <scores_array> [ <index> ] ) 
	SetArrayElement ArrayName = scores_array index = <index> newvalue = { value = <totalscore> initials = <string> } 
	GetArraySize <scores_array> 
	BEGIN 
		<index> = ( <index> + 1 ) 
		IF ( <index> < <array_size> ) 
			temp2 = ( <scores_array> [ <index> ] ) 
			SetArrayElement ArrayName = scores_array index = <index> newvalue = <temp> 
			temp = <temp2> 
		ENDIF 
	REPEAT <array_size> 
	destroy_onscreen_keyboard 
	arcade_machine_view_scores success <...> 
ENDSCRIPT

SCRIPT arcade_machine_check_for_scores 
	success = 0 
	target_index = 0 
	GetLocalArcadeArray 
	GetArraySize <scores_array> 
	<index> = 0 
	BEGIN 
		IF ( <totalscore> > ( <scores_array> [ <index> ] ) . value ) 
			success = 1 
			target_index = <index> 
			IF ( <target_index> = 0 ) 
				SpawnScript SFX_Arcade_Goal_Win 
				IF NOT GoalManager_HasWonGoal name = <goal_id> 
					GoalManager_WinGoal name = <goal_id> 
				ENDIF 
			ELSE 
				SpawnScript SFX_Arcade_Goal_Lose 
			ENDIF 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( <success> = 1 ) 
		arcade_machine_enter_initials <...> 
	ENDIF 
ENDSCRIPT

SCRIPT GetDefaultArcadeArray 
	GoalManager_GetDifficultyLevel 
	SWITCH <difficulty_level> 
		CASE 0 
			diff_text = "easy" 
		CASE 2 
			diff_text = "sick" 
		DEFAULT 
			diff_text = "normal" 
	ENDSWITCH 
	FormatText ChecksumName = arcade_array_name "default_arcade_scores" 
	IF NOT GlobalExists name = <arcade_array_name> type = array 
		<arcade_array_name> = default_arcade_scores 
	ENDIF 
	RETURN scores = ( <arcade_array_name> ) 
ENDSCRIPT

SCRIPT ResetArcadeScores 
	GetArraySize level_select_menu_level_info 
	index = 0 
	BEGIN 
		IF StructureContains structure = ( level_select_menu_level_info [ <index> ] ) level_prefix 
			GetDefaultArcadeArray level_prefix = ( ( level_select_menu_level_info [ <index> ] ) . level_prefix ) 
			UpdateArcadeScores { level = ( ( level_select_menu_level_info [ <index> ] ) . level_num ) recordtable = <scores> } 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT


