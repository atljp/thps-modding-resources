
theme_menu_bg_parts_height = 23 
SCRIPT build_pause_menu_parts 
ENDSCRIPT

SCRIPT build_theme_sub_title parent = current_menu_anchor title_scale = 1.89999997616 pos = PAIR(0.00000000000, 0.00000000000) z_priority = 10 right_bracket_z = 1 right_bracket_alpha = 1.00000000000 
	RETURN 
ENDSCRIPT

SCRIPT build_top_and_bottom_blocks { top_pos = PAIR(0.00000000000, -29.00000000000) 
		bot_pos = PAIR(0.00000000000, 474.00000000000) 
		top_z = 1 
		bot_z = 5 
		parent = current_menu_anchor 
		scale = PAIR(1.20000004768, 2.04999995232) 
		rgba = [ 100 100 100 128 ] 
	} 
	RETURN 
ENDSCRIPT

SCRIPT pause_menu_gradient parent = root_window 
	IF LevelIs Load_MainMenu 
		RETURN 
	ENDIF 
	IF LevelIs load_cas 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = pause_gradient 
		DestroyScreenElement id = pause_gradient 
	ENDIF 
	IF GotParam off 
		RETURN 
	ENDIF 
	SetScreenElementLock off id = <parent> 
	IF GotParam right 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent> 
			id = pause_gradient 
			texture = white3 
			scale = PAIR(12.00000000000, 6.00000000000) 
			rgba = [ 0 0 0 90 ] 
			pos = PAIR(340.00000000000, -60.00000000000) 
			rot_angle = 0 
			just = [ left top ] 
			z_priority = -50 
		} 
	ELSE 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent> 
			id = pause_gradient 
			texture = white3 
			rgba = [ 0 0 0 110 ] 
			rot_angle = 179.89999389648 
			scale = PAIR(20.00000000000, 40.00000000000) 
			pos = PAIR(315.00000000000, 480.00000000000) 
			just = [ top left ] 
			z_priority = -50 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT make_new_themed_sub_menu dims = PAIR(300.00000000000, 300.00000000000) pos = PAIR(215.00000000000, 72.00000000000) menu_id = sub_menu vmenu_id = sub_vmenu right_bracket_alpha = <right_bracket_alpha> right_bracket_z = 1 
	IF LevelIs Load_MainMenu 
		IF NOT GotParam skateshop_pos 
			pos = PAIR(100.00000000000, 70.00000000000) 
		ELSE 
			pos = <skateshop_pos> 
		ENDIF 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		generic_menu_animate_out 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = menu_parts_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	IF GotParam Scrolling 
		type = VScrollingMenu 
		scrolling_menu_id = sub_scrolling_menu 
	ENDIF 
	make_new_menu { 
		pos = <pos> 
		parent = menu_parts_anchor 
		internal_just = [ left center ] 
		menu_id = <menu_id> 
		vmenu_id = <vmenu_id> 
		scrolling_menu_id = <scrolling_menu_id> 
		type = <type> 
		dims = <dims> 
		dont_allow_wrap = <dont_allow_wrap> 
		<no_menu_title> 
	} 
	IF GotParam scale_highlight_text 
		<vmenu_id> : SetTags scale_highlight_text = <scale_highlight_text> 
	ENDIF 
	AssignAlias id = menu_parts_anchor alias = current_menu_anchor 
	IF NOT GotParam helper_text 
		create_helper_text generic_helper_text 
	ELSE 
		create_helper_text <helper_text> 
	ENDIF 
	kill_start_key_binding 
	destroy_menu_background_title 
	create_menu_background_title title = <title> bg_just = right_nobg title_pos = PAIR(215.00000000000, 64.00000000000) 
ENDSCRIPT

SCRIPT finish_themed_sub_menu menu = sub_menu end_pos = PAIR(320.00000000000, 240.00000000000) time = 0.20000000298 
	change widest_menu_item_width = 0 
	generic_menu_animate_in force pos = <end_pos> menu = <menu> no_wait 
	FireEvent type = focus target = <menu> 
ENDSCRIPT

