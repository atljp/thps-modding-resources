
auto_load_thugpro_data = 1 
VERSION_OPTIONSANDPROS = 38 
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
SCRIPT GetFileTypeName 
	SWITCH <file_type> 
		CASE OptionsAndPros 
			RETURN filetype_name = #"SKATER" 
		CASE NetworkSettings 
			RETURN filetype_name = #"ONLINE PREFS" 
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
	QuitGame 
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
	printf "DefaultDoneScript called !!!" 
ENDSCRIPT

AbortScript = DefaultAbortScript 
SCRIPT DefaultAbortScript 
	printf "DefaultAbortScript called !!!" 
ENDSCRIPT

SCRIPT memcard_menus_cleanup 
	dialog_box_exit no_pad_start 
	destroy_files_menu 
	destroy_onscreen_keyboard 
	pause_menu_gradient Off 
ENDSCRIPT

SCRIPT back_to_main_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	launch_main_menu 
ENDSCRIPT

SCRIPT launch_main_menu 
	change_gamemode_singlesession 
	PauseMusic 0 
	GoalManager_SetDifficultyLevel 1 
	Change back_to_local_net_menu = 0 
	Goto ( CREATE_MAIN_MENU_SCRIPT ) Params = { InputDelay } 
ENDSCRIPT

SCRIPT career_autoload_launch_current_level 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	IF NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		PlaySongsInOrder 
	ELSE 
		PlaySongsRandomly 
	ENDIF 
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
		printf "save complete =========================" 
		parked_quit level = Load_MainMenu 
	ELSE 
		printf "save aborted =========================" 
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
			IF InNetGame 
				create_pause_menu 
			ELSE 
				create_options_menu 
			ENDIF 
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
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	launch_select_skater_menu no_reload_textures 
ENDSCRIPT

SCRIPT back_to_options_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT back_to_career_options_menu 
	memcard_menus_cleanup 
	ResetAbortAndDoneScripts 
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
		IF InNetGame 
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
	printf "DefaultRetryScript called !!!" 
ENDSCRIPT

SCRIPT mem_card_message_pause 
	IF NOT GotParam NoTimerReset 
		ResetTimer 
	ENDIF 
	Change check_for_unplugged_controllers = 0 
	<CardCheckCounter> = 0 
	BEGIN 
		IF NOT CustomParkMode editing 
			IF ScreenElementExists id = controller_unplugged_dialog_anchor 
				Change check_for_unplugged_controllers = 1 
				Goto NullScript 
			ENDIF 
		ENDIF 
		IF NOT GotParam NoCardRemovalCheck 
			IF ( <CardCheckCounter> = 10 ) 
				IF NOT CardIsInSlot 
					Change check_for_unplugged_controllers = 1 
					Goto mcmess_ErrorNoCardInSlot 
				ENDIF 
				<CardCheckCounter> = 0 
			ELSE 
				<CardCheckCounter> = ( <CardCheckCounter> + 1 ) 
			ENDIF 
		ENDIF 
		IF TimeGreaterThan 3 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	Change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT check_card 
	IF NOT CardIsInSlot 
		Goto mcmess_ErrorNoCardInSlot 
	ENDIF 
	IF NOT CardIsFormatted 
		IF GotParam Save 
			Goto mcmess_ErrorNotFormatted 
		ELSE 
			Goto mcmess_ErrorNotFormattedNoFormatOption 
		ENDIF 
	ENDIF 
ENDSCRIPT

StopCheckingForCardRemoval = 0 
SCRIPT CheckForCardRemoval 
	Change StopCheckingForCardRemoval = 0 
	<CardCheckCounter> = 0 
	BEGIN 
		IF ( <CardCheckCounter> = 10 ) 
			IF NOT CardIsInSlot 
				Goto mcmess_ErrorNoCardInSlot 
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
	printf "WARNING: DoFormatCard should never be called on Windows" 
ENDSCRIPT

