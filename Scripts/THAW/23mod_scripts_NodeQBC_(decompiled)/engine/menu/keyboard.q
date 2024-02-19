keyboard_current_charset = alphanumeric_lower
keyboard_text_scale = (0.949999988079071, 0.550000011920929)
keyboard_button_scale = (1.0, 1.600000023841858)
keyboard_caps_lock = 0
keyboard_text_block_width = 360

script create_onscreen_keyboard {keyboard_title = 'KLAWIATURA'
        keyboard_cancel_script = keyboard_cancel
        Pos = (320.0, 240.0)
        max_length = 20
        display_text = '_'
        text = ''
        display_text_scale = 0.8500
        display_text_offset = (0.0, 0.0)
    }
    SetAnalogStickActiveForMenus 1
    if InFrontend
        if ((main_menu_current_state)= options)
            main_menu_camera_control next_state = optcheat
        endif
    endif
    if IsNGC
        heap = TopDown
    else
        heap = frontend
    endif
    change keyboard_toggling_char_set = 0
    Theme_GetHighlightedTextColor return_value = highlight_color
    Theme_GetUnhighlightedTextColor return_value = unhighlight_color
    destroy_onscreen_keyboard
    SetScreenElementLock id = root_window Off
    if GotParam no_buttons
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = keyboard_anchor
            Pos = <Pos>
            dims = (640.0, 480.0)
            z_priority = 15
            heap = <heap>
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = keyboard_bg_anchor
            Pos = <Pos>
            dims = (640.0, 480.0)
            heap = <heap>
        }
        CreateScreenElement {
            type = ContainerElement
            parent = keyboard_bg_anchor
            id = keyboard_anchor
            focusable_child = keyboard_vmenu
            Pos = <Pos>
            dims = (640.0, 480.0)
            heap = <heap>
        }
    endif
    AssignAlias id = keyboard_anchor alias = current_menu_anchor
    if GotParam disable_special_character_tabs
        keyboard_anchor ::settags disable_special_character_tabs
    endif
    if GotParam password
        keyboard_anchor ::settags password
    endif
    if NOT GotParam no_buttons
        if GotParam allow_cancel
            create_helper_text {helper_text_elements = [{ text = '\b7/\b4/\b6/\b5=Wybierz' }
                    { text = '\m1=Anuluj' }
                    { text = '\m0=Akceptuj' }
                    { text = '\mf/\mg=Postaæ gotowa' }
                ]
                helper_pos = <helper_pos>
                parent = keyboard_bg_anchor
            }
        else
            create_helper_text {helper_text_elements = [{ text = '\b7/\b4/\b6/\b5=Wybierz' }
                    { text = '\m0=Akceptuj' }
                    { text = '\mf/\mg=Postaæ gotowa' }
                ]
                helper_pos = <helper_pos>
                parent = keyboard_bg_anchor
            }
        endif
    endif
    <org_text> = <text>
    FormatText textname = text '%s_' s = <text>
    if GotParam no_buttons
        keyboard_anchor ::settags no_buttons
        SetScreenElementProps {
            id = keyboard_anchor
            event_handlers = [{pad_choose keyboard_done params = <...> }
                {pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
            ]
        }
        CreateScreenElement {
            type = TextElement
            parent = keyboard_anchor
            font = testtitle
            id = kb_no_button_hdr
            text = <display_text>
            Pos = (320.0, 65.0)
            just = [ center top ]
            z_priority = 15
            heap = <heap>
        }
        if GotParam text_block
            CreateScreenElement {
                type = TextBlockElement
                parent = keyboard_anchor
                id = keyboard_display_string
                allow_expansion
                font = dialog
                just = [ center top ]
                text = '_'
                internal_just = [ center center ]
                not_focusable
                Pos = (320.0, 85.0)
                dims = ((1.0, 0.0) * keyboard_text_block_width + (0.0, 10.0))
                heap = <heap>
            }
        else
            CreateScreenElement {
                type = TextElement
                parent = keyboard_anchor
                id = keyboard_display_string
                font = dialog
                just = [ center top ]
                text = '_'
                not_focusable
                Pos = (320.0, 85.0)
                heap = <heap>
            }
        endif
        printf '*** 9'
        if GotParam password
            GetTextElementLength id = keyboard_display_string
            SetScreenElementProps id = keyboard_display_string text = ''
            if (<Length> > 1)
                begin 
                TextElementConcatenate id = keyboard_display_string '*'
                repeat (<Length> -1)
                TextElementConcatenate id = keyboard_display_string '_'
            endif
        endif
        CreateScreenElement {
            type = TextBlockElement
            parent = keyboard_anchor
            id = keyboard_current_string
            font = dialog
            just = [ center top ]
            text = <org_text>
            not_focusable
            Pos = (320.0, 85.0)
            dims = ((1.0, 0.0) * keyboard_text_block_width + (0.0, 10.0))
            allow_expansion
            Scale = 0
            heap = <heap>
        }
        if GotParam allowed_characters
            keyboard_current_string ::settags allowed_characters = <allowed_characters>
        endif
        if GotParam max_length
            if (<max_length> < 1)
                script_assert 'create_onscreen_keyboard wywo³ane ze z³ym parametrem max_length'
            endif
            begin 
            GetTextElementLength id = keyboard_current_string
            if (<Length> > <max_length>)
                TextElementBackspace id = keyboard_current_string
                TextElementBackspace id = keyboard_display_string
            else
                break 
            endif
            repeat 
        endif
        FireEvent type = focus target = keyboard_anchor
    else
        if GotParam text_block
            theme_dialog_background {parent = keyboard_anchor
                width = 3.500
                Pos = (320.0, 85.0)
                num_parts = 7.500
                z_priority = 1
                top_height = 2.550
                no_icon = no_icon
            }
        else
            theme_dialog_background {parent = keyboard_anchor
                width = 3.500
                Pos = (320.0, 85.0)
                num_parts = 6
                z_priority = 1
                top_height = 1
                no_icon = no_icon
            }
        endif
        if NOT GotParam no_buttons
            if InFrontend
                if GotParam in_ss
                else
                    if GotParam in_net_lobby
                        if NOT ScreenElementExists id = globe
                            CreateScreenElement {
                                type = SpriteElement
                                parent = keyboard_bg_anchor
                                id = globe
                                texture = globe
                                Scale = 1
                                Pos = (550.0, 240.0)
                                just = [ center center ]
                                alpha = 0.2000
                                z_priority = -1
                                heap = <heap>
                            }
                            RunScriptOnScreenElement id = globe rotate_internet_options_globe
                        endif
                    endif
                    if GotParam in_profile_options
                        CreateScreenElement {
                            type = SpriteElement
                            parent = keyboard_bg_anchor
                            id = globe
                            texture = globe
                            Scale = 1.300
                            Pos = (320.0, 560.0)
                            just = [ center center ]
                            alpha = 0.3000
                            z_priority = -1
                            heap = <heap>
                        }
                        RunScriptOnScreenElement id = globe rotate_internet_options_globe
                    endif
                endif
            else
                pause_menu_gradient on
            endif
        endif
        build_theme_sub_title Title = <keyboard_title> parent = keyboard_bg_anchor
        if GotParam text_block
            CreateScreenElement {
                type = vmenu
                parent = keyboard_anchor
                id = keyboard_vmenu
                Pos = (320.0, 247.0)
                internal_just = [ center top ]
                regular_space_amount = 30
                event_handlers = [{pad_l2 keyboard_handle_L2 params = { max_length = <max_length> }}
                    {pad_r2 keyboard_handle_R2 params = { max_length = <max_length> }}
                    {pad_l1 keyboard_handle_L2 params = { max_length = <max_length> }}
                    {pad_r1 keyboard_handle_R2 params = { max_length = <max_length> }}
                    { pad_up keyboard_change_key_sound }
                    { pad_down keyboard_change_key_sound }
                ]
                heap = <heap>
            }
            if NOT GotParam no_back
                SetScreenElementProps {
                    id = keyboard_vmenu
                    event_handlers = [
                        {pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
                    ]
                }
            else
                kill_start_key_binding
            endif
        else
            CreateScreenElement {
                type = vmenu
                parent = keyboard_anchor
                id = keyboard_vmenu
                Pos = (320.0, 197.0)
                internal_just = [ center top ]
                regular_space_amount = 30
                event_handlers = [{pad_l2 keyboard_handle_L2 params = { max_length = <max_length> }}
                    {pad_r2 keyboard_handle_R2 params = { max_length = <max_length> }}
                    {pad_l1 keyboard_handle_L2 params = { max_length = <max_length> }}
                    {pad_r1 keyboard_handle_R2 params = { max_length = <max_length> }}
                    { pad_up keyboard_change_key_sound }
                    { pad_down keyboard_change_key_sound }
                ]
                heap = <heap>
            }
            if NOT GotParam no_back
                SetScreenElementProps {
                    id = keyboard_vmenu
                    event_handlers = [
                        {pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
                    ]
                }
            else
                kill_start_key_binding
            endif
        endif
        SetScreenElementProps {id = keyboard_vmenu
            event_handlers = [{ pad_backspace keyboard_handle_backspace }
                {pad_space keyboard_handle_space params = { max_length = <max_length> }}
            ]
        }
        if NOT GotParam no_back
            SetScreenElementProps {
                id = keyboard_vmenu
                event_handlers = [
                    {pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
                ]
            }
        else
            kill_start_key_binding
        endif
        if GotParam text_block
            keyboard_anchor ::settags text_block
            CreateScreenElement {
                type = ContainerElement
                parent = keyboard_vmenu
                internal_just = [ center center ]
                dims = (10.0, 20.0)
                not_focusable
                heap = <heap>
            }
            CreateScreenElement {
                type = TextBlockElement
                parent = keyboard_anchor
                id = keyboard_display_string
                font = dialog
                just = [ center top ]
                internal_just = [ left center ]
                text = <text>
                not_focusable
                Pos = (320.0, 90.0)
                dims = ((1.0, 0.0) * keyboard_text_block_width + (20.0, 400.0))
                allow_expansion
                line_spacing = 0.8600
                Scale = 0.8500
                rgba = <unhighlight_color>
                heap = <heap>
            }
        else
            CreateScreenElement {
                type = ContainerElement
                parent = keyboard_vmenu
                id = keyboard_display_string_container
                dims = (10.0, 20.0)
                not_focusable
                heap = <heap>
            }
            CreateScreenElement {
                type = TextElement
                parent = <id>
                id = keyboard_display_string
                Pos = ((-139.0, 7.0) + <display_text_offset>)
                font = dialog
                just = [ left top ]
                text = <text>
                Scale = <display_text_scale>
                not_focusable
                rgba = <unhighlight_color>
                heap = <heap>
            }
        endif
        if GotParam password
            GetTextElementLength id = keyboard_display_string
            SetScreenElementProps id = keyboard_display_string text = ''
            if (<Length> > 1)
                begin 
                TextElementConcatenate id = keyboard_display_string '*'
                repeat (<Length> -1)
                TextElementConcatenate id = keyboard_display_string '_'
            endif
        endif
        if GotParam text_block
            CreateScreenElement {
                type = TextBlockElement
                parent = keyboard_anchor
                id = keyboard_current_string
                font = dialog
                just = [ center top ]
                text = <org_text>
                not_focusable
                Pos = (320.0, 85.0)
                dims = ((1.0, 0.0) * keyboard_text_block_width + (0.0, 20.0))
                allow_expansion
                Scale = 0
                heap = <heap>
            }
        else
            CreateScreenElement {
                type = TextElement
                parent = keyboard_anchor
                id = keyboard_current_string
                font = dialog
                just = [ center top ]
                text = <org_text>
                not_focusable
                Pos = (320.0, 85.0)
                Scale = 0
                heap = <heap>
            }
        endif
        if GotParam allowed_characters
            keyboard_current_string ::settags allowed_characters = <allowed_characters>
        endif
        if GotParam max_length
            if (<max_length> < 1)
                script_assert 'create_onscreen_keyboard wywo³ane ze z³ym parametrem max_length'
            endif
            begin 
            GetTextElementLength id = keyboard_current_string
            if (<Length> > <max_length>)
                TextElementBackspace id = keyboard_current_string
                TextElementBackspace id = keyboard_display_string
            else
                break 
            endif
            repeat 
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = keyboard_anchor
            id = keyboard_options_bg
            texture = options_bg
            Scale = (1.0, 1.0)
            rgba = [ 0 0 0 0 ]
            just = [ center center ]
            Pos = (267.0, 80.0)
            heap = <heap>
        }
        keyboard_character_set_guide
        keyboard_create_key_sprites <...> 
        keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
        change keyboard_current_charset = alphanumeric_lower
        FireEvent type = focus target = keyboard_vmenu
        DoScreenElementMorph id = keyboard_anchor Pos = (320.0, 600.0)
        DoScreenElementMorph id = keyboard_anchor Pos = (320.0, 240.0) time = 0.3000
    endif
    if NOT GotParam no_buttons
        AssignAlias id = keyboard_bg_anchor alias = current_menu_anchor
    endif
    if InFrontend
        StopKeyboardHandler
    endif
    StartKeyboardHandler max_length = <max_length>
    if (<max_length> > 1)
        EnableKeyboard
    endif
endscript

script keyboard_character_set_guide 
    CreateScreenElement {
        type = ContainerElement
        parent = keyboard_vmenu
        id = char_guide_anchor
        not_focusable
    }
    guide_box_rgba = [ 35 35 35 80 ]
    Theme_GetHighlightedTextColor return_value = highlight_color
    Theme_GetUnhighlightedTextColor return_value = unhighlight_color
    CreateScreenElement {
        type = TextElement
        parent = char_guide_anchor
        id = char_guide_l2
        font = dialog
        rgba = [ 128 128 128 100 ]
        just = [ left top ]
        text = '\ma'
        not_focusable
        Pos = (-174.0, -6.0)
        Scale = (0.800000011920929, 0.8999999761581421)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = char_guide_anchor
        id = char_guide_left_arrow
        texture = left_arrow
        Scale = (0.75, 0.6499999761581421)
        rgba = <highlight_color>
        just = [ left top ]
        Pos = (-152.0, -6.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = TextElement
        parent = char_guide_anchor
        id = char_guide_symbols
        font = small
        rgba = <unhighlight_color>
        just = [ left top ]
        text = 'SYMBOLE'
        not_focusable
        Pos = (-139.0, -3.0)
        Scale = (0.6299999952316284, 0.800000011920929)
        z_priority = 5
    }
    CreateScreenElement {
        type = TextElement
        parent = char_guide_anchor
        id = char_guide_allcaps
        font = small
        rgba = <unhighlight_color>
        just = [ left top ]
        text = ' ALL-CAPS'
        not_focusable
        Pos = (-66.0, -3.0)
        Scale = (0.6299999952316284, 0.800000011920929)
        z_priority = 5
    }
    CreateScreenElement {
        type = TextElement
        parent = char_guide_anchor
        id = char_guide_lower
        font = small
        rgba = <highlight_color>
        just = [ left top ]
        text = ' MA£E'
        not_focusable
        Pos = (9.0, -3.0)
        Scale = (0.6299999952316284, 0.800000011920929)
        z_priority = 5
    }
    CreateScreenElement {
        type = TextElement
        parent = char_guide_anchor
        id = char_guide_foreign
        font = small
        rgba = <unhighlight_color>
        just = [ left top ]
        text = 'OBCE'
        not_focusable
        Pos = (68.0, -3.0)
        Scale = (0.6299999952316284, 0.800000011920929)
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = char_guide_anchor
        id = char_guide_right_arrow
        texture = right_arrow
        Scale = (0.75, 0.6499999761581421)
        rgba = <highlight_color>
        just = [ left top ]
        Pos = (134.0, -6.0)
        z_priority = 5
    }
    CreateScreenElement {
        type = TextElement
        parent = char_guide_anchor
        id = char_guide_r2
        font = dialog
        rgba = [ 128 128 128 100 ]
        just = [ left top ]
        text = '\mb'
        not_focusable
        Pos = (146.0, -6.0)
        Scale = (0.800000011920929, 0.8999999761581421)
        z_priority = 5
    }
    reset_char_disabled
endscript

script keyboard_create_key_sprites 
    keyboard_add_hmenu id = keyboard_row_1 heap = <heap>
    keyboard_add_hmenu id = keyboard_row_2 heap = <heap>
    keyboard_add_hmenu id = keyboard_row_3 heap = <heap>
    keyboard_add_hmenu id = keyboard_row_4 heap = <heap>
    keyboard_add_hmenu id = keyboard_row_5 heap = <heap>
    keyboard_add_hmenu id = keyboard_row_6 heap = <heap>
    keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_1 number_of_buttons = 10 heap = <heap>
    keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_2 number_of_buttons = 10 heap = <heap>
    keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_3 number_of_buttons = 10 heap = <heap>
    keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_4 number_of_buttons = 6 heap = <heap>
    keyboard_add_special_button {
        hmenu_id = keyboard_row_4
        pad_choose_script = keyboard_handle_backspace
        text = 'Backspace'
        pad_button_text = '\m9'
        text_pos = (124.0, 8.0)
        pad_button_pos = (25.0, 8.0)
        text_scale = (0.8500000238418579, 0.550000011920929)
        width = 128
        grid_x = 6
    }
    keyboard_add_special_button {
        hmenu_id = keyboard_row_5
        pad_choose_script = keyboard_handle_shift
        pad_choose_params = { max_length = <max_length> }
        text = 'Shift'
        text_id = shift_text
        text_pos = (47.0, 2.0)
        width = 96
        grid_x = 0
    }
    keyboard_add_special_button {
        hmenu_id = keyboard_row_5
        pad_choose_script = keyboard_handle_caps
        pad_choose_params = { max_length = <max_length> }
        text = 'Caps Lock'
        text_id = caps_lock_text
        text_pos = (47.0, 2.0)
        text_scale = (0.949999988079071, 0.550000011920929)
        width = 96
        grid_x = 3
    }
    keyboard_add_special_button {
        hmenu_id = keyboard_row_5
        pad_choose_script = keyboard_handle_space
        pad_choose_params = { max_length = <max_length> }
        text = 'Spacja'
        pad_button_text = '\m8'
        text_pos = (95.0, 8.0)
        pad_button_pos = (40.0, 8.0)
        width = 128
        grid_x = 6
    }
    keyboard_add_special_button {
        hmenu_id = keyboard_row_6
        pad_choose_script = keyboard_done pad_choose_params = <...> 
        button_id = keyboard_done_button
        text = 'Zrobione'
        text_pos = (62.0, 2.0)
        width = 128
        grid_x = 0
    }
    if GotParam allow_cancel
        SetScreenElementProps {
            id = keyboard_vmenu
            event_handlers = [{pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}]
            replace_handlers
        }
        keyboard_add_special_button {
            hmenu_id = keyboard_row_6
            pad_choose_script = generic_menu_pad_back params <keyboard_cancel_script>
            pad_choose_params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}
            text = 'Anuluj'
            pad_button_text = '\m1'
            text_pos = (106.0, 8.0)
            pad_button_pos = (37.0, 8.0)
            width = 128
            grid_x = 6
        }
    endif
endscript

script keyboard_change_charset 
    begin 
    if GetNextArrayElement <charset> index = <index>
        keyboard_change_key_row row = <element> row_number = <index> max_length = <max_length>
    else
        break 
    endif
    repeat 
endscript

script keyboard_change_key_row 
    FormatText checksumname = hmenu_id 'keyboard_row_%i' i = (<row_number> + 1)
    begin 
    if GetNextArrayElement <row> index = <index>
        SetScreenElementProps {
            id = {<hmenu_id> child = {<index> child = 0}}
            text = <element>
            replace_handlers
        }
        SetScreenElementProps {
            id = {<hmenu_id> child = <index>}
            tags = { tag_grid_x = <index> }
        }
        keyboard_set_button_events {
            hmenu_id = <hmenu_id>
            index = <index>
            text = <element>
            max_length = <max_length>
        }
    else
        break 
    endif
    repeat 
endscript

script destroy_onscreen_keyboard 
    DisableKeyboard
    KillSpawnedScript \{ name = keyboard_key_focus }
    if ObjectExists \{ id = keyboard_anchor }
        DestroyScreenElement \{ id = keyboard_anchor }
    endif
    if ObjectExists \{ id = keyboard_bg_anchor }
        DestroyScreenElement \{ id = keyboard_bg_anchor }
    endif
    if InFrontend
        if IsXenon
            StopKeyboardHandler
        endif
    else
        StopKeyboardHandler
    endif
    change \{ keyboard_caps_lock = 0 }
endscript

script keyboard_add_hmenu 
    CreateScreenElement {
        type = hmenu
        parent = keyboard_vmenu
        id = <id>
        internal_just = [ left center ]
        event_handlers = [{ pad_left keyboard_change_key_sound }
            { pad_right keyboard_change_key_sound }
        ]
        heap = <heap>
    }
endscript

script keyboard_add_generic_buttons_to_hmenu 
    Theme_GetKeyColor \{ return_value = button_rgba }
    begin 
    CreateScreenElement {
        type = SpriteElement
        parent = <hmenu_id>
        rgba = <button_rgba>
        texture = generic_key
        Scale = keyboard_button_scale
        heap = <heap>
    }
    keyboard_create_dummy_text id = <id>
    repeat <number_of_buttons>
endscript

script keyboard_set_button_events 
    if GotParam id
        if ObjectExists id = <id>
            SetScreenElementProps {
                id = <id>
                event_handlers = [{ focus keyboard_button_focus }
                    { unfocus keyboard_button_unfocus }
                    {pad_choose keyboard_button_pressed params = {text = <text> max_length = <max_length>}}
                    {pad_start keyboard_button_pressed params = {text = <text> max_length = <max_length>}}
                ]
                replace_handlers
            }
        endif
    else
        if ObjectExists id = <hmenu_id>
            if ObjectExists id = {<hmenu_id> child = <index>}
                SetScreenElementProps {
                    id = {<hmenu_id> child = <index>}
                    event_handlers = [{ focus keyboard_button_focus }
                        { unfocus keyboard_button_unfocus }
                        {pad_choose keyboard_button_pressed params = {text = <text> max_length = <max_length>}}
                        {pad_start keyboard_button_pressed params = {text = <text> max_length = <max_length>}}
                    ]
                    replace_handlers
                }
            endif
        endif
    endif
endscript

script keyboard_create_dummy_text 
    Theme_GetUnhighlightedTextColor \{ return_value = unhighlight_color }
    CreateScreenElement {
        type = TextElement
        parent = <id>
        rgba = <unhighlight_color>
        just = [ center center ]
        Pos = (17.0, 8.0)
        Scale = keyboard_text_scale
        font = dialog
    }
endscript

script keyboard_add_special_button {text_pos = (121.0, 8.0)
        text_scale = keyboard_text_scale
        pad_button_pos = (33.0, 8.0)
        button_scale = keyboard_button_scale
        width = 32
    }
    Theme_GetKeyColor return_value = button_rgba
    CreateScreenElement {
        type = ContainerElement
        id = <button_id>
        parent = <hmenu_id>
        tags = {tag_grid_x = <grid_x> tag_txt_offset = (2 + (<width> - 16)/ 4)}
        dims = ((1.0, 0.0) * <width> + (0.0, 35.0))
        internal_just = [ center center ]
    }
    <parent_id> = <id>
    Theme_GetUnhighlightedTextColor return_value = unhighlight_color
    if NOT keyboard_anchor ::getsingletag disable_special_character_tabs
        if globalexists name = EG_in_create_a_graphic type = int
            if (EG_in_create_a_graphic = 1)
                if ((<text> = 'Shift')|| (<text> = 'Caps Lock'))
                    unhighlight_color = [ 40 40 40 128 ]
                    SetScreenElementProps id = <parent_id> not_focusable
                endif
            endif
        endif
    endif
    <root_pos> = (5.0, 18.0)
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        Scale = <button_scale>
        texture = key_left
        rgba = <button_rgba>
        Pos = <root_pos>
    }
    <button_id> = <id>
    <iterations> = ((<width> - 16)/ 4)
    <dx> = 4
    begin 
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        texture = key_middle
        Scale = (keyboard_button_scale + (0.10000000149011612, 0.0))
        rgba = <button_rgba>
        Pos = ((1.0, 0.0) * <dx> + <root_pos>)
        not_focusable
    }
    <dx> = (<dx> + 4)
    repeat <iterations>
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        Scale = <button_scale>
        texture = key_right
        rgba = <button_rgba>
        not_focusable
        Pos = ((1.0, 0.0) * <dx> + <root_pos>)
    }
    if ((<text> = 'spacja')|| (<text> = 'backspace'))
        SetScreenElementProps {
            id = <parent_id>
            event_handlers = [{ focus keyboard_button_focus }
                { unfocus keyboard_button_unfocus }
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            replace_handlers
        }
    else
        SetScreenElementProps {
            id = <parent_id>
            event_handlers = [{ focus keyboard_button_focus }
                { unfocus keyboard_button_unfocus }
                { pad_choose generic_keyboard_sound }
                { pad_start generic_keyboard_sound }
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            replace_handlers
        }
    endif
    if GotParam pad_button_text
        CreateScreenElement {
            type = TextElement
            parent = <parent_id>
            z_priority = 10
            Scale = (<text_scale> + (0.0, 0.20000000298023224))
            font = small
            text = <pad_button_text>
            Pos = (<pad_button_pos> + (0.0, 10.0))
            just = [ RIGHT center ]
        }
    endif
    if GotParam pad_button_text
        GetStackedScreenElementPos x id = <id> Offset = (3.0, 0.0)
        <text_pos> = <Pos>
        <text_just> = [ left top ]
    else
        GetScreenElementPosition id = <button_id>
        <text_pos> = (<text_pos> + (0.0, 8.0))
        <text_just> = [ center top ]
    endif
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        z_priority = 10
        font = dialog
        id = <text_id>
        text = <text>
        Pos = <text_pos>
        Scale = (<text_scale> + (0.0, 0.20000000298023224))
        just = <text_just>
        rgba = <unhighlight_color>
        event_handlers = [{ focus keyboard_text_focus }
            { unfocus keyboard_text_unfocus }
        ]
    }
endscript

script keyboard_button_focus 
    getsingletag id
    getsingletag tag_txt_offset
    <txt_offset> = 0
    if GotParam tag_txt_offset
        <txt_offset> = <tag_txt_offset>
    endif
    if ScreenElementExists id = {<id> child = (<txt_offset> + 1)}
        RunScriptOnScreenElement id = {<id> child = (<txt_offset> + 1)}keyboard_text_focus
        SpawnScriptLater keyboard_key_focus params = {id = <id> org_scale = (1.0, 1.0499999523162842)}
    else
        if GotParam tag_txt_offset
            RunScriptOnScreenElement id = {<id> child = <txt_offset>}keyboard_text_focus
            SpawnScriptLater keyboard_key_focus params = {id = <id> org_scale = (1.0, 1.0499999523162842)}
        else
            RunScriptOnScreenElement id = {<id> child = <txt_offset>}keyboard_text_focus
            SpawnScriptLater keyboard_key_focus params = {id = <id> org_scale = (1.0, 1.600000023841858)}
        endif
    endif
endscript

script keyboard_button_unfocus 
    getsingletag tag_txt_offset
    getsingletag id
    <txt_offset> = 0
    if GotParam tag_txt_offset
        <txt_offset> = <tag_txt_offset>
    endif
    if ScreenElementExists id = {<id> child = (<txt_offset> + 1)}
        RunScriptOnScreenElement id = {<id> child = (<txt_offset> + 1)}keyboard_text_unfocus
        KillSpawnedScript name = keyboard_key_focus
        DoScreenElementMorph id = <id> time = 0 Scale = (1.0, 1.0)
    else
        if GotParam tag_txt_offset
            RunScriptOnScreenElement id = {<id> child = <txt_offset>}keyboard_text_unfocus
            KillSpawnedScript name = keyboard_key_focus
            DoScreenElementMorph id = <id> time = 0 Scale = (1.0, 1.0)
        else
            RunScriptOnScreenElement id = {<id> child = <txt_offset>}keyboard_text_unfocus
            KillSpawnedScript name = keyboard_key_focus
            DoScreenElementMorph id = <id> time = 0 Scale = (1.0, 1.600000023841858)
        endif
    endif
endscript

script keyboard_key_focus 
    begin 
    if ObjectExists id = <id>
        DoScreenElementMorph id = <id> time = 0.03000 Scale = (<org_scale> * 1.050)
    endif
    wait \{ 0.2000 second }
    if ObjectExists id = <id>
        DoScreenElementMorph id = <id> time = 0.03000 Scale = (<org_scale> * 0.9500)
    endif
    wait \{ 0.2000 second }
    repeat 
endscript

script keyboard_text_focus 
    Theme_GetHighlightedTextColor \{ return_value = highlight_color }
    setprops rgba = <highlight_color>
endscript

script keyboard_text_unfocus 
    Theme_GetUnhighlightedTextColor \{ return_value = unhighlight_color }
    setprops rgba = <unhighlight_color>
endscript

script keyboard_button_pressed 
    if (<text> = '`')
        <text> = '\'
    endif
    if (<text> = '\\\')
        playsound GUI_Buzzer01
        return 
    endif
    if (<text> = '%')
        playsound GUI_Buzzer01
        return 
    endif
    if GotParam max_length
        GetTextElementLength id = keyboard_current_string
        if (<Length> > (<max_length> - 1))
            playsound GUI_Buzzer01
            return 
        endif
    endif
    keyboard_current_string ::getsingletag allowed_characters
    if GotParam allowed_characters
        if ArrayContains array = <allowed_characters> contains = <text>
            playsound MenuUp
        else
            playsound GUI_Buzzer01
            return 
        endif
    else
        playsound MenuUp
    endif
    if (<text> = '//')
        <text> = '\'
    endif
    GetScreenElementDims id = keyboard_display_string
    if (<height> > 40)
        <last_line> = last_line
    endif
    if TextElementConcatenate id = keyboard_current_string <text> enforce_max_width <last_line>
        keyboard_anchor ::getsingletag password
        if GotParam password
            TextElementBackspace id = keyboard_display_string
            FormatText textname = text_w_cursor '%s_' s = '*'
            TextElementConcatenate id = keyboard_display_string <text_w_cursor> enforce_max_width <last_line>
        else
            TextElementBackspace id = keyboard_display_string
            FormatText textname = text_w_cursor '%s_' s = <text>
            TextElementConcatenate id = keyboard_display_string <text_w_cursor> enforce_max_width <last_line>
        endif
        GetScreenElementDims id = keyboard_display_string
        if GotParam no_buttons
            max_string_width = 550
        else
            max_string_width = 300
        endif
        if ScreenElementExists id = keyboard_display_string_container
            if (<width> > <max_string_width>)
                TextElementBackspace id = keyboard_display_string
                TextElementBackspace id = keyboard_display_string
                TextElementBackspace id = keyboard_current_string
                playsound GUI_Buzzer01
            endif
        else
            printf '%s %t' s = <height> t = <width>
            if (<height> > 80)
                TextElementBackspace id = keyboard_display_string
                TextElementBackspace id = keyboard_current_string
                if NOT (<text> = ' ')
                    TextElementBackspace id = keyboard_display_string
                    TextElementConcatenate id = keyboard_display_string ' ' enforce_max_width <last_line>
                endif
                printf 'string reached end of keyboard!'
                playsound GUI_Buzzer01
            endif
        endif
        switch keyboard_current_charset
            case alphanumeric_lower
            if IsTrue keyboard_caps_lock
                keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
                change keyboard_current_charset = alphanumeric_upper
            endif
            case alphanumeric_upper
            if NOT IsTrue keyboard_caps_lock
                keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
                change keyboard_current_charset = alphanumeric_lower
            endif
        endswitch
    else
        printf 'string too long!'
    endif
endscript
keyboard_toggling_char_set = 0

script keyboard_handle_L2 
    if NOT keyboard_anchor ::getsingletag disable_special_character_tabs
        if globalexists name = EG_in_create_a_graphic type = int
            if (EG_in_create_a_graphic = 1)
                return 
            endif
        endif
    endif
    if (keyboard_toggling_char_set = 1)
        return 
    endif
    change keyboard_toggling_char_set = 1
    if keyboard_anchor ::getsingletag disable_special_character_tabs
        switch keyboard_current_charset
            case alphanumeric_upper
            change keyboard_current_charset = foreign_charset
        endswitch
    endif
    Theme_GetHighlightedTextColor return_value = highlight_color
    switch keyboard_current_charset
        case alphanumeric_lower
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        change keyboard_current_charset = alphanumeric_upper
        reset_char_guides
        SetScreenElementProps id = char_guide_allcaps rgba = <highlight_color>
        change keyboard_caps_lock = 1
        case alphanumeric_upper
        keyboard_change_charset charset = punctuation_charset max_length = <max_length>
        change keyboard_current_charset = punctuation_charset
        reset_char_guides
        SetScreenElementProps id = char_guide_symbols rgba = <highlight_color>
        case punctuation_charset
        keyboard_change_charset charset = foreign_charset max_length = <max_length>
        change keyboard_current_charset = foreign_charset
        reset_char_guides
        SetScreenElementProps id = char_guide_foreign rgba = <highlight_color>
        case foreign_charset
        keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
        change keyboard_current_charset = alphanumeric_lower
        reset_char_guides
        SetScreenElementProps id = char_guide_lower rgba = <highlight_color>
    endswitch
    RunScriptOnScreenElement menu_blink_arrow id = char_guide_left_arrow
    playsound MenuUp
    wait 0.3000 seconds
    change keyboard_toggling_char_set = 0
endscript

script keyboard_handle_R2 
    if NOT keyboard_anchor ::getsingletag disable_special_character_tabs
        if globalexists name = EG_in_create_a_graphic type = int
            if (EG_in_create_a_graphic = 1)
                return 
            endif
        endif
    endif
    if (keyboard_toggling_char_set = 1)
        return 
    endif
    change keyboard_toggling_char_set = 1
    if keyboard_anchor ::getsingletag disable_special_character_tabs
        switch keyboard_current_charset
            case alphanumeric_lower
            change keyboard_current_charset = punctuation_charset
        endswitch
    endif
    Theme_GetHighlightedTextColor return_value = highlight_color
    switch keyboard_current_charset
        case alphanumeric_lower
        keyboard_change_charset charset = foreign_charset max_length = <max_length>
        change keyboard_current_charset = foreign_charset
        reset_char_guides
        SetScreenElementProps id = char_guide_foreign rgba = <highlight_color>
        case alphanumeric_upper
        keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
        change keyboard_current_charset = alphanumeric_lower
        reset_char_guides
        SetScreenElementProps id = char_guide_lower rgba = <highlight_color>
        case punctuation_charset
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        change keyboard_current_charset = alphanumeric_upper
        reset_char_guides
        SetScreenElementProps id = char_guide_allcaps rgba = <highlight_color>
        change keyboard_caps_lock = 1
        case foreign_charset
        keyboard_change_charset charset = punctuation_charset max_length = <max_length>
        change keyboard_current_charset = punctuation_charset
        reset_char_guides
        SetScreenElementProps id = char_guide_symbols rgba = <highlight_color>
    endswitch
    RunScriptOnScreenElement menu_blink_arrow id = char_guide_right_arrow
    playsound MenuUp
    wait 0.3000 seconds
    change keyboard_toggling_char_set = 0
endscript

script reset_char_guides 
    Theme_GetUnhighlightedTextColor \{ return_value = unhighlight_color }
    SetScreenElementProps id = char_guide_allcaps rgba = <unhighlight_color>
    SetScreenElementProps id = char_guide_lower rgba = <unhighlight_color>
    SetScreenElementProps id = char_guide_symbols rgba = <unhighlight_color>
    SetScreenElementProps id = char_guide_foreign rgba = <unhighlight_color>
    reset_char_disabled
    change \{ keyboard_caps_lock = 0 }
endscript

script reset_char_disabled 
    if keyboard_anchor ::getsingletag \{ disable_special_character_tabs }
        SetScreenElementProps \{id = char_guide_symbols rgba = [ 50 50 50 128 ]}
        SetScreenElementProps \{id = char_guide_foreign rgba = [ 50 50 50 128 ]}
    endif
endscript

script keyboard_handle_shift 
    playsound \{ MenuUp }
    switch keyboard_current_charset
        case alphanumeric_lower
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        change \{ keyboard_current_charset = alphanumeric_upper }
        case alphanumeric_upper
        keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
        change \{ keyboard_current_charset = alphanumeric_lower }
    endswitch
endscript

script keyboard_handle_backspace 
    playsound \{ menu03 vol = 60 pitch = 55 }
    TextElementBackspace \{ id = keyboard_display_string }
    TextElementBackspace \{ id = keyboard_display_string }
    TextElementConcatenate \{ id = keyboard_display_string '_' }
    if NOT TextElementBackspace \{ id = keyboard_current_string }
    endif
endscript

script keyboard_handle_space 
    keyboard_button_pressed text = ' ' max_length = <max_length>
endscript

script keyboard_handle_caps 
    Theme_GetHighlightedTextColor return_value = highlight_color
    playsound MenuUp
    switch keyboard_current_charset
        case alphanumeric_upper
        keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
        change keyboard_current_charset = alphanumeric_lower
        reset_char_guides
        SetScreenElementProps id = char_guide_lower rgba = <highlight_color>
        change keyboard_caps_lock = 0
        case alphanumeric_lower
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        change keyboard_current_charset = alphanumeric_upper
        reset_char_guides
        SetScreenElementProps id = char_guide_allcaps rgba = <highlight_color>
        change keyboard_caps_lock = 1
        case punctuation_charset
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        change keyboard_current_charset = alphanumeric_upper
        reset_char_guides
        SetScreenElementProps id = char_guide_allcaps rgba = <highlight_color>
        change keyboard_caps_lock = 1
        case foreign_charset
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        change keyboard_current_charset = alphanumeric_upper
        reset_char_guides
        SetScreenElementProps id = char_guide_allcaps rgba = <highlight_color>
        change keyboard_caps_lock = 1
        default 
    endswitch
endscript

script keyboard_done 
    generic_menu_pad_choose_sound
    SetButtonEventMappings unblock_menu_input
    if GotParam min_length
        GetTextElementLength id = keyboard_current_string
        if (<Length> < <min_length>)
            printf 'Not enough characters'
            return 
        endif
    endif
    change keyboard_current_charset = alphanumeric_lower
    change keyboard_caps_lock = 0
    if GotParam keyboard_done_script
        printf 'calling done script'
        GotoPreserveParams <keyboard_done_script>
    else
        GetTextElementString id = keyboard_current_string
        if GotParam string
            printf '%s' s = <string>
        endif
        destroy_onscreen_keyboard
        exit_pause_menu
    endif
endscript

script keyboard_cancel 
    destroy_onscreen_keyboard
    exit_pause_menu
endscript
alphanumeric_charset_lower = [
    [
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '0'
    ]
    [
        'a'
        'b'
        'c'
        'd'
        'e'
        'f'
        'g'
        'h'
        'i'
        'j'
    ]
    [
        'k'
        'l'
        'm'
        'n'
        'o'
        'p'
        'q'
        'r'
        's'
        't'
    ]
    [
        'u'
        'v'
        'w'
        'x'
        'y'
        'z'
    ]
]
alphanumeric_charset_upper = [
    [
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '0'
    ]
    [
        'A'
        'B'
        'C'
        'D'
        'E'
        'F'
        'G'
        'H'
        'I'
        'J'
    ]
    [
        'K'
        'L'
        'M'
        'N'
        'O'
        'P'
        'Q'
        'R'
        'S'
        'T'
    ]
    [
        'U'
        'V'
        'W'
        'X'
        'Y'
        'Z'
    ]
]
punctuation_charset = [
    [
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '0'
    ]
    [
        '.'
        ','
        '!'
        '?'
        '-'
        '¦'
        '\''
        '+'
        '/'
        '^'
    ]
    [
        '#'
        '$'
        '{'
        '*'
        '@'
        '`'
        '&'
        ':'
        '<'
        '>'
    ]
    [
        '_'
        '-'
        '¡'
        '='
        '('
        ')'
    ]
]
foreign_charset = [
    [
        'ß'
        'Ä'
        'Ü'
        'Ö'
        'à'
        'â'
        'ê'
        'è'
        'é'
        'ë'
    ]
    [
        'ì'
        'î'
        'ï'
        'ô'
        'ò'
        'Ö'
        'ù'
        'û'
        'Ü'
        'ç'
    ]
    [
        ''
        'ü'
        'ä'
        'ö'
        'á'
        'ó'
        'ú'
        'í'
        'ñ'
        '®'
    ]
    [
        '¡'
        '¿'
        'ä'
        'ü'
        'É'
        '©'
    ]
]
standard_charset = { alphanumeric_charset allow_punctuation allow_spaces }
gapname_charset = { alphanumeric_charset allow_basic_punctuation allow_spaces }
ip_charset = { ip_control allow_numbers allow_period }
alphanumeric_charset = { allow_numbers allow_uppercase allow_lowercase allow_foreign }
horse_charset = { allow_numbers allow_uppercase allow_lowercase }

script truncate_string max_width = 100
    GetScreenElementDims id = <id>
    if (<max_width> > <width>)
        return 
    endif
    GetTextElementLength id = <id>
    if (2 > <Length>)
        printf 'too short... can\'t truncate text'
        return 
    endif
    initial_width = <width>
    printf 'initial width = %w max width = %m' w = <width> m = <max_width>
    TextElementConcatenate id = <id> '...'
    GetScreenElementDims id = <id>
    extra_width = (<width> - <initial_width>)
    TextElementBackspace id = <id>
    TextElementBackspace id = <id>
    TextElementBackspace id = <id>
    begin 
    GetScreenElementDims id = <id>
    if ((<width> + <extra_width>)> <max_width>)
        TextElementBackspace id = <id>
    else
        break 
    endif
    GetTextElementLength id = <id>
    if (0 = <Length>)
        return 
    endif
    repeat 
    TextElementConcatenate id = <id> '...'
    GetScreenElementDims id = <id>
    printf 'final width = %w' w = <width>
endscript

script keyboard_change_key_sound 
    playsound \{ menu03 vol = 40 }
endscript
