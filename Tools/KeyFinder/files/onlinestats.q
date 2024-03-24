
script download_stats 
    
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if NeedToRetrieveTopStats
        RetrieveTopStats file = 0
        dialog_box_exit
        create_dialog_box {Title = net_status_msg
            text = 'Retrieving stats.'
            buttons = [{text = 'cancel' pad_choose_script = cancel_download_stats}
            ]
            no_animate
        }
    else
        create_online_stats_menu
    endif
endscript


script cancel_download_stats 
    dialog_box_exit
    CancelFileTransfer
    online_stats_exit
endscript


script download_more_stats 
    RetrieveTopStats
endscript


script StatsRetrievalFailed 
    
    dialog_box_exit
    create_dialog_box {Title = 'Transfer Failed'
        text = 'Could not retrieve stats. Try again later or check your network cables.'
        buttons = [{text = 'ok' pad_choose_script = online_stats_exit}
        ]
    }
endscript


script stats_retrieval_complete 
    create_online_stats_menu
endscript


script create_online_stats_menu 
    dialog_box_exit
    pulse_blur
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window Off
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = stats_bg_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = stats_bg_anchor alias = current_menu_anchor
    create_helper_text generic_helper_text_up_down_left_right
    build_theme_sub_title Title = 'ONLINE STATS' no_grad_bar
    build_top_and_bottom_blocks bot_z = 15 no_lines
    make_mainmenu_3d_plane
    CreateScreenElement {
        type = ContainerElement
        parent = stats_bg_anchor
        id = stats_menu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 840.0)
    }
    AssignAlias id = stats_menu_anchor alias = current_menu_anchor
    theme_background width = 7 Pos = (320.0, 65.0) num_parts = 10 static = static dark_menu = dark_menu
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (71.30000305175781, 8.0)
        Pos = (35.0, 67.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        id = subtitle
        text = ''
        Scale = 1.400
        font = small
        rgba = <on_rgba>
        Pos = (170.0, 89.0)
        just = [ center center ]
        z_priority = 30
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = left_arrow
        texture = left_arrow
        Scale = (1.0, 1.0)
        Pos = (60.0, 87.0)
        just = [ RIGHT center ]
        alpha = 0.5000
        z_priority = 30
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = right_arrow
        texture = right_arrow
        Scale = (1.0, 1.0)
        Pos = (280.0, 87.0)
        just = [ left center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (36.0, 5.0)
        Pos = (34.0, 35.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (36.5, 5.0)
        Pos = (32.0, 35.0)
        just = [ left top ]
        rgba = [ 26 43 84 128 ]
        z_priority = 1.500
    }
    CreateScreenElement {
        type = TextElement
        parent = stats_bg_anchor
        id = timetext
        text = ''
        Scale = 1.400
        font = small
        rgba = <on_rgba>
        Pos = (170.0, 77.0)
        just = [ center center ]
        z_priority = 5
    }
    CreateScreenElement {
        type = hmenu
        parent = current_menu_anchor
        id = top_hmenu
        Pos = (300.0, 66.0)
        just = [ left top ]
        padding_scale = 0.7500
        event_handlers = [{pad_back generic_menu_pad_back params = { callback = online_stats_exit }}
            {pad_left generic_menu_up_or_down_sound params = { up }}
            {pad_right generic_menu_up_or_down_sound params = { down }}
        ]
    }
    GetArraySize online_stats_categories
    index = 0
    begin 
    online_stats_hmenu_add_item index = <index>
    index = (<index> + 1)
    repeat <array_size>
    CreateScreenElement {
        type = SpriteElement
        parent = stats_bg_anchor
        id = globe
        texture = globe
        Scale = 1.300
        Pos = (320.0, 560.0)
        just = [ center center ]
        alpha = 0.3000
        z_priority = -1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = stats_bg_anchor
        z_priority = 100
        Pos = (132.0, 42.0)
        texture = gslogo Scale = 1.100
        alpha = 1
    }
    RunScriptOnScreenElement id = globe rotate_internet_options_globe
    RunScriptOnScreenElement id = stats_menu_anchor online_stats_animate_in
    FireEvent type = focus target = top_hmenu
endscript


script online_stats_animate_in id = stats_menu_anchor
    wait 2 gameframes
    if LevelIs load_mainmenu
        DoScreenElementMorph id = <id> time = 0.2000 Pos = (320.0, 255.0)
    else
        if ScreenElementExists id = top_bar_anchor
            DoScreenElementMorph id = top_bar_anchor time = 0.2000 Pos = (0.0, 62.0)
        endif
        DoScreenElementMorph id = <id> time = 0.2000 Pos = (320.0, 265.0)
    endif
endscript


script online_stats_exit 
    KillSpawnedScript name = create_online_stat_scores_menu
    KillSpawnedScript name = create_online_stat_players_menu
    KillSpawnedScript name = create_online_stat_personal_menu
    if ScreenElementExists id = stats_bg_anchor
        DestroyScreenElement id = stats_bg_anchor
    endif
    create_internet_options
endscript


script online_stats_hmenu_add_item 
    icon = (online_stats_categories [ <index> ].icon)
    text = (online_stats_categories [ <index> ].text)
    time = (online_stats_categories [ <index> ].time)
    array = (online_stats_categories [ <index> ].array)
    menu_type = (online_stats_categories [ <index> ].menu_type)
    Theme_GetUnhighlightedTextColor return_value = rgba
    CreateScreenElement {
        type = SpriteElement
        parent = top_hmenu
        texture = <icon>
        rgba = <rgba>
        Scale = 0.7000
        z_priority = 3
        event_handlers = [{focus online_stats_hmenu_focus params = {text = <text> menu_type = <menu_type> time = <time> array = <array> warned = no}}
            { unfocus online_stats_hmenu_unfocus }
        ]
    }
endscript


script online_stats_hmenu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = rgba
    SetScreenElementProps id = <id> rgba = <rgba>
    SetScreenElementProps id = subtitle text = <text>
    GetTextElementString id = timetext
    if (<time> = all)
        if NOT (<string> = 'All Time')
            RunScriptOnScreenElement online_stats_swap_time_text id = timetext params = { text = 'All Time' }
        endif
    endif
    if (<time> = week)
        if NOT (<string> = 'Recent')
            RunScriptOnScreenElement online_stats_swap_time_text id = timetext params = { text = 'Recent' }
        endif
    endif
    KillSpawnedScript name = create_online_stat_scores_menu
    KillSpawnedScript name = create_online_stat_players_menu
    KillSpawnedScript name = create_online_stat_personal_menu
    if (<menu_type> = scores)
        SpawnScript create_online_stat_scores_menu params = { array = <array> }
    endif
    if (<menu_type> = players)
        SpawnScript create_online_stat_players_menu params = { array = <array> }
    endif
    if (<menu_type> = personal)
        if NOT ProfileLoggedIn
            if (<warned> = no)
                FireEvent type = unfocus target = top_hmenu
                create_dialog_box {Title = 'No Stats'
                    text = 'You are not logged into GameSpy.\n You must be logged into GameSpy in order to record stats.'
                    buttons = [{text = 'ok' pad_choose_script = ok_no_personal_stats}
                    ]
                    text_dims = (380.0, 0.0)
                    no_bg
                    pad_left_script = dialog_box_exit
                    pad_right_script = dialog_box_exit
                }
                settags warned = yes
            endif
        endif
        GetRank
        GetPreferenceString pref_type = network network_id
        SpawnScript create_online_stat_personal_menu params = {array = <array> name = <ui_string> rank = <rank>}
    endif
endscript


script ok_no_personal_stats 
    dialog_box_exit
    wait 2 frames
    FireEvent type = focus target = top_hmenu
endscript


script online_stats_swap_time_text time = 0.2000
    DoScreenElementMorph id = timetext Scale = (0.0, 1.0) relative_scale time = <time>
    wait (<time> + 0.1000)seconds
    SetScreenElementProps id = timetext text = <text>
    DoScreenElementMorph id = timetext Scale = (1.0, 1.0) relative_scale time = <time>
endscript


script online_stats_hmenu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = rgba
    SetScreenElementProps id = <id> rgba = <rgba>
endscript

online_stats_categories = [
    {text = 'Best Scores' icon = stat_scores menu_type = scores time = week array = high_scores_array_monthly}
    {text = 'Best Combos' icon = stat_combos menu_type = scores time = week array = best_combos_array_monthly}
    {text = 'Top Players' icon = stat_players menu_type = players time = all array = top_players_array}
    {text = 'Best Scores' icon = stat_scores menu_type = scores time = all array = high_scores_array_all_time}
    {text = 'Best Combos' icon = stat_combos menu_type = scores time = all array = best_combos_array_all_time}
    {text = 'Personal Stats' icon = stat_personal menu_type = personal time = all array = personal_stats_array}
]
high_scores_array_all_time = []
best_combos_array_all_time = []
high_scores_array_monthly = []
best_combos_array_monthly = []
top_players_array = []
personal_stats_array = []

script create_online_stat_scores_menu 
    if ScreenElementExists id = online_stats_submenu_anchor
        DestroyScreenElement id = online_stats_submenu_anchor
    endif
    wait 5 gameframes
    SetScreenElementLock Off id = stats_menu_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = stats_menu_anchor
        id = online_stats_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 244.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Name'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (90.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (260.0, 115.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (260.0, 345.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (320.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Level'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (325.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (450.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Score'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (480.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = online_stats_submenu_anchor
        id = bottom_scrolling_menu
        just = [ left top ]
        dims = (600.0, 210.0)
        Pos = (100.0, 135.0)
        alpha = 0
    }
    CreateScreenElement {
        type = vmenu
        parent = bottom_scrolling_menu
        id = bottom_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        dont_allow_wrap
    }
    FillStatsArrays array = <array>
    wait 2 gameframes
    pulse_blur
    SetScreenElementProps id = bottom_scrolling_menu reset_window_top
    DoScreenElementMorph id = bottom_scrolling_menu alpha = 1
    FireEvent type = focus target = bottom_vmenu
endscript


script add_stat_score_menu_item 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = bottom_vmenu
        dims = (400.0, 15.0)
        event_handlers = [{ focus online_stats_generic_focus }
            { unfocus online_stats_generic_unfocus }
        ]
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Scale = (4.449999809265137, 0.44999998807907104)
        Pos = (-65.0, 0.0)
        just = [ left center ]
        rgba = <bar_rgba>
        alpha = 0
        z_priority = 2
    }
    FormatText checksumname = rank_icon 'rank_%i' i = <rank>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <rank_icon>
        Scale = 0.7000
        Pos = (-60.0, 0.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <name>
        font = dialog
        Scale = 0.8000
        Pos = (-10.0, 0.0)
        just = [ left center ]
        rgba = <off_rgba>
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <level>
        font = dialog
        Scale = 0.8000
        Pos = (235.0, 0.0)
        just = [ left center ]
        rgba = <off_rgba>
    }
    FormatText textname = score_text '%i' i = <Score> usecommas
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <score_text>
        font = dialog
        Scale = 0.8000
        Pos = (490.0, 0.0)
        just = [ RIGHT center ]
        rgba = <off_rgba>
    }
endscript


script add_stat_header_menu_item 
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = bottom_vmenu
        dims = (400.0, 15.0)
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = white2
        Scale = (70.0, 2.0)
        Pos = (-55.0, 0.0)
        just = [ left center ]
        rgba = [ 0 0 0 128 ]
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <text>
        font = dialog
        Scale = 0.8000
        Pos = (-10.0, 0.0)
        just = [ left center ]
        rgba = <on_rgba>
    }
