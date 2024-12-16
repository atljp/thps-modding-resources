
FLAG_ENABLE_PARSING = 0 
FCFS_HostIndex = 1 
FCFS_CurrentHostName = "empty" 
AutoServer_PausedTimer = 0 
AutoServer_CurrentTime = 0 
AutoServer_BreakTime = 30 
AutoLevel_Cycle = 0 
AutoLevel_GamesPlayed = 0 
AutoLevel_TotalGamesToPlay = 5 
AutoLevel_RecentLevelIndex = [ -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ] 
AutoGameMode_NextGameMode = nettrickattack 
AutoGameMode_ShuffleType = 1 
AutoGameMode_Index = 0 
SCRIPT AutoServer_Close_Rankings 
	Wait 1 second 
	exit_pause_menu 
	close_rankings 
	do_backend_retry 
	IF IsHost 
		IF GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
			change AutoLevel_GamesPlayed = ( AutoLevel_GamesPlayed + 1 ) 
			THUGPRO_AutoserverSetGamesPlayed games = ( AutoLevel_GamesPlayed ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT update_auto_modes 
	IF GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		IF ( AutoLevel_GamesPlayed > ( AutoLevel_TotalGamesToPlay - 1 ) ) 
			change AutoLevel_GamesPlayed = 0 
			THUGPRO_AutoserverSetGamesPlayed games = 0 
			Wait 3 second 
			AutoLevel_ChangeLevel 
			RETURN 
		ELSE 
			IF ( AutoLevel_GamesPlayed > AutoLevel_TotalGamesToPlay ) 
				change AutoLevel_GamesPlayed = 0 
				THUGPRO_AutoserverSetGamesPlayed games = 0 
			ENDIF 
			IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
				AutoServer_Reset_Timer 
			ENDIF 
		ENDIF 
	ELSE 
		IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
			AutoServer_Reset_Timer 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServer_Reset_Timer 
	change AutoServer_CurrentTime = AutoServer_BreakTime 
	IF NOT GotParam from_menu 
		SpawnScript AutoServer_Break_Timer 
	ENDIF 
ENDSCRIPT

SCRIPT BroadcastBreakTime_Update 
	IF IsHost 
		RETURN 
	ELSE 
		change AutoServer_CurrentTime = <time> 
		AutoServer_Update_Timer_Element time = <time> 
		IF NOT GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
			IF ScreenElementExists id = autoserver_timer 
				DestroyScreenElement id = autoserver_timer 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BroadcastSetGamesPlayed 
	IF IsHost 
		RETURN 
	ELSE 
		change AutoLevel_GamesPlayed = <games> 
	ENDIF 
ENDSCRIPT

SCRIPT BroadcastSetGamesToPlay 
	IF IsHost 
		RETURN 
	ELSE 
		change AutoLevel_TotalGamesToPlay = <games> 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServer_Broadcast_Info 
ENDSCRIPT

SCRIPT AutoServer_Update_Timer 
	IF IsHost 
		RETURN 
	ELSE 
		change AutoServer_CurrentTime = <time> 
		AutoServer_Update_Timer_Element time = <time> 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServer_Break_Timer 
	IF IsHost 
		root_window : GetTags 
		AutoServer_Create_Timer_Element 
		AutoServer_Update_Timer_Element time = ( AutoServer_CurrentTime ) 
		THUGPRO_AutoserverUpdateTimer time = ( AutoServer_CurrentTime ) 
		BEGIN 
			IF ( AutoServer_CurrentTime > -1 ) 
				IF ( AutoServer_CurrentTime = 0 ) 
					AutoServer_Update_Timer_Element time = ( AutoServer_CurrentTime ) 
					THUGPRO_AutoserverUpdateTimer time = ( AutoServer_CurrentTime ) 
					BREAK 
				ELSE 
					IF ( AutoServer_PausedTimer = 1 ) 
						DoScreenElementMorph { 
							id = autoserver_timer 
							alpha = 0 
						} 
						Wait 1 frame 
					ELSE 
						DoScreenElementMorph { 
							id = autoserver_timer 
							alpha = 1 
						} 
						IF NOT NetworkGamePending 
							IF NOT ChangeLevelPending 
								AutoServer_Update_Timer_Element time = ( AutoServer_CurrentTime ) 
								THUGPRO_AutoserverUpdateTimer time = ( AutoServer_CurrentTime ) 
								change AutoServer_CurrentTime = ( AutoServer_CurrentTime - 1 ) 
								Wait 1 second 
							ELSE 
								AutoServer_Update_Timer_Element time = 0 
								THUGPRO_AutoserverUpdateTimer time = 0 
								AutoServer_Destroy_Timer 
							ENDIF 
						ELSE 
							AutoServer_Update_Timer_Element time = 0 
							THUGPRO_AutoserverUpdateTimer time = 0 
							AutoServer_Destroy_Timer 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		REPEAT 
		chosen_host_game 
		AutoServer_Destroy_Timer 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServer_Create_Timer_Element text = "AutoServer: " 
	SetScreenElementLock id = root_window off 
	IF ScreenElementExists id = autoserver_timer 
		DestroyScreenElement id = autoserver_timer 
	ENDIF 
	pos = PAIR(350.00000000000, 34.00000000000) 
	dims = PAIR(250.00000000000, 100.00000000000) 
	just = [ center center ] 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = autoserver_timer 
		alpha = 0.60000002384 
		scale = 0.75000000000 
		z_priority = 1000 
		dims = <dims> 
		pos = <pos> 
		just = <just> 
	} 
	<container_id> = autoserver_timer 
	IF GotParam text 
		CreateScreenElement { 
			type = TextElement 
			parent = <container_id> 
			local_id = text2 
			font = dialog 
			text = <text> 
			alpha = 1 
			scale = 0.85000002384 
			pos = <pos> 
			just = <just> 
			internal_just = [ center center ] 
			z_priority = 1003 
		} 
	ENDIF 
	IF GotParam text 
		GetStackedScreenElementPos X id = { <container_id> child = text2 } offset = PAIR(3.00000000000, 11.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		local_id = time 
		font = dialog 
		text = "" 
		alpha = 1 
		scale = 0.85000002384 
		pos = <pos> 
		just = [ left center ] 
		rgba = [ 204 51 0 120 ] 
		z_priority = 1002 
	} 
	AutoServer_Update_Timer_Element time = ( AutoServer_BreakTime ) 
