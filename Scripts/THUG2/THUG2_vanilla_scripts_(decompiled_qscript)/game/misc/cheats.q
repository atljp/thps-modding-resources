
CHEAT_SUPER_BLOOD = CHEAT_ON_1 
CHEAT_ALWAYS_SPECIAL = CHEAT_ON_2 
CHEAT_PERFECT_RAIL = CHEAT_ON_3 
CHEAT_STATS_13 = CHEAT_ON_4 
CHEAT_COOL_SPECIAL_TRICKS = CHEAT_ON_5 
CHEAT_MATRIX = CHEAT_ON_6 
CHEAT_PERFECT_MANUAL = CHEAT_ON_7 
CHEAT_KID = CHEAT_ON_8 
CHEAT_MOON = CHEAT_ON_9 
CHEAT_SIM = CHEAT_ON_10 
CHEAT_GORILLA = CHEAT_ON_11 
CHEAT_PERFECT_SKITCH = CHEAT_ON_12 
CHEAT_BIGHEAD = CHEAT_ON_13 
CHEAT_HOVERBOARD = CHEAT_ON_14 
CHEAT_SLOMO = CHEAT_ON_15 
CHEAT_DISCO = CHEAT_ON_16 
CHEAT_INVISIBLE = CHEAT_ON_17 
CHEAT_FLAME = CHEAT_ON_18 
CHEAT_INLINE = CHEAT_ON_19 
SCRIPT client_toggle_cheat 
	IF GotParam on 
		SetGlobalFlag flag = <cheat_flag> 
	ELSE 
		UnSetGlobalFlag flag = <cheat_flag> 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_cheat 
	IF InNetGame 
		IF OnServer 
			IF ( GetGlobalFlag flag = <cheat_flag> ) 
				BroadcastOmnigon <...> off 
			ELSE 
				BroadcastOmnigon <...> on 
			ENDIF 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT OmnigonAllowed <...> 
			RETURN 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT LastBroadcastedOmnigonWas <...> 
			RETURN 
		ENDIF 
	ENDIF 
	IF LastBroadcastedOmnigonWas cheat_flag = CHEAT_MADE_UP 
		RETURN 
	ENDIF 
	GetTags 
	IF ( GetGlobalFlag flag = <cheat_flag> ) 
		SetScreenelementProps id = { <id> child = 3 } text = "Off" 
		UnSetGlobalFlag flag = <cheat_flag> 
		IF GotParam off_callback 
			<off_callback> <...> 
		ENDIF 
	ELSE 
		SetScreenelementProps id = { <id> child = 3 } text = "On" 
		SetGlobalFlag flag = <cheat_flag> 
		IF ( <cheat_flag> = CHEAT_BIGHEAD ) 
			IF ScreenElementExists id = menu_gorilla 
				SetScreenelementProps id = { menu_gorilla child = 3 } text = "Off" 
				UnSetGlobalFlag flag = CHEAT_GORILLA 
			ENDIF 
		ENDIF 
		IF ( <cheat_flag> = CHEAT_GORILLA ) 
			IF ScreenElementExists id = menu_bighead 
				SetScreenelementProps id = { menu_bighead child = 0 } text = "Off" 
				UnSetGlobalFlag flag = CHEAT_BIGHEAD 
			ENDIF 
		ENDIF 
		IF GotParam on_callback 
			<on_callback> <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT unlock_all_cheat_codes 
	SetGlobalFlag flag = CHEAT_UNLOCKED_1 
	SetGlobalFlag flag = CHEAT_UNLOCKED_3 
	SetGlobalFlag flag = CHEAT_UNLOCKED_5 
	SetGlobalFlag flag = CHEAT_UNLOCKED_10 
ENDSCRIPT

SCRIPT unlock_all_gameplay_cheat_codes 
	SetGlobalFlag flag = CHEAT_UNLOCKED_12 
	SetGlobalFlag flag = CHEAT_UNLOCKED_13 
	SetGlobalFlag flag = CHEAT_UNLOCKED_14 
	SetGlobalFlag flag = CHEAT_UNLOCKED_16 
	SetGlobalFlag flag = CHEAT_UNLOCKED_17 
ENDSCRIPT

SCRIPT unlock_all_sponsors 
ENDSCRIPT

