
SCRIPT create_temas_do_dksmod_menu_um 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c8Temas - P\xE1gina: 1/4" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c5Bra\\c4zil\\c0 - Theme 01" id = id_item_temas_dksmod_doasis pad_choose_script = tema_pronto_Brazil 
	make_theme_menu_item text = "\\c2Woo\\c4de\\c2n\\c0 - Theme 02" id = id_item_temas_dksmod_qasuatro pad_choose_script = tema_pronto_Wooden 
	make_theme_menu_item text = "\\c4Allien\\c0 - Theme 03" id = id_isatem_temas_dksmod_dez pad_choose_script = tema_pronto_Alien 
	make_theme_menu_item text = "\\clHello\\c7Kitty\\c0 - Theme 04" id = id_itemfasf_temas_dksmod_cimco pad_choose_script = tema_pronto_HelloKitty 
	make_theme_menu_item text = "\\c5Banana Banana\\c0 - Theme 05" id = id_item_temgagas_dksmod_seis pad_choose_script = tema_pronto_Bananabanana 
	make_theme_menu_item text = "\\c2S\\c0C\\c2I\\c0 - Theme 06" id = id_item_temas_dfaksmod_sete pad_choose_script = tema_pronto_SCI 
	make_theme_menu_item text = "\\c8BlacK0OUT\\c0 - Theme 07" id = id_item_temas_dksadsmod_oito pad_choose_script = tema_pronto_BlacKOUT 
	make_theme_menu_item text = "\\c4Dark in Dark\\c0 - Theme 08" id = id_item_teasmas_dksmod_doze pad_choose_script = tema_pronto_DarkinDark 
	make_theme_menu_item text = "\\c8Dark and \\c2die\\c0 - Theme 09" id = id_item_temasfw_dksmod_trese pad_choose_script = tema_pronto_Darkanddie 
	make_theme_menu_item text = "\\c8Dark in \\c2Blood\\c0 - Theme 10" id = id_igatem_temas_dksmod_quatorze pad_choose_script = tema_pronto_DarkinBlood 
	make_theme_menu_item text = "  " id = id_item_temas_dksmod_nasadanada_um pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c4>\\c0 Proximo" id = id_item_temgaas_dksmod_proximo pad_choose_script = create_temas_do_dksmod_menu_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_temas_do_dksmod_menu_dois 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c8Temas - P\xE1gina: 2/4" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c8Strip\\c2Clu\\cvb\\c0 - Theme 11" id = id_item_tgsaemas_dksmod_onze pad_choose_script = tema_pronto_Stripclub 
	make_theme_menu_item text = "\\cbDark\\c3Lue\\c0 - Theme 12" id = id_item_temas_dksgamod_dezesseis pad_choose_script = tema_pronto_DarkLue 
	make_theme_menu_item text = "\\c7Pink\\clLoves\\c0 - Theme 13" id = id_item_temas_dksmagod_dezessete pad_choose_script = tema_pronto_PinkLoves 
	make_theme_menu_item text = "\\cvG\\c8o\\cvth\\c2ic\\cvDi\\c8e\\c0 - Theme 14" id = id_item_tsaemas_dksmod_dezoito pad_choose_script = tema_pronto_GothicDie 
	make_theme_menu_item text = "\\cvZom\\c8bi\\cve\\c0 - Theme 15" id = id_item_temas_dksmod_nasove pad_choose_script = tema_pronto_Zombie 
	make_theme_menu_item text = "\\cbDarklight\\c0 - Theme 16" id = id_item_asftemas_dksmod_quinze pad_choose_script = tema_pronto_Darkight 
	make_theme_menu_item text = "\\cbL\\c0i\\cbT\\c0i\\cbg\\c0h\\cbt\\c0 - Theme 17" id = id_itehjm_temas_dksmod_dezenove pad_choose_script = tema_pronto_LiTight 
	make_theme_menu_item text = "\\cvBloo\\c2bath\\c0 - Theme 18" id = id_item_temas_dksmhgod_um pad_choose_script = tema_pronto_Bloodbath 
	make_theme_menu_item text = "\\c2Ne\\c4on\\c6Lights\\c0 - Theme 19" id = id_item_tghjemas_dksmod_tres pad_choose_script = tema_pronto_NeonLights 
	make_theme_menu_item text = "  " id = id_item_temas_dksmod_ghjnadanada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c4>\\c0 Proxima" id = id_item_temghjgas_dksmod_proximo_dois pad_choose_script = create_temas_do_dksmod_menu_tres 
	make_theme_menu_item text = "\\c4<\\c0 Anterior" id = id_item_temafghs_dksmod_voltar_dois pad_choose_script = create_temas_do_dksmod_menu_um 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_temas_do_dksmod_menu_tres 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c8Temas - P\xE1gina: 3/4" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c6Fut\\c4ur\\c5e\\c8The\\c8me\\c0 - Theme 20" id = id_item_temagfhs_dksmod_vinteoito pad_choose_script = tema_pronto_FutureTheme 
	make_theme_menu_item text = "\\c6CianoLife\\c0 - Theme 21" id = id_item_temas_dksfghmod_cianolife pad_choose_script = tema_pronto_cianolife 
	make_theme_menu_item text = "\\c4THUG2 \\c6Original\\c0 - Theme 22" id = id_item_temhgfdas_dksmod_vintetres pad_choose_script = tema_pronto_THUG2 
	make_theme_menu_item text = "\\cbDkS MoD 1.0\\c0 - Theme 23" id = id_item_temas_dksmod_bvcbdvintedois pad_choose_script = tema_pronto_DkSMoD 
	make_theme_menu_item text = "\\c2StyleRed\\c0 - Theme 24" id = id_item_temas_dksmod_vintenovedfg pad_choose_script = tema_pronto_StyleRed 
	make_theme_menu_item text = "\\c4StyleGreen\\c0 - Theme 25" id = id_item_temas_dksgdfgmod_trinta pad_choose_script = tema_pronto_StyleGreen 
	make_theme_menu_item text = "\\c3StyleBlue\\c0 - Theme 26" id = id_item_temas_dksgdgfmod_trintaum pad_choose_script = tema_pronto_StyleBlue 
	make_theme_menu_item text = "\\c4Marc\'dks 01\\c0 - Theme 27" id = id_item_temas_dksmod_visefntequatro pad_choose_script = tema_pronto_marcelo_um 
	make_theme_menu_item text = "\\c4Marc\'dks 02\\c0 Theme 28" id = id_item_temas_dksmod_vinthsdfecimco pad_choose_script = tema_pronto_marcelo_dois 
	make_theme_menu_item text = "  " id = id_item_temas_dksfsdmod_nadanada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c4>\\c0 Proxima" id = id_item_temas_dksmod_proximo_tres pad_choose_script = create_temas_do_dksmod_menu_quatro 
	make_theme_menu_item text = "\\c4<\\c0 Anterior" id = id_item_temas_dksmod_voltar_tres pad_choose_script = create_temas_do_dksmod_menu_dois 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT create_temas_do_dksmod_menu_quatro 
	hide_current_goal 
	make_new_roundbar_menu title = "\\c8Temas - P\xE1gina: 4/4" pos = PAIR(200.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_temas_dksmod_menu } 
	pause_menu_gradient 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	unhide_root_window 
	make_theme_menu_item text = "\\c4Marc\'dks 03\\c0 - Theme 29" id = id_item_temas_dkssdfmod_vinteseis pad_choose_script = tema_pronto_marcelo_tres 
	make_theme_menu_item text = "\\c4Marc\'dks 04\\c0 - Theme 30" id = id_item_temas_dksmod_fsdvintesete pad_choose_script = tema_pronto_marcelo_quatro 
	make_theme_menu_item text = "\\c4Marc\'dks 05\\c0 - Theme 31" id = id_item_temas_dksmod_vintesadois pad_choose_script = tema_pronto_marcelo_cinco 
	make_theme_menu_item text = "  " id = id_item_temas_dksmod_nadanrasada_dois pad_choose_script = semlink not_focusable = not_focusable 
	make_theme_menu_item text = "\\c4<\\c0 Anterior" id = id_item_temas_dgasfksmod_voltar_quateros pad_choose_script = create_temas_do_dksmod_menu_tres 
	roundbar_menu_finish 