SCRIPT make_new_themed_option_menu menu_id = options_menu vmenu_id = options_vmenu right_bracket_alpha = <right_bracket_alpha> 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF InSplitScreenGame 
		GoalManager_ShowPoints 
		options_pos = PAIR(120.00000000000, 68.00000000000) 
	ELSE 
		options_pos = PAIR(120.00000000000, 60.00000000000) 
	ENDIF 
	make_new_menu { 
		menu_id = <menu_id> 
		vmenu_id = <vmenu_id> 
		menu_title = "" 
		pos = <options_pos> 
	} 
	create_helper_text generic_helper_text 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT make_theme_menu_item { focus_script = theme_item_focus 
		text = "Default text" 
		unfocus_script = theme_item_unfocus 
		pad_choose_script = null_script 
		pad_choose_sound = theme_menu_pad_choose_sound 
		scale = 1.00000000000 
		rgba = [ 128 123 20 128 ] 
		dims = PAIR(300.00000000000, 18.00000000000) 
		just = [ right center ] 
		parent = current_menu 
	} 
	IF GotParam not_focusable 
		<rgba> = [ 128 128 128 50 ] 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			just = [ center center ] 
			not_focusable 
		} 
	ELSE 
		<rgba> = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			just = [ center center ] 
			event_handlers = [ 
				{ focus <focus_script> params = { text = <text> } } 
				{ unfocus <unfocus_script> } 
				{ pad_start <pad_choose_sound> } 
				{ pad_choose <pad_choose_sound> } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
		} 
	ENDIF 
	container_id = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		font = small 
		text = <text> 
		rgba = <rgba> 
		scale = <scale> 
		pos = PAIR(210.00000000000, 10.00000000000) 
		just = <just> 
	} 
	IF GotParam mark_first_input 
		SetScreenElementProps { 
			id = <container_id> 
			event_handlers = [ { pad_choose mark_first_input_received } 
				{ pad_start mark_first_input_received } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT theme_menu_add_item { parent = current_menu 
		font = small 
		highlight_bar_scale = PAIR(2.09999990463, 0.69999998808) 
		highlight_bar_pos = PAIR(90.00000000000, -7.00000000000) 
		text_just = [ right center ] 
		focus_script = main_theme_focus 
		unfocus_script = main_theme_unfocus 
		text_pos = PAIR(95.00000000000, -5.00000000000) 
		dims = PAIR(200.00000000000, 20.00000000000) 
		pad_choose_script = nullscript 
		text_alpha = 1.00000000000 
		scale = 1.00000000000 
		z_priority = 3 
		Shadow_offs = PAIR(1.00000000000, 1.00000000000) 
		Shadow_rgba = [ 10 10 10 90 ] 
	} 
	IF NOT GotParam text_rgba 
		text_rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
	IF NOT GotParam line_rgba 
		line_rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
	IF GotParam first_item 
		focus_params = { first_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params> } 
	ELSE 
		IF GotParam last_item 
			focus_params = { last_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params> } 
		ELSE 
			focus_params = { text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params> } 
		ENDIF 
	ENDIF 
	IF GotParam not_focusable 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			event_handlers = [ 
				{ focus <focus_script> params = <focus_params> } 
				{ unfocus <unfocus_script> params = <focus_params> } 
			] 
			replace_handlers 
			not_focusable 
		} 
	ELSE 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			event_handlers = [ 
				{ focus <focus_script> params = <focus_params> } 
				{ unfocus <unfocus_script> params = <focus_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	<anchor_id> = <id> 
	IF GotParam scale_highlight_text 
		<anchor_id> : SetTags scale_highlight_text = <scale_highlight_text> 
	ENDIF 
	IF NOT GotParam no_sound 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ 
				{ pad_choose generic_menu_pad_choose_sound } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start generic_menu_pad_choose_sound } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
		} 
	ELSE 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
		} 
	ENDIF 
	IF GotParam cat_edit_item 
		SetScreenElementProps { id = <anchor_id> 
			event_handlers = [ 
				{ pad_left <pad_right_script> params = { reverse id = <id> value = <value> <params> } } 
				{ pad_right <pad_right_script> params = { id = <id> value = <value> <params> } } 
				{ pad_choose <pad_choose_script> params = <params> } 
				{ pad_start <pad_choose_script> params = <params> } 
			] 
			replace_handlers 
		} 
	ELSE 
		IF GotParam pad_right_script 
			SetScreenElementProps { id = <anchor_id> 
				event_handlers = [ 
					{ pad_left <pad_left_script> params = { <pad_left_params> } } 
					{ pad_right <pad_right_script> params = { <pad_right_params> } } 
				] 
				replace_handlers 
			} 
		ENDIF 
	ENDIF 
	IF GotParam mark_first_input 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_choose mark_first_input_received } 
				{ pad_choose generic_menu_pad_choose_sound } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start mark_first_input_received } 
				{ pad_start generic_menu_pad_choose_sound } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam centered 
		text_just = [ center center ] 
		text_pos = PAIR(85.00000000000, -5.00000000000) 
	ENDIF 
	IF GotParam not_focusable 
		<text_rgba> = [ 60 60 60 75 ] 
		CreateScreenElement { 
			type = TextElement 
			Shadow 
			Shadow_offs = <Shadow_offs> 
			Shadow_rgba = <Shadow_rgba> 
			parent = <anchor_id> 
			id = <text_id> 
			font = <font> 
			text = <text> 
			scale = <scale> 
			pos = <text_pos> 
			just = <text_just> 
			rgba = <text_rgba> 
			alpha = <text_alpha> 
			not_focusable 
			z_priority = <z_priority> 
		} 
	ELSE 
		CreateScreenElement { 
			type = TextElement 
			Shadow 
			Shadow_offs = <Shadow_offs> 
			Shadow_rgba = <Shadow_rgba> 
			parent = <anchor_id> 
			id = <text_id> 
			font = <font> 
			text = <text> 
			scale = <scale> 
			pos = <text_pos> 
			just = <text_just> 
			rgba = <text_rgba> 
			alpha = <text_alpha> 
			z_priority = <z_priority> 
		} 
	ENDIF 
	IF GotParam max_width 
		truncate_string id = <id> max_width = <max_width> 
	ENDIF 
	highlight_angle = 0 
	IF GotParam menu 
		FormatText ChecksumName = bar_id "highlight_bar%m_%i" m = <menu> i = middle_piece_id_num 
		FormatText ChecksumName = line_id "text_line%m_%i" m = <menu> i = middle_piece_id_num 
		FormatText ChecksumName = box_id "text_box%m_%i" m = <menu> i = middle_piece_id_num 
	ELSE 
		FormatText ChecksumName = bar_id "highlight_bar_%i" i = middle_piece_id_num 
		FormatText ChecksumName = line_id "text_line_%i" i = middle_piece_id_num 
		FormatText ChecksumName = box_id "text_box_%i" i = middle_piece_id_num 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <anchor_id> 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	IF NOT GotParam no_bg 
		build_theme_menu_middle { parent = <anchor_id> 
			last_menu_item = <last_menu_item> 
			centered = <centered> 
			static_width = <static_width> 
			middle_scale = <middle_scale> 
			menu = <menu> 
			dark_menu = <dark_menu> 
			height = <item_bg_height> 
		} 
	ELSE 
		IF GotParam first_item 
			change widest_menu_item_width = 0 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <anchor_id> 
			pos = PAIR(0.00000000000, 0.00000000000) 
		} 
		change middle_piece_id_num = ( middle_piece_id_num + 1 ) 
		GetScreenElementDims id = <id> 
	ENDIF 
	IF GotParam extra_text 
		IF GotParam text_block_height 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = <anchor_id> 
				id = <extra_text_id> 
				font = <font> 
				text = <extra_text> 
				scale = <scale> 
				pos = ( <text_pos> + PAIR(10.00000000000, 0.00000000000) ) 
				just = [ left top ] 
				internal_just = [ left top ] 
				rgba = <text_rgba> 
				z_priority = <z_priority> 
				dims = PAIR(300.00000000000, 10.00000000000) 
				allow_expansion 
			} 
			<bar_id> : SetTags text_block_height = <text_block_height> 
		ELSE 
			CreateScreenElement { 
				type = TextElement 
				Shadow 
				Shadow_offs = <Shadow_offs> 
				Shadow_rgba = <Shadow_rgba> 
				parent = <anchor_id> 
				id = <extra_text_id> 
				font = <font> 
				text = <extra_text> 
				scale = <scale> 
				pos = ( <text_pos> + PAIR(10.00000000000, 0.00000000000) ) 
				just = [ left center ] 
				rgba = <text_rgba> 
				z_priority = <z_priority> 
			} 
		ENDIF 
		IF NOT GotParam ignore_width 
			GetScreenElementDims id = { <anchor_id> child = 3 } 
			IF ( <width> > widest_menu_item_width ) 
				change widest_menu_item_width = ( <width> + 15 ) 
			ENDIF 
		ENDIF 
	ELSE 
		CreateScreenElement { 
			type = TextElement 
			Shadow 
			Shadow_offs = <Shadow_offs> 
			Shadow_rgba = <Shadow_rgba> 
			parent = <anchor_id> 
			font = small 
			text = "" 
			alpha = 0 
		} 
	ENDIF 
	IF GotParam cross_it_out 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			id = <line_id> 
			texture = streak_2 
			pos = <highlight_bar_pos> 
			rgba = <line_rgba> 
			just = [ center center ] 
			scale = <highlight_bar_scale> 
			z_priority = ( <z_priority> + 1 ) 
			rot_angle = <highlight_angle> 
		} 
	ENDIF 
	IF GotParam box_it_up 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			id = <box_id> 
			texture = black 
			pos = <highlight_bar_pos> 
			rgba = [ 0 0 0 60 ] 
			just = [ center center ] 
			scale = <highlight_bar_scale> 
			z_priority = <z_priority> 
		} 
	ENDIF 
	IF NOT GotParam ignore_width 
		GetScreenElementDims id = { <anchor_id> child = 0 } 
		IF ( <width> > widest_menu_item_width ) 
			change widest_menu_item_width = <width> 
		ENDIF 
	ENDIF 
	IF ( ( GotParam last_menu_item ) | ( GotParam last_item ) ) 
		IF NOT GotParam static_width 
			IF GotParam centered 
				RunScriptOnScreenElement id = <id> set_all_menu_items_width params = { centered menu = <menu> height = <item_bg_height> } 
			ELSE 
				RunScriptOnScreenElement id = <id> set_all_menu_items_width params = { menu = <menu> height = <item_bg_height> } 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT theme_menu_add_centered_item 
	theme_menu_add_item <...> centered = centered 
