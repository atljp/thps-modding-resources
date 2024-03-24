
current_soundtrack = #"0xffffffff"

script launch_sound_options_menu 
    if GotParam from_options
        create_sound_options_menu from_options
    else
        if GotParam from_parked
            create_sound_options_menu from_parked
        else
            create_sound_options_menu
        endif
    endif
endscript


script create_sound_options_menu 
    SetMusicVolume MusicVolOutsideBox
    make_new_themed_sub_menu Title = 'SOUND OPTIONS'
    if LevelIs load_mainmenu
        PauseMusic 0
    endif
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Select' }
            { text = '\b6/\b5 = Adjust Levels' }
            { text = '\bn = Back' }
            { text = '\bm = Accept' }
        ]
    }
    if GotParam from_parked
        SetScreenElementProps {id = sub_menu
            event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = sound_options_exit from_parked }}
            ]
        }
    else
        SetScreenElementProps {id = sub_menu
            event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = sound_options_exit }}
            ]
        }
    endif
    if GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
        song_text = 'Random'
    else
        song_text = 'In Order'
    endif
    if IsTrue forceambientsfxtomusicvolume
        sound_override = not_focusable
        song_text = 'Level Music!'
    endif
    theme_menu_add_item {text = 'Songs:'
        extra_text = <song_text>
        id = menu_song_order
        pad_choose_script = toggle_song_order
        <sound_override>
    }
    theme_menu_add_item {text = 'Skip Track'
        id = menu_skip_track
        focus_script = skip_track_focus
        unfocus_script = skip_track_unfocus
        pad_choose_script = skip_track
        pad_choose_params = {}
        <sound_override>
    }
    if NOT IsXbox
        if NOT (DEMO_BUILD)
            theme_menu_add_item {text = 'Soundtrack'
                id = menu_soundtrack
                pad_choose_script = create_soundtrack_menu
                pad_choose_params = {}
                <sound_override>
            }
        endif
    endif
    if (current_soundtrack = #"0xffffffff")
        theme_menu_add_item {text = 'Playlist'
            id = menu_playlist
            pad_choose_script = create_playlist_menu
            pad_choose_params = {}
            <sound_override>
        }
    else
        theme_menu_add_item {text = 'Playlist'
            id = menu_playlist
            pad_choose_script = NullScript
            not_focusable = not_focusable
        }
    endif
    theme_menu_add_item {text = 'Music Level:'
        id = menu_music_level
        focus_script = menu_music_level_focus
        focus_params = { music_level = music_level }
        unfocus_script = menu_music_level_unfocus
        no_sound
    }
    theme_menu_add_item {text = 'Sound Level:'
        id = menu_sound_level
        focus_script = menu_music_level_focus
        unfocus_script = menu_music_level_unfocus
        no_sound
    }
    theme_menu_add_item {text = 'Special Sounds:'
        id = menu_sound_special
        extra_text = ''
        focus_script = menu_music_special_focus
        unfocus_script = menu_music_special_unfocus
        pad_choose_script = toggle_special_sounds
        no_sound
    }
    theme_menu_add_item {text = 'Music Zones:'
        id = menu_sound_zones
        extra_text = ''
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
        Pos = (130.0, -13.0)
        just = [ center top ]
        Scale = 0.5500
        rgba = <checkbox_rgba>
        z_priority = 5
    }
    if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
        CreateScreenElement {
            type = SpriteElement
            parent = <id>
            id = menu_sound_special_chk
            texture = checkmark
            Pos = (25.0, -9.0)
            just = [ center top ]
            rgba = <checkmark_rgba>
            z_priority = 6
            Scale = 1.400
        }
    else
        CreateScreenElement {
            type = SpriteElement
            parent = <id>
            id = menu_sound_special_chk
            texture = checkmark
            Pos = (25.0, -7.0)
            just = [ center top ]
            rgba = [ 0 0 0 0 ]
            z_priority = 6
            Scale = 1.400
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = menu_sound_zones
        texture = checkbox
        Pos = (130.0, -13.0)
        just = [ center top ]
        Scale = 0.5500
        rgba = <checkbox_rgba>
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        id = menu_sound_zone_chk
        texture = checkmark
        Pos = (25.0, -9.0)
        just = [ center top ]
        rgba = <checkmark_rgba>
        z_priority = 6
        Scale = 1.400
    }
    refresh_music_zones
    if GotParam from_options
        theme_menu_add_item text = 'Done' id = menu_done pad_choose_script = sound_options_exit pad_choose_params = { from_options }last_menu_item = 1
    else
        if GotParam from_parked
            theme_menu_add_item text = 'Done' id = menu_done pad_choose_script = sound_options_exit pad_choose_params = { from_parked }last_menu_item = 1
        else
            theme_menu_add_item text = 'Done' id = menu_done pad_choose_script = sound_options_exit last_menu_item = 1
        endif
    endif
    sound_options_show_levels
    add_music_track_text
    if LevelIs load_mainmenu
        add_options_menu_sign_element icon = sound_icon no_animate icon_pos = (565.0, 135.0) icon_scale = 1.150
    else
        PauseMusic
    endif
    finish_themed_sub_menu
endscript


script GetTracksEnabled 
    <num_enabled> = 0
    GetArraySize playlist_tracks
    index = 0
    begin 
    if TrackEnabled <index>
        <num_enabled> = (<num_enabled> + 1)
        break 
    endif
    index = (<index> + 1)
    repeat <array_size>
    return num_enabled = <num_enabled>
endscript


script add_music_track_text parent = current_menu_anchor Pos = (575.0, 320.0)
    if NOT (current_soundtrack = #"0xffffffff")
        return 
    endif
    GetTracksEnabled
    if (<num_enabled> = 0)
        return 
    endif
    if LevelIs load_mainmenu
        Pos = (575.0, 320.0)
    endif
    GetCurrentTrack
    if (<current_track> = 999)
        return 
    endif
    if NOT TrackEnabled <current_track>
        return 
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = music_track_anchor
        Pos = <Pos>
        dims = (0.0, 0.0)
    }
    current_band_text = ((playlist_tracks [ <current_track> ]).band)
    FormatText textname = current_track_text '\'\'%t\'\'' t = ((playlist_tracks [ <current_track> ]).track_title)
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = TextElement
        parent = music_track_anchor
        id = music_band_text
        text = <current_band_text>
        font = testtitle
        just = [ RIGHT top ]
        Scale = 1
        Pos = (4.0, 10.0)
        rgba = <on_rgba>
        alpha = 0.8000
    }
    GetScreenElementDims id = music_band_text
    if (<width> > 260)
        <Scale> = (260.0 / <width>)
        DoScreenElementMorph id = music_band_text time = 0 Scale = <Scale>
    endif
    CreateScreenElement {
        type = TextElement
        parent = music_track_anchor
        id = music_track_text
        text = <current_track_text>
        font = dialog
        just = [ RIGHT top ]
        Scale = 0.8000
        Pos = (4.0, 28.0)
        rgba = <off_rgba>
        alpha = 0.8000
    }
    GetScreenElementDims id = music_track_text
    if (<width> > 250)
        <Scale> = (0.8000 * 250.0 / <width>)
        DoScreenElementMorph id = music_track_text time = 0 Scale = <Scale>
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = music_track_anchor
        texture = kyron
        just = [ center center ]
        Scale = 1
        Pos = (14.0, 15.0)
        rgba = <on_rgba>
        alpha = 0.7000
    }
    if IsTrue forceambientsfxtomusicvolume
        DoScreenElementMorph id = music_track_anchor alpha = 0
    endif
