
stats_menu_bar_highlight = [55 , 55 , 110 , 128]
stats_menu_bar_lowlight = [ 50 50 50 128 ]
stats_menu_star_highlight = [85 , 85 , 0 , 110]
stats_menu_star_lowlight = [10 , 10 , 10 , 128]
helper_text_change_elements = [{ text = '\b6/\b5 = Change' }
    { text = '\bn/\bm = Done' }
]
helper_text_select_elements = [{ text = '\b7/\b4/\b6/\b5 = Select' }
    { text = '\bn = Back' }
    { text = '\bm = Change' }
]
helper_text_select_elements_no_change = [
    { text = '\b7/\b4/\b6/\b5 = Select' }
    { text = '\bn = Back' }
]
helper_text_classic_elements = [
    { text = '\b7/\b4 = Select' }
    { text = '\b6/\b5 = Change' }
    { text = '\bn = Back' }
]

script create_classic_stats_menu 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = classic_stats_menu
    }
    AssignAlias id = classic_stats_menu alias = current_menu_anchor
    AssignAlias id = classic_stats_menu alias = sub_menu
    create_helper_text helper_text_elements = helper_text_classic_elements
    CreateScreenElement {
        type = ContainerElement
        parent = classic_stats_menu
        id = classic_stats_block_anchor
        Pos = (120.0, 110.0)
        just = [ center center ]
    }
    Theme_GetSupportPieceColor return_value = tab_color
    Theme_GetPauseBarColor return_value = font_color
    Theme_GetAltColor return_value = alt_color
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = goal_tab
        rgba = <tab_color>
        Scale = 1.200
        Pos = (108.0, -35.0)
        just = [ center center ]
        z_priority = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = goal_tab
        rgba = <tab_color>
        Scale = 1.200
        Pos = (290.0, -35.0)
        just = [ center center ]
        z_priority = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = white2
        rgba = <tab_color>
        Scale = (10.0, 4.25)
        Pos = (200.0, -35.0)
        just = [ center center ]
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = white2
        rgba = [ 0 0 0 128 ]
        Scale = (10.0, 0.3799999952316284)
        Pos = (200.0, -53.0)
        just = [ center center ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        id = bG
        texture = white2
        rgba = [ 0 0 0 70 ]
        Scale = (42.0, 31.0)
        Pos = (200.0, 103.0)
        just = [ center center ]
        z_priority = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = goal_tab
        rgba = <alt_color>
        Scale = 1
        Pos = (95.0, 239.0)
        just = [ center center ]
        z_priority = 1
        flip_h
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = goal_tab
        rgba = <alt_color>
        Scale = 1
        Pos = (305.0, 239.0)
        just = [ center center ]
        z_priority = 1
        flip_h
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = white2
        rgba = <alt_color>
        Scale = (20.0, 3.5)
        Pos = (200.0, 239.0)
        just = [ center center ]
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = classic_stats_block_anchor
        texture = white2
        rgba = [ 0 0 0 128 ]
        Scale = (20.0, 0.20000000298023224)
        Pos = (200.0, 254.0)
        just = [ center center ]
        z_priority = 3
    }
    CreateScreenElement {
        type = TextElement
        parent = classic_stats_block_anchor
        text = 'EDIT STATS'
        font = small
        rgba = [ 128 128 128 128 ]
        Scale = 1.900
        Pos = (207.0, -32.0)
        just = [ center center ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    CreateScreenElement {
        type = TextElement
        parent = classic_stats_block_anchor
        id = stat_count
        text = ''
        font = small
        rgba = [ 128 128 128 128 ]
        Scale = 1.300
        Pos = (95.0, 240.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = vmenu
        parent = classic_stats_block_anchor
        id = classic_stats_vmenu
        font = small
        just = [ left top ]
        Pos = (76.0, 0.0)
        padding_scale = 1.150
        internal_scale = 1
        internal_just = [ left top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            {pad_back classic_stats_pad_choose params = { <...> back }}
            {pad_choose classic_stats_pad_choose params = <...> }
            { pad_start NullScript }
        ]
    }
    parent = classic_stats_vmenu
    GetArraySize stat_names
    <index> = 0
    begin 
    stats_menu_add_item {(stat_names [ <index> ])
        index = <index>
        stats_parent = <parent>
        pad_left_script = stats_change_menu_left
        pad_right_script = stats_change_menu_right
        StatMenu
        can_edit
    }
    <index> = (<index> + 1)
    repeat <array_size>
    FireEvent type = focus target = classic_stats_vmenu
endscript


script classic_stats_pad_choose 
    UpdateSkaterStats player = 0
    if GotParam end_run
        generic_menu_pad_choose_sound
        gamemode_end_run_maybe_save
    else
        if GotParam back
            generic_menu_pad_back_sound
        else
            generic_menu_pad_choose_sound
        endif
        GetStatValue Air
        if GotParam overridden
            if NOT GotParam back
                SetAllStats value = 0
                index = 0
                GetArraySize stat_names
                begin 
                FireEvent type = unfocus target = {classic_stats_vmenu child = <index>}
                index = (<index> + 1)
                repeat <array_size>
                FireEvent type = unfocus target = classic_stats_vmenu
                FireEvent type = focus target = classic_stats_vmenu
                return 
            endif
        endif
        stats_menu_exit
    endif
endscript


script create_stats_menu 
    if GameModeEquals is_classic
        create_classic_stats_menu
        return 
    endif
    hide_current_goal
    stats_menu_get_skater_name_and_family
    if NOT (<skater_family> = family_custom)
        Helpers = (helper_text_select_elements_no_change)
        height = 254
        Scale = (65.0, 8.5)
        num_parts = 6
    else
        Helpers = (helper_text_select_elements)
        height = 362
        Scale = (65.0, 21.5)
        num_parts = 10.50
    endif
    make_new_themed_sub_menu {
        Title = 'STATS'
        Pos = (70.0, 94.0)
        skateshop_pos = (60.0, 97.0)
        dims = (640.0, 480.0)
        no_menu_title = no_menu_title
    }
    create_helper_text helper_text_elements = <Helpers>
    if (<skater_family> = family_custom)
        sub_menu ::settags can_edit
    endif
    sub_menu ::settags skater_name = <skater_name>
    Theme_GetUnhighlightedTextColor return_value = off_color
    Theme_GetHighlightedTextColor return_value = on_color
    CreateScreenElement {
        type = vmenu
        parent = sub_menu
        id = sub_vmenu2
        font = small
        just = [ left top ]
        Pos = (325.0, 106.0)
        padding_scale = 1.150
        internal_scale = 1
        internal_just = [ left top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            {pad_back generic_menu_pad_back params = { callback = stats_menu_exit }}
        ]
    }
    SetScreenElementProps {
        id = sub_vmenu
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = stats_menu_exit }}]
        replace_handlers
    }
    FormatText textname = stat_title '%i:' i = ((stat_names [ 0 ]).string)
    CreateScreenElement {
        type = TextElement
        parent = sub_menu
        id = stat_title
        Pos = (240.0, 215.0)
        font = small
        just = [ RIGHT top ]
        Scale = 1.500
        text = <stat_title>
        rgba = <on_color>
        z_priority = 4
    }
    CreateScreenElement {
        type = TextElement
        parent = sub_menu
        id = stat_count
        Pos = (270.0, 215.0)
        font = small
        just = [ RIGHT top ]
        Scale = 1.500
        text = ''
        rgba = <on_color>
        z_priority = 4
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = sub_menu
        id = stat_count2
        Pos = (350.0, 203.0)
        dims = (250.0, 60.0)
        font = small
        just = [ left top ]
        internal_just = [ left center ]
        line_spacing = 0.8000
        Scale = 0.9000
        text = ''
        rgba = <on_color>
        z_priority = 4
    }
    CreateScreenElement {
        type = TextElement
        parent = sub_menu
        Pos = (270.0, 215.0)
        font = small
        just = [ left top ]
        Scale = 1.500
        text = '/10'
        rgba = <on_color>
        z_priority = 4
    }
    Theme_GetAltColor return_value = alt_color
    if sub_menu ::getsingletag can_edit
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            texture = white2
            Pos = (320.0, 362.0)
            just = [ center top ]
            Scale = (63.5, 0.25)
            rgba = <alt_color>
            alpha = 0.7000
        }
    endif
    CreateScreenElement {
        type = TextElement
        parent = sub_menu
        id = stat_point_description
        Pos = ((320.0, 2.0) + <height> * (0.0, 1.0))
        font = small
        just = [ center top ]
        Scale = (1.0, 0.8999999761581421)
        text = ((stat_names [ 0 ]).description)
        rgba = <alt_color>
        z_priority = 4
    }
    build_stat_goals_menu
    theme_background width = 6.400 Pos = (320.0, 85.0) num_parts = <num_parts> parent = sub_menu
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = white2
        Pos = (320.0, 250.0)
        just = [ center top ]
        Scale = (63.5, 0.25)
        rgba = <on_color>
        alpha = 0.7000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = white2
        Pos = (322.0, 212.0)
        just = [ center top ]
        Scale = (63.5, 0.25)
        rgba = <on_color>
        alpha = 0.7000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = white2
        Pos = (322.0, 214.0)
        just = [ center top ]
        Scale = (0.3499999940395355, 4.5)
        rgba = <on_color>
        alpha = 0.7000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = white2
        Pos = (320.0, 214.0)
        just = [ center top ]
        Scale = <Scale>
        rgba = [ 0 0 0 88 ]
        alpha = 0.7000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = white2
        Pos = (320.0, 212.0)
        just = [ center top ]
        Scale = (65.0, 4.5)
        rgba = [ 0 0 0 118 ]
        alpha = 0.7000
    }
    GetArraySize stat_names
    <index> = 0
    begin 
    RemoveParameter pad_right_script
    RemoveParameter pad_left_script
    if (<index> > ((<array_size> / 2)- 1))
        parent = sub_vmenu2
        pad_left_script = focus_stats_vmenu
        child = (<index> - (<array_size> / 2))
    else
        parent = sub_vmenu
        pad_right_script = focus_stats_vmenu2
        child = <index>
    endif
    stats_menu_add_item {(stat_names [ <index> ])
        index = <index>
        stats_parent = <parent>
        pad_right_script = <pad_right_script>
        pad_left_script = <pad_left_script>
        pad_right_params = {grid_index = (<child>)}
        pad_left_params = {grid_index = (<child>)}
        StatMenu
    }
    SetScreenElementProps {
        id = {<parent> child = <child>}
        tags = { tag_grid_x = <child> }
    }
    <index> = (<index> + 1)
    repeat <array_size>
    if NOT LevelIs load_mainmenu
        finish_themed_sub_menu
    else
        skater ::remove_skater_from_world
        DoScreenElementMorph id = sub_menu time = 0.0 Pos = (320.0, 720.0)
        DoScreenElementMorph id = sub_menu time = 0.5000 Pos = (320.0, 218.0)
        FireEvent type = focus target = sub_menu
    endif
    if NOT sub_menu ::getsingletag can_edit
        update_stats_menu_count name = Air
    endif
