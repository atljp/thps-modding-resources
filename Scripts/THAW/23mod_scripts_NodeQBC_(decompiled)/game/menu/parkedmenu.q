
script parked_menu_blink_arrow 
    if ScreenElementExists id = <id>
        RunScriptOnScreenElement id = <id> menu_blink_arrow
    endif
endscript
parked_helper_text_pos = (320.0, 405.0)

script parked_make_piece_menu {
        total_dims = (430.0, 60.0)
        separation = 60
    }
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightBarColor return_value = border_rgba
    SetScreenElementLock id = root_window Off
    if ObjectExists id = piece_menu_container
        DestroyScreenElement id = piece_menu_container
    endif
    CreateScreenElement {
        parent = root_window
        id = piece_menu_container
        type = ContainerElement
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
        just = [ center center ]
        event_handlers = [
            {parked_menu_left parked_scroll_sideways_sound params = {}}
            {parked_menu_right parked_scroll_sideways_sound params = {}}
            {parked_menu_left parked_menu_blink_arrow params = { id = piece_menu_left_arrow }}
            {parked_menu_right parked_menu_blink_arrow params = { id = piece_menu_right_arrow }}
        ]
    }
    CreateScreenElement {
        parent = piece_menu_container
        type = hscrollingmenu
        id = piece_menu_scrolling
        just = [ left bottom ]
        Pos = (235.0, 141.0)
        dims = <total_dims>
        internal_just = [ center center ]
        num_items_to_show = 6
    }
    CreateScreenElement {
        parent = piece_menu_scrolling
        type = hmenu
        id = piece_menu_hmenu
        just = [ center top ]
        Pos = (30.0, 0.0)
        dims = <total_dims>
        internal_just = [ left center ]
        regular_space_amount = <separation>
        disable_pad_handling
    }
    CreateScreenElement {
        type = TextElement
        parent = piece_menu_container
        id = piece_menu_name_text
        font = dialog
        text = 'Ma³pia polewka'
        just = [ center center ]
        Pos = (417.0, 85.0)
        rgba = <on_rgba>
        Scale = 0.8500
    }
    CreateScreenElement {
        type = ContainerElement
        id = piece_slider_container
        parent = piece_menu_container
        dims = (320.0, 50.0)
        just = [ left top ]
        Pos = (230.0, 70.0)
        Scale = (1.100000023841858, 1.5)
    }
    CreateScreenElement {
        type = SpriteElement
        id = piece_slider_orange
        parent = piece_slider_container
        dims = (4.0, 4.0)
        Scale = (26.0, 1.5)
        rgba = <on_rgba>
        alpha = 1.0
        just = [ left center ]
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        id = piece_slider_gray
        parent = piece_slider_container
        dims = (4.0, 4.0)
        Scale = (95.0, 1.2000000476837158)
        rgba = [ 31 31 31 128 ]
        alpha = 1.0
        just = [ left center ]
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = piece_menu_container
        texture = white2
        Scale = (55.0, 0.5)
        just = [ left top ]
        Pos = (230.0, 74.0)
        rgba = <border_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = piece_menu_container
        texture = white2
        Scale = (55.0, 0.5)
        just = [ left center ]
        Pos = (230.0, 95.0)
        rgba = <border_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = piece_menu_container
        texture = white2
        Scale = (55.0, 2.0)
        just = [ left center ]
        Pos = (230.0, 85.0)
        rgba = [ 0 0 0 128 ]
    }
endscript

script parked_destroy_piece_menu 
    if ObjectExists \{ id = piece_menu_container }
        DestroyScreenElement \{ id = piece_menu_container }
    endif
endscript

