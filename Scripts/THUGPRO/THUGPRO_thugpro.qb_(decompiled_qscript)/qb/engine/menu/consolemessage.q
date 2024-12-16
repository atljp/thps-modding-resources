
THUGPRO_CHAT_LOG = [ ] 
chat_font = aventra 
number_of_console_lines = 6 
default_number_of_console_lines = 9 
min_number_of_console_lines = 2 
max_number_of_console_lines = 20 
console_scale = 0.60000002384 
console_scale_step = 0.01999999955 
console_scale_min = 0.20000000298 
console_scale_max = 1.00000000000 
console_font_color = text_color_c0 
console_dims = PAIR(750.00000000000, 10.00000000000) 
console_pos = PAIR(-40.00000000000, 250.00000000000) 
lobby_console_dims = PAIR(750.00000000000, 4.00000000000) 
lobby_console_pos = PAIR(-60.00000000000, 280.00000000000) 
console_wait_time = 40 
console_SpamFilter = 1 
console_FormatFilter = 1 
console_ParsingFilter = 0 
LastConsoleMessageId = null 
console_width_min = 50.00000000000 
console_width_max = 1000.00000000000 
gone_char_toggle = 0 
SCRIPT create_console 
	IF NOT ObjectExists id = console_message_vmenu 
		SetScreenElementLock id = root_window off 
		IF LevelIs Load_MainMenu 
			pos = ( lobby_console_pos ) 
		ELSE 
			pos = ( console_pos ) 
		ENDIF 
		CreateScreenElement { 
			type = VMenu 
			parent = root_window 
			id = console_message_vmenu 
			padding_scale = 0.64999997616 
			font = dialog 
			just = [ left top ] 
			internal_just = [ left center ] 
			pos = <pos> 
			z_priority = 0 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT get_num_console_lines 
	IF LevelIs Load_MainMenu 
		RETURN num_console_lines = ( default_number_of_console_lines ) 
	ELSE 
		RETURN num_console_lines = ( number_of_console_lines ) 
	ENDIF 
ENDSCRIPT

TEXT_ELEMENT_MAX_LENGTH = 95 
SCRIPT create_console_message { 
		text = "Default console message" 
		rgba = [ 113 121 127 80 ] 
	} 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW 
		THUGPRO_StrLen string = <text> 
		IF ( <length> > TEXT_ELEMENT_MAX_LENGTH ) 
			RETURN 
		ENDIF 
		IF NOT ObjectExists id = console_message_vmenu 
			create_console 
		ENDIF 
		root_window : GetSingleTag menu_state 
		IF NOT ( <menu_state> = on ) 
			unhide_console_window 
		ENDIF 
		get_num_console_lines 
		SetScreenElementLock id = console_message_vmenu off 
		IF ScreenElementExists id = { console_message_vmenu child = ( <num_console_lines> - 1 ) } 
			DestroyScreenElement id = { console_message_vmenu child = 0 } 
		ENDIF 
		IF LevelIs Load_MainMenu 
			dims = ( lobby_console_dims ) 
			pos = ( lobby_console_pos ) 
			max_chat_height = 140 
		ELSE 
			dims = ( console_dims ) 
			pos = ( console_pos ) 
			max_chat_height = 100 
		ENDIF 
		SetScreenElementProps id = console_message_vmenu pos = <pos> 
		IF GotParam join 
			rgba = [ 0 80 0 80 ] 
		ELSE 
			IF GotParam left 
				rgba = [ 80 0 0 80 ] 
			ENDIF 
		ENDIF 
		<font> = ( chat_font ) 
		<scale> = ( console_scale ) 
		IF NOT ( <font> = dialog ) 
			shadow = shadow 
			shadow_rgba = UI_text_shadow_color 
			shadow_offs = UI_text_shadow_offset 
		ENDIF 
		FormatText textname = message "%t" t = <text> 
		IF ( console_SpamFilter = 1 ) 
			ClearMessageFormat string = <message> 
			FormatText checksumname = check "%c" c = <clean_string> 
			IF ( <check> = LastConsoleMessageId ) 
				RETURN 
			ELSE 
				change LastConsoleMessageId = <check> 
			ENDIF 
		ENDIF 
		split_consolemessage string = <message> clean_color_format 
		IF ( ( <IsChatMessage> ) = 1 ) 
			IF ArrayContains array = blacklist_player_array contains = <split_name> 
				RETURN 
			ENDIF 
		ENDIF 
		IF ( console_ParsingFilter = 1 ) 
			IF ( ( ArrayContains array = whitelist_player_array contains = <split_name> ) | ( gone_thugpro_devteam_build = 1 ) ) 
				check_command_exist string = <split_msg> 
				IF NOT GotParam not_a_command 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
		ClearMessageFormat string = <message> 
		IF GotParam new_string 
			<message> = <new_string> 
		ELSE 
			RETURN 
		ENDIF 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = console_message_vmenu 
			font = <font> 
			text = <message> 
			internal_just = [ left top ] 
			rgba = <rgba> 
			line_spacing = 0.80000001192 
			internal_scale = 0.20000000298 
			scale = <scale> 
			dims = <dims> 
			z_priority = 5 
			<shadow> 
			shadow_rgba = <shadow_rgba> 
			shadow_offs = <shadow_offs> 
			allow_expansion 
			not_focusable 
		} 
		IF NOT LevelIs Load_MainMenu 
			IF NOT GotParam DontStore 
				THUGPRO_ConsoleMessage string = <message> 
			ENDIF 
		ENDIF 
		BEGIN 
			total_height = 0 
			index = <num_console_lines> 
			BEGIN 
				IF ScreenElementExists id = { console_message_vmenu child = ( <num_console_lines> - <index> ) } 
					GetScreenElementDims id = { console_message_vmenu child = ( <num_console_lines> - <index> ) } 
					<total_height> = ( <total_height> + <height> ) 
					<index> = ( <index> - 1 ) 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT 
			IF ( <total_height> > <max_chat_height> ) 
				DestroyScreenElement id = { console_message_vmenu child = 0 } 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 
		IF GotParam wait_and_die 
			RunScriptOnScreenElement id = <id> console_message_wait_and_die params = { time = <time> <...> } 
			RETURN 
		ENDIF 
		IF NOT LevelIs Load_MainMenu 
			IF NOT GotParam dont_die 
				RunScriptOnScreenElement id = <id> console_message_wait_and_die <...> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT hide_console_window 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_console_window 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
	ENDIF 