endscript


script get_stats_menu_goal_count 
    GetArraySize stats_goals
    index = 0
    count = 3
    begin 
    if (((stats_goals [ <index> ]).stattype)= <name>)
        skater ::StatsManager_GetGoalStatus <index>
        if (<status> = 1)
            count = (<count> + 1)
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    return count = <count>
endscript


script update_stats_menu_count 
    if NOT ScreenElementExists id = stat_count
        return 
    endif
    if GameModeEquals is_classic
        GetStatValue <name>
        if GotParam overridden
            text = 'OVERRIDES ARE ON!'
        else
            GetStatValue points_available
            FormatText textname = text 'Points Available: %i' i = <stat_value>
        endif
        SetScreenElementProps id = stat_count text = <text>
        return 
    endif
    GetStatValue <name>
    if (<stat_value> > 10)
        stat_value = 10
    endif
    FormatText textname = text '%i' i = <stat_value>
    SetScreenElementProps id = stat_count text = <text>
    if GotParam overridden
        text = 'THESE VALUES CURRENTLY BEING OVERRIDDEN!'
    else
        if sub_menu ::getsingletag can_edit
            get_stats_menu_goal_count name = <name>
            left = (<count> - <stat_value>)
            <row_id> ::getsingletag display_string
            FormatText textname = text '%i %a points available' i = <left> a = <display_string>
        else
            FormatText textname = text 'You can\'t change your Teammate\'s stats!' i = <left> a = <display_string>
        endif
    endif
    SetScreenElementProps id = stat_count2 text = <text>
