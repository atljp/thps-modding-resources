

script make_new_roundbar_menu {menu_id = main_menu_anchor
        vmenu_id = main_menu
        pad_back_script = NullScript
        Pos = (130.0, 100.0)
        dims = (350.0, 480.0)
        parent = root_window
        internal_text_just = left
        internal_text_offset = (0.0, 0.0)
        spacing = 6
        helper_text = generic_helper_text
        arrow_up = arrow_up
        arrow_down = arrow_down
        arrow_rgba = [ 128 128 128 128 ]
        pad_back_sound = generic_pause_exit_sound
    }
    SetScreenElementLock id = <parent> Off
    if NOT GotParam keep_current
        generic_animate_out_last_menu
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <menu_id>
        just = [ top left ]
        focusable_child = <vmenu_id>
    }
    AssignAlias id = <menu_id> alias = current_menu_anchor
    if GotParam Title
        build_theme_sub_title Title = <Title> add_tab = <add_tab> add_bar = <add_bar>
    endif
    if NOT GotParam no_helper_text
        create_helper_text <helper_text>
    endif
    if GotParam scrolling
        <arrow_pos> = (<Pos> + (((<dims>.(1.0, 0.0))/ 2)* (1.0, 0.0))+ (-14.0, -6.0))
        CreateScreenElement {
            type = SpriteElement
            parent = current_menu_anchor
            id = <arrow_up>
            texture = up_arrow
            Pos = <arrow_pos>
            just = [ left top ]
            z_priority = 5
            Scale = 1
            rgba = <arrow_rgba>
        }
        <scroll_menu_pos> = (<Pos> + (0.0, 10.0))
        <scroll_menu_dims> = (<dims> + (0.0, -40.0))
        CreateScreenElement {
            type = vscrollingmenu
            parent = current_menu_anchor
            dims = <scroll_menu_dims>
            Pos = <scroll_menu_pos>
            just = [ left top ]
        }
        <parent_id> = <id>
        AssignAlias id = <parent_id> alias = current_scrolling_menu
        <arrow_pos> = (<arrow_pos> + ((<dims>.(0.0, 1.0))* (0.0, 1.0))+ (0.0, -18.0))
        CreateScreenElement {
            type = SpriteElement
            parent = current_menu_anchor
            id = <arrow_down>
            texture = down_arrow
            Pos = <arrow_pos>
            just = [ left top ]
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
    if GotParam scrolling
        SetScreenElementProps {
            id = <vmenu_id>
            dims = <scroll_menu_dims>
        }
    endif
    if GotParam no_event_handlers
        KillEventHandlers
    else
        SetScreenElementProps {
            id = <vmenu_id>
            event_handlers = [{ pad_back <pad_back_sound> }
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
    AssignAlias id = <vmenu_id> alias = current_menu
    width = (<dims>.(1.0, 0.0))
    current_menu ::settags width = <width>
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


script add_roundbar_menu_item {focus_script = roundbar_menu_item_focus
        unfocus_script = roundbar_menu_item_unfocus
        pad_choose_sound = theme_menu_pad_choose_sound
        pad_choose_params = {}
        Scale = 1.0
        rgba = [ 128 128 128 108 ]
        just = [ RIGHT center ]
        parent = current_menu
        scale_highlight_text = 1
    }
    current_menu ::getsingletag width
    current_menu ::getsingletag internal_text_just
    current_menu ::getsingletag internal_text_offset
    current_menu ::getsingletag right_edge
    dims = (<right_edge> + (0.0, 18.0))
    if NOT GotParam id
        FormatText checksumname = temp_id '%s' s = <text>
        MangleChecksums a = <pad_choose_script> b = <temp_id>
        <id> = <mangled_id>
    endif
    if GotParam not_focusable
        <rgba> = [ 70 70 70 120 ]
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            just = [ left center ]
            not_focusable
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            just = [ left center ]
            event_handlers = [
                {focus <focus_script> params = {id = <id> scale_highlight_text = <scale_highlight_text>}}
                {unfocus <unfocus_script> params = {id = <id> scale_highlight_text = <scale_highlight_text>}}
                { pad_start <pad_choose_sound> }
                { pad_choose <pad_choose_sound> }
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
        }
        if GotParam tag_grid_x
            <id> ::settags tag_grid_x = <tag_grid_x>
        endif
    endif
    <container_id> = <id>
    if ChecksumEquals a = <internal_text_just> b = RIGHT
        Pos = <right_edge>
        opp_pos = (0.0, 0.0)
        just = [ RIGHT center ]
    else
        if ChecksumEquals a = <internal_text_just> b = center
            Pos = (<right_edge> / 2)
            opp_pos = <Pos>
            just = [ center center ]
        else
            Pos = (0.0, 0.0)
            opp_pos = <right_edge>
            just = [ left center ]
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        local_id = text
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        font = small
        text = <text>
        rgba = <rgba>
        Scale = <Scale>
        Pos = (<Pos> + (0.0, 9.0) + <internal_text_offset>)
        just = <just>
    }
    if current_menu ::getsingletag use_icons
        if GotParam icon
            CreateScreenElement {
                type = SpriteElement
                parent = <container_id>
                local_id = the_icon
                Scale = (<Scale> * 0.6000)
                Pos = (<opp_pos> + (-45.0, 8.0))
                just = <just>
                texture = <icon>
                z_priority = 4
                rgba = [ 128 128 128 0 ]
            }
        else
            
        endif
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = roundbar_middle
        Pos = (0.0, 9.0)
        just = [ left center ]
        Scale = (<right_edge> * 0.03100 + (0.0, 1.0))
        texture = roundbar_middle
        z_priority = 0
        rgba = [ 0 0 0 0 ]
    }
    if NOT current_menu ::getsingletag no_bar_edges
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            local_id = roundbar_left
            Pos = (-20.0, 9.0)
            just = [ left center ]
            Scale = 1
            texture = roundbar_tip_left
            z_priority = 1
            rgba = [ 0 0 0 0 ]
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            local_id = roundbar_right
            Pos = (<right_edge> + (-15.0, 9.0))
            just = [ left center ]
            Scale = 1
            texture = roundbar_tip_right
            z_priority = 1
            rgba = [ 0 0 0 0 ]
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = roundbar_highlight
        texture = roundbar_highlight
        Pos = (0.0, 0.0)
        rgba = [128 , 128 , 128 , 0]
        just = [ center center ]
        z_priority = 3
    }
    if current_menu ::getsingletag additional_create_script
        <additional_create_script> <...> 
    endif
