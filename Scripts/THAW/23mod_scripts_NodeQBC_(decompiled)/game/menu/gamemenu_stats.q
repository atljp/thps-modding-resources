stats_menu_bar_highlight = [ 55 55 110 128 ]
stats_menu_bar_lowlight = [ 50 50 50 128 ]
stats_menu_star_highlight = [ 85 85 0 110 ]
stats_menu_star_lowlight = [ 10 10 10 128 ]
helper_text_change_elements = [
    { text = '\b6/\b5 = Zmieñ' }
    { text = '\m1/\m0 = Gotowe' }
]
helper_text_select_elements = [
    { text = '\b7/\b4/\b6/\b5 = Wybierz' }
    { text = '\m1 = Wstecz' }
    { text = '\m0 = Zmieñ' }
]
helper_text_select_elements_no_change = [
    { text = '\m1 = Wstecz' }
]
helper_text_classic_elements = [
    { text = '\b7/\b4 = Zaznacz' }
    { text = '\b6/\b5 = Zmieñ' }
    { text = '\m1 = Wstecz' }
]
ability_strings = [
    'manual'
    'revert'
    'spine transfer'
    'liptrick'
    'wallride'
    'wallplant'
    'vert wallplant'
    'doubletap flip'
    'doubletap grab'
    'tripletap flip'
    'extra grind'
    'freestyle'
    'natas spin'
    'extra natas'
    'boneless'
    'nocomply'
    'pressure flip'
    'nollie'
    'ride switch'
    'get special'
    'focus'
    'flip and roll'
    'stall'
    'skitch'
    'caveman'
    'wallrun'
    'wallhang'
    'wallflip'
    'tag'
    'board smack'
    'board throw'
    'bertslide'
    'walking flip'
    'boned ollie'
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
    Theme_GetHighlightedTextColor return_value = on_color
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
        text = 'EDYTUJ STAT.'
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
        Pos = (205.0, 240.0)
        just = [ center center ]
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
        num_parts = 3.500
    else
        Helpers = (helper_text_select_elements)
        height = 254
        Scale = (65.0, 21.5)
        num_parts = 6
    endif
    kill_start_key_binding
    make_new_themed_sub_menu {
        Title = 'OBEJRZYJ STAT.'
        Pos = (70.0, 94.0)
        skateshop_pos = (60.0, 97.0)
        dims = (640.0, 300.0)
        no_menu_title = no_menu_title
    }
    if ((GameModeEquals is_singlesession)|| (GameModeEquals is_classic))
        Helpers = (helper_text_select_elements_no_change)
        height = 254
        Scale = (65.0, 8.5)
        num_parts = 3.500
    else
        if (<skater_family> = family_custom)
            sub_menu ::settags can_edit
        endif
    endif
    create_helper_text helper_text_elements = <Helpers>
    sub_menu ::settags skater_name = <skater_name>
    Theme_GetUnhighlightedTextColor return_value = off_color
    Theme_GetHighlightedTextColor return_value = on_color
    CreateScreenElement {
        type = vmenu
        parent = sub_menu
        id = sub_vmenu2
        font = small
        just = [ left top ]
        Pos = (320.0, 106.0)
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
    if sub_menu ::getsingletag can_edit
        FormatText textname = stat_title '%i:' i = ((stat_names [ 0 ]).string)
        CreateScreenElement {
            type = TextElement
            parent = sub_menu
            id = stat_title
            Pos = (235.0, 215.0)
            font = small
            just = [ RIGHT top ]
            Scale = 1.500
            text = <stat_title>
            rgba = <on_color>
            rot_angle = 1
            z_priority = 4
        }
        CreateScreenElement {
            type = TextElement
            parent = sub_menu
            id = stat_count
            Pos = (255.0, 215.0)
            font = small
            just = [ RIGHT top ]
            Scale = 1.500
            text = ''
            rgba = <on_color>
            rot_angle = 1
            z_priority = 20
        }
        CreateScreenElement {
            type = TextBlockElement
            parent = sub_menu
            id = stat_count2
            Pos = (360.0, 203.0)
            dims = (250.0, 60.0)
            font = small
            just = [ left top ]
            internal_just = [ left center ]
            line_spacing = 0.8000
            Scale = 0.9000
            text = ''
            rgba = <on_color>
            rot_angle = 0
            z_priority = 4
        }
        CreateScreenElement {
            type = TextElement
            parent = sub_menu
            Pos = (310.0, 215.0)
            font = small
            just = [ RIGHT top ]
            Scale = 1.500
            text = '/10'
            rgba = <on_color>
            rot_angle = 1
            z_priority = 4
        }
    endif
    Theme_GetAltColor return_value = alt_color
    if sub_menu ::getsingletag can_edit
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            texture = white2
            Pos = ((320.0, 22.0) + <height> * (0.0, 1.0))
            just = [ center top ]
            Scale = (63.5, 0.25)
            rgba = <alt_color>
            alpha = 0.7000
        }
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
            rot_angle = 0
            z_priority = 20
        }
    endif
    theme_background width = 6.400 Pos = (320.0, 85.0) num_parts = <num_parts> parent = sub_menu bg_rgba = [ 30 30 35 70 ]
    if sub_menu ::getsingletag can_edit
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            texture = white2
            Pos = (320.0, 252.0)
            just = [ center top ]
            Scale = (63.5, 0.25)
            rgba = <on_color>
            alpha = 0.7000
        }
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            texture = white2
            Pos = (322.0, 210.0)
            just = [ center top ]
            Scale = (63.5, 0.25)
            rgba = <on_color>
            alpha = 0.7000
        }
    endif
    if ((GameModeEquals is_singlesession)|| (GameModeEquals is_classic))
        GetCurrentLevel
        GetLevelRecords level = <level>
        FormatText textname = combo_string '%a' a = (((<bestcombos>.RecordTable)[ 0 ]).value)usecommas
        <combo_text> = ('NAJLEPSZE COMBO:' + <combo_string>)
        CreateScreenElement {
            type = TextElement
            parent = sub_menu
            id = stat_combo
            Pos = ((320.0, 0.0) + <height> * (0.0, 1.0))
            font = dialog
            just = [ center top ]
            Scale = (1.25, 1.25)
            text = <combo_text>
            rgba = <off_color>
            rot_angle = 0
            z_priority = 10
            alpha = 1.0
        }
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            id = stat_combo_bg
            texture = de_m_m
            Pos = ((320.0, -2.0) + <height> * (0.0, 1.0))
            Scale = (6.25, 1.25)
            rot_angle = 0
            rgba = [ 20 20 20 60 ]
            just = [ center top ]
            z_priority = 6
        }
    endif
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
    if NOT InFrontend
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

