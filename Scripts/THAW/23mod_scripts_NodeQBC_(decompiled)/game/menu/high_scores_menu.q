
script high_scores_menu_enter_initials 
    SetScreenElementLock id = root_window Off
    if NOT InFrontend
        pausegame
    endif
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    kill_start_key_binding
    GoalManager_HidePoints
    GetInitialsString
    if NOT GotParam allow_back
        no_back = no_back
    endif
    if IsNGC
        <heap> = TopDown
    endif
    create_onscreen_keyboard {
        text = <string>
        no_back = <no_back>
        keyboard_done_script = high_scores_menu_entered_initials
        <...> 
        keyboard_title = 'WPISZ INICJA£Y'
        min_length = 1
        max_length = 3
        heap = <heap>
    }
endscript

script high_scores_menu_entered_initials 
    GetTextElementString \{ id = keyboard_current_string }
    SetInitialsString string = <string>
    UpdateInitials
    destroy_onscreen_keyboard
    if GameModeEquals \{ is_classic is_coop }
        if GotParam \{ from_ss_menu }
            create_ss_menu
        else
            create_single_or_coop_menu
        endif
    else
        high_scores_menu_create new_initials = <string> restart_node = <restart_node>
    endif
endscript

script high_scores_menu_create 
    if GameModeEquals is_classic
        if (classic_mode_in_end_run_sequence = 1)
            GetInitialsString
            new_initials = <string>
        endif
    endif
    SetScreenElementLock id = root_window Off
    if NOT GotParam from_options
        pausegame
    endif
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if ObjectExists id = menu_parts_anchor
        DestroyScreenElement id = menu_parts_anchor
    endif
    if InFrontend
        main_menu_camera_control next_state = optscores
        make_new_themed_sub_menu {
            menu_id = high_scores_records_menu
            Title = 'REKORDY'
            just = [ center center ]
            no_grad_bar
        }
    else
        make_new_themed_sub_menu {
            menu_id = high_scores_records_menu
            Title = 'REKORDY'
            just = [ center center ]
        }
    endif
    AssignAlias id = high_scores_records_menu alias = sub_menu
    kill_start_key_binding
    Theme_GetHighlightedTextColor return_value = on_color
    Theme_GetUnhighlightedTextColor return_value = off_color
    Theme_GetIconOnColor return_value = on_icon_color
    if GotParam from_options
        theme_background parent = sub_menu id = bg_box_vmenu width = 5 Pos = (320.0, 60.0) num_parts = 11 z_priority = 1
        DoScreenElementMorph id = bg_box_vmenu Scale = (1.0, 0.9800000190734863)
        SetScreenElementProps {id = sub_menu
            event_handlers = [{ pad_choose null_script }
                { pad_start null_script }
                {pad_back generic_menu_pad_back params = { callback = high_scores_menu_exit from_options }}
                {pad_left high_scores_change_level params = {level = <level> left}}
                {pad_right high_scores_change_level params = {level = <level> RIGHT}}
            ]
            replace_handlers
        }
        create_helper_text {helper_text_elements = [{ text = '\b6/\b5 = Wybierz' }
                { text = '\m1 = Wstecz' }
            ]
        }
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            texture = black
            rgba = [ 0 0 0 128 ]
            Scale = (109.5, 5.5)
            Pos = (320.0, 65.0)
            just = [ center top ]
            z_priority = 1.100
        }
        CreateScreenElement {
            type = TextElement
            parent = sub_menu
            font = dialog
            rgba = <off_color>
            text = <level_name>
            Scale = 0.9500
            Pos = (220.0, 65.0)
            just = [ center top ]
            z_priority = 5
        }
        GetScreenElementPosition id = <id>
        GetScreenElementDims id = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            id = high_scores_left_arrow
            texture = left_arrow
            Scale = (0.699999988079071, 0.6000000238418579)
            Pos = (<screenelementpos> - (5.0, 0.0))
            just = [ RIGHT top ]
            rgba = <on_color>
            z_priority = 5
        }
        CreateScreenElement {
            type = SpriteElement
            parent = sub_menu
            id = high_scores_right_arrow
            texture = right_arrow
            Scale = (0.699999988079071, 0.6000000238418579)
            Pos = (<screenelementpos> + <width> * (1.0, 0.0) + (5.0, 1.0))
            just = [ left top ]
            rgba = <on_color>
            z_priority = 5
        }
        <root_pos> = (100.0, 50.0)
        <top_bar_b> = (1.0, 34.0)
        <blue_pixel> = (1.0, 15.0)
    else
        pause_menu_gradient on
        theme_background parent = sub_menu id = bg_box_vmenu width = 5 Pos = (320.0, 85.0) num_parts = 10 z_priority = 1
        if GotParam from_pause
            SetScreenElementProps {id = sub_menu
                event_handlers = [{ pad_choose null_script }
                    {pad_back high_scores_menu_exit params = { from_pause = from_pause }}
                    { pad_start null_script }
                ]
                replace_handlers
            }
            create_helper_text helper_text_elements = [{ text = '\m1 = Wstecz' }]
        else
            SetScreenElementProps {id = sub_menu
                event_handlers = [{pad_choose high_scores_menu_exit params = { restart_node = <restart_node> }}
                    {pad_start high_scores_menu_exit params = { restart_node = <restart_node> }}
                ]
                replace_handlers
            }
            create_helper_text helper_text_elements = [{ text = '\m0 = Kontynuuj' }]
        endif
        <root_pos> = (100.0, 53.0)
        <top_bar_b> = (1.0, 36.0)
        <blue_pixel> = (1.0, 35.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = black
        rgba = [ 0 0 0 128 ]
        Scale = (109.75, 6.0)
        Pos = (<root_pos> + <top_bar_b>)
        just = [ left top ]
        z_priority = 1.100
    }
    Theme_GetHighlightBarColor return_value = bg_color
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = black
        rgba = <bg_color>
        Scale = (0.5, 0.5)
        Pos = (<root_pos> + <blue_pixel>)
        just = [ left top ]
        z_priority = 50
    }
    CreateScreenElement {
        type = TextElement
        parent = sub_menu
        font = dialog
        rgba = [ 118 15 74 128 ]
        text = '5 NAJLEPSZYCH WYNIKÓW'
        Scale = 1.0
        Pos = (<root_pos> + (21.0, 38.0))
        just = [ left top ]
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        id = high_scores_menu_icon
        texture = black
        Pos = <root_pos>
        just = [ left top ]
        rgba = [ 127 102 0 0 ]
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = black
        rgba = [ 0 0 0 0 ]
        Scale = (97.0, 1.0)
        Pos = (<root_pos> + (35.0, 57.0))
        just = [ left top ]
    }
    FormatText checksumname = stat_scores_icon 'stat_scores'
    <five_best_icon_scale> = (1.5199999809265137, 1.2000000476837158)
    GetStackedScreenElementPos y id = <id> Offset = (-10.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        id = high_scores_menu_scores_icon
        texture = <stat_scores_icon>
        Scale = <five_best_icon_scale>
        Pos = <Pos>
        rgba = [ 128 128 128 80 ]
        just = [ left top ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = black
        rgba = [ 0 0 0 128 ]
        Scale = (3.0, 46.0)
        Pos = (<Pos> + (140.0, -8.0))
        just = [ left top ]
        z_priority = 1.100
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = black
        rgba = [ 0 0 0 128 ]
        Scale = (3.0, 66.0)
        Pos = (<Pos> + (205.0, -8.0))
        just = [ left top ]
        z_priority = 1.100
    }
    GetStackedScreenElementPos y id = high_scores_menu_scores_icon Offset = (-4.0, 1.0)
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = black
        rgba = [ 0 0 0 128 ]
        Scale = (109.75, 5.0)
        Pos = (<Pos> + (-20.0, 0.0))
        just = [ left top ]
        z_priority = 1.100
    }
    CreateScreenElement {
        type = TextElement
        parent = sub_menu
        font = dialog
        rgba = [ 118 15 74 128 ]
        text = '5 NAJLEPSZYCH COMBO'
        Scale = 1.0
        Pos = (<Pos> + (0.0, 0.0))
        just = [ left top ]
        z_priority = 5
    }
    FormatText checksumname = stat_comboss_icon 'stat_combos'
    GetStackedScreenElementPos y id = <id> Offset = (2.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        id = high_scores_menu_combos_icon
        texture = <stat_comboss_icon>
        Scale = <five_best_icon_scale>
        rgba = [ 128 128 128 80 ]
        Pos = (<Pos> + (0.0, 0.0))
        just = [ left top ]
        z_priority = 10
    }
    GetStackedScreenElementPos y id = high_scores_menu_combos_icon Offset = (0.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        id = high_scores_menu_lower_yellow_bar
        texture = black
        rgba = <on_color>
        Scale = (109.0, 1.0)
        Pos = (<Pos> + (-22.0, 0.0))
        just = [ left top ]
    }
    GetStackedScreenElementPos y id = high_scores_menu_combos_icon Offset = (0.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        id = high_scores_menu_lower_yellow_bar2
        texture = black
        rgba = <on_color>
        Scale = (109.0, 1.0)
        Pos = (<Pos> + (-22.0, 80.0))
        just = [ left top ]
    }
    GetStackedScreenElementPos x id = high_scores_menu_scores_icon Offset = (10.0, -3.0)
    CreateScreenElement {
        type = vmenu
        parent = sub_menu
        id = high_scores_menu_five_best_high_scores_vmenu
        Pos = <Pos>
        just = [ left top ]
        internal_just = [ left top ]
    }
    GetStackedScreenElementPos x id = high_scores_menu_combos_icon Offset = (10.0, -3.0)
    CreateScreenElement {
        type = vmenu
        parent = sub_menu
        id = high_scores_menu_five_best_combos_vmenu
        Pos = <Pos>
        just = [ left top ]
        internal_just = [ left top ]
    }
    GetStackedScreenElementPos y id = high_scores_menu_lower_yellow_bar Offset = (0.0, 0.0)
    CreateScreenElement {
        type = vmenu
        parent = sub_menu
        id = high_scores_menu_longest_tricks_vmenu
        Pos = (<Pos> + (6.0, 0.0))
        just = [ left top ]
        internal_just = [ left top ]
        z_priority = 3
    }
    high_scores_menu_fill_menus level = <level> new_initials = <new_initials>
    if GotParam no_animate
        finish_themed_sub_menu time = 0.0
    else
        finish_themed_sub_menu
    endif
