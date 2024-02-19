colormenu_bar_scale = (4.400000095367432, 2.0)
colormenu_bar_focus_rgba = [ 128 128 128 118 ]
colormenu_bar_unfocus_rgba = [ 40 40 40 118 ]
colormenu_bar_pos = (12.0, 0.0)
colormenu_text_pos = (-102.0, 0.0)
colormenu_spacing_between = 25
colormenu_arrow_pos_up = (0.0, 7.0)
colormenu_arrow_pos_down = (0.0, -7.0)
colormenu_arrow_rgba = [ 128 128 128 128 ]
colormenu_arrow_scale = 0.7000
colormenu_wrap_arrow_left = -53.0
colormenu_wrap_arrow_right = 80.0
colormenu_nowrap_arrow_left = -53.0
colormenu_nowrap_arrow_right = 80.0
colormenu_hue_increment = 5
colormenu_saturation_increment = 3
colormenu_value_increment = 2
colormenu_min_saturation = 0.0
colormenu_max_saturation = 90.0
colormenu_min_value = 0.0
colormenu_max_value = 75.0

script edit_graphic_image_focus_glow 
    begin 
    DoMorph \{ time = 0 alpha = 0.7000 }
    DoMorph \{ time = 0.3000 alpha = 1 }
    DoMorph \{ time = 0.3000 alpha = 0.7000 }
    repeat 
endscript

script colormenu_focus rgba = [ 128 128 128 50 ] in_cagr = 0
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 123 4 93 128 ]
        shadow_rgba = [0 , 0 , 0 , 0]
    }
    DoScreenElementMorph id = {<id> child = 2}alpha = 1 time = 0
    RunScriptOnScreenElement id = {<id> child = 2}edit_graphic_image_focus_glow
    if GotParam pad_left_handler
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                {pad_left <pad_left_handler> params = <handler_params>}
            ]
            replace_handlers
        }
    endif
    if GotParam pad_right_handler
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                {pad_right <pad_right_handler> params = <handler_params>}
            ]
            replace_handlers
        }
    endif
    SetScreenElementProps {
        id = <color_bar_id>
        rgba = colormenu_bar_focus_rgba
    }
    DoScreenElementMorph {
        id = <down_arrow_id>
        Scale = colormenu_arrow_scale
    }
    DoScreenElementMorph {
        id = <up_arrow_id>
        Scale = colormenu_arrow_scale
    }
    if (<in_cagr> = 1)
        edit_graphic_update_color_arrows
    else
        colormenu_refresh_arrows part = <part>
        generic_menu_update_arrows {
            up_arrow_id = edit_skater_menu_up_arrow
            down_arrow_id = edit_skater_menu_down_arrow
        }
    endif
    if ObjectExists id = edit_skater_vmenu
        edit_skater_vmenu ::gettags
        if GotParam arrow_id
            menu_vert_blink_arrow { id = <arrow_id> }
        endif
    endif
endscript

script colormenu_unfocus rgba = [ 128 128 128 0 ]
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [128 , 128 , 128 , 128]
        shadow_rgba = UI_text_shadow_color
    }
    DoScreenElementMorph id = {<id> child = 2}alpha = 0 time = 0
    KillSpawnedScript name = edit_graphic_image_focus_glow
    SetScreenElementProps {
        id = <color_bar_id>
        rgba = colormenu_bar_unfocus_rgba
    }
    DoScreenElementMorph {
        id = <down_arrow_id>
        Scale = 0.0
    }
    DoScreenElementMorph {
        id = <up_arrow_id>
        Scale = 0.0
    }
endscript

script colormenu_get_default_color 
    if NOT GotParam part
        script_assert 'brak parametru part'
    endif
    if NOT GotParam desc_id
        script_assert 'Brak parametru desc_id'
    endif
    GetActualCASOptionStruct part = <part> desc_id = <desc_id>
    if GotParam default_h
        <h> = <default_h>
    else
        <h> = 0
    endif
    if GotParam default_s
        <s> = <default_s>
    else
        <s> = 50
    endif
    if GotParam default_v
        <v> = <default_v>
    else
        <v> = 50
    endif
    return h = <h> s = <s> v = <v>
endscript

script colormenu_get_hsv 
    GetCurrentSkaterProfileIndex
    GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
    if NOT GotParam use_default_hsv
        <use_default_hsv> = 1
    endif
    if NOT GotParam h
        <h> = 0
    endif
    if NOT GotParam s
        <s> = 0
    endif
    if NOT GotParam v
        <v> = 0
    endif
    if (<use_default_hsv> = 1)
        colormenu_get_default_color part = <part> desc_id = <desc_id>
    endif
    return h = <h> s = <s> v = <v> use_default_hsv = <use_default_hsv>
