
Goal_SkateLetters_genericParams = { 
	goal_text = "Collect S-K-A-T-E" 
	view_goals_text = "Collect S-K-A-T-E" 
	goal_flags = [ 
		got_S 
		got_K 
		got_A 
		got_T 
		got_E 
	] 
	init = SkateLetters_Init 
	uninit = goal_uninit 
	active = SkateLetters_Active 
	activate = SkateLetters_Activate 
	deactivate = SkateLetters_Deactivate 
	fail = SkateLetters_Fail 
	success = SkateLetters_Win 
	expire = SkateLetters_Expire 
	trigger_obj_id = TRG_G_SKATE_Pro 
	S_obj_id = TRG_Goal_Letter_S 
	K_obj_id = TRG_Goal_Letter_K 
	A_obj_id = TRG_Goal_Letter_A 
	T_obj_id = TRG_Goal_Letter_T 
	E_obj_id = TRG_Goal_Letter_E 
	time = 120 
	restart_node = TRG_G_SKATE_RestartNode 
	start_pad_id = G_SKATE_StartPad 
	record_type = score 
} 
SCRIPT SkateLetters_Init 
	goal_init goal_id = <goal_id> 
ENDSCRIPT

SCRIPT SkateLetters_Activate 
	goal_start goal_id = <goal_id> 
	create_skate <...> 
ENDSCRIPT

SCRIPT SkateLetter_InitLetter 
	<id> : Obj_Visible 
	Obj_ClearExceptions 
	Obj_RotY speed = 200 
	Obj_SetInnerRadius 8 
	IF GameModeEquals is_creategoals 
		wait 5 frame 
	ENDIF 
	Obj_SetException { 
		ex = ObjectInRadius 
		scr = SkateLetter_GotLetter 
		params = { id = <id> goal_id = <goal_id> flag = <flag> } 
	} 
ENDSCRIPT

SCRIPT SkateLetter_GotLetter 
	IF GameModeEquals is_creategoals 
		IF NOT GoalManager_CanStartGoal 
			RETURN 
		ENDIF 
	ENDIF 
	SpawnSkaterScript { 
		SkateLetter_GotLetter2 
		params = { goal_id = <goal_id> flag = <flag> id = <id> } 
	} 
ENDSCRIPT

SCRIPT SkateLetter_GotLetter2 
	IF NOT IsInBail 
		<id> : Obj_ClearExceptions 
		PlaySound GapSound_11 vol = 150 
		IF NodeExists <id> 
			Kill name = <id> 
		ELSE 
			<id> : Die 
		ENDIF 
		GoalManager_SetGoalFlag name = <goal_id> <flag> 1 
		SkateLetter_HUDLetter flag = <flag> 
	ENDIF 
ENDSCRIPT

SCRIPT SkateLetters_Fail 
	kill_skate_messages 
	goal_fail goal_id = <goal_id> 
ENDSCRIPT

SCRIPT SkateLetters_Deactivate 
	GoalManager_ResetGoalTrigger name = <goal_id> 
	goal_deactivate goal_id = <goal_id> 
	goal_skate_kill_letters <...> 
	kill_skate_messages 
ENDSCRIPT

SCRIPT SkateLetters_Expire 
	goal_expire goal_id = <goal_id> 
	GoalManager_LoseGoal name = <goal_id> 
ENDSCRIPT

SCRIPT SkateLetters_Win 
	goal_success goal_id = <goal_id> 
	kill_skate_messages 
ENDSCRIPT

SCRIPT SkateLetter_HUDLetter 
	SWITCH <flag> 
		CASE got_S 
			id = skate_letter_s 
			offset = 0 
			text = "S" 
		CASE got_K 
			id = skate_letter_k 
			offset = 30 
			text = "K" 
		CASE got_A 
			id = skate_letter_a 
			offset = 60 
			text = "A" 
		CASE got_T 
			id = skate_letter_t 
			offset = 90 
			text = "T" 
		CASE got_E 
			id = skate_letter_e 
			offset = 120 
			text = "E" 
		DEFAULT 
			script_assert "unkown letter" 
	ENDSWITCH 
	create_panel_message { 
		id = <id> 
		text = <text> 
		style = goal_skate_panel_message 
		offset = <offset> 
		scale = 0.25000000000 
	} 
ENDSCRIPT

