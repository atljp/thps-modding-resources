
current_soundtrack = %"" 
SCRIPT launch_sound_options_menu 
	IF GotParam from_options 
		create_sound_options_menu from_options 
	ELSE 
		IF GotParam from_parked 
			create_sound_options_menu from_parked 
		ELSE 
			create_sound_options_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_sound_options_menu 
	SetMusicVolume MusicVolOutsideBox 
	make_new_themed_sub_menu title = "SOUND OPTIONS" 
	IF LevelIs Load_MainMenu 
		PauseMusic 0 
	ENDIF 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\b6/\\b5 = Adjust Levels" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	IF GotParam from_parked 
		SetScreenElementProps { id = sub_menu 
			event_handlers = [ 
				{ pad_back generic_menu_pad_back params = { callback = sound_options_exit from_parked } } 
			] 
		} 
	ELSE 
		SetScreenElementProps { id = sub_menu 
			event_handlers = [ 
				{ pad_back generic_menu_pad_back params = { callback = sound_options_exit } } 
			] 
		} 
	ENDIF 
	IF GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		song_text = "Random" 
	ELSE 
		song_text = "In Order" 
	ENDIF 
	IF IsTrue ForceAmbientSFXToMusicVolume 
		sound_override = not_focusable 
		song_text = "Level Music!" 
	ENDIF 
	theme_menu_add_item { text = "Songs:" 
		extra_text = <song_text> 
		id = menu_song_order 
		pad_choose_script = toggle_song_order 
		<sound_override> 
	} 
	theme_menu_add_item { text = "Skip Track" 
		id = menu_skip_track 
		focus_script = skip_track_focus 
		unfocus_script = skip_track_unfocus 
		pad_choose_script = skip_track 
		pad_choose_params = { } 
		<sound_override> 
	} 
	IF NOT isxbox 
		IF NOT ( DEMO_BUILD ) 
			theme_menu_add_item { text = "Soundtrack" 
				id = menu_soundtrack 
				pad_choose_script = create_soundtrack_menu 
				pad_choose_params = { } 
				<sound_override> 
			} 
		ENDIF 
	ENDIF 
	IF ( current_soundtrack = %"" ) 
		theme_menu_add_item { text = "Playlist" 
			id = menu_playlist 
			pad_choose_script = create_playlist_menu 
			pad_choose_params = { } 
			<sound_override> 
		} 
	ELSE 
		theme_menu_add_item { text = "Playlist" 
			id = menu_playlist 
			pad_choose_script = nullscript 
			not_focusable = not_focusable 
		} 
	ENDIF 
	theme_menu_add_item { text = "Music Level:" 
		id = menu_music_level 
		focus_script = menu_music_level_focus 
		focus_params = { music_level = music_level } 
		unfocus_script = menu_music_level_unfocus 
		no_sound 
	} 
	theme_menu_add_item { text = "Sound Level:" 
		id = menu_sound_level 
		focus_script = menu_music_level_focus 
		unfocus_script = menu_music_level_unfocus 
		no_sound 
	} 
	theme_menu_add_item { text = "Special Sounds:" 
		id = menu_sound_special 
		extra_text = "" 
		focus_script = menu_music_special_focus 
		unfocus_script = menu_music_special_unfocus 
		pad_choose_script = toggle_special_sounds 
		no_sound 
	} 
	theme_menu_add_item { text = "Music Zones:" 
		id = menu_sound_zones 
		extra_text = "" 
		focus_script = menu_music_special_focus 
		unfocus_script = menu_music_special_unfocus 
		pad_choose_script = toggle_music_zones 
		no_sound 
	} 
	Theme_GetHighlightedTextColor return_value = checkmark_rgba 
	Theme_GetUnhighlightedTextColor return_value = checkbox_rgba 
	CreateScreenElement { 
		type = SpriteElement 
		parent = menu_sound_special 
		texture = checkbox 
		pos = PAIR(130.00000000000, -13.00000000000) 
		just = [ center top ] 
		scale = 0.55000001192 
		rgba = <checkbox_rgba> 
		z_priority = 5 
	} 
	IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <id> 
			id = menu_sound_special_chk 
			texture = checkmark 
			pos = PAIR(25.00000000000, -9.00000000000) 
			just = [ center top ] 
			rgba = <checkmark_rgba> 
			z_priority = 6 
			scale = 1.39999997616 
		} 
	ELSE 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <id> 
			id = menu_sound_special_chk 
			texture = checkmark 
			pos = PAIR(25.00000000000, -7.00000000000) 
			just = [ center top ] 
			rgba = [ 0 0 0 0 ] 
			z_priority = 6 
			scale = 1.39999997616 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = menu_sound_zones 
		texture = checkbox 
		pos = PAIR(130.00000000000, -13.00000000000) 
		just = [ center top ] 
		scale = 0.55000001192 
		rgba = <checkbox_rgba> 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <id> 
		id = menu_sound_zone_chk 
		texture = checkmark 
		pos = PAIR(25.00000000000, -9.00000000000) 
		just = [ center top ] 
		rgba = <checkmark_rgba> 
		z_priority = 6 
		scale = 1.39999997616 
	} 
	refresh_music_zones 
	IF GotParam from_options 
		theme_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit pad_choose_params = { from_options } last_menu_item = 1 
	ELSE 
		IF GotParam from_parked 
			theme_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit pad_choose_params = { from_parked } last_menu_item = 1 
		ELSE 
			theme_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit last_menu_item = 1 
		ENDIF 
	ENDIF 
	sound_options_show_levels 
	add_music_track_text 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = sound_icon no_animate icon_pos = PAIR(565.00000000000, 135.00000000000) icon_scale = 1.14999997616 
	ELSE 
		PauseMusic 
	ENDIF 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT GetTracksEnabled 
	<num_enabled> = 0 
	GetArraySize playlist_tracks 
	index = 0 
	BEGIN 
		IF TrackEnabled <index> 
			<num_enabled> = ( <num_enabled> + 1 ) 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN num_enabled = <num_enabled> 
