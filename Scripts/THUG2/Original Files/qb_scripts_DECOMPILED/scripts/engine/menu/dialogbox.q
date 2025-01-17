
SCRIPT create_snazzy_dialog_box { title = "Title" 
		text = "Default text" 
		anchor_id = dialog_box_anchor 
		vmenu_id = dialog_box_vmenu 
		title_font = small 
		font = small 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center top ] 
		scale = 1 
		line_spacing = 0.69999998808 
		title_scale = 1 
		text_scale = 1 
		text_dims = PAIR(200.00000000000, 0.00000000000) 
		pos_tweak = PAIR(0.00000000000, -50.00000000000) 
		bg_rgba = [ 0 0 0 70 ] 
		bg_scale = 1 
		hmenu_pos = PAIR(0.00000000000, 40.00000000000) 
		z_priority = 10 
	} 
	IF ( <font> = dialog ) 
		font = small 
		
		
		
	ENDIF 
	Theme_GetHighlightedTextColor return_value = title_rgba 
	Theme_GetUnhighlightedTextColor return_value = text_rgba 
	IF ScreenElementExists id = <anchor_id> 
		dialog_box_exit anchor_id = <anchor_id> 
	ENDIF 
	IF NOT InNetGame 
		IF NOT LevelIs Load_MainMenu 
			pause_menu_gradient 
		ENDIF 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = <anchor_id> 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = <pos> 
		just = [ center center ] 
		z_priority = <z_priority> 
		priority = <priority> 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		id = dialog_box_container 
		parent = <anchor_id> 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = <pos> 
		just = [ center center ] 
		z_priority = <z_priority> 
		priority = <priority> 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <anchor_id> 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		z_priority = <z_priority> 
	} 
	<bg_anchor_id> = <id> 
	IF GotParam from_cas 
		make_cas_bg_elements parent = <bg_anchor_id> 
	ELSE 
		IF LevelIs Load_MainMenu 
			IF NOT GotParam no_bg 
				build_top_and_bottom_blocks parent = <bg_anchor_id> 
				make_mainmenu_3d_plane parent = <bg_anchor_id> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam forced_pos 
		pos = <forced_pos> 
	ENDIF 
	CreateScreenElement { 
		type = VMenu 
		parent = dialog_box_container 
		id = <vmenu_id> 
		pos = <pos> 
		just = [ center top ] 
		internal_just = [ center top ] 
		scale = <scale> 
		z_priority = <z_priority> 
	} 
	IF GotParam buttons 
		GetArraySize <buttons> 
		IF GotParam pad_back_script 
			IF ( <array_size> = 1 ) 
				create_helper_text { anchor_id = <helper_text_anchor_id> 
					parent = <bg_anchor_id> 
					generic_dialog_helper_text3 
					bg_rgba = <helper_text_bg_rgba> 
				} 
			ELSE 
				create_helper_text { anchor_id = <helper_text_anchor_id> 
					parent = <bg_anchor_id> 
					generic_helper_text 
					bg_rgba = <helper_text_bg_rgba> 
				} 
			ENDIF 
		ELSE 
			IF ( <array_size> = 1 ) 
				create_helper_text { anchor_id = <helper_text_anchor_id> 
					parent = <bg_anchor_id> 
					generic_dialog_helper_text 
					bg_rgba = <helper_text_bg_rgba> 
				} 
			ELSE 
				create_helper_text { anchor_id = <helper_text_anchor_id> 
					parent = <bg_anchor_id> 
					generic_dialog_helper_text2 
					bg_rgba = <helper_text_bg_rgba> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <vmenu_id> 
		font = <title_font> 
		text = <title> 
		just = [ center top ] 
		rgba = <title_rgba> 
		scale = <title_scale> 
		scale = 1.50000000000 
		z_priority = <z_priority> 
		not_focusable 
	} 
	<title_id> = <id> 
	GetScreenElementDims id = <title_id> 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = <vmenu_id> 
		font = small 
		text = <text> 
		just = [ center top ] 
		dims = <text_dims> 
		rgba = <text_rgba> 
		scale = <text_scale> 
		line_spacing = <line_spacing> 
		allow_expansion 
		not_focusable 
	} 
	<text_id> = <id> 
	GetScreenElementDims id = <text_id> 
	IF GotParam buttons 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <vmenu_id> 
			dims = ( <text_dims> + PAIR(50.00000000000, 20.00000000000) ) 
			not_focusable 
		} 
	ENDIF 
	IF GotParam logo 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <vmenu_id> 
			texture = <logo> 
			just = [ center center ] 
			rgba = [ 128 128 128 128 ] 
			scale = 1.00000000000 
		} 
		no_icon = no_icon 
		IF ( <logo> = dnas ) 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = <vmenu_id> 
				text = "\\nDNAS logotype is a trademark of \\nSony Computer Entertainment Inc." 
				font = dialog 
				dims = PAIR(300.00000000000, 100.00000000000) 
				just = [ center center ] 
				rgba = <text_rgba> 
				scale = <text_scale> 
			} 
		ENDIF 
	ENDIF 
	IF GotParam pad_back_script 
		SetScreenElementProps { 
			id = <vmenu_id> 
			event_handlers = [ { pad_back <pad_back_script> params = <pad_back_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	SetScreenElementLock id = <vmenu_id> on 
	SetScreenElementLock id = <vmenu_id> off 
	GetScreenElementDims id = <vmenu_id> 
	section_width = ( ( <width> / 100.00000000000 ) + 0.00000000000 ) 
	IF GotParam buttons 
		ForEachIn <buttons> do = create_dialog_button params = { font = <font> parent = <vmenu_id> z_priority = ( <z_priority> + 4 ) width = <section_width> pad_focus_script = <pad_focus_script> } 
		GetArraySize <buttons> 
		IF ( <array_size> > 1 ) 
			SetScreenElementProps { 
				id = <vmenu_id> 
				event_handlers = [ 
					{ pad_up generic_menu_up_or_down_sound params = { up } } 
					{ pad_down generic_menu_up_or_down_sound params = { down } } 
				] 
			} 
		ENDIF 
	ENDIF 
	IF GotParam sub_logo 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <vmenu_id> 
			texture = <sub_logo> 
			just = [ center center ] 
			rgba = [ 128 128 128 88 ] 
			scale = 1.20000004768 
			not_focusable 
		} 
		no_icon = no_icon 
	ENDIF 
	SetScreenElementLock id = <vmenu_id> on 
	SetScreenElementLock id = <vmenu_id> off 
	GetScreenElementDims id = <vmenu_id> 
	section_width = ( ( <width> / 100.00000000000 ) + 0.00000000000 ) 
	section_height = 32 
	num_parts = ( ( ( <height> * 1.00000000000 ) / ( <section_height> * 1.00000000000 ) ) -1.00000000000 ) 
	IF NOT GotParam forced_pos 
		centered_pos = ( PAIR(320.00000000000, 0.00000000000) + ( PAIR(0.00000000000, 1.00000000000) * ( 480 - <height> ) / 2 ) + <pos_tweak> ) 
		SetScreenElementProps id = <vmenu_id> pos = <centered_pos> 
	ELSE 
		centered_pos = <forced_pos> 
	ENDIF 
	theme_dialog_background { parent = dialog_box_container 
		width = <section_width> 
		pos = ( <centered_pos> + PAIR(0.00000000000, -8.00000000000) ) 
		num_parts = <num_parts> 
		z_priority = 10 
		no_icon = <no_icon> 
		add_loading_anim = <add_loading_anim> 
	} 
	kill_start_key_binding 
	IF ObjectExists id = no_button 
		FireEvent type = focus target = <vmenu_id> data = { child_id = no_button } 
	ELSE 
		FireEvent type = focus target = <vmenu_id> 
	ENDIF 
	IF GotParam delay_input 
		RunScriptOnScreenElement id = <anchor_id> dialog_box_delay_input params = { delay_input_time = <delay_input_time> } 
	ENDIF 
	IF NOT GotParam no_animate 
		IF GotParam style 
			RunScriptOnScreenElement id = <anchor_id> <style> params = <...> 
		ELSE 
			IF NOT GotParam full_animate 
				RunScriptOnScreenElement id = dialog_box_container animate_dialog_box_in params = <...> 
			ELSE 
				RunScriptOnScreenElement id = <anchor_id> animate_dialog_box_in params = <...> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT special_dialog_style 
	GetScreenElementDims id = <vmenu_id> 
	GetScreenElementPosition id = <vmenu_id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = dialog_box_container 
		id = left_star 
		pos = ( <ScreenElementPos> + PAIR(40.00000000000, 12.00000000000) ) 
		texture = PA_goals 
		scale = 1.79999995232 
		rot_angle = 10 
		rgba = [ 123 59 3 128 ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = dialog_box_container 
		id = middle_star 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <width> + <ScreenElementPos> + PAIR(-250.00000000000, 72.00000000000) ) 
		texture = DE_sponsor 
		scale = PAIR(6.50000000000, 6.50000000000) 
		rot_angle = -90 
		rgba = [ 123 59 3 50 ] 
		z_priority = 11 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = dialog_box_container 
		id = right_star 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <width> + <ScreenElementPos> + PAIR(-30.00000000000, 12.00000000000) ) 
		texture = PA_goals 
		scale = 1.79999995232 
		flip_v 
		rot_angle = -10 
		rgba = [ 123 59 3 128 ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = dialog_box_container 
		id = flash3 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <width> + <ScreenElementPos> + PAIR(-275.00000000000, 110.00000000000) ) 
		texture = bg_gradient_1 
		scale = PAIR(1.87999999523, 44.00000000000) 
		flip_v 
		rgba = [ 123 59 3 88 ] 
		z_priority = 11 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = dialog_box_container 
		id = topline 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <width> + <ScreenElementPos> + PAIR(-275.00000000000, 22.00000000000) ) 
		texture = white2 
		scale = PAIR(60.00000000000, 0.60000002384) 
		flip_v 
		rgba = [ 123 59 3 88 ] 
		z_priority = 11 
	} 
	IF GotParam use_shrek_logo 
		CreateScreenElement { 
			type = SpriteElement 
			parent = dialog_box_container 
			id = shrekie 
			pos = ( PAIR(1.00000000000, 0.00000000000) * <width> + <ScreenElementPos> + PAIR(-275.00000000000, 230.00000000000) ) 
			texture = shrek_logo 
			scale = 0.89999997616 
			rgba = [ 128 128 128 128 ] 
			z_priority = 11 
		} 
	ENDIF 
	RunScriptOnScreenElement id = middle_star burst_star 
	RunScriptOnScreenElement id = left_star spin_star params = { dir = cw } 
	RunScriptOnScreenElement id = right_star spin_star params = { dir = ccw } 
	<title_id> : Obj_SpawnScript pulse_dialog_title params = { id = <title_id> } 
	RunScriptOnScreenElement id = dialog_box_container animate_special_dialog_box_in params = <...> 