ENDSCRIPT

SCRIPT theme_menu_add_checkbox_item 
	IF NOT GotParam id 
		printf "checkbox items must have an id" 
		RETURN 
	ENDIF 
	IF NOT GotParam value 
		printf "checkbox items must have a value" 
		RETURN 
	ENDIF 
	anchor_id = <id> 
	theme_menu_add_item focus_script = theme_checkbox_focus unfocus_script = theme_checkbox_unfocus <...> 
	IF ( <value> = 0 ) 
		alpha = 0 
	ELSE 
		alpha = 1 
	ENDIF 
	GetStackedScreenElementPos X id = { <id> child = 0 } offset = PAIR(20.00000000000, 5.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = checkmark 
		pos = <pos> 
		alpha = <alpha> 
		just = [ left center ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = checkbox 
		pos = ( <pos> + PAIR(0.00000000000, 5.00000000000) ) 
		just = [ left center ] 
		scale = 0.50000000000 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		z_priority = 5 
	} 
ENDSCRIPT

SCRIPT theme_set_checkbox 
	IF NOT GotParam value 
		printf "theme_set_checkbox must have value" 
		RETURN 
	ENDIF 
	GetTags 
	IF ( <value> = 1 ) 
		DoScreenElementMorph id = { <id> child = 4 } alpha = 1 
	ELSE 
		DoScreenElementMorph id = { <id> child = 4 } alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT theme_menu_add_number_item min = 0 max = 10 step = 1 
	IF NOT GotParam id 
		printf "number items must have an id" 
		RETURN 
	ENDIF 
	IF NOT GotParam value 
		printf "number items must have a value" 
		RETURN 
	ENDIF 
	anchor_id = <id> 
	IF GotParam trailingtext 
		FormatText textname = value_text "%v%t" v = <value> decimalplaces = <decimalplaces> t = <trailingtext> 
	ELSE 
		IF GotParam percent 
			FormatText textname = value_text "%v\\%" v = <value> decimalplaces = <decimalplaces> 
		ELSE 
			FormatText textname = value_text "%v" v = <value> decimalplaces = <decimalplaces> 
		ENDIF 
	ENDIF 
	theme_menu_add_item extra_text = <value_text> focus_script = theme_number_item_focus unfocus_script = theme_number_item_unfocus no_highlight_bar <...> 
	IF NOT GotParam cat_edit_item 
		SetScreenElementProps { id = <anchor_id> 
			event_handlers = [ { pad_left theme_menu_toggle_number_item params = { reverse 
						callback = <pad_left_script> 
						pad_left_script = <pad_left_script> 
						pad_right_script = <pad_right_script> 
						value = <value> 
						max = <max> 
						min = <min> 
						step = <step> 
						avoid = <avoid> 
						<pad_left_params> 
					} 
				} 
				{ pad_right theme_menu_toggle_number_item params = { callback = <pad_right_script> 
						pad_left_script = <pad_left_script> 
						pad_right_script = <pad_right_script> 
						value = <value> 
						max = <max> 
						min = <min> 
						step = <step> 
						avoid = <avoid> 
						<pad_right_params> 
					} 
				} 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam far_left 
		GetScreenElementPosition id = { <anchor_id> child = 0 } 
	ELSE 
		GetScreenElementPosition id = { <anchor_id> child = 3 } 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = left_arrow 
		pos = ( <ScreenElementPos> + PAIR(0.00000000000, 2.00000000000) ) 
		alpha = 0 
		just = [ right top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		z_priority = 5 
		scale = 0.64999997616 
	} 
	IF GotParam right_arrow_pos 
		pos = <right_arrow_pos> 
	ELSE 
		GetStackedScreenElementPos X id = { <anchor_id> child = 3 } offset = PAIR(3.00000000000, 2.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = right_arrow 
		pos = <pos> 
		alpha = 0 
		just = [ left top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		z_priority = 5 
		scale = 0.64999997616 
	} 
ENDSCRIPT

SCRIPT theme_menu_toggle_number_item 
	GetTags 
	IF GotParam NoStep 
	ELSE 
		BEGIN 
			IF GotParam reverse 
				IF ( ( ( <value> - <step> ) > <min> ) | ( ( <value> - <step> ) = <min> ) ) 
					value = ( <value> - <step> ) 
				ELSE 
					RETURN 
				ENDIF 
			ELSE 
				IF ( <max> > ( ( <value> + <step> ) ) | ( ( <value> + <step> ) = <max> ) ) 
					value = ( <value> + <step> ) 
				ELSE 
					RETURN 
				ENDIF 
			ENDIF 
			IF GotParam avoid 
				IF ( <value> = <avoid> ) 
				ELSE 
					BREAK 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 2 
	ENDIF 
	FormatText textname = value_text "%v" v = <value> 
	SetScreenElementProps { id = { <id> child = 3 } text = <value_text> } 
	theme_menu_update_number_item_right_arrow 
	SetScreenElementProps { id = <id> 
		event_handlers = [ { pad_left theme_menu_toggle_number_item params = { reverse 
					callback = <pad_left_script> 
					pad_left_script = <pad_left_script> 
					pad_right_script = <pad_right_script> 
					value = <value> 
					max = <max> 
					min = <min> 
					step = <step> 
					avoid = <avoid> 
					<pad_left_params> 
				} 
			} 
			{ pad_right theme_menu_toggle_number_item params = { callback = <pad_right_script> 
					pad_left_script = <pad_left_script> 
					pad_right_script = <pad_right_script> 
					value = <value> 
					max = <max> 
					min = <min> 
					step = <step> 
					avoid = <avoid> 
					<pad_right_params> 
				} 
			} 
		] 
		replace_handlers 
	} 
	IF GotParam callback 
		<callback> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT theme_menu_update_number_item_right_arrow 
	GetTags 
	GetStackedScreenElementPos X id = { <id> child = 3 } offset = PAIR(3.00000000000, 2.00000000000) 
	SetScreenElementProps { id = { <id> child = 5 } pos = <pos> } 
ENDSCRIPT

SCRIPT theme_menu_add_flag_item 
	IF NOT GotParam flag 
		printf "theme_menu_add_flag_item requires a flag param" 
		RETURN 
	ENDIF 
	IF NOT GotParam flag 
		printf "theme_menu_add_flag_item requires an id param" 
		RETURN 
	ENDIF 
	IF GetGlobalFlag flag = <flag> 
		IF GotParam reverse 
			extra_text = "Off" 
			reverse = reverse 
		ELSE 
			extra_text = "On" 
		ENDIF 
	ELSE 
		IF GotParam reverse 
			extra_text = "On" 
			reverse = reverse 
		ELSE 
			extra_text = "Off" 
		ENDIF 
	ENDIF 
	theme_menu_add_item <...> pad_choose_script = theme_toggle_flag pad_choose_params = { flag = <flag> id = <id> reverse = <reverse> } 
ENDSCRIPT

SCRIPT theme_toggle_flag 
	IF GetGlobalFlag flag = <flag> 
		IF GotParam reverse 
			SetScreenElementProps id = { <id> child = 3 } text = "On" 
		ELSE 
			SetScreenElementProps id = { <id> child = 3 } text = "Off" 
		ENDIF 
		UnSetGlobalFlag flag = <flag> 
	ELSE 
		IF GotParam reverse 
			SetScreenElementProps id = { <id> child = 3 } text = "Off" 
		ELSE 
			SetScreenElementProps id = { <id> child = 3 } text = "On" 
		ENDIF 
		SetGlobalFlag flag = <flag> 
	ENDIF 
ENDSCRIPT

widest_menu_item_width = 0 
middle_piece_id_num = 0 
SCRIPT build_theme_menu_top parent = current_menu_anchor pos = PAIR(90.00000000000, -29.00000000000) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <top_id> 
		pos = <pos> 
	} 
	anchor_id = <id> 
	m_texture = spec_T_M 
	l_texture = spec_T_L 
	r_texture = spec_T_R 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <mid_id> 
		texture = <m_texture> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <bg_piece_rgba> 
		scale = <middle_scale> 
		z_priority = 1 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <left_id> 
		texture = <l_texture> 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <bg_piece_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <right_id> 
		texture = <r_texture> 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <bg_piece_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = 1 
	} 
	change widest_menu_item_width = 0 
ENDSCRIPT

SCRIPT build_theme_menu_middle pos = PAIR(90.00000000000, -20.00000000000) middle_scale = PAIR(2.50000000000, 1.00000000000) height = 1 
	IF NOT GotParam menu 
		FormatText ChecksumName = mid_id "middle_piece_%i" i = middle_piece_id_num 
		FormatText ChecksumName = left_id "left_piece_%i" i = middle_piece_id_num 
		FormatText ChecksumName = right_id "right_piece_%i" i = middle_piece_id_num 
		top_id = box_top_anchor 
	ELSE 
		FormatText ChecksumName = mid_id "middle_piece%m_%i" i = middle_piece_id_num m = <menu> 
		FormatText ChecksumName = left_id "left_piece%m_%i" i = middle_piece_id_num m = <menu> 
		FormatText ChecksumName = right_id "right_piece%m_%i" i = middle_piece_id_num m = <menu> 
		FormatText ChecksumName = top_id "box_top_anchor%i" i = <menu> 
	ENDIF 
	change middle_piece_id_num = ( middle_piece_id_num + 1 ) 
	IF NOT ScreenElementExists id = <top_id> 
		build_theme_menu_top { parent = <parent> 
			top_id = <top_id> 
			middle_scale = <middle_scale> 
			bg_piece_rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			mid_id = <mid_id> left_id = <left_id> 
			right_id = <right_id> 
			menu = <menu> 
			dark_menu = <dark_menu> 
		} 
		RETURN 
	ENDIF 
	IF GotParam last_menu_item 
		build_theme_menu_bottom { parent = <parent> 
			pos = <pos> 
			middle_scale = <middle_scale> 
			bg_piece_rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			mid_id = <mid_id> 
			left_id = <left_id> 
			right_id = <right_id> 
			static_width = <static_width> 
			centered = <centered> 
			menu = <menu> 
			dark_menu = <dark_menu> 
		} 
		RETURN 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		pos = <pos> 
	} 
	anchor_id = <id> 
	modded_middle_scale = ( ( <middle_scale> - PAIR(0.00000000000, 1.00000000000) ) + ( PAIR(0.00000000000, 1.00000000000) * <height> ) ) 
	left_right_scale = ( PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) * <height> ) 
	m_texture = spec_M_M 
	l_texture = spec_M_L 
	r_texture = spec_M_R 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <mid_id> 
		texture = <m_texture> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		scale = <modded_middle_scale> 
		z_priority = 1 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <left_id> 
		texture = <l_texture> 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		scale = <left_right_scale> 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <right_id> 
		texture = <r_texture> 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		scale = <left_right_scale> 
		z_priority = 1 
	} 
