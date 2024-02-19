
script kill_panel_message_if_it_exists 
    if ScreenElementExists id = <id>
        DestroyScreenElement id = <id>
    endif
endscript

script kill_panel_messages 
    kill_panel_message_if_it_exists \{ id = panel_message_layer }
endscript

script hide_panel_messages 
    if ScreenElementExists \{ id = panel_message_layer }
        DoScreenElementMorph \{ id = panel_message_layer alpha = 0 }
    endif
endscript

script show_panel_messages 
    if ScreenElementExists \{ id = panel_message_layer }
        DoScreenElementMorph \{ id = panel_message_layer alpha = 1 }
    endif
endscript

script create_panel_message_layer_if_needed 
    if NOT ScreenElementExists \{ id = panel_message_layer }
        SetScreenElementLock \{ id = root_window Off }
        CreateScreenElement \{ type = ContainerElement parent = root_window id = panel_message_layer }
    endif
endscript

script create_panel_message {text = 'Standardowa wiadomoæ o walkowerze'
        Pos = (320.0, 70.0)
        rgba = [ 144 32 32 100 ]
        font_face = testtitle
        time = 1500
        z_priority = -5
        just = [ center center ]
        parent = panel_message_layer
    }
    if GotParam id
        kill_panel_message_if_it_exists id = <id>
    endif
    create_panel_message_layer_if_needed
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = TextElement
        parent = <parent>
        id = <id>
        font = <font_face>
        text = <text>
        Scale = 1
        Pos = <Pos>
        just = <just>
        rgba = <rgba>
        z_priority = <z_priority>
        not_focusable
    }
    if GotParam style
        if GotParam params
            RunScriptOnScreenElement id = <id> <style> params = <params>
        else
            RunScriptOnScreenElement id = <id> <style> params = <...> 
        endif
    else
        RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
    endif
endscript

script create_panel_sprite {Pos = (320.0, 60.0)
        rgba = [ 128 128 128 100 ]
        z_priority = -5
        parent = panel_message_layer
        just = [ center center ]
    }
    if GotParam id
        if ScreenElementExists id = <id>
            RunScriptOnScreenElement id = <id> kill_panel_message
        endif
    endif
    create_panel_message_layer_if_needed
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = <texture>
        id = <id>
        Scale = <Scale>
        Pos = <Pos>
        just = <just>
        rgba = <rgba>
        z_priority = <z_priority>
        Blend = <Blend>
    }
    if GotParam style
        if GotParam params
            RunScriptOnScreenElement id = <id> <style> params = <params>
        else
            RunScriptOnScreenElement id = <id> <style> params = <...> 
        endif
    else
        if GotParam time
            RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
        endif
    endif
endscript

script create_intro_panel_block {text = 'Fabryczna wiadomoæ wejciowa panelu'
        Pos = (320.0, 60.0)
        dims = (250.0, 0.0)
        rgba = [ 144 32 32 100 ]
        font_face = small
        time = 2000
        just = [ center center ]
        internal_just = [ center center ]
        z_priority = -5
        Scale = 1
        parent = panel_message_layer
    }
    create_panel_message_layer_if_needed
    SetScreenElementLock id = <parent> Off
    if GotParam id
        if ScreenElementExists id = <id>
            DestroyScreenElement id = <id>
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <id>
        Pos = (0.0, 0.0)
    }
    <the_id> = <id>
    CreateScreenElement {
        type = TextBlockElement
        parent = <the_id>
        font = <font_face>
        text = <text>
        dims = <dims>
        Pos = <Pos>
        just = <just>
        internal_just = <internal_just>
        line_spacing = <line_spacing>
        rgba = <rgba>
        Scale = <Scale>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        allow_expansion
        z_priority = (<z_priority> + 3)
    }
    Theme_GetAltColor return_value = grad_color
    if GotParam create_bg
        CreateScreenElement {
            type = SpriteElement
            parent = <the_id>
            texture = goal_grad
            Pos = (<Pos> + (300.0, 0.0))
            Scale = (21.0, 10.0)
            just = [ center center ]
            rgba = <grad_color>
            alpha = 0.4000
            z_priority = (<z_priority> + 1)
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <the_id>
            texture = goal_grad
            Pos = (<Pos> + (300.0, -20.0))
            Scale = (21.0, 1.0)
            just = [ center center ]
            rgba = <grad_color>
            alpha = 0.6000
            z_priority = (<z_priority> + 1)
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <the_id>
            texture = goal_grad
            Pos = (<Pos> + (300.0, 20.0))
            Scale = (21.0, 1.0)
            just = [ center center ]
            rgba = <grad_color>
            alpha = 0.6000
            flip_v
            z_priority = (<z_priority> + 1)
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <the_id>
            Pos = (<Pos> + (320.0, 0.0))
            just = [ center center ]
            Scale = (13.0, 1.0)
            texture = roundbar_middle
            z_priority = (<z_priority> + 2)
            rgba = [ 128 128 128 20 ]
        }
        GetScreenElementPosition id = <id>
        GetScreenElementDims id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <the_id>
            Pos = (<screenelementpos> + (-16.0, 16.0))
            just = [ center center ]
            Scale = 1
            texture = roundbar_tip_left
            z_priority = (<z_priority> + 2)
            rgba = [ 128 128 128 20 ]
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <the_id>
            Pos = (<screenelementpos> + <width> * (1.0, 0.0) + (16.0, 16.0))
            just = [ center center ]
            Scale = 1
            texture = roundbar_tip_right
            z_priority = (<z_priority> + 2)
            rgba = [ 128 128 128 20 ]
        }
    endif
    if GotParam style
        if GotParam params
            RunScriptOnScreenElement id = <the_id> <style> params = <params>
        else
            RunScriptOnScreenElement id = <the_id> <style> params = <...> 
        endif
    else
        RunScriptOnScreenElement id = <the_id> panel_message_wait_and_die params = { time = <time> }
    endif
