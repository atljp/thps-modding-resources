
SCRIPT create_dks_options_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c8MENU - DKS MOD 1.2" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_pause_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	build_pause_menu_parts 
	IF NOT InNetGame 
		make_theme_menu_item text = "Crie seu Tema \\c3-\\c0" Id = id_crieseutema_go_menu pad_choose_script = create_temas_dksmod_menu 
	ENDIF 
	IF InNetGame 
		IF GameModeEquals is_lobby 
			IF NOT NetworkGamePending 
				IF NOT ChangeLevelPending 
					make_theme_menu_item text = "Crie seu Tema \\c3-\\c0" Id = pode_editar_temas_id pad_choose_script = create_temas_dksmod_menu 
				ENDIF 
			ENDIF 
		ELSE 
			make_theme_menu_item text = "Crie seu Tema \\c2-\\c0" Id = nao_pode_editar_temas_id pad_choose_script = no_create_temas_dksmod_menu 
		ENDIF 
	ENDIF 
	make_theme_menu_item text = "Menu Ligar/Desligar \\c3-\\c0" Id = id_ligardesligar_dks pad_choose_script = create_onoff_dksmod_menu 
	make_theme_menu_item text = "Menu de Muni\xE7ao \\c3-\\c0" Id = arma_menu pad_choose_script = create_blub_mod_menu 
	make_theme_menu_item text = "Editar Taunts \\c3-\\c0" Id = id_item_editartauntsgo_dks pad_choose_script = create_dksmod_taunt 
	make_theme_menu_item text = "Menu de Veiculos \\c3-\\c0" Id = id_item_veiuculomenugo_dks pad_choose_script = create_veiuculo_menu_dksmod 
	make_theme_menu_item text = "Menu Tempo do Dia \\c3-\\c0" Id = id_item_dianoitego_dks pad_choose_script = create_tempo_do_dia 
	make_theme_menu_item text = "Menu de Cheats \\c3-\\c0" Id = menu_cheatsdebug_dks pad_choose_script = launch_cheats_menu 
	make_theme_menu_item text = "Menu de Debug \\c3-\\c0" Id = menu_debugdebug_dks pad_choose_script = create_debug_menu 
	make_theme_menu_item text = "Menu de Testes \\c3-\\c0" Id = menu_testesdebug_dks pad_choose_script = create_test_menu 
	make_theme_menu_item text = "Menu de Restarts \\c3-\\c0" Id = id_menu_restart_go_menu pad_choose_script = create_restart_dksmod_menu 
	make_theme_menu_item text = "Menu de Observer \\c3-\\c0" Id = id_obervermenu_go_menu pad_choose_script = create_observer_dksmod_menu 
	make_theme_menu_item text = "Proximo \\c2->" Id = id_item_proximo_menuprinci pad_choose_script = create_dksmod_outros 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_dksmod_outros 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c8MENU - DKS MOD 1.2" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	IF IsHost 
		make_theme_menu_item text = "Menu do Host \\c3-\\c0" Id = dks_autoserver pad_choose_script = create_host_dks_menu 
	ENDIF 
	make_theme_menu_item text = "DKS Chat Mensagens \\c3-\\c0" Id = id_item_chatmensdks_dks pad_choose_script = create_mensagens_dks 
	make_theme_menu_item text = "Formato da Tela \\c3-\\c0" Id = id_item_formatodatela pad_choose_script = create_display_menu 
	make_theme_menu_item text = "Anterior \\c2<-" Id = id_item_voltar_principalmenu_dks pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_restart_dksmod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2Menu de Restarts" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	IF LevelIs load_tr 
		make_theme_menu_item text = "\\c4Vamos para New Jersey" Id = id_vamos_a_nj_dksmod pad_choose_script = go_vamos_a_nj 
		make_theme_menu_item text = "\\c4Vamos para Training" Id = id_vamos_a_tr_dksmod pad_choose_script = go_vamos_a_tr 
	ENDIF 
	make_theme_menu_item text = "Marcar Restart" Id = observer_menu_iniciar pad_choose_script = escolher_restart_dks 
	make_theme_menu_item text = "Voltar ao Restart" Id = observer_menu_sair pad_choose_script = voltarao_restart_dks 
	make_theme_menu_item text = "Menu de restarts padroes" Id = menu_restartsdebug_dks pad_choose_script = launch_restart_menu 
	make_theme_menu_item text = "Voltar" Id = id_item_voltar_menurestarts_dks pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT go_vamos_a_nj 
	exit_pause_menu 
	Skater : vamos_a_nj 
ENDSCRIPT

SCRIPT vamos_a_nj 
	Rotate y = 180 duration = 0.89999997616 seconds 
	TeleportSkaterToNode NodeName = hj_nj_ClinicSign01 
	create_net_panel_message text = "\\c4Bem vindo a New Jersey!!!\\n\\n\\c8DKS Mod 1.2\\n\\c2By:\\c0 Dark and pedroO!" style = generic_net_panel_message 
ENDSCRIPT

SCRIPT go_vamos_a_tr 
	exit_pause_menu 
	Skater : vamos_a_tr 
ENDSCRIPT

SCRIPT vamos_a_tr 
	Rotate y = 180 duration = 0.89999997616 seconds 
	TeleportSkaterToNode NodeName = TRG_Restart_HighScore 
	create_net_panel_message text = "\\c4Bem vindo novamente a Warehouse!!!\\n\\n\\c8DKS Mod 1.2\\n\\c2By:\\c0 Dark and pedroO!" style = generic_net_panel_message 
ENDSCRIPT

