
SCRIPT parked_menu_blink_arrow 
	IF ScreenElementExists id = <id> 
		RunScriptOnScreenElement id = <id> menu_blink_arrow 
	ENDIF 
ENDSCRIPT

parked_helper_text_pos = PAIR(320.00000000000, 405.00000000000) 
SCRIPT parked_make_piece_menu { 
		total_dims = PAIR(430.00000000000, 60.00000000000) 
		separation = 60 
	} 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	Theme_GetHighlightBarColor return_value = border_rgba 
	SetScreenElementLock id = root_window Off 
	IF ObjectExists id = piece_menu_container 
		DestroyScreenElement id = piece_menu_container 
	ENDIF 
	CreateScreenElement { 
		parent = root_window 
		id = piece_menu_container 
		type = ContainerElement 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		event_handlers = [ 
			{ parked_menu_left parked_scroll_sideways_sound params = { } } 
			{ parked_menu_right parked_scroll_sideways_sound params = { } } 
			{ parked_menu_left parked_menu_blink_arrow params = { id = piece_menu_left_arrow } } 
			{ parked_menu_right parked_menu_blink_arrow params = { id = piece_menu_right_arrow } } 
		] 
	} 
	CreateScreenElement { 
		parent = piece_menu_container 
		type = HScrollingMenu 
		id = piece_menu_scrolling 
		just = [ left bottom ] 
		pos = PAIR(235.00000000000, 141.00000000000) 
		dims = <total_dims> 
		internal_just = [ center center ] 
		num_items_to_show = 6 
	} 
	CreateScreenElement { 
		parent = piece_menu_scrolling 
		type = HMenu 
		id = piece_menu_hmenu 
		just = [ center top ] 
		pos = PAIR(30.00000000000, 0.00000000000) 
		dims = <total_dims> 
		internal_just = [ left center ] 
		regular_space_amount = <separation> 
		disable_pad_handling 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = piece_menu_container 
		id = piece_menu_name_text 
		font = dialog 
		text = "Monkey Stew" 
		just = [ center center ] 
		pos = PAIR(417.00000000000, 85.00000000000) 
		rgba = <on_rgba> 
		scale = 0.85000002384 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		id = piece_slider_container 
		parent = piece_menu_container 
		dims = PAIR(320.00000000000, 50.00000000000) 
		just = [ left top ] 
		pos = PAIR(230.00000000000, 70.00000000000) 
		scale = PAIR(1.10000002384, 1.50000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = piece_slider_orange 
		parent = piece_slider_container 
		dims = PAIR(4.00000000000, 4.00000000000) 
		scale = PAIR(26.00000000000, 1.50000000000) 
		rgba = <on_rgba> 
		alpha = 1.00000000000 
		just = [ left center ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = piece_slider_gray 
		parent = piece_slider_container 
		dims = PAIR(4.00000000000, 4.00000000000) 
		scale = PAIR(95.00000000000, 1.20000004768) 
		rgba = [ 31 31 31 128 ] 
		alpha = 1.00000000000 
		just = [ left center ] 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = piece_menu_container 
		texture = white2 
		scale = PAIR(55.00000000000, 0.50000000000) 
		just = [ left top ] 
		pos = PAIR(230.00000000000, 74.00000000000) 
		rgba = <border_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = piece_menu_container 
		texture = white2 
		scale = PAIR(55.00000000000, 0.50000000000) 
		just = [ left center ] 
		pos = PAIR(230.00000000000, 95.00000000000) 
		rgba = <border_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = piece_menu_container 
		texture = white2 
		scale = PAIR(55.00000000000, 2.00000000000) 
		just = [ left center ] 
		pos = PAIR(230.00000000000, 85.00000000000) 
		rgba = [ 0 0 0 128 ] 
	} 
ENDSCRIPT

SCRIPT parked_destroy_piece_menu 
	IF ObjectExists id = piece_menu_container 
		DestroyScreenElement id = piece_menu_container 
	ENDIF 
ENDSCRIPT

SCRIPT parked_make_piece_menu_item { 
		item_dims = PAIR(50.00000000000, 50.00000000000) 
		item_midpoint = PAIR(30.00000000000, 25.00000000000) 
	} 
	SetScreenElementLock id = piece_menu_hmenu Off 
	CreateScreenElement { 
		parent = piece_menu_hmenu 
		type = ContainerElement 
		id = <metapiece_id> 
		dims = <item_dims> 
		just = [ center center ] 
		event_handlers = [ 
			{ focus parked_piece_focus_script } 
			{ unfocus parked_piece_unfocus_script } 
		] 
		heap = <heap> 
	} 
	Theme_GetHighlightBarColor return_value = on_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <metapiece_id> 
		texture = parked_piece_frame 
		scale = PAIR(0.85900002718, 0.85900002718) 
		alpha = 0 
		just = [ center center ] 
		pos = <item_midpoint> 
		rgba = <on_rgba> 
		heap = <heap> 
	} 
	IF GotParam ClipBoardIndex 
		FormatText TextName = text "%d" d = <ClipBoardIndex> 
		CreateScreenElement { 
			parent = <metapiece_id> 
			type = TextElement 
			font = dialog 
			text = <text> 
			just = [ center center ] 
			pos = PAIR(30.00000000000, 37.50000000000) 
			scale = 1 
			heap = <heap> 
		} 
	ELSE 
		IF GotParam EmptyClipBoard 
			CreateScreenElement { 
				parent = <metapiece_id> 
				type = TextElement 
				font = dialog 
				text = #"None" 
				just = [ center center ] 
				pos = PAIR(30.00000000000, 37.50000000000) 
				scale = 1 
				heap = <heap> 
			} 
		ELSE 
			CreateScreenElement { 
				parent = <metapiece_id> 
				type = Element3d 
				Sector = <Sector> 
				Sectors = <Sectors> 
				pos = ( <item_midpoint> + PAIR(5.50000000000, 9.00000000000) ) 
				dims = <item_dims> 
				just = [ center center ] 
				CameraZ = -6 
				scale = 0.85000002384 
				anglex = 0.50000000000 
				angley = 0.78500002623 
				scale_to_screen_dims 
				heap = <heap> 
			} 
		ENDIF 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = arrow_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <metapiece_id> 
		local_id = left_arrow 
		texture = left_arrow 
		just = [ center center ] 
		pos = PAIR(-5.00000000000, 37.50000000000) 
		scale = 0.80000001192 
		alpha = 0 
		z_priority = 55 
		rgba = <arrow_rgba> 
		heap = <heap> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <metapiece_id> 
		local_id = right_arrow 
		texture = right_arrow 
		just = [ center center ] 
		pos = PAIR(65.00000000000, 37.50000000000) 
		scale = 0.80000001192 
		alpha = 0 
		z_priority = 55 
		rgba = <arrow_rgba> 
		heap = <heap> 
	} 
