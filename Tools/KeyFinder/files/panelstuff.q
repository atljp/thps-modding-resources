balance_meter_info = {
    bar_positions = [
        (320.0, 165.0)
        (250.0, 224.0)
    ]
    bar_positions_mp_h = [
        (320.0, 70.0)
        (250.0, 130.0)
    ]
    bar_positions_mp_v = [
        (140.0, 130.0)
        (80.0, 224.0)
    ]
    arrow_positions = [
        (0.0, -17.0)
        (10.0, -17.0)
        (20.0, -15.0)
        (30.0, -11.0)
        (40.0, -6.0)
        (50.0, 1.0)
        (60.0, 12.0)
    ]
}
special_bar_colors = default_bar_colors
default_bar_colors = [
    [ 128 0 9 128 ]
    [ 81 107 128 128 ]
    [ 128 0 9 128 ]
]
special_bar_interpolator_rate = 0.1000

script hide_panel_stuff 
    
    if ObjectExists id = player1_panel_container
        
        DoScreenElementMorph {
            id = player1_panel_container
            alpha = 0
        }
    endif
endscript


script show_panel_stuff 
    
    if ObjectExists id = player1_panel_container
        
        DoScreenElementMorph {
            id = player1_panel_container
            alpha = 1
        }
    endif
endscript


script destroy_panel_stuff 
    if ScreenElementExists id = player1_panel_container
        DestroyScreenElement id = player1_panel_container
    endif
    if ScreenElementExists id = player2_panel_container
        DestroyScreenElement id = player2_panel_container
    endif
    if ScreenElementExists id = the_time
        DestroyScreenElement id = the_time
    endif
    if ScreenElementExists id = current_goal
        DestroyScreenElement id = current_goal
    endif
    if ScreenElementExists id = current_goal_key_combo_text
        DestroyScreenElement id = current_goal_key_combo_text
    endif
    if ScreenElementExists id = goal_points_text
        DestroyScreenElement id = goal_points_text
    endif
    if ScreenElementExists id = net_score_menu
        DestroyScreenElement id = net_score_menu
    endif
    update_goal_points_display Kill
    update_pager_icon Kill
    TantrumMessageKill
endscript