SCRIPT create_observer_dksmod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2Menu de observer" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Iniciar Observer" Id = iniciar_observedksid pad_choose_script = iniciar_observer_dks 
	make_theme_menu_item text = "Sair do Observer" Id = sair_observerdksid pad_choose_script = sair_observer_dks 
	make_theme_menu_item text = "Voltar" Id = id_item_voltar_observermenu pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_host_dks_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2Host" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dksmod_outros } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Numero de jogadores" Id = id_item_host_numjogadores pad_choose_script = create_network_host_options_max_players_menu 
	make_theme_menu_item text = "Auto-server" Id = id_item_autoserver_dks pad_choose_script = create_sit_out_menu 
	make_theme_menu_item text = "Voltar" Id = id_item_voltar_menuhost pad_choose_script = create_dksmod_outros 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT escolher_restart_dks 
	set_custom_restart 
	exit_pause_menu 
ENDSCRIPT

SCRIPT voltarao_restart_dks 
	skip_to_custom_restart 
	exit_pause_menu 
ENDSCRIPT

SCRIPT iniciar_observer_dks 
	Skater : remove_skater_from_world 
	EnterSurveyorMode 
	exit_pause_menu 
ENDSCRIPT

SCRIPT sair_observer_dks 
	Skater : add_skater_to_world 
	ExitSurveyorMode 
	exit_pause_menu 
ENDSCRIPT

SCRIPT create_dksmod_taunt 
	hide_current_goal 
	make_new_roundbar_menu title = "EDITAR TAUNTS" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Texto do \'F1\'" centered pad_choose_script = mudar_taunt pad_choose_params = { string = props_string field = "props_string" } 
	make_theme_menu_item text = "Texto do \'F2\'" centered pad_choose_script = mudar_taunt pad_choose_params = { string = your_daddy_string field = "your_daddy_string" } 
	make_theme_menu_item text = "Texto do \'F3\'" centered pad_choose_script = mudar_taunt pad_choose_params = { string = get_some_string field = "get_some_string" } last_menu_item = last_menu_item 
	make_theme_menu_item text = "Texto do \'F4\'" centered pad_choose_script = mudar_taunt pad_choose_params = { string = no_way_string field = "no_way_string" } 
	make_theme_menu_item text = "Pronto" Id = id_item_prontoedittauntsmenu pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT voltar_do_taunt 
	destroy_onscreen_keyboard 
	create_dksmod_taunt 
ENDSCRIPT

SCRIPT escolher_novo_taunt 
	GetTextElementString Id = keyboard_current_string 
	SetPreferencesFromUI prefs = Taunt <...> 
	destroy_onscreen_keyboard 
	create_dksmod_taunt 
ENDSCRIPT

SCRIPT mudar_taunt 
	GetPreferenceString pref_type = Taunt <string> 
	DestroyScreenElement Id = current_menu_anchor 
	create_onscreen_keyboard allow_cancel keyboard_cancel_script = voltar_do_taunt keyboard_done_script = escolher_novo_taunt keyboard_title = "Entre com a nova taunt...." field = <field> text = <ui_string> min_length = 1 max_length = 100 
ENDSCRIPT

SCRIPT dksmod_hide_board 
	Skater : exit_pause_menu 
	Skater : SetBoardMissing 
	Skater : SetBoardMissing 
	Skater : Display 
ENDSCRIPT

SCRIPT dksmod_unhide_board 
	Skater : exit_pause_menu 
	Skater : SetBoardMissing 
	Skater : UnsetBoardMissing 
	Skater : Display 
ENDSCRIPT

SCRIPT dksmod_sk_remove 
	Skater : exit_pause_menu 
	Skater : remove_skater_from_world 
ENDSCRIPT

SCRIPT dksmod_sk_add 
	Skater : exit_pause_menu 
	Skater : add_skater_to_world 
ENDSCRIPT

SCRIPT dksmod_perde_a_cabeca 
	Skater : exit_pause_menu 
	Skater : SetBoardMissing 
	Skater : skaterLoseHead 
	Skater : Display 
ENDSCRIPT

SCRIPT dksmod_exlodir_skater 
	Skater : exit_pause_menu 
	Skater : SetBoardMissing 
	Skater : skaterExplode 
	Skater : Display 
ENDSCRIPT

