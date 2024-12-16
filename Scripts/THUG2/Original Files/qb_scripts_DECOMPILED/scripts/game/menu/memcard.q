
VERSION_OPTIONSANDPROS = 37 
VERSION_NETWORKSETTINGS = 10 
VERSION_CAS = 22 
VERSION_CAT = 2 
VERSION_PARK = 6 
VERSION_CREATEDGOALS = 5 
VERSION_CREATEDGRAPHIC = 1 
MAX_MEMCARD_FILENAME_LENGTH = 15 
SaveSize_OptionsAndPros = 90000 
SaveSize_OptionsAndPros_PS2 = 120000 
SaveSize_NetworkSettings = 1100 
SaveSize_Cat = 34000 
SaveSize_Park = 35000 
SaveSize_CreatedGoals = 100000 
SaveSize_CreatedGraphic = 32000 
CATIconSpaceRequired = 11 
ParkIconSpaceRequired = 11 
OptionsProsIconSpaceRequired = 12 
NetworkSettingsIconSpaceRequired = 14 
CreatedGoalsIconSpaceRequired = 12 
CreatedGraphicIconSpaceRequired = 12 
BadVersionNumber = #"BAD VERSION!" 
DamagedFile = #"DAMAGED!" 
NGCDamagedFile = #"CORRUPT FILE!" 
SavingOrLoading = Saving 
PreviousProgressiveMode = Off 
SCRIPT save_previous_progressive_mode 
	IF GetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
		Change PreviousProgressiveMode = On 
	ELSE 
		Change PreviousProgressiveMode = Off 
	ENDIF 
ENDSCRIPT

SCRIPT restore_previous_progressive_mode 
	IF ChecksumEquals a = ( PreviousProgressiveMode ) b = On 
		SetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
	ELSE 
		UnSetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
	ENDIF 
ENDSCRIPT

SCRIPT GetFileTypeName 
	SWITCH <file_type> 
		CASE OptionsAndPros 
			RETURN filetype_name = #"GAME PROGRESS" 
		CASE NetworkSettings 
			IF IsXBox 
				RETURN filetype_name = #"NETWORK SETTINGS" 
			ELSE 
				RETURN filetype_name = #"ONLINE PREFS" 
			ENDIF 
		CASE Cas 
			RETURN filetype_name = #"SKATER" 
		CASE CAT 
			RETURN filetype_name = #"TRICK" 
		CASE Park 
			RETURN filetype_name = #"PARK" 
		CASE CreatedGoals 
			RETURN filetype_name = #"GOALS" 
		CASE CreatedGraphic 
			RETURN filetype_name = #"GRAPHICS" 
		DEFAULT 
			RETURN filetype_name = #"" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT QuitToDashboard 
	GetPlatform 
	SWITCH <Platform> 
		CASE PS2 
			ResetPS2 
		CASE XBox 
			GotoXboxDashboard memory total_blocks_needed = <total_blocks_needed> 
		CASE NGC 
			ResetToIPL 
	ENDSWITCH 
ENDSCRIPT

SCRIPT destroy_pause_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT destroy_main_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_files_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_net_settings_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_internet_options_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 gameframe 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_level_select 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
ENDSCRIPT

SCRIPT ResetAbortAndDoneScripts 
	Change DoneScript = DefaultDoneScript 
	Change AbortScript = DefaultAbortScript 
	Change RetryScript = DefaultRetryScript 
	Change SavingOrLoading = Saving 
ENDSCRIPT

DoneScript = DefaultDoneScript 
SCRIPT DefaultDoneScript 
	
ENDSCRIPT

AbortScript = DefaultAbortScript 
SCRIPT DefaultAbortScript 
	
ENDSCRIPT

SCRIPT memcard_menus_cleanup 
	EnableReset 
	dialog_box_exit no_pad_start 
	destroy_files_menu 
	destroy_onscreen_keyboard 
	IF NOT ( LevelIs Load_MainMenu ) 
		IF NOT GoalManager_HasActiveGoals 
		ENDIF 
	ENDIF 
	pause_menu_gradient Off 
ENDSCRIPT

SCRIPT back_to_main_menu2 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	IF GetGlobalFlag flag = SCREEN_MODE_PROGRESSIVE 
		IF NOT isPal 
			onload_progressive_scan_check callback_script = launch_main_menu 
		ELSE 
			launch_main_menu 
		ENDIF 
	ELSE 
		launch_main_menu 
	ENDIF 
ENDSCRIPT

SCRIPT career_autoload_launch_current_level 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	IF NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		PlaySongsInOrder 
	ELSE 
		PlaySongsRandomly 
	ENDIF 
	load_mainmenu_textures_to_main_memory unload 
	change_level level = <level> 
ENDSCRIPT

SCRIPT back_to_pre_cagr_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	edit_graphic_create_pre_menu 
ENDSCRIPT

SCRIPT back_to_pre_cas_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	IF ScreenElementExists id = black_top_strip 
		DoScreenElementMorph { 
			id = black_top_strip 
			time = 0 
			alpha = 1 
		} 
	ENDIF 
	create_pre_cas_menu 
ENDSCRIPT

SCRIPT back_to_pause_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	restore_start_key_binding 
	IF ( save_successful = 1 ) 
		
		parked_quit level = Load_MainMenu 
	ELSE 
		
		IF root_window : GetSingleTag save_return_to_pause_menu 
			root_window : RemoveTags tags = [ save_return_to_pause_menu ] 
			create_pause_menu 
			RETURN 
		ENDIF 
		IF root_window : GetSingleTag save_return_to_game 
			root_window : RemoveTags tags = [ save_return_to_game ] 
			ingame_save_return_to_game 
			RETURN 
		ENDIF 
		IF CustomParkMode editing 
			create_pause_menu 
		ELSE 
			IF IsTrue fake_nigel_active 
				GetCurrentSkaterProfileIndex 
				RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = fake_nigel_temp_profile_save NoFaceTexture 
			ENDIF 
			create_options_menu 
		ENDIF 
	ENDIF 
	Change save_successful = 2 
ENDSCRIPT

SCRIPT back_to_end_replay_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_in_game_end_replay_menu 
ENDSCRIPT

SCRIPT back_to_net_settings_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_network_options_menu 
ENDSCRIPT

SCRIPT back_to_beat_goal 
	memcard_menus_cleanup 
	GoalManager_ShowPoints 
	ResetAbortAndDoneScripts 
	goal_save_reject 
ENDSCRIPT

SCRIPT back_to_select_skater 
	restore_previous_progressive_mode 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	launch_select_skater_menu no_reload_textures 
ENDSCRIPT

SCRIPT back_to_options_menu 
	memcard_menus_cleanup 
	restore_previous_progressive_mode 
	ResetAbortAndDoneScripts 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT back_to_career_options_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	restore_previous_progressive_mode 
	Skater : Unhide 
	create_gamemode_options_menu 
ENDSCRIPT

SCRIPT back_to_created_park_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	IF ( still_in_net_area = 1 ) 
		back_to_net_host_options 
	ELSE 
		return_to_created_park_menu 
	ENDIF 
ENDSCRIPT

SCRIPT load_loaded_created_park 
	dialog_box_exit 
	IF LevelIs load_sk5ed_gameplay 
		IF inNetGame 
			level_select_change_level level = load_sk5ed_gameplay <...> show_warning 
			RETURN 
		ENDIF 
	ENDIF 
	return_to_created_park_menu 
ENDSCRIPT

SCRIPT back_to_net_host_options 
	prefs = network 
	field = "level" 
	string = "Created Park" 
	checksum = load_sk5ed_gameplay 
	select_host_option <...> 
	Change still_in_net_area = 0 
	IF ObjectExists id = host_options_menu 
		DestroyScreenElement id = host_options_menu 
	ENDIF 
	create_network_host_options_menu 
ENDSCRIPT

SCRIPT back_to_internet_options_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	IF ( load_successful = 1 ) 
		get_upload_description type = <type> filename = <filename> 
	ELSE 
		create_internet_options 
	ENDIF 
	Change load_successful = 2 
	Change loadforupload = 0 
ENDSCRIPT

SCRIPT back_to_cat_pause 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_CAT_pause_menu 
ENDSCRIPT

SCRIPT back_to_pre_cat_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_pre_CAT_menu 
ENDSCRIPT

SCRIPT back_to_edit_cat_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_CAT_menu load = 0 
ENDSCRIPT

SCRIPT finish_loading_cat 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	auto_assign_cat_to_slot 
ENDSCRIPT

SCRIPT back_to_edit_tricks_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_edit_tricks_menu 
ENDSCRIPT

RetryScript = DefaultRetryScript 
SCRIPT DefaultRetryScript 
	
ENDSCRIPT