endscript

script high_scores_menu_exit 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 gameframe
    endif
    if ObjectExists id = menu_parts_anchor
        DestroyScreenElement id = menu_parts_anchor
    endif
    if GotParam from_pause
        goto create_your_options_menu
    endif
    if (classic_mode_in_end_run_sequence = 1)
        classic_mode_do_end_run_stats
        return 
    endif
    restore_start_key_binding
    if GotParam from_options
        create_setup_options_menu
    else
        GoalManager_ShowPoints
        if VibrationIsOn 0
            VibrationOff 0
            VibrationOn 0
        else
            VibrationOff 0
        endif
        if GotParam restart_node
            exit_pause_menu
            if NOT IsInNodeArray <restart_node>
                if GameModeEquals is_singlesession
                    GetCurrentZoneName
                    if InMultiPlayerGame
                        ReformatNetZoneStringName zone_string_name = <zone_name>
                        <zone_name> = <zone_string_name>
                    endif
                    FormatText checksumname = restart_node '%s_TRG_G_TrickAttack_RestartNode' s = <zone_name>
                endif
            endif
            ResetSkaters node_name = <restart_node>
        else
            create_pause_menu no_exit
        endif
    endif
endscript

script high_scores_change_level 
    GetArraySize level_select_menu_level_info
    i = 0
    begin 
    if (((level_select_menu_level_info [ <i> ]).level)= <level>)
        current_index = <i>
    endif
    <i> = (<i> + 1)
    repeat <array_size>
    if NOT GotParam current_index
        scriptassert 'W tabeli wyboru poziomu nie znaleziono nazwy obecnego poziomu'
    endif
    begin 
    if GotParam RIGHT
        current_index = (<current_index> + 1)
        if NOT (<current_index> < <array_size>)
            current_index = 0
        endif
    endif
    if GotParam left
        current_index = (<current_index> -1)
        if (<current_index> < 0)
            current_index = (<array_size> -1)
        endif
    endif
    target_level_params = (level_select_menu_level_info [ <current_index> ])
    <show_this_level> = 1
    if StructureContains structure = target_level_params DEVKIT_ONLY
        <show_this_level> = 0
    endif
    if StructureContains structure = target_level_params park_ed
        <show_this_level> = 0
    endif
    if StructureContains structure = target_level_params collectors_edition_only
        if NOT IsCollectorsEdition
            <show_this_level> = 0
        endif
    endif
    if (<show_this_level> = 1)
        playsound MenuUp
        if ObjectExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
            wait 1 gameframe
        endif
        high_scores_menu_create {
            level = ((level_select_menu_level_info [ <current_index> ]).level)
            level_name = ((level_select_menu_level_info [ <current_index> ]).text)
            from_options
            no_animate
        }
        if GotParam left
            RunScriptOnScreenElement id = high_scores_left_arrow menu_blink_arrow
        else
            RunScriptOnScreenElement id = high_scores_right_arrow menu_blink_arrow
        endif
        return 
    endif
    repeat 
