
default_face_points = [ { name = "the center of your right eye" pos = PAIR(42.00000000000, 51.00000000000) } 
	{ name = "the center of your left eye" pos = PAIR(80.00000000000, 51.00000000000) } 
	{ name = "the spot between your nostrils" pos = PAIR(61.00000000000, 77.00000000000) } 
	{ name = "the center of your lips" pos = PAIR(61.00000000000, 97.00000000000) } 
] 
tony_face_points = [ PAIR(43.00000000000, 42.00000000000) 
	PAIR(83.00000000000, 44.00000000000) 
	PAIR(62.00000000000, 72.00000000000) 
	PAIR(62.00000000000, 88.00000000000) 
] 
saved_face_points = [ PAIR(42.00000000000, 51.00000000000) 
	PAIR(80.00000000000, 51.00000000000) 
	PAIR(61.00000000000, 77.00000000000) 
	PAIR(61.00000000000, 97.00000000000) 
] 
from_CAS_face_mapping = 0 
download_from_online = 0 
SCRIPT download_face 
	ChooseFaceForFacemap <...> 
	done_download_face 
ENDSCRIPT

SCRIPT add_item_to_face_menu 
	theme_menu_add_item { text = <name> pad_choose_script = download_face pad_choose_params = { string = <file> } centered = centered } 
ENDSCRIPT

SCRIPT create_face_map_menu brightness = 1.00000000000 
	skater : unhide 
	IF ScreenElementExists id = cas_category_anchor 
		DestroyScreenElement id = cas_category_anchor 
	ENDIF 
	IF GotParam goto_face_map 
		init_cas_skater_and_cam 
	ENDIF 
	
	change goto_face_menu = 0 
	GetCurrentSkaterProfileIndex 
	IF NOT ( <currentSkaterProfileIndex> = 0 ) 
		load_pro_skater name = custom 
	ENDIF 
	IF NOT GotParam face_texture 
		IF NOT GotParam downloaded_face 
			maybe_load_default_face 
		ELSE 
			refresh_skater_model 
		ENDIF 
	ENDIF 
	IF NOT GotParam no_textures 
		IF NOT GotParam no_new_textures 
			LoadFaceTextureFromProfile checksum = cas_texture_from_profile 
		ENDIF 
	ENDIF 
	cas_setup_rotating_camera cam_anim = Head 
	UnpauseMusicAndStreams 
	IF GotParam goto_face_map 
		face_map_menu 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "FACE MAPPING" pos = PAIR(125.00000000000, 80.00000000000) dims = PAIR(400.00000000000, 300.00000000000) from_cas 
	create_helper_text generic_helper_text_cas 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = face_map_exit new_script = face_map_return_to_cas } } 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
		] 
	} 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	theme_menu_add_item { text = "1)" extra_text = "Choose Face" pad_choose_script = retrieve_face_selected text_just = [ right center ] text_pos = PAIR(-30.00000000000, -5.00000000000) ignore_width } 
	theme_menu_add_item { text = "2)" extra_text = "Edit Points" pad_choose_script = face_map_exit pad_choose_params = { new_script = face_map_menu } id = menu_edit_points text_just = [ right center ] text_pos = PAIR(-30.00000000000, -5.00000000000) ignore_width } 
	theme_menu_add_item { text = "3)" extra_text = "Match Your Face" pad_choose_script = face_map_exit pad_choose_params = { new_script = face_hsv_menu on_load = on_load hue = 0.00000000000 sat = 1.00000000000 val = 1.00000000000 } text_just = [ right center ] text_pos = PAIR(-30.00000000000, -5.00000000000) ignore_width } 
	theme_menu_add_item { text = "4)" extra_text = "Color Your Skin" pad_choose_script = face_map_exit pad_choose_params = { new_script = face_skin_menu on_load = on_load } text_just = [ right center ] text_pos = PAIR(-30.00000000000, -5.00000000000) ignore_width } 
	theme_menu_add_item { text = "5)" extra_text = "Done        " 
		pad_choose_script = face_map_exit 
		pad_choose_params = { new_script = face_map_return_to_cas } 
		text_just = [ right center ] 
		last_menu_item = last_menu_item 
		text_pos = PAIR(-30.00000000000, -5.00000000000) 
	} 
	finish_themed_sub_menu 
	change disable_menu_sounds = 1 
	IF GotParam focus_child 
		BEGIN 
			FireEvent type = pad_down target = sub_vmenu 
		REPEAT <focus_child> 
	ENDIF 
	change disable_menu_sounds = 0 
ENDSCRIPT