SCRIPT thugpro_files_menu_add_item 
	IF GotParam icon_alpha 
		child_texture_scale = <icon_alpha> 
	ENDIF 
	IF GotParam Save 
		IF NOT ( <file_type> = <MenuFileType> ) 
			disable_item_overwrite = 1 
			unhighlight_rgba = [ 128 128 128 50 ] 
		ENDIF 
	ENDIF 
	SWITCH <file_type> 
		CASE OptionsAndPros 
			<child_texture> = mem_career 
		CASE NetworkSettings 
			<child_texture> = mem_net 
		CASE Park 
			<child_texture> = mem_park 
		CASE replay 
			<child_texture> = mem_replay 
		CASE Cas 
			<child_texture> = mem_skater 
		CASE CAT 
			<child_texture> = mem_tricks 
		CASE CreatedGoals 
			<child_texture> = mem_goals 
		CASE CreatedGraphic 
			<child_texture> = mem_graphics 
		DEFAULT 
			<child_texture> = mem_bad 
	ENDSWITCH 
	IF GotParam total_file_size 
		IF isPal 
			FormatText textname = date "%d/%m/%y" m = <month> d = <day> y = <year> integer_width = 2 
			FormatText textname = time "%h:%z%m" h = <hour> m = <minutes> integer_width = 2 
			FormatText textname = extra_text "%d %t" d = <date> t = <time> 
			<extra_text_scale> = 0.15000000596 
		ELSE 
			IF ( <hour> < 12 ) 
				ampm = "am" 
			ELSE 
				ampm = "pm" 
				hour = ( <hour> - 12 ) 
			ENDIF 
			IF ( <hour> = 0 ) 
				hour = 12 
			ENDIF 
			FormatText textname = date "%m/%d/%y" m = <month> d = <day> y = <year> integer_width = 2 
			FormatText textname = time "%h:%m%a" h = <hour> m = <minutes> a = <ampm> integer_width = 2 
			FormatText textname = extra_text "%d %t" d = <date> t = <time> 
			<extra_text_scale> = 0.15000000596 
		ENDIF 
	ENDIF 
	RemoveParameter year 
	RemoveParameter month 
	RemoveParameter day 
	RemoveParameter hour 
	RemoveParameter minutes 
	RemoveParameter seconds 
	IF GotParam Corrupt 
		GetFileTypeName file_type = <file_type> 
		FormatText textname = filename #"DAMAGED %s" s = <filetype_name> 
	ENDIF 
	IF GotParam filename 
		text = <filename> 
	ENDIF 
	IF GotParam disable_item_overwrite 
		RemoveParameter pad_choose_script 
	ENDIF 
	make_thugpro_menu_item left_aligned_extra_text <...> 
	IF NOT GotParam menu_item_id 
		printf "ERROR: no <menu_item_id> returned???" 
		RETURN 
	ENDIF 
	SetScreenElementProps { 
		id = <menu_item_id> 
		event_handlers = [ 
			{ pad_square files_menu_delete } 
		] 
	} 
	<menu_item_id> : SetTags <...> 
ENDSCRIPT

SCRIPT launch_files_menu 
	memcard_menus_cleanup 
	create_files_menu <...> 
ENDSCRIPT

