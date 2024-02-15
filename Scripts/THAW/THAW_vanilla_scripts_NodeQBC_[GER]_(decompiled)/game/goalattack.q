goal_goalattack_genericParams = {
    goal_text = 'Für einen Sieg musst du alle Ziele abschließen!'
    unlimited_time = 1
    no_restart
    net
    goal_type_checksum = net
    init = goal_goalattack_init
    activate = goal_goalattack_activate
    deactivate = goal_goalattack_deactivate
    expire = goal_goalattack_expire
    goal_description = 'Ziel-Turnier!'
}

script goal_goalattack_init 
endscript

script goal_goalattack_activate 
    if InNetGame
        FormatText \{ textname = msg_text '\c2Ziel-Turnier \n\c0Schließe alle gewählten Ziele ab.\n' }
        create_panel_block id = mp_goal_text parent = root_window text = <msg_text> style = panel_message_goal final_pos = <msg_pos>
        GetGoalsMode
        SetScoreAccumulation \{ 1 }
    endif
    ResetScore
    ResetComboRecords
    GoalManager_ClearLastGoal
    GoalManager_SetCanStartGoal \{ 1 }
endscript

script goal_goalattack_deactivate 
    GoalManager_ClearLastGoal
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    if ScreenElementExists \{ id = goal_retry_anchor }
        DestroyScreenElement \{ id = goal_retry_anchor }
    endif
endscript

script goalattack_done 
    dialog_box_exit
    do_backend_retry
endscript

script goal_goalattack_expire 
    if ObjectExists \{ id = goal_message }
        DestroyScreenElement \{ id = goal_message }
    endif
    printf \{ 'goal_goalattack_expire' }
    GoalManager_LoseGoal name = <goal_id>
    if OnServer
        CalculateFinalScores
        SendGameOverToObservers
        SpawnScriptLater \{wait_then_create_rankings params = { score_title_text = 'ZIELE' }}
    else
        create_rankings \{ score_title_text = 'ZIELE' }
    endif
endscript

script AddGoal_GoalAttack 
    GoalManager_AddGoal name = goalattack {
        params = { goal_goalattack_genericParams
        <...> 
         }
    }
endscript

script StartGoal_GoalAttack 
    GoalManager_EditGoal name = goalattack params = <...> 
    GoalManager_ActivateGoal \{ name = goalattack }
endscript

script create_choose_goals_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GoalManager_HidePoints
    hide_net_player_names
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goals_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = goals_anchor alias = current_menu_anchor
    kill_start_key_binding
    build_theme_sub_title Title = 'ZIELE WÄHLEN'
    CreateScreenElement {
        type = ContainerElement
        parent = goals_anchor
        id = goals_menu
        dims = (640.0, 480.0)
        Pos = (320.0, 640.0)
    }
    AssignAlias id = goals_menu alias = current_menu_anchor
    theme_background width = 6.350 Pos = (320.0, 85.0) num_parts = 10.50
    <root_pos> = (80.0, 25.0)
    Theme_GetHighlightedTextColor return_value = text_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_top_bar
        texture = black
        rgba = [ 0 0 0 85 ]
        Scale = (130.0, 7.0)
        Pos = (65.0, 87.0)
        just = [ left top ]
        z_priority = 2
    }
    GetStackedScreenElementPos y id = <id> Offset = (6.0, -25.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Ziele'
        rgba = <text_rgba>
        Scale = 1
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (115.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_up_arrow
        texture = up_arrow
        rgba = [ 128 128 128 85 ]
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (210.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Ein/Aus'
        rgba = <text_rgba>
        Pos = <Pos>
        just = [ left top ]
        Scale = 1
        z_priority = 3
    }
    GetStackedScreenElementPos y id = view_goals_menu_top_bar Offset = (60.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 68.0)
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 0 0 0 0 ]
    }
    GetStackedScreenElementPos x id = <id> Offset = (355.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 68.0)
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 0 0 0 0 ]
    }
    GetStackedScreenElementPos y id = view_goals_menu_top_bar Offset = (0.0, 250.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        rgba = [ 0 0 0 0 ]
        Scale = (124.0, 6.0)
        Pos = <Pos>
        just = [ left top ]
        z_priority = 2
    }
    GetStackedScreenElementPos y id = view_goals_menu_up_arrow Offset = (0.0, 260.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_down_arrow
        texture = down_arrow
        rgba = [ 128 128 128 85 ]
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = view_goals_menu_top_bar Offset = (20.0, 5.0)
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        dims = (640.0, 245.0)
        Pos = <Pos>
        just = [ left top ]
        internal_just = [ center top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = <id>
        id = goals_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        dont_allow_wrap
        event_handlers = [
            {pad_up set_which_arrow params = { arrow = view_goals_menu_up_arrow }}
            {pad_down set_which_arrow params = { arrow = view_goals_menu_down_arrow }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_back generic_menu_pad_back_sound }
        ]
    }
    AssignAlias id = goals_vmenu alias = current_menu
    DoScreenElementMorph id = current_menu_anchor Pos = (320.0, 240.0) time = 0.2000
    FireEvent type = focus target = current_menu
    SetScreenElementProps {id = current_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = exit_choose_goals_menu }}
        ]
    }
    current_menu ::settags num_goals = 0
    current_menu ::settags forceoff = 0
    select_all_no_goals_menu_set_event
    GetPreferenceChecksum pref_type = network goals
    GoalManager_AddGoalChoices classic_only
    create_helper_text generic_helper_text