endscript

script panel_message_wait_and_die \{ time = 1500 }
    wait <time>
    Die
endscript

script kill_panel_message 
    Die
endscript

script hide_panel_message 
    if ScreenElementExists id = <id>
        SetScreenElementProps {
            id = <id>
            hide
        }
    endif
endscript

script show_panel_message 
    if ScreenElementExists id = <id>
        SetScreenElementProps {
            id = <id>
            unhide
        }
    endif
endscript

script destroy_panel_message 
    if ScreenElementExists id = <id>
        <id> ::Die
    endif
endscript
#"0xceb26004" = ""

script #"0xd408334f" 
    GetPreferenceString pref_type = network #"0xee8cd601"
    if NOT (<ui_string> = 'wtflol')
        GetPreferenceString pref_type = network #"0x5500f5d3"
        FormatText textname = #"0xb9bbab64" '%u is joining the game.' u = <ui_string>
        if (<#"0xceb26004"> = <#"0xb9bbab64">)
            GetPreferenceString pref_type = network #"0xee8cd601"
            FormatText textname = #"0x500953e3" '%u' u = <ui_string>
            SendChatMessage string = <#"0x500953e3">
        endif
    endif
    GetPreferenceString pref_type = network #"0x778587bb"
    if NOT (<ui_string> = 'wtflol')
        GetPreferenceString pref_type = network #"0xcc09a469"
        FormatText textname = #"0xb9bbab64" '%u is joining the game.' u = <ui_string>
        if (<#"0xceb26004"> = <#"0xb9bbab64">)
            GetPreferenceString pref_type = network #"0x778587bb"
            FormatText textname = #"0x500953e3" '%u' u = <ui_string>
            SendChatMessage string = <#"0x500953e3">
        endif
    endif
    GetPreferenceString pref_type = network #"0x0082b72d"
    if NOT (<ui_string> = 'wtflol')
        GetPreferenceString pref_type = network #"0xbb0e94ff"
        FormatText textname = #"0xb9bbab64" '%u is joining the game.' u = <ui_string>
        if (<#"0xceb26004"> = <#"0xb9bbab64">)
            GetPreferenceString pref_type = network #"0x0082b72d"
            FormatText textname = #"0x500953e3" '%u' u = <ui_string>
            SendChatMessage string = <#"0x500953e3">
        endif
    endif
    GetPreferenceString pref_type = network #"0x9ee6228e"
    if NOT (<ui_string> = 'wtflol')
        GetPreferenceString pref_type = network #"0x256a015c"
        FormatText textname = #"0xb9bbab64" '%u is joining the game.' u = <ui_string>
        if (<#"0xceb26004"> = <#"0xb9bbab64">)
            GetPreferenceString pref_type = network #"0x9ee6228e"
            FormatText textname = #"0x500953e3" '%u' u = <ui_string>
            SendChatMessage string = <#"0x500953e3">
        endif
    endif
    GetPreferenceString pref_type = network #"0xe9e11218"
    if NOT (<ui_string> = 'wtflol')
        GetPreferenceString pref_type = network #"0x526d31ca"
        FormatText textname = #"0xb9bbab64" '%u is joining the game.' u = <ui_string>
        if (<#"0xceb26004"> = <#"0xb9bbab64">)
            GetPreferenceString pref_type = network #"0xe9e11218"
            FormatText textname = #"0x500953e3" '%u' u = <ui_string>
            SendChatMessage string = <#"0x500953e3">
        endif
    endif
endscript