endscript


script spawn_update_music_track_text 
    if ScreenElementExists id = music_track_anchor
        RunScriptOnScreenElement id = music_track_anchor update_music_track_text params = { <...>  }
    endif
endscript


script update_music_track_text 
    if ScreenElementExists id = music_track_anchor
        if IsTrue forceambientsfxtomusicvolume
            DoScreenElementMorph id = music_track_anchor alpha = 0
        endif
        GetScreenElementPosition id = music_track_anchor
        old_pos = <screenelementpos>
        generic_menu_animate_out force menu = music_track_anchor
    else
        return 
    endif
    if NOT GotParam current_track
        wait 2.500 seconds
        GetCurrentTrack
    endif
    if NOT IsTrue forceambientsfxtomusicvolume
        DoScreenElementMorph id = music_track_anchor alpha = 1
    endif
    current_band_text = ((playlist_tracks [ <current_track> ]).band)
    FormatText textname = current_track_text '\'\'%t\'\'' t = ((playlist_tracks [ <current_track> ]).track_title)
    if ScreenElementExists id = music_band_text
        SetScreenElementProps id = music_band_text text = <current_band_text>
        SetScreenElementProps id = music_track_text text = <current_track_text>
    endif
    DoScreenElementMorph id = music_band_text time = 0 Scale = 1.0
    GetScreenElementDims id = music_band_text
    if (<width> > 245)
        <Scale> = (245.0 / <width>)
        DoScreenElementMorph id = music_band_text time = 0 Scale = <Scale>
    endif
    GetScreenElementDims id = music_band_text
    DoScreenElementMorph id = music_band_text time = 0 Scale = 1.0
    if (<width> > 250)
        <Scale> = (250.0 / <width>)
        DoScreenElementMorph id = music_track_text time = 0 Scale = <Scale>
    endif
    if ScreenElementExists id = music_track_anchor
        generic_menu_animate_in force menu = music_track_anchor Pos = <old_pos>
    endif
