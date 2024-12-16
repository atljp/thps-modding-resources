
SERVER_LEVEL_FLAGS = [ 
	SERVER_LEVEL_CHANGE_01_ON 
	SERVER_LEVEL_CHANGE_02_ON 
	SERVER_LEVEL_CHANGE_03_ON 
	SERVER_LEVEL_CHANGE_04_ON 
	SERVER_LEVEL_CHANGE_05_ON 
	SERVER_LEVEL_CHANGE_06_ON 
	SERVER_LEVEL_CHANGE_07_ON 
	SERVER_LEVEL_CHANGE_08_ON 
	SERVER_G_COMP_GEO_ON 
	SERVER_PROSET1_GEO_ON 
	SERVER_PROSET2_GEO_ON 
	SERVER_PROSET3_GEO_ON 
	SERVER_PROSET4_GEO_ON 
	SERVER_PROSET5_GEO_ON 
	SERVER_PROSET6_GEO_ON 
	SERVER_PROSET7_GEO_ON 
] 
SERVER_FLAGS_GLOBAL_FLAGS = [ 
	FLAG_AUTO_SERVER_MODE 
	FLAG_AUTO_LEVEL_MODE 
	SERVER_NO_WHORE 
	SERVER_CHEAT_DISABLE_AIRSHUFFLE 
	SERVER_CHEAT_DISABLE_BOOSTPLANT 
	SERVER_CHEAT_DISABLE_BUTTSLAP 
	SERVER_CHEAT_OLDSCHOOL_SPECIAL 
	SERVER_CHEAT_NO_REVERT_SPEED_LOSS 
	SERVER_CHEAT_DISABLE_HIGH_OLLIE 
] 
SERVER_FLAGS_CHEAT_FLAGS = [ 
	CHEAT_ON_1 
	CHEAT_ON_2 
	CHEAT_ON_3 
	CHEAT_ON_4 
	CHEAT_ON_5 
	CHEAT_ON_6 
	CHEAT_ON_7 
	CHEAT_ON_8 
	CHEAT_ON_9 
	CHEAT_ON_10 
	CHEAT_ON_11 
	CHEAT_ON_12 
	CHEAT_ON_13 
	CHEAT_ON_14 
	CHEAT_ON_15 
	CHEAT_ON_16 
	CHEAT_ON_17 
	CHEAT_ON_18 
	CHEAT_ON_19 
	CHEAT_ON_20 
	CHEAT_ON_21 
	CHEAT_ON_22 
	CHEAT_ON_23 
] 
SERVER_MSG_AUTOSERVER_ON = "The host enabled Auto-Server mode." 
SERVER_MSG_AUTOSERVER_OFF = "Auto-Server mode disabled." 
SERVER_MSG_AUTOLEVEL_ON = "Auto-Level mode on." 
SERVER_MSG_AUTOLEVEL_OFF = "Auto-Level mode off." 
SERVER_MSG_LEVELVOTE_ACTIVE = "Level Votes enabled. Press \\b8 to cast a vote." 
SCRIPT THUGPro_HandleServerInfo 
	printf "script THUGPro_HandleServerInfo" 
	Change LEVEL_TOD_STATE = <tod_state> 
	Change LEVEL_WEATHER_STATE = <weather_state> 
	IF ( <level_option_01> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_01_ON 
	ENDIF 
	IF ( <level_option_02> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_02_ON 
	ENDIF 
	IF ( <level_option_03> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_03_ON 
	ENDIF 
	IF ( <level_option_04> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_04_ON 
	ENDIF 
	IF ( <level_option_05> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_05_ON 
	ENDIF 
	IF ( <level_option_06> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_06_ON 
	ENDIF 
	IF ( <level_option_07> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_07_ON 
	ENDIF 
	IF ( <level_option_08> = 1 ) 
		SetGlobalFlag flag = SERVER_LEVEL_CHANGE_08_ON 
	ENDIF 
	IF ( ( ( LEVEL_ORIGINAL_GAME ) = THPS4 ) | ( LevelIs Load_NY ) ) 
		IF ( <level_proset_01> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET1_GEO_ON 
		ENDIF 
		IF ( <level_proset_02> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET2_GEO_ON 
		ENDIF 
		IF ( <level_proset_03> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET3_GEO_ON 
		ENDIF 
		IF ( <level_proset_04> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET4_GEO_ON 
		ENDIF 
		IF ( <level_proset_05> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET5_GEO_ON 
		ENDIF 
		IF ( <level_proset_06> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET6_GEO_ON 
		ENDIF 
		IF ( <level_proset_07> = 1 ) 
			SetGlobalFlag flag = SERVER_PROSET7_GEO_ON 
		ENDIF 
		IF ( <level_proset_08> = 1 ) 
			SetGlobalFlag flag = SERVER_G_COMP_GEO_ON 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPro_HandleUpdateTOD 
	printf "script THUGPro_HandleUpdateTOD" 
	IF NOT OnServer 
		thugpro_change_time_of_day tod_state = <tod_state> 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPro_HandleUpdateWeather 
	printf "script THUGPro_HandleUpdateWeather" 
	IF NOT OnServer 
	ENDIF 
ENDSCRIPT

SCRIPT _Server_ShowMessage_ClientOnly 
	IF NOT isHost 
		create_net_panel_message text = <msg> style = generic_net_panel_message 
	ENDIF 
ENDSCRIPT

SCRIPT _Server_ShowMessage 
	create_net_panel_message text = <msg> style = generic_net_panel_message 
ENDSCRIPT

SCRIPT _server_create_dialog_box { 
		title = "Notice" 
	} 
	IF NOT ScreenElementExists id = current_menu_anchor 
		IF NOT GotParam text 
			RETURN 
		ENDIF 
		dialog_box_exit 
		create_dialog_box { 
			title = <title> 
			text = <text> 
			text_dims = PAIR(320.00000000000, 0.00000000000) 
			buttons = [ 
				{ text = "Ok" pad_choose_script = dialog_box_exit } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT UnSetAllServerLevelFlags 
	printf "----------------------------------------------------------" 
	printf "UNSET ALL SERVER LEVEL OPTION FLAGS!!!" 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_01_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_02_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_03_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_04_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_05_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_06_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_07_ON 
	UnSetGlobalFlag flag = SERVER_LEVEL_CHANGE_08_ON 
	UnSetGlobalFlag flag = SERVER_G_COMP_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET1_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET2_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET3_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET4_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET5_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET6_GEO_ON 
	UnSetGlobalFlag flag = SERVER_PROSET7_GEO_ON 
	printf "----------------------------------------------------------" 
ENDSCRIPT

SCRIPT HandleLevelOptionObjects 
	printf "script HandleLevelOptionObjects" 
	GetLevelStructureName 
	<level_prefix> = ( <level_structure_name> . level ) 
	IF NOT GotParam cheat_flag 
		AddParams { SERVER_LEVEL_CHANGE_01 } 
		AddParams { SERVER_LEVEL_CHANGE_02 } 
		AddParams { SERVER_LEVEL_CHANGE_03 } 
		AddParams { SERVER_LEVEL_CHANGE_04 } 
		AddParams { SERVER_LEVEL_CHANGE_05 } 
		AddParams { SERVER_LEVEL_CHANGE_06 } 
		AddParams { SERVER_LEVEL_CHANGE_07 } 
		AddParams { SERVER_LEVEL_CHANGE_08 } 
	ELSE 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_01_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_01 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_02_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_02 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_03_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_03 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_04_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_04 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_05_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_05 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_06_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_06 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_07_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_07 } 
		ENDIF 
		IF ( <cheat_flag> = SERVER_LEVEL_CHANGE_08_ON ) 
			AddParams { SERVER_LEVEL_CHANGE_08 } 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_01 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_01" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_01_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_02 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_02" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_02_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_03 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_03" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_03_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_04 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_04" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_04_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_05 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_05" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_05_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_06 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_06" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_06_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_07 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_07" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_07_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SERVER_LEVEL_CHANGE_08 
		FormatText ChecksumName = toggle_script "%i_LEVEL_CHANGE_08" i = <level_prefix> 
		IF ScriptExists <toggle_script> 
			IF ( GetGlobalFlag flag = SERVER_LEVEL_CHANGE_08_ON ) 
				<toggle_script> on 
			ELSE 
				<toggle_script> off 
			ENDIF 
		ENDIF 
	ENDIF 
	KillAllTextureSplats 
ENDSCRIPT

SCRIPT Server_BroadcastAllFlags 
	IF NOT OnServer 
		RETURN 
	ENDIF 
	THUGPRO_AutoserverSetGamesToPlay games = ( AutoLevel_TotalGamesToPlay ) 
	GetArraySize SERVER_FLAGS_GLOBAL_FLAGS 
	i = 0 
	BEGIN 
		flag = ( ( SERVER_FLAGS_GLOBAL_FLAGS ) [ <i> ] ) 
		IF ( GetGlobalFlag flag = <flag> ) 
			BroadcastOmnigon cheat_flag = <flag> on 
		ELSE 
			BroadcastOmnigon cheat_flag = <flag> off 
		ENDIF 
		<i> = ( <i> + 1 ) 
	REPEAT <array_size> 
	RemoveParameter i 
	RemoveParameter array_size 
	RemoveParameter flag 
	GetArraySize SERVER_FLAGS_CHEAT_FLAGS 
	i = 0 
	BEGIN 
		flag = ( ( SERVER_FLAGS_CHEAT_FLAGS ) [ <i> ] ) 
		IF ( GetGlobalFlag flag = <flag> ) 
			BroadcastOmnigon cheat_flag = <flag> on 
		ELSE 
			BroadcastOmnigon cheat_flag = <flag> off 
		ENDIF 
		<i> = ( <i> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT level_options_cycle_tod 
	IF IsTrue LEVEL_USE_DEFAULT_TOD 
		thugpro_menu_change_tod state = afternoon 
		RETURN 
	ENDIF 
	IF ( GetGlobalFlag flag = SERVER_LEVEL_TOD_DAY_ON ) 
		thugpro_menu_change_tod state = afternoon 
	ENDIF 
	IF ( GetGlobalFlag flag = SERVER_LEVEL_TOD_NIGHT_ON ) 
		thugpro_menu_change_tod state = night 
	ENDIF 
	IF ( GetGlobalFlag flag = SERVER_LEVEL_TOD_MORNING_ON ) 
		thugpro_menu_change_tod state = morning 
	ENDIF 
	IF ( GetGlobalFlag flag = SERVER_LEVEL_TOD_EVENING_ON ) 
		thugpro_menu_change_tod state = evening 
	ENDIF 
ENDSCRIPT

SCRIPT HandleServerGlobalFlags 
	IF NOT GotParam on 
		IF ( <cheat_flag> = FLAG_AUTO_SERVER_MODE ) 
			IF ScreenElementExists id = autoserver_timer 
				DestroyScreenElement id = autoserver_timer 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <cheat_flag> = SERVER_CHEAT_OLDSCHOOL_SPECIAL ) 
		IF GotParam on 
			Change NewSpecial = 0 
		ELSE 
			Change NewSpecial = 1 
		ENDIF 
	ENDIF 
	IF ( <cheat_flag> = SERVER_CHEAT_NO_REVERT_SPEED_LOSS ) 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_reset_netgame_flags_and_cleanup 
	UnSetGlobalFlag flag = SERVER_NO_WHORE 
	UnSetGlobalFlag flag = SERVER_CHEAT_DISABLE_AIRSHUFFLE 
	UnSetGlobalFlag flag = SERVER_CHEAT_DISABLE_BOOSTPLANT 
	UnSetGlobalFlag flag = SERVER_CHEAT_DISABLE_BUTTSLAP 
	UnSetGlobalFlag flag = SERVER_CHEAT_OLDSCHOOL_SPECIAL 
	UnSetGlobalFlag flag = SERVER_CHEAT_NO_REVERT_SPEED_LOSS 
	UnSetGlobalFlag flag = SERVER_CHEAT_DISABLE_HIGH_OLLIE 
	Change NewSpecial = 1 
	printf "RESET AUOSERVER STUFF" 
	THUGPRO_AutoserverToggle off 
	UnSetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
	UnSetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
	UnSetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
	Change AutoLevel_GamesPlayed = 0 
	Change JoinedGameInProgress = 0 
	Change JoinedAsObserver = 0 
	THUGPRO_ClearConsoleMessages 
	THUGPRO_ClearBannedPlayers 
ENDSCRIPT

SCRIPT get_approx_num_level_options_items 
	IF IsTrue LEVEL_USE_DEFAULT_TOD 
		<num_items> = 0 
	ELSE 
		<num_items> = 1 
	ENDIF 
	GetLevelStructureName 
	FormatText ChecksumName = MenuArray "%i_option_items" i = ( <level_structure_name> . level ) 
	SizeOf ( <MenuArray> ) 
	IF GotParam ArraySize 
		<num_items> = ( <num_items> + <ArraySize> ) 
	ENDIF 
	IF ( ( ( LEVEL_ORIGINAL_GAME ) = THPS4 ) | ( LevelIs Load_NY ) ) 
		<num_items> = ( <num_items> + 1 ) 
	ENDIF 
	IF NOT InNetGame 
		IF ( ( LevelIs Load_SI ) | ( LevelIs Load_OIL ) ) 
			num_items = 0 
		ENDIF 
	ENDIF 
	RETURN num_items = <num_items> 
ENDSCRIPT

SCRIPT create_level_options_menu 
	thugpro_menu_create { 
		menu_name = level_options 
		menu_title = "Level Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = exit_level_options_menu 
		width_ajustment = 1.25000000000 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	GetLevelStructureName 
	IF OnServer 
		IF NOT IsTrue LEVEL_USE_DEFAULT_TOD 
			create_thugpro_net_toggle_item { 
				text = "Time Of Day" 
				id = menu_time_of_day 
				update_script = level_options_cycle_tod 
				flags = [ SERVER_LEVEL_TOD_DAY_ON SERVER_LEVEL_TOD_EVENING_ON SERVER_LEVEL_TOD_NIGHT_ON SERVER_LEVEL_TOD_MORNING_ON ] 
				extra_text_items = [ "Day" "Evening" "Night" "Morning" ] 
			} 
		ENDIF 
	ENDIF 
	GetLevelStructureName 
	FormatText ChecksumName = MenuArray "%i_option_items" i = ( <level_structure_name> . level ) 
	FormatText ChecksumName = LevelArray "%i_LevelChanges" i = ( <level_structure_name> . level ) 
	IF GlobalExists name = <MenuArray> type = array 
		ForEachIn <MenuArray> Do = create_thugpro_net_toggle_item params = { <...> <focus> } 
	ENDIF 
	IF InNetGame 
		IF GlobalExists name = <LevelArray> type = array 
			ForEachIn <LevelArray> Do = create_thugpro_net_toggle_item params = { <...> <focus> LEVEL_DYNAMIC message_next_round } 
		ENDIF 
	ENDIF 
	IF ( ( ( LEVEL_ORIGINAL_GAME ) = THPS4 ) | ( LevelIs Load_NY ) ) 
		IF NOT ( ( LevelIs load_lon ) | ( LevelIs load_alc ) | ( LevelIs load_kon ) | ( LevelIs load_cnv ) ) 
			IF NodeExists trg_G_COMP_restartnode 
				RemoveParameter proset_name 
				IF GlobalExists name = prosetcomp_name_string type = string 
					<proset_name> = ( prosetcomp_name_string ) 
				ELSE 
					<proset_name> = "Competition Ramps" 
				ENDIF 
				RemoveParameter cam_params 
				IF GlobalExists name = prosetcomp_camera_info type = structure 
					<cam_params> = ( prosetcomp_camera_info ) 
				ELSE 
					<cam_params> = { } 
				ENDIF 
				create_thugpro_net_toggle_item { 
					<cam_params> 
					text = <proset_name> 
					flag = SERVER_G_COMP_GEO_ON 
					toggle_script = { 
						on_script = toggle_geo_nomenu 
						on_script_params = toggle_comp_geo_params 
						off_script = toggle_geo_nomenu 
						off_script_params = toggle_comp_geo_params 
					} 
				} 
			ENDIF 
		ENDIF 
		IF ( ( NodeExists trg_Proset1_restartnode ) | ( NodeExists TRG_NY_RE_Start ) ) 
			RemoveParameter proset_name 
			IF GlobalExists name = proset1_name_string type = string 
				<proset_name> = ( proset1_name_string ) 
			ELSE 
				<proset_name> = "Proset 1" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset1_camera_info type = structure 
				<cam_params> = ( proset1_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET1_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset1_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset1_params 
				} 
			} 
		ENDIF 
		IF NodeExists trg_Proset2_restartnode 
			RemoveParameter proset_name 
			IF GlobalExists name = proset2_name_string type = string 
				<proset_name> = ( proset2_name_string ) 
			ELSE 
				<proset_name> = "Proset 2" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset2_camera_info type = structure 
				<cam_params> = ( proset2_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET2_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset2_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset2_params 
				} 
			} 
		ENDIF 
		IF ( ( NodeExists trg_Proset3_restartnode ) | ( NodeExists TRG_FrontOfBarn ) ) 
			RemoveParameter proset_name 
			IF GlobalExists name = proset3_name_string type = string 
				<proset_name> = ( proset3_name_string ) 
			ELSE 
				<proset_name> = "Proset 3" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset3_camera_info type = structure 
				<cam_params> = ( proset3_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET3_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset3_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset3_params 
				} 
			} 
		ENDIF 
		IF NodeExists trg_Proset4_restartnode 
			RemoveParameter proset_name 
			IF GlobalExists name = proset4_name_string type = string 
				<proset_name> = ( proset4_name_string ) 
			ELSE 
				<proset_name> = "Proset 4" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset4_camera_info type = structure 
				<cam_params> = ( proset4_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET4_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset4_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset4_params 
				} 
			} 
		ENDIF 
		IF ( ( NodeExists trg_Proset5_restartnode ) | ( NodeExists TRG_Proset5_1486 ) ) 
			RemoveParameter proset_name 
			IF GlobalExists name = proset5_name_string type = string 
				<proset_name> = ( proset5_name_string ) 
			ELSE 
				<proset_name> = "Proset 5" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset5_camera_info type = structure 
				<cam_params> = ( proset5_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET5_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset5_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset5_params 
				} 
			} 
		ENDIF 
		IF NodeExists trg_Proset6_restartnode 
			RemoveParameter proset_name 
			IF GlobalExists name = proset6_name_string type = string 
				<proset_name> = ( proset6_name_string ) 
			ELSE 
				<proset_name> = "Proset 6" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset6_camera_info type = structure 
				<cam_params> = ( proset6_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET6_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset6_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset6_params 
				} 
			} 
		ENDIF 
		IF NodeExists trg_Proset7_restartnode 
			RemoveParameter proset_name 
			IF GlobalExists name = proset7_name_string type = string 
				<proset_name> = ( proset7_name_string ) 
			ELSE 
				<proset_name> = "Proset 7" 
			ENDIF 
			RemoveParameter cam_params 
			IF GlobalExists name = proset7_camera_info type = structure 
				<cam_params> = ( proset7_camera_info ) 
			ELSE 
				<cam_params> = { } 
			ENDIF 
			create_thugpro_net_toggle_item { 
				<cam_params> 
				text = <proset_name> 
				flag = SERVER_PROSET7_GEO_ON 
				toggle_script = { 
					on_script = toggle_geo_nomenu 
					on_script_params = toggle_proset7_params 
					off_script = toggle_geo_nomenu 
					off_script_params = toggle_proset7_params 
				} 
			} 
		ENDIF 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_thugpro_net_toggle_item { 
		pad_choose_script = nullscript 
	} 
	IF GotParam LEVEL_DYNAMIC 
		IF NOT GotParam flag 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam net_only 
		IF NOT InNetGame 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam lobby_only 
		IF NOT GameModeEquals is_lobby 
			<focusable> = not_focusable 
		ENDIF 
	ENDIF 
	IF GotParam not_in_observe 
		IF InNetGame 
			IF IsObserving 
				<focusable> = not_focusable 
			ENDIF 
			IF IsTrue THUGPRO_ObserveOn 
				<focusable> = not_focusable 
			ENDIF 
			IF IsSurveying 
				<focusable> = not_focusable 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam desc 
		<text> = <desc> 
		RemoveParameter desc 
	ENDIF 
	IF GotParam not_focusable 
		make_thugpro_menu_item { text = <text> not_focusable } 
	ELSE 
		IF GotParam flags 
			<pad_choose_script> = SERVER_OPTION_TOGGLE_MULTI_ITEM 
			<pad_choose_params> = { 
				flags = <flags> 
				extra_text_items = <extra_text_items> 
				update_script = <update_script> 
				menu_item_id = <id> 
				new_style 
			} 
			GetIndexOfSetFlag flags = <flags> 
			<extra_text> = ( <extra_text_items> [ <flag_index> ] ) 
		ELSE 
			<pad_choose_script> = SERVER_OPTION_TOGGLE_ITEM 
			<pad_choose_params> = { flag = <flag> new_style } 
			IF GotParam inverted 
				IF ( GetGlobalFlag flag = <flag> ) 
					<extra_text> = "Off" 
				ELSE 
					<extra_text> = "On" 
				ENDIF 
			ELSE 
				IF ( GetGlobalFlag flag = <flag> ) 
					<extra_text> = "On" 
				ELSE 
					<extra_text> = "Off" 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GotParam toggle_script 
			<pad_choose_script> = SERVER_OPTION_TOGGLE_ITEM 
			<pad_choose_params> = ( <toggle_script> + { flag = <flag> new_style } ) 
		ENDIF 
		make_thugpro_menu_item { 
			text = <text> 
			extra_text = <extra_text> 
			description_text = <description_text> 
			focus_script = server_menu_focus_show_object 
			focus_params = <...> 
			option_arrows pad_choose 
			option_arrows_callback = <pad_choose_script> 
			option_arrows_callback_params = <pad_choose_params> 
			<focusable> 
		} 
		IF GotParam menu_item_id 
			IF GotParam inverted 
				<menu_item_id> : SetTags inverted = 1 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_game_modifiers_menu 
	thugpro_menu_create { 
		menu_name = style_test_middle_centered 
		menu_title = "Game Modifiers" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = exit_server_menu 
		show_description_panel 
		num_items_to_show = 11 
		scrolling boxed 
	} 
	IF InNetGame 
		create_thugpro_net_toggle_item { 
			text = "No Reverts" 
			flag = FLAG_G_EXPERT_MODE_NO_REVERTS 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "No Walking" 
			flag = FLAG_G_EXPERT_MODE_NO_WALKING 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "No Manuals" 
			flag = FLAG_G_EXPERT_MODE_NO_MANUALS 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "No Balance Meters" 
			flag = NO_G_DISPLAY_BALANCE 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Oldschool Special Mode" 
			flag = SERVER_CHEAT_OLDSCHOOL_SPECIAL 
			description_text = "Requires landing your combo to build the Special Meter" 
			<focusable> 
			toggle_script = { 
				on_script = Change on_script_params = { NewSpecial = 0 } 
				off_script = Change off_script_params = { NewSpecial = 1 } 
			} 
		} 
		create_thugpro_net_toggle_item { 
			text = "Disable Airshuffle" 
			flag = SERVER_CHEAT_DISABLE_AIRSHUFFLE 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Disable Boostplant" 
			flag = SERVER_CHEAT_DISABLE_BOOSTPLANT 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Disable Buttslaps" 
			flag = SERVER_CHEAT_DISABLE_BUTTSLAP 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Disable Manual boost" 
			description_text = "No speed boost gained from Special Manual Tricks" 
			flag = SERVER_NO_WHORE 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Disable Boned Ollies" 
			flag = SERVER_CHEAT_DISABLE_HIGH_OLLIE 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Disable Revert Friction" 
			description_text = "No speed loss when landing in Revert" 
			flag = SERVER_CHEAT_NO_REVERT_SPEED_LOSS 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Moon Gravity" 
			flag = CHEAT_MOON 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Super Blood" 
			flag = CHEAT_super_blood 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Always Special" 
			flag = CHEAT_ALWAYS_SPECIAL 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Perfect Manual" 
			flag = CHEAT_PERFECT_MANUAL 
			<focusable> 
		} 
		create_thugpro_net_toggle_item { 
			text = "Perfect Rail" 
			flag = CHEAT_PERFECT_RAIL 
			<focusable> 
		} 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT exit_level_options_menu 
	restore_skater_camera 
	IF ObjectExists id = server_anchor 
		DestroyScreenElement id = server_anchor 
	ENDIF 
	IF InNetGame 
		create_pre_network_host_options_menu 
	ELSE 
		create_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT exit_server_menu 
	restore_skater_camera 
	IF ObjectExists id = server_anchor 
		DestroyScreenElement id = server_anchor 
	ENDIF 
	IF InNetGame 
		create_pre_network_host_options_menu 
	ELSE 
		create_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT SERVER_OPTION_TOGGLE_MULTI_ITEM 
	GetTags 
	<_flags> = <flags> 
	<_text_items> = <extra_text_items> 
	IF ChecksumEquals a = <menu_item_id> b = menu_time_of_day 
		IF NOT IsTrue TOD_CHANGE_IS_DONE 
			RETURN 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF NOT isHost 
			RETURN 
		ENDIF 
	ENDIF 
	GetArraySize <_flags> 
	GetNumFlagsSetFromArray flags = <_flags> 
	IF ( <num_flags> = 0 ) 
		UnsetFlagsExcept flags = <_flags> ex_flag = ( <_flags> [ 0 ] ) toggle_flag 
	ENDIF 
	GetIndexOfSetFlag flags = <_flags> 
	IF GotParam left 
		index_previous_wraparound index = <flag_index> max = <array_size> 
		printf "LEFT" 
	ELSE 
		index_next_wraparound index = <flag_index> max = <array_size> 
		printf "RIGHT" 
	ENDIF 
	UnsetFlagsExcept flags = <_flags> ex_flag = ( <_flags> [ <index> ] ) toggle_flag 
	IF GotParam new_style 
		thugpro_menu_item_update_extra_text id = <id> text = ( <_text_items> [ <index> ] ) 
	ELSE 
		SetScreenElementProps id = { <id> child = 1 } text = ( <_text_items> [ <index> ] ) 
	ENDIF 
	IF GotParam update_script 
		<update_script> 
	ENDIF 
ENDSCRIPT

SCRIPT SERVER_OPTION_TOGGLE_ITEM 
	IF NOT OnServer 
		RETURN 
	ENDIF 
	GetTags 
	IF GotParam new_style 
		IF GotParam flag 
			IF GetGlobalFlag flag = <flag> 
				UnSetGlobalFlag flag = <flag> 
				BroadcastOmnigon cheat_flag = <flag> off 
				IF GotParam off_script 
					<off_script> <off_script_params> 
				ENDIF 
				IF GotParam inverted 
					thugpro_menu_item_update_extra_text id = <id> on 
				ELSE 
					thugpro_menu_item_update_extra_text id = <id> off 
				ENDIF 
			ELSE 
				SetGlobalFlag flag = <flag> 
				BroadcastOmnigon cheat_flag = <flag> on 
				IF GotParam on_script 
					<on_script> <on_script_params> 
				ENDIF 
				IF GotParam inverted 
					thugpro_menu_item_update_extra_text id = <id> off 
				ELSE 
					thugpro_menu_item_update_extra_text id = <id> on 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF GetGlobalFlag flag = <flag> 
			UnSetGlobalFlag flag = <flag> 
			BroadcastOmnigon cheat_flag = <flag> off 
			IF GotParam off_script 
				<off_script> <off_script_params> 
			ENDIF 
			<check_rgba> = [ 0 0 0 0 ] 
		ELSE 
			SetGlobalFlag flag = <flag> 
			BroadcastOmnigon cheat_flag = <flag> on 
			IF GotParam on_script 
				<on_script> <on_script_params> 
			ENDIF 
			<check_rgba> = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		ENDIF 
		DoScreenElementMorph { 
			id = { <id> child = 2 } 
			rgba = <check_rgba> 
		} 
	ENDIF 
ENDSCRIPT

SERVER_AREA_CURRENT_RESTART = trg_G_COMP_restartnode 
SERVER_AREA_MESSAGE = "" 
GOAL_COMP_ELIMNATE_INSTANT = 1 
GOAL_COMP_INSIDE = 1 
GOAL_COMP_ELIMNATE_TIME = 5 
SCRIPT GOAL_COMP_StartElimiCountdown 
ENDSCRIPT

SCRIPT goal_comp_leave_area 
ENDSCRIPT

SCRIPT goal_comp_enter_area 
ENDSCRIPT

SCRIPT goal_comp_out_of_bounds_text 
	DoMorph time = 0 pos = PAIR(320.00000000000, 140.00000000000) 
ENDSCRIPT

toggle_comp_geo_params = { 
	flag = SERVER_G_COMP_GEO_ON 
	geo_prefix = "G_COMP" 
	trg_prefix = "TRG_G_COMP" 
	trg_2_prefix = "TRG_COMP" 
	geo_not_prefix = "G_COMPNOT" 
	trg_not_prefix = "TRG_G_COMPNOT" 
} 
toggle_proset1_params = { 
	param_id = toggle_proset1_params 
	flag = SERVER_PROSET1_GEO_ON 
	geo_prefix = "Proset1" 
	trg_prefix = "TRG_Proset1" 
	geo_not_prefix = "PROSET1NOT" 
	trg_not_prefix = "TRG_PROSET1NOT" 
} 
toggle_proset2_params = { 
	param_id = toggle_proset2_params 
	flag = SERVER_PROSET2_GEO_ON 
	geo_prefix = "Proset2" 
	trg_prefix = "TRG_Proset2" 
	geo_not_prefix = "PROSET2NOT" 
	trg_not_prefix = "TRG_PROSET2NOT" 
} 
toggle_proset3_params = { 
	param_id = toggle_proset3_params 
	flag = SERVER_PROSET3_GEO_ON 
	geo_prefix = "Proset3" 
	trg_prefix = "TRG_Proset3" 
	geo_not_prefix = "PROSET3NOT" 
	trg_not_prefix = "TRG_PROSET3NOT" 
} 
toggle_proset4_params = { 
	param_id = toggle_proset4_params 
	flag = SERVER_PROSET4_GEO_ON 
	geo_prefix = "Proset4" 
	trg_prefix = "TRG_Proset4" 
	geo_not_prefix = "PROSET4NOT" 
	trg_not_prefix = "TRG_PROSET4NOT" 
} 
toggle_proset5_params = { 
	param_id = toggle_proset5_params 
	flag = SERVER_PROSET5_GEO_ON 
	geo_prefix = "Proset5" 
	trg_prefix = "TRG_Proset5" 
	geo_not_prefix = "PROSET5NOT" 
	trg_not_prefix = "TRG_PROSET5NOT" 
} 
toggle_proset6_params = { 
	param_id = toggle_proset6_params 
	flag = SERVER_PROSET6_GEO_ON 
	geo_prefix = "Proset6" 
	trg_prefix = "TRG_Proset6" 
	geo_not_prefix = "PROSET6NOT" 
	trg_not_prefix = "TRG_PROSET6NOT" 
} 
toggle_proset7_params = { 
	param_id = toggle_proset7_params 
	flag = SERVER_PROSET7_GEO_ON 
	geo_prefix = "Proset7" 
	trg_prefix = "TRG_Proset7" 
	geo_not_prefix = "PROSET7NOT" 
	trg_not_prefix = "TRG_PROSET7NOT" 
} 
SCRIPT HandleProtrickObjects 
	IF GotParam cheat_flag 
		IF ( <cheat_flag> = SERVER_G_COMP_GEO_ON ) 
			toggle_geo_nomenu toggle_comp_geo_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET1_GEO_ON ) 
			toggle_geo_nomenu toggle_proset1_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET2_GEO_ON ) 
			toggle_geo_nomenu toggle_proset2_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET3_GEO_ON ) 
			toggle_geo_nomenu toggle_proset3_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET4_GEO_ON ) 
			toggle_geo_nomenu toggle_proset4_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET5_GEO_ON ) 
			toggle_geo_nomenu toggle_proset5_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET6_GEO_ON ) 
			toggle_geo_nomenu toggle_proset6_params 
		ENDIF 
		IF ( <cheat_flag> = SERVER_PROSET7_GEO_ON ) 
			toggle_geo_nomenu toggle_proset7_params 
		ENDIF 
	ELSE 
		toggle_geo_nomenu toggle_comp_geo_params 
		toggle_geo_nomenu toggle_proset1_params 
		toggle_geo_nomenu toggle_proset2_params 
		toggle_geo_nomenu toggle_proset3_params 
		toggle_geo_nomenu toggle_proset4_params 
		toggle_geo_nomenu toggle_proset5_params 
		toggle_geo_nomenu toggle_proset6_params 
		toggle_geo_nomenu toggle_proset7_params 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_geo_nomenu 
	KillAllTextureSplats 
	kill prefix = <geo_prefix> 
	kill prefix = <trg_prefix> 
	IF GotParam trg_2_prefix 
		kill prefix = <trg_2_prefix> 
	ENDIF 
	kill prefix = <geo_not_prefix> 
	kill prefix = <trg_not_prefix> 
	create prefix = <geo_not_prefix> 
	create prefix = <trg_not_prefix> 
	IF GetGlobalFlag flag = <flag> 
		create prefix = <geo_prefix> 
		create prefix = <trg_prefix> 
		IF GotParam trg_2_prefix 
			create prefix = <trg_2_prefix> 
		ENDIF 
		kill prefix = <geo_not_prefix> 
		kill prefix = <trg_not_prefix> 
		kill prefix = "TRG_G_COMP_Spectator" 
		IF LevelIs Load_sch 
			THUGPRO_SafeKill name = G_COMP_Ramp04 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT server_menu_focus_show_object 
	IF GotParam camera_pos 
		IF NOT ObjectExists id = menu_cam 
			create_menu_camera 
		ENDIF 
		menu_cam : unpause 
		menu_cam : Obj_SetPosition position = <camera_pos> 
		menu_cam : Obj_SetOrientation dir = <camera_dir> 
		SetActiveCamera id = menu_cam 
	ELSE 
		restore_skater_camera 
	ENDIF 
ENDSCRIPT

SCRIPT Add_Generic_Th4_Goals 
	AddGoal_HighScore { 
		unlimited_Time 
		full_name = "Tony Hawk" 
		Goal_Text = "High Score - 400,000 points" 
		View_Goals_Text = "High Score - 400,000 points" 
		goal_description = "High Score - 400,000 points" 
		score = THUGPRO_G_HighScore 
	} 
	AddGoal_ProScore { 
		unlimited_Time 
		Goal_Text = "Pro Score - 800,000 points" 
		View_Goals_Text = "Pro Score - 800,000 points" 
		goal_description = "Pro Score - 800,000 points" 
		score = THUGPRO_G_ProScore 
	} 
	AddGoal_SickScore { 
		unlimited_Time 
		Goal_Text = "Sick Score - 1,250,000 points" 
		View_Goals_Text = "Sick Score - 1,250,000 points" 
		goal_description = "Sick Score - 1,250,000 points" 
		score = THUGPRO_G_SickScore 
	} 
	AddGoal_Combo { 
		full_name = "Security" 
		Goal_Text = "Collect C-O-M-B-O" 
		View_Goals_Text = "Collect the C-O-M-B-O letters" 
		goal_description = "Collect the C-O-M-B-O letters" 
		unlimited_Time 
		letter_info = [ 
			{ obj_id = TRG_Goal_Combo_C text = "C" } 
			{ obj_id = TRG_Goal_Combo_O text = "O" } 
			{ obj_id = TRG_Goal_Combo_M text = "M" } 
			{ obj_id = TRG_Goal_Combo_B text = "B" } 
			{ obj_id = TRG_Goal_Combo_O2 text = "O" } 
		] 
	} 
	AddGoal_ProCombo { 
		full_name = "Security" 
		Goal_Text = "Collect C-O-M-B-O" 
		View_Goals_Text = "Collect the C-O-M-B-O letters" 
		goal_description = "Collect the C-O-M-B-O letters" 
		unlimited_Time 
		trigger_obj_id = TRG_G_Proline_Pro 
		restart_node = TRG_G_Proline_RestartNode 
		letter_info = [ 
			{ obj_id = TRG_Goal_Proline_C text = "C" } 
			{ obj_id = TRG_Goal_Proline_O text = "O" } 
			{ obj_id = TRG_Goal_Proline_M text = "M" } 
			{ obj_id = TRG_Goal_Proline_B text = "B" } 
			{ obj_id = TRG_Goal_Proline_O2 text = "O" } 
		] 
	} 
	AddGoal_Skate { 
		full_name = "Security" 
		Goal_Text = "Collect S-K-A-T-E" 
		View_Goals_Text = "Collect the S-K-A-T-E letters" 
		goal_description = "Collect the S-K-A-T-E letters" 
		unlimited_Time 
	} 
ENDSCRIPT


