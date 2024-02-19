
script launch_gap_menu 
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    create_gap_menu <...> 
endscript

script create_gap_menu back_script = gap_menu_exit_to_pause_menu choose_script = NullScript
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    hide_current_goal
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = gap_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = gap_anchor alias = current_menu_anchor
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Select' }
            { text = '\m1 = Back' }
        ]
    }
    kill_start_key_binding
    build_theme_sub_title Title = 'GAP CHECKLIST'
    CreateScreenElement {
        type = ContainerElement
        parent = gap_anchor
        id = gap_menu
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = gap_menu alias = current_menu_anchor
    theme_background width = 6.350 Pos = (320.0, 85.0) num_parts = 10.50 bg_rgba = [ 30 30 35 48 ]
    <root_pos> = (80.0, 25.0)
    Theme_GetHighlightedTextColor return_value = text_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_gaps_menu_top_bar
        texture = black
        rgba = [ 0 0 0 85 ]
        Scale = (130.0, 7.0)
        Pos = (65.0, 87.0)
        just = [ left top ]
        z_priority = 2
    }
    GetStackedScreenElementPos y id = <id> Offset = (6.0, -25.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Score'
        rgba = <text_rgba>
        Scale = 1
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (15.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Name'
        rgba = <text_rgba>
        Pos = <Pos>
        just = [ left top ]
        Scale = 1
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (115.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_gaps_menu_up_arrow
        texture = up_arrow
        rgba = [ 128 128 128 85 ]
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (168.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Times'
        rgba = <text_rgba>
        Pos = <Pos>
        just = [ left top ]
        Scale = 1
        z_priority = 3
    }
    GetStackedScreenElementPos y id = view_gaps_menu_top_bar Offset = (60.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 68.0)
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 0 0 0 0 ]
    }
    GetStackedScreenElementPos x id = <id> Offset = (355.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 68.0)
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 0 0 0 0 ]
    }
    GetStackedScreenElementPos y id = view_gaps_menu_top_bar Offset = (0.0, 250.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        rgba = [ 0 0 0 0 ]
        Scale = (124.0, 6.0)
        Pos = <Pos>
        just = [ left top ]
        z_priority = 2
    }
    GetStackedScreenElementPos y id = view_gaps_menu_up_arrow Offset = (0.0, 260.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_gaps_menu_down_arrow
        texture = down_arrow
        rgba = [ 128 128 128 85 ]
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = view_gaps_menu_top_bar Offset = (20.0, 5.0)
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        dims = (640.0, 245.0)
        Pos = <Pos>
        just = [ left top ]
        internal_just = [ center top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = <id>
        id = gap_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        dont_allow_wrap
        event_handlers = [
            {pad_up set_which_arrow params = { arrow = view_gaps_menu_up_arrow }}
            {pad_down set_which_arrow params = { arrow = view_gaps_menu_down_arrow }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_back generic_menu_pad_back_sound }
        ]
    }
    AssignAlias id = gap_vmenu alias = current_menu
    SetScreenElementProps {
        id = current_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = <back_script> }}]
    }
    AddGapsToMenu initial_scale = 0.8000 choose_script = <choose_script>
    generic_menu_animate_in force Pos = (320.0, 240.0)
    FireEvent type = focus target = current_menu
endscript

script gap_menu_add_item choose_script = NullScript
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    Theme_GetUnhighlightedTextColor return_value = text_rgba2
    if GotParam first_item
        focus_params = { first_item }
    else
        if GotParam last_item
            focus_params = { last_item }
        endif
    endif
    if IsNGC
        heap = TopDown
    else
        heap = frontend
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (200.0, 20.0)
        event_handlers = [{focus gap_menu_focus params = {<focus_params> times = <times>}}
            {unfocus gap_menu_unfocus params = { times = <times> }}
            {focus gap_menu_focus_show_gap params = <...> }
            {pad_choose <choose_script> params = {gap_number = <gap_number> times = <times>}}
        ]
        heap = <heap>
    }
    <anchor_id> = <id>
    if (<times> > 0)
        rgba = <text_rgba>
        alpha = 1.0
    else
        rgba = <text_rgba>
        alpha = 0.4000
    endif
    FormatText textname = gap_score '%i' i = <gap_score>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = small
        text = <gap_score>
        Pos = (13.0, 0.0)
        just = [ center top ]
        rgba = <rgba>
        alpha = <alpha>
        Scale = 0.8000
        heap = <heap>
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = small
        text = <gap_name>
        Pos = (55.0, 0.0)
        just = [ left top ]
        rgba = <rgba>
        alpha = <alpha>
        Scale = 0.8000
        heap = <heap>
    }
    if (<times> > 99999)
        <times> = 99999
    endif
    FormatText textname = times '%i' i = <times>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = small
        text = <times>
        Pos = (444.0, 0.0)
        just = [ center top ]
        rgba = <rgba>
        alpha = <alpha>
        Scale = 0.8000
        heap = <heap>
    }
    highlight_angle = 0
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Pos = (232.0, 10.0)
        just = [ center center ]
        rgba = [ 0 0 0 0 ]
        z_priority = 3
        Scale = (4.099999904632568, 0.699999988079071)
        rot_angle = (<highlight_angle> / 4)
        heap = <heap>
    }
    SetScreenElementLock id = current_menu on
    SetScreenElementLock id = current_menu Off
endscript