ENDSCRIPT

SCRIPT tema_pronto_Bloodbath 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_UM 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Brazil 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DOIS 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_NeonLights 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_TRES 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Wooden 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_QUATRO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_HelloKitty 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_CINCO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Minimalist 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_SEIS 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Bananabanana 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_SETE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_SCI 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_OITO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_BlacKOUT 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_NOVE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Zombie 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DEZ 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Alien 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_ONZE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Stripclub 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DOZE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_DarkinDark 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_TREZE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Darkanddie 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_CATORZE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_DarkinBlood 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_QUINZE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_Darkight 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DEZESSEIS 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_DarkLue 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DEZESSETE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_PinkLoves 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DEZOITO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_GothicDie 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_DEZENOVE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_LiTight 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_DkSMoD 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTEUM 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_THUG2 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTEDOIS 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_FutureTheme 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTETRES 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_StyleBlue 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTEQUATRO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_StyleRed 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTECINCO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_StyleGreen 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTESEIS 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_cianolife 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTESETE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_marcelo_um 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTEOITO 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_marcelo_dois 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_VINTENOVE 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_marcelo_tres 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_TRINTA 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_marcelo_quatro 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_TRINTAUM 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_pronto_marcelo_cinco 
	exit_pause_menu 
	desmarcar_todas_as_flags 
	Wait 1 seconds 
	create_net_panel_message text = "Aplicando o tema..." style = generic_net_panel_message 
	Wait 1 seconds 
	SetGlobalFlag flag = TEMA_TRINTADOIS 
	tema_load_script 