endscript

script high_scores_menu_fill_menus 
    GetLevelRecords level = <level>
    GetArraySize (<highscores>.RecordTable)
    <index> = 0
    begin 
    high_scores_menu_add_five_best_item {
        parent = high_scores_menu_five_best_high_scores_vmenu
        place = (<index> + 1)
        initials = (((<highscores>.RecordTable)[ <index> ]).initials)
        Score = (((<highscores>.RecordTable)[ <index> ]).value)
        new_initials = <new_initials>
    }
    <index> = (<index> + 1)
    repeat <array_size>
    GetArraySize (<bestcombos>.RecordTable)
    <index> = 0
    begin 
    high_scores_menu_add_five_best_item {
        parent = high_scores_menu_five_best_combos_vmenu
        place = (<index> + 1)
        initials = (((<bestcombos>.RecordTable)[ <index> ]).initials)
        Score = (((<bestcombos>.RecordTable)[ <index> ]).value)
        new_initials = <new_initials>
    }
    <index> = (<index> + 1)
    repeat <array_size>
    <c> = '.'
    if German
        <c> = ','
    endif
    if French
        <c> = ','
    endif
    FormatText textname = Score '%i%c%f sek.' i = ((<longestgrind>.value / 100))c = <c> f = ((<longestgrind>.value)- ((<longestgrind>.value / 100)* 100))
    high_scores_menu_add_longest_trick_item {
        header = 'Najd³u¿. grind:'
        initials = (<longestgrind>.initials)
        Score = <Score>
        new_initials = <new_initials>
    }
    FormatText textname = Score '%i%c%f sek.' i = ((<longestmanual>.value / 100))c = <c> f = ((<longestmanual>.value)- ((<longestmanual>.value / 100)* 100))
    high_scores_menu_add_longest_trick_item {
        header = 'Najd³u¿. manual:'
        initials = (<longestmanual>.initials)
        Score = <Score>
        new_initials = <new_initials>
    }
    FormatText textname = Score '%i%c%f sek.' i = ((<longestliptrick>.value / 100))c = <c> f = ((<longestliptrick>.value)- ((<longestliptrick>.value / 100)* 100))
    high_scores_menu_add_longest_trick_item {
        header = 'Najd³u¿. lip:'
        initials = (<longestliptrick>.initials)
        Score = <Score>
        new_initials = <new_initials>
    }
    FormatText textname = Score 'trików: %i' i = (<longestcombo>.value)
    high_scores_menu_add_longest_trick_item {
        header = 'Najd³u¿. combo:'
        initials = (<longestcombo>.initials)
        Score = <Score>
        new_initials = <new_initials>
    }
