timeline_info_anchor_offscreen_pos = PAIR(-450.00000000000, 240.00000000000) 
rot_on_un = [ 22 72 111 70 ] 
rot_off_un = [ 30 57 78 35 ] 
rot_on_high = [ 22 72 111 128 ] 
rot_off_high = [ 30 57 78 58 ] 
grab_on_un = [ 7 123 65 70 ] 
grab_off_un = [ 29 58 42 35 ] 
grab_on_high = [ 7 123 65 128 ] 
grab_off_high = [ 29 58 42 58 ] 
flip_on_un = [ 127 123 45 70 ] 
flip_off_un = [ 59 58 32 35 ] 
flip_on_high = [ 127 123 45 128 ] 
flip_off_high = [ 59 58 32 58 ] 
spec_on_un = [ 127 3 5 70 ] 
spec_off_un = [ 69 28 22 35 ] 
spec_on_high = [ 127 3 5 128 ] 
spec_off_high = [ 69 28 22 58 ] 
misc_on_un = [ 127 3 125 70 ] 
misc_off_un = [ 69 28 62 35 ] 
misc_on_high = [ 127 3 125 128 ] 
misc_off_high = [ 69 28 62 58 ] 
gen_on_un = [ 127 63 5 70 ] 
gen_off_un = [ 69 38 2 35 ] 
gen_on_high = [ 127 63 5 128 ] 
gen_off_high = [ 69 38 2 58 ] 
new_item_un = [ 80 80 80 80 ] 
new_item_high = [ 128 128 128 100 ] 
idle_on_un = [ 10 10 10 80 ] 
idle_off_un = [ 10 10 10 20 ] 
timeline_arrow_high = [ 100 100 100 100 ] 
MIN_CAT_TIME = 0.34999999404 
in_cat_test_mode = 0 
cat_heap = frontend 
SCRIPT create_pre_cat_menu 
	dialog_box_exit 
	IF ObjectExists id = quit_dialog_anchor 
		DestroyScreenElement id = quit_dialog_anchor 
	ENDIF 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	IF ( launch_to_createatrick = 0 ) 
		<pad_back_script> = cat_exit_cleanup 
	ELSE 
		<pad_back_script> = launch_quit_cat_dialog 
	ENDIF 
	thugpro_menu_create { 
		menu_name = cat 
		menu_title = "Create-a-Trick" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = <pad_back_script> 
		show_description_panel 
		show_gradient 
	} 
	make_thugpro_menu_item { 
		text = "Create New Trick" 
		id = menu_new 
		pad_choose_script = create_CAT_menu 
		pad_choose_params = { new = 1 } 
	} 
	make_thugpro_menu_item { 
		text = "Edit Created Trick" 
		id = menu_edit 
		pad_choose_script = cat_edit_slot_menu 
		pad_choose_params = { load = 0 } 
	} 
	make_thugpro_menu_item { 
		text = "Load Created Trick" 
		id = menu_load 
		pad_choose_script = launch_load_cat_sequence 
		pad_choose_params = { } 
	} 
	make_thugpro_menu_item { 
		text = "Pre-Made Tricks" 
		id = menu_premade 
		pad_choose_script = cat_premade_menu 
		pad_choose_params = { } 
	} 
	make_thugpro_menu_item { 
		text = "Done" 
		id = menu_exit 
		pad_choose_script = <pad_back_script> 
	} 
	Change cat_heap = frontend 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT cat_exit_cleanup 
	Change in_cat_preview_mode = 0 
	IF GotParam to_main_menu 
		quit_network_game 
	ELSE 
		create_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT launch_quit_cat_dialog 
	dialog_box_exit 
	generic_menu_cleanup 
	IF ObjectExists id = quit_dialog_anchor 
		DestroyScreenElement id = quit_dialog_anchor 
	ENDIF 
	create_quit_cat_dialog 
ENDSCRIPT

SCRIPT launch_pre_cat_menu 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_pre_cat_menu 
ENDSCRIPT

SCRIPT create_quit_cat_dialog 
	create_error_box { 
		title = "Exit Create-a-Trick" 
		text = "Are you sure?" 
		anchor_id = quit_dialog_anchor 
		buttons = [ { text = "Yes" pad_choose_script = cat_exit_cleanup pad_choose_params = { to_main_menu } } { text = "No" pad_choose_script = launch_pre_cat_menu } ] 
		no_animate 
	} 
ENDSCRIPT

SCRIPT cat_launch_bo 
	change_gamemode_singlesession 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	last_level = ( level_select_last_level_played [ 0 ] ) 
	change_level level = <last_level> 
ENDSCRIPT