ENDSCRIPT

SCRIPT animate_special_dialog_box_in 
	DoMorph pos = PAIR(1000.00000000000, 260.00000000000) alpha = 0 time = 0 scale = 0 
	DoMorph pos = PAIR(320.00000000000, 260.00000000000) alpha = 1 time = 0.30000001192 scale = 1 
ENDSCRIPT

SCRIPT spin_star dir = cw 
	do_random_effect 
ENDSCRIPT

SCRIPT burst_star 
	DoMorph time = 0 scale = 0 alpha = 0 
	DoMorph time = 0.40000000596 scale = 5.50000000000 alpha = 1 
ENDSCRIPT

SCRIPT pulse_dialog_title 
	BEGIN 
		IF ObjectExists id = <id> 
			DoScreenElementMorph id = <id> time = 0.20000000298 scale = PAIR(2.20000004768, 2.00000000000) rgba = [ 120 28 7 28 ] 
			wait 0.20000000298 seconds 
		ELSE 
			BREAK 
		ENDIF 
		IF ObjectExists id = <id> 
			DoScreenElementMorph id = <id> time = 0.20000000298 scale = PAIR(1.50000000000, 1.50000000000) rgba = [ 120 28 7 128 ] 
			wait 0.20000000298 seconds 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT theme_dialog_background parent = current_menu_anchor width = 1 pos = PAIR(320.00000000000, 120.00000000000) num_parts = 2 top_height = 1 
	IF ScreenElementExists id = dialog_box_bg_vmenu 
		destroyscreenelement id = dialog_box_bg_vmenu 
	ENDIF 
	Theme_GetBGPartsColor return_value = dialog_bg_rgba 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = VMenu 
		parent = <parent> 
		id = dialog_box_bg_vmenu 
		font = small 
		just = [ left top ] 
		pos = <pos> 
		padding_scale = 1 
		internal_scale = 1 
		internal_just = [ center center ] 
	} 
	middle_parts = <num_parts> 
	CasttoInteger middle_parts 
	partial_scale = ( <num_parts> - <middle_parts> ) 
	
	build_theme_dialog_top parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority> height = <top_height> 
	IF ( <middle_parts> > 0 ) 
		BEGIN 
			build_theme_dialog_middle parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority> 
		REPEAT <middle_parts> 
	ENDIF 
	build_theme_dialog_middle parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> 
	build_theme_dialog_bottom parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> no_icon = <no_icon> add_loading_anim = <add_loading_anim> 