script create_panel_stuff 
    if InSplitScreenGame
        ScriptGetScreenMode
        switch <screen_mode>
            case horse1
            case horse2
            case split_vertical
            case one_camera
            timer_pos = (285.0, 20.0)
            timer_scale = 1.0
            if GameModeEquals is_horse
                trick_text_dims = (575.0, 70.0)
                trick_text_pos = (287.0, 2.0)
                player1_panel_dims = (640.0, 448.0)
                player1_panel_pos = (0.0, 0.0)
                player2_panel_dims = (640.0, 448.0)
                player2_panel_pos = (0.0, 0.0)
            else
                trick_text_dims = (240.0, 70.0)
                trick_text_pos = (120.0, 2.0)
                player1_panel_dims = (320.0, 448.0)
                player1_panel_pos = (0.0, 0.0)
                player2_panel_dims = (320.0, 448.0)
                player2_panel_pos = (333.0, 0.0)
            endif
            CreateScreenElement {
                id = player1_panel_container
                type = ContainerElement
                parent = root_window
                Scale = 1.0
                dims = (320.0, 448.0)
                Pos = (0.0, 0.0)
                just = [ top left ]
            }
            CreateScreenElement {
                id = player2_panel_container
                type = ContainerElement
                parent = root_window
                Scale = 1.0
                dims = <player2_panel_dims>
                Pos = <player2_panel_pos>
                just = [ top left ]
            }
            case split_horizontal
            trick_text_dims = (575.0, 30.0)
            trick_text_pos = (287.0, 2.0)
            timer_pos = (300.0, 20.0)
            timer_scale = 1.0
            CreateScreenElement {
                id = player1_panel_container
                type = ContainerElement
                parent = root_window
                Scale = 1.0
                dims = <player1_panel_dims>
                Pos = <player1_panel_pos>
                just = [ top left ]
            }
            CreateScreenElement {
                id = player2_panel_container
                type = ContainerElement
                parent = root_window
                Scale = 1.0
                dims = (640.0, 224.0)
                Pos = (0.0, 224.0)
                just = [ top left ]
            }
        endswitch
    else
        trick_text_dims = (575.0, 70.0)
        trick_text_pos = (287.0, 2.0)
        timer_pos = (300.0, 20.0)
        timer_scale = 1.0
        CreateScreenElement {
            id = player1_panel_container
            type = ContainerElement
            parent = root_window
            Scale = 1.0
            dims = (640.0, 448.0)
            Pos = (0.0, 0.0)
            just = [ top left ]
        }
    endif
    if ScreenElementExists id = goal_retry_pad_select
        DestroyScreenElement id = goal_retry_pad_select
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goal_retry_pad_select
        Pos = (0.0, 0.0)
        dims = (0.0, 0.0)
        event_handlers = [
            { pad_select goal_retry_select_handler }
        ]
    }
    FireEvent type = focus target = goal_retry_pad_select
    CreateScreenElement {
        id = the_time
        type = TextElement
        parent = root_window
        font = newtimerfont
        text = ''
        Scale = <timer_scale>
        Pos = <timer_pos>
        just = [ center top ]
        rgba = [ 128 128 128 68 ]
        z_priority = -1
    }
    CreateScreenElement {
        id = current_goal
        type = TextBlockElement
        parent = root_window
        font = small
        internal_scale = 0.8000
        text = ' '
        Pos = (620.0, 10.0)
        just = [ RIGHT top ]
        internal_just = [ center top ]
        dims = (250.0, 100.0)
        rgba = [ 128 128 128 110 ]
        shadow
        shadow_offs = (0.5, 0.5)
        shadow_rgba = [ 30 30 30 100 ]
    }
    CreateScreenElement {
        type = TextElement
        parent = root_window
        id = goal_points_text
        font = small
        Pos = (585.0, 40.0)
        just = [ left top ]
        Scale = 0
        rgba = [ 105 105 105 128 ]
        text = ' '
    }
    CreateScreenElement {
        id = the_score
        type = TextElement
        parent = player1_panel_container
        font = testtitle
        text = '0'
        Scale = (1.0)
        Pos = (136.0, 15.0)
        just = [ left top ]
        rgba = [ 105 105 105 128 ]
    }
    Theme_GetHUDColor return_value = score_color
    Theme_GetHUDSpecialColor return_value = special_color
    CreateScreenElement {
        id = the_score_sprite
        type = SpriteElement
        parent = the_score
        texture = score_small
        Scale = (1.2000000476837158, 0.8500000238418579)
        Pos = (-17.0, 23.0)
        rgba = <score_color>
    }
    CreateScreenElement {
        id = the_special_bar_special
        type = SpriteElement
        parent = the_score_sprite
        texture = special
        Scale = (1.7300000190734863, 0.8700000047683716)
        Pos = (10.0, 34.0)
        just = [ left top ]
        rgba = <special_color>
        z_priority = 5000
    }
    CreateScreenElement {
        id = the_special_bar_sprite
        type = SpriteElement
        parent = the_score_sprite
        texture = specialbar
        Scale = (1.0, 1.100000023841858)
        Pos = (9.0, 36.0)
        just = [ left top ]
        rgba = [ 128 128 128 100 ]
    }
    CreateScreenElement {
        id = the_boardstance_sprite
        type = SpriteElement
        parent = the_score_sprite
        texture = nollie_icon
        Scale = (0.75, 1.2999999523162842)
        just = [ left top ]
        Pos = (123.0, 45.0)
        rot_angle = 90
        rgba = [ 128 128 128 128 ]
    }
    FormatText checksumname = sponsor_texture '%i_sponsor' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    CreateScreenElement {
        id = generic_sponsor_logo
        type = SpriteElement
        parent = the_score_sprite
        texture = <sponsor_texture>
        Scale = (1.0, 1.0)
        just = [ left top ]
        Pos = (-28.0, 8.0)
        rgba = [ 128 128 128 128 ]
        z_priority = 0
    }
    CreateScreenElement {
        id = trick_text_container
        type = ContainerElement
        parent = player1_panel_container
        Scale = 1.0
        dims = <trick_text_dims>
        just = [ center center ]
        alpha = 0.0
    }
    CreateScreenElement {
        id = the_trick_text
        type = TextBlockElement
        parent = trick_text_container
        Scale = 1.0
        Pos = { (0.5, 0.0) proportional }
        dims = <trick_text_dims>
        just = [ center top ]
        internal_just = [ center top ]
        font = newtrickfont
        text = ' '
        internal_scale = 0.7000
        alpha = 1.0
        tags = { tag_state = inactive }
        shadow
        shadow_offs = (1.0, 1.0)
        shadow_rgba = [ 30 30 30 75 ]
        z_priority = 0
    }
    CreateScreenElement {
        id = the_score_pot_text
        type = TextElement
        parent = trick_text_container
        Scale = (1.0)
        Pos = { (0.5, 0.0) proportional }
        just = [ center bottom ]
        font = testtitle
        text = ' '
        alpha = 1.0
        z_priority = 0
    }
    reset_trick_text_appearance the_score_pot_text_id = the_score_pot_text the_trick_text_id = the_trick_text trick_text_container_id = trick_text_container
    CreateScreenElement {
        id = the_balance_meter
        type = SpriteElement
        parent = player1_panel_container
        texture = balancemeter
        Scale = 1.0
        just = [ center center ]
        rgba = [ 128 128 128 0 ]
        tags = {tag_turned_on = 0 tag_mode = balance}
    }
    CreateScreenElement {
        type = SpriteElement
        parent = the_balance_meter
        texture = balancearrow_glow
        Scale = 1.200
        Pos = (0.0, 0.0)
        just = [ center center ]
        rgba = [ 128 128 128 0 ]
        z_priority = 3
    }
    if InSplitScreenGame
        ScriptGetScreenMode
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            CreateScreenElement {
                id = the_run_timer
                type = SpriteElement
                parent = player1_panel_container
                texture = watch
                Scale = 1.0
                just = [ center center ]
                Pos = (240.0, 240.0)
                alpha = 0
                rgba = [ 128 128 128 90 ]
                tags = {tag_turned_on = 0 tag_mode = balance}
            }
            case split_horizontal
            CreateScreenElement {
                id = the_run_timer
                type = SpriteElement
                parent = player1_panel_container
                texture = watch
                Scale = 1.0
                just = [ center center ]
                Pos = (500.0, 120.0)
                alpha = 0
                rgba = [ 128 128 128 90 ]
                tags = {tag_turned_on = 0 tag_mode = balance}
            }
            default 
            CreateScreenElement {
                id = the_run_timer
                type = SpriteElement
                parent = player1_panel_container
                texture = watch
                Scale = 1.0
                just = [ center center ]
                Pos = (400.0, 240.0)
                alpha = 0
                rgba = [ 128 128 128 90 ]
                tags = {tag_turned_on = 0 tag_mode = balance}
            }
        endswitch
    else
        CreateScreenElement {
            id = the_run_timer
            type = SpriteElement
            parent = player1_panel_container
            texture = watch
            Scale = 1.0
            just = [ center center ]
            Pos = (400.0, 240.0)
            alpha = 0
            rgba = [ 128 128 128 90 ]
            tags = {tag_turned_on = 0 tag_mode = balance}
        }
    endif
    CreateScreenElement {
        id = the_run_timer_hand
        type = SpriteElement
        parent = the_run_timer
        texture = Hand
        Scale = 1.0
        Pos = (24.0, 24.0)
        just = [ center center ]
        rgba = [ 128 128 128 128 ]
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_1
        Scale = 1.0
        Pos = (7.0, 8.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_2
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_3
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_4
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_5
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_6
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_7
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = the_run_timer
        texture = time_8
        Scale = 1.0
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    if InSplitScreenGame
        CreateScreenElement {
            id = (the_score + 1)
            type = TextElement
            parent = player2_panel_container
            font = testtitle
            text = '0'
            Scale = (1.0)
            Pos = (136.0, 15.0)
            just = [ left top ]
            rgba = [ 105 105 105 128 ]
        }
        Theme_GetHUDColor return_value = score_color
        Theme_GetHUDSpecialColor return_value = special_color
        CreateScreenElement {
            id = (the_score_sprite + 1)
            type = SpriteElement
            parent = (the_score + 1)
            texture = score_small
            Scale = (1.2000000476837158, 0.8500000238418579)
            Pos = (-17.0, 23.0)
            rgba = <score_color>
        }
        CreateScreenElement {
            id = (the_special_bar_special + 1)
            type = SpriteElement
            parent = (the_score_sprite + 1)
            texture = special
            Scale = (1.7300000190734863, 0.8700000047683716)
            Pos = (10.0, 34.0)
            just = [ left top ]
            rgba = <special_color>
            z_priority = 5000
        }
        CreateScreenElement {
            id = (the_special_bar_sprite + 1)
            type = SpriteElement
            parent = (the_score_sprite + 1)
            texture = specialbar
            Scale = (1.0, 1.2000000476837158)
            Pos = (9.0, 35.0)
            just = [ left top ]
            rgba = [ 128 128 128 100 ]
        }
        CreateScreenElement {
            id = (the_boardstance_sprite + 1)
            type = SpriteElement
            parent = (the_score_sprite + 1)
            texture = nollie_icon
            Scale = (0.75, 1.2999999523162842)
            just = [ left top ]
            Pos = (123.0, 45.0)
            rot_angle = 90
            rgba = [ 128 128 128 78 ]
        }
        CreateScreenElement {
            id = (generic_sponsor_logo + 1)
            type = SpriteElement
            parent = (the_score_sprite + 1)
            texture = <sponsor_texture>
            Scale = 1
            just = [ left top ]
            Pos = (-28.0, 8.0)
            rgba = [ 128 128 128 108 ]
            z_priority = 3
        }
        CreateScreenElement {
            id = (trick_text_container + 1)
            type = ContainerElement
            parent = player2_panel_container
            Scale = 1.0
            dims = <trick_text_dims>
            just = [ center center ]
            alpha = 0.0
        }
        CreateScreenElement {
            id = (the_trick_text + 1)
            type = TextBlockElement
            parent = (trick_text_container + 1)
            Scale = 1.0
            Pos = { (0.5, 0.0) proportional }
            dims = <trick_text_dims>
            just = [ center top ]
            internal_just = [ center top ]
            font = newtrickfont
            text = ' '
            internal_scale = 0.7000
            alpha = 1.0
            tags = { tag_state = inactive }
            shadow
            shadow_offs = (1.0, 1.0)
            shadow_rgba = [ 30 30 30 75 ]
            z_priority = 0
        }
        CreateScreenElement {
            id = (the_score_pot_text + 1)
            type = TextElement
            parent = (trick_text_container + 1)
            Scale = 1.0
            Pos = <trick_text_pos>
            just = [ center bottom ]
            font = small
            text = ' '
            alpha = 1.0
            z_priority = 0
        }
        reset_trick_text_appearance the_score_pot_text_id = (the_score_pot_text + 1)the_trick_text_id = (the_trick_text + 1)trick_text_container_id = (trick_text_container + 1)
        CreateScreenElement {
            id = (the_balance_meter + 1)
            type = SpriteElement
            parent = player2_panel_container
            texture = balancemeter
            Scale = 1.0
            just = [ center center ]
            rgba = [ 128 128 128 0 ]
            tags = {tag_turned_on = 0 tag_mode = balance}
        }
        CreateScreenElement {
            type = SpriteElement
            parent = (the_balance_meter + 1)
            texture = balancearrow_glow
            Scale = 1.200
            Pos = (0.0, 0.0)
            just = [ center center ]
            rgba = [ 128 128 128 0 ]
        }
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            CreateScreenElement {
                id = (the_run_timer + 1)
                type = SpriteElement
                parent = player2_panel_container
                texture = watch
                Scale = 1.0
                just = [ center center ]
                Pos = (240.0, 240.0)
                alpha = 0
                rgba = [ 128 128 128 90 ]
                tags = {tag_turned_on = 0 tag_mode = balance}
            }
            case split_horizontal
            CreateScreenElement {
                id = (the_run_timer + 1)
                type = SpriteElement
                parent = player2_panel_container
                texture = watch
                Scale = 1.0
                just = [ center center ]
                Pos = (500.0, 120.0)
                alpha = 0
                rgba = [ 128 128 128 90 ]
                tags = {tag_turned_on = 0 tag_mode = balance}
            }
            default 
            CreateScreenElement {
                id = (the_run_timer + 1)
                type = SpriteElement
                parent = player2_panel_container
                texture = watch
                Scale = 1.0
                just = [ center center ]
                Pos = (400.0, 240.0)
                alpha = 0
                rgba = [ 128 128 128 90 ]
                tags = {tag_turned_on = 0 tag_mode = balance}
            }
        endswitch
        CreateScreenElement {
            id = (the_run_timer_hand + 1)
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = Hand
            Scale = 1.0
            Pos = (24.0, 24.0)
            just = [ center center ]
            rgba = [ 128 128 128 128 ]
            z_priority = 5
        }
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_1
            Scale = 1.0
            Pos = (7.0, 8.0)
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_2
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_3
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_4
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_5
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_6
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_7
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
        GetStackedScreenElementPos y id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = (the_run_timer + 1)
            texture = time_8
            Scale = 1.0
            Pos = <Pos>
            just = [ left top ]
            rgba = [ 128 128 128 128 ]
            z_priority = 3
        }
    endif
    if GetGlobalFlag flag = NO_DISPLAY_HUD
        GoalManager_HidePoints
        GoalManager_HideGoalPoints
    else
        update_goal_points_display Create
        update_pager_icon Create
    endif
    if InNetGame
        if IsObserving
            hide_panel_stuff
        endif
        update_pager_icon Create
        create_score_menu
    endif
endscript

newtrickfont_colors = [
    [ 0 128 230 60 ]
    [ 200 90 11 60 ]
    [ 0 128 0 60 ]
    [ 128 0 0 60 ]
    [ 88 105 112 128 ]
]

script UpdateScorepot 
    if GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        DoScreenElementMorph id = the_score_pot_text alpha = 0.0 remember_alpha
        if InSplitScreenGame
            if ScreenElementExists id = (the_score_pot_text + 1)
                DoScreenElementMorph id = (the_score_pot_text + 1)alpha = 0.0 remember_alpha
            endif
        endif
    endif
endscript


script UpdateTrickText 
    if GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        DoScreenElementMorph id = the_trick_text alpha = 0.0 remember_alpha
        SetScreenElementProps id = the_trick_text override_encoded_rgba remember_override_rgba_state
        if InSplitScreenGame
            if ScreenElementExists id = (the_trick_text + 1)
                DoScreenElementMorph id = (the_trick_text + 1)alpha = 0.0 remember_alpha
                SetScreenElementProps id = (the_trick_text + 1)override_encoded_rgba remember_override_rgba_state
            endif
        endif
    endif
endscript


script pause_trick_text 
    SetScreenElementProps id = the_trick_text hide
    if InSplitScreenGame
        if ScreenElementExists id = (the_trick_text + 1)
            SetScreenElementProps id = (the_trick_text + 1)hide
        endif
    endif
    SetScreenElementProps id = the_score_pot_text hide
    if InSplitScreenGame
        if ScreenElementExists id = (the_score_pot_text + 1)
            SetScreenElementProps id = (the_score_pot_text + 1)hide
        endif
    endif
endscript


script unpause_trick_text 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        SetScreenElementProps id = the_trick_text unhide
        if InSplitScreenGame
            if ScreenElementExists id = (the_trick_text + 1)
                SetScreenElementProps id = (the_trick_text + 1)unhide
            endif
        endif
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        SetScreenElementProps id = the_score_pot_text unhide
        if InSplitScreenGame
            if ScreenElementExists id = (the_score_pot_text + 1)
                SetScreenElementProps id = (the_score_pot_text + 1)unhide
            endif
        endif
    endif
endscript


script trick_text_pulse 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        TerminateObjectsScripts id = <trick_text_container_id>
        TerminateObjectsScripts id = <the_trick_text_id>
        RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = { <...>  }
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = do_score_pot_text_landed
        RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = { <...>  }
    endif
endscript

spazz_out_text = '\c4FREAK OUT!\c0'

script do_trick_text_pulse 
    reset_trick_text_appearance <...> 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        GetTextElementString id = <the_trick_text_id>
        if StringEquals a = <string> b = ((spazz_out_text)+ ' ')
            do_trick_text_spazz <...> 
        else
            if InSplitScreenGame
                ScriptGetScreenMode
                if (<screen_mode> = split_vertical)
                    DoMorph Scale = 1.0 time = 0.2000
                    DoMorph Scale = 0.6000 time = 0.3000
                    DoMorph Scale = 0.9500 time = 0.4000
                else
                    DoMorph Scale = 1.200 time = 0.2000
                    DoMorph Scale = 0.9000 time = 0.3000
                    DoMorph Scale = 1.0 time = 0.4000
                endif
            else
                DoMorph Scale = 1.200 time = 0.2000
                DoMorph Scale = 0.9000 time = 0.3000
                DoMorph Scale = 1.0 time = 0.4000
            endif
        endif
    endif
endscript


script do_trick_text_spazz 
    begin 
    rot_angle = 0
    DoMorph Scale = 2.300 time = 0.1000 alpha = 0.7000
    DoMorph Scale = 0.9000 time = 0.1000 alpha = 1
    DoMorph Scale = 1.300 time = 0.1000 alpha = 0.6000
    DoMorph Scale = 1.100 time = 0.1000 alpha = 0.9000
    repeat 
endscript


script trick_text_landed 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        TerminateObjectsScripts id = <trick_text_container_id>
        TerminateObjectsScripts id = <the_trick_text_id>
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        TerminateObjectsScripts id = <the_score_pot_text_id>
    endif
    RunScriptOnScreenElement id = <the_score_pot_text_id> do_score_pot_text_landed params = { <...>  }
    RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_landed params = { <...>  }
endscript


script do_trick_text_landed 
    reset_trick_text_appearance <...> 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        if InSplitScreenGame
            ScriptGetScreenMode
            if (<screen_mode> = split_vertical)
                DoMorph Scale = 0 time = 0
                DoMorph Scale = 1.800 time = 0.2000
                DoMorph Scale = 0.5000 time = 0.08000
                DoMorph Scale = 1.0 time = 0.05000
                DoMorph Scale = 0.8000 time = 0.04000
                DoMorph Scale = 1.0 time = 0.04000
            else
                DoMorph Scale = 0 time = 0
                DoMorph Scale = 1.400 time = 0.2000
                DoMorph Scale = 0.8000 time = 0.08000
                DoMorph Scale = 1.200 time = 0.05000
                DoMorph Scale = 0.9000 time = 0.04000
                DoMorph Scale = 1.0 time = 0.04000
            endif
        else
            DoMorph Scale = 0 time = 0
            DoMorph Scale = 1.400 time = 0.2000
            DoMorph Scale = 0.8000 time = 0.08000
            DoMorph Scale = 1.200 time = 0.05000
            DoMorph Scale = 0.9000 time = 0.04000
            DoMorph Scale = 1.0 time = 0.04000
        endif
    endif
endscript


script do_score_pot_text_landed 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        wait 1 gameframe
        SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 42 80 128 120 ]
        SetScreenElementProps id = <the_score_pot_text_id> override_encoded_rgba
        if InSplitScreenGame
            ScriptGetScreenMode
            if (<screen_mode> = split_vertical)
                DoMorph Scale = 0 time = 0
                DoMorph Scale = 1.300 time = 0.2000
                DoMorph Scale = 0.5000 time = 0.08000
                DoMorph Scale = 1.0 time = 0.05000
                DoMorph Scale = 0.8000 time = 0.04000
                DoMorph Scale = 1.200 time = 0.04000
            else
                DoMorph Scale = 0 time = 0.05000
                DoMorph Scale = 1.800 time = 0.1200
                DoMorph Scale = 0.8000 time = 0.1000
                DoMorph Scale = 1.500 time = 0.07000
                DoMorph Scale = 0.9000 time = 0.07000
                DoMorph Scale = 1.300 time = 0.05000
                DoMorph Scale = 1.0 time = 0.05000
                DoMorph Scale = 1.250 time = 0.04000
                DoMorph Scale = 1.100 time = 0.03000
                DoMorph Scale = 1.200 time = 0.02000
            endif
        else
            DoMorph Scale = 0 time = 0.05000
            DoMorph Scale = 1.800 time = 0.1200
            DoMorph Scale = 0.8000 time = 0.1000
            DoMorph Scale = 1.500 time = 0.07000
            DoMorph Scale = 0.9000 time = 0.07000
            DoMorph Scale = 1.300 time = 0.05000
            DoMorph Scale = 1.0 time = 0.05000
            DoMorph Scale = 1.250 time = 0.04000
            DoMorph Scale = 1.100 time = 0.03000
            DoMorph Scale = 1.200 time = 0.02000
        endif
    endif