endscript


script online_stats_generic_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = on_rgba
    DoScreenElementMorph id = {<id> child = 0}alpha = 1
    index = 2
    begin 
    if ScreenElementExists id = {<id> child = <index>}
        SetScreenElementProps id = {<id> child = <index>}rgba = <on_rgba>
    else
        break 
    endif
    index = (<index> + 1)
    repeat 
endscript


script online_stats_generic_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    DoScreenElementMorph id = {<id> child = 0}alpha = 0
    index = 2
    begin 
    if ScreenElementExists id = {<id> child = <index>}
        SetScreenElementProps id = {<id> child = <index>}rgba = <off_rgba>
    else
        break 
    endif
    index = (<index> + 1)
    repeat 
endscript


script create_online_stat_players_menu 
    if ScreenElementExists id = online_stats_submenu_anchor
        DestroyScreenElement id = online_stats_submenu_anchor
    endif
    wait 5 gameframes
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    SetScreenElementLock Off id = stats_menu_anchor
    CreateScreenElement {
        type = ContainerElement
        parent = stats_menu_anchor
        id = online_stats_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 244.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Name'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (90.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (260.0, 115.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (260.0, 345.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (320.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Rating'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (330.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (405.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Highest Score'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (415.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = online_stats_submenu_anchor
        id = bottom_scrolling_menu
        just = [ left top ]
        dims = (600.0, 210.0)
        Pos = (100.0, 135.0)
        alpha = 0
    }
    CreateScreenElement {
        type = vmenu
        parent = bottom_scrolling_menu
        id = bottom_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        dont_allow_wrap
    }
    FillStatsArrays array = <array>
    wait 2 gameframes
    pulse_blur
    SetScreenElementProps id = bottom_scrolling_menu reset_window_top
    DoScreenElementMorph id = bottom_scrolling_menu alpha = 1
    FireEvent type = focus target = bottom_vmenu
endscript


script add_stat_player_menu_item 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = bottom_vmenu
        dims = (400.0, 15.0)
        event_handlers = [{ focus online_stats_generic_focus }
            { unfocus online_stats_generic_unfocus }
        ]
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Scale = (4.449999809265137, 0.44999998807907104)
        Pos = (-65.0, 0.0)
        just = [ left center ]
        rgba = <bar_rgba>
        alpha = 0
        z_priority = 2
    }
    FormatText checksumname = rank_icon 'rank_%i' i = <rank>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = <rank_icon>
        Scale = 0.7000
        Pos = (-60.0, 0.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <name>
        font = dialog
        Scale = 0.8000
        Pos = (-10.0, 0.0)
        just = [ left center ]
        rgba = <off_rgba>
    }
    FormatText textname = rating_text '%i' i = <rating>
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <rating_text>
        font = dialog
        Scale = 0.8000
        Pos = (295.0, 0.0)
        just = [ RIGHT center ]
        rgba = <off_rgba>
    }
    FormatText textname = score_text '%i' i = <Score> usecommas
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <score_text>
        font = dialog
        Scale = 0.8000
        Pos = (490.0, 0.0)
        just = [ RIGHT center ]
        rgba = <off_rgba>
    }
