SCRIPT create_menu_test_menu 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = menu_test_menu 
		font = small 
		pos = PAIR(320.00000000000, 224.00000000000) 
		just = [ center center ] 
		scale = 0 
		dims = PAIR(200.00000000000, 400.00000000000) 
		focusable_child = menu_test_vmenu 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = menu_test_menu 
		font = small 
		text = "Test Stuff" 
		scale = 1.25000000000 
		pos = PAIR(100.00000000000, 70.00000000000) 
		just = [ center top ] 
		rgba = [ 32 32 144 128 ] 
	} 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = menu_test_menu 
		id = the_scrolling_menu 
		just = [ center top ] 
		pos = PAIR(100.00000000000, 90.00000000000) 
		dims = PAIR(200.00000000000, 80.00000000000) 
		internal_just = [ center center ] 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = the_scrolling_menu 
		id = menu_test_vmenu 
		font = small 
		just = [ center top ] 
		pos = PAIR(100.00000000000, 0.00000000000) 
		dims = PAIR(200.00000000000, 170.00000000000) 
		internal_just = [ center center ] 
		dont_allow_wrap 
	} 
	AssignAlias id = menu_test_menu alias = current_menu_anchor 
	AssignAlias id = menu_test_vmenu alias = current_menu 
	SetScreenElementProps { 
		id = menu_test_vmenu 
		event_handlers = [ 
			{ pad_back leave_menu_test_menu } 
		] 
	} 
	make_text_menu_item text = "Sprite Test On" id = menu_sprite_test_on pad_choose_script = start_sprite_test focus_script = make_text_sub_menu_item text = "Focus here to assert" focus_script = menu_test_focus_position 
	make_text_menu_item text = "Sprite Test Off" id = menu_sprite_test_off pad_choose_script = stop_sprite_test 
	make_text_menu_item text = "Font Test" id = menu_font_test pad_choose_script = launch_font_test_menu 
	make_text_menu_item text = "Exit" id = menu_exit_test pad_choose_script = leave_menu_test_menu 
	hookup_hmenu 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ 
			{ pad_start nullscript } 
		] 
		replace_handlers 
	} 
	LoadTexture "sht_volcom01" 
	CreateScreenElement { 
		type = TextElement 
		id = blur_test_element 
		parent = root_window 
		font = small 
		text = "Vapor Trails" 
		scale = 2.00000000000 
		pos = PAIR(320.00000000000, 250.00000000000) 
		just = [ center center ] 
		rgba = [ 128 128 128 128 ] 
		blur_effect 
		blur_rgba = [ 128 0 0 128 ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		id = dumb_monkey 
		parent = root_window 
		font = small 
		text = "O\\m0\\m1\\m2\\m3\\m4\\m5\\m6ne\\bcTwo\\bc\\m7Three\\b1" 
		scale = 1.00000000000 
		pos = PAIR(25.00000000000, 150.00000000000) 
		just = [ left center ] 
		rgba = [ 128 128 128 128 ] 
	} 
	AssignAlias id = blur_test_element alias = blur_alias 
	RunScriptOnScreenElement id = blur_alias do_blur_effect2 
	RunScriptOnScreenElement id = menu_test_menu animate_in 
	
	CreateScreenElement { 
		type = SpriteElement 
		parent = root_window 
		id = bottom_mid_test 
		texture = bottom_mid 
		pos = PAIR(320.00000000000, 400.00000000000) 
		scale = PAIR(15.00000000000, 1.00000000000) 
		just = [ center bottom ] 
	} 
ENDSCRIPT

SCRIPT menu_test_focus_position 
	GetTags 
	SetScreenElementLock id = <id> off 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		texture = GO_fail 
	} 
	SetScreenElementLock id = <id> off 
ENDSCRIPT

