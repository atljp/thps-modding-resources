
view_goals_test_slide = 1
skater_goal_list_names = [
    {
        name = 'YOU'
        value = custom
    }
    {
        name = 'PRO'
        value = pro
    }
    {
        name = 'GUEST'
        value = guest
    }
    {
        name = 'SECRET'
        value = flavor
    }
]

script array_next_wraparound index = 0
    if NOT GotParam array
        return 0
    endif
    <index> = (<index> + 1)
    GetArraySize <array>
    if (<index> = <array_size>)
        <index> = 0
    endif
    return index = <index>
endscript


script array_previous_wraparound index = 0
    if NOT GotParam array
        return 0
    endif
    <index> = (<index> - 1)
    if (<index> = -1)
        GetArraySize <array>
        <index> = (<array_size> - 1)
    endif
    return index = <index>
endscript


script KillEventHandlers 
    SetScreenElementProps {
        id = current_menu_anchor
        event_handlers = [
            { pad_up NullScript }
            { pad_down NullScript }
            { pad_left NullScript }
            { pad_right NullScript }
            { pad_back NullScript }
            { pad_choose NullScript }
        ]
        replace_handlers
    }
endscript


script view_goals_wait_and_setup_input 
    gettags
    if GotParam goal
        action = view_goals_menu_choose_goal
        params = { goal_list_index = <goal_list_index> }
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                { pad_up NullScript }
                { pad_down NullScript }
                { pad_left NullScript }
                { pad_right NullScript }
                {pad_back <action> params = <params>}
                {pad_choose <action> params = <params>}
            ]
            replace_handlers
        }
    else
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                {pad_left view_goals_menu_pad_left params = { goal_list_index = <goal_list_index> }}
                {pad_right view_goals_menu_pad_right params = { goal_list_index = <goal_list_index> }}
                { pad_back view_goals_menu_exit }
            ]
            replace_handlers
        }
    endif
    if root_window ::getsingletag view_goals_shortcut_on
        SetScreenElementProps {
            id = <id>
            event_handlers = [
                { pad_select view_goals_menu_exit }
            ]
            replace_handlers
        }
    endif
    wait 0.1500 seconds
    if ScreenElementExists id = view_goals_root
        view_goals_root ::removetags tags = [ animating_scroll animating_select ]
    endif
endscript


script GetCurrentGoalListIndex 
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    switch <skater_family>
        case family_pro
        goal_list_index = 1
        case family_guest
        goal_list_index = 2
        case family_flavor
        goal_list_index = 3
        default 
        goal_list_index = 0
    endswitch
    return goal_list_index = <goal_list_index>
endscript


script view_goals_menu_pad_right 
    if NOT ScreenElementExists id = right_arrow
        return 
    endif
    if view_goals_root ::getsingletag animating_select
        return 
    endif
    view_goals_root ::settags animating_scroll
    generic_menu_scroll_sideways_sound
    array_next_wraparound index = <goal_list_index> array = skater_goal_list_names
    level_select_arrow_blink_right
    if (view_goals_test_slide = 1)
        DoScreenElementMorph id = goal_list_container Pos = (1300.0, 0.0) time = 0.1500
        wait 0.1500 seconds
    endif
    view_goals_menu_create goal_list_index = <index> highlight_tab change_list
    if (view_goals_test_slide = 1)
        DoScreenElementMorph id = goal_list_container Pos = (-1300.0, 0.0) time = 0
        DoScreenElementMorph id = goal_list_container Pos = (0.0, 0.0) time = 0.1500
        wait 0.1500 seconds
    endif
endscript


script view_goals_menu_pad_left 
    if NOT ScreenElementExists id = left_arrow
        return 
    endif
    if view_goals_root ::getsingletag animating_select
        return 
    endif
    view_goals_root ::settags animating_scroll
    generic_menu_scroll_sideways_sound
    array_previous_wraparound index = <goal_list_index> array = skater_goal_list_names
    level_select_arrow_blink_left
    if (view_goals_test_slide = 1)
        DoScreenElementMorph id = goal_list_container Pos = (-1000.0, 0.0) time = 0.1500
        wait 0.1500 seconds
    endif
    view_goals_menu_create goal_list_index = <index> highlight_tab change_list
    if (view_goals_test_slide = 1)
        DoScreenElementMorph id = goal_list_container Pos = (1000.0, 0.0) time = 0
        DoScreenElementMorph id = goal_list_container Pos = (0.0, 0.0) time = 0.1500
        wait 0.1500 seconds
    endif
endscript


script view_goals_tab_highlight 
    gettags
    DoScreenElementMorph id = <id> alpha = 0.7000 time = 0
    DoScreenElementMorph id = <id> Scale = 1.500 relative_scale time = 0.5000
    DoScreenElementMorph id = <id> alpha = 0 time = 0.5000
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    wait 0.5000 seconds
    if ScreenElementExists id = <id>
        DestroyScreenElement id = <id>
    endif
endscript


script FadeAfterDelay 
    wait <delay> seconds
    if ScreenElementExists id = <id1>
        DoScreenElementMorph id = <id1> alpha = <alpha> time = <delay>
    endif
    if GotParam id2
        if ScreenElementExists id = <id2>
            DoScreenElementMorph id = <id2> alpha = <alpha> time = <delay>
        endif
    endif
endscript


script view_goals_menu_fade_tabs 
    GetArraySize skater_goal_list_names
    counter = 0
    begin 
    FormatText checksumname = tabname 'view_goals_tab%i' i = <counter>
    FormatText checksumname = textname 'view_goals_text%i' i = <counter>
    if ScreenElementExists id = <tabname>
        if GotParam goal
            if (<counter> = <goal_list_index>)
                SpawnScript FadeAfterDelay params = {id1 = <tabname> id2 = <textname> delay = 0.1000 alpha = 0}
            else
                DoScreenElementMorph id = <tabname> alpha = 0 time = 0.1000
                DoScreenElementMorph id = <textname> alpha = 0 time = 0.1000
            endif
        else
            if (<counter> = <goal_list_index>)
                DoScreenElementMorph id = <tabname> alpha = 1 time = 0.1000
                DoScreenElementMorph id = <textname> alpha = 1 time = 0.1000
            else
                SpawnScript FadeAfterDelay params = {id1 = <tabname> id2 = <textname> delay = 0.1000 alpha = 1}
            endif
        endif
    endif
    <counter> = (<counter> + 1)
    repeat <array_size>
    if GotParam goal
    else
    endif
endscript