ENDSCRIPT

SCRIPT AutoServer_Update_Timer_Element 
	GetTags 
	msg = "" 
	IF NOT ScreenElementExists id = autoserver_timer 
		AutoServer_Create_Timer_Element 
	ENDIF 
	IF GotParam time 
		FormatText textname = msg2 "%j" j = <time> 
		<msg> = <msg2> 
	ELSE 
		IF GotParam time_str 
			<msg> = <time_str> 
		ENDIF 
	ENDIF 
	SetScreenElementProps { id = { autoserver_timer child = time } text = <msg> rgba = [ 204 51 0 120 ] } 
	IF ( <time> = 0 ) 
		IF NOT IsHost 
			AutoServer_Destroy_Timer 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServer_Destroy_Timer 
	IF ScreenElementExists id = autoserver_timer 
		DestroyScreenElement id = autoserver_timer 
	ENDIF 
	IF IsHost 
		KillSpawnedScript Name = AutoServer_Break_Timer 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServerMenu_Toggle_Auto_Game_Mode 
	GetTags 
	IF IsHost 
		IF ( GetGlobalFlag flag = FLAG_AUTO_GAME_MODE ) 
			Server_ShowMessageClient msg = "Auto game mode off" 
			thugpro_menu_item_update_extra_text id = <id> off 
			UnSetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
			BroadcastOmnigon cheat_flag = FLAG_AUTO_GAME_MODE off 
		ELSE 
			THUGPRO_AutoserverToggle on 
			Server_ShowMessageClient msg = "Auto game mode on" 
			thugpro_menu_item_update_extra_text id = <id> on 
			SetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
			BroadcastOmnigon cheat_flag = FLAG_AUTO_GAME_MODE on 
		ENDIF 
		IF GetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
			RemoveParameter not_focusable 
		ELSE 
			not_focusable = not_focusable 
		ENDIF 
		AutoServerMenu_Create_Menu focus_target = autogamemode_menu_toggle no_animate 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServerMenu_Toggle_Auto_Server 
	IF IsHost 
		IF ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) 
			THUGPRO_AutoserverToggle off 
			Server_ShowMessageClient msg = ( SERVER_MSG_AUTOSERVER_OFF ) 
			thugpro_menu_item_update_extra_text id = autoserver_menu_toggle off 
			UnSetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
			BroadcastOmnigon cheat_flag = FLAG_AUTO_SERVER_MODE off 
			IF ScreenElementExists id = autoserver_timer 
				DestroyScreenElement id = autoserver_timer 
			ENDIF 
			AutoServer_Destroy_Timer 
		ELSE 
			THUGPRO_AutoserverToggle on 
			Server_ShowMessageClient msg = ( SERVER_MSG_AUTOSERVER_ON ) 
			thugpro_menu_item_update_extra_text id = autoserver_menu_toggle on 
			SetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
			BroadcastOmnigon cheat_flag = FLAG_AUTO_SERVER_MODE on 
			change AutoServer_PausedTimer = 1 
			AutoServer_Reset_Timer 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServerMenu_Toggle_Auto_Server_Breaktime 
	new_value = ( AutoServer_BreakTime ) 
	IF GotParam right 
		<new_value> = ( <new_value> + 5 ) 
		IF ( <new_value> > 300 ) 
			<new_value> = 5 
		ENDIF 
	ELSE 
		IF GotParam left 
			<new_value> = ( <new_value> - 5 ) 
			IF ( <new_value> < 5 ) 
				<new_value> = 300 
			ENDIF 
		ENDIF 
	ENDIF 
	change AutoServer_BreakTime = <new_value> 
	FormatText textname = msg "%i Seconds" i = ( AutoServer_BreakTime ) 
	thugpro_menu_item_update_extra_text id = autoserver_menu_intervals text = <msg> 
	AutoServer_Reset_Timer from_menu 