SCRIPT create_onoff_dksmod_menu 
	hide_current_goal 
	make_new_themed_sub_menu title = "\\c2Ligar/Desligar " 
	create_helper_text { helper_text_elements = [ { text = "\\c2Escolha um op\xE7ao que deseja ligar/desligar." } 
			{ text = " " } 
			{ text = " " } 
		] 
	} 
	SetScreenElementProps { Id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_dks_options_menu } } 
		] 
	} 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\'WallRide ilimitado\'" Id = id_item_wallrideilim_dks pad_choose_script = create_dks_wall_menu 
	make_theme_menu_item text = "\'WallJump ilimitado\'" Id = id_item_jumpilim_dks pad_choose_script = create_dks_walljump 
	make_theme_menu_item text = "\'No Bounds\'" Id = id_item_nobounds_dks pad_choose_script = create_no_bound_menu 
	make_theme_menu_item text = "\'No Clip\'" Id = id_item_noclipmonoff_dks pad_choose_script = create_noclip_dksmenu 
	make_theme_menu_item text = "\'FLY\'" Id = id_item_flyonoff_dks pad_choose_script = create_fly_dksmenu 
	make_theme_menu_item text = "\'Esconder Skater\'" Id = id_item_skateronoff_dks pad_choose_script = create_skater_on_off_menu 
	make_theme_menu_item text = "\'Esonder Skate\'" Id = id_item_skateonoff_dks pad_choose_script = create_skate_on_off_menu 
	make_theme_menu_item text = "  " Id = id_item_onoff_dks_nada_sele pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Voltar" Id = id_item_prontoonoff_dks pad_choose_script = create_dks_options_menu 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_no_bound_menu 
	make_new_themed_sub_menu title = "No Bounds" 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
			{ text = "\\bn = Voltar" } 
			{ text = "\\bm = Aceitar" } 
		] 
	} 
	SetScreenElementProps { Id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_onoff_dksmod_menu } } 
		] 
	} 
	IF GetGlobalFlag flag = FORA_DOS_LIMITES 
		hud_text = "Ligado" 
	ELSE 
		hud_text = "Desligado" 
	ENDIF 
	theme_menu_add_item { text = "   " 
		Id = id_no_bounds_nada_um 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "No Bounds:" 
		extra_text = <hud_text> 
		Id = id_foradoslimites_botao 
		pad_choose_script = go_fun_fora_dos_limites 
	} 
	theme_menu_add_item { text = "Pronto" 
		Id = id_no_bounds_prontio 
		pad_choose_script = create_onoff_dksmod_menu 
	} 
	theme_menu_add_item { text = "   " 
		Id = id_no_bounds_nada_tres 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "   " 
		Id = id_no_bounds_nada_quatro 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "DkS MoD V1.2" 
		Id = id_no_bounds_nada_cimco 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "Thanks to:" 
		Id = id_no_bounds_nada_seis 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "Dark -" 
		Id = id_no_bounds_nada_sete 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "Pedro -" 
		Id = id_no_bounds_nada_oito 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "Gone -" 
		Id = id_no_bounds_nada_nove 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item { text = "CHC -" 
		Id = id_no_bounds_nada_dez 
		pad_choose_script = semlink not_focusable 
	} 
	theme_menu_add_item text = " " Id = id_nadanada_no_bounds_quatrorze pad_choose_script = semlink not_focusable last_menu_item = 1 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT go_fun_fora_dos_limites 
	fun_fora_dos_limites 
	create_no_bound_menu 
ENDSCRIPT

SCRIPT fun_fora_dos_limites 
	IF NOT GetGlobalFlag flag = FORA_DOS_LIMITES 
		SetScreenElementProps Id = { id_foradoslimites_botao child = 3 } text = "Desligado" 
		SetGlobalFlag flag = FORA_DOS_LIMITES 
	ELSE 
		SetScreenElementProps Id = { id_foradoslimites_botao child = 3 } text = "Ligado" 
		UnsetGlobalFlag flag = FORA_DOS_LIMITES 
	ENDIF 
ENDSCRIPT

SCRIPT create_dks_walljump 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2Walljump ilimitado" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_onoff_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Ligar" Id = id_item_awxf pad_choose_script = ligar_walljump 
	make_theme_menu_item text = "Desligar" Id = id_item_dwas pad_choose_script = desligar_walljump 
	make_theme_menu_item text = "\\c2Pronto" Id = id_item_pronto_psydks pad_choose_script = create_onoff_dksmod_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT ligar_walljump 
	change Physics_Disallow_Rewallplant_Duration = 0 
	exit_pause_menu 
ENDSCRIPT

SCRIPT desligar_walljump 
	change Physics_Disallow_Rewallplant_Duration = 850 
	exit_pause_menu 
ENDSCRIPT

SCRIPT create_dks_wall_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2WallRide ilimitado" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_onoff_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Ligar" Id = ligar_wall_ride pad_choose_script = on_ilimitado_wallride 
	make_theme_menu_item text = "Desligar" Id = desligar_wall_ride pad_choose_script = off_ilimitado_wallride 
	make_theme_menu_item text = "\\c2Pronto" Id = pronto_wall_ride pad_choose_script = create_onoff_dksmod_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT on_ilimitado_wallride 
	change Wall_Ride_Delay = 0 
	exit_pause_menu 
ENDSCRIPT

SCRIPT off_ilimitado_wallride 
	change Wall_Ride_Delay = 0.66600000858 
	exit_pause_menu 
ENDSCRIPT

SCRIPT create_noclip_dksmenu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2No Clip" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_onoff_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Ligar" Id = dksmod_noclipon_idks pad_choose_script = dksmod_ligarnoclip 
	make_theme_menu_item text = "Desligar" Id = dksmod_noclipoff_idks pad_choose_script = dksmod_desligarnoclip 
	make_theme_menu_item text = "\\c2Pronto" Id = id_dksnoclip_pronto pad_choose_script = create_onoff_dksmod_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT dksmod_ligarnoclip 
	Skater : exit_pause_menu 
	Skater : MakeSkaterFly 
	Skater : PausePhysics 
ENDSCRIPT

SCRIPT dksmod_desligarnoclip 
	Skater : exit_pause_menu 
	Skater : UnpausePhysics 
ENDSCRIPT

SCRIPT create_fly_dksmenu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2FLY" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_onoff_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Ligar" Id = dksmod_fly_ligar_idks pad_choose_script = dksmod_ligar_fly 
	make_theme_menu_item text = "Desligar" Id = dksmod_fly_desligar_idks pad_choose_script = voltarao_restart_dks 
	make_theme_menu_item text = "\\c2Pronto" Id = id_dksfly_pronto pad_choose_script = create_onoff_dksmod_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_skater_on_off_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2SKATER" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_onoff_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Remover Skater" Id = id_remover_skater_on pad_choose_script = dksmod_sk_remove 
	make_theme_menu_item text = "Adicionar Skater" Id = id_remover_skater_off pad_choose_script = dksmod_sk_add 
	make_theme_menu_item text = "\\c2Pronto" Id = id_dksfly_pronto pad_choose_script = create_onoff_dksmod_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_skate_on_off_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\cSKATE" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_onoff_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Esconder o Skate" Id = dksmod_esconder_o_skate pad_choose_script = dksmod_hide_board 
	make_theme_menu_item text = "Mostrar o Sakte" Id = dksmod_mostrar_o_skate pad_choose_script = dksmod_unhide_board 
	make_theme_menu_item text = "\\c2Pronto" Id = id_dksfly_pronto pad_choose_script = create_onoff_dksmod_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT dksmod_ligar_fly 
	Skater : exit_pause_menu 
	Skater : MakeSkaterFly 
ENDSCRIPT

SCRIPT create_mensagens_dks 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2Mensagens - DKS MoD 1.2" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dksmod_outros } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Spam" Id = id_item_menssa_um pad_choose_script = mensagen_dks_um 
	make_theme_menu_item text = "Game, PORRA" Id = id_item_menssa_dois pad_choose_script = mensagen_dks_dois 
	make_theme_menu_item text = "Vermes" Id = id_item_menssa_trez pad_choose_script = mensagen_dks_trez 
	make_theme_menu_item text = "Sauda\xE7oes" Id = id_item_menssa_quatro pad_choose_script = mensagen_dks_quatro 
	make_theme_menu_item text = "Chato" Id = id_item_menssa_cimco pad_choose_script = mensagen_dks_cimco 
	make_theme_menu_item text = "Corrente" Id = id_item_menssa_seis pad_choose_script = mensagen_dks_seis 
	make_theme_menu_item text = "tommy ralks" Id = id_item_menssa_sete pad_choose_script = mensagen_dks_sete 
	make_theme_menu_item text = "Noobs" Id = id_item_menssa_oito pad_choose_script = mensagen_dks_oito 
	make_theme_menu_item text = "Ronaldo" Id = id_item_menssa_nove pad_choose_script = mensagen_dks_nove 
	make_theme_menu_item text = "\\c2Pronto" Id = id_item_prontocameras pad_choose_script = create_dksmod_outros 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT mensagen_dks_um 
	SendChatMessage string = "\\c4www.dks-clan.tk v2 -> \\c0Tradu\xE7oes, mods e muito mais para Tony Hawks." 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_dois 
	SendChatMessage string = "Ei admin, seu lazarento, poe um game antes que eu acabe com tua ra\xE7a, porra!" 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_trez 
	SendChatMessage string = "Porra do caralho! Malditos vermes comedores de bosta que nao fazem nada a nao ser fuder com meu game, merdaaa!!!" 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_quatro 
	SendChatMessage string = "Hi, hola, privet, gutten tag, e ai, elo, foda-se." 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_cimco 
	SendChatMessage string = "Ol\xE1, eu estou tentando jogar no momento. Por que voce, por favor, nao CALA ESSA MERDA DESSA BOCA E JOGA TAMBEM?!" 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_seis 
	SendChatMessage string = "Entre: \\c4www.dks-clan.tk\\c0 e repasse para 6 servers, senao morrer\xE1 em tres dias." 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_sete 
	SendChatMessage string = "manolo q lecal e\xE7e tommy ralks om laine" 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_oito 
	SendChatMessage string = "Puta que pariu, por que diabos eu to aqui jogando com esse bando de \\c7noobs\\c0 imprest\xE1veis? Voltem praquela merda de \\c7GameVicio\\c0, seus ANIMAIS!!" 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mensagen_dks_nove 
	SendChatMessage string = "\\c2...Ronaldo." 
	exit_pause_menu 
ENDSCRIPT

SCRIPT mandar_ladrao_chat 
	SendChatMessage string = "pessual, vou dizer logu, eu sou homosexual :S, gosto de garotos e gostei muito de voces :P" 
ENDSCRIPT

SCRIPT bmf_giveammo 
	Skater = 0 
	Skater : GetAmmo 
	IF ( <ammo> = 0 ) 
		Skater : SetAmmo 500 
	ELSE 
		Skater : SetAmmo 0 
		Skater : GetAmmo 
		FormatText textname = text "Quantidade (%a)" a = <ammo> 
		SetScreenElementProps Id = { bm_giveammo child = 0 } text = <text> 
	ENDIF 
ENDSCRIPT

SCRIPT bmf_cycleammo 
	Skater = 0 
	make_new_roundbar_menu { 
		menu_id = blub__modmenu 
		vmenu_id = blub__vmodmenu 
		pad_back_script = create_blub_mod_menu 
	title = "Tipo de muni\xE7ao" } 
	add_roundbar_menu_item text = "Tomates" Id = bm_giveammo pad_choose_script = b_ammotomato 
	add_roundbar_menu_item text = "Camaroes" Id = bm_ammotype pad_choose_script = b_ammoshrimp 
	add_roundbar_menu_item text = "Ma\xE7as" Id = menu_quit pad_choose_script = b_ammoapple 
	add_roundbar_menu_item text = "Latas de tinta" Id = bm_item1 pad_choose_script = b_ammopaintcan 
	add_roundbar_menu_item text = "Colares" Id = bm_item2 pad_choose_script = b_ammobeads 
	add_roundbar_menu_item text = "Bombas" Id = bm_item3 pad_choose_script = b_ammosmokebomb 
	add_roundbar_menu_item text = "O\'s de combo" Id = bm_item4 pad_choose_script = b_ammoos 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT b_ammotomato 
	b_setammotype type = tomato 
ENDSCRIPT

SCRIPT b_ammoshrimp 
	b_setammotype type = shrimp 
ENDSCRIPT

SCRIPT b_ammoapple 
	b_setammotype type = apple 
ENDSCRIPT

SCRIPT b_ammobeads 
	b_setammotype type = beads 
ENDSCRIPT

SCRIPT b_ammosmokebomb 
	b_setammotype type = smokebomb 
ENDSCRIPT

SCRIPT b_ammopaintcan 
	b_setammotype type = paintcan 
ENDSCRIPT

SCRIPT b_ammoos 
	b_setammotype type = b_ammoos 
ENDSCRIPT

SCRIPT b_setammotype 
	Skater = 0 
	Skater : SetAmmoType <type> 
	create_blub_mod_menu 
ENDSCRIPT

SCRIPT create_blub_mod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "MUNI\xC7AO MENU" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	scrolling 
	unhide_root_window 
	Skater = 0 
	Skater : GetAmmo 
	FormatText textname = text "Quantidade (%a)" a = <ammo> 
	make_theme_menu_item text = <text> Id = bm_giveammo pad_choose_script = sair_voltar 
	Skater : GetAmmoType 
	get_ammo_text type = <ammo_type> 
	FormatText textname = text "Tipo de muni\xE7ao: %a" a = <ammo_text> 
	make_theme_menu_item text = <text> Id = bm_ammotype pad_choose_script = bmf_cycleammo 
	IF IsHost 
		make_theme_menu_item text = "Pronto" Id = menu_quit pad_choose_script = create_dks_options_menu 
	ENDIF 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT sair_voltar 
	bmf_giveammo 
	exit_pause_menu 
	create_blub_mod_menu 
ENDSCRIPT

SCRIPT the_secret_dksmod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "Secret menu \\c8DKS Mod" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = exit_pause_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_text_menu_item text = "Barra de equilibrio" Id = id_secretmenu_balan pad_choose_script = launch_cheats_menu_select_difficulty 
	make_text_menu_item text = "Pontos" Id = id_secretmenu_scorepontos pad_choose_script = the_secret_pontos 
	make_text_menu_item text = "Free skate" Id = id_secretmenu_gofreeskate pad_choose_script = aplicar_restart_paineis 
	make_text_menu_item text = "Balan\xE7o perfeito (HOST)" Id = id_secretmenu_balan_perfeito pad_choose_script = secret_menu_balan_perfeito 
	make_text_menu_item text = "      " Id = id_secretmenu_readme pad_choose_script = semlink not_focusable = not_focusable 
	make_text_menu_item text = "\\c2Ok, voltar ao jogo" Id = id_secretmenu_pronto pad_choose_script = exit_pause_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT secret_menu_balan_perfeito 
	hide_current_goal 
	make_new_roundbar_menu title = "Balan\xE7o perfeito (HOST):" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = the_secret_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = " " Id = id_nadanadadasdasd pad_choose_script = semlink not_focusable 
	make_cheats_menu_item text = "GRIND:" cheat_flag = CHEAT_PERFECT_RAIL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
	make_cheats_menu_item text = "MANUAL" cheat_flag = CHEAT_PERFECT_MANUAL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript } 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT the_secret_pontos 
	hide_current_goal 
	make_new_roundbar_menu title = "Pontos" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = the_secret_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_text_menu_item text = "1 Milhao de pontos" Id = id_secretmenu_ummill pad_choose_script = score_dks_um_mill 
	make_text_menu_item text = "5 Milhoes de pontos" Id = id_secretmenu_cimcomill pad_choose_script = score_dks_cimco_mill 
	make_text_menu_item text = "10 Milhoes de pontos" Id = id_secretmenu_dezmill pad_choose_script = score_dks_dez_mill 
	make_text_menu_item text = "20 Milhoes de pontos" Id = id_secretmenu_vintemill pad_choose_script = score_dks_vinte_mill 
	make_text_menu_item text = "--------" Id = id_secretmenu_points_nada pad_choose_script = semlink not_focusable = not_focusable 
	make_text_menu_item text = "666 pontos" Id = id_pontos_meia_meia_mill pad_choose_script = score_dks_meia_meia_meia 
	make_text_menu_item text = "666.666 pontos" Id = id_meiameiameia_pontos pad_choose_script = score_dks_meia_mill 
	make_text_menu_item text = "666.666.666 pontos" Id = id_meiameiameia_pontos_froreu pad_choose_script = score_dks_meia_mill_milhoes 
	make_text_menu_item text = "\\c2Ok, voltar ao jogo" Id = id_secretpontos_pronto pad_choose_script = exit_pause_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT score_dks_um_mill 
	Skater : SetTrickName "\\c2Viado filho da puta" 
	Skater : SetTrickScore 1000000 
	Skater : Display 
