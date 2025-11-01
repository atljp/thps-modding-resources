
E9_CAVEMANDRIFT = 1 
E9_CAVEMANBUTTON = 0 
E9_ENABLE_KSK_OFFBOARD = 1 
E9_ENABLE_KSK_WIRESPIN = 1 
E9_ENABLE_BANKDROPS = 1 
E9_ENABLE_BOMBDROPS = 1 
E9_ENABLE_BOOSTPLANTS = 1 
E9_WALLPLANT_TYPE = 0 
E9_ENABLE_GRIND_STALLS = 1 
E9_ENABLE_GRIND_AIRS = 1 
MOD_DEV_MODE = 0 
AirTricksGrinds = 
[ 
	{ Trigger = { TripleInOrder , a = Left , b = Left , Square , 300 } trickslot = Air_L_L_Square } 
	{ Trigger = { TripleInOrder , a = right , b = right , Square , 300 } trickslot = Air_R_R_Square } 
	{ Trigger = { TripleInOrder , a = Up , b = Up , Square , 300 } trickslot = Air_U_U_Square } 
	{ Trigger = { TripleInOrder , a = Down , b = Down , Square , 300 } trickslot = Air_D_D_Square } 
	{ Trigger = { AirTrickLogic , Square , upleft , 500 } trickslot = Air_SquareUL } 
	{ Trigger = { AirTrickLogic , Square , upright , 500 } trickslot = Air_SquareUR } 
	{ Trigger = { AirTrickLogic , Square , downleft , 500 } trickslot = Air_SquareDL } 
	{ Trigger = { AirTrickLogic , Square , downright , 500 } trickslot = Air_SquareDR } 
	{ Trigger = { AirTrickLogic , Square , Up , 500 } trickslot = Air_SquareU } 
	{ Trigger = { AirTrickLogic , Square , Down , 500 } trickslot = Air_SquareD } 
	{ Trigger = { AirTrickLogic , Square , Left , 500 } trickslot = Air_SquareL } 
	{ Trigger = { AirTrickLogic , Square , right , 500 } trickslot = Air_SquareR } 
	{ Trigger = { TripleInOrder , a = Left , b = Left , circle , 300 } trickslot = Air_L_L_Circle } 
	{ Trigger = { TripleInOrder , a = right , b = right , circle , 300 } trickslot = Air_R_R_Circle } 
	{ Trigger = { TripleInOrder , a = Up , b = Up , circle , 300 } trickslot = Air_U_U_Circle } 
	{ Trigger = { TripleInOrder , a = Down , b = Down , circle , 300 } trickslot = Air_D_D_Circle } 
	{ Trigger = { AirTrickLogic , circle , upleft , 500 } trickslot = Air_CircleUL } 
	{ Trigger = { AirTrickLogic , circle , upright , 500 } trickslot = Air_CircleUR } 
	{ Trigger = { AirTrickLogic , circle , downleft , 500 } trickslot = Air_CircleDL } 
	{ Trigger = { AirTrickLogic , circle , downright , 500 } trickslot = Air_CircleDR } 
	{ Trigger = { AirTrickLogic , circle , Up , 500 } trickslot = Air_CircleU } 
	{ Trigger = { AirTrickLogic , circle , Down , 500 } trickslot = Air_CircleD } 
	{ Trigger = { AirTrickLogic , circle , right , 500 } trickslot = Air_CircleR } 
	{ Trigger = { AirTrickLogic , circle , Left , 500 } trickslot = Air_CircleL } 
	{ Trigger = { TripleInOrder , a = Down , b = Down , triangle , 300 } Scr = ToTail } 
	{ Trigger = { TripleInOrderSloppy , upright , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_CrailSlide_FS params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , downright , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_Darkslide_FS params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , downleft , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_DoubleBluntSlide2 params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , upleft , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_HangTenNoseGrind_FS params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Up , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_NosegrindPivot_FS params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , right , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_Salad_FS params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Left , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_Hurricane_FS params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Down , b = triangle , c = triangle , GRINDTAP_TIME } Scr = Trick_GrindOverturn_FS params = { IsExtra = 1 } } 
] 
AirTricksNoGrinds = 
[ 
	{ Trigger = { TripleInOrder , a = Left , b = Left , Square , 300 } trickslot = Air_L_L_Square } 
	{ Trigger = { TripleInOrder , a = right , b = right , Square , 300 } trickslot = Air_R_R_Square } 
	{ Trigger = { TripleInOrder , a = Up , b = Up , Square , 300 } trickslot = Air_U_U_Square } 
	{ Trigger = { TripleInOrder , a = Down , b = Down , Square , 300 } trickslot = Air_D_D_Square } 
	{ Trigger = { AirTrickLogic , Square , upleft , 500 } trickslot = Air_SquareUL } 
	{ Trigger = { AirTrickLogic , Square , upright , 500 } trickslot = Air_SquareUR } 
	{ Trigger = { AirTrickLogic , Square , downleft , 500 } trickslot = Air_SquareDL } 
	{ Trigger = { AirTrickLogic , Square , downright , 500 } trickslot = Air_SquareDR } 
	{ Trigger = { AirTrickLogic , Square , Up , 500 } trickslot = Air_SquareU } 
	{ Trigger = { AirTrickLogic , Square , Down , 500 } trickslot = Air_SquareD } 
	{ Trigger = { AirTrickLogic , Square , Left , 500 } trickslot = Air_SquareL } 
	{ Trigger = { AirTrickLogic , Square , right , 500 } trickslot = Air_SquareR } 
	{ Trigger = { TripleInOrder , a = Left , b = Left , circle , 300 } trickslot = Air_L_L_Circle } 
	{ Trigger = { TripleInOrder , a = right , b = right , circle , 300 } trickslot = Air_R_R_Circle } 
	{ Trigger = { TripleInOrder , a = Up , b = Up , circle , 300 } trickslot = Air_U_U_Circle } 
	{ Trigger = { TripleInOrder , a = Down , b = Down , circle , 300 } trickslot = Air_D_D_Circle } 
	{ Trigger = { AirTrickLogic , circle , upleft , 500 } trickslot = Air_CircleUL } 
	{ Trigger = { AirTrickLogic , circle , upright , 500 } trickslot = Air_CircleUR } 
	{ Trigger = { AirTrickLogic , circle , downleft , 500 } trickslot = Air_CircleDL } 
	{ Trigger = { AirTrickLogic , circle , downright , 500 } trickslot = Air_CircleDR } 
	{ Trigger = { AirTrickLogic , circle , Up , 500 } trickslot = Air_CircleU } 
	{ Trigger = { AirTrickLogic , circle , Down , 500 } trickslot = Air_CircleD } 
	{ Trigger = { AirTrickLogic , circle , right , 500 } trickslot = Air_CircleR } 
	{ Trigger = { AirTrickLogic , circle , Left , 500 } trickslot = Air_CircleL } 
	{ Trigger = { TripleInOrder , a = Down , b = Down , triangle , 300 } Scr = ToTail } 
] 
SCRIPT create_mod_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "MOD OPTIONS" 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back create_pause_menu } ] 
		replace_handlers 
	} 
	IF ( E9_CAVEMANDRIFT = 1 ) 
		hud_text = "THUG1" 
	ELSE 
		hud_text = "THUG2" 
	ENDIF 
	theme_menu_add_item { text = "Caveman Drift" 
		extra_text = <hud_text> 
		id = menu_mod_cd 
		pad_choose_script = toggle_caveman_drift 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_KSK_OFFBOARD = 1 ) 
		hud_text = "On" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "KSK Off Board" 
		extra_text = <hud_text> 
		id = menu_mod_kc 
		pad_choose_script = toggle_ksk_caveman 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_KSK_WIRESPIN = 1 ) 
		hud_text = "On (R2)" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "KSK Wire Spin" 
		extra_text = <hud_text> 
		id = menu_mod_kws 
		pad_choose_script = toggle_ksk_wirespin 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_BANKDROPS = 1 ) 
		hud_text = "On" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "Bank Drops" 
		extra_text = <hud_text> 
		id = menu_mod_bkd 
		pad_choose_script = toggle_bank_drops 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_BOMBDROPS = 1 ) 
		hud_text = "On" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "Bomb Drops" 
		extra_text = <hud_text> 
		id = menu_mod_bbd 
		pad_choose_script = toggle_bomb_drops 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_BOOSTPLANTS = 1 ) 
		hud_text = "On" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "BoostPlants" 
		extra_text = <hud_text> 
		id = menu_mod_bp 
		pad_choose_script = toggle_boostplants 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	SWITCH E9_WALLPLANT_TYPE 
		CASE 0 
			hud_text = "Both" 
		CASE 1 
			hud_text = "Sticker Slap" 
		CASE 2 
			hud_text = "Wallplant" 
	ENDSWITCH 
	theme_menu_add_item { text = "Wallplant Tricks" 
		extra_text = <hud_text> 
		id = menu_mod_wp 
		pad_choose_script = toggle_wallplant 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_GRIND_STALLS = 1 ) 
		hud_text = "On (R2)" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "Grind Stalls" 
		extra_text = <hud_text> 
		id = menu_mod_gs 
		pad_choose_script = toggle_grind_stalls 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( E9_ENABLE_GRIND_AIRS = 1 ) 
		hud_text = "On" 
	ELSE 
		hud_text = "Off" 
	ENDIF 
	theme_menu_add_item { text = "Grind Airtricks" 
		extra_text = <hud_text> 
		id = menu_mod_ga 
		pad_choose_script = toggle_grind_airtricks 
		focus_script = controller_config_focus 
		unfocus_script = controller_config_unfocus 
	} 
	IF ( MOD_DEV_MODE = 1 ) 
		theme_menu_add_item text = "Debug" id = menu_mod_dbg pad_choose_script = create_debug_options_menu centered 
		theme_menu_add_item text = "Level Merge" id = menu_mod_mrg pad_choose_script = create_merge_menu centered 
	ENDIF 
	theme_menu_add_item text = "Done" id = menu_mod_done pad_choose_script = create_pause_menu last_menu_item = last_menu_item 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bn=Back" } 
		] 
	} 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT toggle_caveman_drift 
	IF ( E9_CAVEMANDRIFT = 1 ) 
		SetScreenElementProps id = { menu_mod_cd child = 3 } text = "THUG2" 
		change E9_CAVEMANDRIFT = 0 
	ELSE 
		SetScreenElementProps id = { menu_mod_cd child = 3 } text = "THUG1" 
		change E9_CAVEMANDRIFT = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_ksk_caveman 
	IF ( E9_ENABLE_KSK_OFFBOARD = 1 ) 
		SetScreenElementProps id = { menu_mod_kc child = 3 } text = "Off" 
		change E9_ENABLE_KSK_OFFBOARD = 0 
	ELSE 
		SetScreenElementProps id = { menu_mod_kc child = 3 } text = "On" 
		change E9_ENABLE_KSK_OFFBOARD = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_ksk_wirespin 
	IF ( E9_ENABLE_KSK_WIRESPIN = 1 ) 
		SetScreenElementProps id = { menu_mod_kws child = 3 } text = "Off" 
		change E9_ENABLE_KSK_WIRESPIN = 0 
	ELSE 
		SetScreenElementProps id = { menu_mod_kws child = 3 } text = "On (R2)" 
		change E9_ENABLE_KSK_WIRESPIN = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_bank_drops 
	IF ( E9_ENABLE_BANKDROPS = 1 ) 
		SetScreenElementProps id = { menu_mod_bkd child = 3 } text = "Off" 
		change E9_ENABLE_BANKDROPS = 0 
		change skatercanskiprevert = 0 
	ELSE 
		SetScreenElementProps id = { menu_mod_bkd child = 3 } text = "On" 
		change E9_ENABLE_BANKDROPS = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_bomb_drops 
	IF ( E9_ENABLE_BOMBDROPS = 1 ) 
		SetScreenElementProps id = { menu_mod_bbd child = 3 } text = "Off" 
		change E9_ENABLE_BOMBDROPS = 0 
	ELSE 
		SetScreenElementProps id = { menu_mod_bbd child = 3 } text = "On" 
		change E9_ENABLE_BOMBDROPS = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_boostplants 
	IF ( E9_ENABLE_BOOSTPLANTS = 1 ) 
		SetScreenElementProps id = { menu_mod_bp child = 3 } text = "Off" 
		change E9_ENABLE_BOOSTPLANTS = 0 
		ClearEventHandler SkaterEnterManual 
		ClearEventHandler SkaterExitWall 
	ELSE 
		SetScreenElementProps id = { menu_mod_bp child = 3 } text = "On" 
		change E9_ENABLE_BOOSTPLANTS = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_wallplant 
	change E9_WALLPLANT_TYPE = ( E9_WALLPLANT_TYPE + 1 ) 
	IF ( E9_WALLPLANT_TYPE > 2 ) 
		change E9_WALLPLANT_TYPE = 0 
	ENDIF 
	Obj_KillSpawnedScript name = wallplant_check_handler 
	SWITCH E9_WALLPLANT_TYPE 
		CASE 0 
			SetScreenElementProps id = { menu_mod_wp child = 3 } text = "Both" 
		CASE 1 
			SetScreenElementProps id = { menu_mod_wp child = 3 } text = "Sticker Slap" 
		CASE 2 
			SetScreenElementProps id = { menu_mod_wp child = 3 } text = "Wallplant" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT toggle_grind_stalls 
	IF ( E9_ENABLE_GRIND_STALLS = 1 ) 
		SetScreenElementProps id = { menu_mod_gs child = 3 } text = "Off" 
		change E9_ENABLE_GRIND_STALLS = 0 
	ELSE 
		SetScreenElementProps id = { menu_mod_gs child = 3 } text = "On (R2)" 
		change E9_ENABLE_GRIND_STALLS = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_grind_airtricks 
	IF ( E9_ENABLE_GRIND_AIRS = 1 ) 
		SetScreenElementProps id = { menu_mod_ga child = 3 } text = "Off" 
		change E9_ENABLE_GRIND_AIRS = 0 
		change AirTricks = AirTricksNoGrinds 
	ELSE 
		SetScreenElementProps id = { menu_mod_ga child = 3 } text = "On" 
		change E9_ENABLE_GRIND_AIRS = 1 
		change AirTricks = AirTricksGrinds 
	ENDIF 
