
level_select_last_level_played = [ load_sch ] 
return_to_level = [ null ] 
still_in_net_area = 0 
created_park_warning = 0 
SCRIPT launch_level_select_menu 
	IF LevelIs Load_MainMenu 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim name = skateshop_board_select_cam play_hold 
	ENDIF 
	IF GotParam from_server_options 
		change in_server_options = 1 
	ENDIF 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps id = the_time hide 
	ENDIF 
	<pad_back_script> = THUGPRO_LevelSelect_menu_exit 
	create_thugpro_level_select_menu <...> 
ENDSCRIPT

SCRIPT do_arrow_effect 
	DoMorph scale = 0.89999997616 time = 0.10000000149 rgba = [ 0 0 0 80 ] 
	DoMorph scale = 1.00000000000 time = 0.10000000149 rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
ENDSCRIPT

SCRIPT check_level_dot_valid 
	RETURN valid = 1 
ENDSCRIPT

SCRIPT get_num_levels_unlocked 
	GetArraySize level_select_menu_level_info 
	RETURN num_unlocked = <array_size> 
ENDSCRIPT

SCRIPT created_park_menu_add_item 
	highlight_bar_scale = PAIR(1.60000002384, 0.69999998808) 
	centered = centered 
	no_bg = no_bg 
	theme_menu_add_item <...> 
ENDSCRIPT

SCRIPT network_level_select_pad_back 
	<net_pad_back> = 1 
	THUGPRO_LevelSelect_menu_exit <...> 
ENDSCRIPT

SCRIPT kill_level_select_scripts 
	level_select_get_info_panel_script 
	KillSpawnedScript name = level_select_build_info_panel_common_bits 
	KillSpawnedScript name = <info_panel_script> 
ENDSCRIPT

SCRIPT created_park_launch 
	IF ( in_server_options = 1 ) 
		GetParkEditorMaxPlayers 
		GetNetworkNumPlayers 
		IF inNetGame 
		ENDIF 
	ENDIF 
	GetParkEditorMaxPlayers 
	GetNetworkNumPlayers 
	IF inNetGame 
	ENDIF 
	IF ( in_server_options = 1 ) 
		level = load_sk5ed_gameplay 
		string = "Created Park" 
		IF LevelIs Load_MainMenu 
			IF ( in_server_options = 1 ) 
				THUGPRO_LevelSelect_menu_exit <...> 
			ELSE 
				level_select_change_level <...> 
			ENDIF 
		ELSE 
			level_select_change_level <...> 
		ENDIF 
	ELSE 
		IF inNetGame 
			change created_park_warning = 0 
			level_select_change_level level = load_sk5ed_gameplay <...> show_warning 
		ELSE 
			level_select_change_level level = load_sk5ed_gameplay <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT level_select_created_park_list 
	thugpro_menu_create { 
		menu_name = premade_park 
		menu_title = "Pre-made parks" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = level_select_created_park_list_exit 
		pad_back_params = <...> 
		scrolling 
		boxed 
	} 
	GetArraySize premade_parks_info 
	index = 0 
	BEGIN 
		FormatText ChecksumName = id "menu_pre_made_park_%d" d = ( premade_parks_info [ <index> ] . slot ) 
		make_thugpro_menu_item { 
			id = <id> 
			text = ( premade_parks_info [ <index> ] . name ) 
			pad_choose_script = maybe_load_premade_park 
			pad_choose_params = { 
				slot = ( premade_parks_info [ <index> ] . slot ) 
				max = ( premade_parks_info [ <index> ] . max ) 
			} 
			centered 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT maybe_load_premade_park 
	IF inNetGame 
		DestroyIfObjectExist id = level_select_menu 
		DestroyIfObjectExist id = level_select_panel_container 
	ENDIF 
	IF CustomParkMode editing 
		in_park_ed = 1 
	ENDIF 
	level_select_created_park_list_exit <...> 
ENDSCRIPT

SCRIPT level_select_created_park_list_exit 
	IF GotParam slot 
		IF GotParam in_park_ed 
			parked_load_from_disk slot = <slot> 
		ELSE 
			IF GotParam from_server_options 
				LoadParkFromDisk slot = <slot> block_rebuild 
				created_park_launch from_server_options 
			ELSE 
				LoadParkFromDisk slot = <slot> block_rebuild 
				created_park_launch 
			ENDIF 
		ENDIF 
	ELSE 
		IF GotParam in_park_editor 
			create_pause_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT kill_level_select_cams 
	IF LevelIs Load_MainMenu 
		KillSkaterCamAnim name = level_select_cam 
	ENDIF 
ENDSCRIPT

SCRIPT really_change_level 
	IF OnServer 
		change_level <...> 
	ELSE 
		IF IsHost 
			FCFSRequestChangeLevel <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT level_select_change_level 
	IF GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE 
		AutoServer_Destroy_Timer 
		IF ( AutoServer_PausedTimer = 1 ) 
			change AutoServer_PausedTimer = 0 
		ENDIF 
	ENDIF 
	GoalManager_ShowPoints 
	IF NOT GoalManager_HasActiveGoals 
		GoalManager_ShowGoalPoints 
	ENDIF 
	DestroyIfObjectExist id = level_select_anchor 
	DestroyIfObjectExist id = current_menu_anchor 
	IF LevelIs load_sk5ed 
		load_parked_textures_to_main_memory unload 
	ENDIF 
	IF LevelIs Load_MainMenu 
		SetColorBufferClear clear = 0 
	ENDIF 
	IF LevelIs load_sk5ed_gameplay 
		RailEditor : DestroyEditedRailSectors DoNotUpdateSuperSectors 
	ENDIF 
	IF inNetGame 
		show_warning = 1 
	ENDIF 
	IF IsCustomPark 
		really_change_level <...> 
	ELSE 
		IF NOT LevelIs <level> 
			really_change_level <...> 
		ELSE 
			IF GotParam chose_same_level_script 
				<chose_same_level_script> 
			ELSE 
				IF root_window : GetSingleTag no_exit_pause_menu 
					THUGPRO_LevelSelect_menu_exit 
					RETURN 
				ENDIF 
				IF GotParam end_run 
					THUGPRO_LevelSelect_menu_exit end_run 
					RETURN 
				ENDIF 
				IF InSplitScreenGame 
					THUGPRO_LevelSelect_menu_exit end_run 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	THUGPRO_LevelSelect_menu_exit no_new_menu 
	IF inNetGame 
		IF OnServer 
			exit_pause_menu NetServerChangeLevelMUSICFix 
		ENDIF 
	ELSE 
		exit_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT level_select_invalid_choice 
	printf "locked!" 
ENDSCRIPT

SCRIPT level_select_valid_choice 
	IF GotParam level 
		array = level_select_last_level_played 
		SetArrayElement arrayname = array index = 0 newvalue = <level> 
	ENDIF 
	IF GotParam filename 
		GetCustomParkName 
		IF NOT ( <filename> = <name> ) 
			IF LoadFromMemoryCard name = <filename> type = Park 
			ELSE 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	GetTags 
	IF GotParam level_callback_script 
		<level_callback_script> <...> 
	ENDIF 
ENDSCRIPT