ENDSCRIPT

SCRIPT add_music_track_text parent = current_menu_anchor pos = PAIR(575.00000000000, 320.00000000000) 
	IF NOT ( current_soundtrack = %"" ) 
		RETURN 
	ENDIF 
	GetTracksEnabled 
	IF ( <num_enabled> = 0 ) 
		RETURN 
	ENDIF 
	IF LevelIs Load_MainMenu 
		pos = PAIR(575.00000000000, 320.00000000000) 
	ENDIF 
	GetCurrentTrack 
	IF ( <current_track> = 999 ) 
		RETURN 
	ENDIF 
	IF NOT TrackEnabled <current_track> 
		RETURN 
	ENDIF 
	CreateScreenElement { 
		type = containerElement 
		parent = <parent> 
		id = music_track_anchor 
		pos = <pos> 
		dims = PAIR(0.00000000000, 0.00000000000) 
	} 
	current_band_text = ( ( playlist_tracks [ <current_track> ] ) . band ) 
	FormatText textName = current_track_text "\'\'%t\'\'" t = ( ( playlist_tracks [ <current_track> ] ) . track_title ) 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	CreateScreenElement { 
		type = textElement 
		parent = music_track_anchor 
		id = music_band_text 
		text = <current_band_text> 
		font = testtitle 
		just = [ right top ] 
		scale = 1 
		pos = PAIR(4.00000000000, 10.00000000000) 
		rgba = <on_rgba> 
		alpha = 0.80000001192 
	} 
	GetScreenElementDims id = music_band_text 
	IF ( <width> > 260 ) 
		<scale> = ( 260.00000000000 / <width> ) 
		DoScreenElementMorph id = music_band_text time = 0 scale = <scale> 
	ENDIF 
	CreateScreenElement { 
		type = textElement 
		parent = music_track_anchor 
		id = music_track_text 
		text = <current_track_text> 
		font = dialog 
		just = [ right top ] 
		scale = 0.80000001192 
		pos = PAIR(4.00000000000, 28.00000000000) 
		rgba = <off_rgba> 
		alpha = 0.80000001192 
	} 
	GetScreenElementDims id = music_track_text 
	IF ( <width> > 250 ) 
		<scale> = ( 0.80000001192 * 250.00000000000 / <width> ) 
		DoScreenElementMorph id = music_track_text time = 0 scale = <scale> 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = music_track_anchor 
		texture = kyron 
		just = [ center center ] 
		scale = 1 
		pos = PAIR(14.00000000000, 15.00000000000) 
		rgba = <on_rgba> 
		alpha = 0.69999998808 
	} 
	IF IsTrue ForceAmbientSFXToMusicVolume 
		DoScreenElementMorph id = music_track_anchor alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT spawn_update_music_track_text 
	IF ScreenElementExists id = music_track_anchor 
		RunScriptOnScreenElement id = music_track_anchor update_music_track_text params = { <...> } 
	ENDIF 
ENDSCRIPT

SCRIPT update_music_track_text 
	IF ScreenElementExists id = music_track_anchor 
		IF IsTrue ForceAmbientSFXToMusicVolume 
			DoScreenElementMorph id = music_track_anchor alpha = 0 
		ENDIF 
		GetScreenElementPosition id = music_track_anchor 
		old_pos = <ScreenElementPos> 
		generic_menu_animate_out force menu = music_track_anchor 
	ELSE 
		RETURN 
	ENDIF 
	IF NOT GotParam current_track 
		wait 2.50000000000 seconds 
		GetCurrentTrack 
	ENDIF 
	IF NOT IsTrue ForceAmbientSFXToMusicVolume 
		DoScreenElementMorph id = music_track_anchor alpha = 1 
	ENDIF 
	current_band_text = ( ( playlist_tracks [ <current_track> ] ) . band ) 
	FormatText textName = current_track_text "\'\'%t\'\'" t = ( ( playlist_tracks [ <current_track> ] ) . track_title ) 
	IF ScreenElementExists id = music_band_text 
		SetScreenElementProps id = music_band_text text = <current_band_text> 
		SetScreenElementProps id = music_track_text text = <current_track_text> 
	ENDIF 
	DoScreenElementMorph id = music_band_text time = 0 scale = 1.00000000000 
	GetScreenElementDims id = music_band_text 
	IF ( <width> > 245 ) 
		<scale> = ( 245.00000000000 / <width> ) 
		DoScreenElementMorph id = music_band_text time = 0 scale = <scale> 
	ENDIF 
	GetScreenElementDims id = music_band_text 
	DoScreenElementMorph id = music_band_text time = 0 scale = 1.00000000000 
	IF ( <width> > 250 ) 
		<scale> = ( 250.00000000000 / <width> ) 
		DoScreenElementMorph id = music_track_text time = 0 scale = <scale> 
	ENDIF 
	IF ScreenElementExists id = music_track_anchor 
		generic_menu_animate_in force menu = music_track_anchor pos = <old_pos> 
	ENDIF 