ENDSCRIPT

SCRIPT score_dks_cimco_mill 
	Skater : SetTrickName "\\c2NO\\c8 OO\\ cl 000OO \\c4 OB!" 
	Skater : SetTrickScore 5000000 
	Skater : Display 
ENDSCRIPT

SCRIPT score_dks_dez_mill 
	Skater : SetTrickName "\\c8Ladrao de merda" 
	Skater : SetTrickScore 10000000 
	Skater : Display 
ENDSCRIPT

SCRIPT score_dks_vinte_mill 
	Skater : SetTrickName "\\c2Seu \\c3noob \\c4de merda!" 
	Skater : SetTrickScore 20000000 
	Skater : Display 
ENDSCRIPT

SCRIPT score_dks_meia_meia_meia 
	Skater : SetTrickName "666 from reu" 
	Skater : SetTrickScore 666 
	Skater : Display 
ENDSCRIPT

SCRIPT score_dks_meia_mill 
	Skater : SetTrickName "OMG! demO! OMG 666" 
	Skater : SetTrickScore 666666 
	Skater : Display 
ENDSCRIPT

SCRIPT score_dks_meia_mill_milhoes 
	Skater : SetTrickName "OMG! demO! FUDEOOO MO\xC7ADA OMG 666" 
	Skater : SetTrickScore 666666666 
	Skater : Display 
