
script make_label_menu {
        menu_id = main_menu_anchor
        vmenu_id = main_menu
        pad_back_script = NullScript
        Pos = (130.0, 160.0)
        dims = (350.0, 480.0)
        parent = root_window
        internal_text_just = center
        internal_text_offset = (0.0, 0.0)
        spacing = 6
        arrow_up = arrow_up
        arrow_down = arrow_down
        arrow_rgba = [ 110 0 85 128 ]
        pad_back_sound = generic_pause_exit_sound
        title_scale = 2
        title_pos = (0.0, 0.0)
        title_just = [ left top ]
        add_tab = 1
        title_rotation = 0
        title_rgba = [ 9 120 25 128 ]
    }
    SetScreenElementLock id = <parent> Off
    if NOT GotParam keep_current
        generic_animate_out_last_menu
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
    else
        if GotParam fade_out_current
            DoScreenElementMorph id = current_menu_anchor alpha = 0 time = 0
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <menu_id>
        exclusive_device = <exclusive_device>
        just = [ left top ]
        focusable_child = <vmenu_id>
    }
    AssignAlias id = <menu_id> alias = current_menu_anchor
    if GotParam Title
        if NOT GotParam title_rgba
            Theme_GetUnhighlightedTextColorNew return_value = title_rgba
        endif
        CreateScreenElement {
            type = TextElement
            parent = current_menu_anchor
            local_id = Title
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = testtitle
            text = <Title>
            rgba = <title_rgba>
            Scale = <title_scale>
            Pos = <title_pos>
            just = <title_just>
            rot_angle = <title_rotation>
        }
    endif
    if GotParam scrolling
        if NOT GotParam arrow_pos
            <arrow_pos> = (<Pos> + ((<dims>.(1.0, 0.0))/ 2)* (1.0, 0.0))
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = current_menu_anchor
            id = <arrow_up>
            texture = up_arrow
            Pos = <arrow_pos>
            just = [ center bottom ]
            z_priority = 5
            Scale = 1
            rgba = <arrow_rgba>
        }
        <scroll_menu_pos> = (<Pos> + (0.0, 18.0))
        <scroll_menu_dims> = (<dims> + (0.0, -36.0))
        CreateScreenElement {
            type = vscrollingmenu
            parent = current_menu_anchor
            dims = <scroll_menu_dims>
            Pos = <scroll_menu_pos>
            just = [ left top ]
        }
        <parent_id> = <id>
        AssignAlias id = <parent_id> alias = current_scrolling_menu
        <arrow_pos> = (<arrow_pos> + ((<scroll_menu_dims>.(0.0, 1.0))* (0.0, 1.0)))
        CreateScreenElement {
            type = SpriteElement
            parent = current_menu_anchor
            id = <arrow_down>
            texture = down_arrow
            Pos = <arrow_pos>
            just = [ center top ]
            z_priority = 5
            Scale = 1
            rgba = <arrow_rgba>
        }
        <vmenu_pos> = (0.0, 0.0)
    else
        <parent_id> = current_menu_anchor
        <vmenu_pos> = <Pos>
    endif
    CreateScreenElement {
        type = vmenu
        parent = <parent_id>
        id = <vmenu_id>
        Pos = <vmenu_pos>
        font = small
        just = [ left top ]
    }
    if GotParam no_event_handlers
        KillEventHandlers
    else
        SetScreenElementProps {
            id = <vmenu_id>
            event_handlers = [
                { pad_back <pad_back_sound> }
                {pad_back <pad_back_script> params = <pad_back_params>}
                {pad_up generic_menu_up_or_down_sound params = { up }}
                {pad_down generic_menu_up_or_down_sound params = { down }}
                {pad_up blink_arrow params = { id = <arrow_up> }}
                {pad_down blink_arrow params = { id = <arrow_down> }}
            ]
        }
    endif
    SetScreenElementProps {
        id = <vmenu_id>
        spacing_between = <spacing>
    }
    if GotParam scrolling
        SetScreenElementProps {
            id = <vmenu_id>
            dims = <scroll_menu_dims>
        }
    endif
    AssignAlias id = <vmenu_id> alias = current_menu
    width = (<dims>.(1.0, 0.0))
    current_menu ::settags internal_text_just = <internal_text_just>
    current_menu ::settags internal_text_offset = <internal_text_offset>
    current_menu ::settags right_edge = (<width> * (1.0, 0.0))
    current_menu ::settags menu_pos = <Pos>
    if GotParam no_bar_edges
        current_menu ::settags no_bar_edges = 1
    endif
    if GotParam use_icons
        current_menu ::settags use_icons = 1
    endif
    if NOT GotParam no_animate
        current_menu ::settags animate_me = 1
    endif
    if GotParam add_3d_bg
        current_menu ::settags add_3d_bg = 1
    endif
    if GotParam additional_create_script
        current_menu ::settags additional_create_script = <additional_create_script>
    endif
    if GotParam additional_focus_script
        current_menu ::settags additional_focus_script = <additional_focus_script>
    endif
    if GotParam additional_unfocus_script
        current_menu ::settags additional_unfocus_script = <additional_unfocus_script>
    endif
    if GotParam additional_menu_create_script
        <additional_menu_create_script> <additional_menu_create_params>
    endif