SCRIPT unlock_all_cheats 
	unlock_all_gameplay_cheat_codes 
	cheat_unlockmovies 
	cheat_reallygivelevels 
	cheat_give_skaters 
	SetGlobalFlag flag = CAREER_STARTED 
	unlock_all_sponsors 
	unlock_all_cutscenes 
	cheat_unlock_pedgroup1 
	cheat_unlock_pedgroup2 
	cheat_unlock_pedgroup3 
	cheat_unlock_pedgroup4 
	cheat_unlock_pedgroup5 
	cheat_unlock_pedgroup6 
	cheat_unlock_pedgroup7 
	cheat_unlock_pedgroup8 
	cheat_unlock_pedgroup9 
ENDSCRIPT

SCRIPT cheat_give_skaters 
	SetGlobalFlag flag = SKATER_UNLOCKED_PRICE_PC 
	SetGlobalFlag flag = SKATER_UNLOCKED_SECRETPC2 
	SetGlobalFlag flag = SKATER_UNLOCKED_SHREK 
	SetGlobalFlag flag = SKATER_UNLOCKED_SOLDIER 
	SetGlobalFlag flag = SKATER_UNLOCKED_PHIL 
	SetGlobalFlag flag = SKATER_UNLOCKED_HAND 
	SetGlobalFlag flag = SKATER_UNLOCKED_PAULIE 
	SetGlobalFlag flag = SKATER_UNLOCKED_NIGEL 
	SetGlobalFlag flag = SKATER_UNLOCKED_THPS 
	SetGlobalFlag flag = SKATER_UNLOCKED_STEVEO 
	SetGlobalFlag flag = SKATER_UNLOCKED_JESSEJAMES 
	SetGlobalFlag flag = SKATER_UNLOCKED_NATAS 
	cheat_give_story_skaters 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP1 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP2 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP3 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP4 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP5 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP6 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP7 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP8 
ENDSCRIPT

SCRIPT unlock_PC_secret_character1 
	SetGlobalFlag flag = SKATER_UNLOCKED_PRICE_PC 
ENDSCRIPT

SCRIPT unlock_PC_secret_character2 
	SetGlobalFlag flag = SKATER_UNLOCKED_SECRETPC2 
ENDSCRIPT

SCRIPT cheat_give_story_skaters 
	SetGlobalFlag flag = SKATER_UNLOCKED_BENFRANKLIN 
	SetGlobalFlag flag = SKATER_UNLOCKED_BULLFIGHTER 
	SetGlobalFlag flag = SKATER_UNLOCKED_GRAFFITITAGGER 
	SetGlobalFlag flag = SKATER_UNLOCKED_SHRIMPVENDOR 
	SetGlobalFlag flag = SKATER_UNLOCKED_JESTER 
	SetGlobalFlag flag = SKATER_UNLOCKED_SHECKLER 
ENDSCRIPT

SCRIPT cheat_sce_patchtest 
	SceAltPt 
ENDSCRIPT

SCRIPT cheat_give_shrek 
	SetGlobalFlag flag = SKATER_UNLOCKED_SHREK 
ENDSCRIPT

SCRIPT cheat_give_soldier 
	SetGlobalFlag flag = SKATER_UNLOCKED_SOLDIER 
ENDSCRIPT

SCRIPT cheat_give_phil 
	SetGlobalFlag flag = SKATER_UNLOCKED_PHIL 
ENDSCRIPT

SCRIPT cheat_give_hand 
	SetGlobalFlag flag = SKATER_UNLOCKED_HAND 
ENDSCRIPT

SCRIPT cheat_give_paulie 
	SetGlobalFlag flag = SKATER_UNLOCKED_PAULIE 
ENDSCRIPT

SCRIPT cheat_give_nigel 
	SetGlobalFlag flag = SKATER_UNLOCKED_NIGEL 
ENDSCRIPT

SCRIPT cheat_give_steveo 
	SetGlobalFlag flag = SKATER_UNLOCKED_STEVEO 
ENDSCRIPT

SCRIPT cheat_give_jesse 
	SetGlobalFlag flag = SKATER_UNLOCKED_JESSEJAMES 
ENDSCRIPT

SCRIPT cheat_give_thps 
	SetGlobalFlag flag = SKATER_UNLOCKED_THPS 