endscript

script colormenu_set_hsv \{ use_default_hsv = 0 }
    GetCurrentSkaterProfileIndex
    SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = <use_default_hsv>
endscript

script colormenu_refresh_arrows 
    colormenu_get_hsv part = <part>
    sliderbar_rescale_to_bar min = 0.0 max = 360.0 value = <h> left = colormenu_wrap_arrow_left RIGHT = colormenu_wrap_arrow_right
    SetScreenElementProps {
        id = hue_up_arrow
        Pos = ((1.0, 0.0) * <x_val>)
    }
    SetScreenElementProps {
        id = hue_down_arrow
        Pos = ((1.0, 0.0) * <x_val>)
    }
    sliderbar_rescale_to_bar min = colormenu_min_saturation max = colormenu_max_saturation value = <s> left = colormenu_nowrap_arrow_left RIGHT = colormenu_nowrap_arrow_right
    SetScreenElementProps {
        id = saturation_up_arrow
        Pos = ((1.0, 0.0) * <x_val>)
    }
    SetScreenElementProps {
        id = saturation_down_arrow
        Pos = ((1.0, 0.0) * <x_val>)
    }
    sliderbar_rescale_to_bar min = colormenu_min_value max = colormenu_max_value value = <v> left = colormenu_nowrap_arrow_left RIGHT = colormenu_nowrap_arrow_right
    SetScreenElementProps {
        id = value_up_arrow
        Pos = ((1.0, 0.0) * <x_val>)
    }
    SetScreenElementProps {
        id = value_down_arrow
        Pos = ((1.0, 0.0) * <x_val>)
    }
endscript

script colormenu_refresh_skaters 
    GetCurrentSkaterProfileIndex
    RefreshSkaterColors skater = 0 profile = <currentSkaterProfileIndex>
endscript

script colormenu_increment_hue 
    colormenu_get_hsv part = <part>
    <h> = (<h> + colormenu_hue_increment)
    if (<h> > 359)
        <h> = (<h> - 360)
    endif
    colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_decrement_hue 
    colormenu_get_hsv part = <part>
    <h> = (<h> - colormenu_hue_increment)
    if (<h> < 0)
        <h> = (<h> + 360)
    endif
    colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_increment_saturation 
    colormenu_get_hsv part = <part>
    <s> = (<s> + colormenu_saturation_increment)
    if (<s> > colormenu_max_saturation)
        <s> = colormenu_max_saturation
    endif
    colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_decrement_saturation 
    colormenu_get_hsv part = <part>
    <s> = (<s> - colormenu_saturation_increment)
    if (<s> < colormenu_min_saturation)
        <s> = colormenu_min_saturation
    endif
    colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_increment_value 
    colormenu_get_hsv part = <part>
    <v> = (<v> + colormenu_value_increment)
    if (<v> > colormenu_max_value)
        <v> = colormenu_max_value
    endif
    colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_decrement_value 
    colormenu_get_hsv part = <part>
    <v> = (<v> - colormenu_value_increment)
    if (<v> < colormenu_min_value)
        <v> = colormenu_min_value
    endif
    colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_reset_to_default 
    GetCurrentSkaterProfileIndex
    GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
    colormenu_get_default_color part = <part> desc_id = <desc_id>
    GetCurrentSkaterProfileIndex
    SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = 1
    colormenu_refresh_arrows part = <part>
    colormenu_refresh_skaters
endscript