SCRIPT eye_toy_menu 
	change eye_toy_in_capture_menu = 1 
	skater : hide 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	CreateScreenElement { 
		type = containerElement 
		parent = root_window 
		id = eye_toy_menu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = eye_toy_menu_anchor alias = current_menu_anchor 
	create_helper_text eye_toy_helper_text 
	SetScreenElementProps { 
		id = current_menu_anchor 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = exit_eye_toy_menu } } 
			{ pad_choose eye_toy_capture_face } 
			{ pad_square eye_toy_toggle_settings } 
		] 
	} 
	build_theme_sub_title title = "CAPTURE YOUR FACE" from_cas 
	Theme_GetAltColor return_value = frame_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = white2 
		rgba = <frame_color> 
		pos = PAIR(185.00000000000, 87.00000000000) 
		scale = PAIR(34.00000000000, 34.00000000000) 
		just = [ left top ] 
		z_priority = -1 
	} 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba 
	CreateScreenElement { 
		type = textBlockElement 
		parent = current_menu_anchor 
		id = directions_text 
		text = "Center your face in the image above and then\\npress the \\b3 button to capture a picture." 
		pos = PAIR(320.00000000000, 368.00000000000) 
		dims = PAIR(640.00000000000, 60.00000000000) 
		font = small 
		scale = 0.89999997616 
		rgba = <unhighlight_rgba> 
		line_spacing = 0.64999997616 
		z_priority = 5 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_mid 
		pos = PAIR(320.00000000000, 370.00000000000) 
		scale = PAIR(12.00000000000, 1.20000004768) 
		just = [ center center ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	GetStackedScreenElementPos X id = <id> 
	GetScreenElementPosition id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_right 
		pos = <pos> 
		scale = PAIR(1.00000000000, 1.20000004768) 
		just = [ left top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_left 
		pos = <ScreenElementPos> 
		scale = PAIR(1.00000000000, 1.20000004768) 
		just = [ right top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	IF NOT CD 
		PauseMusic 1 
	ENDIF 
	StartupCaptureDevice 
	SetupCaptureBitmapBuffer 
	LoadTexture "faces\\CS_NSN_Head_EyeToy" 
	Generate32BitImage CS_NSN_Head_EyeToy renderable = 1 
	ApplyRGBAToTexture CS_NSN_Head_EyeToy r = 0 g = 0 b = 0 a = 128 
	CreateScreenElement { 
		id = the_face_test 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = CS_NSN_Head_EyeToy 
		scale = PAIR(2.00000000000, 2.00000000000) 
		pos = PAIR(193.00000000000, 90.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
	} 
	SetCaptureDestTexture CS_NSN_Head_EyeToy 
	change eye_toy_use_defaults = 0 
	eye_toy_toggle_settings 
	StartVideoCapture 
	FireEvent type = focus target = current_menu_anchor 
ENDSCRIPT

SCRIPT exit_eye_toy_menu back_to_face_map = 1 reset_cam = 1 unload_cas_texture = 1 
	DestroyScreenElement id = current_menu_anchor 
	IF ( <reset_cam> ) 
		StopVideoCapture 
		ShutdownCaptureDevice 
	ENDIF 
	UnloadTexture "CS_NSN_Head_EyeToy" 
	IF NOT CD 
		PauseMusic 0 
	ENDIF 
	IF ( <unload_cas_texture> ) 
		unload_cas_texture_from_profile 
	ENDIF 
	change eye_toy_in_capture_menu = 0 
	IF ( <back_to_face_map> ) 
		create_face_map_menu focus_child = 5 
	ENDIF 
ENDSCRIPT

SCRIPT eye_toy_capture_face 
	StopVideoCapture 
	SetScreenElementLock id = current_menu_anchor off 
	DestroyScreenElement id = the_face_test 
	Put32BitImageIntoTexture CS_NSN_Head_EyeToy palette_gen = 1 
	SetFaceTextureFromVideoCapture captured_texture = CS_NSN_Head_EyeToy 
	get_default_face_texture_name 
	IF NOT GotParam texturePath 
		script_assert "no texture path?" 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	SetPlayerFacePoints { 
		player = <currentSkaterProfileIndex> 
		left_eye = [ 44 , 40 ] 
		right_eye = [ 87 , 42 ] 
		nose = [ 65 , 70 ] 
		lips = [ 66 , 88 ] 
		width = 128 
		height = 128 
	} 
	SetPlayerFaceOverlayTexture { 
		player = <currentSkaterProfileIndex> 
		texture = <overlayPath> 
	} 
	exit_eye_toy_menu 
ENDSCRIPT

eye_toy_use_defaults = 1 
SCRIPT eye_toy_toggle_settings 
	change eye_toy_use_defaults = ( 1 - eye_toy_use_defaults ) 
	IF ( eye_toy_use_defaults ) 
		SetCaptureAttribute auto_gain arg0 = 1 
		SetCaptureAttribute auto_brightness arg0 = 1 
		SetCaptureAttribute auto_exposure arg0 = 1 
		SetCaptureAttribute saturation arg0 = 164 
		SetCaptureAttribute backlight_comp arg0 = 0 
	ELSE 
		SetCaptureAttribute auto_gain arg0 = 0 
		SetCaptureAttribute gain arg0 = 255 
		SetCaptureAttribute auto_brightness arg0 = 0 
		SetCaptureAttribute brightness arg0 = 220 
		SetCaptureAttribute auto_exposure arg0 = 0 
		SetCaptureAttribute exposure arg0 = 255 
		SetCaptureAttribute saturation arg0 = 180 
		SetCaptureAttribute backlight_comp arg0 = 1 
	ENDIF 
ENDSCRIPT

eye_toy_in_capture_menu = 0 
SCRIPT eye_toy_handle_camera_check 
	IF ( <camera_present> ) 
		IF NOT ( eye_toy_in_capture_menu ) 
			IF ScreenElementExists id = eye_toy_menu 
				SetScreenElementProps id = eye_toy_menu focusable 
				SetScreenElementProps id = { eye_toy_menu_text child = 0 } rgba = [ 128 128 128 128 ] 
				SetScreenElementProps id = { eye_toy_menu_text child = 1 } rgba = [ 128 128 128 128 ] 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( eye_toy_in_capture_menu ) 
			eye_toy_warn_removed 
		ELSE 
			IF ScreenElementExists id = sub_vmenu 
				sub_vmenu : gettags 
				IF ChecksumEquals a = <tag_selected_id> b = eye_toy_menu 
					FireEvent type = pad_up target = sub_vmenu 
				ENDIF 
			ENDIF 
			IF ScreenElementExists id = eye_toy_menu 
				SetScreenElementProps id = eye_toy_menu not_focusable 
				SetScreenElementProps id = { eye_toy_menu_text child = 0 } rgba = [ 80 80 80 80 ] 
				SetScreenElementProps id = { eye_toy_menu_text child = 1 } rgba = [ 80 80 80 80 ] 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT eye_toy_warn_removed 
	StopEyeToyCheck 
	StopVideoCapture 
	ShutdownCaptureDevice 
	FireEvent type = unfocus target = current_menu_anchor 
	create_error_box { 
		title = "Warning!" 
		text = "EyeToy\xAE USB Camera (for PlayStation\xAE2) not detected.  Please plug the EyeToy\xAE USB camera (for PlayStation\xAE2) into one of the USB connectors on the front of the console." 
		buttons = [ { text = "OK" pad_choose_script = eye_toy_resolve_removed } ] 
		no_bg 
	} 
ENDSCRIPT

SCRIPT eye_toy_resolve_removed 
	CheckEyeToyPresent 
	dialog_box_exit 
	IF ( <camera_present> ) 
		exit_eye_toy_menu back_to_face_map = 0 reset_cam = 0 unload_cas_texture = 0 
		eye_toy_menu 
		SpawnEyeToyCheck 
	ELSE 
		exit_eye_toy_menu reset_cam = 0 
	ENDIF 
ENDSCRIPT

SCRIPT setup_face_map_cam 
	wait 2 gameframes 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	skater : pausephysics 
	UnPauseSkater 0 
	MakeSkaterGoto SkateShopAI params = { CAS_Screen NOSFX } 
	IF LevelIs load_cas 
		skater : Obj_MoveToNode orient name = cas_player_restart 
	ENDIF 
	KillSkaterCamAnim all 
	CalcPosRelative 
	target_vector = ( VECTOR(-14.00000000000, 65.00000000000, 0.00000000000) ) 
	pos_vector = ( VECTOR(-14.00000000000, 65.00000000000, 35.00000000000) ) 
	change cas_cam_angle = 0 
	change cas_cam_target_x = ( <target_vector> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	change cas_cam_target_y = ( <target_vector> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
	change cas_cam_target_z = ( <target_vector> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	change cas_cam_pos_x = ( <pos_vector> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) 
	change cas_cam_pos_y = ( <pos_vector> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
	change cas_cam_pos_z = ( <pos_vector> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	get_rotated_vector vector = <target_vector> 
	t_off = ( <vector> + <pos> ) 
	get_rotated_vector vector = <pos_vector> 
	p_off = ( <vector> + <pos> ) 
	
	skater : Obj_GetId 
	PlaySkaterCamAnim { skater = 0 
		targetID = world 
		targetOffset = <t_off> 
		positionOffset = <p_off> 
		play_hold 
		frames = 1 
		virtual_cam 
	} 
ENDSCRIPT

SCRIPT face_map_exit 
	StopEyeToyCheck 
	<new_script> <...> 
ENDSCRIPT

SCRIPT face_map_return_to_cas 
	UnloadCaptureDeviceLibraries 
	
	unload_cas_texture_from_profile 
	SetNetworkMode 
	build_cas_category_menu 
	create_pre_cas_menu 
	cas_setup_rotating_camera 
	skater : SwitchOffBoard 
ENDSCRIPT

SCRIPT face_back_from_net_setup 
	
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ( in_net_setup_flow = 1 ) 
		create_dialog_box { title = "Loading" 
			text = "Please wait..." 
			no_animate 
		} 
		wait 10 gameframes 
		dialog_box_exit 
	ENDIF 
	change in_net_setup_flow = 0 
	create_face_map_menu focus_child = 4 
ENDSCRIPT

SCRIPT create_face_download_menu_from_net_setup 
	
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_dialog_box { title = "Loading" 
		text = "Please wait..." 
		no_animate 
	} 
	wait 10 gameframes 
	dialog_box_exit 
	change in_net_setup_flow = 0 
	create_face_download_menu 
ENDSCRIPT

SCRIPT cancel_face_download_kb 
	destroy_onscreen_keyboard 
	change from_CAS_face_mapping = 0 
	face_back_from_net_setup 
ENDSCRIPT

SCRIPT create_face_download_menu 
	dialog_box_exit 
	change from_CAS_face_mapping = 1 
	face_download_chosen cancel_script = cancel_face_download_kb 
ENDSCRIPT

SCRIPT face_go_to_connection_setup_from_dialog 
	dialog_box_exit 
	change in_net_setup_flow = 1 
	create_dialog_box { title = "Loading" 
		text = "Please wait..." 
		no_animate 
	} 
	wait 10 gameframes 
	dialog_box_exit 
	change InNetOptionsFromFaceDownload = 1 
	change InNetOptionsFromNetPlay = 0 
	create_network_options_menu 
ENDSCRIPT

SCRIPT face_create_net_startup_need_setup_dialog 
	
	create_dialog_box { title = net_status_msg 
		text = <text> 
		buttons = [ { text = " Yes " pad_choose_script = face_go_to_connection_setup_from_dialog } 
			{ text = " No " pad_choose_script = <error_script> } 
		] 
	} 
ENDSCRIPT

SCRIPT net_setup_succeeded_from_cas 
	SetNetworkMode INTERNET_MODE 
	ConnectToInternet success = create_face_download_menu failure = face_back_from_net_setup 
ENDSCRIPT

SCRIPT unload_cas_texture_from_profile 
	
	UnloadTexture cas_texture_from_profile 
ENDSCRIPT

SCRIPT done_download_face 
	unload_cas_texture_from_profile 
	create_face_map_menu focus_child = 2 downloaded_face = downloaded_face 
ENDSCRIPT

SCRIPT retrieve_face_selected 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	FormatText ChecksumName = title_icon "%i_edit_skater" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_new_themed_sub_menu title = "CHOOSE FACE" title_icon = <title_icon> pos = PAIR(80.00000000000, 80.00000000000) 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back done_download_face } 
		] 
	} 
	AddFacesToMenu 
	theme_menu_add_item { text = "Done" 
		pad_choose_script = done_download_face 
		centered = centered 
		last_menu_item = last_menu_item 
	} 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT face_hsv_menu hue = 2.46000003815 sat = 0.89999997616 val = 0.87000000477 left_eye = [ 44 , 40 ] right_eye = [ 87 , 42 ] nose = [ 65 , 70 ] lips = [ 66 , 88 ] 
	
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "FACE COLOR" pos = PAIR(80.00000000000, 80.00000000000) from_cas 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bm=Accept" } 
		] 
	} 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = exit_face_hsv id = sub_menu no_textures = no_textures } } 
		] 
	} 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	load_face_overlay_texture 
	get_default_face_texture_name 
	SetModelFaceTexturePoints face_points = original_model_face_points 
	CopyTexture src = cas_texture_from_profile new = dummy2 
	Generate32BitImage dummy2 renderable = 1 store_original = 1 
	value = ( saved_face_points [ 0 ] . PAIR(1.00000000000, 0.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = left_eye index = 0 newvalue = <value> 
	value = ( saved_face_points [ 0 ] . PAIR(0.00000000000, 1.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = left_eye index = 1 newvalue = <value> 
	value = ( saved_face_points [ 1 ] . PAIR(1.00000000000, 0.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = right_eye index = 0 newvalue = <value> 
	value = ( saved_face_points [ 1 ] . PAIR(0.00000000000, 1.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = right_eye index = 1 newvalue = <value> 
	value = ( saved_face_points [ 2 ] . PAIR(1.00000000000, 0.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = nose index = 0 newvalue = <value> 
	value = ( saved_face_points [ 2 ] . PAIR(0.00000000000, 1.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = nose index = 1 newvalue = <value> 
	value = ( saved_face_points [ 3 ] . PAIR(1.00000000000, 0.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = lips index = 0 newvalue = <value> 
	value = ( saved_face_points [ 3 ] . PAIR(0.00000000000, 1.00000000000) ) 
	CastToInteger value 
	SetArrayElement arrayname = lips index = 1 newvalue = <value> 
	AdjustFaceTextureToModel { texture = dummy2 
		face_points = { 
			left_eye = <left_eye> 
			right_eye = <right_eye> 
			nose = <nose> 
			lips = <lips> 
			width = 128 
			height = 128 
		} 
	} 
	current_face_points = { h = <hue> s = <sat> v = <val> } 
	GetCurrentSkaterProfileIndex 
	GetPlayerFacePoints player = <currentSkaterProfileIndex> 
	<hue> = ( <current_face_points> . h ) 
	<sat> = ( <current_face_points> . s ) 
	<val> = ( <current_face_points> . v ) 
	AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val> 
	CreateScreenElement { 
		type = SpriteElement 
		id = val_bar 
		parent = sub_menu 
		just = [ left center ] 
		pos = PAIR(134.00000000000, 108.00000000000) 
		scale = PAIR(4.00000000000, 2.00000000000) 
		texture = bw_slider 
		rgba = colormenu_bar_unfocus_rgba 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		just = [ left center ] 
		pos = ( PAIR(132.00000000000, 101.00000000000) + ( <val> ) * PAIR(60.00000000000, 0.00000000000) ) 
		scale = colormenu_arrow_scale 
		texture = down_arrow 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		just = [ left center ] 
		pos = ( PAIR(132.00000000000, 115.00000000000) + ( <val> ) * PAIR(60.00000000000, 0.00000000000) ) 
		scale = colormenu_arrow_scale 
		texture = up_arrow 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = sat_bar 
		parent = sub_menu 
		just = [ left center ] 
		pos = PAIR(134.00000000000, 131.00000000000) 
		scale = PAIR(4.00000000000, 2.00000000000) 
		texture = bw_slider 
		rgba = colormenu_bar_unfocus_rgba 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		just = [ left center ] 
		pos = ( PAIR(132.00000000000, 124.00000000000) + ( <sat> ) * PAIR(60.00000000000, 0.00000000000) ) 
		scale = colormenu_arrow_scale 
		texture = down_arrow 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		just = [ left center ] 
		pos = ( PAIR(132.00000000000, 138.00000000000) + ( <sat> ) * PAIR(60.00000000000, 0.00000000000) ) 
		scale = colormenu_arrow_scale 
		texture = up_arrow 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = hue_bar 
		parent = sub_menu 
		just = [ left center ] 
		pos = PAIR(134.00000000000, 154.00000000000) 
		scale = PAIR(4.00000000000, 2.00000000000) 
		texture = bw_slider 
		rgba = colormenu_bar_unfocus_rgba 
	} 
	IF ( <hue> < 181.00000000000 ) 
		<hue> = ( 180.00000000000 + ( <hue> * 18.00000000000 ) ) 
	ELSE 
		<hue> = ( ( <hue> -350 ) * 18.00000000000 ) 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		just = [ left center ] 
		pos = ( PAIR(132.00000000000, 147.00000000000) + ( <hue> ) * PAIR(0.33333000541, 0.00000000000) ) 
		scale = colormenu_arrow_scale 
		texture = down_arrow 
		z_priority = 10 
		rgba = [ 128 128 128 128 ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		just = [ left center ] 
		pos = ( PAIR(132.00000000000, 161.00000000000) + ( <hue> ) * PAIR(0.33333000541, 0.00000000000) ) 
		scale = colormenu_arrow_scale 
		z_priority = 10 
		texture = up_arrow 
		rgba = [ 128 128 128 128 ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		texture = white2 
		pos = PAIR(320.00000000000, 87.00000000000) 
		scale = 30 
		just = [ left top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	get_default_face_texture_name 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		id = temp_preview_overlay 
		just = [ left top ] 
		pos = PAIR(0.15000000596, 0.07999999821) 
		scale = PAIR(0.05999999866, 0.06100000069) 
		texture = <overlayName> 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		id = temp_preview 
		just = [ left top ] 
		pos = PAIR(22.00000000000, 27.00000000000) 
		scale = PAIR(0.69999998808, 0.69999998808) 
		texture = dummy2 
		rgba = [ 128 128 128 128 ] 
		z_priority = 9 
	} 
	Theme_GetPauseBarColor return_value = bar_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		local_id = val_highlight 
		z_priority = 2 
		pos = PAIR(178.00000000000, 108.00000000000) 
		scale = PAIR(5.50000000000, 0.85000002384) 
		texture = roundbar_middle 
		rgba = <bar_rgba> 
	} 
	DoScreenElementMorph id = <id> alpha = 0 time = 0 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		local_id = sat_highlight 
		z_priority = 2 
		pos = PAIR(178.00000000000, 131.00000000000) 
		scale = PAIR(5.50000000000, 0.85000002384) 
		texture = roundbar_middle 
		rgba = <bar_rgba> 
	} 
	DoScreenElementMorph id = <id> alpha = 0 time = 0 
	CreateScreenElement { 
		type = SpriteElement 
		parent = sub_menu 
		local_id = hue_highlight 
		z_priority = 2 
		pos = PAIR(178.00000000000, 154.00000000000) 
		scale = PAIR(5.50000000000, 0.85000002384) 
		texture = roundbar_middle 
		rgba = <bar_rgba> 
	} 
	DoScreenElementMorph id = <id> alpha = 0 time = 0 
	DoScreenElementMorph id = { sub_menu child = 2 } time = 0 alpha = 0 
	DoScreenElementMorph id = { sub_menu child = 3 } time = 0 alpha = 0 
	DoScreenElementMorph id = { sub_menu child = 5 } time = 0 alpha = 0 
	DoScreenElementMorph id = { sub_menu child = 6 } time = 0 alpha = 0 
	DoScreenElementMorph id = { sub_menu child = 8 } time = 0 alpha = 0 
	DoScreenElementMorph id = { sub_menu child = 9 } time = 0 alpha = 0 
	theme_menu_add_item text = "VAL.     " scale = PAIR(1.20000004768, 0.80000001192) id = match_val focus_script = face_hsv_focus focus_params = { type = val } unfocus_script = face_hsv_unfocus unfocus_params = { type = val } pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = { type = val id = sub_menu } pad_left_script = face_hsv_decrease pad_left_params = { type = val id = sub_menu } text_spacing = 2.00000000000 
	theme_menu_add_item text = "SAT.     " scale = PAIR(1.20000004768, 0.80000001192) id = match_sat focus_script = face_hsv_focus focus_params = { type = sat } unfocus_script = face_hsv_unfocus unfocus_params = { type = sat } pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = { type = sat id = sub_menu } pad_left_script = face_hsv_decrease pad_left_params = { type = sat id = sub_menu } text_spacing = 2.00000000000 
	theme_menu_add_item text = "HUE     " scale = PAIR(1.20000004768, 0.80000001192) id = match_hue focus_script = face_hsv_focus focus_params = { type = hue } unfocus_script = face_hsv_unfocus unfocus_params = { type = hue } pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = { type = hue id = sub_menu } pad_left_script = face_hsv_decrease pad_left_params = { type = hue id = sub_menu } text_spacing = 2.00000000000 
	theme_menu_add_item text = "Reset To Default" pad_choose_script = reset_face_hsv pad_choose_params = { id = sub_menu } centered = 1 ignore_width 
	theme_menu_add_item text = "Done" pad_choose_script = exit_face_hsv pad_choose_params = { id = sub_menu no_textures = no_textures } last_menu_item = 1 
	IF GotParam no_animate 
		finish_themed_sub_menu time = 0.00000000000 
	ELSE 
		finish_themed_sub_menu 
	ENDIF 
	CreateScreenElement { 
		type = textBlockElement 
		parent = current_menu_anchor 
		id = directions_text 
		text = "Adjust your face color so that it blends\\n seamlessly with the surrounding skin" 
		pos = PAIR(320.00000000000, 368.00000000000) 
		dims = PAIR(640.00000000000, 60.00000000000) 
		font = small 
		scale = 0.89999997616 
		rgba = <rgba> 
		line_spacing = 0.64999997616 
		z_priority = 5 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = directions_box 
		texture = myf_box_mid 
		pos = PAIR(320.00000000000, 370.00000000000) 
		scale = PAIR(12.00000000000, 1.20000004768) 
		just = [ center center ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	GetStackedScreenElementPos X id = <id> 
	GetScreenElementPosition id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_right 
		pos = <pos> 
		scale = PAIR(1.00000000000, 1.20000004768) 
		just = [ left top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_left 
		pos = <ScreenElementPos> 
		scale = PAIR(1.00000000000, 1.20000004768) 
		just = [ right top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
ENDSCRIPT

SCRIPT reset_face_hsv 
	get_default_face_texture_name 
	AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val> 
	
	IF ( <hue> < 181.00000000000 ) 
		<hue> = ( 180.00000000000 + ( <hue> * 18.00000000000 ) ) 
	ELSE 
		<hue> = ( ( <hue> -350 ) * 18.00000000000 ) 
	ENDIF 
	SetScreenElementProps { id = { <id> child = 2 } 
		pos = ( PAIR(130.00000000000, 103.00000000000) + PAIR(60.00000000000, 0.00000000000) * <val> ) 
	} 
	SetScreenElementProps { id = { <id> child = 3 } 
		pos = ( PAIR(130.00000000000, 117.00000000000) + PAIR(60.00000000000, 0.00000000000) * <val> ) 
	} 
	SetScreenElementProps { id = { <id> child = 5 } 
		pos = ( PAIR(130.00000000000, 126.00000000000) + PAIR(60.00000000000, 0.00000000000) * <sat> ) 
	} 
	SetScreenElementProps { id = { <id> child = 6 } 
		pos = ( PAIR(130.00000000000, 140.00000000000) + PAIR(60.00000000000, 0.00000000000) * <sat> ) 
	} 
	SetScreenElementProps { id = { <id> child = 8 } 
		pos = ( PAIR(130.00000000000, 149.00000000000) + <hue> * PAIR(0.33333000541, 0.00000000000) ) 
	} 
	SetScreenElementProps { id = { <id> child = 9 } 
		pos = ( PAIR(130.00000000000, 163.00000000000) + <hue> * PAIR(0.33333000541, 0.00000000000) ) 
	} 
ENDSCRIPT

SCRIPT face_hsv_focus 
	<text_rgba> = [ 0 , 0 , 0 , 128 ] 
	IF ( <type> = hue ) 
		DoScreenElementMorph id = { sub_menu child = 8 } time = 0 alpha = 1 
		DoScreenElementMorph id = { sub_menu child = 9 } time = 0 alpha = 1 
		SetScreenElementProps { 
			id = { sub_menu child = 7 } 
			rgba = [ 200 100 100 118 ] 
		} 
		DoScreenElementMorph id = { sub_menu child = hue_highlight } time = 0 alpha = 1 
		SetScreenElementProps { 
			id = { match_hue child = 0 } 
			rgba = <text_rgba> 
		} 
	ENDIF 
	IF ( <type> = sat ) 
		DoScreenElementMorph id = { sub_menu child = 5 } time = 0 alpha = 1 
		DoScreenElementMorph id = { sub_menu child = 6 } time = 0 alpha = 1 
		SetScreenElementProps { 
			id = { sub_menu child = 4 } 
			rgba = colormenu_bar_focus_rgba 
		} 
		DoScreenElementMorph id = { sub_menu child = sat_highlight } time = 0 alpha = 1 
		SetScreenElementProps { 
			id = { match_sat child = 0 } 
			rgba = <text_rgba> 
		} 
	ENDIF 
	IF ( <type> = val ) 
		DoScreenElementMorph id = { sub_menu child = 2 } time = 0 alpha = 1 
		DoScreenElementMorph id = { sub_menu child = 3 } time = 0 alpha = 1 
		SetScreenElementProps { 
			id = { sub_menu child = 1 } 
			rgba = colormenu_bar_focus_rgba 
		} 
		DoScreenElementMorph id = { sub_menu child = val_highlight } time = 0 alpha = 1 
		SetScreenElementProps { 
			id = { match_val child = 0 } 
			rgba = <text_rgba> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT face_hsv_unfocus 
	<text_rgba> = [ 128 , 128 , 128 , 128 ] 
	IF ( <type> = hue ) 
		DoScreenElementMorph id = { sub_menu child = 8 } time = 0 alpha = 0 
		DoScreenElementMorph id = { sub_menu child = 9 } time = 0 alpha = 0 
		SetScreenElementProps { 
			id = { sub_menu child = 7 } 
			rgba = colormenu_bar_unfocus_rgba 
		} 
		DoScreenElementMorph id = { sub_menu child = hue_highlight } time = 0 alpha = 0 
		SetScreenElementProps { 
			id = { match_hue child = 0 } 
			rgba = <text_rgba> 
		} 
	ENDIF 
	IF ( <type> = sat ) 
		DoScreenElementMorph id = { sub_menu child = 5 } time = 0 alpha = 0 
		DoScreenElementMorph id = { sub_menu child = 6 } time = 0 alpha = 0 
		SetScreenElementProps { 
			id = { sub_menu child = 4 } 
			rgba = colormenu_bar_unfocus_rgba 
		} 
		DoScreenElementMorph id = { sub_menu child = sat_highlight } time = 0 alpha = 0 
		SetScreenElementProps { 
			id = { match_sat child = 0 } 
			rgba = <text_rgba> 
		} 
	ENDIF 
	IF ( <type> = val ) 
		DoScreenElementMorph id = { sub_menu child = 2 } time = 0 alpha = 0 
		DoScreenElementMorph id = { sub_menu child = 3 } time = 0 alpha = 0 
		SetScreenElementProps { 
			id = { sub_menu child = 1 } 
			rgba = colormenu_bar_unfocus_rgba 
		} 
		DoScreenElementMorph id = { sub_menu child = val_highlight } time = 0 alpha = 0 
		SetScreenElementProps { 
			id = { match_val child = 0 } 
			rgba = <text_rgba> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT exit_face_hsv 
	IF ObjectExists id = temp_preview 
		DestroyScreenElement id = temp_preview 
	ENDIF 
	IF ObjectExists id = temp_preview_overlay 
		DestroyScreenElement id = temp_preview_overlay 
	ENDIF 
	GetScreenElementPosition { id = { <id> child = 8 } } 
	<current_hue> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) * 3.00000000000 ) 
	IF ( <current_hue> < 181.00000000000 ) 
		<current_hue> = ( 350.00000000000 + ( <current_hue> / 18.00000000000 ) ) 
	ELSE 
		<current_hue> = ( ( <current_hue> -180.00000000000 ) / 18.00000000000 ) 
	ENDIF 
	GetScreenElementPosition { id = { <id> child = 5 } } 
	<current_sat> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) / 60.00000000000 ) 
	GetScreenElementPosition { id = { <id> child = 2 } } 
	<current_val> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) / 60.00000000000 ) 
	unload_face_overlay_texture 
	
	UnloadTexture "dummy2" 
	GetCurrentSkaterProfileIndex 
	GetPlayerFacePoints player = <currentSkaterProfileIndex> 
	current_face_points = { <current_face_points> h = <current_hue> s = <current_sat> v = <current_val> } 
	SetPlayerFacePoints player = <currentSkaterProfileIndex> face_points = <current_face_points> 
	RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board 
	create_face_map_menu <...> focus_child = 4 
ENDSCRIPT

SCRIPT load_face_overlay_texture 
	get_default_face_texture_name 
	LoadTexture <overlayPath> 
	SetFaceMassageTextureOverlay <overlayName> 
ENDSCRIPT

SCRIPT unload_face_overlay_texture 
	get_default_face_texture_name 
	UnloadTexture <overlayPath> 
ENDSCRIPT

SCRIPT face_hsv_increase 
	GetScreenElementPosition { id = { <id> child = 8 } } 
	<current_hue> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) * 3.00000000000 ) 
	GetScreenElementPosition { id = { <id> child = 5 } } 
	<current_sat> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) / 60.00000000000 ) 
	GetScreenElementPosition { id = { <id> child = 2 } } 
	<current_val> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) / 60.00000000000 ) 
	IF ( <type> = hue ) 
		<current_hue> = ( <current_hue> + 6.00000000000 ) 
		IF ( <current_hue> > 360 ) 
			<current_hue> = ( <current_hue> -6.00000000000 ) 
		ELSE 
			SetScreenElementProps { id = { <id> child = 8 } 
				pos = ( PAIR(130.00000000000, 149.00000000000) + ( <current_hue> ) * PAIR(0.33333000541, 0.00000000000) ) 
			} 
			SetScreenElementProps { id = { <id> child = 9 } 
				pos = ( PAIR(130.00000000000, 163.00000000000) + ( <current_hue> ) * PAIR(0.33333000541, 0.00000000000) ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <type> = sat ) 
		<current_sat> = ( <current_sat> + 0.01999999955 ) 
		IF ( <current_sat> > 2.00000000000 ) 
			<current_sat> = ( <current_sat> -0.01999999955 ) 
		ELSE 
			SetScreenElementProps { id = { <id> child = 5 } 
				pos = ( PAIR(130.00000000000, 126.00000000000) + ( <current_sat> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
			SetScreenElementProps { id = { <id> child = 6 } 
				pos = ( PAIR(130.00000000000, 140.00000000000) + ( <current_sat> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <type> = val ) 
		<current_val> = ( <current_val> + 0.01999999955 ) 
		IF ( <current_val> > 2.00000000000 ) 
			<current_val> = ( <current_val> -0.01999999955 ) 
		ELSE 
			SetScreenElementProps { id = { <id> child = 2 } 
				pos = ( PAIR(130.00000000000, 103.00000000000) + ( <current_val> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
			SetScreenElementProps { id = { <id> child = 3 } 
				pos = ( PAIR(130.00000000000, 117.00000000000) + ( <current_val> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <current_hue> < 181.00000000000 ) 
		<current_hue> = ( 350.00000000000 + ( <current_hue> / 18.00000000000 ) ) 
	ELSE 
		<current_hue> = ( ( <current_hue> -180.00000000000 ) / 18.00000000000 ) 
	ENDIF 
	AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val> 
ENDSCRIPT

SCRIPT face_hsv_decrease 
	GetScreenElementPosition { id = { <id> child = 8 } } 
	<current_hue> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) * 3.00000000000 ) 
	GetScreenElementPosition { id = { <id> child = 5 } } 
	<current_sat> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) / 60.00000000000 ) 
	GetScreenElementPosition { id = { <id> child = 2 } } 
	<current_val> = ( ( ( ( <ScreenElementPos> ) . PAIR(1.00000000000, 0.00000000000) ) -130.00000000000 ) / 60.00000000000 ) 
	IF ( <type> = hue ) 
		<current_hue> = ( <current_hue> -6.00000000000 ) 
		IF ( <current_hue> < 0 ) 
			<current_hue> = ( <current_hue> + 6.00000000000 ) 
		ELSE 
			SetScreenElementProps { id = { <id> child = 8 } 
				pos = ( PAIR(130.00000000000, 149.00000000000) + ( <current_hue> ) * PAIR(0.33333000541, 0.00000000000) ) 
			} 
			SetScreenElementProps { id = { <id> child = 9 } 
				pos = ( PAIR(130.00000000000, 163.00000000000) + ( <current_hue> ) * PAIR(0.33333000541, 0.00000000000) ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <type> = sat ) 
		<current_sat> = ( <current_sat> -0.01999999955 ) 
		IF ( <current_sat> < 0 ) 
			<current_sat> = ( <current_sat> + 0.01999999955 ) 
		ELSE 
			SetScreenElementProps { id = { <id> child = 5 } 
				pos = ( PAIR(130.00000000000, 126.00000000000) + ( <current_sat> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
			SetScreenElementProps { id = { <id> child = 6 } 
				pos = ( PAIR(130.00000000000, 140.00000000000) + ( <current_sat> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <type> = val ) 
		<current_val> = ( <current_val> -0.01999999955 ) 
		IF ( <current_val> < 0 ) 
			<current_val> = ( <current_val> + 0.01999999955 ) 
		ELSE 
			SetScreenElementProps { id = { <id> child = 2 } 
				pos = ( PAIR(130.00000000000, 103.00000000000) + ( <current_val> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
			SetScreenElementProps { id = { <id> child = 3 } 
				pos = ( PAIR(130.00000000000, 117.00000000000) + ( <current_val> ) * PAIR(60.00000000000, 0.00000000000) ) 
			} 
		ENDIF 
	ENDIF 
	IF ( <current_hue> < 181.00000000000 ) 
		<current_hue> = ( 350.00000000000 + ( <current_hue> / 18.00000000000 ) ) 
	ELSE 
		<current_hue> = ( ( <current_hue> -180.00000000000 ) / 18.00000000000 ) 
	ENDIF 
	AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val> 
ENDSCRIPT

SCRIPT face_skin_menu 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "SKIN COLOR" pos = PAIR(80.00000000000, 90.00000000000) from_cas 
	theme_background pos = PAIR(180.00000000000, 87.00000000000) width = 2.04999995232 num_parts = 3 parent = current_menu_anchor 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\bn=Back" } 
			{ text = "\\bm=Accept" } 
			{ text = "\\bs/\\bt = Rotate" } 
		] 
	} 
	SetScreenElementProps { 
		id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = exit_face_skin id = sub_menu no_textures = no_textures } } 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
		] 
	} 
	Theme_GetUnhighlightedTextColor return_value = rgba 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	IF ( <is_male> = 1 ) 
		<head_part> = skater_m_head 
	ELSE 
		<head_part> = skater_f_head 
	ENDIF 
	colormenu_add_options_to_menu part = <head_part> from_caf = 1 text_pos = PAIR(0.00000000000, -4.00000000000) icon_pos = PAIR(115.00000000000, -4.00000000000) arrow_pos_up = PAIR(100.00000000000, 4.00000000000) arrow_pos_down = PAIR(100.00000000000, -12.00000000000) bar_pos = PAIR(93.00000000000, -3.00000000000) 
	SetScreenElementLock id = current_menu off 
	theme_menu_add_item text = "Reset To Default" no_bg centered = 1 ignore_width static_width = 500 highlight_bar_pos = PAIR(82.00000000000, -7.00000000000) highlight_bar_scale = PAIR(1.89999997616, 0.69999998808) pad_choose_script = colormenu_reset_to_default pad_choose_params = { part = <head_part> } 
	theme_menu_add_item text = "Done" no_bg ignore_width centered = 1 static_width = 500 highlight_bar_pos = PAIR(82.00000000000, -7.00000000000) highlight_bar_scale = PAIR(1.89999997616, 0.69999998808) pad_choose_script = exit_face_skin pad_choose_params = { id = sub_menu no_textures = no_textures } last_menu_item = 1 
	finish_themed_sub_menu 
	CreateScreenElement { 
		type = textBlockElement 
		parent = current_menu_anchor 
		id = directions_text 
		text = "Adjust the color of the skin on your\\n entire body as desired" 
		pos = PAIR(320.00000000000, 668.00000000000) 
		dims = PAIR(640.00000000000, 60.00000000000) 
		font = small 
		scale = 0.89999997616 
		rgba = <rgba> 
		line_spacing = 0.64999997616 
		z_priority = 5 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = directions_box 
		texture = myf_box_mid 
		pos = PAIR(320.00000000000, 670.00000000000) 
		scale = PAIR(12.00000000000, 1.20000004768) 
		just = [ center center ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	DoScreenElementMorph id = directions_text time = 0.20000000298 pos = PAIR(320.00000000000, 368.00000000000) 
	DoScreenElementMorph id = directions_box time = 0.20000000298 pos = PAIR(320.00000000000, 370.00000000000) 
	DoScreenElementMorph id = bg_box_vmenu time = 0.00000000000 pos = PAIR(180.00000000000, 587.00000000000) 
	DoScreenElementMorph id = bg_box_vmenu time = 0.20000000298 pos = PAIR(180.00000000000, 87.00000000000) 
ENDSCRIPT

SCRIPT exit_face_skin 
	create_face_map_menu <...> focus_child = 5 
ENDSCRIPT

SCRIPT face_map_menu scale = 2 
	
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = containerElement 
		parent = root_window 
		id = face_map_menu_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = face_map_menu_anchor alias = current_menu_anchor 
	create_helper_text generic_helper_text_up_down_left_right 
	unpauseskaters 
	SetScreenElementProps { id = current_menu_anchor 
		event_handlers = [ 
			{ pad_l1 cas_rotate_skater_left } 
			{ pad_r1 cas_rotate_skater_right } 
			{ pad_back generic_menu_pad_back params = { callback = cancel_face_map } } 
		] 
	} 
	build_theme_sub_title title = "FACE MAPPING" from_cas 
	theme_background pos = PAIR(173.00000000000, 85.00000000000) num_parts = 9 parent = current_menu_anchor width = 2.45000004768 
	theme_background pos = PAIR(469.00000000000, 85.00000000000) num_parts = 9 parent = current_menu_anchor width = 2.45000004768 id = bg_box_vmenu2 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba 
	CreateScreenElement { 
		type = containerElement 
		parent = current_menu_anchor 
		id = face_anchor 
		pos = PAIR(45.00000000000, 95.00000000000) 
		dims = PAIR(256.00000000000, 256.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = face_anchor 
		text = "Your Face" 
		pos = PAIR(128.00000000000, 5.00000000000) 
		font = small 
		scale = 1.50000000000 
		rgba = <highlight_rgba> 
		z_priority = 5 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = face_anchor 
		pos = PAIR(128.00000000000, 8.00000000000) 
		texture = myf_frame 
		just = [ center center ] 
		scale = PAIR(2.09999990463, 1.00000000000) 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = face_anchor 
		id = your_face 
		pos = PAIR(0.00000000000, 0.00000000000) 
		texture = cas_texture_from_profile 
		just = [ left top ] 
		scale = <scale> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = face_anchor 
		pos = PAIR(128.00000000000, 242.00000000000) 
		texture = myf_frame 
		just = [ center center ] 
		scale = PAIR(2.09999990463, 1.00000000000) 
		z_priority = 4 
		rot_angle = 180 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = face_anchor 
		id = point_arrow 
		texture = myf_crosshair 
		pos = PAIR(85.00000000000, 130.00000000000) 
		alpha = 0 
		z_priority = 900 
		just = [ center center ] 
		rgba = [ 0 0 100 128 ] 
	} 
	CreateScreenElement { 
		type = containerElement 
		parent = current_menu_anchor 
		id = tony_face_anchor 
		pos = PAIR(341.00000000000, 95.00000000000) 
		dims = PAIR(256.00000000000, 256.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = tony_face_anchor 
		text = "Example" 
		pos = PAIR(128.00000000000, 5.00000000000) 
		font = small 
		scale = 1.50000000000 
		rgba = <unhighlight_rgba> 
		z_priority = 5 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tony_face_anchor 
		pos = PAIR(128.00000000000, 8.00000000000) 
		texture = myf_frame 
		just = [ center center ] 
		scale = PAIR(2.09999990463, 1.00000000000) 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tony_face_anchor 
		pos = PAIR(0.00000000000, 0.00000000000) 
		texture = myf_example 
		just = [ left top ] 
		scale = <scale> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tony_face_anchor 
		pos = PAIR(128.00000000000, 242.00000000000) 
		texture = myf_frame 
		just = [ center center ] 
		scale = PAIR(2.09999990463, 1.00000000000) 
		z_priority = 4 
		rot_angle = 180 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = tony_face_anchor 
		id = tony_arrow 
		texture = myf_crosshair 
		pos = PAIR(85.00000000000, 130.00000000000) 
		alpha = 0 
		z_priority = 900 
		just = [ center center ] 
		rgba = [ 100 0 0 128 ] 
		scale = 1.39999997616 
	} 
	CreateScreenElement { 
		type = textBlockElement 
		parent = current_menu_anchor 
		id = directions_text 
		text = "" 
		pos = PAIR(320.00000000000, 368.00000000000) 
		dims = PAIR(640.00000000000, 60.00000000000) 
		font = small 
		scale = 0.89999997616 
		rgba = <unhighlight_rgba> 
		line_spacing = 0.64999997616 
		z_priority = 5 
		just = [ center center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_mid 
		pos = PAIR(320.00000000000, 370.00000000000) 
		scale = PAIR(12.00000000000, 1.20000004768) 
		just = [ center center ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	GetStackedScreenElementPos X id = <id> 
	GetScreenElementPosition id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_right 
		pos = <pos> 
		scale = PAIR(1.00000000000, 1.20000004768) 
		just = [ left top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = myf_box_left 
		pos = <ScreenElementPos> 
		scale = PAIR(1.00000000000, 1.20000004768) 
		just = [ right top ] 
		rgba = <highlight_rgba> 
		z_priority = 5 
	} 
	FireEvent type = focus target = current_menu_anchor 
	KillSpawnedScript name = get_face_points 
	spawnscript get_face_points 
ENDSCRIPT

SCRIPT cancel_face_map 
	KillSpawnedScript name = get_face_points 
	create_face_map_menu no_textures focus_child = 3 
ENDSCRIPT

SCRIPT get_face_points scale = 2 
	Theme_GetHighlightedTextColor return_value = highlight_rgba 
	left_eye = [ 0 0 ] 
	right_eye = [ 0 0 ] 
	nose = [ 0 0 ] 
	lips = [ 0 0 ] 
	GetArraySize default_face_points 
	DoScreenElementMorph id = point_arrow alpha = 1 
	DoScreenElementMorph id = tony_arrow alpha = 1 
	RunScriptOnScreenElement id = point_arrow blink_tony_face_arrow 
	IF ( face_map_points_saved = 1 ) 
		create_saved_face_points highlight_rgba = <highlight_rgba> 
	ENDIF 
	index = 0 
	BEGIN 
		IF ( face_map_points_saved = 0 ) 
			pos = ( ( default_face_points [ <index> ] . pos ) * <scale> ) 
		ELSE 
			FormatText ChecksumName = point_id "point%i" i = <index> 
			IF ScreenElementExists id = <point_id> 
				DestroyScreenElement id = <point_id> 
			ENDIF 
			pos = ( ( saved_face_points [ <index> ] ) * <scale> ) 
		ENDIF 
		tony_pos = ( ( tony_face_points [ <index> ] ) * <scale> ) 
		DoScreenElementMorph id = point_arrow pos = <pos> 
		DoScreenElementMorph id = tony_arrow pos = <tony_pos> 
		RunScriptOnScreenElement adjust_face_point id = point_arrow params = { pos = <pos> } 
		FormatText textname = directions "Select %i\\nusing the keyboard and press \\bm" i = ( default_face_points [ <index> ] . name ) 
		SetScreenElementProps id = directions_text text = <directions> 
		WaitForEvent type = pad_choose 
		KillSpawnedScript name = adjust_face_point 
		GetScreenElementPosition id = point_arrow 
		face_x = ( ( <ScreenElementPos> . PAIR(1.00000000000, 0.00000000000) + 16 ) * ( 1.00000000000 / <scale> ) ) 
		face_y = ( ( <ScreenElementPos> . PAIR(0.00000000000, 1.00000000000) + 16 ) * ( 1.00000000000 / <scale> ) ) 
		CastToInteger face_x 
		CastToInteger face_y 
		new_pos = ( PAIR(1.00000000000, 0.00000000000) * <face_x> + PAIR(0.00000000000, 1.00000000000) * <face_y> ) 
		SWITCH <index> 
			CASE 0 
				SetArrayElement arrayname = left_eye index = 0 newvalue = <face_x> 
				SetArrayElement arrayname = left_eye index = 1 newvalue = <face_y> 
			CASE 1 
				SetArrayElement arrayname = right_eye index = 0 newvalue = <face_x> 
				SetArrayElement arrayname = right_eye index = 1 newvalue = <face_y> 
			CASE 2 
				SetArrayElement arrayname = nose index = 0 newvalue = <face_x> 
				SetArrayElement arrayname = nose index = 1 newvalue = <face_y> 
			CASE 3 
				SetArrayElement arrayname = lips index = 0 newvalue = <face_x> 
				SetArrayElement arrayname = lips index = 1 newvalue = <face_y> 
		ENDSWITCH 
		saved_face_points2 = saved_face_points 
		SetArrayElement arrayname = saved_face_points2 index = <index> newvalue = <new_pos> 
		FormatText ChecksumName = point_id "point%i" i = <index> 
		IF NOT ScreenElementExists id = <point_id> 
			SetScreenElementLock off id = face_anchor 
			CreateScreenElement { 
				type = SpriteElement 
				parent = face_anchor 
				id = <point_id> 
				texture = myf_dot 
				pos = ( <new_pos> * 2 ) 
				z_priority = 800 
				just = [ center center ] 
				rgba = <highlight_rgba> 
				scale = 2 
			} 
		ELSE 
			
		ENDIF 
		index = ( <index> + 1 ) 
		IF ( <index> = <array_size> ) 
			BREAK 
		ENDIF 
	REPEAT 
	change face_map_points_saved = 1 
	SetScreenElementProps id = directions_text text = "Mapping Face Now..." 
	DoScreenElementMorph id = directions_text scale = 1.50000000000 
	DoScreenElementMorph id = point_arrow alpha = 0 
	wait 2 gameframe 
	GetCurrentSkaterProfileIndex 
	SetPlayerFacePoints { 
		player = <currentSkaterProfileIndex> 
		left_eye = <left_eye> 
		right_eye = <right_eye> 
		nose = <nose> 
		lips = <lips> 
		width = 128 
		height = 128 
	} 
	GetCurrentSkaterProfileIndex 
	RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board 
	create_face_map_menu no_new_textures focus_child = 3 
ENDSCRIPT

SCRIPT clear_face_texture_from_profile 
	GetCurrentSkaterProfileIndex 
	ClearPlayerFaceTexture player = <currentSkaterProfileIndex> 
	RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board 
ENDSCRIPT

SCRIPT blink_tony_face_arrow 
	BEGIN 
		DoMorph alpha = 1 
		wait 0.30000001192 seconds 
		DoMorph alpha = 0.60000002384 time = 0.30000001192 
	REPEAT 
ENDSCRIPT

SCRIPT adjust_face_point pos = PAIR(320.00000000000, 240.00000000000) 
	controller = 0 
	got_controller = 0 
	BEGIN 
		IF ControllerBoundToSkater controller = <controller> skater = 0 
			got_controller = 1 
			BREAK 
		ENDIF 
		controller = ( <controller> + 1 ) 
	REPEAT 4 
	IF ( got_controller = 0 ) 
		RETURN 
	ENDIF 
	BEGIN 
		GetAnalogueInfo controller = <controller> 
		new_pos = ( <pos> + ( <leftx> * PAIR(1.00000000000, 0.00000000000) + <lefty> * PAIR(0.00000000000, 1.00000000000) ) ) 
		IF ( 0 > <pos> . PAIR(1.00000000000, 0.00000000000) ) 
			IF ( 0 > <leftx> ) 
				new_pos = ( <new_pos> - ( <leftx> * PAIR(2.00000000000, 0.00000000000) ) ) 
			ENDIF 
		ELSE 
			IF ( <pos> . PAIR(1.00000000000, 0.00000000000) > 254 ) 
				IF ( <leftx> > 0 ) 
					new_pos = ( <new_pos> - ( <leftx> * PAIR(2.00000000000, 0.00000000000) ) ) 
				ENDIF 
			ENDIF 
		ENDIF 
		IF ( 0 > <pos> . PAIR(0.00000000000, 1.00000000000) ) 
			IF ( 0 > <lefty> ) 
				new_pos = ( <new_pos> - ( <lefty> * PAIR(0.00000000000, 2.00000000000) ) ) 
			ENDIF 
		ELSE 
			IF ( <pos> . PAIR(0.00000000000, 1.00000000000) > 254 ) 
				IF ( <lefty> > 0 ) 
					new_pos = ( <new_pos> - ( <lefty> * PAIR(0.00000000000, 2.00000000000) ) ) 
				ENDIF 
			ENDIF 
		ENDIF 
		DoMorph pos = <new_pos> 
		pos = <new_pos> 
		wait 2 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT create_saved_face_points scale = 2 
	index = 1 
	SetScreenElementLock off id = face_anchor 
	BEGIN 
		FormatText ChecksumName = point_id "point%i" i = <index> 
		pos = ( ( saved_face_points [ <index> ] ) * <scale> ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = face_anchor 
			id = <point_id> 
			texture = myf_dot 
			pos = <pos> 
			z_priority = 800 
			just = [ center center ] 
			rgba = <highlight_rgba> 
			scale = 2 
		} 
		index = ( <index> + 1 ) 
	REPEAT 3 
ENDSCRIPT

cas_head_index = 10 
SCRIPT get_default_face_texture_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterSex player = <currentSkaterProfileIndex> 
	IF ( <is_male> ) 
		<head_part> = skater_m_head 
		<texturePath> = "faces\\CS_NSN_facemap_male_light" 
		<overlayPath> = "faces\\CS_NSN_Head_gry_alpha" 
		<overlayName> = CS_NSN_Head_gry_alpha 
	ELSE 
		<head_part> = skater_f_head 
		<texturePath> = "faces\\CS_NSN_facemap_female_light" 
		<overlayPath> = "faces\\CS_NSN_Head_f_gry_alpha" 
		<overlayName> = CS_NSN_Head_f_gry_alpha 
	ENDIF 
	<hue> = 2.46000003815 
	<sat> = 0.89999997616 
	<val> = 0.87000000477 
	RETURN texturePath = <texturePath> overlayPath = <overlayPath> overlayName = <overlayName> hue = <hue> sat = <sat> val = <val> 
ENDSCRIPT

SCRIPT maybe_load_default_face 
	GetCurrentSkaterProfileIndex 
	IF NOT PlayerFaceIsValid player = <currentSkaterProfileIndex> 
		get_default_face_texture_name 
		IF NOT GotParam texturePath 
			script_assert "no texture path?" 
		ENDIF 
		SetPlayerFaceTexture { 
			player = <currentSkaterProfileIndex> 
			texture = <texturePath> 
		} 
		SetPlayerFacePoints { 
			player = <currentSkaterProfileIndex> 
			left_eye = [ 44 , 40 ] 
			right_eye = [ 87 , 42 ] 
			nose = [ 65 , 70 ] 
			lips = [ 66 , 88 ] 
			width = 128 
			height = 128 
		} 
		SetPlayerFaceOverlayTexture { 
			player = <currentSkaterProfileIndex> 
			texture = <overlayPath> 
		} 
		refresh_skater_model 
	ELSE 
		refresh_skater_model 
	ENDIF 
ENDSCRIPT