ENDSCRIPT

SCRIPT build_theme_dialog_top 
	CreateScreenElement { 
		type = ContainerElement 
		dims = PAIR(0.00000000000, 32.00000000000) 
		parent = <parent> 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_T_M 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <dialog_bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <width> + PAIR(0.00000000000, 1.00000000000) * <height> ) 
		z_priority = <z_priority> 
	} 
	<top_height> = <height> 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_T_L 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <dialog_bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) * <top_height> ) 
		z_priority = <z_priority> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_T_R 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <dialog_bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) + PAIR(0.00000000000, 1.00000000000) * <top_height> ) 
		z_priority = <z_priority> 
	} 
ENDSCRIPT

SCRIPT build_theme_dialog_middle scale_height = 1 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		dims = PAIR(0.00000000000, 32.00000000000) 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_M_M 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		rgba = <dialog_bg_rgba> 
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
		texture = snaz_M_L 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <dialog_bg_rgba> 
		scale = <side_scale> 
		z_priority = <z_priority> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_M_R 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <dialog_bg_rgba> 
		scale = <side_scale> 
		z_priority = <z_priority> 
	} 
ENDSCRIPT

SCRIPT build_theme_dialog_bottom 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		dims = PAIR(0.00000000000, 32.00000000000) 
	} 
	anchor_id = <id> 
	pos = ( PAIR(0.00000000000, -1.00000000000) * ( 32 - ( <scale_height> * 32 ) ) ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_B_M 
		pos = <pos> 
		just = [ center top ] 
		rgba = <dialog_bg_rgba> 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <width> + PAIR(0.00000000000, 1.00000000000) ) 
		z_priority = <z_priority> 
	} 
	GetScreenElementDims id = <id> 
	right_pos = ( PAIR(0.50000000000, 0.00000000000) * <width> + <pos> ) 
	left_pos = ( PAIR(-0.50000000000, 0.00000000000) * <width> + <pos> ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_B_L 
		pos = <left_pos> 
		just = [ right top ] 
		rgba = <dialog_bg_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = <z_priority> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = snaz_B_R 
		pos = <right_pos> 
		just = [ left top ] 
		rgba = <dialog_bg_rgba> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		z_priority = <z_priority> 
	} 
	IF NOT GotParam no_icon 
		FormatText ChecksumName = theme_icon "%i_snaz_icon" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = <theme_icon> 
			pos = ( PAIR(0.00000000000, 10.00000000000) + <pos> ) 
			just = [ center center ] 
			rgba = [ 50 50 50 70 ] 
			scale = PAIR(1.29999995232, 1.29999995232) 
			z_priority = ( <z_priority> + 1 ) 
		} 
		IF GotParam add_loading_anim 
			RunScriptOnScreenElement id = <id> spin_dialog_icon 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT spin_dialog_icon 
	BEGIN 
		DoMorph rot_angle = 360 time = 1.00000000000 
		DoMorph rot_angle = 0 time = 1.00000000000 
	REPEAT 