script colormenu_add_options_to_menu 
    if NOT GotParam from_caf
        SetScreenElementProps {
            id = current_menu
            spacing_between = colormenu_spacing_between
        }
    endif
    if GotParam from_cas
        if (in_boardshop = 1)
            create_helper_text generic_helper_text_left_right_up_down
        else
            create_helper_text generic_helper_text_color_menu
        endif
        SetScreenElementProps {
            id = current_menu
            spacing_between = 1
        }
    endif
    if globalexists name = EG_in_create_a_graphic type = int
        <in_cagr> = EG_in_create_a_graphic
    else
        <in_cagr> = 0
    endif
    if (<in_cagr> = 1)
        <hue_down> = edit_graphic_decrement_hue
        <hue_up> = edit_graphic_increment_hue
        <sat_down> = edit_graphic_decrement_saturation
        <sat_up> = edit_graphic_increment_saturation
        <val_down> = edit_graphic_decrement_value
        <val_up> = edit_graphic_increment_value
        <alpha_down> = edit_graphic_decrement_alpha
        <alpha_up> = edit_graphic_increment_alpha
    else
        <hue_down> = colormenu_decrement_hue
        <hue_up> = colormenu_increment_hue
        <sat_down> = colormenu_decrement_saturation
        <sat_up> = colormenu_increment_saturation
        <val_down> = colormenu_decrement_value
        <val_up> = colormenu_increment_value
    endif
    <focus_script> = colormenu_focus
    <unfocus_script> = colormenu_unfocus
    sliderbar_add_item {
        text = 'BAR.'
        focus_script = <focus_script>
        focus_params = {
            pad_left_handler = <hue_down>
            pad_right_handler = <hue_up>
            handler_params = { part = <part> }
            up_arrow_id = hue_up_arrow
            down_arrow_id = hue_down_arrow
            part = <part>
            color_bar_id = hue_slider_bar
            from_caf = <from_caf>
            in_cagr = <in_cagr>
        }
        unfocus_script = <unfocus_script>
        unfocus_params = {
            up_arrow_id = hue_up_arrow
            down_arrow_id = hue_down_arrow
            color_bar_id = hue_slider_bar
            from_caf = <from_caf>
        }
        pad_choose_script = NullScript
        child_texture = colorbar
        icon_id = hue_slider_bar
        icon_scale = colormenu_bar_scale
        icon_rgba = colormenu_bar_unfocus_rgba
        icon_pos = colormenu_bar_pos
        text_pos = colormenu_text_pos
        text_just = [ left center ]
        tab = tab3
        anchor_id = hue_anchor
        up_arrow_id = hue_up_arrow
        down_arrow_id = hue_down_arrow
        arrow_pos_up = colormenu_arrow_pos_up
        arrow_pos_down = colormenu_arrow_pos_down
        arrow_rgba = colormenu_arrow_rgba
        text_pos = <text_pos>
        icon_pos = <icon_pos>
        arrow_pos_up = <arrow_pos_up>
        arrow_pos_down = <arrow_pos_down>
        dims = <dims>
        bar_pos = <bar_pos>
    }
    sliderbar_add_item {
        text = 'NAS.'
        focus_script = <focus_script>
        focus_params = {
            pad_left_handler = <sat_down>
            pad_right_handler = <sat_up>
            handler_params = { part = <part> }
            up_arrow_id = saturation_up_arrow
            down_arrow_id = saturation_down_arrow
            part = <part>
            color_bar_id = saturation_slider_bar
            from_caf = <from_caf>
            in_cagr = <in_cagr>
        }
        unfocus_script = <unfocus_script>
        unfocus_params = {
            up_arrow_id = saturation_up_arrow
            down_arrow_id = saturation_down_arrow
            color_bar_id = saturation_slider_bar
            from_caf = <from_caf>
        }
        pad_choose_script = NullScript
        child_texture = bw_slider
        icon_id = saturation_slider_bar
        icon_scale = colormenu_bar_scale
        icon_rgba = colormenu_bar_unfocus_rgba
        icon_pos = colormenu_bar_pos
        text_pos = colormenu_text_pos
        text_just = [ left center ]
        tab = tab3
        anchor_id = saturation_anchor
        up_arrow_id = saturation_up_arrow
        down_arrow_id = saturation_down_arrow
        arrow_pos_up = colormenu_arrow_pos_up
        arrow_pos_down = colormenu_arrow_pos_down
        arrow_rgba = colormenu_arrow_rgba
        text_pos = <text_pos>
        icon_pos = <icon_pos>
        arrow_pos_up = <arrow_pos_up>
        arrow_pos_down = <arrow_pos_down>
        dims = <dims>
        bar_pos = <bar_pos>
    }
    sliderbar_add_item {
        text = 'WAR.'
        focus_script = <focus_script>
        focus_params = {
            pad_left_handler = <val_down>
            pad_right_handler = <val_up>
            handler_params = { part = <part> }
            up_arrow_id = value_up_arrow
            down_arrow_id = value_down_arrow
            part = <part>
            color_bar_id = value_slider_bar
            from_caf = <from_caf>
            in_cagr = <in_cagr>
        }
        unfocus_script = <unfocus_script>
        unfocus_params = {
            up_arrow_id = value_up_arrow
            down_arrow_id = value_down_arrow
            color_bar_id = value_slider_bar
            from_caf = <from_caf>
        }
        pad_choose_script = NullScript
        child_texture = bw_slider
        icon_id = value_slider_bar
        icon_scale = colormenu_bar_scale
        icon_rgba = colormenu_bar_unfocus_rgba
        icon_pos = colormenu_bar_pos
        text_pos = colormenu_text_pos
        text_just = [ left center ]
        tab = tab3
        anchor_id = value_anchor
        up_arrow_id = value_up_arrow
        down_arrow_id = value_down_arrow
        arrow_pos_up = colormenu_arrow_pos_up
        arrow_pos_down = colormenu_arrow_pos_down
        arrow_rgba = colormenu_arrow_rgba
        text_pos = <text_pos>
        icon_pos = <icon_pos>
        arrow_pos_up = <arrow_pos_up>
        arrow_pos_down = <arrow_pos_down>
        dims = <dims>
        bar_pos = <bar_pos>
    }
    if (<in_cagr> = 1)
        sliderbar_add_item {
            text = 'ZNIK.'
            focus_script = <focus_script>
            focus_params = {
                pad_left_handler = <alpha_down>
                pad_right_handler = <alpha_up>
                handler_params = { part = <part> }
                up_arrow_id = alpha_up_arrow
                down_arrow_id = alpha_down_arrow
                part = <part>
                color_bar_id = alpha_slider_bar
                from_caf = <from_caf>
                in_cagr = <in_cagr>
            }
            unfocus_script = <unfocus_script>
            unfocus_params = {
                up_arrow_id = alpha_up_arrow
                down_arrow_id = alpha_down_arrow
                color_bar_id = alpha_slider_bar
                from_caf = <from_caf>
            }
            pad_choose_script = NullScript
            child_texture = bw_slider
            icon_id = alpha_slider_bar
            icon_scale = colormenu_bar_scale
            icon_rgba = colormenu_bar_unfocus_rgba
            icon_pos = colormenu_bar_pos
            text_pos = colormenu_text_pos
            text_just = [ left center ]
            tab = tab3
            anchor_id = alpha_anchor
            up_arrow_id = alpha_up_arrow
            down_arrow_id = alpha_down_arrow
            arrow_pos_up = colormenu_arrow_pos_up
            arrow_pos_down = colormenu_arrow_pos_down
            arrow_rgba = colormenu_arrow_rgba
            text_pos = <text_pos>
            icon_pos = <icon_pos>
            arrow_pos_up = <arrow_pos_up>
            arrow_pos_down = <arrow_pos_down>
            dims = <dims>
        }
    endif
    if NOT GotParam from_caf
        sliderbar_add_text_item {
            text = 'DOMYLNE'
            pad_choose_script = colormenu_reset_to_default
            pad_choose_params = { part = <part> }
        }
    endif