SCRIPT mem_card_message_pause 
	DisableReset 
	IF NOT GotParam NoTimerReset 
		ResetTimer 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
	<CardCheckCounter> = 0 
	BEGIN 
		IF NOT CustomParkMode editing 
			IF ScreenElementExists id = controller_unplugged_dialog_anchor 
				Change check_for_unplugged_controllers = 1 
				goto NullScript 
			ENDIF 
		ENDIF 
		IF NOT GotParam NoCardRemovalCheck 
			IF ( <CardCheckCounter> = 10 ) 
				DisableReset 
				IF NOT CardIsInSlot 
					Change check_for_unplugged_controllers = 1 
					goto mcmess_ErrorNoCardInSlot 
				ENDIF 
				<CardCheckCounter> = 0 
			ELSE 
				<CardCheckCounter> = ( <CardCheckCounter> + 1 ) 
			ENDIF 
		ENDIF 
		IF TimeGreaterThan 1 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	Change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT check_card 
	IF NOT CardIsInSlot 
		goto mcmess_ErrorNoCardInSlot 
	ENDIF 
	IF BadDevice 
		goto mcmess_BadDevice 
	ENDIF 
	IF CardIsDamaged 
		goto mcmess_DamagedCard 
	ENDIF 
	IF NOT SectorSizeOK 
		IF CardIsDamaged 
			goto mcmess_DamagedCard 
		ELSE 
			goto mcmess_BadSectorSize 
		ENDIF 
	ENDIF 
	IF NOT CardIsFormatted 
		IF CardIsDamaged 
			goto mcmess_DamagedCard 
		ELSE 
			IF GotParam Save 
				goto mcmess_ErrorNotFormatted 
			ELSE 
				goto mcmess_ErrorNotFormattedNoFormatOption 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT IsXBox 
		mcmess_CheckingCard 
		mem_card_message_pause 
		dialog_box_exit no_pad_start 
	ENDIF 
ENDSCRIPT

StopCheckingForCardRemoval = 0 
SCRIPT CheckForCardRemoval 
	Change StopCheckingForCardRemoval = 0 
	<CardCheckCounter> = 0 
	BEGIN 
		IF ( <CardCheckCounter> = 10 ) 
			IF NOT CardIsInSlot 
				goto mcmess_ErrorNoCardInSlot 
			ENDIF 
			<CardCheckCounter> = 0 
		ELSE 
			<CardCheckCounter> = ( <CardCheckCounter> + 1 ) 
		ENDIF 
		IF NOT ObjectExists id = <menu_id> 
			BREAK 
		ENDIF 
		IF IsTrue StopCheckingForCardRemoval 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT DoFormatCard 
	KillSpawnedScript name = CheckForCardRemoval 
	IF NOT IsNGC 
		IF CardIsFormatted 
			goto DoneScript 
		ENDIF 
	ENDIF 
	ResetTimer 
	mcmess_FormattingCard 
	DisableReset 
	IF FormatCard 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		goto mcmess_FormatSuccessful 
	ELSE 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		goto mcmess_FormatFailed 
	ENDIF 
ENDSCRIPT

SCRIPT launch_files_menu 
	memcard_menus_cleanup 
	create_files_menu <...> 
ENDSCRIPT

SCRIPT create_files_menu pos_tweak = PAIR(-20.00000000000, -45.00000000000) 
	IF CustomParkMode editing 
		IF ScreenElementExists id = controller_unplugged_dialog_anchor 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam Save 
		UnloadAnimsAndCreateMemCardPools 
	ENDIF 
	IF GotParam Save 
		Change SavingOrLoading = Saving 
	ELSE 
		Change SavingOrLoading = Loading 
	ENDIF 
	IF NOT CardIsInSlot 
		goto mcmess_ErrorNoCardInSlot 
	ENDIF 
	SetScreenElementLock id = root_window Off 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	IF GotParam Save 
		menu_title = #"SAVE" 
		helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
				{ text = "\\bn = Back" } 
				{ text = "\\bm = Accept" } 
				{ text = "\\bo = Delete" } 
			] 
		} 
	ELSE 
		menu_title = #"LOAD" 
		helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
				{ text = "\\bn = Back" } 
				{ text = "\\bm = Accept" } 
			] 
		} 
	ENDIF 
	IF LevelIs Load_MainMenu 
		pos = PAIR(55.00000000000, 40.00000000000) 
		bg_pos = PAIR(318.00000000000, 77.00000000000) 
		top_bar_pos = PAIR(60.00000000000, 95.00000000000) 
	ELSE 
		pos = PAIR(55.00000000000, 50.00000000000) 
		bg_pos = PAIR(318.00000000000, 87.00000000000) 
		top_bar_pos = PAIR(60.00000000000, 100.00000000000) 
	ENDIF 
	make_new_menu { menu_title = "" 
		padding_scale = 1 
		menu_id = files_menu 
		vmenu_id = files_vmenu 
		pos = <pos> 
		dims = PAIR(500.00000000000, 192.00000000000) 
		just = [ center top ] 
		type = VScrollingMenu 
		scrolling_menu_id = files_scrolling_menu 
		scrolling_menu_title_id = files_scrolling_menu_title 
		scrolling_menu_offset = PAIR(0.00000000000, 32.00000000000) 
		dont_allow_wrap = dont_allow_wrap 
		helper_text = <helper_text> 
	} 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = reload_anims_then_run_abort_script } } 
			{ pad_down menu_vert_blink_arrow params = { id = files_menu_down_arrow } } 
			{ pad_up menu_vert_blink_arrow params = { id = files_menu_up_arrow } } 
		] 
	} 
	theme_background width = 6.50000000000 pos = <bg_pos> num_parts = 10 z_priority = 1 static = static 
	IF LevelIs Load_MainMenu 
		build_top_and_bottom_blocks 
		build_theme_sub_title title = <menu_title> no_grad_bar 
	ELSE 
		build_theme_sub_title title = <menu_title> 
	ENDIF 
	files_menu_add_top_bar pos = <top_bar_pos> 
	IF GotParam Save 
		GetMemCardDirectoryListing 
		GetMemCardSpaceAvailable 
		GetMemCardSpaceRequired <FileType> 
		RemoveParameter add_createnew_option 
		IF ( <TotalTHPS4FilesOnCard> = 0 ) 
			IF ( ( <SpaceAvailable> < <SpaceRequired> ) | ( <FilesLeft> < 1 ) ) 
				goto mcmess_ErrorNotEnoughRoomNoTHPSFilesExist params = { 
					FileType = <FileType> 
					SpaceRequired = <SpaceRequired> 
					SpaceAvailable = <SpaceAvailable> 
				} 
			ELSE 
				<add_createnew_option> = 1 
			ENDIF 
		ELSE 
			IF ( ( <SpaceAvailable> < <SpaceRequired> ) | ( <FilesLeft> < 1 ) ) 
				IF NOT GotParam DoNotShowNotEnoughRoomMessage 
					goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = { FileType = <FileType> SpaceRequired = <SpaceRequired> } 
				ENDIF 
			ELSE 
				IF NOT GotParam FilesLimitReached 
					<add_createnew_option> = 1 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GotParam add_createnew_option 
			files_menu_add_item { file_type = <FileType> 
				filename = #"              Create new" 
				file_size = #"" 
				pad_choose_script = CreateNew 
				font = small 
				icon_alpha = 0.00000000000 
			} 
			RemoveParameter DirectoryListing 
			GetMemCardDirectoryListing FileType = <FileType> 
		ENDIF 
		RemoveParameter add_createnew_option 
	ELSE 
		GetMemCardDirectoryListing FileType = <FileType> 
	ENDIF 
	IF GotParam DirectoryListing 
		IF GotParam Save 
			ForEachIn <DirectoryListing> Do = files_menu_add_item params = { pad_choose_script = OKToOverwrite MenuFileType = <FileType> Save } 
		ELSE 
			ForEachIn <DirectoryListing> Do = files_menu_add_item params = { pad_choose_script = load } 
		ENDIF 
	ELSE 
		IF NOT GotParam Save 
			goto mcmess_NoFiles params = { MenuFileType = <FileType> } 
		ENDIF 
	ENDIF 
	RemoveParameter DirectoryListing 
	files_menu_add_bottom_bar <...> 
	IF ScreenElementExists id = controller_unplugged_dialog_anchor 
		DoScreenElementMorph id = current_menu_anchor scale = 0 
	ELSE 
		FireEvent type = focus target = files_vmenu 
	ENDIF 
	wait 2 gameframe 
	IF ScreenElementExists id = files_scrolling_menu 
		SetScreenElementProps id = files_scrolling_menu reset_window_top 
	ENDIF 
	CheckForCardRemoval menu_id = files_menu 
ENDSCRIPT

