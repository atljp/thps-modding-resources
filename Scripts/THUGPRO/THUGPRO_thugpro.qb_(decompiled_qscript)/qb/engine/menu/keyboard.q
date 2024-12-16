
keyboard_current_charset = alphanumeric_lower 
keyboard_text_scale = PAIR(0.94999998808, 0.55000001192) 
keyboard_button_scale = PAIR(1.00000000000, 1.60000002384) 
keyboard_caps_lock = 0 
keyboard_text_block_width = 360 
SCRIPT create_onscreen_keyboard { 
		keyboard_title = "KEYBOARD" 
		keyboard_cancel_script = keyboard_cancel 
		pos = PAIR(320.00000000000, 240.00000000000) 
		max_length = 20 
		text = "" 
		display_text = "_" 
		display_text_scale = 0.85000002384 
		display_text_offset = PAIR(0.00000000000, 0.00000000000) 
	} 
	heap = FrontEnd 
	change keyboard_toggling_char_set = 0 
	destroy_onscreen_keyboard 
	SetScreenElementLock id = root_window off 
	DeBounce x time = 0.30000001192 
	IF GotParam no_buttons 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = keyboard_anchor 
			pos = <pos> 
			dims = PAIR(640.00000000000, 480.00000000000) 
			z_priority = 15 
		} 
	ELSE 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = keyboard_bg_anchor 
			pos = <pos> 
			dims = PAIR(640.00000000000, 480.00000000000) 
		} 
		CreateScreenElement { 
			type = ContainerElement 
			parent = keyboard_bg_anchor 
			id = keyboard_anchor 
			focusable_child = keyboard_vmenu 
			pos = <pos> 
			dims = PAIR(640.00000000000, 480.00000000000) 
		} 
	ENDIF 
	keyboard_anchor : SetTags max_length = <max_length> 
	AssignAlias id = keyboard_anchor alias = current_menu_anchor 
	IF GotParam disable_special_character_tabs 
		keyboard_anchor : SetTags disable_special_character_tabs 
	ENDIF 
	IF GotParam password 
		keyboard_anchor : SetTags password 
	ENDIF 
	IF NOT GotParam no_buttons 
		IF GotParam allow_cancel 
			create_helper_text { 
				helper_text_elements = [ 
					{ text = "\\b7/\\b4/\\b6/\\b5=Select" } 
					{ text = "\\m1=Cancel" } 
					{ text = "\\m0=Accept" } 
					{ text = "\\mf/\\mg=Character Set" } 
				] 
				helper_pos = <helper_pos> 
				parent = keyboard_bg_anchor 
			} 
		ELSE 
			create_helper_text { 
				helper_text_elements = [ 
					{ text = "\\b7/\\b4/\\b6/\\b5=Select" } 
					{ text = "\\m0=Accept" } 
					{ text = "\\mf/\\mg=Character Set" } 
				] 
				helper_pos = <helper_pos> 
				parent = keyboard_bg_anchor 
			} 
		ENDIF 
	ENDIF 
	<org_text> = <text> 
	FormatText TextName = text "%s_" s = <text> 
	IF GotParam no_buttons 
		keyboard_anchor : SetTags no_buttons 
		SetScreenElementProps { 
			id = keyboard_anchor 
			event_handlers = [ { pad_choose keyboard_done params = <...> } 
				{ pad_back generic_menu_pad_back params = { callback = <keyboard_cancel_script> <keyboard_cancel_params> } } 
			] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = keyboard_anchor 
			font = testtitle 
			id = kb_no_button_hdr 
			text = <display_text> 
			pos = PAIR(320.00000000000, 65.00000000000) 
			just = [ center top ] 
			z_priority = 15 
		} 
		IF GotParam text_block 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = keyboard_anchor 
				id = keyboard_display_string 
				allow_expansion 
				font = dialog 
				just = [ center top ] 
				text = "_" 
				internal_just = [ center center ] 
				not_focusable 
				pos = PAIR(320.00000000000, 85.00000000000) 
				dims = ( PAIR(1.00000000000, 0.00000000000) * keyboard_text_block_width + PAIR(0.00000000000, 10.00000000000) ) 
			} 
		ELSE 
			CreateScreenElement { 
				type = TextElement 
				parent = keyboard_anchor 
				id = keyboard_display_string 
				font = dialog 
				just = [ center top ] 
				text = "_" 
				not_focusable 
				pos = PAIR(320.00000000000, 85.00000000000) 
			} 
		ENDIF 
		printf "*** 9" 
		IF GotParam password 
			GetTextElementLength id = keyboard_display_string 
			SetScreenElementProps id = keyboard_display_string text = "" 
			IF ( <length> > 1 ) 
				BEGIN 
					TextElementConcatenate id = keyboard_display_string "*" 
				REPEAT ( <length> -1 ) 
				TextElementConcatenate id = keyboard_display_string "_" 
			ENDIF 
		ENDIF 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = keyboard_anchor 
			id = keyboard_current_string 
			font = dialog 
			just = [ center top ] 
			text = <org_text> 
			not_focusable 
			pos = PAIR(320.00000000000, 85.00000000000) 
			dims = ( PAIR(1.00000000000, 0.00000000000) * keyboard_text_block_width + PAIR(0.00000000000, 10.00000000000) ) 
			allow_expansion 
			scale = 0 
		} 
		IF GotParam allowed_characters 
			keyboard_current_string : SetTags allowed_characters = <allowed_characters> 
		ENDIF 
		IF GotParam max_length 
			IF ( <max_length> < 1 ) 
				script_assert "create_onscreen_keyboard called with bad max_length" 
			ENDIF 
			BEGIN 
				GetTextElementLength id = keyboard_current_string 
				IF ( <length> > <max_length> ) 
					TextElementBackspace id = keyboard_current_string 
					TextElementBackspace id = keyboard_display_string 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT 
		ENDIF 
		FireEvent type = focus target = keyboard_anchor 
	ELSE 
		IF GotParam text_block 
			theme_dialog_background { 
				parent = keyboard_anchor 
				width = 3.50000000000 
				pos = PAIR(320.00000000000, 85.00000000000) 
				num_parts = 7.50000000000 
				z_priority = 1 
				top_height = 2.54999995232 
				no_icon = no_icon 
			} 
		ELSE 
			theme_dialog_background { 
				parent = keyboard_anchor 
				width = 3.50000000000 
				pos = PAIR(320.00000000000, 85.00000000000) 
				num_parts = 6 
				z_priority = 1 
				top_height = 1 
				no_icon = no_icon 
			} 
		ENDIF 
		thugpro_menu_create_title { 
			title_text = <keyboard_title> 
			title_pos = PAIR(320.00000000000, 52.50000000000) 
			title_scale = 0.60000002384 
			title_just = [ center center ] 
			title_text_just = [ center , center ] 
		} 
		IF GotParam text_block 
			CreateScreenElement { 
				type = VMenu 
				parent = keyboard_anchor 
				id = keyboard_vmenu 
				pos = PAIR(320.00000000000, 247.00000000000) 
				internal_just = [ center top ] 
				regular_space_amount = 30 
				event_handlers = [ 
					{ pad_L2 keyboard_handle_L2 params = { max_length = <max_length> } } 
					{ pad_R2 keyboard_handle_R2 params = { max_length = <max_length> } } 
					{ pad_L1 keyboard_handle_L2 params = { max_length = <max_length> } } 
					{ pad_R1 keyboard_handle_R2 params = { max_length = <max_length> } } 
					{ pad_up keyboard_change_key_sound } 
					{ pad_down keyboard_change_key_sound } 
					{ pad_l3 change_fontcolor_keyboard } 
				] 
			} 
			IF NOT GotParam no_back 
				SetScreenElementProps { 
					id = keyboard_vmenu 
					event_handlers = [ 
						{ pad_back generic_menu_pad_back params = { callback = <keyboard_cancel_script> <keyboard_cancel_params> } } 
					] 
				} 
			ELSE 
				kill_start_key_binding 
			ENDIF 
		ELSE 
			CreateScreenElement { 
				type = VMenu 
				parent = keyboard_anchor 
				id = keyboard_vmenu 
				pos = PAIR(320.00000000000, 197.00000000000) 
				internal_just = [ center top ] 
				regular_space_amount = 30 
				event_handlers = [ 
					{ pad_L2 keyboard_handle_L2 params = { max_length = <max_length> } } 
					{ pad_R2 keyboard_handle_R2 params = { max_length = <max_length> } } 
					{ pad_L1 keyboard_handle_L2 params = { max_length = <max_length> } } 
					{ pad_R1 keyboard_handle_R2 params = { max_length = <max_length> } } 
					{ pad_up keyboard_change_key_sound } 
					{ pad_down keyboard_change_key_sound } 
					{ pad_l3 change_fontcolor_keyboard } 
				] 
			} 
			IF NOT GotParam no_back 
				SetScreenElementProps { 
					id = keyboard_vmenu 
					event_handlers = [ 
						{ pad_back generic_menu_pad_back params = { callback = <keyboard_cancel_script> <keyboard_cancel_params> } } 
					] 
				} 
			ELSE 
				kill_start_key_binding 
			ENDIF 
		ENDIF 
		SetScreenElementProps { 
			id = keyboard_vmenu 
			event_handlers = [ 
				{ pad_backspace keyboard_handle_backspace } 
				{ pad_space keyboard_handle_space params = { max_length = <max_length> } } 
			] 
		} 
		IF NOT GotParam no_back 
			SetScreenElementProps { 
				id = keyboard_vmenu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = <keyboard_cancel_script> <keyboard_cancel_params> } } 
				] 
			} 
		ELSE 
			kill_start_key_binding 
		ENDIF 
		IF GotParam text_block 
			keyboard_anchor : SetTags text_block 
			CreateScreenElement { 
				type = ContainerElement 
				parent = keyboard_vmenu 
				internal_just = [ center center ] 
				dims = PAIR(10.00000000000, 20.00000000000) 
				not_focusable 
			} 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = keyboard_anchor 
				id = keyboard_display_string 
				font = dialog 
				just = [ center top ] 
				internal_just = [ left center ] 
				text = <text> 
				not_focusable 
				pos = PAIR(320.00000000000, 90.00000000000) 
				dims = ( PAIR(1.00000000000, 0.00000000000) * keyboard_text_block_width + PAIR(20.00000000000, 400.00000000000) ) 
				allow_expansion 
				line_spacing = 0.86000001431 
				scale = 0.85000002384 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNIGHLIGHTED_TEXT_COLOR ) 
			} 
		ELSE 
			CreateScreenElement { 
				type = ContainerElement 
				parent = keyboard_vmenu 
				id = keyboard_display_string_container 
				dims = PAIR(10.00000000000, 20.00000000000) 
				not_focusable 
			} 
			CreateScreenElement { 
				type = TextElement 
				parent = <id> 
				id = keyboard_display_string 
				pos = ( PAIR(-139.00000000000, 7.00000000000) + <display_text_offset> ) 
				font = dialog 
				just = [ left top ] 
				text = <text> 
				scale = <display_text_scale> 
				not_focusable 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
			} 
		ENDIF 
		IF GotParam password 
			GetTextElementLength id = keyboard_display_string 
			SetScreenElementProps id = keyboard_display_string text = "" 
			IF ( <length> > 1 ) 
				BEGIN 
					TextElementConcatenate id = keyboard_display_string "*" 
				REPEAT ( <length> -1 ) 
				TextElementConcatenate id = keyboard_display_string "_" 
			ENDIF 
		ENDIF 
		IF GotParam text_block 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = keyboard_anchor 
				id = keyboard_current_string 
				font = dialog 
				just = [ center top ] 
				text = <org_text> 
				not_focusable 
				pos = PAIR(320.00000000000, 85.00000000000) 
				dims = ( PAIR(1.00000000000, 0.00000000000) * keyboard_text_block_width + PAIR(0.00000000000, 20.00000000000) ) 
				allow_expansion 
				scale = 0 
			} 
		ELSE 
			CreateScreenElement { 
				type = TextElement 
				parent = keyboard_anchor 
				id = keyboard_current_string 
				font = dialog 
				just = [ center top ] 
				text = <org_text> 
				not_focusable 
				pos = PAIR(320.00000000000, 85.00000000000) 
				scale = 0 
			} 
		ENDIF 
		IF GotParam allowed_characters 
			keyboard_current_string : SetTags allowed_characters = <allowed_characters> 
		ENDIF 
		IF GotParam max_length 
			IF ( <max_length> < 1 ) 
				script_assert "create_onscreen_keyboard called with bad max_length" 
			ENDIF 
			BEGIN 
				GetTextElementLength id = keyboard_current_string 
				IF ( <length> > <max_length> ) 
					TextElementBackspace id = keyboard_current_string 
					TextElementBackspace id = keyboard_display_string 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT 
		ENDIF 
		CreateScreenElement { 
			type = spriteElement 
			parent = keyboard_anchor 
			id = keyboard_options_bg 
			texture = options_bg 
			scale = PAIR(1.00000000000, 1.00000000000) 
			rgba = [ 0 0 0 0 ] 
			just = [ center center ] 
			pos = PAIR(267.00000000000, 80.00000000000) 
		} 
		keyboard_character_set_guide 
		keyboard_create_key_sprites <...> 
		keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length> 
		change keyboard_current_charset = alphanumeric_lower 
		FireEvent type = focus target = keyboard_vmenu 
		DoScreenElementMorph id = keyboard_anchor pos = PAIR(320.00000000000, 600.00000000000) 
		DoScreenElementMorph id = keyboard_anchor pos = PAIR(320.00000000000, 240.00000000000) time = 0.30000001192 
	ENDIF 
	IF NOT GotParam no_buttons 
		AssignAlias id = keyboard_bg_anchor alias = current_menu_anchor 
	ENDIF 
	StartKeyboardHandler max_length = <max_length> 