script build_stats_poster 
    change entering_cas_store = 0
    CreateScreenElement {
        type = ContainerElement
        id = poster_anchor
        parent = <parent>
        z_priority = 999
        just = [ center center ]
        internal_just = [ left top ]
        Scale = 1.0
        Pos = (-80.0, -100.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = white2
        Scale = (48.0, 45.0)
        Pos = (120.0, 50.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 500
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = white2
        Scale = (48.0, 45.0)
        Pos = (119.0, 50.0)
        rgba = [ 128 128 128 78 ]
        just = [ left top ]
        z_priority = 499
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = goal_grad
        Scale = (10.0, 45.0)
        Pos = (490.0, 120.0)
        rgba = [ 0 0 0 48 ]
        just = [ left top ]
        z_priority = 500
        rot_angle = 84
        skew = [ 0.2000 0.0 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = white2
        Scale = (46.0, 43.5)
        Pos = (127.0, 54.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 501
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = white2
        Scale = (47.0, 6.0)
        Pos = (127.0, 110.0)
        rgba = [ 0 0 0 88 ]
        just = [ left top ]
        z_priority = 502
        rot_angle = 0
        skew = [ 0.2000 0.0 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = pa_logo
        Scale = (1.0, 1.0)
        Pos = (357.0, 120.0)
        rgba = [ 128 128 128 128 ]
        just = [ left top ]
        z_priority = 550
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = de_t_l
        Scale = (3.4000000953674316, 2.0)
        Pos = (186.0, 153.0)
        rgba = [ 128 128 128 38 ]
        just = [ left top ]
        z_priority = 504
        rot_angle = 90
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = heart
        Scale = (1.399999976158142, 1.600000023841858)
        Pos = (285.0, 301.0)
        rgba = [ 128 128 128 0 ]
        just = [ left top ]
        z_priority = 505
        skew = [ -0.1000 0.0 ]
        rot_angle = -2
        z_priority = 507
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = heart
        Scale = (0.800000011920929, 1.2000000476837158)
        Pos = (440.0, 374.0)
        rgba = [ 0 0 0 0 ]
        just = [ left top ]
        z_priority = 505
        rot_angle = 30
        skew = [ 1.500 0.0 ]
        z_priority = 506
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = white2
        Scale = (47.0, 5.0)
        Pos = (127.0, 370.0)
        rgba = [ 0 0 0 38 ]
        just = [ left top ]
        z_priority = 502
        rot_angle = 0
        z_priority = 505
    }
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = spazzburst
        Scale = (4.599999904632568, 4.599999904632568)
        Pos = (210.0, 100.0)
        rgba = [ 128 128 128 48 ]
        just = [ left top ]
        z_priority = 500
        rot_angle = 6
        z_priority = 502
    }
    CreateScreenElement {
        type = TextElement
        parent = poster_anchor
        id = sponsor_text
        text = 'SPONSOR'
        font = newtrickfont
        Scale = 1.300
        z_priority = 510
        Pos = (250.0, 76.0)
        rgba = [ 120 16 53 128 ]
        rot_angle = -7
        z_priority = 509
    }
    CreateScreenElement {
        type = TextElement
        parent = poster_anchor
        id = Challenges_text
        text = 'WYZWANIA'
        font = newtrickfont
        Scale = 1.500
        z_priority = 510
        Pos = (266.0, 98.0)
        rgba = [ 120 16 53 128 ]
        rot_angle = -9
        z_priority = 508
    }
    if (<group_num> > 0)
        title_text = (stats_groups [(<group_num> -1)].name)
        CreateScreenElement {
            type = TextElement
            parent = poster_anchor
            id = store_text
            text = <title_text>
            font = dialog
            Scale = 1.300
            z_priority = 510
            Pos = (245.0, 136.0)
            rgba = [ 60 60 60 128 ]
            rot_angle = 0
            z_priority = 511
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = poster_anchor
        texture = de_t_l
        Scale = (5.900000095367432, 10.0)
        Pos = (119.0, 85.0)
        rgba = [ 128 128 128 38 ]
        just = [ left top ]
        z_priority = 502
        rot_angle = 0
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = poster_anchor
        id = tomorrow_text
        text = 'wróæ jutro po\nwiêcej wyzwañ!'
        dims = (400.0, 300.0)
        font = newtrickfont
        Scale = 1.0
        z_priority = 510
        Pos = (326.0, 240.0)
        rgba = [ 25 35 24 128 ]
        z_priority = 508
    }
endscript

script stat_poster_add_item 
    StatsManager_GetGoalGroupNum num = <foreachin_index>
    if GotParam target_group_num
        if NOT (<target_group_num> = <group_num>)
            return 
        endif
    endif
    rgba = [ 128 128 128 128 ]
    skater ::StatsManager_GetGoalStatus num = <foreachin_index>
    if (<status> = complete)
        alpha = 0
    else
        alpha = 1
        DoScreenElementMorph id = tomorrow_text alpha = 0
        <parent> ::settags show_accept_decline = 1
    endif
    GoalManager_GetDifficultyLevel
    string = <text>
    value = (<value> [ <difficulty_level> ])
    if (<status> = locked)
        GetAbilityIndex <ability>
        ability_text = (ability_strings [ <ability_index> ])
        FormatText textname = text 'Aby odblokowaæ, naucz siê %a' a = <ability_text>
        rgba = [ 80 80 80 100 ]
    else
        if (<value> = 1)
            string = <alt_text>
        endif
        if GotParam value_string
            vstring = (<value_string> [ <difficulty_level> ])
        endif
        if NOT GotParam no_commas
            FormatText textname = text <string> i = <value> s = <vstring> usecommas
        else
            FormatText textname = text <string> i = <value> s = <vstring>
        endif
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        just = [ center center ]
        internal_just = [ left top ]
        alpha = <alpha>
        dims = (300.0, 50.0)
        not_focusable
    }
    parent_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        texture = white2
        Scale = (33.0, 0.5)
        Pos = (60.0, 50.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 503
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (6.0, 7.0)
        rgba = [ 60 60 60 128 ]
        just = [ left top ]
        rot_angle = 10
        z_priority = 523
    }
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        text = <text>
        font = testtitle
        Scale = (0.8999999761581421, 1.0)
        z_priority = 510
        Pos = (188.0, 35.0)
        rgba = <rgba>
        rot_angle = 0
        z_priority = 512
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        texture = white2
        Scale = (46.0, 3.0)
        Pos = (0.0, 23.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 503
    }
endscript

script get_stats_menu_goal_count 
    skater ::StatsManager_GetStatValue stattype = <name>
    return count = <stat_value>
endscript

script update_stats_menu_count 
    if NOT ScreenElementExists id = stat_count
        return 
    endif
    if GameModeEquals is_classic
        GetStatValue <name>
        if GotParam overridden
            text = 'PRZEJMOWANIE KONTROLI!'
        else
            GetStatValue points_available
            FormatText textname = text 'Dostêpne punkty: %i' i = <stat_value>
        endif
        SetScreenElementProps id = stat_count text = <text>
        return 
    endif
    GetStatValue <name>
    printstruct <...> 
    if (<stat_value> > 10)
        stat_value = 10
    endif
    FormatText textname = text '%i' i = <stat_value>
    SetScreenElementProps id = stat_count text = <text>
    if GotParam overridden
        text = 'TE WARTOCI S¥ W£ANIE OMIJANE'
    else
        if sub_menu ::getsingletag can_edit
            get_stats_menu_goal_count name = <name>
            left = (<count> - <stat_value>)
            <row_id> ::getsingletag display_string
            FormatText textname = text '%i %a dostêpnych punktów' i = <left> a = <display_string>
        else
            FormatText textname = text 'Nie mo¿esz zmieniaæ statystyk kolegi z dru¿yny!' i = <left> a = <display_string>
        endif
    endif
    if ScreenElementExists id = stat_count2
        SetScreenElementProps id = stat_count2 text = <text>
    endif
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
    ForEachIn {
        stats_goals
        do = stats_goal_menu_item_add
        params = {
            parent = stat_goal_menu
            target_stat_type = <stat_type>
            just = [ center top ]
            internal_just = [ center center ]
            line_scale = (61.0, 0.30000001192092896)
            rgba = <on_rgba>
        }
        pass_index
    }
endscript

script stats_goal_menu_item_add 
    if GotParam target_stat_type
        if NOT (<target_stat_type> = <stattype>)
            return 
        endif
    endif
    if GotParam target_group_num
        if NOT (<target_group_num> = <group_num>)
            return 
        endif
    endif
    skater ::StatsManager_GetGoalStatus num = <foreachin_index>
    GoalManager_GetDifficultyLevel
    string = <text>
    value = (<value> [ <difficulty_level> ])
    if (<value> = 1)
        string = <alt_text>
    endif
    if GotParam value_string
        vstring = (<value_string> [ <difficulty_level> ])
    endif
    if NOT GotParam no_commas
        FormatText textname = text <string> i = <value> s = <vstring> usecommas
    else
        FormatText textname = text <string> i = <value> s = <vstring>
    endif
    switch <status>
        case locked
        text = '?????'
        alpha = 0.5000
        focusable = not_focusable
        case unlocked
        alpha = 0.5000
        case active
        case pending
        text = ('AKTYWNY:' + <text>)
        alpha = 1.0
        case complete
        alpha = 1.0
        rgba = [ 30 30 30 80 ]
        focusable = not_focusable
        default 
        scriptassert 'Nieznany stan zadania'
    endswitch
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        just = <just>
        internal_just = <internal_just>
        dims = (0.0, 20.0)
        <focusable>
        tags = { tag_grid_x = <foreachin_index> }
    }
    anchor_id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        just = <just>
        Scale = 0.8000
        text = <text>
        rgba = <rgba>
        z_priority = 4
        alpha = <alpha>
    }
    if ChecksumEquals a = <status> b = complete
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white2
            just = <internal_just>
            Scale = <line_scale>
            Pos = (0.0, 9.0)
            rgba = <rgba>
            z_priority = 5
            alpha = <alpha>
        }
    endif
    return <...> 
