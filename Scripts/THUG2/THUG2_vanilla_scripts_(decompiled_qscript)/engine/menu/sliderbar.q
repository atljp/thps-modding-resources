SCRIPT sliderbar_rescale_to_bar 
	<target1> = ( ( <value> - <min> ) / ( <max> - <min> ) ) 
	<target2> = ( <right> - <left> ) 
	<target3> = ( <target1> * <target2> ) 
	<rescaled_value> = ( <target3> + <left> ) 
	RETURN x_val = <rescaled_value> 
ENDSCRIPT

SCRIPT sliderbar_add_item { 
		tab = tab1 
		font = small 
		icon_rgba = [ 127 102 0 128 ] 
		icon_scale = 0 
		icon_pos = PAIR(22.00000000000, 9.00000000000) 
		text_just = [ center center ] 
		text_pos = PAIR(0.00000000000, 0.00000000000) 
		arrow_pos_up = PAIR(0.00000000000, 8.00000000000) 
		arrow_pos_down = PAIR(0.00000000000, -8.00000000000) 
		arrow_rgba = [ 128 128 128 128 ] 
		up_arrow_texture = up_arrow 
		down_arrow_texture = down_arrow 
		dims = PAIR(0.00000000000, 20.00000000000) 
	} 
	IF GotParam is_enabled_script 
		<is_enabled_script> 
		IF ( <success> = 0 ) 
			RETURN 
		ENDIF 
	ENDIF 
	SWITCH <tab> 
		CASE tab1 
			<bar_scale> = PAIR(0.92000001669, 1.20000004768) 
		CASE tab2 
			<bar_scale> = PAIR(0.85000002384, 1.20000004768) 
		CASE tab3 
			<bar_scale> = PAIR(0.77999997139, 1.20000004768) 
			<font> = dialog 
	ENDSWITCH 
	SetScreenElementLock id = current_menu off 
	IF NOT GotParam pad_choose_params 
		<pad_choose_params> = <...> 
	ENDIF 
	IF GotParam index 
		IF GotParam pad_choose_params 
			<pad_choose_params> = ( <pad_choose_params> + { parent_index = <index> } ) 
		ELSE 
			<pad_choose_params> = { parent_index = <index> } 
		ENDIF 
	ENDIF 
	IF GlobalExists name = EG_in_create_a_graphic type = int 
		<in_cagr> = EG_in_create_a_graphic 
	ELSE 
		<in_cagr> = 0 
	ENDIF 
	IF ( <in_cagr> = 1 ) 
		<z_priority> = 2 
	ELSE 
		<z_priority> = 300 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = <anchor_id> 
		dims = <dims> 
		event_handlers = [ { focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
		] 
		<not_focusable> 
		z_priority = <z_priority> 
	} 
	<parent_id> = <id> 
	IF GotParam index 
		SetScreenElementProps { 
			id = <parent_id> 
			tags = { tag_grid_x = <index> } 
		} 
	ENDIF 
	IF GotParam not_focusable 
		<rgba> = [ 60 60 60 85 ] 
	ELSE 
		Theme_GetUnhighlightedTextColor return_value = rgba 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = small 
		text = <text> 
		scale = PAIR(1.20000004768, 0.80000001192) 
		rgba = [ 128 , 128 , 128 , 128 ] 
		just = <text_just> 
		pos = <text_pos> 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
		replace_handlers 
		<not_focusable> 
	} 
	highlight_angle = 0 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		texture = DE_highlight_bar 
		pos = PAIR(-25.00000000000, -7.00000000000) 
		rgba = [ 0 0 0 0 ] 
		just = [ center center ] 
		scale = PAIR(1.89999997616, 0.69999998808) 
		z_priority = ( 3 -1 ) 
		rot_angle = <highlight_angle> 
	} 
	IF ( <in_cagr> = 0 ) 
		<pos> = PAIR(-9.00000000000, 0.00000000000) 
	ELSE 
		<pos> = PAIR(-3.00000000000, 21.00000000000) 
	ENDIF 
	IF GotParam bar_pos 
		<pos> = <bar_pos> 
	ENDIF 
	Theme_GetPauseBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		z_priority = 1 
		pos = <pos> 
		scale = PAIR(6.00000000000, 0.85000002384) 
		texture = roundbar_middle 
		rgba = <bar_rgba> 
	} 
	DoScreenElementMorph id = <id> alpha = 0 time = 0 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <anchor_id> 
		just = [ center bottom ] 
		dims = { 200 , 200 } 
		pos = <arrow_pos_down> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		id = <down_arrow_id> 
		texture = <down_arrow_texture> 
		rgba = <arrow_rgba> 
		scale = 0.00000000000 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <anchor_id> 
		just = [ center top ] 
		dims = { 200 , 200 } 
		pos = <arrow_pos_up> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		id = <up_arrow_id> 
		texture = <up_arrow_texture> 
		rgba = <arrow_rgba> 
		scale = 0.00000000000 
	} 
	IF GotParam child_texture 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <parent_id> 
			texture = <child_texture> 
			pos = <icon_pos> 
			rgba = <icon_rgba> 
			scale = <icon_scale> 
			id = <icon_id> 
		} 
	ENDIF 
	SetScreenElementLock id = current_menu on 
ENDSCRIPT

SCRIPT sliderbar_add_text_item 
	SetScreenElementLock id = current_menu off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		event_handlers = [ { focus sliderbar_focus_text_item } 
			{ unfocus sliderbar_unfocus_text_item } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
		] 
		dims = PAIR(0.00000000000, 20.00000000000) 
	} 
	<parent_id> = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_id> 
		font = small 
		text = <text> 
		scale = PAIR(1.20000004768, 0.80000001192) 
		rgba = [ 128 , 128 , 128 , 128 ] 
		just = [ center top ] 
		pos = PAIR(-8.00000000000, -8.00000000000) 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	Theme_GetPauseBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent_id> 
		z_priority = 1 
		scale = PAIR(6.00000000000, 0.85000002384) 
		pos = PAIR(-9.00000000000, 0.00000000000) 
		texture = roundbar_middle 
		rgba = <bar_rgba> 
	} 
	DoScreenElementMorph id = <id> alpha = 0 time = 0 
	SetScreenElementLock id = current_menu on 
ENDSCRIPT

SCRIPT sliderbar_focus_text_item 
	GetSingleTag id 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_rgba = [ 0 , 0 , 0 , 0 ] 
	} 
	DoScreenElementMorph id = { <id> child = 1 } alpha = 1 time = 0 
ENDSCRIPT

SCRIPT sliderbar_unfocus_text_item 
	GetSingleTag id 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 128 , 128 , 128 , 128 ] 
		shadow_rgba = UI_text_shadow_color 
	} 
	DoScreenElementMorph id = { <id> child = 1 } alpha = 0 time = 0 
ENDSCRIPT