endscript

script RunScriptOnScreenElement_script 
    RunScriptOnScreenElement <...> 
endscript

script add_label_menu_item {focus_script = label_menu_item_focus
        unfocus_script = label_menu_item_unfocus
        pad_choose_sound = theme_menu_pad_choose_sound
        pad_choose_script = NullScript
        pad_choose_params = {}
        option_arrows_callback = NullScript
        additional_focus_script = NullScript
        additional_focus_params = {}
        additional_unfocus_script = NullScript
        additional_unfocus_params = {}
        Scale = 1.0
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        internal_just = [ left top ]
        parent = current_menu
        scale_highlight_text = 1
        rot = 0
        text_offset = (0.0, 0.0)
        extras_offset = (10.0, 0.0)
        arrow_offset = (10.0, 0.0)
        label_offset = (0.0, 0.0)
        Length = 200
        text_offset = (0.0, 0.0)
        padding = 20
    }
    current_menu ::getsingletag internal_text_just
    current_menu ::getsingletag internal_text_offset
    current_menu ::getsingletag right_edge
    dims = (<right_edge> + (0.0, 32.0))
    if NOT GotParam id
        FormatText checksumname = temp_id '%s' s = <text>
        MangleChecksums a = <pad_choose_script> b = <temp_id>
        <id> = <mangled_id>
    endif
    if ScreenElementExists id = <id>
        RemoveParameter id
    endif
    if GotParam not_focusable
        <rgba> = [ 70 70 70 120 ]
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            rot_angle = <rot>
            Pos = <label_offset>
            just = <just>
            internal_just = <internal_just>
            exclusive_device = <exclusive_device>
            not_focusable
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            exclusive_device = <exclusive_device>
            dims = <dims>
            rot_angle = <rot>
            Pos = <label_offset>
            just = <just>
            internal_just = <internal_just>
        }
        if GotParam tag_grid_x
            <id> ::settags tag_grid_x = <tag_grid_x> tag_length = <Length>
        else
            <id> ::settags tag_length = <Length>
        endif
    endif
    <container_id> = <id>
    SetScreenElementProps {
        id = <container_id>
        event_handlers = [
            {focus <focus_script> params = {id = <id> scale_highlight_text = <scale_highlight_text>}}
            {unfocus <unfocus_script> params = {id = <id> scale_highlight_text = <scale_highlight_text>}}
            { pad_start <pad_choose_sound> }
            { pad_choose <pad_choose_sound> }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
            {focus <additional_focus_script> params = <additional_focus_params>}
            {unfocus <additional_unfocus_script> params = <additional_unfocus_params>}
        ]
    }
    <container_id> ::settags text_offset = <text_offset>
    <container_id> ::settags arrow_offset = <arrow_offset>
    <container_id> ::settags extras_offset = <extras_offset>
    <container_id> ::settags option_arrows_callback = <option_arrows_callback>
    <container_id> ::settags label_offset = <label_offset>
    <container_id> ::settags just = <just>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        local_id = text
        exclusive_device = <exclusive_device>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        font = small
        text = <text>
        rgba = <rgba>
        Scale = <Scale>
    }
    if GotParam extra_text
        if GotParam option_arrows
            CreateScreenElement {
                type = SpriteElement
                parent = <container_id>
                local_id = arrow_left
                texture = left_arrow
                rgba = <rgba>
                Scale = <Scale>
                just = [ left center ]
                internal_just = <internal_just>
            }
        endif
        CreateScreenElement {
            type = TextElement
            parent = <container_id>
            local_id = extra_text
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = small
            text = <extra_text>
            rgba = <rgba>
            just = [ left center ]
            internal_just = <internal_just>
        }
        if GotParam option_arrows
            CreateScreenElement {
                type = SpriteElement
                parent = <container_id>
                local_id = arrow_right
                exclusive_device = <exclusive_device>
                texture = right_arrow
                rgba = <rgba>
                Scale = <Scale>
                just = [ left center ]
                internal_just = <internal_just>
            }
            SetScreenElementProps {
                id = <container_id>
                event_handlers = [
                    {pad_left RunScriptOnScreenElement_script params = {id = {<container_id> child = arrow_left}menu_blink_arrow}}
                    {pad_right RunScriptOnScreenElement_script params = {id = {<container_id> child = arrow_right}menu_blink_arrow}}
                    {pad_left label_item_resize params = { id = <container_id> }}
                    {pad_right label_item_resize params = { id = <container_id> }}
                ]
            }
            if NOT (<option_arrows_callback> = NullScript)
                SetScreenElementProps {
                    id = <container_id>
                    event_handlers = [
                        {pad_left <option_arrows_callback> params = { left }}
                        {pad_right <option_arrows_callback> params = { RIGHT }}
                    ]
                }
            endif
        endif
    endif
    GetScreenElementDims id = {<container_id> child = text}
    <Length> = (<width> + (<padding> * <Scale>))
    if GotParam extra_text
        GetScreenElementDims id = {<container_id> child = extra_text}
        <Length> = (<width> + <Length>)
        if GotParam options_arrows
            GetScreenElementDims id = {<container_id> child = left_arrow}
            <Length> = (<width> + <Length>)
        endif
        <Length> = (<Length> + <padding> * 2)
    endif
    num_segments = (<Length> / 31)
    CastToInteger num_segments
    if (<num_segments> = 0)
        num_segments = 1
    endif
    Length = (31 * (<num_segments> + 2))
    <container_id> ::settags Length = <Length>
    label_menu_item_get_label_origin id = <container_id>
    if ChecksumEquals a = <internal_text_just> b = center
        opp_pos = <label_origin>
        text_just = [ center center ]
        text_pos = (<label_origin> + ((<Length> / 2)* (1.0, 0.0)))
    else
        if ChecksumEquals a = <internal_text_just> b = RIGHT
            opp_pos = <label_origin>
            text_just = [ RIGHT center ]
            text_pos = (<label_origin> + (<Length> * (1.0, 0.0)))
        else
            opp_pos = (<label_origin> + (<Length> * (1.0, 0.0)))
            text_just = [ left center ]
            text_pos = <label_origin>
        endif
    endif
    SetScreenElementProps {
        id = {<container_id> child = text}
        Pos = (<text_pos> + <internal_text_offset> + <text_offset>)
        just = <text_just>
        internal_just = <internal_just>
    }
    center_pos = (<label_origin> + ((<Length> / 2)* (1.0, 0.0))+ (0.0, 16.0))
    bar_scale = ((<Scale> * (0.0, 1.0))+ (1.0, 0.0))
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = roundbar_tip_left
        rgba = [ 255 255 255 128 ]
        Scale = <bar_scale>
        z_priority = 2
        Pos = <label_origin>
        just = [ left center ]
        internal_just = <internal_just>
    }
    cur_pos = <label_origin>
    begin 
    cur_pos = (<cur_pos> + (31.0, 0.0))
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = roundbar_middle
        rgba = [ 255 255 255 128 ]
        Scale = <bar_scale>
        z_priority = 2
        Pos = <cur_pos>
        just = [ left center ]
        internal_just = <internal_just>
    }
    repeat <num_segments>
    cur_pos = (<cur_pos> + (31.0, 0.0))
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = roundbar_tip_right
        rgba = [ 255 255 255 128 ]
        Scale = <bar_scale>
        z_priority = 2
        Pos = <cur_pos>
        just = [ left center ]
        internal_just = <internal_just>
    }
    label_item_resize id = <container_id>
    if current_menu ::getsingletag use_icons
        if GotParam icon
            CreateScreenElement {
                type = SpriteElement
                parent = <container_id>
                local_id = the_icon
                texture = <icon>
                rgba = [ 128 128 128 0 ]
                Scale = (<Scale> * 0.6000)
                z_priority = 4
                Pos = (<opp_pos> + (-45.0, 8.0))
                just = <just>
            }
        else
            printf 'YOU MUST SPECIFY AN ICON TO USE'
        endif
    endif
    if current_menu ::getsingletag additional_create_script
        <additional_create_script> <...> 
    endif
    SetScreenElementLock id = <parent> on
    SetScreenElementLock id = <parent> Off
