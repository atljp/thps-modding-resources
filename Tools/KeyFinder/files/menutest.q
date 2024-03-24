
script create_menu_test_menu 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = menu_test_menu
        font = small
        Pos = (320.0, 224.0)
        just = [ center center ]
        Scale = 0
        dims = (200.0, 400.0)
        focusable_child = menu_test_vmenu
    }
    CreateScreenElement {
        type = TextElement
        parent = menu_test_menu
        font = small
        text = 'Test Stuff'
        Scale = 1.250
        Pos = (100.0, 70.0)
        just = [ center top ]
        rgba = [ 32 32 144 128 ]
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = menu_test_menu
        id = the_scrolling_menu
        just = [ center top ]
        Pos = (100.0, 90.0)
        dims = (200.0, 80.0)
        internal_just = [ center center ]
    }
    CreateScreenElement {
        type = vmenu
        parent = the_scrolling_menu
        id = menu_test_vmenu
        font = small
        just = [ center top ]
        Pos = (100.0, 0.0)
        dims = (200.0, 170.0)
        internal_just = [ center center ]
        dont_allow_wrap
    }
    AssignAlias id = menu_test_menu alias = current_menu_anchor
    AssignAlias id = menu_test_vmenu alias = current_menu
    SetScreenElementProps {
        id = menu_test_vmenu
        event_handlers = [
            { pad_back leave_menu_test_menu }
        ]
    }
    make_text_menu_item text = 'Sprite Test On' id = menu_sprite_test_on pad_choose_script = start_sprite_test focus_script = make_text_sub_menu_item text = 'Focus here to assert' focus_script = menu_test_focus_position
    make_text_menu_item text = 'Sprite Test Off' id = menu_sprite_test_off pad_choose_script = stop_sprite_test
    make_text_menu_item text = 'Font Test' id = menu_font_test pad_choose_script = launch_font_test_menu
    make_text_menu_item text = 'Exit' id = menu_exit_test pad_choose_script = leave_menu_test_menu
    hookup_hmenu
    SetScreenElementProps {
        id = root_window
        event_handlers = [
            { pad_start NullScript }
        ]
        replace_handlers
    }
    LoadTexture 'sht_volcom01'
    CreateScreenElement {
        type = TextElement
        id = blur_test_element
        parent = root_window
        font = small
        text = 'Vapor Trails'
        Scale = 2.0
        Pos = (320.0, 250.0)
        just = [ center center ]
        rgba = [ 128 128 128 128 ]
        blur_effect
        blur_rgba = [ 128 0 0 128 ]
    }
    CreateScreenElement {
        type = TextElement
        id = dumb_monkey
        parent = root_window
        font = small
        text = 'O\m0\m1\m2\m3\m4\m5\m6ne\bcTwo\bc\m7Three\b1'
        Scale = 1.0
        Pos = (25.0, 150.0)
        just = [ left center ]
        rgba = [ 128 128 128 128 ]
    }
    AssignAlias id = blur_test_element alias = blur_alias
    RunScriptOnScreenElement id = blur_alias do_blur_effect2
    RunScriptOnScreenElement id = menu_test_menu animate_in
    
    CreateScreenElement {
        type = SpriteElement
        parent = root_window
        id = bottom_mid_test
        texture = bottom_mid
        Pos = (320.0, 400.0)
        Scale = (15.0, 1.0)
        just = [ center bottom ]
    }
endscript


script menu_test_focus_position 
    gettags
    SetScreenElementLock id = <id> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        texture = go_fail
    }
    SetScreenElementLock id = <id> Off
endscript


script do_blur_effect 
    DoMorph time = 0 blur_alpha_pair = (4.0, 0.0) blur_bottom_scales = (1.0, 1.0) blur_max_displacement = (0.0, 0.0) Scale = (0.8999999761581421, 0.8999999761581421) Scale = (1.0, 1.0) relative_scale
    DoMorph time = 0.09000 blur_alpha_pair = (0.0, 0.0) blur_bottom_scales = (2.0, 0.0) Scale = (1.0, 1.0) relative_scale
    DoMorph time = 0.09000 blur_alpha_pair = (4.0, 0.0) blur_bottom_scales = (1.0, 1.0) Scale = (1.0, 1.0) relative_scale
endscript


script do_blur_effect_accept 
    DoMorph time = 0 blur_alpha_pair = (4.0, 0.0) blur_bottom_scales = (1.0, 1.0) blur_max_displacement = (0.0, 0.0) Scale = (0.8999999761581421, 0.8999999761581421) Scale = (1.0, 1.0) relative_scale
    DoMorph time = 0.07000 blur_alpha_pair = (0.0, 0.0) blur_bottom_scales = (3.5, 0.0) Scale = (1.0, 1.0) relative_scale
    DoMorph time = 0.07000 blur_alpha_pair = (4.0, 0.0) blur_bottom_scales = (1.0, 1.0) Scale = (1.0, 1.0) relative_scale
endscript


script do_blur_effect_highlight 
    DoMorph time = 0 blur_alpha_pair = (4.0, 0.0) blur_bottom_scales = (1.0, 1.0) blur_max_displacement = (0.0, 0.0) Scale = (0.8999999761581421, 0.8999999761581421) blur_top_alpha_mult = 8.0 Scale = (1.0, 1.0) relative_scale
    DoMorph time = 0.07000 blur_alpha_pair = (0.20000000298023224, 0.20000000298023224) blur_bottom_scales = (2.5999999046325684, 0.0) Scale = (1.0, 1.0) relative_scale
    DoMorph time = 0.07000 blur_alpha_pair = (4.0, 0.0) blur_bottom_scales = (1.0, 1.0) Scale = (1.0, 1.0) relative_scale
