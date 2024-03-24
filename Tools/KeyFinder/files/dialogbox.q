

script create_snazzy_dialog_box {Title = 'Title'
        text = 'Default text'
        anchor_id = dialog_box_anchor
        vmenu_id = dialog_box_vmenu
        title_font = small
        font = small
        Pos = (320.0, 240.0)
        just = [ center top ]
        Scale = 1
        line_spacing = 0.7000
        title_scale = 1
        text_scale = 1
        text_dims = (200.0, 0.0)
        pos_tweak = (0.0, -50.0)
        bg_rgba = [ 0 0 0 70 ]
        bg_scale = 1
        hmenu_pos = (0.0, 40.0)
        z_priority = 10
    }
    if (<font> = dialog)
        font = small
        
        
        
    endif
    Theme_GetHighlightedTextColor return_value = title_rgba
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    if ScreenElementExists id = <anchor_id>
        dialog_box_exit anchor_id = <anchor_id>
    endif
    if NOT InNetGame
        if NOT LevelIs load_mainmenu
            pause_menu_gradient
        endif
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = <anchor_id>
        dims = (640.0, 480.0)
        Pos = <Pos>
        just = [ center center ]
        z_priority = <z_priority>
        priority = <priority>
    }
    CreateScreenElement {
        type = ContainerElement
        id = dialog_box_container
        parent = <anchor_id>
        dims = (640.0, 480.0)
        Pos = <Pos>
        just = [ center center ]
        z_priority = <z_priority>
        priority = <priority>
    }
    CreateScreenElement {
        type = ContainerElement
        parent = <anchor_id>
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
        just = [ center center ]
        z_priority = <z_priority>
    }
    <bg_anchor_id> = <id>
    if GotParam from_cas
        make_cas_bg_elements parent = <bg_anchor_id>
    else
        if LevelIs load_mainmenu
            if NOT GotParam no_bg
                build_top_and_bottom_blocks parent = <bg_anchor_id>
                make_mainmenu_3d_plane parent = <bg_anchor_id>
            endif
        endif
    endif
    if GotParam forced_pos
        Pos = <forced_pos>
    endif
    CreateScreenElement {
        type = vmenu
        parent = dialog_box_container
        id = <vmenu_id>
        Pos = <Pos>
        just = [ center top ]
        internal_just = [ center top ]
        Scale = <Scale>
        z_priority = <z_priority>
    }
    if GotParam buttons
        GetArraySize <buttons>
        if GotParam pad_back_script
            if (<array_size> = 1)
                create_helper_text {anchor_id = <helper_text_anchor_id>
                    parent = <bg_anchor_id>
                    generic_dialog_helper_text3
                    bg_rgba = <helper_text_bg_rgba>
                }
            else
                create_helper_text {anchor_id = <helper_text_anchor_id>
                    parent = <bg_anchor_id>
                    generic_helper_text
                    bg_rgba = <helper_text_bg_rgba>
                }
            endif
        else
            if (<array_size> = 1)
                create_helper_text {anchor_id = <helper_text_anchor_id>
                    parent = <bg_anchor_id>
                    generic_dialog_helper_text
                    bg_rgba = <helper_text_bg_rgba>
                }
            else
                create_helper_text {anchor_id = <helper_text_anchor_id>
                    parent = <bg_anchor_id>
                    generic_dialog_helper_text2
                    bg_rgba = <helper_text_bg_rgba>
                }
            endif
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <vmenu_id>
        font = <title_font>
        text = <Title>
        just = [ center top ]
        rgba = <title_rgba>
        Scale = <title_scale>
        Scale = 1.500
        z_priority = <z_priority>
        not_focusable
    }
    <title_id> = <id>
    GetScreenElementDims id = <title_id>
    CreateScreenElement {
        type = TextBlockElement
        parent = <vmenu_id>
        font = small
        text = <text>
        just = [ center top ]
        dims = <text_dims>
        rgba = <text_rgba>
        Scale = <text_scale>
        line_spacing = <line_spacing>
        allow_expansion
        not_focusable
    }
    <text_id> = <id>
    GetScreenElementDims id = <text_id>
    if GotParam buttons
        CreateScreenElement {
            type = ContainerElement
            parent = <vmenu_id>
            dims = (<text_dims> + (50.0, 20.0))
            not_focusable
        }
    endif
    if GotParam logo
        CreateScreenElement {
            type = SpriteElement
            parent = <vmenu_id>
            texture = <logo>
            just = [ center center ]
            rgba = [ 128 128 128 128 ]
            Scale = 1.0
        }
        no_icon = no_icon
        if (<logo> = dnas)
            CreateScreenElement {
                type = TextBlockElement
                parent = <vmenu_id>
                text = '\nDNAS logotype is a trademark of \nSony Computer Entertainment Inc.'
                font = dialog
                dims = (300.0, 100.0)
                just = [ center center ]
                rgba = <text_rgba>
                Scale = <text_scale>
            }
        endif
    endif
    if GotParam pad_back_script
        SetScreenElementProps {
            id = <vmenu_id>
            event_handlers = [{pad_back <pad_back_script> params = <pad_back_params>}]
            replace_handlers
        }
    endif
    SetScreenElementLock id = <vmenu_id> on
    SetScreenElementLock id = <vmenu_id> Off
    GetScreenElementDims id = <vmenu_id>
    section_width = ((<width> / 100.0)+ 0.0)
    if GotParam buttons
        ForEachIn <buttons> do = create_dialog_button params = {font = <font> parent = <vmenu_id> z_priority = (<z_priority> + 4)width = <section_width> pad_focus_script = <pad_focus_script>}
        GetArraySize <buttons>
        if (<array_size> > 1)
            SetScreenElementProps {
                id = <vmenu_id>
                event_handlers = [
                    {pad_up generic_menu_up_or_down_sound params = { up }}
                    {pad_down generic_menu_up_or_down_sound params = { down }}
                ]
            }
        endif
    endif
    if GotParam sub_logo
        CreateScreenElement {
            type = SpriteElement
            parent = <vmenu_id>
            texture = <sub_logo>
            just = [ center center ]
            rgba = [ 128 128 128 88 ]
            Scale = 1.200
            not_focusable
        }
        no_icon = no_icon
    endif
    SetScreenElementLock id = <vmenu_id> on
    SetScreenElementLock id = <vmenu_id> Off
    GetScreenElementDims id = <vmenu_id>
    section_width = ((<width> / 100.0)+ 0.0)
    section_height = 32
    num_parts = (((<height> * 1.0)/ (<section_height> * 1.0))-1.0)
    if NOT GotParam forced_pos
        centered_pos = ((320.0, 0.0) + ((0.0, 1.0) * (480 - <height>)/ 2)+ <pos_tweak>)
        SetScreenElementProps id = <vmenu_id> Pos = <centered_pos>
    else
        centered_pos = <forced_pos>
    endif
    theme_dialog_background {parent = dialog_box_container
        width = <section_width>
        Pos = (<centered_pos> + (0.0, -8.0))
        num_parts = <num_parts>
        z_priority = 10
        no_icon = <no_icon>
        add_loading_anim = <add_loading_anim>
    }
    kill_start_key_binding
    if ObjectExists id = no_button
        FireEvent type = focus target = <vmenu_id> Data = { child_id = no_button }
    else
        FireEvent type = focus target = <vmenu_id>
    endif
    if GotParam delay_input
        RunScriptOnScreenElement id = <anchor_id> dialog_box_delay_input params = { delay_input_time = <delay_input_time> }
    endif
    if NOT GotParam no_animate
        if GotParam style
            RunScriptOnScreenElement id = <anchor_id> <style> params = <...> 
        else
            if NOT GotParam full_animate
                RunScriptOnScreenElement id = dialog_box_container animate_dialog_box_in params = <...> 
            else
                RunScriptOnScreenElement id = <anchor_id> animate_dialog_box_in params = <...> 
            endif
        endif
    endif