ENDSCRIPT

SCRIPT console_hide 
	IF ObjectExists id = console_message_vmenu 
		RunScriptOnScreenElement id = console_message_vmenu console_hide2 
	ENDIF 
ENDSCRIPT

SCRIPT console_hide2 
	DoMorph scale = 0 
ENDSCRIPT

SCRIPT console_unhide 
	IF ObjectExists id = console_message_vmenu 
		RunScriptOnScreenElement id = console_message_vmenu console_unhide2 
	ENDIF 
ENDSCRIPT

SCRIPT console_unhide2 
	DoMorph scale = 1 
ENDSCRIPT

SCRIPT console_clear 
	THUGPRO_ClearConsoleMessages 
	IF ScreenElementExists id = console_message_vmenu 
		DestroyScreenElement id = console_message_vmenu preserve_parent 
	ENDIF 
ENDSCRIPT

SCRIPT console_destroy 
	IF ObjectExists id = console_message_vmenu 
		DestroyScreenElement id = console_message_vmenu 
	ENDIF 
ENDSCRIPT

SCRIPT console_message_wait_and_die time = ( console_wait_time ) 
	IF GotParam editor 
		<time> = 5 
		DoMorph time = 0.00000000000 alpha = 1 scale = 0.00000000000 
		DoMorph time = 0.50000000000 scale = ( console_scale ) 
	ELSE 
		DoMorph time = 0.00000000000 alpha = 0 
		DoMorph time = 0.30000001192 alpha = 1 
	ENDIF 
	wait <time> seconds 
	IF GotParam editor 
		DoMorph time = 0.30000001192 scale = 0.00000000000 
	ELSE 
		DoMorph time = 0.40000000596 alpha = 0 
	ENDIF 
	THUGPRO_ClearFirstMessage 
	Die 