endscript

script exit_choose_goals_menu 
    if ObjectExists id = goals_anchor
        DestroyScreenElement id = goals_anchor
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon
        DestroyScreenElement id = box_icon
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon_2
        DestroyScreenElement id = box_icon_2
        wait 1 gameframe
    endif
    if ObjectExists id = grunge_anchor
        DestroyScreenElement id = grunge_anchor
        wait 1 gameframe
    endif
    create_network_game_options_menu
endscript

script hide_net_player_names 
    if GotParam \{ on }
        Scale = 1
    else
        Scale = 0
    endif
    index = 0
    begin 
    if ScreenElementExists id = {net_score_menu child = <index>}
        DoScreenElementMorph id = {net_score_menu child = <index>}Scale = <Scale> time = 0
    endif
    repeat 8
endscript

script choose_goals_menu_set_events 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightedTextColor return_value = on_rgba
    current_menu ::getsingletag num_goals
    current_menu ::settags num_goals = (<num_goals> + 1)
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        just = [ left top ]
        internal_just = [ left top ]
        dims = (640.0, 20.0)
        event_handlers = [{ focus choose_goals_menu_focus }
            { unfocus choose_goals_menu_unfocus }
            {pad_choose choose_goals_menu_choose params = { name = <goal_id> }}
        ]
    }
    <row_container_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        text = <text>
        Scale = 0.8000
        rgba = <off_rgba>
    }
    GetScreenElementDims id = <id>
    if (<width> > 310)
        printf <width>
        DoScreenElementMorph time = 0 id = <id> Scale = (0.8000 * 310.0 / <width>)
    endif
    highlight_angle = 0
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        texture = DE_highlight_bar
        Pos = (-25.0, 0.0)
        just = [ left center ]
        rgba = [ 0 0 0 0 ]
        z_priority = 3
        Scale = (4.099999904632568, 0.699999988079071)
        rot_angle = (<highlight_angle> / 4)
    }
    if GoalManager_GoalIsSelected name = <goal_id>
        <check_rgba> = <on_rgba>
    else
        <check_rgba> = [ 0 0 0 0 ]
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        texture = checkbox
        Pos = (420.0, 0.0)
        Scale = 0.5000
        rgba = <off_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        texture = checkmark
        Pos = (420.0, -2.0)
        Scale = 0.7500
        rgba = <check_rgba>
        z_priority = 10
    }
endscript