ENDSCRIPT

SCRIPT parked_piece_focus_script 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		scale = 1.20000004768 
		time = 0.25000000000 
	} 
	DoScreenElementMorph id = { <id> child = 0 } scale = 1.27499997616 alpha = 0.55000001192 
	DoScreenElementMorph id = { <id> child = left_arrow } alpha = 1 
	DoScreenElementMorph id = { <id> child = right_arrow } alpha = 1 
	AssignAlias id = { <id> child = right_arrow } alias = piece_menu_right_arrow 
	AssignAlias id = { <id> child = left_arrow } alias = piece_menu_left_arrow 
ENDSCRIPT

SCRIPT parked_piece_unfocus_script 
	GetTags 
	DoScreenElementMorph { 
		id = { <id> child = 1 } 
		scale = 0.85000002384 
		time = 0.25000000000 
	} 
	DoScreenElementMorph id = { <id> child = 0 } scale = 1.27499997616 alpha = 0 
	DoScreenElementMorph id = { <id> child = left_arrow } alpha = 0 
	DoScreenElementMorph id = { <id> child = right_arrow } alpha = 0 
ENDSCRIPT

SCRIPT parked_set_helper_text_mode 
	IF NOT ObjectExists id = piece_menu_container 
		AddParams failed 
		RETURN 
	ENDIF 
	SetScreenElementLock id = piece_menu_container Off 
	SWITCH <mode> 
		CASE regular 
			IF isps2 
				create_helper_text park_editor_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999997616 
			ELSE 
				IF isxbox 
					create_helper_text park_editor_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999997616 
				ELSE 
					create_helper_text park_editor_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999997616 
				ENDIF 
			ENDIF 
		CASE gap_regular 
			IF isps2 
				create_helper_text gap_regular_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999997616 
			ELSE 
				IF isxbox 
					create_helper_text gap_regular_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999997616 
				ELSE 
					create_helper_text gap_regular_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999997616 
				ENDIF 
			ENDIF 
		CASE gap_adjust 
			IF isps2 
				create_helper_text gap_adjust_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos 
			ELSE 
				IF isxbox 
					create_helper_text gap_adjust_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos 
				ELSE 
					create_helper_text gap_adjust_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos 
				ENDIF 
			ENDIF 
		CASE rail_placement 
			helper_text = park_editor_helper_text 
			RailEditor : GetEditingMode 
			<scale> = 0.89999997616 
			SWITCH <mode> 
				CASE FreeRoaming 
					helper_text = rail_editor_free_roam_helper_text 
					<scale> = 0.80000001192 
				CASE RailLayout 
					helper_text = rail_editor_layout_helper_text 
					<scale> = 0.89999997616 
				CASE Grab 
					helper_text = rail_editor_grab_helper_text 
					<scale> = 0.89999997616 
			ENDSWITCH 
			IF isxbox 
				SWITCH <mode> 
					CASE FreeRoaming 
						helper_text = rail_editor_free_roam_helper_text_xbox 
						<scale> = 0.80000001192 
					CASE RailLayout 
						helper_text = rail_editor_layout_helper_text_xbox 
						<scale> = 0.89999997616 
					CASE Grab 
						helper_text = rail_editor_grab_helper_text_xbox 
						<scale> = 0.89999997616 
				ENDSWITCH 
			ENDIF 
			IF isNGC 
				SWITCH <mode> 
					CASE FreeRoaming 
						helper_text = rail_editor_free_roam_helper_text_ngc 
						<scale> = 0.80000001192 
					CASE RailLayout 
						helper_text = rail_editor_layout_helper_text_ngc 
						<scale> = 0.89999997616 
					CASE Grab 
						helper_text = rail_editor_grab_helper_text_ngc 
						<scale> = 0.89999997616 
				ENDSWITCH 
			ENDIF 
			create_helper_text <helper_text> parent = piece_menu_container helper_pos = parked_helper_text_pos scale = <scale> 
		DEFAULT 
	ENDSWITCH 
	SetScreenElementLock id = piece_menu_container on 
