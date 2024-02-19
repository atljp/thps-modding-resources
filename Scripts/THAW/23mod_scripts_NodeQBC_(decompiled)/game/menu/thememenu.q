theme_menu_bg_parts_height = 23

script build_pause_menu_parts 
    if (inside_pause = 0)
        change inside_pause = 1
        playsound SK6_Menu_Fly_In vol = 100 pitch = 103
        SetScreenElementProps id = root_window tags = { menu_state = on }
        if ScreenElementExists id = grunge_anchor
            DoScreenElementMorph id = grunge_anchor time = 0.0 Pos = (0.0, 0.0) alpha = 0
            DoScreenElementMorph id = grunge_anchor time = 0.2000 Pos = (320.0, 240.0) alpha = 1
            wait 0.2000 seconds
        endif
        if ScreenElementExists id = paused_piece
            DoScreenElementMorph id = paused_piece time = 0 Pos = (0.0, 0.0) rot_angle = 0 alpha = 0 Scale = (0.0, 0.0)
            DoScreenElementMorph id = paused_piece time = 0.1000 Pos = (182.0, 75.0) rot_angle = -14 alpha = 1 Scale = (1.2999999523162842, 1.350000023841858)
            RunScriptOnScreenElement id = <id> do_random_effect params = { id = <id> }
        endif
        if GotParam show_deck
        endif
        if ScreenElementExists id = music_track_anchor
        endif
    else
        if ScreenElementExists id = grunge_anchor
            DoScreenElementMorph id = grunge_anchor time = 0 Pos = (320.0, 240.0)
        endif
        if ScreenElementExists id = paused_piece
            DoScreenElementMorph id = paused_piece time = 0 Pos = (182.0, 75.0) rot_angle = -14 alpha = 1 Scale = (1.2999999523162842, 1.350000023841858)
            RunScriptOnScreenElement id = <id> do_random_effect params = { id = <id> }
        endif
        if GotParam show_deck
        endif
        if ScreenElementExists id = music_track_anchor
        endif
        if ScreenElementExists id = box_icon
            DoScreenElementMorph id = box_icon time = 0.9500 alpha = 0.6000
            if ScreenElementExists id = box_icon_2
                DoScreenElementMorph id = box_icon_2 time = 0.7500 alpha = 0.2500
            endif
        endif
        SetScreenElementProps id = root_window tags = { menu_state = on }
    endif
endscript

script build_theme_sub_title parent = current_menu_anchor title_scale = 2.0 Pos = (0.0, 0.0) real_pos = (1500.0, 40.0) z_priority = 10 right_bracket_z = 1 right_bracket_alpha = 1.0 rot = 6 real_just = [ RIGHT top ]
    if ScreenElementExists id = submenu_title_anchor
        DestroyScreenElement id = submenu_title_anchor
    endif
    if NOT GotParam static
        if InFrontend
            Pos = (0.0, 0.0)
            right_bracket_alpha = 0
        endif
    endif
    if GotParam from_cas
        make_cas_bg_elements
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = submenu_title_anchor
        Pos = <Pos>
        just = [ left top ]
    }
    if NOT GotParam Title
        printf 'WARNING: build_theme_sub_title called without a \'title\' param'
        return 
    endif
    Theme_GetMenuTitleColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = submenu_title_anchor
        id = title_text
        Pos = <real_pos>
        just = <real_just>
        font = testtitle
        text = <Title>
        Scale = <title_scale>
        z_priority = (<z_priority> + 1)
        rgba = <title_color>
        rot_angle = <rot>
    }
    if NOT GotParam no_animate
        DoScreenElementMorph id = title_text Pos = (600.0, 40.0) time = 0.3000
    endif
    if GotParam max_width
        truncate_string id = title_text max_width = <max_width>
    endif
    if GotParam add_tab
        Theme_GetSupportPieceColor return_value = tab_color
        GetScreenElementDims id = title_text
        <initial_pos> = (((1500 - <width> - 20)* (1.0, 0.0))+ (40 * (0.0, 1.0)))
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            texture = goal_tab
            rgba = <tab_color>
            Scale = (1.0, 1.350000023841858)
            Pos = <initial_pos>
            alpha = 1
            just = [ left top ]
            z_priority = 1
        }
        DoScreenElementMorph id = <id> Pos = (<initial_pos> - (900.0, 0.0))time = 0.3000
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            texture = goal_tab_extra
            rgba = <tab_color>
            Scale = ((((<width> + 80)/ 32)* (1.0, 0.0))+ (1.350 * (0.0, 1.0)))
            Pos = (<initial_pos> + (25.0, 0.0))
            alpha = 1
            just = [ left top ]
            z_priority = 2
        }
        DoScreenElementMorph id = <id> Pos = (<initial_pos> - (875.0, 0.0))time = 0.3000
    endif
    if GotParam add_bar
        Theme_GetHighlightBarColor return_value = bg_color
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            texture = DE_highlight_bar
            Pos = (0.0, 68.0)
            rgba = <bg_color>
            just = [ center center ]
            Scale = (11.0, 1.100000023841858)
            z_priority = -1
            alpha = 0.6000
        }
    endif
    Theme_GetAltColor return_value = grad_color
    if NOT GotParam no_grad_bar
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            id = grad_bar
            texture = goal_grad
            rgba = [ 128 128 128 30 ]
            Scale = (19.0, 4.0)
            Pos = (0.0, 24.0)
            just = [ left top ]
            z_priority = 0
            rot_angle = 6
        }
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            id = paused_white_bar_sub
            texture = white2
            rgba = [ 62 1 108 40 ]
            just = [ center , center ]
            Pos = (325.0, 46.0)
            Scale = (85.0, 6.0)
            z_priority = 1
            rot_angle = 7
        }
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            id = paused_white_bar_sub3
            texture = white2
            rgba = [ 128 128 128 30 ]
            just = [ center , center ]
            Pos = (325.0, 46.0)
            Scale = (85.0, 4.0)
            z_priority = 8
            rot_angle = 4
        }
        CreateScreenElement {
            type = SpriteElement
            parent = submenu_title_anchor
            id = paused_white_bar_sub2
            texture = white2
            rgba = [ 0 0 0 88 ]
            just = [ center , center ]
            Pos = (325.0, 20.0)
            Scale = (85.0, 1.600000023841858)
            z_priority = 8
            rot_angle = 6
        }
    endif
endscript

script build_top_and_bottom_blocks {top_pos = (0.0, -29.0)
        bot_pos = (0.0, 474.0)
        top_z = 1
        bot_z = 5
        parent = current_menu_anchor
        Scale = (1.2000000476837158, 2.049999952316284)
        rgba = [ 100 100 100 128 ]
    }
    printf 'build_top_and_bottom_blocks is deprecated'
    if NOT GotParam static
        if InFrontend
            Scale = (1.2000000476837158, 1.4500000476837158)
        endif
    endif
    SetScreenElementLock Off id = <parent>
    if NOT GotParam double
        if ScreenElementExists id = top_block_anchor
            DestroyScreenElement id = top_block_anchor
            DestroyScreenElement id = bottom_block_anchor
        endif
        top_block_anchor = top_block_anchor
        bottom_block_anchor = bottom_block_anchor
    else
        top_block_anchor = top_block_anchor2
        bottom_block_anchor = bottom_block_anchor2
    endif
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    Theme_GetAltColor return_value = alt_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <top_block_anchor>
        Pos = <top_pos>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_1
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = (0.0, 0.0)
        Scale = <Scale>
        z_priority = <top_z>
    }
    top_first_id = <id>
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_2
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_3
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_4
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_5
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_6
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_7
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_8
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_9
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <top_block_anchor>
        texture = strip_10
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <top_z>
    }
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <bottom_block_anchor>
        internal_just = [ center center ]
        Pos = <bot_pos>
    }
    Scale = (1.2000000476837158, 1.600000023841858)
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_10
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = (0.0, 0.0)
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    bot_first_id = <id>
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_9
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_8
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_7
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_6
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_5
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_4
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_3
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_2
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    GetStackedScreenElementPos x id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <bottom_block_anchor>
        texture = strip_1
        rgba = [ 40 40 40 128 ]
        just = [ left top ]
        Pos = <Pos>
        Scale = <Scale>
        z_priority = <bot_z>
        rot_angle = 180
    }
    if NOT GotParam no_lines
        GetStackedScreenElementPos y id = <top_first_id> Offset = (0.0, -3.0)
        CreateScreenElement {
            type = SpriteElement
            parent = <top_block_anchor>
            texture = streak_2
            rgba = [ 0 0 0 0 ]
            just = [ left top ]
            Pos = <Pos>
            Scale = (12.0, 0.8500000238418579)
            z_priority = (<top_z> + 1)
            alpha = 0.6000
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <bottom_block_anchor>
            texture = streak_2
            rgba = [ 0 0 0 0 ]
            just = [ left top ]
            Pos = (0.0, -105.0)
            Scale = (12.0, 0.8500000238418579)
            z_priority = (<bot_z> + 1)
        }
    endif
