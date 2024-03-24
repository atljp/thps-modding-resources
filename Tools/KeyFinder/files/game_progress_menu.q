

script game_progress_menu_create 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    if NOT LevelIs load_mainmenu
        PauseMusicAndStreams 1
    else
        skater ::remove_skater_from_world
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = progress_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = progress_anchor alias = current_menu_anchor
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4 = Select' }
            { text = '\bn = Back' }
        ]
    }
    kill_start_key_binding
    build_theme_sub_title Title = 'GAME PROGRESS' no_grad_bar
    if LevelIs load_mainmenu
        build_top_and_bottom_blocks
        make_mainmenu_3d_plane
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = progress_anchor
        id = progress_menu
        dims = (640.0, 480.0)
        Pos = (320.0, 640.0)
    }
    AssignAlias id = progress_menu alias = current_menu_anchor
    theme_background width = 6.350 Pos = (320.0, 85.0) num_parts = 10.50
    <root_pos> = (80.0, 25.0)
    Theme_GetHighlightedTextColor return_value = text_rgba
    Theme_GetIconOnColor return_value = icon_color
    GetStackedScreenElementPos x id = <id> Offset = (115.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_progress_menu_up_arrow
        texture = up_arrow
        rgba = [ 128 128 128 85 ]
        Pos = (210.0, 90.0)
        just = [ left top ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 75.0)
        Pos = (380.0, 90.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
    }
    GetStackedScreenElementPos y id = view_progress_menu_up_arrow Offset = (0.0, 260.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_progress_menu_down_arrow
        texture = down_arrow
        rgba = [ 128 128 128 85 ]
        Pos = (<Pos>)
        just = [ left top ]
        z_priority = 3
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        id = vs1
        dims = (640.0, 245.0)
        Pos = (54.0, 110.0)
        just = [ left top ]
        internal_just = [ center top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = <id>
        id = progress_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        dont_allow_wrap
        event_handlers = [
            {pad_up menu_vert_blink_arrow params = {id = view_progress_menu_up_arrow rgba = [ 128 128 128 85 ]}}
            {pad_down menu_vert_blink_arrow params = {id = view_progress_menu_down_arrow rgba = [ 128 128 128 85 ]}}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
    }
    AssignAlias id = progress_vmenu alias = current_menu
    SetScreenElementProps {
        id = current_menu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = game_progress_menu_exit }}]
    }
    GetCareerLevelScore get_total
    FormatText textname = goal_points '%i / %j' i = <total_score> j = <total_score_potential>
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' STORY MODE POINTS:' right_col_text = <goal_points>
    GetClassicLevelGoalCount get_total
    FormatText textname = goal_points '%i / %j' i = <total_goals_complete> j = <total_goals_possible>
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' CLASSIC MODE GOALS COMPLETE:' right_col_text = <goal_points>
    progress_menu_add_item id1 = progress_vmenu seperator
    GetCompletionStatusText mode = GAME_COMPLETED_BEGINNER
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' EASY STORY MODE:' right_col_text = <completion_status>
    GetCompletionStatusText mode = GAME_COMPLETED_NORMAL
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' NORMAL STORY MODE:' right_col_text = <completion_status>
    GetCompletionStatusText mode = GAME_COMPLETED_SICK
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' SICK STORY MODE:' right_col_text = <completion_status>
    GetCompletionStatusText mode = GAME_COMPLETED_CLASSIC_NORMAL
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' NORMAL CLASSIC MODE:' right_col_text = <completion_status>
    GetCompletionStatusText mode = GAME_COMPLETED_CLASSIC_SICK
    progress_menu_add_item id1 = progress_vmenu left_col_text = ' SICK CLASSIC MODE:' right_col_text = <completion_status>
    progress_menu_add_item id1 = progress_vmenu seperator
    GetArraySize level_select_menu_level_info
    <index> = 0
    begin 
    if NOT (((level_select_menu_level_info [ <index> ]).level)= load_sk5ed_gameplay)
        if NOT (((level_select_menu_level_info [ <index> ]).level)= Load_TestLevel)
            if NOT (((level_select_menu_level_info [ <index> ]).level)= load_default)
                if NOT StructureContains structure = ((level_select_menu_level_info [ <index> ]))DEVKIT_ONLY
                    <level_num> = ((level_select_menu_level_info [ <index> ]).level_num)
                    GetLevelGapTotals level = <level_num>
                    if (<num_gaps> = 0)
                        <gaps_text> = '0 / ??'
                    else
                        FormatText textname = gaps_text '%i / %j' i = <num_collected_gaps> j = <num_gaps>
                    endif
                    if (All_Levels_Unlocked = 1)
                        show_name = 1
                    else
                        show_name = 0
                        if StructureContains structure = (level_select_menu_level_info [ <index> ])seen_flag
                            if GetGlobalFlag flag = ((level_select_menu_level_info [ <index> ]).seen_flag)
                                show_name = 1
                            endif
                        endif
                    endif
                    if (<show_name> = 1)
                        FormatText textname = level_text ' %s GAPS:' s = ((level_select_menu_level_info [ <index> ]).text)
                    else
                        FormatText textname = level_text ' %s GAPS:' s = '??????'
                    endif
                    progress_menu_add_item id1 = progress_vmenu left_col_text = <level_text> right_col_text = <gaps_text>
                endif
            endif
        endif
    endif
    <index> = (<index> + 1)
    repeat (<array_size>)
    if LevelIs load_mainmenu
        DoScreenElementMorph id = current_menu_anchor Pos = (320.0, 218.0) time = 0.2000
    else
        DoScreenElementMorph id = current_menu_anchor Pos = (320.0, 240.0) time = 0.2000
    endif
    DoScreenElementMorph id = progress_vmenu time = 0.2000 Pos = (0.0, -200.0)
    FireEvent type = focus target = current_menu
