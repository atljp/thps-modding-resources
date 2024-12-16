
SCRIPT check_command_exist 
	printf "script: check_command_exist" 
	IF NOT GotParam string 
		RETURN not_a_command 
	ENDIF 
	IF NOT GotParam isLocal 
		isLocal = 0 
	ENDIF 
	GetUpperCaseString <string> 
	StringToCharArray string = <UpperCaseString> 
	IF ( ( ( <char_array> [ 0 ] ) = "/" ) | ( ( <char_array> [ 0 ] ) = "%" ) | ( ( <char_array> [ 0 ] ) = "7" ) ) 
		GetArraySize <char_array> 
		index = 0 
		t_cmd = "" 
		t_params = "" 
		has_command = 0 
		has_params = 0 
		BEGIN 
			IF NOT ( ( <char_array> [ <index> ] ) = "," ) 
				IF ( <has_command> = 0 ) 
					FormatText textname = str "%t%s" t = <t_cmd> s = ( <char_array> [ <index> ] ) 
					<t_cmd> = ( <str> ) 
					<index> = ( <index> + 1 ) 
				ENDIF 
			ELSE 
				IF ( <has_command> = 0 ) 
					<has_command> = 1 
					<index> = ( <index> + 1 ) 
					BREAK 
				ENDIF 
			ENDIF 
		REPEAT <array_size> 
		IF ( <has_command> = 1 ) 
			new_end = ( <array_size> - <index> ) 
			BEGIN 
				IF ( <index> < <array_size> ) 
					FormatText textname = str "%t%s" t = <t_params> s = ( <char_array> [ <index> ] ) 
					<t_params> = ( <str> ) 
					<index> = ( <index> + 1 ) 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT <new_end> 
			IF ( <t_params> = "" ) 
				<has_params> = 0 
			ELSE 
				<has_params> = 1 
			ENDIF 
		ELSE 
			<has_params> = 0 
		ENDIF 
		IF ( <t_cmd> = "" ) 
			printf "return: not_a_command" 
			RETURN not_a_command 
		ELSE 
			get_command_index string = <t_cmd> isLocal = <isLocal> 
			IF NOT GotParam not_a_command 
				IF ( <has_params> = 1 ) 
					run_global_command index = <command_index> remains = <t_params> 
				ELSE 
					run_global_command index = <command_index> no_params 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT GotParam not_a_command 
			printf "return: is_a_command" 
			RETURN is_a_command 
		ELSE 
			printf "return: not_a_command" 
			RETURN not_a_command 
		ENDIF 
	ELSE 
		printf "return: not_a_command" 
		RETURN not_a_command 
	ENDIF 
ENDSCRIPT

SCRIPT get_command_index 
	printf "script: get_command_index" 
	IF NOT GotParam string 
		RETURN not_a_command 
	ENDIF 
	index = 0 
	index2 = -1 
	GetArraySize ( global_cmd_array ) 
	BEGIN 
		temp_array = ( ( global_cmd_array [ <index> ] ) . cmd_strings ) 
		IF ArrayContains array = <temp_array> contains = <string> 
			<index2> = <index> 
			BREAK 
		ELSE 
			<index> = ( <index> + 1 ) 
		ENDIF 
	REPEAT <array_size> 
	IF ( <index2> > -1 ) 
		IF ( <isLocal> = 1 ) 
			IF StructureContains structure = ( global_cmd_array [ <index2> ] ) isLocal 
				FormatText textname = text "return: command_index = %a" a = <index2> 
				printf <text> 
				RETURN command_index = <index2> 
			ELSE 
				RETURN not_a_command 
			ENDIF 
		ELSE 
			IF ( <isLocal> = 0 ) 
				IF StructureContains structure = ( <global_cmd_array> [ <index2> ] ) isLocal 
					RETURN not_a_command 
				ELSE 
					FormatText textname = text "return: command_index = %a" a = <index2> 
					printf <text> 
					RETURN command_index = <index2> 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		RETURN not_a_command 
	ENDIF 
ENDSCRIPT

