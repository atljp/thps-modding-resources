Goal_SkateTheLine_GenericParams = {
    goal_text = 'Skate die Line'
    view_goals_text = 'Generic skate the line text'
    time = 120
    init = goal_skate_the_line_init
    uninit = goal_uninit
    activate = goal_skate_the_line_activate
    deactivate = goal_skate_the_line_deactivate
    expire = goal_skate_the_line_expire
    fail = goal_skate_the_line_fail
    success = goal_skate_the_line_success
    restart_node = TRG_G_SKATETHELINE_RestartNode
    trigger_obj_id = TRG_G_SKATETHELINE_Pro
    record_type = Score
    play_goal_start_sound
    SkateTheLine
}

script AddGoal_SkateTheLine 
    if GotParam version
        FormatText textname = goal_type 'SkateTheLine%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_SKATETHELINE%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_SKATETHELINE%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'SkateTheLine'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_SKATETHELINE_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_SKATETHELINE_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    GoalManager_AddGoal name = <goal_id> {
        params = {
            goal_text = 'Skate die Line'
            view_goals_text = 'Generic skate the line text'
            time = 120
            record_type = Score
            init = goal_skate_the_line_init
            uninit = goal_uninit
            activate = goal_skate_the_line_activate
            deactivate = goal_skate_the_line_deactivate
            expire = goal_skate_the_line_expire
            fail = goal_skate_the_line_fail
            success = goal_skate_the_line_success
            <...> 
            play_goal_start_sound
            SkateTheLine
            goal_type_checksum = SkateTheLine
        }
    }
endscript

script goal_skate_the_line_init 
    printf \{ 'goal_skate_the_line_init' }
    if NOT GotParam \{ goal_objects }
        script_assert 'goal_objects array not defined for %s' s = <goal_id>
    endif
    goal_init <...> 
endscript

script goal_skate_the_line_activate 
    printf \{ 'goal_skate_the_line_activate' }
    if GotParam \{ no_cam_anim }
        goal_passive_start goal_id = <goal_id>
    else
        goal_start goal_id = <goal_id>
    endif
    SpawnScriptLater goal_skate_the_line_blink_first params = { <...>  }
endscript

script goal_skate_the_line_deactivate 
    printf \{ 'goal_skate_the_line_deactivate' }
    goal_deactivate <...> 
    goal_skate_the_line_colors_stop <...> stop_all
    if ScreenElementExists \{ id = skate_the_line_message }
        DestroyScreenElement \{ id = skate_the_line_message }
    endif
endscript

script goal_skate_the_line_expire 
    printf \{ 'goal_skate_the_line_expire' }
    goal_expire <...> 
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_skate_the_line_fail 
    printf \{ 'goal_skate_the_line_fail' }
    goal_fail <...> 
endscript

script goal_skate_the_line_success 
    printf \{ 'goal_skate_the_line_success' }
    goal_success <...> 
endscript

script goal_skate_the_line_next_cluster 
    if NOT GotParam \{ keep_last }
        goal_skate_the_line_colors_stop <...> 
        if GotParam \{ text }
            if ScreenElementExists \{ id = current_goal }
                DestroyScreenElement \{ id = current_goal }
            endif
            create_panel_block id = skate_the_line_message text = <text> style = panel_message_goal
        endif
    endif
    goal_skate_the_line_spawn_blinking <...> 
    if GotParam \{ first_spot_params }
        goal_skate_the_line_spawn_blinking <...> <first_spot_params> goal_objects_index = 0
    endif
endscript

