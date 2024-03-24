
pager_window_title_color = [ 60 128 60 128 ]
pager_window_message_color = [ 50 90 128 128 ]
pager_window_bg_alpha = 0.1500
pager_message_count_pos = (25.0, 18.0)

script pager_message_list_changed 
    if ScreenElementExists id = pager_anchor
        pager_window_refresh_content changed
    else
        if GotParam deleted
            update_pager_icon stop_flash
            return 
        endif
        if GotParam priority_message
            obj_getid
            WaitUntilScreenClear object = <ObjID> callback = pager_window_create
            return 
        endif
        update_pager_icon flash
    endif
endscript


script pager_window_create object = skater
    update_pager_icon stop_flash
    hide_current_goal
    if ScreenElementExists id = current_menu_anchor
        if NOT InNetGame
            if InInternetMode
                if ObjectExists id = console_message_vmenu
                    DoScreenElementMorph id = console_message_vmenu alpha = 0
                endif
            endif
        endif
        DestroyScreenElement id = current_menu_anchor
        SpawnScript menu3d_animate_out params = { Die }
        pause_menu_gradient Off
    else
        if NOT InNetGame
            pausegame
        endif
        GoalManager_PauseAllGoals
        hide_all_hud_items
    endif
    KillSpawnedScript name = TemporarilyDisableInput
    SpawnScript TemporarilyDisableInput params = { time = 500 }
    SetScreenElementLock id = root_window Off
    root_window ::settags menu_state = on
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = pager_anchor
    }
    AssignAlias id = pager_anchor alias = current_menu_anchor
    create_helper_text generic_helper_text
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = grad_bar
        texture = goal_grad
        rgba = <grad_color>
        Scale = (19.0, 1.0)
        Pos = (0.0, 83.0)
        just = [ left top ]
        z_priority = 35
    }
    CreateScreenElement {
        type = ContainerElement
        parent = pager_anchor
        id = pager_box_anchor
        Pos = (100.0, 83.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        id = pager_bg
        texture = white2
        Pos = (0.0, 0.0)
        just = [ left top ]
        Scale = (55.0, 38.0)
        rgba = [ 0 0 0 80 ]
        z_priority = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (0.0, 0.0)
        just = [ RIGHT top ]
        Scale = (0.5, 38.5)
        rgba = pager_window_title_color
        alpha = 0.2000
        z_priority = -10
    }
    GetScreenElementDims id = pager_bg
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (<height> * (0.0, 1.0))
        just = [ left top ]
        Scale = (55.0, 0.5)
        rgba = pager_window_title_color
        alpha = 0.2000
        z_priority = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (<width> * (1.0, 0.0))
        just = [ left top ]
        Scale = (0.5, 38.5)
        rgba = pager_window_title_color
        alpha = 0.2000
        z_priority = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        id = moto_phone
        texture = nokia_phone
        Pos = (40.0, 65.0)
        just = [ center center ]
        Scale = 1
        rgba = [ 128 128 128 128 ]
    }
    RunScriptOnScreenElement id = moto_phone pager_window_animate_phone
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        id = moto_logo
        texture = motorola
        Pos = (438.0, 4.0)
        just = [ RIGHT top ]
        Scale = 1.050
        rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
        type = TextElement
        parent = pager_box_anchor
        id = pager_message_title
        font = dialog
        Pos = (140.0, 29.0)
        just = [ left top ]
        text = ''
        rgba = pager_window_title_color
        Scale = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (0.0, 30.0)
        just = [ left top ]
        Scale = (55.0, 2.75)
        rgba = pager_window_title_color
        alpha = pager_window_bg_alpha
        z_priority = -5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (0.0, 50.0)
        just = [ left top ]
        Scale = (55.0, 0.5)
        rgba = pager_window_title_color
        alpha = (pager_window_bg_alpha * 3)
        z_priority = -5
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = pager_box_anchor
        id = pager_message_box
        font = dialog
        dims = (360.0, 0.0)
        Pos = (80.0, 53.0)
        just = [ left top ]
        text = ''
        internal_scale = 0.9000
        line_spacing = 0.7000
        internal_just = [ left top ]
        rgba = pager_window_message_color
        Scale = 1
        allow_expansion
    }
    CreateScreenElement {
        type = TextElement
        parent = pager_box_anchor
        id = pager_message_count
        font = dialog
        Pos = pager_message_count_pos
        just = [ center center ]
        text = ''
        rgba = pager_window_title_color
        Scale = 1
        z_priority = 5
    }
    if InInternetMode
        if AnyBuddyMessagesLeft
            ShowNextBuddyMessage
        endif
    endif
    pager_window_build_menu <...> 
    pager_window_refresh_content <...> 
    generic_menu_animate_in menu = pager_box_anchor force