endscript


script roundbar_menu_item_focus 
    Theme_GetPauseBarColor return_value = bar_color
    Theme_GetHighlightedTextColorNew return_value = on_color
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = <on_color>
        shadow_rgba = [128 , 128 , 128 , 0]
    }
    if GotParam scale_highlight_text
        if (<scale_highlight_text>)
            DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = (1.149999976158142, 1.25) relative_scale
        endif
    endif
    SetScreenElementProps {
        id = {<id> child = roundbar_middle}
        rgba = <bar_color>
    }
    if current_menu ::getsingletag use_icons
        SetScreenElementProps {
            id = {<id> child = the_icon}
            rgba = [ 128 128 128 128 ]
        }
    endif
    if NOT current_menu ::getsingletag no_bar_edges
        SetScreenElementProps {
            id = {<id> child = roundbar_left}
            rgba = <bar_color>
        }
        SetScreenElementProps {
            id = {<id> child = roundbar_right}
            rgba = <bar_color>
        }
    endif
    RunScriptOnScreenElement id = {<id> child = roundbar_highlight}roundbar_menu_highlight
    if current_menu ::getsingletag additional_focus_script
        <additional_focus_script> <...> 
    endif
endscript


script roundbar_menu_item_unfocus 
    Theme_GetUnhighlightedTextColorNew return_value = off_color
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = <off_color>
        shadow_rgba = UI_text_shadow_color
    }
    if GotParam scale_highlight_text
        if (<scale_highlight_text>)
            DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = 1.0 relative_scale
        endif
    endif
    SetScreenElementProps {
        id = {<id> child = roundbar_middle}
        rgba = [128 , 128 , 128 , 0]
    }
    if current_menu ::getsingletag use_icons
        SetScreenElementProps {
            id = {<id> child = the_icon}
            rgba = [ 128 128 128 0 ]
        }
    endif
    if NOT current_menu ::getsingletag no_bar_edges
        SetScreenElementProps {
            id = {<id> child = roundbar_left}
            rgba = [128 , 128 , 128 , 0]
        }
        SetScreenElementProps {
            id = {<id> child = roundbar_right}
            rgba = [128 , 128 , 128 , 0]
        }
    endif
    KillSpawnedScript name = roundbar_menu_highlight
    DoScreenElementMorph id = {<id> child = roundbar_highlight}alpha = 0 time = 0
    if current_menu ::getsingletag additional_unfocus_script
        <additional_unfocus_script> <...> 
    endif
endscript


script roundbar_menu_highlight 
    getsingletag id
    current_menu ::getsingletag internal_text_just
    current_menu ::getsingletag right_edge
    current_menu ::getsingletag width
    Theme_GetPauseBarColor return_value = bar_color
    SetScreenElementProps {
        id = <id>
        rgba = <bar_color>
    }
    if ChecksumEquals a = <internal_text_just> b = RIGHT
        start_pos = (<right_edge> + (-15.0, 0.0))
        end_pos = (0.0, 0.0)
    else
        start_pos = (15.0, 0.0)
        end_pos = <right_edge>
    endif
    SetScreenElementProps {
        id = <id>
        Pos = (<start_pos> + (0.0, 8.0))
    }
    DoScreenElementMorph id = <id> Scale = (2.75, 1.149999976158142) time = 0
    DoScreenElementMorph id = <id> alpha = 1 time = 0
    DoScreenElementMorph id = <id> Pos = (<end_pos> + (0.0, 8.0))time = 0.3500
    DoScreenElementMorph id = <id> alpha = 0.2000 time = 0.4000
    wait 0.4000 seconds
    SetScreenElementProps {
        id = <id>
        Pos = (<right_edge> / 2 + (0.0, 8.0))
    }
    DoScreenElementMorph id = <id> Scale = (<width> * (0.05999999865889549, 0.0) + (0.0, 1.149999976158142))time = 0
    begin 
    DoScreenElementMorph id = <id> alpha = 1 time = 0.3000
    wait 0.3000 seconds
    DoScreenElementMorph id = <id> alpha = 0 time = 0.3000
    wait 0.3000 seconds
    repeat 