endscript


script special_dialog_style 
    GetScreenElementDims id = <vmenu_id>
    GetScreenElementPosition id = <vmenu_id>
    CreateScreenElement {
        type = SpriteElement
        parent = dialog_box_container
        id = left_star
        Pos = (<screenelementpos> + (40.0, 12.0))
        texture = PA_goals
        Scale = 1.800
        rot_angle = 10
        rgba = [ 123 59 3 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = dialog_box_container
        id = middle_star
        Pos = ((1.0, 0.0) * <width> + <screenelementpos> + (-250.0, 72.0))
        texture = de_sponsor
        Scale = (6.5, 6.5)
        rot_angle = -90
        rgba = [ 123 59 3 50 ]
        z_priority = 11
    }
    CreateScreenElement {
        type = SpriteElement
        parent = dialog_box_container
        id = right_star
        Pos = ((1.0, 0.0) * <width> + <screenelementpos> + (-30.0, 12.0))
        texture = PA_goals
        Scale = 1.800
        flip_v
        rot_angle = -10
        rgba = [ 123 59 3 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = dialog_box_container
        id = flash3
        Pos = ((1.0, 0.0) * <width> + <screenelementpos> + (-275.0, 110.0))
        texture = bg_gradient_1
        Scale = (1.8799999952316284, 44.0)
        flip_v
        rgba = [ 123 59 3 88 ]
        z_priority = 11
    }
    CreateScreenElement {
        type = SpriteElement
        parent = dialog_box_container
        id = topline
        Pos = ((1.0, 0.0) * <width> + <screenelementpos> + (-275.0, 22.0))
        texture = white2
        Scale = (60.0, 0.6000000238418579)
        flip_v
        rgba = [ 123 59 3 88 ]
        z_priority = 11
    }
    if GotParam use_shrek_logo
        CreateScreenElement {
            type = SpriteElement
            parent = dialog_box_container
            id = shrekie
            Pos = ((1.0, 0.0) * <width> + <screenelementpos> + (-275.0, 230.0))
            texture = shrek_logo
            Scale = 0.9000
            rgba = [ 128 128 128 128 ]
            z_priority = 11
        }
    endif
    RunScriptOnScreenElement id = middle_star burst_star
    RunScriptOnScreenElement id = left_star spin_star params = { dir = cw }
    RunScriptOnScreenElement id = right_star spin_star params = { dir = ccw }
    <title_id> ::obj_spawnscript pulse_dialog_title params = { id = <title_id> }
    RunScriptOnScreenElement id = dialog_box_container animate_special_dialog_box_in params = <...> 
endscript


script animate_special_dialog_box_in 
    DoMorph Pos = (1000.0, 260.0) alpha = 0 time = 0 Scale = 0
    DoMorph Pos = (320.0, 260.0) alpha = 1 time = 0.3000 Scale = 1
endscript


script spin_star dir = cw
    do_random_effect
endscript


script burst_star 
    DoMorph time = 0 Scale = 0 alpha = 0
    DoMorph time = 0.4000 Scale = 5.500 alpha = 1
endscript


script pulse_dialog_title 
    begin 
    if ObjectExists id = <id>
        DoScreenElementMorph id = <id> time = 0.2000 Scale = (2.200000047683716, 2.0) rgba = [ 120 28 7 28 ]
        wait 0.2000 seconds
    else
        break 
    endif
    if ObjectExists id = <id>
        DoScreenElementMorph id = <id> time = 0.2000 Scale = (1.5, 1.5) rgba = [ 120 28 7 128 ]
        wait 0.2000 seconds
    else
        break 
    endif
    repeat 
endscript


script theme_dialog_background parent = current_menu_anchor width = 1 Pos = (320.0, 120.0) num_parts = 2 top_height = 1
    if ScreenElementExists id = dialog_box_bg_vmenu
        DestroyScreenElement id = dialog_box_bg_vmenu
    endif
    Theme_GetBGPartsColor return_value = dialog_bg_rgba
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = vmenu
        parent = <parent>
        id = dialog_box_bg_vmenu
        font = small
        just = [ left top ]
        Pos = <Pos>
        padding_scale = 1
        internal_scale = 1
        internal_just = [ center center ]
    }
    middle_parts = <num_parts>
    CastToInteger middle_parts
    partial_scale = (<num_parts> - <middle_parts>)
    
    build_theme_dialog_top parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority> height = <top_height>
    if (<middle_parts> > 0)
        begin 
        build_theme_dialog_middle parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority>
        repeat <middle_parts>
    endif
    build_theme_dialog_middle parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority>
    build_theme_dialog_bottom parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> no_icon = <no_icon> add_loading_anim = <add_loading_anim>
endscript


script build_theme_dialog_top 
    CreateScreenElement {
        type = ContainerElement
        dims = (0.0, 32.0)
        parent = <parent>
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_T_M
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <dialog_bg_rgba>
        Scale = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
        z_priority = <z_priority>
    }
    <top_height> = <height>
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width>)
    left_pos = ((-0.5, 0.0) * <width>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_T_L
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <dialog_bg_rgba>
        Scale = ((1.0, 0.0) + (0.0, 1.0) * <top_height>)
        z_priority = <z_priority>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_T_R
        Pos = <right_pos>
        just = [ left top ]
        rgba = <dialog_bg_rgba>
        Scale = ((1.0, 0.0) + (0.0, 1.0) * <top_height>)
        z_priority = <z_priority>
    }