script gap_menu_focus_show_gap 
    gap_menu_exit_cam
    if (<times> > 0)
        dir_x = (<skater_start_dir>.(-1.0, 0.0, 0.0))
        dir_y = 0.1000
        dir_z = (<skater_start_dir>.(0.0, 0.0, -1.0))
        GetSkaterCam
        <skatercam> ::gethfov
        PlayIGCCam {
            name = gap_cam
            interrupt_current
            using_camera_coordinates
            Pos = (<skater_start_pos> + (0.0, 80.0, 0.0))
            facing = (<dir_x> * (1.0, 0.0, 0.0) + <dir_y> * (0.0, 1.0, 0.0) + <dir_z> * (0.0, 0.0, 1.0))
            FOV = <hfov>
            frames = 1
        }
    endif
endscript

script gap_menu_exit_cam 
    KillSkaterCamAnim \{ name = gap_cam }
endscript

script gap_menu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = text_rgba
    if (<times> > 0)
        rgba = <text_rgba>
    else
        rgba = <text_rgba>
    endif
    RunScriptOnScreenElement id = {<id> child = 0}text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <rgba>
        Scale = 1.0
    }
    RunScriptOnScreenElement id = {<id> child = 1}text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 1}
        rgba = <rgba>
        Scale = 1.0
    }
    RunScriptOnScreenElement id = {<id> child = 2}text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 2}
        rgba = <rgba>
        Scale = 1.0
    }
    Theme_GetHighlightBarColor return_value = bar_rgba
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = <bar_rgba>
    }
    if GotParam first_item
        SetScreenElementProps {
            id = view_gaps_menu_up_arrow
            rgba = [ 128 128 128 0 ]
        }
    else
        SetScreenElementProps {
            id = view_gaps_menu_up_arrow
            rgba = [ 128 128 128 85 ]
        }
    endif
    if GotParam last_item
        SetScreenElementProps {
            id = view_gaps_menu_down_arrow
            rgba = [ 128 128 128 0 ]
        }
    else
        SetScreenElementProps {
            id = view_gaps_menu_down_arrow
            rgba = [ 128 128 128 85 ]
        }
    endif
    gap_vmenu ::gettags
    if GotParam arrow_id
        menu_vert_blink_arrow { id = <arrow_id> }
    endif
endscript

script gap_menu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    KillSpawnedScript name = text_twitch_effect2
    if (<times> > 0)
        rgba = <text_rgba>
    else
        rgba = <text_rgba>
    endif
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <rgba>
        Scale = 0.8000
    }
    DoScreenElementMorph {
        id = {<id> child = 1}
        rgba = <rgba>
        Scale = 0.8000
    }
    DoScreenElementMorph {
        id = {<id> child = 2}
        rgba = <rgba>
        Scale = 0.8000
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = [ 0 0 0 0 ]
    }
endscript

script gap_menu_exit_to_pause_menu 
    gap_menu_exit_cam
    restore_start_key_binding
    AssignAlias \{ id = gap_anchor alias = current_menu_anchor }
    if CustomParkMode \{ testing }
        create_pause_menu
    else
        create_your_options_menu
    endif
endscript

script got_gap_for_first_time 
    if InMultiPlayerGame
        return 
    endif
    if ((igc_playing)= 1)
        return 
    endif
    printf <gap_text>
    if GotParam multiple_new_gaps
        FormatText textname = text 'Found Gaps:'
        SetScreenElementProps id = first_time_goal_info_title text = <text>
        if (<multiple_new_gaps> < 9)
            CreateScreenElement {
                type = TextElement
                parent = first_time_goal_info
                font = small
                text = <gap_text>
                Pos = ((0.0, 20.0) * <multiple_new_gaps>)
                just = [ left top ]
                line_spacing = 0.8000
                rgba = [ 20 98 114 108 ]
                shadow
                shadow_rgba = UI_text_shadow_color
                shadow_offs = UI_text_shadow_offset
                allow_expansion
                z_priority = -5
            }
        else
            if (<multiple_new_gaps> = 9)
                CreateScreenElement {
                    type = TextElement
                    parent = first_time_goal_info
                    font = small
                    text = '...'
                    Pos = ((0.0, 20.0) * <multiple_new_gaps>)
                    just = [ left top ]
                    line_spacing = 0.8000
                    rgba = [ 20 98 114 108 ]
                    shadow
                    shadow_rgba = UI_text_shadow_color
                    shadow_offs = UI_text_shadow_offset
                    allow_expansion
                    z_priority = -5
                }
            endif
        endif
    else
        SetScreenElementLock id = root_window Off
        if ObjectExists id = first_time_goal_info
            DestroyScreenElement id = first_time_goal_info
        else
            SpawnSound found_gap_success_sound
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = first_time_goal_info
            Pos = (25.0, 90.0)
            just = [ left top ]
        }
        CreateScreenElement {
            type = TextElement
            parent = first_time_goal_info
            id = first_time_goal_info_title
            font = small
            text = 'FOUND GAPS:'
            Pos = (0.0, 0.0)
            just = [ left top ]
            line_spacing = 0.8000
            rgba = [ 20 98 114 108 ]
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            allow_expansion
            z_priority = -5
        }
        CreateScreenElement {
            type = TextElement
            parent = first_time_goal_info
            font = small
            text = <gap_text>
            Pos = (0.0, 20.0)
            just = [ left top ]
            line_spacing = 0.8000
            rgba = [ 20 98 114 108 ]
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            allow_expansion
            z_priority = -5
        }
        RunScriptOnScreenElement id = first_time_goal_info goal_message_got_gap params = <...> 
    endif
endscript