script view_goals_menu_build_tabs 
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        id = tab_container
        not_focusable
    }
    Theme_GetMenuTitleColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = tab_container
        id = view_goals_title
        font = testtitle
        text = 'VIEW GOALS'
        Pos = (515.0, 13.0)
        Scale = 1.500
        rgba = <title_color>
        just = [ center top ]
        z_priority = -10
    }
    <tab_pos> = (28.0, 20.0)
    GetArraySize skater_goal_list_names
    counter = 0
    if view_goals_root ::getsingletag simple_list
        counter = <goal_list_index>
        array_size = 1
    endif
    begin 
    next_offset = (141.0, 0.0)
    FormatText checksumname = tabname 'view_goals_tab%i' i = <counter>
    FormatText checksumname = textname 'view_goals_text%i' i = <counter>
    if (<counter> = <goal_list_index>)
        Theme_GetSupportPieceColor return_value = tab_color
        Theme_GetPauseBarColor return_value = font_color
        tab_scale = (1.25, 1.190000057220459)
        font_scale = (1.100000023841858, 1.399999976158142)
        tab_offset = (0.0, 25.0)
        text_tab_relative_offset = (80.0, 21.0)
        z_priority = (<array_size> + 1)
    else
        tab_color = [ 50 50 50 128 ]
        font_color = [ 70 70 70 255 ]
        tab_scale = (1.25, 0.8999999761581421)
        font_scale = (1.100000023841858, 1.0)
        text_tab_relative_offset = (80.0, 16.0)
        tab_offset = (0.0, 34.0)
        z_priority = (<array_size> - <counter>)
    endif
    if ((<counter> = 0)|| (<counter> = <goal_list_index>))
        texture = goal_tab
    else
        texture = goal_tab_2
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = tab_container
        id = <tabname>
        texture = <texture>
        rgba = <tab_color>
        Scale = <tab_scale>
        Pos = (<tab_pos> + <tab_offset>)
        just = [ left top ]
        z_priority = <z_priority>
    }
    if (<counter> = <goal_list_index>)
        if GotParam highlight_tab
            CreateScreenElement {
                type = TextElement
                parent = tab_container
                id = tab_highlight
                font = small
                rgba = <font_color>
                text = ((skater_goal_list_names [ <counter> ]).name)
                Scale = <font_scale>
                Pos = (<tab_pos> + <text_tab_relative_offset> + <tab_offset>)
                just = [ center center ]
                z_priority = (<array_size> + 2)
            }
            RunScriptOnScreenElement id = tab_highlight view_goals_tab_highlight
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = tab_container
        id = <textname>
        font = small
        rgba = <font_color>
        text = ((skater_goal_list_names [ <counter> ]).name)
        Scale = <font_scale>
        Pos = (<tab_pos> + <text_tab_relative_offset> + <tab_offset>)
        just = [ center center ]
        z_priority = (<array_size> + 2)
    }
    array_next_wraparound index = <goal_list_index> array = skater_goal_list_names
    <tab_pos> = (<tab_pos> + <next_offset>)
    <counter> = (<counter> + 1)
    repeat <array_size>
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = tab_container
        id = grad_bar
        texture = goal_grad
        rgba = <grad_color>
        Scale = (19.0, 1.0)
        Pos = (30.0, 83.0)
        just = [ left top ]
        z_priority = 35
    }
endscript


script ProcessGoalList 
    if NOT GotParam actionScript
        return 
    endif
    if NOT GotParam goal_list_index
        return 
    endif
    if ScreenElementExists id = view_goals_root
        if view_goals_root ::getsingletag simple_list
            goal_list_index = 0
        endif
    endif
    name = ((skater_goal_list_names [ <goal_list_index> ]).value)
    hide_goal_details = 0
    GoalManager_GetLevelPrefix
    FormatText checksumname = level_info 'Level_%i' i = <level_prefix>
    if StructureContains structure = <level_info> special_ped_info
        GetArraySize (<level_info>.special_ped_info)
        index = 0
        begin 
        ped = ((<level_info>.special_ped_info)[ <index> ])
        if ((<ped>.type)= <name>)
            if StructureContains structure = <ped> name
                <name> = (<ped>.name)
                GetSkaterProfileInfoByName name = <name>
            endif
            if StructureContains structure = <ped> flag
                found_flag = (<ped>.flag)
            endif
            if GotParam found_flag
                if NOT GetGlobalFlag flag = <found_flag>
                    hide_goal_details = 1
                endif
            endif
            break 
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    if (<hide_goal_details> = 0)
        GoalManager_GetViewGoalsInfo skater = <name>
        if IsArray <view_goals_info>
            GetArraySize <view_goals_info>
            <index> = 0
            begin 
            <actionScript> goal = (<view_goals_info> [ <index> ])goal_list_index = <goal_list_index> reminder_pos = <Pos>
            <index> = (<index> + 1)
            repeat <array_size>
        else
            <actionScript> goal = {view_goals_text = 'This character has no goals.' goal_id = blank}goal_list_index = <goal_list_index> not_focusable reminder_pos = <Pos>
        endif
    else
        if GotParam lockedScript
            <lockedScript> <...> 
            return locked = 1
        endif
    endif
    if GotParam Pos
        return Pos = <Pos>
    endif
endscript


script AddGoalSelectable 
    if GotParam not_focusable
        focusable = { not_focusable }
    else
        focusable = {}
    endif
    if NOT view_goals_root ::getsingletag allow_description
        pad_choose_script = view_goals_menu_exit
    else
        pad_choose_script = view_goals_menu_choose_goal
    endif
    add_roundbar_menu_item {text = (<goal>.view_goals_text)
        id = (<goal>.goal_id)
        pad_choose_script = <pad_choose_script>
        pad_choose_sound = NullScript
        goal = <goal>
        goal_list_index = <goal_list_index>
        single_camera
        <focusable>
    }
endscript


script view_goals_menu_build_list goal_list_index = 0
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        id = goal_list_container
        not_focusable
    }
    make_new_vg_menu {
        parent = goal_list_container
        padding_scale = 1
        menu_id = view_goals_menu
        vmenu_id = view_goals_vmenu
        Pos = (50.0, 98.0)
    }
    ProcessGoalList goal_list_index = <goal_list_index> actionScript = AddGoalSelectable lockedScript = view_goals_locked_message
    if NOT GotParam locked
        if NOT view_goals_root ::getsingletag simple_list
            view_goals_list_message
        endif
    endif
endscript