endscript


script trick_text_countdown 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        TerminateObjectsScripts id = <trick_text_container_id>
        TerminateObjectsScripts id = <the_trick_text_id>
    endif
    RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_countdown params = { <...>  }
endscript


script do_trick_text_countdown 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        DoMorph Scale = 0.0 time = 0.5000
        DoMorph alpha = 0.0
    endif
endscript


script trick_text_bail 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        TerminateObjectsScripts id = <trick_text_container_id>
        TerminateObjectsScripts id = <the_trick_text_id>
    endif
    RunScriptOnScreenElement id = <trick_text_container_id> do_trick_text_bail params = { <...>  }
endscript


script do_trick_text_bail 
    reset_trick_text_appearance <...> 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 128 32 32 80 ]
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        GetTextElementString id = <the_trick_text_id>
        SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 32 32 80 ] text = <string>
        SetScreenElementProps id = <the_trick_text_id> override_encoded_rgba
    endif
    wait 0.05000 seconds
    if InSplitScreenGame
        ScriptGetScreenMode
        if (<screen_mode> = split_vertical)
            DoMorph alpha = 0 Scale = 0 time = 0
            DoMorph Pos = { (0.0, 25.0) relative }Scale = (0.4000000059604645, 0.699999988079071) alpha = 1 time = 0.05000
            DoMorph Pos = { (0.0, -25.0) relative }Scale = 0.4000 time = 0.1000
            DoMorph Pos = { (0.0, 20.0) relative }Scale = 0.8000 time = 0.06000
            DoMorph Pos = { (0.0, -20.0) relative }Scale = 0.6000 time = 0.06000
            DoMorph Pos = { (0.0, 10.0) relative }Scale = 0.8000 time = 0.05000
        else
            DoMorph alpha = 0 Scale = 0 time = 0
            DoMorph Pos = { (0.0, 25.0) relative }Scale = (0.699999988079071, 1.7999999523162842) alpha = 1 time = 0.05000
            DoMorph Pos = { (0.0, -25.0) relative }Scale = 0.9000 time = 0.1000
            DoMorph Pos = { (0.0, 20.0) relative }Scale = 1.150 time = 0.06000
            DoMorph Pos = { (0.0, -20.0) relative }Scale = 1.120 time = 0.06000
            DoMorph Pos = { (0.0, 10.0) relative }Scale = 1.100 time = 0.05000
        endif
    else
        DoMorph alpha = 0 Scale = 0 time = 0
        DoMorph Pos = { (0.0, 25.0) relative }Scale = (0.699999988079071, 1.7999999523162842) alpha = 1 time = 0.05000
        DoMorph Pos = { (0.0, -25.0) relative }Scale = 0.9000 time = 0.1000
        DoMorph Pos = { (0.0, 20.0) relative }Scale = 1.150 time = 0.06000
        DoMorph Pos = { (0.0, -20.0) relative }Scale = 1.120 time = 0.06000
        DoMorph Pos = { (0.0, 10.0) relative }Scale = 1.100 time = 0.05000
    endif
    DoMorph Pos = { (0.0, -10.0) relative }time = 0.05000
    DoMorph Pos = { (0.0, 5.0) relative }time = 0.04000
    DoMorph Pos = { (0.0, -5.0) relative }time = 0.04000
    wait 1.300 seconds
    DoMorph Pos = { (-2.0, 4.0) relative }time = 0.05000
    DoMorph Pos = { (-3.0, 6.0) relative }time = 0.05000
    DoMorph Pos = { (5.0, 1.0) relative }time = 0.05000
    DoMorph Pos = { (-3.0, -4.0) relative }time = 0.05000
    DoMorph Pos = { (2.0, -5.0) relative }time = 0.05000
    DoMorph Pos = { (4.0, -1.0) relative }time = 0.05000
    DoMorph Pos = { (-3.0, 2.0) relative }time = 0.05000
    DoMorph Pos = { (4.0, -5.0) relative }time = 0.05000
    DoMorph Pos = { (-1.0, 2.0) relative }time = 0.05000
    DoMorph Pos = { (-3.0, -4.0) relative }time = 0.05000
    DoMorph Pos = { (2.0, -4.0) relative }time = 0.05000
    DoMorph Pos = { (3.0, -6.0) relative }time = 0.05000
    DoMorph Pos = { (-5.0, -1.0) relative }time = 0.05000
    DoMorph Pos = { (3.0, 4.0) relative }time = 0.05000
    DoMorph Pos = { (-2.0, 5.0) relative }time = 0.05000
    DoMorph Pos = { (-4.0, 1.0) relative }time = 0.05000
    DoMorph Pos = { (3.0, -2.0) relative }time = 0.05000
    DoMorph Pos = { (-4.0, 5.0) relative }time = 0.05000
    DoMorph Pos = { (1.0, -2.0) relative }time = 0.05000
    DoMorph Pos = { (3.0, 4.0) relative }time = 0.05000
    Random (@ runtwoscripts script_text = bail1 script_score = bail1 <...> 
        @ runtwoscripts script_text = bail1 script_score = bail1 <...> 
        @ runtwoscripts script_text = bail2 script_score = bail3 <...> 
        @ runtwoscripts script_text = bail4 script_score = bail5 <...> 
        @ runtwoscripts script_text = bail5 script_score = bail4 <...> 
        @ runtwoscripts script_text = bail1 script_score = bail6 <...> 
        @ runtwoscripts script_text = bail6 script_score = bail6 <...> 
        @ runtwoscripts script_text = bail4 script_score = bail4 <...> 
        @ runtwoscripts script_text = bail5 script_score = bail5 <...> 
        @ runtwoscripts script_text = bail2 script_score = bail1 <...> 
    )