ENDSCRIPT

SCRIPT build_theme_menu_bottom pos = PAIR(0.00000000000, 23.00000000000) 
	IF GotParam menu 
		FormatText textname = con_id "box_bottom_anchor%i" i = <menu> 
	ELSE 
		con_id = box_bottom_anchor 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <con_id> 
		pos = <pos> 
	} 
	anchor_id = <id> 
	m_texture = spec_B_M 
	l_texture = spec_B_L 
	r_texture = spec_B_R 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <mid_id> 
		texture = <m_texture> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <bg_piece_rgba> 
		scale = <middle_scale> 
		z_priority = 1 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <left_id> 
		texture = <l_texture> 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <bg_piece_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		id = <right_id> 
		texture = <r_texture> 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <bg_piece_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = 1 
	} 
	change middle_piece_id_num = 0 
ENDSCRIPT

SCRIPT set_all_menu_items_width 
	change middle_piece_id_num = 0 
	IF NOT GotParam centered 
		new_scale = ( widest_menu_item_width * PAIR(0.02500000037, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
		bar_scale = ( widest_menu_item_width * PAIR(0.01200000010, 0.00000000000) + PAIR(1.00000000000, 0.69999998808) ) 
		line_scale = ( widest_menu_item_width * PAIR(0.03200000152, 0.00000000000) + PAIR(1.00000000000, 0.30000001192) ) 
		box_scale = ( widest_menu_item_width * PAIR(0.63999998569, 0.00000000000) + PAIR(1.00000000000, 6.00000000000) ) 
	ELSE 
		new_scale = ( widest_menu_item_width * PAIR(0.01250000019, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) ) 
		bar_scale = ( widest_menu_item_width * PAIR(0.00600000005, 0.00000000000) + PAIR(1.00000000000, 0.69999998808) ) 
		line_scale = ( widest_menu_item_width * PAIR(0.01600000076, 0.00000000000) + PAIR(1.00000000000, 0.30000001192) ) 
		box_scale = ( ( ( <bar_scale> * 32 ) . PAIR(1.00000000000, 0.00000000000) ) * PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 6.00000000000) ) 
	ENDIF 
	index = 0 
	BEGIN 
		IF NOT GotParam menu 
			FormatText ChecksumName = mid_id "middle_piece_%i" i = <index> 
			FormatText ChecksumName = left_id "left_piece_%i" i = <index> 
			FormatText ChecksumName = right_id "right_piece_%i" i = <index> 
			FormatText ChecksumName = bar_id "highlight_bar_%i" i = <index> 
			FormatText ChecksumName = line_id "text_line_%i" i = <index> 
			FormatText ChecksumName = box_id "text_box_%i" i = <index> 
		ELSE 
			FormatText ChecksumName = mid_id "middle_piece%m_%i" m = <menu> i = <index> 
			FormatText ChecksumName = left_id "left_piece%m_%i" m = <menu> i = <index> 
			FormatText ChecksumName = right_id "right_piece%m_%i" m = <menu> i = <index> 
			FormatText ChecksumName = bar_id "highlight_bar%m_%i" m = <menu> i = <index> 
			FormatText ChecksumName = line_id "text_line%m_%i" m = <menu> i = <index> 
			FormatText ChecksumName = box_id "text_box%m_%i" m = <menu> i = <index> 
		ENDIF 
		IF ScreenElementExists id = <mid_id> 
			DoScreenElementMorph id = <mid_id> scale = <new_scale> 
			GetScreenElementDims id = <mid_id> 
			right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
			left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
			DoScreenElementMorph id = <left_id> pos = <left_pos> 
			DoScreenElementMorph id = <right_id> pos = <right_pos> 
		ENDIF 
		IF ScreenElementExists id = <bar_id> 
			GetScreenElementProps id = <bar_id> 
			IF NOT ( widest_menu_item_width = 0 ) 
				new_angle = ( ( <rot_angle> * 5.00000000000 ) / ( widest_menu_item_width * 0.00100000005 ) ) 
				IF <bar_id> : GetSingleTag text_block_height 
					DoScreenElementMorph id = <bar_id> scale = PAIR(0.30000001192, 0.40000000596) 
				ELSE 
					DoScreenElementMorph id = <bar_id> scale = <bar_scale> rot_angle = <new_angle> 
				ENDIF 
				IF ScreenElementExists id = <line_id> 
					DoScreenElementMorph id = <line_id> scale = <line_scale> rot_angle = <new_angle> 
				ENDIF 
				IF ScreenElementExists id = <box_id> 
					DoScreenElementMorph id = <box_id> scale = <box_scale> 
				ENDIF 
			ENDIF 
		ELSE 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 100 
ENDSCRIPT

no_focus_sound = 1 
SCRIPT main_theme_focus 
	GetTags 
	IF ScreenElementExists id = current_menu 
		current_menu : GetSingleTag scale_highlight_text 
	ENDIF 
	IF ScreenElementExists id = current_vmenu 
		current_vmenu : GetSingleTag scale_highlight_text 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		current_menu_anchor : GetSingleTag scale_highlight_text 
	ENDIF 
	IF GotParam scale_highlight_text 
		DoScreenElementMorph { 
			id = { <id> child = 0 } 
			scale = <scale_highlight_text> 
			relative_scale 
		} 
		IF ScreenElementExists id = { <id> child = 3 } 
			DoScreenElementMorph { 
				id = { <id> child = 3 } 
				scale = <scale_highlight_text> 
				relative_scale 
			} 
		ENDIF 
	ENDIF 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
	IF ScreenElementExists id = { <id> child = 3 } 
		IF GetScreenElementChildren id = { <id> child = 3 } 
			GetArraySize <children> 
			i = 0 
			BEGIN 
				DoScreenElementMorph { 
					id = ( <children> [ <i> ] ) 
					rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
				} 
				i = ( <i> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			DoScreenElementMorph { 
				id = { <id> child = 3 } 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			} 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = { <id> child = 1 } 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHT_BAR_COLOR ) 
		} 
	ENDIF 
	IF ScreenElementExists id = scrolling_menu_up_arrow 
		IF GotParam first_item 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = scrolling_menu_down_arrow 
		IF GotParam last_item 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT main_theme_unfocus text_alpha = 1.00000000000 
	GetTags 
	IF NOT GotParam text_rgba 
		text_rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <text_rgba> 
		alpha = <text_alpha> 
		scale = 1 
	} 
	IF ScreenElementExists id = { <id> child = 3 } 
		IF GetScreenElementChildren id = { <id> child = 3 } 
			GetArraySize <children> 
			i = 0 
			BEGIN 
				DoScreenElementMorph { 
					id = ( <children> [ <i> ] ) 
					rgba = <text_rgba> 
					alpha = <text_alpha> 
					scale = 1 
				} 
				i = ( <i> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			DoScreenElementMorph { 
				id = { <id> child = 3 } 
				rgba = <text_rgba> 
				alpha = <text_alpha> 
				scale = 1 
			} 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = { <id> child = 1 } 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			rgba = [ 128 128 128 0 ] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT theme_highlight_sweep 
	GetTags 
	IF NOT ScreenElementExists id = { <id> child = 1 } 
		RETURN 
	ENDIF 
	IF NOT ScreenElementExists id = { <id> child = { 1 child = highlight } } 
		SetScreenElementLock id = { <id> child = 1 } off 
		CreateScreenElement { 
			type = SpriteElement 
			parent = { <id> child = 1 } 
			local_id = highlight 
			texture = roundbar_highlight 
			pos = PAIR(0.00000000000, 1.00000000000) 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			just = [ top left ] 
		} 
	ELSE 
		id = { <id> child = { 1 child = highlight } } 
	ENDIF 
	DoScreenElementMorph id = <id> scale = PAIR(3.00000000000, 1.29999995232) time = 0 
	DoScreenElementMorph id = <id> pos = PAIR(0.00000000000, 0.00000000000) time = 0 
	DoScreenElementMorph id = <id> alpha = 0.50000000000 time = 0 
	BEGIN 
		DoScreenElementMorph id = <id> pos = PAIR(80.00000000000, 0.00000000000) time = 0.44999998808 anim = gentle 
		wait 0.50000000000 seconds 
		DoScreenElementMorph id = <id> pos = PAIR(0.00000000000, 0.00000000000) time = 0.44999998808 anim = gentle 
		wait 0.50000000000 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT kill_theme_highlight_sweep 
	IF NOT ScreenElementExists id = { <id> child = 1 } 
		RETURN 
	ENDIF 
	KillSpawnedScript name = theme_highlight_sweep 
	IF ScreenElementExists id = { <id> child = { 1 child = highlight } } 
		DoScreenElementMorph id = { <id> child = { 1 child = highlight } } alpha = 0 time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT main_theme_focus_noscale 
	GetTags 
	IF NOT GotParam highlighted_text_rgba 
		highlighted_text_rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <highlighted_text_rgba> 
		relative_scale 
	} 
	IF ScreenElementExists id = { <id> child = 3 } 
		DoScreenElementMorph { 
			id = { <id> child = 3 } 
			rgba = <highlighted_text_rgba> 
			relative_scale 
		} 
	ENDIF 
	IF ScreenElementExists id = { <id> child = 1 } 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		} 
	ENDIF 
	IF ScreenElementExists id = scrolling_menu_up_arrow 
		IF GotParam first_item 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = scrolling_menu_down_arrow 
		IF GotParam last_item 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0 
		ELSE 
			DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT main_theme_unfocus_noscale 
	GetTags 
	IF NOT GotParam text_rgba 
		text_rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
	KillSpawnedScript name = text_twitch_effect 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = <text_rgba> 
		alpha = <text_alpha> 
	} 
	IF ScreenElementExists id = { <id> child = 3 } 
		DoScreenElementMorph { 
			id = { <id> child = 3 } 
			rgba = <text_rgba> 
			alpha = <text_alpha> 
		} 
	ENDIF 
	IF ScreenElementExists id = { <id> child = 1 } 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			rgba = [ 128 128 128 0 ] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT theme_checkbox_focus 
	main_theme_focus <...> 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 4 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		alpha = <text_alpha> 
		relative_scale 
	} 