script goal_skate_the_line_spawn_blinking 
    if GotParam trick_objects
        GetArraySize <trick_objects>
        <index> = 0
        begin 
        FormatText {
            checksumname = colors_script_id
            '%s_goal_skate_the_line_colors_%i.%d'
            s = <goal_name>
            i = <goal_objects_index>
            d = <index>
        }
        <script_params> = (<trick_objects> [ <index> ])
        SpawnScriptLater {
            goal_skate_the_line_colors
            id = <colors_script_id>
            params = <script_params>
        }
        <index> = (<index> + 1)
        repeat <array_size>
    else
        if NOT ((GotParam name)|| (GotParam prefix))
            return 
        endif
        FormatText checksumname = colors_script_id '%s_goal_skate_the_line_colors' s = <goal_name>
        SpawnScriptLater {
            goal_skate_the_line_colors
            id = <colors_script_id>
            params = <script_params>
        }
    endif
endscript

script goal_skate_the_line_colors_stop 
    GetArraySize <goal_objects>
    <goal_objects_array_size> = <array_size>
    <goal_objects_index> = 0
    begin 
    <goal_object> = (<goal_objects> [ <goal_objects_index> ])
    if StructureContains structure = <goal_object> trick_objects
        <trick_objects> = (<goal_object>.trick_objects)
        GetArraySize <trick_objects>
        <index> = 0
        <should_stop> = 0
        if GotParam stop_all
            <should_stop> = 1
        else
            <num_flags_set> = 0
            GoalManager_GetGoalParams name = <goal_id>
            if NOT (<goal_objects_index> = (<num_flags_set> - 1))
                <should_stop> = 1
            endif
        endif
        if (<should_stop> = 1)
            begin 
            FormatText {
                checksumname = colors_script_id
                '%s_goal_skate_the_line_colors_%i.%d'
                s = <goal_name>
                i = <goal_objects_index>
                d = <index>
            }
            KillSpawnedScript id = <colors_script_id>
            <script_params> = (<trick_objects> [ <index> ])
            SetLightGroup <script_params>
            SetObjectColor_CurrentTOD <script_params>
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    else
        <should_stop> = 0
        if GotParam stop_all
            <should_stop> = 1
        else
            <num_flags_set> = 0
            GoalManager_GetGoalParams name = <goal_id>
            if NOT (<goal_objects_index> = (<num_flags_set> - 1))
                <should_stop> = 1
            endif
        endif
        if (<should_stop> = 1)
            FormatText checksumname = colors_script_id '%s_goal_skate_the_line_colors' s = <goal_name>
            KillSpawnedScript id = <colors_script_id>
            SetLightGroup <goal_object>
            SetObjectColor_CurrentTOD <goal_object>
        endif
    endif
    <goal_objects_index> = (<goal_objects_index> + 1)
    repeat <goal_objects_array_size>
endscript

script goal_skate_the_line_colors 
    SetLightGroup <...> light_group = goal_skate_the_line_colors
    begin 
    setobjectcolor color = (255 + (255 * 256)+ (120 * 65536))<...> 
    wait \{ 0.5000 seconds }
    setobjectcolor color = (254 + (163 * 256)+ (90 * 65536))<...> 
    wait \{ 0.5000 seconds }
    repeat 
endscript

script goal_skate_the_line_intro_blink 
    GoalManager_GetGoalParams name = <goal_id>
    goal_skate_the_line_colors_stop <...> stop_all
    goal_skate_the_line_spawn_blinking {
        trick_objects = (<goal_objects> [ <object_index> ].trick_objects)
        goal_objects_index = <object_index>
        goal_name = <goal_name>
    }
endscript

script goal_skate_the_line_blink_first 
    if GotParam \{ intro_scene }
        if NOT GotParam \{ quick_start }
            Block \{ type = goal_cam_anim_post_start_done }
        endif
    endif
    goal_skate_the_line_colors_stop <...> stop_all
    goal_skate_the_line_spawn_blinking {
        trick_objects = (<goal_objects> [ 0 ].trick_objects)
        goal_objects_index = 0
        goal_name = <goal_name>
    }
endscript

script goal_skate_the_line_got 
    if GoalManager_GoalIsActive name = <goal_id>
        if NOT GoalManager_GoalFlagSet name = <goal_id> flag = <flag>
            GoalManager_SetGoalFlag name = <goal_id> <flag> 1
        endif
    endif
endscript