endscript

script posmenu_add_options_to_menu 
    SetScreenElementProps {
        id = current_menu
        spacing_between = colormenu_spacing_between
        event_handlers = [
            { pad_up null_script }
            { pad_down null_script }
        ]
        replace_handlers
    }
    if (GotParam part)
        material = ((<part> [ 0 ]).material)
        pass = ((<part> [ 0 ]).pass)
    endif
    if GotParam from_cas
        create_helper_text generic_helper_text_color_menu
    endif
    if globalexists name = EG_in_create_a_graphic type = int
        <in_cagr> = EG_in_create_a_graphic
    else
        <in_cagr> = 0
    endif
    if (<in_cagr> = 0)
        if NOT GotParam no_pos
            <add_pos> = add_pos
        else
            <add_pos> = <no_pos>
        endif
        if NOT GotParam no_rot
            <add_rot> = add_rot
        endif
        if NOT GotParam no_scale
            <add_scale> = add_scale
        endif
    endif
    posmenu_add_item {
        part = <part>
        material = <material>
        pass = <pass>
        add_pos = <add_pos>
        add_rot = <add_rot>
        add_scale = <add_scale>
    }
endscript

script posmenu_add_item {pad_choose_script = null_script
        tab = tab3
        font = dialog
        icon_scale = 0
        icon_pos = (22.0, 9.0)
        text_just = [ left center ]
        text_pos = (0.0, 0.0)
        dims = (0.0, 40.0)
    }
    if GotParam is_enabled_script
        <is_enabled_script>
        if (<success> = 0)
            return 
        endif
    endif
    focus_params = {material = <material> pass = <pass> part = <part>}
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        id = pos_parts_anchor
        dims = <dims>
        event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_alt2 posmenu_reset_uv params = { part = <part> }}
            { pad_up null_script }
            { pad_down null_script }
        ]
        <not_focusable>
        z_priority = 10
    }
    if globalexists name = EG_in_create_a_graphic type = int
        <in_cagr> = EG_in_create_a_graphic
    else
        <in_cagr> = 0
    endif
    if (<in_cagr> = 0)
        if IsNGC
            create_helper_text generic_helper_text_color_menu_reset_ngc
        else
            create_helper_text generic_helper_text_color_menu_reset
        endif
    endif
    if GotParam add_pos
        posmenu_add_pos_item <...> 
    endif
    if GotParam add_rot
        posmenu_add_rotation_item <...> 
    endif
    if GotParam add_scale
        posmenu_add_scale_item <...> 
    endif
    wait 1 gameframe
    posmenu_focus_all_parts <focus_params>
