stats_files = [
    'thaw_hs_at.txt'
    'thaw_bc_at.txt'
    'thaw_hs_mo.txt'
    'thaw_bc_mo.txt'
    'thaw_ratings.txt'
]

script download_stats_file 
    wait 5 frames
    filename = stats_files [ <index> ]
    FormatText textname = url 'http://gamestats.gamespy.com/thps7ps2/web/%f' f = <filename>
    NetSessionFunc obj = content func = download_file params = {max_size = 153600
        file = <url>
    }
    begin 
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    NetSessionFunc obj = content func = transfer_think
    wait 1 frame
    repeat 
endscript

script download_all_stats_files 
    dialog_box_exit
    create_dialog_box {Title = net_status_msg
        text = 'ci¹ganie statystyk'
        buttons = [{text = 'anuluj' pad_choose_script = cancel_download_stats}
        ]
        no_animate
    }
    wait 5 frames
    NetSessionFunc func = content_init
    index = 0
    begin 
    filename = (stats_files [ <index> ])
    FormatText textname = url 'http://gamestats.gamespy.com/thps7ps2/web/%f' f = <filename>
    NetSessionFunc obj = content func = download_file params = {max_size = 153600
        file = <url>
    }
    begin 
    if NetSessionFunc obj = content func = is_transfer_complete
        break 
    endif
    NetSessionFunc obj = content func = transfer_think
    wait 1 frame
    repeat 
    if NetSessionFunc obj = content func = transfer_succeeded
        NetSessionFunc obj = stats func = parse_file params = { index = <index> }
    endif
    index = (<index> + 1)
    repeat 5
    change NeedsToDownloadStats = 0
    NetSessionFunc func = content_uninit
    create_online_stats_menu
endscript

script download_stats 
    printf \{ 'download stats.' }
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if IsTrue \{ NeedsToDownloadStats }
        SpawnScriptLater \{ download_all_stats_files }
    else
        create_online_stats_menu
    endif
endscript

script cancel_download_stats 
    dialog_box_exit
    NetSessionFunc \{ obj = content func = cancel_file_transfer }
    KillSpawnedScript \{ name = download_all_stats_files }
    NetSessionFunc \{ func = content_uninit }
    online_stats_exit
endscript

script download_more_stats 
    RetrieveTopStats
endscript

script StatsRetrievalFailed 
    printf \{ 'transfer failed.' }
    dialog_box_exit
    create_dialog_box \{Title = 'Transfer nie powiód³ siê' text = 'Pozyskiwanie statystyk nie powiod³o siê. Spróbuj ponownie, albo sprawd swój kabel sieciowy.' buttons = [{ text = 'OK' pad_choose_script = online_stats_exit }]}
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
    build_theme_sub_title Title = 'STATYSTYKI SIECIOWE'
    build_top_and_bottom_blocks bot_z = 15 no_lines
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
        Scale = 1.0
        font = dialog
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
        rgba = [ 7 113 21 100 ]
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
        rgba = [ 7 113 21 100 ]
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
        rgba = [ 60 60 60 58 ]
        z_priority = 1.500
    }
    CreateScreenElement {
        type = TextElement
        parent = stats_bg_anchor
        id = timetext
        text = ''
        Scale = 1.600
        font = dialog
        rgba = [ 37 121 4 128 ]
        Pos = (170.0, 84.0)
        just = [ center center ]
        z_priority = 5
        rot_angle = -5
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
        Scale = 1.800
        Pos = (320.0, 560.0)
        just = [ center center ]
        alpha = 0.3000
        z_priority = -1
    }
    if NOT IsXenon
        CreateScreenElement {
            type = SpriteElement
            parent = stats_bg_anchor
            z_priority = 100
            Pos = (132.0, 42.0)
            texture = gslogo Scale = 1.100
            alpha = 1
        }
    endif
    RunScriptOnScreenElement id = globe rotate_internet_options_globe
    RunScriptOnScreenElement id = stats_menu_anchor online_stats_animate_in
    FireEvent type = focus target = top_hmenu
endscript

