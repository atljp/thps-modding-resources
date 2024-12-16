
SCRIPT PauseMusicAndStreams 
	PauseMusic 1 
	PauseStream 1 
ENDSCRIPT

SCRIPT UnPauseMusicAndStreams 
	PauseMusic 0 
	PauseStream 0 
ENDSCRIPT

SCRIPT do_backend_retry 
	IF NOT IsObserving 
		Skater : KillSpecial 
	ENDIF 
	GoalManager_UninitializeAllGoals 
	IF InNetGame 
		IF NOT IsObserving 
			ExitSurveyorMode 
			Skater : add_skater_to_world 
		ENDIF 
		ResetProSetFlags 
		IF NOT IsObserving 
			Skater : RunStarted 
		ENDIF 
		ClearPowerups 
		IF GotParam start_new 
			chosen_host_game 
		ENDIF 
	ENDIF 
	SpawnScript do_screen_freeze 
ENDSCRIPT

SCRIPT do_screen_freeze 
	PauseGame 
	IF InNetGame 
		exit_pause_menu menu_id = pause_menu 
		force_close_rankings 
		destroy_onscreen_keyboard 
		StartNetworkLobby 
	ELSE 
		exit_pause_menu menu_id = pause_menu 
		force_close_rankings 
		SetGameType freeskate2p 
		SetCurrentGameType 
	ENDIF 
	Wait 2 gameframe 
	unpausegame 
	retry 
	reset_exit_pause_menu_delay 
ENDSCRIPT

SCRIPT entered_chat_message 
	GetTextElementString id = keyboard_current_string 
	destroy_onscreen_keyboard 
	check_command_exist string = <string> islocal = 1 
	IF NOT GotParam not_a_command 
		RETURN 
	ELSE 
		Get_FontColor_ValueAndName 
		formattext textname = txt "%c%s" c = <value> s = <string> 
		SendChatMessage string = <txt> 
	ENDIF 
	DestroyIfObjectExist id = bg_container 
	destroy_onscreen_keyboard 
ENDSCRIPT

SCRIPT Zombie_GameInit 
ENDSCRIPT

SCRIPT menu_entered_chat_message 
	entered_chat_message 
	create_pause_menu 
ENDSCRIPT

SCRIPT cancel_enter_chat_menu 
	destroy_onscreen_keyboard 
	DestroyIfObjectExist id = bg_container 
ENDSCRIPT

SCRIPT cancel_chat_menu 
	destroy_onscreen_keyboard 
	DestroyIfObjectExist id = bg_container 
ENDSCRIPT

SCRIPT launch_chat_keyboard 
	hide_current_goal 
	DestroyScreenElement id = current_menu_anchor 
	IF ScreenElementExists id = bg_container 
		DestroyScreenElement id = bg_container 
	ENDIF 
	IF ScreenElementExists id = menu_title_container 
		DestroyScreenElement id = menu_title_container 
	ENDIF 
	create_onscreen_keyboard { 
		text_block 
		allow_cancel 
		keyboard_cancel_script = cancel_chat_menu 
		keyboard_done_script = menu_entered_chat_message 
		keyboard_title = "Enter message" 
		min_length = 0 
		max_length = 75 
		text = "" 
	} 
ENDSCRIPT

SCRIPT enter_kb_chat 
	IF ObjectExists id = ped_speech_dialog 
		RETURN 
	ENDIF 
	IF ObjectExists id = goal_start_dialog 
		RETURN 
	ENDIF 
	IF ObjectExists id = goal_description_anchor 
		RETURN 
	ENDIF 
	DestroyIfObjectExist id = current_menu_anchor 
	DestroyIfObjectExist id = bg_container 
	create_onscreen_keyboard { 
		allow_cancel no_buttons text_block 
		pos = PAIR(320.00000000000, 260.00000000000) 
		keyboard_cancel_script = cancel_enter_chat_menu 
		keyboard_done_script = entered_chat_message 
		display_text = "Enter message" 
		keyboard_title = "Enter message" 
		min_length = 1 
		max_length = 75 
		display_text_scale = 0.50000000000 
	} 
ENDSCRIPT

SCRIPT PreRunQueuedScripts 
	SetSlomo 100.00000000000 
ENDSCRIPT

SCRIPT PostRunQueuedScripts 
	SetSlomo 1 
ENDSCRIPT