endscript


script pager_window_add_menu_item {focus_script = pager_window_focus_menu_item
        unfocus_script = pager_window_unfocus_menu_item
        pad_choose_sound = theme_menu_pad_choose_sound
        pad_choose_params = {}
    }
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        local_id = <id>
        dims = (400.0, 20.0)
        just = [ center center ]
        event_handlers = [
            {focus <focus_script> params = { id = <id> }}
            {unfocus <unfocus_script> params = { id = <id> }}
            { pad_start <pad_choose_sound> }
            { pad_choose <pad_choose_sound> }
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
            {pad_start <pad_choose_script> params = <pad_choose_params>}
        ]
    }
    container_id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        local_id = text
        font = dialog
        text = <text>
        rgba = pager_window_title_color
        Scale = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = bG
        texture = white2
        just = [ center center ]
        rgba = [ 0 0 0 128 ]
        alpha = 0
        Scale = (55.0, 2.5)
    }
endscript


script pager_window_focus_menu_item 
    DoScreenElementMorph id = {current_menu child = {<id> child = bG}}alpha = 1
endscript


script pager_window_unfocus_menu_item 
    DoScreenElementMorph id = {current_menu child = {<id> child = bG}}alpha = 0
endscript


script pager_window_next_message 
    if InInternetMode
        if AnyBuddyMessagesLeft
            ShowNextBuddyMessage
        endif
    endif
    current_menu ::getsingletag CurrentMessageNum
    current_menu ::settags CurrentMessageNum = (<CurrentMessageNum> + 1)
    pager_window_refresh_content <...> 
endscript


script pager_window_prev_message 
    current_menu ::getsingletag CurrentMessageNum
    current_menu ::settags CurrentMessageNum = (<CurrentMessageNum> -1)
    pager_window_refresh_content
endscript


script pager_window_context_reply 
    current_menu ::getsingletag reply_script
    DestroyScreenElement id = current_menu_anchor
    <reply_script>
endscript


script pager_window_context_reply_highlight 
    setprops rgba = [ 128 128 0 128 ]
    DoMorph time = 0.3000 Scale = 0.5000 relative_scale alpha = 0
    DoMorph time = 0.2000 Scale = 1.500 relative_scale alpha = 1
    begin 
    rot_angle = randomrange (-2.0, 2.0)
    DoMorph time = 0.1000 Scale = 1.100 relative_scale alpha = 1
    DoMorph time = 0.1000 Scale = 0.9000 relative_scale alpha = 0.7000
    repeat 5
    DoMorph time = 0.05000 rot_angle = 0 Scale = 1 relative_scale alpha = 1
endscript


script pager_window_maybe_play_sound 
    if NOT ScreenElementExists id = current_menu
        return 
    endif
    current_menu ::getsingletag target_object
    if GotParam target_object
        <target_object> ::GetPagerMessageCount
        if (<PagerMessageCount> < 2)
            if NOT current_menu ::getsingletag reply_script
                return 
            endif
        endif
        generic_menu_up_or_down_sound <...> 
    endif
endscript


script pager_window_build_menu 
    CreateScreenElement {
        type = vmenu
        parent = pager_box_anchor
        id = pager_box_menu
        Pos = (220.0, 230.0)
        font = dialog
        just = [ left top ]
    }
    SetScreenElementProps {
        id = pager_box_menu
        event_handlers = [{ pad_back generic_pause_exit_sound }
            {pad_back pager_window_destroy params = <pad_back_params>}
            {pad_up pager_window_maybe_play_sound params = { up }}
            {pad_down pager_window_maybe_play_sound params = { down }}
        ]
    }
    AssignAlias id = pager_box_menu alias = current_menu
    if NOT InInternetMode
        pager_window_add_menu_item text = 'CONTEXT REPLY BUTTON' id = context_reply pad_choose_script = pager_window_context_reply
        pager_window_add_menu_item text = 'READ PREVIOUS MESSAGE' id = prev pad_choose_script = pager_window_prev_message
    endif
    pager_window_add_menu_item text = 'READ NEXT MESSAGE' id = next pad_choose_script = pager_window_next_message
    if InInternetMode
        if GotParam nick
            pager_window_add_menu_item text = 'REPLY' id = reply pad_choose_script = message_buddy pad_choose_params = { <...> from_buddy_message }
        endif
    endif
    pager_window_add_menu_item text = 'EXIT' id = exit pad_choose_script = pager_window_destroy
    SpawnScript SK6_SFX_IncomingBeeper
    PauseMusic 1
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (0.0, 215.0)
        just = [ left top ]
        Scale = (55.0, 11.5)
        rgba = pager_window_title_color
        alpha = pager_window_bg_alpha
        z_priority = -5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pager_box_anchor
        texture = white2
        Pos = (0.0, 215.0)
        just = [ left top ]
        Scale = (55.0, 0.5)
        rgba = pager_window_title_color
        alpha = (pager_window_bg_alpha * 3)
        z_priority = -5
    }
    current_menu ::settags target_object = <object>
    if NOT InInternetMode
        <object> ::GetPagerMessageCount
        current_menu ::settags CurrentMessageNum = <PagerMessageCount>
    else
        <object> ::GetFirstUnreadMessageNum
        current_menu ::settags CurrentMessageNum = <FirstUnreadMessageNum>
    endif