script view_goals_menu_build_details 
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        id = goal_list_container
        not_focusable
    }
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = goal_list_container
        not_focusable
        rot_angle = 90
        texture = goal_grad
        just = [ left top ]
        Pos = (600.0, 86.0)
        rgba = [ 0 14 10 128 ]
        alpha = 0.3000
        Scale = (8.0, 143.0)
        zpriority = -1
    }
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = goal_list_container
        not_focusable
        rot_angle = 90
        texture = goal_grad
        just = [ left top ]
        Pos = (600.0, 86.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.3000
        Scale = (8.0, 143.0)
        zpriority = -1
    }
    make_new_vg_menu {
        parent = goal_list_container
        padding_scale = 1
        menu_id = view_goals_menu
        vmenu_id = view_goals_vmenu
        Pos = (130.0, 98.0)
    }
    Theme_GetPauseBarColor return_value = title_text_color
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        id = goal_title_container
        not_focusable
    }
    CreateScreenElement {
        type = TextElement
        parent = goal_title_container
        id = goal_details_title
        font = small
        text = (<goal>.view_goals_text)
        Pos = (32.0, 92.0)
        just = [ left bottom ]
        Scale = (1.399999976158142, 1.899999976158142)
        rgba = <title_text_color>
        shadow
        shadow_rgba = [0 , 0 , 0 , 128]
        shadow_offs = (2.0, 2.0)
        z_priority = 49
    }
    FormatText textname = points '%p PTS.' p = (<goal>.reward_points)
    CreateScreenElement {
        type = TextElement
        parent = goal_title_container
        id = goal_details_points
        font = small
        text = <points>
        Pos = (600.0, 90.0)
        just = [ RIGHT bottom ]
        Scale = 1.300
        rgba = <title_text_color>
        shadow
        shadow_rgba = [0 , 0 , 0 , 128]
        shadow_offs = (2.0, 2.0)
    }
    if ((<goal>.beaten)= 1)
        GetScreenElementDims id = goal_details_title
        CreateScreenElement {
            type = SpriteElement
            parent = goal_details_title
            texture = goal_complete_line
            Pos = (0.0, 10.0)
            rgba = [128 , 128 , 128 , 90]
            just = [ left center ]
            Scale = (<width> * (0.005499999970197678, 0.0) + (0.0, 0.800000011920929))
            z_priority = 50
        }
        GetScreenElementDims id = goal_details_points
        CreateScreenElement {
            type = SpriteElement
            parent = goal_details_points
            texture = goal_complete_line
            Pos = (0.0, -2.0)
            rgba = [128 , 128 , 128 , 90]
            just = [ left top ]
            Scale = (<width> * (0.005499999970197678, 0.0) + (0.0, 0.800000011920929))
            z_priority = 100
        }
    endif
endscript


script view_goals_menu_build_bottom helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\b6/\b5 = Switch List' }
        { text = '\bm = Goal Details' }
    ]
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        id = bottom_pieces_container
        not_focusable
    }
    if view_goals_root ::getsingletag simple_list
        if NOT view_goals_root ::getsingletag allow_description
            RemoveParameter add_points
            helper_text_elements = [{ text = '\bn/\bm = Done' }]
        else
            if NOT GotParam goal
                helper_text_elements = [
                    { text = '\bn = Done' }
                    { text = '\bm = Goal Details' }
                ]
            endif
        endif
    endif
    create_helper_text {
        parent = bottom_pieces_container
        helper_pos = (330.0, 426.0)
        helper_text_elements = <helper_text_elements>
    }
    if GotParam add_points
        GoalManager_GetActiveRewardPoints
        GetCurrentLevelName
        GetCurrentPointsToAdvance
        to_advance = (<points_to_advance> - <active_points>)
        if (<to_advance> < 0)
            to_advance = 0
        endif
        FormatText textname = points1 '%c: %a / %b PTS.' a = <active_points> b = <total_points> c = <level_name>
        Theme_GetAltColor return_value = points1_color
        FormatText textname = points2 'YOU NEED %a MORE POINTS TO CONTINUE...' a = <to_advance>
        Theme_GetPauseBarColor return_value = points2_color
        CreateScreenElement {
            type = TextElement
            parent = bottom_pieces_container
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = small
            text = <points1>
            rgba = <points1_color>
            Scale = 1.200
            Pos = (620.0, 350.0)
            just = [ RIGHT top ]
        }
        CreateScreenElement {
            type = TextElement
            parent = bottom_pieces_container
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = small
            text = <points2>
            rgba = <points2_color>
            Scale = 1
            Pos = (620.0, 375.0)
            just = [ RIGHT top ]
        }
    endif
endscript


script view_goals_menu_build_arrows 
    CreateScreenElement {
        type = ContainerElement
        parent = view_goals_root
        id = arrows_container
        not_focusable
    }
    if view_goals_root ::getsingletag simple_list
        return 
    endif
    build_big_level_select_arrows parent = arrows_container Pos = (320.0, 67.0) Scale = 0.8000 z_priority = 20
endscript


script create_view_goals_shortcut 
    if NOT cd
        return 
    endif
    if NOT GameModeEquals is_career
        return 
    endif
    if LevelIs load_mainmenu
        return 
    endif
    root_window ::gettags
    if (<menu_state> = on)
        return 
    endif
    if NOT SkaterCamAnimFinished
        return 
    endif
    if NOT InNetGame
        pausegame
        PauseMusicAndStreams 1
    endif
    GoalManager_PauseAllGoals
    hide_all_hud_items
    kill_start_key_binding
    root_window ::settags view_goals_shortcut_on
    view_goals_menu_create
endscript


script view_goals_menu_create 
    change block_proxim_node_updates = 1
    GoalManager_ReplaceTrickText all
    hide_current_goal
    if ObjectExists id = current_menu_anchor
        SpawnScript menu3d_animate_out params = { Die }
        DestroyScreenElement id = current_menu_anchor
    endif
    if ScreenElementExists id = view_goals_root
        if NOT GotParam hold_tabs
            DestroyScreenElement id = tab_container
        endif
        DestroyScreenElement id = goal_list_container
        DestroyScreenElement id = bottom_pieces_container
        if ScreenElementExists id = goal_title_container
            DestroyScreenElement id = goal_title_container
        endif
        if ScreenElementExists id = menu_gradient
            DestroyScreenElement id = menu_gradient
        endif
        if ScreenElementExists id = menu3d_char
            DestroyScreenElement id = menu3d_char
        endif
    else
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = view_goals_root
            dims = (1.0, 1.0)
            not_focusable
        }
        if LevelIs load_tr
            view_goals_root ::settags simple_list
        else
            IsCurrentChapterCapstone
            if GotParam capstone_chapter
                view_goals_root ::settags simple_list
            endif
            view_goals_root ::settags allow_description
        endif
    endif
    if NOT GotParam goal_list_index
        intro = 1
        GetCurrentGoalListIndex
    else
        intro = 0
    endif
    if GotParam goal
        pause_menu_gradient Off
    else
        pause_menu_gradient
    endif
    if NOT GotParam hold_tabs
        view_goals_menu_build_tabs <...> 
    endif
    if GotParam goal
        view_goals_menu_build_bottom helper_text_elements = [{ text = '\bn/\bm = Back' }] goal
        view_goals_menu_build_details goal = <goal> goal_list_index = <goal_list_index>
    else
        view_goals_menu_build_bottom add_points
        view_goals_menu_build_list goal_list_index = <goal_list_index>
    endif
    if (<intro> = 1)
        view_goals_menu_build_arrows
        DoScreenElementMorph id = arrows_container Pos = (0.0, -120.0) time = 0
        DoScreenElementMorph id = arrows_container Pos = (0.0, 0.0) time = 0.3000
        DoScreenElementMorph id = tab_container Pos = (0.0, -100.0) time = 0
        DoScreenElementMorph id = tab_container Pos = (0.0, 0.0) time = 0.3000
        DoScreenElementMorph id = goal_list_container Pos = (700.0, 0.0) time = 0
        DoScreenElementMorph id = goal_list_container Pos = (0.0, 0.0) time = 0.3000
        DoScreenElementMorph id = bottom_pieces_container Pos = (0.0, 150.0) time = 0
        DoScreenElementMorph id = bottom_pieces_container Pos = (0.0, 0.0) time = 0.3000
        wait 0.3000 seconds
    endif
    RemoveParameter id
    if ScreenElementExists id = current_menu_anchor
        FireEvent type = focus target = current_menu_anchor
        RunScriptOnScreenElement id = current_menu_anchor view_goals_wait_and_setup_input params = { <...>  }
    endif