endscript

script focus_stats_vmenu 
    if ScreenElementExists \{ id = change_stat_sub_anchor }
        stats_change_menu_left <...> 
        return 
    endif
    playsound \{ MenuUp vol = 100 }
    FireEvent \{ type = unfocus target = sub_vmenu2 }
    FireEvent type = focus target = sub_vmenu Data = { grid_index = <grid_index> }
endscript

script focus_stats_vmenu2 
    if ScreenElementExists \{ id = change_stat_sub_anchor }
        stats_change_menu_right <...> 
        return 
    endif
    playsound \{ MenuUp vol = 100 }
    FireEvent \{ type = unfocus target = sub_vmenu }
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
    if InFrontend
        CreateScreenElement {
            type = SpriteElement
            parent = <stats_parent>
            texture = new_bg_2
            Pos = (420.0, 245.0)
            Scale = (0.75, 1.149999976158142)
            rgba = [ 0 0 0 80 ]
            just = [ left top ]
            rot_angle = 176
        }
    endif
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

script stats_menu_add_item z_priority = 2 pad_right_script = null_script pad_left_script = null_script
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
    if InFrontend
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
    if ScreenElementExists \{ id = right_arrow }
        DestroyScreenElement \{ id = right_arrow }
        DestroyScreenElement \{ id = left_arrow }
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
    Theme_GetPauseBarColor \{ return_value = bar_color }
    setprops rgba = <bar_color>
    DoMorph \{ alpha = 0.9000 }
    begin 
    DoMorph \{ Pos = (6.5, 4.0) time = 0.5000 anim = gentle }
    DoMorph \{ Pos = (-0.20000000298023224, 4.0) time = 0.5000 anim = gentle }
    repeat 