ENDSCRIPT

SCRIPT parked_create_percent_bar 
	IF ScreenElementExists id = percent_bar 
		DestroyScreenElement id = percent_bar 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		texture = white2 
		id = percent_bar 
		just = [ left top ] 
		pos = PAIR(20.00000000000, 413.00000000000) 
		rgba = [ 0 0 0 100 ] 
		scale = PAIR(75.00000000000, 1.50000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = percent_bar 
		texture = white2 
		id = percent_bar_colored_part 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
		rgba = <on_rgba> 
		scale = 1 
	} 
ENDSCRIPT

SCRIPT parked_update_percent_bar 
	IF NOT ScreenElementExists id = percent_bar_colored_part 
		RETURN 
	ENDIF 
	IF GotParam park_full 
		SetScreenElementProps id = percent_bar_colored_part rgba = [ 128 0 0 128 ] 
	ELSE 
		Theme_GetHighlightedTextColor return_value = on_rgba 
		SetScreenElementProps id = percent_bar_colored_part rgba = <on_rgba> 
	ENDIF 
	DoScreenElementMorph id = percent_bar_colored_part scale = ( PAIR(1.00000000000, 0.00000000000) * <park_percent> + PAIR(0.00000000000, 1.00000000000) ) relative_scale 
ENDSCRIPT