ENDSCRIPT

SCRIPT AutoServerMenu_Toggle_Auto_Level 
	GetTags 
	IF ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) 
		Server_ShowMessageClient msg = ( SERVER_MSG_AUTOLEVEL_OFF ) 
		UnSetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		BroadcastOmnigon cheat_flag = FLAG_AUTO_LEVEL_MODE off 
		thugpro_menu_item_update_extra_text id = <id> off 
	ELSE 
		Server_ShowMessageClient msg = ( SERVER_MSG_AUTOLEVEL_ON ) 
		SetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		BroadcastOmnigon cheat_flag = FLAG_AUTO_LEVEL_MODE on 
		thugpro_menu_item_update_extra_text id = <id> on 
	ENDIF 
	change level_rand_index = 0 
	change total_rand_levels = 0 
	AutoServerMenu_Create_Menu focus_target = autolevel_menu_toggle no_animate 
ENDSCRIPT

SCRIPT AutoServerMenu_ToggleAutoLevelGameCount 
	_curerentTotalGamesToPlay = ( AutoLevel_TotalGamesToPlay ) 
	new_value = ( AutoLevel_TotalGamesToPlay ) 
	IF GotParam right 
		<new_value> = ( <new_value> + 1 ) 
		IF ( <new_value> > 50 ) 
			<new_value> = 1 
		ENDIF 
	ELSE 
		IF GotParam left 
			<new_value> = ( <new_value> - 1 ) 
			IF ( <new_value> < 1 ) 
				<new_value> = 50 
			ENDIF 
		ENDIF 
	ENDIF 
	change AutoLevel_TotalGamesToPlay = <new_value> 
	IF ( <new_value> < <_curerentTotalGamesToPlay> ) 
		IF ( AutoLevel_GamesPlayed = <new_value> ) 
			change AutoLevel_GamesPlayed = 0 
		ENDIF 
	ENDIF 
	IF ( AutoLevel_TotalGamesToPlay > 1 ) 
		msgend = "Games" 
	ELSE 
		msgend = "Game" 
	ENDIF 
	FormatText textname = msg "%i %j" i = ( AutoLevel_TotalGamesToPlay ) j = <msgend> 
	thugpro_menu_item_update_extra_text id = autolevel_menu_gamestoplay text = <msg> 
	THUGPRO_AutoserverSetGamesToPlay games = ( AutoLevel_TotalGamesToPlay ) 
ENDSCRIPT

SCRIPT AutoServerMenu_SelectGames_Create_Item 
	IF GotParam disabled_in_auto_game 
		RETURN 
	ENDIF 
	IF ( <enabled> = 1 ) 
		<checked> = checked 
	ELSE 
		<checked> = unchecked 
	ENDIF 
	<focusable> = focusable 
	GetLevelStructureName 
	IF ( <checksum> = netgraffiti ) 
		IF StructureContains structure = ( <level_structure_name> ) DisableGraffiti 
			<checked> = unchecked 
			<focusable> = not_focusable 
		ENDIF 
	ENDIF 
	IF ( <checksum> = netctf ) 
		IF StructureContains structure = ( <level_structure_name> ) DisableCTF 
			<checked> = unchecked 
			<focusable> = not_focusable 
		ENDIF 
	ENDIF 
	AppendSuffixToChecksum base = <checksum> SuffixString = "menu_" 
	make_thugpro_menu_checkbox_item { 
		id = <appended_id> 
		text = <Name> 
		<checked> 
		<focusable> 
		pad_choose_script = AutoGame_ToggleGameType 
		pad_choose_params = { checksum = <checksum> } 
	} 
ENDSCRIPT