ENDSCRIPT

SCRIPT ClearMessageFormat 
	IF NOT GotParam string 
		printf "ERROR: ClearMessageFormat needs a string parameter" 
		RETURN 
	ENDIF 
	IF ( console_FormatFilter = 1 ) 
		StripStringColorCodes string = <string> isChatString 
	ELSE 
		StripStringColorCodes string = <string> isChatString Clean 
	ENDIF 
	RETURN new_string = <stripped_string> clean_string = <stripped_string> 
ENDSCRIPT

SCRIPT split_consolemessage 
	IF NOT GotParam string 
		RETURN 
	ENDIF 
	temp_name = "" 
	temp_msg = "" 
	SplitConsoleMessage string = <string> 
	IF GotParam clean_color_format 
		StripStringColorCodes string = <split_name> 
		<temp_name> = <stripped_string> 
		StripStringColorCodes string = <split_msg> 
		<temp_msg> = <stripped_string> 
	ENDIF 
	RETURN split_name = <temp_name> split_msg = <temp_msg> split_sep = "\\c0 : " IsChatMessage = <IsChatMessage> 
ENDSCRIPT

SCRIPT get_clean_string 
	IF NOT GotParam string 
		RETURN 
	ENDIF 
	StripStringColorCodes string = <string> 
	RETURN clean_string = <stripped_string> 
ENDSCRIPT

SCRIPT ConsoleOptions_Create_Menu 
	IF InNetGame 
		<console_text> = "Chat Options" 
	ELSE 
		<console_text> = "Console Options" 
	ENDIF 
	thugpro_menu_create { 
		menu_name = console_options 
		menu_title = <console_text> 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_predisplay_options_menu 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	Get_Font_Name 
	FormatText textname = font_extra_text "%a" a = <name> 
	make_thugpro_menu_item { 
		id = ConsoleOptions_menu_font 
		text = "Font Face " 
		extra_text = <font_extra_text> 
		option_arrows_callback = consoleoptions_change_font 
		option_arrows 
		pad_choose 
	} 
	Get_FontColor_ValueAndName 
	FormatText textname = fontcolor_extra_text "%b" b = <name> 
	make_thugpro_menu_item { 
		id = ConsoleOptions_menu_fontcolor 
		text = "Font Color " 
		extra_text = <fontcolor_extra_text> 
		option_arrows_callback = consoleoptions_change_fontcolor 
		option_arrows 
		pad_choose 
	} 
	FormatText textname = linecount_extra_text "%c" c = ( number_of_console_lines ) 
	make_thugpro_menu_item { 
		id = ConsoleOptions_menu_linecount 
		text = "Number of Lines " 
		extra_text = <linecount_extra_text> 
		option_arrows_callback = consoleoptions_change_linecount 
		option_arrows 
		pad_choose 
	} 
	FormatText textname = scale_extra_text "%d" d = ( console_scale ) 
	make_thugpro_menu_item { 
		id = ConsoleOptions_menu_scale 
		text = "Console Scale " 
		extra_text = <scale_extra_text> 
		option_arrows_callback = consoleoptions_change_scale 
		option_arrows 
		pad_choose 
	} 
	FormatText textname = wait_time_extra_text "%d" d = ( console_wait_time ) 
	make_thugpro_menu_item { 
		id = ConsoleOptions_menu_message_wait_time 
		text = "Message Life " 
		extra_text = <wait_time_extra_text> 
		option_arrows_callback = consoleoptions_change_message_wait_time 
		option_arrows 
		pad_choose 
	} 
	IF ( console_SpamFilter = 1 ) 
		temp_filter = "On" 
	ELSE 
		temp_filter = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = ProCrastination_menu_spam_filter 
		text = "Spam Filter " 
		extra_text = <temp_filter> 
		option_arrows_callback = Toggle_Console_Spam_Filter 
		option_arrows 
		pad_choose 
	} 
	IF ( console_FormatFilter = 1 ) 
		temp_remove = "On" 
	ELSE 
		temp_remove = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = ProCrastination_menu_remove_format 
		text = "Color Format Filter " 
		extra_text = <temp_remove> 
		option_arrows_callback = Toggle_Remove_Format 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW 
		hud_text = "Off" 
	ELSE 
		hud_text = "On" 
	ENDIF 
	IF InNetGame 
		<console_text> = "Chat Window " 
	ELSE 
		<console_text> = "Console Window " 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_display_chatwindow 
		text = <console_text> 
		extra_text = <hud_text> 
		option_arrows_callback = toggle_display_chatwindow 
		option_arrows 
		pad_choose 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