ENDSCRIPT

SCRIPT create_ajuda_dks_menu 
	hide_current_goal 
	make_new_themed_sub_menu title = "COMANDOS:        " 
	create_helper_text { helper_text_elements = [ { text = "\\c2Aperte \\bm para ir a proxima pagina." } 
			{ text = " " } 
			{ text = " " } 
		] 
	} 
	SetScreenElementProps { Id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = exit_pause_menu } } 
		] 
	} 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_text_sub_menu_item text = "\\c3.menu\\c0 = Menu do DkS MoD." Id = id_texto_ajuda_dks_doze pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.marcar\\c0 = Marca um restart." Id = id_texto_ajuda_dks_treze pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.voltar\\c0 = Volta ao restart." Id = id_texto_ajuda_dks_quatorze pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.obs\\c0 = Inicia o modo observer." Id = id_texto_ajuda_dks_quinze pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.obs.sair\\c0 = Sai do modo observer." Id = id_texto_ajuda_dks_dezseis pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.taunts\\c0 = Abre o editor de taunts" Id = id_texto_ajuda_dks_dezsete pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.nobounds\\c0 = ON/OFF do No Bounds." Id = id_texto_ajuda_dks_dezoito pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.noclip\\c0 = ON/OFF do No Clip." Id = id_texto_ajuda_dks_deznove pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.chat\\c0 = Abre o chat mensagens." Id = id_texto_ajuda_dks_vinte pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.muni\xE7ao\\c0 = Abre o Menu de muni\xE7ao." Id = id_texto_ajuda_dks_vinteum pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "  " Id = id_texto_ajuda_dks_proximo pad_choose_script = create_ajuda_dks_menu_dois 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_ajuda_dks_menu_dois 
	hide_current_goal 
	make_new_themed_sub_menu title = "COMANDOS:        " 
	create_helper_text { helper_text_elements = [ { text = "\\c2Aperte \\bm para voltar a pagina anteior." } 
			{ text = " " } 
			{ text = " " } 
		] 
	} 
	SetScreenElementProps { Id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = exit_pause_menu } } 
		] 
	} 
	make_text_sub_menu_item text = "\\c3.ban\\c0 = Abre o menu de Players." Id = id_texto_ajuda_dks_um pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.tricks\\c0 = Abre o editor de tricks." Id = id_texto_ajuda_dks_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.onoff\\c0 = Abre o menu on off do mod." Id = id_texto_ajuda_dks_tres pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.trapa\xE7a\\c0 = Abre um menu com trapa\xE7as." Id = id_texto_ajuda_dks_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.game\\c0 = Abre o menu iniciar jogo (HOST)." Id = id_texto_ajuda_dks_nove pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.fuck\\c0 = Envia chingamentos no chat." Id = id_texto_ajuda_dks_cimco pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.go\\c0 = Envia um pedido de game no chat." Id = id_texto_ajuda_dks_seis pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.noobs\\c0 = Envia a msg \'Noobs\' no chat." Id = id_texto_ajuda_dks_sete pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.cala\\c0 = Envia a msg \'cala boca\' no chat." Id = id_texto_ajuda_dks_oito pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.carros\\c0 = Abre o menu de veiculos." Id = id_texto_ajuda_dks_carros pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "\\c3.tempo\\c0 = Abre o menu de tempo do dia." Id = id_texto_ajuda_dks_tempo pad_choose_script = semlink not_focusable = not_focusable 
	make_text_sub_menu_item text = "     " Id = id_texto_ajuda_dks_voltar pad_choose_script = create_ajuda_dks_menu 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_veiuculo_menu_dksmod 
	hide_current_goal 
	make_new_roundbar_menu title = "Menu de Veiculos" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Desligar Veiculo" Id = id_item_desligar_carromenu pad_choose_script = desligar_veiculo 
	make_theme_menu_item text = "Ford Crown Victoria (Policia)" Id = id_item_policia_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = PoliceCarSetup } 
	make_theme_menu_item text = "Chevrolet Impala" Id = id_item_chevyimpala_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = ImpalaCarSetup } 
	make_theme_menu_item text = "Chevrolet El Camino" Id = id_item_camino_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = ElCaminoCarSetup } 
	make_theme_menu_item text = "Limosine" Id = id_item_limo_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = LimoCarSetup } 
	make_theme_menu_item text = "Pontiac Trans AM" Id = id_item_tramsam_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = TransCarSetup } 
	make_theme_menu_item text = "Mitsubishi Lancer Evo X" Id = id_item_custom_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = CustomCarSetup } 
	make_theme_menu_item text = "Lada Laika" Id = id_item_lada_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = LadaCarSetup } 
	make_theme_menu_item text = "Dirig\xEDvel" Id = id_item_blimp_carromenu pad_choose_script = ligar_veiculo pad_choose_params = { VehicleSetup = BlimpSetup } 
	make_theme_menu_item text = "Voltar" Id = id_item_voltar_carromenu pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT desligar_veiculo 
	exit_pause_menu 
	Skater : GetCameraId 
	IF NOT GameIsPaused 
		<CameraId> : UnPause 
	ENDIF 
	SetActiveCamera Id = <CameraId> 
	PlayerVehicle : Die 
	PlayerVehicleCamera : Die 
	Skater : UnsetDriving 
	Skater : ReturnBoardToSkater 
	Skater : ResetRigidBodyCollisionRadiusBoost 
	GoalManager_HideAllGoalPeds 0 
	change driving_parked_car = 0 
	MakeSkaterGoto SkaterInit 
