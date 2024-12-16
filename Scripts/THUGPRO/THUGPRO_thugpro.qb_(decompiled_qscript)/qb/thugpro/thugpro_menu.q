
SCRIPT make_thugpro_menu_item { 
		parent_id = current_menu 
		dims = PAIR(320.00000000000, 20.50000000000) 
		just = [ left , center ] 
		text_just = [ left , center ] 
		text_alpha = 1.00000000000 
		scale = 1.00000000000 
		width_ajustment = 1.00000000000 
		focus_script = nullscript 
		unfocus_script = nullscript 
		focus_params = { } 
		unfocus_params = { } 
		child_texture_offset = PAIR(-183.00000000000, 10.00000000000) 
		child_texture_alpha = 0.00000000000 
		child_texture_scale = 0.80000001192 
		extra_text_scale = 0.20000000298 
		extra_text_align = center 
	} 
	IF ScreenElementExists id = <id> 
		RemoveParameter id 
	ENDIF 
	IF GotParam helper_text 
		edmsg2 "@FIXME: \\c2\'%a\', got param helper_text!" a = <text> 
	ENDIF 
	IF GotParam id 
		container_id = <id> 
	ELSE 
		FormatText TextName = auto_id "autoid_%a_%b" a = RANDOM_RANGE PAIR(0.00000000000, 2048.00000000000) b = RANDOM_RANGE PAIR(0.00000000000, 8096.00000000000) 
		FormatText ChecksumName = container_id "%a" a = <auto_id> 
	ENDIF 
	IF GotParam not_focusable 
		<text_alpha> = 0.40000000596 
		<focusable> = not_focusable 
	ENDIF 
	IF NOT ScreenElementExists id = { <parent_id> child = 0 } 
		<first_item> = first_item 
		<actually_first_item> = first_item 
	ENDIF 
	IF GotParam line_top 
		<first_item> = first_item 
	ENDIF 
	IF GotParam line_bot 
		<last_item> = last_item 
	ENDIF 
	IF <parent_id> : GetSingleTag boxed 
	ENDIF 
	IF GotParam no_box 
		RemoveParameter boxed 
	ENDIF 
	IF <parent_id> : GetSingleTag scrolling 
	ENDIF 
	IF <parent_id> : GetSingleTag wide_extra_text 
	ENDIF 
	IF <parent_id> : GetSingleTag colorful 
	ENDIF 
	IF <parent_id> : GetSingleTag menu_item_max_width 
		<max_width> = <menu_item_max_width> 
		RemoveParameter menu_item_max_width 
	ENDIF 
	IF GotParam centered 
		text_just = [ center , center ] 
		text_offset = PAIR(158.00000000000, 0.00000000000) 
	ENDIF 
	IF <parent_id> : GetSingleTag width_ajustment 
		printf "Got width_ajustment style from parent menu!" 
	ENDIF 
	<bar_scale> = ( ( PAIR(0.31999999285, 0.00000000000) * <width_ajustment> ) + PAIR(0.00000000000, 0.23999999464) ) 
	<box_line_width> = ( PAIR(80.00000000000, 0.00000000000) * <width_ajustment> ) 
	<box_line_pos> = ( ( PAIR(320.00000000000, 0.00000000000) * <width_ajustment> ) + PAIR(-4.00000000000, 0.00000000000) ) 
	<option_arrow_left_offset> = PAIR(20.00000000000, 10.00000000000) 
	<option_arrow_right_offset> = ( PAIR(140.00000000000, 10.00000000000) - PAIR(4.00000000000, 0.00000000000) ) 
	<extra_text_offset> = ( PAIR(80.00000000000, 0.00000000000) + PAIR(-4.00000000000, 10.00000000000) ) 
	IF GotParam wide_extra_text 
		<extra_text_offset> = ( <extra_text_offset> - PAIR(20.00000000000, 0.00000000000) ) 
		<option_arrow_left_offset> = ( <option_arrow_left_offset> - PAIR(40.00000000000, 0.00000000000) ) 
	ENDIF 
	<option_arrow_left_offset> = ( <option_arrow_left_offset> + ( <width_ajustment> * PAIR(320.00000000000, 0.00000000000) ) - PAIR(320.00000000000, 0.00000000000) ) 
	<option_arrow_right_offset> = ( <option_arrow_right_offset> + ( <width_ajustment> * PAIR(320.00000000000, 0.00000000000) ) - PAIR(320.00000000000, 0.00000000000) ) 
	<extra_text_offset> = ( <extra_text_offset> + ( <width_ajustment> * PAIR(320.00000000000, 0.00000000000) ) - PAIR(320.00000000000, 0.00000000000) ) 
	CreateScreenElement { 
		type = ContainerElement 
		id = <container_id> 
		parent = <parent_id> 
		scale = <scale> 
		z_priority = 1000 
		dims = <dims> 
		just = <just> 
		<focusable> 
	} 
	<container_id> : SetTags parent = <parent_id> 
	IF NOT GotParam not_counted 
		IF <parent_id> : GetSingleTag menu_item_count 
			<container_id> : SetTags menu_item_index = <menu_item_count> 
			<parent_id> : SetTags menu_item_count = ( <menu_item_count> + 1 ) 
		ENDIF 
	ENDIF 
	IF GotParam actually_first_item 
		<container_id> : SetTags first_item = <actually_first_item> 
	ENDIF 
	IF GotParam child_texture_persistent 
		<container_id> : SetTags child_texture_persistent = 1 
	ENDIF 
	IF GotParam text 
		GetUpperCaseString <text> 
		<text> = <UpperCaseString> 
		CreateScreenElement { 
			type = TextElement 
			local_id = text 
			parent = <container_id> 
			text = <text> 
			font = bebas 
			scale = 0.20000000298 
			pos = <text_offset> 
			just = <text_just> 
			alpha = <text_alpha> 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
			z_priority = 1002 
		} 
		IF GotParam max_width 
			truncate_string id = { <container_id> child = text } max_width = <max_width> 
		ENDIF 
	ENDIF 
	IF GotParam extra_text 
		RemoveParameter UpperCaseString 
		GetUpperCaseString <extra_text> 
		<extra_text> = <UpperCaseString> 
		GetStackedScreenElementPos X id = <container_id> offset = <extra_text_offset> 
		CreateScreenElement { 
			type = TextElement 
			local_id = extra_text 
			parent = <container_id> 
			text = <extra_text> 
			font = impact 
			scale = <extra_text_scale> 
			pos = <pos> 
			internal_just = [ center center ] 
			just = [ center center ] 
			rgba = [ 90 90 90 90 ] 
			z_priority = 1006 
		} 
		IF GotParam option_arrows 
			GetStackedScreenElementPos X id = <container_id> offset = <option_arrow_left_offset> 
			CreateScreenElement { 
				type = SpriteElement 
				local_id = left_arrow 
				parent = <container_id> 
				just = [ center , center ] 
				alpha = 0.00000000000 
				rgba = [ 128 128 128 128 ] 
				texture = left_arrow 
				pos = <pos> 
				scale = 0.40000000596 
				z_priority = 1002 
			} 
			GetStackedScreenElementPos X id = <container_id> offset = <option_arrow_right_offset> 
			CreateScreenElement { 
				type = SpriteElement 
				local_id = right_arrow 
				parent = <container_id> 
				just = [ center , center ] 
				alpha = 0.00000000000 
				rgba = [ 128 128 128 128 ] 
				texture = right_arrow 
				pos = <pos> 
				scale = 0.40000000596 
				z_priority = 1002 
			} 
		ENDIF 
	ENDIF 
	IF GotParam child_texture 
		GetStackedScreenElementPos X id = <container_id> offset = <child_texture_offset> 
		CreateScreenElement { 
			type = SpriteElement 
			local_id = icon 
			parent = <container_id> 
			just = [ center , center ] 
			alpha = <child_texture_alpha> 
			texture = <child_texture> 
			pos = <pos> 
			scale = <child_texture_scale> 
			rgba = <child_texture_rgba> 
			z_priority = 1004 
		} 
	ENDIF 
	IF NOT GotParam no_bar 
		CreateScreenElement { 
			type = SpriteElement 
			local_id = bar 
			parent = <container_id> 
			just = <just> 
			alpha = 0.00000000000 
			texture = new_menu_bar 
			pos = PAIR(-5.00000000000, 2.50000000000) 
			scale = <bar_scale> 
			z_priority = 500 
		} 
	ENDIF 
	IF GotParam boxed 
		CreateScreenElement { 
			type = SpriteElement 
			local_id = line_left 
			parent = <container_id> 
			just = [ center , center ] 
			alpha = 1.00000000000 
			texture = white 
			pos = PAIR(-4.00000000000, 0.00000000000) 
			scale = PAIR(0.10000000149, 5.69999980927) 
			z_priority = 600 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			local_id = line_right 
			parent = <container_id> 
			just = [ center , center ] 
			alpha = 1.00000000000 
			texture = white 
			pos = <box_line_pos> 
			scale = PAIR(0.10000000149, 5.69999980927) 
			z_priority = 600 
		} 
		IF NOT GotParam scrolling 
			IF GotParam first_item 
				CreateScreenElement { 
					type = SpriteElement 
					local_id = line_top 
					parent = <container_id> 
					just = <just> 
					alpha = 1.00000000000 
					texture = white 
					pos = PAIR(-4.00000000000, -11.00000000000) 
					scale = ( <box_line_width> + PAIR(0.00000000000, 0.10000000149) ) 
					z_priority = 600 
				} 
			ENDIF 
			IF GotParam last_item 
				CreateScreenElement { 
					type = SpriteElement 
					local_id = line_bot 
					parent = <container_id> 
					just = <just> 
					alpha = 1.00000000000 
					texture = white 
					pos = PAIR(-4.00000000000, 11.00000000000) 
					scale = ( <box_line_width> + PAIR(0.00000000000, 0.10000000149) ) 
					z_priority = 600 
				} 
			ENDIF 
		ENDIF 
		IF GotParam colorful 
			<background_rgba> = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		ELSE 
			<background_rgba> = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			local_id = background 
			parent = <container_id> 
			pos = PAIR(-4.00000000000, 0.00000000000) 
			scale = ( <box_line_width> + PAIR(0.00000000000, 5.69999980927) ) 
			just = <just> 
			texture = white 
			alpha = 0.50000000000 
			rgba = <background_rgba> 
			z_priority = 400 
		} 
	ENDIF 
	IF GotParam not_focusable 
		RETURN 
	ENDIF 
	SetScreenElementProps { 
		id = <container_id> 
		event_handlers = [ 
			{ focus thugpro_menu_item_focus } 
			{ unfocus thugpro_menu_item_unfocus } 
			{ focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
		] 
		replace_handlers 
	} 
	IF GotParam description_text 
		SetScreenElementProps { 
			id = <container_id> 
			event_handlers = [ 
				{ focus thugpro_menu_desc_text_focus params = { text = <description_text> } } 
				{ unfocus thugpro_menu_desc_text_unfocus } 
			] 
		} 
	ENDIF 
	IF GotParam option_arrows 
		IF GotParam option_arrows_callback 
			IF GotParam option_arrows_callback_params 
				IF GotParam pad_choose 
					handlers = [ 
						{ pad_left <option_arrows_callback> params = ( { left } + <option_arrows_callback_params> ) } 
						{ pad_right <option_arrows_callback> params = ( { right } + <option_arrows_callback_params> ) } 
						{ pad_choose <option_arrows_callback> params = ( { right } + <option_arrows_callback_params> ) } 
					] 
				ELSE 
					handlers = [ 
						{ pad_left <option_arrows_callback> params = ( { left } + <option_arrows_callback_params> ) } 
						{ pad_right <option_arrows_callback> params = ( { right } + <option_arrows_callback_params> ) } 
					] 
				ENDIF 
			ELSE 
				IF GotParam pad_choose 
					handlers = [ 
						{ pad_left <option_arrows_callback> params = { left } } 
						{ pad_right <option_arrows_callback> params = { right } } 
						{ pad_choose <option_arrows_callback> params = { right } } 
					] 
				ELSE 
					handlers = [ 
						{ pad_left <option_arrows_callback> params = { left } } 
						{ pad_right <option_arrows_callback> params = { right } } 
					] 
				ENDIF 
			ENDIF 
			SetScreenElementProps { 
				id = <container_id> 
				event_handlers = <handlers> 
			} 
		ENDIF 
	ENDIF 
	IF GotParam pad_back_script 
		IF GotParam pad_choose_params 
			handlers = [ { pad_back <pad_back_script> params = <pad_back_params> } ] 
		ELSE 
			handlers = [ { pad_back <pad_back_script> } ] 
		ENDIF 
		SetScreenElementProps { 
			id = <container_id> 
			event_handlers = <handlers> 
		} 
	ENDIF 
	IF GotParam pad_choose_script 
		IF GotParam pad_choose_params 
			handlers = [ { pad_choose <pad_choose_script> params = <pad_choose_params> } ] 
		ELSE 
			handlers = [ { pad_choose <pad_choose_script> } ] 
		ENDIF 
		SetScreenElementProps { 
			id = <container_id> 
			event_handlers = <handlers> 
		} 
		IF NOT GotParam no_sound 
			SetScreenElementProps { 
				id = <container_id> 
				event_handlers = [ { pad_choose generic_menu_pad_choose_sound } ] 
			} 
		ENDIF 
	ENDIF 
	IF GotParam pad_option_script 
		IF GotParam pad_option_params 
			handlers = [ { pad_option <pad_option_script> params = <pad_option_params> } ] 
		ELSE 
			handlers = [ { pad_option <pad_option_script> } ] 
		ENDIF 
		SetScreenElementProps { 
			id = <container_id> 
			event_handlers = <handlers> 
		} 
	ENDIF 
	RETURN { menu_item_id = <container_id> } 
ENDSCRIPT

SCRIPT thugpro_menu_item_update_checkbox 
	IF ScreenElementExists id = { <id> child = icon } 
		IF GotParam off 
			DoScreenElementMorph id = { <id> child = icon } rgba = [ 120 0 0 120 ] 
		ELSE 
			DoScreenElementMorph id = { <id> child = icon } rgba = [ 0 120 0 120 ] 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT make_thugpro_menu_checkbox_item { 
		child_texture_persistent 
		child_texture = checkbox 
		child_texture_alpha = 0.89999997616 
		child_texture_scale = 0.69999998808 
	} 
	IF GotParam checked 
		<child_texture_rgba> = [ 0 120 0 120 ] 
	ELSE 
		<child_texture_rgba> = [ 120 0 0 120 ] 
	ENDIF 
	make_thugpro_menu_item <...> 
ENDSCRIPT

SCRIPT thugpro_menu_find_last_item { 
		parent = current_menu 
	} 
	index = 0 
	BEGIN 
		IF ScreenElementExists id = { <parent> child = <index> } 
			<index> = ( <index> + 1 ) 
		ELSE 
			<index> = ( <index> - 1 ) 
			BREAK 
		ENDIF 
	REPEAT 255 
	RETURN last_item_id = { <parent> child = <index> } 
ENDSCRIPT

SCRIPT thugpro_menu_remove_all_items { 
		parent = current_menu 
	} 
	index = 0 
	BEGIN 
		IF ScreenElementExists id = { <parent> child = <index> } 
			DestroyScreenElement id = { <parent> child = <index> } 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 255 
ENDSCRIPT

SCRIPT thugpro_menu_create_grunge_elements { 
		height = 11 
	} 
	IF NOT GotParam parent 
		RETURN 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		local_id = box_halftone 
		parent = <parent> 
		just = [ left , bottom ] 
		alpha = 1.00000000000 
		texture = new_menu_box_halftone 
		pos = PAIR(0.00000000000, -10.00000000000) 
		scale = ( ( PAIR(0.00000000000, 0.44999998808) * <height> ) + PAIR(0.00779999979, 0.00000000000) ) 
		rgba = [ 0 0 0 128 ] 
		z_priority = 300 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		local_id = box_grunge 
		parent = <parent> 
		just = [ left , bottom ] 
		alpha = 1.00000000000 
		texture = new_menu_box_grunge 
		pos = PAIR(0.00000000000, -10.00000000000) 
		scale = PAIR(0.00389999989, 4.00000000000) 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
		z_priority = 310 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_mark_last_item 
	IF NOT GotParam id 
		RETURN 
	ENDIF 
	IF GotParam width_ajustment 
		<box_line_width> = ( PAIR(80.00000000000, 0.00000000000) * <width_ajustment> ) 
	ELSE 
		<box_line_width> = PAIR(80.00000000000, 0.00000000000) 
	ENDIF 
	<last_item_id> = <id> 
	IF ScreenElementExists id = <last_item_id> 
		IF NOT ScreenElementExists id = { <last_item_id> child = line_bot } 
			CreateScreenElement { 
				type = SpriteElement 
				local_id = line_bot 
				parent = <last_item_id> 
				just = [ left , center ] 
				alpha = 1.00000000000 
				texture = white 
				pos = PAIR(-4.00000000000, 11.00000000000) 
				scale = ( <box_line_width> + PAIR(0.00000000000, 0.10000000149) ) 
				z_priority = 600 
			} 
			<box_line_id> = <id> 
			IF <parent> : GetSingleTag menu_item_count 
				IF ( <menu_item_count> > 4 ) 
					thugpro_menu_create_grunge_elements { 
						parent = <box_line_id> 
						height = <menu_item_count> 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_update_counter_text { 
		parent = current_menu 
	} 
	<count_text_id> = { count_text_container child = text } 
	IF ScreenElementExists id = <count_text_id> 
		IF GotParam hide 
			DoScreenElementMorph { 
				id = <count_text_id> 
				alpha = 0 
				time = 0.10000000149 
			} 
			RETURN 
		ENDIF 
		IF <parent> : GetSingleTag menu_item_count 
			IF <parent> : GetSingleTag menu_item_max_count 
				FormatText TextName = count_text "%a/%b" a = <menu_item_count> b = <menu_item_max_count> 
				DoScreenElementMorph { 
					id = <count_text_id> 
					alpha = 1 
					time = 0.00000000000 
				} 
				SetScreenElementProps { 
					id = <count_text_id> 
					text = <count_text> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_item_toggle_global_value 
	GetTags 
	IF NOT GotParam globalname 
		RETURN 
	ENDIF 
	IF NOT GotParam keyname 
		RETURN 
	ENDIF 
	IF IsTrue <globalname> 
		Change { 
			globalname = <globalname> 
			newvalue = 0 
		} 
		thugpro_save_key_value Key = <keyname> value = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
	ELSE 
		Change { 
			globalname = <globalname> 
			newvalue = 1 
		} 
		thugpro_save_key_value Key = <keyname> value = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_item_update_extra_text 
	IF ScreenElementExists id = { <id> child = extra_text } 
		IF GotParam text 
			GetUpperCaseString <text> 
			<text> = <UpperCaseString> 
			SetScreenElementProps id = { <id> child = extra_text } text = <text> 
		ELSE 
			IF GotParam off 
				SetScreenElementProps id = { <id> child = extra_text } text = "OFF" 
			ELSE 
				SetScreenElementProps id = { <id> child = extra_text } text = "ON" 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT __thugpro_menu_store_state 
ENDSCRIPT

SCRIPT thugpro_menu_desc_text_focus 
	IF NOT GotParam text 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = desc_text_container 
		DoScreenElementMorph { 
			id = { desc_text_container child = text } 
			alpha = 0.80000001192 
			time = 0.20000000298 
		} 
		SetScreenElementProps { 
			id = { desc_text_container child = text } 
			text = <text> 
		} 
	ENDIF 
	IF ScreenElementExists id = tp_helper_text 
		DoScreenElementMorph { 
			id = tp_helper_text 
			alpha = 0.80000001192 
			time = 0.20000000298 
		} 
		SetScreenElementProps { 
			id = tp_helper_text 
			text = <text> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_desc_text_unfocus 
	IF ScreenElementExists id = desc_text_container 
		DoScreenElementMorph { 
			id = { desc_text_container child = text } 
			alpha = 0.00000000000 
			time = 0.20000000298 
		} 
		SetScreenElementProps { 
			id = { desc_text_container child = text } 
			text = "" 
		} 
	ENDIF 
	IF ScreenElementExists id = tp_helper_text 
		DoScreenElementMorph { 
			id = tp_helper_text 
			alpha = 0.00000000000 
			time = 0.20000000298 
		} 
		SetScreenElementProps { 
			id = tp_helper_text 
			text = "" 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_item_focus 
	GetTags 
	text_id = { <id> child = text } 
	IF ScreenElementExists id = <text_id> 
		SetScreenElementProps { 
			id = <text_id> 
			rgba = [ 128 128 128 128 ] 
		} 
	ENDIF 
	thugpro_menu_update_scrollbar { 
		scrollbar_id = { current_menu_anchor child = scrollbar } 
		id = <id> 
		parent = <parent> 
	} 
	IF NOT GotParam child_texture_persistent 
		icon_id = { <id> child = icon } 
		IF ScreenElementExists id = <icon_id> 
			DoScreenElementMorph { 
				id = <icon_id> 
				alpha = 0.89999997616 
				time = 0.10000000149 
			} 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = { <id> child = left_arrow } 
		DoScreenElementMorph { 
			id = { <id> child = left_arrow } 
			alpha = 1 
		} 
		DoScreenElementMorph { 
			id = { <id> child = left_arrow } 
			scale = 0.40000000596 
			time = 0.10000000149 
		} 
	ENDIF 
	IF ScreenElementExists id = { <id> child = right_arrow } 
		DoScreenElementMorph { 
			id = { <id> child = right_arrow } 
			alpha = 1 
		} 
		DoScreenElementMorph { 
			id = { <id> child = right_arrow } 
			scale = 0.40000000596 
			time = 0.10000000149 
		} 
	ENDIF 
	bar_id = { <id> child = bar } 
	IF ScreenElementExists id = <bar_id> 
		DoScreenElementMorph { 
			id = <bar_id> 
			alpha = 1.00000000000 
			time = 0.10000000149 
		} 
		SetScreenElementProps { 
			id = <bar_id> 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		} 
		RunScriptOnScreenElement id = <bar_id> do_random_effect_paused 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_item_unfocus 
	GetTags 
	text_id = { <id> child = text } 
	IF ScreenElementExists id = <text_id> 
		SetScreenElementProps { 
			id = <text_id> 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		} 
	ENDIF 
	IF ScreenElementExists id = { <id> child = left_arrow } 
		DoScreenElementMorph { 
			id = { <id> child = left_arrow } 
			alpha = 0 
			scale = 0 
		} 
	ENDIF 
	IF ScreenElementExists id = { <id> child = right_arrow } 
		DoScreenElementMorph { 
			id = { <id> child = right_arrow } 
			alpha = 0 
			scale = 0 
		} 
	ENDIF 
	IF NOT GotParam child_texture_persistent 
		icon_id = { <id> child = icon } 
		IF ScreenElementExists id = <icon_id> 
			DoScreenElementMorph { 
				id = <icon_id> 
				alpha = 0.00000000000 
			} 
		ENDIF 
	ENDIF 
	bar_id = { <id> child = bar } 
	IF ScreenElementExists id = <bar_id> 
		DoScreenElementMorph { 
			id = <bar_id> 
			alpha = 0.00000000000 
		} 
	ENDIF 
	Change random_effect_break_loop = 1 
	KillSpawnedScript name = do_random_effect_paused 
	KillSpawnedScript name = do_random_effect_paused_2 
ENDSCRIPT

SCRIPT thugpro_menu_get_style_params 
	SWITCH <menu_style> 
		CASE MENU_STYLE_RIGHT 
			params = { 
				menu_pos = PAIR(300.00000000000, 88.00000000000) 
				menu_internal_just = [ center top ] 
				menu_bg_just = right 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(320.00000000000, 52.50000000000) 
				menu_line_offset = 320 
				menu_alignment = right 
			} 
		CASE MENU_STYLE_RIGHT_SKATER_SELECT 
			params = { 
				menu_pos = PAIR(300.00000000000, 88.00000000000) 
				menu_internal_just = [ center top ] 
				menu_bg_just = right 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(320.00000000000, 66.00000000000) 
				menu_line_offset = 320 
				menu_title_scale = 0.40000000596 
				menu_alignment = right 
			} 
		CASE MENU_STYLE_RIGHT_SKATESHOP 
			params = { 
				menu_pos = PAIR(480.00000000000, 88.00000000000) 
				menu_internal_just = [ center center ] 
				menu_bg_just = right 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(295.00000000000, 66.00000000000) 
				menu_line_offset = 160 
				menu_alignment = right 
			} 
		CASE MENU_STYLE_RIGHT_OFFSET 
			params = { 
				menu_pos = PAIR(385.00000000000, 88.00000000000) 
				menu_internal_just = [ center center ] 
				menu_bg_just = right 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(400.00000000000, 52.50000000000) 
				menu_line_offset = 160 
				menu_alignment = right 
			} 
		CASE MENU_STYLE_RIGHT_TEST 
			params = { 
				menu_pos = PAIR(340.00000000000, 88.00000000000) 
				menu_internal_just = [ center center ] 
				menu_bg_just = right 
				menu_title_just = [ center center ] 
				menu_title_text_just = [ center , center ] 
				menu_title_pos = PAIR(480.00000000000, 52.50000000000) 
				menu_line_offset = 160 
				menu_alignment = right 
			} 
		CASE MENU_STYLE_RIGHT_POS_MENU 
			params = { 
				menu_pos = PAIR(480.00000000000, 188.00000000000) 
				menu_internal_just = [ center center ] 
				menu_bg_just = right 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(320.00000000000, 52.50000000000) 
				menu_line_offset = 320 
				menu_alignment = right 
			} 
		CASE MENU_STYLE_LEFT 
			params = { 
				menu_pos = PAIR(-20.00000000000, 88.00000000000) 
				menu_internal_just = [ center top ] 
				menu_bg_just = left 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(0.00000000000, 52.50000000000) 
				menu_line_offset = 0 
				menu_alignment = left 
			} 
		CASE MENU_STYLE_MIDDLE 
			params = { 
				menu_pos = PAIR(140.00000000000, 88.00000000000) 
				menu_internal_just = [ center center ] 
				menu_bg_just = center 
				menu_title_just = [ center center ] 
				menu_title_text_just = [ center , center ] 
				menu_title_pos = PAIR(320.00000000000, 52.50000000000) 
				menu_line_offset = 160 
				menu_alignment = center 
			} 
		CASE MENU_STYLE_CUSTOM 
			params = { } 
		DEFAULT 
			params = { 
				menu_pos = PAIR(-20.00000000000, 88.00000000000) 
				menu_internal_just = [ center center ] 
				menu_bg_just = left 
				menu_title_just = [ left center ] 
				menu_title_text_just = [ left , center ] 
				menu_title_pos = PAIR(320.00000000000, 52.50000000000) 
				menu_line_offset = 160 
			} 
	ENDSWITCH 
	RETURN ( <params> ) 
ENDSCRIPT

SCRIPT thugpro_menu_create { 
		menu_name = unknown 
		menu_title = "MISSING TITLE" 
		menu_style = MENU_STYLE_LEFT 
		menu_parent = root_window 
		menu_anchor_alias = current_menu_anchor 
		menu_alias = current_menu 
		pad_back_params = { } 
		num_items_to_show = 13 
	} 
	IF GotParam scrolling 
		AppendSuffixToChecksum base = <menu_name> SuffixString = "_scrollingmenu" 
		<scrolling_menu_id> = <appended_id> 
		RemoveParameter appended_id 
	ENDIF 
	AppendSuffixToChecksum base = <menu_name> SuffixString = "_menu" 
	<menu_id> = <appended_id> 
	RemoveParameter appended_id 
	AppendSuffixToChecksum base = <menu_name> SuffixString = "_vmenu" 
	<vmenu_id> = <appended_id> 
	RemoveParameter appended_id 
	IF NOT GotParam no_cleanup 
		destroy_menu_background_title 
		dialog_box_exit 
		IF ScreenElementExists id = helper_text_anchor 
			DestroyScreenElement id = helper_text_anchor 
		ENDIF 
		IF ScreenElementExists id = desc_text_container 
			DestroyScreenElement id = desc_text_container 
		ENDIF 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		IF ScreenElementExists id = net_panel_msg_bg 
			DestroyScreenElement id = net_panel_msg_bg 
		ENDIF 
		IF ScreenElementExists id = net_panel_msg 
			DestroyScreenElement id = net_panel_msg 
		ENDIF 
	ENDIF 
	thugpro_menu_get_style_params { 
		menu_style = <menu_style> 
	} 
	IF GotParam dont_allow_wrap 
		<dont_allow_wrap> = dont_allow_wrap 
	ENDIF 
	IF GotParam scrolling 
		<scrolling_menu_dims_y> = ( PAIR(0.00000000000, 1.00000000000) * ( 20 * <num_items_to_show> ) ) 
		<scrolling_menu_dims_x> = PAIR(368.00000000000, 0.00000000000) 
		<scrolling_menu_dims> = ( <scrolling_menu_dims_x> + <scrolling_menu_dims_y> ) 
		make_new_menu { 
			parent = <menu_parent> 
			menu_id = <menu_id> 
			vmenu_id = <vmenu_id> 
			scrolling_menu_id = <scrolling_menu_id> 
			pos = <menu_pos> 
			internal_just = <menu_internal_just> 
			dims = <scrolling_menu_dims> 
			padding_scale = 0 
			type = VScrollingMenu 
			num_items_to_show = <num_items_to_show> 
			regular_space_amount = 23 
			<dont_allow_wrap> 
			no_menu_title 
			no_alias 
		} 
		AssignAlias id = <menu_id> alias = <menu_anchor_alias> 
		AssignAlias id = <vmenu_id> alias = <menu_alias> 
		<vmenu_id> : SetTags anchor = <menu_id> 
		<menu_scrollbar_pos> = ( PAIR(324.00000000000, 90.00000000000) + ( PAIR(1.00000000000, 0.00000000000) * <menu_line_offset> ) ) 
		<menu_line_top_pos> = ( PAIR(0.00000000000, 90.00000000000) + ( PAIR(1.00000000000, 0.00000000000) * <menu_line_offset> ) ) 
		<menu_line_bot_pos> = ( <menu_line_top_pos> + ( PAIR(0.00000000000, 1.00000000000) * ( 23 * <num_items_to_show> ) ) - PAIR(0.00000000000, 1.00000000000) ) 
		IF GotParam boxed 
			IF GotParam width_ajustment 
				<box_line_width> = ( PAIR(80.00000000000, 0.00000000000) * <width_ajustment> ) 
			ELSE 
				<box_line_width> = PAIR(80.00000000000, 0.00000000000) 
			ENDIF 
			CreateScreenElement { 
				type = SpriteElement 
				local_id = line_top 
				parent = <menu_id> 
				just = [ left , top ] 
				alpha = 1.00000000000 
				texture = white 
				pos = <menu_line_top_pos> 
				scale = ( <box_line_width> + PAIR(0.00000000000, 0.10000000149) ) 
				z_priority = 600 
			} 
			CreateScreenElement { 
				type = SpriteElement 
				local_id = line_bot 
				parent = <menu_id> 
				just = [ left , top ] 
				alpha = 1.00000000000 
				texture = white 
				pos = <menu_line_bot_pos> 
				scale = ( <box_line_width> + PAIR(0.00000000000, 0.10000000149) ) 
				z_priority = 600 
			} 
			<box_line_id> = <id> 
			IF ( <num_items_to_show> > 4 ) 
				thugpro_menu_create_grunge_elements { 
					parent = <box_line_id> 
					height = <num_items_to_show> 
				} 
			ENDIF 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			local_id = scrollbar 
			parent = <menu_id> 
			just = [ center , top ] 
			alpha = 1.00000000000 
			texture = statbody 
			pos = <menu_scrollbar_pos> 
			scale = PAIR(0.10000000149, 1.63999998569) 
			z_priority = 700 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		} 
		IF GotParam show_element_counter 
			thugpro_menu_create_count_text { 
				parent = <menu_id> 
				pos = <menu_line_bot_pos> 
			} 
		ENDIF 
	ELSE 
		make_new_menu { 
			parent = <menu_parent> 
			menu_id = <menu_id> 
			vmenu_id = <vmenu_id> 
			pos = <menu_pos> 
			internal_just = <menu_internal_just> 
			type = VMenu 
			dims = PAIR(360.00000000000, 300.00000000000) 
			<dont_allow_wrap> 
			no_menu_title 
			no_alias 
		} 
		AssignAlias id = <menu_id> alias = <menu_anchor_alias> 
		AssignAlias id = <vmenu_id> alias = <menu_alias> 
		<vmenu_id> : SetTags anchor = <menu_id> 
	ENDIF 
	IF GotParam helper_text 
		IF NOT GotParam helper_text_pos 
			IF StructureContains structure = <helper_text> helper_text_elements_2_pc 
				<helper_text_pos> = PAIR(320.00000000000, 458.00000000000) 
			ELSE 
				IF StructureContains structure = <helper_text> helper_text_elements_2_console 
					<helper_text_pos> = PAIR(320.00000000000, 458.00000000000) 
				ELSE 
					<helper_text_pos> = PAIR(320.00000000000, 465.00000000000) 
				ENDIF 
			ENDIF 
		ENDIF 
		create_helper_text { 
			<helper_text> 
			parent = <menu_id> 
			helper_text_pos = <helper_text_pos> 
		} 
	ENDIF 
	IF GotParam show_description_panel 
		thugpro_menu_create_helper_text parent = <menu_id> 
	ENDIF 
	IF GotParam pad_back_script 
		SetScreenElementProps { 
			id = <vmenu_id> 
			event_handlers = [ { pad_back <pad_back_script> params = ( { from_callback } + <pad_back_params> ) } ] 
			replace_handlers 
		} 
		IF NOT GotParam no_sound 
			SetScreenElementProps { 
				id = <vmenu_id> 
				event_handlers = [ { pad_back generic_menu_pad_back_sound } ] 
			} 
		ENDIF 
	ENDIF 
	IF GotParam pause_menu 
		<pause_menu> = pause_menu 
	ENDIF 
	IF NOT GotParam no_menu_title 
		thugpro_menu_create_title { 
			title_text = <menu_title> 
			title_pos = <menu_title_pos> 
			title_scale = <menu_title_scale> 
			title_just = <menu_title_just> 
			title_text_just = <menu_title_text_just> 
			title_texture = <menu_title_texture> 
		} 
	ENDIF 
	IF GotParam show_gradient 
		thugpro_menu_create_background { 
			parent = <menu_anchor_alias> 
			gradient <menu_alignment> 
		} 
	ELSE 
		IF GotParam show_board 
			thugpro_menu_create_background { 
				parent = <menu_anchor_alias> 
				board 
			} 
		ENDIF 
	ENDIF 
	IF GotParam num_items_to_show 
		<vmenu_id> : SetTags num_items_to_show = <num_items_to_show> 
	ENDIF 
	IF GotParam boxed 
		<vmenu_id> : SetTags boxed = boxed 
	ENDIF 
	IF GotParam colorful 
		<vmenu_id> : SetTags colorful = colorful 
	ENDIF 
	IF GotParam width_ajustment 
		<vmenu_id> : SetTags width_ajustment = <width_ajustment> 
	ENDIF 
	IF GotParam wide_extra_text 
		<vmenu_id> : SetTags wide_extra_text = wide_extra_text 
	ENDIF 
	IF GotParam scrolling 
		<vmenu_id> : SetTags scrolling = scrolling 
	ENDIF 
	IF GotParam menu_item_max_width 
		<vmenu_id> : SetTags menu_item_max_width = <menu_item_max_width> 
	ENDIF 
	<vmenu_id> : SetTags menu_style = <menu_style> 
	<vmenu_id> : SetTags menu_item_count = 0 
ENDSCRIPT

SCRIPT thugpro_menu_finalize { 
		parent = current_menu 
	} 
	thugpro_menu_find_last_item { parent = <parent> } 
	IF GotParam last_item_id 
		SetScreenElementProps id = <last_item_id> tags = { last_item = last_item } 
	ENDIF 
	IF <parent> : GetSingleTag boxed 
		<parent> : GetSingleTag width_ajustment 
		IF NOT <parent> : GetSingleTag scrolling 
			thugpro_menu_mark_last_item { id = <last_item_id> width_ajustment = <width_ajustment> parent = <parent> } 
		ENDIF 
	ENDIF 
	thugpro_menu_update_counter_text <...> 
	SetScreenElementProps id = root_window tags = { menu_state = on } 
	IF NOT GotParam no_animate 
		RunScriptOnScreenElement id = <parent> animate_in_fade 
	ENDIF 
	IF NOT GotParam no_focus 
		IF GotParam focus_target 
			FireEvent type = focus target = <parent> data = { child_id = <focus_target> } 
		ELSE 
			FireEvent type = focus target = <parent> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_update_scrollbar 
	IF NOT ScreenElementExists id = <scrollbar_id> 
		RETURN 
	ENDIF 
	IF NOT <parent> : GetSingleTag num_items_to_show 
		RETURN 
	ENDIF 
	IF NOT <parent> : GetSingleTag menu_item_count 
		RETURN 
	ENDIF 
	IF NOT <parent> : GetSingleTag menu_style 
		RETURN 
	ENDIF 
	IF NOT <id> : GetSingleTag menu_item_index 
		menu_item_index = 0 
	ENDIF 
	thugpro_menu_get_style_params { 
		menu_style = <menu_style> 
	} 
	<scrollbar_base_position> = ( PAIR(324.00000000000, 90.00000000000) + ( PAIR(1.00000000000, 0.00000000000) * <menu_line_offset> ) ) 
	<scrollbar_sprite_scale_factor> = 1.63999998569 
	<scrollbar_sprite_position_factor> = 23 
	<scrollbar_width> = 0.10000000149 
	IF ( <menu_item_index> > 0 ) 
		<scrollbar_percentage> = ( ( ( <menu_item_index> + 1 ) * 1.00000000000 ) / ( <menu_item_count> * 1.00000000000 ) ) 
	ELSE 
		<scrollbar_percentage> = 0.00000000000 
	ENDIF 
	IF ( <menu_item_count> < <num_items_to_show> ) 
		<scrollbar_height> = ( ( <scrollbar_sprite_scale_factor> * <num_items_to_show> ) + 0.05999999866 ) 
		<scrollbar_increment> = 0.00000000000 
	ELSE 
		<scrollbar_height> = <scrollbar_sprite_scale_factor> 
		<scrollbar_increment> = ( <scrollbar_sprite_position_factor> * ( <scrollbar_percentage> * ( <num_items_to_show> - 1 ) ) ) 
	ENDIF 
	<scrollbar_position> = ( <scrollbar_base_position> + ( PAIR(0.00000000000, 1.00000000000) * <scrollbar_increment> ) ) 
	<scrollbar_scale> = ( ( PAIR(1.00000000000, 0.00000000000) * <scrollbar_width> ) + ( PAIR(0.00000000000, 1.00000000000) * <scrollbar_height> ) ) 
	DoScreenElementMorph { 
		id = <scrollbar_id> 
		scale = <scrollbar_scale> 
		pos = <scrollbar_position> 
		time = 0.10000000149 
	} 
ENDSCRIPT

SCRIPT __convert_to_vec2 { 
		X = 0 
		y = 0 
	} 
	RETURN { result = ( ( PAIR(1.00000000000, 0.00000000000) * <X> ) + ( PAIR(0.00000000000, 1.00000000000) * <y> ) ) } 
ENDSCRIPT

SCRIPT thugpro_menu_create_remainder_items { 
		parent = current_menu 
	} 
	IF <parent> : GetSingleTag menu_item_count 
		<index> = 0 
		<remainder> = ( 13 - <menu_item_count> ) 
		IF ( <remainder> > 0 ) 
			BEGIN 
				make_thugpro_menu_item { not_counted not_focusable } 
				<index> = ( <index> + 1 ) 
			REPEAT <remainder> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_destroy 
	thugpro_menu_destroy_title 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = current_sub_menu_anchor 
		DestroyScreenElement id = current_sub_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = bg_container 
		DestroyScreenElement id = bg_container 
	ENDIF 
	IF ScreenElementExists id = helper_text_anchor 
		DestroyScreenElement id = helper_text_anchor 
	ENDIF 
	IF ScreenElementExists id = desc_text_container 
		DestroyScreenElement id = desc_text_container 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_destroy_title 
	IF ScreenElementExists id = pause_gradient 
		DestroyScreenElement id = pause_gradient 
	ENDIF 
	pause_menu_gradient off 
	IF ScreenElementExists id = menu_title_container 
		DestroyScreenElement id = menu_title_container 
	ENDIF 
	IF ScreenElementExists id = bg_container 
		DestroyScreenElement id = bg_container 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_create_helper_text { 
		parent = current_menu_anchor 
	} 
	container_id = desc_text_container 
	IF ScreenElementExists id = <container_id> 
		DestroyScreenElement id = <container_id> 
	ENDIF 
	CreateScreenElement { 
		id = <container_id> 
		parent = <parent> 
		type = ContainerElement 
		pos = PAIR(320.00000000000, 398.00000000000) 
	} 
	helper_text_just = [ center , center ] 
	CreateScreenElement { 
		local_id = text 
		parent = <container_id> 
		type = TextElement 
		font = bebas 
		text = "" 
		scale = 0.15000000596 
		alpha = 0.00000000000 
		just = <helper_text_just> 
		internal_just = <helper_text_just> 
		z_priority = 1020 
	} 
	CreateScreenElement { 
		local_id = panel 
		parent = <container_id> 
		type = SpriteElement 
		texture = white 
		alpha = 0.40000000596 
		just = [ center center ] 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(200.00000000000, 10.00000000000) 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_reset_item_count { 
		parent = current_menu 
	} 
	<parent> : SetTags menu_item_count = 0 
ENDSCRIPT

SCRIPT thugpro_menu_create_count_text { 
		parent = current_menu_anchor 
		pos = PAIR(320.00000000000, 398.00000000000) 
	} 
	container_id = count_text_container 
	IF ScreenElementExists id = <container_id> 
		DestroyScreenElement id = <container_id> 
	ENDIF 
	CreateScreenElement { 
		id = <container_id> 
		parent = <parent> 
		type = ContainerElement 
		pos = ( <pos> + PAIR(0.00000000000, 11.00000000000) ) 
	} 
	helper_text_just = [ left , top ] 
	CreateScreenElement { 
		local_id = text 
		parent = <container_id> 
		type = TextElement 
		font = bebas 
		text = "0/99" 
		scale = 0.15000000596 
		alpha = 1.00000000000 
		just = [ left , center ] 
		internal_just = [ left , center ] 
		z_priority = 1020 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_create_background { 
		parent = current_menu_anchor 
	} 
	IF ScreenElementExists id = bg_container 
		DestroyScreenElement id = bg_container 
	ENDIF 
	container_id = bg_container 
	CreateScreenElement { 
		id = <container_id> 
		parent = <parent> 
		type = ContainerElement 
	} 
	IF GotParam gradient 
		IF GotParam right 
			bg_scale = PAIR(5.00000000000, 2.00000000000) 
			bg_pos = PAIR(0.00000000000, 320.00000000000) 
		ELSE 
			bg_scale = PAIR(-5.00000000000, 2.00000000000) 
			bg_pos = PAIR(-80.00000000000, 320.00000000000) 
		ENDIF 
		bg_texture = bg_gradient 
		bg_real_just = [ left , center ] 
		bg_alpha = 0.69999998808 
		bg_rgba = [ 0 0 0 128 ] 
	ELSE 
		bg_texture = bg_board_top 
		bg_pos = PAIR(480.00000000000, 300.00000000000) 
		bg_scale = PAIR(1.00000000000, 1.00000000000) 
		bg_alpha = 1.00000000000 
		bg_rgba = [ 128 128 128 128 ] 
		bg_real_just = [ center , center ] 
		bg_rot_angle = -92 
	ENDIF 
	CreateScreenElement { 
		id = menu_bg_texture 
		parent = <container_id> 
		type = SpriteElement 
		scale = <bg_scale> 
		alpha = <bg_alpha> 
		pos = <bg_pos> 
		texture = <bg_texture> 
		rgba = <bg_rgba> 
		just = <bg_real_just> 
		rot_angle = <bg_rot_angle> 
		z_priority = -2 
	} 
	CreateScreenElement { 
		id = menu_gradient_top 
		parent = <container_id> 
		type = SpriteElement 
		texture = top_gradient 
		alpha = 0.69999998808 
		scale = PAIR(90.00000000000, 8.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		z_priority = -2 
	} 
	CreateScreenElement { 
		id = menu_gradient_corner 
		parent = <container_id> 
		type = SpriteElement 
		texture = white3 
		alpha = 0.89999997616 
		scale = PAIR(12.00000000000, 6.00000000000) 
		pos = PAIR(-180.00000000000, 320.00000000000) 
		rot_angle = 230 
		just = [ center top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
		z_priority = -4 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_create_title { 
		title_text = "Missing title!!!" 
		title_pos = PAIR(0.00000000000, 52.50000000000) 
		title_scale = 0.60000002384 
		title_font = machine 
		title_just = [ left center ] 
		title_text_just = [ left , center ] 
	} 
	thugpro_menu_destroy_title 
	container_id = menu_title_container 
	CreateScreenElement { 
		id = <container_id> 
		parent = root_window 
		type = ContainerElement 
		pos = <title_pos> 
		just = <title_just> 
		scale = <title_scale> 
	} 
	IF GotParam title_texture 
		CreateScreenElement { 
			id = menu_title_texture 
			parent = <container_id> 
			type = SpriteElement 
			texture = <title_texture> 
			z_priority = 1020 
			just = <title_text_just> 
			internal_just = <title_text_just> 
		} 
	ELSE 
		GetUpperCaseString <title_text> 
		<title_text> = <UpperCaseString> 
		CreateScreenElement { 
			id = menu_title_text 
			parent = <container_id> 
			type = TextElement 
			text = <title_text> 
			font = <title_font> 
			z_priority = 1020 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
			just = <title_text_just> 
			internal_just = <title_text_just> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_menu_camera_create { 
		targetAngle = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		targetPosition = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		targetOffset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		targetName = CAM_TARGET_default 
		positionOffset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	} 
	KillSkaterCamAnim name = <cameraName> 
	IF ObjectExists id = <cameraName> 
		<cameraName> : Die 
	ENDIF 
	IF ObjectExists id = <targetName> 
		<targetName> : Die 
	ENDIF 
	create_camera_target_object { 
		name = <targetName> 
		pos = <targetPosition> 
		Angle = <targetAngle> 
	} 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim { 
		name = <cameraName> 
		TargetID = <targetName> 
		targetOffset = <targetOffset> 
		positionOffset = <positionOffset> 
		Skater = 0 
		Frames = 1 
		virtual_cam 
		play_hold 
	} 
	SetActiveCamera id = <cameraName> 
	IF ObjectExists id = Skater 
		IF GotParam Anim 
			Skater : Obj_PlayAnim Anim = <Anim> Speed = 0.10000000149 Cycle NoRestart 
		ENDIF 
	ENDIF 
ENDSCRIPT

num_menu_camera_targets = 0 
max_menu_camera_targets = 32 
SCRIPT create_camera_target_object { 
		pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Angle = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	} 
	IF ( num_menu_camera_targets > max_menu_camera_targets ) 
		RETURN 
	ENDIF 
	IF GotParam name 
		IF CompositeObjectExists name = <name> 
			edmsg2 "\\c4Object with name %a already exists!" a = <name> 
			RETURN 
		ENDIF 
	ELSE 
		FormatText ChecksumName = name "camera_target_%a" a = ( num_menu_camera_targets ) 
	ENDIF 
	CreateFromStructure { 
		name = <name> 
		pos = <pos> 
		Angles = <Angle> 
		Class = GameObject 
		CreatedAtStart 
		Model = "None" 
	} 
	Change num_menu_camera_targets = ( ( num_menu_camera_targets ) + 1 ) 
	RETURN targetName = <name> 
ENDSCRIPT