endscript


script runtwoscripts 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        RunScriptOnScreenElement id = <the_trick_text_id> <script_text>
    endif
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        RunScriptOnScreenElement id = <the_score_pot_text_id> <script_score>
    endif
endscript


script bail1 
    DoMorph Pos = { (0.0, 0.0) relative }time = 0.1000 Scale = 1.900 fast_in
    DoMorph Pos = { (0.0, 0.0) relative }time = 0.3000 Scale = 3.0 alpha = 0 fast_in
    DoMorph Pos = { (0.0, 0.0) relative }Scale = 1.0 alpha = 0 fast_in
endscript


script bail2 
    DoMorph Pos = { (0.0, -5.0) relative }time = 0.4000
    DoMorph Pos = { (0.0, 448.0) relative }time = 0.7000 fast_in
    DoMorph alpha = 0.0
    DoMorph Pos = { (0.0, -443.0) relative }Scale = 1.0 alpha = 0 fast_in
endscript


script bail3 
    wait 0.1000 second
    DoMorph Pos = { (0.0, -5.0) relative }time = 0.2000
    DoMorph Pos = { (3.0, 0.0) relative }time = 0.05000
    DoMorph Pos = { (-3.0, 0.0) relative }time = 0.05000
    DoMorph Pos = { (4.0, 0.0) relative }time = 0.05000
    DoMorph Pos = { (-4.0, 0.0) relative }time = 0.05000
    DoMorph Pos = { (0.0, 448.0) relative }time = 0.5000 fast_in
    DoMorph alpha = 0.0
    DoMorph Pos = { (0.0, -443.0) relative }Scale = 1.0 alpha = 0 fast_in