endscript

script pause_menu_gradient parent = root_window
    if InFrontend
        return 
    endif
    if ScreenElementExists id = pause_gradient
        DestroyScreenElement id = pause_gradient
    endif
    if GotParam Off
        return 
    endif
    SetScreenElementLock Off id = <parent>
    if GotParam RIGHT
        CreateScreenElement {
            type = SpriteElement
            parent = <parent>
            id = pause_gradient
            texture = white3
            Scale = (12.0, 6.0)
            rgba = [ 0 0 0 90 ]
            Pos = (262.0, -60.0)
            rot_angle = 0
            just = [ left top ]
            z_priority = -50
        }
    else
        CreateScreenElement {
            type = SpriteElement
            parent = <parent>
            id = pause_gradient
            texture = white3
            rgba = [ 0 0 0 110 ]
            rot_angle = 179.9
            Scale = (20.0, 40.0)
            Pos = (640.0, 480.0)
            just = [ top left ]
            z_priority = -50
        }
    endif
endscript

script make_new_themed_sub_menu dims = (300.0, 300.0) Pos = (215.0, 72.0) menu_id = sub_menu vmenu_id = sub_vmenu right_bracket_z = 1
    if InFrontend
        if NOT GotParam skateshop_pos
            Pos = (100.0, 70.0)
        else
            Pos = <skateshop_pos>
        endif
    endif
    if ObjectExists id = current_menu_anchor
        generic_menu_animate_out
        DestroyScreenElement id = current_menu_anchor
    endif
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = menu_parts_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    if GotParam scrolling
        type = vscrollingmenu
        scrolling_menu_id = sub_scrolling_menu
    endif
    make_new_menu {
        Pos = <Pos>
        parent = menu_parts_anchor
        internal_just = [ left center ]
        menu_id = <menu_id>
        vmenu_id = <vmenu_id>
        scrolling_menu_id = <scrolling_menu_id>
        type = <type>
        dims = <dims>
        dont_allow_wrap = <dont_allow_wrap>
        <no_menu_title>
    }
    if GotParam scale_highlight_text
        <vmenu_id> ::settags scale_highlight_text = <scale_highlight_text>
    endif
    AssignAlias id = menu_parts_anchor alias = current_menu_anchor
    if GotParam from_cas
        make_cas_bg_elements
    else
        if InFrontend
            if NOT GotParam no_3d_plane
            endif
        endif
    endif
    if NOT GotParam helper_text
        create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Zaznacz' }
                { text = '\m1 = Wstecz' }
                { text = '\m0 = Akceptuj' }
            ]
        }
    else
        create_helper_text <helper_text>
    endif
    kill_start_key_binding
    if NOT GotParam no_grad_bar
        build_theme_sub_title Title = <Title> right_bracket_z = <right_bracket_z> right_bracket_alpha = <right_bracket_alpha> title_scale = <title_scale>
    else
        build_theme_sub_title Title = <Title> no_grad_bar right_bracket_z = <right_bracket_z> right_bracket_alpha = <right_bracket_alpha> title_scale = <title_scale>
    endif
endscript

script finish_themed_sub_menu \{ menu = sub_menu end_pos = (320.0, 240.0) time = 0.2000 }
    change \{ widest_menu_item_width = 0 }
    if NOT GotParam \{ no_sound }
        playsound \{ DE_PauseFlyIn vol = 100 pitch = 160 }
    endif
    playsound \{ DE_PauseFlyIn vol = 100 pitch = 160 }
    generic_menu_animate_in force Pos = <end_pos> menu = <menu> no_wait
    FireEvent type = focus target = <menu>
endscript

script make_new_themed_option_menu menu_id = options_menu vmenu_id = options_vmenu
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if InSplitScreenGame
        GoalManager_ShowPoints
        options_pos = (120.0, 68.0)
    else
        options_pos = (120.0, 60.0)
    endif
    make_new_menu {
        menu_id = <menu_id>
        vmenu_id = <vmenu_id>
        menu_title = ''
        Pos = <options_pos>
    }
    build_theme_sub_title Title = <Title> right_bracket_alpha = <right_bracket_alpha>
    create_helper_text generic_helper_text
    kill_start_key_binding
endscript

script make_theme_menu_item {focus_script = theme_item_focus
        text = 'Domylny tekst'
        unfocus_script = theme_item_unfocus
        pad_choose_script = null_script
        pad_choose_sound = theme_menu_pad_choose_sound
        Scale = 1.0
        rgba = [ 128 123 20 128 ]
        dims = (300.0, 18.0)
        just = [ RIGHT center ]
        parent = current_menu
    }
    if GotParam not_focusable
        <rgba> = [ 128 128 128 50 ]
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            just = [ center center ]
            not_focusable
        }
    else
        Theme_GetUnhighlightedTextColor return_value = text_color
        <rgba> = <text_color>
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            just = [ center center ]
            event_handlers = [
                {focus <focus_script> params = { text = <text> }}
                { unfocus <unfocus_script> }
                { pad_start <pad_choose_sound> }
                { pad_choose <pad_choose_sound> }
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
        }
    endif
    container_id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <id>
        font = small
        text = <text>
        rgba = <rgba>
        Scale = <Scale>
        Pos = (210.0, 10.0)
        just = <just>
    }
    if NOT GotParam no_highlight_bar
        highlight_angle = 0
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            texture = white3
            Pos = (120.0, 10.0)
            rgba = [ 0 15 15 0 ]
            just = [ center center ]
            Scale = (15.0, 0.15000000596046448)
            z_priority = 6
            rot_angle = <highlight_angle>
        }
    endif
    if GotParam mark_first_input
        SetScreenElementProps {
            id = <container_id>
            event_handlers = [{ pad_choose mark_first_input_received }
                { pad_start mark_first_input_received }
            ]
        }
    endif
endscript

