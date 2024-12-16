
Goal_amateurCOMBOline_genericParams = { 
	goal_text = "Collect C-O-M-B-O" 
	view_goals_text = "Collect C-O-M-B-O" 
	goal_flags = [ 
		got_C 
		got_O 
		got_M 
		got_B 
		got_O2 
	] 
	init = ComboLetters_Init 
	uninit = goal_uninit 
	activate = ComboLetters_Activate 
	fail = ComboLetters_Fail 
	success = ComboLetters_Win 
	expire = ComboLetters_Expire 
	deactivate = ComboLetters_Deactivate 
	letter_info = [ 
		{ obj_id = TRG_Goal_COMBO_C text = "C" } 
		{ obj_id = TRG_Goal_COMBO_O text = "O" } 
		{ obj_id = TRG_Goal_COMBO_M text = "M" } 
		{ obj_id = TRG_Goal_COMBO_B text = "B" } 
		{ obj_id = TRG_Goal_COMBO_O2 text = "O" } 
	] 
	trigger_obj_id = TRG_G_COMBO_Pro 
	restart_node = TRG_G_COMBO_RestartNode 
	start_pad_id = G_COMBO_StartPad 
	got_first_letter = 0 
	record_type = score 
} 
Goal_ProCOMBOline_genericParams = { 
	goal_text = "Collect C-O-M-B-O" 
	view_goals_text = "Pro C-O-M-B-O letters" 
	goal_flags = [ 
		got_C 
		got_O 
		got_M 
		got_B 
		got_O2 
	] 
	init = ComboLetters_Init 
	uninit = goal_uninit 
	activate = ComboLetters_Activate 
	expire = ComboLetters_Expire 
	fail = ComboLetters_Fail 
	success = ComboLetters_Win 
	deactivate = ComboLetters_Deactivate 
	letter_info = [ 
		{ obj_id = TRG_Goal_PROLINE_C text = "C" } 
		{ obj_id = TRG_Goal_PROLINE_O text = "O" } 
		{ obj_id = TRG_Goal_PROLINE_M text = "M" } 
		{ obj_id = TRG_Goal_PROLINE_B text = "B" } 
		{ obj_id = TRG_Goal_PROLINE_O2 text = "O" } 
	] 
	time = 120 
	trigger_obj_id = TRG_G_PROLINE_Pro 
	restart_node = TRG_G_PROLINE_RestartNode 
	start_pad_id = G_PROLINE_StartPad 
	got_first_letter = 0 
	record_type = score 
} 
Goal_MedCOMBOline_genericParams = { 
	goal_text = "Collect C-O-M-B-O" 
	view_goals_text = "Pro C-O-M-B-O letters" 
	goal_flags = [ 
		got_C 
		got_O 
		got_M 
		got_B 
		got_O2 
	] 
	init = ComboLetters_Init 
	uninit = goal_uninit 
	activate = ComboLetters_Activate 
	expire = ComboLetters_Expire 
	fail = ComboLetters_Fail 
	success = ComboLetters_Win 
	deactivate = ComboLetters_Deactivate 
	letter_info = [ 
		{ obj_id = TRG_Goal_Med_C text = "C" } 
		{ obj_id = TRG_Goal_Med_O text = "O" } 
		{ obj_id = TRG_Goal_Med_M text = "M" } 
		{ obj_id = TRG_Goal_Med_B text = "B" } 
		{ obj_id = TRG_Goal_Med_O2 text = "O" } 
	] 
	time = 120 
	trigger_obj_id = TRG_G_MedCOMBO_Pro 
	restart_node = TRG_G_MedCOMBO_RestartNode 
	start_pad_id = G_MedCOMBO_StartPad 
	got_first_letter = 0 
	record_type = score 
} 
SCRIPT ComboLetters_Init 
	goal_init goal_id = <goal_id> 
ENDSCRIPT

SCRIPT ComboLetters_Activate 
	goal_start goal_id = <goal_id> 
	Create_Combo goal_id = <goal_id> 
	GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 } 
	GetArraySize <goal_flags> 
	<index> = 0 
	BEGIN 
		RunScriptOnObject id = ( ( <letter_info> [ <index> ] ) . obj_id ) ComboLetter_InitLetter params = { goal_id = <goal_id> flag = ( <goal_flags> [ <index> ] ) id = ( ( <letter_info> [ <index> ] ) . obj_id ) } 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT ComboLetters_Deactivate 
	KillSpawnedScript name = ComboLetter_GetLetter 
	KillSpawnedScript name = ComboLetter_GotLetter 
	FormatText ChecksumName = gotletter2_script_id "%s_ComboLetter_GotLetter2" s = <goal_name> 
	KillSpawnedScript id = <gotletter2_script_id> 
	FormatText ChecksumName = startCombo_script_id "%s_ComboLetter_StartCombo" s = <goal_name> 
	KillSpawnedScript id = <startCombo_script_id> 
	goal_deactivate goal_id = <goal_id> 
	GoalManager_ResetGoalTrigger name = <goal_id> 
	goal_combo_kill_letters goal_id = <goal_id> 
	kill_combo_messages <...> 
	GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 } 