endscript


script update_volume_bar 
    
endscript


script boombox_speaker_pulse 
    
endscript


script sound_options_exit 
    KillSpawnedScript name = shake_projector
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if GotParam just_remove
        return 
    endif
    SFX_Music_Volume_Box_Restore_State sound_options
    if (FadeMusicOutRunning = 1)
        SetMusicVolume 0
    endif
    if (FadeMusicInRunning = 1)
        SetMusicVolume MusicVolOutsideBox
    endif
    if NOT LevelIs load_mainmenu
        PauseMusic 1
        if GotParam from_parked
            parked_setup_test_play_menu
        else
            create_options_menu
        endif
    else
        PauseMusic 0
        create_gamesettings_menu
    endif
endscript


script sound_options_show_levels 
    Theme_GetUnhighlightedTextColor return_value = text_color
    value = (MusicVolOutsideBox / 10)
    displayvalue = <value>
    CastToInteger displayvalue
    FormatText textname = cdvol '%v' v = <displayvalue>
    CreateScreenElement {
        type = TextElement
        parent = menu_music_level
        font = small
        just = [ center top ]
        Pos = (128.0, -17.0)
        text = <cdvol>
        rgba = <text_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = menu_music_level
        texture = left_arrow
        rgba = [ 128 128 128 0 ]
        Pos = (115.0, -17.0)
        just = [ RIGHT top ]
        Scale = 0.7500
    }
    CreateScreenElement {
        type = SpriteElement
        parent = menu_music_level
        texture = right_arrow
        rgba = [ 128 128 128 0 ]
        Pos = (143.0, -17.0)
        just = [ left top ]
        Scale = 0.7500
    }
    GetValueFromVolume sfxvol
    FormatText textname = sfxvol '%v' v = <value>
    CreateScreenElement {
        type = TextElement
        parent = menu_sound_level
        font = small
        just = [ center top ]
        Pos = (128.0, -17.0)
        text = <sfxvol>
        rgba = <text_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = menu_sound_level
        texture = left_arrow
        rgba = [ 128 128 128 0 ]
        Pos = (115.0, -17.0)
        just = [ RIGHT top ]
        Scale = 0.7500
    }
    CreateScreenElement {
        type = SpriteElement
        parent = menu_sound_level
        texture = right_arrow
        rgba = [ 128 128 128 0 ]
        Pos = (143.0, -17.0)
        just = [ left top ]
        Scale = 0.7500
    }
    SetScreenElementProps {
        id = menu_music_level
        event_handlers = [{ pad_left menu_turn_music_down }
            { pad_right menu_turn_music_up }
        ]
        replace_handlers
    }
    SetScreenElementProps {
        id = menu_sound_level
        event_handlers = [{ pad_left menu_turn_sound_down }
            { pad_right menu_turn_sound_up }
        ]
        replace_handlers
    }
endscript


script toggle_song_order 
    if NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
        SetScreenElementProps id = { menu_song_order child = 3 }text = 'Random'
        PlaySongsRandomly
        SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
    else
        SetScreenElementProps id = { menu_song_order child = 3 }text = 'In Order'
        PlaySongsInOrder
        UnsetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
    endif
endscript


script toggle_special_sounds 
    Theme_GetHighlightedTextColor return_value = check_rgba
    if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
        SetScreenElementProps id = menu_sound_special_chk rgba = [ 0 0 0 0 ]
        SetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
    else
        SetScreenElementProps id = menu_sound_special_chk rgba = <check_rgba>
        UnsetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
        playsound HUD_specialtrickAA
    endif
endscript


script toggle_music_zones 
    if NOT GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF
        SetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF
        change music_was_paused = 0
    else
        UnsetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF
    endif
    refresh_music_zones
    if NOT LevelIs load_mainmenu
        root_window ::settags need_music_zone_refresh
    endif
