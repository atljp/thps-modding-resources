
script xboxlive_menu_back_from_friends_list 
    KillSpawnedScript \{ name = async_update_friends_list }
    if IsXbox
        NetSessionFunc \{ obj = presence func = stop_friends_list }
    endif
    menu_stack_pop
endscript

script xboxlive_menu_friends_close 
    KillSpawnedScript \{ name = async_update_friends_list }
    KillSpawnedScript \{ name = xboxlive_menu_async_retrieve_message }
    if NetSessionFunc \{ func = presence_started }
        NetSessionFunc \{ obj = presence func = stop_friends_list }
    endif
endscript

script xboxlive_menu_friends_refresh {
        parent = root_window
        menu_id = friends_menu
        vmenu_id = friends_vmenu
        pad_back_script = xboxlive_menu_back_from_friends_list
        Pos = (25.0, 100.0)
        spacing = 2
        tags = {
            start_index = 0
            items_on_page = 10
        }
        item_props = {
            font = small
            Scale = 0.8000
            highlight_rgba = [ 123 4 93 128 ]
            unhighlight_rgba = [ 123 128 128 128 ]
            bg_dims = (600.0, 25.0)
            container_dims = (640.0, 23.0)
            status_pos = (595.0, 3.0)
            pad_choose_script = xboxlive_menu_friends_item_choose
        }
        title_props = {
            text = net_friends_list
            Pos = (50.0, 50.0)
            rgba = [ 9 120 25 128 ]
            Scale = 2
            font = testtitle
        }
        grid_index = 0
        player_set = friends
    }
    if IsXbox
        NetSessionFunc obj = auth func = get_user_device_index
    endif
    if NOT ScreenElementExists id = <menu_id>
        SetScreenElementLock id = <parent> Off
        if IsXbox
            CreateScreenElement {
                type = ContainerElement
                parent = <parent>
                id = <menu_id>
                just = [ top left ]
                focusable_child = <vmenu_id>
                exclusive_device = <user_index>
            }
        else
            CreateScreenElement {
                type = ContainerElement
                parent = <parent>
                id = <menu_id>
                just = [ top left ]
                focusable_child = <vmenu_id>
            }
        endif
        AssignAlias id = <menu_id> alias = current_menu_anchor
        CreateScreenElement {
            type = TextElement
            parent = current_menu_anchor
            local_id = Title
            shadow
            shadow_rgba = (1.0, 1.0)
            shadow_offs = [0 , 0 , 0 , 100]
            <title_props>
            just = [ left top ]
        }
        <parent_id> = current_menu_anchor
        <vmenu_pos> = <Pos>
        if IsXbox
            CreateScreenElement {
                type = vmenu
                parent = <parent_id>
                id = <vmenu_id>
                Pos = <vmenu_pos>
                just = [ left top ]
                spacing_between = <spacing>
                exclusive_device = <user_index>
                event_handlers = [
                    {pad_back <pad_back_script> params = <pad_back_params>}
                    {pad_up xboxlive_menu_friends_blink_arrow params = { direction = up }}
                    {pad_down xboxlive_menu_friends_blink_arrow params = { direction = down }}
                ]
                tags = {
                    <tags>
                    item_props = <item_props>
                    player_set = <player_set>
                    dialog_callback = <dialog_callback>
                }
            }
        else
            CreateScreenElement {
                type = vmenu
                parent = <parent_id>
                id = <vmenu_id>
                Pos = <vmenu_pos>
                just = [ left top ]
                spacing_between = <spacing>
                event_handlers = [
                    {pad_back <pad_back_script> params = <pad_back_params>}
                    {pad_up xboxlive_menu_friends_blink_arrow params = { direction = up }}
                    {pad_down xboxlive_menu_friends_blink_arrow params = { direction = down }}
                ]
                tags = {
                    <tags>
                    item_props = <item_props>
                    player_set = <player_set>
                    dialog_callback = <dialog_callback>
                }
            }
        endif
        AssignAlias id = <vmenu_id> alias = current_menu
    else
        xboxlive_menu_friends_get_friends_info
        if NOT (<num_items_total> > <start_index>)
            grid_index = 0
            start_index = ((<num_items_total> / <items_on_page>)* <items_on_page>)
            current_menu ::settags start_index = <start_index>
        endif
        if NOT GotParam dont_find_selected_player
            xboxlive_menu_friends_netfunc_redirect action = getindex
            if GotParam player_index
                if (<player_index> > <num_items_total>)
                    scriptassert 'Found index that was too high'
                endif
                mod a = <player_index> b = <items_on_page>
                grid_index = <mod>
                page = (<player_index> / <items_on_page>)
                current_menu ::settags start_index = (<page> * <items_on_page>)
            endif
        endif
    endif
    FireEvent type = unfocus target = current_menu
    DestroyScreenElement id = current_menu preserve_parent
    if IsXbox
        if xboxlive_menu_friends_has_more_than_one_page
            add_arrows = 1
        endif
    endif
    current_menu ::settags allow_new_items
    if GotParam add_arrows
        xboxlive_menu_friends_arrow_add direction = up
    else
        xboxlive_menu_friends_arrow_add
    endif
    xboxlive_menu_friends_netfunc_redirect action = addall
    if GotParam add_arrows
        xboxlive_menu_friends_arrow_add direction = down
    endif
    current_menu ::removetags [ allow_new_items ]
    SetScreenElementLock id = current_menu on
    FireEvent {
        type = focus
        target = current_menu
        Data = {
            grid_index = <grid_index>
        }
    }