endscript


script view_goals_goal_description_with_highlight Line = -1 num_cameras = 0
    Theme_GetUnhighlightedTextColorNew return_value = text_color
    if ScreenElementExists id = goal_description_container
        DestroyScreenElement id = goal_description_container
    endif
    SetScreenElementLock id = goal_list_container Off
    CreateScreenElement {
        type = ContainerElement
        parent = goal_list_container
        id = goal_description_container
        not_focusable
    }
    GetScreenElementPosition id = current_menu
    screenelementpos = (<screenelementpos> + (-50.0, 0.0))
    height = 0
    index = 0
    if IsArray (<goal>.goal_description)
        GetArraySize (<goal>.goal_description)
        begin 
        rgba = <text_color>
        alpha = 1
        if (<num_cameras> = <array_size>)
            if (<index> = <Line>)
            else
                rgba = <text_color>
                alpha = 0.6000
            endif
        endif
        CreateScreenElement {
            type = TextBlockElement
            parent = goal_description_container
            font = small
            internal_scale = 1.200
            text = ((<goal>.goal_description)[ <index> ])
            Pos = (<height> * (0.0, 1.0) + <screenelementpos>)
            just = [ left top ]
            internal_just = [ left top ]
            dims = (500.0, 0.0)
            allow_expansion
            rgba = <rgba>
            alpha = <alpha>
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
        }
        GetScreenElementDims id = <id>
        GetScreenElementPosition id = <id>
        index = (<index> + 1)
        repeat <array_size>
    else
        CreateScreenElement {
            type = TextBlockElement
            parent = goal_description_container
            font = small
            internal_scale = 1.200
            text = (<goal>.goal_description)
            Pos = (<height> * (0.0, 1.0) + <screenelementpos>)
            just = [ left top ]
            internal_just = [ left top ]
            dims = (500.0, 0.0)
            allow_expansion
            rgba = <text_color>
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
        }
        GetScreenElementDims id = <id>
        GetScreenElementPosition id = <id>
    endif
    if StructureContains structure = <goal> view_goals_tip
        view_goals_tip = (<goal>.view_goals_tip)
    endif
    GoalManager_GetGoalParams name = (<goal>.goal_id)
    if GotParam view_goals_notify_trick
        bound_text = view_goals_notify_message_trick_bound
        if globalexists name = <view_goals_notify_trick> type = structure
            if StructureContains structure = <view_goals_notify_trick> params
                if StructureContains structure = (<view_goals_notify_trick>.params)IsSpecial
                    bound_text = view_goals_notivy_message_special_trick_bound
                endif
            endif
        endif
        GetTrickDisplayText Trick = <view_goals_notify_trick>
        if GetKeyComboBoundToTrick special Trick = <view_goals_notify_trick>
            FormatText {
                textname = view_goals_tip
                <bound_text>
                t = <trick_display_text>
                k = (goal_tetris_trick_text.<current_key_combo>)
            }
        else
            FormatText {
                textname = view_goals_tip
                view_goals_notify_message_trick_needed
                t = <trick_display_text>
            }
        endif
    endif
    if GotParam view_goals_tip
        Theme_GetMenuTitleColor return_value = tip_color
        CreateScreenElement {
            type = TextElement
            parent = goal_description_container
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
            font = small
            text = 'TIP:'
            rgba = <tip_color>
            alpha = 0.9000
            Scale = (1.5, 1.600000023841858)
            Pos = (<height> * (0.0, 1.5) + <screenelementpos>)
            just = [ left top ]
        }
        GetScreenElementDims id = <id>
        GetScreenElementPosition id = <id>
        CreateScreenElement {
            type = TextBlockElement
            parent = goal_description_container
            font = small
            internal_scale = 1
            text = <view_goals_tip>
            Pos = (<screenelementpos> + <width> * (1.0, 0.0) + (2.0, 9.0))
            just = [ left top ]
            internal_just = [ left top ]
            dims = (370.0, 0.0)
            allow_expansion
            rgba = <text_color>
            alpha = 0.8000
            shadow
            shadow_rgba = UI_text_shadow_color
            shadow_offs = UI_text_shadow_offset
        }
        GetScreenElementDims id = <id>
        GetScreenElementPosition id = <id>
    else
        screenelementpos = (<screenelementpos> + (55.0, 0.0))
    endif
    Theme_GetAltColor return_value = alt_color
    CreateScreenElement {
        type = TextBlockElement
        parent = goal_description_container
        font = small
        internal_scale = 1.100
        text = '\bn'
        Pos = (<screenelementpos> + <height> * (0.0, 1.0) + (0.0, 25.0))
        just = [ left top ]
        internal_just = [ left top ]
        dims = (390.0, 0.0)
        allow_expansion
        rgba = [ 128 128 128 128 ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = goal_description_container
        font = small
        internal_scale = 1.100
        text = ' Back to list'
        Pos = (<screenelementpos> + <height> * (0.0, 1.0) + (32.0, 25.0))
        just = [ left top ]
        internal_just = [ left top ]
        dims = (390.0, 0.0)
        allow_expansion
        rgba = <alt_color>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
endscript


script play_single_view_goals_cam 
    kill_single_view_goals_cam
    if StructureContains structure = <goal> view_goals_cameras
        PlaySkaterCamAnim {virtual_cam
            TargetID = world
            targetOffset = ((<goal>.view_goals_cameras [ <index> ]).targetOffset)
            positionOffset = ((<goal>.view_goals_cameras [ <index> ]).positionOffset)
            frames = 1
        }
        root_window ::settags view_goals_camera_playing
    endif
    GoalManager_GetGoalParams name = (<goal>.goal_id)
    if GotParam trick_object_prefix
        params = {
            trick_object_light_group = <trick_object_light_group>
            trick_object_prefix = <trick_object_prefix>
            goal_name = <goal_name>
            goal_id = <goal_id>
        }
        goal_trick_the_objects_colors_start <params>
        root_window ::settags view_goals_object_flashing = <params>
    else
        if GotParam goal_objects
            GetArraySize <goal_objects>
            index = 0
            begin 
            goal_object = (<goal_objects> [ <index> ])
            if StructureContains structure = <goal_object> trick_objects
                goal_skate_the_line_next_cluster {
                    trick_objects = ((<goal_objects> [ <index> ]).trick_objects)
                    goal_name = <goal_name>
                    keep_last
                    goal_objects_index = <index>
                }
            else
                goal_skate_the_line_next_cluster <goal_object> keep_last
            endif
            index = (<index> + 1)
            repeat <array_size>
            root_window ::settags {
                view_goals_object_flashing = {
                    goal_objects = <goal_objects>
                    goal_name = <goal_name>
                    goal_id = <goal_id>
                }
            }
        endif
    endif
endscript


script kill_single_view_goals_cam 
    if root_window ::getsingletag view_goals_camera_playing
        root_window ::removetags tags = [ view_goals_camera_playing ]
        KillSkaterCamAnim current
    endif
    if root_window ::getsingletag view_goals_object_flashing
        if StructureContains structure = <view_goals_object_flashing> trick_object_prefix
            goal_trick_the_objects_colors_stop <view_goals_object_flashing>
        else
            goal_skate_the_line_colors_stop <view_goals_object_flashing> stop_all
        endif
        root_window ::removetags tags = [ view_goals_object_flashing ]
    endif
endscript


script view_goals_goal_cam 
    if NOT GotParam goal
        return 
    endif
    view_goals_goal_description_with_highlight <...> 
    if StructureContains structure = <goal> view_goals_cameras
        GetArraySize (<goal>.view_goals_cameras)
        <index> = 0
        begin 
        play_single_view_goals_cam goal = <goal> index = <index>
        if (<array_size> = 1)
            break 
        endif
        view_goals_goal_description_with_highlight Line = <index> num_cameras = <array_size> <...> 
        wait ((<goal>.view_goals_cameras [ <index> ]).time)seconds
        kill_single_view_goals_cam
        <index> = (<index> + 1)
        if (<index> = <array_size>)
            <index> = 0
        endif
        repeat 
    endif
endscript


script view_goals_menu_choose_goal 
    if view_goals_root ::getsingletag animating_scroll
        return 
    endif
    view_goals_root ::settags animating_select
    if GotParam goal
        SpawnScript FadeAfterDelay params = {id1 = arrows_container delay = 0.1500 alpha = 0}
        view_goals_menu_fade_tabs <...> 
        SpawnScript FadeAfterDelay params = {id1 = view_goals_title delay = 0.1500 alpha = 0}
        theme_menu_pad_choose_sound
    else
        generic_menu_pad_back_sound
    endif
    if (view_goals_test_slide = 1)
        DoScreenElementMorph id = goal_list_container Pos = (0.0, 550.0) time = 0.1500
        DoScreenElementMorph id = bottom_pieces_container alpha = 0 time = 0.1000
        wait 0.1500 seconds
    endif
    KillSpawnedScript name = view_goals_goal_cam
    view_goals_menu_create <...> hold_tabs
    SpawnScript view_goals_goal_cam params = { <...>  }
    if NOT GotParam goal
        SpawnScript FadeAfterDelay params = {id1 = arrows_container delay = 0.1500 alpha = 1}
        SpawnScript FadeAfterDelay params = {id1 = view_goals_title delay = 0.1000 alpha = 1}
        view_goals_menu_fade_tabs <...> 
    endif
    if (view_goals_test_slide = 1)
        DoScreenElementMorph id = goal_list_container Pos = (0.0, 500.0) time = 0
        DoScreenElementMorph id = goal_list_container Pos = (0.0, 0.0) time = 0.1500
        DoScreenElementMorph id = bottom_pieces_container alpha = 0 time = 0
        SpawnScript FadeAfterDelay params = {id1 = bottom_pieces_container delay = 0.1000 alpha = 1}
        wait 0.3000 seconds
    endif
    FireEvent type = focus target = current_menu_anchor
endscript


script view_goals_menu_exit 
    if ScreenElementExists id = view_goals_root
        change block_proxim_node_updates = 0
        root_window ::settags need_music_zone_refresh
        kill_single_view_goals_cam
        KillSpawnedScript name = view_goals_menu_pad_left
        KillSpawnedScript name = view_goals_menu_pad_right
        KillSpawnedScript name = view_goals_menu_choose_goal
        DestroyScreenElement id = view_goals_root
    endif
    if root_window ::getsingletag view_goals_shortcut_on
        root_window ::removetags tags = [ view_goals_shortcut_on ]
        exit_pause_menu
    else
        generic_menu_pad_back callback = create_pause_menu <...> 
    endif
endscript


script make_new_vg_menu menu_id = main_menu_anchor vmenu_id = main_menu Pos = (320.0, 240.0) parent = root_window spacing = 7 dims = (538.0, 100.0)
    if NOT view_goals_root ::getsingletag allow_description
        scrolling = scrolling
        dims = (538.0, 300.0)
        Theme_GetHighlightedTextColor return_value = arrow_rgba
    endif
    make_new_roundbar_menu {<...> 
        additional_create_script = viewgoals_create_scratches
        additional_focus_script = viewgoals_focus_scratches
        additional_unfocus_script = viewgoals_unfocus_scratches
        no_pad_handlers
        no_helper_text
        pad_back_sound = NullScript
    }
    if NOT view_goals_root ::getsingletag allow_description
        SetScreenElementProps id = current_scrolling_menu event_handlers = [{ pad_back view_goals_menu_exit }]
        FireEvent type = focus target = current_scrolling_menu
    endif
endscript


script viewgoals_create_scratches 
    pad_choose_params = {goal = <goal> goal_list_index = <goal_list_index>}
    SetScreenElementProps {
        id = <container_id>
        event_handlers = [
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
            {focus <focus_script> params = {id = <container_id> goal = <goal> index = 0 scale_highlight_text = <scale_highlight_text>}}
        ]
        replace_handlers
    }
    if GotParam single_camera
        <container_id> ::settags single_camera = 1
    endif
    if StructureContains structure = <goal> beaten
        if ((<goal>.reward_points)> 0)
            FormatText textname = points '%p PTS.' p = (<goal>.reward_points)
            CreateScreenElement {
                type = TextElement
                parent = <container_id>
                Pos = (<right_edge> + (0.0, 9.0))
                font = small
                Scale = 1
                rgba = [ 128 128 128 80 ]
                text = <points>
                just = [ RIGHT center ]
                z_priority = 9
            }
            <id> ::settags tag_local_id = Score
        endif
        if ((<goal>.beaten)= 1)
            GetScreenElementDims id = {<container_id> child = text}
            CreateScreenElement {
                type = SpriteElement
                parent = <container_id>
                texture = goal_complete_line
                Pos = (0.0, 9.0)
                rgba = [128 , 128 , 128 , 90]
                just = [ left center ]
                Scale = (<width> * (0.00800000037997961, 0.0) + (0.0, 0.800000011920929))
                z_priority = 50
            }
            <id> ::settags tag_local_id = scratch1
            if ((<goal>.reward_points)> 0)
                GetScreenElementDims id = {<container_id> child = Score}
                CreateScreenElement {
                    type = SpriteElement
                    parent = <container_id>
                    texture = goal_complete_line
                    Pos = (<right_edge> + (0.0, -5.0))
                    rgba = [128 , 128 , 128 , 90]
                    just = [ RIGHT top ]
                    Scale = (<width> * (0.008500000461935997, 0.0) + (0.0, 0.800000011920929))
                    z_priority = 100
                }
                <id> ::settags tag_local_id = scratch2
            endif
            <container_id> ::settags beaten = 1
        endif
    endif
endscript


script viewgoals_focus_scratches 
    if <id> ::getsingletag single_camera
        play_single_view_goals_cam goal = <goal> index = 0
    endif
    if ScreenElementExists id = {<id> child = Score}
        SetScreenElementProps {
            id = {<id> child = Score}
            rgba = [ 0 0 0 128 ]
        }
    endif
    if <id> ::getsingletag beaten
        DoScreenElementMorph id = {<id> child = scratch1}time = 0.05000 Scale = (1.149999976158142, 1.25) relative_scale
    endif
endscript


script viewgoals_unfocus_scratches 
    if ScreenElementExists id = {<id> child = Score}
        SetScreenElementProps {
            id = {<id> child = Score}
            rgba = [ 128 128 128 80 ]
        }
    endif
    if <id> ::getsingletag beaten
        DoScreenElementMorph id = {<id> child = scratch1}time = 0.05000 Scale = 1.0 relative_scale
    endif
endscript


script view_goals_list_message 
    view_goals_generic_message message = '\cbPRESS \c0\bm\cb TO GET DETAILS' Pos = (320.0, 305.0) rgba = [ 128 128 128 128 ]
endscript


script view_goals_locked_message 
    kill_single_view_goals_cam
    FormatText textname = message '\cbSWITCH TO %a CHARACTER TO UNLOCK NEW GOALS' a = ((skater_goal_list_names [ <goal_list_index> ]).name)
    view_goals_generic_message message = <message> Pos = (320.0, 95.0) rgba = [ 128 128 128 128 ]
endscript


script view_goals_generic_message rgba = [ 128 50 128 128 ]
    CreateScreenElement {
        type = TextElement
        parent = bottom_pieces_container
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        font = small
        text = <message>
        rgba = <rgba>
        override_encoded_alpha
        Scale = (1.149999976158142, 1.2999999523162842)
        Pos = <Pos>
        just = [ center top ]
    }
    RunScriptOnScreenElement id = <id> view_goals_message_highlight
endscript


script view_goals_message_highlight 
    gettags
    DoScreenElementMorph id = <id> time = 0 alpha = 0
    wait 0.3000 seconds
    begin 
    DoScreenElementMorph id = <id> time = 0.4000 alpha = 0.9000
    wait 0.5000 seconds
    DoScreenElementMorph id = <id> time = 0.4000 alpha = 0.6000
    wait 0.7000 seconds
    repeat 
endscript


script view_goals_reminder_create 
    if ScreenElementExists id = view_goals_reminders
        GoalReminderAnimateOff id = view_goals_reminders
        if ScreenElementExists id = view_goals_reminders
            DestroyScreenElement id = view_goals_reminders
        endif
    endif
    reminder_pos = (25.0, 115.0)
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = view_goals_reminders
        Scale = 0.9500
        Pos = <reminder_pos>
        not_focusable
    }
    Theme_GetSupportPieceColor return_value = tab_color
    CreateScreenElement {
        type = SpriteElement
        parent = view_goals_reminders
        texture = goal_tab
        rgba = <tab_color>
        Scale = 1
        Pos = (0.0, 0.0)
        just = [ left top ]
        z_priority = -1
    }
    GetCurrentGoalListIndex
    Theme_GetPauseBarColor return_value = font_color
    CreateScreenElement {
        type = TextElement
        parent = view_goals_reminders
        font = small
        rgba = <font_color>
        text = ((skater_goal_list_names [ <goal_list_index> ]).name)
        Scale = (1.100000023841858, 1.25)
        Pos = (65.0, 18.0)
        just = [ center center ]
        z_priority = 0
    }
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = view_goals_reminders
        texture = goal_grad
        rgba = <grad_color>
        Scale = (10.0, 0.800000011920929)
        Pos = (-30.0, 32.0)
        just = [ left top ]
        z_priority = -2
    }
    ProcessGoalList goal_list_index = <goal_list_index> actionScript = AddGoalReminder Pos = (3.0, 38.0)
    height = (((<Pos> - (0.0, 38.0)).(0.0, 1.0))/ 20)
    if (<height> = 0)
        DestroyScreenElement id = view_goals_reminders
        return 
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = view_goals_reminders
        texture = white3
        rgba = [ 0 0 0 70 ]
        rot_angle = 179.9
        Scale = ((12.0, 0.0) + <height> * (0.0, 0.15800000727176666) + (0.0, 0.07999999821186066))
        Pos = (-30.0, 32.0)
        just = [ RIGHT bottom ]
        z_priority = -2
    }
    RunScriptOnScreenElement id = view_goals_reminders GoalReminderAnimate params = { reminder_pos = <reminder_pos> }