ENDSCRIPT

SCRIPT keyboard_character_set_guide 
	CreateScreenElement { 
		type = ContainerElement 
		parent = keyboard_vmenu 
		id = char_guide_anchor 
		not_focusable 
	} 
	guide_box_rgba = [ 35 35 35 80 ] 
	CreateScreenElement { 
		type = TextElement 
		parent = char_guide_anchor 
		id = char_guide_l2 
		font = dialog 
		rgba = [ 128 128 128 100 ] 
		just = [ left top ] 
		text = #"\\mf" 
		not_focusable 
		pos = PAIR(-160.00000000000, -6.00000000000) 
		scale = PAIR(0.69999998808, 0.80000001192) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = char_guide_anchor 
		id = char_guide_left_arrow 
		texture = left_arrow 
		scale = PAIR(0.75000000000, 0.64999997616) 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(-140.00000000000, -4.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = char_guide_anchor 
		id = char_guide_symbols 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		text = #"SYMBOLS" 
		not_focusable 
		pos = PAIR(-127.00000000000, -3.00000000000) 
		scale = 0.77999997139 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = char_guide_anchor 
		id = char_guide_allcaps 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		text = #" ALL-CAPS" 
		not_focusable 
		pos = PAIR(-62.00000000000, -3.00000000000) 
		scale = 0.77999997139 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = char_guide_anchor 
		id = char_guide_lower 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		text = #"  LOWER" 
		not_focusable 
		pos = PAIR(5.00000000000, -3.00000000000) 
		scale = 0.77999997139 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = char_guide_anchor 
		id = char_guide_foreign 
		font = small 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		text = #"FOREIGN" 
		not_focusable 
		pos = PAIR(72.00000000000, -3.00000000000) 
		scale = 0.77999997139 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = spriteElement 
		parent = char_guide_anchor 
		id = char_guide_right_arrow 
		texture = right_arrow 
		scale = PAIR(0.75000000000, 0.64999997616) 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		just = [ left top ] 
		pos = PAIR(130.00000000000, -4.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = char_guide_anchor 
		id = char_guide_r2 
		font = dialog 
		rgba = [ 128 128 128 100 ] 
		just = [ left top ] 
		text = #"\\mg" 
		not_focusable 
		pos = PAIR(140.00000000000, -6.00000000000) 
		scale = PAIR(0.69999998808, 0.80000001192) 
		z_priority = 5 
	} 
	reset_char_disabled 
ENDSCRIPT

SCRIPT keyboard_create_key_sprites 
	keyboard_add_hmenu id = keyboard_row_1 
	keyboard_add_hmenu id = keyboard_row_2 
	keyboard_add_hmenu id = keyboard_row_3 
	keyboard_add_hmenu id = keyboard_row_4 
	keyboard_add_hmenu id = keyboard_row_5 
	keyboard_add_hmenu id = keyboard_row_6 
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_1 number_of_buttons = 10 
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_2 number_of_buttons = 10 
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_3 number_of_buttons = 10 
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_4 number_of_buttons = 6 
	keyboard_add_special_button { 
		hmenu_id = keyboard_row_4 
		pad_choose_script = keyboard_handle_backspace 
		text = "Backspace" 
		pad_button_text = "\\m9" 
		text_pos = PAIR(124.00000000000, 8.00000000000) 
		pad_button_pos = PAIR(40.00000000000, 8.00000000000) 
		text_scale = PAIR(0.85000002384, 0.55000001192) 
		width = 128 
		grid_x = 6 
	} 
	keyboard_add_special_button { 
		hmenu_id = keyboard_row_5 
		pad_choose_script = keyboard_handle_shift 
		pad_choose_params = { max_length = <max_length> } 
		text = "Shift" 
		text_id = shift_text 
		text_pos = PAIR(47.00000000000, 2.00000000000) 
		width = 96 
		grid_x = 0 
	} 
	keyboard_add_special_button { 
		hmenu_id = keyboard_row_5 
		pad_choose_script = keyboard_handle_caps 
		pad_choose_params = { max_length = <max_length> } 
		text = "Caps Lk" 
		text_id = caps_lock_text 
		text_pos = PAIR(47.00000000000, 2.00000000000) 
		text_scale = PAIR(0.94999998808, 0.55000001192) 
		width = 96 
		grid_x = 3 
	} 
	keyboard_add_special_button { 
		hmenu_id = keyboard_row_5 
		pad_choose_script = keyboard_handle_space 
		pad_choose_params = { max_length = <max_length> } 
		text = "Space" 
		pad_button_text = "\\m8" 
		text_pos = PAIR(105.00000000000, 8.00000000000) 
		pad_button_pos = PAIR(40.00000000000, 8.00000000000) 
		width = 128 
		grid_x = 6 
	} 
	keyboard_add_special_button { 
		hmenu_id = keyboard_row_6 
		pad_choose_script = keyboard_done pad_choose_params = <...> 
		button_id = keyboard_done_button 
		text = "Done" 
		text_pos = PAIR(62.00000000000, 2.00000000000) 
		width = 128 
		grid_x = 0 
	} 
	IF GotParam allow_cancel 
		SetScreenElementProps { 
			id = keyboard_vmenu 
			event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <keyboard_cancel_script> <keyboard_cancel_params> } } ] 
			replace_handlers 
		} 
		keyboard_add_special_button { 
			hmenu_id = keyboard_row_6 
			pad_choose_script = generic_menu_pad_back params <keyboard_cancel_script> 
			pad_choose_params = { callback = <keyboard_cancel_script> <keyboard_cancel_params> } 
			text = "Cancel" 
			pad_button_text = "\\m1" 
			text_pos = PAIR(116.00000000000, 8.00000000000) 
			pad_button_pos = PAIR(37.00000000000, 8.00000000000) 
			width = 128 
			grid_x = 6 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_change_charset 
	IF NOT keyboard_anchor : GetSingleTag max_length 
		max_length = 80 
	ENDIF 
	BEGIN 
		IF GetNextArrayElement <charset> index = <index> 
			keyboard_change_key_row row = <element> row_number = <index> max_length = <max_length> 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT keyboard_change_key_row 
	FormatText ChecksumName = hmenu_id "keyboard_row_%i" i = ( <row_number> + 1 ) 
	BEGIN 
		IF GetNextArrayElement <row> index = <index> 
			SetScreenElementProps { 
				id = { <hmenu_id> child = { <index> child = 0 } } 
				text = <element> 
				replace_handlers 
			} 
			SetScreenElementProps { 
				id = { <hmenu_id> child = <index> } 
				tags = { tag_grid_x = <index> } 
			} 
			keyboard_set_button_events { 
				hmenu_id = <hmenu_id> 
				index = <index> 
				text = <element> 
				max_length = <max_length> 
			} 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT destroy_onscreen_keyboard 
	KillSpawnedScript name = keyboard_key_focus 
	IF ObjectExists id = keyboard_anchor 
		DestroyScreenElement id = keyboard_anchor 
	ENDIF 
	IF ObjectExists id = keyboard_bg_anchor 
		DestroyScreenElement id = keyboard_bg_anchor 
	ENDIF 
	StopKeyboardHandler 
	change keyboard_caps_lock = 0 
ENDSCRIPT

SCRIPT keyboard_add_hmenu 
	CreateScreenElement { 
		type = Hmenu 
		parent = keyboard_vmenu 
		id = <id> 
		internal_just = [ left center ] 
		event_handlers = [ { pad_left keyboard_change_key_sound } 
			{ pad_right keyboard_change_key_sound } 
		] 
	} 
ENDSCRIPT

SCRIPT keyboard_add_generic_buttons_to_hmenu 
	BEGIN 
		CreateScreenElement { 
			type = spriteElement 
			parent = <hmenu_id> 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
			texture = generic_key 
			scale = keyboard_button_scale 
		} 
		keyboard_create_dummy_text id = <id> 
	REPEAT <number_of_buttons> 
ENDSCRIPT

SCRIPT keyboard_set_button_events 
	IF GotParam id 
		IF ObjectExists id = <id> 
			SetScreenElementProps { 
				id = <id> 
				event_handlers = [ { focus keyboard_button_focus } 
					{ unfocus keyboard_button_unfocus } 
					{ pad_choose keyboard_button_pressed params = { text = <text> max_length = <max_length> } } 
					{ pad_start keyboard_button_pressed params = { text = <text> max_length = <max_length> } } 
				] 
				replace_handlers 
			} 
		ENDIF 
	ELSE 
		IF ObjectExists id = <hmenu_id> 
			IF ObjectExists id = { <hmenu_id> child = <index> } 
				SetScreenElementProps { 
					id = { <hmenu_id> child = <index> } 
					event_handlers = [ { focus keyboard_button_focus } 
						{ unfocus keyboard_button_unfocus } 
						{ pad_choose keyboard_button_pressed params = { text = <text> max_length = <max_length> } } 
						{ pad_start keyboard_button_pressed params = { text = <text> max_length = <max_length> } } 
					] 
					replace_handlers 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_create_dummy_text 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		just = [ center center ] 
		pos = PAIR(17.00000000000, 8.00000000000) 
		scale = keyboard_text_scale 
		event_handlers = [ { focus keyboard_text_focus } 
			{ unfocus keyboard_text_unfocus } 
		] 
		font = dialog 
	} 
ENDSCRIPT

SCRIPT keyboard_add_special_button { text_pos = PAIR(121.00000000000, 8.00000000000) 
		text_scale = keyboard_text_scale 
		pad_button_pos = PAIR(33.00000000000, 8.00000000000) 
		button_scale = keyboard_button_scale 
		width = 32 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		id = <button_id> 
		parent = <hmenu_id> 
		tags = { tag_grid_x = <grid_x> tag_txt_offset = ( 2 + ( <width> - 16 ) / 4 ) } 
		dims = ( PAIR(1.00000000000, 0.00000000000) * <width> + PAIR(0.00000000000, 35.00000000000) ) 
		internal_just = [ center center ] 
	} 
	<parent_id> = <id> 
	<unhighlight_color> = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	IF NOT keyboard_anchor : GetSingleTag disable_special_character_tabs 
		IF GlobalExists name = EG_in_create_a_graphic type = int 
			IF ( EG_in_create_a_graphic = 1 ) 
				IF ( ( <text> = "Shift" ) | ( <text> = "Caps Lk" ) ) 
					<unhighlight_color> = [ 40 40 40 128 ] 
					SetScreenElementProps id = <parent_id> not_focusable 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	<root_pos> = PAIR(5.00000000000, 18.00000000000) 
	CreateScreenElement { 
		type = spriteElement 
		parent = <parent_id> 
		scale = <button_scale> 
		texture = key_left 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
		pos = <root_pos> 
	} 
	<button_id> = <id> 
	<iterations> = ( ( <width> - 16 ) / 4 ) 
	<dx> = 4 
	BEGIN 
		CreateScreenElement { 
			type = spriteElement 
			parent = <parent_id> 
			texture = key_middle 
			scale = ( keyboard_button_scale + PAIR(0.10000000149, 0.00000000000) ) 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
			pos = ( PAIR(1.00000000000, 0.00000000000) * <dx> + <root_pos> ) 
			not_focusable 
		} 
		<dx> = ( <dx> + 4 ) 
	REPEAT <iterations> 
	CreateScreenElement { 
		type = spriteElement 
		parent = <parent_id> 
		scale = <button_scale> 
		texture = key_right 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
		not_focusable 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <dx> + <root_pos> ) 
	} 
	IF ( ( <text> = "space" ) | ( <text> = "backspace" ) ) 
		SetScreenElementProps { 
			id = <parent_id> 
			event_handlers = [ { focus keyboard_button_focus } 
				{ unfocus keyboard_button_unfocus } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
			replace_handlers 
		} 
	ELSE 
		SetScreenElementProps { 
			id = <parent_id> 
			event_handlers = [ { focus keyboard_button_focus } 
				{ unfocus keyboard_button_unfocus } 
				{ pad_choose generic_keyboard_sound } 
				{ pad_start generic_keyboard_sound } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_button_text 
		CreateScreenElement { 
			type = TextElement 
			parent = <parent_id> 
			z_priority = 10 
			scale = ( <text_scale> + PAIR(0.00000000000, 0.20000000298) ) 
			font = small 
			text = <pad_button_text> 
			pos = ( <pad_button_pos> + PAIR(0.00000000000, 10.00000000000) ) 
			just = [ right center ] 
		} 
	ENDIF 
	IF GotParam pad_button_text 
		GetStackedScreenElementPos x id = <id> offset = PAIR(3.00000000000, 0.00000000000) 
		<text_pos> = <pos> 
		<text_just> = [ left top ] 
	ELSE 
		GetScreenElementPosition id = <button_id> 
		<text_pos> = ( <text_pos> + PAIR(0.00000000000, 8.00000000000) ) 
		<text_just> = [ center top ] 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		z_priority = 10 
		font = dialog 
		id = <text_id> 
		text = <text> 
		pos = <text_pos> 
		scale = ( <text_scale> + PAIR(0.00000000000, 0.20000000298) ) 
		just = <text_just> 
		rgba = <unhighlight_color> 
		event_handlers = [ { focus keyboard_text_focus } 
			{ unfocus keyboard_text_unfocus } 
		] 
	} 
ENDSCRIPT

SCRIPT keyboard_button_focus 
	GetTags 
	<txt_offset> = 0 
	IF GotParam tag_txt_offset 
		<txt_offset> = <tag_txt_offset> 
	ENDIF 
	IF ScreenElementExists id = { <id> child = ( <txt_offset> + 1 ) } 
		RunScriptOnScreenElement id = { <id> child = ( <txt_offset> + 1 ) } keyboard_text_focus 
		SpawnScript keyboard_key_focus params = { id = <id> org_scale = PAIR(1.00000000000, 1.04999995232) } 
	ELSE 
		IF GotParam tag_txt_offset 
			RunScriptOnScreenElement id = { <id> child = <txt_offset> } keyboard_text_focus 
			SpawnScript keyboard_key_focus params = { id = <id> org_scale = PAIR(1.00000000000, 1.04999995232) } 
		ELSE 
			RunScriptOnScreenElement id = { <id> child = <txt_offset> } keyboard_text_focus 
			SpawnScript keyboard_key_focus params = { id = <id> org_scale = PAIR(1.00000000000, 1.60000002384) } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_button_unfocus 
	GetTags 
	<txt_offset> = 0 
	IF GotParam tag_txt_offset 
		<txt_offset> = <tag_txt_offset> 
	ENDIF 
	IF ScreenElementExists id = { <id> child = ( <txt_offset> + 1 ) } 
		RunScriptOnScreenElement id = { <id> child = ( <txt_offset> + 1 ) } keyboard_text_unfocus 
		KillSpawnedScript name = keyboard_key_focus 
		DoScreenElementMorph id = <id> time = 0 scale = PAIR(1.00000000000, 1.00000000000) 
	ELSE 
		IF GotParam tag_txt_offset 
			RunScriptOnScreenElement id = { <id> child = <txt_offset> } keyboard_text_unfocus 
			KillSpawnedScript name = keyboard_key_focus 
			DoScreenElementMorph id = <id> time = 0 scale = PAIR(1.00000000000, 1.00000000000) 
		ELSE 
			RunScriptOnScreenElement id = { <id> child = <txt_offset> } keyboard_text_unfocus 
			KillSpawnedScript name = keyboard_key_focus 
			DoScreenElementMorph id = <id> time = 0 scale = PAIR(1.00000000000, 1.60000002384) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_key_focus 
	BEGIN 
		IF ObjectExists id = <id> 
			DoScreenElementMorph id = <id> time = 0.02999999933 scale = ( <org_scale> * 1.04999995232 ) 
		ENDIF 
		wait 0.20000000298 second 
		IF ObjectExists id = <id> 
			DoScreenElementMorph id = <id> time = 0.02999999933 scale = ( <org_scale> * 0.94999998808 ) 
		ENDIF 
		wait 0.20000000298 second 
	REPEAT 
ENDSCRIPT

SCRIPT keyboard_text_focus 
	SetProps rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
ENDSCRIPT

SCRIPT keyboard_text_unfocus 
	SetProps rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
ENDSCRIPT

SCRIPT change_fontcolor_keyboard 
	checksum = ( console_font_color ) 
	SWITCH <checksum> 
		CASE text_color_c0 
			keyboard_button_pressed text = "\\c2" 
			change console_font_color = text_color_c2 
		CASE text_color_c2 
			keyboard_button_pressed text = "\\c3" 
			change console_font_color = text_color_c3 
		CASE text_color_c3 
			keyboard_button_pressed text = "\\c4" 
			change console_font_color = text_color_c4 
		CASE text_color_c4 
			keyboard_button_pressed text = "\\c5" 
			change console_font_color = text_color_c5 
		CASE text_color_c5 
			keyboard_button_pressed text = "\\c6" 
			change console_font_color = text_color_c6 
		CASE text_color_c6 
			keyboard_button_pressed text = "\\c7" 
			change console_font_color = text_color_c7 
		CASE text_color_c7 
			keyboard_button_pressed text = "\\c8" 
			change console_font_color = text_color_c8 
		CASE text_color_c8 
			keyboard_button_pressed text = "\\c9" 
			change console_font_color = text_color_c9 
		CASE text_color_c9 
			keyboard_button_pressed text = "\\ca" 
			change console_font_color = text_color_ca 
		CASE text_color_ca 
			keyboard_button_pressed text = "\\c0" 
			change console_font_color = text_color_c0 
	ENDSWITCH 
ENDSCRIPT

last_special_keyboard_press_slash = 0 
SCRIPT special_keyboard_button_pressed 
	IF ScreenElementExists id = keyboard_current_string 
		IF GotParam text 
			IF NOT ( <text> = "\\" ) 
				keyboard_button_pressed text = <text> 
			ELSE 
				IF ( last_special_keyboard_press_slash = 1 ) 
					keyboard_handle_backspace backslash 
					last_special_keyboard_press_slash = ( last_special_keyboard_press_slash + 1 ) 
					change last_special_keyboard_press_slash = <last_special_keyboard_press_slash> 
					keyboard_button_pressed text = <text> 
				ELSE 
					IF ( last_special_keyboard_press_slash < 3 ) 
						IF ( last_special_keyboard_press_slash = 2 ) 
							last_special_keyboard_press_slash = ( last_special_keyboard_press_slash + 1 ) 
							change last_special_keyboard_press_slash = <last_special_keyboard_press_slash> 
							keyboard_handle_backspace backslash 
							keyboard_button_pressed text = "\\\\" 
							RETURN 
						ENDIF 
						last_special_keyboard_press_slash = ( last_special_keyboard_press_slash + 1 ) 
						change last_special_keyboard_press_slash = <last_special_keyboard_press_slash> 
						keyboard_button_pressed text = "\\\\" 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_button_pressed 
	printf "keyboard_button_pressed" 
	printf <text> 
	IF NOT ( <text> = "\\\\" ) 
		IF NOT ( <text> = "\\" ) 
			change last_special_keyboard_press_slash = 0 
		ENDIF 
	ENDIF 
	IF NOT keyboard_anchor : GetSingleTag max_length 
		max_length = 80 
	ENDIF 
	IF GotParam max_length 
		GetTextElementLength id = keyboard_current_string 
		IF ( <length> > ( <max_length> - 1 ) ) 
			PlaySound GUI_Buzzer01 
			printf "Reached max_length! [length=%a, max_length=%b]" a = <length> a = <max_length> 
			RETURN 
		ENDIF 
	ENDIF 
	keyboard_current_string : GetTags 
	IF GotParam allowed_characters 
		IF ArrayContains array = <allowed_characters> contains = <text> 
			PlaySound MenuUp 
		ELSE 
			PlaySound GUI_Buzzer01 
			RETURN 
		ENDIF 
	ELSE 
		PlaySound MenuUp 
	ENDIF 
	GetScreenElementDims id = keyboard_display_string 
	IF ( <height> > 40 ) 
		<last_line> = last_line 
	ENDIF 
	GetTextElementLength id = keyboard_current_string 
	IF ( <length> > 92 ) 
		printf "String too long" 
		RETURN 
	ENDIF 
	GetTextElementString id = keyboard_current_string 
	FormatText TextName = otext_copy "%a%b" a = <string> b = <text> 
	DestroyScreenElement id = keyboard_current_string 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = keyboard_anchor 
		id = keyboard_current_string 
		font = dialog 
		just = [ center top ] 
		text = <otext_copy> 
		not_focusable 
		pos = PAIR(320.00000000000, 85.00000000000) 
		dims = ( PAIR(1.00000000000, 0.00000000000) * keyboard_text_block_width + PAIR(0.00000000000, 10.00000000000) ) 
		allow_expansion 
		scale = 0 
	} 
	keyboard_anchor : GetTags 
	IF GotParam password 
		TextElementBackspace id = keyboard_display_string 
		FormatText TextName = text_w_cursor "%s_" s = "*" 
		TextElementConcatenate id = keyboard_display_string <text_w_cursor> enforce_max_width <last_line> 
	ELSE 
		TextElementBackspace id = keyboard_display_string 
		GetTextElementString id = keyboard_current_string 
		printf <string> 
		FormatText TextName = text_w_cursor "%s_" s = <string> 
		GetTextElementLength id = keyboard_display_string 
		original_length = <length> 
		IF ( <original_length> > 0 ) 
			BEGIN 
				GetTextElementLength id = keyboard_display_string 
				IF ( <length> > 0 ) 
					TextElementBackspace id = keyboard_display_string 
				ENDIF 
			REPEAT <original_length> 
		ENDIF 
		TextElementConcatenate id = keyboard_display_string <text_w_cursor> enforce_max_width <last_line> 
	ENDIF 
	GetScreenElementDims id = keyboard_display_string 
	IF GotParam no_buttons 
		max_string_width = 550 
	ELSE 
		max_string_width = 300 
	ENDIF 
	IF ScreenElementExists id = keyboard_display_string_container 
		IF ( <width> > <max_string_width> ) 
			TextElementBackspace id = keyboard_display_string 
			TextElementBackspace id = keyboard_display_string 
			TextElementBackspace id = keyboard_current_string 
			PlaySound GUI_Buzzer01 
		ENDIF 
	ELSE 
		printf "%s %t" s = <height> t = <width> 
		IF ( <height> > 80 ) 
			TextElementBackspace id = keyboard_display_string 
			TextElementBackspace id = keyboard_current_string 
			IF NOT ( <text> = " " ) 
				TextElementBackspace id = keyboard_display_string 
				TextElementConcatenate id = keyboard_display_string " " enforce_max_width <last_line> 
			ENDIF 
			printf "string reached end of keyboard!" 
			PlaySound GUI_Buzzer01 
		ENDIF 
	ENDIF 
	SWITCH keyboard_current_charset 
		CASE alphanumeric_lower 
			IF IsTrue keyboard_caps_lock 
				keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
				change keyboard_current_charset = alphanumeric_upper 
			ENDIF 
		CASE alphanumeric_upper 
			IF NOT IsTrue keyboard_caps_lock 
				keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length> 
				change keyboard_current_charset = alphanumeric_lower 
			ENDIF 
	ENDSWITCH 
	GetTextElementString id = keyboard_display_string 
	printf <string> 
	GetTextElementLength id = keyboard_current_string 
	keyboard_current_string : SetTags allowed_characters = <allowed_characters> 
ENDSCRIPT

keyboard_toggling_char_set = 0 
SCRIPT keyboard_handle_L2 
	IF NOT keyboard_anchor : GetSingleTag disable_special_character_tabs 
		IF GlobalExists name = EG_in_create_a_graphic type = int 
			IF ( EG_in_create_a_graphic = 1 ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( keyboard_toggling_char_set = 1 ) 
		RETURN 
	ENDIF 
	change keyboard_toggling_char_set = 1 
	IF keyboard_anchor : GetSingleTag disable_special_character_tabs 
		SWITCH keyboard_current_charset 
			CASE alphanumeric_upper 
				change keyboard_current_charset = foreign_charset 
		ENDSWITCH 
	ENDIF 
	SWITCH keyboard_current_charset 
		CASE alphanumeric_lower 
			keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_upper 
			reset_char_guides 
			SetScreenElementProps id = char_guide_allcaps rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			change keyboard_caps_lock = 1 
		CASE alphanumeric_upper 
			keyboard_change_charset charset = punctuation_charset max_length = <max_length> 
			change keyboard_current_charset = punctuation_charset 
			reset_char_guides 
			SetScreenElementProps id = char_guide_symbols rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		CASE punctuation_charset 
			keyboard_change_charset charset = foreign_charset max_length = <max_length> 
			change keyboard_current_charset = foreign_charset 
			reset_char_guides 
			SetScreenElementProps id = char_guide_foreign rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		CASE foreign_charset 
			keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_lower 
			reset_char_guides 
			SetScreenElementProps id = char_guide_lower rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	ENDSWITCH 
	RunScriptOnScreenElement menu_blink_arrow id = char_guide_left_arrow 
	PlaySound MenuUp 
	wait 0.30000001192 seconds 
	change keyboard_toggling_char_set = 0 
ENDSCRIPT

SCRIPT keyboard_handle_R2 
	IF NOT keyboard_anchor : GetSingleTag disable_special_character_tabs 
		IF GlobalExists name = EG_in_create_a_graphic type = int 
			IF ( EG_in_create_a_graphic = 1 ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( keyboard_toggling_char_set = 1 ) 
		RETURN 
	ENDIF 
	change keyboard_toggling_char_set = 1 
	IF keyboard_anchor : GetSingleTag disable_special_character_tabs 
		SWITCH keyboard_current_charset 
			CASE alphanumeric_lower 
				change keyboard_current_charset = punctuation_charset 
		ENDSWITCH 
	ENDIF 
	SWITCH keyboard_current_charset 
		CASE alphanumeric_lower 
			keyboard_change_charset charset = foreign_charset max_length = <max_length> 
			change keyboard_current_charset = foreign_charset 
			reset_char_guides 
			SetScreenElementProps id = char_guide_foreign rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		CASE alphanumeric_upper 
			keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_lower 
			reset_char_guides 
			SetScreenElementProps id = char_guide_lower rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		CASE punctuation_charset 
			keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_upper 
			reset_char_guides 
			SetScreenElementProps id = char_guide_allcaps rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			change keyboard_caps_lock = 1 
		CASE foreign_charset 
			keyboard_change_charset charset = punctuation_charset max_length = <max_length> 
			change keyboard_current_charset = punctuation_charset 
			reset_char_guides 
			SetScreenElementProps id = char_guide_symbols rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	ENDSWITCH 
	RunScriptOnScreenElement menu_blink_arrow id = char_guide_right_arrow 
	PlaySound MenuUp 
	wait 0.30000001192 seconds 
	change keyboard_toggling_char_set = 0 
ENDSCRIPT

SCRIPT reset_char_guides 
	SetScreenElementProps id = char_guide_allcaps rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	SetScreenElementProps id = char_guide_lower rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	SetScreenElementProps id = char_guide_symbols rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	SetScreenElementProps id = char_guide_foreign rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	reset_char_disabled 
	change keyboard_caps_lock = 0 
ENDSCRIPT

SCRIPT reset_char_disabled 
	IF keyboard_anchor : GetSingleTag disable_special_character_tabs 
		SetScreenElementProps id = char_guide_symbols rgba = [ 50 50 50 128 ] 
		SetScreenElementProps id = char_guide_foreign rgba = [ 50 50 50 128 ] 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_handle_shift 
	PlaySound MenuUp 
	SWITCH keyboard_current_charset 
		CASE alphanumeric_lower 
			keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_upper 
		CASE alphanumeric_upper 
			keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_lower 
	ENDSWITCH 
ENDSCRIPT

SCRIPT keyboard_handle_backspace 
	IF NOT ( GotParam backslash ) 
		change last_special_keyboard_press_slash = 0 
	ENDIF 
	PlaySound menu03 vol = 60 pitch = 55 
	TextElementBackspace id = keyboard_display_string 
	TextElementBackspace id = keyboard_display_string 
	TextElementConcatenate id = keyboard_display_string "_" 
	IF NOT TextElementBackspace id = keyboard_current_string 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_handle_space 
	keyboard_button_pressed text = " " max_length = <max_length> 
ENDSCRIPT

SCRIPT keyboard_handle_caps 
	PlaySound MenuUp 
	SWITCH keyboard_current_charset 
		CASE alphanumeric_upper 
			keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_lower 
			reset_char_guides 
			SetScreenElementProps id = char_guide_lower rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			change keyboard_caps_lock = 0 
		CASE alphanumeric_lower 
			keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_upper 
			reset_char_guides 
			SetScreenElementProps id = char_guide_allcaps rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			change keyboard_caps_lock = 1 
		CASE punctuation_charset 
			keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_upper 
			reset_char_guides 
			SetScreenElementProps id = char_guide_allcaps rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			change keyboard_caps_lock = 1 
		CASE foreign_charset 
			keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length> 
			change keyboard_current_charset = alphanumeric_upper 
			reset_char_guides 
			SetScreenElementProps id = char_guide_allcaps rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			change keyboard_caps_lock = 1 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT keyboard_done 
	generic_menu_pad_choose_sound 
	SetButtonEventMappings unblock_menu_input 
	IF GotParam min_length 
		GetTextElementLength id = keyboard_current_string 
		IF ( <length> < <min_length> ) 
			printf "Not enough characters" 
			RETURN 
		ENDIF 
	ENDIF 
	change keyboard_current_charset = alphanumeric_lower 
	change keyboard_caps_lock = 0 
	IF GotParam keyboard_done_script 
		printf "calling done script" 
		GotoPreserveParams <keyboard_done_script> 
	ELSE 
		GetTextElementString id = keyboard_current_string 
		IF GotParam string 
			printf "%s" s = <string> 
		ENDIF 
		destroy_onscreen_keyboard 
		exit_pause_menu 
	ENDIF 
ENDSCRIPT

SCRIPT keyboard_cancel 
	destroy_onscreen_keyboard 
	exit_pause_menu 
ENDSCRIPT


alphanumeric_charset_lower = [ 
	[ #"1" #"2" #"3" #"4" #"5" #"6" #"7" #"8" #"9" #"0" ] 
	[ #"a" #"b" #"c" #"d" #"e" #"f" #"g" #"h" #"i" #"j" ] 
	[ #"k" #"l" #"m" #"n" #"o" #"p" #"q" #"r" #"s" #"t" ] 
	[ #"u" #"v" #"w" #"x" #"y" #"z" ] 
] 
alphanumeric_charset_upper = [ 
	[ #"1" #"2" #"3" #"4" #"5" #"6" #"7" #"8" #"9" #"0" ] 
	[ #"A" #"B" #"C" #"D" #"E" #"F" #"G" #"H" #"I" #"J" ] 
	[ #"K" #"L" #"M" #"N" #"O" #"P" #"Q" #"R" #"S" #"T" ] 
	[ #"U" #"V" #"W" #"X" #"Y" #"Z" ] 
] 
punctuation_charset = [ 
	[ #"1" #"2" #"3" #"4" #"5" #"6" #"7" #"8" #"9" #"0" ] 
	[ #"." #"," #"!" #"?" #"-" #"\xA6" #"\'" #"+" #"/" #"^" ] 
	[ #"#" #"$" #"{" #"*" #"@" #"`" #"&" #":" #"<" #">" ] 
	[ #"_" #"-" #"\xA1" #"=" #"(" #")" ] 
] 
foreign_charset = [ 
	[ #"\xDF" #"\xC4" #"\xDC" #"\xD6" #"\xE0" #"\xE2" #"\xEA" #"\xE8" #"\xE9" #"\xEB" ] 
	[ #"\xEC" #"\xEE" #"\xEF" #"\xF4" #"\xF2" #"\xD6" #"\xF9" #"\xFB" #"\xDC" #"\xE7" ] 
	[ #"S" #"\xFC" #"\xE4" #"\xF6" #"\xE1" #"\xF3" #"\xFA" #"\xED" #"\xF1" #"\xAE" ] 
	[ #"\xA1" #"\xBF" #"\xE4" #"\xFC" #"\xC9" #"\xA9" ] 
	] standard_charset = { 
	alphanumeric_charset 
	allow_punctuation 
	allow_spaces 
	allow_colors 
} 
gapname_charset = { 
	alphanumeric_charset 
	allow_basic_punctuation 
	allow_spaces 
} 
ip_charset = { 
	ip_control 
	allow_numbers 
	allow_period 
} 
alphanumeric_charset = { 
	allow_numbers 
	allow_uppercase 
	allow_lowercase 
	allow_foreign 
} 
horse_charset = { 
	allow_numbers 
	allow_uppercase 
	allow_lowercase 
} 
SCRIPT truncate_string max_width = 100 
	GetScreenElementDims id = <id> 
	IF ( <max_width> > <width> ) 
		RETURN 
	ENDIF 
	GetTextElementLength id = <id> 
	IF ( 2 > <length> ) 
		printf "too short... can\'t truncate text" 
		RETURN 
	ENDIF 
	initial_width = <width> 
	printf "initial width = %w max width = %m" w = <width> m = <max_width> 
	TextElementConcatenate id = <id> "..." 
	GetScreenElementDims id = <id> 
	extra_width = ( <width> - <initial_width> ) 
	TextElementBackspace id = <id> 
	TextElementBackspace id = <id> 
	TextElementBackspace id = <id> 
	BEGIN 
		GetScreenElementDims id = <id> 
		IF ( ( <width> + <extra_width> ) > <max_width> ) 
			TextElementBackspace id = <id> 
		ELSE 
			BREAK 
		ENDIF 
		GetTextElementLength id = <id> 
		IF ( 0 = <length> ) 
			RETURN 
		ENDIF 
	REPEAT 
	TextElementConcatenate id = <id> "..." 
	GetScreenElementDims id = <id> 
	printf "final width = %w" w = <width> 
ENDSCRIPT

SCRIPT keyboard_change_key_sound 
	PlaySound menu03 vol = 40 
ENDSCRIPT

SCRIPT thugpro_keyboard_buzzer_sound 
	PlaySound GUI_Buzzer01 
ENDSCRIPT