script theme_menu_add_item {parent = current_menu
        font = small
        highlight_bar_scale = (2.0999999046325684, 0.699999988079071)
        highlight_bar_pos = (90.0, -7.0)
        text_just = [ RIGHT center ]
        focus_script = main_theme_focus
        unfocus_script = main_theme_unfocus
        text_pos = (95.0, -5.0)
        dims = (200.0, 20.0)
        pad_choose_script = NullScript
        text_alpha = 1.0
        Scale = 1.0
        z_priority = 3
    }
    if NOT GotParam text_rgba
        Theme_GetUnhighlightedTextColor return_value = text_rgba
    endif
    if NOT GotParam line_rgba
        Theme_GetHighlightedTextColor return_value = line_rgba
    endif
    if GotParam first_item
        focus_params = {first_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
    else
        if GotParam last_item
            focus_params = {last_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
        else
            focus_params = {text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
        endif
    endif
    if GotParam not_focusable
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            event_handlers = [{focus <focus_script> params = <focus_params>}
                {unfocus <unfocus_script> params = <focus_params>}
            ]
            replace_handlers
            not_focusable
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            id = <id>
            dims = <dims>
            event_handlers = [{focus <focus_script> params = <focus_params>}
                {unfocus <unfocus_script> params = <focus_params>}
            ]
            replace_handlers
        }
    endif
    <anchor_id> = <id>
    if (#"0xb9a690a9" = 1)
        <pad_choose_script> = #"0x87ab837f"
    endif
    if GotParam scale_highlight_text
        <anchor_id> ::settags scale_highlight_text = <scale_highlight_text>
    endif
    if NOT GotParam no_sound
        SetScreenElementProps id = <anchor_id> event_handlers = [{ pad_choose generic_menu_pad_choose_sound }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            { pad_start generic_menu_pad_choose_sound }
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
    else
        SetScreenElementProps id = <anchor_id> event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
    endif
    if GotParam cat_edit_item
        SetScreenElementProps {id = <anchor_id>
            event_handlers = [
                {pad_left <pad_right_script> params = {reverse id = <id> value = <value> <params>}}
                {pad_right <pad_right_script> params = {id = <id> value = <value> <params>}}
                {pad_choose <pad_choose_script> params = <params>}
                {pad_start <pad_choose_script> params = <params>}
            ]
            replace_handlers
        }
    else
        if GotParam pad_right_script
            SetScreenElementProps {id = <anchor_id>
                event_handlers = [
                    {pad_left <pad_left_script> params = { <pad_left_params> }}
                    {pad_right <pad_right_script> params = { <pad_right_params> }}
                ]
                replace_handlers
            }
        endif
    endif
    if GotParam mark_first_input
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{ pad_choose mark_first_input_received }
                { pad_choose generic_menu_pad_choose_sound }
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                { pad_start mark_first_input_received }
                { pad_start generic_menu_pad_choose_sound }
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            replace_handlers
        }
    endif
    if GotParam centered
        text_just = [ center center ]
        text_pos = (85.0, -5.0)
    endif
    if GotParam cap_text_length_please
        ShortenUIString ui_string = <text> max_len = <cap_text_length_please>
        text = <short_ui_string>
    endif
    if GotParam not_focusable
        <text_rgba> = [ 60 60 60 75 ]
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            id = <text_id>
            font = <font>
            text = <text>
            Scale = <Scale>
            Pos = <text_pos>
            just = <text_just>
            rgba = <text_rgba>
            alpha = <text_alpha>
            not_focusable
            z_priority = <z_priority>
        }
    else
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            id = <text_id>
            font = <font>
            text = <text>
            Scale = <Scale>
            Pos = <text_pos>
            just = <text_just>
            rgba = <text_rgba>
            alpha = <text_alpha>
            z_priority = <z_priority>
        }
    endif
    if GotParam max_width
        truncate_string id = <id> max_width = <max_width>
    endif
    highlight_angle = 0
    if GotParam menu
        FormatText checksumname = bar_id 'highlight_bar%m_%i' m = <menu> i = middle_piece_id_num
        FormatText checksumname = line_id 'text_line%m_%i' m = <menu> i = middle_piece_id_num
        FormatText checksumname = box_id 'text_box%m_%i' m = <menu> i = middle_piece_id_num
    else
        FormatText checksumname = bar_id 'highlight_bar_%i' i = middle_piece_id_num
        FormatText checksumname = line_id 'text_line_%i' i = middle_piece_id_num
        FormatText checksumname = box_id 'text_box_%i' i = middle_piece_id_num
    endif
    if NOT GotParam no_highlight_bar
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            id = <bar_id>
            texture = DE_highlight_bar
            Pos = <highlight_bar_pos>
            rgba = [ 0 0 0 0 ]
            just = [ center center ]
            Scale = <highlight_bar_scale>
            z_priority = (<z_priority> -1)
            rot_angle = <highlight_angle>
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <anchor_id>
            Pos = (0.0, 0.0)
        }
    endif
    if NOT GotParam no_bg
        build_theme_menu_middle {parent = <anchor_id>
            last_menu_item = <last_menu_item>
            centered = <centered>
            static_width = <static_width>
            middle_scale = <middle_scale>
            menu = <menu>
            dark_menu = <dark_menu>
            height = <item_bg_height>
        }
    else
        if GotParam first_item
            change widest_menu_item_width = 0
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = <anchor_id>
            Pos = (0.0, 0.0)
        }
        change middle_piece_id_num = (middle_piece_id_num + 1)
        GetScreenElementDims id = <id>
    endif
    if GotParam extra_text
        if GotParam text_block_height
            CreateScreenElement {
                type = TextBlockElement
                parent = <anchor_id>
                id = <extra_text_id>
                font = <font>
                text = <extra_text>
                Scale = <Scale>
                Pos = (<text_pos> + (10.0, 0.0))
                just = [ left top ]
                internal_just = [ left top ]
                rgba = <text_rgba>
                z_priority = <z_priority>
                dims = (330.0, 10.0)
                allow_expansion
            }
            <bar_id> ::settags text_block_height = <text_block_height>
        else
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id>
                id = <extra_text_id>
                font = <font>
                text = <extra_text>
                Scale = <Scale>
                Pos = (<text_pos> + (10.0, 0.0))
                just = [ left center ]
                rgba = <text_rgba>
                z_priority = <z_priority>
            }
        endif
        if NOT GotParam ignore_width
            GetScreenElementDims id = {<anchor_id> child = 3}
            if (<width> > widest_menu_item_width)
                change widest_menu_item_width = (<width> + 15)
            endif
        endif
    else
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            font = small
            text = ''
            alpha = 0
        }
    endif
    if GotParam cross_it_out
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            id = <line_id>
            texture = streak_2
            Pos = <highlight_bar_pos>
            rgba = <line_rgba>
            just = [ center center ]
            Scale = <highlight_bar_scale>
            z_priority = (<z_priority> + 1)
            rot_angle = <highlight_angle>
        }
    endif
    if GotParam box_it_up
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            id = <box_id>
            texture = black
            Pos = <highlight_bar_pos>
            rgba = [ 0 0 0 60 ]
            just = [ center center ]
            Scale = <highlight_bar_scale>
            z_priority = <z_priority>
        }
    endif
    if NOT GotParam ignore_width
        GetScreenElementDims id = {<anchor_id> child = 0}
        if (<width> > widest_menu_item_width)
            change widest_menu_item_width = <width>
        endif
    endif
    if ((GotParam last_menu_item)|| (GotParam last_item))
        if NOT GotParam static_width
            if GotParam centered
                RunScriptOnScreenElement id = <id> set_all_menu_items_width params = {centered menu = <menu> height = <item_bg_height>}
            else
                RunScriptOnScreenElement id = <id> set_all_menu_items_width params = {menu = <menu> height = <item_bg_height>}
            endif
        endif
    endif
    SetScreenElementLock id = <parent> on
    SetScreenElementLock id = <parent> Off
endscript

script theme_menu_add_centered_item 
    theme_menu_add_item <...> centered = centered
endscript

script theme_menu_add_checkbox_item 
    if NOT GotParam id
        printf 'checkbox items must have an id'
        return 
    endif
    if NOT GotParam value
        printf 'checkbox items must have a value'
        return 
    endif
    anchor_id = <id>
    theme_menu_add_item focus_script = theme_checkbox_focus unfocus_script = theme_checkbox_unfocus <...> 
    Theme_GetUnhighlightedTextColor return_value = check_rgba
    if (<value> = 0)
        alpha = 0
    else
        alpha = 1
    endif
    GetStackedScreenElementPos x id = {<id> child = 0}Offset = (20.0, 5.0)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = checkmark
        Pos = <Pos>
        alpha = <alpha>
        just = [ left center ]
        rgba = <check_rgba>
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = checkbox
        Pos = (<Pos> + (0.0, 5.0))
        just = [ left center ]
        Scale = 0.5000
        rgba = <check_rgba>
        z_priority = 5
    }