script parked_make_piece_menu_item {
        item_dims = (50.0, 50.0)
        item_midpoint = (30.0, 25.0)
    }
    SetScreenElementLock id = piece_menu_hmenu Off
    CreateScreenElement {
        parent = piece_menu_hmenu
        type = ContainerElement
        id = <metapiece_id>
        dims = <item_dims>
        just = [ center center ]
        event_handlers = [
            { focus parked_piece_focus_script }
            { unfocus parked_piece_unfocus_script }
        ]
        heap = <heap>
    }
    Theme_GetHighlightBarColor return_value = on_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = <metapiece_id>
        texture = parked_piece_frame
        Scale = (0.859000027179718, 0.859000027179718)
        alpha = 0
        just = [ center center ]
        Pos = <item_midpoint>
        rgba = <on_rgba>
        heap = <heap>
    }
    if GotParam ClipBoardIndex
        FormatText textname = text '%d' d = <ClipBoardIndex>
        CreateScreenElement {
            parent = <metapiece_id>
            type = TextElement
            font = dialog
            text = <text>
            just = [ center center ]
            Pos = (30.0, 37.5)
            Scale = 1
            heap = <heap>
        }
    else
        if GotParam EmptyClipBoard
            CreateScreenElement {
                parent = <metapiece_id>
                type = TextElement
                font = dialog
                text = '\u0Brak'
                just = [ center center ]
                Pos = (30.0, 37.5)
                Scale = 1
                heap = <heap>
            }
        else
            CreateScreenElement {
                parent = <metapiece_id>
                type = element3d
                sector = <sector>
                sectors = <sectors>
                Pos = (<item_midpoint> + (5.5, 9.0))
                dims = <item_dims>
                just = [ center center ]
                cameraz = -6
                Scale = 0.8500
                anglex = 0.5000
                angley = 0.7850
                scale_to_screen_dims
                heap = <heap>
            }
        endif
    endif
    Theme_GetHighlightedTextColor return_value = arrow_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = <metapiece_id>
        local_id = left_arrow
        texture = left_arrow
        just = [ center center ]
        Pos = (-5.0, 37.5)
        Scale = 0.8000
        alpha = 0
        z_priority = 55
        rgba = <arrow_rgba>
        heap = <heap>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <metapiece_id>
        local_id = right_arrow
        texture = right_arrow
        just = [ center center ]
        Pos = (65.0, 37.5)
        Scale = 0.8000
        alpha = 0
        z_priority = 55
        rgba = <arrow_rgba>
        heap = <heap>
    }
endscript

script parked_piece_focus_script 
    gettags
    DoScreenElementMorph {
        id = {<id> child = 1}
        Scale = 1.200
        time = 0.2500
    }
    DoScreenElementMorph id = {<id> child = 0}Scale = 1.275 alpha = 0.5500
    DoScreenElementMorph id = {<id> child = left_arrow}alpha = 1
    DoScreenElementMorph id = {<id> child = right_arrow}alpha = 1
    AssignAlias id = {<id> child = right_arrow}alias = piece_menu_right_arrow
    AssignAlias id = {<id> child = left_arrow}alias = piece_menu_left_arrow
endscript

script parked_piece_unfocus_script 
    gettags
    DoScreenElementMorph {
        id = {<id> child = 1}
        Scale = 0.8500
        time = 0.2500
    }
    DoScreenElementMorph id = {<id> child = 0}Scale = 1.275 alpha = 0
    DoScreenElementMorph id = {<id> child = left_arrow}alpha = 0
    DoScreenElementMorph id = {<id> child = right_arrow}alpha = 0
endscript

script parked_set_helper_text_mode 
    if (<mode> = resize_adjust)
        if GotParam LR
            if ((IsXbox)|| (isPC))
                create_helper_text resize_park_helper_text_lr_xbox
            else
                if IsXenon
                    create_helper_text resize_park_helper_text_lr_xenon
                else
                    if IsNGC
                        create_helper_text resize_park_helper_text_lr_ngc
                    else
                        create_helper_text resize_park_helper_text_lr
                    endif
                endif
            endif
        else
            if ((IsXbox)|| (isPC))
                create_helper_text resize_park_helper_text_ud_xbox
            else
                if IsXenon
                    create_helper_text resize_park_helper_text_ud_xenon
                else
                    if IsNGC
                        create_helper_text resize_park_helper_text_ud_ngc
                    else
                        create_helper_text resize_park_helper_text_ud
                    endif
                endif
            endif
        endif
        return 
    endif
    if NOT ObjectExists id = piece_menu_container
        AddParams failed
        return 
    endif
    SetScreenElementLock id = piece_menu_container Off
    switch <mode>
        case regular
        if IsPs2
            create_helper_text park_editor_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
        else
            if IsXenon
                create_helper_text park_editor_helper_text_xenon parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
            else
                if ((IsXbox)|| (isPC))
                    create_helper_text park_editor_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
                else
                    if IsNGC
                        create_helper_text park_editor_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
                    endif
                endif
            endif
        endif
        case gap_regular
        if IsPs2
            create_helper_text gap_regular_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
        else
            if IsXenon
                create_helper_text gap_regular_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
            else
                if ((IsXbox)|| (isPC))
                    create_helper_text gap_regular_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
                else
                    if IsNGC
                        create_helper_text gap_regular_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = 0.9000
                    endif
                endif
            endif
        endif
        case gap_adjust
        if IsPs2
            create_helper_text gap_adjust_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos
        else
            if IsXenon
                create_helper_text gap_adjust_helper_text_xenon parent = piece_menu_container helper_pos = parked_helper_text_pos
            else
                if ((IsXbox)|| (isPC))
                    create_helper_text gap_adjust_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos
                else
                    if IsNGC
                        create_helper_text gap_adjust_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos
                    endif
                endif
            endif
        endif
        case rail_placement
        helper_text = park_editor_helper_text
        RailEditor ::GetEditingMode
        <Scale> = 0.9000
        switch <mode>
            case FreeRoaming
            helper_text = rail_editor_free_roam_helper_text
            <Scale> = 0.8000
            case RailLayout
            helper_text = rail_editor_layout_helper_text
            <Scale> = 0.9000
            case Grab
            helper_text = rail_editor_grab_helper_text
            <Scale> = 0.9000
        endswitch
        if ((IsXbox)|| (isPC))
            switch <mode>
                case FreeRoaming
                helper_text = rail_editor_free_roam_helper_text_xbox
                <Scale> = 0.8000
                case RailLayout
                helper_text = rail_editor_layout_helper_text_xbox
                <Scale> = 0.9000
                case Grab
                helper_text = rail_editor_grab_helper_text_xbox
                <Scale> = 0.9000
            endswitch
        endif
        if IsXenon
            switch <mode>
                case FreeRoaming
                helper_text = rail_editor_free_roam_helper_text_xenon
                <Scale> = 0.8000
                case RailLayout
                helper_text = rail_editor_layout_helper_text_xenon
                <Scale> = 0.9000
                case Grab
                helper_text = rail_editor_grab_helper_text_xenon
                <Scale> = 0.9000
            endswitch
        endif
        if IsNGC
            switch <mode>
                case FreeRoaming
                helper_text = rail_editor_free_roam_helper_text_ngc
                <Scale> = 0.8000
                case RailLayout
                helper_text = rail_editor_layout_helper_text_ngc
                <Scale> = 0.9000
                case Grab
                helper_text = rail_editor_grab_helper_text_ngc
                <Scale> = 0.9000
            endswitch
        endif
        create_helper_text <helper_text> parent = piece_menu_container helper_pos = parked_helper_text_pos Scale = <Scale>
        default 
    endswitch
    SetScreenElementLock id = piece_menu_container on
