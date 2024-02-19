camera_fov = 72.0
widescreen_camera_fov = 88.18
compact_camera_fov = 80.0
current_screen_mode = standard_screen_mode
last_screen_mode = standard_screen_mode

script screen_setup_standard 
    SetScreen \{ aspect = 1.333 Angle = camera_fov letterbox = 0 }
    change \{ current_screen_mode = standard_screen_mode }
    printf \{ 'change to standard' }
endscript

script screen_setup_widescreen 
    SetScreen \{ aspect = 1.778 Angle = widescreen_camera_fov letterbox = 0 }
    change \{ current_screen_mode = widescreen_screen_mode }
    printf \{ 'change to widescreen' }
endscript

script screen_setup_letterbox 
    SetScreen \{ aspect = 1.778 Angle = widescreen_camera_fov letterbox = 1 }
    change \{ current_screen_mode = letterbox_screen_mode }
    printf \{ 'change to letterbox' }
endscript

script fake_letterboxing 
    if NOT GotParam remove
        switch (current_screen_mode)
            case standard_screen_mode
            fake_letterboxing_elements
            change last_screen_mode = standard_screen_mode
            case widescreen_screen_mode
            change last_screen_mode = widescreen_screen_mode
            case letterbox_screen_mode
            change last_screen_mode = letterbox_screen_mode
            default 
            printf 'current screen mode = %d' d = current_screen_mode
            script_assert 'Unrecognized screen mode'
        endswitch
    else
        switch (last_screen_mode)
            case standard_screen_mode
            fake_letterboxing_elements remove
            case widescreen_screen_mode
            printf 'last screen mode = %d' d = last_screen_mode
            NullScript
            case letterbox_screen_mode
            printf 'last screen mode = %d' d = last_screen_mode
            NullScript
            default 
            printf 'last screen mode = %d' d = last_screen_mode
            script_assert 'Unrecognized screen mode'
        endswitch
    endif
endscript

script fake_letterboxing_elements 
    if ScreenElementExists id = letterbox_anchor
        DestroyScreenElement id = letterbox_anchor
    endif
    if GotParam remove
        SetScreen Angle = 72.0 aspect = 1.333
        return 
    else
        SetScreen Angle = 88.18 aspect = 1.333
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        id = letterbox_anchor
        parent = root_window
        z_priority = 999
        just = [ center center ]
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = letterbox_anchor
        texture = white2
        Scale = (100.0, 9.5)
        Pos = (0.0, -20.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 15
    }
    CreateScreenElement {
        type = SpriteElement
        parent = letterbox_anchor
        texture = white2
        Scale = (100.0, 12.0)
        Pos = (0.0, 392.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 15
    }
endscript