SCRIPT parked_make_set_menu { 
		corner_pos = PAIR(10.00000000000, 30.00000000000) 
		top_arrow_pos = PAIR(100.00000000000, 8.00000000000) 
		bottom_arrow_pos = PAIR(100.00000000000, 85.00000000000) 
		item_spacing = 19 
		menu_offset_from_top = PAIR(33.00000000000, 5.00000000000) 
	} 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	SetScreenElementLock id = root_window Off 
	IF ObjectExists id = set_menu_container 
	ELSE 
		make_new_menu { 
			menu_id = set_menu_container 
			type = VScrollingMenu 
			scrolling_menu_id = set_menu_scrolling 
			scrolling_menu_offset = PAIR(0.00000000000, 0.00000000000) 
			just = [ left top ] 
			internal_just = [ center center ] 
			pos = PAIR(62.00000000000, 42.00000000000) 
			dims = PAIR(150.00000000000, 120.00000000000) 
			vmenu_id = set_menu_vertical 
			regular_space_amount = <item_spacing> 
			internal_scale = 0.50000000000 
			dont_allow_wrap = 1 
			num_items_to_show = 5 
		} 
		SetScreenElementProps { 
			id = set_menu_container 
			event_handlers = [ 
				{ parked_menu_up generic_menu_up_or_down_sound params = { Up } } 
				{ parked_menu_down generic_menu_up_or_down_sound params = { Down } } 
				{ parked_menu_up parked_menu_blink_arrow params = { id = set_menu_up_arrow } } 
				{ parked_menu_down parked_menu_blink_arrow params = { id = set_menu_down_arrow } } 
			] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = set_menu_container 
			id = set_menu_up_arrow 
			texture = up_arrow 
			just = [ center center ] 
			pos = PAIR(130.00000000000, 30.00000000000) 
			scale = 0.80000001192 
			rgba = <on_rgba> 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = set_menu_container 
			id = set_menu_down_arrow 
			texture = down_arrow 
			just = [ center center ] 
			pos = PAIR(130.00000000000, 138.00000000000) 
			scale = 0.80000001192 
			rgba = <on_rgba> 
		} 
		theme_background { 
			parent = set_menu_container 
			id = set_bg 
			width = 1.14999997616 
			pos = PAIR(130.00000000000, 20.00000000000) 
			num_parts = 3.00000000000 
		} 
	ENDIF 
	parked_create_percent_bar 
	SetScreenElementLock id = root_window on 
	wait 0.20000000298 seconds 
ENDSCRIPT

SCRIPT parked_make_set_menu_item 
	SetScreenElementLock id = current_menu Off 
	theme_menu_add_item text = <set_name> text_just = [ center center ] no_choose_sound no_bg highlight_bar_scale = PAIR(1.50000000000, 0.69999998808) 
	SetScreenElementLock id = current_menu on 
ENDSCRIPT

SCRIPT parked_destroy_set_menu 
	IF ObjectExists id = set_menu_container 
		DestroyScreenElement id = set_menu_container 
	ENDIF 
	IF ObjectExists id = percent_bar 
		DestroyScreenElement id = percent_bar 
	ENDIF 
ENDSCRIPT

SCRIPT parked_lock_piece_and_set_menus 
	SetScreenElementLock id = piece_menu_hmenu on 
	SetScreenElementLock id = piece_menu_scrolling on 
	SetScreenElementLock id = set_menu_scrolling on 
	SetScreenElementLock id = set_menu_vertical on 
	FireEvent type = unfocus target = { set_menu_vertical child = <last_set_number> } 
	FireEvent type = focus target = { set_menu_vertical child = <set_number> } 
ENDSCRIPT


