current_soundtrack = #"0xffffffff"

script launch_sound_options_menu 
    if GotParam \{ from_options }
        create_sound_options_menu \{ from_options }
    else
        if GotParam \{ from_parked }
            create_sound_options_menu \{ from_parked }
        else
            create_sound_options_menu
        endif
    endif
endscript

script create_sound_options_menu 
    SetMusicVolume MusicVolOutsideBox
    make_label_menu {
        menu_id = menu_sound
        vmenu_id = vmenu_sound
        Title = 'SOUNDOPTIONEN'
        title_pos = (30.0, 30.0)
        title_rotation = 0
        Pos = (55.0, 95.0)
        spacing = 3
    }
    if InFrontend
        PauseMusic 0
    endif
    create_helper_text {
        helper_text_elements = [
            { text = '\b7/\b4 = Wählen' }
            { text = '\b6/\b5 = Lautstärke anpassen' }
            { text = '\m1 = Zurück' }
            { text = '\m0 = OK' }
        ]
    }
    if GotParam from_parked
        flag = from_parked
    else
        flag = ''
    endif
    SetScreenElementProps {
        id = vmenu_sound
        event_handlers = [
            {pad_back generic_menu_pad_back params = {callback = sound_options_exit <flag>}}
        ]
    }
    if GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
        song_text = 'Zufällig'
    else
        song_text = 'Reihenfolge'
    endif
    if IsTrue forceambientsfxtomusicvolume
        sound_override = not_focusable
        song_text = 'Musik lauter!'
    endif
    add_label_menu_item {
        id = menu_song_order
        text = 'SONGS:'
        extra_text = <song_text>
        rot = -2
        padding = 20
        text_offset = (0.0, 0.0)
        <sound_override>
        option_arrows
        option_arrows_callback = toggle_song_order
    }
    add_label_menu_item {
        id = menu_skip_track
        text = 'SONG ÜBERSPRINGEN'
        rot = 1
        Length = 170
        label_offset = (-15.0, 0.0)
        text_offset = (-5.0, 0.0)
        focus_script = skip_track_focus
        unfocus_script = skip_track_unfocus
        pad_choose_script = skip_track
        <sound_override>
    }
    if (IsXbox)
        if NOT (DEMO_BUILD)
            add_label_menu_item {
                id = menu_soundtrack
                text = 'SOUNDTRACK'
                rot = -1
                Length = 180
                text_offset = (-10.0, 0.0)
                pad_choose_script = create_soundtrack_menu
                <sound_override>
            }
        endif
    endif
    if NOT InNetGame
        if (current_soundtrack = #"0xffffffff")
            flag = ''
        else
            flag = not_focusable
        endif
        add_label_menu_item {
            id = menu_playlist
            text = 'SONGLISTE'
            rot = 0
            Length = 140
            text_offset = (0.0, 0.0)
            padding = 30
            pad_choose_script = create_playlist_menu
            <sound_override>
            <flag>
        }
    endif
    value = (MusicVolOutsideBox / 10)
    displayvalue = <value>
    CastToInteger displayvalue
    FormatText textname = cdvol '%v' v = <displayvalue>
    add_label_menu_item {
        id = menu_music_level
        text = 'MUSIKLAUTSTÄRKE:'
        extra_text = <cdvol>
        rot = -1
        padding = 40
        text_offset = (-15.0, 0.0)
        focus_script = menu_music_special_focus
        unfocus_script = menu_music_special_unfocus
        option_arrows
        option_arrows_callback = menu_alter_music
    }
    menu_music_level ::menu_alter_music
    GetValueFromVolume sfxvol
    FormatText textname = sfxvol '%v' v = <value>
    add_label_menu_item {
        id = menu_sound_level
        text = 'SOUNDLAUTSTÄRKE:'
        extra_text = <sfxvol>
        rot = 1
        Length = 288
        label_offset = (-25.0, 0.0)
        text_offset = (10.0, 0.0)
        focus_script = label_menu_item_focus
        unfocus_script = label_menu_item_unfocus
        option_arrows
        option_arrows_callback = menu_alter_sound
    }
    menu_sound_level ::menu_alter_sound
    if GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
        sounds_specialsounds = 'AUS'
    else
        sounds_specialsounds = 'EIN'
    endif
    add_label_menu_item {
        id = menu_sound_special
        text = 'SPEZIALSOUNDS:'
        extra_text = <sounds_specialsounds>
        rot = 0
        padding = 40
        label_offset = (15.0, 0.0)
        text_offset = (-5.0, 0.0)
        focus_script = label_menu_item_focus
        unfocus_script = label_menu_item_unfocus
        option_arrows
        option_arrows_callback = toggle_special_sounds
    }
    if GetGlobalFlag flag = SOUNDS_MUSICBOXES_OFF
        sounds_music_boxes = 'AUS'
    else
        sounds_music_boxes = 'EIN'
    endif
    add_label_menu_item {
        id = menu_sound_zones
        text = 'MUSIKZONEN:'
        extra_text = <sounds_music_boxes>
        rot = -1
        padding = 40
        label_offset = (-5.0, 0.0)
        text_offset = (-10.0, 0.0)
        focus_script = label_menu_item_focus
        unfocus_script = label_menu_item_unfocus
        option_arrows
        option_arrows_callback = toggle_music_zones
    }
    Theme_GetHighlightedTextColor return_value = checkmark_rgba
    Theme_GetUnhighlightedTextColor return_value = checkbox_rgba
    if GotParam from_options
        params = from_options
    else
        if GotParam from_parked
            params = from_parked
        else
            params = ''
        endif
    endif
    add_label_menu_item {
        id = menu_done
        text = 'FERTIG'
        rot = 2
        Length = 110
        label_offset = (10.0, 0.0)
        text_offset = (0.0, 0.0)
        pad_choose_script = sound_options_exit
        pad_choose_params = { <params> }
    }
    add_music_track_text
    if InFrontend
    else
        PauseMusic
    endif
    label_menu_finish
endscript

script GetTracksEnabled 
    <num_enabled> = 0
    GetArraySize \{ playlist_tracks }
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
    if InFrontend
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
    current_genre = (playlist_genres [(playlist_tracks [ <current_track> ].genre)])
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
        just = [ RIGHT center ]
        Scale = (1.0, 1.0)
        Pos = (36.0, 35.0)
        rgba = [ 0 94 116 128 ]
        alpha = 0.8000
        z_priority = 1
    }
    GetScreenElementDims id = music_band_text
    if (<width> > 240)
        <Scale> = (240.0 / <width>)
        DoScreenElementMorph id = music_band_text time = 0 Scale = <Scale>
    endif
    CreateScreenElement {
        type = TextElement
        parent = music_track_anchor
        id = music_track_text
        text = <current_track_text>
        font = dialog
        just = [ RIGHT center ]
        Scale = (1.0, 1.0)
        Pos = (36.0, 52.0)
        rgba = [ 0 94 116 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    GetScreenElementDims id = music_track_text
    if (<width> > 240)
        <Scale> = (240.0 / <width>)
        DoScreenElementMorph id = music_track_text time = 0 Scale = <Scale>
    endif
    CreateScreenElement {
        type = TextElement
        parent = music_track_anchor
        id = music_track_genre
        text = <current_genre>
        font = small
        just = [ RIGHT top ]
        Scale = (0.800000011920929, 0.6000000238418579)
        Pos = (32.0, 58.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = music_track_anchor
        texture = kyron
        just = [ center center ]
        Scale = (4.300000190734863, 1.100000023841858)
        Pos = (-84.0, 47.0)
        rgba = [ 128 128 128 128 ]
        rot_angle = 0
        z_priority = -1
    }
    if IsTrue forceambientsfxtomusicvolume
        DoScreenElementMorph id = music_track_anchor alpha = 0
    endif
endscript

script spawn_update_music_track_text 
    if ScreenElementExists \{ id = music_track_anchor }
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
    current_genre = (playlist_genres [(playlist_tracks [ <current_track> ].genre)])
    FormatText textname = current_track_text '\'\'%t\'\'' t = ((playlist_tracks [ <current_track> ]).track_title)
    if ScreenElementExists id = music_band_text
        SetScreenElementProps id = music_band_text text = <current_band_text>
        SetScreenElementProps id = music_track_text text = <current_track_text>
        SetScreenElementProps id = music_track_genre text = <current_genre>
    endif
    DoScreenElementMorph id = music_band_text time = 0 Scale = 1.0
    GetScreenElementDims id = music_band_text
    if (<width> > 240)
        <Scale> = (240.0 / <width>)
        DoScreenElementMorph id = music_band_text time = 0 Scale = <Scale>
    endif
    DoScreenElementMorph id = music_track_text time = 0 Scale = 1.0
    GetScreenElementDims id = music_track_text
    if (<width> > 240)
        <Scale> = (240.0 / <width>)
        DoScreenElementMorph id = music_track_text time = 0 Scale = <Scale>
    endif
    if ScreenElementExists id = music_track_anchor
        generic_menu_animate_in force menu = music_track_anchor Pos = <old_pos>
    endif
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
    if NOT InFrontend
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

script toggle_song_order 
    if NOT GetGlobalFlag \{ flag = SOUNDS_SONGORDER_RANDOM }
        SetScreenElementProps \{id = { menu_song_order child = extra_text }text = 'Zufällig'}
        PlaySongsRandomly
        SetGlobalFlag \{ flag = SOUNDS_SONGORDER_RANDOM }
    else
        SetScreenElementProps \{id = { menu_song_order child = extra_text }text = 'Reihenfolge'}
        PlaySongsInOrder
        UnsetGlobalFlag \{ flag = SOUNDS_SONGORDER_RANDOM }
    endif
endscript

script toggle_special_sounds 
    if NOT GetGlobalFlag \{ flag = SOUNDS_SPECIALSOUNDS_OFF }
        SetGlobalFlag \{ flag = SOUNDS_SPECIALSOUNDS_OFF }
        SetScreenElementProps \{id = { menu_sound_special child = extra_text }text = 'AUS'}
    else
        UnsetGlobalFlag \{ flag = SOUNDS_SPECIALSOUNDS_OFF }
        playsound \{ HUD_specialtrickAA }
        SetScreenElementProps \{id = { menu_sound_special child = extra_text }text = 'EIN'}
    endif
endscript

script toggle_music_zones 
    if NOT GetGlobalFlag \{ flag = SOUNDS_MUSICBOXES_OFF }
        SetGlobalFlag \{ flag = SOUNDS_MUSICBOXES_OFF }
        change \{ music_was_paused = 0 }
        SetScreenElementProps \{id = { menu_sound_zones child = extra_text }text = 'AUS'}
    else
        UnsetGlobalFlag \{ flag = SOUNDS_MUSICBOXES_OFF }
        SetScreenElementProps \{id = { menu_sound_zones child = extra_text }text = 'EIN'}
    endif
    if NOT InFrontend
        root_window ::settags \{ need_music_zone_refresh }
    endif
endscript

script menu_alter_music 
    gettags
    value = (MusicVolOutsideBox / 10)
    CastToInteger value
    left_rgba = [ 128 128 128 128 ]
    right_rgba = [ 128 128 128 128 ]
    if GotParam left
        if (<value> > 0)
            <value> = (<value> - 1)
        endif
        sound_options_set_level level = <value> id = menu_music_level type = cdvol
        if (<value> = 0)
            set_music_ambient_state
        endif
    else
        if GotParam RIGHT
            if (<value> < 10)
                <value> = (<value> + 1)
            endif
            sound_options_set_level level = <value> id = menu_music_level type = cdvol
            if (<value> = 1)
                set_music_ambient_state
            endif
        endif
    endif
    if (<value> = 0)
        left_rgba = [ 128 128 128 0 ]
    else
        if (<value> = 10)
            right_rgba = [ 128 128 128 0 ]
        endif
    endif
    SetScreenElementProps {
        id = { menu_music_level child = arrow_left }
        rgba = <left_rgba>
    }
    SetScreenElementProps {
        id = { menu_music_level child = arrow_right }
        rgba = <right_rgba>
    }
endscript

script menu_alter_sound 
    gettags
    GetValueFromVolume sfxvol
    left_rgba = [ 128 128 128 128 ]
    right_rgba = [ 128 128 128 128 ]
    if GotParam left
        if (<value> > 0)
            <value> = (<value> - 1)
            playsound SK6_Menu_Horizontal vol = 70
        endif
    else
        if GotParam RIGHT
            if (<value> < 10)
                <value> = (<value> + 1)
                playsound SK6_Menu_Horizontal vol = 70
            endif
        endif
    endif
    sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
    if (<value> = 0)
        left_rgba = [ 128 128 128 0 ]
    else
        if (<value> = 10)
            right_rgba = [ 128 128 128 0 ]
        endif
    endif
    SetScreenElementProps {
        id = { menu_sound_level child = arrow_left }
        rgba = <left_rgba>
    }
    SetScreenElementProps {
        id = { menu_sound_level child = arrow_right }
        rgba = <right_rgba>
    }
endscript

script menu_music_special_focus 
    if NOT InFrontend
        PauseMusic \{ 0 }
    endif
    label_menu_item_focus <...> 
endscript

script menu_music_special_unfocus 
    label_menu_item_unfocus <...> 
    if NOT InFrontend
        PauseMusic \{ 1 }
    endif
endscript

script skip_track_focus 
    if NOT InFrontend
        PauseMusic \{ 0 }
    endif
    label_menu_item_focus <...> 
endscript

script skip_track_unfocus 
    label_menu_item_unfocus <...> 
    if NOT InFrontend
        PauseMusic \{ 1 }
    endif
endscript

script sound_options_set_level 
    FormatText textname = vol '%v' v = <level>
    if GotParam \{ id }
        SetScreenElementProps {
            id = {<id> child = extra_text}
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
    DoMorph \{ time = 0.05000 Scale = 0.9000 }
    DoMorph \{ time = 0.05000 Scale = 1.0 }
endscript

script create_playlist_menu 
    if InFrontend
        PauseMusic 1
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
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
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_bg_anchor
        texture = sirius_logo
        Pos = (110.0, 62.0)
        Scale = (1.399999976158142, 0.800000011920929)
        z_priority = 9
        rgba = [ 100 100 100 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_bg_anchor
        texture = white2
        Pos = (10.0, 62.0)
        Scale = (6.0, 6.400000095367432)
        z_priority = 9
        rgba = [ 100 100 100 128 ]
    }
    AssignAlias id = playlist_bg_anchor alias = current_menu_anchor
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Wählen' }
            { text = '\m1 = Zurück' }
            { text = '\b3 = Ändern' }
            { text = '\me = Song einhören' }
        ]
    }
    kill_start_key_binding
    if InFrontend
        build_theme_sub_title Title = 'SONGLISTE' no_grad_bar
    else
        build_theme_sub_title Title = 'SONGLISTE'
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
    playlist_hmenu_add_item {text = 'Rock/Sonst.' genre = 2}
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 0.800000011920929)
        Pos = (36.0, 130.0)
        rgba = [ 0 58 73 108 ]
        just = [ left top ]
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 0.05000000074505806)
        Pos = (36.0, 138.0)
        rgba = [ 0 58 73 128 ]
        just = [ left top ]
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 0.6000000238418579)
        Pos = (36.0, 160.0)
        rgba = [ 0 58 73 108 ]
        just = [ left top ]
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = playlist_menu
        texture = white2
        Scale = (71.0, 0.6000000238418579)
        Pos = (36.0, 370.0)
        rgba = [ 0 58 73 108 ]
        just = [ left top ]
        z_priority = 4
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
        rgba = [ 2 103 123 128 ]
        Pos = (75.0, 150.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = playlist_bottom_anchor
        text = 'Song'
        font = dialog
        Scale = 1
        rgba = [ 2 103 123 128 ]
        Pos = (265.0, 150.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = playlist_bottom_anchor
        text = 'Genre'
        font = dialog
        Scale = 1
        rgba = [ 2 103 123 128 ]
        Pos = (505.0, 150.0)
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
    if InFrontend
        end_pos = (320.0, 222.0)
    endif
    finish_themed_sub_menu menu = playlist_menu end_pos = <end_pos>
    FireEvent type = focus target = playlist_hmenu
endscript

script exit_playlist_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if GotParam \{ from_options }
        create_sound_options_menu \{ from_options }
    else
        create_sound_options_menu
    endif
endscript

script add_tracks_to_menu 
    GetArraySize \{ playlist_tracks }
    index = 0
    begin 
    if ((<index> = locked_track1)|| (<index> = locked_track2))
        CreateScreenElement \{type = ContainerElement parent = current_menu dims = (0.0, 0.0) heap = TopDown not_focusable}
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
    printf \{ 'is_genre_on' }
    on = 1
    GetArraySize \{ playlist_tracks }
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
        PauseMusic \{ 0 }
        wait \{ 1 gameframes }
        PlayTrack <index>
    else
        PauseMusic \{ 1 }
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
    Theme_GetHighlightedTextColor \{ return_value = on_rgba }
    DoScreenElementMorph {id = {<id> child = 0}rgba = <on_rgba>}
    DoScreenElementMorph {id = {<id> child = 1}rgba = <on_rgba>}
    playlist_hmenu ::gettags
    if GotParam \{ arrow_id }
        blink_arrow { id = <arrow_id> }
    endif
endscript

script playlist_hmenu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor \{ return_value = off_rgba }
    DoScreenElementMorph {id = {<id> child = 0}rgba = <off_rgba>}
    DoScreenElementMorph {id = {<id> child = 1}rgba = <off_rgba>}
    playlist_hmenu ::gettags
    if GotParam \{ arrow_id }
        blink_arrow { id = <arrow_id> }
    endif
endscript

script focus_playlist_hmenu 
    gettags
    if (<tag_selected_id> = top_item)
        FireEvent \{ type = unfocus target = playlist_vmenu }
        DoScreenElementMorph \{ id = playlist_bottom_anchor alpha = 0.5000 }
        FireEvent \{ type = focus target = playlist_hmenu }
        DoScreenElementMorph \{ id = playlist_top_anchor alpha = 1.0 }
    endif
endscript

script focus_playlist_vmenu 
    FireEvent \{ type = unfocus target = playlist_hmenu }
    DoScreenElementMorph \{ id = playlist_top_anchor alpha = 0.5000 }
    FireEvent \{ type = focus target = playlist_vmenu }
    DoScreenElementMorph \{ id = playlist_bottom_anchor alpha = 1.0 }
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
        Pos = (50.0, 0.0)
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
        Pos = (245.0, 0.0)
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
        genre_text = 'Rock/Sonst.'
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
    Theme_GetUnhighlightedTextColor \{ return_value = off_rgba }
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
    PauseMusic \{ 1 }
endscript

script create_soundtrack_menu 
    make_new_themed_sub_menu Title = 'SOUNDTRACKS' scrolling skateshop_pos = (230.0, 100.0) dims = (300.0, 250.0) right_bracket_z = 1
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_sound_options_menu }}
        ]
    }
    theme_menu_add_item {text = 'American Wasteland-Songliste'
        pad_choose_script = SetSoundtrack
        pad_choose_params = { track = '' }
        centered
        no_bg
        first_item
    }
    if ((IsXbox)|| (isPC))
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
    theme_menu_add_item {text = 'Fertig'
        id = menu_done
        pad_choose_script = create_sound_options_menu
        centered
        no_bg
        last_item
    }
    finish_themed_scrolling_menu force_end_pos
