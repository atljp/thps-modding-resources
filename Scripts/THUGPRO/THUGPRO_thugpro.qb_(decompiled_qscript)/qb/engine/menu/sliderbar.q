
thugpro_colormenu_hue_increment = 1.00000000000 
thugpro_colormenu_hue_min = 0.00000000000 
thugpro_colormenu_hue_max = 360.00000000000 
thugpro_colormenu_saturation_increment = 1.00000000000 
thugpro_colormenu_saturation_min = 0.00000000000 
thugpro_colormenu_saturation_max = 100.00000000000 
thugpro_colormenu_value_increment = 1.00000000000 
thugpro_colormenu_value_min = 0.00000000000 
thugpro_colormenu_value_max = 100.00000000000 
SCRIPT thugpro_menu_slider_rescale_to_bar 
	<target1> = ( ( <value> - <min> ) / ( <max> - <min> ) ) 
	<target2> = ( <right> - <left> ) 
	<target3> = ( <target1> * <target2> ) 
	<rescaled_value> = ( <target3> + <left> ) 
	RETURN x_val = <rescaled_value> 
ENDSCRIPT

SCRIPT thugpro_menu_slider_item_update 
	thugpro_menu_slider_rescale_to_bar { 
		min = <min> 
		max = <max> 
		value = <value> 
		left = 147 
		right = 289 
	} 
	SetScreenElementProps { 
		id = { <id> child = slider_pos_line } 
		pos = ( ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) + PAIR(0.00000000000, -0.40000000596) ) 
	} 
	IF GotParam integer 
		CastToInteger value 
	ENDIF 
	FormatText TextName = text_value "%a" a = <value> 
	thugpro_menu_item_update_extra_text id = <id> text = <text_value> 
ENDSCRIPT

SCRIPT thugpro_menu_slider_item_focus_script 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = slider_pos_line } 
		alpha = 1.00000000000 
		time = 0.10000000149 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_slider_item_unfocus_script 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = slider_pos_line } 
		alpha = 0.00000000000 
		time = 0.00000000000 
	} 
ENDSCRIPT

SCRIPT make_thugpro_menu_slider_item { 
		parent_id = current_menu 
		child_texture = colorbar 
		focus_script = thugpro_menu_slider_item_focus_script 
		unfocus_script = thugpro_menu_slider_item_unfocus_script 
	} 
	IF <parent_id> : GetSingleTag wide_extra_text 
		printf "Got wide_extra_text style from parent menu!" 
	ENDIF 
	IF GotParam wide_extra_text 
		child_texture_offset = PAIR(58.00000000000, 10.00000000000) 
		child_texture_scale = PAIR(4.50000000000, 2.20000004768) 
	ELSE 
		child_texture_offset = PAIR(78.00000000000, 10.00000000000) 
		child_texture_scale = PAIR(3.29999995232, 2.20000004768) 
	ENDIF 
	make_thugpro_menu_item <...> 
	IF NOT GotParam menu_item_id 
		printf "ERROR: no <menu_item_id> returned???" 
		RETURN 
	ENDIF 
	GetStackedScreenElementPos X id = { <menu_item_id> child = left_arrow } offset = PAIR(5.00000000000, 5.00000000000) 
	<left_arrow_x> = ( <pos> . PAIR(1.00000000000, 0.00000000000) ) 
	GetStackedScreenElementPos X id = { <menu_item_id> child = right_arrow } offset = PAIR(-11.00000000000, 5.00000000000) 
	<right_arrow_x> = ( <pos> . PAIR(1.00000000000, 0.00000000000) ) 
	<center_arrow_x> = ( <left_arrow_x> + ( ( <right_arrow_x> - <left_arrow_x> ) / 2 ) ) 
	<center_arrow_pos> = ( ( PAIR(1.00000000000, 0.00000000000) * <center_arrow_x> ) + ( PAIR(0.00000000000, 1.00000000000) * ( <pos> . PAIR(0.00000000000, 1.00000000000) ) ) ) 
	CreateScreenElement { 
		type = SpriteElement 
		local_id = slider_pos_line 
		parent = <menu_item_id> 
		just = [ center , center ] 
		alpha = 0.00000000000 
		texture = white 
		pos = <center_arrow_pos> 
		scale = PAIR(0.10000000149, 4.40000009537) 
		z_priority = 1005 
	} 