endscript

script xboxlive_menu_friends_get_friends_info 
    xboxlive_menu_friends_netfunc_redirect \{ action = getnum }
    friends_vmenu ::getsetoftags \{[ start_index items_on_page ]}
    return <...> 
endscript

script xboxlive_menu_friends_page direction = down
    disassociatefromobject
    xboxlive_menu_friends_get_friends_info
    if (<direction> = up)
        grid_index = <items_on_page>
        if (<start_index> = 0)
            pages = (<num_items_total> / <items_on_page>)
            start_index = (<pages> * <items_on_page>)
        else
            start_index = (<start_index> - <items_on_page>)
        endif
    endif
    if (<direction> = down)
        grid_index = 0
        start_index = (<start_index> + <items_on_page>)
        if NOT (<start_index> < <num_items_total>)
            <start_index> = 0
        endif
    endif
    friends_vmenu ::settags start_index = <start_index>
    xboxlive_menu_friends_refresh grid_index = <grid_index> dont_find_selected_player
    xboxlive_menu_friends_blink_arrow direction = <direction>
endscript

script xboxlive_menu_friends_has_more_than_one_page 
    xboxlive_menu_friends_get_friends_info
    if (<num_items_total> > <items_on_page>)
        return \{ true }
    else
        return \{ false }
    endif
endscript

script xboxlive_menu_friends_arrow_add 
    if NOT current_menu ::getsingletag allow_new_items
        return 
    endif
    if GotParam direction
        if (<direction> = up)
            id = up_arrow
            text = net_title_up
        endif
        if (<direction> = down)
            id = down_arrow
            text = net_title_down
        endif
        item_params = {
            event_handlers = [
                {
                    focus
                    xboxlive_menu_friends_page
                    params = {
                        direction = <direction>
                    }
                }
                {
                    unfocus
                    NullScript
                }
            ]
        }
    else
        id = padding
        text = ''
        item_params = { not_focusable }
    endif
    SetScreenElementLock id = current_menu Off
    current_menu ::getsingletag item_props
    CreateScreenElement {
        type = TextElement
        parent = friends_vmenu
        local_id = <id>
        text = <text>
        font = (<item_props>.font)
        rgba = [ 128 128 128 128 ]
        Scale = 1
        just = [ left top ]
        z_priority = 2
        dimp = (<item_props>.bg_dims)
        <item_params>
        tags = {
            tag_grid_x = 1000
        }
    }
endscript

script xboxlive_menu_friend_focus 
    SetScriptString index = 0 string = <player_name>
    xboxlive_menu_friends_item_focus <...> 
endscript

script xboxlive_menu_friends_separator_add text = '------------------------------------------------------------------'
    if NOT current_menu ::getsingletag allow_new_items
        return 
    endif
    current_menu ::getsingletag item_props
    SetScreenElementLock id = current_menu Off
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        just = [ left top ]
        dims = (640.0, 23.0)
        alpha = 0.6000
        not_focusable
    }
    parent_id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        local_id = text
        Pos = (60.0, 3.0)
        text = <text>
        font = (<item_props>.font)
        rgba = (<item_props>.unhighlight_rgba)
        Scale = (<item_props>.Scale)
        just = [ left top ]
        z_priority = 2
        not_focusable
    }
endscript

script xboxlive_menu_recent_players_separator_add 
    xboxlive_menu_friends_separator_add \{ text = 'Recent Players' }
endscript