ENDSCRIPT

SCRIPT create_merge_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_scrolling_menu title = "LEVEL MERGE" 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = create_mod_menu } } ] 
		replace_handlers 
	} 
	theme_menu_add_item text = "Training" id = menu_mod_merge_TR pad_choose_script = Merge_TR centered no_bg first_item 
	theme_menu_add_item text = "Boston" id = menu_mod_merge_BO pad_choose_script = Merge_BO centered no_bg 
	theme_menu_add_item text = "Barcelona" id = menu_mod_merge_BA pad_choose_script = Merge_BA centered no_bg 
	theme_menu_add_item text = "Berlin" id = menu_mod_merge_BE pad_choose_script = Merge_BE centered no_bg 
	theme_menu_add_item text = "Australia" id = menu_mod_merge_AU pad_choose_script = Merge_AU centered no_bg 
	theme_menu_add_item text = "New Orleans" id = menu_mod_merge_NO pad_choose_script = Merge_NO centered no_bg 
	theme_menu_add_item text = "Skatopia" id = menu_mod_merge_ST pad_choose_script = Merge_ST centered no_bg 
	theme_menu_add_item text = "Pro Skater" id = menu_mod_merge_SE pad_choose_script = Merge_SE centered no_bg 
	theme_menu_add_item text = "The Triangle" id = menu_mod_merge_SE2 pad_choose_script = Merge_SE2 centered no_bg 
	theme_menu_add_item text = "Los Angeles" id = menu_mod_merge_LA pad_choose_script = Merge_LA centered no_bg 
	theme_menu_add_item text = "School 1" id = menu_mod_merge_SC pad_choose_script = Merge_SC centered no_bg 
	theme_menu_add_item text = "Philly" id = menu_mod_merge_PH pad_choose_script = Merge_PH centered no_bg 
	theme_menu_add_item text = "Downhill Jam" id = menu_mod_merge_DJ pad_choose_script = Merge_DJ centered no_bg 
	theme_menu_add_item text = "Canada" id = menu_mod_merge_CA pad_choose_script = Merge_CA centered no_bg 
	theme_menu_add_item text = "Airport" id = menu_mod_merge_AP pad_choose_script = Merge_AP centered no_bg last_item 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bn=Back" } 
		] 
	} 
	finish_themed_scrolling_menu 
