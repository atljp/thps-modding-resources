
user_soundtracks_array = [ ] 
MUSIC_IN_PAUSE_MENU = 0 
GLOBAL_Music_Mode = 0 
current_soundtrack = THUG2_Soundtrack 
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

SCRIPT create_music_options_menu 
	SetMusicVolume MusicVolOutsideBox 
	IF MusicIsPaused 
		PauseMusic 0 
	ENDIF 
	IF LevelIs Load_MainMenu 
		pad_back_script = create_setup_options_menu 
	ELSE 
		pad_back_script = create_options_menu 
	ENDIF 
	thugpro_menu_create { 
		menu_name = music_options 
		menu_title = "Music Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = <pad_back_script> 
		show_description_panel 
		show_gradient 
		width_ajustment = 1.25000000000 
		boxed 
	} 
	GetValueFromVolume cdvol 
	FormatText textName = cdvol "%v" v = <value> 
	make_thugpro_menu_item { 
		text = "Music Level" 
		id = menu_music_level 
		extra_text = <cdvol> 
		option_arrows 
		option_arrows_callback = menu_turn_music_down_or_down 
	} 
	IF IsTrue GLOBAL_Music_Mode 
		extra_text = "Music" 
		not_focusable = <focusable> 
	ELSE 
		extra_text = "Ambience" 
		not_focusable = <not_focusable> 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Music Mode" 
		id = menu_music_mode 
		extra_text = <extra_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = menu_cycle_music_mode 
	} 
	make_thugpro_menu_item { 
		text = "Choose Soundtrack" 
		id = menu_soundtrack 
		pad_choose_script = create_soundtrack_menu 
		pad_choose_params = { } 
	} 
	IF THUGPRO_IsUsingDefaultSoundtrack 
		make_thugpro_menu_item { 
			text = "Edit Tracklist" 
			id = menu_playlist 
			pad_choose_script = create_tracklist_menu 
			pad_choose_params = { } 
			boxed 
		} 
	ELSE 
		make_thugpro_menu_item { 
			text = "View Tracklist" 
			id = menu_playlist 
			pad_choose_script = create_tracklist_menu 
			pad_choose_params = { } 
			boxed 
		} 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Skip Track" 
		id = menu_skip_track 
		pad_choose_script = skip_track 
		pad_choose_params = { } 
	} 
	IF GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		song_text = "Random" 
	ELSE 
		song_text = "In order" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Music Order" 
		id = menu_song_order 
		extra_text = <song_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = toggle_song_order 
	} 
	IF NOT IsTrue GLOBAL_SkipTrackAtRuns 
		skip_track_at_runs_text = "Off" 
	ELSE 
		skip_track_at_runs_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Skip track at new run " 
		id = menu_SkipTrackAtRuns 
		extra_text = <skip_track_at_runs_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = toggle_SkipTrackAtRuns 
	} 
	IF NOT IsTrue MUSIC_IN_PAUSE_MENU 
		music_in_pause_text = "Off" 
	ELSE 
		music_in_pause_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Play music in pause menu " 
		id = menu_music_in_pause 
		extra_text = <music_in_pause_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = toggle_music_in_pause 
	} 
	IF GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		sound_zones_text = "Off" 
	ELSE 
		sound_zones_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Music Zones" 
		id = menu_sound_zones 
		extra_text = <sound_zones_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = toggle_music_zones 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_sound_options_menu 
	thugpro_menu_create { 
		menu_name = sound_options 
		menu_title = "Sound Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = sound_options_exit 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	GetValueFromVolume sfxvol 
	FormatText textName = sfxvol "%v" v = <value> 
	make_thugpro_menu_item { 
		text = "Sound Level" 
		id = menu_sound_level 
		extra_text = <sfxvol> 
		option_arrows 
		option_arrows_callback = menu_turn_sound_down_or_down 
	} 
	SWITCH ( GLOBAL_TP_GroundTerrainSFX ) 
		CASE classic 
			extra_text = "Classic" 
		CASE thaw 
			extra_text = "THAW" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		text = "Ground Terrain SFX" 
		id = menu_GroundTerrain_sfx 
		extra_text = <extra_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = menu_cycle_TP_GroundTerrainSFX 
	} 
	SWITCH ( GLOBAL_ExtraTrickSFX ) 
		CASE ExtraTrick 
			extra_text = "THUG" 
		CASE ExtraTrick_THPS4 
			extra_text = "THPS4" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		text = "Extra Trick SFX" 
		id = menu_extratrick_sfx 
		extra_text = <extra_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = menu_cycle_ExtraTrickSFX 
	} 
	SWITCH ( GLOBAL_TP_RailSFX ) 
		CASE THUG 
			extra_text = "THUG" 
		CASE classic 
			extra_text = "Classic" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		text = "Rail SFX" 
		id = menu_Rail_sfx 
		extra_text = <extra_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = menu_cycle_RailSFX 
	} 
	IF GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
		special_sounds_text = "Off" 
	ELSE 
		special_sounds_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Special Sounds" 
		id = menu_sound_special 
		extra_text = <special_sounds_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = toggle_special_sounds 
	} 
	IF IsTrue GLOBAL_SkaterVoiceOff 
		skater_voice_text = "Off" 
	ELSE 
		skater_voice_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Skater Voice" 
		id = menu_skater_voices 
		extra_text = <skater_voice_text> 
		option_arrows 
		pad_choose 
		option_arrows_callback = toggle_skater_voice 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT menu_cycle_music_mode 
	GetTags 
	IF NOT IsTrue GLOBAL_Music_Mode 
		thugpro_save_key_value Key = "Music_Mode" value = 1 apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "Music" 
		IF ScreenElementExists id = track_info_container 
			DoScreenElementMorph { 
				id = track_info_container 
				alpha = 1.00000000000 
			} 
		ENDIF 
	ELSE 
		thugpro_save_key_value Key = "Music_Mode" value = 0 apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "Ambience" 
		IF ScreenElementExists id = track_info_container 
			DoScreenElementMorph { 
				id = track_info_container 
				alpha = 0.00000000000 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT menu_cycle_ExtraTrickSFX 
	GetTags 
	IF ( ( GLOBAL_ExtraTrickSFX ) = ExtraTrick_THPS4 ) 
		thugpro_save_key_value Key = "ExtraTrickSFX" value = THUG apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "THUG" 
		change GLOBAL_ExtraTrickSFX = ExtraTrick 
	ELSE 
		thugpro_save_key_value Key = "ExtraTrickSFX" value = THPS4 apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "THPS4" 
		change GLOBAL_ExtraTrickSFX = ExtraTrick_THPS4 
	ENDIF 
ENDSCRIPT

SCRIPT menu_cycle_RailSFX 
	GetTags 
	IF ( ( GLOBAL_TP_RailSFX ) = classic ) 
		thugpro_save_key_value Key = "TP_RailSFX" value = THUG apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "THUG" 
		change GLOBAL_TP_RailSFX = THUG 
		change TA_GRIND_SFX_THUG_CHANCE = 1 
		change TA_GRIND_SFX_CLASSIC_CHANCE = 0 
	ELSE 
		thugpro_save_key_value Key = "TP_RailSFX" value = classic apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "Classic" 
		change GLOBAL_TP_RailSFX = classic 
		change TA_GRIND_SFX_THUG_CHANCE = 0 
		change TA_GRIND_SFX_CLASSIC_CHANCE = 1 
	ENDIF 
ENDSCRIPT

SCRIPT menu_cycle_TP_GroundTerrainSFX 
	GetTags 
	IF ( ( GLOBAL_TP_GroundTerrainSFX ) = classic ) 
		thugpro_save_key_value Key = "TP_GroundTerrainSFX" value = thaw apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "THAW" 
		change GLOBAL_TP_GroundTerrainSFX = thaw 
		change TA_REVERT_CONC_UG2_CHANCE = 0 
		change TA_REVERT_CONC_AW_CHANCE = 1 
		change TA_LAND_CONC_UG2_CHANCE = 0 
		change TA_LAND_CONC_AW_CHANCE = 1 
		change TA_OLLIE_CONC_UG2_CHANCE = 0 
		change TA_OLLIE_CONC19_UG2_CHANCE = 0 
		change TA_OLLIE_CONC_AW_CHANCE = 8 
		change TA_OLLIE_CONC19_AW_CHANCE = 1 
	ELSE 
		thugpro_save_key_value Key = "TP_GroundTerrainSFX" value = classic apply_changes 
		thugpro_menu_item_update_extra_text id = <id> text = "Classic" 
		change GLOBAL_TP_GroundTerrainSFX = classic 
		change TA_REVERT_CONC_UG2_CHANCE = 1 
		change TA_REVERT_CONC_AW_CHANCE = 0 
		change TA_LAND_CONC_UG2_CHANCE = 1 
		change TA_LAND_CONC_AW_CHANCE = 0 
		change TA_OLLIE_CONC_UG2_CHANCE = 8 
		change TA_OLLIE_CONC19_UG2_CHANCE = 1 
		change TA_OLLIE_CONC_AW_CHANCE = 0 
		change TA_OLLIE_CONC19_AW_CHANCE = 0 
	ENDIF 
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

SCRIPT add_music_track_text 
	printf "add_music_track_text not available" 
ENDSCRIPT

SCRIPT spawn_update_music_track_text 
	IF ScreenElementExists id = track_info_container 
		RunScriptOnScreenElement id = track_info_container thugpro_update_music_track_text params = { <...> } 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_update_music_track_text 
	DoScreenElementMorph { 
		id = track_info_container 
		alpha = 0.00000000000 
		time = 0.20000000298 
	} 
	Wait 0.20000000298 seconds 
	GetCurrentTrack 
	THUGPRO_GetTrackInfo track_num = <current_track> 
	FormatText textName = current_track_text "%t" t = <track_title> 
	FormatText textName = current_artist_text "%a" a = <band> 
	SetScreenElementProps { 
		text = <current_track_text> 
		id = { track_info_container child = song_name } 
	} 
	SetScreenElementProps { 
		text = <current_artist_text> 
		id = { track_info_container child = artist_name } 
	} 
	DoScreenElementMorph { 
		id = track_info_container 
		alpha = 1.00000000000 
		time = 0.10000000149 
	} 
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
		Wait 2.50000000000 seconds 
		GetCurrentTrack 
	ENDIF 
	IF NOT IsTrue ForceAmbientSFXToMusicVolume 
		DoScreenElementMorph id = music_track_anchor alpha = 1 
	ENDIF 
	THUGPRO_GetTrackInfo track_num = <current_track> 
	current_band_text = <band> 
	FormatText textName = current_track_text "\'\'%t\'\'" t = <track_title> 
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
	printf "update_volume_bar not available" 
ENDSCRIPT

SCRIPT boombox_speaker_pulse 
	printf "boombox_speaker_pulse not available" 
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
	IF LevelIs Load_MainMenu 
		create_setup_options_menu 
	ELSE 
		create_options_menu 
	ENDIF 
ENDSCRIPT

SCRIPT sound_options_show_levels 
	printf "sound_options_show_levels not available" 
ENDSCRIPT

SCRIPT toggle_song_order 
	GetTags 
	IF NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		PlaySongsRandomly 
		SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		thugpro_save_key_value Key = "RandomSongOrder" value = 1 
	ELSE 
		PlaySongsInOrder 
		UnsetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		thugpro_save_key_value Key = "RandomSongOrder" value = 0 
	ENDIF 
	IF GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		<song_order_text> = "Random" 
	ELSE 
		<song_order_text> = "In order" 
	ENDIF 
	thugpro_menu_item_update_extra_text id = <id> text = <song_order_text> 
ENDSCRIPT

SCRIPT toggle_special_sounds 
	GetTags 
	IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "SpecialSoundsOff" value = 1 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "SpecialSoundsOff" value = 0 apply_changes 
		PlaySound HUD_specialtrickAA 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_music_zones 
	GetTags 
	IF NOT GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "MusicBoxesOff" value = 1 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "MusicBoxesOff" value = 0 apply_changes 
	ENDIF 
	IF NOT LevelIs Load_MainMenu 
		root_window : SetTags need_music_zone_refresh 
	ENDIF 
ENDSCRIPT

SCRIPT refresh_music_zones 
	IF GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF 
		SetScreenElementProps id = menu_sound_zone_chk rgba = [ 0 0 0 0 ] 
	ELSE 
		SetScreenElementProps id = menu_sound_zone_chk rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_skater_voice 
	GetTags 
	IF NOT IsTrue GLOBAL_SkaterVoiceOff 
		change GLOBAL_SkaterVoiceOff = 1 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "SkaterVoiceOff" value = 1 apply_changes 
	ELSE 
		change GLOBAL_SkaterVoiceOff = 0 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "SkaterVoiceOff" value = 0 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_SkipTrackAtRuns 
	GetTags 
	IF IsTrue GLOBAL_SkipTrackAtRuns 
		change GLOBAL_SkipTrackAtRuns = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "SkipTrackAtRuns" value = 0 apply_changes 
	ELSE 
		change GLOBAL_SkipTrackAtRuns = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "SkipTrackAtRuns" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_music_in_pause 
	GetTags 
	IF IsTrue MUSIC_IN_PAUSE_MENU 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "MUSIC_IN_PAUSE_MENU" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "MUSIC_IN_PAUSE_MENU" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT menu_sound_level_focus 
	GetTags 
	main_theme_focus 
	IF GotParam music_level 
		value = ( MusicVolOutsideBox / 10 ) 
	ELSE 
		GetValueFromVolume sfxvol 
	ENDIF 
	printf <value> 
	IF ( <value> = 0 ) 
		SetScreenElementProps { id = { <id> child = 5 } rgba = [ 128 128 128 0 ] } 
	ELSE 
		SetScreenElementProps { id = { <id> child = 5 } rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) } 
	ENDIF 
	IF ( <value> = 10 ) 
		SetScreenElementProps { id = { <id> child = 6 } rgba = [ 128 128 128 0 ] } 
	ELSE 
		SetScreenElementProps { id = { <id> child = 6 } rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) } 
	ENDIF 
