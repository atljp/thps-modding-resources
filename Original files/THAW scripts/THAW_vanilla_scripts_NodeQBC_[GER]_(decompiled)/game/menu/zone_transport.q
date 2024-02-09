zone_transport_colors = [
    {
        c = [ 128 128 128 128 ]
        t = 0.2000
    }
    {
        c = [ 128 128 0 128 ]
        t = 0.7000
    }
    {
        c = [ 90 90 128 128 ]
        t = 0.7000
    }
]

script bus_teleport 
    if NOT GameModeEquals is_career
        return 
    endif
    if GoalManager_GoalIsActive name = (goal_utility_last_goal_activated)
        return 
    endif
    if ((cat_pak_is_loaded)= 1)
        return 
    endif
    if NOT walking
        text = 'Skaten im Bus verboten!\n\n(Drück \mm zum Gehen)'
    else
        if currentscorepotgreaterthan 0
            text = 'Beende deine Kombo, bevor du einsteigst!'
        else
            speech_box_exit
            speech_box_exit anchor_id = goal_start_dialog
            speech_box_exit anchor_id = ped_speech_dialog
            RunTimer_pause
            SpawnSound SK7_SFX_Spawned_Bus_Idle_Loop_Limiting
            PlayIGCCam {
                LockTo = world
                Pos = (-390.29998779296875, -1082.0, -12383.2998046875)
                Quat = (0.008891000412404537, -0.6307709813117981, -0.0072280000895261765)
                FOV = 50.0
                Play_hold
            }
            skater ::Walk_UseMovieCamera
            ForceToWalk
            MakeSkaterGoto WalkIndoorState
            wait 1 gameframe
            TeleportSkaterToNode nodeName = Z_Bus_TRG_Restart_Bus walking
            hide_compass_anchor
            zone_transport_menu_build
            return 
        endif
    endif
    PauseSkaters
    create_snazzy_dialog_box {
        Title = 'Hey'
        text = <text>
        text_dims = (400.0, 0.0)
        pad_back_script = bus_teleport_cleanup
        no_bg
        buttons = [
            {text = 'OK' pad_choose_script = bus_teleport_cleanup}
        ]
    }
endscript

script bus_teleport_cleanup 
    dialog_box_exit
    UnpauseSkaters
endscript