endscript


script refresh_music_zones 
    if GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF
        SetScreenElementProps id = menu_sound_zone_chk rgba = [ 0 0 0 0 ]
    else
        Theme_GetHighlightedTextColor return_value = check_rgba
        SetScreenElementProps id = menu_sound_zone_chk rgba = <check_rgba>
    endif
endscript


script menu_music_level_focus 
    if NOT LevelIs load_mainmenu
        PauseMusic 0
    endif
    menu_sound_level_focus {music_level = <music_level> <...> }
endscript


script menu_music_level_unfocus 
    menu_sound_level_unfocus <...> 
    if NOT LevelIs load_mainmenu
        PauseMusic 1
    endif
endscript


script menu_music_special_focus 
    if NOT LevelIs load_mainmenu
        PauseMusic 0
    endif
    main_theme_focus
endscript


script menu_music_special_unfocus 
    main_theme_unfocus
    if NOT LevelIs load_mainmenu
        PauseMusic 1
    endif
endscript


script skip_track_focus 
    if NOT LevelIs load_mainmenu
        PauseMusic 0
    endif
    main_theme_focus <...> 
endscript


script skip_track_unfocus 
    main_theme_unfocus <...> 
    if NOT LevelIs load_mainmenu
        PauseMusic 1
    endif
endscript


script menu_sound_level_focus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = arrow_color
    main_theme_focus
    if GotParam music_level
        value = (MusicVolOutsideBox / 10)
    else
        GetValueFromVolume sfxvol
    endif
    
    if (<value> = 0)
        SetScreenElementProps {id = {<id> child = 5}rgba = [ 128 128 128 0 ]}
    else
        SetScreenElementProps {id = {<id> child = 5}rgba = <arrow_color>}
    endif
    if (<value> = 10)
        SetScreenElementProps {id = {<id> child = 6}rgba = [ 128 128 128 0 ]}
    else
        SetScreenElementProps {id = {<id> child = 6}rgba = <arrow_color>}
    endif
endscript


script menu_sound_level_unfocus 
    gettags
    main_theme_unfocus
    SetScreenElementProps {id = {<id> child = 5}rgba = [ 128 128 128 0 ]}
    SetScreenElementProps {id = {<id> child = 6}rgba = [ 128 128 128 0 ]}
endscript


script menu_turn_music_down 
    gettags
    value = (MusicVolOutsideBox / 10)
    CastToInteger value
    if (<value> > 0)
        SetScreenElementProps id = {<id> child = 6}rgba = [ 128 128 128 128 ]
        <value> = (<value> - 1)
        sound_options_set_level level = <value> id = menu_music_level type = cdvol
        menu_horiz_blink_arrow arrow_id = {<id> child = 5}
    endif
    if (<value> = 0)
        SetScreenElementProps id = {<id> child = 5}rgba = [ 128 128 128 0 ]
        set_music_ambient_state
    endif
endscript


script menu_turn_music_up 
    gettags
    value = (MusicVolOutsideBox / 10)
    CastToInteger value
    if (<value> < 10)
        SetScreenElementProps id = {<id> child = 5}rgba = [ 128 128 128 128 ]
        <value> = (<value> + 1)
        sound_options_set_level level = <value> id = menu_music_level type = cdvol
        menu_horiz_blink_arrow arrow_id = {<id> child = 6}
    endif
    if (<value> = 10)
        SetScreenElementProps id = {<id> child = 6}rgba = [ 128 128 128 0 ]
    endif
    if (<value> = 1)
        set_music_ambient_state
    endif
endscript


script menu_turn_sound_down 
    gettags
    GetValueFromVolume sfxvol
    if (<value> > 0)
        SetScreenElementProps id = {<id> child = 6}rgba = [ 128 128 128 128 ]
        <value> = (<value> - 1)
        sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
        menu_horiz_blink_arrow arrow_id = {<id> child = 5}
        playsound ollieconc vol = 70
    endif
    if (<value> = 0)
        SetScreenElementProps id = {<id> child = 5}rgba = [ 128 128 128 0 ]
    endif
endscript


script menu_turn_sound_up 
    gettags
    GetValueFromVolume sfxvol
    if (<value> < 10)
        SetScreenElementProps id = {<id> child = 5}rgba = [ 128 128 128 128 ]
        <value> = (<value> + 1)
        sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
        menu_horiz_blink_arrow arrow_id = {<id> child = 6}
        playsound ollieconc vol = 70
    endif
    if (<value> = 10)
        SetScreenElementProps id = {<id> child = 6}rgba = [ 128 128 128 0 ]
    endif