endscript

script posmenu_focus_all_parts 
    edit_skater_posmenu_focus <...> 
    edit_skater_scalemenu_focus <...> 
    edit_skater_rotmenu_focus <...> 
endscript

script posmenu_add_pos_item 
    CreateScreenElement {
        type = ContainerElement
        parent = pos_parts_anchor
        id = pos_anchor
        Pos = (15.0, 15.0)
        dims = <dims>
        z_priority = 10
    }
    <parent_id> = <id>
    if GotParam index
        SetScreenElementProps {
            id = <parent_id>
            tags = { tag_grid_x = <index> }
        }
    endif
    Theme_GetUnhighlightedTextColor return_value = rgba
    Theme_GetHighlightedTextColor return_value = arrow_rgba
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = <font>
        text = 'Pos'
        Scale = 0.9000
        rgba = <rgba>
        just = <text_just>
        Pos = (-110.0, 0.0)
        replace_handlers
        <not_focusable>
    }
    if ((IsXbox)|| (isPC))
        text = 'Lewa ga³ka'
        Scale = 0.6700
    else
        if IsNGC
            text = 'Kontroler'
            Scale = 0.6700
        else
            text = 'Lewy dr¹¿ek analogowy'
            Scale = 0.6700
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = dialog
        text = <text>
        Scale = <Scale>
        rgba = <arrow_rgba>
        just = [ left top ]
        Pos = (-110.0, -42.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = pos_up_arrow
        texture = up_arrow
        rgba = <rgba>
        Scale = 1.0
        Pos = (20.0, -30.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = pos_down_arrow
        texture = down_arrow
        rgba = <rgba>
        Scale = 1.0
        Pos = (20.0, 30.0)
        z_priority = 5
    }
    if NOT (<add_pos> = use_uv_v_only)
        CreateScreenElement {
            type = SpriteElement
            parent = <parent_id>
            id = pos_left_arrow
            texture = left_arrow
            rgba = <rgba>
            Scale = 1.0
            Pos = (-20.0, 0.0)
            z_priority = 5
        }
    endif
    if NOT (<add_pos> = use_uv_v_only)
        CreateScreenElement {
            type = SpriteElement
            parent = <parent_id>
            id = pos_right_arrow
            texture = right_arrow
            rgba = <rgba>
            Scale = 1.0
            Pos = (60.0, 0.0)
            z_priority = 5
        }
    endif
endscript

script posmenu_get_uv 
    GetCurrentSkaterProfileIndex
    GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
    if NOT GotParam use_default_uv
        <use_default_uv> = 1
    endif
    if NOT GotParam uv_u
        <uv_u> = 0
    endif
    if NOT GotParam uv_v
        <uv_v> = 0
    endif
    if NOT GotParam uv_scale
        <uv_scale> = 100
    endif
    if NOT GotParam uv_rot
        <uv_rot> = 0
    endif
    if (<use_default_uv> = 1)
        <uv_u> = 0
        <uv_v> = 0
        <uv_scale> = 100
        <uv_rot> = 0
    endif
    return uv_u = <uv_u> uv_v = <uv_v> uv_scale = <uv_scale> uv_rot = <uv_rot> use_default_uv = <use_default_uv>
endscript

script swap_get_uv 
    posmenu_get_uv <...> 
    RemoveParameter \{ part }
    return structure = { <...>  }
endscript

script posmenu_set_uv 
    GetCurrentSkaterProfileIndex
    SetPlayerAppearanceUV player = <currentSkaterProfileIndex> part = <part> uv_u = <uv_u> uv_v = <uv_v> uv_scale = <uv_scale> uv_rot = <uv_rot> use_default_uv = 0
endscript

script posmenu_reset_uv 
    if IsNGC
        if NOT ControllerPressed l1
            return 
        endif
    endif
    GetCurrentSkaterProfileIndex
    SetPlayerAppearanceUV player = <currentSkaterProfileIndex> part = <part> uv_u = 0 uv_v = 0 uv_scale = 100 uv_rot = 0 use_default_uv = 1
    no_board = no_board
    if skater ::IsBoardMissing
        RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board
    else
        RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
    endif
    if GotParam refocus
        FireEvent type = focus target = current_menu
    endif
endscript

script adjust_cas_texture_pos uv_increment = 10
    if NOT GotParam pass
        return 
    endif
    if NOT GotParam material
        return 
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    <dir_mod> = 1
    <v_min> = -200
    <v_max> = 200
    <u_min> = -200
    <u_max> = 200
    if ChecksumEquals a = <part> b = left_forearm_tattoo
        <dir_mod> = 1
        <v_min> = -500
        <v_max> = 200
        <u_min> = -75
        <u_max> = 75
    else
        if ChecksumEquals a = <part> b = right_forearm_tattoo
            <dir_mod> = -1
            <v_min> = -500
            <v_max> = 200
            <u_min> = -75
            <u_max> = 75
        else
            if ChecksumEquals a = <part> b = left_bicep_tattoo
                <dir_mod> = 1
                <v_min> = -200
                <v_max> = 500
                <u_min> = -75
                <u_max> = 75
            else
                if ChecksumEquals a = <part> b = right_bicep_tattoo
                    <dir_mod> = -1
                    <v_min> = -200
                    <v_max> = 500
                    <u_min> = -75
                    <u_max> = 75
                endif
            endif
        endif
    endif
    begin 
    if GetAnalogueInfo controller = 0
        posmenu_get_uv part = <part>
        <oldU> = <uv_u>
        <oldV> = <uv_v>
        <x_modded> = 0
        if ObjectExists id = pos_right_arrow
            <leftx> = (<leftx> * <dir_mod>)
            <x_modded> = 1
            if (<leftx> > 0)
                DoScreenElementMorph id = pos_right_arrow rgba = <on_rgba> Scale = 1.100
            else
                DoScreenElementMorph id = pos_right_arrow rgba = <off_rgba> Scale = 1
            endif
        endif
        if ObjectExists id = pos_left_arrow
            if NOT (<x_modded>)
                <leftx> = (<leftx> * <dir_mod>)
            endif
            if (0 > <leftx>)
                DoScreenElementMorph id = pos_left_arrow rgba = <on_rgba> Scale = 1.100
            else
                DoScreenElementMorph id = pos_left_arrow rgba = <off_rgba> Scale = 1
            endif
        endif
        if ObjectExists id = pos_down_arrow
            if (<lefty> > 0)
                DoScreenElementMorph id = pos_down_arrow rgba = <on_rgba> Scale = 1.100
            else
                DoScreenElementMorph id = pos_down_arrow rgba = <off_rgba> Scale = 1
            endif
        endif
        if ObjectExists id = pos_up_arrow
            if (0 > <lefty>)
                DoScreenElementMorph id = pos_up_arrow rgba = <on_rgba> Scale = 1.100
            else
                DoScreenElementMorph id = pos_up_arrow rgba = <off_rgba> Scale = 1
            endif
        endif
        temp = <lefty>
        lefty = (-1 * <leftx>)
        leftx = (1 * <temp>)
        if ObjectExists id = pos_up_arrow
            if (<leftx> > 0)
                <uv_v> = (<uv_v> + (<leftx> * <uv_increment>))
            endif
        endif
        if ObjectExists id = pos_down_arrow
            if (0 > <leftx>)
                <uv_v> = (<uv_v> + (<leftx> * <uv_increment>))
            endif
        endif
        if ObjectExists id = pos_right_arrow
            if (<lefty> > 0)
                <uv_u> = (<uv_u> + (<lefty> * <uv_increment>))
            endif
        endif
        if ObjectExists id = pos_left_arrow
            if (0 > <lefty>)
                <uv_u> = (<uv_u> + (<lefty> * <uv_increment>))
            endif
        endif
        if (<uv_u> < <u_min>)
            <uv_u> = <u_max>
        endif
        if (<uv_u> > <u_max>)
            <uv_u> = <u_min>
        endif
        if (<uv_v> < <v_min>)
            <uv_v> = <v_max>
        endif
        if (<uv_v> > <v_max>)
            <uv_v> = <v_min>
        endif
        if NOT (<oldU> = <uv_u>)
            posmenu_set_uv part = <part> <...> 
            refresh_skater_uv
        else
            if NOT (<oldV> = <uv_v>)
                posmenu_set_uv part = <part> <...> 
                refresh_skater_uv
            endif
        endif
    endif
    if IsPs2
        wait 4 gameframe
    else
        wait 1 gameframe
    endif
    repeat 
endscript

script refresh_skater_uv 
    if IsPs2
        no_board = no_board
        GetCurrentSkaterProfileIndex
        if skater ::IsBoardMissing
            RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board
        else
            RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
        endif
    else
        GetCurrentSkaterProfileIndex
        RefreshSkaterUV skater = 0 profile = <currentSkaterProfileIndex>
    endif
endscript

script edit_skater_posmenu_focus 
    if ScreenElementExists \{ id = pos_up_arrow }
        RunScriptOnScreenElement id = pos_up_arrow adjust_cas_texture_pos params = {pass = <pass> material = <material> part = <part>}
    endif
endscript

script posmenu_add_rotation_item {pad_choose_script = null_script
        tab = tab3
        font = small
        icon_scale = 0
        icon_pos = (22.0, 9.0)
        text_just = [ left center ]
        text_pos = (0.0, 0.0)
        dims = (0.0, 40.0)
        anchor_id = rot_item_anchor
    }
    if GotParam is_enabled_script
        <is_enabled_script>
        if (<success> = 0)
            return 
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = pos_parts_anchor
        id = rot_anchor
        Pos = (0.0, 85.0)
        dims = <dims>
        z_priority = 10
    }
    <parent_id> = <id>
    if GotParam index
        SetScreenElementProps {
            id = <parent_id>
            tags = { tag_grid_x = <index> }
        }
    endif
    Theme_GetUnhighlightedTextColor return_value = rgba
    Theme_GetHighlightedTextColor return_value = arrow_rgba
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = <font>
        text = 'Rot'
        Scale = 0.9000
        rgba = <rgba>
        just = <text_just>
        Pos = (-95.0, 0.0)
        replace_handlers
        <not_focusable>
    }
    if ((IsXbox)|| (isPC))
        text = 'Dr¹¿ek pod prawym kciukiem'
        Scale = 0.6700
    else
        if IsNGC
            text = 'Dr¹¿ek \'C\''
            Scale = 0.6700
        else
            text = 'Prawy dr¹¿aek analogowy'
            Scale = 0.6700
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = dialog
        text = <text>
        Scale = <Scale>
        rgba = <arrow_rgba>
        just = [ left top ]
        Pos = (-95.0, -30.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = rot_left_arrow
        texture = left_arrow
        rgba = <rgba>
        Scale = 1.0
        Pos = (-33.0, 0.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = rot_right_arrow
        texture = right_arrow
        rgba = <rgba>
        Scale = 1.0
        Pos = (75.0, 0.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = rot_logo
        texture = rot_bar
        Scale = (1.399999976158142, 1.0)
        Pos = (21.0, 0.0)
        z_priority = 5
    }
endscript

script adjust_cas_texture_rot rot_increment = 20
    if NOT GotParam pass
        return 
    endif
    if NOT GotParam material
        return 
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    <rot_mod> = 1
    if ((ChecksumEquals a = <part> b = right_forearm_tattoo)|| (ChecksumEquals a = <part> b = right_bicep_tattoo))
        <rot_mod> = -1
    endif
    begin 
    if GetAnalogueInfo controller = 0
        posmenu_get_uv part = <part>
        <oldRot> = <uv_rot>
        <rot_modded> = 0
        if (<rightx> > 0)
            <rightx> = (<rightx> * <rot_mod>)
            <rot_modded> = 1
            DoScreenElementMorph id = rot_right_arrow rgba = <on_rgba> Scale = 1.100
            <uv_rot> = (<uv_rot> + (<rightx> * <rot_increment>))
        else
            DoScreenElementMorph id = rot_right_arrow rgba = <off_rgba> Scale = 1
        endif
        if (0 > <rightx>)
            if NOT (<rot_modded>)
                <rightx> = (<rightx> * <rot_mod>)
            endif
            DoScreenElementMorph id = rot_left_arrow rgba = <on_rgba> Scale = 1.100
            <uv_rot> = (<uv_rot> + (<rightx> * <rot_increment>))
        else
            DoScreenElementMorph id = rot_left_arrow rgba = <off_rgba> Scale = 1
        endif
        if (<uv_rot> < 0)
            <uv_rot> = (<uv_rot> + 360)
        endif
        if (<uv_rot> > 360)
            <uv_rot> = (<uv_rot> - 360)
        endif
        if NOT (<oldRot> = <uv_rot>)
            posmenu_set_uv part = <part> <...> 
            refresh_skater_uv
        endif
    endif
    if IsPs2
        wait 4 gameframe
    else
        wait 1 gameframe
    endif
    repeat 
endscript

script edit_skater_rotmenu_focus 
    if ScreenElementExists \{ id = rot_left_arrow }
        RunScriptOnScreenElement id = rot_left_arrow adjust_cas_texture_rot params = {pass = <pass> material = <material> part = <part>}
    endif
endscript

script posmenu_add_scale_item {pad_choose_script = null_script
        tab = tab3
        font = small
        icon_scale = 0
        icon_pos = (22.0, 9.0)
        text_just = [ left center ]
        text_pos = (0.0, 0.0)
        dims = (0.0, 40.0)
        anchor_id = scale_item_anchor
    }
    if GotParam is_enabled_script
        <is_enabled_script>
        if (<success> = 0)
            return 
        endif
    endif
    if NOT GotParam add_rot
        Pos = (0.0, 90.0)
    else
        Pos = (0.0, 115.0)
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = pos_parts_anchor
        id = scale_anchor
        Pos = <Pos>
        dims = <dims>
        z_priority = 10
    }
    <parent_id> = <id>
    if GotParam index
        SetScreenElementProps {
            id = <parent_id>
            tags = { tag_grid_x = <index> }
        }
    endif
    Theme_GetUnhighlightedTextColor return_value = rgba
    Theme_GetHighlightedTextColor return_value = arrow_rgba
    if NOT GotParam add_rot
        if ((IsXbox)|| (isPC))
            text = 'Dr¹¿ek pod prawym kciukiem'
            Scale = 0.6700
        else
            if IsNGC
                text = 'Dr¹¿ek \'C\''
                Scale = 0.6700
            else
                text = 'Prawy dr¹¿aek analogowy'
                Scale = 0.6700
            endif
        endif
        CreateScreenElement {
            type = TextElement
            parent = <parent_id>
            font = dialog
            text = <text>
            Scale = <Scale>
            rgba = <arrow_rgba>
            just = [ left top ]
            Pos = (-95.0, -30.0)
        }
    endif
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = <font>
        text = 'Skaluj'
        Scale = 0.9000
        rgba = <rgba>
        just = <text_just>
        Pos = (-95.0, 0.0)
        replace_handlers
        <not_focusable>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = scale_down_arrow
        texture = down_arrow
        rgba = <rgba>
        Scale = 1.0
        Pos = (-30.0, 0.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = scale_up_arrow
        texture = up_arrow
        rgba = <rgba>
        Scale = 1.0
        Pos = (80.0, 0.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        id = scale_logo
        texture = scale_bar
        Scale = (1.399999976158142, 1.0)
        Pos = (21.0, 0.0)
        z_priority = 5
    }
endscript

script adjust_cas_texture_scale scale_increment = 10
    if NOT GotParam pass
        return 
    endif
    if NOT GotParam material
        return 
    endif
    if StructureContains structure = (<part> [ 0 ])scale_min
        scale_min = ((<part> [ 0 ]).scale_min)
    else
        scale_min = 200
    endif
    if StructureContains structure = (<part> [ 0 ])scale_max
        scale_max = ((<part> [ 0 ]).scale_max)
    else
        scale_max = 50
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    begin 
    if GetAnalogueInfo controller = 0
        posmenu_get_uv part = <part>
        <oldScale> = <uv_scale>
        if (<righty> > 0)
            DoScreenElementMorph id = scale_down_arrow rgba = <on_rgba> Scale = 1.100
            <uv_scale> = (<uv_scale> + (<righty> * <scale_increment>))
        else
            DoScreenElementMorph id = scale_down_arrow rgba = <off_rgba> Scale = 1
        endif
        if (0 > <righty>)
            DoScreenElementMorph id = scale_up_arrow rgba = <on_rgba> Scale = 1.100
            <uv_scale> = (<uv_scale> + (<righty> * <scale_increment>))
        else
            DoScreenElementMorph id = scale_up_arrow rgba = <off_rgba> Scale = 1
        endif
        if (<uv_scale> < <scale_max>)
            <uv_scale> = <scale_max>
        endif
        if (<uv_scale> > <scale_min>)
            <uv_scale> = <scale_min>
        endif
        if NOT (<oldScale> = <uv_scale>)
            posmenu_set_uv part = <part> <...> 
            refresh_skater_uv
        endif
    endif
    if IsPs2
        wait 4 gameframe
    else
        wait 1 gameframe
    endif
    repeat 
endscript

script edit_skater_scalemenu_focus 
    if ScreenElementExists \{ id = scale_up_arrow }
        RunScriptOnScreenElement id = scale_up_arrow adjust_cas_texture_scale params = {pass = <pass> material = <material> part = <part>}
    endif
endscript

script check_ok_pad_left 
    generic_menu_up_or_down_sound \{params = { up }}
endscript

script check_ok_pad_right 
    generic_menu_up_or_down_sound \{params = { down }}
endscript
ok_pad_left_right = 1