SCRIPT get_command_param_count 
	printf "script: get_command_param_count" 
	IF NOT GotParam string 
		RETURN param_count = 0 
	ENDIF 
	StringToCharArray string = <string> 
	GetArraySize <char_array> 
	num_params = 0 
	index = 0 
	BEGIN 
		IF ( ( <char_array> [ <index> ] ) = "," ) 
			<num_params> = ( <num_params> + 1 ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( <num_params> = 0 ) 
		IF ( <array_size> > 1 ) 
			printf "override: num_params = 1" 
			<num_params> = ( <num_params> + 1 ) 
		ENDIF 
	ENDIF 
	FormatText textname = text "return: param_count = %i" i = <num_params> 
	printf <text> 
	RETURN param_count = <num_params> 
ENDSCRIPT

SCRIPT run_global_command 
	printf "script: run_global_command" 
	IF NOT GotParam index 
		RETURN not_a_command 
	ENDIF 
	IF NOT GotParam no_params 
		FormatText textname = text "execute: script = %a, cmd_param_str = %b, cmd_index = %c" a = ( global_cmd_array [ <index> ] . cmd_script ) b = <remains> c = <index> 
		printf <text> 
		( global_cmd_array [ <index> ] . cmd_script ) cmd_params_str = <remains> cmd_index = <index> 
	ELSE 
		FormatText textname = text "execute: script = %a, no_params, cmd_index = %c" a = ( global_cmd_array [ <index> ] . cmd_script ) c = <index> 
		printf <text> 
		( global_cmd_array [ <index> ] . cmd_script ) cmd_params_str = "" cmd_index = <index> 
	ENDIF 
ENDSCRIPT

SCRIPT get_and_execute_next_command_param 
	IF NOT GotParam string 
		RETURN not_a_command 
	ENDIF 
	IF NOT GotParam cmd_index 
		RETURN not_a_command 
	ENDIF 
	printf "get_and_execute_next_command_param" 
	StringToCharArray string = <string> 
	GetArraySize <char_array> 
	index = 0 
	name = "" 
	value = "" 
	param = "" 
	HasEquals = 0 
	FormatText textname = text "0:size = %a, index = %i, name = %n, value = %v, param = %p, HasEquals = %h" a = ( <array_size> ) i = ( <index> ) n = ( <name> ) v = ( <value> ) p = ( <param> ) h = ( <HasEquals> ) 
	printf <text> 
	BEGIN 
		IF NOT ( ( <char_array> [ <index> ] ) = "," ) 
			IF ( ( <char_array> [ <index> ] ) = "=" ) 
				<HasEquals> = 1 
				<index> = ( <index> + 1 ) 
				BREAK 
			ELSE 
				IF ( <HasEquals> = 0 ) 
					FormatText textname = str "%t%s" t = ( <name> ) s = ( <char_array> [ <index> ] ) 
					<name> = ( <str> ) 
					<index> = ( <index> + 1 ) 
				ENDIF 
			ENDIF 
		ELSE 
			<index> = ( <index> + 1 ) 
			BREAK 
		ENDIF 
	REPEAT <array_size> 
	IF ( <HasEquals> = 1 ) 
		FormatText textname = text "1:size = %a, index = %i, name = %n, value = %v, param = %p, HasEquals = %h" a = ( <array_size> ) i = ( <index> ) n = ( <name> ) v = ( <value> ) p = ( <param> ) h = ( <HasEquals> ) 
		printf <text> 
		BEGIN 
			IF ( <index> < <array_size> ) 
				IF NOT ( ( <char_array> [ <index> ] ) = "," ) 
					FormatText textname = str "%t%s" t = ( <value> ) s = ( <char_array> [ <index> ] ) 
					<value> = ( <str> ) 
					<index> = ( <index> + 1 ) 
				ELSE 
					<index> = ( <index> + 1 ) 
					BREAK 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT <array_size> 
	ELSE 
		<value> = "" 
	ENDIF 
	FormatText textname = text "2:size = %a, index = %i, name = %n, value = %v, param = %p, HasEquals = %h" a = ( <array_size> ) i = ( <index> ) n = ( <name> ) v = ( <value> ) p = ( <param> ) h = ( <HasEquals> ) 
	printf <text> 
	newsize = ( <array_size> - <index> ) 
	IF ( <newsize> > 0 ) 
		BEGIN 
			IF ( <index> < <array_size> ) 
				FormatText textname = str "%t%s" t = ( <param> ) s = ( <char_array> [ <index> ] ) 
				<param> = ( <str> ) 
				<index> = ( <index> + 1 ) 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT <array_size> 
	ENDIF 
	FormatText checksumname = name_id "%s" s = <name> 
	FormatText textname = text "name_id = %n, name = %i, value = %v, param = %p, HasEquals = %h" n = ( <name_id> ) i = ( <name> ) v = ( <value> ) p = ( <param> ) h = ( <HasEquals> ) 
	printf <text> 
	index2 = 0 
	<run_script> = null 
	<run_value> = "" 
	struct_params = ( ( global_cmd_array [ <cmd_index> ] ) . cmd_params ) 
	GetArraySize <struct_params> 
	BEGIN 
		IF ( <name_id> = ( ( <struct_params> [ <index2> ] ) . type ) ) 
			FormatText textname = text "match, name_id = %i, type = %t, index2 = %p" i = ( <name_id> ) t = ( ( ( <struct_params> [ <index2> ] ) . type ) ) p = ( <index2> ) 
			printf <text> 
			IF ( <HasEquals> = 1 ) 
				printf "HasEquals = 1" 
				FormatText textname = text "run_script = %a, run_value = %b" a = ( <run_script> ) b = ( <run_value> ) 
				printf <text> 
				<run_script> = ( ( <struct_params> [ <index2> ] ) . scr ) 
				<run_value> = ( <value> ) 
				BREAK 
			ELSE 
				IF ( <HasEquals> = 0 ) 
					printf "HasEquals = 0" 
					FormatText textname = text "run_script = %a, run_value = %b" a = ( <run_script> ) b = ( <run_value> ) 
					printf <text> 
					<run_script> = ( ( <struct_params> [ <index2> ] ) . scr ) 
					BREAK 
				ENDIF 
			ENDIF 
		ELSE 
			FormatText textname = text "not a match, name_id = %i, type = %t, index2 = %p" i = ( <name_id> ) t = ( ( ( <struct_params> [ <index2> ] ) . type ) ) p = ( <index2> ) 
			printf <text> 
			<index2> = ( <index2> + 1 ) 
		ENDIF 
	REPEAT <array_size> 
	IF NOT ( <run_script> = null ) 
		FormatText textname = text "run_script = %a, run_value = %b" a = ( <run_script> ) b = ( <run_value> ) 
		printf <text> 
		( <run_script> ) value_str = <run_value> value_checksum = <name_id> 
	ENDIF 
	RETURN remains = <param> 
ENDSCRIPT

SCRIPT global_cmd_game 
	printf "script: global_cmd_game" 
	IF InNetGame 
		IF IsHost 
			IF GameModeEquals is_lobby 
				IF NOT NetworkGamePending 
					IF NOT ChangeLevelPending 
						network_game_options_selected 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_game_time 
	printf "script: global_cmd_game_time" 
	IF IsHost 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_game_soz 
	printf "script: global_cmd_game_soz" 
	IF IsHost 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_startgame 
	printf "script: global_cmd_startgame" 
	IF IsHost 
		IF GameModeEquals is_lobby 
			IF ( <cmd_params_str> = "" ) 
				chosen_host_game 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_endgame 
	printf "script: global_cmd_endgame" 
	IF IsHost 
		IF NOT ( <cmd_params_str> = "" ) 
			IF NOT GameModeEquals is_lobby 
				network_end_game_selected 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_autoserver_toggle 
	printf "script: global_cmd_autoserver_toggle" 
	IF ( <value_checksum> = on ) 
		printf "value_checksum = On" 
		IF NOT ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) 
			AutoServerMenu_Toggle_Auto_Server 
			exit_pause_menu 
		ENDIF 
	ELSE 
		IF ( <value_checksum> = off ) 
			printf "value_checksum = Off" 
			IF ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) 
				AutoServerMenu_Toggle_Auto_Server 
				exit_pause_menu 
			ENDIF 
		ELSE 
			printf "none of the above" 
			AutoServerMenu_Toggle_Auto_Server 
			exit_pause_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_autoserver 
	printf "script: global_cmd_autoserver" 
	struct_params = ( ( global_cmd_array [ <cmd_index> ] ) . cmd_params ) 
	IF ( ( <cmd_params_str> = "" ) | ( <cmd_params_str> = "," ) | ( <cmd_params_str> = " ," ) ) 
		printf "no params" 
		global_cmd_autoserver_toggle 
	ELSE 
		index = 0 
		get_command_param_count string = <cmd_params_str> 
		IF ( <param_count> = 0 ) 
			printf "with params, param count 0" 
			global_cmd_autoserver_toggle 
		ELSE 
			printf "with params" 
			GetArraySize <struct_params> 
			BEGIN 
				get_and_execute_next_command_param string = ( <cmd_params_str> ) cmd_index = ( <cmd_index> ) 
				IF GotParam not_a_command 
					RETURN not_a_command 
				ENDIF 
				IF NOT ( <remains> = "" ) 
					<cmd_params_str> = <remains> 
				ENDIF 
				<index> = ( <index> + 1 ) 
			REPEAT <param_count> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_set_as_time 
	printf "script: global_cmd_set_as_time" 
	IF IsHost 
		index = 0 
		new_value = -1 
		BEGIN 
			FormatText textname = txt "%s" s = <index> 
			IF ( <txt> = <value_str> ) 
				<new_value> = <index> 
				BREAK 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT 600 
		IF ( <new_value> = -1 ) 
			printf "Error: out of range" 
			RETURN 
		ELSE 
			change AutoServer_BreakTime = <new_value> 
			FormatText textname = text "value_str = %v, new_value = %n, breaktime = %b" v = <value_str> n = <new_value> b = ( AutoServer_BreakTime ) 
			printf <text> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_autolevel 
	IF ( <cmd_params_str> = "" ) 
		AutoServerMenu_Toggle_Auto_Level 
		exit_pause_menu 
	ELSE 
		get_and_execute_next_command_param string = <cmd_params_str> cmd_index = <cmd_index> 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_obs 
	IF InNetGame 
		IF NOT IsObserving 
			IF IsTrue THUGPRO_ObserveOn 
				THUGPRO_ObserveMode off 
			ELSE 
				THUGPRO_ObserveMode on 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_set 
	IF NOT IsTrue THUGPRO_ObserveOn 
		IF NOT GameModeEquals is_career 
			IF NOT IsObserving 
				IF NOT IsSurveying 
					IF NOT skater : OnLip 
						IF ( ( GameModeEquals is_lobby ) | ( GameModeEquals is_singlesession ) ) 
							set_custom_restart 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_goto 
	IF NOT IsTrue THUGPRO_ObserveOn 
		IF NOT GameModeEquals is_career 
			IF NOT IsObserving 
				IF NOT IsSurveying 
					IF skater : SetCustomRestart 
						IF NOT skater : OnLip 
							IF ( ( GameModeEquals is_lobby ) | ( GameModeEquals is_singlesession ) ) 
								skip_to_custom_restart 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT global_cmd_warp 
	IF GameModeEquals is_lobby 
		IF NOT IsTrue JoinedAsObserver 
			GetSkaterId 
			IF NOT <objId> : Obj_FlagSet FLAG_SKATER_DROPPING_IN 
				IF ( <cmd_params_str> = "" ) 
					IF IsTrue THUGPRO_ObserveOn 
						thugpro_observe_hud_set_visible 
						<objId> : PlaceBeforeCamera 
						IF IsTrue view_mode 
							THUGPROResetViewer force_reset 
						ENDIF 
						THUGPRO_ObserveMode off 
					ENDIF 
				ELSE 
					edmsg2 "\\c4todo: warp to skater %a" a = <cmd_params_str> 
				ENDIF 
				wait 12 frames 
				IF THUGPRO_UberFriggedThisFrame 
					ResetSkaters 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