endscript


script bail4 
    DoMorph Pos = { (-15.0, 0.0) relative }time = 0.1000
    DoMorph Pos = { (0.0, 4.0) relative }time = 0.02000
    DoMorph Pos = { (0.0, -4.0) relative }time = 0.02000
    DoMorph Pos = { (0.0, 2.0) relative }time = 0.02000
    DoMorph Pos = { (0.0, -2.0) relative }time = 0.02000
    DoMorph Pos = { (150.0, 0.0) relative }time = 0.06000 alpha = 0.7000
    DoMorph Pos = { (200.0, 0.0) relative }Scale = (2.0, 0.10000000149011612) time = 0.06000 alpha = 0 fast_in
    DoMorph Pos = { (200.0, 0.0) relative }time = 0
    DoMorph Pos = { (-535.0, 0.0) relative }Scale = 1.0 alpha = 0 fast_in
endscript


script bail5 
    DoMorph Pos = { (15.0, 0.0) relative }time = 0.1000
    DoMorph Pos = { (0.0, 4.0) relative }time = 0.02000
    DoMorph Pos = { (0.0, -4.0) relative }time = 0.02000
    DoMorph Pos = { (0.0, 2.0) relative }time = 0.02000
    DoMorph Pos = { (0.0, -2.0) relative }time = 0.02000
    DoMorph Pos = { (-150.0, 0.0) relative }time = 0.06000 alpha = 0.7000
    DoMorph Pos = { (-200.0, 0.0) relative }Scale = (2.0, 0.10000000149011612) time = 0.06000 alpha = 0 fast_in
    DoMorph Pos = { (-200.0, 0.0) relative }time = 0
    DoMorph Pos = { (535.0, 0.0) relative }Scale = 1.0 alpha = 0 fast_in
