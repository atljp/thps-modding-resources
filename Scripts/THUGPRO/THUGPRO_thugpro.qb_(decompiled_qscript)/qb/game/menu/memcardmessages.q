
SCRIPT create_dialog_box_with_wait 
	IF ( no_load = 0 ) 
		memcard_menus_cleanup 
	ELSE 
		<no_bg> = no_bg 
	ENDIF 
	create_snazzy_dialog_box { <...> no_animate } 
	change check_for_unplugged_controllers = 0 
	change check_for_unplugged_controllers = 1 
ENDSCRIPT

SCRIPT mcmess_CheckingCard 
	create_dialog_box_with_wait { 
		title = #"Checking ..." 
		text = #"Checking hard disk ..." 
		no_bg = <no_bg> 
		add_loading_anim = add_loading_anim 
	} 
ENDSCRIPT

SCRIPT mcmess_SavingData 
	GetFileTypeName file_type = <FileType> 
	FormatText { 
		TextName = text 
		#"Saving %f to hard disk ...\\n" 
		f = <filetype_name> 
	} 
	create_dialog_box_with_wait { 
		title = #"Saving ..." 
		text_dims = PAIR(350.00000000000, 0.00000000000) 
		text = <text> 
		add_loading_anim = add_loading_anim 
	} 
ENDSCRIPT

SCRIPT mcmess_OverwritingData 
	GetFileTypeName file_type = <FileType> 
	FormatText { 
		TextName = text 
		#"Overwriting %f to hard disk ...\\n" 
		f = <filetype_name> 
	} 
	create_dialog_box_with_wait { 
		title = #"Overwriting ..." 
		text_dims = PAIR(350.00000000000, 0.00000000000) 
		text = <text> 
		add_loading_anim = add_loading_anim 
	} 
ENDSCRIPT

SCRIPT mcmess_LoadingData 
	GetFileTypeName file_type = <FileType> 
	FormatText { 
		TextName = text 
		#"Loading %f from hard disk ...\\n" 
		f = <filetype_name> 
	} 
	create_dialog_box_with_wait { 
		title = #"Loading ..." 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		text = <text> 
		add_loading_anim = add_loading_anim 
	} 
	no_animate = <no_animate> 
ENDSCRIPT

SCRIPT mcmess_DeletingFile 
	GetFileTypeName file_type = <FileType> 
	FormatText { 
		TextName = text 
		#"Deleting %f from hard disk ...\\n" 
		f = <filetype_name> 
	} 
	create_dialog_box_with_wait { 
		title = #"Deleting ..." 
		text_dims = PAIR(350.00000000000, 0.00000000000) 
		text = <text> 
		add_loading_anim = add_loading_anim 
	} 
ENDSCRIPT

SCRIPT mcmess_SaveSuccessful 
	IF InNetGame 
		IF LevelIs load_sk5ed_gameplay 
			FormatText TextName = TP_NET_SavedPark_MSG "I saved this Created Park!" 
			SendChatMessage String = <TP_NET_SavedPark_MSG> 
		ENDIF 
	ENDIF 
	create_memcard_success_dialog_box { 
		title = #"Successful" 
		text = #"Save successful" 
	} 
ENDSCRIPT

SCRIPT mcmess_OverwriteSuccessful 
	IF InNetGame 
		IF LevelIs load_sk5ed_gameplay 
			FormatText TextName = TP_NET_SavedPark_MSG "I saved this Created Park!" 
			SendChatMessage String = <TP_NET_SavedPark_MSG> 
		ENDIF 
	ENDIF 
	create_memcard_success_dialog_box { 
		title = #"Successful" 
		text = #"Overwrite successful" 
	} 
ENDSCRIPT

SCRIPT mcmess_LoadSuccessful 
	create_memcard_success_dialog_box { 
		title = #"Successful" 
		text = #"Load Successful" 
	} 
ENDSCRIPT

SCRIPT mcmess_FormattingCard 
	printf "WARNING: mcmess_FormattingCard should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_FormatSuccessful 
	printf "WARNING: mcmess_FormatSuccessful should never be called on Windows" 
ENDSCRIPT