script online_stats_animate_in \{ id = stats_menu_anchor }
    wait \{ 2 gameframes }
    if InFrontend
        DoScreenElementMorph id = <id> time = 0.2000 Pos = (320.0, 255.0)
    else
        if ScreenElementExists \{ id = top_bar_anchor }
            DoScreenElementMorph \{ id = top_bar_anchor time = 0.2000 Pos = (0.0, 62.0) }
        endif
        DoScreenElementMorph id = <id> time = 0.2000 Pos = (320.0, 265.0)
    endif
endscript

script online_stats_exit 
    KillSpawnedScript \{ name = create_online_stat_scores_menu }
    KillSpawnedScript \{ name = create_online_stat_players_menu }
    KillSpawnedScript \{ name = create_online_stat_personal_menu }
    if ScreenElementExists \{ id = stats_bg_anchor }
        DestroyScreenElement \{ id = stats_bg_anchor }
    endif
    if IsXenon
        xboxlive_menu_lobby_push
    else
        create_internet_options
    endif
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
        if NOT (<string> = 'PRZEZ CA£Y CZAS')
            RunScriptOnScreenElement online_stats_swap_time_text id = timetext params = { text = 'Przez ca³y czas' }
        endif
    endif
    if (<time> = week)
        if NOT (<string> = 'OSTATNIO')
            RunScriptOnScreenElement online_stats_swap_time_text id = timetext params = { text = 'Ostatnie' }
        endif
    endif
    KillSpawnedScript name = create_online_stat_scores_menu
    KillSpawnedScript name = create_online_stat_players_menu
    KillSpawnedScript name = create_online_stat_personal_menu
    if (<menu_type> = scores)
        SpawnScriptLater create_online_stat_scores_menu params = { array = <array> }
    endif
    if (<menu_type> = players)
        SpawnScriptLater create_online_stat_players_menu params = { array = <array> }
    endif
    if (<menu_type> = personal)
        if NOT IsXenon
            if NOT NetSessionFunc obj = presence func = profile_logged_in
                if (<warned> = no)
                    FireEvent type = unfocus target = top_hmenu
                    create_dialog_box {Title = 'Brak statystyk'
                        text = 'Nie jeste zalogowany w us³udze GameSpy.\n Aby zapisywaæ statystyki, musisz zalogowaæ siê w us³udze GameSpy.'
                        buttons = [{text = 'OK' pad_choose_script = ok_no_personal_stats}
                        ]
                        text_dims = (380.0, 0.0)
                        no_bg
                        pad_left_script = dialog_box_exit
                        pad_right_script = dialog_box_exit
                    }
                    settags warned = yes
                endif
            endif
        endif
        NetSessionFunc obj = stats func = get_rank
        GetPreferenceString pref_type = network network_id
        SpawnScriptLater create_online_stat_personal_menu params = {array = <array> name = <ui_string> rank = <rank>}
    endif
endscript

script ok_no_personal_stats 
    dialog_box_exit
    wait \{ 2 frames }
    FireEvent \{ type = focus target = top_hmenu }
endscript

script online_stats_swap_time_text \{ time = 0.2000 }
    DoScreenElementMorph id = timetext Scale = (0.0, 1.0) relative_scale time = <time>
    wait (<time> + 0.1000)seconds
    SetScreenElementProps id = timetext text = <text>
    DoScreenElementMorph id = timetext Scale = (1.0, 1.0) relative_scale time = <time>
endscript

script online_stats_hmenu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor \{ return_value = rgba }
    SetScreenElementProps id = <id> rgba = <rgba>