endscript

script SetSoundtrack 
    if IsPs2
        return 
    endif
    FormatText checksumname = trackchecksum '%t' t = <track>
    printf 'soundtrack = %i' i = <trackchecksum>
    generic_menu_pad_choose
    SoundtrackExists trackname = <track>
    printf 'soundtrack index = %i' i = <index>
    if NOT (current_soundtrack = <trackchecksum>)
        StopMusic
    endif
    if (<index> = -1)
        printf 'use playlist'
        UseStandardSoundtrack
    else
        printf 'use soundtrack'
        UseUserSoundtrack <index>
    endif
    change current_soundtrack = <trackchecksum>
    if InFrontend
        create_sound_options_menu
    else
        create_sound_options_menu from_options
    endif
endscript

script SoundtrackExists trackname = ''
    printf 'trackname = %t' t = <trackname>
    FormatText checksumname = tracknamesum '%t' t = <trackname>
    GetNumSoundtracks
    if NOT (<numsoundtracks> = 0)
        index = 0
        begin 
        GetSoundtrackName <index>
        printf 'soundtrackname = %t' t = <soundtrackname>
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
    printf 'set_loaded_soundtrack'
    if NOT ((IsXbox)|| (isPC))
        return 
    endif
    current_soundtrack_exists
    if NOT (current_soundtrack = #"0xffffffff")
        StopMusic
    endif
    if (<index> = -1)
        printf 'use playlist'
        UseStandardSoundtrack
        trackchecksum = #"0xffffffff"
    else
        printf 'use soundtrack %i' i = <index>
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
    return \{ index = -1 }
endscript