ENDSCRIPT

SCRIPT menu_sound_level_unfocus 
	GetTags 
	main_theme_unfocus 
	SetScreenElementProps { id = { <id> child = 5 } rgba = [ 128 128 128 0 ] } 
	SetScreenElementProps { id = { <id> child = 6 } rgba = [ 128 128 128 0 ] } 
ENDSCRIPT

SCRIPT menu_turn_music_down_or_down 
	IF GotParam left 
		menu_turn_music_down 
	ELSE 
		menu_turn_music_up 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_sound_down_or_down 
	IF GotParam left 
		menu_turn_sound_down 
	ELSE 
		menu_turn_sound_up 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_music_down 
	GetTags 
	GetValueFromVolume cdvol 
	IF ( <value> > 0 ) 
		<value> = ( <value> - 1 ) 
		sound_options_set_level level = <value> id = menu_music_level type = cdvol 
	ENDIF 
	IF IsTrue GLOBAL_Music_Mode 
		IF ( <value> < 1 ) 
			IF ScreenElementExists id = track_info_container 
				DoScreenElementMorph { 
					id = track_info_container 
					alpha = 0.00000000000 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_music_up 
	GetTags 
	GetValueFromVolume cdvol 
	IF ( <value> < 10 ) 
		<value> = ( <value> + 1 ) 
		sound_options_set_level level = <value> id = menu_music_level type = cdvol 
	ENDIF 
	IF IsTrue GLOBAL_Music_Mode 
		IF ( <value> > 0 ) 
			IF ScreenElementExists id = track_info_container 
				DoScreenElementMorph { 
					id = track_info_container 
					alpha = 1.00000000000 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_sound_down 
	GetTags 
	GetValueFromVolume sfxvol 
	IF ( <value> > 0 ) 
		<value> = ( <value> - 1 ) 
		sound_options_set_level level = <value> id = menu_sound_level type = sfxvol 
		PlaySound ollieconc vol = 70 
	ENDIF 
ENDSCRIPT

SCRIPT menu_turn_sound_up 
	GetTags 
	GetValueFromVolume sfxvol 
	IF ( <value> < 10 ) 
		<value> = ( <value> + 1 ) 
		sound_options_set_level level = <value> id = menu_sound_level type = sfxvol 
		PlaySound ollieconc vol = 70 
	ENDIF 
ENDSCRIPT

SCRIPT sound_options_set_level 
	FormatText textName = vol "%v" v = <level> 
	IF GotParam id 
		thugpro_menu_item_update_extra_text id = <id> text = <vol> 
	ENDIF 
	<level> = ( <level> * 10 ) 
	SWITCH <type> 
		CASE cdvol 
			SetMusicVolume <level> 
			change MusicVolOutsideBox = <level> 
			change FadeTempMusicVol = <level> 
			thugpro_save_key_value Key = "MusicLevel" value = <level> 
		CASE sfxvol 
			SetSfxVolume <level> 
			thugpro_save_key_value Key = "SoundLevel" value = <level> 
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
	printf "create_playlist_menu not available" 
ENDSCRIPT

SCRIPT exit_playlist_menu 
	printf "exit_playlist_menu not available" 
ENDSCRIPT

SCRIPT add_tracks_to_menu 
	printf "add_tracks_to_menu not available" 
ENDSCRIPT

SCRIPT change_track_state 
	printf "is_genre_on not available" 
ENDSCRIPT

SCRIPT is_genre_on 
	printf "is_genre_on not available" 
ENDSCRIPT

SCRIPT toggle_playlist_genre 
	printf "toggle_playlist_genre not available" 
ENDSCRIPT

SCRIPT preview_music_track 
	printf "preview_music_track not available" 
ENDSCRIPT

SCRIPT playlist_hmenu_add_item 
	printf "playlist_hmenu_add_item not available" 
ENDSCRIPT

SCRIPT update_genre_checks 
	printf "update_genre_checks not available" 
ENDSCRIPT

SCRIPT playlist_hmenu_focus 
	printf "playlist_hmenu_focus not available" 
ENDSCRIPT

SCRIPT playlist_hmenu_unfocus 
	printf "playlist_hmenu_unfocus not available" 
ENDSCRIPT

SCRIPT focus_playlist_hmenu 
	printf "focus_playlist_hmenu not available" 
ENDSCRIPT

SCRIPT focus_playlist_vmenu 
	printf "focus_playlist_vmenu not available" 
ENDSCRIPT

SCRIPT playlist_menu_add_item 
	printf "playlist_menu_add_item not available" 
ENDSCRIPT

SCRIPT playlist_menu_focus 
	printf "playlist_menu_focus not available" 
ENDSCRIPT

SCRIPT playlist_menu_unfocus 
	printf "playlist_menu_unfocus not available" 
ENDSCRIPT

SCRIPT create_soundtrack_menu 
	thugpro_menu_create { 
		menu_name = soundtrack 
		menu_title = "Choose Soundtrack" 
		menu_style = MENU_STYLE_MIDDLE 
		helper_text = generic_helper_text 
		pad_back_script = create_music_options_menu 
		menu_item_max_width = 310 
		scrolling 
		boxed 
	} 
	THUGPRO_FillSoundtrackMenu 
	thugpro_menu_create_remainder_items 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT thugpro_set_soundtrack 
	IF ( <sountrack_checksum> = default ) 
		THUGPRO_SetSoundtrack default 
	ELSE 
		THUGPRO_SetSoundtrack soundtrack = <sountrack> 
	ENDIF 
ENDSCRIPT

SCRIPT create_tracklist_menu 
	IF THUGPRO_IsUsingDefaultSoundtrack 
		menu_title_text = "Edit Tracklist" 
		menu_helper_text = { 
			helper_text_elements_pc = [ 
				{ text = "\\b7/\\b4 = Select" } 
				{ text = "\\bn = Back" } 
				{ text = "\\bm = Toggle track" } 
				{ text = "\\bo = Preview track" } 
			] 
			helper_text_elements_console = [ 
				{ text = "\\b7/\\b4 = Select" } 
				{ text = "\\m1 = Back" } 
				{ text = "\\m0 = Toggle track" } 
				{ text = "\\me = Preview track" } 
			] 
		} 
	ELSE 
		menu_title_text = "View Tracklist" 
		menu_helper_text = { 
			helper_text_elements_pc = [ 
				{ text = "\\b7/\\b4 = Select" } 
				{ text = "\\bn = Back" } 
				{ text = "\\bo = Preview track" } 
			] 
			helper_text_elements_console = [ 
				{ text = "\\b7/\\b4 = Select" } 
				{ text = "\\m1 = Back" } 
				{ text = "\\me = Preview track" } 
			] 
		} 
	ENDIF 
	thugpro_menu_create { 
		menu_name = tracklist 
		menu_title = <menu_title_text> 
		menu_style = MENU_STYLE_MIDDLE 
		menu_item_max_width = 310 
		helper_text = <menu_helper_text> 
		pad_back_script = create_music_options_menu 
		scrolling 
		boxed 
	} 
	THUGPRO_FillTracklistMenu 
	thugpro_menu_create_remainder_items 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT thugpro_tracklist_preview_song 
	IF IsTrue GLOBAL_Music_Mode 
		PlayTrack <track_num> 
		spawn_update_music_track_text current_track = <track_num> 
	ENDIF 
ENDSCRIPT

SCRIPT add_soundtrack_menu_item 
	FormatText ChecksumName = menu_id "soundtrack_menu_%a" a = <checksum> 
	make_thugpro_menu_item { 
		text = <text> 
		id = <menu_id> 
		pad_choose_script = thugpro_set_soundtrack 
		pad_choose_params = { sountrack = <name> sountrack_checksum = <checksum> } 
		boxed 
	} 
ENDSCRIPT

SCRIPT add_tracklist_menu_item 
	FormatText ChecksumName = menu_id "tracklist_menu_%a" a = <track_title> 
	FormatText textName = menu_text "%a: %b" a = <band> b = <track_title> 
	IF THUGPRO_IsUsingDefaultSoundtrack 
		IF TrackEnabled <track_num> 
			<checked> = checked 
		ELSE 
			<checked> = unchecked 
		ENDIF 
		make_thugpro_menu_checkbox_item { 
			text = <menu_text> 
			id = <menu_id> 
			pad_choose_script = thugpro_tracklist_change_track_state 
			pad_choose_params = { track_num = <track_num> } 
			pad_option_script = thugpro_tracklist_preview_song 
			pad_option_params = { track_num = <track_num> } 
			<checked> 
		} 
	ELSE 
		make_thugpro_menu_item { 
			boxed 
			text = <menu_text> 
			id = <menu_id> 
			pad_choose_script = thugpro_tracklist_change_track_state 
			pad_choose_params = { track_num = <track_num> } 
			pad_option_script = thugpro_tracklist_preview_song 
			pad_option_params = { track_num = <track_num> } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_tracklist_change_track_state 
	IF THUGPRO_IsUsingDefaultSoundtrack 
		GetTags 
		IF TrackEnabled <track_num> 
			ChangeTrackState <track_num> off 
			PauseMusic 1 
			thugpro_menu_item_update_checkbox id = <id> off 
		ELSE 
			ChangeTrackState <track_num> on 
			thugpro_menu_item_update_checkbox id = <id> on 
		ENDIF 
		THUGPRO_SaveSoundtrackInfo 
	ENDIF 
ENDSCRIPT

SCRIPT SetSoundtrack 
	printf "SetSoundtrack not available" 
ENDSCRIPT

SCRIPT SoundtrackExists 
	printf "SoundtrackExists not available" 
ENDSCRIPT

SCRIPT set_loaded_soundtrack 
	printf "set_loaded_soundtrack" 
	IF NOT isxbox 
		RETURN 
	ENDIF 
	current_soundtrack_exists 
	IF NOT ( current_soundtrack = null ) 
		StopMusic 
	ENDIF 
	IF ( <index> = -1 ) 
		printf "use playlist" 
		UseStandardSoundtrack 
		trackchecksum = null 
	ELSE 
		printf "use soundtrack %i" i = <index> 
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
			FormatText ChecksumName = soundtracksum "%s" s = <soundtrackname> 
			IF ( current_soundtrack = <soundtracksum> ) 
				RETURN { index = <index> } 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <numsoundtracks> 
	ENDIF 
	RETURN { index = -1 } 
ENDSCRIPT