SCRIPT goal_skate_hide_letters 
	IF ObjectExists id = skate_letter_s 
		DoScreenElementMorph id = skate_letter_s time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = skate_letter_k 
		DoScreenElementMorph id = skate_letter_k time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = skate_letter_a 
		DoScreenElementMorph id = skate_letter_a time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = skate_letter_t 
		DoScreenElementMorph id = skate_letter_t time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = skate_letter_e 
		DoScreenElementMorph id = skate_letter_e time = 0 alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_unhide_letters 
	IF ObjectExists id = skate_letter_s 
		DoScreenElementMorph id = skate_letter_s time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = skate_letter_k 
		DoScreenElementMorph id = skate_letter_k time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = skate_letter_a 
		DoScreenElementMorph id = skate_letter_a time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = skate_letter_t 
		DoScreenElementMorph id = skate_letter_t time = 0 alpha = 1 
	ENDIF 
	IF ObjectExists id = skate_letter_e 
		DoScreenElementMorph id = skate_letter_e time = 0 alpha = 1 
	ENDIF 
ENDSCRIPT

SCRIPT create_skate 
	IF GotParam goal_object_params 
		ForEachIn <goal_object_params> Do = GoalEditor_GameObjectLetterCreate params = { goal_id = <goal_id> Version = <goal_version> } 
	ELSE 
		goal_skate_create_letter goal_id = <goal_id> flag = got_S id = <S_obj_id> 
		goal_skate_create_letter goal_id = <goal_id> flag = got_K id = <K_obj_id> 
		goal_skate_create_letter goal_id = <goal_id> flag = got_A id = <A_obj_id> 
		goal_skate_create_letter goal_id = <goal_id> flag = got_T id = <T_obj_id> 
		goal_skate_create_letter goal_id = <goal_id> flag = got_E id = <E_obj_id> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_create_letter 
	IF NOT GoalManager_GoalFlagSet name = <goal_id> flag = <flag> 
		create name = <id> 
		RunScriptOnObject id = <id> bounce_skate_letter 
		RunScriptOnObject { 
			id = <id> 
			SkateLetter_InitLetter 
			params = { goal_id = <goal_id> flag = <flag> id = <id> } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT goal_skate_kill_letters 
	IF GotParam goal_object_params 
		ForEachIn <goal_object_params> Do = GoalEditor_GameObjectKillLetters params = { Version = <goal_version> } 
	ELSE 
		Kill name = <S_obj_id> 
		Kill name = <K_obj_id> 
		Kill name = <A_obj_id> 
		Kill name = <T_obj_id> 
		Kill name = <E_obj_id> 
	ENDIF 
ENDSCRIPT

SCRIPT kill_skate_messages 
	IF ObjectExists id = skate_letter_s 
		RunScriptOnScreenElement id = skate_letter_s kill_panel_message 
	ENDIF 
	IF ObjectExists id = skate_letter_k 
		RunScriptOnScreenElement id = skate_letter_k kill_panel_message 
	ENDIF 
	IF ObjectExists id = skate_letter_a 
		RunScriptOnScreenElement id = skate_letter_a kill_panel_message 
	ENDIF 
	IF ObjectExists id = skate_letter_t 
		RunScriptOnScreenElement id = skate_letter_t kill_panel_message 
	ENDIF 
	IF ObjectExists id = skate_letter_e 
		RunScriptOnScreenElement id = skate_letter_e kill_panel_message 
	ENDIF 
ENDSCRIPT

SCRIPT bounce_skate_letter 
	Obj_Hover Amp = 6 Freq = 2 
ENDSCRIPT

SCRIPT goal_skate_panel_message { 
		offset = 0 
	} 
	SetProps { 
		font = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
		just = [ center center ] 
		rgba = [ 127 102 0 95 ] 
	} 
	DoMorph time = 0.07999999821 pos = ( ( skate_panel_message_pos1 ) + ( PAIR(0.00000000000, 1.00000000000) * <offset> ) ) 
	DoMorph time = 0.11999999732 pos = ( ( skate_panel_message_pos2 ) + ( PAIR(0.00000000000, 1.00000000000) * <offset> ) ) 
	DoMorph relative_scale time = 0.07999999821 scale = 0.30000001192 
	DoMorph relative_scale time = 0.11999999732 scale = 3.50000000000 
	DoMorph relative_scale time = 0.14000000060 scale = 0.60000002384 
	DoMorph relative_scale time = 0.15999999642 scale = 1.79999995232 
	DoMorph relative_scale time = 0.18000000715 scale = 0.80000001192 
	DoMorph relative_scale time = 0.20000000298 scale = 1.20000004768 
ENDSCRIPT


