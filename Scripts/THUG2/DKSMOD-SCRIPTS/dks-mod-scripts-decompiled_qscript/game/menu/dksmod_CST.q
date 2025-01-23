
SCRIPT create_temas_dksmod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2CRIE SEU TEMA" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Fa\xE7a seu propio tema" id = id_item_criarumtema_dksmod pad_choose_script = criar_seu_tema_menus 
	make_theme_menu_item text = "Temas prontos" id = id_item_temas_dksmod pad_choose_script = create_temas_do_dksmod_menu_um 
	make_theme_menu_item text = "  " id = id_texto_um_crieumtemanadausj pad_choose_script = semlink not_focusable = not_focusable 
	IF NOT InNetGame 
		make_theme_menu_item text = "Salvar tema" id = id_item_salvar_tema_normal pad_choose_script = launch_pause_menu_save_game_sequence 
	ENDIF 
	IF InNetGame 
		make_theme_menu_item text = "Salvar tema" id = id_item_salvar_tema_online pad_choose_script = no_salve_temas_error_dksmod_menu 
	ENDIF 
	make_theme_menu_item text = "  " id = id_texto_um_crieumtema pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2Crie Seu Tema v1.2" id = id_texto_dois_crieumtema pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Exclusivo do dks\'mod 1.2 @ www.dks-clan.tk" id = id_texto_tres_crieumtema pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "by dark\'dks e pedro\'dks" id = id_texto_quatro_crieumtema pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_cimco_crieumtema pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Voltar" id = id_item_voltarcriarseutamdks pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT no_create_temas_dksmod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2CRIE SEU TEMA: ERRO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2ERRO:\\c0 JOGO EM ANDAMENTO!            " id = id_texto_notema_nove pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_notema_dez pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2NOTA:\\c0 Voce NAO pode criar um tema    " id = id_texto_notema_um pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "com um jogo em progresso...           " id = id_texto_notema_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Acabe este jogo primeiro e volte apenas " id = id_texto_notema_tres pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "quando estiver no modo \'free skate\'.    " id = id_texto_notema_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "" id = id_texto_notema_cimco pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "          \\c2Crie seu tema 1.2               " id = id_texto_notema_seis pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "              WWW.DKS-CLAN.TK               " id = id_texto_notema_sete pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_notema_doze pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_notema_onze pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "              OK                 " id = id_texto_notema_voltar pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT no_salve_temas_error_dksmod_menu 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c2CRIE SEU TEMA: ERRO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_dks_options_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2ERRO:\\c0 MODO ONLINE!            " id = id_texto_nosalve_nove pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_nosalve_dez pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2NOTA:\\c0 Voce NAO pode salvar seu jogo    " id = id_texto_nosalve_um pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "enquanto estiver online.             " id = id_texto_nosalve_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Saia do modo online, entre em op\xE7oes no " id = id_texto_nosalve_tres pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "menu principal, e salve o seu jogo la,   " id = id_texto_nosalve_quatro pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "ou em outro modo de jogo              " id = id_texto_nosalve_cimco pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "          \\c2Crie seu tema 1.2               " id = id_texto_nosalve_seis pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "              WWW.DKS-CLAN.TK               " id = id_texto_nosalve_sete pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_nosalve_doze pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_texto_nosalve_onze pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "              OK                 " id = id_texto_nosalve_voltar pad_choose_script = create_dks_options_menu 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT criar_seu_tema_menus 
	desmarcar_todas_flags_do_cst 
	Wait 2 gameframe 
	create_criar_tema_parte_barra_eq_cores_um 
ENDSCRIPT

