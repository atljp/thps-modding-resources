
SCRIPT make_new_roundbar_menu { menu_id = main_menu_anchor 
		vmenu_id = main_menu 
		pad_back_script = nullscript 
		pos = PAIR(130.00000000000, 100.00000000000) 
		dims = PAIR(350.00000000000, 480.00000000000) 
		parent = root_window 
		internal_text_just = left 
		internal_text_offset = PAIR(0.00000000000, 0.00000000000) 
		spacing = 6 
		helper_text = generic_helper_text 
		arrow_up = arrow_up 
		arrow_down = arrow_down 
		arrow_rgba = [ 128 128 128 128 ] 
		pad_back_sound = generic_pause_exit_sound 
	} 
	SetScreenElementLock id = <parent> off 
	IF NOT GotParam keep_current 
		generic_animate_out_last_menu 
		IF ObjectExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <menu_id> 
		just = [ top left ] 
		focusable_child = <vmenu_id> 
	} 
	AssignAlias id = <menu_id> alias = current_menu_anchor 
	IF GotParam title 
		build_theme_sub_title title = <title> add_tab = <add_tab> add_bar = <add_bar> 
	ENDIF 
	IF NOT GotParam no_helper_text 
		create_helper_text <helper_text> 
	ENDIF 
	IF GotParam scrolling 
		<arrow_pos> = ( <pos> + ( ( ( <dims> . PAIR(1.00000000000, 0.00000000000) ) / 2 ) * PAIR(1.00000000000, 0.00000000000) ) + PAIR(-14.00000000000, -6.00000000000) ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = current_menu_anchor 
			id = <arrow_up> 
			texture = up_arrow 
			pos = <arrow_pos> 
			just = [ left top ] 
			z_priority = 5 
			scale = 1 
			rgba = <arrow_rgba> 
		} 
		<scroll_menu_pos> = ( <pos> + PAIR(0.00000000000, 10.00000000000) ) 
		<scroll_menu_dims> = ( <dims> + PAIR(0.00000000000, -40.00000000000) ) 
		CreateScreenElement { 
			type = VScrollingMenu 
			parent = current_menu_anchor 
			dims = <scroll_menu_dims> 
			pos = <scroll_menu_pos> 
			just = [ left top ] 
		} 
		<parent_id> = <id> 
		AssignAlias id = <parent_id> alias = current_scrolling_menu 
		<arrow_pos> = ( <arrow_pos> + ( ( <dims> . PAIR(0.00000000000, 1.00000000000) ) * PAIR(0.00000000000, 1.00000000000) ) + PAIR(0.00000000000, -18.00000000000) ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = current_menu_anchor 
			id = <arrow_down> 
			texture = down_arrow 
			pos = <arrow_pos> 
			just = [ left top ] 
			z_priority = 5 
			scale = 1 
			rgba = <arrow_rgba> 
		} 
		<vmenu_pos> = PAIR(0.00000000000, 0.00000000000) 
	ELSE 
		<parent_id> = current_menu_anchor 
		<vmenu_pos> = <pos> 
	ENDIF 
	CreateScreenElement { 
		type = VMenu 
		parent = <parent_id> 
		id = <vmenu_id> 
		pos = <vmenu_pos> 
		font = small 
		just = [ left top ] 
	} 
	IF GotParam scrolling 
		SetScreenElementProps { 
			id = <vmenu_id> 
			dims = <scroll_menu_dims> 
		} 
	ENDIF 
	IF GotParam no_event_handlers 
		KillEventHandlers 
	ELSE 
		SetScreenElementProps { 
			id = <vmenu_id> 
			event_handlers = [ { pad_back <pad_back_sound> } 
				{ pad_back <pad_back_script> params = <pad_back_params> } 
				{ pad_up generic_menu_up_or_down_sound params = { up } } 
				{ pad_down generic_menu_up_or_down_sound params = { down } } 
				{ pad_up blink_arrow params = { id = <arrow_up> } } 
				{ pad_down blink_arrow params = { id = <arrow_down> } } 
			] 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = <vmenu_id> 
		spacing_between = <spacing> 
	} 
	AssignAlias id = <vmenu_id> alias = current_menu 
	width = ( <dims> . PAIR(1.00000000000, 0.00000000000) ) 
	current_menu : SetTags width = <width> 
	current_menu : SetTags internal_text_just = <internal_text_just> 
	current_menu : SetTags internal_text_offset = <internal_text_offset> 
	current_menu : SetTags right_edge = ( <width> * PAIR(1.00000000000, 0.00000000000) ) 
	current_menu : SetTags menu_pos = <pos> 
	IF GotParam no_bar_edges 
		current_menu : SetTags no_bar_edges = 1 
	ENDIF 
	IF GotParam use_icons 
		current_menu : SetTags use_icons = 1 
	ENDIF 
	IF NOT GotParam no_animate 
		current_menu : SetTags animate_me = 1 
	ENDIF 
	IF GotParam add_3d_bg 
		current_menu : SetTags add_3d_bg = 1 
	ENDIF 
	IF GotParam additional_create_script 
		current_menu : SetTags additional_create_script = <additional_create_script> 
	ENDIF 
	IF GotParam additional_focus_script 
		current_menu : SetTags additional_focus_script = <additional_focus_script> 
	ENDIF 
	IF GotParam additional_unfocus_script 
		current_menu : SetTags additional_unfocus_script = <additional_unfocus_script> 
	ENDIF 
	IF GotParam additional_menu_create_script 
		<additional_menu_create_script> <additional_menu_create_params> 
	ENDIF 
