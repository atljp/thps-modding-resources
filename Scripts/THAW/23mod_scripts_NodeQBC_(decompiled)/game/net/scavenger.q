SentObjectPlacements = 0
SentStartMessage = 0
goal_scavenger_genericParams = {
    goal_text = 'Aby wygraæ, zbierz wszystkie przedmioty!'
    time = 10
    net
    goal_type_checksum = net
    dont_deactivate_upon_expiration
    game_continues_after_expiration
    init = goal_scavenger_init
    active = goal_scavenger_active
    activate = goal_scavenger_activate
    deactivate = goal_scavenger_deactivate
    expire = goal_scavenger_expire
    goal_description = 'Polowanie!'
}

script goal_scavenger_init 
endscript

script goal_scavenger_active 
endscript

script goal_scavenger_activate 
    change SentObjectPlacements = 0
    change SentStartMessage = 0
    FormatText textname = msg_text '\c2Polowanie:\c0\nAby umieciæ obiekt, wcinij \b7 + \b1'
    msg_pos = (620.0, 27.0)
    if InSplitScreenGame
        ScriptGetScreenMode
        if (<screen_mode> = split_vertical)
            msg_pos = (420.0, 44.0)
        else
            msg_pos = (640.0, 204.0)
        endif
    endif
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle dims = (300.0, 0.0)
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            unhide
        }
    endif
    RunScriptOnScreenElement id = the_time clock_morph
    if NOT IsObserving
        bind_scavenger_tricks
    endif
    if InSplitScreenGame
        bind_scavenger_tricks_player_2
    endif
endscript

script goal_scavenger_deactivate 
    if NOT GoalManager_GoalIsActive \{ name = scavenger_collect_period }
        if NOT GoalManager_GoalIsActive \{ name = scavenger_interval }
            if ObjectExists \{ id = mp_goal_text }
                DestroyScreenElement \{ id = mp_goal_text }
            endif
        endif
    endif
    if NOT IsObserving
        unbind_scavenger_tricks
    endif
    if InSplitScreenGame
        unbind_scavenger_tricks_player_2
    endif
endscript

script goal_scavenger_add_time 
    create_net_panel_message \{ text = 'Musisz umieciæ przynajmniej jeden obiekt' style = net_team_panel_message msg_time = 3000 }
    GoalManager_AddTime \{ name = scavenger 15 }
endscript

script goal_scavenger_expire 
    if AtLeastOneObjectPlaced
        GoalManager_DeactivateGoal \{ name = scavenger }
        if OnServer
            StartGoal_Scavenger_Interval \{ time = 6 }
        else
            StartGoal_Scavenger_Interval \{ unlimited_time }
        endif
    else
        if OnServer
            AnnounceNeedToPlaceObjects
        endif
    endif
endscript

script AddGoal_Scavenger 
    GoalManager_AddGoal \{name = scavenger params = { goal_scavenger_genericParams }}
endscript

script StartGoal_Scavenger 
    GoalManager_EditGoal name = scavenger params = <...> 
    GoalManager_ActivateGoal \{ name = scavenger }
    GoalManager_SetGoalTimer \{ name = scavenger }
endscript
goal_scavenger_collect_genericParams = {
    goal_text = ''
    time = 60
    net
    goal_type_checksum = net
    init = goal_scavenger_collect_init
    activate = goal_scavenger_collect_activate
    deactivate = goal_scavenger_collect_deactivate
    expire = goal_scavenger_collect_expire
    goal_description = ''
}

script goal_scavenger_collect_init 
endscript

script goal_scavenger_collect_active 
endscript

script goal_scavenger_collect_activate 
    if GoalManager_GoalIsActive name = scavenger_interval
        GoalManager_DeactivateGoal name = scavenger_interval
    endif
    ResetSkaters
    show_all_objects
    FormatText textname = msg_text '\c2Polowanie:\c0\nPozbieraj przedmioty!'
    msg_pos = (620.0, 27.0)
    if InSplitScreenGame
        ScriptGetScreenMode
        if (<screen_mode> = split_vertical)
            msg_pos = (400.0, 44.0)
        else
            msg_pos = (640.0, 204.0)
        endif
    endif
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            unhide
        }
    endif
    RunScriptOnScreenElement id = the_time clock_morph
endscript

script goal_scavenger_collect_deactivate 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
endscript