endscript

script kill_stats_change_menu 
    DestroyScreenElement \{ id = change_stat_sub_anchor }
    highlight_bar_id = {<parent> child = {<name> child = { bg_bar child = stat_roundbar_highlight }}}
    if ScreenElementExists id = <highlight_bar_id>
        DestroyScreenElement id = <highlight_bar_id>
    endif
    FireEvent type = focus target = <parent>
    create_helper_text \{ helper_text_elements = helper_text_select_elements }
endscript

script stats_change_menu_right 
    if ScreenElementExists id = right_arrow
        DoScreenElementMorph id = right_arrow alpha = 0
        DoScreenElementMorph id = right_arrow alpha = 1 time = 0.2000
    endif
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
    if ScreenElementExists id = left_arrow
        DoScreenElementMorph id = left_arrow alpha = 0
        DoScreenElementMorph id = left_arrow alpha = 1 time = 0.2000
    endif
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
    if GameModeEquals \{ is_classic }
        SetClassicStat <name> <value>
    else
        GetCurrentSkaterProfileIndex
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> <name> <value>
    endif
endscript

script stats_menu_get_skater_name_and_family 
    GetCurrentSkaterProfileIndex
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> name
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> skater_family
    return {skater_name = <name> skater_family = <skater_family>}
endscript

