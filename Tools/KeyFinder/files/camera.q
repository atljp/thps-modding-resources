
camera_fov = 72.0
widescreen_camera_fov = 88.18
compact_camera_fov = 80.0
current_screen_mode = standard_screen_mode

script screen_setup_standard 
    SetScreen aspect = 1.333 Angle = camera_fov letterbox = 0
    if GotParam set_screen_flags
        UnsetGlobalFlag flag = SCREEN_MODE_WIDE
        SetGlobalFlag flag = SCREEN_MODE_STANDARD
    endif
    change current_screen_mode = standard_screen_mode
    
endscript


script screen_setup_widescreen 
    SetScreen aspect = 1.778 Angle = widescreen_camera_fov letterbox = 0
    if GotParam set_screen_flags
        UnsetGlobalFlag flag = SCREEN_MODE_STANDARD
        SetGlobalFlag flag = SCREEN_MODE_WIDE
    endif
    change current_screen_mode = widescreen_screen_mode
    
endscript


script screen_setup_letterbox 
    SetScreen aspect = 1.778 Angle = widescreen_camera_fov letterbox = 1
    if GotParam set_screen_flags
        SetGlobalFlag flag = SCREEN_MODE_STANDARD
        SetGlobalFlag flag = SCREEN_MODE_WIDE
    endif
    change current_screen_mode = letterbox_screen_mode
    
endscript