ENDSCRIPT

SCRIPT theme_checkbox_unfocus 
	main_theme_unfocus <...> 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 4 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		alpha = <text_alpha> 
		scale = 1 
		relative_scale 
	} 
ENDSCRIPT

SCRIPT theme_number_item_focus 
	main_theme_focus <...> 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = 4 } 
		alpha = 1 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 5 } 
		alpha = 1 
	} 
ENDSCRIPT

SCRIPT theme_number_item_unfocus 
	main_theme_unfocus <...> 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = 4 } 
		alpha = 0 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 5 } 
		alpha = 0 
	} 
ENDSCRIPT

SCRIPT theme_item_focus 
	GetTags 
	SetScreenElementProps id = { <id> child = 0 } rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	DoScreenElementMorph id = { <id> child = 0 } time = 0.05000000075 scale = 1.10000002384 
	IF ScreenElementExists id = { <id> child = 1 } 
		SetScreenElementProps { 
			id = { <id> child = 1 } 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		} 
	ENDIF 
	RunScriptOnScreenElement id = <id> text_twitch_effect params = { text_scale = <text_scale> } 
ENDSCRIPT

SCRIPT theme_item_unfocus 
	GetTags 
	generic_menu_pad_up_down_sound 
	KillSpawnedScript name = text_twitch_effect 
	SetScreenElementProps id = { <id> child = 0 } rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	SetScreenElementProps id = { <id> child = 0 } no_blur_effect 
	DoScreenElementMorph id = { <id> child = 0 } time = 0.05000000075 restore_alpha scale = 1 
	IF ScreenElementExists id = { <id> child = 1 } 
		DoScreenElementMorph id = { <id> child = 1 } rgba = [ 0 0 0 0 ] 
	ENDIF 