endscript

script parked_create_percent_bar 
    if ScreenElementExists id = percent_bar
        DestroyScreenElement id = percent_bar
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = root_window
        texture = white2
        id = percent_bar
        just = [ left top ]
        Pos = (20.0, 413.0)
        rgba = [ 0 0 0 100 ]
        Scale = (75.0, 1.5)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = percent_bar
        texture = white2
        id = percent_bar_colored_part
        just = [ left top ]
        Pos = (0.0, 0.0)
        rgba = <on_rgba>
        Scale = 1
    }
endscript

script parked_update_percent_bar 
    if NOT ScreenElementExists \{ id = percent_bar_colored_part }
        return 
    endif
    if GotParam \{ park_full }
        SetScreenElementProps \{id = percent_bar_colored_part rgba = [ 128 0 0 128 ]}
    else
        Theme_GetHighlightedTextColor \{ return_value = on_rgba }
        SetScreenElementProps id = percent_bar_colored_part rgba = <on_rgba>
    endif
    DoScreenElementMorph id = percent_bar_colored_part Scale = ((1.0, 0.0) * <park_percent> + (0.0, 1.0))relative_scale
endscript

script parked_make_set_menu {
        corner_pos = (10.0, 30.0)
        top_arrow_pos = (100.0, 8.0)
        bottom_arrow_pos = (100.0, 85.0)
        item_spacing = 19
        menu_offset_from_top = (33.0, 5.0)
    }
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    SetScreenElementLock id = root_window Off
    if ObjectExists id = set_menu_container
    else
        make_label_menu {
            menu_id = set_menu_container
            scrolling
            Pos = (30.0, 42.0)
            dims = (220.0, 200.0)
            vmenu_id = set_menu_vertical
            just = [ center center ]
            spacing = 0
        }
    endif
    parked_create_percent_bar
    SetScreenElementLock id = root_window on
    wait 0.2000 seconds
endscript

script parked_make_set_menu_item 
    FormatText checksumname = temp_id '%s' s = <set_name>
    MangleChecksums a = NullScript b = <temp_id>
    if ScreenElementExists id = <mangled_id>
        DestroyScreenElement id = <mangled_id>
    endif
    add_label_menu_item text = <set_name> Scale = 0.7500 rot = Random (@ -4 @ -3 @ -2 @ -1 @ 0 @ 1 @ 2 @ 3 @ 4)
endscript

script parked_destroy_set_menu 
    if ScreenElementExists \{ id = set_menu_container }
        printf \{ 'Destroying set_menu_container!' }
        DestroyScreenElement \{ id = set_menu_container }
    endif
    if ObjectExists \{ id = percent_bar }
        DestroyScreenElement \{ id = percent_bar }
    endif
endscript

script parked_lock_piece_and_set_menus 
    SetScreenElementLock \{ id = piece_menu_hmenu on }
    SetScreenElementLock \{ id = piece_menu_scrolling on }
    SetScreenElementLock \{ id = set_menu_vertical on }
    FireEvent type = unfocus target = {set_menu_vertical child = <last_set_number>}
    FireEvent type = focus target = {set_menu_vertical child = <set_number>}
endscript