global_cmd_array = [ 
	{ 
		cmd_strings = [ "/MUTE" ] 
		cmd_script = toggle_display_chatwindow 
		cmd_params = [ ] 
		isLocal 
	} 
	{ 
		cmd_strings = [ "/OBS" ] 
		cmd_script = global_cmd_obs 
		cmd_params = [ ] 
		isLocal 
	} 
	{ 
		cmd_strings = [ "/CLEAR" ] 
		cmd_script = console_clear 
		cmd_params = [ ] 
		isLocal 
	} 
	{ 
		cmd_strings = [ "/SET" "7SET" ] 
		cmd_script = global_cmd_set 
		cmd_params = [ ] 
		isLocal 
	} 
	{ 
		cmd_strings = [ "/GOTO" "7GOTO" ] 
		cmd_script = global_cmd_goto 
		cmd_params = [ ] 
		isLocal 
	} 
	{ 
		cmd_strings = [ "/WARP" ] 
		cmd_script = global_cmd_warp 
		cmd_params = [ ] 
		isLocal 
	} 
	{ 
		cmd_strings = [ "/AUTOLEVEL" "/ALEVEL" "/AL" ] 
		cmd_script = global_cmd_autolevel 
		cmd_params = [ ] 
	} 
	{ 
		cmd_strings = [ "/AUTOSERVER" "/ASERVER" "/AS" ] 
		cmd_script = global_cmd_autoserver 
		cmd_params = [ { type = TIME scr = global_cmd_set_as_time } { type = on scr = global_cmd_autoserver_toggle } { type = off scr = global_cmd_autoserver_toggle } ] 
	} 
	{ 
		cmd_strings = [ "/END" "/ENDGAME" ] 
		cmd_script = global_cmd_endgame 
		cmd_params = [ ] 
	} 
	{ 
		cmd_strings = [ "/GAME" "7GAME" "/GAEM" "/GEAM" "/gamegame!" "/gaem pls" ] 
		cmd_script = global_cmd_game 
		cmd_params = [ 
		] 
	} 
	{ 
		cmd_strings = [ "/START" "/START A GAME" "/START A FUCKING GAME" ] 
		cmd_script = global_cmd_startgame 
		cmd_params = [ ] 
	} 
] 