script goal_scavenger_finished 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    SpawnScriptLater \{ wait_then_create_rankings }
endscript

script goal_scavenger_collect_expire 
    goal_scavenger_finished
endscript
goal_scavenger_interval_genericParams = {
    goal_text = ''
    time = 6
    net
    goal_type_checksum = net
    init = goal_scavenger_interval_init
    activate = goal_scavenger_interval_activate
    deactivate = goal_scavenger_interval_deactivate
    expire = goal_scavenger_interval_expire
    active = goal_scavenger_interval_active
    goal_description = ''
    game_continues_after_expiration
}

script goal_scavenger_interval_init 
endscript

script goal_scavenger_interval_active 
    if NOT InSplitScreenGame
        if OnServer
            GoalManager_GetTimeLeftInNetGame
            if NOT IsTrue \{ SentObjectPlacements }
                if GotParam \{ time_left }
                    if (<time_left> < 3000)
                        BroadcastObjectPlacements
                        change \{ SentObjectPlacements = 1 }
                    endif
                endif
            endif
            if NOT IsTrue \{ SentStartMessage }
                if GotParam \{ time_left }
                    if (<time_left> < 500)
                        AnnounceHuntStarted
                        change \{ SentStartMessage = 1 }
                    endif
                endif
            endif
        endif
    endif
endscript

script goal_scavenger_interval_activate 
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            hide
        }
    endif
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    FormatText textname = msg_text '\c2Polowanie:\c0\nPrzygotuj siê...!'
    if InSplitScreenGame
        ScriptGetScreenMode
        if (<screen_mode> = split_vertical)
            msg_pos = (400.0, 44.0)
        else
            msg_pos = (640.0, 204.0)
        endif
    endif
    create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle
endscript

script goal_scavenger_interval_deactivate 
    if ScreenElementExists \{ id = the_time }
        SetScreenElementProps \{ id = the_time unhide }
    endif
    if NOT GoalManager_GoalIsActive \{ name = scavenger }
        if NOT GoalManager_GoalIsActive \{ name = scavenger_collect_period }
            if ObjectExists \{ id = mp_goal_text }
                DestroyScreenElement \{ id = mp_goal_text }
            endif
        endif
    endif
endscript

script goal_scavenger_interval_expire 
    StartGoal_Scavenger_Collect
endscript

script AddGoal_Scavenger_Interval 
    GoalManager_AddGoal \{name = scavenger_interval params = { goal_scavenger_interval_genericParams }}
endscript

script StartGoal_Scavenger_Interval 
    GoalManager_EditGoal name = scavenger_interval params = <...> 
    GoalManager_ActivateGoal \{ name = scavenger_interval }
endscript

script AddGoal_Scavenger_Collect 
    GoalManager_AddGoal \{name = scavenger_collect_period params = { goal_scavenger_collect_genericParams }}
endscript

script ForceStartScavengerCollect 
    if GoalManager_GoalIsActive \{ name = scavenger }
        GoalManager_DeactivateGoal \{ name = scavenger }
    endif
    if GoalManager_GoalIsActive \{ name = scavenger_interval }
        GoalManager_DeactivateGoal \{ name = scavenger_interval }
    endif
    StartGoal_Scavenger_Collect
endscript

script StartGoal_Scavenger_Collect 
    GetTimeLimit
    GoalManager_EditGoal name = scavenger_collect_period params = { time = <time_limit> }
    GoalManager_ActivateGoal \{ name = scavenger_collect_period }
endscript

script ScavengerHunt_GotObject 
    ReportObjectPickup <...> 
    playsound \{ goaldone vol = 150 }
    <id> ::Die
endscript

script ScavengerHunt_KillObject 
    if ObjectExists id = <id>
        <id> ::Die
    endif
endscript

script ScavengerHunt_GotObject2P 
    <id> ::gettags
    if GotParam \{ player_retrieved }
        if (<player_retrieved> = <colobjid>)
        else
            ReportObjectPickup <...> 
            playsound \{ goaldone vol = 150 }
            <id> ::Die
        endif
    else
        ReportObjectPickup <...> 
        playsound \{ goaldone vol = 150 }
        <id> ::settags player_retrieved = <colobjid>
        if (<intid> = 0)
            obj_clearvisibility \{ viewport = 0 }
        else
            obj_clearvisibility \{ viewport = 1 }
        endif
    endif