ENDSCRIPT

SCRIPT create_error_box delay_input_time = 1000 
	create_dialog_box <...> error_box 
ENDSCRIPT

SCRIPT create_dialog_box 
	create_snazzy_dialog_box <...> 
ENDSCRIPT

SCRIPT create_dialog_button { focus_script = main_theme_focus 
		focus_params = { text_scale = 1.14499998093 } 
		unfocus_script = main_theme_unfocus 
		pad_choose_script = dialog_box_exit 
		font = small 
		parent = dialog_box_vmenu 
	} 
	SetScreenElementLock id = root_window off 
	SetScreenElementLock id = <parent> off 
	Theme_GetUnhighlightedTextColor return_value = text_color 
	IF ( <text> = "No" ) 
		id = no_button 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <id> 
		dims = PAIR(0.00000000000, 20.00000000000) 
		just = [ center center ] 
		event_handlers = 
		[ 
			{ focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
			{ pad_choose generic_menu_pad_choose_sound } 
			{ pad_start generic_menu_pad_choose_sound } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
		] 
		<not_focusable> 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		pos = PAIR(0.00000000000, 0.00000000000) 
		font = <font> 
		text = <text> 
		just = [ center center ] 
		scale = 1 
		rgba = <text_color> 
		z_priority = <z_priority> 
	} 
	highlight_angle = 0 
	bar_scale = ( ( <width> + 2 ) * PAIR(0.50000000000, 0.00000000000) + PAIR(0.00000000000, 0.69999998808) ) 
	highlight_angle = ( <highlight_angle> / ( <bar_scale> . PAIR(1.00000000000, 0.00000000000) ) ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = DE_highlight_bar 
		pos = PAIR(0.00000000000, 0.00000000000) 
		rgba = [ 0 0 0 0 ] 
		just = [ center center ] 
		scale = <bar_scale> 
		z_priority = 11 
		rot_angle = <highlight_angle> 
	} 