ENDSCRIPT

SCRIPT update_volume_bar 
	
ENDSCRIPT

SCRIPT boombox_speaker_pulse 
	
ENDSCRIPT

SCRIPT sound_options_exit 
	KillSpawnedScript name = shake_projector 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam just_remove 
		RETURN 
	ENDIF 
	SFX_Music_Volume_Box_Restore_State sound_options 
	IF ( FadeMusicOutRunning = 1 ) 
		SetMusicVolume 0 
	ENDIF 
	IF ( FadeMusicInRunning = 1 ) 
		SetMusicVolume MusicVolOutsideBox 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 1 
		IF GotParam from_parked 
			parked_setup_test_play_menu 
		ELSE 
			create_options_menu 
		ENDIF 
	ELSE 
		PauseMusic 0 
		create_gamesettings_menu 
	ENDIF 
ENDSCRIPT

SCRIPT sound_options_show_levels 
	Theme_GetUnhighlightedTextColor return_value = text_color 
	value = ( MusicVolOutsideBox / 10 ) 
	displayvalue = <value> 
	CastToInteger displayvalue 
	FormatText textName = cdvol "%v" v = <displayvalue> 
	CreateScreenElement { 
		type = textElement 
		parent = menu_music_level 
		font = small 
		just = [ center top ] 
		pos = PAIR(128.00000000000, -17.00000000000) 
		text = <cdvol> 
		rgba = <text_color> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = menu_music_level 
		texture = left_arrow 
		rgba = [ 128 128 128 0 ] 
		pos = PAIR(115.00000000000, -17.00000000000) 
		just = [ right top ] 
		scale = 0.75000000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = menu_music_level 
		texture = right_arrow 
		rgba = [ 128 128 128 0 ] 
		pos = PAIR(143.00000000000, -17.00000000000) 
		just = [ left top ] 
		scale = 0.75000000000 
	} 
	GetValueFromVolume sfxvol 
	FormatText textName = sfxvol "%v" v = <value> 
	CreateScreenElement { 
		type = textElement 
		parent = menu_sound_level 
		font = small 
		just = [ center top ] 
		pos = PAIR(128.00000000000, -17.00000000000) 
		text = <sfxvol> 
		rgba = <text_color> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = menu_sound_level 
		texture = left_arrow 
		rgba = [ 128 128 128 0 ] 
		pos = PAIR(115.00000000000, -17.00000000000) 
		just = [ right top ] 
		scale = 0.75000000000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = menu_sound_level 
		texture = right_arrow 
		rgba = [ 128 128 128 0 ] 
		pos = PAIR(143.00000000000, -17.00000000000) 
		just = [ left top ] 
		scale = 0.75000000000 
	} 
	SetScreenElementProps { 
		id = menu_music_level 
		event_handlers = [ { pad_left menu_turn_music_down } 
			{ pad_right menu_turn_music_up } 
		] 
		replace_handlers 
	} 
	SetScreenElementProps { 
		id = menu_sound_level 
		event_handlers = [ { pad_left menu_turn_sound_down } 
			{ pad_right menu_turn_sound_up } 
		] 
		replace_handlers 
	} 
ENDSCRIPT

SCRIPT toggle_song_order 
	IF NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		SetScreenElementProps id = { menu_song_order child = 3 } text = "Random" 
		PlaySongsRandomly 
		SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
	ELSE 
		SetScreenElementProps id = { menu_song_order child = 3 } text = "In Order" 
		PlaySongsInOrder 
		UnsetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_special_sounds 
	Theme_GetHighlightedTextColor return_value = check_rgba 
	IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
		SetScreenElementProps id = menu_sound_special_chk rgba = [ 0 0 0 0 ] 
		SetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
	ELSE 
		SetScreenElementProps id = menu_sound_special_chk rgba = <check_rgba> 
		UnsetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
		PlaySound HUD_specialtrickAA 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_music_zones 
	IF NOT GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		SetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		change music_was_paused = 0 
	ELSE 
		UnsetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
	ENDIF 
	refresh_music_zones 
	IF NOT LevelIs Load_MainMenu 
		root_window : SetTags need_music_zone_refresh 
	ENDIF 
ENDSCRIPT

SCRIPT refresh_music_zones 
	IF GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		SetScreenElementProps id = menu_sound_zone_chk rgba = [ 0 0 0 0 ] 
	ELSE 
		Theme_GetHighlightedTextColor return_value = check_rgba 
		SetScreenElementProps id = menu_sound_zone_chk rgba = <check_rgba> 
	ENDIF 
ENDSCRIPT

SCRIPT menu_music_level_focus 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 0 
	ENDIF 
	menu_sound_level_focus { music_level = <music_level> <...> } 
ENDSCRIPT