script xboxlive_menu_friends_item_add { 
     }
    if IsXbox
        NetSessionFunc obj = auth func = get_user_device_index
    else
        user_index = 0
    endif
    if NOT ScreenElementExists id = friends_vmenu
        printf 'Warning! tried to add a player when friends menu not up'
        return 
    endif
    current_menu ::getsingletag item_props
    if NOT ScreenElementExists id = {current_menu child = <player_id>}
        if NOT current_menu ::getsingletag allow_new_items
            return 
        endif
        if GetScreenElementChildren id = current_menu
            GetArraySize <children>
            tag_grid_x = (<array_size> -1)
            RemoveParameter children
        else
            tag_grid_x = 0
        endif
        SetScreenElementLock id = current_menu Off
        if IsXbox
            CreateScreenElement {
                type = ContainerElement
                parent = current_menu
                local_id = <player_id>
                just = [ left top ]
                dims = (<item_props>.container_dims)
                exclusive_device = <user_index>
                tags = {
                    tag_grid_x = <tag_grid_x>
                }
            }
            parent_id = <id>
            CreateScreenElement {
                type = SpriteElement
                parent = <parent_id>
                local_id = bG
                rgba = [ 0 0 0 255 ]
                alpha = 0
                just = [ left top ]
                Pos = (-2.0, 0.0)
                dims = (<item_props>.bg_dims)
                z_priority = -1
                exclusive_device = <user_index>
            }
            CreateScreenElement {
                type = TextElement
                parent = <parent_id>
                local_id = name
                Pos = (60.0, 3.0)
                text = ''
                font = (<item_props>.font)
                rgba = (<item_props>.unhighlight_rgba)
                Scale = (<item_props>.Scale)
                just = [ left top ]
                z_priority = 2
                exclusive_device = <user_index>
            }
            CreateScreenElement {
                type = TextElement
                parent = <parent_id>
                local_id = status
                Pos = (<item_props>.status_pos)
                text = ''
                font = (<item_props>.font)
                rgba = (<item_props>.unhighlight_rgba)
                Scale = (<item_props>.Scale)
                just = [ RIGHT top ]
                z_priority = 2
                exclusive_device = <user_index>
            }
        else
            CreateScreenElement {
                type = ContainerElement
                parent = current_menu
                local_id = <player_id>
                just = [ left top ]
                dims = (<item_props>.container_dims)
                tags = {
                    tag_grid_x = <tag_grid_x>
                }
            }
            parent_id = <id>
            CreateScreenElement {
                type = SpriteElement
                parent = <parent_id>
                local_id = bG
                rgba = [ 0 0 0 255 ]
                alpha = 0
                just = [ left top ]
                Pos = (-2.0, 0.0)
                dims = (<item_props>.bg_dims)
                z_priority = -1
            }
            CreateScreenElement {
                type = TextElement
                parent = <parent_id>
                local_id = name
                Pos = (60.0, 3.0)
                text = ''
                font = (<item_props>.font)
                rgba = (<item_props>.unhighlight_rgba)
                Scale = (<item_props>.Scale)
                just = [ left top ]
                z_priority = 2
            }
            CreateScreenElement {
                type = TextElement
                parent = <parent_id>
                local_id = status
                Pos = (<item_props>.status_pos)
                text = ''
                font = (<item_props>.font)
                rgba = (<item_props>.unhighlight_rgba)
                Scale = (<item_props>.Scale)
                just = [ RIGHT top ]
                z_priority = 2
            }
        endif
    else
        printf 'Screen element already exists'
    endif
    if IsXbox
        SetScreenElementProps {
            id = {current_menu child = <player_id>}
            exclusive_device = <user_index>
            replace_handlers
            event_handlers = [
                {
                    pad_choose
                    (<item_props>.pad_choose_script)
                    params = {
                        player_id = <player_id>
                        player_name = <player_name>
                        voice = <voice>
                        invite = <invite>
                        Title = <Title>
                    }
                }
                {focus xboxlive_menu_friends_item_focus params = { player_name = <player_name> }}
                { unfocus xboxlive_menu_friends_item_unfocus }
            ]
        }
    else
        SetScreenElementProps {
            id = {current_menu child = <player_id>}
            replace_handlers
            event_handlers = [
                {
                    pad_choose
                    (<item_props>.pad_choose_script)
                    params = {
                        player_id = <player_id>
                        player_name = <player_name>
                        voice = <voice>
                        invite = <invite>
                        Title = <Title>
                    }
                }
                {focus xboxlive_menu_friends_item_focus params = { player_name = <player_name> }}
                { unfocus xboxlive_menu_friends_item_unfocus }
            ]
        }
    endif
    SetScreenElementProps {
        id = {current_menu child = {<player_id> child = name}}
        text = <player_name>
    }
    if IsXbox
        if GotParam players_list
            switch <invite>
                case 0
                text = ''
                case 7
                text = net_friend_status_received_request
                case 8
                text = net_friend_status_sent_request
                default 
                text = net_friend_status_friend
            endswitch
        else
            switch <invite>
                case 0
                text = ''
                case 1
                text = net_friend_status_offline
                case 2
                text = (net_friend_status_online + <Title>)
                case 3
                text = (net_friend_status_playing + <Title>)
                case 4
                text = (net_friend_status_available + <Title>)
                case 5
                text = (net_friend_status_wants_to_play + <Title>)
                case 6
                text = net_friend_status_invited_to_play
                case 7
                text = net_friend_status_received_request
                case 8
                text = net_friend_status_sent_request
                default 
                text = ''
            endswitch
        endif
        switch <voice>
            case 0
            voice_text = ''
            case 1
            voice_text = net_friend_status_voice_muted
            case 2
            voice_text = net_friend_status_voice_on
            case 3
            voice_text = net_friend_status_voice_tv
            default 
            voice_text = ''
        endswitch
        status_text = (<text> + ' ' + <voice_text>)
        SetScreenElementProps {
            id = {current_menu child = {<player_id> child = status}}
            text = <status_text>
        }
        voice_scale = 0.7000
        if GotParam is_talking
            <voice_scale> = 1.0
            rgba = [ 0 128 0 128 ]
        endif
        xboxlive_menu_friends_item_add_sprite {
            player_id = <player_id>
            local_id = voice
            param = <voice>
            options = [
                { val = 0 Off }
                {val = 1 texture = voicemute}
                {val = 2 texture = voiceon}
                {val = 3 texture = voicetv}
            ]
            Pos = (0.0, 10.0)
            Scale = <voice_scale>
            rgba = <rgba>
        }
        xboxlive_menu_friends_get_invite_sprites
        xboxlive_menu_friends_item_add_sprite {
            player_id = <player_id>
            local_id = invite
            param = <invite>
            options = <sprites>
            Pos = (27.0, 10.0)
            Scale = 1
        }
    endif