ENDSCRIPT

SCRIPT dialog_box_exit { anchor_id = dialog_box_anchor } 
	IF NOT GotParam dont_restore_input 
		SetButtonEventMappings unblock_menu_input 
	ENDIF 
	DeBounce x time = 0.30000001192 
	IF ObjectExists id = <anchor_id> 
		destroyscreenelement id = <anchor_id> 
	ENDIF 
	IF LevelIs Load_MainMenu 
	ELSE 
		pause_menu_gradient off 
	ENDIF 
	IF NOT GotParam no_pad_start 
		IF NOT LevelIs Load_MainMenu 
			restore_start_key_binding 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT dialog_box_delay_input delay_input_time = 2000 
	SetButtonEventMappings block_menu_input 
	wait <delay_input_time> 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT create_speech_box { pos = PAIR(320.00000000000, 450.00000000000) 
		text_rgba = [ 128 128 128 128 ] 
		anchor_id = speech_box_anchor 
		scale = 1 
		pad_choose_script = speech_box_exit 
		pad_choose_params = { anchor_id = <anchor_id> } 
		parent = root_window 
		bg_x_scale = 1.12000000477 
		pause_input_time = 1000 
	} 
	font = testtitle 
	Theme_GetSpeechBoxColor return_value = bg_rgba 
	IF ObjectExists id = <anchor_id> 
		destroyscreenelement id = <anchor_id> 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <anchor_id> 
		pos = PAIR(320.00000000000, 210.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		scale = <scale> 
		z_priority = <z_priority> 
	} 
	IF NOT GotParam no_pad_choose 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_choose <pad_choose_script> params = <pad_choose_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_back_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_back <pad_back_script> params = <pad_back_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_circle_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_circle <pad_circle_script> params = <pad_circle_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_square_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_square <pad_square_script> params = <pad_square_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_option_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_option <pad_option_script> params = <pad_option_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_up_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_up <pad_up_script> params = <pad_up_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_down_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_down <pad_down_script> params = <pad_down_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_left_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_left <pad_left_script> params = <pad_left_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam pad_right_script 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_right <pad_right_script> params = <pad_right_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	IF NOT GotParam no_pad_start 
		SetScreenElementProps { 
			id = root_window 
			event_handlers = [ { pad_start <pad_choose_script> params = <pad_choose_params> } ] 
			replace_handlers 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		pos = <pos> 
		just = [ center bottom ] 
		texture = dialog_frame_b 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <bg_x_scale> + PAIR(0.00000000000, 1.00000000000) ) 
		rgba = <bg_rgba> 
	} 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = <anchor_id> 
		shadow 
		font = <font> 
		dims = ( PAIR(260.00000000000, 0.00000000000) ) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center top ] 
		text = <text> 
		internal_scale = 0.85000002384 
		internal_just = [ center bottom ] 
		rgba = <text_rgba> 
		scale = 1 
		allow_expansion 
	} 
	<speech_text> = <id> 
	GetScreenElementDims id = <speech_text> 
	SetScreenElementProps { 
		id = <speech_text> 
		pos = ( <pos> - PAIR(0.00000000000, 16.00000000000) - ( PAIR(0.00000000000, 1.00000000000) * <height> ) ) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = dialog_middle 
		pos = ( <pos> - PAIR(0.00000000000, 16.00000000000) ) 
		scale = ( ( PAIR(1.00000000000, 0.00000000000) * <bg_x_scale> ) + PAIR(0.00000000000, 1.00000000000) * <height> / 16 ) 
		just = [ center bottom ] 
		rgba = <bg_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		pos = ( <pos> - PAIR(0.00000000000, 16.00000000000) - PAIR(0.00000000000, 1.00000000000) * <height> ) 
		just = [ center bottom ] 
		texture = dialog_frame 
		scale = ( PAIR(1.00000000000, 0.00000000000) * <bg_x_scale> + PAIR(0.00000000000, 1.00000000000) ) 
		rgba = <bg_rgba> 
	} 
	IF GotParam style 
		RunScriptOnScreenElement id = <anchor_id> <style> params = <...> 
	ENDIF 
	FireEvent type = focus target = <anchor_id> 
	IF GotParam pause_input 
		SpawnScript TemporarilyDisableInput params = { time = <pause_input_time> } 
	ENDIF 