SCRIPT do_blur_effect 
	DoMorph time = 0 blur_alpha_pair = PAIR(4.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) blur_max_displacement = PAIR(0.00000000000, 0.00000000000) scale = PAIR(0.89999997616, 0.89999997616) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
	DoMorph time = 0.09000000358 blur_alpha_pair = PAIR(0.00000000000, 0.00000000000) blur_bottom_scales = PAIR(2.00000000000, 0.00000000000) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
	DoMorph time = 0.09000000358 blur_alpha_pair = PAIR(4.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
ENDSCRIPT

SCRIPT do_blur_effect_accept 
	DoMorph time = 0 blur_alpha_pair = PAIR(4.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) blur_max_displacement = PAIR(0.00000000000, 0.00000000000) scale = PAIR(0.89999997616, 0.89999997616) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
	DoMorph time = 0.07000000030 blur_alpha_pair = PAIR(0.00000000000, 0.00000000000) blur_bottom_scales = PAIR(3.50000000000, 0.00000000000) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
	DoMorph time = 0.07000000030 blur_alpha_pair = PAIR(4.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
ENDSCRIPT

SCRIPT do_blur_effect_highlight 
	DoMorph time = 0 blur_alpha_pair = PAIR(4.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) blur_max_displacement = PAIR(0.00000000000, 0.00000000000) scale = PAIR(0.89999997616, 0.89999997616) blur_top_alpha_mult = 8.00000000000 scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
	DoMorph time = 0.07000000030 blur_alpha_pair = PAIR(0.20000000298, 0.20000000298) blur_bottom_scales = PAIR(2.59999990463, 0.00000000000) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
	DoMorph time = 0.07000000030 blur_alpha_pair = PAIR(4.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) scale = PAIR(1.00000000000, 1.00000000000) relative_scale 
ENDSCRIPT

SCRIPT do_blur_effect2 
	BEGIN 
		DoMorph time = 0 blur_alpha_pair = PAIR(1.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) blur_max_displacement = PAIR(0.00000000000, 0.00000000000) alpha = 0.06250000000 scale = PAIR(2.00000000000, 2.00000000000) relative_scale 
		DoMorph time = 0.75000000000 blur_alpha_pair = PAIR(0.50000000000, 0.00000000000) blur_bottom_scales = PAIR(3.00000000000, 3.00000000000) scale = PAIR(2.00000000000, 2.00000000000) relative_scale 
		DoMorph time = 0.75000000000 blur_alpha_pair = PAIR(1.00000000000, 0.00000000000) blur_bottom_scales = PAIR(1.00000000000, 1.00000000000) scale = PAIR(2.00000000000, 2.00000000000) relative_scale 
		wait 0.60000002384 seconds 
		DoMorph time = 0.50000000000 pos = PAIR(320.00000000000, 320.00000000000) blur_max_displacement = PAIR(0.00000000000, 70.00000000000) 
		DoMorph time = 0.50000000000 blur_max_displacement = PAIR(0.00000000000, 0.00000000000) 
		wait 0.60000002384 seconds 
		DoMorph time = 0.50000000000 pos = PAIR(320.00000000000, 250.00000000000) blur_max_displacement = PAIR(0.00000000000, -70.00000000000) 
		DoMorph time = 0.50000000000 pos = PAIR(320.00000000000, 250.00000000000) blur_max_displacement = PAIR(0.00000000000, 0.00000000000) alpha = 1.00000000000 
		wait 0.60000002384 seconds 
		SetProps no_blur_effect 
		wait 0.60000002384 seconds 
		SetProps blur_effect 
	REPEAT 
ENDSCRIPT

SCRIPT leave_menu_test_menu 
	DestroyScreenElement id = dumb_monkey 
	DestroyScreenElement id = blur_test_element 
	stop_sprite_test 
	UnloadTexture "sht_volcom01" 
	restore_start_key_binding 
	GetTags 
	
	DestroyScreenElement id = menu_test_menu 
	
	create_debug_menu 
	DestroyScreenElement id = bottom_mid_test 
ENDSCRIPT

SCRIPT hookup_hmenu 
	
	CreateScreenElement { 
		type = hmenu 
		id = test_h_menu 
		parent = current_menu 
		just = [ center center ] 
		padding_scale = 1.25000000000 
		spacing_between = 30 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = test_h_menu 
		local_id = something_something 
		text = "do something" 
		font = small 
		rgba = [ 128 64 64 75 ] 
		event_handlers = [ 
			{ focus do_scale_up } 
			{ unfocus do_scale_down } 
		] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = test_h_menu 
		text = "yes" 
		font = small 
		rgba = [ 128 128 128 75 ] 
		event_handlers = [ 
			{ focus do_scale_up } 
			{ unfocus do_scale_down } 
			{ pad_choose choose_h_menu_yes } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = test_h_menu 
		text = "no" 
		font = small 
		rgba = [ 128 128 128 75 ] 
		event_handlers = [ 
			{ focus do_scale_up } 
			{ unfocus do_scale_down } 
			{ pad_choose choose_h_menu_no } 
		] 
	} 
	SetScreenElementLock id = test_h_menu 
	
ENDSCRIPT

SCRIPT choose_h_menu_yes 
	SetScreenElementProps id = { test_h_menu child = something_something } focusable 
	SetScreenElementProps id = current_menu disable_pad_handling 
ENDSCRIPT

SCRIPT choose_h_menu_no 
	SetScreenElementProps id = { test_h_menu child = something_something } not_focusable 
	SetScreenElementProps id = current_menu enable_pad_handling 
ENDSCRIPT

SCRIPT start_sprite_test 
	IF ObjectExists id = test_sprite 
	ELSE 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			id = test_sprite 
			type = SpriteElement 
			parent = root_window 
			scale = 1.00000000000 
			pos = PAIR(610.00000000000, 30.00000000000) 
			just = [ right top ] 
			rgba = [ 128 128 128 128 ] 
			texture = sht_volcom01 
			debug_outline 
		} 
		FireEvent type = focus target = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT stop_sprite_test 
	IF ObjectExists id = test_sprite 
		SetScreenElementLock id = root_window off 
		DestroyScreenElement id = test_sprite recurse 
		FireEvent type = focus target = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT launch_font_test_menu 
ENDSCRIPT

SCRIPT Create3dArrowPointer model = "Arrow" angleX = 42.50000000000 pos = PAIR(320.00000000000, 50.00000000000) scale = 0.02999999933 active_viewport = 0 
	IF GotParam ArrowId 
		
		goto abort 
	ENDIF 
	IF ObjectExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		parent = root_window 
		type = Element3d 
		id = <id> 
		model = <model> 
		pos = <pos> 
		CameraZ = -6 
		scale = <scale> 
		Tilt = <Tilt> 
		active_viewport = <active_viewport> 
		angleX = <angleX> 
		NodeToPointTo = <Node> 
		ObjectToPointTo = <Name> 
	} 
ENDSCRIPT

SCRIPT TestElement3d 
	DoMorph time = 0 pos = RANDOM(1, 1, 1, 1) RANDOMCASE PAIR(0.00000000000, 0.00000000000) RANDOMCASE PAIR(-100.00000000000, 240.00000000000) RANDOMCASE PAIR(740.00000000000, 240.00000000000) RANDOMCASE PAIR(740.00000000000, 580.00000000000) RANDOMEND 
	DoMorph time = 0.50000000000 pos = <pos> 
	DoMorph time = 1 pos = RANDOM(1, 1, 1, 1) RANDOMCASE PAIR(-200.00000000000, 0.00000000000) RANDOMCASE PAIR(-200.00000000000, 240.00000000000) RANDOMCASE PAIR(840.00000000000, 240.00000000000) RANDOMCASE PAIR(840.00000000000, 580.00000000000) RANDOMEND 
	wait 1 seconds 
	Die 
ENDSCRIPT