endscript

script xboxlive_menu_friends_get_invite_sprites 
    return \{sprites = [{ val = 1 texture = friend }{ val = 2 texture = friend }{ val = 3 texture = friend }{ val = 4 texture = friend }{ val = 5 texture = received }{ val = 6 texture = invitesent }{ val = 7 texture = friendreceived }{ val = 8 texture = friendsent }]}
endscript

script xboxlive_menu_friends_item_add_sprite {rgba = [ 128 128 128 128 ]}
    ResolveScreenElementID id = {current_menu child = {<player_id> child = <local_id>}}
    if ScreenElementExists id = <resolved_id>
        DestroyScreenElement id = <resolved_id>
    endif
    if GotParam param
        SetScreenElementLock id = {current_menu child = <player_id>}Off
        GetArraySize options
        i = 0
        begin 
        if ((<options> [ <i> ].val)= <param>)
            texture = (<options> [ <i> ].texture)
            break 
        endif
        i = (<i> + 1)
        repeat <array_size>
        if NOT GotParam texture
            return 
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = {current_menu child = <player_id>}
            local_id = <local_id>
            texture = <texture>
            rgba = <rgba>
            just = [ left center ]
            Scale = <Scale>
            Pos = <Pos>
        }
    endif
endscript

script xboxlive_menu_friends_item_focus 
    obj_getid
    current_menu ::getsingletag \{ item_props }
    SetScreenElementProps id = {<ObjID> child = name}rgba = (<item_props>.highlight_rgba)
    DoScreenElementMorph id = {<ObjID> child = bG}alpha = 1
    current_menu ::settags selected_player_name = <player_name>
endscript

script xboxlive_menu_friends_item_unfocus 
    obj_getid
    current_menu ::getsingletag \{ item_props }
    SetScreenElementProps id = {<ObjID> child = name}rgba = (<item_props>.unhighlight_rgba)
    DoScreenElementMorph id = {<ObjID> child = bG}alpha = 0
endscript

script xboxlive_menu_friends_item_choose_back 
    disassociatefromobject
    xboxlive_dialog_box_exit
    FireEvent \{ type = focus target = current_menu }
    SetScreenElementLock \{ id = friends_menu Off }
    create_helper_text \{ generic_helper_text helper_pos = (320.0, 426.0) }
endscript

script xboxlive_menu_friends_item_context_action 
    printf \{ 'xboxlive_menu_friends_item_context_action' }
endscript