endscript


script pager_window_update_buttons 
    if InInternetMode
        if NOT AnyBuddyMessagesLeft
            SetScreenElementProps {
                id = { current_menu child = next }
                not_focusable
            }
            DoScreenElementMorph {
                id = {current_menu child = { next child = text }}
                alpha = 0.2000
            }
        else
            SetScreenElementProps {
                id = { current_menu child = next }
                focusable
            }
            DoScreenElementMorph {
                id = {current_menu child = { next child = text }}
                alpha = 1
            }
        endif
    else
        if NOT (<CurrentMessageNum> > 1)
            SetScreenElementProps {
                id = { current_menu child = prev }
                not_focusable
            }
            DoScreenElementMorph {
                id = {current_menu child = { prev child = text }}
                alpha = 0.2000
            }
        else
            SetScreenElementProps {
                id = { current_menu child = prev }
                focusable
            }
            DoScreenElementMorph {
                id = {current_menu child = { prev child = text }}
                alpha = 1
            }
        endif
        if NOT (<CurrentMessageNum> < <PagerMessageCount>)
            SetScreenElementProps {
                id = { current_menu child = next }
                not_focusable
            }
            DoScreenElementMorph {
                id = {current_menu child = { next child = text }}
                alpha = 0.2000
            }
        else
            SetScreenElementProps {
                id = { current_menu child = next }
                focusable
            }
            DoScreenElementMorph {
                id = {current_menu child = { next child = text }}
                alpha = 1
            }
        endif
        if current_menu ::getsingletag reply_script
            SetScreenElementProps {
                id = { current_menu child = context_reply }
                focusable
            }
            current_menu ::getsingletag reply_text
            SetScreenElementProps {
                id = {current_menu child = { context_reply child = text }}
                text = <reply_text>
            }
            RunScriptOnScreenElement id = {current_menu child = { context_reply child = text }}pager_window_context_reply_highlight
        else
            SetScreenElementProps {
                id = { current_menu child = context_reply }
                not_focusable
            }
            SetScreenElementProps {
                id = {current_menu child = { context_reply child = text }}
                text = ''
            }
            TerminateObjectsScripts id = {current_menu child = { context_reply child = text }}script_name = pager_window_context_reply_highlight
        endif
    endif
    FireEvent type = unfocus target = current_menu
    FireEvent type = focus target = current_menu
endscript


script pager_window_destroy 
    if ScreenElementExists id = pager_anchor
        generic_menu_animate_out menu = pager_box_anchor
        DestroyScreenElement id = pager_anchor
        PauseMusic 0
        PauseStream 1
    endif
    if InInternetMode
        if NOT GotParam hide_ui
            if InNetGame
                create_pause_menu
            else
                destroy_onscreen_keyboard
                if ObjectExists id = console_message_vmenu
                    DoScreenElementMorph id = console_message_vmenu alpha = 1
                endif
                create_network_select_games_menu
            endif
        endif
    else
        create_pause_menu
    endif
endscript


script pager_window_get_message 
    if (<PagerMessageCount> = 0)
        return 
    endif
    <target_object> ::GetPagerMessage message_num = <CurrentMessageNum>
    return <PagerMessage>
endscript


script pager_window_update_message_title 
    if NOT InInternetMode
        if (<PagerMessageCount> = 0)
            Title = ' '
        else
            FormatText textname = Title 'TEXT MESSAGE %a:' a = <CurrentMessageNum>
        endif
    endif
    if ScreenElementExists id = pager_message_title
        SetScreenElementProps {
            id = pager_message_title
            text = <Title>
        }
    endif
endscript