ENDSCRIPT

SCRIPT sprite_unfocus 
	GetTags 
	main_theme_unfocus <...> 
	theme_item_unfocus <...> 
ENDSCRIPT

SCRIPT text_twitch_effect 
	GetTags 
	BEGIN 
		GetScreenElementDims id = { <id> child = 0 } 
		ScaleH = ( ( <width> + 5.00000000000 ) / ( <width> ) ) 
		DoScreenElementMorph id = { <id> child = 0 } time = 0.02999999933 scale = <ScaleH> alpha = 1 
		IF NOT GotParam no_extra 
			IF ScreenElementExists id = { <id> child = 3 } 
				GetScreenElementDims id = { <id> child = 3 } 
				IF NOT ( <width> = 0 ) 
					ScaleH = ( ( <width> + 5.00000000000 ) / ( <width> ) ) 
					DoScreenElementMorph id = { <id> child = 3 } time = 0.02999999933 scale = <ScaleH> alpha = 1 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 2 gameframe 
		DoScreenElementMorph id = { <id> child = 0 } time = 0.00999999978 scale = 1 alpha = 0.89999997616 
		IF NOT GotParam no_extra 
			IF ScreenElementExists id = { <id> child = 3 } 
				DoScreenElementMorph id = { <id> child = 3 } time = 0.00999999978 scale = 1 alpha = 0.89999997616 
			ENDIF 
		ENDIF 
		wait 0.23000000417 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT text_twitch_effect2 scale = 1.07500004768 scale2 = 1.00000000000 
	GetTags 
	BEGIN 
		DoScreenElementMorph id = <id> time = 0.02999999933 scale = <scale> relative_scale 
		wait 2 frames 
		DoScreenElementMorph id = <id> time = 0.00999999978 scale = <scale2> relative_scale 
		wait 0.23000000417 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT text_twitch_effect3 scale = 1.04999995232 scale2 = 1.07500004768 
	text_twitch_effect2 <...> 