SCRIPT create_CAT_pause_menu 
	IF ScreenElementExists id = cat_menu_anchor 
		DestroyScreenElement id = cat_menu_anchor 
	ENDIF 
	IF ObjectExists id = CAT_Skater 
		CAT_Skater : TurnOffSpecialItem 
		CAT_Skater : Die 
		cat_rehide_skater_board 
	ENDIF 
	IF GotParam from_timeline 
		generic_menu_pad_back_sound 
		spawnscript cat_back_to_skater_cam 
	ENDIF 
	KillSpawnedScript name = cat_perform_trick_loop 
	IF ( running_cat_demo = 1 ) 
		Change running_cat_demo = 0 
	ENDIF 
	IF ( in_cat_preview_mode = 1 ) 
		KillSpawnedScript name = remap_cat_preview_trick 
		spawnscript remap_cat_preview_trick 
	ENDIF 
	kill_start_key_binding 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	thugpro_menu_create { 
		menu_name = pause 
		menu_title = "Paused" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = preview_cat 
		show_description_panel 
		show_gradient 
	} 
	get_CAT_other_param_values trick_index = 0 
	create_cat_pause_trick_info name = <name> parent = pause_menu 
	calculate_cat_score get_values 
	make_thugpro_menu_item { 
		text = "Back to Editor" 
		id = menu_back 
		pad_choose_script = create_CAT_menu 
		pad_choose_params = { from_cat_pause } 
	} 
	make_thugpro_menu_item { 
		text = "Preview Trick" 
		id = menu_preview 
		pad_choose_script = preview_cat 
		pad_choose_params = { } 
	} 
	make_thugpro_menu_item { 
		text = "Name Trick" 
		id = menu_name 
		pad_choose_script = launch_keyboard_from_cat_pause 
		pad_choose_params = { } 
	} 
	make_thugpro_menu_item { 
		text = "Save Trick" 
		id = menu_save 
		pad_choose_script = maybe_launch_save_cat_sequence 
		pad_choose_params = { } 
	} 
	make_thugpro_menu_item { 
		text = "Done" 
		id = menu_exit 
		pad_choose_script = cat_exit_dialog 
		pad_choose_params = { } 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT validate_cat 
	calculate_cat_score get_time 
	IF ( MIN_CAT_TIME > <time> ) 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		create_dialog_box { 
			title = "Too Short!" 
			text = "Your Create-A-trick must be at least 0.4 seconds long." 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			buttons = [ 
				{ font = small text = "Ok" pad_choose_script = create_CAT_pause_menu } 
			] 
		} 
	ELSE 
		cat_landable 
		IF ( <upsidedown> = 1 ) 
			IF ScreenElementExists id = current_menu_anchor 
				DestroyScreenElement id = current_menu_anchor 
			ENDIF 
			create_dialog_box { 
				title = "Wrecked!" 
				text = "You can\'t land that trick!" 
				just = [ center center ] 
				text_rgba = [ 88 105 112 128 ] 
				buttons = [ 
					{ font = small text = "Ok" pad_choose_script = create_CAT_pause_menu } 
				] 
			} 
		ELSE 
			RETURN is_valid = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

in_cat_preview_mode = 0 
SCRIPT preview_cat 
	destroy_menu_background_title 
	validate_cat <...> 
	IF GotParam is_valid 
		KillSpawnedScript name = remap_cat_preview_trick 
		Change in_cat_preview_mode = 1 
		GoalManager_GetTrickFromKeyCombo Key_Combo = Air_SquareL 
		IF GotParam trick_checksum 
			Skater : SetTags old_trick = <trick_checksum> 
		ELSE 
			IF GotParam cat_num 
				Skater : SetTags old_trick = <cat_num> 
			ENDIF 
		ENDIF 
		BindTrickToKeyCombo { 
			Key_Combo = Air_SquareL 
			trick = 0 
			update_mappings = 1 
		} 
		GetCurrentSkaterProfileIndex 
		UpdateTrickMappings Skater = <currentSkaterProfileIndex> 
		exit_pause_menu 
		GoalManager_HideGoalPoints 
		CreateScreenElement { 
			id = cat_preview_trick_mapping_text 
			parent = root_window 
			type = ContainerElement 
		} 
		create_panel_message { 
			id = cat_preview_trick_mapping_text_1 
			text = "Create-a-Trick" 
			parent = cat_preview_trick_mapping_text 
			style = panel_message_goal_new 
			font_face = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
			final_scale = 0.21999999881 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			final_pos = ( panel_block_goal_desc_pos1 ) 
			just = [ center top ] 
			shadow 
		} 
		create_panel_block { 
			id = cat_preview_trick_mapping_text_2 
			text = "Preview created trick\\n\\b6 + \\b1" 
			parent = cat_preview_trick_mapping_text 
			style = panel_message_goal_new 
			font_face = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
			dims = PAIR(1100.00000000000, 0.00000000000) 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
			final_scale = 0.20000000298 
			final_pos = ( panel_block_goal_desc_pos2 ) 
			just = [ center top ] 
			internal_just = [ center top ] 
			shadow 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT remap_cat_preview_trick 
	IF ScreenElementExists id = cat_preview_trick_mapping_text 
		DestroyScreenElement id = cat_preview_trick_mapping_text 
	ENDIF 
	Skater : GetTags 
	BindTrickToKeyCombo { 
		Key_Combo = Air_SquareL 
		trick = <old_trick> 
		update_mappings = 1 
	} 
	GetCurrentSkaterProfileIndex 
	UpdateTrickMappings Skater = <currentSkaterProfileIndex> 
ENDSCRIPT

SCRIPT maybe_launch_save_cat_sequence 
	validate_cat <...> 
	IF GotParam is_valid 
		get_CAT_param_values trick_index = 0 
		IF ( <name> = "" ) 
			set_new_CAT_param_values trick_index = 0 name = "Created Trick" 
		ENDIF 
		launch_save_cat_sequence 
	ENDIF 
ENDSCRIPT

editing_cat = 0 
SCRIPT cat_edit_slot_menu 
	thugpro_menu_create { 
		menu_name = sub 
		menu_title = "Edit Trick" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = create_pre_cat_menu 
		boxed 
	} 
	index = 1 
	count = 0 
	BEGIN 
		get_CAT_other_param_values trick_index = <index> 
		IF GotParam full 
			IF ( <full> = 1 ) 
				count = ( <count> + 1 ) 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT ( MAX_CREATED_TRICKS - 1 ) 
	IF ( <count> > 0 ) 
		index = 1 
		BEGIN 
			get_CAT_other_param_values trick_index = <index> 
			IF GotParam full 
				IF ( <full> = 1 ) 
					make_thugpro_menu_item { 
						text = <name> 
						pad_choose_script = edit_cat_in_slot 
						pad_choose_params = { slot = <index> } 
						centered 
					} 
				ENDIF 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT ( MAX_CREATED_TRICKS - 1 ) 
		thugpro_menu_finalize <...> 
	ELSE 
		DestroyScreenElement id = current_menu_anchor 
		create_dialog_box { 
			title = "No Tricks" 
			text = "You have no tricks to edit." 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			buttons = [ 
				{ text = "Ok" pad_choose_script = create_pre_cat_menu font = small } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT edit_cat_in_slot 
	IF NOT GotParam slot 
		printf "CAT: missing slot param" 
		RETURN 
	ENDIF 
	Change editing_cat = <slot> 
	get_CAT_param_values trick_index = <slot> 
	SetCreateATrickParams { Skater = 0 
		trick_index = 0 
		other_params = { name = <name> 
			rotateafter = <rotateafter> 
			can_spin = <can_spin> 
			full = 1 
		} 
		rotation_info = <rotation_info> 
		animation_info = <animation_info> 
	} 
	create_CAT_menu 
ENDSCRIPT

SCRIPT cat_assign_slot_menu 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	destroy_menu_background_title 
	IF ObjectExists id = sub_menu 
		DestroyScreenElement id = sub_menu 
	ENDIF 
	make_new_themed_sub_menu title = "OVERWRITE TRICK" 
	IF ( loading_cat_from_edit_tricks = 0 ) 
		SetScreenElementProps { 
			id = sub_menu 
			event_handlers = [ 
				{ pad_back create_CAT_pause_menu } 
				{ pad_back generic_menu_pad_back_sound } 
			] 
		} 
	ELSE 
		SetScreenElementProps { 
			id = sub_menu 
			event_handlers = [ 
				{ pad_back create_edit_tricks_menu } 
				{ pad_back generic_menu_pad_back_sound } 
			] 
		} 
	ENDIF 
	index = 1 
	BEGIN 
		IF ( <index> = ( MAX_CREATED_TRICKS - 1 ) ) 
			last = { last_menu_item = 1 } 
		ELSE 
			last = { } 
		ENDIF 
		get_CAT_other_param_values trick_index = <index> 
		theme_menu_add_item centered = 1 text = <name> <last> no_highlight_bar pad_choose_script = assign_cat_to_slot pad_choose_params = { save_slot = <index> } 
		index = ( <index> + 1 ) 
	REPEAT ( MAX_CREATED_TRICKS - 1 ) 
	finish_themed_sub_menu 
	FireEvent type = focus target = current_menu_anchor 
ENDSCRIPT

SCRIPT assign_cat_to_slot 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = sub_menu 
		DestroyScreenElement id = sub_menu 
	ENDIF 
	IF ObjectExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	destroy_menu_background_title 
	IF NOT GotParam save_slot 
		printf "CAT: missing save_slot param" 
		RETURN 
	ENDIF 
	get_CAT_param_values trick_index = 0 
	SetCreateATrickParams { Skater = 0 
		trick_index = <save_slot> 
		other_params = { name = <name> 
			rotateafter = <rotateafter> 
			can_spin = <can_spin> 
			full = 1 
		} 
		rotation_info = <rotation_info> 
		animation_info = <animation_info> 
	} 
	IF ( loading_cat_from_edit_tricks = 1 ) 
		create_edit_tricks_menu 
	ELSE 
		back_to_options_menu_from_cat 
	ENDIF 
ENDSCRIPT

SCRIPT cat_exit_dialog back_script = return_to_cat_pause 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	calculate_cat_score get_time 
	IF ( MIN_CAT_TIME > <time> ) 
		create_dialog_box { 
			title = "Too Short!" 
			text = "Your Create-A-trick must be at least 0.4 seconds long. Do you want to go back to fix it or quit without saving?" 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			pad_back_script = <back_script> 
			buttons = [ { font = small text = "Go Back" pad_choose_script = <back_script> } 
				{ font = small text = "Quit" pad_choose_script = back_to_options_menu_from_cat } 
			] 
		} 
	ELSE 
		cat_landable 
		IF ( <upsidedown> = 1 ) 
			create_dialog_box { 
				title = "Wrecked!" 
				text = "You can\'t land that trick!" 
				just = [ center center ] 
				text_rgba = [ 88 105 112 128 ] 
				pad_back_script = <back_script> 
				buttons = [ { font = small text = "Go Back" pad_choose_script = <back_script> } 
					{ font = small text = "Quit" pad_choose_script = back_to_options_menu_from_cat } 
				] 
			} 
		ELSE 
			create_dialog_box { 
				title = "Keep it?" 
				text = "Keep this Create-A-Trick? Once kept, a Created Trick can be permanently mapped to your skater from the Edit Tricks menu." 
				just = [ center center ] 
				text_rgba = [ 88 105 112 128 ] 
				pad_back_script = <back_script> 
				buttons = [ 
					{ font = small text = "Yes" pad_choose_script = launch_keyboard_from_exit_cat } 
					{ font = small text = "No" pad_choose_script = back_to_options_menu_from_cat } 
				] 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT auto_assign_cat_to_slot 
	IF ( editing_cat = 0 ) 
		index = 1 
		BEGIN 
			get_CAT_other_param_values trick_index = <index> 
			IF ( <full> = 0 ) 
				save_slot = <index> 
				BREAK 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT ( MAX_CREATED_TRICKS -1 ) 
	ELSE 
		save_slot = ( editing_cat + 0 ) 
		Change editing_cat = 0 
	ENDIF 
	IF GotParam save_slot 
		assign_cat_to_slot save_slot = <save_slot> 
	ELSE 
		IF ( loading_cat_from_edit_tricks = 0 ) 
			create_dialog_box { 
				title = "Full" 
				text = "All your Create-A-trick slots are full. What do you want to do?" 
				just = [ center center ] 
				text_rgba = [ 88 105 112 128 ] 
				buttons = [ 
					{ font = small text = "Overwrite old trick" pad_choose_script = cat_assign_slot_menu } 
					{ font = small text = "Save trick to Hard Drive" pad_choose_script = launch_save_cat_sequence } 
					{ font = small text = "Exit without saving trick" pad_choose_script = back_to_options_menu_from_cat } 
				] 
			} 
		ELSE 
			create_dialog_box { 
				title = "Full" 
				text = "All your Create-A-trick slots are full. What do you want to do?" 
				just = [ center center ] 
				text_rgba = [ 88 105 112 128 ] 
				buttons = [ 
					{ font = small text = "Overwrite old trick" pad_choose_script = cat_assign_slot_menu } 
					{ font = small text = "Exit without loading trick" pad_choose_script = create_edit_tricks_menu } 
				] 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT back_to_options_menu_from_cat 
	pulse_blur speed = 2 start = 225 
	dialog_box_exit 
	IF ObjectExists id = CAT_Cam 
		CAT_Cam : Die 
	ENDIF 
	IF ObjectExists id = CAT_Skater 
		CAT_Skater : TurnOffSpecialItem 
		CAT_Skater : Die 
		cat_rehide_skater_board 
	ENDIF 
	IF GameModeEquals is_career 
		GoalManager_InitializeAllGoals 
	ENDIF 
	create_pre_cat_menu 
ENDSCRIPT

SCRIPT return_to_cat_pause 
	dialog_box_exit 
	pulse_blur speed = 2 start = 225 
	create_CAT_pause_menu 
ENDSCRIPT

SCRIPT launch_keyboard_from_cat_pause 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	get_CAT_param_values 
	IF ( <name> = "" ) 
		temp_name = "Created Trick" 
	ELSE 
		temp_name = <name> 
	ENDIF 
	create_onscreen_keyboard { allow_cancel 
		keyboard_cancel_script = cat_cancel_keyboard 
		keyboard_done_script = set_cat_trick_name 
		keyboard_title = "TRICK NAME" 
		text = <temp_name> 
		allowed_characters = cat_allowed_characters 
		min_length = 1 
	} 
ENDSCRIPT

cat_allowed_characters = [ 
	"1" "2" "3" "4" "5" "6" "7" "8" "9" "0" 
	"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" 
	"k" "l" "m" "n" "o" "p" "q" "r" "s" "t" 
	"u" "v" "w" "x" "y" "z" 
	"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" 
	"K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" 
	"U" "V" "W" "X" "Y" "Z" 
	"." "-" "@" "&" "$" "?" " " 
] 
SCRIPT launch_keyboard_from_exit_cat 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	dialog_box_exit 
	get_CAT_param_values 
	IF ( <name> = "" ) 
		temp_name = "Created Trick" 
	ELSE 
		temp_name = <name> 
	ENDIF 
	IF ( ( <name> = "Created Trick" ) | ( <name> = "" ) ) 
		create_onscreen_keyboard { keyboard_done_script = set_cat_trick_name_and_exit 
			keyboard_title = "TRICK NAME" 
			text = <temp_name> 
			allowed_characters = cat_allowed_characters 
			keyboard_cancel_script = cat_cancel_keyboard 
			min_length = 1 
		} 
	ELSE 
		auto_assign_cat_to_slot 
	ENDIF 
ENDSCRIPT

SCRIPT cat_cancel_keyboard 
	destroy_onscreen_keyboard 
	create_CAT_pause_menu 
ENDSCRIPT

SCRIPT set_cat_trick_name 
	get_CAT_other_param_values trick_index = 0 
	GetTextElementString id = keyboard_current_string 
	set_new_CAT_param_values trick_index = 0 name = <string> can_spin = <can_spin> 
	destroy_onscreen_keyboard 
	create_CAT_pause_menu 
ENDSCRIPT

SCRIPT set_cat_trick_name_and_exit 
	get_CAT_other_param_values trick_index = 0 
	GetTextElementString id = keyboard_current_string 
	set_new_CAT_param_values trick_index = 0 name = <string> can_spin = <can_spin> 
	destroy_onscreen_keyboard 
	auto_assign_cat_to_slot 
ENDSCRIPT

SCRIPT cat_premade_menu 
	thugpro_menu_create { 
		menu_name = cat_premade 
		menu_title = "Pre-Made Tricks" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = create_pre_cat_menu 
		scrolling 
		boxed 
	} 
	GetArraySize Premade_CATS 
	index = 0 
	BEGIN 
		name = ( ( Premade_CATS [ <index> ] ) . name ) 
		make_thugpro_menu_item { 
			text = <name> 
			pad_choose_script = load_premade_cat 
			pad_choose_params = { index = <index> } 
			centered 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT load_premade_cat 
	IF NOT GotParam index 
		printf "CAT: missing index param" 
		RETURN 
	ENDIF 
	SetCreateATrickParams { Skater = 0 
		trick_index = 0 
		other_params = { name = ( ( Premade_CATS [ <index> ] ) . name ) 
			can_spin = ( ( Premade_CATS [ <index> ] ) . can_spin ) 
			full = 1 
		} 
		rotation_info = ( ( Premade_CATS [ <index> ] ) . rotation_info ) 
		animation_info = ( ( Premade_CATS [ <index> ] ) . animation_info ) 
	} 
	IF GotParam trickSlot 
		BindTrickToKeyCombo { 
			Key_Combo = <trickSlot> 
			trick = 0 
			update_mappings = 1 
			special 
			index = <special_trick_index> 
			cat 
		} 
	ELSE 
		create_CAT_menu dont_focus_timeline = <dont_focus_timeline> 
	ENDIF 
ENDSCRIPT

SCRIPT load_default_premade_cat 
	printf "load_default_premade_cat" 
	IF NOT GotParam index 
		printf "CAT: missing index param" 
		RETURN 
	ENDIF 
	IF NOT GotParam save_slot 
		printf "CAT: missing save_slot param" 
		RETURN 
	ENDIF 
	SetCreateATrickParams { Skater = 0 
		trick_index = <save_slot> 
		other_params = { name = ( ( Premade_CATS [ <index> ] ) . name ) 
			can_spin = ( ( Premade_CATS [ <index> ] ) . can_spin ) 
			full = 1 
		} 
		rotation_info = ( ( Premade_CATS [ <index> ] ) . rotation_info ) 
		animation_info = ( ( Premade_CATS [ <index> ] ) . animation_info ) 
	} 
ENDSCRIPT

SCRIPT spawn_add_premade_cats_to_skater 
	spawnscript add_premade_cats_to_skater params = { } 
ENDSCRIPT

SCRIPT kill_load_premade_cats 
	KillSpawnedScript name = add_premade_cats_to_skater 
ENDSCRIPT

SCRIPT add_premade_cats_to_skater 
	load_default_premade_cat index = 0 save_slot = 1 
	load_default_premade_cat index = 1 save_slot = 2 
	load_default_premade_cat index = 7 save_slot = 3 
	load_default_premade_cat index = 6 save_slot = 4 
	load_default_premade_cat index = 8 save_slot = 5 
ENDSCRIPT

SCRIPT create_CAT_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	IF ( cat_done = 0 ) 
		Skater : created_trick_cleanup 
		MakeSkaterGoto AirBorne 
	ENDIF 
	Skater : KillSpecial 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	end_current_goal_run 
	SetScreenElementLock off id = root_window 
	pause_menu_gradient off 
	IF GameModeEquals is_career 
		GoalManager_UninitializeAllGoals 
	ENDIF 
	spawnscript show_CAT_skater params = { dont_focus_timeline = <dont_focus_timeline> } 
	CreateScreenElement { 
		type = ContainerElement 
		id = cat_menu_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		parent = root_window 
		heap = ( cat_heap ) 
	} 
	add_timeline_helper_text 
	kill_start_key_binding 
	create_cat_timeline <...> 
	IF ScreenElementExists id = timeline_vmenu 
		IF NOT GotParam dont_focus_timeline 
			FireEvent type = focus target = timeline_vmenu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CAT_menu_exit 
	IF ScreenElementExists id = cat_menu_anchor 
		DestroyScreenElement id = cat_menu_anchor 
	ENDIF 
	create_pre_cat_menu 
ENDSCRIPT

SCRIPT add_timeline_helper_text 
	SetScreenElementLock id = cat_menu_anchor off 
	create_helper_text { parent = cat_menu_anchor 
		spacing_between = -6 
		helper_text_elements_PC = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bn=Exit" } 
			{ text = "\\bm=Edit" } 
			{ text = "\\bp=Hide" } 
			{ text = "\\bo=Delete" } 
		{ text = "\\bs/\\bt=Order" } ] 
		helper_text_elements_Console = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\m1=Exit" } 
			{ text = "\\m0=Edit" } 
			{ text = "\\b0=Hide" } 
			{ text = "\\b1=Delete" } 
		{ text = "\\be/\\bf=Order" } ] 
	} 
ENDSCRIPT

SCRIPT add_edit_cat_helper_text 
	SetScreenElementLock id = cat_menu_anchor off 
	create_helper_text { parent = cat_menu_anchor 
		helper_text_elements_PC = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bm=Choose" } 
		] 
		helper_text_elements_Console = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\m1=Back" } 
			{ text = "\\m0=Choose" } 
		] 
	} 
ENDSCRIPT

SCRIPT add_cat_generic_helper_text 
	SetScreenElementLock id = cat_menu_anchor off 
	create_helper_text { parent = cat_menu_anchor 
		generic_helper_text 
	} 
ENDSCRIPT

SCRIPT toggle_rot_on_off 
	printf "script toggle_rot_on_off" 
	get_CAT_rot_values Skater = 0 trick_index = 0 rot_index = <rot_index> 
	IF GotParam Delete 
		on = 2 Axis = y Deg = 360 Dur = 1.00000000000 start = 0.00000000000 deg_dir = 1 
	ELSE 
		IF ( <on> = 0 ) 
			on = 1 
			GetTags 
			focus_id = <id> 
			PlaySound copinghit3_11 pitch = 60 
		ELSE 
			IF ( <on> = 2 ) 
				on = 1 
				new_rot = 1 
			ELSE 
				on = 0 
				GetTags 
				focus_id = <id> 
				PlaySound copinghit3_11 pitch = 60 
			ENDIF 
		ENDIF 
	ENDIF 
	set_new_rot_values { rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	create_cat_timeline get_id = get_id rot_index = <rot_index> 
	kill_start_key_binding 
	IF GotParam Delete 
		focus_cat_timeline 
		RETURN 
	ENDIF 
	IF NOT GotParam new_rot 
		FireEvent type = focus target = timeline_vmenu data = { child_id = <focus_id> } 
		SetScreenElementProps id = timeline_scrolling_menu reset_window_top 
	ELSE 
		FireEvent type = focus target = timeline_vmenu 
		IF ( <value> > 1 ) 
			BEGIN 
				FireEvent type = pad_down target = timeline_vmenu 
			REPEAT ( <value> -1 ) 
		ENDIF 
		FireEvent type = pad_zac target = { timeline_vmenu child = ( <value> -1 ) } 
		SetScreenElementProps id = timeline_scrolling_menu reset_window_top 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_can_spin 
	PlaySound GUI_buzzer01 pitch = 140 
	get_CAT_other_param_values trick_index = 0 
	IF ( <can_spin> = 0 ) 
		printf "turn spins on" 
		can_spin = 1 
	ELSE 
		printf "turn spins off" 
		can_spin = 0 
	ENDIF 
	set_new_CAT_param_values trick_index = 0 name = <name> can_spin = <can_spin> 
	calculate_cat_score get_values 
ENDSCRIPT

SCRIPT CAT_edit_rotation_menu parent = cat_menu_anchor trick_index = 0 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	get_CAT_rot_values Skater = 0 trick_index = 0 rot_index = <rot_index> 
	make_new_menu { 
		parent = <parent> 
		menu_id = edit_rot_menu 
		vmenu_id = edit_rot_vmenu 
		type = VMenu 
		pos = PAIR(63.00000000000, 50.00000000000) 
	} 
	get_rot_name Axis = <Axis> deg_dir = <deg_dir> 
	pos = PAIR(0.00000000000, 0.00000000000) 
	IF ( <pos> . PAIR(1.00000000000, 0.00000000000) > 280 ) 
		pos = ( ( <pos> . PAIR(1.00000000000, 0.00000000000) + -530 ) * PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 62.00000000000) ) 
	ELSE 
		pos = PAIR(-250.00000000000, 62.00000000000) 
	ENDIF 
	create_timeline_fader_box parent = cat_menu_anchor 
	SetScreenElementLock id = cat_menu_anchor off 
	create_helper_text { 
		parent = cat_menu_anchor 
		helper_text_elements_PC = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bn=Back" } 
		] 
		helper_text_elements_Console = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\b2=Back" } 
		] 
	} 
	rot_values = { id = <id> timeline_id = <timeline_id> trick_index = <trick_index> rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	SetScreenElementProps { 
		id = edit_rot_vmenu 
		event_handlers = [ 
			{ pad_back edit_rot_done_script params = <rot_values> } 
		] 
	} 
	SWITCH <Axis> 
		CASE x 
			axis_text = "Flip" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Front" 
			ELSE 
				dir_text = "Back" 
			ENDIF 
		CASE y 
			axis_text = "Spin" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Backside" 
			ELSE 
				dir_text = "Frontside" 
			ENDIF 
		CASE z 
			axis_text = "Roll" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Heel Side" 
			ELSE 
				dir_text = "Toe Side" 
			ENDIF 
	ENDSWITCH 
	cat_menu_add_number_item text = <dir_text> value = <axis_text> id = menu_axis pad_choose_script = null_script pad_right_script = increment_axis_value params = <rot_values> far_left 
	cat_menu_add_number_item text = "degrees" value = <Deg> id = menu_deg pad_right_script = increment_cat_rotation_angle_value params = <rot_values> 
	cat_menu_add_number_item text = "duration" value = <Dur> decimalplaces = 1 trailingtext = " secs" id = menu_dur pad_right_script = increment_cat_rot_time_value params = { <rot_values> change_dur } 
	theme_menu_add_item no_highlight_bar text = "done" id = menu_done pad_choose_script = edit_rot_done_script pad_choose_params = <rot_values> last_menu_item = 1 
	FireEvent type = unfocus target = timeline_vmenu 
	FireEvent type = focus target = edit_rot_menu 
	text_rgba = [ 100 100 100 100 ] 
	sprite_rgba = rot_on_high 
	IF ScreenElementExists id = { <timeline_id> child = 0 } 
		DoScreenElementMorph time = 0 id = { <timeline_id> child = 0 } rgba = <sprite_rgba> 
		DoScreenElementMorph time = 0 id = { <timeline_id> child = 1 } rgba = <text_rgba> 
	ENDIF 
	DoScreenElementMorph id = edit_rot_menu pos = PAIR(0.00000000000, 240.00000000000) 
	DoScreenElementMorph id = edit_rot_menu pos = PAIR(320.00000000000, 240.00000000000) time = 0.10000000149 
	DoScreenElementMorph id = timeline_info_anchor pos = ( timeline_info_anchor_offscreen_pos ) time = 0.20000000298 
ENDSCRIPT

SCRIPT increment_axis_value 
	generic_menu_scroll_sideways_sound 
	IF NOT GotParam reverse 
		SWITCH <Axis> 
			CASE x 
				IF ( <deg_dir> = 0 ) 
					Axis = x 
					deg_dir = 1 
				ELSE 
					Axis = y 
					deg_dir = 0 
				ENDIF 
			CASE y 
				IF ( <deg_dir> = 0 ) 
					Axis = y 
					deg_dir = 1 
				ELSE 
					Axis = z 
					deg_dir = 0 
				ENDIF 
			CASE z 
				IF ( <deg_dir> = 0 ) 
					Axis = z 
					deg_dir = 1 
				ELSE 
					Axis = x 
					deg_dir = 0 
				ENDIF 
			DEFAULT 
				printf "no match found" 
		ENDSWITCH 
	ELSE 
		SWITCH <Axis> 
			CASE x 
				IF ( <deg_dir> = 1 ) 
					Axis = x 
					deg_dir = 0 
				ELSE 
					Axis = z 
					deg_dir = 1 
				ENDIF 
			CASE y 
				IF ( <deg_dir> = 1 ) 
					Axis = y 
					deg_dir = 0 
				ELSE 
					Axis = x 
					deg_dir = 1 
				ENDIF 
			CASE z 
				IF ( <deg_dir> = 1 ) 
					Axis = z 
					deg_dir = 0 
				ELSE 
					Axis = y 
					deg_dir = 1 
				ENDIF 
			DEFAULT 
				printf "no match found" 
		ENDSWITCH 
	ENDIF 
	SWITCH <Axis> 
		CASE x 
			axis_text = "flip" 
		CASE y 
			axis_text = "spin" 
		CASE z 
			axis_text = "roll" 
	ENDSWITCH 
	SetScreenElementProps id = { menu_axis child = 3 } text = <axis_text> 
	get_rot_name Axis = <Axis> deg_dir = <deg_dir> 
	pos = PAIR(0.00000000000, 0.00000000000) 
	IF ( <pos> . PAIR(1.00000000000, 0.00000000000) > 280 ) 
		pos = ( ( <pos> . PAIR(1.00000000000, 0.00000000000) + -530 ) * PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 62.00000000000) ) 
	ELSE 
		pos = PAIR(-250.00000000000, 62.00000000000) 
	ENDIF 
	set_new_rot_values { rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	update_rot_direction_value <...> 
	update_rot_increment_params <...> 
	get_rot_name Axis = <Axis> deg_dir = <deg_dir> 
	SetScreenElementProps id = { <timeline_id> child = 1 } text = <rot_name> 
	SetScreenElementProps id = { <timeline_id> child = { 1 child = 0 } } text = <rot_name> 
	max_width = ( ( <Dur> - 0.10000000149 ) * 160 ) 
	truncate_string id = { <timeline_id> child = 1 } max_width = <max_width> 
	cat_update_right_arrow 
	cat_update_left_arrow 
ENDSCRIPT

SCRIPT increment_cat_rotation_angle_value 
	generic_menu_scroll_sideways_sound 
	IF GotParam reverse 
		Deg = ( <Deg> - 180 ) 
		IF ( 180 > <Deg> ) 
			Deg = 180 
		ENDIF 
	ELSE 
		Deg = ( <Deg> + 180 ) 
		IF ( <Deg> > 1440 ) 
			Deg = 1440 
		ENDIF 
	ENDIF 
	FormatText TextName = value_text "%i" i = <Deg> 
	SetScreenElementProps id = { menu_deg child = 3 } text = <value_text> 
	set_new_rot_values { rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	cat_update_right_arrow 
	update_rot_increment_params <...> 
ENDSCRIPT

SCRIPT increment_cat_rot_time_value 
	generic_menu_scroll_sideways_sound 
	IF GotParam change_dur 
		time_value = <Dur> 
	ELSE 
		IF GotParam change_start 
			time_value = <start> 
		ELSE 
			printf "Missing change_ param" 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam reverse 
		time_value = ( <time_value> - 0.10000000149 ) 
	ELSE 
		time_value = ( <time_value> + 0.10000000149 ) 
	ENDIF 
	IF ( 0 > <time_value> ) 
		time_value = 0 
	ENDIF 
	IF GotParam change_dur 
		IF ( 0.10000000149 > <time_value> ) 
			time_value = 0.10000000149 
		ENDIF 
		IF ( ( <time_value> + <start> ) > 3.00000000000 ) 
			time_value = ( 3.00000000000 - <start> ) 
		ENDIF 
		Dur = <time_value> 
		FormatText TextName = value_text "%i secs" i = <time_value> decimalplaces = 1 
		SetScreenElementProps id = { menu_dur child = 3 } text = <value_text> 
		update_scale_to_new_duration id = <timeline_id> duration = <time_value> 
		calculate_cat_score get_values 
		cat_update_right_arrow 
	ELSE 
		start = <time_value> 
		FormatText TextName = value_text "%i secs" i = <time_value> 
		SetScreenElementProps id = { menu_start child = 3 } text = <value_text> 
	ENDIF 
	RemoveParameter change_dur 
	RemoveParameter change_start 
	set_new_rot_values { rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	update_rot_increment_params <...> 
ENDSCRIPT

SCRIPT update_rot_direction_value 
	SWITCH <Axis> 
		CASE x 
			axis_text = "Flip" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Front" 
			ELSE 
				dir_text = "Back" 
			ENDIF 
		CASE y 
			axis_text = "Spin" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Backside" 
			ELSE 
				dir_text = "Frontside" 
			ENDIF 
		CASE z 
			axis_text = "Roll" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Heel Side" 
			ELSE 
				dir_text = "Toe Side" 
			ENDIF 
	ENDSWITCH 
	SetScreenElementProps id = { menu_axis child = 0 } text = <dir_text> 
ENDSCRIPT

SCRIPT update_rot_increment_params 
	RemoveParameter reverse 
	rot_values = { id = <id> timeline_id = <timeline_id> trick_index = <trick_index> rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	SetScreenElementProps { 
		id = edit_rot_vmenu 
		event_handlers = [ { pad_back edit_rot_done_script params = <rot_values> } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { id = menu_axis 
		event_handlers = [ { pad_right increment_axis_value params = <rot_values> } 
			{ pad_left increment_axis_value params = { <rot_values> reverse } } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { id = menu_deg 
		event_handlers = [ { pad_right increment_cat_rotation_angle_value params = <rot_values> cat_edit_item } 
			{ pad_left increment_cat_rotation_angle_value params = { <rot_values> cat_edit_item reverse } } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { id = menu_dur 
		event_handlers = [ { pad_right increment_cat_rot_time_value params = { <rot_values> change_dur } } 
			{ pad_left increment_cat_rot_time_value params = { <rot_values> change_dur reverse } } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { id = menu_done 
		event_handlers = [ { pad_choose edit_rot_done_script params = <rot_values> } 
		] 
		replace_handlers 
	} 
ENDSCRIPT

SCRIPT edit_rot_done_script 
	generic_menu_pad_back_sound 
	DoScreenElementMorph id = edit_rot_menu pos = PAIR(0.00000000000, 240.00000000000) time = 0.10000000149 
	DoScreenElementMorph id = timeline_info_anchor pos = PAIR(320.00000000000, 240.00000000000) time = 0.20000000298 
	wait 0.10000000149 seconds 
	IF ScreenElementExists id = timeline_fader 
		DestroyScreenElement id = timeline_fader 
	ENDIF 
	back_to_timeline 
ENDSCRIPT

SCRIPT get_rot_name 
	SWITCH <Axis> 
		CASE x 
			axis_text = "Flip" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Front" 
			ELSE 
				dir_text = "Back" 
			ENDIF 
		CASE y 
			axis_text = "Spin" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Backside" 
			ELSE 
				dir_text = "Frontside" 
			ENDIF 
		CASE z 
			axis_text = "Roll" 
			IF ( <deg_dir> = 0 ) 
				dir_text = "Heel Side" 
			ELSE 
				dir_text = "Toe Side" 
			ENDIF 
	ENDSWITCH 
	FormatText TextName = rot_name "%d %a" d = <dir_text> a = <axis_text> 
	RETURN rot_name = <rot_name> 
ENDSCRIPT

SCRIPT CAT_edit_animation_menu parent = cat_menu_anchor trick_index = 0 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF NOT GotParam no_new_values 
		get_CAT_param_values Skater = 0 trick_index = 0 
	ENDIF 
	get_CAT_anim_values { Skater = 0 trick_index = 0 anim_index = <anim_index> } 
	make_new_menu { 
		parent = <parent> 
		menu_id = edit_anim_menu 
		vmenu_id = edit_anim_vmenu 
		type = VMenu 
		pos = PAIR(72.00000000000, 50.00000000000) 
	} 
	IF NOT IsArray <trick> 
		params = ( <trick> . params ) 
	ELSE 
		params = ( ( <trick> [ 0 ] ) . params ) 
	ENDIF 
	anim_name = ( <params> . name ) 
	pos = PAIR(0.00000000000, 0.00000000000) 
	IF ( <pos> . PAIR(1.00000000000, 0.00000000000) > 280 ) 
		pos = ( ( <pos> . PAIR(1.00000000000, 0.00000000000) + -530 ) * PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 57.00000000000) ) 
	ELSE 
		pos = PAIR(-250.00000000000, 57.00000000000) 
	ENDIF 
	create_timeline_fader_box parent = cat_menu_anchor 
	RemoveParameter parent 
	add_edit_cat_helper_text 
	anim_values = { id = <id> timeline_id = <timeline_id> trick_index = <trick_index> anim_index = <anim_index> on = <on> trick = <trick> anim = <anim> Dur = <Dur> percent = <percent> blend = <blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards> } 
	SetScreenElementProps { 
		id = edit_anim_vmenu 
		event_handlers = [ { pad_back edit_anim_done_script params = { <anim_values> } } 
		] 
	} 
	SWITCH <trickType> 
		CASE 0 
			type_checksum = fliptrick 
			type_text = "fliptrick" 
		CASE 1 
			type_checksum = grab 
			type_text = "grab" 
		CASE 2 
			type_checksum = special 
			type_text = "special" 
		CASE 3 
			type_checksum = misc 
			type_text = "other" 
		CASE 4 
			type_checksum = generic 
			type_text = "sound" 
		DEFAULT 
			printf "CAT: bad trickType" 
			RETURN 
	ENDSWITCH 
	theme_menu_add_item no_highlight_bar text = "choose" extra_text = <type_text> id = menu_trick pad_choose_script = CAT_trick_list_menu pad_choose_params = { <anim_values> type = <type_checksum> } 
	SetScreenElementProps { 
		id = menu_trick 
		event_handlers = [ { pad_zac CAT_trick_list_menu params = { <anim_values> type = <type_checksum> } } 
		] 
	} 
	IF ( <trickType> = 4 ) 
	ELSE 
		cat_menu_add_number_item no_highlight_bar text = "duration" value = <Dur> decimalplaces = 1 trailingtext = " secs" id = menu_dur pad_right_script = increment_cat_anim_time_value params = { <anim_values> change_dur } 
		cat_menu_add_meter_item no_highlight_bar text = "start" value = <from> id = menu_from pad_choose_script = null_script pad_right_script = increment_cat_animation_from_value params = <anim_values> 
		cat_menu_add_meter_item no_highlight_bar text = "stop" value = <percent> id = menu_percent pad_choose_script = null_script pad_right_script = increment_cat_animation_percent_value params = <anim_values> 
		trick_got_idle trick = <trick> 
		IF ( <got_idle> = 1 ) 
			IF ( <hold> = 1 ) 
				hold_text = "yes" 
			ELSE 
				hold_text = "no" 
			ENDIF 
			cat_menu_add_number_item no_highlight_bar text = "hold time" value = <idletime> decimalplaces = 1 trailingtext = " secs" id = menu_idletime pad_right_script = increment_cat_anim_time_value params = { <anim_values> change_idle } 
			cat_menu_add_number_item no_highlight_bar text = "holdable" value = <hold_text> id = menu_hold pad_choose_script = null_script pad_right_script = increment_cat_animation_hold_value params = <anim_values> 
		ELSE 
			IF ( <backwards> = 1 ) 
				backwards_text = "on" 
			ELSE 
				backwards_text = "off" 
			ENDIF 
			cat_menu_add_number_item no_highlight_bar text = "backwards" value = <backwards_text> id = menu_backwards pad_choose_script = null_script pad_right_script = increment_cat_animation_backwards_value params = <anim_values> 
		ENDIF 
	ENDIF 
	theme_menu_add_item no_highlight_bar text = "done" id = menu_done pad_choose_script = edit_anim_done_script pad_choose_params = <anim_values> last_menu_item = 1 
	FireEvent type = unfocus target = timeline_vmenu 
	FireEvent type = focus target = edit_anim_menu 
	text_rgba = [ 100 100 100 100 ] 
	SWITCH <trickType> 
		CASE 0 
			sprite_rgba = flip_on_high 
		CASE 1 
			sprite_rgba = grab_on_high 
		CASE 2 
			sprite_rgba = spec_on_high 
		CASE 3 
			sprite_rgba = misc_on_high 
		CASE 4 
			sprite_rgba = gen_on_high 
	ENDSWITCH 
	IF ScreenElementExists id = { <timeline_id> child = 0 } 
		DoScreenElementMorph time = 0 id = { <timeline_id> child = 0 } rgba = <sprite_rgba> 
		DoScreenElementMorph time = 0 id = { <timeline_id> child = 1 } rgba = <text_rgba> 
	ENDIF 
	IF NOT GotParam no_animate 
		DoScreenElementMorph id = edit_anim_menu pos = PAIR(0.00000000000, 240.00000000000) 
		IF ( show_cat_trick_list = 0 ) 
			DoScreenElementMorph id = edit_anim_menu pos = PAIR(320.00000000000, 240.00000000000) time = 0.10000000149 
		ENDIF 
		DoScreenElementMorph id = timeline_info_anchor time = 0.20000000298 pos = ( timeline_info_anchor_offscreen_pos ) 
	ENDIF 
	IF GotParam back_from_submenu 
		back_to_edit_anim 
	ENDIF 
	IF ( show_cat_trick_list = 1 ) 
		FireEvent type = pad_zac target = { edit_anim_vmenu child = 1 } 
	ENDIF 
ENDSCRIPT

SCRIPT grab_all_anim_values 
	RETURN { 
		on = ( ( <animation_info> [ <anim_index> ] ) . on ) 
		trick = ( ( <animation_info> [ <anim_index> ] ) . trick ) 
		anim = ( ( <animation_info> [ <anim_index> ] ) . anim ) 
		Dur = ( ( <animation_info> [ <anim_index> ] ) . Dur ) 
		percent = ( ( <animation_info> [ <anim_index> ] ) . percent ) 
		blend = ( ( <animation_info> [ <anim_index> ] ) . blend ) 
		from = ( ( <animation_info> [ <anim_index> ] ) . from ) 
		trickType = ( ( <animation_info> [ <anim_index> ] ) . trickType ) 
		idletime = ( ( <animation_info> [ <anim_index> ] ) . idletime ) 
		start = ( ( <animation_info> [ <anim_index> ] ) . start ) 
		order = ( ( <animation_info> [ <anim_index> ] ) . order ) 
		hold = ( ( <animation_info> [ <anim_index> ] ) . hold ) 
		backwards = ( ( <animation_info> [ <anim_index> ] ) . backwards ) 
	} 
ENDSCRIPT

SCRIPT CAT_trick_list_menu parent = edit_anim_menu type = grab 
	FireEvent type = unfocus target = edit_anim_menu 
	make_new_menu { 
		parent = <parent> 
		menu_id = trick_menu 
		vmenu_id = trick_vmenu 
		scrolling_menu_id = trick_scrolling_menu 
		menu_title = <menu_title> 
		type = VScrollingMenu 
		dims = PAIR(200.00000000000, 135.00000000000) 
		pos = PAIR(580.00000000000, 110.00000000000) 
		no_alias 
	} 
	IF ( show_cat_trick_list = 0 ) 
		DoScreenElementMorph time = 0 id = trick_menu pos = PAIR(540.00000000000, 220.00000000000) 
		SetScreenElementProps { 
			id = trick_vmenu 
			event_handlers = [ { pad_back back_to_edit_anim } 
			] 
		} 
		add_cat_generic_helper_text 
	ELSE 
		SetScreenElementLock id = cat_menu_anchor off 
		SetScreenElementProps { 
			id = trick_vmenu 
			event_handlers = [ { pad_back abort_back_to_timeline } 
			] 
		} 
		create_helper_text { 
			parent = cat_menu_anchor 
			generic_helper_text 
		} 
	ENDIF 
	SWITCH <type> 
		CASE grab 
			add_trick_list_items array = cat_grab_tricks anim_index = <anim_index> timeline_id = <timeline_id> 
		CASE fliptrick 
			add_trick_list_items array = cat_flip_tricks anim_index = <anim_index> timeline_id = <timeline_id> 
		CASE special 
			add_trick_list_items array = cat_special_tricks anim_index = <anim_index> timeline_id = <timeline_id> 
		CASE misc 
			add_trick_list_items array = cat_misc_tricks anim_index = <anim_index> timeline_id = <timeline_id> 
		CASE generic 
			PauseStream 0 
			add_trick_list_items array = cat_generic_tricks anim_index = <anim_index> timeline_id = <timeline_id> sounds = sounds 
	ENDSWITCH 
	FireEvent type = unfocus target = edit_anim_menu 
	FireEvent type = focus target = trick_menu 
	IF ( show_cat_trick_list = 0 ) 
		DoScreenElementMorph time = 0.10000000149 id = trick_menu pos = PAIR(261.00000000000, 220.00000000000) 
		wait 0.05000000075 seconds 
		DoScreenElementMorph time = 0.10000000149 id = edit_anim_menu pos = PAIR(30.00000000000, 240.00000000000) 
		wait 0.05000000075 seconds 
		DoScreenElementMorph time = 0.05000000075 id = edit_anim_menu pos = PAIR(-120.00000000000, 240.00000000000) 
		DoScreenElementMorph time = 0.05000000075 id = trick_menu pos = PAIR(261.00000000000, 220.00000000000) 
	ELSE 
		DoScreenElementMorph id = edit_anim_menu pos = PAIR(-120.00000000000, 240.00000000000) 
		DoScreenElementMorph id = trick_menu pos = PAIR(-50.00000000000, 220.00000000000) 
		DoScreenElementMorph time = 0.15000000596 id = trick_menu pos = PAIR(261.00000000000, 220.00000000000) 
		Change show_cat_trick_list = 0 
	ENDIF 
ENDSCRIPT

SCRIPT back_to_edit_anim 
	FireEvent type = unfocus target = trick_menu 
	PauseStream 1 
	IF NOT GotParam no_focus 
		generic_menu_pad_back_sound 
	ENDIF 
	DoScreenElementMorph time = 0.15000000596 id = edit_anim_menu pos = PAIR(320.00000000000, 240.00000000000) 
	wait 0.15000000596 seconds 
	IF ScreenElementExists id = trick_menu 
		DoScreenElementMorph time = 0.15000000596 id = trick_menu pos = PAIR(580.00000000000, 220.00000000000) 
		wait 0.25000000000 seconds 
		DestroyScreenElement id = trick_menu 
	ENDIF 
	IF NOT GotParam no_focus 
		FireEvent type = focus target = edit_anim_menu 
	ENDIF 
ENDSCRIPT

SCRIPT abort_back_to_timeline 
	PauseStream 1 
	IF NOT GotParam no_focus 
		generic_menu_pad_back_sound 
	ENDIF 
	IF ScreenElementExists id = trick_menu 
		DoScreenElementMorph time = 0.15000000596 id = trick_menu pos = PAIR(880.00000000000, 220.00000000000) 
		DoScreenElementMorph id = timeline_info_anchor pos = PAIR(320.00000000000, 240.00000000000) time = 0.20000000298 
		wait 0.25000000000 seconds 
		DestroyScreenElement id = trick_menu 
	ENDIF 
	IF ScreenElementExists id = timeline_fader 
		DestroyScreenElement id = timeline_fader 
	ENDIF 
	back_to_timeline 
ENDSCRIPT

SCRIPT CAT_set_trick_struct_update 
	IF GotParam callback 
		<callback> 
	ENDIF 
	get_CAT_anim_values Skater = 0 trick_index = 0 anim_index = <anim_index> 
	trick = <new_trick> 
	calculate_anim_default_dur trick = <trick> anim_index = <anim_index> 
	trick_got_idle trick = <trick> 
	IF ( <got_idle> = 1 ) 
		idletime = 0 
		duration = ( <Dur> + <idletime> ) 
		idle_start = ( <Dur> / 2 ) 
	ELSE 
		duration = <Dur> 
	ENDIF 
	update_scale_to_new_duration id = <timeline_id> duration = <duration> idletime = <idletime> idle_start = <idle_start> 
	quick_set_anim_values <...> 
	update_all_anim_positions 
	calculate_cat_score get_values 
	RemoveParameter parent 
	IF NOT IsArray <trick> 
		params = ( <trick> . params ) 
	ELSE 
		params = ( ( <trick> [ 0 ] ) . params ) 
	ENDIF 
	anim_name = ( <params> . name ) 
	SetScreenElementProps id = { <timeline_id> child = 1 } text = <anim_name> 
	SetScreenElementProps id = { <timeline_id> child = { 1 child = 0 } } text = <anim_name> 
	max_width = ( ( <Dur> - 0.10000000149 ) * 160 ) 
	truncate_string id = { <timeline_id> child = 1 } max_width = <max_width> 
ENDSCRIPT

SCRIPT CAT_set_trick_struct 
	get_CAT_anim_values Skater = 0 trick_index = 0 anim_index = <anim_index> 
	trick = <new_trick> 
	calculate_anim_default_dur trick = <trick> anim_index = <anim_index> 
	trick_got_idle trick = <trick> 
	IF ( <got_idle> = 1 ) 
		idletime = 0 
		duration = ( <Dur> + <idletime> ) 
		idle_start = ( <Dur> / 2 ) 
	ELSE 
		duration = <Dur> 
	ENDIF 
	update_scale_to_new_duration id = <timeline_id> duration = <duration> idletime = <idletime> idle_start = <idle_start> 
	quick_set_anim_values <...> 
	update_all_anim_positions 
	calculate_cat_score get_values 
	back_to_edit_anim no_focus 
	RemoveParameter parent 
	CAT_edit_animation_menu <...> no_new_values no_animate 
	IF NOT IsArray <trick> 
		params = ( <trick> . params ) 
	ELSE 
		params = ( ( <trick> [ 0 ] ) . params ) 
	ENDIF 
	anim_name = ( <params> . name ) 
	SetScreenElementProps id = { <timeline_id> child = 1 } text = <anim_name> 
	SetScreenElementProps id = { <timeline_id> child = { 1 child = 0 } } text = <anim_name> 
	max_width = ( ( <Dur> - 0.10000000149 ) * 160 ) 
	truncate_string id = { <timeline_id> child = 1 } max_width = <max_width> 
ENDSCRIPT

SCRIPT toggle_anim_on_off 
	get_CAT_anim_values Skater = 0 trick_index = 0 anim_index = <anim_index> 
	IF GotParam Delete 
		on = 2 
	ELSE 
		IF ( <on> = 0 ) 
			calculate_cat_score get_time anims_only no_hidden 
			trick_got_idle trick = <trick> 
			IF ( <got_idle> = 1 ) 
				time = ( <time> + <start> + <Dur> + <idletime> ) 
			ELSE 
				time = ( <time> + <start> + <Dur> ) 
			ENDIF 
			IF ( ( 3.00000000000 > <time> ) | ( <time> = 3.00000000000 ) ) 
				on = 1 
				GetTags 
				focus_id = <id> 
				PlaySound copinghit3_11 pitch = 60 
			ELSE 
				generic_menu_buzzer_sound 
				RETURN 
			ENDIF 
		ELSE 
			IF ( <on> = 2 ) 
				on = 1 
				new_anim = 1 
				Change show_cat_trick_list = 1 
				SWITCH <type> 
					CASE fliptrick 
						trickType = 0 
						trick = trick_kickflip 
					CASE grab 
						trickType = 1 
						trick = trick_indy 
					CASE special 
						trickType = 2 
						trick = trick_the900 
					CASE misc 
						trickType = 3 
						trick = CATTrick_Handstand 
					CASE generic 
						trickType = 4 
						trick = CATSFX_StripClub 
					DEFAULT 
						"what the hell kinda trick is that?" 
				ENDSWITCH 
			ELSE 
				on = 0 
				GetTags 
				focus_id = <id> 
				PlaySound copinghit3_11 pitch = 60 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam new_anim 
		idletime = 0 
		percent = 1 
		blend = CAT_BLEND 
		from = 0 
		start = 0 
		calculate_anim_default_dur trick = <trick> anim_index = <anim_index> 
	ENDIF 
	quick_set_anim_values <...> 
	IF ( <trickType> = 4 ) 
		last_order = 6 
	ENDIF 
	create_cat_timeline { get_id = get_id anim_index = <anim_index> } 
	kill_start_key_binding 
	IF GotParam Delete 
		focus_cat_timeline 
		RETURN 
	ENDIF 
	IF NOT GotParam new_anim 
		FireEvent type = focus target = timeline_vmenu data = { child_id = <focus_id> } 
		SetScreenElementProps id = timeline_scrolling_menu reset_window_top 
	ELSE 
		FireEvent type = focus target = timeline_vmenu 
		IF ( <value> > 1 ) 
			BEGIN 
				FireEvent type = pad_down target = timeline_vmenu 
			REPEAT ( <value> -1 ) 
		ENDIF 
		FireEvent type = pad_zac target = { timeline_vmenu child = ( <value> -1 ) } 
		SetScreenElementProps id = timeline_scrolling_menu reset_window_top 
	ENDIF 
ENDSCRIPT

show_cat_trick_list = 0 
SCRIPT increment_cat_anim_time_value 
	printf "script increment_cat_anim_time_value" 
	generic_menu_scroll_sideways_sound 
	IF GotParam change_dur 
		printf "change_dur" 
		time_value = <Dur> 
	ELSE 
		IF GotParam change_idle 
			printf "change_idle" 
			time_value = <idletime> 
		ELSE 
			IF GotParam change_start 
				printf "change_start" 
				time_value = <start> 
			ELSE 
				printf "Missing change_ param" 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam reverse 
		time_value = ( <time_value> - 0.10000000149 ) 
	ELSE 
		calculate_cat_score get_time anims_only 
		IF ( <time> > 2.90000009537 ) 
			PlaySound GUI_buzzer01 pitch = 60 
			RETURN 
		ENDIF 
		time_value = ( <time_value> + 0.10000000149 ) 
	ENDIF 
	IF ( 0 > <time_value> ) 
		time_value = 0.00000000000 
	ENDIF 
	IF ( <time_value> > 3.00000000000 ) 
		time_value = 3.00000000000 
	ENDIF 
	IF GotParam change_dur 
		IF ( 0.10000000149 > <time_value> ) 
			time_value = 0.10000000149 
		ENDIF 
		Dur = <time_value> 
		FormatText TextName = value_text "%i secs" i = <time_value> decimalplaces = 1 
		SetScreenElementProps id = { menu_dur child = 3 } text = <value_text> 
		cat_update_right_arrow 
		trick_got_idle trick = <trick> 
		IF ( <got_idle> = 1 ) 
			duration = ( <time_value> + <idletime> ) 
			idle_start = ( <time_value> / 2 ) 
		ELSE 
			duration = <time_value> 
		ENDIF 
		update_scale_to_new_duration id = <timeline_id> duration = <duration> idletime = <idletime> idle_start = <idle_start> 
	ELSE 
		IF GotParam change_start 
			start = <time_value> 
			FormatText TextName = value_text "%i secs" i = <time_value> 
			SetScreenElementProps id = { menu_start child = 3 } text = <value_text> 
		ELSE 
			IF ( <hold> = 1 ) 
				IF ( <time_value> = 0 ) 
					hold = 0 
				ENDIF 
			ENDIF 
			idletime = <time_value> 
			FormatText TextName = value_text "%i secs" i = <time_value> decimalplaces = 1 
			SetScreenElementProps id = { menu_idletime child = 3 } text = <value_text> 
			cat_update_right_arrow 
			IF ( <hold> = 1 ) 
				hold_text = "yes" 
			ELSE 
				hold_text = "no" 
			ENDIF 
			SetScreenElementProps id = { menu_hold child = 3 } text = <hold_text> 
			GetStackedScreenElementPos x id = { menu_hold child = 3 } offset = PAIR(3.00000000000, 2.00000000000) 
			DoScreenElementMorph id = { menu_hold child = 5 } pos = <pos> 
			trick_got_idle trick = <trick> 
			IF ( <got_idle> = 1 ) 
				duration = ( <time_value> + <Dur> ) 
				idle_start = ( <Dur> / 2 ) 
			ELSE 
				printf "CAT: THIS SHOULD NEVER EVER HAPPEN" 
				duration = <Dur> 
			ENDIF 
			update_scale_to_new_duration id = <timeline_id> duration = <duration> idletime = <time_value> idle_start = <idle_start> 
		ENDIF 
	ENDIF 
	RemoveParameter change_dur 
	RemoveParameter change_idle 
	quick_set_anim_values <...> 
	update_all_anim_positions 
	calculate_cat_score get_values 
	update_anim_increment_params <...> 
ENDSCRIPT

SCRIPT increment_cat_animation_blend_value 
	printf "script increment_cat_animation_blend_value" 
	generic_menu_scroll_sideways_sound 
	IF GotParam reverse 
		blend = ( <blend> - 0.00999999978 ) 
	ELSE 
		blend = ( <blend> + 0.00999999978 ) 
	ENDIF 
	IF ( <blend> > 0.50000000000 ) 
		blend = 0.50000000000 
	ENDIF 
	IF ( 0 > <blend> ) 
		blend = 0.00000000000 
	ENDIF 
	blend_int = ( <blend> * 100 ) 
	CastToInteger blend_int 
	FormatText TextName = value_text "%i \\%" i = <blend_int> 
	SetScreenElementProps id = { menu_blend child = 3 } text = <value_text> 
	meter_scale = ( <blend> * PAIR(5.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
	DoScreenElementMorph id = { menu_blend child = 6 } scale = <meter_scale> 
	quick_set_anim_values <...> 
	update_anim_increment_params <...> 
ENDSCRIPT

SCRIPT increment_cat_animation_from_value 
	trick_got_idle trick = <trick> 
	generic_menu_scroll_sideways_sound 
	IF GotParam reverse 
		from = ( <from> - 0.00999999978 ) 
	ELSE 
		from = ( <from> + 0.00999999978 ) 
	ENDIF 
	IF ( <got_idle> = 1 ) 
		IF ( <from> > 0.50000000000 ) 
			from = 0.50000000000 
		ENDIF 
	ENDIF 
	IF ( <from> > ( <percent> - 0.20000000298 ) ) 
		from = ( <percent> - 0.20000000298 ) 
	ENDIF 
	IF ( 0 > <from> ) 
		from = 0 
	ENDIF 
	from_int = ( <from> * 100 ) 
	CastToInteger from_int 
	FormatText TextName = value_text "%i \\%" i = <from_int> 
	SetScreenElementProps id = { menu_from child = 3 } text = <value_text> 
	meter_scale = ( <from> * PAIR(5.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
	DoScreenElementMorph id = { menu_from child = 6 } scale = <meter_scale> 
	quick_set_anim_values <...> 
	update_anim_increment_params <...> 
ENDSCRIPT

SCRIPT increment_cat_animation_percent_value 
	generic_menu_scroll_sideways_sound 
	trick_got_idle trick = <trick> 
	IF GotParam reverse 
		percent = ( <percent> - 0.00999999978 ) 
	ELSE 
		percent = ( <percent> + 0.00999999978 ) 
	ENDIF 
	IF ( <percent> > 1 ) 
		percent = 1 
	ENDIF 
	IF ( <got_idle> = 1 ) 
		IF ( 0.50000000000 > <percent> ) 
			percent = 0.50000000000 
		ENDIF 
	ENDIF 
	IF ( <from> > ( <percent> - 0.20000000298 ) ) 
		percent = ( <from> + 0.20000000298 ) 
	ENDIF 
	percent_int = ( <percent> * 100 ) 
	CastToInteger percent_int 
	FormatText TextName = value_text "%i \\%" i = <percent_int> 
	SetScreenElementProps id = { menu_percent child = 3 } text = <value_text> 
	meter_scale = ( <percent> * PAIR(5.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
	DoScreenElementMorph id = { menu_percent child = 6 } scale = <meter_scale> 
	quick_set_anim_values <...> 
	update_anim_increment_params <...> 
ENDSCRIPT

SCRIPT increment_cat_animation_order_value 
	IF NOT GotParam quick_sound_insert 
		StopSound ThisMenuSelectSound 
		PlaySound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound 
	ENDIF 
	GetCreateATrickAnimations Skater = 0 trick_index = 0 
	grab_all_anim_values { animation_info = <animation_info> anim_index = <anim_index> } 
	printf "initial order = %i" i = <order> 
	IF GotParam reverse 
		IF NOT ( <order> = 1 ) 
			new_order = ( <order> - 1 ) 
			GetArraySize <animation_info> 
			index = 0 
			get_out = 0 
			BEGIN 
				BEGIN 
					criteria_met = 0 
					IF ( ( ( <animation_info> [ <index> ] ) . order ) = <new_order> ) 
						IF ( ( ( <animation_info> [ <index> ] ) . on ) = 1 ) 
							IF NOT ( ( ( <animation_info> [ <index> ] ) . trickType ) = 4 ) 
								criteria_met = 1 
							ENDIF 
						ENDIF 
						IF ( <criteria_met> = 1 ) 
							SetArrayElement { ArrayName = animation_info 
								index = <index> 
								newvalue = { order = <order> 
									on = ( ( <animation_info> [ <index> ] ) . on ) 
									trick = ( ( <animation_info> [ <index> ] ) . trick ) 
									anim = ( ( <animation_info> [ <index> ] ) . anim ) 
									Dur = ( ( <animation_info> [ <index> ] ) . Dur ) 
									percent = ( ( <animation_info> [ <index> ] ) . percent ) 
									blend = ( ( <animation_info> [ <index> ] ) . blend ) 
									from = ( ( <animation_info> [ <index> ] ) . from ) 
									trickType = ( ( <animation_info> [ <index> ] ) . trickType ) 
									idletime = ( ( <animation_info> [ <index> ] ) . idletime ) 
									start = ( ( <animation_info> [ <index> ] ) . start ) 
									hold = ( ( <animation_info> [ <index> ] ) . hold ) 
									backwards = ( ( <animation_info> [ <index> ] ) . backwards ) 
								} 
							} 
							get_out = 1 
							BREAK 
						ELSE 
							IF ( <new_order> > 1 ) 
								new_order = ( <new_order> - 1 ) 
								BREAK 
							ELSE 
								RETURN 
							ENDIF 
						ENDIF 
					ENDIF 
					index = ( <index> + 1 ) 
					IF ( <index> = <array_size> ) 
						printf "what the hell happened here?" 
						RETURN 
					ENDIF 
				REPEAT <array_size> 
				IF ( <get_out> = 1 ) 
					BREAK 
				ELSE 
					index = 0 
				ENDIF 
			REPEAT <array_size> 
			order = <new_order> 
		ELSE 
			RETURN 
		ENDIF 
	ELSE 
		IF NOT ( <order> = 6 ) 
			new_order = ( <order> + 1 ) 
			GetArraySize <animation_info> 
			index = 0 
			get_out = 0 
			BEGIN 
				BEGIN 
					IF ( ( ( <animation_info> [ <index> ] ) . order ) = <new_order> ) 
						IF ( ( ( <animation_info> [ <index> ] ) . on ) = 1 ) 
							SetArrayElement { ArrayName = animation_info 
								index = <index> 
								newvalue = { order = <order> 
									on = ( ( <animation_info> [ <index> ] ) . on ) 
									trick = ( ( <animation_info> [ <index> ] ) . trick ) 
									anim = ( ( <animation_info> [ <index> ] ) . anim ) 
									Dur = ( ( <animation_info> [ <index> ] ) . Dur ) 
									percent = ( ( <animation_info> [ <index> ] ) . percent ) 
									blend = ( ( <animation_info> [ <index> ] ) . blend ) 
									from = ( ( <animation_info> [ <index> ] ) . from ) 
									trickType = ( ( <animation_info> [ <index> ] ) . trickType ) 
									idletime = ( ( <animation_info> [ <index> ] ) . idletime ) 
									start = ( ( <animation_info> [ <index> ] ) . start ) 
									hold = ( ( <animation_info> [ <index> ] ) . hold ) 
									backwards = ( ( <animation_info> [ <index> ] ) . backwards ) 
								} 
							} 
							get_out = 1 
							BREAK 
						ELSE 
							IF ( 6 > <new_order> ) 
								new_order = ( <new_order> + 1 ) 
								BREAK 
							ELSE 
								RETURN 
							ENDIF 
						ENDIF 
					ENDIF 
					index = ( <index> + 1 ) 
					IF ( <index> = <array_size> ) 
						printf "what the hell happened here?" 
						RETURN 
					ENDIF 
				REPEAT <array_size> 
				IF ( <get_out> = 1 ) 
					BREAK 
				ELSE 
					index = 0 
				ENDIF 
			REPEAT <array_size> 
			order = <new_order> 
		ELSE 
			RETURN 
		ENDIF 
	ENDIF 
	printf "final order = %i" i = <order> 
	update_animation_info_array <...> 
	SetCreateATrickAnimations { Skater = 0 trick_index = 0 animation_info = <animation_info> } 
	IF GotParam quick_sound_insert 
		RETURN order = <order> 
	ENDIF 
	update_all_anim_positions animation_info = <animation_info> 
ENDSCRIPT

SCRIPT increment_cat_animation_hold_value 
	generic_menu_scroll_sideways_sound 
	GetCreateATrickAnimations Skater = 0 trick_index = 0 
	IF ( <hold> = 1 ) 
		hold = 0 
	ELSE 
		hold = 1 
		GetArraySize <animation_info> 
		index = 0 
		BEGIN 
			SetArrayElement ArrayName = animation_info index = <index> newvalue = { hold = 0 
				on = ( ( <animation_info> [ <index> ] ) . on ) 
				trick = ( ( <animation_info> [ <index> ] ) . trick ) 
				anim = ( ( <animation_info> [ <index> ] ) . anim ) 
				Dur = ( ( <animation_info> [ <index> ] ) . Dur ) 
				percent = ( ( <animation_info> [ <index> ] ) . percent ) 
				blend = ( ( <animation_info> [ <index> ] ) . blend ) 
				from = ( ( <animation_info> [ <index> ] ) . from ) 
				trickType = ( ( <animation_info> [ <index> ] ) . trickType ) 
				idletime = ( ( <animation_info> [ <index> ] ) . idletime ) 
				start = ( ( <animation_info> [ <index> ] ) . start ) 
				order = ( ( <animation_info> [ <index> ] ) . order ) 
				backwards = ( ( <animation_info> [ <index> ] ) . backwards ) 
			} 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	IF ( <hold> = 1 ) 
		IF ( <idletime> = 0 ) 
			idletime = 0.10000000149 
			update_scale_to_new_duration { id = <timeline_id> 
				duration = ( <Dur> + <idletime> ) 
				idletime = <idletime> 
				idle_start = ( <Dur> / 2 ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <hold> = 1 ) 
		hold_text = "yes" 
	ELSE 
		hold_text = "no" 
	ENDIF 
	FormatText TextName = idle_text "%i secs" i = <idletime> decimalplaces = 1 
	SetScreenElementProps id = { menu_hold child = 3 } text = <hold_text> 
	GetStackedScreenElementPos x id = { menu_hold child = 3 } offset = PAIR(3.00000000000, 2.00000000000) 
	DoScreenElementMorph id = { menu_hold child = 5 } pos = <pos> 
	SetScreenElementProps id = { menu_idletime child = 3 } text = <idle_text> 
	quick_set_anim_values <...> 
	update_anim_increment_params <...> 
ENDSCRIPT

SCRIPT increment_cat_animation_backwards_value 
	generic_menu_scroll_sideways_sound 
	GetCreateATrickAnimations Skater = 0 trick_index = 0 
	IF ( <backwards> = 1 ) 
		backwards_text = "off" 
		<backwards> = 0 
	ELSE 
		backwards_text = "on" 
		<backwards> = 1 
	ENDIF 
	SetScreenElementProps id = { menu_backwards child = 3 } text = <backwards_text> 
	quick_set_anim_values <...> 
	update_anim_increment_params <...> 
ENDSCRIPT

SCRIPT calculate_anim_default_dur 
	IF NOT IsArray <trick> 
		params = ( <trick> . params ) 
	ELSE 
		params = ( ( <trick> [ 0 ] ) . params ) 
	ENDIF 
	IF StructureContains structure = <params> anim 
		anim = ( <params> . anim ) 
	ELSE 
		anim = ( <params> . initanim ) 
	ENDIF 
	speed = ( <params> . speed ) 
	BackwardsAnim = ( <params> . BackwardsAnim ) 
	IF NOT GotParam speed 
		speed = 1.00000000000 
	ENDIF 
	Skater : GetAnimLength anim = <anim> 
	IF GotParam BackwardsAnim 
		length1 = <length> 
		Skater : GetAnimLength anim = <BackwardsAnim> 
	ENDIF 
	trick_got_idle trick = <trick> 
	IF ( <got_idle> = 0 ) 
		Dur = ( <length> / <speed> ) 
	ELSE 
		IF GotParam BackwardsAnim 
			Dur = ( ( <length1> / <speed> ) + ( <length> / <speed> ) ) 
		ELSE 
			Dur = ( ( <length> / <speed> ) * 2 ) 
		ENDIF 
	ENDIF 
	IF StructureContains structure = <params> sound 
		Dur = 0.50000000000 
	ENDIF 
	printf "dur before = %i" i = <Dur> 
	Dur = ( <Dur> * 10.00000000000 ) 
	Dur = ( <Dur> + 0.50000000000 ) 
	CastToInteger Dur 
	Dur = ( <Dur> / 10.00000000000 ) 
	printf "dur after = %i" i = <Dur> 
	IF ( ( <Dur> = 0 ) | ( 0 > <Dur> ) ) 
		Dur = 0.10000000149 
	ENDIF 
	IF ( <Dur> > 3 ) 
		Dur = 3.00000000000 
	ENDIF 
	calculate_cat_score get_time minus = <anim_index> anims_only 
	IF ( <Dur> > ( 3.00000000000 - <time> ) ) 
		Dur = ( 3.00000000000 - <time> ) 
	ENDIF 
	printf "dur after cut = %i" i = <Dur> 
	RETURN Dur = <Dur> 
ENDSCRIPT

SCRIPT update_anim_increment_params 
	RemoveParameter reverse 
	anim_values = { id = <id> timeline_id = <timeline_id> trick_index = <trick_index> anim_index = <anim_index> on = <on> trick = <trick> anim = <anim> Dur = <Dur> percent = <percent> blend = <blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards> } 
	SetScreenElementProps { 
		id = edit_anim_vmenu 
		event_handlers = [ { pad_back edit_anim_done_script params = <anim_values> } 
		] 
		replace_handlers 
	} 
	IF ScreenElementExists id = menu_percent 
		SetScreenElementProps { id = menu_percent 
			event_handlers = [ { pad_right increment_cat_animation_percent_value params = <anim_values> } 
				{ pad_left increment_cat_animation_percent_value params = { <anim_values> reverse } } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF ScreenElementExists id = menu_blend 
		SetScreenElementProps { id = menu_blend 
			event_handlers = [ { pad_right increment_cat_animation_blend_value params = <anim_values> } 
				{ pad_left increment_cat_animation_blend_value params = { <anim_values> reverse } } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF ScreenElementExists id = menu_from 
		SetScreenElementProps { id = menu_from 
			event_handlers = [ { pad_right increment_cat_animation_from_value params = <anim_values> } 
				{ pad_left increment_cat_animation_from_value params = { <anim_values> reverse } } 
			] 
			replace_handlers 
		} 
	ENDIF 
	SetScreenElementProps { id = menu_dur 
		event_handlers = [ { pad_right increment_cat_anim_time_value params = { <anim_values> change_dur } } 
			{ pad_left increment_cat_anim_time_value params = { <anim_values> change_dur reverse } } 
		] 
		replace_handlers 
	} 
	IF ScreenElementExists id = menu_idletime 
		SetScreenElementProps { id = menu_idletime 
			event_handlers = [ { pad_right increment_cat_anim_time_value params = { <anim_values> change_idle } } 
				{ pad_left increment_cat_anim_time_value params = { <anim_values> change_idle reverse } } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF ScreenElementExists id = menu_hold 
		SetScreenElementProps { id = menu_hold 
			event_handlers = [ { pad_right increment_cat_animation_hold_value params = <anim_values> } 
				{ pad_left increment_cat_animation_hold_value params = { <anim_values> reverse } } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF ScreenElementExists id = menu_backwards 
		SetScreenElementProps { id = menu_backwards 
			event_handlers = [ { pad_right increment_cat_animation_backwards_value params = <anim_values> } 
				{ pad_left increment_cat_animation_backwards_value params = { <anim_values> reverse } } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF ScreenElementExists id = menu_done 
		SetScreenElementProps { id = menu_done 
			event_handlers = [ { pad_choose edit_anim_done_script params = <anim_values> } 
			] 
			replace_handlers 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT edit_anim_done_script 
	generic_menu_pad_back_sound 
	quick_set_anim_values <...> 
	DoScreenElementMorph id = edit_anim_menu pos = PAIR(0.00000000000, 240.00000000000) time = 0.10000000149 
	DoScreenElementMorph id = timeline_info_anchor time = 0.20000000298 pos = PAIR(320.00000000000, 240.00000000000) 
	wait 0.10000000149 seconds 
	IF ScreenElementExists id = top_bar_anchor 
		DestroyScreenElement id = top_bar_anchor 
	ENDIF 
	IF ScreenElementExists id = submenu_title_anchor 
		DestroyScreenElement id = submenu_title_anchor 
	ENDIF 
	IF ScreenElementExists id = timeline_fader 
		DestroyScreenElement id = timeline_fader 
	ENDIF 
	back_to_timeline 
ENDSCRIPT

SCRIPT update_animation_info_array 
	SetArrayElement ArrayName = animation_info index = <anim_index> newvalue = { on = <on> trick = <trick> anim = <anim> Dur = <Dur> percent = <percent> blend = <blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards> } 
	RETURN { animation_info = <animation_info> } 
ENDSCRIPT

SCRIPT create_cat_timeline pos = PAIR(23.00000000000, 260.00000000000) parent = cat_menu_anchor internal_just = [ left top ] just = [ center center ] trick = 0 
	IF ScreenElementExists id = timeline_anchor 
		DestroyScreenElement id = timeline_anchor 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = timeline_anchor 
		just = [ left top ] 
		internal_just = [ left top ] 
		pos = <pos> 
		dims = PAIR(640.00000000000, 300.00000000000) 
		focusable_child = timeline_vmenu 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = timeline_anchor 
		id = timeline_scrolling_menu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		dims = PAIR(640.00000000000, 137.00000000000) 
		internal_just = [ left top ] 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = timeline_scrolling_menu 
		id = timeline_vmenu 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
		padding_scale = 1.14999997616 
		internal_just = [ left top ] 
		dont_allow_wrap 
		heap = ( cat_heap ) 
	} 
	SetScreenElementProps { 
		id = timeline_vmenu 
		event_handlers = [ { pad_back create_CAT_pause_menu params = { from_timeline } } 
			{ pad_start create_CAT_pause_menu params = { from_timeline } } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_alt toggle_can_spin params = { } } 
		] 
	} 
	IF GotParam load 
		get_CAT_param_values trick_index = <load> 
		SetCreateATrickParams { Skater = 0 
			trick_index = 0 
			other_params = { name = <name> 
				rotateafter = <rotateafter> 
				full = 1 
				can_spin = <can_spin> 
			} 
			rotation_info = <rotation_info> 
			animation_info = <animation_info> 
		} 
	ELSE 
		IF GotParam new 
			get_new_cat_values 
			SetCreateATrickParams { Skater = 0 
				trick_index = 0 
				other_params = { name = <name> 
					rotateafter = <rotateafter> 
					full = 1 
					can_spin = 1 
				} 
				rotation_info = <rotation_info> 
				animation_info = <animation_info> 
			} 
		ENDIF 
	ENDIF 
	RemoveParameter rotation_info 
	RemoveParameter animation_info 
	index = 0 
	BEGIN 
		FormatText ChecksumName = row_id "timeline_row%i" i = <index> 
		create_CAT_timeline_row row_id = <row_id> 
		index = ( <index> + 1 ) 
	REPEAT 13 
	IF NOT ( ( GotParam name ) | ( GotParam can_spin ) ) 
		get_CAT_other_param_values trick_index = 0 
	ENDIF 
	create_timeline_trick_info { 
		name = <name> 
		can_spin = <can_spin> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		id = timeline_scrubber 
		texture = white2 
		rgba = [ 60 60 60 100 ] 
		just = [ center top ] 
		pos = PAIR(0.00000000000, -16.00000000000) 
		scale = PAIR(0.50000000000, 19.00000000000) 
		z_priority = 101 
		alpha = 0 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = timeline_anchor 
		text = "0" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ center center ] 
		pos = PAIR(0.00000000000, -12.00000000000) 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 50 ] 
		just = [ center top ] 
		pos = PAIR(0.00000000000, -16.00000000000) 
		scale = PAIR(1.00000000000, 38.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 30 ] 
		just = [ center top ] 
		pos = PAIR(100.00000000000, 0.00000000000) 
		scale = PAIR(1.00000000000, 34.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = timeline_anchor 
		text = "1" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ center center ] 
		pos = PAIR(200.00000000000, -12.00000000000) 
		z_priority = -1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 50 ] 
		just = [ center top ] 
		pos = PAIR(200.00000000000, -16.00000000000) 
		scale = PAIR(1.00000000000, 38.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 30 ] 
		just = [ center top ] 
		pos = PAIR(300.00000000000, 0.00000000000) 
		scale = PAIR(1.00000000000, 34.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = timeline_anchor 
		text = "2" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ center center ] 
		pos = PAIR(400.00000000000, -12.00000000000) 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 50 ] 
		just = [ center top ] 
		pos = PAIR(400.00000000000, -16.00000000000) 
		scale = PAIR(1.00000000000, 38.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 30 ] 
		just = [ center top ] 
		pos = PAIR(500.00000000000, 0.00000000000) 
		scale = PAIR(1.00000000000, 34.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = timeline_anchor 
		text = "3" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ center center ] 
		pos = PAIR(600.00000000000, -12.00000000000) 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_anchor 
		texture = black 
		rgba = [ 0 0 0 50 ] 
		just = [ center top ] 
		pos = PAIR(600.00000000000, -16.00000000000) 
		scale = PAIR(1.00000000000, 38.00000000000) 
		z_priority = -4 
		heap = ( cat_heap ) 
	} 
	calculate_cat_score get_values 
	fill_timeline { 
		get_id = <get_id> 
		anim_index = <anim_index> 
		rot_index = <rot_index> 
		dont_focus_timeline = <dont_focus_timeline> 
	} 
	IF GotParam return_val 
		RETURN value = <return_val> 
	ENDIF 
ENDSCRIPT

SCRIPT create_timeline_trick_info item_dims = PAIR(150.00000000000, 20.00000000000) 
	CreateScreenElement { 
		type = ContainerElement 
		id = timeline_info_anchor 
		parent = timeline_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		heap = ( cat_heap ) 
	} 
	anchor_id = timeline_info_anchor 
	IF ( <name> = "" ) 
		name = "CREATED TRICK" 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_info_anchor 
		id = cat_timeline_name_bar 
		texture = cat_bar 
		rgba = [ 128 128 128 68 ] 
		just = [ left top ] 
		scale = PAIR(75.00000000000, 1.10000002384) 
		pos = PAIR(0.00000000000, -238.00000000000) 
		z_priority = -1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = timeline_info_anchor 
		id = cat_timeline_name 
		text = <name> 
		font = testtitle 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = PAIR(18.00000000000, -241.00000000000) 
		z_priority = 1 
		scale = 1.20000004768 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = timeline_info_anchor 
		texture = cat_bar 
		rgba = [ 50 50 50 100 ] 
		just = [ left top ] 
		scale = PAIR(75.00000000000, 1.10000002384) 
		pos = PAIR(0.00000000000, -218.00000000000) 
		z_priority = -1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		text = "Points" 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(20.00000000000, -219.00000000000) 
		alpha = 0.80000001192 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = <id> x offset = PAIR(5.00000000000, -1.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_timeline_score 
		text = "" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = <pos> 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		text = "Spin" 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(180.00000000000, -219.00000000000) 
		alpha = 0.80000001192 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = <id> x offset = PAIR(0.00000000000, 0.00000000000) 
	IF ( ( GLOBAL_CtrlLayout ) = 0 ) 
		spin_toggle_text = "(\\bq)" 
	ELSE 
		spin_toggle_text = "(\\bg)" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		text = <spin_toggle_text> 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = <pos> 
		alpha = 0.80000001192 
		z_priority = 1 
		scale = 0.80000001192 
		heap = ( cat_heap ) 
	} 
	IF ( <can_spin> = 1 ) 
		spin_text = "on" 
	ELSE 
		spin_text = "off" 
	ENDIF 
	GetStackedScreenElementPos id = <id> x offset = PAIR(5.00000000000, -1.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_timeline_spin 
		text = <spin_text> 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = <pos> 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		text = "Rotations" 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(310.00000000000, -219.00000000000) 
		alpha = 0.80000001192 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = <id> x offset = PAIR(5.00000000000, -1.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_rots_used 
		text = "" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = <pos> 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = cat_rots_used x 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_slash_rots 
		text = "/6" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = <pos> 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		text = "Tricks" 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(470.00000000000, -219.00000000000) 
		alpha = 0.80000001192 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = <id> x offset = PAIR(5.00000000000, -1.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_anims_used 
		text = "" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = <pos> 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = cat_anims_used x 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_slash_anims 
		text = "/6" 
		font = dialog 
		rgba = [ 100 100 100 50 ] 
		just = [ left top ] 
		pos = <pos> 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
ENDSCRIPT

SCRIPT create_cat_pause_trick_info { 
		item_dims = PAIR(150.00000000000, 20.00000000000) 
		parent = current_menu_anchor 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		id = timeline_info_anchor 
		parent = <parent> 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(760.00000000000, 260.00000000000) 
		heap = ( cat_heap ) 
		z_priority = 2000 
	} 
	anchor_id = timeline_info_anchor 
	IF ( <name> = "" ) 
		name = "CREATED TRICK" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = timeline_info_anchor 
		id = cat_timeline_name 
		text = <name> 
		font = bebas 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		alpha = 0.80000001192 
		just = [ left top ] 
		pos = PAIR(40.00000000000, 10.00000000000) 
		scale = 0.30000001192 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		text = "POINTS:" 
		font = bebas 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(40.00000000000, 35.00000000000) 
		scale = 0.20000000298 
		alpha = 0.80000001192 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos id = <id> x offset = PAIR(5.00000000000, -1.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		id = cat_timeline_score 
		text = "" 
		font = bebas 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		alpha = 0.80000001192 
		just = [ left top ] 
		pos = <pos> 
		scale = 0.20000000298 
		heap = ( cat_heap ) 
	} 
ENDSCRIPT

SCRIPT focus_cat_timeline 
	IF ScreenElementExists id = createatrick_menu 
		FireEvent type = unfocus target = createatrick_menu 
	ENDIF 
	FireEvent type = focus target = timeline_vmenu 
	add_timeline_helper_text 
ENDSCRIPT

SCRIPT create_CAT_timeline_row { focus_script = dont_focus_timeline_item 
		unfocus_script = null_script 
		pad_choose_script = nullscript 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = timeline_vmenu 
		id = <row_id> 
		internal_just = [ left top ] 
		dims = PAIR(640.00000000000, 20.00000000000) 
		event_handlers = [ 
			{ focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
		] 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <row_id> 
		texture = cat_bar 
		rgba = [ 128 128 128 88 ] 
		just = [ left top ] 
		scale = PAIR(75.00000000000, 1.10000002384) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		z_priority = -5 
		heap = ( cat_heap ) 
	} 
ENDSCRIPT

SCRIPT dont_focus_timeline_item 
	GetTags 
	FireEvent target = timeline_vmenu type = pad_up 
ENDSCRIPT

SCRIPT fill_timeline 
	Change timeline_has_no_items = 1 
	get_CAT_param_values trick_index = 0 
	GetArraySize <rotation_info> 
	total = 0 
	index = 0 
	BEGIN 
		get_rot_name Axis = ( <rotation_info> [ <index> ] . Axis ) deg_dir = ( <rotation_info> [ <index> ] . deg_dir ) 
		IF ( <rotation_info> [ <index> ] . on = 1 ) 
			make_cat_timeline_item { type = rot 
				rot_index = <index> 
				text = <rot_name> 
				time = ( <rotation_info> [ <index> ] . start ) 
				duration = ( <rotation_info> [ <index> ] . Dur ) 
				pad_choose_script = CAT_edit_rotation_menu 
				pad_choose_params = { rot_index = <index> trick_index = 0 } 
			} 
			total = ( <total> + 1 ) 
		ENDIF 
		IF ( <rotation_info> [ <index> ] . on = 0 ) 
			make_cat_timeline_item { type = rot 
				rot_index = <index> 
				off 
				text = <rot_name> 
				time = ( <rotation_info> [ <index> ] . start ) 
				duration = ( <rotation_info> [ <index> ] . Dur ) 
				pad_choose_script = CAT_edit_rotation_menu 
				pad_choose_params = { rot_index = <index> trick_index = 0 } 
			} 
			total = ( <total> + 1 ) 
		ENDIF 
		IF GotParam get_id 
			IF GotParam rot_index 
				IF ( <index> = <rot_index> ) 
					return_val = <total> 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	GetArraySize <animation_info> 
	get_anim_order animation_info = <animation_info> array_size = <array_size> 
	index = 0 
	count = 0 
	time_passed = 0 
	BEGIN 
		index = ( <anim_order> [ <count> ] ) 
		trick = ( ( <animation_info> [ <index> ] ) . trick ) 
		IF NOT IsArray <trick> 
			params = ( <trick> . params ) 
		ELSE 
			params = ( ( <trick> [ 0 ] ) . params ) 
		ENDIF 
		anim_name = ( <params> . name ) 
		FormatText ChecksumName = anim_id "anim%i" i = <index> 
		trick_got_idle trick = ( <animation_info> [ <index> ] . trick ) 
		IF ( <got_idle> = 1 ) 
			duration = ( <animation_info> [ <index> ] . Dur + <animation_info> [ <index> ] . idletime ) 
			idletime = ( <animation_info> [ <index> ] . idletime ) 
			idle_start = ( <animation_info> [ <index> ] . Dur / 2 ) 
		ELSE 
			duration = ( <animation_info> [ <index> ] . Dur ) 
		ENDIF 
		IF ( <animation_info> [ <index> ] . on = 1 ) 
			time_passed = ( <time_passed> + ( <animation_info> [ <index> ] . start ) ) 
			make_cat_timeline_item { type = anim 
				id = <anim_id> 
				anim_index = <index> 
				text = <anim_name> 
				time = <time_passed> 
				duration = <duration> 
				idletime = <idletime> 
				idle_start = <idle_start> 
				got_idle = <got_idle> 
				pad_choose_script = CAT_edit_animation_menu 
				pad_choose_params = { anim_index = <index> trick_index = 0 } 
				trickType = ( <animation_info> [ <index> ] . trickType ) 
			} 
			IF NOT ( <animation_info> [ <index> ] . trickType = 4 ) 
				IF ( <got_idle> = 1 ) 
					time_passed = ( <time_passed> + ( <animation_info> [ <index> ] . Dur ) + ( <animation_info> [ <index> ] . idletime ) ) 
				ELSE 
					time_passed = ( <time_passed> + ( <animation_info> [ <index> ] . Dur ) ) 
				ENDIF 
			ELSE 
				time_passed = ( <time_passed> - ( <animation_info> [ <index> ] . start ) ) 
			ENDIF 
			total = ( <total> + 1 ) 
		ENDIF 
		IF ( <animation_info> [ <index> ] . on = 0 ) 
			make_cat_timeline_item { type = anim 
				id = <anim_id> 
				anim_index = <index> 
				off 
				text = <anim_name> 
				time = <time_passed> 
				duration = <duration> 
				idletime = <idletime> 
				idle_start = <idle_start> 
				got_idle = <got_idle> 
				pad_choose_script = CAT_edit_animation_menu 
				pad_choose_params = { anim_index = <index> trick_index = 0 } 
				trickType = ( <animation_info> [ <index> ] . trickType ) 
			} 
			total = ( <total> + 1 ) 
		ENDIF 
		IF GotParam get_id 
			IF GotParam anim_index 
				IF ( <index> = <anim_index> ) 
					return_val = <total> 
				ENDIF 
			ENDIF 
		ENDIF 
		count = ( <count> + 1 ) 
	REPEAT <array_size> 
	make_cat_timeline_item { type = new_item 
		id = new_item_box 
		text = "New Rotation or Trick" 
		time = 1 
		duration = 1.00000000000 
		pad_choose_script = timeline_empty_item_focus 
		pad_choose_params = { trick_index = 0 } 
		dont_focus_timeline = <dont_focus_timeline> 
	} 
	wait 2 gameframes 
	IF ScreenElementExists id = timeline_scrolling_menu 
		SetScreenElementProps id = timeline_scrolling_menu reset_window_bottom 
	ENDIF 
	IF GotParam get_id 
		RETURN return_val = <return_val> 
	ENDIF 
ENDSCRIPT

SCRIPT get_anim_order 
	count = 1 
	anim_order = [ 0 , 0 , 0 , 0 , 0 , 0 ] 
	BEGIN 
		index = 0 
		BEGIN 
			IF ( ( ( <animation_info> [ <index> ] ) . order ) = <count> ) 
				SetArrayElement ArrayName = anim_order index = ( <count> -1 ) newvalue = <index> 
				BREAK 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
		count = ( <count> + 1 ) 
	REPEAT <array_size> 
	RETURN anim_order = <anim_order> 
ENDSCRIPT

timeline_has_no_items = 1 
SCRIPT make_cat_timeline_item text = "text" time = 0 duration = 1 
	row_num = 0 
	Change timeline_has_no_items = 0 
	BEGIN 
		FormatText ChecksumName = row_id "timeline_row%r" r = <row_num> 
		IF ScreenElementExists id = { <row_id> child = 1 } 
			row_num = ( <row_num> + 1 ) 
			IF ( <row_num> > 12 ) 
				RETURN 
			ENDIF 
		ELSE 
			parent = <row_id> 
			BREAK 
		ENDIF 
	REPEAT 
	SWITCH <type> 
		CASE rot 
			pad_right_script = slide_cat_rot_start_value 
			pad_r1_script = null_script 
			toggle_script = toggle_rot_on_off 
			IF NOT GotParam off 
				sprite_rgba = rot_on_un 
				idle_rgba = idle_on_un 
			ELSE 
				sprite_rgba = rot_off_un 
				idle_rgba = idle_off_un 
			ENDIF 
		CASE anim 
			pad_right_script = slide_cat_anim_start_value 
			IF ( <trickType> = 4 ) 
				pad_r1_script = null_script 
			ELSE 
				pad_r1_script = increment_cat_animation_order_value 
			ENDIF 
			toggle_script = toggle_anim_on_off 
			IF NOT GotParam off 
				SWITCH <trickType> 
					CASE 0 
						sprite_rgba = flip_on_un 
					CASE 1 
						sprite_rgba = grab_on_un 
					CASE 2 
						sprite_rgba = spec_on_un 
					CASE 3 
						sprite_rgba = misc_on_un 
					CASE 4 
						sprite_rgba = gen_on_un 
				ENDSWITCH 
				idle_rgba = idle_on_un 
			ELSE 
				SWITCH <trickType> 
					CASE 0 
						sprite_rgba = flip_off_un 
					CASE 1 
						sprite_rgba = grab_off_un 
					CASE 2 
						sprite_rgba = spec_off_un 
					CASE 3 
						sprite_rgba = misc_off_un 
					CASE 4 
						sprite_rgba = gen_off_un 
				ENDSWITCH 
				idle_rgba = idle_off_un 
			ENDIF 
		CASE new_item 
			IF NOT GotParam dont_focus_timeline 
				spawnscript spawn_cat_demo_loop 
			ENDIF 
			pad_right_script = null_script 
			pad_r1_script = null_script 
			toggle_script = null_script 
			sprite_rgba = new_item_un 
	ENDSWITCH 
	pos = ( ( <time> * PAIR(200.00000000000, 0.00000000000) ) + PAIR(0.00000000000, 2.00000000000) ) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <id> 
		just = [ left top ] 
		internal_just = [ left top ] 
		dims = PAIR(100.00000000000, 20.00000000000) 
		pos = <pos> 
	} 
	anchor_id = <id> 
	IF NOT GotParam off 
		SetScreenElementProps { id = <parent> 
			event_handlers = [ { pad_choose cat_play_choose_sound params = { pad_choose_script = <pad_choose_script> <pad_choose_params> timeline_id = <anchor_id> } } 
				{ pad_zac <pad_choose_script> params = { <pad_choose_params> timeline_id = <anchor_id> } } 
				{ pad_space cat_play_hide_sound params = { callback = <toggle_script> rot_index = <rot_index> anim_index = <anim_index> } } 
				{ pad_backspace cat_play_delete_sound params = { callback = <toggle_script> Delete rot_index = <rot_index> anim_index = <anim_index> } } 
				{ pad_right <pad_right_script> params = { rot_index = <rot_index> anim_index = <anim_index> } } 
				{ pad_left <pad_right_script> params = { rot_index = <rot_index> anim_index = <anim_index> reverse } } 
				{ pad_r2 <pad_r1_script> params = { anim_index = <anim_index> } } 
				{ pad_l2 <pad_r1_script> params = { anim_index = <anim_index> reverse } } 
				{ focus timeline_item_focus params = { type = <type> trickType = <trickType> rot_index = <rot_index> anim_index = <anim_index> } } 
				{ unfocus timeline_item_unfocus params = { type = <type> trickType = <trickType> } } 
			] 
			replace_handlers 
		} 
		text_rgba = [ 60 60 60 100 ] 
	ELSE 
		SetScreenElementProps { id = <parent> 
			event_handlers = [ 
				{ pad_choose null_script } 
				{ pad_space cat_play_hide_sound params = { callback = <toggle_script> rot_index = <rot_index> anim_index = <anim_index> } } 
				{ pad_backspace cat_play_delete_sound params = { callback = <toggle_script> Delete rot_index = <rot_index> anim_index = <anim_index> } } 
				{ pad_right null_script params = { } } 
				{ pad_left null_script params = { reverse } } 
				{ focus timeline_item_focus params = { type = <type> off trickType = <trickType> rot_index = <rot_index> anim_index = <anim_index> } } 
				{ unfocus timeline_item_unfocus params = { type = <type> off trickType = <trickType> } } 
			] 
			replace_handlers 
		} 
		text_rgba = [ 60 60 60 100 ] 
	ENDIF 
	scale = ( ( <duration> * PAIR(12.50000000000, 0.00000000000) ) + PAIR(0.00000000000, 1.00000000000) ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = cat_box 
		rgba = <sprite_rgba> 
		just = [ left top ] 
		scale = <scale> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		z_priority = 1 
		heap = ( cat_heap ) 
	} 
	bar_id = <id> 
	IF ( <type> = new_item ) 
		text_pos = PAIR(5.00000000000, -2.00000000000) 
	ELSE 
		text_pos = PAIR(14.00000000000, -2.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		pos = <text_pos> 
		font = dialog 
		text = <text> 
		just = [ left top ] 
		scale = 0.80000001192 
		rgba = <text_rgba> 
		z_priority = 3 
		heap = ( cat_heap ) 
	} 
	text_id = <id> 
	IF NOT ( <type> = new_item ) 
		max_width = ( ( <duration> - 0.10000000149 ) * 160 ) 
		truncate_string id = <text_id> max_width = <max_width> 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = left_arrow 
		rgba = [ 0 0 0 0 ] 
		just = [ left top ] 
		scale = PAIR(0.75000000000, 0.50000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		z_priority = 3 
		heap = ( cat_heap ) 
	} 
	GetStackedScreenElementPos x id = <bar_id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = right_arrow 
		rgba = [ 0 0 0 0 ] 
		just = [ left top ] 
		scale = PAIR(0.75000000000, 0.50000000000) 
		pos = ( <pos> + PAIR(-12.00000000000, 0.00000000000) ) 
		z_priority = 3 
		heap = ( cat_heap ) 
	} 
	IF ( <type> = anim ) 
		scale2 = PAIR(0.00000000000, 0.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		IF ( <got_idle> = 1 ) 
			IF GotParam idle_start 
				scale2 = ( ( <idletime> * PAIR(12.50000000000, 0.00000000000) ) + PAIR(0.00000000000, 1.00000000000) ) 
				pos = ( <idle_start> * PAIR(200.00000000000, 0.00000000000) + PAIR(0.00000000000, 0.00000000000) ) 
			ENDIF 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = cat_box 
			rgba = <idle_rgba> 
			just = [ left top ] 
			scale = <scale2> 
			pos = <pos> 
			z_priority = 2 
			heap = ( cat_heap ) 
		} 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <text_id> 
		font = dialog 
		text = <text> 
		alpha = 0 
		scale = 0 
		heap = ( cat_heap ) 
	} 
ENDSCRIPT

SCRIPT cat_play_choose_sound 
	generic_menu_pad_choose_sound 
	IF GotParam pad_choose_script 
		IF NOT ( <pad_choose_script> = null_script ) 
			<pad_choose_script> <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cat_play_hide_sound 
	IF GotParam callback 
		IF NOT ( <callback> = null_script ) 
			<callback> <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cat_play_delete_sound 
	PlaySound GUI_buzzer01 pitch = 60 
	IF GotParam callback 
		IF NOT ( <callback> = null_script ) 
			<callback> <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT timeline_item_focus 
	GetTags 
	IF GotParam type 
		SWITCH <type> 
			CASE rot 
				IF NOT GotParam off 
					sprite_rgba = rot_on_high 
					arrow_rgba = timeline_arrow_high 
				ELSE 
					sprite_rgba = rot_off_high 
					arrow_rgba = [ 0 0 0 0 ] 
				ENDIF 
			CASE anim 
				IF NOT GotParam off 
					SWITCH <trickType> 
						CASE 0 
							sprite_rgba = flip_on_high 
						CASE 1 
							sprite_rgba = grab_on_high 
						CASE 2 
							sprite_rgba = spec_on_high 
						CASE 3 
							sprite_rgba = misc_on_high 
						CASE 4 
							sprite_rgba = gen_on_high 
					ENDSWITCH 
					arrow_rgba = timeline_arrow_high 
				ELSE 
					SWITCH <trickType> 
						CASE 0 
							sprite_rgba = flip_off_high 
						CASE 1 
							sprite_rgba = grab_off_high 
						CASE 2 
							sprite_rgba = spec_off_high 
						CASE 3 
							sprite_rgba = misc_off_high 
						CASE 4 
							sprite_rgba = gen_off_high 
					ENDSWITCH 
					arrow_rgba = [ 0 0 0 0 ] 
				ENDIF 
			CASE new_item 
				sprite_rgba = new_item_high 
				arrow_rgba = [ 0 0 0 0 ] 
		ENDSWITCH 
		text_rgba = [ 100 100 100 100 ] 
	ENDIF 
	IF ScreenElementExists id = { <id> child = { 1 child = 0 } } 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 0 } } rgba = <sprite_rgba> 
		RunScriptOnScreenElement id = { <id> child = { 1 child = 0 } } timeline_bar_focus_effect 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 1 } } rgba = <text_rgba> 
		RunScriptOnScreenElement id = { <id> child = { 1 child = 1 } } text_twitch_effect2 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 2 } } rgba = <arrow_rgba> 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 3 } } rgba = <arrow_rgba> 
	ENDIF 
ENDSCRIPT

SCRIPT timeline_bar_focus_effect scale = PAIR(1.00000000000, 0.25000000000) scale2 = PAIR(1.00000000000, 1.00000000000) 
	GetTags 
	wait 1 gameframe 
	BEGIN 
		DoScreenElementMorph id = <id> time = 0.30000001192 alpha = 0.50000000000 
		wait 0.50000000000 seconds 
		DoScreenElementMorph id = <id> time = 0.30000001192 alpha = 1 
		wait 0.50000000000 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT timeline_item_unfocus 
	GetTags 
	KillSpawnedScript name = text_twitch_effect2 
	KillSpawnedScript name = timeline_bar_focus_effect 
	IF GotParam type 
		SWITCH <type> 
			CASE rot 
				pad_right_script = slide_cat_rot_start_value 
				IF NOT GotParam off 
					sprite_rgba = rot_on_un 
				ELSE 
					sprite_rgba = rot_off_un 
				ENDIF 
			CASE anim 
				pad_right_script = slide_cat_anim_start_value 
				IF NOT GotParam off 
					SWITCH <trickType> 
						CASE 0 
							sprite_rgba = flip_on_un 
						CASE 1 
							sprite_rgba = grab_on_un 
						CASE 2 
							sprite_rgba = spec_on_un 
						CASE 3 
							sprite_rgba = misc_on_un 
						CASE 4 
							sprite_rgba = gen_on_un 
					ENDSWITCH 
				ELSE 
					SWITCH <trickType> 
						CASE 0 
							sprite_rgba = flip_off_un 
						CASE 1 
							sprite_rgba = grab_off_un 
						CASE 2 
							sprite_rgba = spec_off_un 
						CASE 3 
							sprite_rgba = misc_off_un 
						CASE 4 
							sprite_rgba = gen_off_un 
					ENDSWITCH 
				ENDIF 
			CASE new_item 
				sprite_rgba = new_item_un 
		ENDSWITCH 
		text_rgba = [ 60 60 60 100 ] 
	ENDIF 
	IF ScreenElementExists id = { <id> child = { 1 child = 0 } } 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 0 } } rgba = <sprite_rgba> 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 1 } } rgba = <text_rgba> 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 2 } } rgba = [ 0 0 0 0 ] 
		DoScreenElementMorph time = 0 id = { <id> child = { 1 child = 3 } } rgba = [ 0 0 0 0 ] 
	ENDIF 
ENDSCRIPT

SCRIPT timeline_empty_item_focus back_script = cancel_new_anim_or_rot 
	GetTags 
	IF ( timeline_has_no_items = 0 ) 
	ELSE 
		back_script = cancel_first_anim_or_rot 
	ENDIF 
	FireEvent type = unfocus target = timeline_vmenu 
	create_dialog_box { 
		title = "New" 
		text = "Add a new rotation or trick?" 
		forced_pos = PAIR(320.00000000000, 75.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		pad_back_script = <back_script> 
		buttons = [ { font = small text = "Go Back" pad_choose_script = <back_script> } 
			{ font = small text = "Rotation" pad_choose_script = cat_add_another_rot } 
			{ font = small text = "Grab" pad_choose_script = cat_add_another_anim pad_choose_params = { type = grab } } 
			{ font = small text = "Fliptrick" pad_choose_script = cat_add_another_anim pad_choose_params = { type = fliptrick } } 
			{ font = small text = "Special" pad_choose_script = cat_add_another_anim pad_choose_params = { type = special } } 
			{ font = small text = "Other" pad_choose_script = cat_add_another_anim pad_choose_params = { type = misc } } 
			{ font = small text = "Sound" pad_choose_script = cat_add_another_anim pad_choose_params = { type = generic } } 
		] 
	} 
ENDSCRIPT

SCRIPT cancel_new_anim_or_rot 
	dialog_box_exit 
	add_timeline_helper_text 
	FireEvent type = focus target = timeline_vmenu 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT cancel_first_anim_or_rot 
	dialog_box_exit 
	CAT_menu_exit 
ENDSCRIPT

SCRIPT cat_add_another_anim 
	dialog_box_exit 
	calculate_cat_score get_time anims_only 
	IF NOT ( 2.50000000000 > <time> ) 
		create_dialog_box { 
			title = "Oops!" 
			text = "You don\'t have any room for another animation!" 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			buttons = [ { font = small text = "Ok" pad_choose_script = cancel_new_anim_or_rot } 
			] 
		} 
		RETURN 
	ENDIF 
	find_unused_anim 
	IF ( ( <type> = generic ) & ( <num_sounds> > 2 ) ) 
		create_dialog_box { 
			title = "Oops!" 
			text = "You can only have 3 sounds." 
			pos = PAIR(310.00000000000, 183.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			buttons = [ { font = small text = "Ok" pad_choose_script = cancel_new_anim_or_rot } 
			] 
		} 
	ELSE 
		IF GotParam anim_index 
			toggle_anim_on_off anim_index = <anim_index> type = <type> 
		ELSE 
			create_dialog_box { 
				title = "Oops!" 
				text = "You don\'t have any empty animation slots!" 
				pos = PAIR(320.00000000000, 240.00000000000) 
				just = [ center center ] 
				text_rgba = [ 88 105 112 128 ] 
				buttons = [ { font = small text = "Ok" pad_choose_script = cancel_new_anim_or_rot } 
				] 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cat_add_another_rot 
	printf "script cat_add_another_rot" 
	dialog_box_exit 
	find_unused_rot 
	IF GotParam rot_index 
		toggle_rot_on_off rot_index = <rot_index> 
	ELSE 
		create_dialog_box { 
			title = "Oops!" 
			text = "You don\'t have any empty rotation slots!" 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			buttons = [ { font = small text = "Ok" pad_choose_script = cancel_new_anim_or_rot } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT slide_cat_rot_start_value 
	StopSound ThisMenuSelectSound 
	PlaySound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound 
	GetTags 
	get_CAT_rot_values Skater = 0 trick_index = 0 rot_index = <rot_index> 
	IF GotParam reverse 
		IF NOT ( 0 > ( <start> - 0.10000000149 ) ) 
			start = ( <start> - 0.10000000149 ) 
		ELSE 
			start = 0 
		ENDIF 
	ELSE 
		IF NOT ( ( <start> + <Dur> + 0.10000000149 ) > 3.00000000000 ) 
			start = ( <start> + 0.10000000149 ) 
		ENDIF 
	ENDIF 
	pos = ( ( <start> * PAIR(200.00000000000, 0.00000000000) ) + PAIR(0.00000000000, 2.00000000000) ) 
	DoScreenElementMorph time = 0.10000000149 id = { <id> child = 1 } pos = <pos> 
	set_new_rot_values { rot_index = <rot_index> on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir> } 
	calculate_cat_score get_values 
ENDSCRIPT

SCRIPT slide_cat_anim_start_value 
	IF GotParam reverse 
		PlaySound menu03 vol = 90 pitch = 90 
	ELSE 
		PlaySound menu03 vol = 80 pitch = 120 
	ENDIF 
	GetTags 
	get_CAT_anim_values Skater = 0 trick_index = 0 anim_index = <anim_index> 
	IF GotParam reverse 
		IF NOT ( 0 > ( <start> - 0.10000000149 ) ) 
			start = ( <start> - 0.10000000149 ) 
		ELSE 
			start = 0 
		ENDIF 
	ELSE 
		calculate_cat_score get_time 
		IF ( 2.90000009537 > <time> ) 
			trick_got_idle trick = <trick> 
			IF ( <got_idle> = 1 ) 
				IF NOT ( ( <start> + <Dur> + <idletime> + 0.10000000149 ) > 3.00000000000 ) 
					start = ( <start> + 0.10000000149 ) 
				ENDIF 
			ELSE 
				IF NOT ( ( <start> + <Dur> + 0.10000000149 ) > 3.00000000000 ) 
					start = ( <start> + 0.10000000149 ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	quick_set_anim_values <...> 
	update_all_anim_positions 
	calculate_cat_score get_values 
ENDSCRIPT

SCRIPT update_all_anim_positions 
	printf "update_all_anim_positions" 
	GetCreateATrickAnimations { Skater = 0 trick_index = 0 } 
	GetArraySize <animation_info> 
	get_anim_order animation_info = <animation_info> array_size = <array_size> 
	index = 0 
	count = 0 
	time_passed = 0 
	BEGIN 
		printf "count = %c" c = <count> 
		index = ( <anim_order> [ <count> ] ) 
		trick = ( ( <animation_info> [ <index> ] ) . trick ) 
		IF NOT IsArray <trick> 
			params = ( <trick> . params ) 
		ELSE 
			params = ( ( <trick> [ 0 ] ) . params ) 
		ENDIF 
		anim_name = ( <params> . name ) 
		FormatText ChecksumName = anim_id "anim%i" i = <index> 
		IF ( <animation_info> [ <index> ] . on = 1 ) 
			time_passed = ( <time_passed> + ( <animation_info> [ <index> ] . start ) ) 
			pos = ( ( <time_passed> * PAIR(200.00000000000, 0.00000000000) ) + PAIR(0.00000000000, 2.00000000000) ) 
			IF ScreenElementExists id = <anim_id> 
				DoScreenElementMorph time = 0 id = <anim_id> pos = <pos> 
			ELSE 
				printf "can\'t move %i cause it doesn\'t exist!" i = <anim_id> 
			ENDIF 
			trick_got_idle trick = <trick> 
			IF NOT ( ( ( <animation_info> [ <index> ] ) . trickType ) = 4 ) 
				IF ( <got_idle> = 1 ) 
					time_passed = ( <time_passed> + ( <animation_info> [ <index> ] . Dur ) + ( <animation_info> [ <index> ] . idletime ) ) 
				ELSE 
					time_passed = ( <time_passed> + ( <animation_info> [ <index> ] . Dur ) ) 
				ENDIF 
			ELSE 
				time_passed = ( <time_passed> - ( <animation_info> [ <index> ] . start ) ) 
			ENDIF 
			IF ( <time_passed> > 3.00000000000 ) 
				diff = ( <time_passed> - 3.00000000000 ) 
				get_CAT_anim_values Skater = 0 trick_index = 0 anim_index = <index> 
				IF ( <diff> > 0 ) 
					IF ( <start> > 0 ) 
						IF ( <start> > <diff> ) 
							time_passed = ( <time_passed> - <diff> ) 
							start = ( <start> - <diff> ) 
							diff = 0 
						ELSE 
							time_passed = ( <time_passed> - <start> ) 
							diff = ( <diff> - <start> ) 
							start = 0 
						ENDIF 
					ENDIF 
				ENDIF 
				IF ( <got_idle> = 1 ) 
					IF ( <diff> > 0 ) 
						IF ( <idle> > 0 ) 
							IF ( <idle> > <diff> ) 
								time_passed = ( <time_passed> - <diff> ) 
								idle = ( <idle> - <diff> ) 
								diff = 0 
							ELSE 
								time_passed = ( <time_passed> - <idle> ) 
								diff = ( <diff> - <idle> ) 
								idle = 0 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
				IF ( <diff> > 0 ) 
					IF ( <Dur> > 0.10000000149 ) 
						IF ( ( <Dur> - 0.10000000149 ) > <diff> ) 
							time_passed = ( <time_passed> - <diff> ) 
							Dur = ( <Dur> - <diff> ) 
							diff = 0 
						ELSE 
						ENDIF 
					ENDIF 
				ENDIF 
				set_new_anim_values { anim_index = <index> on = <on> trick = <trick> anim = <anim> Dur = <Dur> percent = <percent> blend = <blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards> } 
			ENDIF 
		ENDIF 
		IF ( <animation_info> [ <index> ] . on = 0 ) 
			IF ( <time_passed> > 3 ) 
				printf "CAT: Does this ever happen????????????????????????????????????????????????????????????????????" 
				ScriptAssert "Go tell Zac you got this message in CAT and tell him exactly what you were doing and what items were in your created trick." 
				RETURN 
			ENDIF 
		ENDIF 
		count = ( <count> + 1 ) 
	REPEAT <array_size> 
	IF GotParam rebuild_it 
		create_cat_timeline 
	ENDIF 
ENDSCRIPT

SCRIPT update_scale_to_new_duration 
	printf "script update_scale_to_new_duration" 
	scale = ( ( <duration> * PAIR(12.50000000000, 0.00000000000) ) + PAIR(0.00000000000, 1.00000000000) ) 
	IF GotParam idle_start 
		scale2 = ( ( <idletime> * PAIR(12.50000000000, 0.00000000000) ) + PAIR(0.00000000000, 1.00000000000) ) 
		ipos = ( <idle_start> * PAIR(200.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
	ELSE 
		scale2 = PAIR(0.00000000000, 0.00000000000) 
		ipos = PAIR(0.00000000000, 0.00000000000) 
	ENDIF 
	DoScreenElementMorph id = { <id> child = 0 } scale = <scale> 
	GetStackedScreenElementPos x id = { <id> child = 0 } 
	DoScreenElementMorph id = { <id> child = 3 } pos = ( <pos> + PAIR(-12.00000000000, 0.00000000000) ) 
	IF ScreenElementExists id = { <id> child = 4 } 
		DoScreenElementMorph id = { <id> child = 4 } pos = <ipos> scale = <scale2> 
	ENDIF 
	GetTextElementString id = { <id> child = { 1 child = 0 } } 
	SetScreenElementProps id = { <id> child = 1 } text = <string> 
	max_width = ( ( <duration> - 0.10000000149 ) * 160 ) 
	truncate_string id = { <id> child = 1 } max_width = <max_width> 
ENDSCRIPT

SCRIPT find_unused_anim 
	get_CAT_param_values Skater = 0 trick_index = 0 
	got_it = 0 
	num_sounds = 0 
	GetArraySize <animation_info> 
	index = 0 
	BEGIN 
		IF ( <got_it> = 0 ) 
			IF ( ( ( <animation_info> [ <index> ] ) . on ) = 2 ) 
				anim_index = <index> 
				got_it = 1 
			ENDIF 
		ENDIF 
		IF ( ( ( <animation_info> [ <index> ] ) . trickType ) = 4 ) 
			IF NOT ( ( ( <animation_info> [ <index> ] ) . on ) = 2 ) 
				num_sounds = ( <num_sounds> + 1 ) 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN { anim_index = <anim_index> num_sounds = <num_sounds> } 
ENDSCRIPT

SCRIPT find_unused_rot 
	GetCreateATrickRotations Skater = 0 trick_index = 0 
	GetArraySize <rotation_info> 
	index = 0 
	BEGIN 
		IF ( ( ( <rotation_info> [ <index> ] ) . on ) = 2 ) 
			RETURN rot_index = <index> 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT back_to_timeline 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	focus_cat_timeline 
ENDSCRIPT

SCRIPT calculate_cat_score minus = 99 
	IF ( ( GotParam get_values ) | ( GotParam get_time ) ) 
		get_CAT_param_values trick_index = 0 
	ENDIF 
	bailtime = 0 
	animtime = 0 
	num_rots = 0 
	num_anims = 0 
	IF NOT GotParam anims_only 
		GetArraySize <rotation_info> 
		index = 0 
		BEGIN 
			IF ( ( ( <rotation_info> [ <index> ] ) . on ) = 1 ) 
				Dur = ( ( <rotation_info> [ <index> ] ) . Dur ) 
				start = ( ( <rotation_info> [ <index> ] ) . start ) 
				IF ( ( <Dur> + <start> ) > <bailtime> ) 
					bailtime = ( <Dur> + <start> ) 
				ENDIF 
			ENDIF 
			IF NOT ( ( ( <rotation_info> [ <index> ] ) . on ) = 2 ) 
				num_rots = ( <num_rots> + 1 ) 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		IF NOT GotParam no_hidden 
			include_hidden = include_hidden 
		ENDIF 
	ENDIF 
	GetArraySize <animation_info> 
	index = 0 
	BEGIN 
		IF NOT ( <index> = <minus> ) 
			IF NOT ( ( ( <animation_info> [ <index> ] ) . trickType ) = 4 ) 
				trick_got_idle trick = ( ( <animation_info> [ <index> ] ) . trick ) 
				IF ( ( ( <animation_info> [ <index> ] ) . on ) = 1 ) 
					IF ( <got_idle> = 1 ) 
						animtime = ( <animtime> + ( ( <animation_info> [ <index> ] ) . Dur ) + ( ( <animation_info> [ <index> ] ) . idletime ) + ( ( <animation_info> [ <index> ] ) . start ) ) 
					ELSE 
						animtime = ( <animtime> + ( ( <animation_info> [ <index> ] ) . Dur ) + ( ( <animation_info> [ <index> ] ) . start ) ) 
					ENDIF 
				ENDIF 
				IF GotParam include_hidden 
					IF ( ( ( <animation_info> [ <index> ] ) . on ) = 0 ) 
						IF ( <got_idle> = 1 ) 
							animtime = ( <animtime> + ( ( <animation_info> [ <index> ] ) . Dur ) + ( ( <animation_info> [ <index> ] ) . idletime ) + ( ( <animation_info> [ <index> ] ) . start ) ) 
						ELSE 
							animtime = ( <animtime> + ( ( <animation_info> [ <index> ] ) . Dur ) + ( ( <animation_info> [ <index> ] ) . start ) ) 
						ENDIF 
					ENDIF 
				ENDIF 
				IF NOT ( ( ( <animation_info> [ <index> ] ) . on ) = 2 ) 
					num_anims = ( <num_anims> + 1 ) 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF ( <animtime> > <bailtime> ) 
		bailtime = <animtime> 
	ENDIF 
	IF NOT GotParam get_time 
		cat_get_score_from_bailtime bailtime = <bailtime> can_spin = <can_spin> 
		FormatText TextName = score_text "%i" i = <score> 
		IF ScreenElementExists id = cat_timeline_score 
			SetScreenElementProps id = cat_timeline_score text = <score_text> 
		ENDIF 
		IF ScreenElementExists id = cat_rots_used 
			FormatText TextName = rot_text "%i" i = <num_rots> 
			SetScreenElementProps id = cat_rots_used text = <rot_text> 
			GetStackedScreenElementPos id = cat_rots_used x 
			SetScreenElementProps id = cat_slash_rots pos = <pos> 
		ENDIF 
		IF ScreenElementExists id = cat_anims_used 
			FormatText TextName = anim_text "%i" i = <num_anims> 
			SetScreenElementProps id = cat_anims_used text = <anim_text> 
			GetStackedScreenElementPos id = cat_anims_used x 
			SetScreenElementProps id = cat_slash_anims pos = <pos> 
		ENDIF 
		IF ( <can_spin> = 1 ) 
			spin_text = "on" 
		ELSE 
			spin_text = "off" 
		ENDIF 
		IF ScreenElementExists id = cat_timeline_spin 
			SetScreenElementProps id = cat_timeline_spin text = <spin_text> 
		ENDIF 
		IF GotParam return_it 
			RETURN { score = <score> score_text = <score_text> } 
		ENDIF 
	ELSE 
		RETURN time = <bailtime> 
	ENDIF 
ENDSCRIPT

SCRIPT cat_get_score_from_bailtime 
	IF ( <bailtime> > 1.50000000000 ) 
		score = ( ( 1333 * ( <bailtime> -1.50000000000 ) ) + 6000 ) 
	ELSE 
		IF ( <bailtime> > 0.40000000596 ) 
			score = ( ( 5880 * ( <bailtime> -0.50000000000 ) * ( <bailtime> -0.50000000000 ) ) + 120 ) 
		ELSE 
			IF ( <bailtime> > 0.30000001192 ) 
				score = 100 
			ELSE 
				score = 0 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( ( 0 > <score> ) | ( <score> = 0 ) ) 
		score = 0 
	ELSE 
		IF ( <can_spin> = 1 ) 
			IF ( <bailtime> > 1.50000000000 ) 
				score = ( <score> / 4 ) 
			ELSE 
				IF ( <bailtime> > 0.40000000596 ) 
					score = ( <score> / ( 2.50000000000 * ( <bailtime> -0.50000000000 ) + 1.50000000000 ) ) 
				ELSE 
					score = 70 
				ENDIF 
			ENDIF 
		ENDIF 
		CastToInteger score 
		mod = ( <score> - ( <score> / 10 ) * 10 ) 
		IF NOT ( <mod> = 0 ) 
			score = ( <score> + ( 10 - <mod> ) ) 
		ENDIF 
	ENDIF 
	IF ( <score> > 8000 ) 
		score = 8000 
	ENDIF 
	RETURN score = <score> 
ENDSCRIPT

SCRIPT cat_landable 
	get_CAT_param_values trick_index = 0 
	upsidedown = 0 
	GetArraySize <rotation_info> 
	index = 0 
	BEGIN 
		IF ( ( ( <rotation_info> [ <index> ] ) . on ) = 1 ) 
			IF NOT ( ( ( <rotation_info> [ <index> ] ) . Axis ) = y ) 
				degrees = ( ( <rotation_info> [ <index> ] ) . Deg ) 
				BEGIN 
					IF ( <degrees> > 360 ) 
						degrees = ( <degrees> - 360 ) 
					ELSE 
						BREAK 
					ENDIF 
				REPEAT 
				IF ( <degrees> = 180 ) 
					IF ( <upsidedown> = 1 ) 
						upsidedown = 0 
					ELSE 
						upsidedown = 1 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN upsidedown = <upsidedown> 
ENDSCRIPT

skater_board_was_hidden = 0 
SCRIPT show_CAT_skater 
	printf "script show_CAT_skater" 
	IF NOT ObjectExists id = CAT_Skater 
		Skater : AtomicIsHidden board 
		IF ( <hidden> = 1 ) 
			printf "skaters board was hidden" 
			Skater : SwitchOnAtomic board 
			Change skater_board_was_hidden = 1 
		ENDIF 
		CreateCompositeObject { 
			Components = 
			[ 
				{ component = motion } 
				{ component = Suspend NeverSuspend } 
				{ component = skeleton 
					SkeletonName = THPS6_human 
					max_bone_skip_lod = 0 
				} 
				{ component = model 
					refObjectName = Skater 
				} 
				{ component = AnimBlender 
					AnimName = animload_THPS6_human 
					SkeletonName = THPS6_human 
				} 
				{ component = SpecialItem } 
				{ component = SkaterFlipAndRotate } 
			] 
			params = { name = CAT_Skater } 
		} 
		CAT_Skater : Move y = -750 
	ENDIF 
	IF NOT ObjectExists id = CAT_Cam 
		CreateCompositeObject { 
			Components = 
			[ 
				{ component = camera } 
			] 
			params = { name = CAT_Cam } 
		} 
	ENDIF 
	CAT_Skater : Obj_GetPosition 
	CAT_Cam : Obj_SetPosition Position = ( <pos> + VECTOR(150.00000000000, 5.00000000000, 50.00000000000) ) 
	CAT_Cam : Obj_SetOrientation y = 90 
	wait 1 gameframes 
	SetActiveCamera id = CAT_Cam 
	CAT_Skater : Obj_PlayAnim anim = AirIdle playhold speed = 0 
	Skater : TurnOffSpecialItem 
	make_mainmenu_3d_plane model = "cat_bg\\cat_bg.mdl" z_priority = -200 scale = PAIR(1.70000004768, 2.09999990463) pos = PAIR(320.00000000000, 225.00000000000) parent = cat_menu_anchor 
	IF ScreenElementExists id = timeline_vmenu 
		IF NOT GotParam dont_focus_timeline 
			FireEvent type = focus target = timeline_vmenu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cat_back_to_skater_cam 
	Restore_skater_camera 
ENDSCRIPT

SCRIPT cat_rehide_skater_board 
	IF ( skater_board_was_hidden = 1 ) 
		Skater : SwitchOffAtomic board 
		Change skater_board_was_hidden = 0 
	ENDIF 
ENDSCRIPT

running_cat_demo = 0 
SCRIPT spawn_cat_demo_loop 
	IF ( running_cat_demo = 0 ) 
		Change running_cat_demo = 1 
		BEGIN 
			IF ObjectExists id = CAT_Skater 
				BREAK 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
		RunScriptOnObject id = CAT_Skater cancel_rotate_display 
		wait 1 second 
		KillSpawnedScript name = cat_perform_trick_loop 
		RunScriptOnObject id = CAT_Skater cat_perform_trick_loop params = { ObjId = CAT_Skater } 
	ENDIF 
ENDSCRIPT

SCRIPT cancel_rotate_display 
	CancelRotateDisplay 
ENDSCRIPT

SCRIPT cat_perform_trick_loop 
	printf "cat_perform_trick_loop" 
	BEGIN 
		calculate_cat_score get_time 
		IF ScreenElementExists id = timeline_scrubber 
			RunScriptOnScreenElement move_cat_scrubber id = timeline_scrubber params = { time = <time> id = timeline_scrubber } 
		ENDIF 
		CreateATrick trick_index = 0 demo_loop = demo_loop 
		BEGIN 
			IF ( cat_done = 1 ) 
				BREAK 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
		Obj_PlayAnim anim = AirIdle cycle blend = 0.30000001192 
		wait 0.50000000000 seconds 
		CancelRotateDisplay 
		wait 0.30000001192 seconds 
		IF ( running_cat_demo = 0 ) 
			printf "exiting cat_perform_trick_loop" 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT move_cat_scrubber 
	IF ( <time> > 0 ) 
		end_pos = ( <time> * 200 ) 
		DoMorph alpha = 1.00000000000 
		DoMorph pos = ( <end_pos> * PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, -16.00000000000) ) time = <time> 
		IF ScreenElementExists id = <id> 
			DoMorph pos = PAIR(0.00000000000, -16.00000000000) alpha = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT cat_menu_add_meter_item 
	value_int = ( <value> * 100 ) 
	CastToInteger value_int 
	cat_menu_add_number_item <...> right_arrow_pos = PAIR(190.00000000000, -15.00000000000) value = <value_int> percent 
	anchor_id = <id> 
	value_scale = ( <value> * PAIR(5.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = cat_box 
		scale = <value_scale> 
		pos = PAIR(108.00000000000, -6.00000000000) 
		just = [ left center ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		z_priority = 3 
		heap = ( cat_heap ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = cat_box 
		scale = PAIR(5.00000000000, 1.00000000000) 
		pos = PAIR(108.00000000000, -6.00000000000) 
		just = [ left center ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		z_priority = 2.79999995232 
		heap = ( cat_heap ) 
	} 
ENDSCRIPT

SCRIPT cat_menu_add_number_item 
	IF NOT GotParam pad_choose_script 
		pad_choose_script = null_script 
	ENDIF 
	theme_menu_add_number_item { 
		<...> 
		cat_edit_item = cat_edit_item 
		pad_choose_script = <pad_choose_script> 
	} 
ENDSCRIPT

SCRIPT cat_update_right_arrow 
	GetTags 
	GetStackedScreenElementPos x id = { <id> child = 3 } offset = PAIR(3.00000000000, 2.00000000000) 
	SetScreenElementProps { id = { <id> child = 5 } pos = <pos> } 
ENDSCRIPT

SCRIPT cat_update_left_arrow 
	GetTags 
	GetScreenElementPosition id = { <id> child = 0 } 
	SetScreenElementProps { id = { <id> child = 4 } pos = ( <ScreenElementPos> + PAIR(0.00000000000, 2.00000000000) ) } 
ENDSCRIPT

SCRIPT create_timeline_fader_box parent = current_menu_anchor 
	IF ScreenElementExists id = timeline_fader 
		RETURN 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		id = timeline_fader 
		texture = white2 
		scale = PAIR(75.00000000000, 17.00000000000) 
		pos = PAIR(21.00000000000, 260.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 50 ] 
		z_priority = 100 
		heap = ( cat_heap ) 
	} 
ENDSCRIPT

SCRIPT add_trick_list_items array = cat_flip_tricks 
	theme_background parent = trick_menu id = bg_box_vmenu width = 2.50000000000 pos = PAIR(670.00000000000, 85.00000000000) num_parts = 5 
	GetArraySize <array> 
	index = 0 
	BEGIN 
		RemoveParameter first_item 
		RemoveParameter last_item 
		IF ( <index> = 0 ) 
			first_item = first_item 
		ELSE 
			IF ( <index> = ( <array_size> -1 ) ) 
				last_item = last_item 
			ENDIF 
		ENDIF 
		trick = ( <array> [ <index> ] ) 
		IF IsArray <trick> 
			text = ( ( ( <trick> [ 0 ] ) . params ) . name ) 
		ELSE 
			text = ( ( <trick> . params ) . name ) 
		ENDIF 
		IF NOT GotParam sounds 
			focus_script = main_theme_focus 
			unfocus_script = main_theme_unfocus 
		ELSE 
			focus_script = cat_trick_list_sound_focus 
			unfocus_script = cat_trick_list_sound_unfocus 
			IF IsArray <trick> 
				stream = ( ( ( <trick> [ 0 ] ) . params ) . stream ) 
			ELSE 
				stream = ( ( <trick> . params ) . stream ) 
			ENDIF 
			focus_params = { stream = <stream> } 
		ENDIF 
		pad_choose_script = CAT_set_trick_struct 
		pad_choose_params = { 
			new_trick = <trick> 
			anim_index = <anim_index> 
			timeline_id = <timeline_id> 
		} 
		pad_focus_script = <focus_script> 
		pad_focus_params = <focus_params> 
		theme_menu_add_item { 
			parent = trick_vmenu 
			centered = 1 
			no_bg = no_bg 
			no_highlight_bar 
			menu = 2 
			middle_scale = PAIR(2.50000000000, 1.00000000000) 
			text = <text> 
			pad_choose_script = <pad_choose_script> 
			pad_choose_params = <pad_choose_params> 
			focus_script = <pad_focus_script> 
			focus_params = <pad_focus_params> 
			unfocus_script = <unfocus_script> 
			focus_params = <focus_params> 
			first_item = <first_item> 
			last_item = <last_item> 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	wait 2 gameframes 
	SetScreenElementProps id = trick_scrolling_menu reset_window_bottom 
ENDSCRIPT

SCRIPT cat_trick_list_sound_focus 
	StopStream 
	RunScriptOnScreenElement id = trick_vmenu cat_trick_list_spawned_sound params = { stream = <stream> } 
	main_theme_focus <...> 
ENDSCRIPT

SCRIPT cat_trick_list_spawned_sound 
	wait 10 gameframes 
	PlayStream <stream> vol = 100 
ENDSCRIPT

SCRIPT cat_trick_list_sound_unfocus 
	KillSpawnedScript name = cat_trick_list_spawned_sound 
	StopStream 
	main_theme_unfocus <...> 
ENDSCRIPT

cat_grab_tricks = [ 
	trick_indy 
	Trick_Melon 
	Trick_Tailgrab 
	Trick_Nosegrab 
	Trick_Mute 
	Trick_Airwalk 
	Trick_IndyNoseBone 
	Trick_Crossbone 
	Trick_Benihana 
	Trick_Stalefish 
	Trick_Cannonball 
	Trick_Japan 
	Trick_Crail 
	Trick_SaranWrap 
	Trick_FSShifty 
	Extra_BSShifty 
	Trick_Madonna 
	Trick_Judo 
	Trick_OneFootJapan 
	Trick_ChristAir 
	Trick_Stiffy 
	Trick_Rocket 
	Trick_Method 
	Trick_SackTap 
	Extra_TuckKnee 
	Trick_BetweenTheLegs 
	Extra_CannonballFingerflip 
	Trick_Stalefish_Layback 
	Trick_CrookedCop 
	Trick_DelMarIndy 
	Trick_OneFootTailgrab 
	Trick_Seatbelt 
] 
cat_flip_tricks = [ 
	trick_kickflip 
	Trick_Heelflip 
	Trick_Impossible 
	Trick_FFImpossible 
	Trick_PopShoveIt 
	Trick_FSShoveIt 
	Trick_Hardflip 
	Trick_OllieNorth 
	Trick_FingerFlip 
	Trick_VarialKickflip 
	Extra_VarialKickflip 
	Trick_VarialHeelflip 
	Extra_VarialHeelflip 
	Trick_OldSkoolKickflip 
	Trick_BigSpinFlip 
	Trick_FSFlip 
	Trick_BSFlip 
	Trick_FSBigSpin 
	Trick_BSBigSpin 
	Trick_BackfootKickflip 
	Extra_DBackfootHeelflip 
	Trick_SalFlip 
	Trick_180Varial 
	Trick_360Varial 
	DoubleKickflip 
	TripleKickflip 
	DoubleHeelflip 
	TripleHeelflip 
	Trick_OllieAirwalk 
	Trick_HFVarialLien 
	Extra_DoubleFingerFlip 
	Extra_360Hardflip 
	Trick_InwardHeelflip 
	Extra_360InwardHeelflip 
	DoubleImpossible 
	TripleImpossible 
	Extra360ShoveIt 
	Extra540ShoveIt 
	ExtraFS360ShoveIt 
	ExtraFS540ShoveIt 
	Trick_BackfootShoveIt 
	Extra_DBackfootKickflip 
	Trick_BackfootHeelflip 
] 
cat_special_tricks = [ 
	Trick_BarrelRoll 
	trick_fs540 
	trick_the900 
	Trick_BamBendAir 
	Trick_BreakIn 
	Trick_Shifty360ShovitBSShifty 
	Trick_540varielheelfliplien 
	Trick_FSFlipOneFootTailGrab 
	Trick_Flamingo 
	Trick_360VarialMcTwist 
	Trick_Indy900 
	Trick_SitDownAir 
	Trick_GhettoBird 
	Trick_BigSpinShifty 
	Trick_McTwist 
	Trick_2KickMadonnaFlip 
	Trick_AirCasperFlip 
	Trick_540TailWhip 
	Trick_Gazelle 
	trick_SemiFlip 
	trick_FingerFlipAirWalk 
	trick_1234 
	trick_DoubleKFIndy 
	trick_540flip 
	trick_HardFlipBackFootFlip 
	trick_KickFlipUnderFlip 
	trick_QuadrupleHeelFlip 
] 
cat_misc_tricks = [ 
	CATTrick_Handstand 
	CATTrick_Casper 
	CATTrick_AntiCasper 
	CATTrick_Truckstand 
	CATTrick_Pogo 
	CATTrick_SwitchFootPogo 
	CATTrick_other03 
	CATTrick_other04 
	CATTrick_other05 
	CATTrick_other06 
	CATTrick_other07 
	CATTrick_other08 
	CATTrick_other09 
	CATTrick_other10 
	CATTrick_other11 
	CATTrick_other12 
	CATTrick_other13 
	CATTrick_other14 
	CATTrick_other15 
	CATTrick_other16 
	CATTrick_other17 
	CATTrick_other18 
	CATTrick_PrimoSpin 
	CATTrick_Butt_Manual 
	CATTrick_JesterJuggle 
	CATTrick_HotRod 
	CATTrick_TonySurfer 
	CATTrick_RunningMan 
	CATTrick_Boomerang 
	CATTrick_GuitarSlide 
	CATTrick_AmericanHero 
] 
cat_generic_tricks = [ 
	CATSFX_StripClub 
	CATSFX_Gator 
	CATSFX_Crack 
	CATSFX_Fire 
	CATSFX_Cops 
	CATSFX_Geek 
	CATSFX_Dog 
	CATSFX_Seal 
	CATSFX_Funk 
	CATSFX_Drum 
	CATSFX_Fart 
	CATSFX_Burp 
	CATSFX_Flush 
] 
CATTrick_Handstand = { x params = { name = #"HandStand" anim = HandstandHandFlip_Init idle = HandstandHandFlip_Range OutAnim = HandstandHandFlip_out } } 
CATTrick_Casper = { x params = { name = #"Casper" anim = Casper_Init idle = Casper_Range OutAnim = Casper_out BoardRotate } } 
CATTrick_AntiCasper = { x params = { name = #"Anti Casper" anim = AntiCasper_Init idle = AntiCasper_Range OutAnim = AntiCasper_out BoardRotate } } 
CATTrick_Truckstand = { x params = { name = #"Truckstand" anim = Truckstand_Init idle = Truckstand_Range OutAnim = Truckstand_Out } } 
CATTrick_Pogo = { x params = { name = #"Pogo" anim = Pogo_Init idle = Pogo_Bounce OutAnim = Pogo_Out BoardRotate } } 
CATTrick_SwitchFootPogo = { x params = { name = #"Switch Foot Pogo" anim = Truckrun_Init idle = TruckRun OutAnim = Truckrun_Out } } 
CATTrick_PrimoSpin = { x params = { name = #"Primo Spin" anim = Special_Rodney_PrimoSpin_Init idle = Special_Rodney_PrimoSpin_Idle OutAnim = Special_Rodney_PrimoSpin_Out } } 
CATTrick_Butt_Manual = { x params = { name = #"Paulie Butt Manual" anim = Special_Paulie_ButtMan_Init idle = Special_Paulie_ButtMan_Range OutAnim = Special_Paulie_ButtMan_Out } } 
CATTrick_JesterJuggle = { x params = { name = #"Manual Entertainer" anim = Special_Jester_Juggle_Init idle = Special_Jester_Juggle_idle OutAnim = Special_Jester_Juggle_Out } } 
CATTrick_HotRod = { x params = { name = #"Hot Rod" anim = Special_Jesse_HotRod_Init idle = Special_Jesse_HotRod_Range OutAnim = Special_Jesse_HotRod_Out specialitem_details = DragTires_details } } 
CATTrick_TonySurfer = { x params = { name = #"Surfer" anim = Special_Tony_Surfer_Init idle = Special_Tony_Surfer_Idle ExtraTricks = FlatlandBranches } } 
CATTrick_RunningMan = { x params = { name = #"Running Manual" anim = Special_Eric_RnngMan_Init idle = Special_Eric_RnngMan_Idle ExtraTricks = FlatlandBranches } } 
CATTrick_Boomerang = { x params = { name = #"Boomerang" anim = Special_MikeV_Boomerang ExtraTricks = FlatlandBranches } } 
CATTrick_GuitarSlide = { x params = { name = #"The Faction" anim = Guitar_Idle specialitem_details = Guitar_Details stream = GuitarSlide } } 
CATTrick_AmericanHero = { x params = { name = #"American Tribute" anim = AmericanHeroGrind_Idle specialitem_details = AmericanTributeSI_Details } } 
CATSFX_StripClub = { x params = { sound name = #"Party Girl" anim = AirIdleCAT stream = NO_Female1_Flash05 } } 
CATSFX_Burp = { x params = { sound name = #"Chow Down" anim = AirIdleCAT stream = Burp01 } } 
CATSFX_Fart = { x params = { sound name = #"Bronco Burrito" anim = AirIdleCAT stream = Fart01 } } 
CATSFX_Flush = { x params = { sound name = #"Give it Gas" anim = AirIdleCAT stream = AU_SFX_ToiletFlush } } 
CATSFX_Gator = { x params = { sound name = #"Gators Attack" anim = AirIdleCAT stream = FL_AlligatorEatSkater } } 
CATSFX_Fire = { x params = { sound name = #"Fire Fire Fire!" anim = AirIdleCAT stream = Spec_Muska01 } } 
CATSFX_Cops = { x params = { sound name = #"Officer D." anim = AirIdleCAT stream = PoliceChirp01 } } 
CATSFX_Geek = { x params = { sound name = #"Geek It" anim = AirIdleCAT stream = SK6_SE_Robot_Beep03 } } 
CATSFX_Dog = { x params = { sound name = #"Sup Dawg" anim = AirIdleCAT stream = ST_DogBarks02 } } 
CATSFX_Seal = { x params = { sound name = #"Big Block" anim = AirIdleCAT stream = Spec_JesseJ01 } } 
CATSFX_Crack = { x params = { sound name = #"Spook Me" anim = AirIdleCAT stream = CAT_Spooky } } 
CATSFX_Funk = { x params = { sound name = #"Da Funk" anim = AirIdleCAT stream = Spec_Muska02 } } 
CATSFX_Drum = { x params = { sound name = #"Drum Line" anim = AirIdleCAT stream = CAT_Drum } } 
CATTrick_other03 = { x params = { name = #"Boneless" anim = Boneless } } 
CATTrick_other04 = { x params = { name = #"Cheer 1" anim = Cheer1 } } 
CATTrick_other05 = { x params = { name = #"Cheer 2" anim = Cheer2 } } 
CATTrick_other06 = { x params = { name = #"Sketchy" anim = SketchyLand } } 
CATTrick_other07 = { x params = { name = #"Slap" anim = SlapAir } } 
CATTrick_other08 = { x params = { name = #"Taunt 1" anim = Taunt1 } } 
CATTrick_other09 = { x params = { name = #"Taunt 2" anim = Taunt2 } } 
CATTrick_other10 = { x params = { name = #"Taunt 3" anim = Taunt3 } } 
CATTrick_other11 = { x params = { name = #"Rail Flip" anim = RailFlip } } 
CATTrick_other12 = { x params = { name = #"Casper Flip" anim = CasperFlip } } 
CATTrick_other13 = { x params = { name = #"Half Cab Impossible" anim = HalfCabImpossible } } 
CATTrick_other14 = { x params = { name = #"360 Fingerflip" anim = _360FlipNoseManual } } 
CATTrick_other15 = { x params = { name = #"SpaceWalk" anim = Spacewalk } } 
CATTrick_other16 = { x params = { name = #"Props" anim = Prop } } 
CATTrick_other17 = { x params = { name = #"Nollie" anim = Nollie } } 
CATTrick_other18 = { x params = { name = #"Ollie" anim = Ollie } } 