ENDSCRIPT

SCRIPT thugpro_face_color_menu_add_options_to_menu 
	make_thugpro_menu_slider_item { 
		id = hue_anchor 
		text = "Color" 
		extra_text = "0" 
		child_texture = bw_slider 
		child_texture_rgba = [ 200 100 100 118 ] 
		option_arrows_callback = __thugpro_face_color_menu_change_component 
		option_arrows_callback_params = { component = hue } 
		option_arrows 
	} 
	make_thugpro_menu_slider_item { 
		id = value_anchor 
		text = "Value" 
		extra_text = "0" 
		child_texture = bw_slider 
		option_arrows_callback = __thugpro_face_color_menu_change_component 
		option_arrows_callback_params = { component = val } 
		option_arrows 
	} 
	make_thugpro_menu_slider_item { 
		id = saturation_anchor 
		text = "Saturation" 
		extra_text = "0" 
		child_texture = bw_slider 
		option_arrows_callback = __thugpro_face_color_menu_change_component 
		option_arrows_callback_params = { component = sat } 
		option_arrows 
	} 
	make_thugpro_menu_item { text = "" not_focusable } 
	make_thugpro_menu_item { 
		text = "Reset to default" 
		pad_choose_script = __thugpro_face_color_menu_reset_to_default 
	} 
ENDSCRIPT

SCRIPT __thugpro_face_color_menu_change_component 
	hue_anchor : GetSingleTag value 
	<current_hue> = <value> 
	saturation_anchor : GetSingleTag value 
	<current_sat> = <value> 
	value_anchor : GetSingleTag value 
	<current_val> = <value> 
	SWITCH <component> 
		CASE hue 
			IF GotParam right 
				<current_hue> = ( <current_hue> + 4.00000000000 ) 
				IF ( <current_hue> > 359 ) 
					<current_hue> = ( <current_hue> - 360.00000000000 ) 
				ENDIF 
			ELSE 
				<current_hue> = ( <current_hue> - 4.00000000000 ) 
				IF ( <current_hue> < 0 ) 
					<current_hue> = ( <current_hue> + 360.00000000000 ) 
				ENDIF 
			ENDIF 
			hue_anchor : SetTags value = <current_hue> 
		CASE sat 
			IF GotParam right 
				<current_sat> = ( <current_sat> + 0.00999999978 ) 
				IF ( <current_sat> > 2.00000000000 ) 
					<current_sat> = ( <current_sat> - 2.00000000000 ) 
				ENDIF 
			ELSE 
				<current_sat> = ( <current_sat> - 0.00999999978 ) 
				IF ( <current_sat> < 0 ) 
					<current_sat> = ( <current_sat> + 2.00000000000 ) 
				ENDIF 
			ENDIF 
			saturation_anchor : SetTags value = <current_sat> 
		CASE val 
			IF GotParam right 
				<current_val> = ( <current_val> + 0.00999999978 ) 
				IF ( <current_val> > 2.00000000000 ) 
					<current_val> = ( <current_val> - 2.00000000000 ) 
				ENDIF 
			ELSE 
				<current_val> = ( <current_val> - 0.00999999978 ) 
				IF ( <current_val> < 0 ) 
					<current_val> = ( <current_val> + 2.00000000000 ) 
				ENDIF 
			ENDIF 
			value_anchor : SetTags value = <current_val> 
	ENDSWITCH 
	__thugpro_face_color_menu_refresh_component <...> 
	IF ( <current_hue> < 181.00000000000 ) 
		<current_hue> = ( 350.00000000000 + ( <current_hue> / 18.00000000000 ) ) 
	ELSE 
		<current_hue> = ( ( <current_hue> - 180.00000000000 ) / 18.00000000000 ) 
	ENDIF 
	AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val> 
ENDSCRIPT

