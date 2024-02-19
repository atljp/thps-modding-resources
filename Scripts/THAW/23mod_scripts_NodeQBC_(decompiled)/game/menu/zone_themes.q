
script zone_message_panel_create 
    if NOT ScreenElementExists \{ id = zone_message_panel }
        SetScreenElementLock \{ id = root_window Off }
        CreateScreenElement \{ id = zone_message_panel parent = root_window type = ContainerElement alpha = 1 }
    endif
endscript

script hide_zone_messages 
    if ScreenElementExists \{ id = zone_message_panel }
        zone_message_panel ::DoMorph \{ alpha = 0 }
    endif
endscript

script show_zone_messages 
    if ScreenElementExists \{ id = zone_message_panel }
        zone_message_panel ::DoMorph \{ alpha = 1 }
    endif
endscript

script zone_welcome_message 
    if GetGlobalFlag flag = NO_DISPLAY_HUD
        return 
    endif
    if ((SkateZoneParams.<newzoneparamsstruct>.show_welcome)= true)
        FormatText checksumname = sprite '%p_transition_piece' p = (SkateZoneParams.<newzoneparamsstruct>.prefix)
        if IsXenon
            AppendSuffixToChecksum base = <sprite> suffixstring = '_x'
            <sprite> = <appended_id>
        endif
        create_panel_sprite {
            texture = <sprite>
            style = zone_welcome_style
            id = zone_welcome
            parent = zone_message_panel
            just = [ RIGHT center ]
        }
    endif
endscript

script zone_welcome_message_kill 
    kill_panel_message_if_it_exists \{ id = zone_welcome }
endscript

script zone_welcome_fast_out 
    if ScreenElementExists \{ id = zone_welcome }
        RunScriptOnScreenElement \{ id = zone_welcome zone_welcome_style_out }
    endif
endscript

script zone_welcome_style 
    if IsXenon
        <Scale> = 0.7000
        <pos_adj> = (0.0, 60.0)
    else
        <Scale> = 1.800
        <pos_adj> = (0.0, 0.0)
    endif
    pos_on = ((640.0, 300.0) + <pos_adj>)
    pos_off = (<pos_on> + (200.0, 0.0))
    settags pos_off = <pos_off>
    setprops rgba = [ 128 128 128 128 ]
    DoMorph alpha = 0 Pos = <pos_off> Scale = <Scale>
    DoMorph alpha = 0.8500 Pos = <pos_on> time = 0.5000 anim = fast_out
    wait 3 seconds
    zone_welcome_style_out
endscript

script zone_welcome_style_out 
    getsingletag \{ pos_off }
    DoMorph alpha = 0 Pos = <pos_off> time = 0.5000 anim = fast_in
    Die
endscript
