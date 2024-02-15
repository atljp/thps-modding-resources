Goal_Race_GenericParams = {
    Race
    goal_type_checksum = Race
    goal_text = 'generic race text'
    view_goals_text = 'Rennziel'
    time = 120
    init = goal_race_init
    uninit = goal_uninit
    activate = goal_race_activate
    deactivate = goal_race_deactivate
    expire = goal_race_expire
    success = goal_race_success
    fail = goal_race_fail
    trigger_obj_id = TRG_G_RACE_Pro
    start_pad_id = G_RACE_StartPad
    restart_node = TRG_G_RACE_RestartNode
    goal_flags = [ got_1 got_2 got_3 got_4 ]
    race_waypoints = [
        { id = TRG_G_RACE_RaceNav01 flag = got_1 }
        { id = TRG_G_RACE_RaceNav02 flag = got_2 }
        { id = TRG_G_RACE_RaceNav03 flag = got_3 }
        { id = TRG_G_RACE_RaceNav04 flag = got_4 }
    ]
    race_total_laps = 1
    record_type = Score
}

script goal_race_init 
    goal_init goal_id = <goal_id>
endscript

script goal_race_create_waypoint 
    goal_race_remove_waypoint <...> 
    if GotParam \{ id }
        Create name = <id>
        <id> ::obj_invisible
        goal_race_create_cones name = <id>
    endif
    if GotParam \{ prefix }
        Create prefix = <prefix>
        invisible prefix = <prefix>
    endif
endscript

script goal_race_remove_waypoint 
    if GotParam \{ id }
        if IsAlive name = <id>
            <id> ::Die
            goal_race_kill_cones name = <id>
        endif
    endif
endscript

script goal_race_clear_exceptions 
    if GotParam \{ id }
        <id> ::Obj_ClearExceptions
    endif
endscript

script goal_race_activate 
    goal_start goal_id = <goal_id>
    ForEachIn <race_waypoints> do = goal_race_create_waypoint
    GoalManager_NextRaceWaypoint name = <goal_id>
endscript

script goal_race_success 
    goal_success goal_id = <goal_id>
endscript

script goal_race_deactivate 
    FormatText checksumname = next_waypoint_script_id '%s_next_waypoint_script_id' s = <goal_name>
    KillSpawnedScript id = <next_waypoint_script_id>
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
    if ObjectExists \{ id = race_arrow }
        DestroyScreenElement \{ id = race_arrow }
    endif
    if ScreenElementExists \{ id = race_lap_message }
        DestroyScreenElement \{ id = race_lap_message }
    endif
    ForEachIn <race_waypoints> do = goal_race_clear_exceptions
    ForEachIn <race_waypoints> do = goal_race_remove_waypoint
endscript

script goal_race_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_race_fail 
    goal_fail goal_id = <goal_id>
endscript

script goal_race_next_waypoint 
    wait 1 gameframe
    GoalManager_GetGoalParams name = <goal_id>
    GetSkaterId
    if GotParam id
        RunScriptOnObject id = <id> goal_race_init_waypoint params = {Radius = <Radius> flag = <flag> goal_id = <goal_id> last_waypoint = <last_waypoint>}
    endif
    if ObjectExists id = race_arrow
        SetScreenElementProps {
            id = race_arrow
            nodetopointto = <id>
        }
    else
        if GotParam first_waypoint
            if NOT GotParam quick_start
                WaitForEvent type = goal_cam_anim_post_start_done
            endif
            if NOT GoalManager_GoalIsActive name = <goal_id>
                return 
            endif
        endif
        Create3dArrowPointer {
            id = race_arrow
            node = <id>
            Pos = (320.0, 70.0)
            Scale = 0.02500
            tilt = 7
        }
    endif
    if GotParam start_lap
        goal_race_lap_message goal_id = <goal_id> lap = <start_lap>
    endif
    if GotParam added_time
        goal_race_add_time_message time = <added_time>
    endif
    if GotParam scr
        SpawnScriptLater <scr> params = { <params> }
    endif
endscript