endscript

script theme_set_checkbox 
    if NOT GotParam \{ value }
        printf \{ 'theme_set_checkbox must have value' }
        return 
    endif
    gettags
    if (<value> = 1)
        DoScreenElementMorph id = {<id> child = 4}alpha = 1
    else
        DoScreenElementMorph id = {<id> child = 4}alpha = 0
    endif
endscript

script theme_menu_add_number_item min = 0 max = 10 step = 1
    if NOT GotParam id
        printf 'number items must have an id'
        return 
    endif
    if NOT GotParam value
        printf 'number items must have a value'
        return 
    endif
    anchor_id = <id>
    if GotParam trailingtext
        FormatText textname = value_text '%v%t' v = <value> decimalplaces = <decimalplaces> t = <trailingtext>
    else
        if GotParam percent
            FormatText textname = value_text '%v\%' v = <value> decimalplaces = <decimalplaces>
        else
            FormatText textname = value_text '%v' v = <value> decimalplaces = <decimalplaces>
        endif
    endif
    theme_menu_add_item <...> extra_text = <value_text> focus_script = theme_number_item_focus unfocus_script = theme_number_item_unfocus
    if NOT GotParam cat_edit_item
        SetScreenElementProps {id = <anchor_id>
            event_handlers = [{pad_left theme_menu_toggle_number_item params = {reverse
                        callback = <pad_left_script>
                        pad_left_script = <pad_left_script>
                        pad_right_script = <pad_right_script>
                        value = <value>
                        max = <max>
                        min = <min>
                        step = <step>
                        avoid = <avoid>
                        <pad_left_params>
                    }
                }
                {pad_right theme_menu_toggle_number_item params = {callback = <pad_right_script>
                        pad_left_script = <pad_left_script>
                        pad_right_script = <pad_right_script>
                        value = <value>
                        max = <max>
                        min = <min>
                        step = <step>
                        avoid = <avoid>
                        <pad_right_params>
                    }
                }
            ]
            replace_handlers
        }
    endif
    Theme_GetUnhighlightedTextColor return_value = arrow_rgba
    if GotParam far_left
        GetScreenElementPosition id = {<anchor_id> child = 0}
    else
        GetScreenElementPosition id = {<anchor_id> child = 3}
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = left_arrow
        Pos = (<screenelementpos> + (0.0, 2.0))
        alpha = 0
        just = [ RIGHT top ]
        rgba = <arrow_rgba>
        z_priority = 5
        Scale = 0.6500
    }
    if GotParam right_arrow_pos
        Pos = <right_arrow_pos>
    else
        GetStackedScreenElementPos x id = {<anchor_id> child = 3}Offset = (3.0, 2.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = right_arrow
        Pos = <Pos>
        alpha = 0
        just = [ left top ]
        rgba = <arrow_rgba>
        z_priority = 5
        Scale = 0.6500
    }
endscript

script theme_menu_toggle_number_item 
    gettags
    if GotParam NoStep
    else
        begin 
        if GotParam reverse
            if (((<value> - <step>)> <min>)|| ((<value> - <step>)= <min>))
                value = (<value> - <step>)
            else
                return 
            endif
        else
            if (<max> > ((<value> + <step>))|| ((<value> + <step>)= <max>))
                value = (<value> + <step>)
            else
                return 
            endif
        endif
        if GotParam avoid
            if (<value> = <avoid>)
            else
                break 
            endif
        else
            break 
        endif
        repeat 2
    endif
    FormatText textname = value_text '%v' v = <value>
    SetScreenElementProps {id = {<id> child = 3}text = <value_text>}
    theme_menu_update_number_item_right_arrow
    SetScreenElementProps {id = <id>
        event_handlers = [{pad_left theme_menu_toggle_number_item params = {reverse
                    callback = <pad_left_script>
                    pad_left_script = <pad_left_script>
                    pad_right_script = <pad_right_script>
                    value = <value>
                    max = <max>
                    min = <min>
                    step = <step>
                    avoid = <avoid>
                    <pad_left_params>
                }
            }
            {pad_right theme_menu_toggle_number_item params = {callback = <pad_right_script>
                    pad_left_script = <pad_left_script>
                    pad_right_script = <pad_right_script>
                    value = <value>
                    max = <max>
                    min = <min>
                    step = <step>
                    avoid = <avoid>
                    <pad_right_params>
                }
            }
        ]
        replace_handlers
    }
    if GotParam callback
        <callback> <...> 
    endif
endscript

script theme_menu_update_number_item_right_arrow 
    gettags
    GetStackedScreenElementPos x id = {<id> child = 3}Offset = (3.0, 2.0)
    SetScreenElementProps {id = {<id> child = 5}Pos = <Pos>}
endscript

script theme_menu_add_flag_item 
    if NOT GotParam flag
        printf 'theme_menu_add_flag_item requires a flag param'
        return 
    endif
    if NOT GotParam flag
        printf 'theme_menu_add_flag_item requires an id param'
        return 
    endif
    if GetGlobalFlag flag = <flag>
        if GotParam reverse
            extra_text = 'Wy³.'
            reverse = reverse
        else
            extra_text = 'W³.'
        endif
    else
        if GotParam reverse
            extra_text = 'W³.'
            reverse = reverse
        else
            extra_text = 'Wy³.'
        endif
    endif
    theme_menu_add_item <...> pad_choose_script = theme_toggle_flag pad_choose_params = {flag = <flag> id = <id> reverse = <reverse>}
endscript

script theme_toggle_flag 
    if GetGlobalFlag flag = <flag>
        if GotParam reverse
            SetScreenElementProps id = {<id> child = 3}text = 'W³.'
        else
            SetScreenElementProps id = {<id> child = 3}text = 'Wy³.'
        endif
        UnsetGlobalFlag flag = <flag>
    else
        if GotParam reverse
            SetScreenElementProps id = {<id> child = 3}text = 'Wy³.'
        else
            SetScreenElementProps id = {<id> child = 3}text = 'W³.'
        endif
        SetGlobalFlag flag = <flag>
    endif
endscript
widest_menu_item_width = 0
middle_piece_id_num = 0

script build_theme_menu_top parent = current_menu_anchor Pos = (90.0, -29.0)
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <top_id>
        Pos = <Pos>
    }
    anchor_id = <id>
    if InFrontend
        if (main_menu_jump_to_cas = 0)
            m_texture = mm_t_m
            l_texture = mm_t_l
            r_texture = mm_t_r
        else
            m_texture = de_t_m
            l_texture = de_t_l
            r_texture = de_t_r
        endif
    else
        if GotParam dark_menu
            m_texture = spec_t_m
            l_texture = spec_t_l
            r_texture = spec_t_r
        else
            m_texture = de_t_m
            l_texture = de_t_l
            r_texture = de_t_r
        endif
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <mid_id>
        texture = <m_texture>
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <bg_piece_rgba>
        Scale = <middle_scale>
        z_priority = 1
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width>)
    left_pos = ((-0.5, 0.0) * <width>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <left_id>
        texture = <l_texture>
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <bg_piece_rgba>
        Scale = (1.0, 1.0)
        z_priority = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <right_id>
        texture = <r_texture>
        Pos = <right_pos>
        just = [ left top ]
        rgba = <bg_piece_rgba>
        Scale = (1.0, 1.0)
        z_priority = 1
    }
    change widest_menu_item_width = 0
endscript