ENDSCRIPT

SCRIPT speech_box_exit anchor_id = speech_box_anchor 
	IF ObjectExists id = <anchor_id> 
		destroyscreenelement id = <anchor_id> 
	ENDIF 
	DeBounce x time = 0.30000001192 
	IF NOT GotParam no_pad_start 
		restore_start_key_binding 
	ENDIF 
	FireEvent type = speech_box_destroyed 
ENDSCRIPT

SCRIPT speech_box_style 
	RunScriptOnScreenElement id = <speech_text> hide_speech_text params = <...> 
	DoMorph time = 0 scale = PAIR(1.00000000000, 1.00000000000) alpha = 1 
	wait 4 frame 
	DoMorph time = 0.20000000298 scale = PAIR(1.00000000000, 1.00000000000) alpha = 1 
	RunScriptOnScreenElement id = <speech_text> speech_box_style_scale_text params = <...> 
ENDSCRIPT

SCRIPT hide_speech_text 
	DoMorph time = 0 scale = 0 
ENDSCRIPT

SCRIPT speech_box_style_scale_text anchor_id = <anchor_id> 
	wait 0.05000000075 second 
	DoMorph time = 0 scale = PAIR(1.00000000000, 1.00000000000) alpha = 0 
	DoMorph time = 0.50000000000 scale = PAIR(1.00000000000, 1.00000000000) alpha = 1 
	FireEvent type = focus target = <anchor_id> 
ENDSCRIPT

SCRIPT animate_dialog_box_in 
	IF GotParam full_animate 
		SetScreenElementProps { 
			id = <bg_anchor_id> 
			hide 
		} 
	ENDIF 
	IF NOT GotParam delay_input 
		SpawnScript dialog_box_delay_input params = { delay_input_time = 150 } 
	ENDIF 
	DoMorph time = 0 scale = PAIR(0.00000000000, 0.00000000000) alpha = 0.10000000149 
	DoMorph time = 0.15000000596 scale = PAIR(1.00000000000, 0.00000000000) alpha = 0.40000000596 
	DoMorph time = 0.15000000596 scale = PAIR(1.00000000000, 1.00000000000) alpha = 1.00000000000 
	IF GotParam full_animate 
		SetScreenElementProps { 
			id = <bg_anchor_id> 
			unhide 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT create_test_dialog 
	IF ScreenElementExists id = current_menu_anchor 
		destroyscreenelement id = current_menu_anchor 
	ENDIF 
	create_dialog_box { pad_back_script = create_test_menu 
		buttons = [ { font = small text = "No" pad_choose_script = create_test_menu } 
			{ font = small text = "Yes" pad_choose_script = null_script } 
		] 
	} 
ENDSCRIPT

SCRIPT dialog_box_accept 
	dialog_box_exit 
	FireEvent type = message_accept 
ENDSCRIPT