SCRIPT __thugpro_face_color_menu_reset_to_default 
	get_default_face_texture_name 
	AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val> 
	IF ( <hue> < 181.00000000000 ) 
		<hue> = ( 180.00000000000 + ( <hue> * 18.00000000000 ) ) 
	ELSE 
		<hue> = ( ( <hue> -350 ) * 18.00000000000 ) 
	ENDIF 
	hue_anchor : SetTags value = <hue> 
	saturation_anchor : SetTags value = <sat> 
	value_anchor : SetTags value = <val> 
	__thugpro_face_color_menu_refresh <...> 
ENDSCRIPT

SCRIPT __thugpro_face_color_menu_refresh 
	RunScriptOnScreenElement { 
		id = hue_anchor 
		__thugpro_face_color_menu_refresh_component 
		params = { current_hue = <hue> component = hue } 
	} 
	RunScriptOnScreenElement { 
		id = value_anchor 
		__thugpro_face_color_menu_refresh_component 
		params = { current_val = <val> component = val } 
	} 
	RunScriptOnScreenElement { 
		id = saturation_anchor 
		__thugpro_face_color_menu_refresh_component 
		params = { current_sat = <sat> component = sat } 
	} 
ENDSCRIPT

SCRIPT __thugpro_face_color_menu_refresh_component 
	IF NOT GotParam id 
		GetTags 
	ENDIF 
	SWITCH <component> 
		CASE hue 
			value = <current_hue> 
			min = 0.00000000000 
			max = 360.00000000000 
		CASE sat 
			value = <current_sat> 
			min = 0.00000000000 
			max = 2.00000000000 
		CASE val 
			value = <current_val> 
			min = 0.00000000000 
			max = 2.00000000000 
	ENDSWITCH 
	thugpro_menu_slider_item_update { 
		id = <id> 
		value = <value> 
		min = <min> 
		max = <max> 
	} 
ENDSCRIPT

SCRIPT __thugpro_color_menu_change_component 
	GetTags 
	colormenu_get_hsv part = <part> 
	IF GotParam right 
		SWITCH <component> 
			CASE h 
				<h> = ( <h> + thugpro_colormenu_hue_increment ) 
				IF ( <h> > ( thugpro_colormenu_hue_max - 1 ) ) 
					<h> = ( <h> - thugpro_colormenu_hue_max ) 
				ENDIF 
			CASE s 
				<s> = ( <s> + thugpro_colormenu_saturation_increment ) 
				IF ( <s> > thugpro_colormenu_saturation_max ) 
					<s> = thugpro_colormenu_saturation_max 
				ENDIF 
			CASE v 
				<v> = ( <v> + thugpro_colormenu_value_increment ) 
				IF ( <v> > thugpro_colormenu_value_max ) 
					<v> = thugpro_colormenu_value_max 
				ENDIF 
		ENDSWITCH 
	ELSE 
		SWITCH <component> 
			CASE h 
				<h> = ( <h> - thugpro_colormenu_hue_increment ) 
				IF ( <h> < 0 ) 
					<h> = ( <h> + thugpro_colormenu_hue_max ) 
				ENDIF 
			CASE s 
				<s> = ( <s> - thugpro_colormenu_saturation_increment ) 
				IF ( <s> < thugpro_colormenu_saturation_min ) 
					<s> = thugpro_colormenu_saturation_min 
				ENDIF 
			CASE v 
				<v> = ( <v> - thugpro_colormenu_hue_increment ) 
				IF ( <v> < thugpro_colormenu_hue_min ) 
					<v> = thugpro_colormenu_hue_min 
				ENDIF 
		ENDSWITCH 
	ENDIF 
	colormenu_set_hsv part = <part> h = <h> s = <s> v = <v> 
	colormenu_refresh_skaters 
	__thugpro_color_menu_refresh_component <...> 
ENDSCRIPT

SCRIPT __thugpro_color_menu_reset_to_default 
	GetCurrentSkaterProfileIndex 
	GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
	colormenu_get_default_color part = <part> desc_id = <desc_id> 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = 1 
	__thugpro_color_menu_refresh part = <part> 
	colormenu_refresh_skaters 
