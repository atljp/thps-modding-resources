best_green = [ 40 128 40 120 ]

script create_downloads_menu 
    dialog_box_exit
    Theme_GetHighlightedTextColor return_value = rgba
    build_top_and_bottom_blocks
    SetScreenElementLock id = menu_parts_anchor Off
    CreateScreenElement {
        type = ContainerElement
        parent = menu_parts_anchor
        id = downloads_anchor
        Pos = (-5.0, 800.0)
    }
    make_new_menu {menu_id = downloads_menu
        vmenu_id = downloads_vmenu
        parent = downloads_anchor
        Pos = (80.0, 85.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = downloads_anchor
        font = testtitle
        text = 'CI¥GNIJ'
        Scale = 1.500
        Pos = (170.0, 86.0)
        just = [ center top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = downloads_anchor
        texture = white2
        Scale = (33.0, 5.0)
        Pos = (39.0, 82.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        not_focusable
    }
    SetScreenElementProps {id = downloads_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_downloads_menu }}]}
    downloads_menu_add_item text = '' not_focusable = not_focusable
    downloads_menu_add_item {
        text = 'Parki'
        id = menu_down_parks
        pad_choose_script = download_content
        pad_choose_params = { type = parks }
    }
    downloads_menu_add_item {
        text = 'Skejt/Fabu³a'
        id = menu_down_skaters
        pad_choose_script = download_content
        pad_choose_params = { type = skaters }
    }
    downloads_menu_add_item {
        text = 'Triki'
        id = menu_down_tricks
        pad_choose_script = download_content
        pad_choose_params = { type = tricks }
    }
    downloads_menu_add_item {
        text = 'Stworzone grafiki'
        id = menu_down_tags
        pad_choose_script = download_content
        pad_choose_params = { type = tags }
        last_menu_item = last_menu_item
    }
    RunScriptOnScreenElement lobby_list_animate_in id = downloads_anchor params = { id = downloads_anchor }
    FireEvent type = unfocus target = sub_menu
    FireEvent type = focus target = downloads_menu
    AssignAlias id = menu_parts_anchor alias = current_menu_anchor
endscript

script downloads_menu_add_item \{ parent = downloads_vmenu }
    theme_menu_add_item {parent = <parent> centered <...> menu = 2 middle_scale = (2.0999999046325684, 1.0) static_width highlight_bar_scale = (2.0, 0.699999988079071)}
endscript

script back_from_downloads_menu 
    FireEvent \{ type = unfocus target = downloads_menu }
    DestroyScreenElement \{ id = downloads_anchor }
    FireEvent \{ type = focus target = sub_menu }
endscript