endscript


script build_stat_goals_menu stat_type = Air
    if NOT sub_menu ::getsingletag can_edit
        return 
    endif
    Theme_GetUnhighlightedTextColor return_value = on_rgba
    if ScreenElementExists id = stat_goal_menu
        DestroyScreenElement id = stat_goal_menu
    endif
    CreateScreenElement {
        type = vmenu
        parent = sub_menu
        id = stat_goal_menu
        font = dialog
        just = [ center top ]
        Pos = (320.0, 255.0)
        padding_scale = 0.7500
        internal_scale = 1
        internal_just = [ center top ]
    }
    GetArraySize stats_goals
    index = 0
    begin 
    skater ::StatsManager_GetGoalStatus <index>
    if (((stats_goals [ <index> ]).stattype)= <stat_type>)
        switch <status>
            case 2
            text = 'Turn Am to Unlock'
            alpha = 0.5000
            case 3
            text = 'Turn Pro to Unlock'
            alpha = 0.5000
            default 
            GoalManager_GetDifficultyLevel
            string = ((stats_goals [ <index> ]).text)
            value = ((stats_goals [ <index> ]).value [ <difficulty_level> ])
            if (<value> = 1)
                string = ((stats_goals [ <index> ]).alt_text)
            endif
            if StructureContains structure = (stats_goals [ <index> ])value_string
                vstring = ((stats_goals [ <index> ]).value_string [ <difficulty_level> ])
            endif
            if NOT StructureContains structure = (stats_goals [ <index> ])no_commas
                FormatText textname = text <string> i = <value> s = <vstring> usecommas
            else
                FormatText textname = text <string> i = <value> s = <vstring>
            endif
            alpha = 1.0
        endswitch
        if (<status> = 1)
            rgba = [ 30 30 30 80 ]
        else
            rgba = <on_rgba>
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = stat_goal_menu
            just = [ center top ]
            internal_just = [ center center ]
            dims = (0.0, 20.0)
            alpha = <info_panel_alpha>
        }
        anchor_id = <id>
        CreateScreenElement {
            type = TextElement
            parent = <anchor_id>
            font = dialog
            just = [ center top ]
            Scale = 0.8000
            text = <text>
            rgba = <rgba>
            z_priority = 4
            alpha = <alpha>
        }
        GetScreenElementDims id = <id>
        Scale = (61.0, 0.30000001192092896)
        if (<status> = 1)
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id>
                texture = white2
                just = [ center center ]
                Scale = <Scale>
                Pos = (0.0, 9.0)
                rgba = <rgba>
                z_priority = 5
                alpha = <alpha>
            }
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
endscript