endscript


script sound_options_set_level 
    FormatText textname = vol '%v' v = <level>
    if GotParam id
        SetScreenElementProps {
            id = {<id> child = 4}
            text = <vol>
        }
    endif
    <level> = (<level> * 10)
    switch <type>
        case cdvol
        SetMusicVolume <level>
        change MusicVolOutsideBox = <level>
        change FadeTempMusicVol = <level>
        case sfxvol
        SetSfxVolume <level>
    endswitch
endscript


script skip_track 
    skiptrack
endscript


script pulse_item 
    DoMorph time = 0.05000 Scale = 0.9000
    DoMorph time = 0.05000 Scale = 1.0
endscript


script create_playlist_menu 
    if LevelIs load_mainmenu
        PauseMusic 1
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
    if NOT cd
        if NOT (TestMusicFromHost = 1)
            return 
        endif
    endif
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = playlist_bg_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = playlist_bg_anchor alias = current_menu_anchor
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Select' }
            { text = '\bn = Back' }
            { text = '\bm = Toggle' }
            { text = '\bo = Preview Track' }
        ]
    }
    kill_start_key_binding
    if LevelIs load_mainmenu
        build_top_and_bottom_blocks
        make_mainmenu_3d_plane
        build_theme_sub_title Title = 'PLAYLIST' no_grad_bar
    else
        build_theme_sub_title Title = 'PLAYLIST'
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = playlist_bg_anchor
        id = playlist_menu
        dims = (640.0, 480.0)
        Pos = (320.0, 620.0)
    }
    theme_background width = 7.0 Pos = (320.0, 85.0) num_parts = 10.50 parent = playlist_menu
    CreateScreenElement {
        type = ContainerElement
        parent = playlist_menu
        id = playlist_top_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 6.0)
        Pos = (36.0, 90.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_top_anchor
        id = left_arrow
        texture = left_arrow
        Pos = (55.0, 113.0)
        just = [ RIGHT center ]
        z_priority = 50
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_top_anchor
        id = right_arrow
        texture = right_arrow
        Pos = (580.0, 113.0)
        just = [ left center ]
        z_priority = 5
    }
    CreateScreenElement {
        type = hmenu
        parent = playlist_top_anchor
        id = playlist_hmenu
        Pos = (320.0, 140.0)
        event_handlers = [{ pad_down focus_playlist_vmenu }
            {pad_back generic_menu_pad_back params = { callback = exit_playlist_menu }}
            {pad_left generic_menu_scroll_sideways_sound params = {}}
            {pad_right generic_menu_scroll_sideways_sound params = {}}
            {pad_left set_which_arrow params = { arrow = left_arrow }}
            {pad_right set_which_arrow params = { arrow = right_arrow }}
        ]
    }
    playlist_hmenu_add_item {text = 'Punk' genre = 0}
    playlist_hmenu_add_item {text = 'Hip Hop' genre = 1}
    playlist_hmenu_add_item {text = 'Rock/Other' genre = 2}
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 0.10000000149011612)
        Pos = (36.0, 138.0)
        rgba = <on_rgba>
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 3.0)
        Pos = (36.0, 138.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = ContainerElement
        parent = playlist_menu
        id = playlist_bottom_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
        alpha = 0.5000
    }
    CreateScreenElement {
        type = TextElement
        parent = playlist_bottom_anchor
        text = 'Band'
        font = dialog
        Scale = 1
        rgba = <on_rgba>
        Pos = (75.0, 150.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (0.800000011920929, 28.5)
        Pos = (210.0, 160.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = playlist_bottom_anchor
        text = 'Song'
        font = dialog
        Scale = 1
        rgba = <on_rgba>
        Pos = (245.0, 150.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (0.800000011920929, 28.5)
        Pos = (460.0, 160.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = playlist_bottom_anchor
        text = 'Genre'
        font = dialog
        Scale = 1
        rgba = <on_rgba>
        Pos = (505.0, 150.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (0.800000011920929, 28.5)
        Pos = (555.0, 160.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_bottom_anchor
        id = view_gaps_menu_up_arrow
        texture = up_arrow
        Pos = (320.0, 142.0)
        just = [ left top ]
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_bottom_anchor
        id = view_gaps_menu_down_arrow
        texture = down_arrow
        Pos = (320.0, 370.0)
        just = [ left top ]
        z_priority = 3
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = playlist_bottom_anchor
        id = playlist_scrolling_menu
        dims = (640.0, 200.0)
        Pos = (320.0, 180.0)
        just = [ center top ]
        internal_just = [ center top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = playlist_scrolling_menu
        id = playlist_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        dont_allow_wrap
        event_handlers = [
            { pad_up focus_playlist_hmenu }
            {pad_up set_which_arrow params = { arrow = view_gaps_menu_up_arrow }}
            {pad_down set_which_arrow params = { arrow = view_gaps_menu_down_arrow }}
            {pad_back generic_menu_pad_back params = { callback = exit_playlist_menu }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
    }
    AssignAlias id = playlist_vmenu alias = current_menu
    kill_start_key_binding
    add_tracks_to_menu
    wait 2 gameframes
    SetScreenElementProps id = playlist_scrolling_menu reset_window_top
    if LevelIs load_mainmenu
        end_pos = (320.0, 222.0)
    endif
    finish_themed_sub_menu menu = playlist_menu end_pos = <end_pos>
    FireEvent type = focus target = playlist_hmenu
endscript


script exit_playlist_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if GotParam from_options
        create_sound_options_menu from_options
    else
        create_sound_options_menu
    endif
endscript


script add_tracks_to_menu 
    GetArraySize playlist_tracks
    index = 0
    begin 
    if ((<index> = locked_track1)|| (<index> = locked_track2))
        CreateScreenElement {
            type = ContainerElement
            parent = current_menu
            dims = (0.0, 0.0)
            heap = TopDown
            not_focusable
        }
    else
        playlist_menu_add_item { index = <index> }
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script change_track_state 
    gettags
    if TrackEnabled <index>
        ChangeTrackState <index> Off
        PauseMusic 1
        if ScreenElementExists id = {<id> child = 4}
            DoScreenElementMorph id = {<id> child = 4}alpha = 0
        endif
    else
        ChangeTrackState <index> on
        if ScreenElementExists id = {<id> child = 4}
            DoScreenElementMorph id = {<id> child = 4}alpha = 1
        endif
    endif
    update_genre_checks
endscript


script is_genre_on 
    
    on = 1
    GetArraySize playlist_tracks
    index = 0
    begin 
    if (((playlist_tracks [ <index> ]).genre)= <genre>)
        if ((<index> = locked_track1)|| (<index> = locked_track2))
        else
            if NOT TrackEnabled <index>
                on = 0
                break 
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    return on = <on>
endscript


script toggle_playlist_genre genre = 0
    found_first = 0
    GetArraySize playlist_tracks
    index = 0
    begin 
    if (((playlist_tracks [ <index> ]).genre)= <genre>)
        if (<found_first> = 0)
            found_first = 1
            if TrackEnabled <index>
                toggle = 0
            else
                toggle = 1
            endif
        endif
        if (<toggle> = 1)
            if ScreenElementExists id = {playlist_vmenu child = {<index> child = 4}}
                ChangeTrackState <index> on
                DoScreenElementMorph id = {playlist_vmenu child = {<index> child = 4}}alpha = 1
            endif
        else
            if ScreenElementExists id = {playlist_vmenu child = {<index> child = 4}}
                ChangeTrackState <index> Off
                DoScreenElementMorph id = {playlist_vmenu child = {<index> child = 4}}alpha = 0
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    StopSound ThisMenuSelectSound
    playsound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound
    update_genre_checks
endscript


script preview_music_track 
    gettags
    if NOT TrackEnabled <index>
        ChangeTrackState <index> on
        if ScreenElementExists id = {<id> child = 4}
            DoScreenElementMorph id = {<id> child = 4}alpha = 1
        endif
    endif
    if MusicIsPaused
        StopMusic
        PauseMusic 0
        wait 1 gameframes
        PlayTrack <index>
    else
        PauseMusic 1
    endif
    update_genre_checks
endscript


script playlist_hmenu_add_item 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    switch <genre>
        case 0
        dims = (130.0, 50.0)
        case 1
        dims = (165.0, 50.0)
        case 2
        dims = (220.0, 50.0)
        default 
        return 
    endswitch
    CreateScreenElement {
        type = ContainerElement
        parent = playlist_hmenu
        dims = <dims>
        event_handlers = [{pad_choose toggle_playlist_genre params = { genre = <genre> }}
            { focus playlist_hmenu_focus }
            { unfocus playlist_hmenu_unfocus }
        ]
    }
    anchor_id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        z_priority = 50
        font = small
        text = <text>
        rgba = <off_rgba>
        Scale = 1.500
        just = [ left center ]
    }
    GetStackedScreenElementPos x id = <id> Offset = (4.0, 13.0)
    is_genre_on genre = <genre>
    if (<on> = 1)
        alpha = 1
    else
        alpha = 0
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = checkmark
        Pos = <Pos>
        alpha = <alpha>
        just = [ left center ]
        rgba = <off_rgba>
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = checkbox
        Pos = (<Pos> + (0.0, 5.0))
        just = [ left center ]
        Scale = 0.5000
        rgba = <off_rgba>
        z_priority = 5
    }
endscript


script update_genre_checks 
    genre = 0
    begin 
    is_genre_on genre = <genre>
    if (<on> = 1)
        alpha = 1
    else
        alpha = 0
    endif
    DoScreenElementMorph id = {playlist_hmenu child = {<genre> child = 1}}alpha = <alpha>
    genre = (<genre> + 1)
    repeat 3
endscript


script playlist_hmenu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = on_rgba
    DoScreenElementMorph {id = {<id> child = 0}rgba = <on_rgba>}
    DoScreenElementMorph {id = {<id> child = 1}rgba = <on_rgba>}
    playlist_hmenu ::gettags
    if GotParam arrow_id
        blink_arrow { id = <arrow_id> }
    endif
endscript


script playlist_hmenu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    DoScreenElementMorph {id = {<id> child = 0}rgba = <off_rgba>}
    DoScreenElementMorph {id = {<id> child = 1}rgba = <off_rgba>}
    playlist_hmenu ::gettags
    if GotParam arrow_id
        blink_arrow { id = <arrow_id> }
    endif
endscript


script focus_playlist_hmenu 
    gettags
    if (<tag_selected_id> = top_item)
        FireEvent type = unfocus target = playlist_vmenu
        DoScreenElementMorph id = playlist_bottom_anchor alpha = 0.5000
        FireEvent type = focus target = playlist_hmenu
        DoScreenElementMorph id = playlist_top_anchor alpha = 1.0
    endif
endscript


script focus_playlist_vmenu 
    FireEvent type = unfocus target = playlist_hmenu
    DoScreenElementMorph id = playlist_top_anchor alpha = 0.5000
    FireEvent type = focus target = playlist_vmenu
    DoScreenElementMorph id = playlist_bottom_anchor alpha = 1.0
endscript


script playlist_menu_add_item highlight_bar_scale = (4.349999904632568, 0.5) highlight_bar_pos = (321.0, 0.0)
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    if (<index> = 0)
        id = top_item
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        id = <id>
        dims = (500.0, 20.0)
        event_handlers = [{focus playlist_menu_focus params = <focus_params>}
            { unfocus playlist_menu_unfocus }
            {pad_choose change_track_state params = { index = <index> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_start change_track_state params = { index = <index> }}
            { pad_start generic_menu_pad_choose_sound }
            {pad_option preview_music_track params = { index = <index> }}
        ]
        heap = TopDown
    }
    <anchor_id> = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Pos = <highlight_bar_pos>
        Scale = <highlight_bar_scale>
        just = [ center center ]
        rgba = <bar_rgba>
        alpha = 0
        z_priority = 3
        heap = TopDown
    }
    band = ((playlist_tracks [ <index> ]).band)
    track_title = ((playlist_tracks [ <index> ]).track_title)
    genre = ((playlist_tracks [ <index> ]).genre)
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <band>
        Pos = (55.0, 0.0)
        just = [ left center ]
        rgba = <off_rgba>
        Scale = 0.7000
        heap = TopDown
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <track_title>
        Pos = (220.0, 0.0)
        just = [ left center ]
        rgba = <off_rgba>
        Scale = 0.7000
        heap = TopDown
    }
    switch <genre>
        case 0
        genre_text = 'Punk'
        case 1
        genre_text = 'Hip Hop'
        case 2
        genre_text = 'Rock/Other'
        default 
        genre_text = ''
    endswitch
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <genre_text>
        Pos = (510.0, 0.0)
        just = [ center center ]
        rgba = <off_rgba>
        Scale = 0.7000
        heap = TopDown
    }
    if TrackEnabled <index>
        alpha = 1
    else
        alpha = 0
    endif
    checkboxpos = (568.0, -4.0)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = checkmark
        Pos = <checkboxpos>
        alpha = <alpha>
        just = [ left center ]
        rgba = <off_rgba>
        z_priority = 5
        heap = TopDown
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = checkbox
        Pos = (<checkboxpos> + (0.0, 5.0))
        just = [ left center ]
        Scale = 0.5000
        rgba = <off_rgba>
        z_priority = 4
        heap = TopDown
    }
endscript


script playlist_menu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = on_rgba
    DoScreenElementMorph id = {<id> child = 0}alpha = 1
    index = 1
    begin 
    if ScreenElementExists id = {<id> child = <index>}
        DoScreenElementMorph {id = {<id> child = <index>}rgba = <on_rgba>}
    else
        break 
    endif
    index = (<index> + 1)
    repeat 4
    playlist_vmenu ::gettags
    if GotParam arrow_id
        menu_vert_blink_arrow { id = <arrow_id> }
    endif
    generic_menu_update_arrows menu_id = playlist_vmenu up_arrow_id = view_gaps_menu_up_arrow down_arrow_id = view_gaps_menu_down_arrow
endscript


script playlist_menu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    DoScreenElementMorph id = {<id> child = 0}alpha = 0
    index = 1
    begin 
    if ScreenElementExists id = {<id> child = <index>}
        DoScreenElementMorph {id = {<id> child = <index>}rgba = <off_rgba>}
    else
        break 
    endif
    index = (<index> + 1)
    repeat 
    PauseMusic 1
endscript


script create_soundtrack_menu 
    make_new_themed_scrolling_menu Title = 'SOUNDTRACKS'
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_sound_options_menu }}
        ]
    }
    theme_menu_add_item {text = 'THUG 2 Playlist'
        pad_choose_script = SetSoundtrack
        pad_choose_params = { track = '' }
        centered
        no_bg
        first_item
    }
    if IsXbox
        GetNumSoundtracks
    else
        numsoundtracks = 0
    endif
    if (<numsoundtracks> > 0)
        index = 0
        begin 
        GetSoundtrackName <index>
        theme_menu_add_item {text = <soundtrackname>
            pad_choose_script = SetSoundtrack
            pad_choose_params = { track = <soundtrackname> }
            centered
            no_bg
            max_width = 380
        }
        <index> = (<index> + 1)
        repeat <numsoundtracks>
    endif
    theme_menu_add_item {text = 'Done'
        id = menu_done
        pad_choose_script = create_sound_options_menu
        centered
        no_bg
        last_item
    }
    finish_themed_scrolling_menu