endscript


script AddGoalReminder 
    color = [ 128 128 128 128 ]
    if NOT GotParam not_focusable
        if (<goal>.beaten)
            return 
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = view_goals_reminders
        font = small
        text = (<goal>.view_goals_text)
        rgba = <color>
        Scale = 1
        Pos = <reminder_pos>
        just = [ left top ]
        z_priority = 0
    }
    return Pos = (<reminder_pos> + (0.0, 20.0))
endscript


script GoalReminderAnimate 
    gettags
    GoalReminderAnimateOn id = <id>
    wait 5 seconds
    GoalReminderAnimateOff id = <id>
    Die
endscript


script GoalReminderAnimateOn 
    GetScreenElementPosition id = <id>
    off_pos = (<screenelementpos> - (400.0, 0.0))
    DoScreenElementMorph id = <id> Pos = <off_pos> time = 0
    DoScreenElementMorph id = <id> Pos = <screenelementpos> time = 0.2000
    wait 0.3000 seconds
endscript


script GoalReminderAnimateOff 
    GetScreenElementPosition id = <id>
    off_pos = (<screenelementpos> - (400.0, 0.0))
    DoScreenElementMorph id = <id> Pos = <off_pos> time = 0.2000
    wait 0.3000 seconds
endscript


script GoalListReminderHide 
    if ScreenElementExists id = view_goals_reminders
        DoScreenElementMorph id = view_goals_reminders alpha = 0 time = 0
    endif