console_font_options = [ 
	{ text = "Aventra" font = aventra } 
	{ text = "Baksheesh" font = baksheesh } 
	{ text = "Bebas" font = bebas } 
	{ text = "Bolt BT" font = boltbt } 
	{ text = "Candara" font = candara } 
	{ text = "Compacta" font = compacta } 
	{ text = "Crillee" font = crillee } 
	{ text = "Cyrillic" font = cyrillic } 
	{ text = "Eras" font = eras } 
	{ text = "Euclid" font = euclid } 
	{ text = "Glaser" font = glaser } 
	{ text = "Impact" font = impact } 
	{ text = "Machine" font = machine } 
	{ text = "Neo Sans" font = neosans } 
	{ text = "Royal" font = royal } 
] 
SCRIPT consoleoptions_change_font 
	get_index_of_struct_array_containing { 
		array = ( console_font_options ) 
		name = font 
		value = ( chat_font ) 
		type = checksum 
	} 
	IF NOT GotParam item_index 
		<item_index> = 0 
	ENDIF 
	IF GotParam right 
		array_next_wraparound index = <item_index> array = ( console_font_options ) 
	ELSE 
		IF GotParam left 
			array_previous_wraparound index = <item_index> array = ( console_font_options ) 
		ENDIF 
	ENDIF 
	IF NOT GotParam index 
		printf "WARNING: array wraparound did not return a valid index..." 
		<index> = 0 
	ENDIF 
	GetTags 
	thugpro_menu_item_update_extra_text id = <id> text = ( ( ( console_font_options ) [ <index> ] ) . text ) 
	thugpro_save_key_value Key = "consoleFontNew" value = ( ( ( console_font_options ) [ <index> ] ) . font ) apply_changes 
ENDSCRIPT

SCRIPT Get_Font_Name 
	get_index_of_struct_array_containing { 
		array = ( console_font_options ) 
		name = font 
		value = ( chat_font ) 
		type = checksum 
	} 
	IF NOT GotParam item_index 
		RETURN name = "\\c2Unknown" 
	ENDIF 
	RETURN name = ( ( ( console_font_options ) [ <item_index> ] ) . text ) 
ENDSCRIPT

SCRIPT consoleoptions_change_fontcolor 
	checksum = ( console_font_color ) 
	IF GotParam right 
		SWITCH <checksum> 
			CASE text_color_c0 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Red" 
				change console_font_color = text_color_c2 
			CASE text_color_c2 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Blue" 
				change console_font_color = text_color_c3 
			CASE text_color_c3 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Green" 
				change console_font_color = text_color_c4 
			CASE text_color_c4 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Yellow" 
				change console_font_color = text_color_c5 
			CASE text_color_c5 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Cyan" 
				change console_font_color = text_color_c6 
			CASE text_color_c6 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Purple" 
				change console_font_color = text_color_c7 
			CASE text_color_c7 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Dark Blue" 
				change console_font_color = text_color_c8 
			CASE text_color_c8 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "White" 
				change console_font_color = text_color_c9 
			CASE text_color_c9 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Light Blue" 
				change console_font_color = text_color_ca 
			CASE text_color_ca 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Pink" 
				change console_font_color = text_color_cl 
			CASE text_color_cl 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Orange" 
				change console_font_color = text_color_cb 
			CASE text_color_cb 
				thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Default" 
				change console_font_color = text_color_c0 
		ENDSWITCH 
	ELSE 
		IF GotParam left 
			SWITCH <checksum> 
				CASE text_color_c0 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Orange" 
					change console_font_color = text_color_cb 
				CASE text_color_cb 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Pink" 
					change console_font_color = text_color_cl 
				CASE text_color_cl 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Light Blue" 
					change console_font_color = text_color_ca 
				CASE text_color_ca 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "White" 
					change console_font_color = text_color_c9 
				CASE text_color_c9 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Dark Blue" 
					change console_font_color = text_color_c8 
				CASE text_color_c8 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Purple" 
					change console_font_color = text_color_c7 
				CASE text_color_c7 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Cyan" 
					change console_font_color = text_color_c6 
				CASE text_color_c6 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Yellow" 
					change console_font_color = text_color_c5 
				CASE text_color_c5 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Green" 
					change console_font_color = text_color_c4 
				CASE text_color_c4 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Blue" 
					change console_font_color = text_color_c3 
				CASE text_color_c3 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Red" 
					change console_font_color = text_color_c2 
				CASE text_color_c2 
					thugpro_menu_item_update_extra_text id = ConsoleOptions_menu_fontcolor text = "Default" 
					change console_font_color = text_color_c0 
			ENDSWITCH 
		ENDIF 
	ENDIF 
	thugpro_save_key_value Key = "consoleFontColor" value = ( console_font_color ) 