SCRIPT files_menu_add_item pad_choose_script = NullScript font = dialog icon_alpha = 1.00000000000 
	SwitchToTempPoolsIfTheyExist 
	Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba 
	IF IsNGC 
		heap = TopDown 
		delete_button = pad_circle 
	ELSE 
		heap = BottomUp 
		delete_button = pad_square 
	ENDIF 
	IF GotParam Save 
		IF NOT ( <file_type> = <MenuFileType> ) 
			disable_item_overwrite = 1 
			unhighlight_rgba = [ 128 128 128 50 ] 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		dims = PAIR(550.00000000000, 24.00000000000) 
		event_handlers = [ { focus files_menu_focus } 
			{ unfocus files_menu_unfocus } 
			{ <delete_button> files_menu_delete } 
		] 
		heap = <heap> 
	} 
	IF NOT GotParam disable_item_overwrite 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ { pad_choose <pad_choose_script> } 
				{ pad_start <pad_choose_script> } 
			] 
		} 
	ENDIF 
	<container_id> = <id> 
	IF GotParam total_file_size 
		IF isPal 
			FormatText textname = date "%d/%m/%y" m = <month> d = <day> y = <year> 
			IF ( 10 > <minutes> ) 
				mzero = "0" 
			ELSE 
				mzero = "" 
			ENDIF 
			FormatText textname = time "%h:%z%m" h = <hour> m = <minutes> z = <mzero> 
		ELSE 
			FormatText textname = date "%m/%d/%y" m = <month> d = <day> y = <year> 
			IF ( 10 > <minutes> ) 
				mzero = "0" 
			ELSE 
				mzero = "" 
			ENDIF 
			IF ( <hour> < 12 ) 
				ampm = "am" 
			ELSE 
				ampm = "pm" 
				hour = ( <hour> - 12 ) 
			ENDIF 
			IF ( <hour> = 0 ) 
				hour = 12 
			ENDIF 
			FormatText textname = time "%h:%z%m%a" h = <hour> m = <minutes> z = <mzero> a = <ampm> 
		ENDIF 
	ENDIF 
	RemoveParameter year 
	RemoveParameter month 
	RemoveParameter day 
	RemoveParameter hour 
	RemoveParameter minutes 
	RemoveParameter Seconds 
	<container_id> : SetTags <...> 
	IF IsXBox 
		IF GotParam Corrupt 
			GetFileTypeName file_type = <file_type> 
			FormatText textname = filename #"DAMAGED %s" s = <filetype_name> 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		scale = 0.73000001907 
		font = <font> 
		text = <filename> 
		pos = PAIR(45.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <unhighlight_rgba> 
		z_priority = 6 
		heap = <heap> 
	} 
	IF GotParam total_file_size 
		GetPlatform 
		SWITCH <Platform> 
			CASE PS2 
				FormatText textname = file_size_text #"%d KB" d = <total_file_size> 
			CASE XBox 
				FormatText textname = file_size_text #"%d KB" d = <total_file_size> 
			CASE NGC 
				FormatText textname = file_size_text #"%d KB" d = <total_file_size> 
		ENDSWITCH 
	ELSE 
		<file_size_text> = "" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		scale = 0.73000001907 
		font = small 
		text = <file_size_text> 
		pos = PAIR(325.00000000000, 2.00000000000) 
		just = [ right center ] 
		rgba = <unhighlight_rgba> 
		z_priority = 6 
		heap = <heap> 
	} 
	SWITCH <file_type> 
		CASE OptionsAndPros 
			<file_type_icon> = mem_career 
		CASE NetworkSettings 
			<file_type_icon> = mem_net 
		CASE Park 
			<file_type_icon> = mem_park 
		CASE replay 
			<file_type_icon> = mem_replay 
		CASE Cas 
			<file_type_icon> = mem_skater 
		CASE CAT 
			<file_type_icon> = mem_tricks 
		CASE CreatedGoals 
			<file_type_icon> = mem_goals 
		CASE CreatedGraphic 
			<file_type_icon> = mem_graphics 
		DEFAULT 
			<file_type_icon> = mem_bad 
	ENDSWITCH 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		scale = 0.73000001907 
		texture = <file_type_icon> 
		pos = PAIR(25.00000000000, 0.00000000000) 
		just = [ center center ] 
		rgba = [ 50 50 50 128 ] 
		scale = 0.72000002861 
		z_priority = 1 
		alpha = <icon_alpha> 
		heap = <heap> 
	} 
	highlight_angle = 0 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = de_highlight_bar 
		pos = PAIR(264.00000000000, 0.00000000000) 
		just = [ center center ] 
		scale = PAIR(4.19999980927, 0.69999998808) 
		rgba = [ 128 128 128 0 ] 
		rot_angle = ( <highlight_angle> / 4 ) 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		scale = 0.73000001907 
		font = small 
		text = <date> 
		pos = PAIR(430.00000000000, 2.00000000000) 
		just = [ right center ] 
		rgba = <unhighlight_rgba> 
		z_priority = 6 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		scale = 0.73000001907 
		font = small 
		text = <time> 
		pos = PAIR(500.00000000000, 2.00000000000) 
		just = [ right center ] 
		rgba = <unhighlight_rgba> 
		z_priority = 6 
		heap = <heap> 
	} 
	SwitchToRegularPools 
ENDSCRIPT

SCRIPT files_menu_add_top_bar 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		dims = PAIR(550.00000000000, 24.00000000000) 
		pos = <pos> 
		just = [ left top ] 
	} 
	<container_id> = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		id = files_menu_up_arrow 
		texture = up_arrow 
		pos = PAIR(250.00000000000, 0.00000000000) 
		just = [ center center ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = black 
		pos = PAIR(-5.00000000000, 0.00000000000) 
		just = [ left center ] 
		scale = PAIR(132.00000000000, 6.69999980927) 
		rgba = [ 0 0 0 60 ] 
	} 
ENDSCRIPT

SCRIPT files_menu_add_bottom_bar text_scale = 1.00000000000 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba 
	GetStackedScreenElementPos y id = files_scrolling_menu offset = PAIR(0.00000000000, 15.00000000000) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		pos = <pos> 
		just = [ left top ] 
		not_focusable 
	} 
	<container_id> = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		id = files_menu_down_arrow 
		texture = down_arrow 
		pos = PAIR(240.00000000000, -15.00000000000) 
		just = [ left bottom ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = black 
		scale = PAIR(131.00000000000, 6.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = [ 0 0 0 60 ] 
	} 
	bar_id = <id> 
	GetStackedScreenElementPos y id = <container_id> 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		dims = PAIR(550.00000000000, 24.00000000000) 
		pos = <pos> 
		just = [ left top ] 
	} 
	<info_section_id> = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		id = files_menu_file_info 
		font = small 
		text = #"" 
		pos = PAIR(20.00000000000, 0.00000000000) 
		scale = <text_scale> 
		rgba = <highlight_rgba> 
		just = [ left center ] 
	} 
	GetStackedScreenElementPos y id = <info_section_id> 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		dims = PAIR(550.00000000000, 24.00000000000) 
		pos = <pos> 
		just = [ left top ] 
	} 
	<mem_info_id> = <id> 
	GetPlatform 
	IF GotParam Save 
		GetMemCardSpaceRequired <FileType> 
		SWITCH <Platform> 
			CASE XBox 
			CASE NGC 
				FormatText { 
					textname = LeftText 
					#"Needed: %n KB" 
					n = <SpaceRequired> 
				} 
			CASE PS2 
				FormatText { 
					textname = LeftText 
					#"Needed: %n KB" 
					n = <SpaceRequired> 
				} 
		ENDSWITCH 
	ENDIF 
	GetMemCardSpaceAvailable 
	SWITCH <Platform> 
		CASE XBox 
			IF ( <SpaceAvailable> > 49999 ) 
				MiddleText = #"" 
			ELSE 
				FormatText { 
					textname = MiddleText 
					#"Free: %f KB" 
					f = <SpaceAvailable> 
				} 
			ENDIF 
		CASE NGC 
			FormatText { 
				textname = MiddleText 
				#"Free: %f KB" 
				f = <SpaceAvailable> 
			} 
		CASE PS2 
			IF ( <SpaceAvailable> < 3 ) 
				displayed_space_available = 0 
			ELSE 
				displayed_space_available = ( <SpaceAvailable> -2 ) 
			ENDIF 
			FormatText { 
				textname = MiddleText 
				#"Free: %f KB" 
				f = <displayed_space_available> 
			} 
	ENDSWITCH 
	GetMaxTHPS4FilesAllowed 
	FormatText { 
		textname = RightText 
		#"Saves: %t/%m" 
		t = <TotalTHPS4FilesOnCard> 
		m = <MaxTHPS4FilesAllowed> 
	} 
	IF GotParam Save 
		CreateScreenElement { 
			type = TextElement 
			parent = <mem_info_id> 
			font = small 
			pos = PAIR(20.00000000000, -9.00000000000) 
			just = [ left top ] 
			rgba = <unhighlight_rgba> 
			scale = <text_scale> 
			text = <LeftText> 
		} 
	ENDIF 
	GetStackedScreenElementPos X id = <id> offset = PAIR(20.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <mem_info_id> 
		font = small 
		pos = <pos> 
		just = [ left top ] 
		rgba = <unhighlight_rgba> 
		scale = <text_scale> 
		text = <MiddleText> 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(20.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <mem_info_id> 
		font = small 
		pos = <pos> 
		just = [ left top ] 
		rgba = <unhighlight_rgba> 
		scale = <text_scale> 
		text = <RightText> 
	} 
	GetStackedScreenElementPos y id = <bar_id> offset = PAIR(0.00000000000, -23.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <mem_info_id> 
		texture = white2 
		scale = PAIR(65.80000305176, 3.29999995232) 
		pos = <pos> 
		just = [ left top ] 
		rgba = <highlight_rgba> 
		alpha = 0.25000000000 
	} 
ENDSCRIPT

SCRIPT files_menu_focus 
	GetTags 
	IF GotParam disable_item_overwrite 
		create_helper_text helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bm = Back" } 
			{ text = "\\bn = Delete" } 
		] 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	<files_menu_file_info_text> = #"" 
	IF NOT GotParam Index 
		GetSummaryInfo <file_type> VaultData = savevaultdata 
	ENDIF 
	IF NOT ( ( GotParam BadVersion ) | ( GotParam Corrupt ) ) 
		SWITCH <file_type> 
			CASE OptionsAndPros 
				IF GotParam total_score 
					FormatText { 
						textname = files_menu_file_info_text 
						#"\\c3Story: %a of %b points / Classic: %c of %d goals" 
						a = <total_score> 
						b = <total_score_potential> 
						c = <total_goals_complete> 
						d = <total_goals_possible> 
					} 
				ELSE 
					files_menu_file_info_text = "\\c3Old version: points not available!" 
				ENDIF 
			CASE NetworkSettings 
				FormatText { 
					textname = files_menu_file_info_text 
					#"\\c3ONLINE PREFS: %i" 
					i = <network_id> 
				} 
			CASE Cas 
				<files_menu_file_info_text> = #"\\c3Create-a-Skater" 
			CASE Park 
				IF NOT GotParam MaxPlayers 
					MaxPlayers = 1 
				ENDIF 
				colour = #"\\c3" 
				IF inNetGame 
					GetNetworkNumPlayers 
					IF ( <num_players> > <MaxPlayers> ) 
						colour = #"\\c2" 
					ENDIF 
				ENDIF 
				IF ( <MaxPlayers> = 1 ) 
					FormatText { 
						textname = files_menu_file_info_text 
						#"%cPark for one player" 
						c = <colour> 
						d = <MaxPlayers> 
					} 
				ELSE 
					FormatText { 
						textname = files_menu_file_info_text 
						#"%cPark for up to %d players" 
						c = <colour> 
						d = <MaxPlayers> 
					} 
				ENDIF 
			CASE replay 
				FormatText { 
					textname = files_menu_file_info_text 
					#"\\c3Replay: %l" 
					l = <LevelName> 
				} 
			CASE CreatedGoals 
				FormatText { 
					textname = files_menu_file_info_text 
					#"\\c3%i created goals" 
					i = <num_edited_goals> 
				} 
			CASE CAT 
				IF NOT GotParam name 
					name = " " 
				ENDIF 
				FormatText { 
					textname = files_menu_file_info_text 
					#"\\c3NAME: %i" 
					i = <name> 
				} 
			CASE CreatedGraphic 
				<files_menu_file_info_text> = #"\\c3Create-a-Graphic" 
		ENDSWITCH 
	ENDIF 
	SetScreenElementProps { 
		id = files_menu_file_info 
		text = <files_menu_file_info_text> 
	} 
	GetTags 
	RunScriptOnScreenElement id = { <id> child = 0 } text_twitch_effect2 
	RunScriptOnScreenElement id = { <id> child = 1 } text_twitch_effect2 
	RunScriptOnScreenElement id = { <id> child = 4 } text_twitch_effect2 
	RunScriptOnScreenElement id = { <id> child = 5 } text_twitch_effect2 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = <highlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 1 } 
		rgba = <highlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 2 } 
		rgba = <highlight_rgba> 
		z_priority = 7 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 2 } 
		scale = 1 
	} 
	SetScreenElementProps { 
		id = { <id> child = 3 } 
		rgba = <bar_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 4 } 
		rgba = <highlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 5 } 
		rgba = <highlight_rgba> 
	} 
	GetScreenElementDims id = files_vmenu 
	IF ( <height> > 216 ) 
		SetScreenElementProps { 
			id = files_menu_up_arrow 
			rgba = [ 128 128 128 0 ] 
		} 
		SetScreenElementProps { 
			id = files_menu_down_arrow 
			rgba = [ 128 128 128 0 ] 
		} 
	ELSE 
		generic_menu_update_arrows { 
			menu_id = files_vmenu 
			up_arrow_id = files_menu_up_arrow 
			down_arrow_id = files_menu_down_arrow 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT files_menu_unfocus 
	Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba 
	GetTags 
	IF GotParam disable_item_overwrite 
		unhighlight_rgba = [ 128 128 128 50 ] 
		create_helper_text helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
			{ text = "\\bo = Delete" } 
		] 
	ENDIF 
	KillSpawnedScript name = text_twitch_effect2 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		scale = 0.73000001907 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		scale = 0.73000001907 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 2 } 
		scale = 0.73000001907 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 4 } 
		scale = 0.73000001907 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 5 } 
		scale = 0.73000001907 
	} 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = <unhighlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 1 } 
		rgba = <unhighlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 2 } 
		rgba = [ 50 50 50 128 ] 
		z_priority = 6 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 2 } 
		scale = 0.72000002861 
	} 
	SetScreenElementProps { 
		id = { <id> child = 3 } 
		rgba = [ 128 128 128 0 ] 
	} 
	SetScreenElementProps { 
		id = { <id> child = 4 } 
		rgba = <unhighlight_rgba> 
	} 
	SetScreenElementProps { 
		id = { <id> child = 5 } 
		rgba = <unhighlight_rgba> 
	} 