ENDSCRIPT

SCRIPT ComboLetter_InitLetter 
	GoalManager_GetGoalParams name = <goal_id> 
	Obj_ClearExceptions 
	Obj_RotY speed = 200 
	Obj_SetInnerRadius 8 
	IF GameModeEquals is_creategoals 
		wait 5 frame 
	ENDIF 
	Obj_SetException ex = ObjectInRadius scr = ComboLetter_GotLetter params = { goal_id = <goal_id> flag = <flag> id = <id> } 
ENDSCRIPT

SCRIPT ComboLetter_HUDLetter 
	GetArraySize <letter_info> 
	<index> = 0 
	BEGIN 
		IF ( ( <goal_flags> [ <index> ] ) = <flag> ) 
			<text> = ( ( <letter_info> [ <index> ] ) . text ) 
			<offset> = ( 30 * <index> ) 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF GotParam text 
		create_panel_message { 
			id = <flag> 
			text = <text> 
			style = combo_letter_panel_message 
			offset = <offset> 
			scale = 0.25000000000 
		} 
	ELSE 
		script_assert "couldn\'t find combo letter text" 
	ENDIF 
ENDSCRIPT

SCRIPT hide_combo_letters 
	IF ObjectExists id = got_C 
		DoScreenElementMorph id = got_C time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = got_O 
		DoScreenElementMorph id = got_O time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = got_M 
		DoScreenElementMorph id = got_M time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = got_B 
		DoScreenElementMorph id = got_B time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = got_O2 
		DoScreenElementMorph id = got_O2 time = 0 alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_combo_letters 
	IF ObjectExists id = got_C 
		DoScreenElementMorph id = got_C time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = got_O 
		DoScreenElementMorph id = got_O time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = got_M 
		DoScreenElementMorph id = got_M time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = got_B 
		DoScreenElementMorph id = got_B time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = got_O2 
		DoScreenElementMorph id = got_O2 time = 0 alpha = 1 
	ENDIF 
ENDSCRIPT

SCRIPT ComboLetter_GotLetter 
	GoalManager_GetGoalParams name = <goal_id> 
	FormatText ChecksumName = gotletter2_script_id "%s_ComboLetter_GotLetter2" s = <goal_name> 
	IF GameModeEquals is_creategoals 
		IF NOT GoalManager_CanStartGoal 
			RETURN 
		ENDIF 
	ENDIF 
	SpawnSkaterScript { 
		ComboLetter_GotLetter2 
		id = <gotletter2_script_id> 
		params = { goal_id = <goal_id> id = <id> flag = <flag> } 
	} 
ENDSCRIPT

SCRIPT ComboLetter_GotLetter2 
	IF NOT IsInBail 
		IF SkaterCurrentScorePotGreaterThan 0 
			ComboLetter_GetLetter <...> 
		ELSE 
			IF Skating 
				IF NOT OnGround 
					ComboLetter_GetLetter <...> 
				ENDIF 
			ELSE 
				IF Walking 
					IF Walk_Air 
						ComboLetter_GetLetter <...> 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ComboLetter_GetLetter 
	Kill name = <id> 
	GoalManager_GetGoalParams name = <goal_id> 
	GoalManager_SetGoalFlag name = <goal_id> <flag> 1 
	IF GoalManager_AllFlagsSet name = <goal_id> 
		BroadcastEvent Type = ComboLetter_GotLastLetter 
	ENDIF 
	IF ( <got_first_letter> = 0 ) 
		GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 1 } 
		FormatText ChecksumName = startCombo_script_id "%s_ComboLetter_StartCombo" s = <goal_name> 
		SpawnScript { 
			ComboLetter_StartCombo 
			id = <startCombo_script_id> 
			params = { goal_id = <goal_id> } 
		} 
	ENDIF 
	PlaySound GapSound_11 vol = 100 
	ComboLetter_HUDLetter letter_info = <letter_info> goal_flags = <goal_flags> flag = <flag> 
ENDSCRIPT

SCRIPT ComboLetter_StartCombo 
	ClearExceptions 
	SetException ex = SkaterLanded scr = ComboLetters_ComboLanded params = { goal_id = <goal_id> } 
	SetException ex = SkaterBailed scr = ComboLetters_ComboLost params = { goal_id = <goal_id> } 
	SetException ex = ComboLetter_GotLastLetter scr = ComboLetter_GotLastLetter params = { goal_id = <goal_id> } 
	IF NOT Skater : CurrentScorePotGreaterThan 0 
		SetException ex = SkaterEnterGround scr = ComboLetters_HandleEnterGround params = { goal_id = <goal_id> } 
		SetException ex = SkaterEnterLadder scr = ComboLetters_ComboLanded params = { goal_id = <goal_id> } 
		SetException ex = SkaterEnterHang scr = ComboLetters_ComboLanded params = { goal_id = <goal_id> } 
		WaitForEvent Type = SkaterEnterCombo 
		ClearException SkaterEnterGround 
		ClearException SkaterEnterLadder 
		ClearException SkaterEnterHang 
	ENDIF 
	Block 
ENDSCRIPT