endscript


script build_theme_dialog_middle scale_height = 1
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        dims = (0.0, 32.0)
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_M_M
        Pos = (0.0, 0.0)
        just = [ center top ]
        rgba = <dialog_bg_rgba>
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
        texture = snaz_M_L
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <dialog_bg_rgba>
        Scale = <side_scale>
        z_priority = <z_priority>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_M_R
        Pos = <right_pos>
        just = [ left top ]
        rgba = <dialog_bg_rgba>
        Scale = <side_scale>
        z_priority = <z_priority>
    }
endscript


script build_theme_dialog_bottom 
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        dims = (0.0, 32.0)
    }
    anchor_id = <id>
    Pos = ((0.0, -1.0) * (32 - (<scale_height> * 32)))
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_B_M
        Pos = <Pos>
        just = [ center top ]
        rgba = <dialog_bg_rgba>
        Scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
        z_priority = <z_priority>
    }
    GetScreenElementDims id = <id>
    right_pos = ((0.5, 0.0) * <width> + <Pos>)
    left_pos = ((-0.5, 0.0) * <width> + <Pos>)
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_B_L
        Pos = <left_pos>
        just = [ RIGHT top ]
        rgba = <dialog_bg_rgba>
        Scale = (1.0, 1.0)
        z_priority = <z_priority>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = snaz_B_R
        Pos = <right_pos>
        just = [ left top ]
        rgba = <dialog_bg_rgba>
        Scale = (1.0, 1.0)
        z_priority = <z_priority>
    }
    if NOT GotParam no_icon
        FormatText checksumname = theme_icon '%i_snaz_icon' i = (THEME_PREFIXES [ current_theme_prefix ])
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = <theme_icon>
            Pos = ((0.0, 10.0) + <Pos>)
            just = [ center center ]
            rgba = [ 50 50 50 70 ]
            Scale = (1.2999999523162842, 1.2999999523162842)
            z_priority = (<z_priority> + 1)
        }
        if GotParam add_loading_anim
            RunScriptOnScreenElement id = <id> spin_dialog_icon
        endif
    endif