ENDSCRIPT

SCRIPT add_roundbar_menu_item { focus_script = roundbar_menu_item_focus 
		unfocus_script = roundbar_menu_item_unfocus 
		pad_choose_sound = theme_menu_pad_choose_sound 
		pad_choose_params = { } 
		scale = 1.00000000000 
		rgba = [ 128 128 128 108 ] 
		just = [ right center ] 
		parent = current_menu 
		scale_highlight_text = 1 
	} 
	current_menu : GetSingleTag width 
	current_menu : GetSingleTag internal_text_just 
	current_menu : GetSingleTag internal_text_offset 
	current_menu : GetSingleTag right_edge 
	dims = ( <right_edge> + PAIR(0.00000000000, 18.00000000000) ) 
	IF NOT GotParam id 
		FormatText checksumName = temp_id "%s" s = <text> 
		MangleChecksums a = <pad_choose_script> b = <temp_id> 
		<id> = <mangled_id> 
	ENDIF 
	IF GotParam not_focusable 
		<rgba> = [ 70 70 70 120 ] 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			just = [ left center ] 
			not_focusable 
		} 
	ELSE 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			just = [ left center ] 
			event_handlers = [ 
				{ focus <focus_script> params = { id = <id> scale_highlight_text = <scale_highlight_text> } } 
				{ unfocus <unfocus_script> params = { id = <id> scale_highlight_text = <scale_highlight_text> } } 
				{ pad_start <pad_choose_sound> } 
				{ pad_choose <pad_choose_sound> } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
		} 
		IF GotParam tag_grid_x 
			<id> : SetTags tag_grid_x = <tag_grid_x> 
		ENDIF 
	ENDIF 
	<container_id> = <id> 
	IF ChecksumEquals a = <internal_text_just> b = right 
		pos = <right_edge> 
		opp_pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ right center ] 
	ELSE 
		IF ChecksumEquals a = <internal_text_just> b = center 
			pos = ( <right_edge> / 2 ) 
			opp_pos = <pos> 
			just = [ center center ] 
		ELSE 
			pos = PAIR(0.00000000000, 0.00000000000) 
			opp_pos = <right_edge> 
			just = [ left center ] 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		local_id = text 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
		font = small 
		text = <text> 
		rgba = <rgba> 
		scale = <scale> 
		pos = ( <pos> + PAIR(0.00000000000, 9.00000000000) + <internal_text_offset> ) 
		just = <just> 
	} 
	IF current_menu : GetSingleTag use_icons 
		IF GotParam icon 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <container_id> 
				local_id = the_icon 
				scale = ( <scale> * 0.60000002384 ) 
				pos = ( <opp_pos> + PAIR(-45.00000000000, 8.00000000000) ) 
				just = <just> 
				texture = <icon> 
				z_priority = 4 
				rgba = [ 128 128 128 0 ] 
			} 
		ELSE 
			
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		local_id = roundbar_middle 
		pos = PAIR(0.00000000000, 9.00000000000) 
		just = [ left center ] 
		scale = ( <right_edge> * 0.03099999949 + PAIR(0.00000000000, 1.00000000000) ) 
		texture = roundbar_middle 
		z_priority = 0 
		rgba = [ 0 0 0 0 ] 
	} 
	IF NOT current_menu : GetSingleTag no_bar_edges 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			local_id = roundbar_left 
			pos = PAIR(-20.00000000000, 9.00000000000) 
			just = [ left center ] 
			scale = 1 
			texture = roundbar_tip_left 
			z_priority = 1 
			rgba = [ 0 0 0 0 ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			local_id = roundbar_right 
			pos = ( <right_edge> + PAIR(-15.00000000000, 9.00000000000) ) 
			just = [ left center ] 
			scale = 1 
			texture = roundbar_tip_right 
			z_priority = 1 
			rgba = [ 0 0 0 0 ] 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		local_id = roundbar_highlight 
		texture = roundbar_highlight 
		pos = PAIR(0.00000000000, 0.00000000000) 
		rgba = [ 128 , 128 , 128 , 0 ] 
		just = [ center center ] 
		z_priority = 3 
	} 
	IF current_menu : GetSingleTag additional_create_script 
		<additional_create_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT roundbar_menu_item_focus 
	Theme_GetPauseBarColor return_value = bar_color 
	Theme_GetHighlightedTextColorNew return_value = on_color 
	SetScreenElementProps { 
		id = { <id> child = text } 
		rgba = <on_color> 
		shadow_rgba = [ 128 , 128 , 128 , 0 ] 
	} 
	IF GotParam scale_highlight_text 
		IF ( <scale_highlight_text> ) 
			DoScreenElementMorph id = { <id> child = text } time = 0.05000000075 scale = PAIR(1.14999997616, 1.25000000000) relative_scale 
		ENDIF 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = roundbar_middle } 
		rgba = <bar_color> 
	} 
	IF current_menu : GetSingleTag use_icons 
		SetScreenElementProps { 
			id = { <id> child = the_icon } 
			rgba = [ 128 128 128 128 ] 
		} 
	ENDIF 
	IF NOT current_menu : GetSingleTag no_bar_edges 
		SetScreenElementProps { 
			id = { <id> child = roundbar_left } 
			rgba = <bar_color> 
		} 
		SetScreenElementProps { 
			id = { <id> child = roundbar_right } 
			rgba = <bar_color> 
		} 
	ENDIF 
	RunScriptOnScreenElement id = { <id> child = roundbar_highlight } roundbar_menu_highlight 
	IF current_menu : GetSingleTag additional_focus_script 
		<additional_focus_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT roundbar_menu_item_unfocus 
	Theme_GetUnhighlightedTextColorNew return_value = off_color 
	SetScreenElementProps { 
		id = { <id> child = text } 
		rgba = <off_color> 
		shadow_rgba = UI_text_shadow_color 
	} 
	IF GotParam scale_highlight_text 
		IF ( <scale_highlight_text> ) 
			DoScreenElementMorph id = { <id> child = text } time = 0.05000000075 scale = 1.00000000000 relative_scale 
		ENDIF 
	ENDIF 
	SetScreenElementProps { 
		id = { <id> child = roundbar_middle } 
		rgba = [ 128 , 128 , 128 , 0 ] 
	} 
	IF current_menu : GetSingleTag use_icons 
		SetScreenElementProps { 
			id = { <id> child = the_icon } 
			rgba = [ 128 128 128 0 ] 
		} 
	ENDIF 
	IF NOT current_menu : GetSingleTag no_bar_edges 
		SetScreenElementProps { 
			id = { <id> child = roundbar_left } 
			rgba = [ 128 , 128 , 128 , 0 ] 
		} 
		SetScreenElementProps { 
			id = { <id> child = roundbar_right } 
			rgba = [ 128 , 128 , 128 , 0 ] 
		} 
	ENDIF 
	KillSpawnedScript name = roundbar_menu_highlight 
	DoScreenElementMorph id = { <id> child = roundbar_highlight } alpha = 0 time = 0 
	IF current_menu : GetSingleTag additional_unfocus_script 
		<additional_unfocus_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT roundbar_menu_highlight 
	GetSingleTag id 
	current_menu : GetSingleTag internal_text_just 
	current_menu : GetSingleTag right_edge 
	current_menu : GetSingleTag width 
	Theme_GetPauseBarColor return_value = bar_color 
	SetScreenElementProps { 
		id = <id> 
		rgba = <bar_color> 
	} 
	IF ChecksumEquals a = <internal_text_just> b = right 
		start_pos = ( <right_edge> + PAIR(-15.00000000000, 0.00000000000) ) 
		end_pos = PAIR(0.00000000000, 0.00000000000) 
	ELSE 
		start_pos = PAIR(15.00000000000, 0.00000000000) 
		end_pos = <right_edge> 
	ENDIF 
	SetScreenElementProps { 
		id = <id> 
		pos = ( <start_pos> + PAIR(0.00000000000, 8.00000000000) ) 
	} 
	DoScreenElementMorph id = <id> scale = PAIR(2.75000000000, 1.14999997616) time = 0 
	DoScreenElementMorph id = <id> alpha = 1 time = 0 
	DoScreenElementMorph id = <id> pos = ( <end_pos> + PAIR(0.00000000000, 8.00000000000) ) time = 0.34999999404 
	DoScreenElementMorph id = <id> alpha = 0.20000000298 time = 0.40000000596 
	wait 0.40000000596 seconds 
	SetScreenElementProps { 
		id = <id> 
		pos = ( <right_edge> / 2 + PAIR(0.00000000000, 8.00000000000) ) 
	} 
	DoScreenElementMorph id = <id> scale = ( <width> * PAIR(0.05999999866, 0.00000000000) + PAIR(0.00000000000, 1.14999997616) ) time = 0 
	BEGIN 
		DoScreenElementMorph id = <id> alpha = 1 time = 0.30000001192 
		wait 0.30000001192 seconds 
		DoScreenElementMorph id = <id> alpha = 0 time = 0.30000001192 
		wait 0.30000001192 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT pause_create_tipbox 
	IF NOT GotParam additional_width 
		additional_width = PAIR(0.00000000000, 0.00000000000) 
	ENDIF 
	IF GotParam tip_text 
		<container_id> : SetTags has_tipbox 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			local_id = tipbox_bar 
			texture = white2 
			pos = ( <right_edge> + PAIR(10.00000000000, 9.00000000000) ) 
			rgba = [ 101 , 71 , 26 , 128 ] 
			just = [ left center ] 
			scale = ( PAIR(19.00000000000, 0.40000000596) + 0.11500000209 * <additional_width> ) 
			z_priority = 1 
		} 
		DoScreenElementMorph id = <id> alpha = 0 time = 0 
		CreateScreenElement { 
			type = TextBlockElement 
			parent = <container_id> 
			local_id = tipbox_text 
			pos = ( <right_edge> + PAIR(85.00000000000, 15.00000000000) + <additional_width> * 0.50000000000 ) 
			font = small 
			scale = 1 
			rgba = [ 128 , 128 , 128 , 64 ] 
			dims = ( PAIR(130.00000000000, 0.00000000000) + <additional_width> ) 
			allow_expansion 
			text = <tip_text> 
			line_spacing = 0.75000000000 
			just = [ center top ] 
			internal_text_just = [ center top ] 
			z_priority = 9 
		} 
		DoScreenElementMorph id = <id> alpha = 0 time = 0 
		GetScreenElementDims id = <id> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			local_id = tipbox_bg 
			pos = ( <right_edge> + PAIR(10.00000000000, 9.00000000000) ) 
			texture = white2 
			rgba = [ 0 , 0 , 0 , 128 ] 
			just = [ left top ] 
			scale = ( <height> * PAIR(0.00000000000, 0.12500000000) + PAIR(19.00000000000, 2.00000000000) + 0.11500000209 * <additional_width> ) 
			z_priority = 1 
		} 
		DoScreenElementMorph id = <id> alpha = 0 time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT pause_focus_tipbox 
	IF <id> : GetSingleTag has_tipbox 
		DoScreenElementMorph id = { <id> child = tipbox_bar } alpha = 1 time = 0.89999997616 
		DoScreenElementMorph id = { <id> child = tipbox_bg } alpha = 0.50000000000 time = 0.89999997616 
		DoScreenElementMorph id = { <id> child = tipbox_text } alpha = 0.60000002384 time = 0.89999997616 
	ENDIF 