SCRIPT create_memcard_error_dialog_box 
	memcard_menus_cleanup 
	create_error_box { 
		<...> 
		pad_back_script = reload_anims_then_run_abort_script 
		buttons = [ 
			{ font = small text = #"Retry" pad_choose_script = RetryScript } 
			{ font = small text = #"Quit" pad_choose_script = reload_anims_then_run_abort_script } 
		] 
	} 
ENDSCRIPT

SCRIPT create_memcard_success_dialog_box 
	memcard_menus_cleanup 
	create_snazzy_dialog_box { 
		<...> 
		pad_back_script = DoneScript 
		buttons = [ 
			{ font = small text = #"OK" pad_choose_script = DoneScript pad_choose_params = { type = <type> } } 
		] 
	} 
ENDSCRIPT

SCRIPT mcmess_FormatFailed 
	printf "WARNING: mcmess_FormatFailed should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_ErrorSaveFailed 
	create_memcard_error_dialog_box { 
		title = #"Warning !" 
		text = #"Failed trying to save." 
	} 
ENDSCRIPT

SCRIPT mcmess_ErrorOverwriteFailed 
	create_memcard_error_dialog_box { 
		title = #"Warning !" 
		text = #"Failed trying to overwrite." 
	} 
ENDSCRIPT

SCRIPT mcmess_ErrorbadParkMaxPlayers back_script = reload_anims_then_run_abort_script back_params = { } 
	FormatText { 
		TextName = text 
		#"This park cannot run with %p players.\\nThe maximum number of players for this park is %m" 
		p = <num_players> 
		m = <MaxPlayers> 
	} 
	create_error_box { 
		title = #"Warning !" 
		text = <text> 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		pad_back_script = <back_script> 
		pad_back_params = <back_params> 
		buttons = [ 
			{ font = small text = #"OK" pad_choose_script = <back_script> pad_choose_params = <back_params> } 
		] 
	} 
ENDSCRIPT

autoload_cas_failed = 0 
autoload_net_failed = 0 
SCRIPT mcmess_ErrorLoadFailed 
	IF IsTrue in_autoload 
		SWITCH <file_type> 
			CASE OptionsAndPros 
				change autoload_cas_failed = 1 
			CASE NetworkSettings 
				change autoload_net_failed = 1 
			DEFAULT 
		ENDSWITCH 
		change in_autoload = 0 
		reload_anims_then_run_abort_script 
	ELSE 
		GetFileTypeName file_type = <file_type> 
		FormatText TextName = text #"%s appears to be damaged and cannot be used. Press \\bm to continue." s = <filetype_name> 
		memcard_menus_cleanup 
		create_error_box { 
			title = #"" 
			text = <text> 
			pad_back_script = reload_anims_then_run_abort_script 
			buttons = [ 
				{ font = small text = #"Continue" pad_choose_script = reload_anims_then_run_abort_script } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT mcmess_NGCDeleteCorruptFile 
	printf "WARNING: mcmess_NGCDeleteCorruptFile should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_ErrorNoCardInSlot 
	printf "WARNING: mcmess_ErrorNoCardInSlot should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_ErrorNotEnoughRoomNoTHPSFilesExist SpaceRequired = 0 SpaceAvailable = 0 
	memcard_menus_cleanup 
	GetFileTypeName file_type = <FileType> 
	FormatText { 
		TextName = text 
		#"Your hard disk does not have enough free space to save.\\nAt least %s KB are needed to save the current %f.\\nPlease free at least %n KB." 
		s = <SpaceRequired> 
		f = <filetype_name> 
		n = ( <SpaceRequired> - <SpaceAvailable> ) 
	} 
	create_error_box { 
		title = #"Warning !" 
		text = <text> 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		pad_back_script = reload_anims_then_run_abort_script 
		buttons = [ 
			{ font = small text = #"Continue without saving" pad_choose_script = reload_anims_then_run_abort_script } 
		] 
	} 
ENDSCRIPT

SCRIPT mcmess_ErrorNotEnoughRoomButTHPSFilesExist SpaceRequired = 0 
	memcard_menus_cleanup 
	GetFileTypeName file_type = <FileType> 
	FormatText { 
		TextName = text 
		#"Your hard disk does not have enough free space to save.\\nAt least %s KB are needed to save the current %f.\\nYou will need to either delete or overwrite existing saves." 
		s = <SpaceRequired> 
		f = <filetype_name> 
	} 
	create_error_box { 
		title = #"Warning !" 
		text = <text> 
		text_dims = PAIR(450.00000000000, 0.00000000000) 
		pad_back_script = reload_anims_then_run_abort_script 
		buttons = [ 
			{ font = small text = #"Continue" pad_choose_script = launch_files_menu pad_choose_params = { DoNotShowNotEnoughRoomMessage Save FileType = <FileType> } } 
			{ font = small text = #"Quit" pad_choose_script = reload_anims_then_run_abort_script } 
		] 
	} 
ENDSCRIPT

SCRIPT mcmess_ErrorDeleteFailed 
	create_memcard_error_dialog_box { 
		title = #"Delete failed !" 
		text = #"Unable to delete." 
	} 
ENDSCRIPT

SCRIPT mcmess_NoFiles 
	GetFileTypeName file_type = <MenuFileType> 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	FormatText { 
		TextName = text 
		#"No THUG Pro %n present on hard disk." 
		n = <filetype_name> 
	} 
	memcard_menus_cleanup 
	create_error_box { 
		title = "No Saves" 
		text = <text> 
		pad_back_script = reload_anims_then_run_abort_script 
		buttons = [ 
			{ font = small text = #"Quit" pad_choose_script = reload_anims_then_run_abort_script } 
		] 
	} 
ENDSCRIPT

SCRIPT mcmess_ErrorNotFormatted 
	printf "WARNING: mcmess_ErrorNotFormatted should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_ErrorNotFormattedNoFormatOption 
	printf "WARNING: mcmess_ErrorNotFormattedNoFormatOption should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_FormatYesNo 
	printf "WARNING: mcmess_FormatYesNo should never be called on Windows" 
ENDSCRIPT

SCRIPT GetSaveSizes 
	GetMemCardSpaceRequired OptionsAndPros 
	<SaveSize_OptionsAndPros> = <SpaceRequired> 
	GetMemCardSpaceRequired NetworkSettings 
	<SaveSize_NetworkSettings> = <SpaceRequired> 
	GetMemCardSpaceRequired Park 
	<SaveSize_Park> = <SpaceRequired> 
	GetMemCardSpaceRequired Cat 
	<SaveSize_CreateATrick> = <SpaceRequired> 
	GetMemCardSpaceRequired CreatedGoals 
	<SaveSize_Goals> = <SpaceRequired> 
	GetMemCardSpaceRequired CreatedGraphic 
	<SaveSize_CreatedGraphic> = <SpaceRequired> 
	RETURN <...> 
ENDSCRIPT

SCRIPT mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
	IF ( no_load = 0 ) 
		memcard_menus_cleanup 
	ELSE 
		<no_bg> = no_bg 
	ENDIF 
	GetSaveSizes 
	GetMemCardSpaceAvailable 
	total_blocks_needed = ( <SaveSize_OptionsAndPros> + <SaveSize_Park> + <SaveSize_CreateATrick> + <SaveSize_Goals> + <SaveSize_CreatedGraphic> ) 
	FormatText { 
		TextName = text 
		#"Your hard disk does not have enough free space to save all types of THUG saves.\\nPlease free at least %f KB.\\n\\nGame Progress requires %c KB\\nPark requires %p KB\\nTricks require %t KB\\nGoals require %g KB\\nGraphics Require %u KB" 
		c = <SaveSize_OptionsAndPros> 
		p = <SaveSize_Park> 
		t = <SaveSize_CreateATrick> 
		g = <SaveSize_Goals> 
		u = <SaveSize_CreatedGraphic> 
		f = ( <total_blocks_needed> - <SpaceAvailable> ) 
	} 
	create_error_box { 
		title = #"" 
		text = <text> 
		text_dims = PAIR(560.00000000000, 0.00000000000) 
		pos_tweak = PAIR(0.00000000000, -15.00000000000) 
		no_animate 
		no_bg = <no_bg> 
		buttons = [ 
			{ font = small text = #"Continue without saving all types of game saves" pad_choose_script = reload_anims_then_run_abort_script } 
		] 
	} 
ENDSCRIPT

SCRIPT mcmess_ErrorNoCardOnBootup 
	memcard_menus_cleanup 
ENDSCRIPT

SCRIPT mcmess_DamagedCard 
	printf "WARNING: mcmess_DamagedCard should never be called on Windows" 
ENDSCRIPT

SCRIPT mcmess_BadDevice 
	memcard_menus_cleanup 
	create_error_box { 
		title = #"Error" 
		text = #"Wrong device in Slot A. Please insert a Memory Card." 
		pad_back_script = reload_anims_then_run_abort_script 
		buttons = [ 
			{ font = small text = #"Continue without saving" pad_choose_script = reload_anims_then_run_abort_script } 
			{ font = small text = #"Retry" pad_choose_script = RetryScript } 
		] 
	} 
ENDSCRIPT

SCRIPT mcmess_BadSectorSize 
	memcard_menus_cleanup 
	create_error_box { 
		title = #"Error" 
		text = #"The Memory Card in Slot A is not compatible with the THUG 2 save file." 
		pad_back_script = reload_anims_then_run_abort_script 
		buttons = [ 
			{ font = small text = #"Continue without saving" pad_choose_script = reload_anims_then_run_abort_script } 
			{ font = small text = #"Retry" pad_choose_script = RetryScript } 
		] 
	} 
ENDSCRIPT