endscript


script spin_dialog_icon 
    begin 
    DoMorph rot_angle = 360 time = 1.0
    DoMorph rot_angle = 0 time = 1.0
    repeat 
endscript


script create_error_box delay_input_time = 1000
    create_dialog_box <...> error_box
endscript


script create_dialog_box 
    create_snazzy_dialog_box <...> 
endscript


script create_dialog_button {focus_script = main_theme_focus
        focus_params = { text_scale = 1.145 }
        unfocus_script = main_theme_unfocus
        pad_choose_script = dialog_box_exit
        font = small
        parent = dialog_box_vmenu
    }
    SetScreenElementLock id = root_window Off
    SetScreenElementLock id = <parent> Off
    Theme_GetUnhighlightedTextColor return_value = text_color
    if (<text> = 'No')
        id = no_button
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <id>
        dims = (0.0, 20.0)
        just = [ center center ]
        event_handlers = 
        [
            {focus <focus_script> params = <focus_params>}
            {unfocus <unfocus_script> params = <unfocus_params>}
            { pad_choose generic_menu_pad_choose_sound }
            { pad_start generic_menu_pad_choose_sound }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
        <not_focusable>
    }
    anchor_id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        Pos = (0.0, 0.0)
        font = <font>
        text = <text>
        just = [ center center ]
        Scale = 1
        rgba = <text_color>
        z_priority = <z_priority>
    }
    highlight_angle = 0
    bar_scale = ((<width> + 2)* (0.5, 0.0) + (0.0, 0.699999988079071))
    highlight_angle = (<highlight_angle> / (<bar_scale>.(1.0, 0.0)))
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Pos = (0.0, 0.0)
        rgba = [ 0 0 0 0 ]
        just = [ center center ]
        Scale = <bar_scale>
        z_priority = 11
        rot_angle = <highlight_angle>
    }
