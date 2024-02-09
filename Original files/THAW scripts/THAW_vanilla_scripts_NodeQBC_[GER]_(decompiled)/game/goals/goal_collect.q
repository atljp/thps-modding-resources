Goal_Collect_GenericParams = {
    goal_text = 'Sammle x Dinge!'
    view_goals_text = 'Generic collect text'
    goal_description = 'Generic collect goal description'
    time = 120
    init = goal_collect_init
    uninit = goal_uninit
    active = goal_collect_active
    activate = goal_collect_activate
    deactivate = goal_collect_deactivate
    expire = goal_collect_expire
    fail = goal_collect_fail
    success = goal_collect_success
    restart_node = 'TRG_G_COLLECT_RestartNode'
    trigger_obj_id = 'TRG_G_COLLECT_Pro'
    goal_collect_object_init_script = set_goal_collect_exception
    goal_flags = [
        got_1
        got_2
        got_3
        got_4
        got_5
    ]
    goal_collect_objects = [
        { id = TRG_G_COLLECT_FratBoy01 scr = goal_collect_got_object flag = got_1 }
        { id = TRG_G_COLLECT_FratBoy02 scr = goal_collect_got_object flag = got_2 }
        { id = TRG_G_COLLECT_FratBoy03 scr = goal_collect_got_object flag = got_3 }
        { id = TRG_G_COLLECT_FratBoy04 scr = goal_collect_got_object flag = got_4 }
        { id = TRG_G_COLLECT_FratBoy05 scr = goal_collect_got_object flag = got_5 }
    ]
    start_pad_id = 'G_COLLECT_StartPad'
    wait_and_win_started = 0
    record_type = time
}

script AddGoal_Collect 
    if GotParam career_only
        if InNetGame
            return 
        endif
    endif
    if NOT GotParam goal_collect_objects
        script_assert 'AddGoal_Collect - Collect goal created without goal_collect_objects.'
    endif
    if GotParam version
        FormatText textname = goal_type 'Collect%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_Collect%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_Collect%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'Collect'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_Collect_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_Collect_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_Collect_GenericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_Collect_GenericParams.view_goals_text)
    endif
    if NOT GotParam goal_description
        <goal_description> = (Goal_Collect_GenericParams.goal_description)
    endif
    if NOT GotParam time
        <time> = (Goal_Collect_GenericParams.time)
    endif
    if NOT GotParam record_type
        <record_type> = (Goal_Collect_GenericParams.record_type)
    endif
    if NOT GotParam goal_collect_object_init_script
        <goal_collect_object_init_script> = (Goal_Collect_GenericParams.goal_collect_object_init_script)
    endif
    if NOT GotParam goal_flags
        <goal_flags> = (Goal_Collect_GenericParams.goal_flags)
    endif
    if NOT GotParam wait_and_win_started
        <wait_and_win_started> = (Goal_Collect_GenericParams.wait_and_win_started)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_Collect_GenericParams.init)
            uninit = (Goal_Collect_GenericParams.uninit)
            activate = (Goal_Collect_GenericParams.activate)
            active = (Goal_Collect_GenericParams.active)
            deactivate = (Goal_Collect_GenericParams.deactivate)
            expire = (Goal_Collect_GenericParams.expire)
            success = (Goal_Collect_GenericParams.success)
            fail = (Goal_Collect_GenericParams.fail)
            <...> 
        }
    }
endscript

script goal_collect_init 
    goal_init goal_id = <goal_id>
    ForEachIn {
        <goal_collect_objects>
        do = goal_collect_update_from_goal_flags
        params = { goal_id = <goal_id> }
    }
endscript

script goal_collect_update_from_goal_flags 
    if GotParam \{ flag }
        if GoalManager_GoalFlagSet name = <goal_id> flag = <flag>
            if ObjectExists id = <id>
                <id> ::obj_invisible
            endif
        else
        endif
    endif
endscript

script init_goal_collect_object 
    if GotParam \{ id }
        if ChecksumEquals a = <trigger_obj_id> b = <id>
            GoalManager_SetGoalFlag name = <goal_id> <flag> 1
        else
            <id> ::obj_visible
            RunScriptOnObject id = <id> <goal_collect_object_init_script> params = <...> 
        endif
    endif
