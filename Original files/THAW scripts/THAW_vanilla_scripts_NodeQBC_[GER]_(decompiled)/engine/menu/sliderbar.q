
script sliderbar_rescale_to_bar 
    <target1> = ((<value> - <min>)/ (<max> - <min>))
    <target2> = (<RIGHT> - <left>)
    <target3> = (<target1> * <target2>)
    <rescaled_value> = (<target3> + <left>)
    return x_val = <rescaled_value>
endscript

script sliderbar_add_item {
        tab = tab1
        font = small
        icon_rgba = [ 127 102 0 128 ]
        icon_scale = 0
        icon_pos = (22.0, 9.0)
        text_just = [ center center ]
        text_pos = (-3.0, 0.0)
        arrow_pos_up = (0.0, 8.0)
        arrow_pos_down = (0.0, -8.0)
        arrow_rgba = [ 128 128 128 128 ]
        up_arrow_texture = up_arrow
        down_arrow_texture = down_arrow
        dims = (0.0, 20.0)
    }
    if GotParam is_enabled_script
        <is_enabled_script>
        if (<success> = 0)
            return 
        endif
    endif
    switch <tab>
        case tab1
        <bar_scale> = (0.9200000166893005, 1.2000000476837158)
        case tab2
        <bar_scale> = (0.8500000238418579, 1.2000000476837158)
        case tab3
        <bar_scale> = (0.7799999713897705, 1.2000000476837158)
        <font> = dialog
    endswitch
    SetScreenElementLock id = current_menu Off
    if NOT GotParam pad_choose_params
        <pad_choose_params> = <...> 
    endif
    if GotParam index
        if GotParam pad_choose_params
            <pad_choose_params> = (<pad_choose_params> + { parent_index = <index> })
        else
            <pad_choose_params> = { parent_index = <index> }
        endif
    endif
    if globalexists name = EG_in_create_a_graphic type = int
        <in_cagr> = EG_in_create_a_graphic
    else
        <in_cagr> = 0
    endif
    if (<in_cagr> = 1)
        <z_priority> = 2
    else
        <z_priority> = 300
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        id = <anchor_id>
        dims = <dims>
        event_handlers = [{focus <focus_script> params = <focus_params>}
            {unfocus <unfocus_script> params = <unfocus_params>}
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
        ]
        <not_focusable>
        z_priority = <z_priority>
    }
    <parent_id> = <id>
    if GotParam index
        SetScreenElementProps {
            id = <parent_id>
            tags = { tag_grid_x = <index> }
        }
    endif
    if GotParam not_focusable
        <rgba> = [ 60 60 60 85 ]
    else
        Theme_GetUnhighlightedTextColor return_value = rgba
    endif
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = small
        text = <text>
        Scale = 0.7500
        rgba = [128 , 128 , 128 , 128]
        just = <text_just>
        Pos = <text_pos>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        replace_handlers
        <not_focusable>
    }
    highlight_angle = 0
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        texture = DE_highlight_bar
        Pos = (-25.0, -7.0)
        rgba = [ 0 0 0 0 ]
        just = [ center center ]
        Scale = (1.899999976158142, 0.699999988079071)
        z_priority = (3 -1)
        rot_angle = <highlight_angle>
    }
    if (<in_cagr> = 0)
        <Pos> = (-9.0, 0.0)
    else
        <Pos> = (-3.0, 21.0)
    endif
    if GotParam bar_pos
        <Pos> = <bar_pos>
    endif
    Theme_GetPauseBarColor return_value = bar_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        z_priority = 1
        Pos = <Pos>
        Scale = (6.0, 0.8500000238418579)
        texture = roundbar_middle
        rgba = <bar_rgba>
    }
    DoScreenElementMorph id = <id> alpha = 0 time = 0
    CreateScreenElement {
        type = ContainerElement
        parent = <anchor_id>
        just = [ center bottom ]
        dims = { 200 , 200 }
        Pos = <arrow_pos_down>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        id = <down_arrow_id>
        texture = <down_arrow_texture>
        rgba = <arrow_rgba>
        Scale = 0.0
    }
    CreateScreenElement {
        type = ContainerElement
        parent = <anchor_id>
        just = [ center top ]
        dims = { 200 , 200 }
        Pos = <arrow_pos_up>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        id = <up_arrow_id>
        texture = <up_arrow_texture>
        rgba = <arrow_rgba>
        Scale = 0.0
    }
    if GotParam child_texture
        CreateScreenElement {
            type = SpriteElement
            parent = <parent_id>
            texture = <child_texture>
            Pos = <icon_pos>
            rgba = <icon_rgba>
            Scale = <icon_scale>
            id = <icon_id>
        }
    endif
    SetScreenElementLock id = current_menu on
endscript

script sliderbar_add_text_item 
    SetScreenElementLock id = current_menu Off
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        event_handlers = [{ focus sliderbar_focus_text_item }
            { unfocus sliderbar_unfocus_text_item }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
        ]
        dims = (0.0, 20.0)
    }
    <parent_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = small
        text = <text>
        Scale = 0.7500
        rgba = [128 , 128 , 128 , 128]
        just = [ center top ]
        Pos = (-6.0, -6.0)
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    Theme_GetPauseBarColor return_value = bar_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        z_priority = 1
        Scale = (6.0, 0.8500000238418579)
        Pos = (-9.0, 0.0)
        texture = roundbar_middle
        rgba = <bar_rgba>
    }
    DoScreenElementMorph id = <id> alpha = 0 time = 0
    SetScreenElementLock id = current_menu on
endscript

script sliderbar_focus_text_item 
    obj_getid
    id = <ObjID>
    Theme_GetHighlightedTextColorNew \{ return_value = on_color }
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <on_color>
        shadow_rgba = [0 , 0 , 0 , 0]
    }
    DoScreenElementMorph id = {<id> child = 1}alpha = 1 time = 0
endscript

script sliderbar_unfocus_text_item 
    obj_getid
    id = <ObjID>
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [128 , 128 , 128 , 128]
        shadow_rgba = UI_text_shadow_color
    }
    DoScreenElementMorph id = {<id> child = 1}alpha = 0 time = 0
endscript