endscript


script dialog_box_exit { anchor_id = dialog_box_anchor }
    if NOT GotParam dont_restore_input
        SetButtonEventMappings unblock_menu_input
    endif
    Debounce x time = 0.3000
    if ObjectExists id = <anchor_id>
        DestroyScreenElement id = <anchor_id>
    endif
    if LevelIs load_mainmenu
    else
        pause_menu_gradient Off
    endif
    if NOT GotParam no_pad_start
        if NOT LevelIs load_mainmenu
            restore_start_key_binding
        endif
    endif
endscript


script dialog_box_delay_input delay_input_time = 2000
    SetButtonEventMappings block_menu_input
    wait <delay_input_time>
    SetButtonEventMappings unblock_menu_input
endscript


script create_speech_box {Pos = (320.0, 450.0)
        text_rgba = [ 128 128 128 128 ]
        anchor_id = speech_box_anchor
        Scale = 1
        pad_choose_script = speech_box_exit
        pad_choose_params = { anchor_id = <anchor_id> }
        parent = root_window
        bg_x_scale = 1.120
        pause_input_time = 1000
    }
    font = testtitle
    Theme_GetSpeechBoxColor return_value = bg_rgba
    if ObjectExists id = <anchor_id>
        DestroyScreenElement id = <anchor_id>
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <anchor_id>
        Pos = (320.0, 210.0)
        dims = (640.0, 480.0)
        Scale = <Scale>
        z_priority = <z_priority>
    }
    if NOT GotParam no_pad_choose
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_back_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_back <pad_back_script> params = <pad_back_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_circle_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_circle <pad_circle_script> params = <pad_circle_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_square_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_square <pad_square_script> params = <pad_square_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_option_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_option <pad_option_script> params = <pad_option_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_up_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_up <pad_up_script> params = <pad_up_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_down_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_down <pad_down_script> params = <pad_down_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_left_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_left <pad_left_script> params = <pad_left_params>}]
            replace_handlers
        }
    endif
    if GotParam pad_right_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_right <pad_right_script> params = <pad_right_params>}]
            replace_handlers
        }
    endif
    if NOT GotParam no_pad_start
        SetScreenElementProps {
            id = root_window
            event_handlers = [{pad_start <pad_choose_script> params = <pad_choose_params>}]
            replace_handlers
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        Pos = <Pos>
        just = [ center bottom ]
        texture = dialog_frame_b
        Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
        rgba = <bg_rgba>
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = <anchor_id>
        shadow
        font = <font>
        dims = ((260.0, 0.0))
        Pos = (0.0, 0.0)
        just = [ center top ]
        text = <text>
        internal_scale = 0.8500
        internal_just = [ center bottom ]
        rgba = <text_rgba>
        Scale = 1
        allow_expansion
    }
    <speech_text> = <id>
    GetScreenElementDims id = <speech_text>
    SetScreenElementProps {
        id = <speech_text>
        Pos = (<Pos> - (0.0, 16.0) - ((0.0, 1.0) * <height>))
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = dialog_middle
        Pos = (<Pos> - (0.0, 16.0))
        Scale = (((1.0, 0.0) * <bg_x_scale>)+ (0.0, 1.0) * <height> / 16)
        just = [ center bottom ]
        rgba = <bg_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        Pos = (<Pos> - (0.0, 16.0) - (0.0, 1.0) * <height>)
        just = [ center bottom ]
        texture = dialog_frame
        Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
        rgba = <bg_rgba>
    }
    if GotParam style
        RunScriptOnScreenElement id = <anchor_id> <style> params = <...> 
    endif
    FireEvent type = focus target = <anchor_id>
    if GotParam pause_input
        SpawnScript TemporarilyDisableInput params = { time = <pause_input_time> }
    endif