SCRIPT create_criar_tema_parte_barra_eq_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "BARRA DE EQUILIBRIO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor da barra de equilibrio." id = id_info_descri_barra_eq pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_parteum_preto pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_parteum_branco pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_parteum_cinzaclaro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_parteum_cinzaescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_parteum_vermelhoclaro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_parteum_vermelhoescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_parteum_azulclaro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_parteum_azulescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_parteum_verdeclaro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_parteum_verdeescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_parteum_proximo pad_choose_script = create_criar_tema_parte_barra_eq_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_barra_eq_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "BARRA DE EQUILIBRIO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_parteum_amareloclaro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_parteum_amareloescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_parteum_laranjaclaro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_parteum_laranjaescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_parteum_rosa pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_parteum_roxo pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_parteum_marrom pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_parteum_ciano pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_parteum_red_bemescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_parteum_blue_bemescuro pad_choose_script = barra_de_equilibrio_mudar pad_choose_params = { b_e_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_parteum_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_parteum_anterior pad_choose_script = create_criar_tema_parte_barra_eq_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT barra_de_equilibrio_mudar 
	IF GotParam b_e_preto 
		SetGlobalFlag flag = BARRAEQ_PRETO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_branco 
		SetGlobalFlag flag = BARRAEQ_BRANCO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_cinzaclaro 
		SetGlobalFlag flag = BARRAEQ_CINZACLARO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_cinzaescuro 
		SetGlobalFlag flag = BARRAEQ_CINZAESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_vermelhoclaro 
		SetGlobalFlag flag = BARRAEQ_VERMELHOCLARO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_vermelhoescuro 
		SetGlobalFlag flag = BARRAEQ_VERMELHOESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_azulclaro 
		SetGlobalFlag flag = BARRAEQ_AZULCLARO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_azulescuro 
		SetGlobalFlag flag = BARRAEQ_AZULESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_verdeclaro 
		SetGlobalFlag flag = BARRAEQ_VERDECLARO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_verdeescuro 
		SetGlobalFlag flag = BARRAEQ_VERDEESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_amareloclaro 
		SetGlobalFlag flag = BARRAEQ_AMARELOCLARO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_amareloescuro 
		SetGlobalFlag flag = BARRAEQ_AMARELOESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_laranjaclaro 
		SetGlobalFlag flag = BARRAEQ_LARANJACLARO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_laranjaescuro 
		SetGlobalFlag flag = BARRAEQ_LARANJAESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_rosa 
		SetGlobalFlag flag = BARRAEQ_ROSA 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_roxo 
		SetGlobalFlag flag = BARRAEQ_ROXO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_marrom 
		SetGlobalFlag flag = BARRAEQ_MARROM 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_ciano 
		SetGlobalFlag flag = BARRAEQ_CIANO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_vermelhomuitoescuro 
		SetGlobalFlag flag = BARRAEQ_VERMELHOMUITOESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
	IF GotParam b_e_azulmuitoescuro 
		SetGlobalFlag flag = BARRAEQ_AZULMUITOESCURO 
		create_criar_tema_parte_ponteiro_eq_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_ponteiro_eq_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "PONTEIRO DE EQUILIBRIO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor do ponteiro de equilibrio" id = id_info_descri_ponteiro_eq pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_partetres_preto pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_partetres_branco pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_partetres_cinzaclaro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_partetres_cinzaescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_partetres_vermelhoclaro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_partetres_vermelhoescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_partetres_azulclaro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_partetres_azulescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_partetres_verdeclaro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_partetres_verdeescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_partetres_proximo pad_choose_script = create_criar_tema_parte_ponteiro_eq_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_ponteiro_eq_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "PONTEIRO DE EQUILIBRIO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_partetres_amareloclaro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_partetres_amareloescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_partetres_laranjaclaro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_partetres_laranjaescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_partetres_rosa pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_partetres_roxo pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_partetres_marrom pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_partetres_ciano pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_partetres_red_bemescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_partetres_blue_bemescuro pad_choose_script = ponteiro_eq_mudar pad_choose_params = { p_e_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_partetres_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_partetres_anterior pad_choose_script = create_criar_tema_parte_ponteiro_eq_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT ponteiro_eq_mudar 
	IF GotParam p_e_preto 
		SetGlobalFlag flag = SETABARRAEQ_PRETO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_branco 
		SetGlobalFlag flag = SETABARRAEQ_BRANCO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_cinzaclaro 
		SetGlobalFlag flag = SETABARRAEQ_CINZACLARO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_cinzaescuro 
		SetGlobalFlag flag = SETABARRAEQ_CINZAESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_vermelhoclaro 
		SetGlobalFlag flag = SETABARRAEQ_VERMELHOCLARO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_vermelhoescuro 
		SetGlobalFlag flag = SETABARRAEQ_VERMELHOESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_azulclaro 
		SetGlobalFlag flag = SETABARRAEQ_AZULCLARO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_azulescuro 
		SetGlobalFlag flag = SETABARRAEQ_AZULESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_verdeclaro 
		SetGlobalFlag flag = SETABARRAEQ_VERDECLARO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_verdeescuro 
		SetGlobalFlag flag = SETABARRAEQ_VERDEESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_amareloclaro 
		SetGlobalFlag flag = SETABARRAEQ_AMARELOCLARO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_amareloescuro 
		SetGlobalFlag flag = SETABARRAEQ_AMARELOESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_laranjaclaro 
		SetGlobalFlag flag = SETABARRAEQ_LARANJACLARO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_laranjaescuro 
		SetGlobalFlag flag = SETABARRAEQ_LARANJAESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_rosa 
		SetGlobalFlag flag = SETABARRAEQ_ROSA 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_roxo 
		SetGlobalFlag flag = SETABARRAEQ_ROXO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_marrom 
		SetGlobalFlag flag = SETABARRAEQ_MARROM 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_ciano 
		SetGlobalFlag flag = SETABARRAEQ_CIANO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_vermelhomuitoescuro 
		SetGlobalFlag flag = SETABARRAEQ_VERMELHOMUITOESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
	IF GotParam p_e_azulmuitoescuro 
		SetGlobalFlag flag = SETABARRAEQ_AZULMUITOESCURO 
		create_criar_tema_parte_cor_hud_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_cor_hud_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "COR DO HUD" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor do hud." id = id_info_descri_cor_hud pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_partecimco_preto pad_choose_script = cor_hud_mudar pad_choose_params = { h_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_partecimco_branco pad_choose_script = cor_hud_mudar pad_choose_params = { h_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_partecimco_cinzaclaro pad_choose_script = cor_hud_mudar pad_choose_params = { h_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_partecimco_cinzaescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_partecimco_vermelhoclaro pad_choose_script = cor_hud_mudar pad_choose_params = { h_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_partecimco_vermelhoescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_partecimco_azulclaro pad_choose_script = cor_hud_mudar pad_choose_params = { h_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_partecimco_azulescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_partecimco_verdeclaro pad_choose_script = cor_hud_mudar pad_choose_params = { h_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_partecimco_verdeescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_partecimco_proximo pad_choose_script = create_criar_tema_parte_cor_hud_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_cor_hud_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "COR DO HUD" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_partecimco_amareloclaro pad_choose_script = cor_hud_mudar pad_choose_params = { h_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_partecimco_amareloescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_partecimco_laranjaclaro pad_choose_script = cor_hud_mudar pad_choose_params = { h_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_partecimco_laranjaescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_partecimco_rosa pad_choose_script = cor_hud_mudar pad_choose_params = { h_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_partecimco_roxo pad_choose_script = cor_hud_mudar pad_choose_params = { h_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_partecimco_marrom pad_choose_script = cor_hud_mudar pad_choose_params = { h_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_partecimco_ciano pad_choose_script = cor_hud_mudar pad_choose_params = { h_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_partecimco_red_bemescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_partecimco_blue_bemescuro pad_choose_script = cor_hud_mudar pad_choose_params = { h_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_partecimco_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_partecimco_anterior pad_choose_script = create_criar_tema_parte_cor_hud_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT cor_hud_mudar 
	IF GotParam h_preto 
		SetGlobalFlag flag = HUD_PRETO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_branco 
		SetGlobalFlag flag = HUD_BRANCO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_cinzaclaro 
		SetGlobalFlag flag = HUD_CINZACLARO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_cinzaescuro 
		SetGlobalFlag flag = HUD_CINZAESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_vermelhoclaro 
		SetGlobalFlag flag = HUD_VERMELHOCLARO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_vermelhoescuro 
		SetGlobalFlag flag = HUD_VERMELHOESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_azulclaro 
		SetGlobalFlag flag = HUD_AZULCLARO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_azulescuro 
		SetGlobalFlag flag = HUD_AZULESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_verdeclaro 
		SetGlobalFlag flag = HUD_VERDECLARO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_verdeescuro 
		SetGlobalFlag flag = HUD_VERDEESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_amareloclaro 
		SetGlobalFlag flag = HUD_AMARELOCLARO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_amareloescuro 
		SetGlobalFlag flag = HUD_AMARELOESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_laranjaclaro 
		SetGlobalFlag flag = HUD_LARANJACLARO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_laranjaescuro 
		SetGlobalFlag flag = HUD_LARANJAESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_rosa 
		SetGlobalFlag flag = HUD_ROSA 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_roxo 
		SetGlobalFlag flag = HUD_ROXO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_marrom 
		SetGlobalFlag flag = HUD_MARROM 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_ciano 
		SetGlobalFlag flag = HUD_CIANO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_vermelhomuitoescuro 
		SetGlobalFlag flag = HUD_VERMELHOMUITOESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
	IF GotParam h_azulmuitoescuro 
		SetGlobalFlag flag = HUD_AZULMUITOESCURO 
		create_criar_tema_parte_estrela_hud_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_estrela_hud_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "COR DA ESTRElA DO HUD" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor da estrela/hud." id = id_info_descri_estrela_hud pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_partenove_preto pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_partenove_branco pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_partenove_cinzaclaro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_partenove_cinzaescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_partenove_vermelhoclaro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_partenove_vermelhoescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_partenove_azulclaro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_partenove_azulescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_partenove_verdeclaro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_partenove_verdeescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_partenove_proximo pad_choose_script = create_criar_tema_parte_estrela_hud_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_estrela_hud_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "COR DA ESTRELA DO HUD" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_partenove_amareloclaro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_partenove_amareloescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_partenove_laranjaclaro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_partenove_laranjaescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_partenove_rosa pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_partenove_roxo pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_partenove_marrom pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_partenove_ciano pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_partenove_red_bemescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_partenove_blue_bemescuro pad_choose_script = cor_estrela_hud_mudar pad_choose_params = { e_h_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_partenove_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_partenove_anterior pad_choose_script = create_criar_tema_parte_estrela_hud_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT cor_estrela_hud_mudar 
	IF GotParam e_h_preto 
		SetGlobalFlag flag = ESTRELAHUD_PRETO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_branco 
		SetGlobalFlag flag = ESTRELAHUD_BRANCO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_cinzaclaro 
		SetGlobalFlag flag = ESTRELAHUD_CINZACLARO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_cinzaescuro 
		SetGlobalFlag flag = ESTRELAHUD_CINZAESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_vermelhoclaro 
		SetGlobalFlag flag = ESTRELAHUD_VERMELHOCLARO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_vermelhoescuro 
		SetGlobalFlag flag = ESTRELAHUD_VERMELHOESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_azulclaro 
		SetGlobalFlag flag = ESTRELAHUD_AZULCLARO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_azulescuro 
		SetGlobalFlag flag = ESTRELAHUD_AZULESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_verdeclaro 
		SetGlobalFlag flag = ESTRELAHUD_VERDECLARO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_verdeescuro 
		SetGlobalFlag flag = ESTRELAHUD_VERDEESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_amareloclaro 
		SetGlobalFlag flag = ESTRELAHUD_AMARELOCLARO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_amareloescuro 
		SetGlobalFlag flag = ESTRELAHUD_AMARELOESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_laranjaclaro 
		SetGlobalFlag flag = ESTRELAHUD_LARANJACLARO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_laranjaescuro 
		SetGlobalFlag flag = ESTRELAHUD_LARANJAESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_rosa 
		SetGlobalFlag flag = ESTRELAHUD_ROSA 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_roxo 
		SetGlobalFlag flag = ESTRELAHUD_ROXO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_marrom 
		SetGlobalFlag flag = ESTRELAHUD_MARROM 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_ciano 
		SetGlobalFlag flag = ESTRELAHUD_CIANO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_vermelhomuitoescuro 
		SetGlobalFlag flag = ESTRELAHUD_VERMELHOMUITOESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
	IF GotParam e_h_azulmuitoescuro 
		SetGlobalFlag flag = ESTRELAHUD_AZULMUITOESCURO 
		create_criar_tema_parte_barra_especial_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_barra_especial_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "BARRA DE ESPECIAL DO HUD" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor da barra de especial." id = id_info_descri_especial_hud pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_partequatro_preto pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_partequatro_branco pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_partequatro_cinzaclaro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_partequatro_cinzaescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_partequatro_vermelhoclaro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_partequatro_vermelhoescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_partequatro_azulclaro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_partequatro_azulescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_partequatro_verdeclaro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_partequatro_verdeescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_partequatro_proximo pad_choose_script = create_criar_tema_parte_barra_especial_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_barra_especial_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "BARRA DE ESPECIAL DO HUD" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_partequatro_amareloclaro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_partequatro_amareloescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_partequatro_laranjaclaro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_partequatro_laranjaescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_partequatro_rosa pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_partequatro_roxo pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_partequatro_marrom pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_partequatro_ciano pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_partequatro_red_bemescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_partequatro_blue_bemescuro pad_choose_script = barra_especial_mudar pad_choose_params = { b_e_h_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_partequatro_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_partequatro_anterior pad_choose_script = create_criar_tema_parte_barra_especial_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT barra_especial_mudar 
	IF GotParam b_e_h_preto 
		SetGlobalFlag flag = BARRAESPECIAL_PRETO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_branco 
		SetGlobalFlag flag = BARRAESPECIAL_BRANCO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_cinzaclaro 
		SetGlobalFlag flag = BARRAESPECIAL_CINZACLARO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_cinzaescuro 
		SetGlobalFlag flag = BARRAESPECIAL_CINZAESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_vermelhoclaro 
		SetGlobalFlag flag = BARRAESPECIAL_VERMELHOCLARO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_vermelhoescuro 
		SetGlobalFlag flag = BARRAESPECIAL_VERMELHOESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_azulclaro 
		SetGlobalFlag flag = BARRAESPECIAL_AZULCLARO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_azulescuro 
		SetGlobalFlag flag = BARRAESPECIAL_AZULESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_verdeclaro 
		SetGlobalFlag flag = BARRAESPECIAL_VERDECLARO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_verdeescuro 
		SetGlobalFlag flag = BARRAESPECIAL_VERDEESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_amareloclaro 
		SetGlobalFlag flag = BARRAESPECIAL_AMARELOCLARO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_amareloescuro 
		SetGlobalFlag flag = BARRAESPECIAL_AMARELOESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_laranjaclaro 
		SetGlobalFlag flag = BARRAESPECIAL_LARANJACLARO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_laranjaescuro 
		SetGlobalFlag flag = BARRAESPECIAL_LARANJAESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_rosa 
		SetGlobalFlag flag = BARRAESPECIAL_ROSA 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_roxo 
		SetGlobalFlag flag = BARRAESPECIAL_ROXO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_marrom 
		SetGlobalFlag flag = BARRAESPECIAL_MARROM 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_ciano 
		SetGlobalFlag flag = BARRAESPECIAL_CIANO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_vermelhomuitoescuro 
		SetGlobalFlag flag = BARRAESPECIAL_VERMELHOMUITOESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
	IF GotParam b_e_h_azulmuitoescuro 
		SetGlobalFlag flag = BARRAESPECIAL_AZULMUITOESCURO 
		create_criar_tema_parte_texto_manobras_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_texto_manobras_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "NOME DAS MANOBRAS" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor do texto." id = id_info_descri_nome_manobras pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_parte_manobras_texto_preto pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_parte_manobras_texto_branco pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_parte_manobras_texto_cinzaclaro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_parte_manobras_texto_cinzaescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_parte_manobras_texto_vermelhoclaro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_parte_manobras_texto_vermelhoescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_parte_manobras_texto_azulclaro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_parte_manobras_texto_azulescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_parte_manobras_texto_verdeclaro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_parte_manobras_texto_verdeescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_parte_manobras_texto_proximo pad_choose_script = create_criar_tema_parte_texto_manobras_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_texto_manobras_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "NOME DAS MANOBRAS" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_parte_manobras_texto_amareloclaro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_parte_manobras_texto_amareloescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_parte_manobras_texto_laranjaclaro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_parte_manobras_texto_laranjaescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_parte_manobras_texto_rosa pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_parte_manobras_texto_roxo pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_parte_manobras_texto_marrom pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_parte_manobras_texto_ciano pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_parte_manobras_texto_red_bemescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_parte_manobras_texto_blue_bemescuro pad_choose_script = manobras_texto_mudar pad_choose_params = { n_m_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_parte_manobras_texto_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_parte_manobras_texto_anterior pad_choose_script = create_criar_tema_parte_texto_manobras_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT manobras_texto_mudar 
	IF GotParam n_m_preto 
		SetGlobalFlag flag = NOMEMANOBRAS_PRETO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_branco 
		SetGlobalFlag flag = NOMEMANOBRAS_BRANCO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_cinzaclaro 
		SetGlobalFlag flag = NOMEMANOBRAS_CINZACLARO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_cinzaescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_CINZAESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_vermelhoclaro 
		SetGlobalFlag flag = NOMEMANOBRAS_VERMELHOCLARO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_vermelhoescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_VERMELHOESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_azulclaro 
		SetGlobalFlag flag = NOMEMANOBRAS_AZULCLARO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_azulescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_AZULESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_verdeclaro 
		SetGlobalFlag flag = NOMEMANOBRAS_VERDECLARO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_verdeescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_VERDEESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_amareloclaro 
		SetGlobalFlag flag = NOMEMANOBRAS_AMARELOCLARO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_amareloescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_AMARELOESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_laranjaclaro 
		SetGlobalFlag flag = NOMEMANOBRAS_LARANJACLARO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_laranjaescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_LARANJAESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_rosa 
		SetGlobalFlag flag = NOMEMANOBRAS_ROSA 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_roxo 
		SetGlobalFlag flag = NOMEMANOBRAS_ROXO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_marrom 
		SetGlobalFlag flag = NOMEMANOBRAS_MARROM 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_ciano 
		SetGlobalFlag flag = NOMEMANOBRAS_CIANO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_vermelhomuitoescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_VERMELHOMUITOESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
	IF GotParam n_m_azulmuitoescuro 
		SetGlobalFlag flag = NOMEMANOBRAS_AZULMUITOESCURO 
		create_criar_tema_parte_background_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_background_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "BACKGROUND DOS MENUS" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda o plano de fundo do jogo." id = id_info_descri_background pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_partesete_preto pad_choose_script = background_mudar pad_choose_params = { bk_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_partesete_branco pad_choose_script = background_mudar pad_choose_params = { bk_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_partesete_cinzaclaro pad_choose_script = background_mudar pad_choose_params = { bk_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_partesete_cinzaescuro pad_choose_script = background_mudar pad_choose_params = { bk_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_partesete_vermelhoclaro pad_choose_script = background_mudar pad_choose_params = { bk_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_partesete_vermelhoescuro pad_choose_script = background_mudar pad_choose_params = { bk_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_partesete_azulclaro pad_choose_script = background_mudar pad_choose_params = { bk_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_partesete_azulescuro pad_choose_script = background_mudar pad_choose_params = { bk_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_partesete_verdeclaro pad_choose_script = background_mudar pad_choose_params = { bk_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_partesete_verdeescuro pad_choose_script = background_mudar pad_choose_params = { bk_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_partesete_proximo pad_choose_script = create_criar_tema_parte_background_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_background_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "BACKGROUND DOS MENUS" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_partesete_amareloclaro pad_choose_script = background_mudar pad_choose_params = { bk_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_partesete_amareloescuro pad_choose_script = background_mudar pad_choose_params = { bk_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_partesete_laranjaclaro pad_choose_script = background_mudar pad_choose_params = { bk_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_partesete_laranjaescuro pad_choose_script = background_mudar pad_choose_params = { bk_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_partesete_rosa pad_choose_script = background_mudar pad_choose_params = { bk_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_partesete_roxo pad_choose_script = background_mudar pad_choose_params = { bk_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_partesete_marrom pad_choose_script = background_mudar pad_choose_params = { bk_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_partesete_ciano pad_choose_script = background_mudar pad_choose_params = { bk_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_partesete_red_bemescuro pad_choose_script = background_mudar pad_choose_params = { bk_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_partesete_blue_bemescuro pad_choose_script = background_mudar pad_choose_params = { bk_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_partesete_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_partesete_anterior pad_choose_script = create_criar_tema_parte_background_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT background_mudar 
	IF GotParam bk_preto 
		SetGlobalFlag flag = BACKGROUND_PRETO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_branco 
		SetGlobalFlag flag = BACKGROUND_BRANCO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_cinzaclaro 
		SetGlobalFlag flag = BACKGROUND_CINZACLARO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_cinzaescuro 
		SetGlobalFlag flag = BACKGROUND_CINZAESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_vermelhoclaro 
		SetGlobalFlag flag = BACKGROUND_VERMELHOCLARO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_vermelhoescuro 
		SetGlobalFlag flag = BACKGROUND_VERMELHOESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_azulclaro 
		SetGlobalFlag flag = BACKGROUND_AZULCLARO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_azulescuro 
		SetGlobalFlag flag = BACKGROUND_AZULESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_verdeclaro 
		SetGlobalFlag flag = BACKGROUND_VERDECLARO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_verdeescuro 
		SetGlobalFlag flag = BACKGROUND_VERDEESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_amareloclaro 
		SetGlobalFlag flag = BACKGROUND_AMARELOCLARO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_amareloescuro 
		SetGlobalFlag flag = BACKGROUND_AMARELOESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_laranjaclaro 
		SetGlobalFlag flag = BACKGROUND_LARANJACLARO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_laranjaescuro 
		SetGlobalFlag flag = BACKGROUND_LARANJAESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_rosa 
		SetGlobalFlag flag = BACKGROUND_ROSA 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_roxo 
		SetGlobalFlag flag = BACKGROUND_ROXO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_marrom 
		SetGlobalFlag flag = BACKGROUND_MARROM 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_ciano 
		SetGlobalFlag flag = BACKGROUND_CIANO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_vermelhomuitoescuro 
		SetGlobalFlag flag = BACKGROUND_VERMELHOMUITOESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
	IF GotParam bk_azulmuitoescuro 
		SetGlobalFlag flag = BACKGROUND_AZULMUITOESCURO 
		create_criar_tema_parte_caixa_dialogo_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_caixa_dialogo_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "CAIXA DE DIALOGO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor da caixa de dialogo." id = id_info_descri_caixa_dialogo pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_parteoito_preto pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_parteoito_branco pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_parteoito_cinzaclaro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_parteoito_cinzaescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_parteoito_vermelhoclaro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_parteoito_vermelhoescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_parteoito_azulclaro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_parteoito_azulescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_parteoito_verdeclaro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_parteoito_verdeescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_parteoito_proximo pad_choose_script = create_criar_tema_parte_caixa_dialogo_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_caixa_dialogo_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "CAIXA DE DIALOGO" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_parteoito_amareloclaro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_parteoito_amareloescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_parteoito_laranjaclaro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_parteoito_laranjaescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_parteoito_rosa pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_parteoito_roxo pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_parteoito_marrom pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_parteoito_ciano pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_parteoito_red_bemescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { c_x_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_parteoito_blue_bemescuro pad_choose_script = caixa_de_dialogo_mudar pad_choose_params = { ac_x_zulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_parteoito_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_parteoito_anterior pad_choose_script = create_criar_tema_parte_caixa_dialogo_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT caixa_de_dialogo_mudar 
	IF GotParam c_x_preto 
		SetGlobalFlag flag = CAIXADIALOGO_PRETO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_branco 
		SetGlobalFlag flag = CAIXADIALOGO_BRANCO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_cinzaclaro 
		SetGlobalFlag flag = CAIXADIALOGO_CINZACLARO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_cinzaescuro 
		SetGlobalFlag flag = CAIXADIALOGO_CINZAESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_vermelhoclaro 
		SetGlobalFlag flag = CAIXADIALOGO_VERMELHOCLARO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_vermelhoescuro 
		SetGlobalFlag flag = CAIXADIALOGO_VERMELHOESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_azulclaro 
		SetGlobalFlag flag = CAIXADIALOGO_AZULCLARO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_azulescuro 
		SetGlobalFlag flag = CAIXADIALOGO_AZULESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_verdeclaro 
		SetGlobalFlag flag = CAIXADIALOGO_VERDECLARO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_verdeescuro 
		SetGlobalFlag flag = CAIXADIALOGO_VERDEESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_amareloclaro 
		SetGlobalFlag flag = CAIXADIALOGO_AMARELOCLARO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_amareloescuro 
		SetGlobalFlag flag = CAIXADIALOGO_AMARELOESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_laranjaclaro 
		SetGlobalFlag flag = CAIXADIALOGO_LARANJACLARO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_laranjaescuro 
		SetGlobalFlag flag = CAIXADIALOGO_LARANJAESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_rosa 
		SetGlobalFlag flag = CAIXADIALOGO_ROSA 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_roxo 
		SetGlobalFlag flag = CAIXADIALOGO_ROXO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_marrom 
		SetGlobalFlag flag = CAIXADIALOGO_MARROM 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_ciano 
		SetGlobalFlag flag = CAIXADIALOGO_CIANO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_vermelhomuitoescuro 
		SetGlobalFlag flag = CAIXADIALOGO_VERMELHOMUITOESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
	IF GotParam c_x_azulmuitoescuro 
		SetGlobalFlag flag = CAIXADIALOGO_AZULMUITOESCURO 
		create_criar_tema_parte_janelas_menu_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_janelas_menu_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "COR DAS JANELAS DE MENU" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Muda a cor das janelas." id = id_info_descri_janelas_menu pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_parteseis_preto pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_parteseis_branco pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_parteseis_cinzaclaro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_parteseis_cinzaescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_parteseis_vermelhoclaro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_parteseis_vermelhoescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_parteseis_azulclaro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_parteseis_azulescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_parteseis_verdeclaro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_parteseis_verdeescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_parteseis_proximo pad_choose_script = create_criar_tema_parte_janelas_menu_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_janelas_menu_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "COR DAS JANELAS DE MENU" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_parteseis_amareloclaro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_parteseis_amareloescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_parteseis_laranjaclaro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_parteseis_laranjaescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_parteseis_rosa pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_parteseis_roxo pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_parteseis_marrom pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_parteseis_ciano pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_parteseis_red_bemescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_parteseis_blue_bemescuro pad_choose_script = janelas_menu_mudar pad_choose_params = { j_m_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_parteseis_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_parteseis_anterior pad_choose_script = create_criar_tema_parte_janelas_menu_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT janelas_menu_mudar 
	IF GotParam j_m_preto 
		SetGlobalFlag flag = JANELASMENU_PRETO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_branco 
		SetGlobalFlag flag = JANELASMENU_BRANCO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_cinzaclaro 
		SetGlobalFlag flag = JANELASMENU_CINZACLARO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_cinzaescuro 
		SetGlobalFlag flag = JANELASMENU_CINZAESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_vermelhoclaro 
		SetGlobalFlag flag = JANELASMENU_VERMELHOCLARO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_vermelhoescuro 
		SetGlobalFlag flag = JANELASMENU_VERMELHOESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_azulclaro 
		SetGlobalFlag flag = JANELASMENU_AZULCLARO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_azulescuro 
		SetGlobalFlag flag = JANELASMENU_AZULESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_verdeclaro 
		SetGlobalFlag flag = JANELASMENU_VERDECLARO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_verdeescuro 
		SetGlobalFlag flag = JANELASMENU_VERDEESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_amareloclaro 
		SetGlobalFlag flag = JANELASMENU_AMARELOCLARO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_amareloescuro 
		SetGlobalFlag flag = JANELASMENU_AMARELOESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_laranjaclaro 
		SetGlobalFlag flag = JANELASMENU_LARANJACLARO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_laranjaescuro 
		SetGlobalFlag flag = JANELASMENU_LARANJAESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_rosa 
		SetGlobalFlag flag = JANELASMENU_ROSA 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_roxo 
		SetGlobalFlag flag = JANELASMENU_ROXO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_marrom 
		SetGlobalFlag flag = JANELASMENU_MARROM 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_ciano 
		SetGlobalFlag flag = JANELASMENU_CIANO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_vermelhomuitoescuro 
		SetGlobalFlag flag = JANELASMENU_VERMELHOMUITOESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
	IF GotParam j_m_azulmuitoescuro 
		SetGlobalFlag flag = JANELASMENU_AZULMUITOESCURO 
		create_criar_tema_parte_barra_menu_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_parte_barra_menu_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "BOTOES DO MENU" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c2info:\\c0 Botoes do menu pause." id = id_info_descri_botoes_menu pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Preto" id = id_criar_tema_partedois_preto pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_preto } 
	make_theme_menu_item text = "Branco" id = id_criar_tema_partedois_branco pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_branco } 
	make_theme_menu_item text = "Cinza Claro" id = id_criar_tema_partedois_cinzaclaro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_cinzaclaro } 
	make_theme_menu_item text = "Cinza Escuro" id = id_criar_tema_partedois_cinzaescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_cinzaescuro } 
	make_theme_menu_item text = "Vermelho Claro" id = id_criar_tema_partedois_vermelhoclaro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_vermelhoclaro } 
	make_theme_menu_item text = "Vermelho Escuro" id = id_criar_tema_partedois_vermelhoescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_vermelhoescuro } 
	make_theme_menu_item text = "Azul Claro" id = id_criar_tema_partedois_azulclaro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_azulclaro } 
	make_theme_menu_item text = "Azul Escuro" id = id_criar_tema_partedois_azulescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_azulescuro } 
	make_theme_menu_item text = "Verde Claro" id = id_criar_tema_partedois_verdeclaro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_verdeclaro } 
	make_theme_menu_item text = "Verde Escuro" id = id_criar_tema_partedois_verdeescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_verdeescuro } 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_criar_tema_partedois_proximo pad_choose_script = create_criar_tema_parte_barra_menu_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_parte_barra_menu_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "BOTOES DO MENU" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Amarelo Claro" id = id_criar_tema_partedois_amareloclaro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_amareloclaro } 
	make_theme_menu_item text = "Amarelo Escuro" id = id_criar_tema_partedois_amareloescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_amareloescuro } 
	make_theme_menu_item text = "Laranja Claro" id = id_criar_tema_partedois_laranjaclaro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_laranjaclaro } 
	make_theme_menu_item text = "Laranja escuro" id = id_criar_tema_partedois_laranjaescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_laranjaescuro } 
	make_theme_menu_item text = "Rosa" id = id_criar_tema_partedois_rosa pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_rosa } 
	make_theme_menu_item text = "Roxo" id = id_criar_tema_partedois_roxo pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_roxo } 
	make_theme_menu_item text = "Marrom" id = id_criar_tema_partedois_marrom pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_marrom } 
	make_theme_menu_item text = "Ciano" id = id_criar_tema_partedois_ciano pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_ciano } 
	make_theme_menu_item text = "Vermelho Muito escuro" id = id_criar_tema_partedois_red_bemescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_vermelhomuitoescuro } 
	make_theme_menu_item text = "Azul Muito escuro" id = id_criar_tema_partedois_blue_bemescuro pad_choose_script = botoes_menu_mudar pad_choose_params = { b_d_m_azulmuitoescuro } 
	make_theme_menu_item text = "  " id = id_criar_tema_partedois_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_criar_tema_partedois_anterior pad_choose_script = create_criar_tema_parte_barra_menu_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT botoes_menu_mudar 
	IF GotParam b_d_m_preto 
		SetGlobalFlag flag = BOTOESMENU_PRETO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_branco 
		SetGlobalFlag flag = BOTOESMENU_BRANCO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_cinzaclaro 
		SetGlobalFlag flag = BOTOESMENU_CINZACLARO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_cinzaescuro 
		SetGlobalFlag flag = BOTOESMENU_CINZAESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_vermelhoclaro 
		SetGlobalFlag flag = BOTOESMENU_VERMELHOCLARO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_vermelhoescuro 
		SetGlobalFlag flag = BOTOESMENU_VERMELHOESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_azulclaro 
		SetGlobalFlag flag = BOTOESMENU_AZULCLARO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_azulescuro 
		SetGlobalFlag flag = BOTOESMENU_AZULESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_verdeclaro 
		SetGlobalFlag flag = BOTOESMENU_VERDECLARO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_verdeescuro 
		SetGlobalFlag flag = BOTOESMENU_VERDEESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_amareloclaro 
		SetGlobalFlag flag = BOTOESMENU_AMARELOCLARO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_amareloescuro 
		SetGlobalFlag flag = BOTOESMENU_AMARELOESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_laranjaclaro 
		SetGlobalFlag flag = BOTOESMENU_LARANJACLARO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_laranjaescuro 
		SetGlobalFlag flag = BOTOESMENU_LARANJAESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_rosa 
		SetGlobalFlag flag = BOTOESMENU_ROSA 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_roxo 
		SetGlobalFlag flag = BOTOESMENU_ROXO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_marrom 
		SetGlobalFlag flag = BOTOESMENU_MARROM 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_ciano 
		SetGlobalFlag flag = BOTOESMENU_CIANO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_vermelhomuitoescuro 
		SetGlobalFlag flag = BOTOESMENU_VERMELHOMUITOESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
	IF GotParam b_d_m_azulmuitoescuro 
		SetGlobalFlag flag = BOTOESMENU_AZULMUITOESCURO 
		create_criar_tema_graff_cores_um 
	ENDIF 