endscript


script create_online_stat_personal_menu name_text = ''
    if ScreenElementExists id = online_stats_submenu_anchor
        DestroyScreenElement id = online_stats_submenu_anchor
    endif
    wait 5 gameframes
    SetScreenElementLock Off id = stats_menu_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = stats_menu_anchor
        id = online_stats_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 268.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (71.30000305175781, 4.0)
        Pos = (35.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (71.30000305175781, 0.10000000149011612)
        Pos = (35.0, 132.0)
        just = [ left top ]
        rgba = <on_rgba>
        z_priority = 3
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Name:'
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        alpha = 0.5000
        Pos = (50.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        id = name_value
        text = <name>
        Scale = 1
        font = dialog
        rgba = <off_rgba>
        Pos = (105.0, 115.0)
        just = [ left center ]
    }
    if NOT GotParam rank
        rank = 0
    endif
    FormatText textname = rank_text '%i' i = <rank>
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Rating:'
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        alpha = 0.5000
        Pos = (300.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        id = rating_value
        text = <rank_text>
        Scale = 1
        font = dialog
        rgba = <off_rgba>
        Pos = (380.0, 115.0)
        just = [ RIGHT center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = '/10'
        Scale = 1
        font = dialog
        rgba = <off_rgba>
        Pos = (415.0, 115.0)
        just = [ RIGHT center ]
    }
    FormatText checksumname = rank_icon 'rank_%i' i = <rank>
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = rating_icon
        texture = <rank_icon>
        Scale = 0.8000
        Pos = (425.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Score'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (180.0, 145.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (260.0, 145.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (260.0, 322.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (320.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Level'
        Scale = 1
        font = dialog
        rgba = <on_rgba>
        Pos = (330.0, 145.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = online_stats_submenu_anchor
        id = bottom_scrolling_menu
        just = [ left top ]
        dims = (600.0, 158.0)
        Pos = (100.0, 165.0)
        alpha = 0
    }
    CreateScreenElement {
        type = vmenu
        parent = bottom_scrolling_menu
        id = bottom_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        dont_allow_wrap
    }
    FillStatsArrays array = <array>
    wait 2 gameframes
    pulse_blur
    SetScreenElementProps id = bottom_scrolling_menu reset_window_top
    DoScreenElementMorph id = bottom_scrolling_menu alpha = 1
    FireEvent type = focus target = bottom_vmenu
endscript


script add_stat_personal_menu_item 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightBarColor return_value = bar_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = bottom_vmenu
        dims = (400.0, 15.0)
        event_handlers = [{ focus online_stats_generic_focus }
            { unfocus online_stats_generic_unfocus }
        ]
    }
    anchor_id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = DE_highlight_bar
        Scale = (4.449999809265137, 0.44999998807907104)
        Pos = (-65.0, 0.0)
        just = [ left center ]
        rgba = <bar_rgba>
        alpha = 0
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = black
        Scale = 0.0
        Pos = (-60.0, 0.0)
        just = [ left center ]
    }
    FormatText textname = score_text '%i' i = <Score> usecommas
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <score_text>
        font = dialog
        Scale = 0.8000
        Pos = (200.0, 0.0)
        just = [ RIGHT center ]
        rgba = <off_rgba>
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        text = <level>
        font = dialog
        Scale = 0.8000
        Pos = (235.0, 0.0)
        just = [ left center ]
        rgba = <off_rgba>
    }
endscript

stats_level_names = [
    {text = 'Training' level = load_tr}
    {text = 'Boston' level = load_bo}
    {text = 'Barcelona' level = load_ba}
    {text = 'Berlin' level = load_be}
    {text = 'Australia' level = load_au}
    {text = 'New Orleans' level = load_NO}
    {text = 'Skatopia' level = load_st}
    {text = 'Pro Skater' level = load_se}
    {text = 'The Triangle' level = load_se2}
    {text = 'School' level = load_sc}
    {text = 'Philly' level = load_ph}
    {text = 'Downhill Jam' level = load_dj}
    {text = 'Los Angeles' level = load_la}
    {text = 'Canada' level = load_ca}
    {text = 'Airport' level = load_ap}
]