endscript

script label_menu_item_get_label_origin 
    <id> ::getsingletag label_offset
    <id> ::getsingletag Length
    <id> ::getsingletag just
    label_origin = <label_offset>
    if (<just> [ 0 ] = center)
        label_origin = (<label_origin> - ((<Length> / 2)* (1.0, 0.0)))
    else
        if (<just> [ 0 ] = RIGHT)
            label_origin = (<label_origin> + (<Length> * (1.0, 0.0)))
        endif
    endif
    return label_origin = <label_origin>
endscript

script label_menu_item_get_text_origin 
    <id> ::GetParentID
    <parent_id> ::getsingletag internal_text_just
    <id> ::getsingletag Length
    <id> ::getsingletag text_offset
    label_menu_item_get_label_origin id = <id>
    GetScreenElementDims id = {<id> child = text}
    label_item_get_extras_width id = <id>
    new_width = (<width> + <extras_width>)
    if ChecksumEquals a = <internal_text_just> b = center
        text_origin = (<label_origin> + ((<Length> / 2)* (1.0, 0.0))- ((<new_width> / 2)* (1.0, 0.0)))
    else
        if ChecksumEquals a = <internal_text_just> b = RIGHT
            text_origin = (<label_origin> + (<Length> * (1.0, 0.0) - (<new_width> * (1.0, 0.0))))
        else
            text_origin = (<label_origin>)
        endif
    endif
    if GotParam for_extras
        text_origin = (<text_origin> + (<width> * (1.0, 0.0)))
    endif
    text_origin = (<text_origin> + <text_offset>)
    return text_origin = <text_origin>