endscript

script ScavengerHunt_InitObjectExceptions 
    Obj_ClearExceptions
    obj_setinnerradius \{ 8 }
    if InSplitScreenGame
        Obj_SetException {
            Ex = anyobjectinradius
            scr = ScavengerHunt_GotObject2P
            params = { id = <id> }
        }
    else
        Obj_SetException {
            Ex = objectinradius
            scr = ScavengerHunt_GotObject
            params = { id = <id> }
        }
    endif
endscript

script ScavengerHunt_InitObject 
    if InSplitScreenGame
        obj_clearvisibility \{ viewport = 0 }
        obj_clearvisibility \{ viewport = 1 }
    endif
    obj_invisible
    obj_roty \{ Speed = 200 }
    obj_hover \{ amp = 6 freq = 2 }
endscript

script ScavengerHunt_ShowObject 
    obj_visible
    if InSplitScreenGame
        obj_setvisibility \{ viewport = 0 }
        obj_setvisibility \{ viewport = 1 }
    endif
endscript

script DropSHObject 
    FormatText checksumname = id 'sh_object_%i_%j' i = <ObjID> j = <index>
    CreateCompositeObject {
        Components = sh_object_composite_structure
        params = {name = <id>
            Pos = <Pos>
            neversuspend
            Model = 'GameObjects\scavenger_coin\scavenger_coin.mdl'
        }
    }
    if InTeamGame
        GetPlayersTeam ObjID = <ObjID>
        switch <team>
            case 0
            <id> ::obj_setcolorrgb r = 102 g = 26 b = 8
            case 1
            <id> ::obj_setcolorrgb r = 17 g = 64 b = 116
            case 2
            <id> ::obj_setcolorrgb r = 9 g = 107 b = 36
            case 3
            <id> ::obj_setcolorrgb r = 123 g = 99 b = 3
        endswitch
    else
        switch <ObjID>
            case 0
            <id> ::obj_setcolorrgb r = 102 g = 26 b = 8
            case 1
            <id> ::obj_setcolorrgb r = 17 g = 64 b = 116
            case 2
            <id> ::obj_setcolorrgb r = 9 g = 107 b = 36
            case 3
            <id> ::obj_setcolorrgb r = 123 g = 99 b = 3
            case 4
            <id> ::obj_setcolorrgb r = 0 g = 128 b = 128
            case 5
            <id> ::obj_setcolorrgb r = 128 g = 0 b = 128
            case 6
            <id> ::obj_setcolorrgb r = 80 g = 80 b = 116
            case 7
            <id> ::obj_setcolorrgb r = 80 g = 105 b = 112
        endswitch
    endif
    RunScriptOnObject {
        id = <id>
        ScavengerHunt_InitObject
        params = { id = <id> }
    }
    if GotParam show_now
        RunScriptOnObject {
            id = <id>
            ScavengerHunt_ShowObject
            params = { id = <id> }
        }
    endif
endscript

script ClientDropSHObject 
    GetSkaterPosition
    GetCurrentSkaterId
    new_y = (<y> + 24)
    <y> = <new_y>
    new_pos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
    PlaceObject Pos = <new_pos>
    ReportObjectPlacement ObjID = <ObjID> Pos = <new_pos>
    if InNetGame
        DropSHObject Pos = <new_pos> ObjID = <intid> index = <index> show_now
    else
        DropSHObject Pos = <new_pos> ObjID = <intid> index = <index>
    endif
    if NOT GameModeEquals is_scavenger_hunt
        kill_panel_messages
        if NOT PlacedLessThan 5
            change #"0x36b59867" = (#"0x36b59867" + 1)
            FormatText textname = #"0xa9f040f8" 'Placed Coins: %c/5' c = #"0x36b59867"
            create_panel_message text = <#"0xa9f040f8"> rgba = [ 50 150 50 128 ] Pos = (470.0, 340.0) style = perfect_style
        else
            unbind_scavenger_tricks
            change #"0x46d151d3" = 0
            create_console_message text = '\c2Scavenger Mode is off cause you reached the limit of coins.'
            create_panel_message text = '\c2Limit reached 5/5' rgba = [ 50 150 50 128 ] Pos = (470.0, 340.0) style = perfect_style
        endif
    endif
    if GameModeEquals is_scavenger_hunt
        if NOT PlacedLessThan 5
            if ObjectExists id = mp_goal_text
                DestroyScreenElement id = mp_goal_text
            endif
            FormatText textname = msg_text '\c2Scavenger:\c0\nWaiting for other players!'
            if InSplitScreenGame
                ScriptGetScreenMode
                if (<screen_mode> = split_vertical)
                    msg_pos = (400.0, 44.0)
                else
                    msg_pos = (640.0, 204.0)
                endif
            endif
            create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle
            if InSplitScreenGame
                GetCurrentSkaterId
                if (<intid> = 0)
                    unbind_scavenger_tricks
                else
                    unbind_scavenger_tricks_player_2
                endif
            else
                unbind_scavenger_tricks
            endif
        endif
    endif