endscript


script bail6 
    DoMorph Pos = { (0.0, 0.0) relative }time = 0.2000 Scale = 1.300 alpha = 0.6000 fast_in
    wait 0.2000 second
    DoMorph Pos = { (0.0, 0.0) relative }time = 0.1500 Scale = 0 alpha = 0 fast_in
endscript


script reset_just_trick_text_appearance 
    if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
        if InSplitScreenGame
            if GameModeEquals is_horse
                trick_text_pos = (320.0, 410.0)
                text_scale = 1.0
            else
                ScriptGetScreenMode
                switch <screen_mode>
                    case split_vertical
                    case one_camera
                    trick_text_pos = (142.0, 410.0)
                    text_scale = 0.9500
                    case split_horizontal
                    trick_text_pos = (320.0, 200.0)
                    text_scale = 1.0
                endswitch
            endif
            DoScreenElementMorph {
                id = <trick_text_container_id>
                alpha = 1.0
                Pos = <trick_text_pos>
                just = [ center top ]
                Scale = <text_scale>
            }
            DoScreenElementMorph {
                id = <the_trick_text_id>
                Scale = <text_scale>
                Pos = { (0.5, 0.0) proportional }
                just = [ center top ]
                internal_just = [ center top ]
                internal_scale = 0.7000
                alpha = 1.0
            }
            SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba
            SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 128 128 80 ]
        else
            DoScreenElementMorph {
                id = <trick_text_container_id>
                alpha = 1.0
                Pos = (320.0, 410.0)
                Scale = 1.0
            }
            DoScreenElementMorph {
                id = <the_trick_text_id>
                Scale = 1.0
                Pos = { (0.5, 0.0) proportional }
                just = [ center top ]
                internal_just = [ center top ]
                internal_scale = 0.7000
                alpha = 1.0
            }
            SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba
            SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 128 128 80 ]
        endif
    else
        if InSplitScreenGame
            if GameModeEquals is_horse
                trick_text_pos = (320.0, 410.0)
                text_scale = 1.0
            else
                ScriptGetScreenMode
                switch <screen_mode>
                    case split_vertical
                    case one_camera
                    trick_text_pos = (142.0, 410.0)
                    text_scale = 0.9500
                    case split_horizontal
                    trick_text_pos = (320.0, 200.0)
                    text_scale = 1.0
                endswitch
            endif
            DoScreenElementMorph {
                id = <trick_text_container_id>
                alpha = 1.0
                Pos = <trick_text_pos>
                just = [ center top ]
                Scale = <text_scale>
            }
        else
            DoScreenElementMorph {
                id = <trick_text_container_id>
                alpha = 1.0
                Pos = (320.0, 410.0)
                Scale = 1.0
            }
        endif
    endif