ENDSCRIPT

SCRIPT test_scrolling_menu 
	make_new_themed_scrolling_menu title = "SCROLLING" 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = create_test_menu } } ] 
		replace_handlers 
	} 
	theme_menu_add_item text = "Standard" pad_choose_script = null_script centered no_bg first_item 
	theme_menu_add_item text = "Stuff" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Things" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Other" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Blah" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Wow" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Tony" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Hawk\'s" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Pro" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Skater" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "1 2 3 4 5 6 7 8 9" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "One" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Two" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Three" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Four" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Five" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Six" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Seven" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Eight" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Nine" pad_choose_script = null_script centered no_bg 
	theme_menu_add_item text = "Ten" pad_choose_script = null_script centered no_bg last_item 
	finish_themed_scrolling_menu 
ENDSCRIPT

SCRIPT make_new_themed_scrolling_menu title = "SCROLL" dims = PAIR(300.00000000000, 227.00000000000) pos = PAIR(229.00000000000, 80.00000000000) right_bracket_z = 1 
	IF GotParam no_bar 
		make_new_themed_sub_menu title = <title> Scrolling no_bar dims = <dims> pos = <pos> right_bracket_z = <right_bracket_z> 
	ELSE 
		make_new_themed_sub_menu title = <title> Scrolling dims = <dims> pos = <pos> right_bracket_z = <right_bracket_z> 
	ENDIF 
	SetScreenElementProps { 
		id = sub_vmenu 
		event_handlers = [ { pad_up menu_vert_blink_arrow params = { id = scrolling_menu_up_arrow rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) } } 
			{ pad_down menu_vert_blink_arrow params = { id = scrolling_menu_down_arrow rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) } } 
		] 
	} 