script focus_stats_vmenu 
    if ScreenElementExists id = change_stat_sub_anchor
        stats_change_menu_left <...> 
        return 
    endif
    playsound MenuUp vol = 100
    FireEvent type = unfocus target = sub_vmenu2
    FireEvent type = focus target = sub_vmenu Data = { grid_index = <grid_index> }
endscript


script focus_stats_vmenu2 
    if ScreenElementExists id = change_stat_sub_anchor
        stats_change_menu_right <...> 
        return 
    endif
    playsound MenuUp vol = 100
    FireEvent type = unfocus target = sub_vmenu
    FireEvent type = focus target = sub_vmenu2 Data = { grid_index = <grid_index> }
endscript


script stats_menu_create_stats_block parent = current_menu Scale = 1 Pos = (180.0, 147.0)
    if IsNGC
        MemPushContext topdownheap
        heap = TopDown
    else
        heap = frontend
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = stats_block_anchor
        Pos = <Pos>
        just = [ left top ]
        dims = (640.0, 480.0)
        Scale = <Scale>
        heap = <heap>
    }
    <stats_parent> = <id>
    GetArraySize stat_names
    <index> = 0
    begin 
    stats_menu_add_item {
        (stat_names [ <index> ])
        stats_parent = <stats_parent>
        pro_name = <pro_name>
        index = <index>
        on = <on>
        heap = <heap>
    }
    <index> = (<index> + 1)
    repeat <array_size>
    <Pos> = ((0.0, 1.0) * (23 * (<index> + 1)))
    <Pos> = (<Pos> + (150.0, -12.0))
    CreateScreenElement {
        type = ContainerElement
        parent = stats_block_anchor
        id = stats_bottom_anchor
        dims = (200.0, 20.0)
        Pos = <Pos>
        z_priority = 10
        heap = <heap>
    }
    if IsNGC
        MemPopContext
    endif