endscript

script high_scores_menu_add_five_best_item 
    SetScreenElementLock id = <parent> Off
    Theme_GetHighlightedTextColor return_value = on_color
    Theme_GetUnhighlightedTextColor return_value = off_color
    on_color2 = [ 30 30 80 100 ]
    <Scale> = 0.8500
    FormatText textname = place_string '%i)' i = <place>
    FormatText textname = score_string '%i' i = <Score> usecommas
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        dims = (400.0, 15.0)
        just = [ left top ]
    }
    <anchor_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <place_string>
        rgba = <off_color>
        Scale = <Scale>
        Pos = (19.0, 0.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <initials>
        rgba = <off_color>
        Scale = <Scale>
        Pos = (71.0, 0.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <score_string>
        Pos = (250.0, 0.0)
        rgba = <off_color>
        Scale = <Scale>
        just = [ RIGHT top ]
    }
    highlight = 0
    if (GotParam new_initials)
        if (<new_initials> = <initials>)
            <highlight> = 1
        else
            if (<initials> = '2P ')
                <highlight> = 2
            endif
        endif
    endif
    if (<highlight> = 1)
        GetScreenElementPosition {
            id = {<anchor_id> child = 1}
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = black
            rgba = [ 0 0 0 50 ]
            Scale = (109.0, 3.700000047683716)
            Pos = (<screenelementpos> + (-185.0, 2.0))
            just = [ left top ]
            z_priority = 1.100
        }
        SetScreenElementProps {
            id = {<anchor_id> child = 0}
            rgba = <on_color>
        }
        SetScreenElementProps {
            id = {<anchor_id> child = 1}
            rgba = <on_color>
        }
        SetScreenElementProps {
            id = {<anchor_id> child = 2}
            rgba = <on_color>
        }
    endif
    if (<highlight> = 2)
        GetScreenElementPosition {
            id = {<anchor_id> child = 1}
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = black
            rgba = [ 0 0 0 50 ]
            Scale = (109.0, 3.700000047683716)
            Pos = (<screenelementpos> + (-185.0, 2.0))
            just = [ left top ]
            z_priority = 1.100
        }
        SetScreenElementProps {
            id = {<anchor_id> child = 0}
            rgba = <on_color2>
        }
        SetScreenElementProps {
            id = {<anchor_id> child = 1}
            rgba = <on_color2>
        }
        SetScreenElementProps {
            id = {<anchor_id> child = 2}
            rgba = <on_color2>
        }
    endif
endscript

script high_scores_menu_add_longest_trick_item 
    SetScreenElementLock id = high_scores_menu_longest_tricks_vmenu Off
    <Scale> = 0.8500
    Theme_GetHighlightedTextColor return_value = on_color
    Theme_GetUnhighlightedTextColor return_value = off_color
    on_color2 = [ 30 30 80 100 ]
    FormatText textname = score_string '%i' i = <Score>
    CreateScreenElement {
        type = ContainerElement
        parent = high_scores_menu_longest_tricks_vmenu
        dims = (400.0, 16.5)
        just = [ left top ]
    }
    <anchor_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <header>
        rgba = [ 128 128 128 128 ]
        Scale = <Scale>
        Pos = (0.0, 0.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <initials>
        rgba = <off_color>
        Scale = <Scale>
        Pos = (195.0, 0.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <score_string>
        Pos = (320.0, 0.0)
        rgba = <off_color>
        Scale = <Scale>
        just = [ center top ]
    }
    if (GotParam new_initials)
        if (<new_initials> = <initials>)
            GetScreenElementPosition {
                id = {<anchor_id> child = 1}
            }
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id>
                texture = black
                rgba = [ 0 0 0 50 ]
                Scale = (109.0, 4.099999904632568)
                Pos = (<screenelementpos> + (-185.0, 0.0))
                just = [ left top ]
                z_priority = 1.100
            }
            SetScreenElementProps {
                id = {<anchor_id> child = 1}
                rgba = <on_color>
            }
            SetScreenElementProps {
                id = {<anchor_id> child = 2}
                rgba = <on_color>
            }
        endif
        if (<initials> = '2P ')
            GetScreenElementPosition {
                id = {<anchor_id> child = 1}
            }
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id>
                texture = black
                rgba = [ 0 0 0 50 ]
                Scale = (109.0, 4.099999904632568)
                Pos = (<screenelementpos> + (-185.0, 0.0))
                just = [ left top ]
                z_priority = 1.100
            }
            SetScreenElementProps {
                id = {<anchor_id> child = 1}
                rgba = <on_color2>
            }
            SetScreenElementProps {
                id = {<anchor_id> child = 2}
                rgba = <on_color2>
            }
        endif
    endif
endscript