SCRIPT AutoServerMenu_SelectGames_Create 
	thugpro_menu_create { 
		menu_name = SelectGames 
		menu_title = "Select Game Types" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = AutoServerMenu_Create_Menu 
		boxed 
	} 
	ForEachIn net_game_type_info do = AutoServerMenu_SelectGames_Create_Item 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT AutoServerMenu_Toggle_AutoLevelCycle 
	GetTags 
	IF IsTrue AutoLevel_Cycle 
		change AutoLevel_Cycle = 0 
		thugpro_menu_item_update_extra_text id = <id> text = "Randomize" 
	ELSE 
		IF ( AutoLevel_Cycle = 0 ) 
			change AutoLevel_Cycle = 1 
			thugpro_menu_item_update_extra_text id = <id> text = "In Order" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AutoServerMenu_Toggle_GameModeShuffle 
	GetTags 
	IF IsHost 
		IF IsTrue AutoGameMode_ShuffleType 
			change AutoGameMode_ShuffleType = 0 
			thugpro_menu_item_update_extra_text id = <id> text = "In Order" 
		ELSE 
			change AutoGameMode_ShuffleType = 1 
			thugpro_menu_item_update_extra_text id = <id> text = "Randomize" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AutoGame_ToggleGameType 
	GetTags 
	GetIndexOfItemContaining { 
		array = net_game_type_info 
		index = 0 
		Name = checksum 
		value = <checksum> 
	} 
	IF NOT GotParam index 
		printf "-- AutoGame_ToggleGameType trying to toggle unknown game type" 
		RETURN 
	ENDIF 
	temp_array = net_game_type_info 
	IF IntegerEquals a = ( net_game_type_info [ <index> ] . enabled ) b = 1 
		<enabled> = 0 
		thugpro_menu_item_update_checkbox id = <id> off 
	ELSE 
		<enabled> = 1 
		thugpro_menu_item_update_checkbox id = <id> on 
	ENDIF 
	temp_struct = { 
		Name = ( ( net_game_type_info [ <index> ] ) . Name ) 
		description = ( ( net_game_type_info [ <index> ] ) . description ) 
		checksum = ( ( net_game_type_info [ <index> ] ) . checksum ) 
		goal_script = ( ( net_game_type_info [ <index> ] ) . goal_script ) 
		icon = ( ( net_game_type_info [ <index> ] ) . icon ) 
		enabled = <enabled> 
	} 
	SetArrayElement { 
		arrayname = temp_array 
		index = <index> 
		newvalue = <temp_struct> 
	} 
ENDSCRIPT