endscript


script reset_trick_text_appearance 
    TerminateObjectsScripts id = <the_trick_text_id> script_name = bail1
    TerminateObjectsScripts id = <the_trick_text_id> script_name = bail2
    TerminateObjectsScripts id = <the_trick_text_id> script_name = bail3
    TerminateObjectsScripts id = <the_trick_text_id> script_name = bail4
    TerminateObjectsScripts id = <the_trick_text_id> script_name = bail5
    TerminateObjectsScripts id = <the_trick_text_id> script_name = bail6
    TerminateObjectsScripts id = <the_trick_text_id> script_name = do_trick_text_spazz
    reset_just_trick_text_appearance <...> 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail1
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail2
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail3
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail4
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail5
        TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail6
        SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 127 102 0 85 ]
        SetScreenElementProps id = <the_score_pot_text_id> dont_override_encoded_rgba
        if InSplitScreenGame
            if GameModeEquals is_horse
                DoScreenElementMorph {
                    id = <the_score_pot_text_id>
                    Scale = 1.0
                    Pos = (287.0, 2.0)
                    just = [ center bottom ]
                    alpha = 1.0
                }
            else
                ScriptGetScreenMode
                switch <screen_mode>
                    case split_vertical
                    case one_camera
                    DoScreenElementMorph {
                        id = <the_score_pot_text_id>
                        Scale = 1.0
                        Pos = (120.0, 2.0)
                        just = [ center bottom ]
                        alpha = 1.0
                    }
                    case split_horizontal
                    DoScreenElementMorph {
                        id = <the_score_pot_text_id>
                        Scale = 1.0
                        Pos = (287.0, 2.0)
                        just = [ center bottom ]
                        alpha = 1.0
                    }
                endswitch
            endif
        else
            DoScreenElementMorph {
                id = <the_score_pot_text_id>
                Scale = 1.0
                Pos = (287.0, 2.0)
                just = [ center bottom ]
                alpha = 1.0
            }
        endif
    endif
endscript


script HideClock 
    KillSpawnedScript name = clock_morph
    DoScreenElementMorph {id = the_time alpha = 0}
endscript


script ShowClock 
    DoScreenElementMorph {id = the_time alpha = 1}
endscript


script hide_balance_meter 
    SetScreenElementProps id = <id> tags = { tag_turned_on = 0 }
    RunScriptOnScreenElement id = <id> do_hide_balance_meter params = { id = <id> }
endscript


script pause_balance_meter 
    RunScriptOnScreenElement id = the_balance_meter do_hide_balance_meter params = { id = the_balance_meter }
    if InSplitScreenGame
        RunScriptOnScreenElement id = (the_balance_meter + 1)do_hide_balance_meter params = {id = (the_balance_meter + 1)}
    endif
endscript


script do_hide_balance_meter 
    SetScreenElementProps id = <id> rgba = [ 128 128 128 0 ]
    SetScreenElementProps id = {<id> child = 0}rgba = [ 128 128 128 0 ]
endscript


script show_balance_meter 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE
        if NOT ((InNetGame)& (GetGlobalFlag flag = no_g_display_balance))
            SetScreenElementProps id = <id> tags = { tag_turned_on = 1 }
            RunScriptOnScreenElement id = <id> do_show_balance_meter params = { id = <id> }
        endif
    endif
endscript


script Unpause_Balance_Meter 
    RunScriptOnScreenElement id = the_balance_meter do_show_balance_meter params = { id = the_balance_meter }
    if InSplitScreenGame
        RunScriptOnScreenElement id = (the_balance_meter + 1)do_show_balance_meter params = {id = (the_balance_meter + 1)}
    endif
endscript


script do_show_balance_meter 
    if NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE
        if NOT ((InNetGame)& (GetGlobalFlag flag = no_g_display_balance))
            gettags
            Theme_GetBalanceMeterColor return_value = balance_meter_color
            Theme_GetBalanceArrowColor return_value = balance_arrow_color
            if IntegerEquals a = <tag_turned_on> b = 1
                SetScreenElementProps id = <id> rgba = <balance_meter_color>
                SetScreenElementProps id = {<id> child = 0}rgba = <balance_arrow_color>
            endif
        endif
    endif
endscript


script hide_run_timer 
    if ObjectExists id = <id>
        SetScreenElementProps id = <id> tags = { tag_turned_on = 0 }
        RunScriptOnScreenElement id = <id> do_hide_run_timer params = { id = <id> }
    endif
endscript


script pause_run_timer 
    RunScriptOnScreenElement id = the_run_timer do_hide_run_timer params = { id = the_run_timer }
    if ScreenElementExists id = (the_run_timer + 1)
        RunScriptOnScreenElement id = (the_run_timer + 1)do_hide_run_timer params = {id = (the_run_timer + 1)}
    endif
endscript


script do_hide_run_timer 
    DoScreenElementMorph id = <id> alpha = 0