ENDSCRIPT

SCRIPT pause_unfocus_tipbox 
	IF <id> : GetSingleTag has_tipbox 
		DoScreenElementMorph id = { <id> child = tipbox_bar } alpha = 0 time = 0 
		DoScreenElementMorph id = { <id> child = tipbox_bg } alpha = 0 time = 0 
		DoScreenElementMorph id = { <id> child = tipbox_text } alpha = 0 time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT roundbar_menu_finish build_pause_parts = 1 
	IF ( <build_pause_parts> ) 
		build_pause_menu_parts <...> 
	ENDIF 
	IF ScreenElementExists id = music_track_anchor 
		generic_menu_animate_in force menu = music_track_anchor no_wait 
	ENDIF 
	IF current_menu : GetSingleTag add_3d_bg 
		menu3d_show 
		menu3d_animate_in 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		IF ObjectExists id = current_menu 
			generic_menu_animate_in menu = current_menu 
		ENDIF 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		IF ObjectExists id = current_menu 
			FireEvent type = focus target = current_menu data = <data> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT generic_menu_animate_in menu = current_menu_anchor 
	IF GotParam force 
		<menu> : SetTags animate_me = 1 
	ELSE 
		IF NOT <menu> : GetSingleTag animate_me 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam pos 
		ScreenElementPos = <pos> 
	ELSE 
		GetScreenElementPosition id = <menu> 
	ENDIF 
	DoScreenElementMorph id = <menu> pos = ( <ScreenElementPos> + PAIR(640.00000000000, 0.00000000000) ) time = 0 
	DoScreenElementMorph id = <menu> pos = <ScreenElementPos> time = 0.15000000596 
	IF NOT GotParam no_wait 
		wait 0.20000000298 seconds 
	ENDIF 