script stats_menu_update_row highlight_rgba = [ 100 100 100 80 ] locked_highlight_rgba = [ 50 50 50 80 ] slider_rgba = [ 128 128 128 0 ]
    if IsTrue gary_debug
        if GotParam skater_name
            script_assert 'Pozb¹d siê imienia'
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
    if NOT InFrontend
        if ScreenElementExists id = sub_menu
            if sub_menu ::getsingletag can_edit
                if NOT GotParam overridden
                    need_count = 1
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
    if GameModeEquals \{ is_classic }
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
    if GameModeEquals \{ is_classic }
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
endscript

script stats_menu_done_unfocus 
    gettags
    Theme_GetUnhighlightedTextColorNew \{ return_value = text_rgba }
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if ScreenElementExists id = {<row_id> child = bg_bar}
        DoScreenElementMorph id = {<row_id> child = bg_bar}alpha = 0
    endif
endscript

script stats_menu_exit 
    UpdateSkaterStats \{ player = 0 }
    if InFrontend
        skater ::add_skater_to_world
        launch_ss_menu
    else
        create_your_options_menu
    endif
endscript
stats_unlocked_at_start = 0

script stats_selection_ped_setup 
    if NOT GameModeEquals is_career
        return 
    endif
    if (stats_unlocked_at_start = 0)
        if GoalManager_GoalExists name = z_ho_goal_gaps31
            <activate_stat_challenges> = 0
            if GoalManager_HasWonGoal name = z_ho_goal_gaps31
                <activate_stat_challenges> = 1
            endif
            if GoalManager_GoalIsActive name = z_ho_goal_gaps31
                <activate_stat_challenges> = 1
            endif
            if (<activate_stat_challenges> = 0)
                return 
            endif
        endif
    endif
    setup_ped_speech {
        <...> 
        dont_deactivate_goals
        accept_text = 'Aby przejrzeæ wyzwania podnosz¹ce cechy, wcinij \ms'
        activation_script = stats_selection_menu_create
        activation_script_params = {}
    }
