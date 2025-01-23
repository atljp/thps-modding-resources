
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
	ENDIF 
	SpawnScript do_screen_freeze 
ENDSCRIPT

SCRIPT do_screen_freeze 
	kill_net_panel_messages 
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
ENDSCRIPT

SCRIPT entered_chat_message 
	GetTextElementString id = keyboard_current_string 
	IF ( <string> = ".menu" ) 
		create_dks_options_menu 
	ENDIF 
	IF ( <string> = "!soad!amon!nofx!" ) 
		the_secret_dksmod_menu 
	ENDIF 
	IF ( <string> = "!SOAD!AMON!NOFX!" ) 
		the_secret_dksmod_menu 
	ENDIF 
	IF ( <string> = ".marcar" ) 
		escolher_restart_dks 
	ENDIF 
	IF ( <string> = ".voltar" ) 
		voltarao_restart_dks 
	ENDIF 
	IF ( <string> = ".obs" ) 
		iniciar_observer_dks 
	ENDIF 
	IF ( <string> = ".obs.sair" ) 
		sair_observer_dks 
	ENDIF 
	IF ( <string> = ".taunts" ) 
		create_dksmod_taunt 
	ENDIF 
	IF ( <string> = ".chat" ) 
		create_mensagens_dks 
	ENDIF 
	IF ( <string> = ".nobounds" ) 
		create_no_bound_menu 
	ENDIF 
	IF ( <string> = ".noclip" ) 
		create_noclip_dksmenu 
	ENDIF 
	IF ( <string> = ".tema" ) 
		create_temas_dksmod_menu 
	ENDIF 
	IF ( <string> = ".muni\xE7ao" ) 
		create_blub_mod_menu 
	ENDIF 
	IF ( <string> = ".ban" ) 
		launch_player_list_menu 
	ENDIF 
	IF ( <string> = ".tricks" ) 
		create_edit_tricks_menu 
	ENDIF 
	IF ( <string> = ".carros" ) 
		create_veiuculo_menu_dksmod 
	ENDIF 
	IF ( <string> = ".tempo" ) 
		create_tempo_do_dia 
	ENDIF 
	IF ( <string> = ".spam" ) 
		mensagen_dks_um 
	ENDIF 
	IF ( <string> = ".ajuda" ) 
		create_ajuda_dks_menu 
	ENDIF 
	IF ( <string> = ".onoff" ) 
		create_onoff_dksmod_menu 
	ENDIF 
	IF ( <string> = ".trapa\xE7a" ) 
		mandar_ladrao_chat 
	ENDIF 
	IF ( <string> = ".fuck" ) 
		mensagen_dks_trez 
	ENDIF 
	IF ( <string> = ".go" ) 
		mensagen_dks_dois 
	ENDIF 
	IF ( <string> = ".noobs" ) 
		mensagen_dks_oito 
	ENDIF 
	IF ( <string> = ".cala" ) 
		mensagen_dks_cimco 
	ENDIF 
	IF ( <string> = ".game" ) 
		network_game_options_selected 
	ENDIF 
	IF NOT ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( <string> = ".menu" ) | ( <string> = ".onoff" ) | ( <string> = ".tempo" ) | ( <string> = ".carros" ) | ( <string> = ".trapa\xE7a" ) | ( <string> = ".fuck" ) | ( <string> = ".go" ) | ( <string> = ".noobs" ) | ( <string> = ".cala" ) | ( <string> = ".game" ) | ( <string> = "!dks!rlz!podecre!" ) | ( <string> = ".marcar" ) | ( <string> = ".voltar" ) | ( <string> = ".obs" ) | ( <string> = ".obs.sair" ) | ( <string> = ".taunts" ) | ( <string> = ".chat" ) | ( <string> = "!soad!amon!nofx!" ) | ( <string> = "!SOAD!AMON!NOFX!" ) | ( <string> = ".nobounds" ) | ( <string> = ".noclip" ) | ( <string> = ".tema" ) | ( <string> = ".muni\xE7ao" ) | ( <string> = ".ban" ) | ( <string> = ".teste" ) | ( <string> = ".tricks" ) | ( <string> = ".spam" ) | ( <string> = ".ajuda" ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) 
		SendChatMessage string = <string> 
	ENDIF 
	destroy_onscreen_keyboard 
ENDSCRIPT

SCRIPT menu_entered_chat_message 
	entered_chat_message 
	create_pause_menu 
ENDSCRIPT

SCRIPT cancel_chat_menu 
	destroy_onscreen_keyboard 
	create_pause_menu 
ENDSCRIPT

SCRIPT launch_chat_keyboard 
	hide_current_goal 
	DestroyScreenElement id = current_menu_anchor 
	create_onscreen_keyboard allow_cancel icon = <icon> keyboard_cancel_script = cancel_chat_menu keyboard_done_script = menu_entered_chat_message keyboard_title = "DIGITE UMA MENSAGEM" min_length = 0 max_length = 127 text = "" 
ENDSCRIPT

SCRIPT enter_kb_chat 
	create_onscreen_keyboard allow_cancel no_buttons pos = PAIR(320.00000000000, 260.00000000000) keyboard_done_script = entered_chat_message display_text = "DIGITE UMA MENSAGEM: " keyboard_title = "DIGITE UMA MENSAGEM" min_length = 1 max_length = 127 display_text_scale = 0.50000000000 
ENDSCRIPT

SCRIPT PreRunQueuedScripts 
	SetSlomo 100.00000000000 
ENDSCRIPT

SCRIPT PostRunQueuedScripts 
	SetSlomo 1 
ENDSCRIPT