ENDSCRIPT

SCRIPT cheat_give_natas 
	SetGlobalFlag flag = SKATER_UNLOCKED_NATAS 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup1 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP1 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup2 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP2 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup3 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP3 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup4 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP4 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup5 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP5 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup6 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP6 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup7 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP7 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup8 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP8 
ENDSCRIPT

SCRIPT cheat_unlock_pedgroup9 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDS 
	SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP9 
ENDSCRIPT

SCRIPT cheat_unlockmovies 
	SetGlobalFlag flag = MOVIE_UNLOCKED_WDT 
	SetGlobalFlag flag = MOVIE_UNLOCKED_PRO_BAILS 
	SetGlobalFlag flag = MOVIE_UNLOCKED_PRO_BAILS2 
	SetGlobalFlag flag = MOVIE_UNLOCKED_NS_BAILS 
ENDSCRIPT

SCRIPT cheat_xxx 
	printf "Cheat without a cheatscript" 
ENDSCRIPT

SCRIPT cheat_give_neversoft_skaters 
	change give_neversoft_skaters = 1 
ENDSCRIPT

SCRIPT cheat_select_shift 
	change select_shift = 1 
ENDSCRIPT

SCRIPT cheat_playsound_good 
	PlaySound CheatGood 
ENDSCRIPT

SCRIPT cheat_playsound_bad 
	printf "******************Playing Cheat Bad Sound*****************" 
	PlaySound CheatBad 
ENDSCRIPT

SCRIPT cheat_reallygivelevels 
	printf "unlocking levels" 
	change DEMO_BUILD = 0 
	SetGlobalFlag flag = LEVEL_UNLOCKED_TR 
	SetGlobalFlag flag = LEVEL_UNLOCKED_BO 
	SetGlobalFlag flag = LEVEL_UNLOCKED_BA 
	SetGlobalFlag flag = LEVEL_UNLOCKED_BE 
	SetGlobalFlag flag = LEVEL_UNLOCKED_AU 
	SetGlobalFlag flag = LEVEL_UNLOCKED_NO 
	SetGlobalFlag flag = LEVEL_UNLOCKED_ST 
	SetGlobalFlag flag = LEVEL_UNLOCKED_SE 
	unlock_all_chapters 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_1 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_2 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_3 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_4 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_5 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_6 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_7 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_8 
	SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_9 
	SetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2 
	SetGlobalFlag flag = LEVEL_SEEN_TR 
	SetGlobalFlag flag = LEVEL_SEEN_BO 
	SetGlobalFlag flag = LEVEL_SEEN_BA 
	SetGlobalFlag flag = LEVEL_SEEN_BE 
	SetGlobalFlag flag = LEVEL_SEEN_AU 
	SetGlobalFlag flag = LEVEL_SEEN_NO 
	SetGlobalFlag flag = LEVEL_SEEN_ST 
	SetGlobalFlag flag = LEVEL_SEEN_SE 
	SetGlobalFlag flag = LEVEL_SEEN_SE2 
	SetGlobalFlag flag = LEVEL_SEEN_SC 
	SetGlobalFlag flag = LEVEL_SEEN_PH 
	SetGlobalFlag flag = LEVEL_SEEN_DJ 
	SetGlobalFlag flag = LEVEL_SEEN_LA 
	SetGlobalFlag flag = LEVEL_SEEN_CA 
	SetGlobalFlag flag = LEVEL_SEEN_AP 
ENDSCRIPT

SCRIPT cheat_unlock_always_special 
	SetGlobalFlag flag = CHEAT_UNLOCKED_12 
ENDSCRIPT

SCRIPT cheat_unlock_perfect_rail 
	SetGlobalFlag flag = CHEAT_UNLOCKED_13 
ENDSCRIPT

SCRIPT cheat_unlock_perfect_skitch 
	SetGlobalFlag flag = CHEAT_UNLOCKED_14 
ENDSCRIPT

SCRIPT cheat_unlock_perfect_manual 
	SetGlobalFlag flag = CHEAT_UNLOCKED_16 
ENDSCRIPT

SCRIPT cheat_unlock_moon_grav 
	SetGlobalFlag flag = CHEAT_UNLOCKED_17 
ENDSCRIPT