script xboxlive_menu_friends_item_choose_invite_prompt 
    allow_message = 0
    if NetSessionFunc obj = voice func = voice_allowed
        if NetSessionFunc obj = voice func = voice_enabled
            if NetSessionFunc obj = voice func = haslocalheadset
                <allow_message> = 1
            endif
        endif
    endif
    NetSessionFunc obj = auth func = get_user_device_index
    if (<allow_message> = 1)
        xboxlive_dialog_box {Title = net_friends_attach_voice
            text = net_title_attach_voice
            exclusive_device = <user_index>
            buttons = [
                {text = net_answer_yes pad_choose_script = xboxlive_menu_record_voice_menu_create pad_choose_params = {accept_script = xboxlive_menu_friends_item_choose_invite accept_params = { <...> voice_msg }cancel_script = xboxlive_menu_friends_item_choose_back}}
                {text = net_answer_no pad_choose_script = xboxlive_menu_friends_item_choose_invite pad_choose_params = <...> }
                {text = net_answer_cancel pad_choose_script = xboxlive_menu_friends_item_choose_back}
            ]
        }
    else
        xboxlive_menu_friends_item_choose_invite <...> 
    endif
endscript

script xboxlive_menu_friends_item_choose_invite 
    NetSessionFunc obj = presence func = invite_friend params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_reject_invitation 
    NetSessionFunc obj = presence func = reject_invitation params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_follow 
    NetSessionFunc obj = auth func = get_user_device_index
    if NetSessionFunc obj = presence func = follow_friend params = <...> 
        if GotParam same_title
            xboxlive_menu_friends_item_choose_back
            xboxlive_menu_back_from_friends_list
            if InNetGame
                launch_quit_game_dialog
            else
                if InFrontend
                    menu_stack_clear
                    xboxlive_menu_create
                else
                    if GameModeEquals is_career
                        career_mode_quit_dialog
                    else
                        if LevelIs load_sk5ed
                            change main_menu_return_to_createamodes = 0
                            menu_confirm_quit yes_script = menu_confirm_quit_park_editor
                        else
                            if GameModeEquals is_cat
                                change main_menu_return_to_createamodes = 0
                                launch_quit_cat_dialog
                            else
                                menu_confirm_quit
                            endif
                        endif
                    endif
                endif
            endif
        else
            FireEvent type = unfocus target = current_menu
            current_menu ::getsingletag dialog_callback
            if GotParam was_invited
                title_text = net_friends_accepted_invitation
            else
                title_text = net_friends_join_friend
            endif
            main_text = (net_friends_eject_disc + <Title> + '\n\n' + z_mainmenu_str_310)
            <dialog_callback> {
                Title = <title_text>
                text = <main_text>
                text_dims = (400.0, 0.0)
                pad_back_script = xboxlive_menu_friends_item_choose_back
                exclusive_device = <user_index>
                no_bg
                buttons = [
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <...> 
                    }
                ]
            }
        endif
    else
    endif
endscript

script xboxlive_menu_friends_item_choose_remove_confirm 
    NetSessionFunc obj = auth func = get_user_device_index
    xboxlive_menu_friends_item_choose_back
    FireEvent type = unfocus target = current_menu
    current_menu ::getsingletag dialog_callback
    title_text = (net_title_remove)
    FormatText textname = dialog_text (net_question_are_you_sure_remove)s = <player_name>
    <dialog_callback> {
        Title = <title_text>
        text = <dialog_text>
        text_dims = (400.0, 0.0)
        pad_back_script = xboxlive_menu_friends_item_choose_back
        exclusive_device = <user_index>
        no_bg
        buttons = [
            {
                text = net_answer_yes
                pad_choose_script = xboxlive_menu_friends_item_choose_remove
                pad_choose_params = <...> 
            }
            {
                text = net_answer_no
                pad_choose_script = xboxlive_menu_friends_item_choose_back
                pad_choose_params = <...> 
            }
        ]
    }
endscript

script xboxlive_menu_friends_item_choose_remove 
    NetSessionFunc obj = presence func = remove_friend params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_accept_friend_request 
    NetSessionFunc obj = presence func = accept_friendship params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_reject_friend_request 
    NetSessionFunc obj = presence func = reject_friendship params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_back_from_attachment 
    xboxlive_dialog_box_exit
    xboxlive_menu_friends_item_choose <...> 
endscript

script xboxlive_menu_async_retrieve_message 
    wait 1 frame
    begin 
    NetSessionFunc obj = presence func = pump_download
    if NetSessionFunc obj = presence func = download_complete
        break 
    endif
    wait 1 frame
    repeat 
    if NetSessionFunc obj = presence func = download_succeeded
        xboxlive_dialog_box_exit
        xboxlive_menu_friends_present_voicemail_options <...> 
    else
        NetSessionFunc obj = auth func = get_user_device_index
        xboxlive_dialog_box_exit
        create_dialog_box {Title = net_status_msg
            text = net_error_failed_msg_retrieval
            exclusive_device = <user_index>
            buttons = [{text = net_answer_ok pad_choose_script = xboxlive_menu_friends_item_back_from_attachment pad_choose_params = <...> }]
        }
    endif