endscript

script label_item_get_extras_width 
    <id> ::getsingletag arrow_offset
    <id> ::getsingletag extras_offset
    extras_width = 0
    if ScreenElementExists id = {<id> child = arrow_left}
        GetScreenElementDims id = {<id> child = arrow_left}
        extras_width = (<extras_width> + <width>)
        extras_width = (<extras_width> + <arrow_offset>.(1.0, 0.0))
    endif
    if ScreenElementExists id = {<id> child = extra_text}
        GetScreenElementDims id = {<id> child = extra_text}
        extras_width = (<extras_width> + <width>)
        if ScreenElementExists id = {<id> child = arrow_right}
            extras_width = (<extras_width> + <arrow_offset>.(1.0, 0.0))
        endif
    endif
    if ScreenElementExists id = {<id> child = arrow_right}
        GetScreenElementDims id = {<id> child = arrow_right}
        extras_width = (<extras_width> + <width>)
    endif
    if NOT (<extras_width> = 0)
        extras_width = (<extras_width> + <arrow_offset>.(1.0, 0.0))
    endif
    return extras_width = <extras_width>
endscript

script label_item_resize_extras 
    <id> ::getsingletag extras_offset
    <id> ::getsingletag arrow_offset
    label_menu_item_get_label_origin id = <id>
    label_menu_item_get_text_origin for_extras id = <id>
    cur_pos = (<text_origin> + <extras_offset>)
    if ScreenElementExists id = {<id> child = arrow_left}
        SetScreenElementProps {
            id = {<id> child = arrow_left}
            Pos = <cur_pos>
        }
        GetScreenElementDims id = {<id> child = arrow_left}
        cur_pos = (<cur_pos> + (<width> * (1.0, 0.0))+ <arrow_offset>)
    endif
    if ScreenElementExists id = {<id> child = extra_text}
        SetScreenElementProps {
            id = {<id> child = extra_text}
            Pos = <cur_pos>
        }
    endif
    if ScreenElementExists id = {<id> child = arrow_right}
        GetScreenElementDims id = {<id> child = extra_text}
        cur_pos = (<cur_pos> + (<width> * (1.0, 0.0))+ <arrow_offset>)
        SetScreenElementProps {
            id = {<id> child = arrow_right}
            Pos = <cur_pos>
        }
    endif
endscript

