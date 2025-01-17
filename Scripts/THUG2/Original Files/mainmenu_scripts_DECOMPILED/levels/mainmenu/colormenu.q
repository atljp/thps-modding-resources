
colormenu_bar_scale = PAIR(4.40000009537, 2.00000000000) 
colormenu_bar_focus_rgba = [ 128 128 128 118 ] 
colormenu_bar_unfocus_rgba = [ 40 40 40 118 ] 
colormenu_bar_pos = PAIR(12.00000000000, 0.00000000000) 
colormenu_text_pos = PAIR(-102.00000000000, 0.00000000000) 
colormenu_spacing_between = 25 
colormenu_arrow_pos_up = PAIR(0.00000000000, 7.00000000000) 
colormenu_arrow_pos_down = PAIR(0.00000000000, -7.00000000000) 
colormenu_arrow_rgba = [ 128 128 128 128 ] 
colormenu_arrow_scale = 0.69999998808 
colormenu_wrap_arrow_left = -53.00000000000 
colormenu_wrap_arrow_right = 80.00000000000 
colormenu_nowrap_arrow_left = -53.00000000000 
colormenu_nowrap_arrow_right = 80.00000000000 
colormenu_hue_increment = 5 
colormenu_saturation_increment = 3 
colormenu_value_increment = 2 
colormenu_min_saturation = 0.00000000000 
colormenu_max_saturation = 90.00000000000 
colormenu_min_value = 12.00000000000 
colormenu_max_value = 60.00000000000 
SCRIPT edit_graphic_image_focus_glow 
	BEGIN 
		DoMorph time = 0 alpha = 0.69999998808 
		DoMorph time = 0.30000001192 alpha = 1 
		DoMorph time = 0.30000001192 alpha = 0.69999998808 
	REPEAT 
ENDSCRIPT

SCRIPT colormenu_focus rgba = [ 128 128 128 50 ] in_cagr = 0 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_rgba = [ 0 , 0 , 0 , 0 ] 
	} 
	DoScreenElementMorph id = { <id> child = 2 } alpha = 1 time = 0 
	RunScriptOnScreenElement id = { <id> child = 2 } edit_graphic_image_focus_glow 
	IF GotParam pad_left_handler 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_left <pad_left_handler> params = <handler_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_right_handler 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_right <pad_right_handler> params = <handler_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = <color_bar_id> 
		rgba = colormenu_bar_focus_rgba 
	} 
	DoScreenElementMorph { 
		id = <down_arrow_id> 
		scale = colormenu_arrow_scale 
	} 
	DoScreenElementMorph { 
		id = <up_arrow_id> 
		scale = colormenu_arrow_scale 
	} 
	IF ( <in_cagr> = 1 ) 
		edit_graphic_update_color_arrows 
	ELSE 
		colormenu_refresh_arrows part = <part> 
		generic_menu_update_arrows { 
			up_arrow_id = edit_skater_menu_up_arrow 
			down_arrow_id = edit_skater_menu_down_arrow 
		} 
	ENDIF 
	IF ObjectExists id = edit_skater_vmenu 
		edit_skater_vmenu : GetTags 
		IF GotParam arrow_id 
			menu_vert_blink_arrow { id = <arrow_id> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT colormenu_unfocus rgba = [ 128 128 128 0 ] 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 128 , 128 , 128 , 128 ] 
		shadow_rgba = UI_text_shadow_color 
	} 
	DoScreenElementMorph id = { <id> child = 2 } alpha = 0 time = 0 
	KillSpawnedScript name = edit_graphic_image_focus_glow 
	SetScreenElementProps { 
		id = <color_bar_id> 
		rgba = colormenu_bar_unfocus_rgba 
	} 
	DoScreenElementMorph { 
		id = <down_arrow_id> 
		scale = 0.00000000000 
	} 
	DoScreenElementMorph { 
		id = <up_arrow_id> 
		scale = 0.00000000000 
	} 
ENDSCRIPT

SCRIPT colormenu_get_default_color 
	IF NOT GotParam part 
		script_assert "no part parameter" 
	ENDIF 
	IF NOT GotParam desc_id 
		script_assert "no desc_id parameter" 
	ENDIF 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id> 
	IF GotParam default_h 
		<h> = <default_h> 
	ELSE 
		<h> = 0 
	ENDIF 
	IF GotParam default_s 
		<s> = <default_s> 
	ELSE 
		<s> = 50 
	ENDIF 
	IF GotParam default_v 
		<v> = <default_v> 
	ELSE 
		<v> = 50 
	ENDIF 
	RETURN h = <h> s = <s> v = <v> 
ENDSCRIPT

SCRIPT colormenu_get_hsv 
	GetCurrentSkaterProfileIndex 
	GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
	IF NOT GotParam use_default_hsv 
		<use_default_hsv> = 1 
	ENDIF 
	IF NOT GotParam h 
		<h> = 0 
	ENDIF 
	IF NOT GotParam s 
		<s> = 0 
	ENDIF 
	IF NOT GotParam v 
		<v> = 0 
	ENDIF 
	IF ( <use_default_hsv> = 1 ) 
		colormenu_get_default_color part = <part> desc_id = <desc_id> 
	ENDIF 
	RETURN h = <h> s = <s> v = <v> use_default_hsv = <use_default_hsv> 