endscript

script xboxlive_menu_friends_send_feedback 
    NetSessionFunc obj = presence func = send_feedback params = {FEEDBACK = <FEEDBACK> <...> friend}
    xboxlive_menu_friends_present_voicemail_options <...> 
endscript

script xboxlive_menu_friends_send_feedback_confirm 
    NetSessionFunc \{ obj = auth func = get_user_device_index }
    FormatText textname = dialog_text (net_title_confirm_compaint)s = <player_name>
    xboxlive_dialog_box {Title = (net_friends_send_complaint)
        text = <dialog_text>
        exclusive_device = <user_index>
        buttons = [
            {text = net_answer_yes pad_choose_script = xboxlive_menu_friends_send_feedback pad_choose_params = <...> }
            {text = net_answer_no pad_choose_script = xboxlive_menu_friends_present_voicemail_options pad_choose_params = <...> }
        ]
    }
endscript

script xboxlive_menu_friends_feedback 
    player_structure = <...> 
    xboxlive_dialog_box {
        Title = net_title_feedback
        text = (net_title_select_feedback + <player_name> + '\'')
        text_dims = (400.0, 0.0)
        pad_back_script = xboxlive_menu_players_item_choose
        pad_back_params = <player_structure>
        no_bg
        buttons = [
            {
                text = net_title_complaints
                not_focusable = not_focusable
            }
            {
                text = net_title_offensive_msg
                pad_choose_script = xboxlive_menu_players_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_msg_inappropriate
                    <player_structure>
                }
            }
            {
                text = net_title_cursing
                pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_lewdness
                    <player_structure>
                }
            }
            {
                text = net_title_screaming
                pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_screaming
                    <player_structure>
                }
            }
            {
                text = net_title_threats
                pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
                pad_choose_params = {
                    FEEDBACK = neg_harassment
                    <player_structure>
                }
            }
        ]
    }
endscript

script xboxlive_menu_friends_present_voicemail_options 
    xboxlive_menu_record_voice_menu_create {
        accept_script = xboxlive_menu_friends_feedback
        accept_params = <...> 
        cancel_script = xboxlive_menu_friends_item_back_from_attachment
        cancel_params = <...> 
        mode = playback
    }
endscript

script xboxlive_menu_friends_item_choose_play_attachment 
    NetSessionFunc obj = presence func = download_voice_attachment params = <...> 
    xboxlive_dialog_box_exit
    NetSessionFunc \{ obj = auth func = get_user_device_index }
    xboxlive_dialog_box {Title = net_status_msg
        text = net_status_please_wait
        exclusive_device = <user_index>}
    SpawnScriptLater xboxlive_menu_async_retrieve_message params = <...> 
endscript

script xboxlive_menu_friends_item_block_friend_request_confirm 
    NetSessionFunc obj = auth func = get_user_device_index
    xboxlive_menu_friends_item_choose_back
    FireEvent type = unfocus target = current_menu
    current_menu ::getsingletag dialog_callback
    title_text = (net_friends_block_requests)
    FormatText textname = dialog_text (net_question_are_you_sure_block)s = <player_name>
    <dialog_callback> {
        Title = <title_text>
        text = <dialog_text>
        text_dims = (400.0, 0.0)
        pad_back_script = xboxlive_menu_friends_item_choose_back
        exclusive_device = <user_index>
        no_bg
        buttons = [
            {
                text = net_answer_yes
                pad_choose_script = xboxlive_menu_friends_item_block_friend_request
                pad_choose_params = <...> 
            }
            {
                text = net_answer_no
                pad_choose_script = xboxlive_menu_friends_item_choose_back
                pad_choose_params = <...> 
            }
        ]
    }
endscript