SCRIPT create_files_menu { 
		pos_tweak = PAIR(-20.00000000000, -45.00000000000) 
	} 
	IF GotParam Save 
		Change SavingOrLoading = Saving 
	ELSE 
		Change SavingOrLoading = Loading 
	ENDIF 
	IF NOT CardIsInSlot 
		Goto mcmess_ErrorNoCardInSlot 
	ENDIF 
	SetScreenElementLock id = root_window Off 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	GetFileTypeName file_type = <FileType> 
	IF GotParam Save 
		FormatText textname = menu_title "Save %s" s = <filetype_name> 
		helper_text = save_files_menu_helper_text 
	ELSE 
		FormatText textname = menu_title "Load %s" s = <filetype_name> 
		helper_text = load_files_menu_helper_text 
	ENDIF 
	thugpro_menu_create { 
		menu_name = files 
		menu_title = <menu_title> 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = <helper_text> 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = reload_anims_then_run_abort_script } 
		show_description_panel 
		show_element_counter 
		colorful 
		num_items_to_show = 11 
		scrolling 
		boxed 
	} 
	IF GotParam Save 
		RemoveParameter add_createnew_option 
		GetMemCardDirectoryListing 
		GetMemCardSpaceAvailable 
		GetMemCardSpaceRequired <FileType> 
		IF ( <TotalTHPS4FilesOnCard> = 0 ) 
			IF ( ( <SpaceAvailable> < <SpaceRequired> ) | ( <FilesLeft> < 1 ) ) 
				Goto { 
					mcmess_ErrorNotEnoughRoomNoTHPSFilesExist 
					Params = { 
						FileType = <FileType> 
						SpaceRequired = <SpaceRequired> 
						SpaceAvailable = <SpaceAvailable> 
					} 
				} 
			ELSE 
				<add_createnew_option> = 1 
			ENDIF 
		ELSE 
			IF ( ( <SpaceAvailable> < <SpaceRequired> ) | ( <FilesLeft> < 1 ) ) 
				IF NOT GotParam DoNotShowNotEnoughRoomMessage 
					Goto { 
						mcmess_ErrorNotEnoughRoomButTHPSFilesExist 
						Params = { FileType = <FileType> SpaceRequired = <SpaceRequired> } 
					} 
				ENDIF 
			ELSE 
				IF NOT GotParam FilesLimitReached 
					<add_createnew_option> = 1 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GotParam add_createnew_option 
			thugpro_files_menu_add_item { 
				file_type = <FileType> 
				filename = "Create new" 
				file_size = "" 
				pad_choose_script = CreateNew 
				icon_alpha = 0.00000000000 
				not_counted 
				centered 
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
			ForEachIn { 
				<DirectoryListing> 
				Do = thugpro_files_menu_add_item 
				Params = { 
					pad_choose_script = OKToOverwrite 
					MenuFileType = <FileType> 
					Save 
				} 
			} 
		ELSE 
			ForEachIn { 
				<DirectoryListing> 
				Do = thugpro_files_menu_add_item 
				Params = { 
					pad_choose_script = load 
				} 
			} 
		ENDIF 
	ELSE 
		IF NOT GotParam Save 
			Goto mcmess_NoFiles Params = { MenuFileType = <FileType> } 
		ENDIF 
	ENDIF 
	RemoveParameter DirectoryListing 
	thugpro_menu_create_remainder_items 
	GetMaxTHPS4FilesAllowed 
	current_menu : SetTags menu_item_max_count = <MaxTHPS4FilesAllowed> 
	thugpro_menu_finalize <...> 
	CheckForCardRemoval menu_id = files_menu 
ENDSCRIPT

SCRIPT files_menu_add_item 
ENDSCRIPT

SCRIPT files_menu_add_top_bar 
ENDSCRIPT

SCRIPT files_menu_add_bottom_bar 
ENDSCRIPT

SCRIPT files_menu_focus 
ENDSCRIPT

SCRIPT files_menu_unfocus 
ENDSCRIPT

SCRIPT files_menu_delete 
	GetTags 
	IF GotParam Index 
		IF GotParam Save 
			memcard_menus_cleanup 
			GetFileTypeName file_type = <file_type> 
			FormatText { 
				textname = DeleteText 
				#"Delete the %t\\n\'%s\' ?" 
				t = <filetype_name> 
				s = <filename> 
			} 
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
	IF DeleteMemCardFile CardFileName = <actual_file_name> XBoxDirectoryName = <xbox_directory_name> 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
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
		Goto mcmess_ErrorDeleteFailed 
	ENDIF 
ENDSCRIPT

SCRIPT delete_bad_file 
	memcard_menus_cleanup 
	ResetTimer 
	mcmess_DeletingFile FileType = <file_type> 
	IF DeleteMemCardFile { 
			CardFileName = <actual_file_name> 
			XBoxDirectoryName = <xbox_directory_name> 
			UserFileName = <filename> 
			type = <file_type> 
		} 
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
		Goto mcmess_ErrorDeleteFailed 
	ENDIF 
ENDSCRIPT

SCRIPT NGC_delete_bad_file 
	printf "WARNING: NGC_delete_bad_file should never be called on Windows" 
ENDSCRIPT

SCRIPT OKToOverwrite 
	IF NOT GotParam NoGetTags 
		GetTags 
	ENDIF 
	IF ( ( GotParam BadVersion ) | ( GotParam Corrupt ) ) 
		RETURN 
	ENDIF 
	GetMemCardSpaceRequired <MenuFileType> 
	GetMemCardSpaceAvailable 
	IF ( <SpaceRequired> > <SpaceAvailable> + <total_file_size> ) 
		Goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist Params = { 
			Overwrite 
			FileType = <MenuFileType> 
			SpaceRequired = <SpaceRequired> 
			SpaceAvailable = ( <SpaceAvailable> + <total_file_size> ) 
		} 
	ENDIF 
	memcard_menus_cleanup 
	GetFileTypeName file_type = <file_type> 
	FormatText { 
		textname = OverwriteText 
		#"OK to overwrite the existing %t file\\n\'%s\' ?" 
		t = <filetype_name> 
		s = <filename> 
	} 
	create_snazzy_dialog_box { 
		title = #"Overwrite" 
		text = <OverwriteText> 
		pad_back_script = launch_files_menu 
		pad_back_params = { FileType = <MenuFileType> Save } 
		buttons = [ 
			{ 
				font = small 
				text = #"No" 
				pad_choose_script = launch_files_menu 
				pad_choose_params = { FileType = <MenuFileType> Save } 
			} 
			{ 
				font = small text = #"Yes" 
				pad_choose_script = DeleteOldSaveNew 
				pad_choose_params = { 
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
	Goto launch_save_network_settings 
ENDSCRIPT

SCRIPT launch_save_network_settings 
	destroy_net_settings_menu 
	Change RetryScript = retry_launch_save_network_settings 
	Change AbortScript = back_to_net_settings_menu 
	Change DoneScript = back_to_net_settings_menu 
	Change SavingOrLoading = Saving 
	check_card FileType = NetworkSettings Save 
	launch_files_menu Save FileType = NetworkSettings 
ENDSCRIPT

SCRIPT retry_launch_save_internet_settings 
	memcard_menus_cleanup 
	Goto launch_save_internet_settings 
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
	Goto launch_pause_menu_save_game_sequence 
ENDSCRIPT

SCRIPT launch_pause_menu_save_game_sequence 
	destroy_pause_menu 
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
	Goto launch_pause_menu_save_park_sequence 
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
	Goto launch_park_editor_save_park_sequence 
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
	Goto launch_pause_menu_load_park_sequence 
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
	Goto launch_level_select_load_park_sequence 
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
	Goto launch_upload_file_sequence Params = { type = CAT } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cas 
	memcard_menus_cleanup 
	Goto launch_upload_file_sequence Params = { type = OptionsAndPros } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cag 
	memcard_menus_cleanup 
	Goto launch_upload_file_sequence Params = { type = CreatedGoals } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cap 
	memcard_menus_cleanup 
	Goto launch_upload_file_sequence Params = { type = Park } 
ENDSCRIPT

SCRIPT retry_launch_upload_file_sequence_cagr 
	memcard_menus_cleanup 
	Goto launch_upload_file_sequence Params = { type = CreatedGraphic } 
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
	Goto launch_download_save_sequence Params = { file_type = CAT } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cas 
	memcard_menus_cleanup 
	Goto launch_download_save_sequence Params = { file_type = OptionsAndPros } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cag 
	memcard_menus_cleanup 
	Goto launch_download_save_sequence Params = { file_type = CreatedGoals } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cap 
	memcard_menus_cleanup 
	Goto launch_download_save_sequence Params = { file_type = Park } 
ENDSCRIPT

SCRIPT retry_launch_download_save_sequence_cagr 
	memcard_menus_cleanup 
	Goto launch_download_save_sequence Params = { file_type = CreatedGraphic } 
ENDSCRIPT

SCRIPT launch_download_save_sequence 
	IF NOT GotParam file_type 
		printf "missing param file_type" 
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
			printf "bad file_type" 
	ENDSWITCH 
	Change AbortScript = back_from_transfer_succeeded_dialog 
	Change DoneScript = back_from_transfer_succeeded_dialog 
	Change SavingOrLoading = Saving 
	check_card FileType = <file_type> Save 
	launch_files_menu Save FileType = <file_type> 
ENDSCRIPT

SCRIPT retry_launch_save_cas_sequence 
	memcard_menus_cleanup 
	Goto launch_save_cas_sequence 
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
	Goto launch_save_cat_sequence 
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

SCRIPT retry_launch_skater_select_menu_save_game_sequence 
	memcard_menus_cleanup 
	Goto launch_options_menu_save_game_sequence 
ENDSCRIPT

SCRIPT launch_skater_select_menu_save_game_sequence callback_script = back_to_options_menu 
	destroy_main_menu 
	Change RetryScript = retry_launch_skater_select_menu_save_game_sequence 
	Change AbortScript = <callback_script> 
	Change DoneScript = <callback_script> 
	Change SavingOrLoading = Saving 
	check_card Save FileType = OptionsAndPros 
	launch_files_menu Save FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT retry_launch_skater_select_menu_load_game_sequence 
	memcard_menus_cleanup 
	Goto launch_skater_select_menu_load_game_sequence 
ENDSCRIPT

SCRIPT launch_skater_select_menu_load_game_sequence 
	destroy_main_menu 
	Change RetryScript = retry_launch_skater_select_menu_load_game_sequence 
	Change AbortScript = <callback_script> 
	Change DoneScript = <callback_script> 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading ApplyStorySkater 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT retry_launch_options_menu_save_game_sequence 
	memcard_menus_cleanup 
	Goto launch_options_menu_save_game_sequence 
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
	Goto launch_beat_goal_save_game_sequence 
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
	Goto launch_save_cagr_sequence 
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

SCRIPT AppendDigitsToFilenameUntilNoClash { 
		max_chars = 15 
	} 
	<newfilename> = <filename> 
	<i> = 2 
	BEGIN 
		IF NOT MemCardFileExists name = <newfilename> type = <file_type> 
			RETURN filename = <newfilename> 
			BREAK 
		ENDIF 
		AppendSuffix NewTextName = newfilename text = <filename> Suffix = <i> MaxChars = <max_chars> 
		<i> = ( <i> + 1 ) 
	REPEAT 
ENDSCRIPT

save_name_allowed_characters = [ 
	"1" "2" "3" "4" "5" "6" "7" "8" "9" "0" 
	"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" 
	"k" "l" "m" "n" "o" "p" "q" "r" "s" "t" 
	"u" "v" "w" "x" "y" "z" 
	"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" 
	"K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" 
	"U" "V" "W" "X" "Y" "Z" " " "`" "%" "\\" "\x7F" 
] 
SCRIPT CreateNew 
	GetTags 
	memcard_menus_cleanup 
	SWITCH <file_type> 
		CASE OptionsAndPros 
			GetCustomSkaterName 
			<filename> = <display_name> 
		CASE NetworkSettings 
			<filename> = #"Online Prefs" 
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
		SavePrefix = <prefix> 
		allowed_characters = save_name_allowed_characters 
		disable_special_character_tabs 
	} 
	CheckForCardRemoval menu_id = keyboard_anchor 
ENDSCRIPT

SCRIPT CreateNew_Done 
	GetTextElementString id = keyboard_current_string 
	memcard_menus_cleanup 
	FormatText textname = realfilename "%s" s = <string> 
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
	IF MemCardFileExists name = <realfilename> type = <FileType> 
		OKToOverwrite NoGetTags filename = <realfilename> file_type = <FileType> MenuFileType = <FileType> total_file_size = <total_file_size> 
	ELSE 
		Save filename = <realfilename> file_type = <FileType> 
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
	ResetTimer 
	IF GotParam Overwrite 
		Change StopCheckingForCardRemoval = 1 
		mcmess_OverwritingData FileType = <file_type> 
		Change StopCheckingForCardRemoval = 0 
		IF NOT DeleteMemCardFile CardFileName = ( <Overwrite> . CardFileName ) UserFileName = ( <Overwrite> . UserFileName ) type = ( <Overwrite> . type ) 
			RemoveMemCardPoolsAndLoadAnims 
			Goto mcmess_ErrorOverwriteFailed 
		ENDIF 
		IF MemCardFileExists name = <filename> type = <file_type> 
			Goto OKToOverwrite Params = { NoGetTags filename = <filename> file_type = <file_type> MenuFileType = <file_type> total_file_size = <total_file_size> } 
		ENDIF 
	ELSE 
		mcmess_SavingData FileType = <file_type> 
	ENDIF 
	IF SaveToMemoryCard name = <filename> type = <file_type> savevaultdata = savevaultdata 
		RemoveMemCardPoolsAndLoadAnims 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		IF ( save_successful = 0 ) 
			Change save_successful = 1 
			Goto AbortScript Params = { type = <file_type> } 
		ELSE 
			IF GotParam Overwrite 
				Goto mcmess_OverwriteSuccessful Params = { type = <file_type> } 
			ELSE 
				Goto mcmess_SaveSuccessful Params = { type = <file_type> } 
			ENDIF 
		ENDIF 
	ELSE 
		RemoveMemCardPoolsAndLoadAnims 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		IF GotParam Overwrite 
			Goto mcmess_ErrorOverwriteFailed 
		ELSE 
			Goto mcmess_ErrorSaveFailed 
		ENDIF 
	ENDIF 
ENDSCRIPT

DoAutoload = 1 
no_load = 0 
most_recent_save_exists = 0 
attempted_xbox_autoload = 0 
goto_secret_shop = 0 
SCRIPT maybe_auto_load_from_memory_card 
	IF IsTrue DoAutoload 
		Change DoAutoload = 0 
		IF IsInternetGameHost 
			CheckForCardOnBootup 
		ELSE 
			IF IsJoiningInternetGame 
				CheckForCardOnBootup 
			ELSE 
				wait 1 gameframes 
				CheckForCardOnBootup 
				SpawnScript wait_and_pause_skater Params = { time = 0 } 
				Goto back_to_main_menu 
			ENDIF 
		ENDIF 
	ELSE 
		SpawnScript wait_and_pause_skater Params = { time = 0 dont_pause_music = 1 } 
		IF ConnectedToPeer 
			SetNetworkMode INTERNET_MODE 
			SetQuietMode Off 
			Change network_connection_type = internet 
			change_gamemode_net 
			GoalManager_SetDifficultyLevel 1 
			UseNetworkPreferences 
			rejoin_lobby 
			kill_start_key_binding 
		ELSE 
			IF IsTrue back_to_local_net_menu 
				SetNetworkMode LAN_MODE 
				Change network_connection_type = lan 
				change_gamemode_net 
				GoalManager_SetDifficultyLevel 1 
				UseNetworkPreferences 
				select_lan_play 
			ELSE 
				IF NOT ScreenElementExists id = loadscreen_container 
					FadeToBlack on time = 0.00000000000 alpha = 1.00000000000 
				ENDIF 
				launch_main_menu 
				kill_start_key_binding 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CheckForCardOnBootup 
	ResetAbortAndDoneScripts 
	IF CardIsInSlot 
		IF SectorSizeOK 
			Goto auto_load 
		ENDIF 
	ELSE 
		Change RetryScript = CheckForCardOnBootup 
		Change AbortScript = back_to_main_menu 
		Goto mcmess_ErrorNoCardOnBootup 
	ENDIF 
ENDSCRIPT

in_autoload = 0 
SCRIPT auto_load 
	Change in_autoload = 1 
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
			Change AbortScript = back_to_main_menu 
			Change DoneScript = back_to_main_menu 
		ENDIF 
	ENDIF 
	Change RetryScript = auto_load 
	Change SavingOrLoading = Loading 
	StopMusic 
	IF NOT CardIsInSlot 
		Goto mcmess_ErrorNoCardOnBootup 
	ENDIF 
	ResetTimer 
	mcmess_CheckingCard 
	IF NOT CardIsFormatted 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		Goto mcmess_ErrorNotFormatted Params = { QuitText = #"Continue without formatting" BackScript = NullScript } 
	ENDIF 
	IF ( no_load = 0 ) 
		RemoveParameter MostRecentSave 
		GetMemCardDirectoryListing 
		GetMostRecentSave <DirectoryListing> NetworkSettings 
		mem_card_message_pause NoTimerReset NoCardRemovalCheck 
		IF NOT CardIsInSlot 
			Goto mcmess_ErrorNoCardOnBootup 
		ENDIF 
	ENDIF 
	<did_load> = 0 
	IF GotParam MostRecentSave 
		Change most_recent_save_exists = 1 
		ResetTimer 
		mcmess_LoadingData FileType = NetworkSettings 
		IF LoadFromMemoryCard name = ( <MostRecentSave> . filename ) type = NetworkSettings 
			GetPreferenceChecksum pref_type = network config_type 
		ELSE 
			mem_card_message_pause NoTimerReset NoCardRemovalCheck 
			Goto mcmess_ErrorLoadFailed Params = { 
				<...> 
				filename = ( <MostRecentSave> . filename ) 
				actual_file_name = ( <MostRecentSave> . actual_file_name ) 
				file_type = NetworkSettings 
			} 
		ENDIF 
		<did_load> = 1 
	ENDIF 
	RemoveParameter MostRecentSave 
	GetMostRecentSave <DirectoryListing> OptionsAndPros 
	IF GotParam MostRecentSave 
		IF ( <did_load> = 0 ) 
			ResetTimer 
			mcmess_LoadingData FileType = OptionsAndPros 
		ENDIF 
		SetSectionsToApplyWhenLoading ApplyStorySkater 
		IF NOT LoadFromMemoryCard name = ( <MostRecentSave> . filename ) type = OptionsAndPros 
			mem_card_message_pause NoTimerReset NoCardRemovalCheck 
			Goto mcmess_ErrorLoadFailed Params = { 
				<...> 
				filename = ( <MostRecentSave> . filename ) 
				actual_file_name = ( <MostRecentSave> . actual_file_name ) 
				file_type = OptionsAndPros 
			} 
		ENDIF 
		<did_load> = 1 
	ENDIF 
	IF ( <did_load> = 1 ) 
		mem_card_message_pause NoTimerReset 
	ENDIF 
	GetMemCardSpaceAvailable 
	GetSaveSizes 
	<TotalSpaceRequired> = ( <SaveSize_OptionsAndPros> + 
	<SaveSize_Park> + 
	<SaveSize_CreateATrick> + 
	<SaveSize_Goals> + 
	<SaveSize_CreatedGraphic> ) 
	IF ( <FilesLeft> < 4 ) 
		mem_card_message_pause XSkips NoTimerReset 
		Goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
	ENDIF 
	IF ( <SpaceAvailable> < <TotalSpaceRequired> ) 
		mem_card_message_pause XSkips NoTimerReset 
		Goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
	ENDIF 
	Change show_career_startup_menu = 0 
	Change in_autoload = 0 
	IF IsInternetGameHost 
		start_internet_game 
	ELSE 
		IF IsJoiningInternetGame 
			start_internet_game 
		ELSE 
			Goto back_to_main_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT retry_launch_pause_menu_save_created_goals 
	memcard_menus_cleanup 
	Goto launch_pause_menu_save_created_goals 
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
	Goto launch_pause_menu_load_created_goals 
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
	Goto launch_load_network_settings 
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
	Goto launch_options_menu_load_game_sequence 
ENDSCRIPT

SCRIPT retry_launch_career_menu_load_game_sequence 
	memcard_menus_cleanup 
	Goto launch_career_menu_load_game_sequence 
ENDSCRIPT

SCRIPT launch_career_menu_load_game_sequence 
	dialog_box_exit 
	destroy_main_menu 
	Skater : hide 
	Change RetryScript = retry_launch_career_menu_load_game_sequence 
	Change AbortScript = back_to_career_options_menu 
	Change DoneScript = back_to_career_options_menu 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading ApplyStorySkater 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT launch_options_menu_load_game_sequence 
	destroy_main_menu 
	Change RetryScript = retry_launch_options_menu_load_game_sequence 
	Change AbortScript = back_to_options_menu 
	Change DoneScript = back_to_options_menu 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading ApplyStorySkater 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
ENDSCRIPT

SCRIPT retry_launch_load_cas_sequence 
	memcard_menus_cleanup 
	Goto launch_load_cas_sequence 
ENDSCRIPT

SCRIPT launch_load_cas_sequence 
	destroy_main_menu 
	Change AbortScript = back_to_pre_cas_menu 
	Change DoneScript = jump_to_edit_skater 
	Change RetryScript = retry_launch_load_cas_sequence 
	Change SavingOrLoading = Loading 
	SetSectionsToApplyWhenLoading ApplyStorySkater 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros from_cas 
ENDSCRIPT

SCRIPT retry_launch_load_cas_from_select_sequence 
	memcard_menus_cleanup 
	Goto launch_load_cas_from_select_sequence 
ENDSCRIPT

SCRIPT launch_load_cas_from_select_sequence 
	Change check_for_unplugged_controllers = 0 
	destroy_main_menu 
	dialog_box_exit 
	Change AbortScript = launch_new_select_skater_menu 
	Change DoneScript = launch_new_select_skater_menu 
	Change RetryScript = retry_launch_load_cas_from_select_sequence 
	Change SavingOrLoading = Loading 
	GetCurrentSkaterProfileIndex 
	IF ( <currentSkaterProfileIndex> = 0 ) 
		SetSectionsToApplyWhenLoading ApplyStorySkater 
	ELSE 
		SetSectionsToApplyWhenLoading ApplyStorySkater 
	ENDIF 
	check_card FileType = OptionsAndPros 
	launch_files_menu FileType = OptionsAndPros 
	Change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT retry_launch_load_cat_sequence 
	memcard_menus_cleanup 
	Goto launch_load_cat_sequence 
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
	Goto launch_load_cat_sequence2 
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
	Goto launch_load_cagr_sequence 
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
	IF InNetGame 
		IF ( <file_type> = Park ) 
			IF NOT GotParam MaxPlayers 
				MaxPlayers = 1 
			ENDIF 
			GetNetworkNumPlayers 
			IF InNetGame 
				IF ( <num_players> > <MaxPlayers> ) 
					memcard_menus_cleanup 
					Goto mcmess_ErrorbadParkMaxPlayers Params = <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( ( GotParam BadVersion ) | ( GotParam Corrupt ) ) 
		IF IsNGC 
			memcard_menus_cleanup 
			Goto mcmess_ErrorLoadFailed Params = { <...> CorruptedData GoBackToFilesMenu } 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	memcard_menus_cleanup 
	generic_menu_pad_choose_sound 
	ResetTimer 
	mcmess_LoadingData FileType = <file_type> 
	IF LoadFromMemoryCard name = <filename> type = <file_type> loadforupload = loadforupload 
		Change check_for_unplugged_controllers = 0 
		mcmess_LoadingData FileType = <file_type> no_animate = no_animate 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		IF ( load_successful = 0 ) 
			Change load_successful = 1 
			Change check_for_unplugged_controllers = 1 
			Goto AbortScript Params = { type = <file_type> filename = <filename> } 
		ELSE 
			Change check_for_unplugged_controllers = 1 
			IF ( <file_type> = Park ) 
				IF InNetGame 
					Goto DoneScript type = <file_type> 
				ENDIF 
			ENDIF 
			Goto mcmess_LoadSuccessful Params = { type = <file_type> filename = <filename> } 
		ENDIF 
	ELSE 
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck 
		Goto mcmess_ErrorLoadFailed Params = { <...> GoBackToFilesMenu } 
	ENDIF 
ENDSCRIPT

SCRIPT post_load_from_memory_card 
	IF NOT GotParam type 
		printstruct <...> 
		script_assert "Expected to find parameter \'type\'!" 
	ENDIF 
	SWITCH <type> 
		CASE OptionsAndPros 
			load_pro_skater name = custom 
			cas_post_load 
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
			CreateTemporaryMemCardPools 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT RemoveMemCardPoolsAndLoadAnims 
	IF NOT LevelIs Load_MainMenu 
		IF LevelIs load_sk5ed 
			RETURN 
		ENDIF 
		RemoveTemporaryMemCardPools 
		Change DebugPausedObjects = 0 
	ENDIF 
ENDSCRIPT

SCRIPT reload_anims_then_run_abort_script 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	RemoveMemCardPoolsAndLoadAnims 
	Goto AbortScript 
ENDSCRIPT