endscript


script GoalListReminderShow 
    if ScreenElementExists id = view_goals_reminders
        DoScreenElementMorph id = view_goals_reminders alpha = 1 time = 0
    endif
endscript


script view_created_goals_menu_create 
    hide_current_goal
    menu3d_hide
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 gameframe
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = view_goals_menu
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = view_goals_menu alias = current_menu_anchor
    create_helper_text helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Jump to Goal (if unlocked)' }
    ]
    FormatText checksumname = title_icon '%i_gap' i = (THEME_PREFIXES [ current_theme_prefix ])
    build_theme_sub_title Title = 'GOALS' title_icon = <title_icon>
    FormatText checksumname = paused_icon '%i_paused_icon' i = (THEME_PREFIXES [ current_theme_prefix ])
    theme_background width = 6.350 Pos = (320.0, 85.0) num_parts = 10.50
    <root_pos> = (80.0, 25.0)
    Theme_GetHighlightedTextColor return_value = text_rgba
    Theme_GetUnhighlightedTextColor return_value = untext_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Pos = (57.0, 87.0)
        just = [ left top ]
        rgba = [ 0 0 0 85 ]
        Scale = (130.0, 5.0)
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_up_arrow
        texture = up_arrow
        Pos = (320.0, 88.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_down_arrow
        texture = down_arrow
        Pos = (320.0, 372.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Pos = (57.0, 370.0)
        just = [ left top ]
        rgba = [ 0 0 0 85 ]
        Scale = (130.0, 5.0)
        z_priority = 2
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        dims = (640.0, 264.0)
        Pos = (80.0, 110.0)
        just = [ left top ]
        internal_just = [ center top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = <id>
        id = view_goals_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        dont_allow_wrap
        event_handlers = [
            {pad_down menu_vert_blink_arrow params = { id = view_goals_menu_down_arrow }}
            {pad_up menu_vert_blink_arrow params = { id = view_goals_menu_up_arrow }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_back generic_menu_pad_back_sound }
            {pad_back view_created_goals_menu_exit params = { callback = create_pause_menu }}
        ]
    }
    AssignAlias id = view_goals_vmenu alias = current_menu
    GoalManager_AddViewGoalsList
    FireEvent type = focus target = view_goals_vmenu
endscript


script view_goals_menu_add_item 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        id = <goal_id>
        dims = (500.0, 24.0)
    }
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    Theme_GetHighlightedTextColor return_value = highlighted_text_rgba
    CreateScreenElement {
        type = TextElement
        parent = <goal_id>
        rgba = <text_rgba>
        text = <text>
        font = dialog
        Pos = (0.0, 0.0)
        just = [ left top ]
    }
    if GotParam bogus
        SetScreenElementProps {
            id = <goal_id>
            event_handlers = [
                { focus view_goals_menu_focus_beaten }
                { unfocus view_goals_menu_unfocus_beaten }
            ]
        }
        return 
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <goal_id>
        texture = DE_highlight_bar
        Pos = (240.0, 10.0)
        just = [ center center ]
        rgba = [ 0 0 0 0 ]
        z_priority = 3
        Scale = (4.099999904632568, 0.699999988079071)
    }
    CreateScreenElement {
        type = TextElement
        parent = <goal_id>
        rgba = <text_rgba>
        text = ' '
        font = dialog
        Pos = (0.0, 0.0)
        just = [ left top ]
    }
    if GoalManager_HasWonGoal name = <goal_id>
        SetScreenElementProps {
            id = <goal_id>
            event_handlers = [
                { focus view_goals_menu_focus_beaten }
                { unfocus view_goals_menu_unfocus_beaten }
                { pad_choose theme_menu_pad_choose_sound }
                {pad_choose view_goals_menu_start_beaten_goal params = { goal_id = <goal_id> }}
                { pad_start theme_menu_pad_choose_sound }
                {pad_start view_goals_menu_start_beaten_goal params = { goal_id = <goal_id> }}
                { pad_choose generic_menu_pad_choose_sound }
            ]
        }
        GetScreenElementDims id = {<goal_id> child = 0}
        CreateScreenElement {
            type = SpriteElement
            parent = {<goal_id> child = 1}
            texture = white2
            Pos = (2.0, 16.0)
            just = [ left center ]
            rgba = <highlighted_text_rgba>
            alpha = 1
            z_priority = 10
            Scale = (15.5, 0.15000000596046448)
        }
    else
        if GoalManager_GoalIsLocked name = <goal_id>
            if IsTrue bootstrap_build
                <locked_text> = 'NOT IN DEMO'
            else
                GoalManager_GetGoalParams name = <goal_id>
                if GotParam pro_goal
                    <locked_text> = 'Complete Pro Challenge to unlock'
                else
                    <locked_text> = 'Locked'
                endif
            endif
            view_goals_menu_set_color {
                id = <goal_id>
                rgba = <text_rgba>
                text = <locked_text>
            }
            SetScreenElementProps {
                id = <goal_id>
                event_handlers = [
                    { focus view_goals_menu_focus_locked }
                    { unfocus view_goals_menu_unfocus_locked }
                    { pad_choose view_goals_menu_pad_choose_locked }
                    { pad_start view_goals_menu_pad_choose_locked }
                ]
                replace_handlers
            }
        else
            if GoalManager_HasSeenGoal name = <goal_id>
                view_goals_menu_set_color {
                    id = <goal_id>
                    rgba = <text_rgba>
                }
                SetScreenElementProps {
                    id = <goal_id>
                    event_handlers = [
                        { pad_start theme_menu_pad_choose_sound }
                        { pad_choose theme_menu_pad_choose_sound }
                        {focus view_goals_menu_focus_unlocked params = { goal_id = <goal_id> }}
                        {unfocus view_goals_menu_unfocus_unlocked params = { goal_id = <goal_id> }}
                        {pad_choose view_goals_menu_start_goal params = { goal_id = <goal_id> }}
                        {pad_start view_goals_menu_start_goal params = { goal_id = <goal_id> }}
                    ]
                    replace_handlers
                }
            else
                view_goals_menu_set_color {
                    id = <goal_id>
                    rgba = [ 42 42 38 128 ]
                    text = '??????????'
                }
                SetScreenElementProps {
                    id = <goal_id>
                    event_handlers = [
                        {focus view_goals_menu_focus_locked params = { goal_id = <goal_id> }}
                        {unfocus view_goals_menu_unfocus_locked params = { goal_id = <goal_id> }}
                        { pad_choose view_goals_menu_pad_choose_locked }
                        { pad_start view_goals_menu_pad_choose_locked }
                    ]
                    replace_handlers
                }
            endif
        endif
    endif