endscript


script speech_box_exit anchor_id = speech_box_anchor
    if ObjectExists id = <anchor_id>
        DestroyScreenElement id = <anchor_id>
    endif
    Debounce x time = 0.3000
    if NOT GotParam no_pad_start
        restore_start_key_binding
    endif
    FireEvent type = speech_box_destroyed
endscript


script speech_box_style 
    RunScriptOnScreenElement id = <speech_text> hide_speech_text params = <...> 
    DoMorph time = 0 Scale = (1.0, 1.0) alpha = 1
    wait 4 frame
    DoMorph time = 0.2000 Scale = (1.0, 1.0) alpha = 1
    RunScriptOnScreenElement id = <speech_text> speech_box_style_scale_text params = <...> 
endscript


script hide_speech_text 
    DoMorph time = 0 Scale = 0
endscript


script speech_box_style_scale_text anchor_id = <anchor_id>
    wait 0.05000 second
    DoMorph time = 0 Scale = (1.0, 1.0) alpha = 0
    DoMorph time = 0.5000 Scale = (1.0, 1.0) alpha = 1
    FireEvent type = focus target = <anchor_id>
endscript


script animate_dialog_box_in 
    if GotParam full_animate
        SetScreenElementProps {
            id = <bg_anchor_id>
            hide
        }
    endif
    if NOT GotParam delay_input
        SpawnScript dialog_box_delay_input params = { delay_input_time = 150 }
    endif
    DoMorph time = 0 Scale = (0.0, 0.0) alpha = 0.1000
    DoMorph time = 0.1500 Scale = (1.0, 0.0) alpha = 0.4000
    DoMorph time = 0.1500 Scale = (1.0, 1.0) alpha = 1.0
    if GotParam full_animate
        SetScreenElementProps {
            id = <bg_anchor_id>
            unhide
        }
    endif
endscript


script create_test_dialog 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    create_dialog_box {pad_back_script = create_test_menu
        buttons = [{font = small text = 'No' pad_choose_script = create_test_menu}
            {font = small text = 'Yes' pad_choose_script = null_script}
        ]
    }
endscript


script dialog_box_accept 
    dialog_box_exit
    FireEvent type = message_accept
endscript