ENDSCRIPT

SCRIPT finish_themed_scrolling_menu pos = PAIR(320.00000000000, 85.00000000000) time = 0.20000000298 
	GetScreenElementDims id = sub_scrolling_menu 
	parts = ( <height> / theme_menu_bg_parts_height ) 
	IF NOT GotParam force_end_pos 
		IF LevelIs Load_MainMenu 
			pos = PAIR(188.00000000000, 60.00000000000) 
		ENDIF 
	ENDIF 
	IF NOT GotParam bg_width 
		IF NOT GotParam wide_menu 
			bg_width = ( widest_menu_item_width * 0.01250000019 ) 
		ELSE 
			bg_width = ( widest_menu_item_width * 0.02500000037 ) 
		ENDIF 
	ENDIF 
	theme_background width = <bg_width> pos = <pos> num_parts = <parts> z_priority = <z_priority> parent = sub_menu 
	IF ScreenElementExists id = bg_box_top 
		CreateScreenElement { 
			type = SpriteElement 
			parent = bg_box_top 
			id = scrolling_menu_up_arrow 
			texture = up_arrow 
			pos = PAIR(0.00000000000, 13.00000000000) 
			just = [ center center ] 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			scale = PAIR(0.80000001192, 1.00000000000) 
			z_priority = 3 
		} 
		GetScreenElementPosition id = sub_scrolling_menu 
		DoScreenElementMorph id = sub_scrolling_menu pos = ( <ScreenElementPos> + PAIR(0.00000000000, 30.00000000000) ) 
	ENDIF 
	IF ScreenElementExists id = bg_box_bottom 
		CreateScreenElement { 
			type = SpriteElement 
			parent = bg_box_bottom 
			id = scrolling_menu_down_arrow 
			texture = down_arrow 
			pos = PAIR(0.00000000000, -5.00000000000) 
			just = [ center center ] 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			scale = PAIR(0.80000001192, 1.00000000000) 
			z_priority = 3 
		} 
	ENDIF 
	finish_themed_sub_menu time = <time> 
ENDSCRIPT

SCRIPT theme_background parent = current_menu_anchor id = bg_box_vmenu width = 5 pos = PAIR(320.00000000000, 85.00000000000) num_parts = 5 z_priority = 1 
	IF NOT GotParam bg_rgba 
		bg_rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
	ENDIF 
	CreateScreenElement { 
		type = VMenu 
		parent = <parent> 
		id = <id> 
		font = small 
		just = [ left top ] 
		pos = <pos> 
		padding_scale = 1 
		internal_scale = 1 
		internal_just = [ center center ] 
	} 
	anchor_id = <id> 
	middle_parts = <num_parts> 
	CasttoInteger middle_parts 
	partial_scale = ( <num_parts> - <middle_parts> ) 
	printf "partial_scale = %p" p = <partial_scale> 
	build_theme_bg_top parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts> 
	BEGIN 
		build_theme_bg_middle parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts> 
	REPEAT <middle_parts> 
	build_theme_bg_middle parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts> 
	build_theme_bg_bottom parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts> 
ENDSCRIPT

SCRIPT build_theme_bg_top 
	m_texture = spec_T_M 
	l_texture = spec_T_L 
	r_texture = spec_T_R 
	IF ( <parent> = bg_box_vmenu ) 
		top_id = bg_box_top 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		id = <top_id> 
		dims = PAIR(0.00000000000, 32.00000000000) 
		parent = <parent> 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <m_texture> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <width> + PAIR(0.00000000000, 1.00000000000) ) 
		z_priority = <z_priority> 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <l_texture> 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <bg_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = <z_priority> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <r_texture> 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <bg_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = <z_priority> 
	} 
ENDSCRIPT

SCRIPT build_theme_bg_middle scale_height = 1 
	m_texture = spec_M_M 
	l_texture = spec_M_L 
	r_texture = spec_M_R 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		dims = ( PAIR(0.00000000000, 1.00000000000) * theme_menu_bg_parts_height ) 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <m_texture> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <width> + <scale_height> * PAIR(0.00000000000, 1.00000000000) ) 
		z_priority = <z_priority> 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
	side_scale = ( PAIR(1.00000000000, 0.00000000000) * 1 + <scale_height> * PAIR(0.00000000000, 1.00000000000) ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <l_texture> 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <bg_rgba> 
		scale = <side_scale> 
		z_priority = <z_priority> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <r_texture> 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <bg_rgba> 
		scale = <side_scale> 
		z_priority = <z_priority> 
	} 
ENDSCRIPT

SCRIPT build_theme_bg_bottom 
	m_texture = spec_B_M 
	l_texture = spec_B_L 
	r_texture = spec_B_R 
	IF ( <parent> = bg_box_vmenu ) 
		bot_id = bg_box_bottom 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <bot_id> 
		dims = PAIR(0.00000000000, 32.00000000000) 
	} 
	anchor_id = <id> 
	pos = ( PAIR(0.00000000000, -1.00000000000) * ( theme_menu_bg_parts_height - ( <scale_height> * theme_menu_bg_parts_height ) ) ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <m_texture> 
		pos = <pos> 
		just = [ center top ] 
		rgba = <bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <width> + PAIR(0.00000000000, 1.00000000000) ) 
		z_priority = <z_priority> 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> + <pos> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> + <pos> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <l_texture> 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <bg_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = <z_priority> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = <r_texture> 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <bg_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = <z_priority> 
	} 
ENDSCRIPT