endscript


script view_goals_menu_set_color 
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <rgba>
        text = <text>
    }
    <id> ::gettags
    if GotParam win_record
        SetScreenElementProps {
            id = {<id> child = 1}
            rgba = <rgba>
            Scale = <Scale>
        }
    endif
endscript


script view_goals_menu_focus_locked 
    generic_menu_update_arrows {
        menu_id = view_goals_vmenu
        up_arrow_id = view_goals_menu_up_arrow
        down_arrow_id = view_goals_menu_down_arrow
    }
    gettags
    main_theme_focus
    if GotParam goal_id
        view_goals_menu_play_preview_cam <...> 
    endif
endscript


script view_goals_menu_unfocus_locked 
    gettags
    generic_menu_pad_up_down_sound
    main_theme_unfocus
    if GotParam goal_id
        view_goals_menu_kill_preview_cam <...> 
    endif
endscript


script view_goals_menu_focus_unlocked 
    generic_menu_update_arrows {
        menu_id = view_goals_vmenu
        up_arrow_id = view_goals_menu_up_arrow
        down_arrow_id = view_goals_menu_down_arrow
    }
    gettags
    Theme_GetHighlightedTextColor return_value = highlighted_text_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <highlighted_text_rgba>
        Scale = 1.100
        relative_scale
    }
    if ScreenElementExists id = {<id> child = 2}
        DoScreenElementMorph {
            id = {<id> child = 2}
            rgba = <highlighted_text_rgba>
            Scale = 1.100
            relative_scale
        }
    endif
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <bar_rgba>
    }
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
    RunScriptOnScreenElement id = <id> text_twitch_effect
    view_goals_menu_play_preview_cam <...> 