ENDSCRIPT

SCRIPT tema_load_script_go 
	exit_pause_menu 
	create_net_panel_message text = "Carregando seu tema.\\nAguarde..." style = generic_net_panel_message 
	Wait 1.20000004768 seconds 
	tema_load_script 
ENDSCRIPT

SCRIPT aplicar_restart_paineis 
	singlesession 
	GoalManager_DeactivateAllGoals 
	Retry 
ENDSCRIPT

SCRIPT desmarcar_todas_as_flags 
	UnsetGlobalFlag flag = TEMA_UM 
	UnsetGlobalFlag flag = TEMA_DOIS 
	UnsetGlobalFlag flag = TEMA_TRES 
	UnsetGlobalFlag flag = TEMA_QUATRO 
	UnsetGlobalFlag flag = TEMA_CINCO 
	UnsetGlobalFlag flag = TEMA_SEIS 
	UnsetGlobalFlag flag = TEMA_SETE 
	UnsetGlobalFlag flag = TEMA_OITO 
	UnsetGlobalFlag flag = TEMA_NOVE 
	UnsetGlobalFlag flag = TEMA_DEZ 
	UnsetGlobalFlag flag = TEMA_ONZE 
	UnsetGlobalFlag flag = TEMA_DOZE 
	UnsetGlobalFlag flag = TEMA_TREZE 
	UnsetGlobalFlag flag = TEMA_CATORZE 
	UnsetGlobalFlag flag = TEMA_QUINZE 
	UnsetGlobalFlag flag = TEMA_DEZESSEIS 
	UnsetGlobalFlag flag = TEMA_DEZESSETE 
	UnsetGlobalFlag flag = TEMA_DEZOITO 
	UnsetGlobalFlag flag = TEMA_DEZENOVE 
	UnsetGlobalFlag flag = TEMA_VINTE 
	UnsetGlobalFlag flag = TEMA_VINTEUM 
	UnsetGlobalFlag flag = TEMA_VINTEDOIS 
	UnsetGlobalFlag flag = TEMA_VINTETRES 
	UnsetGlobalFlag flag = TEMA_VINTEQUATRO 
	UnsetGlobalFlag flag = TEMA_VINTECINCO 
	UnsetGlobalFlag flag = TEMA_VINTESEIS 
	UnsetGlobalFlag flag = TEMA_VINTESETE 
	UnsetGlobalFlag flag = TEMA_VINTEOITO 
	UnsetGlobalFlag flag = TEMA_VINTENOVE 
	UnsetGlobalFlag flag = TEMA_TRINTA 
	UnsetGlobalFlag flag = TEMA_TRINTAUM 
	UnsetGlobalFlag flag = TEMA_TRINTADOIS 
	UnsetGlobalFlag flag = TEMA_TRINTATRES 
	UnsetGlobalFlag flag = TEMA_TRINTAQUATRO 
	UnsetGlobalFlag flag = TEMA_TRINTACINCO 
	UnsetGlobalFlag flag = TEMA_TRINTASEIS 
	UnsetGlobalFlag flag = TEMA_TRINTASETE 
	UnsetGlobalFlag flag = TEMA_TRINTAOITO 
	UnsetGlobalFlag flag = TEMA_TRINTANOVE 
	UnsetGlobalFlag flag = TEMA_QUARENTA 