endscript


script stats_menu_add_item z_priority = 2 highlight_bar_scale = (3.0999999046325684, 0.699999988079071) highlight_bar_pos = (90.0, -7.0) pad_right_script = null_script pad_left_script = null_script
    FormatText checksumname = row_id 'stats_menu_names_%n' n = <index>
    <Pos> = ((0.0, 1.0) * (23 * (<index> + 1)))
    <Pos> = (<Pos> + (150.0, -12.0))
    if ScreenElementExists id = sub_menu
        sub_menu ::getsingletag can_edit
    endif
    if GotParam can_edit
        choose_script1 = stats_menu_build_change_menu
        choose_script2 = generic_menu_pad_choose_sound
        choose_params = {parent = <stats_parent> row_id = <row_id> name = <name>}
        CreateScreenElement {
            type = ContainerElement
            parent = <stats_parent>
            id = <row_id>
            local_id = <name>
            dims = (200.0, 20.0)
            Pos = <Pos>
            just = [ center center ]
            event_handlers = [
                {focus stats_menu_focus params = {name = <name> row_id = <row_id> string = <string> description = <description>}}
                {unfocus stats_menu_unfocus params = {name = <name> row_id = <row_id>}}
                {pad_right <pad_right_script> params = {<pad_right_params> row_id = <row_id> name = <name>}}
                {pad_left <pad_left_script> params = {<pad_left_params> row_id = <row_id> name = <name>}}
                {pad_choose <choose_script1> params = <choose_params>}
                {pad_start <choose_script1> params = <choose_params>}
                { pad_choose <choose_script2> }
                { pad_start <choose_script2> }
            ]
            heap = <heap>
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <stats_parent>
            id = <row_id>
            local_id = <name>
            dims = (200.0, 20.0)
            Pos = <Pos>
            just = [ center center ]
            heap = <heap>
        }
    endif
    <anchor_id> = <id>
    if GotParam not_focusable
        SetScreenElementProps {
            id = <anchor_id>
            not_focusable
        }
    endif
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    if GotParam short_string
        <string> = <short_string>
    endif
    <anchor_id> ::settags display_string = <string>
    if LevelIs load_mainmenu
        font = dialog
        size = (1.2000000476837158, 0.8999999761581421)
    else
        font = small
        size = 1.250
    endif
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        rgba = <text_rgba>
        font = <font>
        Scale = <size>
        text = <string>
        z_priority = <z_priority>
        just = [ RIGHT center ]
        Pos = (90.0, -5.0)
        z_priority = 5
        heap = <heap>
    }
    if GotParam on
        highlight_rgba = (stats_menu_bar_highlight)
    else
        highlight_rgba = (stats_menu_bar_lowlight)
    endif
    build_stat_slider parent = <row_id> Pos = (95.0, -5.0)
    stats_menu_update_row {
        name = <name>
        pro_name = <pro_name>
        row_id = <row_id>
        highlight_rgba = <highlight_rgba>
    }
    if GotParam StatMenu
        DoScreenElementMorph {
            id = <row_id>
            Scale = 0.8000
        }
        Theme_GetPauseBarColor return_value = bar_color
        if GameModeEquals is_classic
            Scale = (52.0, 3.5)
        else
            Scale = (36.0, 3.5)
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = <row_id>
            local_id = bg_bar
            rgba = <bar_color>
            alpha = 0
            texture = white2
            Scale = <Scale>
            z_priority = 3
            just = [ center center ]
            Pos = (154.0, -5.5)
            heap = <heap>
        }
    endif