SCRIPT menu_music_level_unfocus 
	menu_sound_level_unfocus <...> 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 1 
	ENDIF 
ENDSCRIPT

SCRIPT menu_music_special_focus 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 0 
	ENDIF 
	main_theme_focus 
ENDSCRIPT

SCRIPT menu_music_special_unfocus 
	main_theme_unfocus 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 1 
	ENDIF 
ENDSCRIPT

SCRIPT skip_track_focus 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 0 
	ENDIF 
	main_theme_focus <...> 
ENDSCRIPT

SCRIPT skip_track_unfocus 
	main_theme_unfocus <...> 
	IF NOT LevelIs Load_MainMenu 
		PauseMusic 1 
	ENDIF 
ENDSCRIPT

SCRIPT menu_sound_level_focus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = arrow_color 
	main_theme_focus 
	IF GotParam music_level 
		value = ( MusicVolOutsideBox / 10 ) 
	ELSE 
		GetValueFromVolume sfxvol 
	ENDIF 
	
	IF ( <value> = 0 ) 
		SetScreenElementProps { id = { <id> child = 5 } rgba = [ 128 128 128 0 ] } 
	ELSE 
		SetScreenElementProps { id = { <id> child = 5 } rgba = <arrow_color> } 
	ENDIF 
	IF ( <value> = 10 ) 
		SetScreenElementProps { id = { <id> child = 6 } rgba = [ 128 128 128 0 ] } 
	ELSE 
		SetScreenElementProps { id = { <id> child = 6 } rgba = <arrow_color> } 
	ENDIF 
ENDSCRIPT

SCRIPT menu_sound_level_unfocus 
	GetTags 
	main_theme_unfocus 
	SetScreenElementProps { id = { <id> child = 5 } rgba = [ 128 128 128 0 ] } 
	SetScreenElementProps { id = { <id> child = 6 } rgba = [ 128 128 128 0 ] } 
ENDSCRIPT

SCRIPT menu_turn_music_down 
	GetTags 
	value = ( MusicVolOutsideBox / 10 ) 
	CastToInteger value 
	IF ( <value> > 0 ) 
		SetScreenElementProps id = { <id> child = 6 } rgba = [ 128 128 128 128 ] 
		<value> = ( <value> - 1 ) 
		sound_options_set_level level = <value> id = menu_music_level type = cdvol 
		menu_horiz_blink_arrow arrow_id = { <id> child = 5 } 
	ENDIF 
	IF ( <value> = 0 ) 
		SetScreenElementProps id = { <id> child = 5 } rgba = [ 128 128 128 0 ] 
		set_music_ambient_state 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_music_up 
	GetTags 
	value = ( MusicVolOutsideBox / 10 ) 
	CastToInteger value 
	IF ( <value> < 10 ) 
		SetScreenElementProps id = { <id> child = 5 } rgba = [ 128 128 128 128 ] 
		<value> = ( <value> + 1 ) 
		sound_options_set_level level = <value> id = menu_music_level type = cdvol 
		menu_horiz_blink_arrow arrow_id = { <id> child = 6 } 
	ENDIF 
	IF ( <value> = 10 ) 
		SetScreenElementProps id = { <id> child = 6 } rgba = [ 128 128 128 0 ] 
	ENDIF 
	IF ( <value> = 1 ) 
		set_music_ambient_state 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_sound_down 
	GetTags 
	GetValueFromVolume sfxvol 
	IF ( <value> > 0 ) 
		SetScreenElementProps id = { <id> child = 6 } rgba = [ 128 128 128 128 ] 
		<value> = ( <value> - 1 ) 
		sound_options_set_level level = <value> id = menu_sound_level type = sfxvol 
		menu_horiz_blink_arrow arrow_id = { <id> child = 5 } 
		PlaySound ollieconc vol = 70 
	ENDIF 
	IF ( <value> = 0 ) 
		SetScreenElementProps id = { <id> child = 5 } rgba = [ 128 128 128 0 ] 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_sound_up 
	GetTags 
	GetValueFromVolume sfxvol 
	IF ( <value> < 10 ) 
		SetScreenElementProps id = { <id> child = 5 } rgba = [ 128 128 128 128 ] 
		<value> = ( <value> + 1 ) 
		sound_options_set_level level = <value> id = menu_sound_level type = sfxvol 
		menu_horiz_blink_arrow arrow_id = { <id> child = 6 } 
		PlaySound ollieconc vol = 70 
	ENDIF 
	IF ( <value> = 10 ) 
		SetScreenElementProps id = { <id> child = 6 } rgba = [ 128 128 128 0 ] 
	ENDIF 
ENDSCRIPT

SCRIPT sound_options_set_level 
	FormatText textName = vol "%v" v = <level> 
	IF GotParam id 
		SetScreenElementProps { 
			id = { <id> child = 4 } 
			text = <vol> 
		} 
	ENDIF 
	<level> = ( <level> * 10 ) 
	SWITCH <type> 
		CASE cdvol 
			SetMusicVolume <level> 
			change MusicVolOutsideBox = <level> 
			change FadeTempMusicVol = <level> 
		CASE sfxvol 
			SetSfxVolume <level> 
	ENDSWITCH 
ENDSCRIPT

SCRIPT skip_track 
	skiptrack 
ENDSCRIPT