script build_theme_menu_middle Pos = (90.0, -20.0) middle_scale = (2.5, 1.0) height = 1
    Theme_GetBGPartsColor return_value = bg_piece_rgba
    if NOT GotParam menu
        FormatText checksumname = mid_id 'middle_piece_%i' i = middle_piece_id_num
        FormatText checksumname = left_id 'left_piece_%i' i = middle_piece_id_num
        FormatText checksumname = right_id 'right_piece_%i' i = middle_piece_id_num
        top_id = box_top_anchor
    else
        FormatText checksumname = mid_id 'middle_piece%m_%i' i = middle_piece_id_num m = <menu>
        FormatText checksumname = left_id 'left_piece%m_%i' i = middle_piece_id_num m = <menu>
        FormatText checksumname = right_id 'right_piece%m_%i' i = middle_piece_id_num m = <menu>
        FormatText checksumname = top_id 'box_top_anchor%i' i = <menu>
    endif
    change middle_piece_id_num = (middle_piece_id_num + 1)
    if NOT ScreenElementExists id = <top_id>
        build_theme_menu_top {parent = <parent>
            top_id = <top_id>
            middle_scale = <middle_scale>
            bg_piece_rgba = <bg_piece_rgba>
            mid_id = <mid_id> left_id = <left_id>
            right_id = <right_id>
            menu = <menu>
            dark_menu = <dark_menu>
        }
        return 
    endif
    if GotParam last_menu_item
        build_theme_menu_bottom {parent = <parent>
            Pos = <Pos>
            middle_scale = <middle_scale>
            bg_piece_rgba = <bg_piece_rgba>
            mid_id = <mid_id>
            left_id = <left_id>
            right_id = <right_id>
            static_width = <static_width>
            centered = <centered>
            menu = <menu>
            dark_menu = <dark_menu>
        }
        return 
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        Pos = <Pos>
    }
    anchor_id = <id>
    modded_middle_scale = ((<middle_scale> - (0.0, 1.0))+ ((0.0, 1.0) * <height>))
    left_right_scale = ((1.0, 0.0) + (0.0, 1.0) * <height>)
    if InFrontend
        if (main_menu_jump_to_cas = 0)
            m_texture = mm_m_m
            l_texture = mm_m_l
            r_texture = mm_m_r
        else
            m_texture = de_m_m
            l_texture = de_m_l
            r_texture = de_m_r
        endif
    else
        if GotParam dark_menu
            m_texture = spec_m_m
            l_texture = spec_m_l
            r_texture = spec_m_r
        else
            m_texture = de_m_m
            l_texture = de_m_l
            r_texture = de_m_r
        endif
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <mid_id>
        texture = <m_texture>
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <bg_piece_rgba>
        Scale = <modded_middle_scale>
        z_priority = 1
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width>)
    left_pos = ((-0.5, 0.0) * <width>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <left_id>
        texture = <l_texture>
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <bg_piece_rgba>
        Scale = <left_right_scale>
        z_priority = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <right_id>
        texture = <r_texture>
        Pos = <right_pos>
        just = [ left top ]
        rgba = <bg_piece_rgba>
        Scale = <left_right_scale>
        z_priority = 1
    }
endscript

script build_theme_menu_bottom Pos = (0.0, 23.0)
    if GotParam menu
        FormatText textname = con_id 'box_bottom_anchor%i' i = <menu>
    else
        con_id = box_bottom_anchor
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <con_id>
        Pos = <Pos>
    }
    anchor_id = <id>
    if InFrontend
        if (main_menu_jump_to_cas = 0)
            m_texture = mm_b_m
            l_texture = mm_b_l
            r_texture = mm_b_r
        else
            m_texture = de_b_m
            l_texture = de_b_l
            r_texture = de_b_r
        endif
    else
        if GotParam dark_menu
            m_texture = spec_B_M
            l_texture = spec_b_l
            r_texture = spec_b_r
        else
            m_texture = de_b_m
            l_texture = de_b_l
            r_texture = de_b_r
        endif
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <mid_id>
        texture = <m_texture>
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <bg_piece_rgba>
        Scale = <middle_scale>
        z_priority = 1
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width>)
    left_pos = ((-0.5, 0.0) * <width>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <left_id>
        texture = <l_texture>
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <bg_piece_rgba>
        Scale = (1.0, 1.0)
        z_priority = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        id = <right_id>
        texture = <r_texture>
        Pos = <right_pos>
        just = [ left top ]
        rgba = <bg_piece_rgba>
        Scale = (1.0, 1.0)
        z_priority = 1
    }
    change middle_piece_id_num = 0
endscript

script set_all_menu_items_width 
    change middle_piece_id_num = 0
    if NOT GotParam centered
        new_scale = (widest_menu_item_width * (0.02500000037252903, 0.0) + (0.0, 1.0))
        bar_scale = (widest_menu_item_width * (0.012000000104308128, 0.0) + (1.0, 0.699999988079071))
        line_scale = (widest_menu_item_width * (0.03200000151991844, 0.0) + (1.0, 0.30000001192092896))
        box_scale = (widest_menu_item_width * (0.6399999856948853, 0.0) + (1.0, 6.0))
    else
        new_scale = (widest_menu_item_width * (0.012500000186264515, 0.0) + (0.0, 1.0))
        bar_scale = (widest_menu_item_width * (0.006000000052154064, 0.0) + (1.0, 0.699999988079071))
        line_scale = (widest_menu_item_width * (0.01600000075995922, 0.0) + (1.0, 0.30000001192092896))
        box_scale = (((<bar_scale> * 32).(1.0, 0.0))* (1.0, 0.0) + (0.0, 6.0))
    endif
    index = 0
    begin 
    if NOT GotParam menu
        FormatText checksumname = mid_id 'middle_piece_%i' i = <index>
        FormatText checksumname = left_id 'left_piece_%i' i = <index>
        FormatText checksumname = right_id 'right_piece_%i' i = <index>
        FormatText checksumname = bar_id 'highlight_bar_%i' i = <index>
        FormatText checksumname = line_id 'text_line_%i' i = <index>
        FormatText checksumname = box_id 'text_box_%i' i = <index>
    else
        FormatText checksumname = mid_id 'middle_piece%m_%i' m = <menu> i = <index>
        FormatText checksumname = left_id 'left_piece%m_%i' m = <menu> i = <index>
        FormatText checksumname = right_id 'right_piece%m_%i' m = <menu> i = <index>
        FormatText checksumname = bar_id 'highlight_bar%m_%i' m = <menu> i = <index>
        FormatText checksumname = line_id 'text_line%m_%i' m = <menu> i = <index>
        FormatText checksumname = box_id 'text_box%m_%i' m = <menu> i = <index>
    endif
    if ScreenElementExists id = <mid_id>
        DoScreenElementMorph id = <mid_id> Scale = <new_scale>
        GetScreenElementDims id = <mid_id>
        right_pos = ((0.5, 0.0) * <width>)
        left_pos = ((-0.5, 0.0) * <width>)
        DoScreenElementMorph id = <left_id> Pos = <left_pos>
        DoScreenElementMorph id = <right_id> Pos = <right_pos>
    endif
    if ScreenElementExists id = <bar_id>
        GetScreenElementProps id = <bar_id>
        if NOT (widest_menu_item_width = 0)
            new_angle = ((<rot_angle> * 5.0)/ (widest_menu_item_width * 0.001000))
            if <bar_id> ::getsingletag text_block_height
                DoScreenElementMorph id = <bar_id> Scale = (widest_menu_item_width * (0.012000000104308128, 0.0) + (1.0, 0.0) + (<text_block_height> * (0.0, 0.699999988079071)))
            else
                DoScreenElementMorph id = <bar_id> Scale = <bar_scale> rot_angle = <new_angle>
            endif
            if ScreenElementExists id = <line_id>
                DoScreenElementMorph id = <line_id> Scale = <line_scale> rot_angle = <new_angle>
            endif
            if ScreenElementExists id = <box_id>
                DoScreenElementMorph id = <box_id> Scale = <box_scale>
            endif
        endif
    else
    endif
    index = (<index> + 1)
    repeat 100
endscript
no_focus_sound = 1

