
large_menu_titles = 1 
SCRIPT make_new_thpg_menu 
	make_new_menu <...> 
ENDSCRIPT

SCRIPT generic_menu_cleanup 
	destroy_menu_background_title 
	IF ScreenElementExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_menu_background_title 
	IF ScreenElementExists id = bg_container 
		DestroyScreenElement id = bg_container 
	ENDIF 
	thugpro_menu_destroy_title 
	kill_pause_deck 
ENDSCRIPT

SCRIPT kill_menu_background_title 
	IF ScreenElementExists id = bg_container 
		DestroyScreenElement id = bg_container 
	ENDIF 
	IF ScreenElementExists id = menu_title_container 
		DestroyScreenElement id = menu_title_container 
	ENDIF 
	thugpro_menu_destroy_title 
ENDSCRIPT

SCRIPT thugpro_menu_debounce_back 
	Debounce select time = 0.50000000000 
	Debounce left time = 1.50000000000 
ENDSCRIPT

SCRIPT create_menu_background_title { 
		title = "Default Title" 
	} 
	kill_menu_background_title 
	IF ScreenElementExists id = pause_gradient 
		DestroyScreenElement id = pause_gradient 
	ENDIF 
	IF ( <bg_just> = left ) 
		pause_menu_gradient on 
	ELSE 
		pause_menu_gradient on right 
	ENDIF 
	CreateScreenElement { type = ContainerElement parent = root_window id = bg_container } 
	bg_real_just = [ right , bottom ] 
	bg_rot_angle = 0.00000000000 
	SWITCH <bg_just> 
		CASE left 
			bg_real_just = [ center , center ] 
			bg_pos = PAIR(130.00000000000, 320.00000000000) 
			IF LevelIs load_mainmenu 
				bg_texture = bg_board_top 
				bg_rgba = [ 128 128 128 128 ] 
				bg_scale = PAIR(1.00000000000, 1.00000000000) 
				bg_alpha = 1.00000000000 
				bg_rot_angle = -92.00000000000 
				title_pos = PAIR(120.00000000000, 42.00000000000) 
			ELSE 
				bg_texture = bg_gradient 
				bg_rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
				bg_scale = PAIR(-5.00000000000, 2.00000000000) 
				bg_real_just = [ left , center ] 
				bg_alpha = 1 
				bg_pos = PAIR(-80.00000000000, 320.00000000000) 
				title_pos = ( pause_menu_title_pos ) 
			ENDIF 
			IF GotParam title_text_offset 
				title_text_offset = <title_text_offset> 
			ELSE 
				title_text_offset = PAIR(50.00000000000, 24.00000000000) 
			ENDIF 
			IF GotParam title_text_just 
				title_text_just = <title_text_just> 
			ELSE 
				title_text_just = [ left , center ] 
			ENDIF 
		CASE center 
		CASE right_nobg 
			bg_texture = white 
			bg_rgba = [ 128 128 128 128 ] 
			bg_alpha = 0.00000000000 
			bg_scale = 1.00000000000 
			bg_pos = PAIR(520.00000000000, 300.00000000000) 
			bg_real_just = [ center , center ] 
			bg_rot_angle = 0 
			IF GotParam title_text_offset 
				title_text_offset = <title_text_offset> 
			ELSE 
				title_text_offset = PAIR(0.00000000000, 0.00000000000) 
			ENDIF 
			IF GotParam title_text_just 
				title_text_just = <title_text_just> 
			ELSE 
				title_text_just = [ center center ] 
			ENDIF 
			IF GotParam title_pos 
				title_pos = <title_pos> 
			ELSE 
				title_pos = PAIR(480.00000000000, 52.50000000000) 
			ENDIF 
		CASE right_scroll 
			bg_rgba = [ 128 128 128 128 ] 
			bg_alpha = 1.00000000000 
			bg_scale = 1.00000000000 
			bg_pos = PAIR(520.00000000000, 300.00000000000) 
			bg_real_just = [ center , center ] 
			bg_rot_angle = -92.00000000000 
			bg_texture = bg_board_top 
			title_pos = PAIR(480.00000000000, 52.50000000000) 
			IF GotParam title_text_offset 
				title_text_offset = <title_text_offset> 
			ELSE 
				title_text_offset = PAIR(0.00000000000, 0.00000000000) 
			ENDIF 
			IF GotParam title_text_just 
				title_text_just = <title_text_just> 
			ELSE 
				title_text_just = [ center center ] 
			ENDIF 
		CASE right 
			bg_texture = bg_board_top 
			bg_rgba = [ 128 128 128 128 ] 
			bg_alpha = 1.00000000000 
			bg_pos = PAIR(500.00000000000, 300.00000000000) 
			bg_real_just = [ center , center ] 
			bg_rot_angle = -90.00000000000 
			title_pos = PAIR(480.00000000000, 42.00000000000) 
			IF GotParam title_text_offset 
				title_text_offset = <title_text_offset> 
			ELSE 
				title_text_offset = PAIR(440.00000000000, 2.00000000000) 
			ENDIF 
			IF GotParam title_text_just 
				title_text_just = <title_text_just> 
			ELSE 
				title_text_just = [ right , top ] 
			ENDIF 
		CASE right_lobby 
			bg_texture = bg_board_top 
			bg_rgba = [ 128 128 128 128 ] 
			bg_alpha = 1.00000000000 
			bg_pos = PAIR(540.00000000000, 300.00000000000) 
			bg_real_just = [ center , center ] 
			bg_rot_angle = -90.00000000000 
			title_pos = PAIR(530.00000000000, 64.00000000000) 
			IF GotParam title_text_offset 
				title_text_offset = <title_text_offset> 
			ELSE 
				title_text_offset = PAIR(0.00000000000, 0.00000000000) 
			ENDIF 
			IF GotParam title_text_just 
				title_text_just = <title_text_just> 
			ELSE 
				title_text_just = [ center center ] 
			ENDIF 
		DEFAULT 
			bg_texture = bg_board_top 
			bg_rgba = [ 128 128 128 128 ] 
			bg_alpha = 1.00000000000 
			bg_scale = PAIR(1.00000000000, 1.00000000000) 
			bg_pos = PAIR(500.00000000000, 300.00000000000) 
			bg_real_just = [ center , center ] 
			bg_rot_angle = -90.00000000000 
			title_pos = PAIR(480.00000000000, 90.00000000000) 
			IF GotParam title_text_offset 
				title_text_offset = <title_text_offset> 
			ELSE 
				title_text_offset = PAIR(440.00000000000, 2.00000000000) 
			ENDIF 
			IF GotParam title_text_just 
				title_text_just = <title_text_just> 
			ELSE 
				title_text_just = [ right , top ] 
			ENDIF 
	ENDSWITCH 
	IF GotParam no_menu_title 
		<title_scale> = 0.00000000000 
	ELSE 
		<title_scale> = PAIR(0.54000002146, 0.54000002146) 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = bg_container 
		id = menu_title_text_container 
		pos = <title_pos> 
	} 
	IF ( ( GotParam pause_menu ) | ( GotParam skateshop_menu ) | ( GotParam show_music_info ) ) 
		IF IsTrue GLOBAL_Music_Mode 
			<track_info_alpha> = 1.00000000000 
			GetValueFromVolume cdvol 
			IF MusicIsPaused 
				<track_info_alpha> = 0.00000000000 
			ELSE 
				IF ( <value> = 0 ) 
					<track_info_alpha> = 0.00000000000 
				ENDIF 
			ENDIF 
		ELSE 
			<track_info_alpha> = 0.00000000000 
		ENDIF 
		IF ( ( GotParam skateshop_menu ) | ( GotParam player_left ) ) 
			<music_just> = [ left top ] 
			<music_pos> = PAIR(-60.00000000000, 0.00000000000) 
			<boombox_scale> = PAIR(-0.60000002384, 0.60000002384) 
			<boombox_pos> = PAIR(12.00000000000, 10.00000000000) 
		ENDIF 
		IF ( ( GotParam pause_menu ) | ( GotParam player_right ) ) 
			<music_just> = [ right top ] 
			<music_pos> = PAIR(705.00000000000, 0.00000000000) 
			<boombox_scale> = PAIR(0.60000002384, 0.60000002384) 
			<boombox_pos> = PAIR(-10.00000000000, 10.00000000000) 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = bg_container 
			id = track_info_container 
			dims = PAIR(10.00000000000, 10.00000000000) 
			pos = <music_pos> 
			alpha = <track_info_alpha> 
			just = <music_just> 
			internal_just = <music_just> 
		} 
		GetCurrentTrack 
		THUGPRO_GetTrackInfo track_num = <current_track> 
		FormatText textName = current_track_text "%t" t = <track_title> 
		FormatText textName = current_artist_text "%a" a = <band> 
		CreateScreenElement { 
			type = TextElement 
			parent = track_info_container 
			local_id = song_name 
			font = small_rus 
			text = <current_track_text> 
			scale = 0.60000002384 
			pos = PAIR(0.00000000000, 8.00000000000) 
			just = <music_just> 
			internal_just = <music_just> 
			rgba = [ 128 128 128 128 ] 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = track_info_container 
			local_id = artist_name 
			font = small_rus 
			text = <current_artist_text> 
			scale = 0.60000002384 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = <music_just> 
			internal_just = <music_just> 
			rgba = [ 90 90 90 128 ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = track_info_container 
			local_id = item_background 
			texture = kyron 
			scale = <boombox_scale> 
			pos = <boombox_pos> 
			alpha = 3.00000000000 
			rgba = [ 100 100 100 128 ] 
		} 
	ENDIF 
	IF ( ( GotParam pause_menu ) | ( GotParam skateshop_menu ) ) 
		IF InNetGame 
			CreateScreenElement { 
				type = TextBlockElement 
				parent = menu_title_text_container 
				id = PAUSE_MENU_EXTRA_TEXT_ID 
				font = newtrickfont 
				text = "" 
				alpha = 0.69999998808 
				scale = 1.00000000000 
				pos = PAIR(40.00000000000, -70.00000000000) 
				dims = PAIR(400.00000000000, 100.00000000000) 
				line_spacing = 0.60000002384 
				just = [ left , center ] 
				internal_just = [ left , center ] 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
				z_priority = 1020 
			} 
		ENDIF 
		IF GotParam pause_menu 
			IF NOT ( ( ( THUGPRO_GlobalThemeInfo ) . PAUSED_TEXTURE ) = white ) 
				RemoveParameter title 
				title = "" 
				CreateScreenElement { 
					type = SpriteElement 
					id = menu_title_paused 
					parent = menu_title_text_container 
					scale = 1.00000000000 
					pos = <title_text_offset> 
					texture = ( ( THUGPRO_GlobalThemeInfo ) . PAUSED_TEXTURE ) 
					just = <title_text_just> 
					internal_just = <title_text_just> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam scrolling_arrows 
		CreateScreenElement { type = ContainerElement parent = bg_container id = arrow_container } 
		CreateScreenElement { 
			type = SpriteElement 
			id = _up_arrow 
			local_id = up_arrow 
			parent = arrow_container 
			scale = 1.00000000000 
			pos = PAIR(390.00000000000, 130.00000000000) 
			texture = up_arrow 
			just = [ left , center ] 
			internal_just = [ left , center ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			id = _down_arrow 
			local_id = down_arrow 
			parent = arrow_container 
			scale = 1.00000000000 
			pos = PAIR(390.00000000000, 340.00000000000) 
			texture = down_arrow 
			just = [ left , center ] 
			internal_just = [ left , center ] 
		} 
	ENDIF 
	IF IsTrue large_menu_titles 
		<menu_title_scale> = 0.60000002384 
		<menu_title_font> = machine 
		GetUpperCaseString <title> 
		<menu_title_text> = <UpperCaseString> 
	ELSE 
		<menu_title_scale> = 0.25000000000 
		<menu_title_font> = boltbt 
		<menu_title_text> = <title> 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		id = menu_title_text 
		parent = menu_title_text_container 
		text = <menu_title_text> 
		font = <menu_title_font> 
		scale = <menu_title_scale> 
		pos = <title_text_offset> 
		just = <title_text_just> 
		internal_just = <title_text_just> 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
		z_priority = 1020 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		id = menu_bg_texture 
		parent = bg_container 
		scale = <bg_scale> 
		alpha = <bg_alpha> 
		pos = <bg_pos> 
		texture = <bg_texture> 
		rgba = <bg_rgba> 
		just = <bg_real_just> 
		rot_angle = <bg_rot_angle> 
	} 
	IF GotParam pause_menu 
		pause_show_deck parent = bg_container fly_in 
	ENDIF 
	IF GotParam soundtrack_menu 
		pause_show_deck boombox parent = bg_container 
	ENDIF 
ENDSCRIPT

SCRIPT make_thpg_menu_item { 
		focus_script = nullscript 
		unfocus_script = nullscript 
		focus_params = { } 
		unfocus_params = { } 
		pad_choose_script = nullscript 
		pad_choose_params = { } 
		pad_back_script = nullscript 
		pad_back_params = { } 
		pad_choose_sound = generic_menu_pad_choose_sound 
		parent_menu_id = current_menu 
		scale = 1 
		alpha_value_unfocus = 1 
		pad_left_script = nullscript 
		pad_right_script = nullscript 
		pad_left_params = { } 
		pad_right_params = { } 
		text = "" 
		dims = PAIR(224.00000000000, 22.00000000000) 
	} 
	Theme_GetHighlightBarColor return_value = bg_color 
	IF NOT GotParam id 
		FormatText ChecksumName = temp_id "%s" s = <text> 
		MangleChecksums a = <pad_choose_script> b = <temp_id> 
		<id> = <mangled_id> 
	ENDIF 
	IF GotParam pad_back_scripts 
		<pad_back_script> = <pad_back_scripts> 
		RemoveParameter pad_back_scripts 
	ENDIF 
	IF GotParam parent_menu_id 
		<parent_id> = <parent_menu_id> 
		RemoveParameter parent_menu_id 
	ENDIF 
	make_thugpro_menu_item <...> 
ENDSCRIPT

SCRIPT thugpro_simple_menu_add_item { 
		focus_script = nullscript 
		unfocus_script = nullscript 
		focus_params = { } 
		unfocus_params = { } 
		pad_choose_script = nullscript 
		pad_back_script = nullscript 
		pad_back_params = { } 
		pad_option_script = nullscript 
		pad_option_params = { } 
		pad_left_script = nullscript 
		pad_left_params = { } 
		pad_right_script = nullscript 
		pad_right_params = { } 
		pad_choose_sound = generic_menu_pad_choose_sound 
		parent = current_menu 
		text = "" 
		just = [ left center ] 
	} 
	IF NOT GotParam id 
		FormatText ChecksumName = temp_id "%s" s = <text> 
		MangleChecksums a = <pad_choose_script> b = <temp_id> 
		<id> = <mangled_id> 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <id> 
		dims = PAIR(200.00000000000, 15.00000000000) 
		event_handlers = [ 
			{ focus thugpro_simple_menu_focus params = { id = <id> } } 
			{ unfocus thugpro_simple_menu_unfocus } 
			{ focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
			{ pad_option <pad_option_script> params = <pad_option_params> } 
			{ pad_left <pad_left_script> params = <pad_left_params> } 
			{ pad_right <pad_right_script> params = <pad_right_params> } 
			{ pad_choose <pad_choose_sound> } 
			{ pad_choose <pad_choose_script> params = ( { id = <id> } + <pad_choose_params> ) } 
		] 
		replace_handlers 
	} 
	<anchor_id> = <id> 
	IF GotParam rgba 
		<text_rgba> = <rgba> 
	ELSE 
		<text_rgba> = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		font = bebas 
		scale = 0.20000000298 
		alpha = 1.00000000000 
		just = <just> 
		internal_just = [ left center ] 
		rgba = <text_rgba> 
		shadow 
		shadow_rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_offs = PAIR(1.00000000000, 1.00000000000) 
		text = <text> 
		pos = PAIR(10.00000000000, -5.00000000000) 
	} 
ENDSCRIPT

SCRIPT thugpro_simple_menu_focus 
	GetTags 
	RunScriptOnScreenElement id = <id> text_twitch_effect2 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.10000002384 
	} 