ENDSCRIPT

SCRIPT create_criar_tema_graff_cores_um 
	hide_current_goal 
	make_new_roundbar_menu title = "TEMA DE TAGS GRAFF" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "PeB" id = id_tema_graff_um pad_choose_script = temagraff_mudar pad_choose_params = { peb } 
	make_theme_menu_item text = "Deixa tudo em tons de cinza.." id = id_tema_graff_um_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Kabrito" id = id_tema_graff_dois pad_choose_script = temagraff_mudar pad_choose_params = { kabrito } 
	make_theme_menu_item text = "Tudo em tons rosa..." id = id_tema_graff_dois_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "More Light" id = id_tema_graff_tres pad_choose_script = temagraff_mudar pad_choose_params = { morelight } 
	make_theme_menu_item text = "Muita luz?" id = id_tema_graff_tres_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Mundo Dark" id = id_tema_graff_quatro pad_choose_script = temagraff_mudar pad_choose_params = { mundodark } 
	make_theme_menu_item text = "Todos vao deixar tudo preto..." id = id_tema_graff_quatro_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Mundo Light" id = id_tema_graff_cimco pad_choose_script = temagraff_mudar pad_choose_params = { mundolight } 
	make_theme_menu_item text = "Todos vao deixar tudo mais branco..." id = id_tema_graff_cimco_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_tema_graff_nada_um pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2Pr\xF3ximo ->" id = id_tema_graff_proximo pad_choose_script = create_criar_tema_graff_cores_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_criar_tema_graff_cores_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "TEMA DE TAGS GRAFF" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "Mundo Pink" id = id_tema_graff_seis pad_choose_script = temagraff_mudar pad_choose_params = { mundopink } 
	make_theme_menu_item text = "O Mundo sera rosa" id = id_tema_graff_seis_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Total cor" id = id_tema_graff_sete pad_choose_script = temagraff_mudar pad_choose_params = { totalcor } 
	make_theme_menu_item text = "Cores fortes, mundo forte..." id = id_tema_graff_sete_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Tranquillity" id = id_tema_graff_oito pad_choose_script = temagraff_mudar pad_choose_params = { tranquillity } 
	make_theme_menu_item text = "Cores bem suaves..." id = id_tema_graff_oito_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "Blue Vs Red" id = id_tema_graff_nove pad_choose_script = temagraff_mudar pad_choose_params = { bluevsred } 
	make_theme_menu_item text = "Auzl? Vermelho? quem ganhara?" id = id_tema_graff_nove_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "THUG2 Original" id = id_tema_graff_dez pad_choose_script = temagraff_mudar pad_choose_params = { original } 
	make_theme_menu_item text = "Usa as cores do jogo original..." id = id_tema_graff_dez_des pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "  " id = id_tema_graff_nada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c2<- Anterior" id = id_tema_graff_voltar pad_choose_script = create_criar_tema_graff_cores_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT temagraff_mudar 
	IF GotParam peb 
		SetGlobalFlag flag = TAGGRAFF_UM 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam kabrito 
		SetGlobalFlag flag = TAGGRAFF_DOIS 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam morelight 
		SetGlobalFlag flag = TAGGRAFF_TRES 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam mundodark 
		SetGlobalFlag flag = TAGGRAFF_QUATRO 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam mundolight 
		SetGlobalFlag flag = TAGGRAFF_CINCO 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam mundopink 
		SetGlobalFlag flag = TAGGRAFF_SEIS 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam totalcor 
		SetGlobalFlag flag = TAGGRAFF_SETE 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam tranquillity 
		SetGlobalFlag flag = TAGGRAFF_OITO 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam bluevsred 
		SetGlobalFlag flag = TAGGRAFF_NOVE 
		carregar_e_aplicar_tema_atual 
	ENDIF 
	IF GotParam original 
		SetGlobalFlag flag = TAGGRAFF_DEZ 
		carregar_e_aplicar_tema_atual 
	ENDIF 