script select_all_no_goals_menu_set_event 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightedTextColor return_value = on_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        just = [ left top ]
        internal_just = [ left top ]
        dims = (640.0, 20.0)
        event_handlers = [{ focus choose_goals_menu_focus }
            { unfocus choose_goals_menu_unfocus }
            { pad_choose force_select_goals_on_off }
        ]
    }
    <row_container_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        text = 'Wähle alle/keine Ziele aus.'
        Scale = 0.8000
        rgba = <off_rgba>
    }
    GetScreenElementDims id = <id>
    if (<width> > 310)
        printf <width>
        DoScreenElementMorph time = 0 id = <id> Scale = (0.8000 * 310.0 / <width>)
    endif
    highlight_angle = 0
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        texture = DE_highlight_bar
        Pos = (-25.0, 0.0)
        just = [ left center ]
        rgba = [ 0 0 0 0 ]
        z_priority = 3
        Scale = (4.099999904632568, 0.699999988079071)
        rot_angle = (<highlight_angle> / 4)
    }
endscript

script view_selected_goals_menu_set_events 
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    Theme_GetHighlightedTextColor return_value = on_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        just = [ left top ]
        internal_just = [ left top ]
        dims = (640.0, 20.0)
        event_handlers = [{ focus choose_goals_menu_focus }
            { unfocus choose_goals_menu_unfocus }
        ]
    }
    <row_container_id> = <id>
    ReplaceTrickText name = <goal_id>
    wait 200
    printstruct <...> 
    CreateScreenElement {
        type = TextElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        text = <text>
        Scale = 0.8000
        rgba = <off_rgba>
    }
    highlight_angle = 0
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        texture = DE_highlight_bar
        Pos = (-25.0, 0.0)
        just = [ left center ]
        rgba = [ 0 0 0 0 ]
        z_priority = 3
        Scale = (4.099999904632568, 0.699999988079071)
        rot_angle = (<highlight_angle> / 4)
    }
    if GoalManager_HasWonGoal name = <goal_id>
        <check_rgba> = <on_rgba>
    else
        <check_rgba> = [ 0 0 0 0 ]
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        texture = checkbox
        Pos = (420.0, 0.0)
        Scale = 0.5000
        rgba = <off_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <row_container_id>
        just = [ left center ]
        font = small
        texture = checkmark
        Pos = (420.0, 0.0)
        Scale = 0.7500
        rgba = <check_rgba>
        z_priority = 10
    }
endscript

script choose_goals_menu_choose 
    gettags
    Theme_GetHighlightedTextColor return_value = text_rgba
    if OnServer
        if NOT GotParam force
            GoalManager_ToggleGoalSelection <...> 
        else
            if GoalManager_GoalIsSelected name = <name>
                if (<forceoff> = 1)
                    GoalManager_ToggleGoalSelection <...> 
                endif
            else
                if NOT (<forceoff> = 1)
                    GoalManager_ToggleGoalSelection <...> 
                endif
            endif
        endif
    else
        if NOT GotParam force
            GoalManager_ToggleGoalSelection <...> 
        else
            if GoalManager_GoalIsSelected name = <name>
                if (<forceoff> = 1)
                    GoalManager_ToggleGoalSelection <...> 
                    FCFSRequestToggleGoalSelection <...> 
                endif
            else
                if NOT (<forceoff> = 1)
                    GoalManager_ToggleGoalSelection <...> 
                    FCFSRequestToggleGoalSelection <...> 
                endif
            endif
        endif
    endif
    wait 0.2000 seconds
    if GoalManager_GoalIsSelected name = <name>
        DoScreenElementMorph {
            id = {<id> child = 3}
            rgba = <text_rgba>
        }
    else
        DoScreenElementMorph {
            id = {<id> child = 3}
            rgba = [ 0 0 0 0 ]
        }
    endif
endscript