script zone_transport_menu_build 
    if ScreenElementExists id = transport_anchor
        return 
    endif
    if GotParam truck_menu
        <truck_menu_param> = { truck_menu }
        <menu_pos> = (160.0, 250.0)
    else
        <truck_menu_param> = {}
        <menu_pos> = (260.0, 50.0)
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = transport_anchor
    }
    AssignAlias id = <id> alias = current_menu_anchor
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        local_id = bG
        texture = top_gradient
        rgba = [ 0 0 0 128 ]
        alpha = 0
        Pos = (0.0, 0.0)
        just = [ left top ]
        Scale = (100.0, 10.0)
    }
    DoScreenElementMorph id = <id> alpha = 0.4000 time = 0.3000
    CreateScreenElement {
        type = vmenu
        parent = transport_anchor
        Pos = <menu_pos>
        Scale = 1.200
        font = small
        just = [ left top ]
    }
    AssignAlias id = <id> alias = current_menu
    SetScreenElementProps {
        id = current_menu
        event_handlers = [
            {pad_back zone_transport_menu_exit params = { exit_bus <truck_menu_param> }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    ForEachIn SkateZoneParams do = zone_transport_menu_add_item params = { <truck_menu_param> }pass_index
    if NOT GotParam truck_menu
        create_helper_text {
            helper_text_elements = [
                { text = '\b7/\b4 = Wählen' }
                { text = '\m1 = Bus verlassen' }
                { text = '\m0 = OK' }
            ]
        }
    else
        create_helper_text {
            helper_text_elements = [
                { text = '\b7/\b4 = Wählen' }
                { text = '\m1 = Truck verlassen' }
                { text = '\m0 = OK' }
            ]
        }
    endif
    skater ::disableplayerinput
    DoScreenElementMorph id = helper_text_anchor alpha = 0
    DoScreenElementMorph id = helper_text_anchor alpha = 1 time = 0.3000
    FireEvent type = focus target = current_menu
endscript
bus_exit_nodes = [
    Z_HO_TRG_Restart_Bus_Exit
    Z_EL_TRG_Restart_Bus_Exit
    Z_DT_TRG_Restart_Bus_Exit
    Z_BH_TRG_Restart_Bus_Exit
    z_smbh_TRG_Restart_Bus_Exit
]

script zone_transport_menu_exit 
    printf 'zone_transport_menu_exit'
    if NOT GotParam truck_menu
        if GotParam exit_bus
            GetArraySize bus_exit_nodes
            index = 0
            begin 
            if NodeExists (bus_exit_nodes [ <index> ])
                node_name = (bus_exit_nodes [ <index> ])
                break 
            else
                if (<index> = (<array_size> -1))
                    return 
                endif
            endif
            index = (<index> + 1)
            repeat <array_size>
        endif
    endif
    if NOT ScreenElementExists id = transport_anchor
        return 
    endif
    if IsObjectScript
        obj_getid
    else
        ObjID = 0
    endif
    FireEvent type = unfocus target = current_menu
    DoScreenElementMorph id = helper_text_anchor alpha = 0 time = 0.3000
    GetScreenElementChildren id = current_menu
    GetArraySize <children>
    i = 0
    j = 0
    begin 
    if NOT ChecksumEquals a = (<children> [ <i> ])b = <ObjID>
        RunScriptOnScreenElement id = {(<children> [ <i> ])child = sliding_anchor}zone_transport_out_slide params = { index = <j> }
        j = (<j> + 1)
    endif
    DoScreenElementMorph id = {(<children> [ <i> ])child = arrow}alpha = 0 time = 0.5000
    RunScriptOnScreenElement id = {(<children> [ <i> ])child = underline}zone_transport_out_fade params = { index = <j> }
    i = (<i> + 1)
    repeat <array_size>
    DoScreenElementMorph id = { transport_anchor child = bG }alpha = 0 time = 0.3000
    skater ::input_debounce x
    skater ::enableplayerinput
    StartDelaySystemUI
    wait 1 seconds
    StopDelaySystemUI
    if ScreenElementExists id = transport_anchor
        DestroyScreenElement id = transport_anchor
    endif
    if GotParam exit_bus
        show_compass_anchor
        skater ::KillForceToWalk
        KillSkaterCamAnim all
        skater ::Walk_ExitIndoors
        if GotParam truck_menu
            ResetSkaters
            wait 1 gameframe
            BeginUnloadPak 'worlds/worldZones/z_pickup/z_pickup.pak'
            wait 2 gameframes
            EndUnloadPak 'worlds/worldZones/z_pickup/z_pickup.pak'
            skater ::switchonatomic board
        else
            StopStream Int_Bus_Loop
            StopStream Int_Bus_Loop
            skater ::TeleportSkaterToNode nodeName = <node_name> walking
            MakeSkaterGoto SkaterInit params = { walk }
        endif
    endif
endscript

script zone_transport_menu_add_item 
    if GotParam prefix
        FormatText checksumname = level_checksum 'load_z_%i' i = <prefix>
        if LevelIs <level_checksum>
            printf 'Not displaying %a, as that is the current zone' a = <prefix>
            return 
        endif
    endif
    if GotParam prefix
        if ((<prefix> = 'OI')|| (<prefix> = 'SR')|| (<prefix> = 'LV')|| (<prefix> = 'SV'))
            return 
        endif
    endif
    if GotParam name
        if GotParam bus_restart_node
            FormatText textname = dest 'z_%p' p = <prefix>
            FormatText checksumname = dest_check '%a' a = <dest>
            if NOT IsTrue All_Levels_Unlocked
                if NOT GetFlag level = <dest_check> flag = LEVEL_UNLOCKED_STORY
                    printf 'Level %a not unlocked!' a = <dest>
                    <nofocus> = not_focusable
                    <name> = '??????'
                endif
            endif
            if GotParam truck_menu
                <truck_menu> = { truck_menu }
            else
                <truck_menu> = {}
            endif
            choose_params = {
                zone_transport
                params = {dest = <dest> <truck_menu>}
            }
            focus_script = zone_transport_focus
            unfocus_script = zone_transport_unfocus
            CreateScreenElement {
                type = ContainerElement
                parent = current_menu
                dims = (100.0, 20.0)
                just = [ left top ]
                event_handlers = [
                    { focus <focus_script> }
                    { unfocus <unfocus_script> }
                    { pad_start theme_menu_pad_choose_sound }
                    { pad_choose theme_menu_pad_choose_sound }
                    { pad_choose <choose_params> }
                    { pad_start <choose_params> }
                ]
                <nofocus>
            }
            item_id = <id>
            CreateScreenElement {
                type = SpriteElement
                parent = <item_id>
                local_id = underline
                texture = white3
                rgba = [ 128 128 0 80 ]
                alpha = 0
                Pos = (-20.0, 18.0)
                just = [ left top ]
                flip_v
                Scale = (10.0, 0.009999999776482582)
            }
            CreateScreenElement {
                type = SpriteElement
                parent = <item_id>
                local_id = arrow
                texture = balancearrow_glow
                rot_angle = -90
                rgba = [ 128 128 0 128 ]
                alpha = 0
                Pos = (-9.0, 9.0)
            }
            CreateScreenElement {
                type = ContainerElement
                parent = <item_id>
                local_id = sliding_anchor
            }
            anchor_id = <id>
            if GotParam nofocus
                <text_color> = [ 70 70 70 120 ]
            else
                <text_color> = [ 128 128 128 128 ]
            endif
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id>
                local_id = text
                shadow
                shadow_rgba = UI_text_shadow_color
                shadow_offs = UI_text_shadow_offset
                font = small
                text = <name>
                rgba = <text_color>
                Scale = 1
                Pos = (0.0, 0.0)
                just = [ left top ]
            }
            GetScreenElementChildren id = current_menu
            GetArraySize children
            RunScriptOnScreenElement id = {<item_id> child = sliding_anchor}zone_transport_in_slide params = {index = (<array_size> -1)}
            RunScriptOnScreenElement id = {<item_id> child = underline}zone_transport_in_fade params = {index = (<array_size> -1)}
        endif
    endif
endscript

script zone_transport_in_slide 
    pos_on = (0.0, 0.0)
    pos_off = (<pos_on> + (200.0, 0.0))
    DoMorph alpha = 0 Pos = <pos_off>
    wait (<index> * 0.1000)seconds
    DoMorph alpha = 0.8500 Pos = <pos_on> time = 0.4000 anim = fast_out
endscript

script zone_transport_in_fade 
    DoMorph \{ alpha = 0 }
    wait (<index> * 0.1000)seconds
    DoMorph \{ alpha = 1 time = 0.4000 }
endscript

script zone_transport_out_slide 
    pos_on = (0.0, 0.0)
    pos_off = (<pos_on> + (200.0, 0.0))
    wait (<index> * 0.1000)seconds
    DoMorph alpha = 0 Pos = <pos_off> time = 0.4000 anim = fast_in
endscript

script zone_transport_out_fade 
    wait (<index> * 0.1000)seconds
    DoMorph \{ alpha = 0 time = 0.4000 }
endscript

script zone_transport_focus 
    obj_getid
    DoScreenElementMorph id = {<ObjID> child = arrow}alpha = 1 time = 0.2000
    SetScreenElementLock id = <ObjID> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <ObjID>
        texture = balancearrow_glow
        rot_angle = -90
        rgba = [ 128 128 0 128 ]
        Pos = (-9.0, 9.0)
    }
    RunScriptOnScreenElement id = <id> zone_transport_highlight
    <ObjID> ::obj_spawnscriptlater zone_transport_color_cycle
endscript

script zone_transport_highlight 
    DoMorph \{ alpha = 0.5000 }
    DoMorph \{ alpha = 0.0 Pos = (200.0, 9.0) time = 0.5000 }
    Die
endscript

script zone_transport_unfocus 
    obj_getid
    DoScreenElementMorph id = {<ObjID> child = arrow}alpha = 0 time = 0.2000
    <ObjID> ::obj_killspawnedscript name = zone_transport_color_cycle
    elem = (zone_transport_colors [ 0 ])
    DoScreenElementMorph id = {<ObjID> child = { sliding_anchor child = text }}rgba = (<elem>.c)time = (<elem>.t)
endscript

script zone_transport_color_cycle 
    obj_getid
    begin 
    elem = (zone_transport_colors [ 1 ])
    DoScreenElementMorph id = {<ObjID> child = { sliding_anchor child = text }}rgba = (<elem>.c)time = (<elem>.t)
    wait (<elem>.t)seconds
    elem = (zone_transport_colors [ 2 ])
    DoScreenElementMorph id = {<ObjID> child = { sliding_anchor child = text }}rgba = (<elem>.c)time = (<elem>.t)
    wait (<elem>.t)seconds
    repeat 
endscript

script skateranch_truck_load 
    if GotParam restore_appearance
        CareerFunc func = RestoreFromTempAppearance
        UnsetGlobalFlag flag = CAS_ALIEN_UNLOCKED
    endif
    if GotParam nodeflag
        CareerFunc func = SetLastPieceGoalIndexUnlocked params = { nodeflag = <nodeflag> }
    endif
    kill_start_key_binding
    wait 60 gameframes
    PauseSkaters
    GoalManager_HidePedFloaters
    restore_start_key_binding
    if NOT GetGlobalFlag flag = CAREER_SR_TEMP_LOCKED
        create_snazzy_dialog_box {
            Title = 'Glückwunsch!'
            text = 'Du hast ein neues Teil für die Skate-Ranch!\nZurück zur Ranch?'
            text_dims = (400.0, 0.0)
            pad_back_script = skateranch_truck_cancel
            no_bg
            buttons = [
                {text = 'Ja' pad_choose_script = skateranch_truck_go}
                {text = 'Nein' pad_choose_script = skateranch_truck_cancel}
            ]
        }
    else
        create_snazzy_dialog_box {
            Title = 'Glückwunsch!'
            text = 'Du hast ein neues Skate-Ranch-Teil!'
            text_dims = (400.0, 0.0)
            pad_back_script = skateranch_truck_cancel
            no_bg
            buttons = [
                {text = 'Cool' pad_choose_script = skateranch_truck_cancel}
            ]
        }
    endif
endscript

script Skateranch_Truck_Go_SFX_Script 
    PlayStream \{ Truck_Depart priority = StreamPriorityHighest }
endscript

script skateranch_truck_setup 
    PlayIGCCam \{LockTo = world Pos = (-43.70000076293945, -1140.4000244140625, 1211.5999755859375) Quat = (-0.05821600183844566, -0.7480980157852173, 0.06621900200843811) FOV = 72.0 Play_hold}
    MakeSkaterGoto \{SkaterInit params = { walk }}
    skater ::Walk_UseMovieCamera
    skater ::switchoffatomic \{ board }
    skater ::disableplayerinput
    skater ::obj_movetonode \{ name = Z_Pickup_TRG_SkaterPos orient }
    if skater ::Flipped
        skater ::flip
    endif
    MakeSkaterGoto \{ skateranch_truck_ai }
endscript

script skateranch_truck_go 
    dialog_box_exit
    UnpauseSkaters
    GoalManager_UnHidePedFloaters
    FlushPedsFromHeap \{ heap = GoalHeap }
    LoadPak \{ 'worlds/worldZones/z_pickup/z_pickup.pak' heap = GoalHeap }
    skateranch_truck_setup
    hide_compass_anchor
    FinishPendingZoneLoads
    wait \{ 1 seconds }
    printf \{ 'Drivin\' to the skate ranch' }
    zone_transport \{ dest = 'z_sr' truck_menu }
endscript

script skateranch_truck_ai 
    PausePhysics
    Skater_Playanim \{ anim = driving Cycle }
endscript

script skateranch_truck_cancel 
    dialog_box_exit
    UnpauseSkaters
    GoalManager_UnHidePedFloaters
endscript

script skateranch_truck_menu 
    dialog_box_exit
    UnpauseSkaters
    goal_check_goal_already_active
    if NOT walking
        text = 'Steig erst von deinem Board ab!\n\n(Drück \mm, um zum Gehen zu wechseln.)'
    else
        if currentscorepotgreaterthan 0
            text = 'Beende deine Kombo, bevor du auf den Truck aufsteigst!'
        else
            speech_box_exit
            speech_box_exit anchor_id = goal_start_dialog
            speech_box_exit anchor_id = ped_speech_dialog
            FlushPedsFromHeap heap = GoalHeap
            LoadPak 'worlds/worldZones/z_pickup/z_pickup.pak' heap = GoalHeap
            fadetoblack on alpha = 1.0 time = 0.2000
            wait 0.2000 seconds
            skateranch_truck_setup
            hide_compass_anchor
            FinishPendingZoneLoads
            wait 0.1000 seconds
            fadetoblack Off no_wait alpha = 0.0 time = 0.2000
            wait 1 seconds
            zone_transport_menu_build truck_menu
            return 
        endif
    endif
    PauseSkaters
    create_snazzy_dialog_box {
        Title = 'Hey'
        text = <text>
        text_dims = (400.0, 0.0)
        pad_back_script = bus_teleport_cleanup
        no_bg
        buttons = [
            {text = 'OK' pad_choose_script = bus_teleport_cleanup}
        ]
    }
endscript