endscript


script view_goals_menu_unfocus_unlocked 
    gettags
    generic_menu_pad_up_down_sound
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    KillSpawnedScript name = text_twitch_effect
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
        alpha = <text_alpha>
        Scale = 1
    }
    if ScreenElementExists id = {<id> child = 2}
        DoScreenElementMorph {
            id = {<id> child = 2}
            rgba = <text_rgba>
            alpha = <text_alpha>
            Scale = 1
        }
    endif
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = [ 128 128 128 0 ]
    }
    view_goals_menu_kill_preview_cam <...> 
endscript


script view_goals_menu_focus_beaten 
    generic_menu_update_arrows {
        menu_id = view_goals_vmenu
        up_arrow_id = view_goals_menu_up_arrow
        down_arrow_id = view_goals_menu_down_arrow
    }
    gettags
    Theme_GetHighlightedTextColor return_value = highlighted_text_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <highlighted_text_rgba>
        Scale = 1.100
        relative_scale
    }
    if ScreenElementExists id = {<id> child = 2}
        DoScreenElementMorph {
            id = {<id> child = 2}
            rgba = <highlighted_text_rgba>
            Scale = 1.100
            relative_scale
        }
    endif
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <bar_rgba>
    }
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
    RunScriptOnScreenElement id = <id> text_twitch_effect
endscript


script view_goals_menu_unfocus_beaten 
    gettags
    generic_menu_pad_up_down_sound
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    KillSpawnedScript name = text_twitch_effect
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
        alpha = <text_alpha>
        Scale = 1
    }
    if ScreenElementExists id = {<id> child = 2}
        DoScreenElementMorph {
            id = {<id> child = 2}
            rgba = <text_rgba>
            alpha = <text_alpha>
            Scale = 1
        }
    endif
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = [ 128 128 128 0 ]
    }
endscript


script view_goals_menu_pad_choose_locked 
endscript


script view_goals_menu_start_goal 
    view_created_goals_menu_exit callback = exit_pause_menu
    GoalManager_DeactivateAllGoals
    skater ::RunTimerController_Reset
    goal_accept_trigger goal_id = <goal_id> force_start
endscript


script view_goals_menu_start_beaten_goal 
    view_created_goals_menu_exit callback = exit_pause_menu
    GoalManager_DeactivateAllGoals
    skater ::RunTimerController_Reset
    goal_accept_trigger goal_id = <goal_id> force_start
endscript


script view_goals_menu_play_preview_cam 
    GoalManager_GetGoalParams name = <goal_id>
    if IsAlive name = <trigger_obj_id>
        if NOT ObjectExists id = menu_cam
            create_menu_camera
        else
            menu_cam ::UnPause
        endif
        <trigger_obj_id> ::obj_getposition
        menu_cam ::obj_setposition position = (<Pos> + (0.0, 40.0, 110.0))
        menu_cam ::obj_setorientation y = 0
        <trigger_obj_id> ::obj_getorientation
        <trigger_obj_id> ::obj_setorientation y = 0
        SetActiveCamera id = menu_cam
        SetSkaterCamAnimShouldPause name = <goal_id> should_pause = 0
        <trigger_obj_id> ::UnPause
        wait 5 frames
        <trigger_obj_id> ::Pause
    endif
    view_goals_vmenu ::settags current_cam_anim = <goal_id>
endscript


script view_goals_menu_kill_preview_cam 
    GetSkaterId
    KillSkaterCamAnim skater = <ObjID> name = <goal_id>
endscript


script view_created_goals_menu_exit 
    if ScreenElementExists id = view_goals_vmenu
        view_goals_vmenu ::gettags
        if GotParam current_cam_anim
            GetSkaterId
            KillSkaterCamAnim skater = <ObjID> name = <current_cam_anim>
        endif
    endif
    restore_skater_camera
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 gameframe
    endif
    GoalManager_ShowPoints
    if NOT GoalManager_HasActiveGoals
        GoalManager_ShowGoalPoints
    endif
    <callback>
endscript