ENDSCRIPT

SCRIPT Get_FontColor_ValueAndName 
	checksum = ( console_font_color ) 
	value = "" 
	name = "" 
	SWITCH <checksum> 
		CASE text_color_c0 
			<value> = "\\c0" 
			<name> = "Default" 
		CASE text_color_c2 
			<value> = "\\c2" 
			<name> = "Red" 
		CASE text_color_c3 
			<value> = "\\c3" 
			<name> = "Blue" 
		CASE text_color_c4 
			<value> = "\\c4" 
			<name> = "Green" 
		CASE text_color_c5 
			<value> = "\\c5" 
			<name> = "Yellow" 
		CASE text_color_c6 
			<value> = "\\c6" 
			<name> = "Cyan" 
		CASE text_color_c7 
			<value> = "\\c7" 
			<name> = "Purple" 
		CASE text_color_c8 
			<value> = "\\c8" 
			<name> = "Dark Blue" 
		CASE text_color_c9 
			<value> = "\\c9" 
			<name> = "White" 
		CASE text_color_ca 
			<value> = "\\ca" 
			<name> = "Light Blue" 
		CASE text_color_cl 
			<value> = "\\cl" 
			<name> = "Pink" 
		CASE text_color_cb 
			<value> = "\\cb" 
			<name> = "Orange" 
	ENDSWITCH 
	RETURN value = <value> name = <name> 
ENDSCRIPT

SCRIPT consoleoptions_change_linecount 
	new_value = ( number_of_console_lines ) 
	IF GotParam right 
		<new_value> = ( <new_value> + 1 ) 
		IF ( <new_value> > ( max_number_of_console_lines ) ) 
			<new_value> = ( min_number_of_console_lines ) 
		ENDIF 
	ELSE 
		IF GotParam left 
			<new_value> = ( <new_value> - 1 ) 
			IF ( <new_value> < ( min_number_of_console_lines ) ) 
				<new_value> = ( max_number_of_console_lines ) 
			ENDIF 
		ENDIF 
	ENDIF 
	change number_of_console_lines = <new_value> 
	FormatText textname = msg "%i" i = ( number_of_console_lines ) 
	SetScreenElementProps { id = { ConsoleOptions_menu_linecount child = extra_text } text = <msg> } 
	thugpro_save_key_value Key = "consoleNumLines" value = <new_value> 
ENDSCRIPT

SCRIPT consoleoptions_change_scale 
	new_value = ( console_scale ) 
	IF GotParam right 
		<new_value> = ( <new_value> + ( console_scale_step ) ) 
		IF ( <new_value> > ( console_scale_max ) ) 
			<new_value> = ( console_scale_min ) 
		ENDIF 
	ELSE 
		IF GotParam left 
			<new_value> = ( <new_value> - ( console_scale_step ) ) 
			IF ( <new_value> < ( console_scale_min ) ) 
				<new_value> = ( console_scale_max ) 
			ENDIF 
		ENDIF 
	ENDIF 
	change console_scale = <new_value> 
	FormatText textname = msg "%i" i = ( console_scale ) 
	SetScreenElementProps { id = { ConsoleOptions_menu_scale child = extra_text } text = <msg> } 
	thugpro_save_key_value Key = "consoleScale" value = <new_value> 