endscript
sh_object_composite_structure = [
    { Component = motion }
    { Component = Model }
    { Component = objectproximity }
]

script bind_scavenger_tricks 
    skater ::removetags \{[ old_scavengerf_catnum old_scavengerf_checksum ]}
    GetTrickFromKeyCombo \{ key_combo = Air_SquareU }
    if GotParam \{ cat_num }
        skater ::settags old_scavengerf_catnum = <cat_num>
    else
        skater ::settags old_scavengerf_checksum = <trick_checksum>
    endif
    BindTrickToKeyCombo \{ key_combo = Air_SquareU Trick = ScavengerF update_mappings = 1 }
    UpdateTrickMappings \{ skater = 0 }
endscript

script bind_scavenger_tricks_player_2 
    SetCurrentSkaterProfile \{ 1 }
    skater2 ::removetags \{[ old_scavengerf_catnum old_scavengerf_checksum ]}
    GetTrickFromKeyCombo \{ key_combo = Air_SquareU }
    if GotParam \{ cat_num }
        skater2 ::settags old_scavengerf_catnum = <cat_num>
    else
        skater2 ::settags old_scavengerf_checksum = <trick_checksum>
    endif
    BindTrickToKeyCombo \{ key_combo = Air_SquareU Trick = ScavengerF update_mappings = 1 }
    UpdateTrickMappings \{ skater = 1 }
    SetCurrentSkaterProfile \{ 0 }
endscript

script unbind_scavenger_tricks 
    skater ::gettags
    if GotParam \{ old_scavengerf_checksum }
        BindTrickToKeyCombo {
            key_combo = Air_SquareU
            Trick = <old_scavengerf_checksum>
            update_mappings = 1
        }
    else
        if GotParam \{ old_scavengerf_catnum }
            BindTrickToKeyCombo {
                key_combo = Air_SquareU
                Trick = <old_scavengerf_catnum>
                update_mappings = 1
            }
        endif
    endif
    UpdateTrickMappings \{ skater = 0 }
    skater ::removetags \{[ old_scavengerf_catnum old_scavengerf_checksum ]}
endscript

script unbind_scavenger_tricks_player_2 
    SetCurrentSkaterProfile \{ 1 }
    skater2 ::gettags
    if GotParam \{ old_scavengerf_checksum }
        BindTrickToKeyCombo {
            key_combo = Air_SquareU
            Trick = <old_scavengerf_checksum>
            update_mappings = 1
        }
    else
        if GotParam \{ old_scavengerf_catnum }
            BindTrickToKeyCombo {
                key_combo = Air_SquareU
                Trick = <old_scavengerf_catnum>
                update_mappings = 1
            }
        endif
    endif
    UpdateTrickMappings \{ skater = 1 }
    skater2 ::removetags \{[ old_scavengerf_catnum old_scavengerf_checksum ]}
    SetCurrentSkaterProfile \{ 0 }
endscript

script show_all_objects 
    ObjID = 0
    begin 
    index = 0
    begin 
    FormatText checksumname = name 'sh_object_%i_%j' i = <ObjID> j = <index>
    if ObjectExists id = <name>
        RunScriptOnObject {
            id = <name>
            ScavengerHunt_ShowObject
            params = { id = <name> }
        }
        RunScriptOnObject {
            id = <name>
            ScavengerHunt_InitObjectExceptions
            params = { id = <name> }
        }
    endif
    index = (<index> + 1)
    if (<index> = 5)
        break 
    endif
    repeat 
    ObjID = (<ObjID> + 1)
    if (<ObjID> = 8)
        break 
    endif
    repeat 
endscript