script goal_race_init_waypoint 
    Obj_ClearExceptions
    if NOT GotParam \{ Radius }
        <Radius> = 16
    endif
    obj_setinnerradius <Radius>
    Obj_SetException Ex = objectinradius scr = goal_race_got_waypoint params = {flag = <flag> goal_id = <goal_id> last_waypoint = <last_waypoint>}
endscript

script goal_race_got_waypoint 
    Obj_ClearExceptions
    GoalManager_SetGoalFlag name = <goal_id> <flag> 1
    if GotParam \{ last_waypoint }
        SpawnScriptLater spawned_safe_goal_win params = { goal_id = <goal_id> }
    else
        GoalManager_NextRaceWaypoint name = <goal_id>
    endif
endscript

script goal_race_create_cones Model = 'Mdl_Cone/mdl_cone.mdl'
    MangleChecksums a = <name> b = marker_cone1
    CreateCompositeObject {
        Components = 
        [
            { Component = motion }
            { Component = lockobj }
            {Component = Model Model = <Model>}
        ]
        params = { name = <mangled_id> }
    }
    <mangled_id> ::obj_locktoobject objectname = <name> (-60.0, 0.0, 0.0)
    MangleChecksums a = <name> b = marker_cone2
    CreateCompositeObject {
        Components = 
        [
            { Component = motion }
            { Component = lockobj }
            {Component = Model Model = <Model>}
        ]
        params = { name = <mangled_id> }
    }
    <mangled_id> ::obj_locktoobject objectname = <name> (60.0, 0.0, 0.0)
endscript

script goal_race_kill_cones 
    MangleChecksums a = <name> b = marker_cone1
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    MangleChecksums a = <name> b = marker_cone2
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
endscript

script goal_race_checkpoint_message 
    FormatText \{ textname = message 'KONTROLLPUNKT' }
    create_panel_message {
        id = race_checkpoint_message
        text = <message>
        style = goal_race_checkpoint_message_style
    }
endscript

script goal_race_checkpoint_message_style 
    setprops rgba = [ 33 112 15 128 ]
    DoMorph time = 0 Pos = (320.0, 135.0) Scale = 0 alpha = 0
    if GotParam sound
        playsound <sound> vol = 150
    endif
    DoMorph time = 0.1000 Scale = 2.500 alpha = 1
    DoMorph time = 0.1000 Scale = 1.500
    DoMorph time = 0.1000 Scale = 2.0
    DoMorph time = 0.1000 Scale = 1.400
    DoMorph Pos = (321.0, 136.0) time = 0.1000
    DoMorph Pos = (319.0, 134.0) time = 0.1000
    DoMorph time = 0.1000 Scale = 1.400
    DoMorph time = 0.1500 Scale = 0 alpha = 0
    Die
endscript

script goal_race_lap_message \{ lap = 1 }
    GoalManager_GetGoalParams name = <goal_id>
    FormatText textname = message 'RUNDE %l/%t' l = <lap> t = <race_total_laps>
    create_panel_message {
        id = race_lap_message
        text = <message>
        style = goal_race_lap_message_style
        params = { goal_id = <goal_id> }
    }
endscript

script goal_race_lap_message_style 
    setprops rgba = [ 110 110 110 128 ]
    DoMorph time = 0 Pos = (515.0, 70.0) Scale = 0 alpha = 0
    DoMorph time = 0.2000 Scale = 2.200 alpha = 1
    DoMorph time = 0.1000 Scale = 1.300
    alpha = 1
    begin 
    if (<alpha> = 1)
        alpha = 0.3000
    else
        alpha = 1
    endif
    DoMorph time = 0.5000 alpha = <alpha>
    repeat 
endscript

script goal_race_add_time_message 
    FormatText textname = message '+%t' t = <time>
    create_panel_message {
        id = race_time_message
        text = <message>
        style = goal_race_add_time_message_style
    }
endscript

script goal_race_add_time_message_style 
    setprops \{rgba = [ 112 112 112 128 ]}
    DoMorph \{ time = 0 Pos = (365.0, 33.0) Scale = 0 alpha = 0 }
    DoMorph \{ time = 0.1000 Scale = 0.9000 alpha = 1 }
    wait \{ 0.3000 seconds }
    DoMorph \{ time = 0.5000 alpha = 0 rot_angle = 15 }
    Die
endscript