ENDSCRIPT

SCRIPT __thugpro_color_menu_refresh 
	RunScriptOnScreenElement { 
		id = menu_id_color 
		__thugpro_color_menu_refresh_component 
		params = { component = h part = <part> from_menu_refresh } 
	} 
	RunScriptOnScreenElement { 
		id = menu_id_value 
		__thugpro_color_menu_refresh_component 
		params = { component = v part = <part> from_menu_refresh } 
	} 
	RunScriptOnScreenElement { 
		id = menu_id_saturation 
		__thugpro_color_menu_refresh_component 
		params = { component = s part = <part> from_menu_refresh } 
	} 
ENDSCRIPT

SCRIPT thugpro_color_menu_add_options_to_menu 
	make_thugpro_menu_slider_item { 
		id = menu_id_color 
		text = "Color" 
		extra_text = "0" 
		child_texture = colorbar 
		option_arrows_callback = __thugpro_color_menu_change_component 
		option_arrows_callback_params = { part = <part> component = h } 
		option_arrows 
	} 
	make_thugpro_menu_slider_item { 
		id = menu_id_value 
		text = "Value" 
		extra_text = "0" 
		child_texture = bw_slider 
		option_arrows_callback = __thugpro_color_menu_change_component 
		option_arrows_callback_params = { part = <part> component = v } 
		option_arrows 
	} 
	make_thugpro_menu_slider_item { 
		id = menu_id_saturation 
		text = "Saturation" 
		extra_text = "0" 
		child_texture = bw_slider 
		option_arrows_callback = __thugpro_color_menu_change_component 
		option_arrows_callback_params = { part = <part> component = s } 
		option_arrows 
	} 
	make_thugpro_menu_item { text = "" not_focusable } 
	make_thugpro_menu_item { 
		text = "Reset to default" 
		pad_choose_script = __thugpro_color_menu_reset_to_default 
		pad_choose_params = { part = <part> } 
	} 
ENDSCRIPT

SCRIPT __thugpro_color_menu_refresh_preview_element 
ENDSCRIPT

SCRIPT __thugpro_scaling_menu_change_uniform 
	GetTags 
	scalingmenu_get_xyz part = <part> 
	scalingmenu_get_limits part = <part> <...> 
	IF GotParam affectX 
		IF GotParam right 
			IF ( <affectX> = 1 ) 
				<X> = ( <X> + scalingmenu_scale_increment ) 
				IF ( <X> > <max> ) 
					<X> = <max> 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( <affectX> = 1 ) 
				<X> = ( <X> - scalingmenu_scale_increment ) 
				IF ( <X> < <min> ) 
					<X> = <min> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam affectY 
		IF GotParam right 
			IF ( <affectY> = 1 ) 
				<y> = ( <y> + scalingmenu_scale_increment ) 
				IF ( <y> > <max> ) 
					<y> = <max> 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( <affectY> = 1 ) 
				<y> = ( <y> - scalingmenu_scale_increment ) 
				IF ( <y> < <min> ) 
					<y> = <min> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam affectZ 
		IF GotParam right 
			IF ( <affectZ> = 1 ) 
				<z> = ( <z> + scalingmenu_scale_increment ) 
				IF ( <z> > <max> ) 
					<z> = <max> 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( <affectZ> = 1 ) 
				<z> = ( <z> - scalingmenu_scale_increment ) 
				IF ( <z> < <min> ) 
					<z> = <min> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	scalingmenu_set_xyz part = <part> X = <X> y = <y> z = <z> 
	scalingmenu_refresh_skaters 
	__thugpro_scaling_menu_refresh part = <part> 
ENDSCRIPT

SCRIPT __thugpro_scaling_menu_reset_to_default { 
		X = 100 
		y = 100 
		z = 100 
		use_default_scale = 1 
	} 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceScale player = <currentSkaterProfileIndex> part = <part> X = <X> y = <y> z = <z> use_default_scale = <use_default_scale> 
	__thugpro_scaling_menu_refresh part = <part> 
	scalingmenu_refresh_skaters 
ENDSCRIPT