ENDSCRIPT

SCRIPT files_menu_delete 
	GetTags 
	IF GotParam Index 
		IF GotParam Save 
			memcard_menus_cleanup 
			GetFileTypeName file_type = <file_type> 
			IF IsXBox 
				FormatText { 
					textname = DeleteText 
					#"Delete the %t\\n\'%s\' ?" 
					t = <filetype_name> 
					s = <filename> 
				} 
			ELSE 
				FormatText { 
					textname = DeleteText 
					#"Delete the %t file\\n\'%s\' ?" 
					t = <filetype_name> 
					s = <filename> 
				} 
			ENDIF 
			create_snazzy_dialog_box { 
				title = #"Delete" 
				text = <DeleteText> 
				pad_back_script = launch_files_menu 
				pad_back_params = { FileType = <MenuFileType> Save } 
				buttons = [ 
					{ font = small text = #"No" pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } } 
					{ font = small text = #"Yes" pad_choose_script = delete_file pad_choose_params = <...> } 
				] 
			} 
			CheckForCardRemoval menu_id = dialog_box_anchor 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT delete_file 
	memcard_menus_cleanup 
	Change StopCheckingForCardRemoval = 1 
	ResetTimer 
	mcmess_DeletingFile FileType = <file_type> 
	DisableReset 
	IF DeleteMemCardFile CardFileName = <actual_file_name> XBoxDirectoryName = <xbox_directory_name> 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		EnableReset 
		create_snazzy_dialog_box { 
			title = #"Deleted" 
			text = #"Delete successful" 
			pad_back_script = launch_files_menu 
			pad_back_params = { FileType = <MenuFileType> Save } 
			buttons = [ 
				{ font = small text = #"OK" pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } } 
			] 
		} 
		CheckForCardRemoval menu_id = dialog_box_anchor 
	ELSE 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		goto mcmess_ErrorDeleteFailed 
	ENDIF 
ENDSCRIPT

SCRIPT delete_bad_file 
	memcard_menus_cleanup 
	ResetTimer 
	mcmess_DeletingFile FileType = <file_type> 
	DisableReset 
	IF DeleteMemCardFile { 
			CardFileName = <actual_file_name> 
			XBoxDirectoryName = <xbox_directory_name> 
			UserFileName = <filename> 
			type = <file_type> 
		} 
		EnableReset 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		IF GotParam GoBackToFilesMenu 
			create_snazzy_dialog_box { 
				title = #"Deleted" 
				text = #"Delete successful" 
				pad_back_script = launch_files_menu 
				pad_back_params = { FileType = <MenuFileType> } 
				buttons = [ 
					{ font = small text = #"OK" pad_choose_script = launch_files_menu pad_choose_params = { FileType = <file_type> } } 
				] 
			} 
		ELSE 
			create_snazzy_dialog_box { 
				title = #"Deleted" 
				text = #"Delete successful" 
				pad_back_script = AbortScript 
				buttons = [ 
					{ font = small text = #"OK" pad_choose_script = AbortScript } 
				] 
			} 
		ENDIF 
		CheckForCardRemoval menu_id = dialog_box_anchor 
	ELSE 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		goto mcmess_ErrorDeleteFailed 
	ENDIF 
ENDSCRIPT

SCRIPT NGC_delete_bad_file 
	memcard_menus_cleanup 
	ResetTimer 
	mcmess_DeletingFile 
	DisableReset 
	IF DeleteMemCardFile { 
			CardFileName = <actual_file_name> 
			UserFileName = <filename> 
			type = <file_type> 
		} 
		EnableReset 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		create_snazzy_dialog_box { 
			title = #"File" 
			text = #"Delete successful" 
			pad_back_script = launch_files_menu 
			pad_back_params = { FileType = <MenuFileType> Save } 
			buttons = [ 
				{ font = small text = #"OK" pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } } 
			] 
		} 
		CheckForCardRemoval menu_id = dialog_box_anchor 
	ELSE 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		goto mcmess_ErrorDeleteFailed 
	ENDIF 
ENDSCRIPT

SCRIPT OKToOverwrite 
	IF GotParam NoGetTags 
	ELSE 
		GetTags 
	ENDIF 
	IF ( ( GotParam BadVersion ) | ( GotParam Corrupt ) ) 
		IF IsNGC 
			goto mcmess_NGCDeleteCorruptFile params = <...> 
		ENDIF 
		RETURN 
	ENDIF 
	DisableReset 
	GetMemCardSpaceRequired <MenuFileType> 
	GetMemCardSpaceAvailable 
	EnableReset 
	IF ( <SpaceRequired> > <SpaceAvailable> + <total_file_size> ) 
		goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = { 
			Overwrite 
			FileType = <MenuFileType> 
			SpaceRequired = <SpaceRequired> 
			SpaceAvailable = ( <SpaceAvailable> + <total_file_size> ) 
		} 
	ENDIF 
	memcard_menus_cleanup 
	GetFileTypeName file_type = <file_type> 
	IF IsXBox 
		FormatText { 
			textname = OverwriteText 
			#"OK to overwrite the existing %t\\n\'%s\' ?" 
			t = <filetype_name> 
			s = <filename> 
		} 
	ELSE 
		FormatText { 
			textname = OverwriteText 
			#"OK to overwrite the existing %t file\\n\'%s\' ?" 
			t = <filetype_name> 
			s = <filename> 
		} 
	ENDIF 
	create_snazzy_dialog_box { 
		title = #"Overwrite" 
		text = <OverwriteText> 
		pad_back_script = launch_files_menu 
		pad_back_params = { FileType = <MenuFileType> Save } 
		buttons = [ 
			{ font = small text = #"No" pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } } 
			{ 
				font = small text = #"Yes" 
				pad_choose_script = DeleteOldSaveNew 
				pad_choose_params = 
				{ 
					filename = <filename> 
					old_file_type = <file_type> 
					new_file_type = <MenuFileType> 
					actual_file_name = <actual_file_name> 
				} 
			} 
		] 
	} 
	CheckForCardRemoval menu_id = dialog_box_anchor 
ENDSCRIPT

SCRIPT DeleteOldSaveNew 
	Save { 
		filename = <filename> 
		file_type = <new_file_type> 
		total_file_size = <total_file_size> 
		Overwrite = { CardFileName = <actual_file_name> UserFileName = <filename> type = <old_file_type> } 
	} 
ENDSCRIPT

SCRIPT retry_launch_save_network_settings 
	memcard_menus_cleanup 
	goto launch_save_network_settings 
ENDSCRIPT

SCRIPT launch_save_network_settings 
	destroy_net_settings_menu 
	Skater : hide 
	Change RetryScript = retry_launch_save_network_settings 
	Change AbortScript = back_to_net_settings_menu 
	Change DoneScript = back_to_net_settings_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = NetworkSettings Save 
	launch_files_menu Save FileType = NetworkSettings 
ENDSCRIPT

SCRIPT retry_launch_save_internet_settings 
	memcard_menus_cleanup 
	goto launch_save_internet_settings 
ENDSCRIPT

SCRIPT launch_save_internet_settings 
	destroy_internet_options_menu 
	Change RetryScript = retry_launch_save_internet_settings 
	Change AbortScript = back_to_internet_options_menu 
	Change DoneScript = back_to_internet_options_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = NetworkSettings Save 
	launch_files_menu Save FileType = NetworkSettings 
ENDSCRIPT

SCRIPT retry_launch_pause_menu_save_game_sequence 
	memcard_menus_cleanup 
	goto launch_pause_menu_save_game_sequence 
ENDSCRIPT

SCRIPT launch_pause_menu_save_game_sequence 
	destroy_pause_menu 
	IF IsTrue fake_nigel_active 
		GetCurrentSkaterProfileIndex 
		RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = fake_nigel_temp_profile NoFaceTexture 
	ENDIF 
	Change RetryScript = retry_launch_pause_menu_save_game_sequence 
	Change AbortScript = back_to_pause_menu 
	Change DoneScript = back_to_pause_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = OptionsAndPros Save 
	launch_files_menu Save FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT launch_ingame_menu_save_game_sequence 
	IF GameModeEquals is_classic 
		root_window : SetTags save_return_to_pause_menu 
	ENDIF 
	IF GameModeEquals is_career 
		PauseObjects 
		root_window : SetTags save_return_to_game 
	ENDIF 
	launch_pause_menu_save_game_sequence 
ENDSCRIPT

save_successful = 2 
SCRIPT retry_launch_pause_menu_save_park_sequence 
	memcard_menus_cleanup 
	goto launch_pause_menu_save_park_sequence 
ENDSCRIPT

SCRIPT launch_pause_menu_save_park_sequence 
	destroy_pause_menu 
	Change RetryScript = retry_launch_pause_menu_save_park_sequence 
	Change AbortScript = back_to_pause_menu 
	Change DoneScript = back_to_pause_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = Park Save 
	launch_files_menu Save FileType = Park 
ENDSCRIPT

SCRIPT retry_launch_park_editor_save_park_sequence 
	memcard_menus_cleanup 
	goto launch_park_editor_save_park_sequence 
ENDSCRIPT

SCRIPT launch_park_editor_save_park_sequence 
	destroy_pause_menu 
	Change RetryScript = retry_launch_park_editor_save_park_sequence 
	Change AbortScript = back_to_pause_menu 
	Change DoneScript = back_to_pause_menu 
	Change SavingOrLoading = Saving 
	Change save_successful = 0 
	check_card FileType = Park Save 
	launch_files_menu Save FileType = Park 
ENDSCRIPT

SCRIPT retry_launch_pause_menu_load_park_sequence 
	memcard_menus_cleanup 
	goto launch_pause_menu_load_park_sequence 
ENDSCRIPT

SCRIPT launch_pause_menu_load_park_sequence 
	destroy_pause_menu 
	Change RetryScript = retry_launch_pause_menu_load_park_sequence 
	Change AbortScript = back_to_pause_menu 
	Change DoneScript = back_to_pause_menu 
	Change SavingOrLoading = Loading 
	check_card FileType = Park load 
	launch_files_menu load FileType = Park 
ENDSCRIPT

SCRIPT retry_launch_level_select_load_park_sequence 
	memcard_menus_cleanup 
	goto launch_level_select_load_park_sequence 
ENDSCRIPT

SCRIPT launch_level_select_load_park_sequence 
	destroy_level_select 
	Change RetryScript = retry_launch_level_select_load_park_sequence 
	Change AbortScript = back_to_created_park_menu 
	Change DoneScript = load_loaded_created_park 
	Change SavingOrLoading = Loading 
	check_card FileType = Park load 
	launch_files_menu load FileType = Park 
ENDSCRIPT

load_successful = 2 
loadforupload = 0 
SCRIPT retry_launch_upload_file_sequence_cat 
	memcard_menus_cleanup 
	goto launch_upload_file_sequence params = { type = CAT } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cas 
	memcard_menus_cleanup 
	goto launch_upload_file_sequence params = { type = OptionsAndPros } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cag 
	memcard_menus_cleanup 
	goto launch_upload_file_sequence params = { type = CreatedGoals } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cap 
	memcard_menus_cleanup 
	goto launch_upload_file_sequence params = { type = Park } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cagr 
	memcard_menus_cleanup 
	goto launch_upload_file_sequence params = { type = CreatedGraphic } 
ENDSCRIPT

SCRIPT launch_upload_file_sequence 
	Change load_successful = 0 
	SWITCH <type> 
		CASE CAT 
			Change loadforupload = 1 
			Change RetryScript = retry_launch_upload_file_sequence_cat 
		CASE OptionsAndPros 
			Change loadforupload = 1 
			Change RetryScript = retry_launch_upload_file_sequence_cas 
		CASE CreatedGoals 
			Change loadforupload = 1 
			Change RetryScript = retry_launch_upload_file_sequence_cag 
		CASE Park 
			Change loadforupload = 1 
			Change RetryScript = retry_launch_upload_file_sequence_cap 
		CASE CreatedGraphic 
			Change loadforupload = 1 
			Change RetryScript = retry_launch_upload_file_sequence_cagr 
	ENDSWITCH 
	Change AbortScript = back_to_internet_options_menu 
	Change DoneScript = back_to_internet_options_menu 
	Change SavingOrLoading = Loading 
	check_card FileType = <type> load 
	launch_files_menu load FileType = <type> 
ENDSCRIPT

savevaultdata = 0 
SCRIPT retry_launch_download_save_sequence_cat 
	memcard_menus_cleanup 
	goto launch_download_save_sequence params = { file_type = CAT } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cas 
	memcard_menus_cleanup 
	goto launch_download_save_sequence params = { file_type = OptionsAndPros } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cag 
	memcard_menus_cleanup 
	goto launch_download_save_sequence params = { file_type = CreatedGoals } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cap 
	memcard_menus_cleanup 
	goto launch_download_save_sequence params = { file_type = Park } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cagr 
	memcard_menus_cleanup 
	goto launch_download_save_sequence params = { file_type = CreatedGraphic } 
ENDSCRIPT

SCRIPT launch_download_save_sequence 
	IF NOT GotParam file_type 
		
		RETURN 
	ENDIF 
	SWITCH <file_type> 
		CASE CAT 
			Change RetryScript = retry_launch_download_save_sequence_cat 
			Change savevaultdata = 1 
		CASE OptionsAndPros 
			Change RetryScript = retry_launch_download_save_sequence_cas 
			Change savevaultdata = 1 
		CASE CreatedGoals 
			Change RetryScript = retry_launch_download_save_sequence_cag 
			Change savevaultdata = 1 
		CASE Park 
			Change RetryScript = retry_launch_download_save_sequence_cap 
			Change savevaultdata = 1 
		CASE CreatedGraphic 
			Change RetryScript = retry_launch_download_save_sequence_cagr 
			Change savevaultdata = 1 
		DEFAULT 
			
	ENDSWITCH 
	Change AbortScript = back_from_transfer_succeeded_dialog 
	Change DoneScript = back_from_transfer_succeeded_dialog 
	Change SavingOrLoading = Saving 
	check_card FileType = <file_type> Save 
	launch_files_menu Save FileType = <file_type> 
ENDSCRIPT

SCRIPT retry_launch_save_cas_sequence 
	memcard_menus_cleanup 
	goto launch_save_cas_sequence 
ENDSCRIPT

SCRIPT launch_save_cas_sequence 
	destroy_main_menu 
	IF ScreenElementExists id = black_top_strip 
		DoScreenElementMorph { 
			id = black_top_strip 
			time = 0 
			alpha = 0 
		} 
	ENDIF 
	Change RetryScript = retry_launch_save_cas_sequence 
	Change AbortScript = back_to_pre_cas_menu 
	Change DoneScript = back_to_pre_cas_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = OptionsAndPros Save 
	launch_files_menu Save FileType = OptionsAndPros from_cas 
ENDSCRIPT

SCRIPT retry_launch_save_cat_sequence 
	memcard_menus_cleanup 
	goto launch_save_cat_sequence 
ENDSCRIPT

SCRIPT launch_save_cat_sequence 
	IF ScreenElementExists id = <curren_menu_anchor> 
		DestroyScreenElement id = <curren_menu_anchor> 
	ENDIF 
	Change RetryScript = retry_launch_save_cat_sequence 
	Change AbortScript = back_to_cat_pause 
	Change DoneScript = back_to_cat_pause 
	Change SavingOrLoading = Saving 
	check_card FileType = CAT Save 
	launch_files_menu Save FileType = CAT 
ENDSCRIPT

SCRIPT retry_launch_options_menu_save_game_sequence 
	memcard_menus_cleanup 
	goto launch_options_menu_save_game_sequence 
ENDSCRIPT

SCRIPT launch_options_menu_save_game_sequence 
	destroy_main_menu 
	Change RetryScript = retry_launch_options_menu_save_game_sequence 
	Change AbortScript = back_to_options_menu 
	Change DoneScript = back_to_options_menu 
	Change SavingOrLoading = Saving 
	check_card Save FileType = OptionsAndPros 
	launch_files_menu Save FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT retry_launch_beat_goal_save_game_sequence 
	memcard_menus_cleanup 
	goto launch_beat_goal_save_game_sequence 
ENDSCRIPT

SCRIPT launch_beat_goal_save_game_sequence 
	Change RetryScript = retry_launch_beat_goal_save_game_sequence 
	Change AbortScript = back_to_beat_goal 
	Change DoneScript = back_to_beat_goal 
	Change SavingOrLoading = Saving 
	check_card FileType = OptionsAndPros Save 
	launch_files_menu Save FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT retry_launch_save_cagr_sequence 
	memcard_menus_cleanup 
	goto launch_save_cagr_sequence 
ENDSCRIPT

SCRIPT launch_save_cagr_sequence 
	destroy_main_menu 
	Change RetryScript = retry_launch_save_cagr_sequence 
	Change AbortScript = back_to_pre_cagr_menu 
	Change DoneScript = back_to_pre_cagr_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = CreatedGraphic Save 
	launch_files_menu Save FileType = CreatedGraphic 
ENDSCRIPT

SCRIPT AppendDigitsToFilenameUntilNoClash max_chars = 15 
	IF NOT IsXBox 
		PauseMusic 1 
		PauseStream 1 
	ENDIF 
	<newfilename> = <filename> 
	<i> = 2 
	BEGIN 
		DisableReset 
		IF NOT MemCardFileExists name = <newfilename> type = <file_type> 
			IF NOT IsXBox 
				PauseMusic -1 
				PauseStream -1 
			ENDIF 
			RETURN filename = <newfilename> 
			BREAK 
		ENDIF 
		AppendSuffix NewTextName = newfilename text = <filename> Suffix = <i> MaxChars = <max_chars> 
		<i> = ( <i> + 1 ) 
	REPEAT 
	IF NOT IsXBox 
		PauseMusic -1 
		PauseStream -1 
	ENDIF 
ENDSCRIPT

save_name_allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" 
	"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" 
	"k" "l" "m" "n" "o" "p" "q" "r" "s" "t" 
	"u" "v" "w" "x" "y" "z" 
	"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" 
	"K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" 
"U" "V" "W" "X" "Y" "Z" " " ] 
SCRIPT CreateNew 
	GetTags 
	memcard_menus_cleanup 
	SWITCH <file_type> 
		CASE OptionsAndPros 
			GetCustomSkaterName 
			<filename> = <display_name> 
		CASE NetworkSettings 
			IF NOT IsXBox 
				<filename> = #"Sys Lnk Set" 
			ELSE 
				<filename> = #"Online Prefs" 
			ENDIF 
		CASE CAT 
			get_CAT_other_param_values trick_index = 0 
			<filename> = <name> 
			allowed_characters = save_name_allowed_characters 
		CASE Park 
			GetCustomParkName 
			<filename> = <name> 
		CASE replay 
			<filename> = #"Replay" 
		CASE CreatedGoals 
			<filename> = #"Created Goals" 
		CASE CreatedGraphic 
			<filename> = #"Graphic" 
		DEFAULT 
			<filename> = #"Dooby Doo" 
	ENDSWITCH 
	IF ( savevaultdata = 1 ) 
		GetScriptString 
		filename = <string> 
	ENDIF 
	AppendDigitsToFilenameUntilNoClash file_type = <file_type> filename = <filename> max_chars = MAX_MEMCARD_FILENAME_LENGTH 
	create_onscreen_keyboard { 
		allow_cancel 
		keyboard_cancel_script = launch_files_menu 
		keyboard_cancel_params = { FileType = <file_type> Save } 
		keyboard_done_script = CreateNew_Done 
		keyboard_title = #"SAVE NAME" 
		text = <filename> 
		min_length = 1 
		max_length = MAX_MEMCARD_FILENAME_LENGTH 
		FileType = <file_type> 
		allowed_characters = save_name_allowed_characters 
		disable_special_character_tabs 
	} 
	CheckForCardRemoval menu_id = keyboard_anchor 
ENDSCRIPT

SCRIPT CreateNew_Done 
	GetTextElementString id = keyboard_current_string 
	memcard_menus_cleanup 
	IF ( savevaultdata = 0 ) 
		SWITCH <FileType> 
			CASE OptionsAndPros 
				SetCustomSkaterFilename <string> 
			CASE Park 
				SetCustomParkName name = <string> 
				SetParkName <string> 
			CASE CAT 
				get_CAT_other_param_values trick_index = 0 
				IF ( <name> = "" ) 
					set_new_CAT_param_values trick_index = 0 name = <string> can_spin = <can_spin> 
				ENDIF 
		ENDSWITCH 
	ENDIF 
	check_card FileType = <FileType> Save 
	DisableReset 
	IF MemCardFileExists name = <string> type = <FileType> 
		OKToOverwrite NoGetTags filename = <string> file_type = <FileType> MenuFileType = <FileType> total_file_size = <total_file_size> 
	ELSE 
		Save filename = <string> file_type = <FileType> 
	ENDIF 
ENDSCRIPT

SCRIPT Save 
	memcard_menus_cleanup 
	WaitForAsyncLoadToFinish 
	IF ( savevaultdata = 0 ) 
		SWITCH <file_type> 
			CASE Park 
				SetCustomParkName name = <filename> 
				SetParkName <filename> 
			CASE OptionsAndPros 
				SetCustomSkaterFilename <filename> 
		ENDSWITCH 
	ENDIF 
	DisableReset 
	ResetTimer 
	IF GotParam Overwrite 
		Change StopCheckingForCardRemoval = 1 
		mcmess_OverwritingData FileType = <file_type> 
		Change StopCheckingForCardRemoval = 0 
		IF NOT DeleteMemCardFile CardFileName = ( <Overwrite> . CardFileName ) UserFileName = ( <Overwrite> . UserFileName ) type = ( <Overwrite> . type ) 
			RemoveMemCardPoolsAndLoadAnims 
			goto mcmess_ErrorOverwriteFailed 
		ENDIF 
		IF MemCardFileExists name = <filename> type = <file_type> 
			goto OKToOverwrite params = { NoGetTags filename = <filename> file_type = <file_type> MenuFileType = <file_type> total_file_size = <total_file_size> } 
		ENDIF 
	ELSE 
		mcmess_SavingData FileType = <file_type> 
	ENDIF 
	DisableReset 
	IF SaveToMemoryCard name = <filename> type = <file_type> savevaultdata = savevaultdata 
		RemoveMemCardPoolsAndLoadAnims 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		IF ( save_successful = 0 ) 
			Change save_successful = 1 
			goto AbortScript params = { type = <file_type> } 
		ELSE 
			IF GotParam Overwrite 
				goto mcmess_OverwriteSuccessful params = { type = <file_type> } 
			ELSE 
				goto mcmess_SaveSuccessful params = { type = <file_type> } 
			ENDIF 
		ENDIF 
	ELSE 
		RemoveMemCardPoolsAndLoadAnims 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		IF GotParam Overwrite 
			goto mcmess_ErrorOverwriteFailed 
		ELSE 
			goto mcmess_ErrorSaveFailed 
		ENDIF 
	ENDIF 
ENDSCRIPT

DoAutoload = 1 
no_load = 0 
most_recent_save_exists = 0 
attempted_xbox_autoload = 0 
goto_secret_shop = 0 
SCRIPT maybe_auto_load_from_memory_card 
	IF ( DoAutoload = 0 ) 
		SpawnScript wait_and_pause_skater params = { time = 1 dont_pause_music = 1 } 
		IF ConnectedToPeer 
			SetNetworkMode INTERNET_MODE 
			change_gamemode_net 
			SetQuietMode Off 
			rejoin_lobby 
			kill_start_key_binding 
		ELSE 
			launch_main_menu 
		ENDIF 
	ELSE 
		Change DoAutoload = 0 
		IF IsInternetGameHost 
			CheckForCardOnBootup 
		ELSE 
			IF IsJoiningInternetGame 
				CheckForCardOnBootup 
			ELSE 
				IF NOT IsXBox 
					IF NOT GotParam force_autoload 
						wait 3 gameframes 
						IF NOT PadsPluggedIn 
							goto back_to_main_menu2 
						ENDIF 
						SpawnScript wait_and_pause_skater 
						goto back_to_main_menu2 
					ELSE 
						SpawnScript wait_and_pause_skater params = { time = 1 } 
						CheckForCardOnBootup 
					ENDIF 
				ELSE 
					SpawnScript wait_and_pause_skater 
					CheckForCardOnBootup 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CheckForCardOnBootup 
	ResetAbortAndDoneScripts 
	DisableReset 
	IF CardIsInSlot 
		IF BadDevice 
			Change RetryScript = CheckForCardOnBootup 
			Change AbortScript = back_to_main_menu2 
			goto mcmess_BadDevice 
		ELSE 
			IF SectorSizeOK 
				goto auto_load 
			ELSE 
				Change RetryScript = CheckForCardOnBootup 
				Change AbortScript = back_to_main_menu2 
				IF CardIsDamaged 
					goto mcmess_DamagedCard 
				ELSE 
					goto mcmess_BadSectorSize 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		Change RetryScript = CheckForCardOnBootup 
		Change AbortScript = back_to_main_menu2 
		goto mcmess_ErrorNoCardOnBootup 
	ENDIF 
ENDSCRIPT

SCRIPT auto_load 
	IF ( no_load = 0 ) 
		memcard_menus_cleanup 
	ENDIF 
	IF IsInternetGameHost 
		Change AbortScript = start_internet_game 
		Change DoneScript = start_internet_game 
	ELSE 
		IF IsJoiningInternetGame 
			Change AbortScript = start_internet_game 
			Change DoneScript = start_internet_game 
		ELSE 
			Change AbortScript = back_to_main_menu2 
			Change DoneScript = back_to_main_menu2 
		ENDIF 
	ENDIF 
	Change RetryScript = auto_load 
	Change SavingOrLoading = Loading 
	StopMusic 
	DisableReset 
	IF NOT CardIsInSlot 
		goto mcmess_ErrorNoCardOnBootup 
	ENDIF 
	ResetTimer 
	mcmess_CheckingCard 
	DisableReset 
	IF BadDevice 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		goto mcmess_BadDevice 
	ENDIF 
	IF CardIsDamaged 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		goto mcmess_DamagedCard 
	ENDIF 
	IF NOT SectorSizeOK 
		IF CardIsDamaged 
			mem_card_message_pause NoTimerReset NoCardRemovalCheck 
			goto mcmess_DamagedCard 
		ELSE 
			mem_card_message_pause NoTimerReset NoCardRemovalCheck 
			goto mcmess_BadSectorSize 
		ENDIF 
	ENDIF 
	DisableReset 
	IF NOT CardIsFormatted 
		IF CardIsDamaged 
			goto mcmess_DamagedCard 
		ELSE 
			IF IsPS2 
				RemoveMemCardPoolsAndLoadAnims 
				KillSpawnedScript name = wait_and_pause_skater 
				goto back_to_main_menu2 
			ELSE 
				mem_card_message_pause NoTimerReset NoCardRemovalCheck 
				goto mcmess_ErrorNotFormatted params = { QuitText = #"Continue without formatting" BackScript = NullScript } 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( no_load = 0 ) 
		DisableReset 
		GetMemCardDirectoryListing 
		GetMostRecentSave <DirectoryListing> NetworkSettings 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		IF NOT CardIsInSlot 
			goto mcmess_ErrorNoCardOnBootup 
		ENDIF 
	ENDIF 
	<did_load> = 0 
	IF GotParam MostRecentSave 
		Change most_recent_save_exists = 1 
		ResetTimer 
		mcmess_LoadingData FileType = NetworkSettings 
		DisableReset 
		IF LoadFromMemoryCard name = ( <MostRecentSave> . filename ) type = NetworkSettings 
			GetPreferenceChecksum pref_type = network config_type 
			SWITCH <checksum> 
				CASE config_sony 
					IF LoadNetConfigs 
						GetPreferenceString pref_type = network config_type 
						ChooseNetConfig name = <ui_string> 
					ELSE 
						clear_config_type 
						clear_device_type 
					ENDIF 
			ENDSWITCH 
		ELSE 
			mem_card_message_pause NoTimerReset NoCardRemovalCheck 
			goto mcmess_ErrorLoadFailed params = { 
				<...> 
				filename = ( <MostRecentSave> . filename ) 
				actual_file_name = ( <MostRecentSave> . actual_file_name ) 
				file_type = NetworkSettings 
			} 
		ENDIF 
		<did_load> = 1 
	ENDIF 
	DisableReset 
	GetMostRecentSave <DirectoryListing> OptionsAndPros 
	IF GotParam MostRecentSave 
		IF ( <did_load> = 0 ) 
			ResetTimer 
			mcmess_LoadingData FileType = OptionsAndPros 
		ENDIF 
		SetSectionsToApplyWhenLoading All 
		DisableReset 
		IF NOT LoadFromMemoryCard name = ( <MostRecentSave> . filename ) type = OptionsAndPros 
			mem_card_message_pause NoTimerReset NoCardRemovalCheck 
			goto mcmess_ErrorLoadFailed params = { 
				<...> 
				filename = ( <MostRecentSave> . filename ) 
				actual_file_name = ( <MostRecentSave> . actual_file_name ) 
				file_type = OptionsAndPros 
			} 
		ENDIF 
		<did_load> = 1 
	ENDIF 
	IF ( <did_load> = 1 ) 
	ENDIF 
	DisableReset 
	GetMemCardSpaceAvailable 
	GetSaveSizes 
	IF IsPS2 
		IF isPal 
			<TotalSpaceRequired> = <SaveSize_OptionsAndPros> 
		ELSE 
			<TotalSpaceRequired> = ( <SaveSize_OptionsAndPros> + 
			<SaveSize_Park> + 
			<SaveSize_CreateATrick> + 
			<SaveSize_Goals> + 
			<SaveSize_NetworkSettings> ) 
		ENDIF 
	ELSE 
		<TotalSpaceRequired> = ( <SaveSize_OptionsAndPros> + 
		<SaveSize_Park> + 
		<SaveSize_CreateATrick> + 
		<SaveSize_Goals> + 
		<SaveSize_CreatedGraphic> ) 
	ENDIF 
	IF ( <FilesLeft> < 4 ) 
		mem_card_message_pause XSkips NoTimerReset 
		goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
	ENDIF 
	IF ( <SpaceAvailable> < <TotalSpaceRequired> ) 
		mem_card_message_pause XSkips NoTimerReset 
		goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
	ENDIF 
	Change show_career_startup_menu = 0 
	IF IsInternetGameHost 
		start_internet_game 
	ELSE 
		IF IsJoiningInternetGame 
			start_internet_game 
		ELSE 
			goto back_to_main_menu2 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT retry_launch_pause_menu_save_created_goals 
	memcard_menus_cleanup 
	goto launch_pause_menu_save_created_goals 
ENDSCRIPT

SCRIPT launch_pause_menu_save_created_goals 
	memcard_menus_cleanup 
	root_window : SetTags save_return_to_pause_menu 
	Change RetryScript = retry_launch_pause_menu_save_created_goals 
	Change AbortScript = back_to_pause_menu 
	Change DoneScript = back_to_pause_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = CreatedGoals Save 
	launch_files_menu Save FileType = CreatedGoals 
ENDSCRIPT

DoInitialiseCreatedGoalsAfterLoading = 0 
SCRIPT retry_launch_pause_menu_load_created_goals 
	memcard_menus_cleanup 
	goto launch_pause_menu_load_created_goals 
ENDSCRIPT

SCRIPT launch_pause_menu_load_created_goals 
	destroy_pause_menu 
	root_window : SetTags save_return_to_pause_menu 
	Change RetryScript = retry_launch_pause_menu_load_created_goals 
	Change AbortScript = back_to_pause_menu 
	Change DoneScript = back_to_pause_menu 
	Change SavingOrLoading = Loading 
	Change DoInitialiseCreatedGoalsAfterLoading = 1 
	check_card FileType = CreatedGoals 
	launch_files_menu FileType = CreatedGoals 
ENDSCRIPT

SCRIPT launch_load_created_goals_from_select_goals_menu 
	Change check_for_unplugged_controllers = 0 
	memcard_menus_cleanup 
	Change RetryScript = launch_load_created_goals_from_select_goals_menu 
	Change AbortScript = create_select_goals_menu 
	Change DoneScript = create_select_goals_menu 
	Change SavingOrLoading = Loading 
	Change DoInitialiseCreatedGoalsAfterLoading = 0 
	check_card FileType = CreatedGoals 
	launch_files_menu FileType = CreatedGoals 
	Change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT launch_load_created_goals_from_host_goals_menu 
	memcard_menus_cleanup 
	Change RetryScript = launch_load_created_goals_from_host_goals_menu 
	Change AbortScript = launch_network_host_options_menu 
	Change DoneScript = host_options_goals_sub_menu_return 
	Change SavingOrLoading = Loading 
	Change DoInitialiseCreatedGoalsAfterLoading = 0 
	check_card FileType = CreatedGoals 
	launch_files_menu FileType = CreatedGoals 
ENDSCRIPT

SCRIPT launch_load_created_goals_from_game_options_menu 
	memcard_menus_cleanup 
	Change RetryScript = launch_load_created_goals_from_game_options_menu 
	Change AbortScript = create_network_game_options_menu 
	Change DoneScript = game_options_goals_sub_menu_return 
	Change SavingOrLoading = Loading 
	Change DoInitialiseCreatedGoalsAfterLoading = 0 
	check_card FileType = CreatedGoals 
	launch_files_menu FileType = CreatedGoals 
ENDSCRIPT

SCRIPT retry_launch_load_network_settings 
	memcard_menus_cleanup 
	goto launch_load_network_settings 
ENDSCRIPT

SCRIPT loaded_network_preferences 
	GetPreferenceChecksum pref_type = network config_type 
	SWITCH <checksum> 
		CASE config_sony 
			GetPreferenceString pref_type = network config_type 
			IF NOT ChooseNetConfig name = <ui_string> 
				clear_config_type 
				clear_device_type 
			ENDIF 
		DEFAULT 
			clear_config_type 
			clear_device_type 
	ENDSWITCH 
	back_to_net_settings_menu 
ENDSCRIPT

SCRIPT launch_load_network_settings 
	destroy_net_settings_menu 
	Change RetryScript = retry_launch_load_network_settings 
	Change AbortScript = back_to_net_settings_menu 
	Change DoneScript = loaded_network_preferences 
	Change SavingOrLoading = Loading 
	check_card FileType = NetworkSettings 
	launch_files_menu FileType = NetworkSettings 
ENDSCRIPT

SCRIPT retry_launch_options_menu_load_game_sequence 
	memcard_menus_cleanup 
	goto launch_options_menu_load_game_sequence 
ENDSCRIPT

SCRIPT retry_launch_career_menu_load_game_sequence 
	memcard_menus_cleanup 
	goto launch_career_menu_load_game_sequence 
ENDSCRIPT

SCRIPT launch_career_menu_load_game_sequence 
	dialog_box_exit 
	destroy_main_menu 
	Skater : hide 
	Change RetryScript = retry_launch_career_menu_load_game_sequence 
	Change AbortScript = back_to_career_options_menu 
	Change DoneScript = back_to_career_options_menu 
	save_previous_progressive_mode 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading All 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT launch_options_menu_load_game_sequence 
	destroy_main_menu 
	Change RetryScript = retry_launch_options_menu_load_game_sequence 
	Change AbortScript = back_to_options_menu 
	Change DoneScript = back_to_options_menu 
	save_previous_progressive_mode 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading All 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT retry_launch_load_cas_sequence 
	memcard_menus_cleanup 
	goto launch_load_cas_sequence 
ENDSCRIPT

SCRIPT launch_load_cas_sequence 
	destroy_main_menu 
	save_previous_progressive_mode 
	Change AbortScript = back_to_pre_cas_menu 
	Change DoneScript = jump_to_edit_skater 
	Change RetryScript = retry_launch_load_cas_sequence 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading All 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros from_cas 
ENDSCRIPT

SCRIPT retry_launch_load_cas_from_select_sequence 
	memcard_menus_cleanup 
	goto launch_load_cas_from_select_sequence 
ENDSCRIPT

SCRIPT launch_load_cas_from_select_sequence 
	Change check_for_unplugged_controllers = 0 
	destroy_main_menu 
	dialog_box_exit 
	KillSkaterCamAnim All 
	PlaySkaterCamAnim { name = mainmenu_camera03 
		Skater = 0 
		targetID = <objId> 
		targetOffset = <targetOffset> 
		positionOffset = <positionOffset> 
		play_hold 
		frames = 1 
	} 
	Change AbortScript = back_to_select_skater 
	Change DoneScript = back_to_select_skater 
	save_previous_progressive_mode 
	Change RetryScript = retry_launch_load_cas_from_select_sequence 
	Change SavingOrLoading = Loading 
	GetCurrentSkaterProfileIndex 
	IF ( <currentSkaterProfileIndex> = 0 ) 
		SetSectionsToApplyWhenLoading All 
	ELSE 
		SetSectionsToApplyWhenLoading ApplyCustomSkater 
	ENDIF 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
	Change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT retry_launch_load_cat_sequence 
	memcard_menus_cleanup 
	goto launch_load_cat_sequence 
ENDSCRIPT

SCRIPT launch_load_cat_sequence 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	Change AbortScript = back_to_pre_cat_menu 
	Change DoneScript = back_to_edit_cat_menu 
	Change RetryScript = retry_launch_load_cat_sequence 
	Change SavingOrLoading = Loading 
	check_card FileType = CAT 
	launch_files_menu FileType = CAT 
ENDSCRIPT

SCRIPT retry_launch_load_cat_sequence2 
	memcard_menus_cleanup 
	goto launch_load_cat_sequence2 
ENDSCRIPT

SCRIPT launch_load_cat_sequence2 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	Change loading_cat_from_edit_tricks = 1 
	Change AbortScript = back_to_edit_tricks_menu 
	Change DoneScript = finish_loading_cat 
	Change RetryScript = retry_launch_load_cat_sequence2 
	Change SavingOrLoading = Loading 
	check_card FileType = CAT 
	launch_files_menu FileType = CAT 
ENDSCRIPT

SCRIPT retry_launch_load_cagr_sequence 
	memcard_menus_cleanup 
	goto launch_load_cagr_sequence 
ENDSCRIPT

SCRIPT launch_load_cagr_sequence 
	destroy_main_menu 
	Change RetryScript = retry_launch_load_cagr_sequence 
	Change AbortScript = back_to_pre_cagr_menu 
	Change DoneScript = load_cagr_sequence_done 
	Change SavingOrLoading = Loading 
	check_card FileType = CreatedGraphic 
	launch_files_menu FileType = CreatedGraphic 
ENDSCRIPT

SCRIPT load_cagr_sequence_done 
	dialog_box_exit 
	edit_graphic_create_main_menu new = 0 
ENDSCRIPT

SCRIPT load 
	GetTags 
	IF inNetGame 
		IF ( <file_type> = Park ) 
			IF NOT GotParam MaxPlayers 
				MaxPlayers = 1 
			ENDIF 
			GetNetworkNumPlayers 
			IF inNetGame 
				IF ( <num_players> > <MaxPlayers> ) 
					memcard_menus_cleanup 
					goto mcmess_ErrorbadParkMaxPlayers params = <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( ( GotParam BadVersion ) | ( GotParam Corrupt ) ) 
		IF IsNGC 
			memcard_menus_cleanup 
			goto mcmess_ErrorLoadFailed params = { <...> CorruptedData GoBackToFilesMenu } 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	memcard_menus_cleanup 
	generic_menu_pad_choose_sound 
	ResetTimer 
	mcmess_LoadingData FileType = <file_type> 
	DisableReset 
	IF LoadFromMemoryCard name = <filename> type = <file_type> loadforupload = loadforupload 
		Change check_for_unplugged_controllers = 0 
		mcmess_LoadingData FileType = <file_type> no_animate = no_animate 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		IF ( load_successful = 0 ) 
			Change load_successful = 1 
			Change check_for_unplugged_controllers = 1 
			goto AbortScript params = { type = <file_type> filename = <filename> } 
		ELSE 
			Change check_for_unplugged_controllers = 1 
			IF ( <file_type> = Park ) 
				IF inNetGame 
					goto DoneScript type = <file_type> 
				ENDIF 
			ENDIF 
			goto mcmess_LoadSuccessful params = { type = <file_type> filename = <filename> } 
		ENDIF 
	ELSE 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		goto mcmess_ErrorLoadFailed params = { <...> GoBackToFilesMenu } 
	ENDIF 
ENDSCRIPT

SCRIPT post_load_from_memory_card 
	IF NOT GotParam type 
		
		script_assert "Expected to find parameter \'type\'!" 
	ENDIF 
	SWITCH <type> 
		CASE OptionsAndPros 
			career_post_load 
			IF LoadedCustomSkater 
				edit_graphic_set_layer_infos layer_infos = <layer_infos> 
				edit_graphic_apply_graphic_from_save 
				load_pro_skater name = custom 
				cas_post_load 
			ENDIF 
			
		CASE Park 
			SetCustomParkName name = <name> 
			SetParkName <name> 
			IF CustomParkMode editing 
				InitialiseCreatedGoals 
			ENDIF 
		CASE CreatedGoals 
			end_current_goal_run 
			IF IsTrue DoInitialiseCreatedGoalsAfterLoading 
				InitialiseCreatedGoals 
			ENDIF 
		CASE CreatedGraphic 
			edit_graphic_set_layer_infos layer_infos = <layer_infos> 
	ENDSWITCH 
ENDSCRIPT

SCRIPT UnloadAnimsAndCreateMemCardPools 
	IF NOT LevelIs Load_MainMenu 
		IF NOT LevelIs load_sk5ed 
			Change DebugPausedObjects = 1 
			do_unload_unloadable 
			IF IsNGC 
			ELSE 
				CreateTemporaryMemCardPools 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT RemoveMemCardPoolsAndLoadAnims 
	IF NOT LevelIs Load_MainMenu 
		IF LevelIs load_sk5ed 
			RETURN 
		ENDIF 
		IF NOT IsNGC 
			RemoveTemporaryMemCardPools 
		ENDIF 
		IF LevelIs load_sk5ed_gameplay 
			do_load_unloadable load_peds = 0 
		ELSE 
			do_load_unloadable 
		ENDIF 
		Change DebugPausedObjects = 0 
	ENDIF 
ENDSCRIPT

SCRIPT reload_anims_then_run_abort_script 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	RemoveMemCardPoolsAndLoadAnims 
	goto AbortScript 
ENDSCRIPT