script pager_window_update_message_pane 
    if InInternetMode
        if NOT GotParam nick
            message = '*** NO MESSAGES RECEIVED ***'
        endif
    else
        if (<PagerMessageCount> = 0)
            message = '*** NO MESSAGES RECEIVED ***'
        else
            pager_window_get_message <...> 
            if GotParam from
                FormatText textname = message 'FROM: <%a>\n\n%b' a = <from> b = <message>
            endif
        endif
    endif
    if ScreenElementExists id = pager_message_box
        SetScreenElementProps {
            id = pager_message_box
            text = <message>
        }
    endif
    if ScreenElementExists id = current_menu
        if GotParam reply_script
            current_menu ::settags reply_script = <reply_script>
        else
            current_menu ::removetags tags = [ reply_script ]
        endif
        if GotParam reply_text
            current_menu ::settags reply_text = <reply_text>
        else
            current_menu ::settags reply_text = 'REPLY'
        endif
    endif
endscript


script pager_window_update_message_count 
    if (<PagerMessageCount> = 0)
        counter = ' '
    else
        FormatText textname = counter '%a/%b' a = <CurrentMessageNum> b = <PagerMessageCount>
    endif
    if ScreenElementExists id = pager_message_count
        SetScreenElementProps {
            id = pager_message_count
            text = <counter>
        }
    endif
    if GotParam changed
        flash_message_count <...> 
    endif
endscript


script pager_window_refresh_content 
    if InInternetMode
        FormatText textname = Title 'Message from %s' s = <nick>
        FormatText textname = message '%s' s = <msg_body>
    else
        current_menu ::getsingletag CurrentMessageNum
        current_menu ::getsingletag target_object
        <target_object> ::GetPagerMessageCount
        if (<CurrentMessageNum> > <PagerMessageCount>)
            CurrentMessageNum = <PagerMessageCount>
        endif
        if NOT (<CurrentMessageNum> > 0)
            CurrentMessageNum = 1
        endif
    endif
    pager_window_update_message_title <...> 
    pager_window_update_message_pane <...> 
    if NOT InInternetMode
        pager_window_update_message_count <...> 
    endif
    pager_window_update_buttons <...> 
    if NOT InInternetMode
        current_menu ::settags CurrentMessageNum = <CurrentMessageNum>
    endif
endscript


script pager_window_animate_phone 
    begin 
    DoMorph Scale = 0.9500 relative_scale time = 0.5000 rot_angle = randomrange (-7.0, 7.0)
    DoMorph Scale = 0.7800 relative_scale time = 0.5000 rot_angle = randomrange (-7.0, 7.0)
    repeat 
endscript


script update_pager_icon 
    if GotParam Create
        update_pager_icon Kill
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = SpriteElement
            parent = root_window
            id = pager_new_message_icon
            texture = nokia_phone
            Pos = (205.0, 85.0)
            just = [ center center ]
            Scale = 0
            rgba = [ 128 128 128 128 ]
            z_priority = 50
            rot_angle = 15
        }
    endif
    if NOT ScreenElementExists id = pager_new_message_icon
        return 
    endif
    if GotParam Kill
        DestroyScreenElement id = pager_new_message_icon
    endif
    if GotParam hide
        DoScreenElementMorph id = pager_new_message_icon alpha = 0
    endif
    if GotParam show
        DoScreenElementMorph id = pager_new_message_icon alpha = 1
    endif
    if GotParam flash
        TerminateObjectsScripts id = pager_new_message_icon script_name = flash_pager_icon
        RunScriptOnScreenElement id = pager_new_message_icon flash_pager_icon
        root_window ::getsingletag menu_state
        if (<menu_state> = Off)
            SpawnScript SK6_SFX_IncomingBeeper
        endif
    endif
    if GotParam stop_flash
        TerminateObjectsScripts id = pager_new_message_icon script_name = flash_pager_icon
        DoScreenElementMorph id = pager_new_message_icon Scale = 0
    endif
endscript


script flash_message_count 
    SetScreenElementLock id = pager_box_anchor Off
    if ScreenElementExists id = pager_message_count_ghost
        DestroyScreenElement id = pager_message_count_ghost
    endif
    CreateScreenElement {
        type = TextElement
        parent = pager_box_anchor
        id = pager_message_count_ghost
        font = dialog
        Pos = pager_message_count_pos
        just = [ center center ]
        text = <counter>
        rgba = pager_window_title_color
        Scale = 1
        z_priority = 6
    }
    RunScriptOnScreenElement id = pager_message_count_ghost message_count_animate
endscript


script flash_pager_icon 
    begin 
    DoMorph Scale = 0.4000
    wait 0.8000 seconds
    DoMorph Scale = 0
    wait 0.5000 seconds
    repeat 
endscript


script message_count_animate 
    DoMorph Scale = 1.100 alpha = 0.3000
    DoMorph Scale = 1.700 alpha = 0 time = 0.5000
    Die
endscript