endscript

script stats_selection_menu_create 
    if NOT GoalManager_GoalIsActive name = z_ho_goal_gaps31
        goal_check_goal_already_active
    endif
    GetLevelStructureName
    FormatText checksumname = level_checksum '%l' l = (<level_structure_name>.level)
    StatsManager_GetGroupNumFromLevel <level_checksum>
    if NOT GotParam group_num
        return 
    endif
    hide_all_hud_items
    pausegame
    kill_start_key_binding
    Theme_GetUnhighlightedTextColor return_value = on_rgba
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = stats_selection_anchor
        just = [ left top ]
        internal_just = [ left top ]
        Pos = (100.0, 80.0)
    }
    AssignAlias id = stats_selection_anchor alias = current_menu_anchor
    anchor_id = <id>
    build_stats_poster parent = <anchor_id> group_num = <group_num>
    CreateScreenElement {
        type = vmenu
        parent = <anchor_id>
        id = stat_goal_selection_menu
        font = dialog
        just = [ left top ]
        Pos = (84.0, 70.0)
        padding_scale = 0.7500
        internal_scale = 1
        internal_just = [ center top ]
        alpha = 1
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = stats_selection_menu_exit }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
    }
    AssignAlias id = stat_goal_selection_menu alias = current_menu
    stats_selection_menu_refresh group_num = <group_num>
    stat_goal_selection_menu ::gettags
    if GotParam show_accept_decline
        StatsManager_GetActiveGroupNum
        if NOT (<active_group_num> = <group_num>)
            CreateScreenElement {
                type = ContainerElement
                parent = stat_goal_selection_menu
                just = [ center center ]
                internal_just = [ left top ]
                alpha = <alpha>
                dims = (300.0, 50.0)
                event_handlers = [{pad_choose accept_stat_challenge params = { group_num = <group_num> }}
                    { focus stats_selection_menu_item_focus }
                    { unfocus stats_selection_menu_item_unfocus }
                ]
            }
            CreateScreenElement {
                type = TextElement
                parent = <id>
                text = 'AKCEPTUJ'
                font = newtrickfont
                Scale = (0.75, 0.8500000238418579)
                z_priority = 510
                Pos = (188.0, 45.0)
                rgba = [ 128 128 128 128 ]
                rot_angle = 0
                z_priority = 512
            }
            CreateScreenElement {
                type = ContainerElement
                parent = stat_goal_selection_menu
                just = [ center center ]
                internal_just = [ left top ]
                alpha = <alpha>
                dims = (300.0, 50.0)
                event_handlers = [{pad_choose generic_menu_pad_back params = { callback = stats_selection_menu_exit }}
                    { focus stats_selection_menu_item_focus }
                    { unfocus stats_selection_menu_item_unfocus }
                ]
            }
            CreateScreenElement {
                type = TextElement
                parent = <id>
                text = 'ODMÓW'
                font = newtrickfont
                Scale = (0.75, 0.8500000238418579)
                z_priority = 510
                Pos = (188.0, 35.0)
                rgba = [ 128 128 128 128 ]
                rot_angle = 0
                z_priority = 512
            }
            <helper_text> = [
                { text = '\b7/\b4 = Zaznacz' }
                { text = '\m1 = Wyjd' }
                { text = '\m0 = Wybierz' }
            ]
        else
            <helper_text> = [
                { text = '\b7/\b4 = Zaznacz' }
                { text = '\m1 = Wyjcie' }
            ]
        endif
    else
        <helper_text> = [
            { text = '\b7/\b4 = Zaznacz' }
            { text = '\m1 = Wyjcie' }
        ]
    endif
    create_helper_text {
        helper_pos = (230.0, 350.0)
        helper_text_elements = <helper_text>
    }
    FireEvent type = focus target = stat_goal_selection_menu
endscript

script accept_stat_challenge 
    generic_menu_pad_choose_sound
    skater ::StatsManager_Activate
    skater ::StatsManager_ActivateGoals exclusive group_num = <group_num>
    stats_selection_menu_exit
endscript

script stats_selection_menu_exit 
    if ScreenElementExists \{ id = stats_selection_anchor }
        DestroyScreenElement \{ id = stats_selection_anchor }
    endif
    Debounce \{ x time = 0.3000 }
    Debounce \{ triangle time = 0.3000 }
    Debounce \{ Circle time = 0.3000 }
    pause_menu_gradient \{ Off }
    show_all_hud_items
    UnPauseGame
