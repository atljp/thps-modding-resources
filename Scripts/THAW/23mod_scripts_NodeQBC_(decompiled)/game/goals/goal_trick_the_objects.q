Goal_TrickObjects_GenericParams = {
    goal_text = 'Wykonuj triki na obiektach!'
    view_goals_text = 'Standardowy tekst trybu \'trikuj na obiektach\''
    time = 120
    init = goal_trick_the_objects_init
    uninit = goal_uninit
    activate = goal_trick_the_objects_activate
    deactivate = goal_trick_the_objects_deactivate
    expire = goal_trick_the_objects_expire
    fail = goal_trick_the_objects_fail
    success = goal_trick_the_objects_success
    restart_node = 'TRG_G_TRICKTHEOBJECTS_RestartNode'
    trigger_obj_id = 'TRG_G_TRICKTHEOBJECTS_Pro'
    record_type = Score
    play_goal_start_sound
    TrickObjects
    goal_type_checksum = TrickObjects
}

script AddGoal_TrickTheObjects 
    if GotParam version
        FormatText textname = goal_type 'TRICKTHEOBJECTS%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_TRICKTHEOBJECTS%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_TRICKTHEOBJECTS%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'TRICKTHEOBJECTS'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_TRICKTHEOBJECTS_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_TRICKTHEOBJECTS_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    GoalManager_AddGoal name = <goal_id> {
        params = {
            goal_text = 'Wykonuj triki na obiektach!'
            view_goals_text = 'Standardowy tekst trybu \'trikuj na obiektach\''
            time = 120
            record_type = Score
            init = goal_trick_the_objects_init
            uninit = goal_uninit
            activate = goal_trick_the_objects_activate
            deactivate = goal_trick_the_objects_deactivate
            expire = goal_trick_the_objects_expire
            fail = goal_trick_the_objects_fail
            success = goal_trick_the_objects_success
            <...> 
            play_goal_start_sound
            TrickObjects
            goal_type_checksum = TrickObjects
        }
    }
endscript

script goal_trick_the_objects_init 
    if NOT GotParam trick_object_prefix
        if NOT GotParam trick_object_name
            script_assert 'nie zdefiniowano trick_object_prefix lub trick_object_name dla %s' s = <goal_id>
        endif
    endif
    if NOT GotParam goal_objects
        script_assert 'tabela goal_objects niezdefiniowana dla %s' s = <goal_id>
    endif
    <stop_each_object_flashing> = 0
    if GotParam trick_object_prefix
        if IsArray trick_object_prefix
            <stop_each_object_flashing> = 1
        endif
    endif
    if GotParam trick_object_name
        if IsArray trick_object_name
            <stop_each_object_flashing> = 1
        endif
    endif
    GoalManager_EditGoal name = <goal_id> params = { stop_each_object_flashing = <stop_each_object_flashing> }
    goal_init <...> 
endscript

script goal_trick_the_objects_activate 
    if GotParam \{ no_cam_anim }
        goal_passive_start goal_id = <goal_id>
    else
        goal_start goal_id = <goal_id>
    endif
    goal_trick_the_objects_colors_start <...> 
endscript

script goal_trick_the_objects_deactivate 
    goal_trick_the_objects_colors_stop <...> 
    goal_deactivate <...> 
endscript

script goal_trick_the_objects_expire 
    goal_expire <...> 
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_trick_the_objects_fail 
    goal_fail <...> 
endscript

script goal_trick_the_objects_success 
    goal_success <...> 
endscript

script goal_trick_the_objects_start_combo 
    SetException {
        Ex = SkaterExitCombo
        scr = goal_trick_the_objects_combo_end
        params = { goal_id = <goal_id> }
        group = goal_trick_the_objects
    }
endscript

script goal_trick_the_objects_combo_end 
    GoalManager_LoseGoal name = <goal_id>
    ClearExceptionGroup \{ goal_trick_the_objects }
endscript

script goal_trick_the_objects_colors 
    goal_trick_the_objects_set_light_group prefix = <prefix> name = <name>
    begin 
    goal_trick_the_objects_set_object_color prefix = <prefix> name = <name> color = (255 + (255 * 256)+ (120 * 65536))
    wait \{ 0.5000 seconds }
    goal_trick_the_objects_set_object_color prefix = <prefix> name = <name> color = (254 + (163 * 256)+ (90 * 65536))
    wait \{ 0.5000 seconds }
    repeat 
endscript

script goal_trick_the_objects_colors_start 
    FormatText checksumname = objects_colors_script_id '%s_goal_trick_the_objects_colors' s = <goal_name>
    SpawnScriptLater {
        goal_trick_the_objects_colors
        id = <objects_colors_script_id>
        params = {prefix = <trick_object_prefix> name = <trick_object_name>}
    }
endscript

script goal_trick_the_objects_colors_stop 
    FormatText checksumname = objects_colors_script_id '%s_goal_trick_the_objects_colors' s = <goal_name>
    KillSpawnedScript id = <objects_colors_script_id>
    goal_trick_the_objects_set_light_group light_group = <trick_object_light_group> prefix = <trick_object_prefix> name = <trick_object_name>
    goal_trick_the_objects_reset_object_color prefix = <trick_object_prefix> name = <trick_object_name>
endscript

script goal_trick_the_objects_set_light_group light_group = goal_trick_the_objects_colors
    if GotParam prefix
        if IsArray <prefix>
            GetArraySize <prefix>
            <index> = 0
            begin 
            SetLightGroup light_group = <light_group> prefix = (<prefix> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        else
            SetLightGroup light_group = <light_group> prefix = <prefix>
        endif
    else
        if GotParam name
            if IsArray <name>
                GetArraySize <name>
                <index> = 0
                begin 
                SetLightGroup light_group = <light_group> name = (<name> [ <index> ])
                <index> = (<index> + 1)
                repeat <array_size>
            else
                SetLightGroup light_group = <light_group> name = <name>
            endif
        endif
    endif
endscript

script goal_trick_the_objects_set_object_color 
    if GotParam prefix
        if IsArray <prefix>
            GetArraySize <prefix>
            <index> = 0
            begin 
            setobjectcolor prefix = (<prefix> [ <index> ])color = <color> noprefixwarning
            <index> = (<index> + 1)
            repeat <array_size>
        else
            setobjectcolor prefix = <prefix> color = <color> noprefixwarning
        endif
    else
        if GotParam name
            if IsArray <name>
                GetArraySize <name>
                <index> = 0
                begin 
                setobjectcolor name = (<name> [ <index> ])color = <color> noprefixwarning
                <index> = (<index> + 1)
                repeat <array_size>
            else
                setobjectcolor name = <name> color = <color> noprefixwarning
            endif
        endif
    endif
endscript

script goal_trick_the_objects_reset_object_color 
    if GotParam prefix
        if IsArray <prefix>
            GetArraySize <prefix>
            <index> = 0
            begin 
            SetObjectColor_CurrentTOD prefix = (<prefix> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        else
            SetObjectColor_CurrentTOD prefix = <prefix>
        endif
    else
        if GotParam name
            if IsArray <name>
                GetArraySize <name>
                <index> = 0
                begin 
                SetObjectColor_CurrentTOD name = (<name> [ <index> ])
                <index> = (<index> + 1)
                repeat <array_size>
            else
                SetObjectColor_CurrentTOD name = <name>
            endif
        endif
    endif
endscript