endscript


script pause_create_tipbox 
    if NOT GotParam additional_width
        additional_width = (0.0, 0.0)
    endif
    if GotParam tip_text
        <container_id> ::settags has_tipbox
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            local_id = tipbox_bar
            texture = white2
            Pos = (<right_edge> + (10.0, 9.0))
            rgba = [101 , 71 , 26 , 128]
            just = [ left center ]
            Scale = ((19.0, 0.4000000059604645) + 0.1150 * <additional_width>)
            z_priority = 1
        }
        DoScreenElementMorph id = <id> alpha = 0 time = 0
        CreateScreenElement {
            type = TextBlockElement
            parent = <container_id>
            local_id = tipbox_text
            Pos = (<right_edge> + (85.0, 15.0) + <additional_width> * 0.5000)
            font = small
            Scale = 1
            rgba = [128 , 128 , 128 , 64]
            dims = ((130.0, 0.0) + <additional_width>)
            allow_expansion
            text = <tip_text>
            line_spacing = 0.7500
            just = [ center top ]
            internal_text_just = [ center top ]
            z_priority = 9
        }
        DoScreenElementMorph id = <id> alpha = 0 time = 0
        GetScreenElementDims id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            local_id = tipbox_bg
            Pos = (<right_edge> + (10.0, 9.0))
            texture = white2
            rgba = [0 , 0 , 0 , 128]
            just = [ left top ]
            Scale = (<height> * (0.0, 0.125) + (19.0, 2.0) + 0.1150 * <additional_width>)
            z_priority = 1
        }
        DoScreenElementMorph id = <id> alpha = 0 time = 0
    endif
endscript


script pause_focus_tipbox 
    if <id> ::getsingletag has_tipbox
        DoScreenElementMorph id = {<id> child = tipbox_bar}alpha = 1 time = 0.9000
        DoScreenElementMorph id = {<id> child = tipbox_bg}alpha = 0.5000 time = 0.9000
        DoScreenElementMorph id = {<id> child = tipbox_text}alpha = 0.6000 time = 0.9000
    endif
endscript


script pause_unfocus_tipbox 
    if <id> ::getsingletag has_tipbox
        DoScreenElementMorph id = {<id> child = tipbox_bar}alpha = 0 time = 0
        DoScreenElementMorph id = {<id> child = tipbox_bg}alpha = 0 time = 0
        DoScreenElementMorph id = {<id> child = tipbox_text}alpha = 0 time = 0
    endif
endscript


script roundbar_menu_finish build_pause_parts = 1
    if (<build_pause_parts>)
        build_pause_menu_parts <...> 
    endif
    if ScreenElementExists id = music_track_anchor
        generic_menu_animate_in force menu = music_track_anchor no_wait
    endif
    if current_menu ::getsingletag add_3d_bg
        menu3d_show
        menu3d_animate_in
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


script generic_menu_animate_in menu = current_menu_anchor
    if GotParam force
        <menu> ::settags animate_me = 1
    else
        if NOT <menu> ::getsingletag animate_me
            return 
        endif
    endif
    if GotParam Pos
        screenelementpos = <Pos>
    else
        GetScreenElementPosition id = <menu>
    endif
    DoScreenElementMorph id = <menu> Pos = (<screenelementpos> + (640.0, 0.0))time = 0
    DoScreenElementMorph id = <menu> Pos = <screenelementpos> time = 0.1500
    if NOT GotParam no_wait
        wait 0.2000 seconds
    endif
endscript


script generic_menu_animate_out menu = current_menu_anchor
    if GotParam force
        <menu> ::settags animate_me = 1
    endif
    if NOT <menu> ::getsingletag animate_me
        if <menu> ::getsingletag add_3d_bg
            menu3d_hide
        endif
        return 
    endif
    if <menu> ::getsingletag add_3d_bg
        SpawnScript menu3d_animate_out params = { Die }
    endif
    if GotParam Pos
        screenelementpos = <Pos>
    else
        GetScreenElementPosition id = <menu>
    endif
    DoScreenElementMorph id = <menu> Pos = (<screenelementpos> + (640.0, 0.0))time = 0.1500
    wait 0.2000 seconds
endscript


script generic_animate_out_last_menu 
    if ObjectExists id = current_menu
        if current_menu ::getsingletag animate_me
            generic_menu_animate_out menu = current_menu
            return 
        endif
    endif
    if ObjectExists id = current_menu_anchor
        if current_menu_anchor ::getsingletag animate_me
            generic_menu_animate_out
            return 
        endif
    endif
    if ObjectExists id = sub_menu
        if sub_menu ::getsingletag animate_me
            generic_menu_animate_out force menu = sub_menu Pos = (320.0, 240.0)
            return 
        endif
    endif
endscript