endscript
online_stats_categories = [
    {
        text = 'NAJLEPSZE WYNIKI'
        icon = stat_scores
        menu_type = scores
        time = week
        array = high_scores_array_monthly
    }
    {
        text = 'NAJLEPSZE COMBO'
        icon = stat_combos
        menu_type = scores
        time = week
        array = best_combos_array_monthly
    }
    {
        text = 'NAJLEPSI GRACZE'
        icon = stat_players
        menu_type = players
        time = all
        array = top_players_array
    }
    {
        text = 'NAJLEPSZE WYNIKI'
        icon = stat_scores
        menu_type = scores
        time = all
        array = high_scores_array_all_time
    }
    {
        text = 'NAJLEPSZE COMBO'
        icon = stat_combos
        menu_type = scores
        time = all
        array = best_combos_array_all_time
    }
    {
        text = 'OSOBISTE STATYSTYKI'
        icon = stat_personal
        menu_type = personal
        time = all
        array = personal_stats_array
    }
]
high_scores_array_all_time = [
]
best_combos_array_all_time = [
]
high_scores_array_monthly = [
]
best_combos_array_monthly = [
]
top_players_array = [
]
personal_stats_array = [
]

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
        text = 'IMIÊ'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
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
        rgba = [ 7 113 21 100 ]
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
        rgba = [ 7 113 21 100 ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (290.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'POZIOM'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (295.0, 115.0)
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
        text = 'WYNIK'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
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
    NetSessionFunc obj = stats func = fill_stats_array params = { array = <array> }
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
        Pos = (200.0, 0.0)
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
        Pos = (-40.0, 0.0)
        just = [ left center ]
        rgba = <on_rgba>
    }
endscript

script online_stats_generic_focus 
    gettags
    Theme_GetHighlightedTextColor \{ return_value = on_rgba }
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
    Theme_GetUnhighlightedTextColor \{ return_value = off_rgba }
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
        text = 'IMIÊ'
        Scale = 1
        font = dialog
        rgba = [ 100 12 85 108 ]
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
        rgba = [ 7 113 21 100 ]
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
        rgba = [ 7 113 21 100 ]
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
        text = 'RANGA'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
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
        text = 'NAJWY¯SZY WYNIK'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
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
    NetSessionFunc obj = stats func = fill_stats_array params = { array = <array> }
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
        text = 'Imiê:'
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
        Pos = (115.0, 115.0)
        just = [ left center ]
    }
    if NOT GotParam rank
        rank = 0
    endif
    FormatText textname = rank_text '%i' i = <rank>
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Ocena:'
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        alpha = 0.5000
        Pos = (435.0, 115.0)
        just = [ RIGHT center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        id = rating_value
        text = <rank_text>
        Scale = 1
        font = dialog
        rgba = <off_rgba>
        Pos = (470.0, 115.0)
        just = [ RIGHT center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = '/10'
        Scale = 1
        font = dialog
        rgba = <off_rgba>
        Pos = (505.0, 115.0)
        just = [ RIGHT center ]
    }
    FormatText checksumname = rank_icon 'rank_%i' i = <rank>
    CreateScreenElement {
        type = SpriteElement
        parent = online_stats_submenu_anchor
        id = rating_icon
        texture = <rank_icon>
        Scale = 0.8000
        Pos = (515.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = online_stats_submenu_anchor
        text = 'Wynik'
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
        rgba = [ 7 113 21 100 ]
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
        rgba = [ 7 113 21 100 ]
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
        text = 'Poziom'
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
    NetSessionFunc obj = stats func = fill_stats_array params = { array = <array> }
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
    { text = 'BEVERLY HILLS' level = Load_Z_BH }
    { text = 'HOLLYWOOD' level = Load_Z_HO }
    { text = 'CENTRUM' level = Load_Z_DT }
    { text = 'WSCHODNIE LA' level = Load_Z_EL }
    { text = 'SANTA MONICA' level = Load_Z_SM }
    { text = 'WIE¯A WIERT.' level = Load_Z_OI }
    { text = 'KASYNO' level = Load_Z_LV }
    { text = 'ORODEK' level = Load_Z_SR }
    { text = 'ATLANTA' level = Load_Z_AT }
    { text = 'CHICAGO' level = Load_Z_CH }
    { text = 'MINNEAPOLIS' level = Load_Z_DN }
    { text = 'KYOTO' level = Load_Z_JA }
    { text = 'CENTRUM HANDLOWE' level = Load_Z_MA }
    { text = 'MARSYLIA' level = Load_Z_MS }
    { text = 'SANTA CRUZ' level = Load_Z_SZ }
    { text = 'PARK VANS' level = Load_Z_SV }
    { text = 'RUINY' level = Load_Z_SV2 }
]