ENDSCRIPT

SCRIPT ligar_veiculo 
	desligar_veiculo 
	ToggleUserControlledVehicleMode VehicleSetup = <VehicleSetup> 
ENDSCRIPT

SCRIPT create_tempo_do_dia 
	hide_current_goal 
	make_new_roundbar_menu title = "Tempo do dia - DKS Mod 1.2" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2->\\c0 Tempos normais" Id = id_item_normais_tdd pad_choose_script = create_tempos_normais 
	make_theme_menu_item text = "\\c2->\\c0 Outros Tempos" Id = id_item_outros_tdd pad_choose_script = create_outros_tempos 
	make_theme_menu_item text = "Voltar" Id = id_item_voltar_dia_noite pad_choose_script = create_dks_options_menu 
	make_theme_menu_item text = " " Id = id_tema_aviso_espacamentoum pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = " " Id = id_tema_aviso_espacamentodois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2Nota:\\c0 Se voce salvar o jogo" Id = id_tema_aviso_um_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "apos selecionar um tempo," Id = id_tema_aviso_dois_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "ele sera carregado toda vez que" Id = id_tema_aviso_tres_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "voce entrar em um jogo online." Id = id_tema_aviso_quatro_quatro pad_choose_script = semlink not_focusable = not_focusable 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_tempos_normais 
	hide_current_goal 
	make_new_roundbar_menu title = "Tempos Normais" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_tempo_do_dia } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amanhecer" Id = tempo_manha pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_manha } 
	make_theme_menu_item text = "06:00 - 11:00." Id = id_tema_tddnorm_um_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Dia" Id = tempo_dia pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_dia } 
	make_theme_menu_item text = "11:00 - 17:00" Id = id_tema_tddnorm_dois_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Anoitecer" Id = tempo_tarde pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_tarde } 
	make_theme_menu_item text = "17:00 - 20:00" Id = id_tema_tddnorm_tres_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Noite" Id = tempo_noite pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_noite } 
	make_theme_menu_item text = "20:00 - 06:00" Id = id_tema_tddnorm_quatro_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Voltar" Id = id_item_voltar_dia_noite pad_choose_script = create_tempo_do_dia 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_outros_tempos 
	hide_current_goal 
	make_new_roundbar_menu title = "Outros Tempos" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_tempo_do_dia } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Nice Day" Id = tempo_nicemanha pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_nicemanha } 
	make_theme_menu_item text = "Um dia mais bonito." Id = id_tema_tdd_um_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Happy Gay Day" Id = tempo_gayday pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_gayday } 
	make_theme_menu_item text = "Um dia mais \\c7fabuloso\\c0!" Id = id_tema_tdd_dois_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Orange Sky" Id = tempo_orangeday pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_orangeday } 
	make_theme_menu_item text = "Um dia mais \\cblaranja\\c0." Id = id_tema_tdd_tres_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Apocalypse" Id = tempo_devilday pad_choose_script = mudar_o_tempo pad_choose_params = { tempo_devilday } 
	make_theme_menu_item text = "Um dia mais \\c2satanico\\c0!" Id = id_tema_tdd_quatro_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Voltar" Id = id_tema_tdd_outros_voltar pad_choose_script = create_tempo_do_dia 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT mudar_o_tempo 
	IF GotParam tempo_dia 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_DIA 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_gayday 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_GAYDAY 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_nicemanha 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_NICEMANHA 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_manha 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_MANHA 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_tarde 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_TARDE 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_orangeday 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_ORANGEDAY 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_noite 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_NOITE 
		load_mudar_o_tempo 
	ENDIF 
	IF GotParam tempo_devilday 
		desmarcar_flags_do_tempo_do_dia 
		Wait 4 gameframe 
		SetGlobalFlag flag = TEMPODODIA_DEVILDAY 
		load_mudar_o_tempo 
	ENDIF 