endscript


script stats_menu_classic_focus 
    build_stat_arrows parent = {classic_stats_vmenu child = <name>}
endscript


script stats_menu_classic_unfocus 
    if ScreenElementExists id = right_arrow
        DestroyScreenElement id = right_arrow
        DestroyScreenElement id = left_arrow
    endif
endscript


script stats_menu_build_change_menu 
    if ScreenElementExists id = change_stat_sub_anchor
        kill_stats_change_menu <...> 
        return 
    endif
    GetStatValue <name>
    if GotParam overridden
        SetAllStats value = 0
        GetArraySize stat_names
        index = 0
        begin 
        FormatText checksumname = row_id2 'stats_menu_names_%n' n = <index>
        stats_menu_unfocus name = ((stat_names [ <index> ]).name)row_id = <row_id2> highlight_rgba = [ 50 50 50 100 ] bar_bg_rgba = [ 100 100 100 128 ]
        index = (<index> + 1)
        repeat <array_size>
    endif
    SetScreenElementLock id = {<parent> child = <name>}Off
    CreateScreenElement {
        type = ContainerElement
        parent = {<parent> child = <name>}
        id = change_stat_sub_anchor
        event_handlers = [{pad_back kill_stats_change_menu params = <...> }
            {pad_left stats_change_menu_left params = {row_id = <row_id> name = <name>}}
            {pad_right stats_change_menu_right params = {row_id = <row_id> name = <name>}}
        ]
    }
    create_helper_text helper_text_elements = helper_text_change_elements
    build_stat_arrows parent = change_stat_sub_anchor
    id = {<parent> child = {<name> child = bg_bar}}
    SetScreenElementLock id = <id> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        local_id = stat_roundbar_highlight
        texture = roundbar_highlight
        Pos = (0.0, 4.0)
        rgba = [128 , 128 , 128 , 128]
        alpha = 0
        just = [ left center ]
        z_priority = 5
        Scale = (0.10000000149011612, 0.38499999046325684)
    }
    RunScriptOnScreenElement id = <id> stats_menu_bar_do_highlight
    FireEvent type = unfocus target = sub_menu
    FireEvent type = focus target = {<parent> child = <name>}
    FireEvent type = focus target = change_stat_sub_anchor
endscript


script build_stat_arrows 
    SetScreenElementLock id = <parent> Off
    Theme_GetMenuTitleColor return_value = arrow_color
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        id = left_arrow
        texture = left_arrow
        rgba = <arrow_color>
        Scale = (1.2999999523162842, 1.100000023841858)
        Pos = (-11.0, -5.5)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        id = right_arrow
        texture = right_arrow
        rgba = <arrow_color>
        Scale = (1.2999999523162842, 1.100000023841858)
        Pos = (319.0, -5.5)
        just = [ RIGHT center ]
    }
endscript