ENDSCRIPT

SCRIPT thugpro_simple_menu_unfocus 
	GetTags 
	KillSpawnedScript name = text_twitch_effect2 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.00000000000 
	} 
ENDSCRIPT

SCRIPT thugpro_submenu_callback 
	GetTags 
	FireEvent type = unfocus target = current_sub_menu 
	IF NOT GotParam sub_menu_anchor 
		DestroyScreenElement id = current_sub_menu_anchor 
	ELSE 
		DestroyScreenElement id = <sub_menu_anchor> 
	ENDIF 
	FireEvent type = focus target = current_menu 
	DoScreenElementMorph { 
		id = current_menu 
		restore_alpha 
		time = 0.10000000149 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_item_attach_sub_menu_handlers 
	IF GotParam id 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_choose thugpro_create_item_submenu params = { menu_items = <elements> } } 
				{ pad_right thugpro_create_item_submenu params = { menu_items = <elements> } } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_create_item_submenu 
	GetTags 
	IF NOT GotParam no_unfocus 
		FireEvent type = unfocus target = current_menu 
		DoScreenElementMorph { 
			id = current_menu 
			alpha = 0.60000002384 
			time = 0.10000000149 
			remember_alpha 
		} 
	ENDIF 
	thugpro_menu_create { 
		menu_name = sub 
		menu_style = MENU_STYLE_RIGHT_TEST 
		menu_anchor_alias = current_sub_menu_anchor 
		menu_alias = current_sub_menu 
		boxed 
		no_cleanup 
		no_menu_title 
	} 
	SetScreenElementProps { 
		id = current_sub_menu 
		event_handlers = [ 
			{ pad_back thugpro_submenu_callback params = { sub_menu_anchor = current_sub_menu_anchor } } 
			{ pad_left thugpro_submenu_callback params = { sub_menu_anchor = current_sub_menu_anchor } } 
		] 
	} 
	IF GotParam menu_items 
		ForEachIn <menu_items> Do = make_thugpro_menu_item params = { parent_id = current_sub_menu } 
	ENDIF 
	IF NOT GotParam no_unfocus 
		thugpro_menu_finalize parent = current_sub_menu 
	ENDIF 
ENDSCRIPT