ENDSCRIPT

SCRIPT desmarcar_flags_do_tempo_do_dia 
	UnsetGlobalFlag flag = TEMPODODIA_DEVILDAY 
	UnsetGlobalFlag flag = TEMPODODIA_NOITE 
	UnsetGlobalFlag flag = TEMPODODIA_ORANGEDAY 
	UnsetGlobalFlag flag = TEMPODODIA_TARDE 
	UnsetGlobalFlag flag = TEMPODODIA_MANHA 
	UnsetGlobalFlag flag = TEMPODODIA_NICEMANHA 
	UnsetGlobalFlag flag = TEMPODODIA_GAYDAY 
	UnsetGlobalFlag flag = TEMPODODIA_DIA 
ENDSCRIPT

SCRIPT load_mudar_o_tempo 
	IF GetGlobalFlag flag = TEMPODODIA_DIA 
		change lev_red = 128 
		change lev_green = 128 
		change lev_blue = 128 
		change sky_red = 128 
		change sky_green = 128 
		change sky_blue = 128 
		SetLightAmbientColor r = 50 g = 50 b = 50 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.25999999046 
		ApplyChangeGamma color = blue change = 0.25999999046 
		ApplyChangeGamma color = green change = 0.25999999046 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_GAYDAY 
		change lev_red = 234 
		change lev_green = 221 
		change lev_blue = 216 
		change sky_red = 255 
		change sky_green = 42 
		change sky_blue = 100 
		SetLightAmbientColor r = 110 g = 110 b = 120 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.09000000358 
		ApplyChangeGamma color = blue change = 0.09000000358 
		ApplyChangeGamma color = green change = 0.09000000358 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_NICEMANHA 
		change lev_red = 197 
		change lev_green = 210 
		change lev_blue = 239 
		change sky_red = 194 
		change sky_green = 183 
		change sky_blue = 255 
		SetLightAmbientColor r = 110 g = 110 b = 120 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.05999999866 
		ApplyChangeGamma color = blue change = 0.05999999866 
		ApplyChangeGamma color = green change = 0.05999999866 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_MANHA 
		change lev_red = 64 
		change lev_green = 77 
		change lev_blue = 81 
		change sky_red = 160 
		change sky_green = 160 
		change sky_blue = 160 
		SetLightAmbientColor r = 50 g = 50 b = 50 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.18000000715 
		ApplyChangeGamma color = blue change = 0.18000000715 
		ApplyChangeGamma color = green change = 0.18000000715 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_TARDE 
		change lev_red = 100 
		change lev_green = 95 
		change lev_blue = 74 
		change sky_red = 76 
		change sky_green = 66 
		change sky_blue = 50 
		SetLightAmbientColor r = 41 g = 42 b = 45 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.20999999344 
		ApplyChangeGamma color = blue change = 0.20999999344 
		ApplyChangeGamma color = green change = 0.20999999344 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_ORANGEDAY 
		change lev_red = 115 
		change lev_green = 135 
		change lev_blue = 100 
		change sky_red = 225 
		change sky_green = 65 
		change sky_blue = 10 
		SetLightAmbientColor r = 50 g = 50 b = 50 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.15999999642 
		ApplyChangeGamma color = blue change = 0.15999999642 
		ApplyChangeGamma color = green change = 0.15999999642 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_NOITE 
		change lev_red = 46 
		change lev_green = 59 
		change lev_blue = 69 
		change sky_red = 18 
		change sky_green = 16 
		change sky_blue = 18 
		SetLightAmbientColor r = 18 g = 16 b = 18 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.20999999344 
		ApplyChangeGamma color = blue change = 0.20999999344 
		ApplyChangeGamma color = green change = 0.20999999344 
	ENDIF 
	IF GetGlobalFlag flag = TEMPODODIA_DEVILDAY 
		change lev_red = 74 
		change lev_green = 72 
		change lev_blue = 75 
		change sky_red = 105 
		change sky_green = 5 
		change sky_blue = 6 
		SetLightAmbientColor r = 45 g = 38 b = 50 
		ApplyChangeGamma color = red change = -0.50000000000 
		ApplyChangeGamma color = blue change = -0.50000000000 
		ApplyChangeGamma color = green change = -0.50000000000 
		ApplyChangeGamma color = red change = 0.18999999762 
		ApplyChangeGamma color = blue change = 0.18999999762 
		ApplyChangeGamma color = green change = 0.18999999762 
	ENDIF 
	dia_e_noite_ferramenta 