SCRIPT __thugpro_scaling_menu_refresh 
	IF ScreenElementExists id = scalingmenu_x_slider 
		RunScriptOnScreenElement { 
			id = scalingmenu_x_slider 
			__thugpro_scaling_menu_refresh_uniform 
			params = { affectX = 1 part = <part> from_menu_refresh } 
		} 
	ENDIF 
	IF ChecksumEquals a = <part> b = object_scaling 
		IF ScreenElementExists id = scalingmenu_y_slider 
			RunScriptOnScreenElement { 
				id = scalingmenu_y_slider 
				__thugpro_scaling_menu_refresh_uniform 
				params = { affectY = 1 part = <part> from_menu_refresh } 
			} 
		ENDIF 
		IF ScreenElementExists id = scalingmenu_z_slider 
			RunScriptOnScreenElement { 
				id = scalingmenu_z_slider 
				__thugpro_scaling_menu_refresh_uniform 
				params = { affectZ = 1 part = <part> from_menu_refresh } 
			} 
		ENDIF 
	ELSE 
		IF ScreenElementExists id = scalingmenu_y_slider 
			RunScriptOnScreenElement { 
				id = scalingmenu_y_slider 
				__thugpro_scaling_menu_refresh_uniform 
				params = { affectZ = 1 part = <part> from_menu_refresh } 
			} 
		ENDIF 
		IF ScreenElementExists id = scalingmenu_z_slider 
			RunScriptOnScreenElement { 
				id = scalingmenu_z_slider 
				__thugpro_scaling_menu_refresh_uniform 
				params = { affectY = 1 part = <part> from_menu_refresh } 
			} 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = scalingmenu_xy_slider 
		RunScriptOnScreenElement { 
			id = scalingmenu_xy_slider 
			__thugpro_scaling_menu_refresh_uniform 
			params = { affectXY = 1 part = <part> from_menu_refresh } 
		} 
	ENDIF 
	IF ScreenElementExists id = scalingmenu_xyz_slider 
		RunScriptOnScreenElement { 
			id = scalingmenu_xyz_slider 
			__thugpro_scaling_menu_refresh_uniform 
			params = { affectXYZ = 1 part = <part> from_menu_refresh } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT __thugpro_scaling_menu_refresh_uniform 
	IF NOT GotParam id 
		GetTags 
	ENDIF 
	IF GotParam from_menu_refresh 
		scalingmenu_get_xyz part = <part> 
	ENDIF 
	scalingmenu_get_limits part = <part> <...> 
	<value> = 0 
	IF GotParam affectX 
		IF ( <affectX> = 1 ) 
			<value> = <X> 
		ENDIF 
	ENDIF 
	IF GotParam affectY 
		IF ( <affectY> = 1 ) 
			<value> = <y> 
		ENDIF 
	ENDIF 
	IF GotParam affectZ 
		IF ( <affectZ> = 1 ) 
			<value> = <z> 
		ENDIF 
	ENDIF 
	IF GotParam affectXY 
		IF ( <affectXY> = 1 ) 
			<value> = ( ( <X> + <y> ) / 2 ) 
		ENDIF 
	ENDIF 
	IF GotParam affectXYZ 
		IF ( <affectXYZ> = 1 ) 
			<value> = ( ( <X> + <y> + <z> ) / 3 ) 
		ENDIF 
	ENDIF 
	thugpro_menu_slider_item_update { 
		id = <id> 
		value = <value> 
		min = <min> 
		max = <max> 
		integer 
	} 
ENDSCRIPT

SCRIPT thugpro_scaling_menu_add_options_to_menu 
	IF GotParam affectX 
		make_thugpro_menu_slider_item { 
			id = scalingmenu_x_slider 
			text = "X" 
			extra_text = "0" 
			child_texture = bw_slider 
			option_arrows_callback = __thugpro_scaling_menu_change_uniform 
			option_arrows_callback_params = { 
				part = <part> 
				min = <min> 
				max = <max> 
				affectX = 1 
			} 
			option_arrows 
		} 
	ENDIF 
	IF ChecksumEquals a = <part> b = object_scaling 
		IF GotParam affectY 
			make_thugpro_menu_slider_item { 
				id = scalingmenu_y_slider 
				text = "Y" 
				extra_text = "0" 
				child_texture = bw_slider 
				option_arrows_callback = __thugpro_scaling_menu_change_uniform 
				option_arrows_callback_params = { 
					part = <part> 
					min = <min> 
					max = <max> 
					affectY = 1 
				} 
				option_arrows 
			} 
		ENDIF 
		IF GotParam affectZ 
			make_thugpro_menu_slider_item { 
				id = scalingmenu_z_slider 
				text = "Z" 
				extra_text = "0" 
				child_texture = bw_slider 
				option_arrows_callback = __thugpro_scaling_menu_change_uniform 
				option_arrows_callback_params = { 
					part = <part> 
					min = <min> 
					max = <max> 
					affectZ = 1 
				} 
				option_arrows 
			} 
		ENDIF 
	ELSE 
		IF GotParam affectY 
			make_thugpro_menu_slider_item { 
				id = scalingmenu_y_slider 
				text = "Y" 
				extra_text = "0" 
				child_texture = bw_slider 
				option_arrows_callback = __thugpro_scaling_menu_change_uniform 
				option_arrows_callback_params = { 
					part = <part> 
					min = <min> 
					max = <max> 
					affectZ = 1 
				} 
				option_arrows 
			} 
		ENDIF 
		IF GotParam affectZ 
			make_thugpro_menu_slider_item { 
				id = scalingmenu_z_slider 
				text = "Z" 
				extra_text = "0" 
				child_texture = bw_slider 
				option_arrows_callback = __thugpro_scaling_menu_change_uniform 
				option_arrows_callback_params = { 
					part = <part> 
					min = <min> 
					max = <max> 
					affectY = 1 
				} 
				option_arrows 
			} 
		ENDIF 
	ENDIF 
	IF GotParam affectXY 
		make_thugpro_menu_slider_item { 
			id = scalingmenu_xy_slider 
			text = "XY" 
			extra_text = "0" 
			child_texture = bw_slider 
			option_arrows_callback = __thugpro_scaling_menu_change_uniform 
			option_arrows_callback_params = { 
				part = <part> 
				min = <min> 
				max = <max> 
				affectX = 1 
				affectY = 1 
			} 
			option_arrows 
		} 
	ENDIF 
	IF GotParam affectXYZ 
		make_thugpro_menu_slider_item { 
			id = scalingmenu_xyz_slider 
			text = "XYZ" 
			extra_text = "0" 
			child_texture = bw_slider 
			option_arrows_callback = __thugpro_scaling_menu_change_uniform 
			option_arrows_callback_params = { 
				part = <part> 
				min = <min> 
				max = <max> 
				affectX = 1 
				affectY = 1 
				affectZ = 1 
			} 
			option_arrows 
		} 
	ENDIF 
	make_thugpro_menu_item { text = "" not_focusable } 
	make_thugpro_menu_item { 
		text = "Reset to default" 
		pad_choose_script = __thugpro_scaling_menu_reset_to_default 
		pad_choose_params = { part = <part> } 
	} 
ENDSCRIPT

SCRIPT __thugpro_color_menu_refresh_component 
	IF NOT GotParam id 
		GetTags 
	ENDIF 
	IF GotParam from_menu_refresh 
		colormenu_get_hsv part = <part> 
	ENDIF 
	SWITCH <component> 
		CASE h 
			value = <h> 
			min = thugpro_colormenu_hue_min 
			max = thugpro_colormenu_hue_max 
		CASE s 
			value = <s> 
			min = thugpro_colormenu_saturation_min 
			max = thugpro_colormenu_saturation_max 
		CASE v 
			value = <v> 
			min = thugpro_colormenu_value_min 
			max = thugpro_colormenu_value_max 
	ENDSWITCH 
	thugpro_menu_slider_item_update { 
		id = <id> 
		value = <value> 
		min = <min> 
		max = <max> 
		integer 
	} 
	__thugpro_color_menu_refresh_preview_element part = <part> 
ENDSCRIPT