script xboxlive_menu_friends_item_block_friend_request 
    NetSessionFunc obj = presence func = block_friendship params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_cancel_invitation 
    NetSessionFunc obj = presence func = cancel_invitation params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_cancel_friend_request 
    NetSessionFunc obj = presence func = cancel_friend_request params = <...> 
    xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose 
    player_structure = <...> 
    Title = net_title_friends_menu
    switch <invite>
        case 1
        text = <player_name>
        if InNetGame
            buttons = [
                {
                    text = net_friends_invite
                    pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_cancel
                    pad_choose_script = xboxlive_menu_friends_item_choose_back
                    pad_choose_params = <player_structure>
                }
            ]
        else
            buttons = [
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_cancel
                    pad_choose_script = xboxlive_menu_friends_item_choose_back
                    pad_choose_params = <player_structure>
                }
            ]
        endif
        case 2
        text = <player_name>
        if InNetGame
            buttons = [
                {
                    text = net_friends_invite
                    pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_cancel
                    pad_choose_script = xboxlive_menu_friends_item_choose_back
                    pad_choose_params = <player_structure>
                }
            ]
        else
            buttons = [
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_cancel
                    pad_choose_script = xboxlive_menu_friends_item_choose_back
                    pad_choose_params = <player_structure>
                }
            ]
        endif
        case 3
        text = <player_name>
        joinable = 0
        if InNetGame
            if NetSessionFunc obj = presence func = is_joinable
                <joinable> = 1
            endif
        endif
        if (<joinable> = 1)
            if NetSessionFunc obj = presence func = in_my_game params = <player_structure>
                buttons = [
                    {
                        text = net_friends_remove
                        pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <player_structure>
                    }
                ]
            else
                buttons = [
                    {
                        text = net_friends_invite
                        pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_friends_remove
                        pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <player_structure>
                    }
                ]
            endif
        else
            buttons = [
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_cancel
                    pad_choose_script = xboxlive_menu_friends_item_choose_back
                    pad_choose_params = <player_structure>
                }
            ]
        endif
        case 4
        text = <player_name>
        joinable = 0
        if InNetGame
            if NetSessionFunc obj = presence func = is_joinable
                <joinable> = 1
            endif
        endif
        if (<joinable> = 1)
            if NetSessionFunc obj = presence func = in_my_game params = <player_structure>
                buttons = [
                    {
                        text = net_friends_remove
                        pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <player_structure>
                    }
                ]
            else
                buttons = [
                    {
                        text = net_friends_invite
                        pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_friends_join
                        pad_choose_script = xboxlive_menu_friends_item_choose_follow
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_friends_remove
                        pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <player_structure>
                    }
                ]
            endif
        else
            if NetSessionFunc obj = presence func = in_my_game params = <player_structure>
                buttons = [
                    {
                        text = net_friends_remove
                        pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <player_structure>
                    }
                ]
            else
                buttons = [
                    {
                        text = net_friends_join
                        pad_choose_script = xboxlive_menu_friends_item_choose_follow
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_friends_remove
                        pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                        pad_choose_params = <player_structure>
                    }
                    {
                        text = net_answer_cancel
                        pad_choose_script = xboxlive_menu_friends_item_choose_back
                        pad_choose_params = <player_structure>
                    }
                ]
            endif
        endif
        case 5
        text = (<player_name>)
        allow_message = 0
        if NetSessionFunc obj = presence func = has_voice_attachment params = <player_structure>
            if NetSessionFunc obj = voice func = voice_allowed
                if NetSessionFunc obj = voice func = voice_enabled
                    <allow_message> = 1
                endif
            endif
        endif
        if (<allow_message> = 1)
            buttons = [
                {
                    text = net_friends_accept_invitation
                    pad_choose_script = xboxlive_menu_friends_item_choose_follow
                    pad_choose_params = { <player_structure> was_invited }
                }
                {
                    text = net_friends_decline_invitation
                    pad_choose_script = xboxlive_menu_friends_item_choose_reject_invitation
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_listen_to_message
                    pad_choose_script = xboxlive_menu_friends_item_choose_play_attachment
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = { <player_structure> remove }
                }
            ]
        else
            buttons = [
                {
                    text = net_friends_accept_invitation
                    pad_choose_script = xboxlive_menu_friends_item_choose_follow
                    pad_choose_params = { <player_structure> was_invited }
                }
                {
                    text = net_friends_decline_invitation
                    pad_choose_script = xboxlive_menu_friends_item_choose_reject_invitation
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_remove
                    pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                    pad_choose_params = { <player_structure> remove }
                }
            ]
        endif
        case 6
        text = <player_name>
        buttons = [
            {
                text = net_friends_cancel_invitation
                pad_choose_script = xboxlive_menu_friends_item_choose_cancel_invitation
                pad_choose_params = <player_structure>
            }
            {
                text = net_friends_remove
                pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
                pad_choose_params = <player_structure>
            }
            {
                text = net_answer_cancel
                pad_choose_script = xboxlive_menu_friends_item_choose_back
                pad_choose_params = <player_structure>
            }
        ]
        case 7
        text = (net_title_accept_friend_request + <player_name>)
        allow_message = 0
        if NetSessionFunc obj = presence func = has_voice_attachment params = <player_structure>
            if NetSessionFunc obj = voice func = voice_allowed
                if NetSessionFunc obj = voice func = voice_enabled
                    <allow_message> = 1
                endif
            endif
        endif
        if (<allow_message> = 1)
            buttons = [
                {
                    text = net_answer_yes
                    pad_choose_script = xboxlive_menu_friends_item_accept_friend_request
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_no
                    pad_choose_script = xboxlive_menu_friends_item_reject_friend_request
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_listen_to_message
                    pad_choose_script = xboxlive_menu_friends_item_choose_play_attachment
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_block
                    pad_choose_script = xboxlive_menu_friends_item_block_friend_request_confirm
                    pad_choose_params = <player_structure>
                }
            ]
        else
            buttons = [
                {
                    text = net_answer_yes
                    pad_choose_script = xboxlive_menu_friends_item_accept_friend_request
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_answer_no
                    pad_choose_script = xboxlive_menu_friends_item_reject_friend_request
                    pad_choose_params = <player_structure>
                }
                {
                    text = net_friends_block
                    pad_choose_script = xboxlive_menu_friends_item_block_friend_request_confirm
                    pad_choose_params = <player_structure>
                }
            ]
        endif
        case 8
        text = (net_title_cancel_friend_request + <player_name>)
        buttons = [
            {
                text = net_answer_yes
                pad_choose_script = xboxlive_menu_friends_item_cancel_friend_request
                pad_choose_params = <player_structure>
            }
            {
                text = net_answer_no
                pad_choose_script = xboxlive_menu_friends_item_choose_back
                pad_choose_params = <player_structure>
            }
        ]
        default 
        printf 'don\'t know what to do for this invite: %d' d = <invite>
        return 
    endswitch
    FireEvent type = unfocus target = current_menu
    current_menu ::getsingletag dialog_callback
    if IsXbox
        NetSessionFunc obj = auth func = get_user_device_index
        <dialog_callback> {
            Title = <Title>
            text = <text>
            text_dims = (400.0, 0.0)
            exclusive_device = <user_index>
            pad_back_script = xboxlive_menu_friends_item_choose_back
            no_bg
            buttons = <buttons>
        }
    else
        NetSessionFunc obj = auth func = get_user_device_index
        <dialog_callback> {
            Title = <Title>
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = xboxlive_menu_friends_item_choose_back
            no_bg
            buttons = <buttons>
        }
    endif