endscript


script SetSoundtrack 
    if IsPs2
        return 
    endif
    FormatText checksumname = trackchecksum '%t' t = <track>
    
    generic_menu_pad_choose
    SoundtrackExists trackname = <track>
    
    if NOT (current_soundtrack = <trackchecksum>)
        StopMusic
    endif
    if (<index> = -1)
        
        UseStandardSoundtrack
    else
        
        UseUserSoundtrack <index>
    endif
    change current_soundtrack = <trackchecksum>
    if LevelIs load_mainmenu
        create_sound_options_menu
    else
        create_sound_options_menu from_options
    endif
endscript


script SoundtrackExists trackname = ''
    
    FormatText checksumname = tracknamesum '%t' t = <trackname>
    GetNumSoundtracks
    if NOT (<numsoundtracks> = 0)
        index = 0
        begin 
        GetSoundtrackName <index>
        
        FormatText checksumname = soundtracksum '%s' s = <soundtrackname>
        if (<tracknamesum> = <soundtracksum>)
            return { index = <index> }
        endif
        index = (<index> + 1)
        repeat <numsoundtracks>
    endif
    return { index = -1 }
endscript


script set_loaded_soundtrack 
    
    if NOT IsXbox
        return 
    endif
    current_soundtrack_exists
    if NOT (current_soundtrack = #"0xffffffff")
        StopMusic
    endif
    if (<index> = -1)
        
        UseStandardSoundtrack
        trackchecksum = #"0xffffffff"
    else
        
        UseUserSoundtrack <index>
    endif
    change current_soundtrack = <trackchecksum>
endscript


script current_soundtrack_exists 
    GetNumSoundtracks
    if NOT (<numsoundtracks> = 0)
        index = 0
        begin 
        GetSoundtrackName <index>
        FormatText checksumname = soundtracksum '%s' s = <soundtrackname>
        if (current_soundtrack = <soundtracksum>)
            return { index = <index> }
        endif
        index = (<index> + 1)
        repeat <numsoundtracks>
    endif
    return { index = -1 }
endscript