script main_theme_focus 
    gettags
    Theme_GetHighlightedTextColorNew return_value = highlighted_text_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    if ScreenElementExists id = current_menu
        current_menu ::getsingletag scale_highlight_text
    endif
    if ScreenElementExists id = current_vmenu
        current_vmenu ::getsingletag scale_highlight_text
    endif
    if ScreenElementExists id = current_menu_anchor
        current_menu_anchor ::getsingletag scale_highlight_text
    endif
    if GotParam scale_highlight_text
        DoScreenElementMorph {
            id = {<id> child = 0}
            Scale = <scale_highlight_text>
            relative_scale
        }
        if ScreenElementExists id = {<id> child = 3}
            DoScreenElementMorph {
                id = {<id> child = 3}
                Scale = <scale_highlight_text>
                relative_scale
            }
        endif
    endif
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <highlighted_text_rgba>
    }
    if ScreenElementExists id = {<id> child = 3}
        if GetScreenElementChildren id = {<id> child = 3}
            GetArraySize <children>
            i = 0
            begin 
            DoScreenElementMorph {
                id = (<children> [ <i> ])
                rgba = <highlighted_text_rgba>
            }
            i = (<i> + 1)
            repeat <array_size>
        else
            DoScreenElementMorph {
                id = {<id> child = 3}
                rgba = <highlighted_text_rgba>
            }
        endif
    endif
    if ScreenElementExists id = {<id> child = 1}
        SetScreenElementProps {
            id = {<id> child = 1}
            rgba = <bar_rgba>
        }
    endif
    if ScreenElementExists id = scrolling_menu_up_arrow
        if GotParam first_item
            DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0
        else
            DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1
        endif
    endif
    if ScreenElementExists id = scrolling_menu_down_arrow
        if GotParam last_item
            DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0
        else
            DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1
        endif
    endif
    RunScriptOnScreenElement id = <id> theme_highlight_sweep
endscript

script main_theme_unfocus text_alpha = 1.0
    gettags
    if NOT GotParam text_rgba
        Theme_GetUnhighlightedTextColorNew return_value = text_rgba
    endif
    kill_theme_highlight_sweep id = <id>
    if GotParam scale_highlight_text
        <local_scale> = { Scale = 1 }
    else
        <local_scale> = {}
    endif
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
        alpha = <text_alpha>
        <local_scale>
    }
    if ScreenElementExists id = {<id> child = 3}
        if GetScreenElementChildren id = {<id> child = 3}
            GetArraySize <children>
            i = 0
            begin 
            DoScreenElementMorph {
                id = (<children> [ <i> ])
                rgba = <text_rgba>
                alpha = <text_alpha>
                <local_scale>
            }
            i = (<i> + 1)
            repeat <array_size>
        else
            DoScreenElementMorph {
                id = {<id> child = 3}
                rgba = <text_rgba>
                alpha = <text_alpha>
                <local_scale>
            }
        endif
    endif
    if ScreenElementExists id = {<id> child = 1}
        SetScreenElementProps {
            id = {<id> child = 1}
            rgba = [ 128 128 128 0 ]
        }
    endif
endscript

script theme_highlight_sweep 
    gettags
    if NOT ScreenElementExists id = {<id> child = 1}
        return 
    endif
    Theme_GetHighlightBarColor return_value = bar_color
    if NOT ScreenElementExists id = {<id> child = { 1 child = highlight }}
        SetScreenElementLock id = {<id> child = 1}Off
        CreateScreenElement {
            type = SpriteElement
            parent = {<id> child = 1}
            local_id = highlight
            texture = roundbar_highlight
            Pos = (0.0, 1.0)
            rgba = <bar_color>
            just = [ top left ]
        }
    else
        id = {<id> child = { 1 child = highlight }}
    endif
    DoScreenElementMorph id = <id> Scale = (3.0, 1.2999999523162842) time = 0
    DoScreenElementMorph id = <id> Pos = (0.0, 0.0) time = 0
    DoScreenElementMorph id = <id> alpha = 0.5000 time = 0
    begin 
    DoScreenElementMorph id = <id> Pos = (80.0, 0.0) time = 0.4500 anim = gentle
    wait 0.5000 seconds
    DoScreenElementMorph id = <id> Pos = (0.0, 0.0) time = 0.4500 anim = gentle
    wait 0.5000 seconds
    repeat 
endscript

script kill_theme_highlight_sweep 
    if NOT ScreenElementExists id = {<id> child = 1}
        return 
    endif
    KillSpawnedScript \{ name = theme_highlight_sweep }
    if ScreenElementExists id = {<id> child = { 1 child = highlight }}
        DoScreenElementMorph id = {<id> child = { 1 child = highlight }}alpha = 0 time = 0
    endif
endscript

script main_theme_focus_noscale 
    gettags
    if NOT GotParam highlighted_text_rgba
        Theme_GetHighlightedTextColor return_value = highlighted_text_rgba
    endif
    Theme_GetHighlightBarColor return_value = bar_rgba
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <highlighted_text_rgba>
        relative_scale
    }
    if ScreenElementExists id = {<id> child = 3}
        DoScreenElementMorph {
            id = {<id> child = 3}
            rgba = <highlighted_text_rgba>
            relative_scale
        }
    endif
    if ScreenElementExists id = {<id> child = 1}
        SetScreenElementProps {
            id = {<id> child = 1}
            rgba = <bar_rgba>
        }
    endif
    if ScreenElementExists id = scrolling_menu_up_arrow
        if GotParam first_item
            DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0
        else
            DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1
        endif
    endif
    if ScreenElementExists id = scrolling_menu_down_arrow
        if GotParam last_item
            DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0
        else
            DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1
        endif
    endif
endscript

script main_theme_unfocus_noscale 
    gettags
    if NOT GotParam text_rgba
        Theme_GetUnhighlightedTextColor return_value = text_rgba
    endif
    KillSpawnedScript name = text_twitch_effect
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
        alpha = <text_alpha>
    }
    if ScreenElementExists id = {<id> child = 3}
        DoScreenElementMorph {
            id = {<id> child = 3}
            rgba = <text_rgba>
            alpha = <text_alpha>
        }
    endif
    if ScreenElementExists id = {<id> child = 1}
        SetScreenElementProps {
            id = {<id> child = 1}
            rgba = [ 128 128 128 0 ]
        }
    endif
endscript

script theme_checkbox_focus 
    main_theme_focus <...> 
    gettags
    Theme_GetHighlightedTextColor \{ return_value = text_rgba }
    SetScreenElementProps {
        id = {<id> child = 4}
        rgba = <text_rgba>
        alpha = <text_alpha>
        relative_scale
    }
endscript

script theme_checkbox_unfocus 
    main_theme_unfocus <...> 
    gettags
    Theme_GetUnhighlightedTextColor \{ return_value = text_rgba }
    SetScreenElementProps {
        id = {<id> child = 4}
        rgba = <text_rgba>
        alpha = <text_alpha>
        Scale = 1
        relative_scale
    }
endscript

script theme_number_item_focus 
    main_theme_focus <...> 
    gettags
    DoScreenElementMorph {
        id = {<id> child = 4}
        alpha = 1
    }
    DoScreenElementMorph {
        id = {<id> child = 5}
        alpha = 1
    }
endscript

script theme_number_item_unfocus 
    main_theme_unfocus <...> 
    gettags
    DoScreenElementMorph {
        id = {<id> child = 4}
        alpha = 0
    }
    DoScreenElementMorph {
        id = {<id> child = 5}
        alpha = 0
    }
endscript

script theme_item_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = text_color
    Theme_GetHighlightBarColor return_value = hbar_color
    SetScreenElementProps id = {<id> child = 0}rgba = <text_color>
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 Scale = 1.100
    if ScreenElementExists id = {<id> child = 1}
        SetScreenElementProps {
            id = {<id> child = 1}
            rgba = <hbar_color>
        }
    endif
    RunScriptOnScreenElement id = <id> text_twitch_effect params = { text_scale = <text_scale> }
endscript