ENDSCRIPT

SCRIPT desmarcar_todas_flags_do_cst 
	UnsetGlobalFlag flag = BARRAEQ_PRETO 
	UnsetGlobalFlag flag = BARRAEQ_BRANCO 
	UnsetGlobalFlag flag = BARRAEQ_CINZACLARO 
	UnsetGlobalFlag flag = BARRAEQ_CINZAESCURO 
	UnsetGlobalFlag flag = BARRAEQ_VERMELHOCLARO 
	UnsetGlobalFlag flag = BARRAEQ_VERMELHOESCURO 
	UnsetGlobalFlag flag = BARRAEQ_AZULCLARO 
	UnsetGlobalFlag flag = BARRAEQ_AZULESCURO 
	UnsetGlobalFlag flag = BARRAEQ_VERDECLARO 
	UnsetGlobalFlag flag = BARRAEQ_VERDEESCURO 
	UnsetGlobalFlag flag = BARRAEQ_AMARELOCLARO 
	UnsetGlobalFlag flag = BARRAEQ_AMARELOESCURO 
	UnsetGlobalFlag flag = BARRAEQ_LARANJACLARO 
	UnsetGlobalFlag flag = BARRAEQ_LARANJAESCURO 
	UnsetGlobalFlag flag = BARRAEQ_ROSA 
	UnsetGlobalFlag flag = BARRAEQ_ROXO 
	UnsetGlobalFlag flag = BARRAEQ_MARROM 
	UnsetGlobalFlag flag = BARRAEQ_CIANO 
	UnsetGlobalFlag flag = BARRAEQ_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = BARRAEQ_AZULMUITOESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_PRETO 
	UnsetGlobalFlag flag = SETABARRAEQ_BRANCO 
	UnsetGlobalFlag flag = SETABARRAEQ_CINZACLARO 
	UnsetGlobalFlag flag = SETABARRAEQ_CINZAESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_VERMELHOCLARO 
	UnsetGlobalFlag flag = SETABARRAEQ_VERMELHOESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_AZULCLARO 
	UnsetGlobalFlag flag = SETABARRAEQ_AZULESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_VERDECLARO 
	UnsetGlobalFlag flag = SETABARRAEQ_VERDEESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_AMARELOCLARO 
	UnsetGlobalFlag flag = SETABARRAEQ_AMARELOESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_LARANJACLARO 
	UnsetGlobalFlag flag = SETABARRAEQ_LARANJAESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_ROSA 
	UnsetGlobalFlag flag = SETABARRAEQ_ROXO 
	UnsetGlobalFlag flag = SETABARRAEQ_MARROM 
	UnsetGlobalFlag flag = SETABARRAEQ_CIANO 
	UnsetGlobalFlag flag = SETABARRAEQ_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = SETABARRAEQ_AZULMUITOESCURO 
	UnsetGlobalFlag flag = HUD_PRETO 
	UnsetGlobalFlag flag = HUD_BRANCO 
	UnsetGlobalFlag flag = HUD_CINZACLARO 
	UnsetGlobalFlag flag = HUD_CINZAESCURO 
	UnsetGlobalFlag flag = HUD_VERMELHOCLARO 
	UnsetGlobalFlag flag = HUD_VERMELHOESCURO 
	UnsetGlobalFlag flag = HUD_AZULCLARO 
	UnsetGlobalFlag flag = HUD_AZULESCURO 
	UnsetGlobalFlag flag = HUD_VERDECLARO 
	UnsetGlobalFlag flag = HUD_VERDEESCURO 
	UnsetGlobalFlag flag = HUD_AMARELOCLARO 
	UnsetGlobalFlag flag = HUD_AMARELOESCURO 
	UnsetGlobalFlag flag = HUD_LARANJACLARO 
	UnsetGlobalFlag flag = HUD_LARANJAESCURO 
	UnsetGlobalFlag flag = HUD_ROSA 
	UnsetGlobalFlag flag = HUD_ROXO 
	UnsetGlobalFlag flag = HUD_MARROM 
	UnsetGlobalFlag flag = HUD_CIANO 
	UnsetGlobalFlag flag = HUD_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = HUD_AZULMUITOESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_PRETO 
	UnsetGlobalFlag flag = ESTRELAHUD_BRANCO 
	UnsetGlobalFlag flag = ESTRELAHUD_CINZACLARO 
	UnsetGlobalFlag flag = ESTRELAHUD_CINZAESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_VERMELHOCLARO 
	UnsetGlobalFlag flag = ESTRELAHUD_VERMELHOESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_AZULCLARO 
	UnsetGlobalFlag flag = ESTRELAHUD_AZULESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_VERDECLARO 
	UnsetGlobalFlag flag = ESTRELAHUD_VERDEESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_AMARELOCLARO 
	UnsetGlobalFlag flag = ESTRELAHUD_AMARELOESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_LARANJACLARO 
	UnsetGlobalFlag flag = ESTRELAHUD_LARANJAESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_ROSA 
	UnsetGlobalFlag flag = ESTRELAHUD_ROXO 
	UnsetGlobalFlag flag = ESTRELAHUD_MARROM 
	UnsetGlobalFlag flag = ESTRELAHUD_CIANO 
	UnsetGlobalFlag flag = ESTRELAHUD_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = ESTRELAHUD_AZULMUITOESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_PRETO 
	UnsetGlobalFlag flag = BARRAESPECIAL_BRANCO 
	UnsetGlobalFlag flag = BARRAESPECIAL_CINZACLARO 
	UnsetGlobalFlag flag = BARRAESPECIAL_CINZAESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_VERMELHOCLARO 
	UnsetGlobalFlag flag = BARRAESPECIAL_VERMELHOESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_AZULCLARO 
	UnsetGlobalFlag flag = BARRAESPECIAL_AZULESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_VERDECLARO 
	UnsetGlobalFlag flag = BARRAESPECIAL_VERDEESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_AMARELOCLARO 
	UnsetGlobalFlag flag = BARRAESPECIAL_AMARELOESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_LARANJACLARO 
	UnsetGlobalFlag flag = BARRAESPECIAL_LARANJAESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_ROSA 
	UnsetGlobalFlag flag = BARRAESPECIAL_ROXO 
	UnsetGlobalFlag flag = BARRAESPECIAL_MARROM 
	UnsetGlobalFlag flag = BARRAESPECIAL_CIANO 
	UnsetGlobalFlag flag = BARRAESPECIAL_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = BARRAESPECIAL_AZULMUITOESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_PRETO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_BRANCO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_CINZACLARO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_CINZAESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_VERMELHOCLARO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_VERMELHOESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_AZULCLARO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_AZULESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_VERDECLARO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_VERDEESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_AMARELOCLARO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_AMARELOESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_LARANJACLARO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_LARANJAESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_ROSA 
	UnsetGlobalFlag flag = NOMEMANOBRAS_ROXO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_MARROM 
	UnsetGlobalFlag flag = NOMEMANOBRAS_CIANO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = NOMEMANOBRAS_AZULMUITOESCURO 
	UnsetGlobalFlag flag = BACKGROUND_PRETO 
	UnsetGlobalFlag flag = BACKGROUND_BRANCO 
	UnsetGlobalFlag flag = BACKGROUND_CINZACLARO 
	UnsetGlobalFlag flag = BACKGROUND_CINZAESCURO 
	UnsetGlobalFlag flag = BACKGROUND_VERMELHOCLARO 
	UnsetGlobalFlag flag = BACKGROUND_VERMELHOESCURO 
	UnsetGlobalFlag flag = BACKGROUND_AZULCLARO 
	UnsetGlobalFlag flag = BACKGROUND_AZULESCURO 
	UnsetGlobalFlag flag = BACKGROUND_VERDECLARO 
	UnsetGlobalFlag flag = BACKGROUND_VERDEESCURO 
	UnsetGlobalFlag flag = BACKGROUND_AMARELOCLARO 
	UnsetGlobalFlag flag = BACKGROUND_AMARELOESCURO 
	UnsetGlobalFlag flag = BACKGROUND_LARANJACLARO 
	UnsetGlobalFlag flag = BACKGROUND_LARANJAESCURO 
	UnsetGlobalFlag flag = BACKGROUND_ROSA 
	UnsetGlobalFlag flag = BACKGROUND_ROXO 
	UnsetGlobalFlag flag = BACKGROUND_MARROM 
	UnsetGlobalFlag flag = BACKGROUND_CIANO 
	UnsetGlobalFlag flag = BACKGROUND_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = BACKGROUND_AZULMUITOESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_PRETO 
	UnsetGlobalFlag flag = CAIXADIALOGO_BRANCO 
	UnsetGlobalFlag flag = CAIXADIALOGO_CINZACLARO 
	UnsetGlobalFlag flag = CAIXADIALOGO_CINZAESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_VERMELHOCLARO 
	UnsetGlobalFlag flag = CAIXADIALOGO_VERMELHOESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_AZULCLARO 
	UnsetGlobalFlag flag = CAIXADIALOGO_AZULESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_VERDECLARO 
	UnsetGlobalFlag flag = CAIXADIALOGO_VERDEESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_AMARELOCLARO 
	UnsetGlobalFlag flag = CAIXADIALOGO_AMARELOESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_LARANJACLARO 
	UnsetGlobalFlag flag = CAIXADIALOGO_LARANJAESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_ROSA 
	UnsetGlobalFlag flag = CAIXADIALOGO_ROXO 
	UnsetGlobalFlag flag = CAIXADIALOGO_MARROM 
	UnsetGlobalFlag flag = CAIXADIALOGO_CIANO 
	UnsetGlobalFlag flag = CAIXADIALOGO_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = CAIXADIALOGO_AZULMUITOESCURO 
	UnsetGlobalFlag flag = JANELASMENU_PRETO 
	UnsetGlobalFlag flag = JANELASMENU_BRANCO 
	UnsetGlobalFlag flag = JANELASMENU_CINZACLARO 
	UnsetGlobalFlag flag = JANELASMENU_CINZAESCURO 
	UnsetGlobalFlag flag = JANELASMENU_VERMELHOCLARO 
	UnsetGlobalFlag flag = JANELASMENU_VERMELHOESCURO 
	UnsetGlobalFlag flag = JANELASMENU_AZULCLARO 
	UnsetGlobalFlag flag = JANELASMENU_AZULESCURO 
	UnsetGlobalFlag flag = JANELASMENU_VERDECLARO 
	UnsetGlobalFlag flag = JANELASMENU_VERDEESCURO 
	UnsetGlobalFlag flag = JANELASMENU_AMARELOCLARO 
	UnsetGlobalFlag flag = JANELASMENU_AMARELOESCURO 
	UnsetGlobalFlag flag = JANELASMENU_LARANJACLARO 
	UnsetGlobalFlag flag = JANELASMENU_LARANJAESCURO 
	UnsetGlobalFlag flag = JANELASMENU_ROSA 
	UnsetGlobalFlag flag = JANELASMENU_ROXO 
	UnsetGlobalFlag flag = JANELASMENU_MARROM 
	UnsetGlobalFlag flag = JANELASMENU_CIANO 
	UnsetGlobalFlag flag = JANELASMENU_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = JANELASMENU_AZULMUITOESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_PRETO 
	UnsetGlobalFlag flag = BOTOESMENU_BRANCO 
	UnsetGlobalFlag flag = BOTOESMENU_CINZACLARO 
	UnsetGlobalFlag flag = BOTOESMENU_CINZAESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_VERMELHOCLARO 
	UnsetGlobalFlag flag = BOTOESMENU_VERMELHOESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_AZULCLARO 
	UnsetGlobalFlag flag = BOTOESMENU_AZULESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_VERDECLARO 
	UnsetGlobalFlag flag = BOTOESMENU_VERDEESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_AMARELOCLARO 
	UnsetGlobalFlag flag = BOTOESMENU_AMARELOESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_LARANJACLARO 
	UnsetGlobalFlag flag = BOTOESMENU_LARANJAESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_ROSA 
	UnsetGlobalFlag flag = BOTOESMENU_ROXO 
	UnsetGlobalFlag flag = BOTOESMENU_MARROM 
	UnsetGlobalFlag flag = BOTOESMENU_CIANO 
	UnsetGlobalFlag flag = BOTOESMENU_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = BOTOESMENU_AZULMUITOESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_PRETO 
	UnsetGlobalFlag flag = TEXTOMENU_BRANCO 
	UnsetGlobalFlag flag = TEXTOMENU_CINZACLARO 
	UnsetGlobalFlag flag = TEXTOMENU_CINZAESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_VERMELHOCLARO 
	UnsetGlobalFlag flag = TEXTOMENU_VERMELHOESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_AZULCLARO 
	UnsetGlobalFlag flag = TEXTOMENU_AZULESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_VERDECLARO 
	UnsetGlobalFlag flag = TEXTOMENU_VERDEESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_AMARELOCLARO 
	UnsetGlobalFlag flag = TEXTOMENU_AMARELOESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_LARANJACLARO 
	UnsetGlobalFlag flag = TEXTOMENU_LARANJAESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_ROSA 
	UnsetGlobalFlag flag = TEXTOMENU_ROXO 
	UnsetGlobalFlag flag = TEXTOMENU_MARROM 
	UnsetGlobalFlag flag = TEXTOMENU_CIANO 
	UnsetGlobalFlag flag = TEXTOMENU_VERMELHOMUITOESCURO 
	UnsetGlobalFlag flag = TEXTOMENU_AZULMUITOESCURO 
	UnsetGlobalFlag flag = TAGGRAFF_UM 
	UnsetGlobalFlag flag = TAGGRAFF_DOIS 
	UnsetGlobalFlag flag = TAGGRAFF_TRES 
	UnsetGlobalFlag flag = TAGGRAFF_QUATRO 
	UnsetGlobalFlag flag = TAGGRAFF_CINCO 
	UnsetGlobalFlag flag = TAGGRAFF_SEIS 
	UnsetGlobalFlag flag = TAGGRAFF_SETE 
	UnsetGlobalFlag flag = TAGGRAFF_OITO 
	UnsetGlobalFlag flag = TAGGRAFF_NOVE 
	UnsetGlobalFlag flag = TAGGRAFF_DEZ 