endscript

script stats_selection_menu_refresh parent = stat_goal_selection_menu last_index = 0
    SetScreenElementLock id = <parent> Off
    DestroyScreenElement id = <parent> preserve_parent
    <parent> ::removetags [ local_goal_count ]
    ForEachIn {
        stats_goals
        do = stat_poster_add_item
        params = {
            parent = <parent>
            target_group_num = <group_num>
            just = [ left top ]
            internal_just = [ left center ]
            line_scale = (61.0, 0.30000001192092896)
            rgba = <on_rgba>
        }
        pass_index
    }
    GetScreenElementProps id = tomorrow_text
    if NOT (<alpha> = 0)
        GetLevelStructureName
        FormatText checksumname = level_checksum '%l' l = (<level_structure_name>.level)
        index = (stats_spot_values.<level_checksum>.start)
        max_index = (stats_spot_values.<level_checksum>.end)
        begin 
        skater ::StatsManager_GetGoalStatus num = <index>
        if NOT (<status> = complete)
            break 
        endif
        if (<index> = <max_index>)
            SetScreenElementProps id = tomorrow_text text = 'nie ma ju¿ wyzwañ\nw tym sklepie'
            break 
        endif
        index = (<index> + 1)
        repeat 
    endif
    FireEvent type = focus target = <parent> Data = { grid_index = <last_index> }
endscript

script stats_goal_menu_item_selectable_add 
    stats_goal_menu_item_add <...> 
    if NOT GotParam anchor_id
        return 
    endif
    local_goal_count = 0
    <parent> ::getsingletag local_goal_count
    local_goal_count = (<local_goal_count> + 1)
    <parent> ::settags local_goal_count = <local_goal_count>
    FormatText textname = number_string '%n.' n = <local_goal_count>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        just = <just>
        Scale = 0.8000
        Pos = (-28.0, 0.0)
        text = <number_string>
        rgba = <rgba>
        z_priority = 4
        alpha = <alpha>
    }
    if ChecksumEquals a = <status> b = locked
        stat_string = '???'
    else
        GetArraySize stat_names
        i = 0
        begin 
        if ChecksumEquals a = (stat_names [ <i> ].name)b = <stattype>
            stat_string = (stat_names [ <i> ].string)
            break 
        endif
        i = (<i> + 1)
        repeat <array_size>
    endif
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        just = <just>
        Scale = 0.8000
        Pos = (400.0, 0.0)
        text = <stat_string>
        rgba = <rgba>
        z_priority = 4
        alpha = <alpha>
    }
    <anchor_id> ::setprops {
        event_handlers = [
            {
                pad_choose
                stats_selection_menu_item_choose
                params = <...> 
            }
            { focus stats_selection_menu_item_focus }
            { unfocus stats_selection_menu_item_unfocus }
        ]
    }
endscript

script stats_selection_menu_item_focus 
    obj_getid
    GetScreenElementChildren id = <ObjID>
    GetArraySize \{ children }
    i = 0
    begin 
    RunScriptOnScreenElement id = (<children> [ <i> ])stats_selection_menu_update_color params = { on }
    i = (<i> + 1)
    repeat <array_size>
endscript

script stats_selection_menu_update_color 
    if GotParam \{ on }
        GetProps
        settags old_rgba = <rgba>
        Theme_GetHighlightedTextColorNew \{ return_value = rgba }
        setprops rgba = <rgba>
    else
        if NOT getsingletag \{ old_rgba }
            Theme_GetUnhighlightedTextColor \{ return_value = old_rgba }
        endif
        setprops rgba = <old_rgba>
    endif
endscript

script stats_selection_menu_item_unfocus \{old_rgba = [ 88 105 112 128 ]}
    obj_getid
    GetScreenElementChildren id = <ObjID>
    GetArraySize \{ children }
    i = 0
    begin 
    RunScriptOnScreenElement id = (<children> [ <i> ])stats_selection_menu_update_color
    i = (<i> + 1)
    repeat <array_size>
endscript

script stats_selection_menu_item_choose 
    skater ::StatsManager_ActivateGoals {
        group_num = <group_num>
        stattype = <stattype>
        goaltype = <goaltype>
        exclusive
    }
    stats_selection_menu_refresh {
        last_index = <foreachin_index>
        group_num = <group_num>
    }
endscript