endscript


script GetCompletionStatus 
    if (GetGlobalFlag flag = <mode>)
        <completion_status> = 1
    else
        <completion_status> = 0
    endif
    return completion_status = <completion_status>
endscript


script GetCompletionStatusText 
    if (GetGlobalFlag flag = <mode>)
        <completion_status> = 'COMPLETE!'
    else
        <completion_status> = 'NOT FINISHED'
    endif
    return completion_status = <completion_status>
endscript


script progress_menu_add_item choose_script = NullScript left_col_text = '' right_col_text = ''
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightedTextColor return_value = on_rgba
    <anchor_id1> = <id1>
    if GotParam seperator
        CreateScreenElement {
            type = ContainerElement
            parent = <id1>
            Pos = (65.0, 10.0)
            dims = (200.0, 20.0)
            not_focusable
        }
        <anchor_id1> = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id1>
            texture = black
            Scale = (132.0, 3.299999952316284)
            Pos = (4.0, 0.0)
            just = [ left top ]
            rgba = [ 0 0 0 90 ]
            not_focusable
        }
    else
        if GotParam check_box
            Theme_GetUnhighlightedTextColor return_value = check_rgba
            Theme_GetHighlightedTextColor return_value = checkmark_rgba
            CreateScreenElement {
                type = ContainerElement
                parent = <id1>
                Pos = (65.0, 10.0)
                dims = (200.0, 25.0)
                event_handlers = [
                    {focus progress_menu_focus params = { checkbox_item = checkbox_item }}
                    {unfocus progress_menu_unfocus params = { checkbox_item = checkbox_item }}
                ]
            }
            <anchor_id1> = <id>
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id1>
                font = small
                text = <left_col_text>
                Pos = (10.0, 0.0)
                just = [ left top ]
                rgba = <off_rgba>
                Scale = 1.0
            }
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id1>
                texture = checkbox
                Pos = ((420.0, 0.0) + (0.0, 5.0))
                just = [ center top ]
                Scale = 0.5500
                rgba = <check_rgba>
                z_priority = 5
            }
            if (<check_box> = 1)
                CreateScreenElement {
                    type = SpriteElement
                    parent = <id>
                    texture = checkmark
                    Pos = (25.0, -7.0)
                    just = [ center top ]
                    rgba = <checkmark_rgba>
                    z_priority = 6
                    Scale = 1.400
                }
            else
                CreateScreenElement {
                    type = SpriteElement
                    parent = <id>
                    texture = checkmark
                    Pos = (25.0, -7.0)
                    just = [ center top ]
                    rgba = [ 0 0 0 0 ]
                    z_priority = 6
                    Scale = 1.400
                }
            endif
            highlight_angle = 0
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id1>
                texture = DE_highlight_bar
                Pos = (262.0, 10.0)
                just = [ center center ]
                rgba = [ 0 0 0 0 ]
                z_priority = 3
                Scale = (4.099999904632568, 0.699999988079071)
                rot_angle = (<highlight_angle> / 4)
            }
        else
            CreateScreenElement {
                type = ContainerElement
                parent = <id1>
                Pos = (65.0, 10.0)
                dims = (200.0, 25.0)
                event_handlers = [
                    { focus progress_menu_focus }
                    { unfocus progress_menu_unfocus }
                ]
            }
            <anchor_id1> = <id>
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id1>
                font = small
                text = <left_col_text>
                Pos = (10.0, 0.0)
                just = [ left top ]
                rgba = <off_rgba>
                Scale = 1.0
            }
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id1>
                font = small
                text = <right_col_text>
                Pos = (420.0, 0.0)
                just = [ center top ]
                rgba = <off_rgba>
                Scale = 1.0
            }
            highlight_angle = 0
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id1>
                texture = DE_highlight_bar
                Pos = (262.0, 10.0)
                just = [ center center ]
                rgba = [ 0 0 0 0 ]
                z_priority = 3
                Scale = (4.099999904632568, 0.699999988079071)
                rot_angle = (<highlight_angle> / 4)
            }
        endif
    endif
endscript


script progress_menu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = text_rgba
    RunScriptOnScreenElement id = {<id> child = 0}text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if GotParam checkbox_item
        Theme_GetHighlightBarColor return_value = bar_rgba
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = <bar_rgba>
        }
    else
        RunScriptOnScreenElement id = {<id> child = 1}text_twitch_effect2
        DoScreenElementMorph {
            id = {<id> child = 1}
            rgba = <text_rgba>
        }
        Theme_GetHighlightBarColor return_value = bar_rgba
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = <bar_rgba>
        }
    endif
endscript


script progress_menu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    KillSpawnedScript name = text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if GotParam checkbox_item
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = [ 0 0 0 0 ]
        }
    else
        DoScreenElementMorph {
            id = {<id> child = 1}
            rgba = <text_rgba>
        }
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = [ 0 0 0 0 ]
        }
    endif
endscript


script game_progress_menu_exit 
    if ObjectExists id = progress_anchor
        DestroyScreenElement id = progress_anchor
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon
        DestroyScreenElement id = box_icon
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon_2
        DestroyScreenElement id = box_icon_2
        wait 1 gameframe
    endif
    if ObjectExists id = grunge_anchor
        DestroyScreenElement id = grunge_anchor
        wait 1 gameframe
    endif
    if LevelIs load_mainmenu
        create_setup_options_menu
    else
        create_your_options_menu
    endif
endscript