ENDSCRIPT

SCRIPT generic_menu_animate_out menu = current_menu_anchor 
	IF GotParam force 
		<menu> : SetTags animate_me = 1 
	ENDIF 
	IF NOT <menu> : GetSingleTag animate_me 
		IF <menu> : GetSingleTag add_3d_bg 
			menu3d_hide 
		ENDIF 
		RETURN 
	ENDIF 
	IF <menu> : GetSingleTag add_3d_bg 
		spawnscript menu3d_animate_out params = { die } 
	ENDIF 
	IF GotParam pos 
		ScreenElementPos = <pos> 
	ELSE 
		GetScreenElementPosition id = <menu> 
	ENDIF 
	DoScreenElementMorph id = <menu> pos = ( <ScreenElementPos> + PAIR(640.00000000000, 0.00000000000) ) time = 0.15000000596 
	wait 0.20000000298 seconds 
ENDSCRIPT

SCRIPT generic_animate_out_last_menu 
	IF ObjectExists id = current_menu 
		IF current_menu : GetSingleTag animate_me 
			generic_menu_animate_out menu = current_menu 
			RETURN 
		ENDIF 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		IF current_menu_anchor : GetSingleTag animate_me 
			generic_menu_animate_out 
			RETURN 
		ENDIF 
	ENDIF 
	IF ObjectExists id = sub_menu 
		IF sub_menu : GetSingleTag animate_me 
			generic_menu_animate_out force menu = sub_menu pos = PAIR(320.00000000000, 240.00000000000) 
			RETURN 
		ENDIF 
	ENDIF 
ENDSCRIPT


