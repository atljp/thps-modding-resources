debug_igc_camera = 0
igc_camera_show_frame_info = 0
igc_camera_structure = [
    { Component = cinematiccamera updatewhencamerainactive = false }
    { Component = camera }
]
cinematic_camera_default_lerp_params = { on = 1 slow_lerp_factor = 0.6000 fast_lerp_factor = 0.0 lerp_dropoff = 16.0 }

script igc_runcamerascript 
    CinematicCamera_On
    if GotParam ControlScript
        <ControlScript> <params>
    else
        CinematicCamera_SetSmoothing on = 1 fast_lerp_factor = 0.6000
        CinematicCamera_DoMorph <...> 
        if GotParam frames
            wait <frames> frames
        endif
    endif
    if GotParam Play_hold
        play_hold_value = <Play_hold>
        if GotParam play_hold_value
            if NOT (<play_hold_value> = 1)
                RemoveParameter Play_hold
            endif
        endif
        if GotParam Play_hold
            begin 
            wait 1 gameframes
            repeat 
        endif
    endif
endscript

script igc_camera_update_frame_count 
    if NOT ScreenElementExists id = igc_camera_frame_info
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            parent = root_window
            id = igc_camera_frame_info
            type = ContainerElement
            z_priority = 10000
        }
        CreateScreenElement {
            type = TextElement
            parent = igc_camera_frame_info
            local_id = counter1
            Pos = (25.0, 400.0)
            text = ''
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = igc_camera_frame_info
            local_id = counter2
            Pos = (25.0, 418.0)
            text = ''
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
    endif
    FormatText {
        textname = text1
        'Frame %f'
        f = <frames>
    }
    FormatText {
        textname = text2
        '%m:%s:%p'
        m = <minutes>
        s = <seconds>
        p = <pct>
        integer_width = 2
    }
    SetScreenElementProps id = { igc_camera_frame_info child = counter1 }text = <text1>
    SetScreenElementProps id = { igc_camera_frame_info child = counter2 }text = <text2>
endscript

script igc_camera_frame_counter_kill 
    if ScreenElementExists \{ id = igc_camera_frame_info }
        DestroyScreenElement \{ id = igc_camera_frame_info }
    endif
endscript
