
Goal_TrickObjects_GenericParams = {
    goal_text = 'Trick the objects!'
    view_goals_text = 'Generic trick the objects text'
    time = 120
    init = goal_trick_the_objects_init
    uninit = goal_uninit
    activate = goal_trick_the_objects_activate
    deactivate = goal_trick_the_objects_deactivate
    expire = goal_trick_the_objects_expire
    fail = goal_trick_the_objects_fail
    success = goal_trick_the_objects_success
    restart_node = TRG_G_TRICKOBJECTS_RestartNode
    trigger_obj_id = TRG_G_TRICKOBJECTS_Pro
    record_type = Score
    play_goal_start_sound
    TrickObjects
}

script goal_trick_the_objects_init 
    if NOT GotParam trick_object_prefix
        script_assert 'trick_object_prefix not defined for %s' s = <goal_id>
    endif
    if NOT GotParam goal_objects
        script_assert 'goal_objects array not defined for %s' s = <goal_id>
    endif
    goal_init <...> 
endscript


script goal_trick_the_objects_activate 
    if GotParam no_cam_anim
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
    ClearExceptionGroup goal_trick_the_objects
endscript


script goal_trick_the_objects_colors 
    SetLightGroup light_group = goal_trick_the_objects_colors prefix = <prefix>
    begin 
    setobjectcolor prefix = <prefix> color = (255 + (255 * 256)+ (120 * 65536))
    wait 0.5000 seconds
    setobjectcolor prefix = <prefix> color = (254 + (163 * 256)+ (90 * 65536))
    wait 0.5000 seconds
    repeat 
endscript


script goal_trick_the_objects_colors_start 
    FormatText checksumname = objects_colors_script_id '%s_goal_trick_the_objects_colors' s = <goal_name>
    SpawnScript {
        goal_trick_the_objects_colors
        id = <objects_colors_script_id>
        params = { prefix = <trick_object_prefix> }
    }
endscript


script goal_trick_the_objects_colors_stop 
    FormatText checksumname = objects_colors_script_id '%s_goal_trick_the_objects_colors' s = <goal_name>
    KillSpawnedScript id = <objects_colors_script_id>
    SetLightGroup light_group = <trick_object_light_group> prefix = <trick_object_prefix>
    SetObjectColor_CurrentTOD prefix = <trick_object_prefix>
endscript