description_text_autoserver = "todo: auto server" 
description_text_autogamemode = "todo: auto game mode cycle" 
description_text_autolevel = "todo: auto level cycle" 
SCRIPT AutoServerMenu_Create_Menu 
	helper_text_elements = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\b6/\\b5 = Toggle" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Accept" } 
	] 
	thugpro_menu_create { 
		menu_name = AutoServer 
		menu_title = "Auto Server Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_pre_network_host_options_menu 
		helper_text = <helper_text_elements> 
		show_description_panel 
		boxed 
	} 
	IF NOT IsHost 
		<autoserver_focusable> = not_focusable 
	ENDIF 
	IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
		<autoserver_extra_text> = "On" 
	ELSE 
		<autoserver_extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = autoserver_menu_toggle 
		text = "Auto Server" 
		extra_text = <autoserver_extra_text> 
		description_text = ( description_text_autoserver ) 
		option_arrows_callback = AutoServerMenu_Toggle_Auto_Server 
		option_arrows 
		<autoserver_focusable> 
	} 
	FormatText textname = intermission_extra_text "%a Seconds" a = ( AutoServer_BreakTime ) 
	make_thugpro_menu_item { 
		id = autoserver_menu_intervals 
		text = "Intermission" 
		extra_text = <intermission_extra_text> 
		description_text = ( description_text_autoserver ) 
		option_arrows_callback = AutoServerMenu_Toggle_Auto_Server_Breaktime 
		option_arrows 
		line_bot 
		<autoserver_focusable> 
	} 
	make_thugpro_menu_item { id = autolevel_menu_separator not_focusable no_box } 
	IF GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		<autolevel_extra_text> = "On" 
	ELSE 
		<autolevel_extra_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = autolevel_menu_toggle 
		text = "Auto Level" 
		extra_text = <autolevel_extra_text> 
		description_text = ( description_text_autolevel ) 
		option_arrows_callback = AutoServerMenu_Toggle_Auto_Level 
		option_arrows 
		line_top 
		<autoserver_focusable> 
	} 
	IF NOT GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		<autolevel_focusable> = not_focusable 
	ELSE 
		<autolevel_focusable> = <autoserver_focusable> 
	ENDIF 
	IF IsTrue AutoLevel_Cycle 
		<autolevel_cycle_extra_text> = "In Order" 
	ELSE 
		<autolevel_cycle_extra_text> = "Randomize" 
	ENDIF 
	make_thugpro_menu_item { 
		id = autolevel_menu_level_cycle 
		text = "Level Cycle" 
		extra_text = <autolevel_cycle_extra_text> 
		description_text = ( description_text_autolevel ) 
		option_arrows_callback = AutoServerMenu_Toggle_AutoLevelCycle 
		option_arrows 
		<autolevel_focusable> 
	} 
	IF ( AutoLevel_TotalGamesToPlay > 1 ) 
		<game_text> = "Games" 
	ELSE 
		<game_text> = "Game" 
	ENDIF 
	FormatText textname = autolevel_intervals_extra_text "%a %b" a = ( AutoLevel_TotalGamesToPlay ) b = <game_text> 
	make_thugpro_menu_item { 
		id = autolevel_menu_gamestoplay 
		text = "Level Intervals" 
		extra_text = <autolevel_intervals_extra_text> 
		description_text = ( description_text_autolevel ) 
		option_arrows_callback = AutoServerMenu_ToggleAutoLevelGameCount 
		option_arrows 
		<autolevel_focusable> 
	} 
	make_thugpro_menu_item { 
		id = autolevel_menu_level_select 
		text = "Select Levels" 
		description_text = ( description_text_autolevel ) 
		pad_choose_params = { from_autoserver_options } 
		pad_choose_script = launch_level_select_menu 
		line_bot 
		<autolevel_focusable> 
	} 
	make_thugpro_menu_item { id = autogamemode_menu_separator not_focusable no_box } 
	IF GetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
		<autogame_extra_text> = "On" 
	ELSE 
		<autogame_extra_text> = "Off" 
	ENDIF 
	RemoveParameter not_focusable 
	make_thugpro_menu_item { 
		id = autogamemode_menu_toggle 
		text = "Auto Game mode" 
		description_text = ( description_text_autogamemode ) 
		extra_text = <autogame_extra_text> 
		option_arrows_callback = AutoServerMenu_Toggle_Auto_Game_Mode 
		option_arrows 
		line_top 
		<not_focusable> 
	} 
	IF IsTrue AutoGameMode_ShuffleType 
		<autogame_cycle_extra_text> = "Randomize" 
	ELSE 
		<autogame_cycle_extra_text> = "In Order" 
	ENDIF 
	make_thugpro_menu_item { 
		id = autogamemode_menu_shuffle 
		text = "Game Mode Cycle" 
		extra_text = <autogame_cycle_extra_text> 
		description_text = ( description_text_autogamemode ) 
		option_arrows_callback = AutoServerMenu_Toggle_GameModeShuffle 
		option_arrows 
		<autogame_focusable> 
	} 
	IF GetGlobalFlag flag = FLAG_AUTO_GAME_MODE 
		<autogame_focusable> = focusable 
	ELSE 
		<autogame_focusable> = not_focusable 
	ENDIF 
	make_thugpro_menu_item { 
		id = autogamemode_menu_select_game 
		text = "Select Games" 
		description_text = ( description_text_autogamemode ) 
		pad_choose_script = AutoServerMenu_SelectGames_Create 
		<autogame_focusable> 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT AutoLevel_ChangeLevel 
	AutoLevel_GenerateNextLevelIndex 
	GetCurrentLevel 
	IF LevelIs ( ( level_select_menu_level_info [ <level_index> ] ) . Level ) 
		printf "AutoLevel_ChangeLevel-level_index(%i) equals current level index, this shouldn\'t happen" i = <level_index> 
		Wait 1 second 
	ELSE 
		level_select_change_level Level = ( ( level_select_menu_level_info [ <level_index> ] ) . Level ) 
	ENDIF 
ENDSCRIPT

SCRIPT AutoLevel_AddCurrentLevelIndexToRecentLevelIndex 
	IF NOT GotParam current_index 
		RETURN 
	ENDIF 
	temp_array = AutoLevel_RecentLevelIndex 
	SetArrayElement arrayname = temp_array index = 19 newvalue = ( AutoLevel_RecentLevelIndex [ 18 ] ) 
	SetArrayElement arrayname = temp_array index = 18 newvalue = ( AutoLevel_RecentLevelIndex [ 17 ] ) 
	SetArrayElement arrayname = temp_array index = 17 newvalue = ( AutoLevel_RecentLevelIndex [ 16 ] ) 
	SetArrayElement arrayname = temp_array index = 16 newvalue = ( AutoLevel_RecentLevelIndex [ 15 ] ) 
	SetArrayElement arrayname = temp_array index = 15 newvalue = ( AutoLevel_RecentLevelIndex [ 14 ] ) 
	SetArrayElement arrayname = temp_array index = 14 newvalue = ( AutoLevel_RecentLevelIndex [ 13 ] ) 
	SetArrayElement arrayname = temp_array index = 13 newvalue = ( AutoLevel_RecentLevelIndex [ 12 ] ) 
	SetArrayElement arrayname = temp_array index = 12 newvalue = ( AutoLevel_RecentLevelIndex [ 11 ] ) 
	SetArrayElement arrayname = temp_array index = 11 newvalue = ( AutoLevel_RecentLevelIndex [ 10 ] ) 
	SetArrayElement arrayname = temp_array index = 10 newvalue = ( AutoLevel_RecentLevelIndex [ 9 ] ) 
	SetArrayElement arrayname = temp_array index = 9 newvalue = ( AutoLevel_RecentLevelIndex [ 8 ] ) 
	SetArrayElement arrayname = temp_array index = 8 newvalue = ( AutoLevel_RecentLevelIndex [ 7 ] ) 
	SetArrayElement arrayname = temp_array index = 7 newvalue = ( AutoLevel_RecentLevelIndex [ 6 ] ) 
	SetArrayElement arrayname = temp_array index = 6 newvalue = ( AutoLevel_RecentLevelIndex [ 5 ] ) 
	SetArrayElement arrayname = temp_array index = 5 newvalue = ( AutoLevel_RecentLevelIndex [ 4 ] ) 
	SetArrayElement arrayname = temp_array index = 4 newvalue = ( AutoLevel_RecentLevelIndex [ 3 ] ) 
	SetArrayElement arrayname = temp_array index = 3 newvalue = ( AutoLevel_RecentLevelIndex [ 2 ] ) 
	SetArrayElement arrayname = temp_array index = 2 newvalue = ( AutoLevel_RecentLevelIndex [ 1 ] ) 
	SetArrayElement arrayname = temp_array index = 1 newvalue = ( AutoLevel_RecentLevelIndex [ 0 ] ) 
	SetArrayElement arrayname = temp_array index = 0 newvalue = <current_index> 
	AutoLevel_RecentLevelIndex = <temp_array> 
ENDSCRIPT

level_rand_index = 0 
total_rand_levels = 0 
SCRIPT AutoLevel_GenerateNextLevelIndex 
	GetCurrentLevel 
	GetArraySize level_select_menu_level_info 
	current_index = -1 
	index = 0 
	low_index = 0 
	high_index = <array_size> 
	maxSeen = 15 
	printf "----------> " 
	BEGIN 
		IF ( ( ( level_select_menu_level_info [ <index> ] ) . Level ) = <Level> ) 
			<current_index> = <index> 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( ( AutoLevel_Cycle ) = 0 ) 
		IF NOT ( <current_index> = -1 ) 
			AutoLevel_AddCurrentLevelIndexToRecentLevelIndex current_index = <current_index> 
		ENDIF 
	ENDIF 
	IF ( ( AutoLevel_Cycle ) = 1 ) 
		<index> = ( <current_index> + 1 ) 
		BEGIN 
			IF ( <index> > <array_size> ) 
				<index> = 0 
			ENDIF 
			IF ( ( ( level_select_menu_level_info [ <index> ] ) . enabled ) = 1 ) 
				IF StructureContains structure = ( level_select_menu_level_info [ <index> ] ) contains = Exclude 
					IF ( ( ( level_select_menu_level_info [ <index> ] ) . Exclude ) = 0 ) 
						temp_index = ( ( total_rand_levels ) + 1 ) 
						change total_rand_levels = <temp_index> 
						FormatText textname = temp "----------> total(%a), next level(%b), index(%c)" a = ( total_rand_levels ) b = ( ( level_select_menu_level_info [ <index> ] ) . text ) c = <index> 
						printf <temp> 
						RETURN level_index = <index> 
					ELSE 
						<index> = ( <index> + 1 ) 
					ENDIF 
				ELSE 
					temp_index = ( ( total_rand_levels ) + 1 ) 
					change total_rand_levels = <temp_index> 
					FormatText textname = temp "----------> total(%a), next level(%b), index(%c)" a = ( total_rand_levels ) b = ( ( level_select_menu_level_info [ <index> ] ) . text ) b = <index> 
					printf <temp> 
					RETURN level_index = <index> 
				ENDIF 
			ELSE 
				<index> = ( <index> + 1 ) 
			ENDIF 
		REPEAT 
	ELSE 
		GetEnabledLevelCount 
		IF ( <level_count> > 25 ) 
			<maxSeen> = 20 
		ELSE 
			IF ( <level_count> < 26 ) 
				IF ( <level_count> > 19 ) 
					<maxSeen> = 14 
				ELSE 
					IF ( <level_count> > 13 ) 
						<maxSeen> = 8 
					ELSE 
						IF ( <level_count> > -1 ) 
							<maxSeen> = 4 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		FormatText textname = temp "----------> enabled level count(%a), max seen level count(%b)" a = <level_count> b = <maxSeen> 
		printf <temp> 
		IF ( level_rand_index = 0 ) 
			<low_index> = 0 
			<high_index> = <array_size> 
			change level_rand_index = 1 
		ELSE 
			IF ( level_rand_index = 1 ) 
				<low_index> = 0 
				<high_index> = <array_size> 
				change level_rand_index = 2 
			ELSE 
				IF ( level_rand_index = 2 ) 
					<low_index> = -11 
					<high_index> = 10 
					AutoLevel_EnabledLevelExistsInRange low = 0 high = <high_index> 
					IF ( <has_valid> = 0 ) 
						AutoLevel_EnabledLevelExistsInRange low = ( <array_size> - 11 ) high = <array_size> 
						IF ( <has_valid> = 0 ) 
							<low_index> = 0 
							<high_index> = <array_size> 
						ENDIF 
					ENDIF 
					change level_rand_index = 0 
				ENDIF 
			ENDIF 
		ENDIF 
		BEGIN 
			GetRandomValue Name = rand_num a = <low_index> b = <high_index> integer 
			IF ( <rand_num> < 0 ) 
				<rand_num> = ( <rand_num> + ( <array_size> + 1 ) ) 
			ENDIF 
			IF ( <level_count> > 3 ) 
				IF ( ( ( level_select_menu_level_info [ <rand_num> ] ) . enabled ) = 1 ) 
					IF StructureContains structure = ( level_select_menu_level_info [ <rand_num> ] ) contains = Exclude 
						IF ( ( ( level_select_menu_level_info [ <rand_num> ] ) . Exclude ) = 0 ) 
							AutoLevel_CheckCurrentLevelIndexInRecentLevelIndex index = <rand_num> max_seen = <maxSeen> 
							IF ( <contains> = 0 ) 
								temp_index = ( ( total_rand_levels ) + 1 ) 
								change total_rand_levels = <temp_index> 
								FormatText textname = temp "----------> total(%a), next level(%b), index(%c)" a = ( total_rand_levels ) b = ( ( level_select_menu_level_info [ <rand_num> ] ) . text ) c = <rand_num> 
								printf <temp> 
								RETURN level_index = <rand_num> 
							ENDIF 
						ENDIF 
					ELSE 
						AutoLevel_CheckCurrentLevelIndexInRecentLevelIndex index = <rand_num> max_seen = <maxSeen> 
						IF ( <contains> = 0 ) 
							temp_index = ( ( total_rand_levels ) + 1 ) 
							change total_rand_levels = <temp_index> 
							FormatText textname = temp "----------> total(%a), next level(%b), index(%c)" a = ( total_rand_levels ) b = ( ( level_select_menu_level_info [ <rand_num> ] ) . text ) c = <rand_num> 
							printf <temp> 
							RETURN level_index = <rand_num> 
						ENDIF 
					ENDIF 
				ENDIF 
			ELSE 
				IF ( ( ( level_select_menu_level_info [ <rand_num> ] ) . enabled ) = 1 ) 
					IF StructureContains structure = ( level_select_menu_level_info [ <rand_num> ] ) contains = Exclude 
						IF ( ( ( level_select_menu_level_info [ <rand_num> ] ) . Exclude ) = 0 ) 
							GetCurrentLevel 
							IF LevelIs ( ( level_select_menu_level_info [ <rand_num> ] ) . Level ) 
							ELSE 
								temp_index = ( ( total_rand_levels ) + 1 ) 
								change total_rand_levels = <temp_index> 
								FormatText textname = temp "----------> total(%a), next level(%b), index(%c)" a = ( total_rand_levels ) b = ( ( level_select_menu_level_info [ <rand_num> ] ) . text ) c = <rand_num> 
								printf <temp> 
								RETURN level_index = <rand_num> 
							ENDIF 
						ENDIF 
					ELSE 
						GetCurrentLevel 
						IF LevelIs ( ( level_select_menu_level_info [ <rand_num> ] ) . Level ) 
						ELSE 
							temp_index = ( ( total_rand_levels ) + 1 ) 
							change total_rand_levels = <temp_index> 
							FormatText textname = temp "----------> total(%a), next level(%b), index(%c)" a = ( total_rand_levels ) b = ( ( level_select_menu_level_info [ <rand_num> ] ) . text ) c = <rand_num> 
							printf <temp> 
							RETURN level_index = <rand_num> 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT AutoLevel_EnabledLevelExistsInRange 
	GetArraySize level_select_menu_level_info 
	IF ( <array_size> < <high> ) 
		<high> = <array_size> 
	ENDIF 
	IF NOT GotParam max_seen 
		max_seen = 15 
	ENDIF 
	BEGIN 
		IF ( ( ( level_select_menu_level_info [ <low> ] ) . enabled ) = 1 ) 
			IF StructureContains structure = ( level_select_menu_level_info [ <low> ] ) contains = Exclude 
				IF ( ( ( level_select_menu_level_info [ <low> ] ) . Exclude ) = 0 ) 
					AutoLevel_CheckCurrentLevelIndexInRecentLevelIndex index = <low> max_seen = <max_seen> 
					IF ( <contains> = 0 ) 
						RETURN has_valid = 1 
					ENDIF 
				ENDIF 
			ELSE 
				AutoLevel_CheckCurrentLevelIndexInRecentLevelIndex index = <low> max_seen = <max_seen> 
				IF ( <contains> = 0 ) 
					RETURN has_valid = 1 
				ENDIF 
			ENDIF 
		ENDIF 
		<low> = ( <low> + 1 ) 
	REPEAT ( <high> - <low> ) 
	RETURN has_valid = 0 
ENDSCRIPT

SCRIPT AutoLevel_CheckCurrentLevelIndexInRecentLevelIndex 
	IF NOT GotParam max_seen 
		max_seen = 15 
	ENDIF 
	IF NOT GotParam index 
		RETURN contains = 0 
	ENDIF 
	contains = 0 
	i = 0 
	BEGIN 
		IF ( ( AutoLevel_RecentLevelIndex [ <i> ] ) = <index> ) 
			<contains> = 1 
			BREAK 
		ENDIF 
		<i> = ( <i> + 1 ) 
	REPEAT <max_seen> 
	RETURN contains = <contains> 
ENDSCRIPT

SCRIPT GetEnabledLevelCount 
	enabled_count = 0 
	index = 0 
	GetArraySize level_select_menu_level_info 
	BEGIN 
		IF ( ( ( level_select_menu_level_info [ <index> ] ) . enabled ) = 1 ) 
			<enabled_count> = ( <enabled_count> + 1 ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN level_count = <enabled_count> 
ENDSCRIPT

SCRIPT THUGPRO_FCFS_ChangeLevel 
	IF IsHost 
		IF NOT LevelIs <Level> 
			level_select_change_level Level = <Level> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_FCFS_StartGame 
	IF IsHost 
		chosen_host_game 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_FCFS_EndGame 
	IF IsHost 
		IF GameIsOver 
			RETURN 
		ENDIF 
		kill_all_panel_messages 
		IF InInternetMode 
			IF OnServer 
				ReportStats final 
			ENDIF 
		ENDIF 
		EndNetworkGame 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_FCFS_SetGameOptions 
	IF IsHost 
		IF NOT GotParam pref_field 
			RETURN 
		ENDIF 
		IF NOT GotParam checksum 
			RETURN 
		ELSE 
			IF NOT ( <prefs> = network ) 
				RETURN 
			ENDIF 
		ENDIF 
		IF ArrayContains array = THUGPRO_FCFS_AllowedHostPreferences contains = <pref_field> 
			IF ( <checksum> = netctf ) 
				IF NOT InTeamGame 
					SetPreferencesFromUI prefs = network field = "team_mode" checksum = teams_two string = "2" 
					SetNumTeams 2 
				ENDIF 
			ENDIF 
			SetPreferencesFromUI prefs = network <...> 
			SWITCH <checksum> 
				CASE netscorechallengecase scorechallenge 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_1000000 score = 1000000 string = "1,000,000 points" 
				CASE netkingcase king 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = time_120 time = 120 string = "2 minutes" 
				CASE netctf 
					SetPreferencesFromUI prefs = <prefs> field = "target_score" checksum = score_5 score = 5 string = "5 captures" 
			ENDSWITCH 
		ENDIF 
	ENDIF 
ENDSCRIPT

THUGPRO_FCFS_AllowedHostPreferences = [ 
	"time_limit" 
	"stop_at_zero" 
	"game_type" 
	"ctf_game_type" 
	"target_score" 
	"score_reset" 
	"team_mode" 
	"team_graffiti_mode" 
	"friendly_fire" 
	"fireball_difficulty" 
] 
SCRIPT AutoLevelMenu_Toggle_Level 
	GetTags 
	<temp_array> = level_select_menu_level_info 
	IF ( ( ( level_select_menu_level_info [ <index> ] ) . enabled ) = 0 ) 
		<temp_struct> = { 
			text = ( ( level_select_menu_level_info [ <index> ] ) . text ) 
			Level = ( ( level_select_menu_level_info [ <index> ] ) . Level ) 
			game = ( ( level_select_menu_level_info [ <index> ] ) . game ) 
			enabled = 1 
		} 
		SetArrayElement { 
			arrayname = temp_array 
			index = <index> 
			newvalue = <temp_struct> 
		} 
		thugpro_menu_item_update_checkbox id = <id> on 
	ELSE 
		GetEnabledLevelCount 
		count = ( <level_count> - 1 ) 
		IF ( <count> < 2 ) 
			PlaySound GUI_Buzzer01 
			RETURN 
		ELSE 
			temp_struct = { 
				text = ( ( level_select_menu_level_info [ <index> ] ) . text ) 
				Level = ( ( level_select_menu_level_info [ <index> ] ) . Level ) 
				game = ( ( level_select_menu_level_info [ <index> ] ) . game ) 
				enabled = 0 
			} 
			SetArrayElement { 
				arrayname = temp_array 
				index = <index> 
				newvalue = <temp_struct> 
			} 
			thugpro_menu_item_update_checkbox id = <id> off 
		ENDIF 
	ENDIF 
ENDSCRIPT