script choose_goals_menu_focus 
    gettags
    Theme_GetHighlightedTextColor return_value = text_rgba
    RunScriptOnScreenElement id = {<id> child = 0}text_twitch_effect2
    GetScreenElementDims id = {<id> child = 0}
    if (<width> > 305)
        printf <width>
        DoScreenElementMorph time = 0 id = {<id> child = 0}Scale = (0.8000 * 310.0 / <width>)rgba = <text_rgba>
    else
        DoScreenElementMorph {
            id = {<id> child = 0}
            rgba = <text_rgba>
            Scale = (0.8000 * ((<width> + 5.0)/ <width>))
        }
    endif
    Theme_GetHighlightBarColor return_value = bar_rgba
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <bar_rgba>
    }
    if GotParam first_item
        SetScreenElementProps {
            id = view_goals_menu_up_arrow
            rgba = [ 128 128 128 0 ]
        }
    else
        SetScreenElementProps {
            id = view_goals_menu_up_arrow
            rgba = [ 128 128 128 85 ]
        }
    endif
    if GotParam last_item
        SetScreenElementProps {
            id = view_goals_menu_down_arrow
            rgba = [ 128 128 128 0 ]
        }
    else
        SetScreenElementProps {
            id = view_goals_menu_down_arrow
            rgba = [ 128 128 128 85 ]
        }
    endif
    goals_vmenu ::gettags
    if GotParam arrow_id
        menu_vert_blink_arrow { id = <arrow_id> }
    endif
endscript

script choose_goals_menu_unfocus 
    gettags
    Theme_GetUnhighlightedTextColor return_value = text_rgba
    KillSpawnedScript name = text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
        Scale = 0.8000
    }
    GetScreenElementDims id = {<id> child = 0}
    if (<width> > 310)
        printf <width>
        DoScreenElementMorph time = 0 id = {<id> child = 0}Scale = (0.8000 * 310.0 / <width>)
    endif
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = [ 0 0 0 0 ]
    }
endscript

script wait_and_create_view_selected_goals_menu 
    wait \{ 120 frames }
    create_view_selected_goals_menu <...> 
endscript

script create_view_selected_goals_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    edit_tricks_menu_exit just_remove
    if NOT GotParam from_pause
        exit_pause_menu
    endif
    hide_current_goal
    destroy_onscreen_keyboard
    dialog_box_exit
    GoalManager_HidePoints
    pause_balance_meter
    pause_run_timer
    kill_start_key_binding
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goals_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    AssignAlias id = goals_anchor alias = current_menu_anchor
    kill_start_key_binding
    if GotParam goal_summary
        build_theme_sub_title Title = 'ZIELLISTE'
    else
        build_theme_sub_title Title = 'ZIELE'
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = goals_anchor
        id = goals_menu
        dims = (640.0, 480.0)
        Pos = (320.0, 640.0)
    }
    theme_background width = 6.350 Pos = (320.0, 85.0) num_parts = 10.50
    <root_pos> = (80.0, 25.0)
    Theme_GetHighlightedTextColor return_value = text_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_top_bar
        texture = black
        rgba = [ 0 0 0 85 ]
        Scale = (130.0, 7.0)
        Pos = (65.0, 87.0)
        just = [ left top ]
        z_priority = 2
    }
    GetStackedScreenElementPos y id = <id> Offset = (6.0, -25.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Ziele'
        rgba = <text_rgba>
        Scale = 1
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (115.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_up_arrow
        texture = up_arrow
        rgba = [ 128 128 128 85 ]
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos x id = <id> Offset = (190.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = current_menu_anchor
        font = dialog
        text = 'Fertig'
        rgba = <text_rgba>
        Pos = <Pos>
        just = [ left top ]
        Scale = 1
        z_priority = 3
    }
    GetStackedScreenElementPos y id = view_goals_menu_top_bar Offset = (60.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 68.0)
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 0 0 0 0 ]
    }
    GetStackedScreenElementPos x id = <id> Offset = (355.0, 0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        Scale = (2.0, 68.0)
        Pos = <Pos>
        just = [ left top ]
        rgba = [ 0 0 0 0 ]
    }
    GetStackedScreenElementPos y id = view_goals_menu_top_bar Offset = (0.0, 250.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        rgba = [ 0 0 0 0 ]
        Scale = (124.0, 6.0)
        Pos = <Pos>
        just = [ left top ]
        z_priority = 2
    }
    GetStackedScreenElementPos y id = view_goals_menu_up_arrow Offset = (0.0, 260.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = view_goals_menu_down_arrow
        texture = down_arrow
        rgba = [ 128 128 128 85 ]
        Pos = <Pos>
        just = [ left top ]
        z_priority = 3
    }
    GetStackedScreenElementPos y id = view_goals_menu_top_bar Offset = (20.0, 5.0)
    CreateScreenElement {
        type = vscrollingmenu
        parent = current_menu_anchor
        dims = (640.0, 245.0)
        Pos = <Pos>
        just = [ left top ]
        internal_just = [ center top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = <id>
        id = goals_vmenu
        Pos = (0.0, 0.0)
        just = [ left top ]
        internal_just = [ left top ]
        dont_allow_wrap
        event_handlers = [
            {pad_up set_which_arrow params = { arrow = view_goals_menu_up_arrow }}
            {pad_down set_which_arrow params = { arrow = view_goals_menu_down_arrow }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
            { pad_back generic_menu_pad_back_sound }
        ]
    }
    AssignAlias id = goals_vmenu alias = current_menu
    DoScreenElementMorph id = current_menu_anchor Pos = (320.0, 240.0) time = 0.2000
    FireEvent type = focus target = current_menu
    if GotParam goal_summary
        SetScreenElementProps {id = current_menu
            event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = close_goals_menu }}
            ]
        }
    else
        SetScreenElementProps {id = current_menu
            event_handlers = [
                {pad_back generic_menu_pad_back params = { callback = exit_view_goals_menu }}
            ]
        }
    endif
    GoalManager_AddGoalChoices selected_only
    create_helper_text helper_text_elements = [{ text = '\m1 = Zurück' }]