endscript


script do_blur_effect2 
    begin 
    DoMorph time = 0 blur_alpha_pair = (1.0, 0.0) blur_bottom_scales = (1.0, 1.0) blur_max_displacement = (0.0, 0.0) alpha = 0.06250 Scale = (2.0, 2.0) relative_scale
    DoMorph time = 0.7500 blur_alpha_pair = (0.5, 0.0) blur_bottom_scales = (3.0, 3.0) Scale = (2.0, 2.0) relative_scale
    DoMorph time = 0.7500 blur_alpha_pair = (1.0, 0.0) blur_bottom_scales = (1.0, 1.0) Scale = (2.0, 2.0) relative_scale
    wait 0.6000 seconds
    DoMorph time = 0.5000 Pos = (320.0, 320.0) blur_max_displacement = (0.0, 70.0)
    DoMorph time = 0.5000 blur_max_displacement = (0.0, 0.0)
    wait 0.6000 seconds
    DoMorph time = 0.5000 Pos = (320.0, 250.0) blur_max_displacement = (0.0, -70.0)
    DoMorph time = 0.5000 Pos = (320.0, 250.0) blur_max_displacement = (0.0, 0.0) alpha = 1.0
    wait 0.6000 seconds
    setprops no_blur_effect
    wait 0.6000 seconds
    setprops blur_effect
    repeat 
endscript


script leave_menu_test_menu 
    DestroyScreenElement id = dumb_monkey
    DestroyScreenElement id = blur_test_element
    stop_sprite_test
    UnloadTexture 'sht_volcom01'
    restore_start_key_binding
    gettags
    
    DestroyScreenElement id = menu_test_menu
    
    create_debug_menu
    DestroyScreenElement id = bottom_mid_test
endscript


script hookup_hmenu 
    
    CreateScreenElement {
        type = hmenu
        id = test_h_menu
        parent = current_menu
        just = [ center center ]
        padding_scale = 1.250
        spacing_between = 30
    }
    CreateScreenElement {
        type = TextElement
        parent = test_h_menu
        local_id = something_something
        text = 'do something'
        font = small
        rgba = [ 128 64 64 75 ]
        event_handlers = [
            { focus do_scale_up }
            { unfocus do_scale_down }
        ]
        not_focusable
    }
    CreateScreenElement {
        type = TextElement
        parent = test_h_menu
        text = 'yes'
        font = small
        rgba = [ 128 128 128 75 ]
        event_handlers = [
            { focus do_scale_up }
            { unfocus do_scale_down }
            { pad_choose choose_h_menu_yes }
        ]
    }
    CreateScreenElement {
        type = TextElement
        parent = test_h_menu
        text = 'no'
        font = small
        rgba = [ 128 128 128 75 ]
        event_handlers = [
            { focus do_scale_up }
            { unfocus do_scale_down }
            { pad_choose choose_h_menu_no }
        ]
    }
    SetScreenElementLock id = test_h_menu
    
endscript


script choose_h_menu_yes 
    SetScreenElementProps id = { test_h_menu child = something_something }focusable
    SetScreenElementProps id = current_menu disable_pad_handling
endscript


script choose_h_menu_no 
    SetScreenElementProps id = { test_h_menu child = something_something }not_focusable
    SetScreenElementProps id = current_menu enable_pad_handling
endscript


script start_sprite_test 
    if ObjectExists id = test_sprite
    else
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            id = test_sprite
            type = SpriteElement
            parent = root_window
            Scale = 1.0
            Pos = (610.0, 30.0)
            just = [ RIGHT top ]
            rgba = [ 128 128 128 128 ]
            texture = sht_volcom01
            debug_outline
        }
        FireEvent type = focus target = current_menu
    endif
endscript


script stop_sprite_test 
    if ObjectExists id = test_sprite
        SetScreenElementLock id = root_window Off
        DestroyScreenElement id = test_sprite recurse
        FireEvent type = focus target = current_menu
    endif
endscript


script launch_font_test_menu 
endscript


script Create3dArrowPointer Model = 'Arrow' anglex = 42.50 Pos = (320.0, 50.0) Scale = 0.03000 active_viewport = 0
    if GotParam ArrowId
        
        goto abort
    endif
    if ObjectExists id = <id>
        DestroyScreenElement id = <id>
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        parent = root_window
        type = element3d
        id = <id>
        Model = <Model>
        Pos = <Pos>
        cameraz = -6
        Scale = <Scale>
        tilt = <tilt>
        active_viewport = <active_viewport>
        anglex = <anglex>
        nodetopointto = <node>
        objecttopointto = <name>
    }
endscript


script TestElement3d 
    DoMorph time = 0 Pos = Random (@ (0.0, 0.0) @ (-100.0, 240.0) @ (740.0, 240.0) @ (740.0, 580.0))
    DoMorph time = 0.5000 Pos = <Pos>
    DoMorph time = 1 Pos = Random (@ (-200.0, 0.0) @ (-200.0, 240.0) @ (840.0, 240.0) @ (840.0, 580.0))
    wait 1 seconds
    Die
endscript