endscript

script xboxlive_menu_friends_blink_arrow 
    if (<direction> = up)
        ResolveScreenElementID \{id = { current_menu child = up_arrow }}
    endif
    if (<direction> = down)
        ResolveScreenElementID \{id = { current_menu child = down_arrow }}
    endif
    if ScreenElementExists id = <resolved_id>
        DoScreenElementMorph id = <resolved_id> alpha = 0
        DoScreenElementMorph id = <resolved_id> alpha = 1 time = 0.3000
    endif
endscript

script xboxlive_menu_friends_netfunc_redirect 
    current_menu ::getsingletag player_set
    switch <player_set>
        case friends
        switch <action>
            case getnum
            NetSessionFunc obj = presence func = get_num_friends
            num_items_total = <num_friends>
            case addall
            xboxlive_menu_friends_get_friends_info
            NetSessionFunc obj = presence func = fill_friends_list params = {start = <start_index> num = <items_on_page>}
            case getindex
            current_menu ::getsingletag selected_player_name
            if GotParam selected_player_name
                NetSessionFunc obj = presence func = get_player_index params = { player_name = <selected_player_name> }
                player_index = <index>
            endif
            default 
            printf 'Bad action: player set: %p, action: %a' p = <player_set> a = <action>
        endswitch
        case players
        switch <action>
            case getnum
            if IsXbox
                NetSessionFunc obj = presence func = get_num_potential_friends
                num_items_total = <num_players>
            else
                num_items_total = 8
            endif
            case addall
            xboxlive_menu_friends_get_friends_info
            if IsXbox
                NetSessionFunc obj = presence func = fill_potential_friends_list params = {start = <start_index> num = <items_on_page>}
            else
                NetSessionFunc func = retrieve_current_players_list
            endif
            case getindex
            current_menu ::getsingletag selected_player_name
            if GotParam selected_player_name
                NetSessionFunc obj = presence func = get_player_index params = {player_name = <selected_player_name> players}
                player_index = <index>
            endif
            default 
            printf 'Bad action: player set: %p, action: %a' p = <player_set> a = <action>
        endswitch
        default 
        scriptassert 'eh'
    endswitch
    return <...> 
endscript

script show_gamer_card 
    NetSessionFunc func = showgamercard params = { player_xuid = <player_xuid> }
endscript

script submit_player_review 
    NetSessionFunc func = submitplayerreview params = { player_xuid = <player_xuid> }
endscript

script xbox360_live_not_allowed 
    create_error_box \{Title = 'Xbox Live' text = 'You do not have permission to access Xbox Live.' buttons = [{ text = 'ok' pad_choose_script = launch_main_menu }] no_animate delay_input}
endscript