SCRIPT pulse_item 
	DoMorph time = 0.05000000075 scale = 0.89999997616 
	DoMorph time = 0.05000000075 scale = 1.00000000000 
ENDSCRIPT

SCRIPT create_playlist_menu 
	IF LevelIs Load_MainMenu 
		PauseMusic 1 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	IF NOT cd 
		IF NOT ( testmusicfromhost = 1 ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = containerElement 
		parent = root_window 
		id = playlist_bg_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	AssignAlias id = playlist_bg_anchor alias = current_menu_anchor 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Toggle" } 
			{ text = "\\bo = Preview Track" } 
		] 
	} 
	kill_start_key_binding 
	IF LevelIs Load_MainMenu 
		build_top_and_bottom_blocks 
		make_mainmenu_3d_plane 
		build_theme_sub_title title = "PLAYLIST" no_grad_bar 
	ELSE 
		build_theme_sub_title title = "PLAYLIST" 
	ENDIF 
	CreateScreenElement { 
		type = containerElement 
		parent = playlist_bg_anchor 
		id = playlist_menu 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 620.00000000000) 
	} 
	theme_background width = 7.00000000000 pos = PAIR(320.00000000000, 85.00000000000) num_parts = 10.50000000000 parent = playlist_menu 
	CreateScreenElement { 
		type = containerElement 
		parent = playlist_menu 
		id = playlist_top_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_menu 
		texture = white2 
		scale = PAIR(71.00000000000, 6.00000000000) 
		pos = PAIR(36.00000000000, 90.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_top_anchor 
		id = left_arrow 
		texture = left_arrow 
		pos = PAIR(55.00000000000, 113.00000000000) 
		just = [ right center ] 
		z_priority = 50 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_top_anchor 
		id = right_arrow 
		texture = right_arrow 
		pos = PAIR(580.00000000000, 113.00000000000) 
		just = [ left center ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = hmenu 
		parent = playlist_top_anchor 
		id = playlist_hmenu 
		pos = PAIR(320.00000000000, 140.00000000000) 
		event_handlers = [ { pad_down focus_playlist_vmenu } 
			{ pad_back generic_menu_pad_back params = { callback = exit_playlist_menu } } 
			{ pad_left generic_menu_scroll_sideways_sound params = { } } 
			{ pad_right generic_menu_scroll_sideways_sound params = { } } 
			{ pad_left set_which_arrow params = { arrow = left_arrow } } 
			{ pad_right set_which_arrow params = { arrow = right_arrow } } 
		] 
	} 
	playlist_hmenu_add_item { text = "Punk" genre = 0 } 
	playlist_hmenu_add_item { text = "Hip Hop" genre = 1 } 
	playlist_hmenu_add_item { text = "Rock/Other" genre = 2 } 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_menu 
		texture = white2 
		scale = PAIR(71.00000000000, 0.10000000149) 
		pos = PAIR(36.00000000000, 138.00000000000) 
		rgba = <on_rgba> 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_menu 
		texture = white2 
		scale = PAIR(71.00000000000, 3.00000000000) 
		pos = PAIR(36.00000000000, 138.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = containerElement 
		parent = playlist_menu 
		id = playlist_bottom_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		alpha = 0.50000000000 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = playlist_bottom_anchor 
		text = "Band" 
		font = dialog 
		scale = 1 
		rgba = <on_rgba> 
		pos = PAIR(75.00000000000, 150.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_menu 
		texture = white2 
		scale = PAIR(0.80000001192, 28.50000000000) 
		pos = PAIR(210.00000000000, 160.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = playlist_bottom_anchor 
		text = "Song" 
		font = dialog 
		scale = 1 
		rgba = <on_rgba> 
		pos = PAIR(245.00000000000, 150.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_menu 
		texture = white2 
		scale = PAIR(0.80000001192, 28.50000000000) 
		pos = PAIR(460.00000000000, 160.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = playlist_bottom_anchor 
		text = "Genre" 
		font = dialog 
		scale = 1 
		rgba = <on_rgba> 
		pos = PAIR(505.00000000000, 150.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_menu 
		texture = white2 
		scale = PAIR(0.80000001192, 28.50000000000) 
		pos = PAIR(555.00000000000, 160.00000000000) 
		rgba = [ 0 0 0 128 ] 
		alpha = 0.80000001192 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_bottom_anchor 
		id = view_gaps_menu_up_arrow 
		texture = up_arrow 
		pos = PAIR(320.00000000000, 142.00000000000) 
		just = [ left top ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = playlist_bottom_anchor 
		id = view_gaps_menu_down_arrow 
		texture = down_arrow 
		pos = PAIR(320.00000000000, 370.00000000000) 
		just = [ left top ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = playlist_bottom_anchor 
		id = playlist_scrolling_menu 
		dims = PAIR(640.00000000000, 200.00000000000) 
		pos = PAIR(320.00000000000, 180.00000000000) 
		just = [ center top ] 
		internal_just = [ center top ] 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = playlist_scrolling_menu 
		id = playlist_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		dont_allow_wrap 
		event_handlers = [ 
			{ pad_up focus_playlist_hmenu } 
			{ pad_up set_which_arrow params = { arrow = view_gaps_menu_up_arrow } } 
			{ pad_down set_which_arrow params = { arrow = view_gaps_menu_down_arrow } } 
			{ pad_back generic_menu_pad_back params = { callback = exit_playlist_menu } } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
		] 
	} 
	AssignAlias id = playlist_vmenu alias = current_menu 
	kill_start_key_binding 
	add_tracks_to_menu 
	wait 2 gameframes 
	SetScreenElementProps id = playlist_scrolling_menu reset_window_top 
	IF LevelIs Load_MainMenu 
		end_pos = PAIR(320.00000000000, 222.00000000000) 
	ENDIF 
	finish_themed_sub_menu menu = playlist_menu end_pos = <end_pos> 
	FireEvent type = focus target = playlist_hmenu 
ENDSCRIPT

SCRIPT exit_playlist_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GotParam from_options 
		create_sound_options_menu from_options 
	ELSE 
		create_sound_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT add_tracks_to_menu 
	GetArraySize playlist_tracks 
	index = 0 
	BEGIN 
		IF ( ( <index> = locked_track1 ) | ( <index> = locked_track2 ) ) 
			CreateScreenElement { 
				type = containerElement 
				parent = current_menu 
				dims = PAIR(0.00000000000, 0.00000000000) 
				heap = topdown 
				not_focusable 
			} 
		ELSE 
			playlist_menu_add_item { index = <index> } 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT change_track_state 
	GetTags 
	IF TrackEnabled <index> 
		ChangeTrackState <index> off 
		PauseMusic 1 
		IF ScreenElementExists id = { <id> child = 4 } 
			DoScreenElementMorph id = { <id> child = 4 } alpha = 0 
		ENDIF 
	ELSE 
		ChangeTrackState <index> on 
		IF ScreenElementExists id = { <id> child = 4 } 
			DoScreenElementMorph id = { <id> child = 4 } alpha = 1 
		ENDIF 
	ENDIF 
	update_genre_checks 
ENDSCRIPT

SCRIPT is_genre_on 
	
	on = 1 
	GetArraySize playlist_tracks 
	index = 0 
	BEGIN 
		IF ( ( ( playlist_tracks [ <index> ] ) . genre ) = <genre> ) 
			IF ( ( <index> = locked_track1 ) | ( <index> = locked_track2 ) ) 
			ELSE 
				IF NOT TrackEnabled <index> 
					on = 0 
					BREAK 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN on = <on> 
ENDSCRIPT

SCRIPT toggle_playlist_genre genre = 0 
	found_first = 0 
	GetArraySize playlist_tracks 
	index = 0 
	BEGIN 
		IF ( ( ( playlist_tracks [ <index> ] ) . genre ) = <genre> ) 
			IF ( <found_first> = 0 ) 
				found_first = 1 
				IF TrackEnabled <index> 
					toggle = 0 
				ELSE 
					toggle = 1 
				ENDIF 
			ENDIF 
			IF ( <toggle> = 1 ) 
				IF ScreenElementExists id = { playlist_vmenu child = { <index> child = 4 } } 
					ChangeTrackState <index> on 
					DoScreenElementMorph id = { playlist_vmenu child = { <index> child = 4 } } alpha = 1 
				ENDIF 
			ELSE 
				IF ScreenElementExists id = { playlist_vmenu child = { <index> child = 4 } } 
					ChangeTrackState <index> off 
					DoScreenElementMorph id = { playlist_vmenu child = { <index> child = 4 } } alpha = 0 
				ENDIF 
			ENDIF 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	StopSound ThisMenuSelectSound 
	PlaySound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound 
	update_genre_checks 
ENDSCRIPT

SCRIPT preview_music_track 
	GetTags 
	IF NOT TrackEnabled <index> 
		ChangeTrackState <index> on 
		IF ScreenElementExists id = { <id> child = 4 } 
			DoScreenElementMorph id = { <id> child = 4 } alpha = 1 
		ENDIF 
	ENDIF 
	IF MusicIsPaused 
		StopMusic 
		PauseMusic 0 
		wait 1 gameframes 
		PlayTrack <index> 
	ELSE 
		PauseMusic 1 
	ENDIF 
	update_genre_checks 
ENDSCRIPT

SCRIPT playlist_hmenu_add_item 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	SWITCH <genre> 
		CASE 0 
			dims = PAIR(130.00000000000, 50.00000000000) 
		CASE 1 
			dims = PAIR(165.00000000000, 50.00000000000) 
		CASE 2 
			dims = PAIR(220.00000000000, 50.00000000000) 
		DEFAULT 
			RETURN 
	ENDSWITCH 
	CreateScreenElement { 
		type = containerElement 
		parent = playlist_hmenu 
		dims = <dims> 
		event_handlers = [ { pad_choose toggle_playlist_genre params = { genre = <genre> } } 
			{ focus playlist_hmenu_focus } 
			{ unfocus playlist_hmenu_unfocus } 
		] 
	} 
	anchor_id = <id> 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		z_priority = 50 
		font = small 
		text = <text> 
		rgba = <off_rgba> 
		scale = 1.50000000000 
		just = [ left center ] 
	} 
	GetStackedScreenElementPos X id = <id> offset = PAIR(4.00000000000, 13.00000000000) 
	is_genre_on genre = <genre> 
	IF ( <on> = 1 ) 
		alpha = 1 
	ELSE 
		alpha = 0 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = checkmark 
		pos = <pos> 
		alpha = <alpha> 
		just = [ left center ] 
		rgba = <off_rgba> 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = checkbox 
		pos = ( <pos> + PAIR(0.00000000000, 5.00000000000) ) 
		just = [ left center ] 
		scale = 0.50000000000 
		rgba = <off_rgba> 
		z_priority = 5 
	} 
ENDSCRIPT

SCRIPT update_genre_checks 
	genre = 0 
	BEGIN 
		is_genre_on genre = <genre> 
		IF ( <on> = 1 ) 
			alpha = 1 
		ELSE 
			alpha = 0 
		ENDIF 
		DoScreenElementMorph id = { playlist_hmenu child = { <genre> child = 1 } } alpha = <alpha> 
		genre = ( <genre> + 1 ) 
	REPEAT 3 
ENDSCRIPT

SCRIPT playlist_hmenu_focus 
	GetTags 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	DoScreenElementMorph { id = { <id> child = 0 } rgba = <on_rgba> } 
	DoScreenElementMorph { id = { <id> child = 1 } rgba = <on_rgba> } 
	playlist_hmenu : GetTags 
	IF GotParam arrow_id 
		blink_arrow { id = <arrow_id> } 
	ENDIF 
ENDSCRIPT

SCRIPT playlist_hmenu_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	DoScreenElementMorph { id = { <id> child = 0 } rgba = <off_rgba> } 
	DoScreenElementMorph { id = { <id> child = 1 } rgba = <off_rgba> } 
	playlist_hmenu : GetTags 
	IF GotParam arrow_id 
		blink_arrow { id = <arrow_id> } 
	ENDIF 
ENDSCRIPT

SCRIPT focus_playlist_hmenu 
	GetTags 
	IF ( <tag_selected_id> = top_item ) 
		FireEvent type = unfocus target = playlist_vmenu 
		DoScreenElementMorph id = playlist_bottom_anchor alpha = 0.50000000000 
		FireEvent type = focus target = playlist_hmenu 
		DoScreenElementMorph id = playlist_top_anchor alpha = 1.00000000000 
	ENDIF 
ENDSCRIPT

SCRIPT focus_playlist_vmenu 
	FireEvent type = unfocus target = playlist_hmenu 
	DoScreenElementMorph id = playlist_top_anchor alpha = 0.50000000000 
	FireEvent type = focus target = playlist_vmenu 
	DoScreenElementMorph id = playlist_bottom_anchor alpha = 1.00000000000 
ENDSCRIPT

SCRIPT playlist_menu_add_item highlight_bar_scale = PAIR(4.34999990463, 0.50000000000) highlight_bar_pos = PAIR(321.00000000000, 0.00000000000) 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	Theme_GetHighlightBarColor return_value = bar_rgba 
	IF ( <index> = 0 ) 
		id = top_item 
	ENDIF 
	CreateScreenElement { 
		type = containerElement 
		parent = current_menu 
		id = <id> 
		dims = PAIR(500.00000000000, 20.00000000000) 
		event_handlers = [ { focus playlist_menu_focus params = <focus_params> } 
			{ unfocus playlist_menu_unfocus } 
			{ pad_choose change_track_state params = { index = <index> } } 
			{ pad_choose generic_menu_pad_choose_sound } 
			{ pad_start change_track_state params = { index = <index> } } 
			{ pad_start generic_menu_pad_choose_sound } 
			{ pad_option preview_music_track params = { index = <index> } } 
		] 
		heap = topdown 
	} 
	<anchor_id> = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = de_highlight_bar 
		pos = <highlight_bar_pos> 
		scale = <highlight_bar_scale> 
		just = [ center center ] 
		rgba = <bar_rgba> 
		alpha = 0 
		z_priority = 3 
		heap = topdown 
	} 
	band = ( ( playlist_tracks [ <index> ] ) . band ) 
	track_title = ( ( playlist_tracks [ <index> ] ) . track_title ) 
	genre = ( ( playlist_tracks [ <index> ] ) . genre ) 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		font = dialog 
		text = <band> 
		pos = PAIR(55.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <off_rgba> 
		scale = 0.69999998808 
		heap = topdown 
	} 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		font = dialog 
		text = <track_title> 
		pos = PAIR(220.00000000000, 0.00000000000) 
		just = [ left center ] 
		rgba = <off_rgba> 
		scale = 0.69999998808 
		heap = topdown 
	} 
	SWITCH <genre> 
		CASE 0 
			genre_text = "Punk" 
		CASE 1 
			genre_text = "Hip Hop" 
		CASE 2 
			genre_text = "Rock/Other" 
		DEFAULT 
			genre_text = "" 
	ENDSWITCH 
	CreateScreenElement { 
		type = textElement 
		parent = <anchor_id> 
		font = dialog 
		text = <genre_text> 
		pos = PAIR(510.00000000000, 0.00000000000) 
		just = [ center center ] 
		rgba = <off_rgba> 
		scale = 0.69999998808 
		heap = topdown 
	} 
	IF TrackEnabled <index> 
		alpha = 1 
	ELSE 
		alpha = 0 
	ENDIF 
	checkboxpos = PAIR(568.00000000000, -4.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = checkmark 
		pos = <checkboxpos> 
		alpha = <alpha> 
		just = [ left center ] 
		rgba = <off_rgba> 
		z_priority = 5 
		heap = topdown 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = checkbox 
		pos = ( <checkboxpos> + PAIR(0.00000000000, 5.00000000000) ) 
		just = [ left center ] 
		scale = 0.50000000000 
		rgba = <off_rgba> 
		z_priority = 4 
		heap = topdown 
	} 
ENDSCRIPT

SCRIPT playlist_menu_focus 
	GetTags 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	DoScreenElementMorph id = { <id> child = 0 } alpha = 1 
	index = 1 
	BEGIN 
		IF ScreenElementExists id = { <id> child = <index> } 
			DoScreenElementMorph { id = { <id> child = <index> } rgba = <on_rgba> } 
		ELSE 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 4 
	playlist_vmenu : GetTags 
	IF GotParam arrow_id 
		menu_vert_blink_arrow { id = <arrow_id> } 
	ENDIF 
	generic_menu_update_arrows menu_id = playlist_vmenu up_arrow_id = view_gaps_menu_up_arrow down_arrow_id = view_gaps_menu_down_arrow 
ENDSCRIPT

SCRIPT playlist_menu_unfocus 
	GetTags 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	DoScreenElementMorph id = { <id> child = 0 } alpha = 0 
	index = 1 
	BEGIN 
		IF ScreenElementExists id = { <id> child = <index> } 
			DoScreenElementMorph { id = { <id> child = <index> } rgba = <off_rgba> } 
		ELSE 
			BREAK 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT 
	PauseMusic 1 
ENDSCRIPT

SCRIPT create_soundtrack_menu 
	make_new_themed_scrolling_menu title = "SOUNDTRACKS" 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_sound_options_menu } } 
		] 
	} 
	theme_menu_add_item { text = "THUG 2 Playlist" 
		pad_choose_script = SetSoundtrack 
		pad_choose_params = { track = "" } 
		centered 
		no_bg 
		first_item 
	} 
	IF isxbox 
		GetNumSoundtracks 
	ELSE 
		numsoundtracks = 0 
	ENDIF 
	IF ( <numsoundtracks> > 0 ) 
		index = 0 
		BEGIN 
			GetSoundtrackName <index> 
			theme_menu_add_item { text = <soundtrackname> 
				pad_choose_script = SetSoundtrack 
				pad_choose_params = { track = <soundtrackname> } 
				centered 
				no_bg 
				max_width = 380 
			} 
			<index> = ( <index> + 1 ) 
		REPEAT <numsoundtracks> 
	ENDIF 
	theme_menu_add_item { text = "Done" 
		id = menu_done 
		pad_choose_script = create_sound_options_menu 
		centered 
		no_bg 
		last_item 
	} 
	finish_themed_scrolling_menu 
ENDSCRIPT

SCRIPT SetSoundtrack 
	IF isps2 
		RETURN 
	ENDIF 
	FormatText checksumname = trackchecksum "%t" t = <track> 
	
	generic_menu_pad_choose 
	SoundtrackExists trackname = <track> 
	
	IF NOT ( current_soundtrack = <trackchecksum> ) 
		StopMusic 
	ENDIF 
	IF ( <index> = -1 ) 
		
		UseStandardSoundtrack 
	ELSE 
		
		UseUserSoundtrack <index> 
	ENDIF 
	change current_soundtrack = <trackchecksum> 
	IF LevelIs Load_MainMenu 
		create_sound_options_menu 
	ELSE 
		create_sound_options_menu from_options 
	ENDIF 
ENDSCRIPT

SCRIPT SoundtrackExists trackname = "" 
	
	FormatText checksumname = tracknamesum "%t" t = <trackname> 
	GetNumSoundtracks 
	IF NOT ( <numsoundtracks> = 0 ) 
		index = 0 
		BEGIN 
			GetSoundtrackName <index> 
			
			FormatText checksumname = soundtracksum "%s" s = <soundtrackname> 
			IF ( <tracknamesum> = <soundtracksum> ) 
				RETURN { index = <index> } 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <numsoundtracks> 
	ENDIF 
	RETURN { index = -1 } 
ENDSCRIPT

SCRIPT set_loaded_soundtrack 
	
	IF NOT isxbox 
		RETURN 
	ENDIF 
	current_soundtrack_exists 
	IF NOT ( current_soundtrack = %"" ) 
		StopMusic 
	ENDIF 
	IF ( <index> = -1 ) 
		
		UseStandardSoundtrack 
		trackchecksum = %"" 
	ELSE 
		
		UseUserSoundtrack <index> 
	ENDIF 
	change current_soundtrack = <trackchecksum> 
ENDSCRIPT

SCRIPT current_soundtrack_exists 
	GetNumSoundtracks 
	IF NOT ( <numsoundtracks> = 0 ) 
		index = 0 
		BEGIN 
			GetSoundtrackName <index> 
			FormatText checksumname = soundtracksum "%s" s = <soundtrackname> 
			IF ( current_soundtrack = <soundtracksum> ) 
				RETURN { index = <index> } 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <numsoundtracks> 
	ENDIF 
	RETURN { index = -1 } 
ENDSCRIPT