script stats_menu_bar_do_highlight 
    Theme_GetPauseBarColor return_value = bar_color
    setprops rgba = <bar_color>
    DoMorph alpha = 0.9000
    begin 
    DoMorph Pos = (6.5, 4.0) time = 0.5000 anim = gentle
    DoMorph Pos = (-0.20000000298023224, 4.0) time = 0.5000 anim = gentle
    repeat 
endscript


script kill_stats_change_menu 
    DestroyScreenElement id = change_stat_sub_anchor
    highlight_bar_id = {<parent> child = {<name> child = { bg_bar child = stat_roundbar_highlight }}}
    if ScreenElementExists id = <highlight_bar_id>
        DestroyScreenElement id = <highlight_bar_id>
    endif
    FireEvent type = focus target = <parent>
    create_helper_text helper_text_elements = helper_text_select_elements
endscript


script stats_change_menu_right 
    DoScreenElementMorph id = right_arrow alpha = 0
    DoScreenElementMorph id = right_arrow alpha = 1 time = 0.2000
    if GameModeEquals is_classic
        GetStatValue points_available
        available = <stat_value>
        if (<available> > 0)
            GetStatValue <name>
            if GotParam overridden
                return 
            endif
            if (<stat_value> < 10)
                stat_menu_change_stat name = <name> value = (<stat_value> + 1)
                stat_menu_change_stat name = points_available value = (<available> -1)
            endif
        endif
    else
        get_stats_menu_goal_count name = <name>
        GetStatValue <name>
        if (<count> > <stat_value>)
            stat_menu_change_stat name = <name> value = (<stat_value> + 1)
        endif
    endif
    stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = stats_menu_bar_highlight
endscript


script stats_change_menu_left 
    DoScreenElementMorph id = left_arrow alpha = 0
    DoScreenElementMorph id = left_arrow alpha = 1 time = 0.2000
    GetStatValue <name>
    value = <stat_value>
    if (<value> > 0)
        if GameModeEquals is_classic
            if GotParam overridden
                return 
            endif
            GetStatValue points_available
            stat_menu_change_stat name = points_available value = (<stat_value> + 1)
        endif
        stat_menu_change_stat name = <name> value = (<value> -1)
        stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = stats_menu_bar_highlight
    endif
endscript


script build_stat_slider 
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = roundbar_tip_left
        Scale = 0.7500
        rgba = stats_menu_bar_lowlight
        Pos = <Pos>
        just = [ left center ]
        local_id = roundbar_left
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = roundbar_middle
        Scale = (4.699999809265137, 0.75)
        rgba = stats_menu_bar_lowlight
        Pos = (<Pos> + (24.0, 0.0))
        just = [ left center ]
        local_id = roundbar_middle
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = roundbar_tip_right
        Scale = 0.7500
        rgba = stats_menu_bar_lowlight
        Pos = (<Pos> + (174.0, 0.0))
        just = [ left center ]
        local_id = roundbar_right
        z_priority = 5
    }
    if GameModeEquals is_classic
        texture = Circle
        Scale = 1.420
    else
        texture = star
        Scale = 0.3000
    endif
    <Pos> = (<Pos> + (4.0, -10.5))
    <index> = 0
    begin 
    FormatText checksumname = local_id 'star_%i' i = <index>
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = <texture>
        Scale = <Scale>
        rgba = stats_menu_star_lowlight
        Pos = <Pos>
        just = [ left top ]
        local_id = <local_id>
        z_priority = 6
    }
    GetStackedScreenElementPos id = <id> x
    <index> = (<index> + 1)
    repeat 10
endscript

stats_color_1 = [ 40 0 0 80 ]
stats_color_2 = [ 128 0 0 80 ]

script stat_menu_change_stat 
    if GameModeEquals is_classic
        SetClassicStat <name> <value>
    else
        GetCurrentSkaterProfileIndex
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> <name> <value>
    endif
endscript


script stats_menu_get_skater_name_and_family 
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    return {skater_name = <name> skater_family = <skater_family>}
endscript