ENDSCRIPT

SCRIPT colormenu_set_hsv use_default_hsv = 0 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = <use_default_hsv> 
ENDSCRIPT

SCRIPT colormenu_refresh_arrows 
	colormenu_get_hsv part = <part> 
	sliderbar_rescale_to_bar min = 0.00000000000 max = 360.00000000000 value = <h> left = colormenu_wrap_arrow_left right = colormenu_wrap_arrow_right 
	SetScreenElementProps { 
		id = hue_up_arrow 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
	SetScreenElementProps { 
		id = hue_down_arrow 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
	sliderbar_rescale_to_bar min = colormenu_min_saturation max = colormenu_max_saturation value = <s> left = colormenu_nowrap_arrow_left right = colormenu_nowrap_arrow_right 
	SetScreenElementProps { 
		id = saturation_up_arrow 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
	SetScreenElementProps { 
		id = saturation_down_arrow 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
	sliderbar_rescale_to_bar min = colormenu_min_value max = colormenu_max_value value = <v> left = colormenu_nowrap_arrow_left right = colormenu_nowrap_arrow_right 
	SetScreenElementProps { 
		id = value_up_arrow 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
	SetScreenElementProps { 
		id = value_down_arrow 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
ENDSCRIPT

SCRIPT colormenu_refresh_skaters 
	GetCurrentSkaterProfileIndex 
	RefreshSkaterColors skater = 0 profile = <currentSkaterProfileIndex> 
ENDSCRIPT

SCRIPT colormenu_increment_hue 
	colormenu_get_hsv part = <part> 
	<h> = ( <h> + colormenu_hue_increment ) 
	IF ( <h> > 359 ) 
		<h> = ( <h> - 360 ) 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_decrement_hue 
	colormenu_get_hsv part = <part> 
	<h> = ( <h> - colormenu_hue_increment ) 
	IF ( <h> < 0 ) 
		<h> = ( <h> + 360 ) 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_increment_saturation 
	colormenu_get_hsv part = <part> 
	<s> = ( <s> + colormenu_saturation_increment ) 
	IF ( <s> > colormenu_max_saturation ) 
		<s> = colormenu_max_saturation 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_decrement_saturation 
	colormenu_get_hsv part = <part> 
	<s> = ( <s> - colormenu_saturation_increment ) 
	IF ( <s> < colormenu_min_saturation ) 
		<s> = colormenu_min_saturation 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_increment_value 
	colormenu_get_hsv part = <part> 
	<v> = ( <v> + colormenu_value_increment ) 
	IF ( <v> > colormenu_max_value ) 
		<v> = colormenu_max_value 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_decrement_value 
	colormenu_get_hsv part = <part> 
	<v> = ( <v> - colormenu_value_increment ) 
	IF ( <v> < colormenu_min_value ) 
		<v> = colormenu_min_value 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_reset_to_default 
	GetCurrentSkaterProfileIndex 
	GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
	colormenu_get_default_color part = <part> desc_id = <desc_id> 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = 1 
	colormenu_refresh_arrows part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT colormenu_add_options_to_menu 
	IF NOT GotParam from_caf 
		SetScreenElementProps { 
			id = current_menu 
			spacing_between = colormenu_spacing_between 
		} 
	ENDIF 
	IF GotParam from_cas 
		IF ( in_boardshop = 1 ) 
			create_helper_text generic_helper_text_left_right_up_down 
		ELSE 
			create_helper_text generic_helper_text_color_menu 
		ENDIF 
		SetScreenElementProps { 
			id = current_menu 
			spacing_between = 1 
		} 
	ENDIF 
	IF GlobalExists name = EG_in_create_a_graphic type = int 
		<in_cagr> = EG_in_create_a_graphic 
	ELSE 
		<in_cagr> = 0 
	ENDIF 
	IF ( <in_cagr> = 1 ) 
		<hue_down> = edit_graphic_decrement_hue 
		<hue_up> = edit_graphic_increment_hue 
		<sat_down> = edit_graphic_decrement_saturation 
		<sat_up> = edit_graphic_increment_saturation 
		<val_down> = edit_graphic_decrement_value 
		<val_up> = edit_graphic_increment_value 
		<alpha_down> = edit_graphic_decrement_alpha 
		<alpha_up> = edit_graphic_increment_alpha 
	ELSE 
		<hue_down> = colormenu_decrement_hue 
		<hue_up> = colormenu_increment_hue 
		<sat_down> = colormenu_decrement_saturation 
		<sat_up> = colormenu_increment_saturation 
		<val_down> = colormenu_decrement_value 
		<val_up> = colormenu_increment_value 
	ENDIF 
	<focus_script> = colormenu_focus 
	<unfocus_script> = colormenu_unfocus 
	sliderbar_add_item { 
		text = #"HUE" 
		focus_script = <focus_script> 
		focus_params = { 
			pad_left_handler = <hue_down> 
			pad_right_handler = <hue_up> 
			handler_params = { part = <part> } 
			up_arrow_id = hue_up_arrow 
			down_arrow_id = hue_down_arrow 
			part = <part> 
			color_bar_id = hue_slider_bar 
			from_caf = <from_caf> 
			in_cagr = <in_cagr> 
		} 
		unfocus_script = <unfocus_script> 
		unfocus_params = { 
			up_arrow_id = hue_up_arrow 
			down_arrow_id = hue_down_arrow 
			color_bar_id = hue_slider_bar 
			from_caf = <from_caf> 
		} 
		pad_choose_script = nullscript 
		child_texture = colorbar 
		icon_id = hue_slider_bar 
		icon_scale = colormenu_bar_scale 
		icon_rgba = colormenu_bar_unfocus_rgba 
		icon_pos = colormenu_bar_pos 
		text_pos = colormenu_text_pos 
		text_just = [ left center ] 
		tab = tab3 
		anchor_id = hue_anchor 
		up_arrow_id = hue_up_arrow 
		down_arrow_id = hue_down_arrow 
		arrow_pos_up = colormenu_arrow_pos_up 
		arrow_pos_down = colormenu_arrow_pos_down 
		arrow_rgba = colormenu_arrow_rgba 
		text_pos = <text_pos> 
		icon_pos = <icon_pos> 
		arrow_pos_up = <arrow_pos_up> 
		arrow_pos_down = <arrow_pos_down> 
		dims = <dims> 
		bar_pos = <bar_pos> 
	} 
	sliderbar_add_item { 
		text = #"SAT." 
		focus_script = <focus_script> 
		focus_params = { 
			pad_left_handler = <sat_down> 
			pad_right_handler = <sat_up> 
			handler_params = { part = <part> } 
			up_arrow_id = saturation_up_arrow 
			down_arrow_id = saturation_down_arrow 
			part = <part> 
			color_bar_id = saturation_slider_bar 
			from_caf = <from_caf> 
			in_cagr = <in_cagr> 
		} 
		unfocus_script = <unfocus_script> 
		unfocus_params = { 
			up_arrow_id = saturation_up_arrow 
			down_arrow_id = saturation_down_arrow 
			color_bar_id = saturation_slider_bar 
			from_caf = <from_caf> 
		} 
		pad_choose_script = nullscript 
		child_texture = bw_slider 
		icon_id = saturation_slider_bar 
		icon_scale = colormenu_bar_scale 
		icon_rgba = colormenu_bar_unfocus_rgba 
		icon_pos = colormenu_bar_pos 
		text_pos = colormenu_text_pos 
		text_just = [ left center ] 
		tab = tab3 
		anchor_id = saturation_anchor 
		up_arrow_id = saturation_up_arrow 
		down_arrow_id = saturation_down_arrow 
		arrow_pos_up = colormenu_arrow_pos_up 
		arrow_pos_down = colormenu_arrow_pos_down 
		arrow_rgba = colormenu_arrow_rgba 
		text_pos = <text_pos> 
		icon_pos = <icon_pos> 
		arrow_pos_up = <arrow_pos_up> 
		arrow_pos_down = <arrow_pos_down> 
		dims = <dims> 
		bar_pos = <bar_pos> 
	} 
	sliderbar_add_item { 
		text = #"VAL." 
		focus_script = <focus_script> 
		focus_params = { 
			pad_left_handler = <val_down> 
			pad_right_handler = <val_up> 
			handler_params = { part = <part> } 
			up_arrow_id = value_up_arrow 
			down_arrow_id = value_down_arrow 
			part = <part> 
			color_bar_id = value_slider_bar 
			from_caf = <from_caf> 
			in_cagr = <in_cagr> 
		} 
		unfocus_script = <unfocus_script> 
		unfocus_params = { 
			up_arrow_id = value_up_arrow 
			down_arrow_id = value_down_arrow 
			color_bar_id = value_slider_bar 
			from_caf = <from_caf> 
		} 
		pad_choose_script = nullscript 
		child_texture = bw_slider 
		icon_id = value_slider_bar 
		icon_scale = colormenu_bar_scale 
		icon_rgba = colormenu_bar_unfocus_rgba 
		icon_pos = colormenu_bar_pos 
		text_pos = colormenu_text_pos 
		text_just = [ left center ] 
		tab = tab3 
		anchor_id = value_anchor 
		up_arrow_id = value_up_arrow 
		down_arrow_id = value_down_arrow 
		arrow_pos_up = colormenu_arrow_pos_up 
		arrow_pos_down = colormenu_arrow_pos_down 
		arrow_rgba = colormenu_arrow_rgba 
		text_pos = <text_pos> 
		icon_pos = <icon_pos> 
		arrow_pos_up = <arrow_pos_up> 
		arrow_pos_down = <arrow_pos_down> 
		dims = <dims> 
		bar_pos = <bar_pos> 
	} 
	IF ( <in_cagr> = 1 ) 
		sliderbar_add_item { 
			text = #"FADE" 
			focus_script = <focus_script> 
			focus_params = { 
				pad_left_handler = <alpha_down> 
				pad_right_handler = <alpha_up> 
				handler_params = { part = <part> } 
				up_arrow_id = alpha_up_arrow 
				down_arrow_id = alpha_down_arrow 
				part = <part> 
				color_bar_id = alpha_slider_bar 
				from_caf = <from_caf> 
				in_cagr = <in_cagr> 
			} 
			unfocus_script = <unfocus_script> 
			unfocus_params = { 
				up_arrow_id = alpha_up_arrow 
				down_arrow_id = alpha_down_arrow 
				color_bar_id = alpha_slider_bar 
				from_caf = <from_caf> 
			} 
			pad_choose_script = nullscript 
			child_texture = bw_slider 
			icon_id = alpha_slider_bar 
			icon_scale = colormenu_bar_scale 
			icon_rgba = colormenu_bar_unfocus_rgba 
			icon_pos = colormenu_bar_pos 
			text_pos = colormenu_text_pos 
			text_just = [ left center ] 
			tab = tab3 
			anchor_id = alpha_anchor 
			up_arrow_id = alpha_up_arrow 
			down_arrow_id = alpha_down_arrow 
			arrow_pos_up = colormenu_arrow_pos_up 
			arrow_pos_down = colormenu_arrow_pos_down 
			arrow_rgba = colormenu_arrow_rgba 
			text_pos = <text_pos> 
			icon_pos = <icon_pos> 
			arrow_pos_up = <arrow_pos_up> 
			arrow_pos_down = <arrow_pos_down> 
			dims = <dims> 
		} 
	ENDIF 
	IF NOT GotParam from_caf 
		sliderbar_add_text_item { 
			text = #"RESET TO DEFAULT" 
			pad_choose_script = colormenu_reset_to_default 
			pad_choose_params = { part = <part> } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT posmenu_add_options_to_menu 
	SetScreenElementProps { 
		id = current_menu 
		spacing_between = colormenu_spacing_between 
		event_handlers = [ 
			{ pad_up null_script } 
			{ pad_down null_script } 
		] 
		replace_handlers 
	} 
	IF ( GotParam part ) 
		material = ( ( <part> [ 0 ] ) . material ) 
		pass = ( ( <part> [ 0 ] ) . pass ) 
	ENDIF 
	IF GotParam from_cas 
		create_helper_text generic_helper_text_color_menu 
	ENDIF 
	IF GlobalExists name = EG_in_create_a_graphic type = int 
		<in_cagr> = EG_in_create_a_graphic 
	ELSE 
		<in_cagr> = 0 
	ENDIF 
	IF ( <in_cagr> = 0 ) 
		IF NOT GotParam no_pos 
			<add_pos> = add_pos 
		ELSE 
			<add_pos> = <no_pos> 
		ENDIF 
		IF NOT GotParam no_rot 
			<add_rot> = add_rot 
		ENDIF 
		IF NOT GotParam no_scale 
			<add_scale> = add_scale 
		ENDIF 
	ENDIF 
	posmenu_add_item { 
		part = <part> 
		material = <material> 
		pass = <pass> 
		add_pos = <add_pos> 
		add_rot = <add_rot> 
		add_scale = <add_scale> 
	} 
ENDSCRIPT

SCRIPT posmenu_add_item { pad_choose_script = null_script 
		tab = tab3 
		font = small 
		icon_scale = 0 
		icon_pos = PAIR(22.00000000000, 9.00000000000) 
		text_just = [ left center ] 
		text_pos = PAIR(0.00000000000, 0.00000000000) 
		dims = PAIR(0.00000000000, 40.00000000000) 
	} 
	IF GotParam is_enabled_script 
		<is_enabled_script> 
		IF ( <success> = 0 ) 
			RETURN 
		ENDIF 
	ENDIF 
	focus_params = { material = <material> pass = <pass> part = <part> } 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = pos_parts_anchor 
		dims = <dims> 
		event_handlers = [ { pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_alt2 posmenu_reset_uv params = { part = <part> } } 
			{ pad_up null_script } 
			{ pad_down null_script } 
		] 
		<not_focusable> 
		z_priority = 10 
	} 
	IF GlobalExists name = EG_in_create_a_graphic type = int 
		<in_cagr> = EG_in_create_a_graphic 
	ELSE 
		<in_cagr> = 0 
	ENDIF 
	IF ( <in_cagr> = 0 ) 
		IF isNGC 
			create_helper_text generic_helper_text_color_menu_reset_ngc 
		ELSE 
			create_helper_text generic_helper_text_color_menu_reset 
		ENDIF 
	ENDIF 
	IF GotParam add_pos 
		posmenu_add_pos_item <...> 
	ENDIF 
	IF GotParam add_rot 
		posmenu_add_rotation_item <...> 
	ENDIF 
	IF GotParam add_scale 
		posmenu_add_scale_item <...> 
	ENDIF 
	wait 1 gameframe 
	posmenu_focus_all_parts <focus_params> 
ENDSCRIPT

SCRIPT posmenu_focus_all_parts 
	edit_skater_posmenu_focus <...> 
	edit_skater_scalemenu_focus <...> 
	edit_skater_rotmenu_focus <...> 
ENDSCRIPT

SCRIPT posmenu_add_pos_item 
	CreateScreenElement { 
		type = ContainerElement 
		parent = pos_parts_anchor 
		id = pos_anchor 
		pos = PAIR(15.00000000000, 15.00000000000) 
		dims = <dims> 
		z_priority = 10 
	} 
	<parent_id> = <id> 
	IF GotParam index 
		SetScreenElementProps { 
			id = <parent_id> 
			tags = { tag_grid_x = <index> } 
		} 
	ENDIF 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	Theme_GetHighlightedTextColor return_value = arrow_rgba 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = <font> 
		text = "Pos" 
		scale = 0.89999997616 
		rgba = <rgba> 
		just = <text_just> 
		pos = PAIR(-110.00000000000, 0.00000000000) 
		replace_handlers 
		<not_focusable> 
	} 
	IF isXbox 
		text = "\\b7/\\b4/\\b6/\\b5" 
		scale = 0.67000001669 
	ELSE 
		IF isNGC 
			text = "Control Stick" 
			scale = 0.67000001669 
		ELSE 
			text = "Left Analog Stick" 
			scale = 0.67000001669 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = dialog 
		text = <text> 
		scale = <scale> 
		rgba = <arrow_rgba> 
		just = [ left top ] 
		pos = PAIR(-110.00000000000, -42.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = pos_up_arrow 
		texture = up_arrow 
		rgba = <rgba> 
		scale = 1.00000000000 
		pos = PAIR(20.00000000000, -30.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = pos_down_arrow 
		texture = down_arrow 
		rgba = <rgba> 
		scale = 1.00000000000 
		pos = PAIR(20.00000000000, 30.00000000000) 
		z_priority = 5 
	} 
	IF NOT ( <add_pos> = use_uv_v_only ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent_id> 
			id = pos_left_arrow 
			texture = left_arrow 
			rgba = <rgba> 
			scale = 1.00000000000 
			pos = PAIR(-20.00000000000, 0.00000000000) 
			z_priority = 5 
		} 
	ENDIF 
	IF NOT ( <add_pos> = use_uv_v_only ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent_id> 
			id = pos_right_arrow 
			texture = right_arrow 
			rgba = <rgba> 
			scale = 1.00000000000 
			pos = PAIR(60.00000000000, 0.00000000000) 
			z_priority = 5 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT posmenu_get_uv 
	GetCurrentSkaterProfileIndex 
	GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
	IF NOT GotParam use_default_uv 
		<use_default_uv> = 1 
	ENDIF 
	IF NOT GotParam uv_u 
		<uv_u> = 0 
	ENDIF 
	IF NOT GotParam uv_v 
		<uv_v> = 0 
	ENDIF 
	IF NOT GotParam uv_scale 
		<uv_scale> = 100 
	ENDIF 
	IF NOT GotParam uv_rot 
		<uv_rot> = 0 
	ENDIF 
	IF ( <use_default_uv> = 1 ) 
		<uv_u> = 0 
		<uv_v> = 0 
		<uv_scale> = 100 
		<uv_rot> = 0 
	ENDIF 
	RETURN uv_u = <uv_u> uv_v = <uv_v> uv_scale = <uv_scale> uv_rot = <uv_rot> use_default_uv = <use_default_uv> 
ENDSCRIPT

SCRIPT swap_get_uv 
	posmenu_get_uv <...> 
	RemoveParameter part 
	RETURN structure = { <...> } 
ENDSCRIPT

SCRIPT posmenu_set_uv 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceUV player = <currentSkaterProfileIndex> part = <part> uv_u = <uv_u> uv_v = <uv_v> uv_scale = <uv_scale> uv_rot = <uv_rot> use_default_uv = 0 
ENDSCRIPT

SCRIPT posmenu_reset_uv 
	IF isNGC 
		IF NOT ControllerPressed L1 
			RETURN 
		ENDIF 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceUV player = <currentSkaterProfileIndex> part = <part> uv_u = 0 uv_v = 0 uv_scale = 100 uv_rot = 0 use_default_uv = 1 
	no_board = no_board 
	RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = <no_board> 
	IF GotParam refocus 
		FireEvent type = focus target = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT adjust_cas_texture_pos uv_increment = 10 
	IF NOT GotParam pass 
		RETURN 
	ENDIF 
	IF NOT GotParam material 
		RETURN 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	<dir_mod> = 1 
	<v_min> = -200 
	<v_max> = 200 
	<u_min> = -200 
	<u_max> = 200 
	IF ChecksumEquals a = <part> b = left_forearm_tattoo 
		<dir_mod> = 1 
		<v_min> = -500 
		<v_max> = 200 
		<u_min> = -75 
		<u_max> = 75 
	ELSE 
		IF ChecksumEquals a = <part> b = right_forearm_tattoo 
			<dir_mod> = -1 
			<v_min> = -500 
			<v_max> = 200 
			<u_min> = -75 
			<u_max> = 75 
		ELSE 
			IF ChecksumEquals a = <part> b = left_bicep_tattoo 
				<dir_mod> = 1 
				<v_min> = -200 
				<v_max> = 500 
				<u_min> = -75 
				<u_max> = 75 
			ELSE 
				IF ChecksumEquals a = <part> b = right_bicep_tattoo 
					<dir_mod> = -1 
					<v_min> = -200 
					<v_max> = 500 
					<u_min> = -75 
					<u_max> = 75 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	BEGIN 
		IF GetAnalogueInfo controller = 0 
			posmenu_get_uv part = <part> 
			<oldU> = <uv_u> 
			<oldV> = <uv_v> 
			<x_modded> = 0 
			IF ObjectExists id = pos_right_arrow 
				<leftx> = ( <leftx> * <dir_mod> ) 
				<x_modded> = 1 
				IF ( <leftx> > 0 ) 
					DoScreenElementMorph id = pos_right_arrow rgba = <on_rgba> scale = 1.10000002384 
				ELSE 
					DoScreenElementMorph id = pos_right_arrow rgba = <off_rgba> scale = 1 
				ENDIF 
			ENDIF 
			IF ObjectExists id = pos_left_arrow 
				IF NOT ( <x_modded> ) 
					<leftx> = ( <leftx> * <dir_mod> ) 
				ENDIF 
				IF ( 0 > <leftx> ) 
					DoScreenElementMorph id = pos_left_arrow rgba = <on_rgba> scale = 1.10000002384 
				ELSE 
					DoScreenElementMorph id = pos_left_arrow rgba = <off_rgba> scale = 1 
				ENDIF 
			ENDIF 
			IF ObjectExists id = pos_down_arrow 
				IF ( <lefty> > 0 ) 
					DoScreenElementMorph id = pos_down_arrow rgba = <on_rgba> scale = 1.10000002384 
				ELSE 
					DoScreenElementMorph id = pos_down_arrow rgba = <off_rgba> scale = 1 
				ENDIF 
			ENDIF 
			IF ObjectExists id = pos_up_arrow 
				IF ( 0 > <lefty> ) 
					DoScreenElementMorph id = pos_up_arrow rgba = <on_rgba> scale = 1.10000002384 
				ELSE 
					DoScreenElementMorph id = pos_up_arrow rgba = <off_rgba> scale = 1 
				ENDIF 
			ENDIF 
			temp = <lefty> 
			lefty = ( -1 * <leftx> ) 
			leftx = ( 1 * <temp> ) 
			IF ObjectExists id = pos_up_arrow 
				IF ( <leftx> > 0 ) 
					<uv_v> = ( <uv_v> + ( <leftx> * <uv_increment> ) ) 
				ENDIF 
			ENDIF 
			IF ObjectExists id = pos_down_arrow 
				IF ( 0 > <leftx> ) 
					<uv_v> = ( <uv_v> + ( <leftx> * <uv_increment> ) ) 
				ENDIF 
			ENDIF 
			IF ObjectExists id = pos_right_arrow 
				IF ( <lefty> > 0 ) 
					<uv_u> = ( <uv_u> + ( <lefty> * <uv_increment> ) ) 
				ENDIF 
			ENDIF 
			IF ObjectExists id = pos_left_arrow 
				IF ( 0 > <lefty> ) 
					<uv_u> = ( <uv_u> + ( <lefty> * <uv_increment> ) ) 
				ENDIF 
			ENDIF 
			IF ( <uv_u> < <u_min> ) 
				<uv_u> = <u_max> 
			ENDIF 
			IF ( <uv_u> > <u_max> ) 
				<uv_u> = <u_min> 
			ENDIF 
			IF ( <uv_v> < <v_min> ) 
				<uv_v> = <v_max> 
			ENDIF 
			IF ( <uv_v> > <v_max> ) 
				<uv_v> = <v_min> 
			ENDIF 
			IF NOT ( <oldU> = <uv_u> ) 
				posmenu_set_uv part = <part> <...> 
				refresh_skater_uv 
			ELSE 
				IF NOT ( <oldV> = <uv_v> ) 
					posmenu_set_uv part = <part> <...> 
					refresh_skater_uv 
				ENDIF 
			ENDIF 
		ENDIF 
		IF IsPs2 
			wait 4 gameframe 
		ELSE 
			wait 1 gameframe 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT refresh_skater_uv 
	IF IsPs2 
		no_board = no_board 
		GetCurrentSkaterProfileIndex 
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = <no_board> 
	ELSE 
		GetCurrentSkaterProfileIndex 
		RefreshSkaterUV skater = 0 profile = <currentSkaterProfileIndex> 
	ENDIF 
ENDSCRIPT

SCRIPT edit_skater_posmenu_focus 
	IF ScreenElementExists id = pos_up_arrow 
		RunScriptOnScreenElement id = pos_up_arrow adjust_cas_texture_pos params = { pass = <pass> material = <material> part = <part> } 
	ENDIF 
ENDSCRIPT

SCRIPT posmenu_add_rotation_item { pad_choose_script = null_script 
		tab = tab3 
		font = small 
		icon_scale = 0 
		icon_pos = PAIR(22.00000000000, 9.00000000000) 
		text_just = [ left center ] 
		text_pos = PAIR(0.00000000000, 0.00000000000) 
		dims = PAIR(0.00000000000, 40.00000000000) 
		anchor_id = rot_item_anchor 
	} 
	IF GotParam is_enabled_script 
		<is_enabled_script> 
		IF ( <success> = 0 ) 
			RETURN 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = pos_parts_anchor 
		id = rot_anchor 
		pos = PAIR(0.00000000000, 85.00000000000) 
		dims = <dims> 
		z_priority = 10 
	} 
	<parent_id> = <id> 
	IF GotParam index 
		SetScreenElementProps { 
			id = <parent_id> 
			tags = { tag_grid_x = <index> } 
		} 
	ENDIF 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	Theme_GetHighlightedTextColor return_value = arrow_rgba 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = <font> 
		text = "Rot" 
		scale = 0.89999997616 
		rgba = <rgba> 
		just = <text_just> 
		pos = PAIR(-95.00000000000, 0.00000000000) 
		replace_handlers 
		<not_focusable> 
	} 
	IF isXbox 
		text = "\\bj/\\bk" 
		scale = 0.67000001669 
	ELSE 
		IF isNGC 
			text = "C-Stick" 
			scale = 0.67000001669 
		ELSE 
			text = "Right Analog Stick" 
			scale = 0.67000001669 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = dialog 
		text = <text> 
		scale = <scale> 
		rgba = <arrow_rgba> 
		just = [ left top ] 
		pos = PAIR(-95.00000000000, -30.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = rot_left_arrow 
		texture = left_arrow 
		rgba = <rgba> 
		scale = 1.00000000000 
		pos = PAIR(-33.00000000000, 0.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = rot_right_arrow 
		texture = right_arrow 
		rgba = <rgba> 
		scale = 1.00000000000 
		pos = PAIR(75.00000000000, 0.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = rot_logo 
		texture = rot_bar 
		scale = PAIR(1.39999997616, 1.00000000000) 
		pos = PAIR(21.00000000000, 0.00000000000) 
		z_priority = 5 
	} 
ENDSCRIPT

SCRIPT adjust_cas_texture_rot rot_increment = 20 
	IF NOT GotParam pass 
		RETURN 
	ENDIF 
	IF NOT GotParam material 
		RETURN 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	<rot_mod> = 1 
	IF ( ( ChecksumEquals a = <part> b = right_forearm_tattoo ) | ( ChecksumEquals a = <part> b = right_bicep_tattoo ) ) 
		<rot_mod> = -1 
	ENDIF 
	BEGIN 
		IF GetAnalogueInfo controller = 0 
			posmenu_get_uv part = <part> 
			<oldRot> = <uv_rot> 
			<rot_modded> = 0 
			IF ( <rightx> > 0 ) 
				<rightx> = ( <rightx> * <rot_mod> ) 
				<rot_modded> = 1 
				DoScreenElementMorph id = rot_right_arrow rgba = <on_rgba> scale = 1.10000002384 
				<uv_rot> = ( <uv_rot> + ( <rightx> * <rot_increment> ) ) 
			ELSE 
				DoScreenElementMorph id = rot_right_arrow rgba = <off_rgba> scale = 1 
			ENDIF 
			IF ( 0 > <rightx> ) 
				IF NOT ( <rot_modded> ) 
					<rightx> = ( <rightx> * <rot_mod> ) 
				ENDIF 
				DoScreenElementMorph id = rot_left_arrow rgba = <on_rgba> scale = 1.10000002384 
				<uv_rot> = ( <uv_rot> + ( <rightx> * <rot_increment> ) ) 
			ELSE 
				DoScreenElementMorph id = rot_left_arrow rgba = <off_rgba> scale = 1 
			ENDIF 
			IF ( <uv_rot> < 0 ) 
				<uv_rot> = ( <uv_rot> + 360 ) 
			ENDIF 
			IF ( <uv_rot> > 360 ) 
				<uv_rot> = ( <uv_rot> - 360 ) 
			ENDIF 
			IF NOT ( <oldRot> = <uv_rot> ) 
				posmenu_set_uv part = <part> <...> 
				refresh_skater_uv 
			ENDIF 
		ENDIF 
		IF IsPs2 
			wait 4 gameframe 
		ELSE 
			wait 1 gameframe 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT edit_skater_rotmenu_focus 
	IF ScreenElementExists id = rot_left_arrow 
		RunScriptOnScreenElement id = rot_left_arrow adjust_cas_texture_rot params = { pass = <pass> material = <material> part = <part> } 
	ENDIF 
ENDSCRIPT

SCRIPT posmenu_add_scale_item { pad_choose_script = null_script 
		tab = tab3 
		font = small 
		icon_scale = 0 
		icon_pos = PAIR(22.00000000000, 9.00000000000) 
		text_just = [ left center ] 
		text_pos = PAIR(0.00000000000, 0.00000000000) 
		dims = PAIR(0.00000000000, 40.00000000000) 
		anchor_id = scale_item_anchor 
	} 
	IF GotParam is_enabled_script 
		<is_enabled_script> 
		IF ( <success> = 0 ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF NOT GotParam add_rot 
		pos = PAIR(0.00000000000, 90.00000000000) 
	ELSE 
		pos = PAIR(0.00000000000, 115.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = pos_parts_anchor 
		id = scale_anchor 
		pos = <pos> 
		dims = <dims> 
		z_priority = 10 
	} 
	<parent_id> = <id> 
	IF GotParam index 
		SetScreenElementProps { 
			id = <parent_id> 
			tags = { tag_grid_x = <index> } 
		} 
	ENDIF 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	Theme_GetHighlightedTextColor return_value = arrow_rgba 
	IF NOT GotParam add_rot 
		IF isXbox 
			text = "\\bj/\\bk" 
			scale = 0.67000001669 
		ELSE 
			IF isNGC 
				text = "C-Stick" 
				scale = 0.67000001669 
			ELSE 
				text = "Right Analog Stick" 
				scale = 0.67000001669 
			ENDIF 
		ENDIF 
		CreateScreenElement { 
			type = TextElement 
			parent = <parent_id> 
			font = dialog 
			text = <text> 
			scale = <scale> 
			rgba = <arrow_rgba> 
			just = [ left top ] 
			pos = PAIR(-95.00000000000, -30.00000000000) 
		} 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = <font> 
		text = "Scale" 
		scale = 0.89999997616 
		rgba = <rgba> 
		just = <text_just> 
		pos = PAIR(-95.00000000000, 0.00000000000) 
		replace_handlers 
		<not_focusable> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = scale_down_arrow 
		texture = down_arrow 
		rgba = <rgba> 
		scale = 1.00000000000 
		pos = PAIR(-30.00000000000, 0.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = scale_up_arrow 
		texture = up_arrow 
		rgba = <rgba> 
		scale = 1.00000000000 
		pos = PAIR(80.00000000000, 0.00000000000) 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		id = scale_logo 
		texture = scale_bar 
		scale = PAIR(1.39999997616, 1.00000000000) 
		pos = PAIR(21.00000000000, 0.00000000000) 
		z_priority = 5 
	} 
ENDSCRIPT

SCRIPT adjust_cas_texture_scale scale_increment = 10 
	IF NOT GotParam pass 
		RETURN 
	ENDIF 
	IF NOT GotParam material 
		RETURN 
	ENDIF 
	IF StructureContains structure = ( <part> [ 0 ] ) scale_min 
		scale_min = ( ( <part> [ 0 ] ) . scale_min ) 
	ELSE 
		scale_min = 200 
	ENDIF 
	IF StructureContains structure = ( <part> [ 0 ] ) scale_max 
		scale_max = ( ( <part> [ 0 ] ) . scale_max ) 
	ELSE 
		scale_max = 50 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	BEGIN 
		IF GetAnalogueInfo controller = 0 
			posmenu_get_uv part = <part> 
			<oldScale> = <uv_scale> 
			IF ( <righty> > 0 ) 
				DoScreenElementMorph id = scale_down_arrow rgba = <on_rgba> scale = 1.10000002384 
				<uv_scale> = ( <uv_scale> + ( <righty> * <scale_increment> ) ) 
			ELSE 
				DoScreenElementMorph id = scale_down_arrow rgba = <off_rgba> scale = 1 
			ENDIF 
			IF ( 0 > <righty> ) 
				DoScreenElementMorph id = scale_up_arrow rgba = <on_rgba> scale = 1.10000002384 
				<uv_scale> = ( <uv_scale> + ( <righty> * <scale_increment> ) ) 
			ELSE 
				DoScreenElementMorph id = scale_up_arrow rgba = <off_rgba> scale = 1 
			ENDIF 
			IF ( <uv_scale> < <scale_max> ) 
				<uv_scale> = <scale_max> 
			ENDIF 
			IF ( <uv_scale> > <scale_min> ) 
				<uv_scale> = <scale_min> 
			ENDIF 
			IF NOT ( <oldScale> = <uv_scale> ) 
				posmenu_set_uv part = <part> <...> 
				refresh_skater_uv 
			ENDIF 
		ENDIF 
		IF IsPs2 
			wait 4 gameframe 
		ELSE 
			wait 1 gameframe 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT edit_skater_scalemenu_focus 
	IF ScreenElementExists id = scale_up_arrow 
		RunScriptOnScreenElement id = scale_up_arrow adjust_cas_texture_scale params = { pass = <pass> material = <material> part = <part> } 
	ENDIF 
ENDSCRIPT