SCRIPT ComboLetter_GotLastLetter 
	ClearExceptions 
	IF NOT Skater : CurrentScorePotGreaterThan 0 
		SetException ex = SkaterEnterGround scr = ComboLetters_WinGoal params = { goal_id = <goal_id> } 
		SetException ex = SkaterEnterLadder scr = ComboLetters_WinGoal params = { goal_id = <goal_id> } 
		SetException ex = SkaterEnterHang scr = ComboLetters_WinGoal params = { goal_id = <goal_id> } 
	ENDIF 
	SetException ex = SkaterBailed scr = ComboLetters_ComboLost params = { goal_id = <goal_id> } 
	SetException ex = SkaterLanded scr = ComboLetters_WinGoal params = { goal_id = <goal_id> } 
	wait 60 Seconds 
	Block 
ENDSCRIPT

SCRIPT ComboLetters_WinGoal 
	ClearExceptions 
	GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 } 
	GoalManager_WinGoal name = <goal_id> 
ENDSCRIPT

SCRIPT ComboLetters_ComboLost 
	ClearExceptions 
	SpawnScript ComboLetters_ComboLost2 params = <...> 
ENDSCRIPT

SCRIPT ComboLetters_ComboLost2 
	IF NOT GoalManager_GoalExists name = <goal_id> 
		RETURN 
	ENDIF 
	GoalManager_GetGoalParams name = <goal_id> 
	IF GoalManager_GoalIsActive name = <goal_id> 
		GoalManager_ResetGoalTrigger name = <goal_id> 
		GoalManager_LoseGoal name = <goal_id> 
		create_panel_message id = new_goal_message text = "You lost your combo!" style = panel_message_generic_loss 
	ENDIF 
ENDSCRIPT

SCRIPT ComboLetters_ComboLanded 
	ClearExceptions 
	IF NOT GoalManager_GoalIsActive name = <goal_id> 
		RETURN 
	ENDIF 
	SpawnScript ComboLetters_ComboLanded2 params = <...> 
ENDSCRIPT

SCRIPT ComboLetters_ComboLanded2 
	GoalManager_GetGoalParams name = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
	create_panel_message id = new_goal_message text = "You lost your combo!" style = panel_message_generic_loss 
ENDSCRIPT

SCRIPT ComboLetters_HandleEnterGround 
	ClearExceptions 
	IF Skater : Walking 
		IF NOT Skater : CurrentScorePotGreaterThan 0 
			SpawnScript ComboLetters_ComboLanded2 params = <...> 
			RETURN 
		ENDIF 
	ENDIF 
	SpawnScript ComboLetter_StartCombo params = <...> 
ENDSCRIPT

SCRIPT ComboLetters_Expire 
	goal_expire goal_id = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT ComboLetters_Fail 
	GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 } 
	goal_fail goal_id = <goal_id> 
ENDSCRIPT

SCRIPT ComboLetters_Win 
	goal_success goal_id = <goal_id> 
ENDSCRIPT

SCRIPT kill_combo_messages 
	GetArraySize <goal_flags> 
	<index> = 0 
	BEGIN 
		IF ScreenElementExists id = ( <goal_flags> [ <index> ] ) 
			RunScriptOnScreenElement id = ( <goal_flags> [ <index> ] ) kill_panel_message 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT Create_Combo 
	GoalManager_GetGoalParams name = <goal_id> 
	GetArraySize <letter_info> 
	<index> = 0 
	BEGIN 
		Create name = ( ( <letter_info> [ <index> ] ) . obj_id ) 
		RunScriptOnObject id = ( ( <letter_info> [ <index> ] ) . obj_id ) bounce_combo_letter 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT goal_combo_kill_letters 
	GoalManager_GetGoalParams name = <goal_id> 
	GetArraySize <letter_info> 
	<index> = 0 
	BEGIN 
		Kill name = ( ( <letter_info> [ <index> ] ) . obj_id ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT bounce_combo_letter 
	Obj_Hover Amp = 6 Freq = 2 
ENDSCRIPT

SCRIPT combo_letter_panel_message { 
		offset = 0 
	} 
	SetProps { 
		font = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
		just = [ center center ] 
		rgba = [ 10 225 10 115 ] 
	} 
	DoMorph time = 0.07999999821 pos = ( ( combo_letter_panel_message_pos1 ) + ( PAIR(0.00000000000, 1.00000000000) * <offset> ) ) 
	DoMorph time = 0.11999999732 pos = ( ( combo_letter_panel_message_pos2 ) + ( PAIR(0.00000000000, 1.00000000000) * <offset> ) ) 
	DoMorph relative_scale time = 0.07999999821 scale = 0.30000001192 
	DoMorph relative_scale time = 0.11999999732 scale = 3.50000000000 
	DoMorph relative_scale time = 0.14000000060 scale = 0.60000002384 
	DoMorph relative_scale time = 0.15999999642 scale = 1.79999995232 
	DoMorph relative_scale time = 0.18000000715 scale = 0.80000001192 
	DoMorph relative_scale time = 0.20000000298 scale = 1.20000004768 
ENDSCRIPT