script stats_menu_update_row highlight_rgba = [ 100 100 100 80 ] locked_highlight_rgba = [ 50 50 50 80 ] slider_rgba = [ 128 128 128 0 ]
    if IsTrue gary_debug
        if GotParam skater_name
            script_assert 'Get rid of skater name'
        endif
    endif
    if ScreenElementExists id = sub_menu
        sub_menu ::getsingletag skater_name
        GetStatValue <name> skater = <skater_name>
    else
        if GotParam pro_name
            GetStatValue <name> skater = <pro_name>
        else
            GetStatValue <name>
        endif
    endif
    need_count = 0
    if NOT LevelIs load_mainmenu
        if NOT GameModeEquals is_classic
            if ScreenElementExists id = sub_menu
                if sub_menu ::getsingletag can_edit
                    if NOT GotParam overridden
                        need_count = 1
                    endif
                endif
            endif
        endif
    endif
    if (<stat_value> > 10)
        <stat_value> = 10
    endif
    if (<need_count> = 1)
        get_stats_menu_goal_count name = <name>
    else
        count = <stat_value>
    endif
    SetScreenElementProps {
        id = {<row_id> child = roundbar_left}
        rgba = <highlight_rgba>
    }
    SetScreenElementProps {
        id = {<row_id> child = roundbar_middle}
        rgba = <highlight_rgba>
    }
    SetScreenElementProps {
        id = {<row_id> child = roundbar_right}
        rgba = <highlight_rgba>
    }
    <index> = 0
    begin 
    FormatText checksumname = local_id 'star_%i' i = <index>
    alpha = 1
    if (<index> < <count>)
        color = stats_menu_star_highlight
        if NOT (<index> < <stat_value>)
            alpha = 0.3000
        endif
    else
        color = stats_menu_star_lowlight
    endif
    SetScreenElementProps {
        id = {<row_id> child = <local_id>}
        rgba = <color>
    }
    DoScreenElementMorph id = {<row_id> child = <local_id>}alpha = <alpha>
    <index> = (<index> + 1)
    repeat 10
    if ScreenElementExists id = stat_count
        update_stats_menu_count <...> 
    endif
endscript


script stats_menu_focus 
    if GameModeEquals is_classic
        stats_menu_classic_focus <...> 
    endif
    stats_menu_update_row {
        name = <name>
        row_id = <row_id>
        highlight_rgba = stats_menu_bar_highlight
    }
    stats_menu_done_focus <...> 
endscript


script stats_menu_unfocus 
    if GameModeEquals is_classic
        stats_menu_classic_unfocus <...> 
    endif
    stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = [ 50 50 50 100 ] bar_bg_rgba = [ 100 100 100 128 ]
    stats_menu_done_unfocus <...> 
endscript


script stats_menu_done_focus description = ''
    gettags
    Theme_GetHighlightedTextColorNew return_value = text_rgba
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if ObjectExists id = stat_title
        FormatText textname = stat_title '%i:' i = <string>
        SetScreenElementProps {
            id = stat_title
            text = <stat_title>
        }
    endif
    if ObjectExists id = stat_point_description
        SetScreenElementProps {
            id = stat_point_description
            text = <description>
        }
    endif
    if ScreenElementExists id = {<row_id> child = bg_bar}
        DoScreenElementMorph id = {<row_id> child = bg_bar}alpha = 0.7500
    endif
    build_stat_goals_menu stat_type = <name>
endscript


script stats_menu_done_unfocus 
    gettags
    Theme_GetUnhighlightedTextColorNew return_value = text_rgba
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if ScreenElementExists id = {<row_id> child = bg_bar}
        DoScreenElementMorph id = {<row_id> child = bg_bar}alpha = 0
    endif
endscript


script stats_menu_exit 
    UpdateSkaterStats player = 0
    if LevelIs load_mainmenu
        skater ::add_skater_to_world
        launch_ss_menu
    else
        create_your_options_menu
    endif
endscript