endscript

script exit_view_goals_menu 
    if ObjectExists id = goals_anchor
        DestroyScreenElement id = goals_anchor
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon
        DestroyScreenElement id = box_icon
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon_2
        DestroyScreenElement id = box_icon_2
        wait 1 gameframe
    endif
    if ObjectExists id = grunge_anchor
        DestroyScreenElement id = grunge_anchor
        wait 1 gameframe
    endif
    create_pause_menu
endscript

script close_goals_menu 
    if ObjectExists id = goals_anchor
        DestroyScreenElement id = goals_anchor
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon
        DestroyScreenElement id = box_icon
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon_2
        DestroyScreenElement id = box_icon_2
        wait 1 gameframe
    endif
    if ObjectExists id = grunge_anchor
        DestroyScreenElement id = grunge_anchor
        wait 1 gameframe
    endif
    GoalManager_ShowPoints
    Unpause_Balance_Meter
    unpause_run_timer
    restore_start_key_binding
    if ObjectExists id = view_goals_menu
        exit_pause_menu
    endif
endscript

script goal_attack_completed_goal 
    FormatText textname = msg_text 'Ziel abgeschlossen! Jetzt noch %i!' i = <NumGoalsLeft>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script goal_attack_completed_goal_other_same_team 
    FormatText textname = msg_text '%n hat %t abgeschlossen! Jetzt noch %i!' n = <playername> t = <GoalText> i = <NumGoalsLeft>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script goal_attack_started_goal_other_same_team 
    FormatText textname = msg_text '%n beginnt jetzt %t!' n = <playername> t = <GoalText>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script force_select_goals_on_off 
    current_menu ::getsingletag forceoff
    if (<forceoff> = 1)
        current_menu ::settags forceoff = 0
    else
        current_menu ::settags forceoff = 1
    endif
    current_menu ::getsingletag num_goals
    if (<num_goals> > 0)
        counter = 1
        begin 
        FireEvent type = pad_choose target = {current_menu child = <counter>}Data = {force forceoff = <forceoff>}
        counter = (<counter> + 1)
        repeat <num_goals>
    endif
endscript