endscript

script set_goal_collect_exception \{ goal_collect_object_inner_radius = 6 }
    Obj_ClearExceptions
    obj_setinnerradius <goal_collect_object_inner_radius>
    Obj_SetException Ex = anyobjectinradius scr = <scr> params = {goal_id = <goal_id> flag = <flag>}
endscript

script goal_collect_got_object 
    Obj_ClearExceptions
    obj_invisible
    playsound \{ GapSound_11 vol = 100 }
    GoalManager_SetGoalFlag name = <goal_id> <flag> 1
    GoalManager_GetGoalParams name = <goal_id>
    if NOT GoalManager_AllFlagsSet name = <goal_id>
        FormatText textname = collect_text '%c von %n %t' c = <num_flags_set> t = <collect_type> n = <num_flags>
        create_panel_message text = <collect_text> style = goal_collect_text
    endif
endscript

script goal_collect_text 
    setprops \{rgba = [ 128 128 128 128 ] Pos = (320.0, 115.0)}
    wait \{ 1000 }
    Die
endscript

script goal_collect_activate 
    goal_start goal_id = <goal_id>
    FormatText checksumname = script_id '%s_goal_collect_wait_and_initialize_objects' s = <goal_name>
    SpawnScriptLater goal_collect_wait_and_initialize_objects id = <script_id> params = <...> 
endscript

script goal_collect_wait_and_initialize_objects 
    if NOT GotParam quick_start
        Block {
            alltypes = [
                { type = goal_cam_anim_post_start_done }
                { type = goal_load_pak_done }
            ]
        }
        if NOT GoalManager_GoalIsActive name = <goal_id>
            return 
        endif
    endif
    GetArraySize <goal_collect_objects>
    <index> = 0
    begin 
    <array_element> = (<goal_collect_objects> [ <index> ])
    if GoalManager_GoalFlagSet name = <goal_id> flag = (<array_element>.flag)
        <object_id> = (<array_element>.id)
        <object_id> ::obj_invisible
        <object_id> ::Obj_ClearExceptions
    else
        init_goal_collect_object {
            <array_element>
            goal_id = <goal_id>
            trigger_obj_id = <trigger_obj_id>
            goal_collect_object_init_script = <goal_collect_object_init_script>
        }
        if GotParam create_collect_arrows
            goal_collect_add_arrow {
                <array_element>
                goal_name = <goal_name>
                index = <index>
            }
        endif
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    begin 
    if GetNextArrayElement <goal_collect_objects>
        goal_collect_run_init_script <element>
    else
        break 
    endif
    repeat 
endscript

script goal_collect_run_init_script 
    if GotParam \{ init_script }
        <init_script> <...> 
    endif
endscript

script goal_collect_success 
    goal_success goal_id = <goal_id>
endscript

script goal_collect_deactivate 
    FormatText checksumname = script_id '%s_goal_collect_wait_and_initialize_objects' s = <goal_name>
    KillSpawnedScript id = <script_id>
    GoalManager_EditGoal name = <goal_id> params = { wait_and_win_started = 0 }
    if GotParam \{ trigger_obj_id }
        GoalManager_ResetGoalTrigger name = <goal_id>
    endif
    goal_deactivate goal_id = <goal_id>
endscript

script goal_collect_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_collect_fail 
    goal_fail goal_id = <goal_id>
endscript

script goal_collect_add_arrow 
    if NOT IsAlive name = <id>
        return 
    endif
    if NOT GotParam arrow_height
        <arrow_height> = 100
    endif
    <arrow_pos> = ((0.0, 1.0, 0.0) * <arrow_height>)
    if NOT GotParam arrow_model
        <arrow_model> = 'goalarrow'
    endif
    FormatText checksumname = arrow_id '%g_%i_arrow' g = <goal_name> i = <index>
    if ScreenElementExists id = <arrow_id>
        DestroyScreenElement id = <arrow_id>
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        parent = root_window
        type = element3d
        id = <arrow_id>
        Model = <arrow_model>
        hoverparams = {amp = 9.500 freq = 2.500}
        angvely = 0.1600
        parentparams = {name = <id> <arrow_pos> IgnoreParentsYRotation}
    }
endscript