script theme_item_unfocus 
    gettags
    generic_menu_pad_up_down_sound
    KillSpawnedScript name = text_twitch_effect
    Theme_GetUnhighlightedTextColor return_value = text_color
    SetScreenElementProps id = {<id> child = 0}rgba = <text_color>
    SetScreenElementProps id = {<id> child = 0}no_blur_effect
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 restore_alpha Scale = 1
    if ScreenElementExists id = {<id> child = 1}
        DoScreenElementMorph id = {<id> child = 1}rgba = [ 0 0 0 0 ]
    endif
endscript

script sprite_unfocus 
    gettags
    main_theme_unfocus <...> 
    theme_item_unfocus <...> 
endscript

script text_twitch_effect 
    gettags
    Theme_GetHighlightedTextColor return_value = text_color
    Theme_GetTextTwitchColor return_value = twitch_color
    begin 
    GetScreenElementDims id = {<id> child = 0}
    ScaleH = ((<width> + 5.0)/ (<width>))
    DoScreenElementMorph id = {<id> child = 0}time = 0.03000 Scale = <ScaleH> alpha = 1
    if NOT GotParam no_extra
        if ScreenElementExists id = {<id> child = 3}
            GetScreenElementDims id = {<id> child = 3}
            if NOT (<width> = 0)
                ScaleH = ((<width> + 5.0)/ (<width>))
                DoScreenElementMorph id = {<id> child = 3}time = 0.03000 Scale = <ScaleH> alpha = 1
            endif
        endif
    endif
    wait 2 gameframe
    DoScreenElementMorph id = {<id> child = 0}time = 0.01000 Scale = 1 alpha = 0.9000
    if NOT GotParam no_extra
        if ScreenElementExists id = {<id> child = 3}
            DoScreenElementMorph id = {<id> child = 3}time = 0.01000 Scale = 1 alpha = 0.9000
        endif
    endif
    wait 0.2300 seconds
    repeat 
endscript

script text_twitch_effect2 \{ Scale = 1.075 scale2 = 1.0 }
    gettags
    Theme_GetHighlightedTextColor \{ return_value = text_color }
    Theme_GetTextTwitchColor \{ return_value = twitch_color }
    begin 
    DoScreenElementMorph id = <id> time = 0.03000 Scale = <Scale> relative_scale
    wait \{ 2 frames }
    DoScreenElementMorph id = <id> time = 0.01000 Scale = <scale2> relative_scale
    wait \{ 0.2300 seconds }
    repeat 
endscript

script text_twitch_effect3 \{ Scale = 1.050 scale2 = 1.075 }
    text_twitch_effect2 <...> 
endscript

script test_scrolling_menu 
    make_new_themed_scrolling_menu Title = 'PRZEWIJANIE'
    SetScreenElementProps {
        id = sub_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = create_test_menu }}]
        replace_handlers
    }
    theme_menu_add_item text = 'Standardowy komunikat konsoli' pad_choose_script = null_script centered no_bg first_item
    theme_menu_add_item text = 'Rzeczy' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Rzeczy' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Inne' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Ble' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Wow' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Tony' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Hawka' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Pro' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Skejt' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = '1 2 3 4 5 6 7 8 9' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Jeden' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Dwa' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Trzy' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Cztery' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Piêæ' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Szeæ' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Siedem' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Osiem' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Dziewiêæ' pad_choose_script = null_script centered no_bg
    theme_menu_add_item text = 'Dziesiêæ' pad_choose_script = null_script centered no_bg last_item
    finish_themed_scrolling_menu
endscript

script make_new_themed_scrolling_menu Title = 'PRZEWIÑ' dims = (300.0, 227.0) Pos = (229.0, 80.0) right_bracket_z = 1
    if GotParam no_bar
        make_new_themed_sub_menu Title = <Title> scrolling no_bar dims = <dims> Pos = <Pos> right_bracket_z = <right_bracket_z>
    else
        make_new_themed_sub_menu Title = <Title> scrolling dims = <dims> Pos = <Pos> right_bracket_z = <right_bracket_z>
    endif
    Theme_GetBGPartsColor return_value = arrow_rgba
    SetScreenElementProps {
        id = sub_vmenu
        event_handlers = [{pad_up menu_vert_blink_arrow params = {id = scrolling_menu_up_arrow rgba = <arrow_rgba>}}
            {pad_down menu_vert_blink_arrow params = {id = scrolling_menu_down_arrow rgba = <arrow_rgba>}}
        ]
    }
endscript

script finish_themed_scrolling_menu Pos = (320.0, 85.0) time = 0.2000
    GetScreenElementDims id = sub_scrolling_menu
    parts = (<height> / theme_menu_bg_parts_height)
    if NOT GotParam force_end_pos
        if InFrontend
            Pos = (188.0, 60.0)
        endif
    endif
    if NOT GotParam bg_width
        if NOT GotParam wide_menu
            bg_width = (widest_menu_item_width * 0.01250)
        else
            bg_width = (widest_menu_item_width * 0.02500)
        endif
    endif
    theme_background width = <bg_width> Pos = <Pos> num_parts = <parts> z_priority = <z_priority> parent = sub_menu
    if ScreenElementExists id = bg_box_top
        CreateScreenElement {
            type = SpriteElement
            parent = bg_box_top
            id = scrolling_menu_up_arrow
            texture = up_arrow
            Pos = (0.0, 13.0)
            just = [ center center ]
            rgba = <bg_piece_rgba>
            Scale = (0.800000011920929, 1.0)
            z_priority = 3
        }
        GetScreenElementPosition id = sub_scrolling_menu
        DoScreenElementMorph id = sub_scrolling_menu Pos = (<screenelementpos> + (0.0, 30.0))
    endif
    if ScreenElementExists id = bg_box_bottom
        CreateScreenElement {
            type = SpriteElement
            parent = bg_box_bottom
            id = scrolling_menu_down_arrow
            texture = down_arrow
            Pos = (0.0, -5.0)
            just = [ center center ]
            rgba = <bg_piece_rgba>
            Scale = (0.800000011920929, 1.0)
            z_priority = 3
        }
    endif
    finish_themed_sub_menu time = <time>
endscript

script theme_background parent = current_menu_anchor id = bg_box_vmenu width = 5 Pos = (320.0, 85.0) num_parts = 5 z_priority = 1 rot = 0
    num_parts = (<num_parts> + 0.3000)
    if NOT GotParam bg_rgba
        Theme_GetBGPartsColor return_value = bg_rgba
    endif
    CreateScreenElement {
        type = vmenu
        parent = <parent>
        id = <id>
        font = small
        just = [ left top ]
        Pos = <Pos>
        padding_scale = 1
        internal_scale = 1
        internal_just = [ center center ]
        rot_angle = <rot>
    }
    anchor_id = <id>
    middle_parts = <num_parts>
    CastToInteger middle_parts
    partial_scale = (<num_parts> - <middle_parts>)
    printf 'num_parts=%n partial_scale=%p' n = <num_parts> p = <partial_scale>
    build_theme_bg_top parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
    if NOT GotParam scale_part_only
        begin 
        build_theme_bg_middle parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
        repeat <middle_parts>
    endif
    build_theme_bg_middle parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
    build_theme_bg_bottom parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
endscript