ENDSCRIPT

SCRIPT tema_load_script 
	Wait 1.20000004768 seconds 
	IF GetGlobalFlag flag = TEMA_UM 
		change DE_BALANCE_METER_COLOR = [ 70 0 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 0 0 128 ] 
		change DE_HUD_COLOR = [ 255 0 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 70 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 70 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 0 0 128 ] 
		change DE_ALT_COLOR = [ 0 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 70 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 0 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DOIS 
		change DE_BALANCE_METER_COLOR = [ 70 70 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 255 128 ] 
		change DE_HUD_COLOR = [ 0 70 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 255 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 70 70 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 70 0 128 ] 
		change DE_ALT_COLOR = [ 0 0 70 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 70 70 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 70 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 70 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_TRES 
		change DE_BALANCE_METER_COLOR = [ 0 0 70 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 255 128 ] 
		change DE_HUD_COLOR = [ 0 0 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 255 255 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 255 255 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 255 128 ] 
		change DE_ALT_COLOR = [ 0 0 70 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 0 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 0 70 128 ] 
		graff_cor_tema_tres 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_QUATRO 
		change DE_BALANCE_METER_COLOR = [ 20 10 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 70 0 128 ] 
		change DE_HUD_COLOR = [ 20 10 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 70 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 70 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 20 10 0 128 ] 
		change DE_ALT_COLOR = [ 20 10 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 70 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 70 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 70 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_CINCO 
		change DE_BALANCE_METER_COLOR = [ 100 100 100 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 240 110 170 128 ] 
		change DE_HUD_COLOR = [ 240 110 170 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 64 0 64 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 100 100 100 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 240 110 170 128 ] 
		change DE_ALT_COLOR = [ 64 0 64 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 240 110 170 128 ] 
		change DE_BG_PARTS_COLOR = [ 240 110 170 128 ] 
		change DE_PAUSEBAR_COLOR = [ 100 100 100 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_SEIS 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 255 255 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 20 20 20 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 0 128 ] 
		change DE_ALT_COLOR = [ 20 20 20 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 20 20 20 128 ] 
		change DE_BG_PARTS_COLOR = [ 100 100 100 128 ] 
		change DE_PAUSEBAR_COLOR = [ 100 100 100 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_SETE 
		change DE_BALANCE_METER_COLOR = [ 70 70 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 0 128 ] 
		change DE_HUD_COLOR = [ 70 70 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 255 255 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 70 0 128 ] 
		change DE_ALT_COLOR = [ 70 70 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 255 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 70 70 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 70 70 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_OITO 
		change DE_BALANCE_METER_COLOR = [ 100 100 100 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 0 0 128 ] 
		change DE_HUD_COLOR = [ 100 100 100 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 255 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 70 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 0 0 128 ] 
		change DE_ALT_COLOR = [ 70 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 70 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 70 0 0 128 ] 
		cor_texto_botoes_cinzaclaro 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_NOVE 
		change DE_BALANCE_METER_COLOR = [ 100 100 100 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 20 20 20 128 ] 
		change DE_HUD_COLOR = [ 20 20 20 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 100 100 100 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 0 128 ] 
		change DE_ALT_COLOR = [ 20 20 20 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 20 20 20 128 ] 
		change DE_BG_PARTS_COLOR = [ 100 100 100 128 ] 
		change DE_PAUSEBAR_COLOR = [ 100 100 100 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DEZ 
		change DE_BALANCE_METER_COLOR = [ 0 0 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 70 128 ] 
		change DE_HUD_COLOR = [ 0 0 70 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 70 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 70 128 ] 
		change DE_ALT_COLOR = [ 0 0 70 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 0 70 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 20 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 0 20 128 ] 
		cor_texto_botoes_cinzaclaro 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_ONZE 
		change DE_BALANCE_METER_COLOR = [ 0 70 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 0 128 ] 
		change DE_HUD_COLOR = [ 0 70 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 255 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 255 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 70 0 128 ] 
		change DE_ALT_COLOR = [ 0 70 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 255 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 70 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 70 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DOZE 
		change DE_BALANCE_METER_COLOR = [ 70 0 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 240 110 170 128 ] 
		change DE_HUD_COLOR = [ 70 0 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 240 110 170 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 240 110 170 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 0 0 128 ] 
		change DE_ALT_COLOR = [ 70 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 70 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 70 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 70 0 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_TREZE 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 100 100 100 128 ] 
		change DE_HUD_COLOR = [ 20 20 20 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 0 128 ] 
		change DE_ALT_COLOR = [ 0 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 0 0 128 ] 
		graff_cor_tema_quatro 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_CATORZE 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_COLOR = [ 0 0 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 70 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 20 0 0 128 ] 
		change DE_ALT_COLOR = [ 0 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 20 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 0 0 128 ] 
		graff_cor_tema_quatros 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_QUINZE 
		change DE_BALANCE_METER_COLOR = [ 20 0 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 0 0 128 ] 
		change DE_HUD_COLOR = [ 0 0 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 70 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 70 0 0 128 ] 
		change DE_ALT_COLOR = [ 70 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 70 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 70 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 70 0 0 128 ] 
		graff_cor_tema_quatro 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DEZESSEIS 
		change DE_BALANCE_METER_COLOR = [ 100 100 100 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 100 100 100 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 255 255 255 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 255 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 255 255 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_cimco 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DEZESSETE 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 20 128 ] 
		change DE_HUD_COLOR = [ 0 0 20 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 20 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 70 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 255 128 ] 
		change DE_ALT_COLOR = [ 0 0 20 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 0 20 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 20 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 0 20 128 ] 
		graff_cor_tema_sete 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DEZOITO 
		change DE_BALANCE_METER_COLOR = [ 64 0 64 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 240 110 170 128 ] 
		change DE_HUD_COLOR = [ 240 110 170 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 240 110 170 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 240 110 170 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 240 110 170 128 ] 
		change DE_ALT_COLOR = [ 64 0 64 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 64 0 64 128 ] 
		change DE_BG_PARTS_COLOR = [ 64 0 64 128 ] 
		change DE_PAUSEBAR_COLOR = [ 64 0 64 128 ] 
		graff_cor_tema_dois 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_DEZENOVE 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 64 0 64 128 ] 
		change DE_HUD_COLOR = [ 20 20 20 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 0 128 ] 
		change DE_ALT_COLOR = [ 64 0 64 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_quatro 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTE 
		change DE_BALANCE_METER_COLOR = [ 255 255 255 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 255 255 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 255 255 255 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 255 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 255 255 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 0 0 128 ] 
		graff_cor_tema_oito 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTEUM 
		change DE_BALANCE_METER_COLOR = [ 40 40 40 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 128 74 7 128 ] 
		change DE_HUD_COLOR = [ 128 74 7 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 128 128 128 100 ] 
		change DE_HUD_SPECIAL_COLOR = [ 128 128 128 80 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 30 30 30 75 ] 
		change DE_ALT_COLOR = [ 17 67 92 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 128 109 9 128 ] 
		change DE_BG_PARTS_COLOR = [ 35 57 107 128 ] 
		change DE_PAUSEBAR_COLOR = [ 100 100 100 128 ] 
		change texto_cor_link = [ 70 35 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTEDOIS 
		change DE_BALANCE_METER_COLOR = [ 15 82 117 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 125 107 34 128 ] 
		change DE_HUD_COLOR = [ 125 107 34 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 128 128 128 100 ] 
		change DE_HUD_SPECIAL_COLOR = [ 15 82 117 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 30 30 30 75 ] 
		change DE_ALT_COLOR = [ 17 67 92 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 128 109 9 128 ] 
		change DE_BG_PARTS_COLOR = [ 35 57 107 128 ] 
		change DE_PAUSEBAR_COLOR = [ 128 109 9 128 ] 
		change texto_cor_link = [ 70 35 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTETRES 
		change DE_BALANCE_METER_COLOR = [ 100 100 100 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 0 128 ] 
		change DE_HUD_COLOR = [ 0 255 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 255 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 255 255 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 240 110 170 128 ] 
		change DE_ALT_COLOR = [ 64 0 64 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 64 0 64 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_tres 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTEQUATRO 
		change DE_BALANCE_METER_COLOR = [ 20 20 20 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 0 255 128 ] 
		change DE_HUD_COLOR = [ 0 0 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 255 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 255 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 0 255 128 ] 
		change DE_ALT_COLOR = [ 0 0 255 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 0 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 0 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 255 255 128 ] 
		graff_cor_tema_nove 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTECINCO 
		change DE_BALANCE_METER_COLOR = [ 70 0 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 0 0 128 ] 
		change DE_HUD_COLOR = [ 255 0 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 70 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 255 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 0 0 128 ] 
		change DE_ALT_COLOR = [ 70 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 70 0 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 70 0 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 70 0 0 128 ] 
		graff_cor_tema_nove 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTESEIS 
		change DE_BALANCE_METER_COLOR = [ 0 70 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 0 128 ] 
		change DE_HUD_COLOR = [ 0 255 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 70 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 255 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 70 0 128 ] 
		change DE_ALT_COLOR = [ 0 70 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 70 0 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 70 0 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 255 0 128 ] 
		graff_cor_tema_sete 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTESETE 
		change DE_BALANCE_METER_COLOR = [ 0 255 255 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 255 255 128 ] 
		change DE_HUD_COLOR = [ 0 255 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 255 255 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 255 0 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 0 255 255 128 ] 
		change DE_ALT_COLOR = [ 0 255 255 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 0 255 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 0 255 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 255 255 128 ] 
		graff_cor_tema_sete 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTEOITO 
		change DE_BALANCE_METER_COLOR = [ 255 255 255 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 0 70 0 128 ] 
		change DE_HUD_COLOR = [ 0 255 0 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 255 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 255 0 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 255 255 255 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 255 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 20 20 20 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_VINTENOVE 
		change DE_BALANCE_METER_COLOR = [ 0 0 255 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 0 0 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 0 0 255 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 0 0 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 255 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 20 20 20 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_TRINTA 
		cor_parte_barra_eq_laranjaclaro 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 100 100 100 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 100 100 100 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 255 255 255 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 255 255 255 128 ] 
		change DE_BG_PARTS_COLOR = [ 20 20 20 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_TRINTAUM 
		change DE_BALANCE_METER_COLOR = [ 0 0 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 0 255 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 255 255 255 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 100 100 100 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 20 20 20 128 ] 
		change DE_BG_PARTS_COLOR = [ 255 255 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 255 255 255 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	IF GetGlobalFlag flag = TEMA_TRINTADOIS 
		change DE_BALANCE_METER_COLOR = [ 0 70 0 128 ] 
		change DE_BALANCE_ARROW_COLOR = [ 255 255 255 128 ] 
		change DE_HUD_COLOR = [ 255 255 255 128 ] 
		change DE_ESTRELA_DKS_COLOR = [ 0 0 0 128 ] 
		change DE_HUD_SPECIAL_COLOR = [ 20 20 20 128 ] 
		change DE_TEXTO_NOME_MANOBRAS = [ 255 255 255 128 ] 
		change DE_ALT_COLOR = [ 0 70 0 128 ] 
		change DE_SPEECH_BOX_COLOR = [ 100 100 100 128 ] 
		change DE_BG_PARTS_COLOR = [ 255 255 255 128 ] 
		change DE_PAUSEBAR_COLOR = [ 0 70 0 128 ] 
		graff_cor_tema_dez 
	ENDIF 
	Wait 15 gameframe 
	aplicar_restart_paineis 
ENDSCRIPT