script create_uploads_menu 
    dialog_box_exit
    Theme_GetHighlightedTextColor return_value = rgba
    build_top_and_bottom_blocks
    SetScreenElementLock id = menu_parts_anchor Off
    CreateScreenElement {
        type = ContainerElement
        parent = menu_parts_anchor
        id = uploads_anchor
        Pos = (-5.0, 800.0)
    }
    make_new_menu {menu_id = uploads_menu
        vmenu_id = uploads_vmenu
        parent = uploads_anchor
        Pos = (80.0, 85.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = uploads_anchor
        font = testtitle
        text = 'WGRYWANIE'
        Scale = 1.500
        Pos = (170.0, 86.0)
        just = [ center top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = uploads_anchor
        texture = white2
        Scale = (33.0, 5.0)
        Pos = (39.0, 82.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        not_focusable
    }
    SetScreenElementProps {id = uploads_menu event_handlers = [{pad_back generic_menu_pad_back params = { callback = back_from_uploads_menu }}]}
    downloads_menu_add_item text = '' not_focusable = not_focusable parent = uploads_vmenu
    downloads_menu_add_item {
        parent = uploads_vmenu
        text = 'Parki'
        id = menu_down_parks
        pad_choose_script = launch_upload_file_sequence
        pad_choose_params = { type = Park }
    }
    downloads_menu_add_item {
        parent = uploads_vmenu
        text = 'Skejt/Fabu³a'
        id = menu_down_skaters
        pad_choose_script = launch_upload_file_sequence
        pad_choose_params = { type = OptionsAndPros }
    }
    downloads_menu_add_item {
        parent = uploads_vmenu
        text = 'Triki'
        id = menu_down_tricks
        pad_choose_script = launch_upload_file_sequence
        pad_choose_params = { type = CAT }
    }
    downloads_menu_add_item {
        parent = uploads_vmenu
        text = 'Stworzone grafiki'
        id = menu_down_tags
        pad_choose_script = launch_upload_file_sequence
        pad_choose_params = { type = createdgraphic }
        last_menu_item = last_menu_item
    }
    RunScriptOnScreenElement lobby_list_animate_in id = uploads_anchor params = { id = uploads_anchor }
    FireEvent type = unfocus target = sub_menu
    FireEvent type = focus target = uploads_menu
    AssignAlias id = menu_parts_anchor alias = current_menu_anchor
endscript

script back_from_uploads_menu 
    FireEvent \{ type = unfocus target = uploads_menu }
    DestroyScreenElement \{ id = uploads_anchor }
    FireEvent \{ type = focus target = sub_menu }
endscript

script net_vault_menu_create 
    pulse_blur
    dialog_box_exit
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window Off
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = vault_bg_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = vault_bg_anchor alias = current_menu_anchor
    create_helper_text generic_helper_text_up_down_left_right
    if GotParam type
        switch <type>
            case parks
            Title = 'ZBIÓR PARKÓW'
            case tags
            Title = 'ZBIÓR TAGÓW'
            case tricks
            Title = 'SKARBIEC TRIKÓW'
            case skaters
            Title = 'SKARBIEC ZAWODNIKÓW'
            default 
            Title = 'SKARBIEC NEVERSOFTU'
        endswitch
    else
        Title = 'SKARBIEC NEVERSOFTU'
    endif
    build_theme_sub_title Title = <Title>
    build_top_and_bottom_blocks bot_z = 15
    CreateScreenElement {
        type = ContainerElement
        parent = vault_bg_anchor
        id = vault_menu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 840.0)
    }
    AssignAlias id = vault_menu_anchor alias = current_menu_anchor
    theme_background width = 7 Pos = (320.0, 63.0) num_parts = 10 static = static dark_menu = dark_menu
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        Scale = (71.30000305175781, 8.0)
        Pos = (35.0, 65.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    text = ''
    rgba = <on_rgba>
    Star_alpha = 0
    if GotParam category
        if (<category> = 'Najlepszy')
            text = 'Najlepszy z najlepszych'
            rgba = best_green
            Star_alpha = 1
        else
            text = <category>
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        id = net_vault_menu_category
        text = <text>
        Scale = 1.400
        font = small
        rgba = <rgba>
        Pos = (63.0, 85.0)
        just = [ left center ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = net_vault_menu_left_arrow
        texture = left_arrow
        Scale = (1.0, 1.0)
        Pos = (60.0, 83.0)
        just = [ RIGHT center ]
        alpha = 0.5000
        z_priority = 3
    }
    GetStackedScreenElementPos x id = net_vault_menu_category Offset = (5.0, 13.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = net_vault_menu_right_arrow
        texture = right_arrow
        Scale = (1.0, 1.0)
        Pos = <Pos>
        just = [ left center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = neversoft
        Scale = (1.75, 1.2999999523162842)
        Pos = (305.0, 55.0)
        just = [ left top ]
        alpha = 0.3000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = best_star
        texture = best
        Scale = 1
        Pos = (535.0, 63.0)
        just = [ left top ]
        rgba = best_green
        alpha = <Star_alpha>
        z_priority = 3
    }
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        id = net_vault_vscrollingmenu
        Pos = (50.0, 130.0)
        dims = (400.0, 180.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = net_vault_vscrollingmenu
        id = net_vault_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        event_handlers = [{ pad_back generic_menu_pad_back_sound }
            { pad_back back_from_vault }
            {pad_down menu_vert_blink_arrow params = { id = down_arrow }}
            {pad_up menu_vert_blink_arrow params = { id = up_arrow }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_left net_vault_menu_prev_category }
            { pad_right net_vault_menu_next_category }
        ]
        dont_allow_wrap
    }
    AssignAlias id = net_vault_vmenu alias = current_menu
    CreateScreenElement {
        type = SpriteElement
        parent = vault_bg_anchor
        id = globe
        texture = globe
        Scale = 1.300
        Pos = (320.0, 560.0)
        just = [ center center ]
        alpha = 0.3000
        z_priority = -1
    }
    if GotParam type
        switch <type>
            case parks
            create_net_vault_parks_menu
            case tags
            create_net_vault_tags_menu
            case tricks
            create_net_vault_tricks_menu
            case skaters
            create_net_vault_skaters_menu
            default 
            printf 'bad type in net_vault_menu_create---------------------------------------'
            printstruct <...> 
        endswitch
    endif
    NetSessionFunc obj = content func = fill_vault_menu
    RunScriptOnScreenElement id = net_vault_vscrollingmenu reset_vault_scrolling_menu
    RunScriptOnScreenElement id = globe rotate_internet_options_globe
    RunScriptOnScreenElement id = vault_menu_anchor online_stats_animate_in params = { id = vault_menu_anchor }
    FireEvent type = focus target = current_menu
endscript

script reset_vault_scrolling_menu 
    wait \{ 2 gameframes }
    SetScreenElementProps \{ id = net_vault_vscrollingmenu reset_window_top }
endscript

script create_net_vault_parks_menu 
    if ScreenElementExists id = net_vault_submenu_anchor
        DestroyScreenElement id = net_vault_submenu_anchor
    endif
    SetScreenElementLock Off id = vault_menu_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = vault_menu_anchor
        id = net_vault_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'NAZWA PARKU'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (90.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (240.0, 115.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (240.0, 314.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (260.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'EDYTOR'
        Scale = 0.8000
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (275.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (470.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'ROZMIAR'
        Scale = 0.8000
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (500.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = description_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (320.0, 324.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = pieces_text
        text = 'elementy'
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (100.0, 338.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = gap_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (200.0, 338.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = theme_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (400.0, 338.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = tod_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (500.0, 338.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (71.30000305175781, 4.0)
        Pos = (320.0, 324.0)
        just = [ center top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
endscript

script create_net_vault_skaters_menu 
    if ScreenElementExists id = net_vault_submenu_anchor
        DestroyScreenElement id = net_vault_submenu_anchor
    endif
    SetScreenElementLock Off id = vault_menu_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = vault_menu_anchor
        id = net_vault_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'IMIÊ SKEJTA'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (80.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (240.0, 115.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (240.0, 314.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (260.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'EDYTOR'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (275.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (470.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'P£EÆ'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (495.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = description_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (320.0, 324.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (71.30000305175781, 4.0)
        Pos = (320.0, 324.0)
        just = [ center top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
endscript

script create_net_vault_tricks_menu 
    if ScreenElementExists id = net_vault_submenu_anchor
        DestroyScreenElement id = net_vault_submenu_anchor
    endif
    SetScreenElementLock Off id = vault_menu_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = vault_menu_anchor
        id = net_vault_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'NAZWA TRIKU'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (90.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (240.0, 115.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (240.0, 314.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (260.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'EDYTOR'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (275.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (470.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'WYNIK'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (480.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = description_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (320.0, 324.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (71.30000305175781, 4.0)
        Pos = (320.0, 324.0)
        just = [ center top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
endscript

script create_net_vault_tags_menu 
    if ScreenElementExists id = net_vault_submenu_anchor
        DestroyScreenElement id = net_vault_submenu_anchor
    endif
    SetScreenElementLock Off id = vault_menu_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = vault_menu_anchor
        id = net_vault_submenu_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'NAZWA TAGU'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (90.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = up_arrow
        texture = up_arrow
        Scale = 1
        Pos = (240.0, 115.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        id = down_arrow
        texture = down_arrow
        Scale = 1
        Pos = (240.0, 314.0)
        just = [ center center ]
        alpha = 0.5000
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (260.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        text = 'EDYTOR'
        Scale = 0.8500
        font = dialog
        rgba = [ 100 12 85 108 ]
        Pos = (275.0, 115.0)
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (0.800000011920929, 28.299999237060547)
        Pos = (470.0, 127.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = net_vault_submenu_anchor
        id = description_text
        text = ''
        Scale = 0.8000
        font = dialog
        rgba = <off_rgba>
        Pos = (320.0, 324.0)
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = net_vault_submenu_anchor
        texture = white2
        Scale = (71.30000305175781, 4.0)
        Pos = (320.0, 324.0)
        just = [ center top ]
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        z_priority = 2
    }
endscript

script net_vault_menu_add_park 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (400.0, 18.0)
        Pos = (0.0, 0.0)
        event_handlers = [{focus net_vault_menu_focus params = { type = parks }}
            {unfocus net_vault_menu_unfocus params = { type = parks }}
            {pad_choose download_selected_file params = {type = parks <pad_choose_params>}}
            { pad_choose generic_menu_pad_choose_sound }
        ]
    }
    <anchor_id> = <id>
    if GotParam description
        <anchor_id> ::settags description = <description> num_gaps = <num_gaps> num_goals = <num_goals> num_pieces = <num_pieces> tod_script = <tod_script> theme = <theme>
    else
        <anchor_id> ::settags description = 'Tu wpisz opis... Oops!' num_gaps = <num_gaps> num_goals = <num_goals> num_pieces = <num_pieces> tod_script = <tod_script> theme = <theme>
    endif
    net_vault_menu_add_text anchor_id = <anchor_id> text = <name> Pos = (0.0, 0.0)
    net_vault_menu_add_text anchor_id = <anchor_id> text = <creator> Pos = (220.0, 0.0)
    net_vault_menu_add_text anchor_id = <anchor_id> text = <size> Pos = (445.0, 0.0)
    if GotParam focus
        net_vault_menu_add_text anchor_id = <anchor_id> text = <focus> Pos = (410.0, 0.0)
    endif
    if GotParam downloads
        FormatText textname = downloads_string '%i' i = <downloads>
        net_vault_menu_add_text anchor_id = <anchor_id> text = <downloads_string> Pos = (470.0, 0.0)
    endif
endscript

script net_vault_menu_add_goal 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (400.0, 18.0)
        Pos = (0.0, 0.0)
        event_handlers = [{focus net_vault_menu_focus params = { type = goals }}
            {unfocus net_vault_menu_unfocus params = { type = goals }}
            {pad_choose download_selected_file params = {type = goals <pad_choose_params>}}
            { pad_choose generic_menu_pad_choose_sound }
        ]
    }
    <anchor_id> = <id>
    if GotParam description
        <anchor_id> ::settags description = <description> num_goals = <num_goals>
    else
        <anchor_id> ::settags description = 'Tu wpisz opis... Oops!' num_goals = <num_goals>
    endif
    net_vault_menu_add_text anchor_id = <anchor_id> text = <name> Pos = (0.0, 0.0)
    net_vault_menu_add_text anchor_id = <anchor_id> text = <creator> Pos = (220.0, 0.0)
    FormatText textname = string '%i' i = <num_goals>
    net_vault_menu_add_text anchor_id = <anchor_id> text = <string> Pos = (445.0, 0.0)
    if GotParam focus
        net_vault_menu_add_text anchor_id = <anchor_id> text = <focus> Pos = (410.0, 0.0)
    endif
    if GotParam downloads
        FormatText textname = downloads_string '%i' i = <downloads>
        net_vault_menu_add_text anchor_id = <anchor_id> text = <downloads_string> Pos = (470.0, 0.0)
    endif
endscript

script net_vault_menu_add_trick 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (400.0, 18.0)
        Pos = (0.0, 0.0)
        event_handlers = [{focus net_vault_menu_focus params = { type = tricks }}
            {unfocus net_vault_menu_unfocus params = { type = tricks }}
            {pad_choose download_selected_file params = {type = tricks <pad_choose_params>}}
            { pad_choose generic_menu_pad_choose_sound }
        ]
    }
    <anchor_id> = <id>
    if GotParam description
        <anchor_id> ::settags description = <description> Score = <Score>
    else
        <anchor_id> ::settags description = 'Tu wpisz opis... Oops!' Score = <Score>
    endif
    net_vault_menu_add_text anchor_id = <anchor_id> text = <name> Pos = (0.0, 0.0)
    net_vault_menu_add_text anchor_id = <anchor_id> text = <creator> Pos = (220.0, 0.0)
    FormatText textname = string '%i' i = <Score>
    net_vault_menu_add_text anchor_id = <anchor_id> text = <string> Pos = (445.0, 0.0)
    if GotParam focus
        net_vault_menu_add_text anchor_id = <anchor_id> text = <focus> Pos = (410.0, 0.0)
    endif
    if GotParam downloads
        FormatText textname = downloads_string '%i' i = <downloads>
        net_vault_menu_add_text anchor_id = <anchor_id> text = <downloads_string> Pos = (470.0, 0.0)
    endif
endscript

script net_vault_menu_add_skater 
    printf 'net_vault_menu_add_skater'
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (400.0, 18.0)
        Pos = (0.0, 0.0)
        event_handlers = [{focus net_vault_menu_focus params = { type = skaters }}
            {unfocus net_vault_menu_unfocus params = { type = skaters }}
            {pad_choose download_selected_file params = {type = skaters <pad_choose_params>}}
            { pad_choose generic_menu_pad_choose_sound }
        ]
    }
    <anchor_id> = <id>
    if GotParam description
        <anchor_id> ::settags description = <description> is_male = <is_male>
    else
        <anchor_id> ::settags description = 'Tu wpisz opis... Oops!' is_male = <is_male>
    endif
    net_vault_menu_add_text anchor_id = <anchor_id> text = <name> Pos = (0.0, 0.0)
    net_vault_menu_add_text anchor_id = <anchor_id> text = <creator> Pos = (220.0, 0.0)
    if (<is_male> = 1)
        string = 'Mê¿czyzna'
    else
        string = 'Kobieta'
    endif
    net_vault_menu_add_text anchor_id = <anchor_id> text = <string> Pos = (445.0, 0.0)
    if GotParam focus
        net_vault_menu_add_text anchor_id = <anchor_id> text = <focus> Pos = (410.0, 0.0)
    endif
    if GotParam downloads
        FormatText textname = downloads_string '%i' i = <downloads>
        net_vault_menu_add_text anchor_id = <anchor_id> text = <downloads_string> Pos = (470.0, 0.0)
    endif
endscript

script net_vault_menu_add_tag 
    printf 'net_vault_menu_add_tag'
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        dims = (400.0, 18.0)
        Pos = (0.0, 0.0)
        event_handlers = [{focus net_vault_menu_focus params = { type = tags }}
            {unfocus net_vault_menu_unfocus params = { type = tags }}
            {pad_choose download_selected_file params = {type = tags <pad_choose_params>}}
            { pad_choose generic_menu_pad_choose_sound }
        ]
    }
    <anchor_id> = <id>
    if GotParam description
        <anchor_id> ::settags description = <description>
    else
        <anchor_id> ::settags description = 'Tu wpisz opis... Oops!'
    endif
    net_vault_menu_add_text anchor_id = <anchor_id> text = <name> Pos = (0.0, 0.0)
    net_vault_menu_add_text anchor_id = <anchor_id> text = <creator> Pos = (220.0, 0.0)
    if GotParam focus
        net_vault_menu_add_text anchor_id = <anchor_id> text = <focus> Pos = (410.0, 0.0)
    endif
    if GotParam downloads
        FormatText textname = downloads_string '%i' i = <downloads>
        net_vault_menu_add_text anchor_id = <anchor_id> text = <downloads_string> Pos = (470.0, 0.0)
    endif
endscript

script net_vault_menu_add_text 
    Theme_GetUnhighlightedTextColor \{ return_value = rgba }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        text = <text>
        Pos = <Pos>
        just = [ left top ]
        Scale = 0.8000
        rgba = <rgba>
    }
endscript

script net_vault_menu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = rgba
    net_vault_menu_change_text_color {
        id = <id>
        rgba = <rgba>
    }
    if GotParam description
        if ScreenElementExists id = description_text
            SetScreenElementProps id = description_text text = <description>
        endif
    endif
    if GotParam Score
        if ScreenElementExists id = score_text
            FormatText textname = score_string 'Wynik: %i' i = <Score>
            SetScreenElementProps id = score_text text = <score_string>
        endif
    endif
    if GotParam is_male
        if ScreenElementExists id = sex_text
            if (<is_male> = 1)
                SetScreenElementProps id = sex_text text = 'Mê¿czyzna'
            else
                SetScreenElementProps id = sex_text text = 'Kobieta'
            endif
        endif
    endif
    if GotParam num_pieces
        if ScreenElementExists id = pieces_text
            FormatText textname = string 'Kawa³ki: %i' i = <num_pieces>
            SetScreenElementProps id = pieces_text text = <string>
        endif
    endif
    if GotParam num_gaps
        if ScreenElementExists id = gap_text
            FormatText textname = string 'Luki: %i' i = <num_gaps>
            SetScreenElementProps id = gap_text text = <string>
        endif
    endif
    if GotParam theme
        if ScreenElementExists id = theme_text
            switch <theme>
                case 0
                SetScreenElementProps id = theme_text text = 'Antarktyka'
                case 1
                SetScreenElementProps id = theme_text text = 'Mars'
                case 2
                SetScreenElementProps id = theme_text text = 'Zagubiona wyspa'
                case 3
                SetScreenElementProps id = theme_text text = 'Magazyn'
                case 4
                SetScreenElementProps id = theme_text text = 'Wiêzienie'
            endswitch
        endif
    endif
    generic_menu_update_arrows menu_id = net_vault_vmenu up_arrow_id = net_vault_menu_up_arrow down_arrow_id = net_vault_menu_down_arrow
endscript

script net_vault_menu_change_text_color 
    <child> = 0
    begin 
    if ScreenElementExists id = {<id> child = <child>}
        SetScreenElementProps id = {<id> child = <child>}rgba = <rgba>
        child = (<child> + 1)
    else
        break 
    endif
    repeat 
endscript

script net_vault_menu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor \{ return_value = rgba }
    net_vault_menu_change_text_color {
        id = <id>
        rgba = <rgba>
    }
endscript

script refresh_scrolling_menu 
    SetScreenElementLock \{ id = net_vault_vmenu on }
    SetScreenElementLock \{ id = net_vault_vmenu Off }
    SetScreenElementLock \{ id = net_vault_vscrollingmenu on }
    SetScreenElementLock \{ id = net_vault_vscrollingmenu Off }
    FireEvent \{ type = focus target = current_menu }
endscript

script clear_vault_focus_info 
    if ScreenElementExists id = description_text
        SetScreenElementProps id = description_text text = ''
    endif
    if ScreenElementExists id = score_text
        SetScreenElementProps id = score_text text = ''
    endif
    if ScreenElementExists id = goal_text
        SetScreenElementProps id = goal_text text = ''
    endif
    if ScreenElementExists id = sex_text
        SetScreenElementProps id = sex_text text = ''
    endif
    if ScreenElementExists id = gap_text
        SetScreenElementProps id = gap_text text = ''
    endif
    if ScreenElementExists id = pieces_text
        SetScreenElementProps id = pieces_text text = ''
    endif
    if ScreenElementExists id = theme_text
        SetScreenElementProps id = theme_text text = ''
    endif
    if ScreenElementExists id = tod_text
        SetScreenElementProps id = tod_text text = ''
    endif
endscript

script net_vault_menu_prev_category 
    DestroyScreenElement \{ id = net_vault_vmenu preserve_parent }
    clear_vault_focus_info
    NetSessionFunc \{ obj = content func = prev_vault_category }
    NetSessionFunc \{ obj = content func = fill_vault_menu }
    menu_horiz_blink_arrow \{ arrow_id = net_vault_menu_left_arrow }
    net_vault_menu_refresh_category <...> 
    refresh_scrolling_menu
endscript

script net_vault_menu_next_category 
    DestroyScreenElement \{ id = net_vault_vmenu preserve_parent }
    clear_vault_focus_info
    NetSessionFunc \{ obj = content func = next_vault_category }
    NetSessionFunc \{ obj = content func = fill_vault_menu }
    menu_horiz_blink_arrow \{ arrow_id = net_vault_menu_right_arrow }
    net_vault_menu_refresh_category <...> 
    refresh_scrolling_menu
endscript

script net_vault_menu_refresh_category 
    if (<category> = 'Najlepszy')
        text = 'Najlepszy z najlepszych'
        rgba = best_green
        Star_alpha = 1
    else
        text = <category>
        Theme_GetHighlightedTextColor return_value = on_rgba
        rgba = <on_rgba>
        Star_alpha = 0
    endif
    SetScreenElementProps {
        id = net_vault_menu_category
        text = <text>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = net_vault_menu_category Offset = (5.0, 13.0)
    SetScreenElementProps {
        id = net_vault_menu_right_arrow
        Pos = <Pos>
    }
    DoScreenElementMorph {
        id = best_star
        alpha = <Star_alpha>
    }
    SetScreenElementProps {
        id = net_vault_vmenu
        event_handlers = [{ pad_left net_vault_menu_prev_category }
            { pad_right net_vault_menu_next_category }
        ] replace_handlers
    }
endscript

script back_from_vault 
    net_vault_menu_exit
    create_internet_options
endscript

script FreeDirectoryListing 
    if IsPs2
        NetSessionFunc \{ obj = content func = free_directory_list }
    endif
endscript

script net_vault_menu_exit 
    FreeDirectoryListing
    SetScreenElementLock \{ id = root_window Off }
    if ScreenElementExists \{ id = vault_bg_anchor }
        DestroyScreenElement \{ id = vault_bg_anchor }
    endif
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
        wait \{ 1 gameframe }
        SetScreenElementLock \{ id = root_window Off }
    endif
endscript