script build_theme_bg_top 
    if GotParam dark_menu
        m_texture = spec_t_m
        l_texture = spec_t_l
        r_texture = spec_t_r
    else
        if GotParam use_mm_parts
            m_texture = mm_t_m
            l_texture = mm_t_l
            r_texture = mm_t_r
        else
            m_texture = de_t_m
            l_texture = de_t_l
            r_texture = de_t_r
        endif
    endif
    if NOT GotParam static
        if InFrontend
            if (main_menu_jump_to_cas = 0)
                m_texture = mm_t_m
                l_texture = mm_t_l
                r_texture = mm_t_r
            else
                m_texture = de_t_m
                l_texture = de_t_l
                r_texture = de_t_r
            endif
        endif
    endif
    if (<parent> = bg_box_vmenu)
        top_id = bg_box_top
    endif
    CreateScreenElement {
        type = ContainerElement
        id = <top_id>
        dims = (0.0, 32.0)
        parent = <parent>
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <m_texture>
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <bg_rgba>
        Scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
        z_priority = <z_priority>
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width>)
    left_pos = ((-0.5, 0.0) * <width>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <l_texture>
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <bg_rgba>
        Scale = (1.0, 1.0)
        z_priority = <z_priority>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <r_texture>
        Pos = <right_pos>
        just = [ left top ]
        rgba = <bg_rgba>
        Scale = (1.0, 1.0)
        z_priority = <z_priority>
    }
endscript

script build_theme_bg_middle scale_height = 1
    if GotParam dark_menu
        m_texture = spec_m_m
        l_texture = spec_m_l
        r_texture = spec_m_r
    else
        if GotParam use_mm_parts
            m_texture = mm_m_m
            l_texture = mm_m_l
            r_texture = mm_m_r
        else
            m_texture = de_m_m
            l_texture = de_m_l
            r_texture = de_m_r
        endif
    endif
    if NOT GotParam static
        if InFrontend
            if (main_menu_jump_to_cas = 0)
                m_texture = mm_m_m
                l_texture = mm_m_l
                r_texture = mm_m_r
            else
                m_texture = de_m_m
                l_texture = de_m_l
                r_texture = de_m_r
            endif
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        dims = ((0.0, 1.0) * (theme_menu_bg_parts_height - 1))
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <m_texture>
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <bg_rgba>
        Scale = ((1.0, 0.0) * <width> + <scale_height> * (0.0, 1.0))
        z_priority = <z_priority>
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width>)
    left_pos = ((-0.5, 0.0) * <width>)
    side_scale = ((1.0, 0.0) * 1 + <scale_height> * (0.0, 1.0))
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <l_texture>
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <bg_rgba>
        Scale = <side_scale>
        z_priority = <z_priority>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <r_texture>
        Pos = <right_pos>
        just = [ left top ]
        rgba = <bg_rgba>
        Scale = <side_scale>
        z_priority = <z_priority>
    }
endscript

script build_theme_bg_bottom 
    if GotParam dark_menu
        m_texture = spec_B_M
        l_texture = spec_b_l
        r_texture = spec_b_r
    else
        if GotParam use_mm_parts
            m_texture = mm_b_m
            l_texture = mm_b_l
            r_texture = mm_b_r
        else
            m_texture = de_b_m
            l_texture = de_b_l
            r_texture = de_b_r
        endif
    endif
    if NOT GotParam static
        if InFrontend
            if (main_menu_jump_to_cas = 0)
                m_texture = mm_b_m
                l_texture = mm_b_l
                r_texture = mm_b_r
            else
                m_texture = de_b_m
                l_texture = de_b_l
                r_texture = de_b_r
            endif
        endif
    endif
    if (<parent> = bg_box_vmenu)
        bot_id = bg_box_bottom
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <bot_id>
        dims = (0.0, 32.0)
    }
    anchor_id = <id>
    Pos = ((0.0, -1.0) * (theme_menu_bg_parts_height - (<scale_height> * theme_menu_bg_parts_height)))
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <m_texture>
        Pos = <Pos>
        just = [ center top ]
        rgba = <bg_rgba>
        Scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
        z_priority = <z_priority>
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width> + <Pos>)
    left_pos = ((-0.5, 0.0) * <width> + <Pos>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <l_texture>
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <bg_rgba>
        Scale = (1.0, 1.0)
        z_priority = <z_priority>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <r_texture>
        Pos = <right_pos>
        just = [ left top ]
        rgba = <bg_rgba>
        Scale = (1.0, 1.0)
        z_priority = <z_priority>
    }
endscript

script theme_menu_add_LR_Control_Item {
        callback = NullScript
        starting_value = 1
        Increment = 1
        bounts = [ 1 , 10 ]
    }
    theme_menu_add_item text = <text> id = <id> focus_script = theme_menu_LR_Control_Item_Focus unfocus_script = theme_menu_LR_Control_Item_UnFocus
    parent = <id>
    <parent> ::settags lr_control_params = {value = <starting_value> Increment = <Increment> bounds = <bounds>}
    Theme_GetUnhighlightedTextColor return_value = text_color
    CreateScreenElement {
        type = TextElement
        parent = <parent>
        local_id = value_display
        font = small
        just = [ center top ]
        Pos = (128.0, -17.0)
        text = ' '
        rgba = <text_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        local_id = left_arrow
        texture = left_arrow
        rgba = [ 128 128 128 128 ]
        Pos = (115.0, -17.0)
        just = [ RIGHT top ]
        Scale = 0.7500
        alpha = 0
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        local_id = right_arrow
        texture = right_arrow
        rgba = [ 128 128 128 128 ]
        Pos = (143.0, -17.0)
        just = [ left top ]
        Scale = 0.7500
        alpha = 0
    }
    SetScreenElementProps {
        id = <parent>
        event_handlers = [{pad_left theme_menu_LR_Control_Item_Change params = {left callback = <callback>}}
            {pad_right theme_menu_LR_Control_Item_Change params = {RIGHT callback = <callback>}}
        ]
        replace_handlers
    }
    <parent> ::theme_menu_LR_Control_Item_Refresh
endscript

script theme_menu_LR_Control_Item_Refresh 
    obj_getid
    getsingletag \{ lr_control_params }
    FormatText textname = display_value '%v' v = (<lr_control_params>.value)decimalplaces = 1
    SetScreenElementProps {
        id = {<ObjID> child = value_display}
        text = <display_value>
    }
endscript

script theme_menu_LR_Control_Item_Change 
    obj_getid
    getsingletag lr_control_params
    if GotParam left
        new_value = ((<lr_control_params>.value)- (<lr_control_params>.Increment))
        DoScreenElementMorph id = {<ObjID> child = right_arrow}alpha = 1
        DoScreenElementMorph id = {<ObjID> child = left_arrow}alpha = 0
        if NOT (<new_value> > (<lr_control_params>.bounds [ 0 ]))
            new_value = (<lr_control_params>.bounds [ 0 ])
        else
            DoScreenElementMorph id = {<ObjID> child = left_arrow}alpha = 1 time = 0.3000
        endif
    endif
    if GotParam RIGHT
        new_value = ((<lr_control_params>.value)+ (<lr_control_params>.Increment))
        DoScreenElementMorph id = {<ObjID> child = right_arrow}alpha = 0
        DoScreenElementMorph id = {<ObjID> child = left_arrow}alpha = 1
        if NOT (<new_value> < (<lr_control_params>.bounds [ 1 ]))
            new_value = (<lr_control_params>.bounds [ 1 ])
        else
            DoScreenElementMorph id = {<ObjID> child = right_arrow}alpha = 1 time = 0.3000
        endif
    endif
    settags lr_control_params = {<lr_control_params> value = <new_value>}
    theme_menu_LR_Control_Item_Refresh
    <callback> value = <new_value>
endscript

script theme_menu_LR_Control_Item_Focus 
    obj_getid
    getsingletag \{ lr_control_params }
    main_theme_focus
    if ((<lr_control_params>.value)> (<lr_control_params>.bounds [ 0 ]))
        DoScreenElementMorph id = {<ObjID> child = left_arrow}alpha = 1
    endif
    if ((<lr_control_params>.value)< (<lr_control_params>.bounds [ 1 ]))
        DoScreenElementMorph id = {<ObjID> child = right_arrow}alpha = 1
    endif
endscript

script theme_menu_LR_Control_Item_UnFocus 
    obj_getid
    main_theme_unfocus
    DoScreenElementMorph id = {<ObjID> child = right_arrow}alpha = 0
    DoScreenElementMorph id = {<ObjID> child = left_arrow}alpha = 0
endscript