endscript


script show_run_timer 
    GetScreenElementPosition id = <id>
    SetScreenElementProps id = <id> tags = { tag_turned_on = 1 }
    RunScriptOnScreenElement id = <id> do_show_run_timer params = { id = <id> }
    DoScreenElementMorph id = {<id> child = 1}alpha = 0
    DoScreenElementMorph id = {<id> child = 2}alpha = 0
    DoScreenElementMorph id = {<id> child = 3}alpha = 0
    DoScreenElementMorph id = {<id> child = 4}alpha = 0
    DoScreenElementMorph id = {<id> child = 5}alpha = 0
    DoScreenElementMorph id = {<id> child = 6}alpha = 0
    DoScreenElementMorph id = {<id> child = 7}alpha = 0
    DoScreenElementMorph id = {<id> child = 8}alpha = 0
    if (<rot_angle> > 320)
        DoScreenElementMorph id = {<id> child = 1}alpha = 1
    endif
    if (<rot_angle> > 280)
        DoScreenElementMorph id = {<id> child = 2}alpha = 1
    endif
    if (<rot_angle> > 240)
        DoScreenElementMorph id = {<id> child = 3}alpha = 1
    endif
    if (<rot_angle> > 200)
        DoScreenElementMorph id = {<id> child = 4}alpha = 1
    endif
    if (<rot_angle> > 160)
        DoScreenElementMorph id = {<id> child = 5}alpha = 1
    endif
    if (<rot_angle> > 120)
        DoScreenElementMorph id = {<id> child = 6}alpha = 1
    endif
    if (<rot_angle> > 80)
        DoScreenElementMorph id = {<id> child = 7}alpha = 1
    endif
    if (<rot_angle> > 40)
        DoScreenElementMorph id = {<id> child = 8}alpha = 1
    endif
endscript


script soft_hide_run_timer 
    SetScreenElementProps id = <id> tags = { tag_turned_on = 0 }
    RunScriptOnScreenElement id = <id> do_soft_hide_run_timer params = { id = <id> }
endscript


script do_soft_hide_run_timer 
    DoScreenElementMorph id = <id> alpha = 0 time = 0.3000
endscript


script unpause_run_timer 
    RunScriptOnScreenElement id = the_run_timer do_show_run_timer params = { id = the_run_timer }
    if InSplitScreenGame
        RunScriptOnScreenElement id = (the_run_timer + 1)do_show_run_timer params = {id = (the_run_timer + 1)}
    endif
endscript


script do_show_run_timer 
    gettags
    if IntegerEquals a = <tag_turned_on> b = 1
        DoScreenElementMorph id = <id> alpha = 1
    endif
endscript


script hide_run_timer_piece 
    if (320 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 1}alpha = 0
    endif
    if (280 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 2}alpha = 0
    endif
    if (240 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 3}alpha = 0
    endif
    if (200 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 4}alpha = 0
    endif
    if (160 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 5}alpha = 0
    endif
    if (120 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 6}alpha = 0
    endif
    if (80 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 7}alpha = 0
    endif
    if (40 > <rot_angle>)
        DoScreenElementMorph id = {<id> child = 8}alpha = 0
    endif
endscript


script blink_run_timer 
    begin 
    DoScreenElementMorph id = <id> alpha = 0.3000 time = 0.05000
    wait 5 gameframes
    DoScreenElementMorph id = <id> alpha = 1 time = 0.05000
    wait 5 gameframes
    repeat 
endscript


script update_goal_points_display 
    if NOT GameModeEquals is_career
        return 
    endif
    Pos = (0.0, 80.0)
    GoalManager_GetActiveRewardPoints
    if GotParam Create
        if ScreenElementExists id = goal_points_display
            return 
        endif
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = goal_points_display
            Pos = <Pos>
        }
        CreateScreenElement {
            type = SpriteElement
            parent = goal_points_display
            local_id = bar
            texture = roundbar_middle
            Pos = (0.0, -1.0)
            just = [ left center ]
            Scale = (5.5, 0.6000000238418579)
            rgba = [ 0 0 0 110 ]
            z_priority = 1
        }
        CreateScreenElement {
            type = SpriteElement
            parent = goal_points_display
            local_id = edge
            texture = roundbar_tip_right
            Pos = (170.0, -1.0)
            just = [ left center ]
            Scale = 0.6000
            rgba = [ 0 0 0 110 ]
            z_priority = 1
        }
        CreateScreenElement {
            type = TextElement
            parent = goal_points_display
            local_id = points
            text = ' '
            font = small
            Pos = (185.0, 0.0)
            just = [ RIGHT center ]
            Scale = (0.800000011920929, 0.8500000238418579)
            rgba = [ 128 128 128 128 ]
            z_priority = 2
        }
        need_text = 1
    endif
    if GotParam Kill
        DestroyScreenElement id = goal_points_display
    endif
    if NOT ScreenElementExists id = goal_points_display
        return 
    endif
    if GotParam show
        DoScreenElementMorph id = goal_points_display alpha = 1 time = 0
    endif
    if GotParam hide
        DoScreenElementMorph id = goal_points_display alpha = 0 time = 0
    endif
    if GotParam need_text
        FormatText textname = points '%a / %b GOAL PTS.' a = <active_points> b = <total_points>
        SetScreenElementProps id = { goal_points_display child = points }text = <points>
    endif
    if GotParam refresh
        if goal_points_display ::getsingletag animating_off
            return 
        endif
        SpawnScript update_goal_points_display_slide_wait params = <...> 
    endif
endscript


script update_goal_points_display_slide_wait 
    goal_points_display ::settags animating_off
    DoScreenElementMorph id = goal_points_display Pos = (<Pos> + (-300.0, 0.0))time = 0.2000
    wait 0.3000 seconds
    update_goal_points_display need_text
    goal_points_display ::removetags tags = [ animating_off ]
    if (<total_points> > 0)
        DoScreenElementMorph id = goal_points_display Pos = <Pos> time = 0.2000
    endif
endscript