ENDSCRIPT

SCRIPT carregar_e_aplicar_tema_atual 
	exit_pause_menu 
	create_net_panel_message text = "Aplicando seu tema.\\nAguarde..." style = generic_net_panel_message 
	Wait 1.20000004768 seconds 
	IF GetGlobalFlag flag = BARRAEQ_PRETO 
		change DE_BALANCE_METER_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_BRANCO 
		change DE_BALANCE_METER_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_CINZACLARO 
		change DE_BALANCE_METER_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_CINZAESCURO 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_VERMELHOCLARO 
		change DE_BALANCE_METER_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_VERMELHOESCURO 
		change DE_BALANCE_METER_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_AZULCLARO 
		change DE_BALANCE_METER_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_AZULESCURO 
		change DE_BALANCE_METER_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_VERDECLARO 
		change DE_BALANCE_METER_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_VERDEESCURO 
		change DE_BALANCE_METER_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_AMARELOCLARO 
		change DE_BALANCE_METER_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_AMARELOESCURO 
		change DE_BALANCE_METER_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_LARANJACLARO 
		change DE_BALANCE_METER_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_LARANJAESCURO 
		change DE_BALANCE_METER_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_ROSA 
		change DE_BALANCE_METER_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_ROXO 
		change DE_BALANCE_METER_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_MARROM 
		change DE_BALANCE_METER_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_CIANO 
		change DE_BALANCE_METER_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_VERMELHOMUITOESCURO 
		change DE_BALANCE_METER_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAEQ_AZULMUITOESCURO 
		change DE_BALANCE_METER_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_PRETO 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_BRANCO 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_CINZACLARO 
		change DE_BALANCE_ARROW_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_CINZAESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_VERMELHOCLARO 
		change DE_BALANCE_ARROW_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_VERMELHOESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_AZULCLARO 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_AZULESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_VERDECLARO 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_VERDEESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_AMARELOCLARO 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_AMARELOESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_LARANJACLARO 
		change DE_BALANCE_ARROW_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_LARANJAESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_ROSA 
		change DE_BALANCE_ARROW_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_ROXO 
		change DE_BALANCE_ARROW_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_MARROM 
		change DE_BALANCE_ARROW_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_CIANO 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_VERMELHOMUITOESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = SETABARRAEQ_AZULMUITOESCURO 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_PRETO 
		change DE_HUD_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_BRANCO 
		change DE_HUD_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_CINZACLARO 
		change DE_HUD_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_CINZAESCURO 
		change DE_HUD_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_VERMELHOCLARO 
		change DE_HUD_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_VERMELHOESCURO 
		change DE_HUD_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_AZULCLARO 
		change DE_HUD_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_AZULESCURO 
		change DE_HUD_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_VERDECLARO 
		change DE_HUD_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_VERDEESCURO 
		change DE_HUD_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_AMARELOCLARO 
		change DE_HUD_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_AMARELOESCURO 
		change DE_HUD_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_LARANJACLARO 
		change DE_HUD_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_LARANJAESCURO 
		change DE_HUD_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_ROSA 
		change DE_HUD_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_ROXO 
		change DE_HUD_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_MARROM 
		change DE_HUD_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_CIANO 
		change DE_HUD_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_VERMELHOMUITOESCURO 
		change DE_HUD_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = HUD_AZULMUITOESCURO 
		change DE_HUD_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_PRETO 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_BRANCO 
		change DE_ESTRELA_DKS_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_CINZACLARO 
		change DE_ESTRELA_DKS_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_CINZAESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_VERMELHOCLARO 
		change DE_ESTRELA_DKS_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_VERMELHOESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_AZULCLARO 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_AZULESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_VERDECLARO 
		change DE_ESTRELA_DKS_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_VERDEESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_AMARELOCLARO 
		change DE_ESTRELA_DKS_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_AMARELOESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_LARANJACLARO 
		change DE_ESTRELA_DKS_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_LARANJAESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_ROSA 
		change DE_ESTRELA_DKS_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_ROXO 
		change DE_ESTRELA_DKS_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_MARROM 
		change DE_ESTRELA_DKS_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_CIANO 
		change DE_ESTRELA_DKS_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_VERMELHOMUITOESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = ESTRELAHUD_AZULMUITOESCURO 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_PRETO 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_BRANCO 
		change DE_HUD_SPECIAL_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_CINZACLARO 
		change DE_HUD_SPECIAL_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_CINZAESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_VERMELHOCLARO 
		change DE_HUD_SPECIAL_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_VERMELHOESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_AZULCLARO 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_AZULESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_VERDECLARO 
		change DE_HUD_SPECIAL_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_VERDEESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_AMARELOCLARO 
		change DE_HUD_SPECIAL_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_AMARELOESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_LARANJACLARO 
		change DE_HUD_SPECIAL_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_LARANJAESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_ROSA 
		change DE_HUD_SPECIAL_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_ROXO 
		change DE_HUD_SPECIAL_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_MARROM 
		change DE_HUD_SPECIAL_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_CIANO 
		change DE_HUD_SPECIAL_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_VERMELHOMUITOESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BARRAESPECIAL_AZULMUITOESCURO 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_PRETO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_BRANCO 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_CINZACLARO 
		change DE_TEXTO_NOME_MANOBRAS = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_CINZAESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_VERMELHOCLARO 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_VERMELHOESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_AZULCLARO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_AZULESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_VERDECLARO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_VERDEESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_AMARELOCLARO 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_AMARELOESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_LARANJACLARO 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_LARANJAESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_ROSA 
		change DE_TEXTO_NOME_MANOBRAS = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_ROXO 
		change DE_TEXTO_NOME_MANOBRAS = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_MARROM 
		change DE_TEXTO_NOME_MANOBRAS = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_CIANO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_VERMELHOMUITOESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = NOMEMANOBRAS_AZULMUITOESCURO 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_PRETO 
		change DE_ALT_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_BRANCO 
		change DE_ALT_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_CINZACLARO 
		change DE_ALT_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_CINZAESCURO 
		change DE_ALT_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_VERMELHOCLARO 
		change DE_ALT_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_VERMELHOESCURO 
		change DE_ALT_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_AZULCLARO 
		change DE_ALT_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_AZULESCURO 
		change DE_ALT_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_VERDECLARO 
		change DE_ALT_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_VERDEESCURO 
		change DE_ALT_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_AMARELOCLARO 
		change DE_ALT_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_AMARELOESCURO 
		change DE_ALT_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_LARANJACLARO 
		change DE_ALT_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_LARANJAESCURO 
		change DE_ALT_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_ROSA 
		change DE_ALT_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_ROXO 
		change DE_ALT_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_MARROM 
		change DE_ALT_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_CIANO 
		change DE_ALT_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_VERMELHOMUITOESCURO 
		change DE_ALT_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BACKGROUND_AZULMUITOESCURO 
		change DE_ALT_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_PRETO 
		change DE_SPEECH_BOX_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_BRANCO 
		change DE_SPEECH_BOX_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_CINZACLARO 
		change DE_SPEECH_BOX_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_CINZAESCURO 
		change DE_SPEECH_BOX_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_VERMELHOCLARO 
		change DE_SPEECH_BOX_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_VERMELHOESCURO 
		change DE_SPEECH_BOX_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_AZULCLARO 
		change DE_SPEECH_BOX_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_AZULESCURO 
		change DE_SPEECH_BOX_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_VERDECLARO 
		change DE_SPEECH_BOX_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_VERDEESCURO 
		change DE_SPEECH_BOX_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_AMARELOCLARO 
		change DE_SPEECH_BOX_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_AMARELOESCURO 
		change DE_SPEECH_BOX_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_LARANJACLARO 
		change DE_SPEECH_BOX_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_LARANJAESCURO 
		change DE_SPEECH_BOX_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_ROSA 
		change DE_SPEECH_BOX_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_ROXO 
		change DE_SPEECH_BOX_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_MARROM 
		change DE_SPEECH_BOX_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_CIANO 
		change DE_SPEECH_BOX_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_VERMELHOMUITOESCURO 
		change DE_SPEECH_BOX_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = CAIXADIALOGO_AZULMUITOESCURO 
		change DE_SPEECH_BOX_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_PRETO 
		change DE_BG_PARTS_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_BRANCO 
		change DE_BG_PARTS_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_CINZACLARO 
		change DE_BG_PARTS_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_CINZAESCURO 
		change DE_BG_PARTS_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_VERMELHOCLARO 
		change DE_BG_PARTS_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_VERMELHOESCURO 
		change DE_BG_PARTS_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_AZULCLARO 
		change DE_BG_PARTS_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_AZULESCURO 
		change DE_BG_PARTS_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_VERDECLARO 
		change DE_BG_PARTS_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_VERDEESCURO 
		change DE_BG_PARTS_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_AMARELOCLARO 
		change DE_BG_PARTS_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_AMARELOESCURO 
		change DE_BG_PARTS_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_LARANJACLARO 
		change DE_BG_PARTS_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_LARANJAESCURO 
		change DE_BG_PARTS_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_ROSA 
		change DE_BG_PARTS_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_ROXO 
		change DE_BG_PARTS_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_MARROM 
		change DE_BG_PARTS_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_CIANO 
		change DE_BG_PARTS_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_VERMELHOMUITOESCURO 
		change DE_BG_PARTS_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = JANELASMENU_AZULMUITOESCURO 
		change DE_BG_PARTS_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_PRETO 
		change DE_PAUSEBAR_COLOR = [ 0 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_BRANCO 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_CINZACLARO 
		change DE_PAUSEBAR_COLOR = [ 100 100 100 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_CINZAESCURO 
		change DE_PAUSEBAR_COLOR = [ 20 20 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_VERMELHOCLARO 
		change DE_PAUSEBAR_COLOR = [ 255 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_VERMELHOESCURO 
		change DE_PAUSEBAR_COLOR = [ 70 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_AZULCLARO 
		change DE_PAUSEBAR_COLOR = [ 0 0 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_AZULESCURO 
		change DE_PAUSEBAR_COLOR = [ 0 0 70 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_VERDECLARO 
		change DE_PAUSEBAR_COLOR = [ 0 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_VERDEESCURO 
		change DE_PAUSEBAR_COLOR = [ 0 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_AMARELOCLARO 
		change DE_PAUSEBAR_COLOR = [ 255 255 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_AMARELOESCURO 
		change DE_PAUSEBAR_COLOR = [ 70 70 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_LARANJACLARO 
		change DE_PAUSEBAR_COLOR = [ 255 128 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_LARANJAESCURO 
		change DE_PAUSEBAR_COLOR = [ 70 35 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_ROSA 
		change DE_PAUSEBAR_COLOR = [ 240 110 170 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_ROXO 
		change DE_PAUSEBAR_COLOR = [ 64 0 64 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_MARROM 
		change DE_PAUSEBAR_COLOR = [ 20 10 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_CIANO 
		change DE_PAUSEBAR_COLOR = [ 0 255 255 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_VERMELHOMUITOESCURO 
		change DE_PAUSEBAR_COLOR = [ 20 0 0 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = BOTOESMENU_AZULMUITOESCURO 
		change DE_PAUSEBAR_COLOR = [ 0 0 20 128 ] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_UM 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 10 10 10 128 ] 
			[ 200 200 200 128 ] 
			[ 30 30 30 128 ] 
			[ 170 170 170 128 ] 
			[ 65 65 65 128 ] 
			[ 128 128 128 128 ] 
			[ 80 80 80 128 ] 
			[ 105 105 105 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_DOIS 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 200 0 200 128 ] 
			[ 252 140 255 128 ] 
			[ 193 21 164 128 ] 
			[ 215 129 248 128 ] 
			[ 224 152 193 128 ] 
			[ 134 234 242 128 ] 
			[ 183 192 236 128 ] 
			[ 255 0 128 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_TRES 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 202 126 108 128 ] 
			[ 117 164 216 128 ] 
			[ 109 207 136 128 ] 
			[ 123 99 3 128 ] 
			[ 0 228 228 128 ] 
			[ 228 0 228 128 ] 
			[ 180 180 216 128 ] 
			[ 188 205 212 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_QUATRO 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
			[ 20 20 20 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_CINCO 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
			[ 255 255 255 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_SEIS 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
			[ 240 110 170 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_SETE 
		change graffitiColors = [ 
			[ 255 0 0 128 ] 
			[ 0 0 255 128 ] 
			[ 0 255 0 128 ] 
			[ 255 128 0 128 ] 
			[ 240 110 170 128 ] 
			[ 20 10 0 128 ] 
			[ 0 255 255 128 ] 
			[ 20 0 0 128 ] 
			[ 0 20 0 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_OITO 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 102 26 8 20 ] 
			[ 17 64 116 20 ] 
			[ 9 107 36 20 ] 
			[ 123 99 3 20 ] 
			[ 0 128 128 20 ] 
			[ 128 0 128 20 ] 
			[ 80 80 116 20 ] 
			[ 88 105 112 20 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_NOVE 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 0 0 255 128 ] 
			[ 255 0 0 128 ] 
			[ 0 0 255 128 ] 
			[ 255 0 0 128 ] 
			[ 0 0 255 128 ] 
			[ 255 0 0 128 ] 
			[ 0 0 255 128 ] 
			[ 255 0 0 128 ] 
		] 
	ENDIF 
	IF GetGlobalFlag flag = TAGGRAFF_DEZ 
		change graffitiColors = [ 
			[ 128 128 128 100 ] 
			[ 102 26 8 128 ] 
			[ 17 64 116 128 ] 
			[ 9 107 36 128 ] 
			[ 123 99 3 128 ] 
			[ 0 128 128 128 ] 
			[ 128 0 128 128 ] 
			[ 80 80 116 128 ] 
			[ 88 105 112 128 ] 
		] 
	ENDIF 
	Wait 30 gameframe 
	aplicar_restart_paineis_cst 
ENDSCRIPT

SCRIPT aplicar_restart_paineis_cst 
	singlesession 
	GoalManager_DeactivateAllGoals 
	Retry 
ENDSCRIPT