ENDSCRIPT

SCRIPT Merge_BO 
	mini_merge_level level_bo 
ENDSCRIPT

SCRIPT Merge_AU 
	mini_merge_level level_au 
ENDSCRIPT

SCRIPT Merge_BA 
	mini_merge_level level_ba 
ENDSCRIPT

SCRIPT Merge_BE 
	mini_merge_level level_be 
ENDSCRIPT

SCRIPT Merge_NO 
	mini_merge_level level_no 
ENDSCRIPT

SCRIPT Merge_ST 
	mini_merge_level level_st 
ENDSCRIPT

SCRIPT Merge_SE 
	mini_merge_level level_se 
ENDSCRIPT

SCRIPT Merge_SE2 
	mini_merge_level level_se2 
ENDSCRIPT

SCRIPT Merge_TR 
	mini_merge_level level_tr 
ENDSCRIPT

SCRIPT Merge_LA 
	mini_merge_level level_la 
ENDSCRIPT

SCRIPT Merge_SC 
	mini_merge_level level_sc 
ENDSCRIPT

SCRIPT Merge_PH 
	mini_merge_level level_ph 
ENDSCRIPT

SCRIPT Merge_DJ 
	mini_merge_level level_dj 
ENDSCRIPT

SCRIPT Merge_CA 
	mini_merge_level level_ca 
ENDSCRIPT

SCRIPT Merge_AP 
	mini_merge_level level_ap 
ENDSCRIPT

SCRIPT mini_merge_level level_number = 0 COIM_size = 1331200 
	printf "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" 
	printf "@@@ LEVELMERGE" 
	LoadScene scene = <level> 
	LoadCollision scene = <level> 
ENDSCRIPT