ENDSCRIPT

SCRIPT consoleoptions_change_message_wait_time 
	new_value = ( console_wait_time ) 
	IF GotParam right 
		<new_value> = ( <new_value> + 1 ) 
		IF ( <new_value> > 200 ) 
			<new_value> = 15 
		ENDIF 
	ELSE 
		IF GotParam left 
			<new_value> = ( <new_value> - 1 ) 
			IF ( <new_value> < 15 ) 
				<new_value> = 200 
			ENDIF 
		ENDIF 
	ENDIF 
	change console_wait_time = <new_value> 
	FormatText textname = msg "%i" i = ( console_wait_time ) 
	SetScreenElementProps { id = { ConsoleOptions_menu_message_wait_time child = extra_text } text = <msg> } 
	thugpro_save_key_value Key = "console_wait_time" value = <new_value> 
ENDSCRIPT

SCRIPT consoleoptions_change_width 
	new_value = ( console_dims ) 
	IF GotParam right 
		IF ( <new_value> . PAIR(1.00000000000, 0.00000000000) = 1000.00000000000 ) 
			<new_value> = ( <new_value> - PAIR(950.00000000000, 0.00000000000) ) 
		ELSE 
			<new_value> = ( <new_value> + PAIR(0.10000000149, 0.00000000000) ) 
		ENDIF 
	ELSE 
		IF GotParam left 
			IF ( <new_value> . PAIR(1.00000000000, 0.00000000000) = 50.00000000000 ) 
				<new_value> = ( <new_value> + PAIR(950.00000000000, 0.00000000000) ) 
			ELSE 
				<new_value> = ( <new_value> - PAIR(0.10000000149, 0.00000000000) ) 
			ENDIF 
		ENDIF 
	ENDIF 
	change console_dims = <new_value> 
	FormatText textname = msg "%i" i = ( ( console_dims ) . PAIR(1.00000000000, 0.00000000000) ) 
	SetScreenElementProps { id = { ConsoleOptions_menu_width child = extra_text } text = <msg> } 
ENDSCRIPT

SCRIPT Toggle_Console_Spam_Filter 
	IF ( console_SpamFilter = 1 ) 
		thugpro_menu_item_update_extra_text id = ProCrastination_menu_spam_filter off 
		change console_SpamFilter = 0 
	ELSE 
		IF ( console_SpamFilter = 0 ) 
			thugpro_menu_item_update_extra_text id = ProCrastination_menu_spam_filter on 
			change console_SpamFilter = 1 
		ENDIF 
	ENDIF 
	thugpro_save_key_value Key = "console_SpamFilter" value = ( console_SpamFilter ) 
ENDSCRIPT

SCRIPT Toggle_Console_Parsing 
	IF ( console_ParsingFilter = 1 ) 
		thugpro_menu_item_update_extra_text id = ProCrastination_menu_command_parsing off 
		change console_ParsingFilter = 0 
	ELSE 
		IF ( console_ParsingFilter = 0 ) 
			thugpro_menu_item_update_extra_text id = ProCrastination_menu_command_parsing on 
			change console_ParsingFilter = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Toggle_Remove_Format 
	IF ( console_FormatFilter = 1 ) 
		thugpro_menu_item_update_extra_text id = ProCrastination_menu_remove_format off 
		change console_FormatFilter = 0 
	ELSE 
		IF ( console_FormatFilter = 0 ) 
			thugpro_menu_item_update_extra_text id = ProCrastination_menu_remove_format on 
			change console_FormatFilter = 1 
		ENDIF 
	ENDIF 
	thugpro_save_key_value Key = "console_FormatFilter" value = ( console_FormatFilter ) 
ENDSCRIPT