ENDSCRIPT

SCRIPT autoload_mudar_o_tempo 
	IF InNetGame 
		IF GetGlobalFlag flag = TEMPODODIA_DIA 
			change lev_red = 128 
			change lev_green = 128 
			change lev_blue = 128 
			change sky_red = 128 
			change sky_green = 128 
			change sky_blue = 128 
			SetLightAmbientColor r = 50 g = 50 b = 50 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_GAYDAY 
			change lev_red = 234 
			change lev_green = 221 
			change lev_blue = 216 
			change sky_red = 255 
			change sky_green = 42 
			change sky_blue = 100 
			SetLightAmbientColor r = 110 g = 110 b = 120 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_NICEMANHA 
			change lev_red = 197 
			change lev_green = 210 
			change lev_blue = 239 
			change sky_red = 194 
			change sky_green = 183 
			change sky_blue = 255 
			SetLightAmbientColor r = 110 g = 110 b = 120 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_MANHA 
			change lev_red = 64 
			change lev_green = 77 
			change lev_blue = 81 
			change sky_red = 160 
			change sky_green = 160 
			change sky_blue = 160 
			SetLightAmbientColor r = 50 g = 50 b = 50 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_TARDE 
			change lev_red = 100 
			change lev_green = 95 
			change lev_blue = 74 
			change sky_red = 76 
			change sky_green = 66 
			change sky_blue = 50 
			SetLightAmbientColor r = 41 g = 42 b = 45 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_ORANGEDAY 
			change lev_red = 115 
			change lev_green = 135 
			change lev_blue = 100 
			change sky_red = 225 
			change sky_green = 65 
			change sky_blue = 10 
			SetLightAmbientColor r = 50 g = 50 b = 50 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_NOITE 
			change lev_red = 46 
			change lev_green = 59 
			change lev_blue = 69 
			change sky_red = 18 
			change sky_green = 16 
			change sky_blue = 18 
			SetLightAmbientColor r = 18 g = 16 b = 18 
			dia_e_noite_ferramenta 
		ENDIF 
		IF GetGlobalFlag flag = TEMPODODIA_DEVILDAY 
			change lev_red = 74 
			change lev_green = 72 
			change lev_blue = 75 
			change sky_red = 105 
			change sky_green = 5 
			change sky_blue = 6 
			SetLightAmbientColor r = 45 g = 38 b = 50 
			dia_e_noite_ferramenta 
		ENDIF 
	ENDIF 
ENDSCRIPT