script label_item_resize 
    SetScreenElementProps {
        id = {<id> child = text}
        just = [ left center ]
    }
    label_menu_item_get_text_origin id = <id>
    SetScreenElementProps {
        id = {<id> child = text}
        Pos = <text_origin>
    }
    label_item_resize_extras id = <id>
endscript

script label_menu_item_focus 
    Theme_GetPauseBarColor return_value = bar_color
    Theme_GetHighlightedTextColorNew return_value = on_color
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = <on_color>
        shadow_rgba = [128 , 128 , 128 , 0]
        just = [ center center ]
    }
    if GotParam scale_highlight_text
        if (<scale_highlight_text>)
            DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = (1.0499999523162842, 1.100000023841858) relative_scale
        endif
    endif
    if ScreenElementExists id = current_menu
        if current_menu ::getsingletag additional_focus_script
            <additional_focus_script> <...> 
        endif
    endif
    wait 0.1000 seconds
    label_item_resize id = <id>
endscript

script label_menu_item_unfocus 
    Theme_GetUnhighlightedTextColorNew return_value = off_color
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = <off_color>
        shadow_rgba = UI_text_shadow_color
        just = [ center center ]
    }
    if GotParam scale_highlight_text
        if (<scale_highlight_text>)
            DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = 1.0 relative_scale
        endif
    endif
    if ScreenElementExists id = current_menu
        if current_menu ::getsingletag additional_unfocus_script
            <additional_unfocus_script> <...> 
        endif
    endif
    wait 0.1000 seconds
    label_item_resize id = <id>
endscript

script add_label_menu_flag_item 
    if NOT GotParam id
        printf 'add_label_menu_flag_item requires an id param'
        return 
    endif
    if NOT GotParam flag
        printf 'add_label_menu_flag_item requires a flag param'
        return 
    endif
    if GetGlobalFlag flag = <flag>
        if GotParam reverse
            extra_text = 'AUS'
            reverse = reverse
        else
            extra_text = 'EIN'
        endif
    else
        if GotParam reverse
            extra_text = 'EIN'
            reverse = reverse
        else
            extra_text = 'AUS'
        endif
    endif
    add_label_menu_item <...> option_arrows
    if GotParam toggle_callback
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                {pad_left <toggle_callback> params = {id = <id> flag = <flag> reverse = <reverse>}}
                {pad_right <toggle_callback> params = {id = <id> flag = <flag> reverse = <reverse>}}
            ]
        }
    else
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                {pad_left label_menu_toggle_flag params = {id = <id> flag = <flag> reverse = <reverse> left}}
                {pad_right label_menu_toggle_flag params = {id = <id> flag = <flag> reverse = <reverse> RIGHT}}
            ]
        }
    endif
endscript

script label_menu_toggle_flag 
    if GetGlobalFlag flag = <flag>
        if GotParam reverse
            SetScreenElementProps id = {<id> child = extra_text}text = 'EIN'
        else
            SetScreenElementProps id = {<id> child = extra_text}text = 'AUS'
        endif
        UnsetGlobalFlag flag = <flag>
    else
        if GotParam reverse
            SetScreenElementProps id = {<id> child = extra_text}text = 'AUS'
        else
            SetScreenElementProps id = {<id> child = extra_text}text = 'EIN'
        endif
        SetGlobalFlag flag = <flag>
    endif
endscript

script label_menu_finish {
        build_pause_parts = 1
        helper_text = {
            helper_text_elements = [{ text = '\b7/\b4 = Wählen' }
                { text = '\m1 = Zurück' }
                { text = '\m0 = OK' }
            ]
        }
    }
    SetScreenElementLock id = current_menu_anchor Off
    create_helper_text {
        parent = current_menu_anchor
        helper_pos = (318.0, 426.0)
        <helper_text>
    }
    if ScreenElementExists id = current_scrolling_menu
        SetScreenElementProps id = current_scrolling_menu reset_window_top
    endif
    if (<build_pause_parts>)
        build_pause_menu_parts <...> 
    endif
    if ScreenElementExists id = music_track_anchor
        generic_menu_animate_in force menu = music_track_anchor no_wait
    endif
    if ObjectExists id = current_menu_anchor
        if ObjectExists id = current_menu
            generic_menu_animate_in menu = current_menu
        endif
    endif
    if ObjectExists id = current_menu_anchor
        if ObjectExists id = current_menu
            FireEvent type = focus target = current_menu Data = <Data>
        endif
    endif
endscript
